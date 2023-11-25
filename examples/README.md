# Google Drive Examples

* [Manage files and folders](#manage-files-and-folders)
  * [\[X\] Creating a Google API service account](#x-creating-a-google-api-service-account)
  * [\[X\] Create a DriveService instance](#x-create-a-driveservice-instance)
  * [\[X\] List files](#x-list-files)
  * [\[X\] Update permissions](#x-update-permissions)
  * [\[X\] Batching requests](#x-batching-requests)
  * [\[ \] Create an empty data file](#--create-an-empty-data-file)
  * [\[ \] Create a spreadsheet, document, or presentation](#--create-a-spreadsheet-document-or-presentation)
  * [\[ \] Upload file data](#--upload-file-data)
  * [\[ \] Download and export files](#--download-and-export-files)
  * [\[ \] File revisions](#--file-revisions)
  * [\[ \] Create and populate folders](#--create-and-populate-folders)
  * [\[ \] Trash or delete files or folders](#--trash-or-delete-files-or-folders)
  * [\[ \] Search for files or folders](#--search-for-files-or-folders)
  * [\[ \] Return specific fields for a file](#--return-specific-fields-for-a-file)
  * [\[ \] Share files, folders, and drives](#--share-files-folders-and-drives)
  * [\[ \] Store application-specific data](#--store-application-specific-data)
  * [\[ \] Manage file metadata](#--manage-file-metadata)
  * [\[ \] Manage comments and replies](#--manage-comments-and-replies)
  * [\[ \] Add custom file properties](#--add-custom-file-properties)
  * [\[ \] Create a shortcut to a Drive file](#--create-a-shortcut-to-a-drive-file)
  * [\[ \] Create a shortcut to app content](#--create-a-shortcut-to-app-content)
  * [\[ \] Protect file content from modification](#--protect-file-content-from-modification)
  * [\[ \] Access link-shared files using resource keys](#--access-link-shared-files-using-resource-keys)
* [Handle changes](#handle-changes)
  * [\[ \] Identify which change log to track](#--identify-which-change-log-to-track)
  * [\[ \] Track changes for users and shared drives](#--track-changes-for-users-and-shared-drives)
  * [\[ \] Retrieve changes](#--retrieve-changes)
  * [\[ \] Receive notifications for resource changes](#--receive-notifications-for-resource-changes)
* [Manage labels](#manage-labels)
  * [\[ \] Manage labels](#--manage-labels)
  * [\[ \] Set label field](#--set-label-field)
  * [\[ \] Unset label field](#--unset-label-field)
  * [\[ \] Remove label](#--remove-label)
  * [\[ \] List labels from file](#--list-labels-from-file)
  * [\[ \] Return specific labels from a file](#--return-specific-labels-from-a-file)
  * [\[ \] Search by label or field](#--search-by-label-or-field)

## Manage files and folders

### [X] Creating a Google API service account

See the [Getting started](https://github.com/main-branch/drive_v3#getting-started)
section in the project README.md

### [X] Create a DriveService instance

See [Obtaining an authenticated DriveService](https://github.com/main-branch/drive_v3#obtaining-an-authenticated-driveservice)

section in the project README.md

### [X] List files

[examples/list_examples](https://github.com/main-branch/drive_v3/blob/main/examples/list_files):
List all the files for the authenticated user.

Illustrates how to (1) specify a search query (to omit deleted files), (2) specify
which data to return about each file, (3) how to retrieve the name of the containing
folder for each file, and (4) how to retrieve pagenated results.

### [X] Update permissions

[examples/update_permissions](https://github.com/main-branch/drive_v3/blob/main/examples/update_permissions)

### [X] Batching requests

[examples/drive_service_batch](https://github.com/main-branch/drive_v3/blob/main/examples/drive_service_batch)

### [ ] Create an empty data file

### [ ] Create a spreadsheet, document, or presentation

### [ ] Upload file data

### [ ] Download and export files

### [ ] File revisions

### [ ] Create and populate folders

### [ ] Trash or delete files or folders

### [ ] Search for files or folders

### [ ] Return specific fields for a file

### [ ] Share files, folders, and drives

### [ ] Store application-specific data

### [ ] Manage file metadata

### [ ] Manage comments and replies

### [ ] Add custom file properties

### [ ] Create a shortcut to a Drive file

### [ ] Create a shortcut to app content

### [ ] Protect file content from modification

### [ ] Access link-shared files using resource keys

## Handle changes

### [ ] Identify which change log to track

### [ ] Track changes for users and shared drives

### [ ] Retrieve changes

### [ ] Receive notifications for resource changes

## Manage labels

### [ ] Manage labels

### [ ] Set label field

### [ ] Unset label field

### [ ] Remove label

### [ ] List labels from file

### [ ] Return specific labels from a file

### [ ] Search by label or field
