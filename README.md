# OSRA Infrastructure Project

Welcome to the [OSRA](https://osralliance.org/) Infrastructure Project. This project aims to support the ROS and Gazebo ecosystem by providing essential infrastructure, including buildfarms, documentation, and tools for ROS and gazebo packages.

## Project Structure

This project uses [Nanoc](https://nanoc.app/), a static site generator written in Ruby, for managing and generating the project website. The website content is written in Markdown and ERB templates.

### Key Directories and Files

- `content/`: Contains the Markdown files for the website's content, including project descriptions and the main index page.
  - `images/`: Images used in the website's content.
  - `projects/`: Individual project pages
  - `stylesheet.css`: The main stylesheet for the website.
- `layouts/`: ERB templates for the website layout.
- `lib/`: Custom Ruby code for the Nanoc site.
- `Rules`: Nanoc rules file for defining how the site is generated.


### Development Dependencies

- Ruby and Bundler
- Nanoc and related gems as specified in `Gemfile`

## Getting Started

To get started with developing the OSRA Infrastructure Project website:

1. Ensure you have Ruby and Bundler installed.
2. Clone the project repository.
3. Run `bundle install` to install the necessary Ruby gems.
4. Use `nanoc live` to start a local development server.
