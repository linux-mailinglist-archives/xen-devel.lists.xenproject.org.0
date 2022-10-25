Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED360D82F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430267.681755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTiF-0007fj-Pq; Tue, 25 Oct 2022 23:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430267.681755; Tue, 25 Oct 2022 23:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTiF-0007dR-LF; Tue, 25 Oct 2022 23:52:03 +0000
Received: by outflank-mailman (input) for mailman id 430267;
 Tue, 25 Oct 2022 23:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onTiE-0007dE-Nt
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 23:52:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e67ced-54c0-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 01:52:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 09B10CE1FF5;
 Tue, 25 Oct 2022 23:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406F0C433C1;
 Tue, 25 Oct 2022 23:51:52 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 03e67ced-54c0-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666741913;
	bh=P0WE4LD7Cj3BDjUxnJPoK7POqFTVkOMmDWIoujPP2FA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sy3fXZjDPvreEYlBuQLQXdC/LUaLEo8xLz6JRDZ45iOt9bIIlR8c0Ew9sH58MAsE4
	 xTSH7UYKiDnFP2tpl33mLmIziVEjFMpoDCV5NNUU4lgcxTa1CSA/NYJ9Ee4ljB8LZk
	 lDLcan28rV+gblL6VBnD5pfzPM5gxHHcC8ylirpkfUyvsvHzpBOUp+G4WQUKx+hnQd
	 hP7kU/6tx6CDV8GDFv0BFxuS8GNV/sHR/VWv9JUcxhB9TUENgS8Yd+vQTxRqGf4G8X
	 qJ0x3C+7PXIPqK0OevSkw2EX20ymhdk4VBUUFdeCqrQHpxwOx2izwqZk6uLrGt8ZZQ
	 hpANTdS0yZZng==
Date: Tue, 25 Oct 2022 16:51:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vipul Suneja <vsuneja63@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
    oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
    Bertrand.Marquis@arm.com
Subject: Re: Porting Xen in raspberry pi4B
In-Reply-To: <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210251641540.1397955@ubuntu-linux-20-04-desktop>
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com> <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop> <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com> <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
 <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-90070364-1666741912=:1397955"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-90070364-1666741912=:1397955
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Vipul,

If you look at the QEMU logs, it says:

VNC server running on 127.0.0.1:5900

That is the VNC server you need to connect to. So in theory:

  vncviewer 127.0.0.1:5900

should work correctly.


If you have:

  vfb = ["type=vnc"]

in your xl config file and you have "fbdev" in your Linux guest, it
should work.

If you connect to the VNC server but you get a black screen, it might be
a guest configuration issue. I would try with a simpler guest, text only
(no X11, no Wayland) and enable the fbdev console (fbcon). See
Documentation/fb/fbcon.rst in Linux. You should be able to see a
graphical console over VNC.

If that works, then you know that the fbdev kernel driver (xen-fbfront)
works correctly.

If it doesn't work, the output of "xenstore-ls" would be interesting.

Cheers,

Stefano


