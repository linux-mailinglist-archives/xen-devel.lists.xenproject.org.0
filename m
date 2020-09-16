Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712126C339
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:23:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIXOf-0005Ub-IR; Wed, 16 Sep 2020 13:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBSe=CZ=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kIXOd-0005UW-Sz
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:22:52 +0000
X-Inumbo-ID: cc03d106-7b55-4b8f-aad6-cc4872fc83b1
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc03d106-7b55-4b8f-aad6-cc4872fc83b1;
 Wed, 16 Sep 2020 13:22:50 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p9so10307769ejf.6
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nQW2Ht1aOysABZYxv/NLuG2h3/d/AxDqG994rf5AZk=;
 b=qPkEsBOlKKE22Ebabfuy4u/rO/Of2M4t9aHKKF3J2IEpxcniDM+eh7W5YOOVxN83xF
 MpP73EjUT64spuwOhNhcE6edLVPog9ggvhILotevFjNfXpu7KQWCzhXqh4FZ1bhBvlnC
 lJ1cHepovYJxeCB7nQ57D57yNF+/fEQZdy+Qa8Jyc+Ms7wyqn1W/Ot2dLZqnBfHeYLNB
 RDrawUbrCvqRRrimTZJ1/mx6gnl9OEwk5+egI6vYLtH0WFa22U+YbqiQXKRDlYtR6OHL
 R0BbFit3yVEfQxaiNK4G4lEFwHyD6pwKr2eV3CkmGO/eyjsVzNLrI4zWOXCGgTRMTClt
 mhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nQW2Ht1aOysABZYxv/NLuG2h3/d/AxDqG994rf5AZk=;
 b=Jp87jfFfL9oGe6Prz00oGj9m3L3nqDeMVJA4049JFo+3jU0Wi34/3uJv1CnSw/ru+L
 /jeRRZgeoWojjEHKMZzIUDwg/8dWN1MJmW+o7Y6fMw9mpOgkEf3oj0+tPgef1I2Tzku1
 IIh94FQ+UmSeAVoj3fgilng5sUXiF80E22bqSC6SvZrWgbsCAQ3Nt0AlH5eLdwQBps3q
 HdDYFs9YElhzjQdYGzVq/IPDiqNbFR46t95xTAdSCy2gqGShfYY0MRm5+AMMGYjOeYxh
 6ChQT1650LAC/25pPuEEl4msd8CSfCbPtfVdIe2zDEC/O9R3twlOtfFQ0LQTciSsXbty
 uABw==
X-Gm-Message-State: AOAM533iwHf3hnIrcul5SJUOF67xqpK6EdrutNe+B+LEOTDl47FBh9mq
 BWZrTQ2QXL93W1p85ctyCS8U02s+HBt972TvQaM=
X-Google-Smtp-Source: ABdhPJxbvzpKQgopXH66dHDiMmrbyeY8VfxN6/HuibmgHwDsbC+7zNJnmT5HSner/Ulf74WuhEnxUvjiN2wE8eJRR/E=
X-Received: by 2002:a17:906:6d92:: with SMTP id
 h18mr24939934ejt.405.1600262569327; 
 Wed, 16 Sep 2020 06:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
 <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
In-Reply-To: <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
From: David I <dav.sec.lists@gmail.com>
Date: Wed, 16 Sep 2020 15:22:38 +0200
Message-ID: <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
Subject: Re: Compiling Xen from source
To: Hans van Kranenburg <hans@knorrie.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/alternative; boundary="000000000000fdff3905af6e2988"
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

--000000000000fdff3905af6e2988
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for your infos. it appears the compilation process is not really
straightforward.
I had to patch some header files. then some of the firmwares were bugged.
So I disabled some various checks in the firmwares  Makefiles.
I ended up with a:
"no target for make all":
configure passed all tests with werror disabled, but failed some tests with
werror enabled.

finally "make dist-xen" always succeeds", but "make dist-tools" seems not
bug-free.

So if you have additional advice I will try further. Also if you need
volunteers to test extensively maybe i can help.

David




Le mer. 16 sept. 2020 =C3=A0 00:34, Hans van Kranenburg <hans@knorrie.org> =
a
=C3=A9crit :

