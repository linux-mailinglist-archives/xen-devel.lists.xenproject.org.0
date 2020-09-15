Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35326AE91
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 22:17:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIHNK-00063L-8q; Tue, 15 Sep 2020 20:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2ds=CY=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kIHNI-00063G-Dc
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 20:16:24 +0000
X-Inumbo-ID: eba7c571-8ed1-4344-9946-ee2381269bca
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eba7c571-8ed1-4344-9946-ee2381269bca;
 Tue, 15 Sep 2020 20:16:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id n13so4290302edo.10
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2020 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mtGpMji6U4gOlJcgTWnaHkIKbZ+UCucaxlzxpjfbl2I=;
 b=sREwVHSWVaB35vjxRMKXUONf2nelaBM1UA7giXmFxZoSdSN2nIMX615+lVczacCL9b
 Yt8Q367GHXc4S72wwCC5ps+D8bNby9RYTrxID84xMBVkHbYfgMNo/tSl4/51KSgO1Z1N
 a8rVoagIeaLvia7dZ/ijAYerNQ456ilcoZIpE0W9pmclZZGwmiEiCmWPWOo4w3KXSyvC
 RflAmkX1020G0n+NmsfycN/NTqMrrNgNS6soz8NEC2Zp5srT61ocu0Ch6XAb80VSAVej
 GjacIJdT9wF0EpLuRqIkRRK6+KYAfkD0TYQYcmvKl6Zg8VwXVNtrr8dPKkgy+Sq+anvq
 vz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mtGpMji6U4gOlJcgTWnaHkIKbZ+UCucaxlzxpjfbl2I=;
 b=Rzj2ntlECncumF8LkjjuEdlejt+aS32ndls7uuiDP9EfaHLkTTJt/GyiIuCv7eHFP4
 NWK8dqPBlsZJpcoh6QWzHqxjKsRv+IM9ggH3FmRakXN0jKl59t8by0cnVrVdbBPUQzbK
 j9YbV+YRnETsaoGHN6IIvAblqPSKoKJAHdHk+BCW3XBGF+QPJGqE6fQq6Lwvx8h2znnK
 tBhJlfVE7QwoyFrTZ43AXJohV9ectMMSY7awz4Jk1M6xby+iawJ1DjZDZz0pm9Zpxbpp
 rmTmMZj9akQLzZSkk0aFFYuawUFA3XT41YSTX7V+3AycBqDKQKLrIxUKBnGj1gDRFI6r
 v8pg==
X-Gm-Message-State: AOAM533eetoaV7UXkoZP5SbwiGobZhsxkXAU8DI8vPmC1ZuMl33ggt7r
 jYqUB0AX+IhyqCulUkDfCQ2nxqRz1glG91AldwW4/YFVLC64ZA==
X-Google-Smtp-Source: ABdhPJwP8B7xw67nP2UuOAK/BdcX7V5bJSb+2erz76b1niNKCyRjbr/onfg2cLd+eGjGjqqVo+MgPQXd4dQRivGeRu0=
X-Received: by 2002:a50:d98d:: with SMTP id w13mr25233960edj.37.1600200981275; 
 Tue, 15 Sep 2020 13:16:21 -0700 (PDT)
MIME-Version: 1.0
From: David I <dav.sec.lists@gmail.com>
Date: Tue, 15 Sep 2020 22:16:10 +0200
Message-ID: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
Subject: Compiling Xen from source
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000000ee55305af5fd3bc"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000000ee55305af5fd3bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am unable to mcompile xen-tools from source.

here is the "stacktrace":

ln -f xenstore xenstore-watch
gcc xenstore_control.o
 -Wl,-rpath-link=3D/home/david/xen/xen/tools/xenstore/../../tools/libs/tool=
core
/home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstore.so -ldl
 /home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/libxentoolcor=
e.so
 -o xenstore-control
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I.
-include /home/david/xen/xen/tools/xenstore/../../tools/config.h
-I./include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include -D__XEN_TOOLS__
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
-DXEN_RUN_STORED=3D"\"/var/run/xenstored\""   -c -o xs_tdb_dump.o
xs_tdb_dump.c
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
.utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I. -include
/home/david/xen/xen/tools/xenstore/../../tools/config.h -I./include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include -D__XEN_TOOLS__
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include
-DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
-DXEN_RUN_STORED=3D"\"/var/run/xenstored\""
-I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/include
-I/home/david/xen/xen/tools/xenstore/../../tools/include  -c -o utils.o
utils.c
gcc xs_tdb_dump.o utils.o tdb.o talloc.o     -o xs_tdb_dump
/usr/bin/ld : utils.o:(.data.rel.local+0x0) : d=C3=A9finitions multiples de
=C2=AB xprintf =C2=BB; xs_tdb_dump.o:(.bss+0x0) : d=C3=A9fini pour la premi=
=C3=A8re fois ici
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1
make[4] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tools/xen=
store =C2=BB
make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :
subdir-install-xenstore] Erreur 2
make[3] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tools =C2=
=BB
make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :
subdirs-install] Erreur 2
make[2] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tools =C2=
=BB
make[1]: *** [Makefile:74 : install] Erreur 2
make[1] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tools =C2=
=BB
make: *** [Makefile:127 : install-tools] Erreur 2
david@debian:~/xen/xen$ uname -a
Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
GNU/Linux
david@debian:~/xen/xen$ gcc --version
gcc (Debian 10.2.0-5) 10.2.0
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

