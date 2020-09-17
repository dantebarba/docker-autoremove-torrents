# autoremove-torrents image

Image for the PyPi module autoremove-torrents. 



> This program can help you to remove your torrents. Now you don’t need
> to worry about your disk space - according to your strategies, the
> program will check each torrent if it satisfies the remove condition;
> If so, delete it automatically.
> 
> This program supports qBittorrent/Transmission/μTorrent.

https://pypi.org/project/autoremove-torrents/

## Usage

    docker run dantebarba/autoremove-torrents:latest -v /path/to/config.yml:/app/config.yml -e OPTS=customoptions

OPTS can take the following arguments:

<table border="1" class="docutils">
<colgroup>
<col width="33%">
<col width="33%">
<col width="33%">
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Arugments</th>
<th class="head">Argument Abbreviations</th>
<th class="head">Description</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td><cite>–view</cite></td>
<td><cite>-v</cite></td>
<td>Run and see which torrents will be removed, but don’t really remove them.</td>
</tr>
<tr class="row-odd"><td><cite>–conf</cite></td>
<td><cite>-c</cite></td>
<td>Specify the path of the configuration file.</td>
</tr>
<tr class="row-even"><td><cite>–task</cite></td>
<td><cite>-t</cite></td>
<td>Run a specific task only. The argument value is the task name.</td>
</tr>
<tr class="row-odd"><td><cite>–log</cite></td>
<td><cite>-l</cite></td>
<td>Sepcify the path of the log file.</td>
</tr>
</tbody>
</table>

The file config.yml contains all the configuration needed to make autoremove-torrents work. Just bind the file to /app/config.yml and you are good to go.