> Hi,
>
> On 9/16/20 12:00 AM, Andrew Cooper wrote:
> > On 15/09/2020 21:16, David I wrote:
> >> Hello,
> >>
> >> I am unable to mcompile xen-tools from source.
> >>
> >> here is the "stacktrace":
> >>
> >> ln -f xenstore xenstore-watch
> >> gcc xenstore_control.o
> >>
>  -Wl,-rpath-link=3D/home/david/xen/xen/tools/xenstore/../../tools/libs/to=
olcore
> >> /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstore.so
> >> -ldl
> >>
>  /home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/libxentoolc=
ore.so
> >>  -o xenstore-control
> >> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
> >> -Wstrict-prototypes -Wdeclaration-after-statement
> >> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> >> -fomit-frame-pointer
> >> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -M=
F
> >> .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror
> >> -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
> >> -I./include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >>
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/inclu=
de
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >>
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -D__XEN_TOOLS__
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
> >> -DXEN_RUN_STORED=3D"\"/var/run/xenstored\""   -c -o xs_tdb_dump.o
> >> xs_tdb_dump.c
> >> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
> >> -Wstrict-prototypes -Wdeclaration-after-statement
> >> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> >> -fomit-frame-pointer
> >> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -M=
F
> >> .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I.
> >> -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
> >> -I./include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >>
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/inclu=
de
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >>
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -D__XEN_TOOLS__
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> >> -DXEN_LIB_STORED=3D"\"/var/lib/xenstored\""
> >> -DXEN_RUN_STORED=3D"\"/var/run/xenstored\""
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/include
> >> -I/home/david/xen/xen/tools/xenstore/../../tools/include  -c -o
> >> utils.o utils.c
> >> gcc xs_tdb_dump.o utils.o tdb.o talloc.o     -o xs_tdb_dump
> >> /usr/bin/ld : utils.o:(.data.rel.local+0x0) : d=C3=A9finitions multipl=
es de
> >> =C2=AB xprintf =C2=BB; xs_tdb_dump.o:(.bss+0x0) : d=C3=A9fini pour la =
premi=C3=A8re fois ici
> >> collect2: error: ld returned 1 exit status
> >> make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1
> >> make[4] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tool=
s/xenstore =C2=BB
> >> make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :
> >> subdir-install-xenstore] Erreur 2
> >> make[3] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tool=
s =C2=BB
> >> make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :
> >> subdirs-install] Erreur 2
> >> make[2] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tool=
s =C2=BB
> >> make[1]: *** [Makefile:74 : install] Erreur 2
> >> make[1] : on quitte le r=C3=A9pertoire =C2=AB /home/david/xen/xen/tool=
s =C2=BB
> >> make: *** [Makefile:127 : install-tools] Erreur 2
> >> david@debian:~/xen/xen$ uname -a
> >> Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
> >> GNU/Linux
> >> david@debian:~/xen/xen$ gcc --version
> >> gcc (Debian 10.2.0-5) 10.2.0
> >> Copyright (C) 2020 Free Software Foundation, Inc.
> >> This is free software; see the source for copying conditions.  There i=
s
> NO
> >> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
> >> PURPOSE.
> >>
> >> david@debian:~/xen/xen$ /usr/bin/ld --version
> >> GNU ld (GNU Binutils for Debian) 2.35
> >> Copyright (C) 2020 Free Software Foundation, Inc.
> >> Ce logiciel est libre; si vous le redistribuez, vous devez le faire
> >> selon les termes
> >> de la licence GNU General Public License version 3 ou post=C3=A9rieure
> >> selon votre besoin.
> >> Ce logiciel n'est couvert par aucune GARANTIE.
> >> david@debian:~/xen/xen$ git branch
> >>   master
> >> * stable-4.11
> >>   staging
> >> david@debian:~/xen/xen$
> >>
> >> I was able to compile dist-xen correctly though. But dist-tools fails
> >> with this error, I have seen a similar request here:
> >>
> https://stackoverflow.com/questions/63525163/usr-bin-ld-utils-o-data-rel-=
local0x0-multiple-definition-of-xprintf-xs
> >>
> >> I have tried to compile xen from source also on this same configuratio=
n,
> >> in stable-4.12, stable-4.13, stable-4.14, each time I was able to
> >> compile xen but failed to compile xen-tools.
> >> the debian package works fine and is in version 4.11.
> >>
> >> So my question would be, is there a patch for this issue ? and how the
> >> debian team could compile originally the debian source package ? I
> >> suppose I am not the first user to encounter this.
> >>
> >> Thank you for your answers ;-)
> >
> > Its a change in the toolchain from -fcommon to -fno-common by default.
> >
> > Already fixed upstream by:
> >
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddacdbf7088=
d6a3705a9831e73991c2b14c519a65
> >
> > Looks like that change wants backporting.
>
> Currently, I'm working together with Ian to get Xen 4.14 into Debian
> unstable. dacdbf708 is in 4.14 already, but we also had to pick
>
> d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")
>
> and
>
> fff1b7f50e75 ("libxl: fix -Werror=3Dstringop-truncation in
> libxl__prepare_sockaddr_un")
>
> into 4.14 to fix further gcc 10 FTBFS (yay, backport candidates). Maybe
> this info helps a bit if you also run into these issues after fixing the
> first one.
>
> Hans
>

--000000000000fdff3905af6e2988
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>thanks for your infos=
. it appears the compilation process is not really straightforward.</div><d=
iv>I had to patch some header files. then some of the firmwares were bugged=
.</div><div>So I disabled some various checks in the firmwares=C2=A0 Makefi=
les.</div><div>I ended up with a:</div><div>&quot;no target for make all&qu=
ot;:</div><div>configure passed all tests with werror disabled, but failed =
some tests with werror enabled.</div><div><br></div><div>finally &quot;make=
 dist-xen&quot; always succeeds&quot;, but &quot;make dist-tools&quot; seem=
s not bug-free.</div><div><br></div><div>So if you have additional advice I=
 will try further. Also if you need volunteers to test extensively maybe i =
can help.</div><div><br></div><div>David<br></div><div><br></div><div><br><=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Le=C2=A0mer. 16 sept. 2020 =C3=A0=C2=A000:34, Hans van =
Kranenburg &lt;<a href=3D"mailto:hans@knorrie.org">hans@knorrie.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi,<br>
<br>
On 9/16/20 12:00 AM, Andrew Cooper wrote:<br>
&gt; On 15/09/2020 21:16, David I wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I am unable to mcompile xen-tools from source.<br>
&gt;&gt;<br>
&gt;&gt; here is the &quot;stacktrace&quot;:<br>
&gt;&gt;<br>
&gt;&gt; ln -f xenstore xenstore-watch<br>
&gt;&gt; gcc xenstore_control.o =C2=A0 =C2=A0<br>
&gt;&gt; =C2=A0-Wl,-rpath-link=3D/home/david/xen/xen/tools/xenstore/../../t=
ools/libs/toolcore<br>
&gt;&gt; /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstor=
e.so<br>
&gt;&gt; -ldl<br>
&gt;&gt; =C2=A0/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore=
/libxentoolcore.so<br>
&gt;&gt; =C2=A0-o xenstore-control<br>
&gt;&gt; gcc =C2=A0-m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall<=
br>
&gt;&gt; -Wstrict-prototypes -Wdeclaration-after-statement<br>
&gt;&gt; -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -O2=
<br>
&gt;&gt; -fomit-frame-pointer<br>
&gt;&gt; -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MM=
D -MF<br>
&gt;&gt; .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =C2=A0 =
-Werror<br>
&gt;&gt; -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config=
.h<br>
&gt;&gt; -I./include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/incl=
ude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemor=
y/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/=
include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -D__XEN_TOOLS__<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/inc=
lude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -DXEN_LIB_STORED=3D&quot;\&quot;/var/lib/xenstored\&quot;&quot;<br=
>
&gt;&gt; -DXEN_RUN_STORED=3D&quot;\&quot;/var/run/xenstored\&quot;&quot; =
=C2=A0 -c -o xs_tdb_dump.o<br>
&gt;&gt; xs_tdb_dump.c<br>
&gt;&gt; gcc =C2=A0-m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall<=
br>
&gt;&gt; -Wstrict-prototypes -Wdeclaration-after-statement<br>
&gt;&gt; -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -O2=
<br>
&gt;&gt; -fomit-frame-pointer<br>
&gt;&gt; -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MM=
D -MF<br>
&gt;&gt; .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =C2=A0 -Werro=
r -I.<br>
&gt;&gt; -include /home/david/xen/xen/tools/xenstore/../../tools/config.h<b=
r>
&gt;&gt; -I./include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/incl=
ude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemor=
y/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/=
include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -D__XEN_TOOLS__<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/inc=
lude<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include<br>
&gt;&gt; -DXEN_LIB_STORED=3D&quot;\&quot;/var/lib/xenstored\&quot;&quot;<br=
>
&gt;&gt; -DXEN_RUN_STORED=3D&quot;\&quot;/var/run/xenstored\&quot;&quot; =
=C2=A0<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/inclu=
de<br>
&gt;&gt; -I/home/david/xen/xen/tools/xenstore/../../tools/include =C2=A0-c =
-o<br>
&gt;&gt; utils.o utils.c<br>
&gt;&gt; gcc xs_tdb_dump.o utils.o tdb.o talloc.o =C2=A0 =C2=A0 -o xs_tdb_d=
ump<br>
&gt;&gt; /usr/bin/ld=C2=A0: utils.o:(.data.rel.local+0x0)=C2=A0: d=C3=A9fin=
itions multiples de<br>
&gt;&gt; =C2=AB=C2=A0xprintf=C2=A0=C2=BB; xs_tdb_dump.o:(.bss+0x0)=C2=A0: d=
=C3=A9fini pour la premi=C3=A8re fois ici<br>
&gt;&gt; collect2: error: ld returned 1 exit status<br>
&gt;&gt; make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1<br>
&gt;&gt; make[4]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools/xenstore=C2=A0=C2=BB<br>
&gt;&gt; make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :<br=
>
&gt;&gt; subdir-install-xenstore] Erreur 2<br>
&gt;&gt; make[3]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :<br=
>
&gt;&gt; subdirs-install] Erreur 2<br>
&gt;&gt; make[2]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make[1]: *** [Makefile:74 : install] Erreur 2<br>
&gt;&gt; make[1]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/davi=
d/xen/xen/tools=C2=A0=C2=BB<br>
&gt;&gt; make: *** [Makefile:127 : install-tools] Erreur 2<br>
&gt;&gt; david@debian:~/xen/xen$ uname -a<br>
&gt;&gt; Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86=
_64<br>
&gt;&gt; GNU/Linux<br>
&gt;&gt; david@debian:~/xen/xen$ gcc --version<br>
&gt;&gt; gcc (Debian 10.2.0-5) 10.2.0<br>
&gt;&gt; Copyright (C) 2020 Free Software Foundation, Inc.<br>
&gt;&gt; This is free software; see the source for copying conditions.=C2=
=A0 There is NO<br>
&gt;&gt; warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR=
<br>
&gt;&gt; PURPOSE.<br>
&gt;&gt;<br>
&gt;&gt; david@debian:~/xen/xen$ /usr/bin/ld --version<br>
&gt;&gt; GNU ld (GNU Binutils for Debian) 2.35<br>
&gt;&gt; Copyright (C) 2020 Free Software Foundation, Inc.<br>
&gt;&gt; Ce logiciel est libre; si vous le redistribuez, vous devez le fair=
e<br>
&gt;&gt; selon les termes<br>
&gt;&gt; de la licence GNU General Public License version 3 ou post=C3=A9ri=
eure<br>
&gt;&gt; selon votre besoin.<br>
&gt;&gt; Ce logiciel n&#39;est couvert par aucune GARANTIE.<br>
&gt;&gt; david@debian:~/xen/xen$ git branch<br>
&gt;&gt; =C2=A0 master<br>
&gt;&gt; * stable-4.11<br>
&gt;&gt; =C2=A0 staging<br>
&gt;&gt; david@debian:~/xen/xen$<br>
&gt;&gt;<br>
&gt;&gt; I was able to compile dist-xen correctly though. But dist-tools fa=
ils<br>
&gt;&gt; with this error, I have seen a similar request here:<br>
&gt;&gt; <a href=3D"https://stackoverflow.com/questions/63525163/usr-bin-ld=
-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs" rel=3D"norefe=
rrer" target=3D"_blank">https://stackoverflow.com/questions/63525163/usr-bi=
n-ld-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs</a><br>
&gt;&gt;<br>
&gt;&gt; I have tried to compile xen from source also on this same configur=
ation,<br>
&gt;&gt; in stable-4.12, stable-4.13, stable-4.14, each time I was able to=
=C2=A0<br>
&gt;&gt; compile xen but failed to compile xen-tools.<br>
&gt;&gt; the debian package works fine and is in version 4.11.<br>
&gt;&gt;<br>
&gt;&gt; So my question would be, is there a patch for this issue ? and how=
 the<br>
