# Google Drive Examples

Annotated examples written in Ruby.

Checked (✅︎) topics are completed. Topics without a check still need to be added.

* [Google Drive Examples](#google-drive-examples)
  * [Getting started](#getting-started)
    * [✅︎ Creating a Google API service account](#︎-creating-a-google-api-service-account)
    * [✅︎ Creating a DriveService instance](#︎-creating-a-driveservice-instance)
    * [✅︎ Batching DriveService requests](#︎-batching-driveservice-requests)
  * [Files and folders](#files-and-folders)
    * [✅︎ Search for files](#︎-search-for-files)
    * [✅︎ Get file](#︎-get-file)
    * [✅︎ Create a file](#︎-create-a-file)
    * [✅︎ Upload file data](#︎-upload-file-data)
    * [✅︎ Download file data](#︎-download-file-data)
    * [✅︎ Export file](#︎-export-file)
    * [✅︎ Send file to trash](#︎-send-file-to-trash)
    * [✅︎ Recover file from trash](#︎-recover-file-from-trash)
    * [✅︎ Delete a file](#︎-delete-a-file)
  * [Share files, folders, and drives](#share-files-folders-and-drives)
    * [✅︎ Create permission](#︎-create-permission)
    * [✅︎ List permissions](#︎-list-permissions)
    * [✅︎ Update permission](#︎-update-permission)
    * [✅︎ Delete permission](#︎-delete-permission)
  * [Shortcuts](#shortcuts)
    * [Create a shortcut to a file](#create-a-shortcut-to-a-file)
    * [Search for shortcuts](#search-for-shortcuts)
  * [Other](#other)
    * [File revisions](#file-revisions)
    * [Store application-specific data](#store-application-specific-data)
    * [Manage file metadata](#manage-file-metadata)
    * [Manage comments and replies](#manage-comments-and-replies)
    * [Add custom file properties](#add-custom-file-properties)
    * [Create a shortcut to a Drive file](#create-a-shortcut-to-a-drive-file)
    * [Create a shortcut to app content](#create-a-shortcut-to-app-content)
    * [Protect file content from modification](#protect-file-content-from-modification)
    * [Access link-shared files using resource keys](#access-link-shared-files-using-resource-keys)
  * [Handle changes](#handle-changes)
    * [Identify which change log to track](#identify-which-change-log-to-track)
    * [Track changes for users and shared drives](#track-changes-for-users-and-shared-drives)
    * [Retrieve changes](#retrieve-changes)
    * [Receive notifications for resource changes](#receive-notifications-for-resource-changes)
  * [Manage labels](#manage-labels)
    * [Manage labels](#manage-labels-1)
    * [Set label field](#set-label-field)
    * [Unset label field](#unset-label-field)
    * [Remove label](#remove-label)
    * [List labels from file](#list-labels-from-file)
    * [Return specific labels from a file](#return-specific-labels-from-a-file)
    * [Search by label or field](#search-by-label-or-field)

## Getting started

### ✅︎ Creating a Google API service account

See the [Getting started](https://github.com/main-branch/drive_v3#getting-started)
section in the project README.md

### ✅︎ Creating a DriveService instance

See [Obtaining an authenticated DriveService](https://github.com/main-branch/drive_v3#obtaining-an-authenticated-driveservice)
section in the project README.md

### ✅︎ Batching DriveService requests

Each HTTP connection that your client makes results in a certain amount of overhead.
The Google Drive API supports batching, to allow your client to put several API
calls into a single HTTP request.

See [examples/drive_service_batch](https://github.com/main-branch/drive_v3/blob/main/examples/drive_service_batch)
for an example of how to batch Drive API.

You're limited to 100 calls in a single batch request. If you need to make more
calls than that, use multiple batch requests.

## Files and folders

Google Drive organizes files in collections, describes files by types, and provides
specific attributes for each file to facilitate file manipulation.

The Google Drive API represents files stored on Drive as a File resource.

See [File & folders overview](https://developers.google.com/drive/api/guides/about-files)
in the Google Drive API documentation for more information.

Folders are treated as a type of file. For more details about folders, see
[File types](https://developers.google.com/drive/api/guides/about-files#types).

### ✅︎ Search for files

[examples/file_search](https://github.com/main-branch/drive_v3/blob/main/examples/file_search)
shows how to list all the files for the authenticated user.

This example illustrates how to:
1. Use a search query to filter results with specific examples for:
   * Omitting files that are in the trash
   * Only returning files in a specific folder
2. Specify which data to return about each file
3. How to retrieve the name of the containing folder for each file
4. How to retrieve pagenated results

### ✅︎ Get file

[examples/file_get](https://github.com/main-branch/drive_v3/blob/main/examples/file_get)
shows how to get a
[File](https://github.com/googleapis/google-api-ruby-client/blob/main/generated/google-apis-drive_v3/lib/google/apis/drive_v3/classes.rb)
from the drive and controlling which fields are returned.

### ✅︎ Create a file

Using the `drive_service.create_file` with no parameters creates an empty data file
with the following attributes:
* `kind` is set to "drive.file",
* `id` is set to a unique id
* `name` is set to "Untitled"
* `mime_type` of application/octet-stream.

The `mime_type` parameter defines the type of file to create or to create a folder.
See [Google Workspace & Google Drive supported MIME types](https://developers.google.com/drive/api/guides/mime-types)
for a list of supported MIME types.

Google Apps files (document, spreadsheet, or presentation) may be created by specifying
their specific `mime-type`:
* **Google Docs**: application/vnd.google-apps.document
* **Google Sheets**: application/vnd.google-apps.spreadsheet
* **Google Slides**: application/vnd.google-apps.presentation
* See [Google Workspace & Google Drive supported MIME types](https://developers.google.com/drive/api/guides/mime-types)
  for a complete list.

See [Create and populate folders](https://developers.google.com/drive/api/guides/folder#create-folder)
for more about creating a folder. A folder is a file with a `mime_type` of
"application/vnd.google-apps.folder".

Use the `:parents` parameter to give the id of the folder that should contain the
file. Omitting this parameter or passing an empty array will place the new file
in the user's `My Drive` root folder.

[examples/file_create](https://github.com/main-branch/drive_v3/blob/main/examples/file_create)
shows how to create a file specifying name, mime-type, parent, and initial data.

### ✅︎ Upload file data

Use `drive_service.update_file` to upload file content.

The Drive API does not allow for partial modifications or appending data directly on
the server. To achieve this, the entire file must first be downloaded from the
server. After downloading, any alterations or additions are made locally.
Once these modifications are complete, the updated file must be uploaded in its
entirety back to the server, effectively replacing the original file.

This approach ensures data integrity, but it might not be bandwidth-efficient,
especially for large files.

[examples/file_upload_content](https://github.com/main-branch/drive_v3/blob/main/examples/file_upload_content)
shows how to overwrite a file's content.

### ✅︎ Download file data

Use `drive_service.get_file` to download file content.

[examples/file_download_content](https://github.com/main-branch/drive_v3/blob/main/examples/file_download_content)
shows how to download a file's content.

### ✅︎ Export file

To export Google Workspace document, use the `files.export` method with
the ID of the file to export and the correct MIME type. Exported content is limited
to 10 MB.

See [Export MIME types for Google Workspace documents](https://developers.google.com/drive/api/guides/ref-export-formats)
for a list of possible MIME types for each document type.

See [examples/file_export_spreasheet](https://github.com/main-branch/drive_v3/blob/main/examples/file_export_spreadsheet)
for an example of how to export a spreadsheet to a PDF.

### ✅︎ Send file to trash

To send a file to the trash, use `drive_service.update_file` to set the `trashed`
file attribute to `true`.

[examples/file_send_to_trash](https://github.com/main-branch/drive_v3/blob/main/examples/file_send_to_trash)
shows how to send a file to the trash.

### ✅︎ Recover file from trash

To recover a file from the trash, use `drive_service.update_file` to set the `trashed`
file attribute to `false`.

[examples/file_recover_from_trash](https://github.com/main-branch/drive_v3/blob/main/examples/file_recover_from_trash)
shows how to recover a file from the trash.

### ✅︎ Delete a file

Use `drive_service.delete_file` to delete a file without sending it to the trash.

[examples/file_delete](https://github.com/main-branch/drive_v3/blob/main/examples/file_delete)
shows how to delete a file.

## Share files, folders, and drives

Every Google Drive file, folder, and shared drive have associated
[permission](https://developers.google.com/drive/api/v3/reference/permissions)
resources. Each resource identifies the permission for a specific `type` (user, group,
domain, anyone) and `role`, such as "commenter" or "reader." For example, a file might
have a permission granting a specific user (`type=user`) read-only access (`role=reader`)
while another permission grants members of a specific group (`type=group`) the ability
to add comments to a file (`role=commenter`).

For a complete list of roles and the operations permitted by each, refer to
[Roles & permissions-(https://developers.google.com/drive/api/guides/ref-roles).

### ✅︎ Create permission

Use `drive_service.create_permission` to create a permission on a file.

[examples/permission_create](https://github.com/main-branch/drive_v3/blob/main/examples/permission_create)
shows how to create a permission for a file.

### ✅︎ List permissions

Use `drive_service.list_permissions` to list the permissions on a file.

[examples/permission_list](https://github.com/main-branch/drive_v3/blob/main/examples/permission_list)
shows how to list the permissions for a file.

### ✅︎ Update permission

Use `drive_service.update_permission` to list the permissions on a file.

[examples/permission_update](https://github.com/main-branch/drive_v3/blob/main/examples/permission_update)
shows how to update a permissions for a file.

### ✅︎ Delete permission

Use `drive_service.delete_permission` to delete a permission for a file.

[examples/permission_delete](https://github.com/main-branch/drive_v3/blob/main/examples/permission_delete)
shows how to delete a permissions for a file.

## Shortcuts

https://developers.google.com/drive/api/guides/shortcuts

### Create a shortcut to a file

### Search for shortcuts

## Other

### File revisions

### Store application-specific data

### Manage file metadata

### Manage comments and replies

### Add custom file properties

### Create a shortcut to a Drive file

### Create a shortcut to app content

### Protect file content from modification

### Access link-shared files using resource keys

## Handle changes

### Identify which change log to track

### Track changes for users and shared drives

### Retrieve changes

### Receive notifications for resource changes

## Manage labels

### Manage labels

### Set label field

### Unset label field

### Remove label

### List labels from file

### Return specific labels from a file

### Search by label or field
