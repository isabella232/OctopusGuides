file { '/usr/share/applications/Tomcat.desktop':
  content => @("EOL"/L)
    [Desktop Entry]
    Version=1.0
    Name=Tomcat
    Comment=Username: tomcat Password: Password01!
    Exec=firefox http://localhost:9091/manager
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/usr/share/icons/tomcat.svg
    Categories=Internet
    | EOL
}

file { '/usr/share/applications/Random Quotes Dev.desktop':
  content => @("EOL"/L)
    [Desktop Entry]
    Version=1.0
    Name=Random Quotes Dev
    Exec=firefox http://localhost:9091/randomquotes-dev/index.html
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/usr/share/icons/webapp.svg
    Categories=Internet
    | EOL
}

file { '/usr/share/applications/Random Quotes Test.desktop':
  content => @("EOL"/L)
    [Desktop Entry]
    Version=1.0
    Name=Random Quotes Test
    Exec=firefox http://localhost:9091/randomquotes-test/index.html
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/usr/share/icons/webapp.svg
    Categories=Internet
    | EOL
}

file {'/usr/share/icons/webapp.svg':
  content => @("EOL"/L)
    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
viewBox="0 0 420.049 420.049" style="enable-background:new 0 0 420.049 420.049;" xml:space="preserve">
<path style="fill:#1185E0;" d="M412.212,210.547l-15.673-27.167c-22.988,13.061-48.588,23.51-74.71,31.347c0-1.567,0-2.612,0-4.18
	v-0.522c-1.567-75.755-30.824-148.376-82.024-204.8l-22.988,20.898c45.976,50.678,72.098,115.984,73.665,183.902
	c0,4.18-0.522,8.359-0.522,12.539c-29.257,6.269-56.947,9.927-79.935,10.449c-22.988-0.522-50.678-3.657-79.935-10.449
	c-0.522-4.18-0.522-8.359-0.522-12.539c1.567-67.918,27.69-133.224,73.665-183.902L180.245,5.225
	c-51.2,55.902-80.457,129.045-82.024,204.8v0.522c0,1.567,0,2.612,0,4.18c-26.122-7.837-52.245-18.286-74.71-31.347L7.837,210.547
	c28.212,16.196,61.127,28.735,93.518,37.094c8.882,62.171,36.049,120.163,78.89,167.184l22.988-20.898
	c-35.527-39.184-59.037-86.727-68.963-138.449c27.69,5.225,53.812,8.359,75.233,8.882c0,0,0,0,0.522,0c0,0,0,0,0.522,0
	c21.943-0.522,48.065-3.135,75.233-8.882c-9.404,51.2-33.437,99.265-68.963,138.449l22.988,20.898
	c42.841-47.02,70.008-105.012,78.89-167.184C351.086,239.282,384,226.743,412.212,210.547z"/>
<path style="fill:#4DCFE0;" d="M210.025,420.049C94.041,420.049,0,326.008,0,210.024S94.041,0,210.025,0
	s210.024,94.041,210.024,210.024S326.008,420.049,210.025,420.049z M210.025,31.347c-98.743,0-178.678,79.935-178.678,178.678
	s79.935,178.678,178.678,178.678s178.678-79.935,178.678-178.678S308.767,31.347,210.025,31.347z"/>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
  <g>
  </g>
  </svg>
  | EOL
}