On Wed, 19 Oct 2022, Vipul Suneja wrote:
> Hi Stefano,
> 
> Thanks for the response!
> 
> I am following the same link you shared from the beginning. Tried the command "vncviewer localhost:0" in DOM0 but same issue "Can't open
> display", below are the logs:
> 
> root@raspberrypi4-64:~# vncviewer localhost:0
> 
> TigerVNC Viewer 64-bit v1.11.0
> Built on: 2020-09-08 12:16
> Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
> See https://www.tigervnc.org for information on TigerVNC.
> Can't open display:
> 
> Below are the netstat logs, i couldn't see anything running at port 5900 or 5901:
> 
> root@raspberrypi4-64:~# netstat -tuwx
> Active Internet connections (w/o servers)
> Proto Recv-Q Send-Q Local Address           Foreign Address         State      
> tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472      ESTABLISHED
> Active UNIX domain sockets (w/o servers)
> Proto RefCnt Flags       Type       State         I-Node Path
> unix  8      [ ]         DGRAM      CONNECTED      10565 /dev/log
> unix  3      [ ]         STREAM     CONNECTED      10891 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      13791
> unix  3      [ ]         STREAM     CONNECTED      10843 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      10573 /var/run/xenstored/socket
> unix  2      [ ]         DGRAM      CONNECTED      14510
> unix  3      [ ]         STREAM     CONNECTED      13249
> unix  2      [ ]         DGRAM      CONNECTED      13887
> unix  2      [ ]         DGRAM      CONNECTED      10599
> unix  3      [ ]         STREAM     CONNECTED      14005
> unix  3      [ ]         STREAM     CONNECTED      13258
> unix  3      [ ]         STREAM     CONNECTED      13248
> unix  3      [ ]         STREAM     CONNECTED      14003
> unix  3      [ ]         STREAM     CONNECTED      10572 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      10786 /var/run/xenstored/socket
> unix  3      [ ]         DGRAM      CONNECTED      13186
> unix  3      [ ]         STREAM     CONNECTED      10864 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      10812 /var/run/xenstored/socket
> unix  2      [ ]         DGRAM      CONNECTED      14083
> unix  3      [ ]         STREAM     CONNECTED      10813 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      14068
> unix  3      [ ]         STREAM     CONNECTED      13256
> unix  3      [ ]         STREAM     CONNECTED      10571 /var/run/xenstored/socket
> unix  3      [ ]         STREAM     CONNECTED      10842
> unix  3      [ ]         STREAM     CONNECTED      13985
> unix  3      [ ]         DGRAM      CONNECTED      13185
> unix  2      [ ]         STREAM     CONNECTED      13884
> unix  2      [ ]         DGRAM      CONNECTED      14528
> unix  2      [ ]         DGRAM      CONNECTED      13785
> unix  3      [ ]         STREAM     CONNECTED      14034
> 
> Attaching xen log files of /var/log/xen.
> I didn't get the role of QEMU here because as mentioned earlier, I am porting in raspberrypi 4B.
> 
> Regards,
> Vipul Kumar
> 
> On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       It usually works the way it is described in the guide:
> 
>       https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
> 
>       You don't need to install any VNC-related server software because it is
>       already provided by Xen (to be precise it is provided by QEMU working
>       together with Xen.)
> 
>       You only need the vnc client in dom0 so that you can connect, but you
>       could also run the vnc client outside from another host. So basically
>       the following should work when executed in Dom0 after creating DomU:
> 
>         vncviewer localhost:0
> 
>       Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also use
>       netstat -taunp to check if there is anything running at port 5900 or
>       5901?
> 
>       Cheers,
> 
>       Stefano
> 
> 
>       On Tue, 18 Oct 2022, Vipul Suneja wrote:
>       > Hi Stefano,
>       >
>       > Thanks for the response!
>       >
>       > I could install tigerVNC, x11vnc & libvncserver in Dom0 xen-image-minimal but only manage to install libvncserver(couldn't
>       install tigervnc
>       > & x11vnc because of x11
>       > support missing, it's wayland) in DOMU custom graphical image. I tried running vncviewer with IP address & port in dom0 to
>       access the domu
>       > graphical image display as per below commands.
>       >  
>       >  vncviewer 192.168.1.42:5901
>       >  
>       >  But it showing can't open display, below are the logs:
>       >  
>       > root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
>       >
>       > TigerVNC Viewer 64-bit v1.11.0
>       > Built on: 2020-09-08 12:16
>       > Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
>       > See https://www.tigervnc.org for information on TigerVNC.
>       > Can't open display:
>       > root@raspberrypi4-64:~/guest1#
>       >
>       > I am not exactly sure what the issue is but I thought only libvncserver in DOMU could work to get access but it did not
>       work. 
>       > If TigerVNC is the issue here then is there any other VNC source which could be installed for both x11 & wayland supported
>       images?
>       >
>       > Regards,
>       > Vipul Kumar
>       >
>       > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       VNC is typically easier to setup, because SDL needs extra libraries at
>       >       build time and runtime. If QEMU is built without SDL support it won't
>       >       start when you ask for SDL.
>       >
>       >       VNC should work with both x11 and wayland in your domU. It doesn't work
>       >       at the x11 level, it exposes a special fbdev device in your domU that
>       >       should work with:
>       >       - a graphical console in Linux domU
>       >       - x11
>       >       - wayland (but I haven't tested this so I am not 100% sure about it)
>       >
>       >       When you say "it doesn't work", what do you mean? Do you get a black
>       >       window?
>       >
>       >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
>       >       (drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text
>       >       console up and running in your domU before attempting x11/wayland.
>       >
>       >       Cheers,
>       >
>       >       Stefano
>       >
>       >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
>       >       > Hi,
>       >       > Thanks!
>       >       >
>       >       > I have ported xen minimal image as DOM0 & custom wayland GUI based image as DOMU in raspberry pi4B. I am trying to
>       make GUI
>       >       display up
>       >       > for guest machine. I tried using sdl, included below line in guest.conf file
>       >       > vfb= [ 'sdl=1' ]
>       >       >
>       >       > But it is throwing below error:
>       >       >
>       >       > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
>       >       > Parsing config from guest1.cfg
>       >       > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket: Connection reset by peer
>       >       > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP connection to QEMU
>       >       > libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup configs failed, rc=-26
>       >       > libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did not start: -26
>       >       > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited
>       >       > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domain
>       >       > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy guest
>       >       > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed
>       >       >
>       >       > Another way is VNC, i could install tigervnc in DOM0 but same i couldn't in guest machine because it doesn't support
>       >       x11(supports wayland
>       >       > only). I am completely blocked here, Need your support to enable the display up.
>       >       > Any alternative of VNC which could work in both x11 & wayland supported images?
>       >       >
>       >       > Any input on VNC, SDL or any other way to proceed on this? Looking forward to hearing from you.
>       >       >
>       >       > Regards,
>       >       > Vipul Kumar
>       >
>       >
>       >
> 
> 
> 
--8323329-90070364-1666741912=:1397955--

