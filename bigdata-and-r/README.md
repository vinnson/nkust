# NKUST
## Big Data & R
### How to setup Rstudio
You don't need to install anything, but you need docker.
When you have docker with you, you can follow commands below and fire them from console/termial to start your RStudio

```sh
$ git clone git@github.com:vinnson/nkust.git
$ cd nkust/bigdata-and-r
$ docker-compose up
```

You will see texts below pop up
```sh
Creating network "bigdata-and-r_default" with the default driver
Creating bigdata-and-r_rstudio_1 ... done
Attaching to bigdata-and-r_rstudio_1
rstudio_1  | [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
rstudio_1  | [s6-init] ensuring user provided files have correct perms...exited 0.
rstudio_1  | [fix-attrs.d] applying ownership & permissions fixes...
rstudio_1  | [fix-attrs.d] done.
rstudio_1  | [cont-init.d] executing container initialization scripts...
rstudio_1  | [cont-init.d] userconf: executing...
rstudio_1  | [cont-init.d] userconf: exited 0.
rstudio_1  | [cont-init.d] done.
rstudio_1  | [services.d] starting services
rstudio_1  | [services.d] done.
```
Your RStudio is Ready!

### How to use RStudio
This RStudio is a server host as a web service, that means you can login to your RStudio from your browser, i.e. Chrome, Firefox, Edge.
  - URL: http://127.0.0.1:8787
  - Username: rstudio
  - Password: yourpasswordhere

### How to use data files
This RStudio server is a docker based service, which is separated from your local enviornment, but we have mapped a folder called data in this folder that you can copy your data files to this folder and you can find it from the RStudio UI.


### How to switch off RStudio
You can run press Ctrl+C from the console you setup the studio to stop, if you want this RStudio completely removed from your docker engine, you can fire the command below

```sh
$ docker-compose down
```

You will see texts below pop up
```sh
Removing bigdata-and-r_rstudio_1 ... done
Removing network bigdata-and-r_default
```

License
----

MIT
**Free Software, Hell Yeah!**