david@debian:~/xen/xen$ /usr/bin/ld --version
GNU ld (GNU Binutils for Debian) 2.35
Copyright (C) 2020 Free Software Foundation, Inc.
Ce logiciel est libre; si vous le redistribuez, vous devez le faire selon
les termes
de la licence GNU General Public License version 3 ou post=C3=A9rieure selo=
n
votre besoin.
Ce logiciel n'est couvert par aucune GARANTIE.
david@debian:~/xen/xen$ git branch
  master
* stable-4.11
  staging
david@debian:~/xen/xen$

I was able to compile dist-xen correctly though. But dist-tools fails with
this error, I have seen a similar request here:
https://stackoverflow.com/questions/63525163/usr-bin-ld-utils-o-data-rel-lo=
cal0x0-multiple-definition-of-xprintf-xs

I have tried to compile xen from source also on this same configuration,
in stable-4.12, stable-4.13, stable-4.14, each time I was able to  compile
xen but failed to compile xen-tools.
the debian package works fine and is in version 4.11.

So my question would be, is there a patch for this issue ? and how the
debian team could compile originally the debian source package ? I suppose
I am not the first user to encounter this.

Thank you for your answers ;-)

David

--0000000000000ee55305af5fd3bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I am unable to mcompi=
le xen-tools from source.</div><div><br></div><div>here is the &quot;stackt=
race&quot;:</div><div><br></div><div>ln -f xenstore xenstore-watch<br>gcc x=
enstore_control.o =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D/home/david/xen/xen=
/tools/xenstore/../../tools/libs/toolcore /home/david/xen/xen/tools/xenstor=
e/../../tools/xenstore/libxenstore.so -ldl =C2=A0/home/david/xen/xen/tools/=
xenstore/../../tools/libs/toolcore/libxentoolcore.so =C2=A0-o xenstore-cont=
rol <br>gcc =C2=A0-m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -=
Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variab=
le -Wno-unused-local-typedefs =C2=A0 -O2 -fomit-frame-pointer -D__XEN_INTER=
FACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .xs_tdb_dump.o.d=
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =C2=A0 -Werror -I. -include /hom=
e/david/xen/xen/tools/xenstore/../../tools/config.h -I./include -I/home/dav=
id/xen/xen/tools/xenstore/../../tools/libs/evtchn/include -I/home/david/xen=
/xen/tools/xenstore/../../tools/include -I/home/david/xen/xen/tools/xenstor=
e/../../tools/libxc/include -I/home/david/xen/xen/tools/xenstore/../../tool=
s/libs/toollog/include -I/home/david/xen/xen/tools/xenstore/../../tools/inc=
lude -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/in=
clude -I/home/david/xen/xen/tools/xenstore/../../tools/include -I/home/davi=
d/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include -I/home/david=
/xen/xen/tools/xenstore/../../tools/include -I/home/david/xen/xen/tools/xen=
store/../../tools/include -D__XEN_TOOLS__ -I/home/david/xen/xen/tools/xenst=
ore/../../tools/libs/toolcore/include -I/home/david/xen/xen/tools/xenstore/=
../../tools/include -DXEN_LIB_STORED=3D&quot;\&quot;/var/lib/xenstored\&quo=
t;&quot; -DXEN_RUN_STORED=3D&quot;\&quot;/var/run/xenstored\&quot;&quot; =
=C2=A0 -c -o xs_tdb_dump.o xs_tdb_dump.c <br>gcc =C2=A0-m64 -DBUILD_ID -fno=
-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after=
-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -=
O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFAC=
E_VERSION__ -MMD -MF .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
=C2=A0 -Werror -I. -include /home/david/xen/xen/tools/xenstore/../../tools/=
config.h -I./include -I/home/david/xen/xen/tools/xenstore/../../tools/libs/=
evtchn/include -I/home/david/xen/xen/tools/xenstore/../../tools/include -I/=
home/david/xen/xen/tools/xenstore/../../tools/libxc/include -I/home/david/x=
en/xen/tools/xenstore/../../tools/libs/toollog/include -I/home/david/xen/xe=
n/tools/xenstore/../../tools/include -I/home/david/xen/xen/tools/xenstore/.=
./../tools/libs/foreignmemory/include -I/home/david/xen/xen/tools/xenstore/=
../../tools/include -I/home/david/xen/xen/tools/xenstore/../../tools/libs/d=
evicemodel/include -I/home/david/xen/xen/tools/xenstore/../../tools/include=
 -I/home/david/xen/xen/tools/xenstore/../../tools/include -D__XEN_TOOLS__ -=