file {'/usr/share/icons/tomcat.svg':
  content => @("EOL"/L)
  <svg width="256px" height="182px" viewBox="0 0 256 182" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid">
	<g>
		<path d="M44.298,119.344 C47.21,122.936 50.447,126.576 54.01,130.236 C43.638,133.357 36.839,139.152 32.597,144.269 C25.887,152.368 22.335,163.064 23.152,172.244 L5.291,172.244 C8.873,164.471 23.171,142.015 44.298,119.344" fill="#D1A41A"></path>
		<path d="M251.194,177.115 L229.477,177.115 C179.657,151.118 135.918,132.786 89.453,128.781 C89.552,122.315 90.703,114.995 92.917,106.837 L88.637,105.686 C86.364,114.069 85.173,121.656 85.035,128.446 C80.194,128.121 75.323,127.964 70.403,127.964 C66.24,127.964 62.442,128.348 58.979,129.017 C54.462,124.51 50.615,120.2 47.348,116.117 C68.779,93.799 104.076,73.607 134.796,66.011 C143.446,94.763 162.014,114.463 184.547,127.718 C186.2,126.773 187.824,125.789 189.418,124.747 L228.729,167.068 L230.451,166.92 C241.186,165.996 247.287,171.821 248.902,173.631 C250.092,174.95 250.8,176.161 251.194,177.115" fill="#D1A41A"></path>
		<path d="M232.016,35.556 C232.813,74.611 212.887,105.696 184.99,121.637 C137.64,98.051 128.725,38.282 136.794,6.223 C139.037,18.484 143.121,26.169 151.938,29.938 C171.165,24.437 197.625,24.003 217.118,29.377 C225.236,23.473 228.385,14.45 230.107,6.568 C232.252,15.738 232.006,35.556 232.016,35.556" fill="#FFDC76"></path>
		<path d="M168.22,40.776 C169.857,40.776 171.005,41.441 171.835,42.863 C173.78,46.209 173.461,52.809 171.848,59.714 L158.752,59.714 L158.752,62.583 L171.111,62.583 C169.785,67.294 167.922,71.955 165.825,75.648 L165.147,76.842 L181.533,87.156 L172.308,93.235 L173.887,95.632 L184.198,88.834 L195.329,96.098 L196.858,93.67 L186.537,87.285 C186.537,87.285 201.968,77.262 202.735,76.772 C202.73,76.766 202.727,76.76 202.723,76.754 L202.741,76.751 C199.34,71.737 198.262,67.456 199.678,62.583 L200.836,62.583 L213.28,62.569 L213.309,59.714 L200.77,59.714 C203.08,54.278 206.314,49.384 217.858,49.384 L217.858,46.515 C207.207,46.515 200.832,50.744 197.779,59.714 L174.798,59.714 C176.405,52.543 176.684,45.494 174.312,41.419 C172.977,39.123 170.869,37.906 168.22,37.906 C158.727,37.906 154.979,47.607 154.825,48.02 L157.511,49.028 C157.645,48.677 160.74,40.776 168.22,40.776 L168.22,40.776 Z M184.164,85.422 L172.044,77.791 L195.73,77.797 L184.164,85.422 L184.164,85.422 Z M196.759,62.583 C195.74,65.831 196.149,70.724 198.657,74.923 L169.457,74.923 C171.233,71.364 172.88,67.026 174.084,62.583 L196.759,62.583 L196.759,62.583 Z" fill="#000000"></path>
		<path d="M157.512,49.028 L157.511,49.028 L157.51,49.03 L157.512,49.028" fill="#000000"></path>
		<path d="M252.205,170.602 C247.342,165.162 237.816,162.587 229.861,162.778 C224.79,156.742 197.884,128.337 192.452,122.609 C203.683,114.727 213.437,104.487 220.915,92.325 L235.762,92.325 L235.762,89.138 L222.794,89.138 C223.622,87.677 224.411,86.185 225.174,84.673 L235.762,84.673 L235.762,81.485 L226.716,81.485 C233.436,66.972 237.155,50.31 236.794,32.074 C236.807,32.082 236.82,32.088 236.832,32.095 C236.813,27.106 235.26,6.019 232.404,0.213 C224.66,3.156 210.569,12.69 207.38,22.44 C192.096,20.158 174.866,20.428 159.773,23.04 C157.251,12.55 144.595,4.522 135.047,0 C131.02,6.796 129.236,22.553 129.689,33.731 C129.672,33.742 129.654,33.754 129.636,33.766 C130.017,43.865 131.388,53.139 133.595,61.66 C100.575,69.842 64.626,91.473 44.517,112.378 C35.105,99.675 31.371,89.25 30.262,81.35 C28.861,71.373 31.243,62.22 37.149,54.881 C46.396,43.394 59.534,42.585 73.043,44.857 C72.779,46.99 73.059,49.029 73.914,50.291 C77.486,55.567 96.687,57.421 108.148,52.308 C99.69,40.456 82.558,34.669 77.811,36.988 C76.239,37.755 75.052,39.166 74.239,40.811 C69.57,39.976 64.933,39.354 61.543,39.379 C49.629,39.467 40.521,43.63 33.7,52.105 C27.007,60.42 24.302,70.746 25.877,81.966 C27.369,92.593 32.63,103.896 41.449,115.618 C39.984,117.189 38.568,118.741 37.205,120.265 C15.711,144.315 0,170.105 0,174.378 L0,176.592 L28.355,176.592 L27.858,173.967 C26.257,165.504 29.455,154.926 36.005,147.02 C40.117,142.057 46.927,136.392 57.621,133.778 C67.13,143.058 79.244,152.914 92.729,162.422 L113.8,162.422 L113.8,160.208 C113.8,157.71 112.562,155.523 110.312,154.051 C106.983,151.875 101.845,151.575 97.125,153.185 C92.625,148.173 90.102,141.478 89.557,133.163 C135.288,137.213 179.029,155.68 228.385,181.463 L255.541,181.463 L255.897,179.683 C256.404,177.149 255.023,173.754 252.205,170.602 L252.205,170.602 Z M136.793,6.15 C139.04,18.406 143.115,26.092 151.941,29.863 C159.755,27.627 168.77,26.243 178.022,25.732 L185.696,42.563 L190.616,25.586 C199.965,25.889 209.126,27.1 217.112,29.303 C225.235,23.397 228.385,14.376 230.105,6.494 C232.254,15.666 232.006,35.478 232.012,35.482 C232.163,42.88 231.568,49.99 230.318,56.767 L221.553,60.492 L229.277,61.662 C228.663,64.259 227.96,66.806 227.154,69.293 L219.68,71.463 L225.635,73.607 C224.617,76.305 223.497,78.936 222.263,81.485 L209.938,81.485 L209.938,84.673 L220.642,84.673 C219.834,86.192 218.984,87.678 218.102,89.138 L209.938,89.138 L209.938,92.325 L216.097,92.325 C207.994,104.596 197.264,114.547 184.987,121.563 C170.798,114.493 160.064,104.173 152.2,92.325 L156.905,92.325 L156.905,89.138 L150.173,89.138 C149.281,87.669 148.43,86.18 147.62,84.673 L156.905,84.673 L156.905,81.485 L145.975,81.485 C144.093,77.671 142.46,73.764 141.058,69.811 L146.627,68.252 L139.605,65.444 C138.895,63.153 138.258,60.853 137.693,58.552 L148.5,57.815 L136.142,51.258 C133.113,34.557 133.721,18.348 136.793,6.15 L136.793,6.15 Z M32.596,144.195 C25.889,152.29 22.334,162.983 23.148,172.164 L5.286,172.164 C8.875,164.397 23.171,141.944 44.295,119.264 C47.206,122.862 50.448,126.496 54.009,130.16 C43.638,133.278 36.838,139.075 32.596,144.195 L32.596,144.195 Z M229.471,177.035 C179.656,151.042 135.914,132.712 89.45,128.708 C89.551,122.242 90.703,114.923 92.911,106.766 L88.638,105.608 C86.367,113.993 85.171,121.585 85.036,128.371 C80.194,128.05 75.321,127.884 70.406,127.884 C66.237,127.884 62.44,128.271 58.977,128.944 C54.461,124.43 50.613,120.128 47.344,116.045 C53.159,109.987 60.001,104.09 67.488,98.556 L77.856,105.715 L74.471,93.625 C77.623,91.499 80.863,89.444 84.166,87.47 L99.531,95.278 L92.316,82.839 C94.419,81.703 96.539,80.603 98.67,79.543 L120.135,93.941 L113.086,73.053 C120.413,70.1 127.721,67.685 134.789,65.937 C136.45,71.449 138.482,76.62 140.829,81.485 L131.08,81.485 L131.08,84.673 L142.436,84.673 C143.235,86.192 144.061,87.683 144.924,89.138 L131.08,89.138 L131.08,92.325 L146.898,92.325 C156.599,107.383 169.707,118.913 184.543,127.64 C186.194,126.697 187.814,125.696 189.412,124.658 L193.3,128.844 L186.766,138.896 L197.911,133.808 L204.363,140.754 L193.456,149.065 L208.475,145.181 L228.732,166.989 L230.447,166.842 C241.185,165.923 247.288,171.746 248.904,173.553 C250.089,174.878 250.804,176.087 251.193,177.035 L229.471,177.035 L229.471,177.035 Z" fill="#000000"></path>
	</g>
</svg>
| EOL
}