&gt;&gt; debian team could compile originally the debian source package ? I=
<br>
&gt;&gt; suppose I am not the first user to encounter this.<br>
&gt;&gt;<br>
&gt;&gt; Thank you for your answers ;-)<br>
&gt; <br>
&gt; Its a change in the toolchain from -fcommon to -fno-common by default.=
<br>
&gt; <br>
&gt; Already fixed upstream by:=C2=A0<br>
&gt; <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;=
h=3Ddacdbf7088d6a3705a9831e73991c2b14c519a65" rel=3D"noreferrer" target=3D"=
_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Ddacd=
bf7088d6a3705a9831e73991c2b14c519a65</a><br>
&gt; <br>
&gt; Looks like that change wants backporting.<br>
<br>
Currently, I&#39;m working together with Ian to get Xen 4.14 into Debian<br=
>
unstable. dacdbf708 is in 4.14 already, but we also had to pick<br>
<br>
d25cc3ec93eb (&quot;libxl: workaround gcc 10.2 maybe-uninitialized warning&=
quot;)<br>
<br>
and<br>
<br>
fff1b7f50e75 (&quot;libxl: fix -Werror=3Dstringop-truncation in<br>
libxl__prepare_sockaddr_un&quot;)<br>
<br>
into 4.14 to fix further gcc 10 FTBFS (yay, backport candidates). Maybe<br>
this info helps a bit if you also run into these issues after fixing the<br=
>
first one.<br>
<br>
Hans<br>
</blockquote></div>

--000000000000fdff3905af6e2988--