I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include -I/ho=
me/david/xen/xen/tools/xenstore/../../tools/include -DXEN_LIB_STORED=3D&quo=
t;\&quot;/var/lib/xenstored\&quot;&quot; -DXEN_RUN_STORED=3D&quot;\&quot;/v=
ar/run/xenstored\&quot;&quot; =C2=A0 -I/home/david/xen/xen/tools/xenstore/.=
./../tools/libs/gnttab/include -I/home/david/xen/xen/tools/xenstore/../../t=
ools/include =C2=A0-c -o utils.o utils.c <br>gcc xs_tdb_dump.o utils.o tdb.=
o talloc.o =C2=A0 =C2=A0 -o xs_tdb_dump <br>/usr/bin/ld=C2=A0: utils.o:(.da=
ta.rel.local+0x0)=C2=A0: d=C3=A9finitions multiples de =C2=AB=C2=A0xprintf=
=C2=A0=C2=BB; xs_tdb_dump.o:(.bss+0x0)=C2=A0: d=C3=A9fini pour la premi=C3=
=A8re fois ici<br>collect2: error: ld returned 1 exit status<br>make[4]: **=
* [Makefile:97 : xs_tdb_dump] Erreur 1<br>make[4]=C2=A0: on quitte le r=C3=
=A9pertoire =C2=AB=C2=A0/home/david/xen/xen/tools/xenstore=C2=A0=C2=BB<br>m=
ake[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 : subdir-insta=
ll-xenstore] Erreur 2<br>make[3]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=
=C2=A0/home/david/xen/xen/tools=C2=A0=C2=BB<br>make[2]: *** [/home/david/xe=
n/xen/tools/../tools/Rules.mk:244 : subdirs-install] Erreur 2<br>make[2]=C2=
=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/david/xen/xen/tools=C2=
=A0=C2=BB<br>make[1]: *** [Makefile:74 : install] Erreur 2<br>make[1]=C2=A0=
: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/david/xen/xen/tools=C2=A0=
=C2=BB<br>make: *** [Makefile:127 : install-tools] Erreur 2<br>david@debian=
:~/xen/xen$ uname -a<br>Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (=
2020-07-26) x86_64 GNU/Linux<br>david@debian:~/xen/xen$ gcc --version<br>gc=
c (Debian 10.2.0-5) 10.2.0<br>Copyright (C) 2020 Free Software Foundation, =
Inc.<br>This is free software; see the source for copying conditions.=C2=A0=
 There is NO<br>warranty; not even for MERCHANTABILITY or FITNESS FOR A PAR=
TICULAR PURPOSE.<br><br>david@debian:~/xen/xen$ /usr/bin/ld --version<br>GN=
U ld (GNU Binutils for Debian) 2.35<br>Copyright (C) 2020 Free Software Fou=
ndation, Inc.<br>Ce logiciel est libre; si vous le redistribuez, vous devez=
 le faire selon les termes<br>de la licence GNU General Public License vers=
ion 3 ou post=C3=A9rieure selon votre besoin.<br>Ce logiciel n&#39;est couv=
ert par aucune GARANTIE.<br>david@debian:~/xen/xen$ git branch<br>=C2=A0 ma=
ster<br>* stable-4.11<br>=C2=A0 staging<br>david@debian:~/xen/xen$ <br></di=
v><div><br></div><div>I was able to compile dist-xen correctly though. But =
dist-tools fails with this error, I have seen a similar request here:</div>=
<div><a href=3D"https://stackoverflow.com/questions/63525163/usr-bin-ld-uti=
ls-o-data-rel-local0x0-multiple-definition-of-xprintf-xs">https://stackover=
flow.com/questions/63525163/usr-bin-ld-utils-o-data-rel-local0x0-multiple-d=
efinition-of-xprintf-xs</a></div><div><br></div><div>I have tried to compil=
e xen from source also on this same configuration,</div><div>in stable-4.12=
, stable-4.13, stable-4.14, each time I was able to=C2=A0 compile xen but f=
ailed to compile xen-tools.</div><div>the debian package works fine and is =
in version 4.11.</div><div><br></div><div>So my question would be, is there=
 a patch for this issue ? and how the debian team could compile originally =
the debian source package ? I suppose I am not the first user to encounter =
this.</div><div><br></div><div>Thank you for your answers ;-)</div><div><br=
></div><div>David<br></div></div>

--0000000000000ee55305af5fd3bc--

