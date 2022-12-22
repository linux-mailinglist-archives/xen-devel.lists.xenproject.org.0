Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF67654979
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 00:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468761.727953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8VDS-0006Hm-5S; Thu, 22 Dec 2022 23:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468761.727953; Thu, 22 Dec 2022 23:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8VDS-0006FA-1t; Thu, 22 Dec 2022 23:43:10 +0000
Received: by outflank-mailman (input) for mailman id 468761;
 Thu, 22 Dec 2022 23:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8VDP-0006F4-FQ
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 23:43:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f14e10e-8252-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 00:43:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35709B81F99;
 Thu, 22 Dec 2022 23:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6D3C433EF;
 Thu, 22 Dec 2022 23:42:56 +0000 (UTC)
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
X-Inumbo-ID: 5f14e10e-8252-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671752578;
	bh=oBtXAqVhoWYy6rUTjAIxPhUtQmrCV5X9WGqQ9o2OQHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eJ1o//7uBhv/yZLkxK6Vq40kETHwbBLh5T2rntRNzPV4G4zknXNokDLrlluVJfGXn
	 dA+/xPfnoYzFuiaxGNp2omocqFd8qQmBoZR9n980BmipXbHhAWe05crfT9Mnn3aF0D
	 mgBKbjCxeQWtZP+Ekfe2WaazgDP6oqe1H9ZiBpIWaUp4CEhKbdco0/pyoa6tDU2xEi
	 K8E049aj37FOm0CGFaQxJWcdHJDlHQ8b6QbT+dT1N1sY3BOomIFHzFhSNoWNb4X6rL
	 1906bcMPJm2aBaJyXsJFrKjnNhB3ZneesYHcA7FltLRUuRPgBegGhyHnOxcDKvtDhQ
	 Of5OtJUOt1uEQ==
Date: Thu, 22 Dec 2022 15:42:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vipul Suneja <vsuneja63@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
    oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
    Bertrand.Marquis@arm.com, Stewart.Hildebrand@amd.com, michal.orzel@amd.com, 
    vikram.garhwal@amd.com
Subject: Re: Porting Xen in raspberry pi4B
In-Reply-To: <CALAP8f8yOdG_g0GpWG5ZPZ0BKiaKCyM2N4V6x_8Fr08f7QjpvA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2212221523390.4079@ubuntu-linux-20-04-desktop>
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com> <CALAP8f_n2okQ-Ss_kGACAq3BVYXS_D2P_8AyhOzUxqgWpz9f4g@mail.gmail.com> <alpine.DEB.2.22.394.2211101702250.50442@ubuntu-linux-20-04-desktop> <CALAP8f8zGfNA_CZU4UQXy7-rPT6dqih9XpzuKM3vvkoBvy6usg@mail.gmail.com>
 <alpine.DEB.2.22.394.2211221605470.1049131@ubuntu-linux-20-04-desktop> <CALAP8f_QiHN4dP3z+LQgKdGeo8-=9DMyk0W7+x6P2eHvnOD_wQ@mail.gmail.com> <alpine.DEB.2.22.394.2212011128430.4039@ubuntu-linux-20-04-desktop> <CALAP8f_b=0m0dqj9a50UYXYfw9X873i07sG9eyxFSqxF0yEneQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2212121406270.3075842@ubuntu-linux-20-04-desktop> <CALAP8f9JY23ZyDGnku4iWf5YCamSQKsZtdZj3MhX9TrF7wgEpw@mail.gmail.com> <alpine.DEB.2.22.394.2212131518180.315094@ubuntu-linux-20-04-desktop> <CALAP8f-fka4jicvLhzS8NFyyqD_NnffMxrZmqpz-x9JnL7Oy7w@mail.gmail.com>
 <alpine.DEB.2.22.394.2212141443130.315094@ubuntu-linux-20-04-desktop> <CALAP8f8yOdG_g0GpWG5ZPZ0BKiaKCyM2N4V6x_8Fr08f7QjpvA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1586963452-1671751428=:4079"
Content-ID: <alpine.DEB.2.22.394.2212221528030.4079@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1586963452-1671751428=:4079
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2212221528031.4079@ubuntu-linux-20-04-desktop>

Hi Vipul,

Great that you managed to setup a debugging environment. The logs look
very promising: it looks like xenfb.c is handling events as expected.
So it would apparently seem that xen-fbfront.c -> xenfb.c connection is
working.

So the next step is the xenfb.c -> ./ui/vnc.c is working.

It could be that the pixels and mouse events arrive just fine in
xenfb.c, but then there is an issue with exporting them to the vncserver
implementation inside QEMU, which is ./ui/vnc.c. The interesting
functions there are qemu_create_displaysurface,
qemu_create_displaysurface_from, dpy_gfx_replace_surface,
dpy_gfx_update, and dpy_gfx_check_format.

Specifically dpy_gfx_update should cause VNC to render the new area.

qemu_create_displaysurface_from let VNC use the xenfb buffer directly
with VNC, rather than using a secondary buffer and memory copies.
Interestingly, dpy_gfx_check_format should be used to check if it is
appropriate to share the buffer (qemu_create_displaysurface_from) or not
(qemu_create_displaysurface) but we don't call it.

I think it would be good to add a call to dpy_gfx_check_format in
xenfb_update where we call qemu_create_displaysurface_from and also add
a printk.

You can try to disable the buffer sharing by replacing
qemu_create_displaysurface_from with qemu_create_displaysurface. You can
also try to use another QEMU UI like SDL to see if the problem is
specific to VNC only.

Cheers,

Stefano


On Mon, 19 Dec 2022, Vipul Suneja wrote:
> Hi Stefano,
> 
> Thanks!
> 
> I could prepare a patch for adding debug printf logs in xenfb.c & re-compile QEMU in yocto image. Just for reference, I have included logs
> in all the functions.
> Attaching qemu log file, could see the entry & exit logs coming up for "xenfb_handle_events" & "xenfb_map_fb" also after the host machine
> boots up. Can you please further assist, which parameters has to be cross checked or any other input as per logs?  
> 
> Thanks & Regards,
> Vipul Kumar
> 
> On Thu, Dec 15, 2022 at 4:17 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       Hi Vipul,
> 
>       For QEMU you actually need to follow the Yocto build process to update
>       the QEMU binary. That is because QEMU is a userspace application with
>       lots of library dependencies so we cannot just do "make" with a
>       cross-compiler like in the case of Xen.
> 
>       So you need to make changes to QEMU and then add those changes as a
>       patch to the Yocto QEMU build recipe, or configure Yocto to your local
>       tree to build QEMU. I am not a Yocto expert and the Yocto community
>       would be a better place to ask for advice there. You can see from here
>       some instructions on how to build Xen using a local tree, see the usage
>       of EXTERNALSRC (note that this is *not* what you need: you need to build
>       QEMU with a local tree, not Xen. But I thought that the wikipage might
>       still be a starting point)
> 
>       https://wiki.xenproject.org/wiki/Xen_on_ARM_and_Yocto
> 
>       Cheers,
> 
>       Stefano
> 
> 
>       On Thu, 15 Dec 2022, Vipul Suneja wrote:
>       > Hi Stefano,
>       >
>       > Thanks!
>       >
>       > I could see QEMU 6.2.0 compiled & installed in the host image xen-image-minimal. I could find xenfb.c source file also &
>       modified the same
>       > with debug logs.
>       > I have set up a cross compile environment, did 'make clean' & 'make all' to recompile but it's failing. In case i am doing
>       wrong, Can you
>       > please assist me
>       > with the correct steps to compile qemu? Below are the error logs:
>       >
>       >
>       agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/work/cortexa72-poky-linux/qemu/6.2.0-r0/build$
>       make
>       > all
>       > [1/3864] Compiling C object libslirp.a.p/slirp_src_arp_table.c.o
>       > [2/3864] Compiling C object subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o
>       > [3/3864] Linking static target subprojects/libvhost-user/libvhost-user.a
>       > [4/3864] Compiling C object libslirp.a.p/slirp_src_vmstate.c.o
>       > [5/3864] Compiling C object libslirp.a.p/slirp_src_dhcpv6.c.o
>       > [6/3864] Compiling C object libslirp.a.p/slirp_src_dnssearch.c.o
>       > [7/3864] Compiling C object libslirp.a.p/slirp_src_bootp.c.o
>       > [8/3864] Compiling C object libslirp.a.p/slirp_src_cksum.c.o
>       > [9/3864] Compiling C object libslirp.a.p/slirp_src_if.c.o
>       > [10/3864] Compiling C object libslirp.a.p/slirp_src_ip6_icmp.c.o
>       > [11/3864] Compiling C object libslirp.a.p/slirp_src_ip6_input.c.o
>       > [12/3864] Compiling C object libslirp.a.p/slirp_src_ip6_output.c.o
>       > [13/3864] Compiling C object libslirp.a.p/slirp_src_ip_icmp.c.o
>       > [14/3864] Compiling C object libslirp.a.p/slirp_src_ip_input.c.o
>       > [15/3864] Compiling C object libslirp.a.p/slirp_src_ip_output.c.o
>       > [16/3864] Compiling C object libslirp.a.p/slirp_src_mbuf.c.o
>       > [17/3864] Compiling C object libslirp.a.p/slirp_src_misc.c.o
>       > [18/3864] Compiling C object libslirp.a.p/slirp_src_ncsi.c.o
>       > [19/3864] Compiling C object libslirp.a.p/slirp_src_ndp_table.c.o
>       > [20/3864] Compiling C object libslirp.a.p/slirp_src_sbuf.c.o
>       > [21/3864] Compiling C object libslirp.a.p/slirp_src_slirp.c.o
>       > [22/3864] Compiling C object libslirp.a.p/slirp_src_socket.c.o
>       > [23/3864] Compiling C object libslirp.a.p/slirp_src_state.c.o
>       > [24/3864] Compiling C object libslirp.a.p/slirp_src_stream.c.o
>       > [25/3864] Compiling C object libslirp.a.p/slirp_src_tcp_input.c.o
>       > [26/3864] Compiling C object libslirp.a.p/slirp_src_tcp_output.c.o
>       > [27/3864] Compiling C object libslirp.a.p/slirp_src_tcp_subr.c.o
>       > [28/3864] Compiling C object libslirp.a.p/slirp_src_tcp_timer.c.o
>       > [29/3864] Compiling C object libslirp.a.p/slirp_src_tftp.c.o
>       > [30/3864] Compiling C object libslirp.a.p/slirp_src_udp.c.o
>       > [31/3864] Compiling C object libslirp.a.p/slirp_src_udp6.c.o
>       > [32/3864] Compiling C object libslirp.a.p/slirp_src_util.c.o
>       > [33/3864] Compiling C object libslirp.a.p/slirp_src_version.c.o
>       > [34/3864] Linking static target libslirp.a
>       > [35/3864] Generating qemu-version.h with a custom command (wrapped by meson to capture output)
>       > FAILED: qemu-version.h
>       >/home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/work/cortexa72-poky-linux/qemu/6.2.0-r0/recipe-sysroot-native/usr
>       
>       > /bin/meson --internal exe --capture qemu-version.h--/home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/work/cortexa72-poky-linux/qemu/6.2.0-r0/qemu-6.2.0/scripts/qemu
>       -v
>       > ersion.sh
>       /home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/work/cortexa72-poky-linux/qemu/6.2.0-r0/qemu-6.2.0 ''
>       > 6.2.0
>       > /usr/bin/env: ‘nativepython3’: No such file or directory
>       > ninja: build stopped: subcommand failed.
>       > make: *** [Makefile:162: run-ninja] Error 1
>       >
>       > Thanks & Regards,
>       > Vipul Kumar
>       >
>       > On Wed, Dec 14, 2022 at 4:55 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       Hi Vipul,
>       >
>       >       Good progress! The main function we should check is "xenfb_refresh" but
>       >       from the logs it looks like it is called several times. Which means that
>       >       everything seems to be working as expected on the Linux side.
>       >
>       >       It is time to investigate the QEMU side:
>       >       ./hw/display/xenfb.c:xenfb_handle_events
>       >       ./hw/display/xenfb.c:xenfb_map_fb
>       >
>       >       I wonder if the issue is internal to QEMU. You might want to use an
>       >       older QEMU version to check if it works, maybe 6.0 or 5.0 or even 4.0.
>       >       I also wonder if it is a problem between xenfb.c and the rest of QEMU. I
>       >       would investigate how xenfb->pixels is rendered by the rest of QEMU.
>       >       Specifically you might want to look at the call to
>       >       qemu_create_displaysurface, qemu_create_displaysurface_from and
>       >       dpy_gfx_replace_surface in xenfb_update.
>       >
>       >       I hope this helps.
>       >
>       >       Cheers,
>       >
>       >       Stefano
>       >
>       >
>       >       On Tue, 13 Dec 2022, Vipul Suneja wrote:
>       >       > Hi Stefano,
>       >       >
>       >       > Thanks!
>       >       >
>       >       > I modified xen-fbfront.c source file, included printk debug logs & cross compiled it. I included the printk debug log
>       at the
>       >       entry & exit
>       >       > of all functions of xen-fbfront.c file.
>       >       > Generated kernel module & loaded in guest machine at bootup. I could see lots of logs coming up, and could see
>       multiple
>       >       functions being
>       >       > invoked even if I have not used vncviewer in the host. Attaching the log file for reference. Any specific function or
>       >       parameters that have
>       >       > to be checked or any other suggestion as per logs?
>       >       >
>       >       > Thanks & Regards,
>       >       > Vipul Kumar
>       >       >
>       >       > On Tue, Dec 13, 2022 at 3:44 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       Hi Vipul,
>       >       >
>       >       >       I am online on IRC OFTC #xendevel (https://www.oftc.net/, you need a
>       >       >       registered nickname to join #xendevel).
>       >       >
>       >       >       For development and debugging I find that it is a lot easier to
>       >       >       crosscompile the kernel "by hand", and do a monolithic build, rather
>       >       >       than going through Yocto.
>       >       >
>       >       >       For instance the following builds for me:
>       >       >
>       >       >       cd linux.git
>       >       >       export ARCH=arm64
>       >       >       export CROSS_COMPILE=/path/to/cross-compiler
>       >       >       make defconfig
>       >       >       [add printks to drivers/video/fbdev/xen-fbfront.c]
>       >       >       make -j8 Image.gz
>       >       >
>       >       >       And Image.gz boots on Xen as DomU kernel without issues.
>       >       >
>       >       >       Cheers,
>       >       >
>       >       >       Stefano
>       >       >
>       >       >       On Sat, 10 Dec 2022, Vipul Suneja wrote:
>       >       >       > Hi Stefano,
>       >       >       >
>       >       >       > Thanks!
>       >       >       >
>       >       >       > I have included printk debug logs in the xen-fbfront.c source file. While cross compiling to generate .ko
>       with
>       >       >       "xen-guest-image-minimal"
>       >       >       > toolchain it's throwing a modpost
>       >       >       > not found error. I could see the modpost.c source file but the final script is missing. Any input on this,
>       Below are
>       >       the
>       >       >       logs:
>       >       >       >
>       >       >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer$ make
>       >       >       > make ARCH=arm64 -I/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/usr/include/asm -C
>       >       >       > /opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-standard/build
>       >       >       > M=/home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer modules
>       >       >       > make[1]: Entering directory
>       '/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-standard/build'
>       >       >       > arch/arm64/Makefile:36: Detected assembler with broken .inst; disassembly will be unreliable
>       >       >       > warning: the compiler differs from the one used to build the kernel
>       >       >       >   The kernel was built by: gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>       >       >       >   You are using:           aarch64-poky-linux-gcc (GCC) 11.3.0
>       >       >       >   CC [M]  /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer/xen-fbfront.o
>       >       >       >   MODPOST /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer/Module.symvers
>       >       >       > /bin/sh: 1: scripts/mod/modpost: not found
>       >       >       > make[2]: *** [scripts/Makefile.modpost:133:
>       >       >       /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer/Module.symvers]
>       >       >       > Error 127
>       >       >       > make[1]: *** [Makefile:1813: modules] Error 2
>       >       >       > make[1]: Leaving directory
>       '/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-standard/build'
>       >       >       > make: *** [Makefile:5: all] Error 2
>       >       >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer$ ls -l
>       >       >       > total 324
>       >       >       > -rwxrwxrwx 1 agl agl    359 Dec 10 22:41 Makefile
>       >       >       > -rw-rw-r-- 1 agl agl     90 Dec 10 22:49 modules.order
>       >       >       > -rw-r--r-- 1 agl agl  18331 Dec  1 20:32 xen-fbfront.c
>       >       >       > -rw-rw-r-- 1 agl agl     90 Dec 10 22:49 xen-fbfront.mod
>       >       >       > -rw-rw-r-- 1 agl agl 297832 Dec 10 22:49 xen-fbfront.o
>       >       >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer$ file xen-fbfront.o
>       >       >       > xen-fbfront.o: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV), with debug_info, not stripped
>       >       >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer$
>       >       >       >
>       >       >       > I have connected a HDMI based 1980x1024 resolution display screen to raspberrypi4 for testing purposes. I
>       hope
>       >       connecting
>       >       >       this display to
>       >       >       > rpi4 should be ok.
>       >       >       >
>       >       >       > Is there any other way we can connect also for detailed discussion on the display bringup issue? This will
>       really
>       >       help to
>       >       >       resolve this
>       >       >       > issue.
>       >       >       >
>       >       >       > Thanks & Regards,
>       >       >       > Vipul Kumar
>       >       >       >
>       >       >       > On Fri, Dec 2, 2022 at 1:02 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       >       On Thu, 1 Dec 2022, Vipul Suneja wrote:
>       >       >       >       > Hi Stefano,
>       >       >       >       > Thanks!
>       >       >       >       >
>       >       >       >       > I am exploring both options here, modification of framebuffer source file & setting up x11vnc server
>       in
>       >       guest.
>       >       >       >       > Other than these I would like to share a few findings with you.
>       >       >       >       >
>       >       >       >       > 1. If i keep "CONFIG_XEN_FBDEV_FRONTEND=y" then xen-fbfront.ko is not generating but if i keep
>       >       >       "CONFIG_XEN_FBDEV_FRONTEND=m"
>       >       >       >       > then could see xen-fbfront.ko & its loading also. Same things with other frontend/backend drivers
>       also. Do we
>       >       need to
>       >       >       >       configure these
>       >       >       >       > drivers as a module(m) only?
>       >       >       >
>       >       >       >       xen-fbfront should work both as a module (xen-fbfront.ko) or built-in
>       >       >       >       (CONFIG_XEN_FBDEV_FRONTEND=y).
>       >       >       >
>       >       >       >
>       >       >       >
>       >       >       >       > 2. I could see xenstored service is running for the host but it's always failing for the
>       guest machine. I
>       >       could see
>       >       >       it in
>       >       >       >       bootup logs & via
>       >       >       >       > systemctl status also.
>       >       >       >
>       >       >       >       That is normal. xenstored is only meant to be run in Dom0, not in the
>       >       >       >       domUs. If you use the same rootfs for Dom0 and DomU then xenstored will
>       >       >       >       fail starting in the DomU (but should succeed in Dom0), which is what we
>       >       >       >       want.
>       >       >       >
>       >       >       >       If you run "xenstore-ls" in Dom0, you'll see a bunch of entries,
>       >       >       >       including some of them related to "vfb" which is the virtual framebuffer
>       >       >       >       protocol. You should also see an entry called "state" set to "4" which
>       >       >       >       means "connected". state = 4 is usually when everything works. Normally
>       >       >       >       when things don't work state != 4.
>       >       >       >
>       >       >       >
>       >       >       >
>       >       >       >       > Below are the logs:
>       >       >       >       > [  OK  ] Reached target Basic System.
>       >       >       >       > [  OK  ] Started Kernel Logging Service.
>       >       >       >       > [  OK  ] Started System Logging Service.
>       >       >       >       >          Starting D-Bus System Message Bus...
>       >       >       >       >          Starting User Login Management...
>       >       >       >       >          Starting Permit User Sessions...
>       >       >       >       >          Starting The Xen xenstore...
>       >       >       >       >          Starting OpenSSH Key Generation...
>       >       >       >       > [FAILED] Failed to start The Xen xenstore.
>       >       >       >       > See 'systemctl status xenstored.service' for details.
>       >       >       >       > [DEPEND] Dependency failed for qemu for xen dom0 disk backend.
>       >       >       >       > [DEPEND] Dependency failed for Xend…p guests on boot and shutdown.
>       >       >       >       > [DEPEND] Dependency failed for xen-…des, JSON configuration stub).
>       >       >       >       > [DEPEND] Dependency failed for Xenc…guest consoles and hypervisor.
>       >       >       >       > [  OK  ] Finished Permit User Sessions.
>       >       >       >       > [  OK  ] Started Getty on tty1.
>       >       >       >       > [  OK  ] Started Serial Getty on hvc0.
>       >       >       >       > [  OK  ] Started Serial Getty on ttyS0.
>       >       >       >       > [  OK  ] Reached target Login Prompts.
>       >       >       >       >          Starting Xen-watchdog - run xen watchdog daemon...
>       >       >       >       > [  OK  ] Started D-Bus System Message Bus.
>       >       >       >       > [  OK  ] Started Xen-watchdog - run xen watchdog daemon.
>       >       >       >       > [  OK  ] Finished OpenSSH Key Generation.
>       >       >       >       > [  OK  ] Started User Login Management.
>       >       >       >       > [  OK  ] Reached target Multi-User System.
>       >       >       >       >          Starting Record Runlevel Change in UTMP...
>       >       >       >       > [  OK  ] Finished Record Runlevel Change in UTMP.
>       >       >       >       > fbcon: Taking over console
>       >       >       >       >
>       >       >       >       > Poky (Yocto Project Reference Distro) 4.0.4 raspberrypi4-64 hvc0
>       >       >       >       >
>       >       >       >       > raspberrypi4-64 login: root
>       >       >       >       > root@raspberrypi4-64:~#
>       >       >       >       > root@raspberrypi4-64:~#
>       >       >       >       > root@raspberrypi4-64:~# systemctl status xenstored.service
>       >       >       >       > x xenstored.service - The Xen xenstore
>       >       >       >       >      Loaded: loaded (/lib/systemd/system/xenstored.service; enabled; vendor preset: enabled)
>       >       >       >       >      Active: failed (Result: exit-code) since Thu 2022-12-01 06:12:05 UTC; 26s ago
>       >       >       >       >     Process: 195 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities (code=exited,
>       status=1/FAILURE)
>       >       >       >       >
>       >       >       >       > Dec 01 06:12:04 raspberrypi4-64 systemd[1]: Starting The Xen xenstore...
>       >       >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: xenstored.service: Control pro...URE
>       >       >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: xenstored.service: Failed with...e'.
>       >       >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: Failed to start The Xen xenstore.
>       >       >       >       > Hint: Some lines were ellipsized, use -l to show in full.
>       >       >       >       > root@raspberrypi4-64:~# 
>       >       >       >       >
>       >       >       >       > Any input on these?
>       >       >       >       >
>       >       >       >       > Thanks & Regards,
>       >       >       >       > Vipul Kumar
>       >       >       >       >
>       >       >       >       > On Wed, Nov 23, 2022 at 5:41 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       >       >       Hi Vipul,
>       >       >       >       >
>       >       >       >       >       I cannot spot any issue in the configuration, in particual you have:
>       >       >       >       >
>       >       >       >       >       CONFIG_XEN_FBDEV_FRONTEND=y
>       >       >       >       >
>       >       >       >       >       which is what you need.
>       >       >       >       >
>       >       >       >       >       The only thing I can suggest is to add printks to the Linux frontend
>       >       >       >       >       driver (the one running in the domU) which is
>       >       >       >       >       drivers/video/fbdev/xen-fbfront.c and printfs to the QEMU backend
>       >       >       >       >       (running in Dom0) which is hw/display/xenfb.c to figure out what is
>       >       >       >       >       going on.
>       >       >       >       >
>       >       >       >       >
>       >       >       >       >       Alternatively, you can setup PV network with the domU, such as:
>       >       >       >       >
>       >       >       >       >         vif=['']
>       >       >       >       >
>       >       >       >       >       and then run x11 and a x11vnc server in your domU. You should be able to
>       >       >       >       >       connect to it using vncviewer at the network IP of your domU.
>       >       >       >       >
>       >       >       >       >       Basically you are skipping the problem because instead of using the PV
>       >       >       >       >       framebuffer protocol, you just use VNC over the network with the domU.
>       >       >       >       >
>       >       >       >       >
>       >       >       >       >       Cheers,
>       >       >       >       >
>       >       >       >       >       Stefano
>       >       >       >       >
>       >       >       >       >
>       >       >       >       >       On Tue, 22 Nov 2022, Vipul Suneja wrote:
>       >       >       >       >       > Hi Stefano,
>       >       >       >       >       > Thanks for the support!
>       >       >       >       >       >
>       >       >       >       >       > Looks like I have tried all the combinations & possible ways to get display up but failed. Is
>       there
>       >       any
>       >       >       document or
>       >       >       >       pdf for
>       >       >       >       >       porting xen on
>       >       >       >       >       > raspberrypi4.
>       >       >       >       >       > I could find lot's of links telling the same but couldn't see any official user guide or
>       document
>       >       from the
>       >       >       xen
>       >       >       >       community on
>       >       >       >       >       the same. If
>       >       >       >       >       > there is something to refer 
>       >       >       >       >       > to please share with me.
>       >       >       >       >       > I am attaching the kernel configuration file also, just take a look if i have missed
>       anything.
>       >       >       >       >       > Any other suggestions or input from your end could be really helpful?
>       >       >       >       >       >
>       >       >       >       >       > Regards,
>       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >
>       >       >       >       >       > On Fri, Nov 11, 2022 at 6:40 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       >       >       >       Hi Vipul,
>       >       >       >       >       >
>       >       >       >       >       >       Sorry for the late reply. From the earlier logs that you sent, it looks
>       >       >       >       >       >       like everything should be working correctly. Specifically:
>       >       >       >       >       >
>       >       >       >       >       >            vfb = ""
>       >       >       >       >       >             1 = ""
>       >       >       >       >       >              0 = ""
>       >       >       >       >       >               frontend = "/local/domain/1/device/vfb/0"
>       >       >       >       >       >               frontend-id = "1"
>       >       >       >       >       >               online = "1"
>       >       >       >       >       >               state = "4"
>       >       >       >       >       >               vnc = "1"
>       >       >       >       >       >               vnclisten = "127.0.0.1"
>       >       >       >       >       >               vncdisplay = "0"
>       >       >       >       >       >               vncunused = "1"
>       >       >       >       >       >               sdl = "0"
>       >       >       >       >       >               opengl = "0"
>       >       >       >       >       >               feature-resize = "1"
>       >       >       >       >       >               hotplug-status = "connected"
>       >       >       >       >       >               request-update = "1"
>       >       >       >       >       >
>       >       >       >       >       >       state "4" means "connected". So I would expect that you should be able
>       >       >       >       >       >       to connect to the vnc server using vncviewer. You might not see anything
>       >       >       >       >       >       (black screen) but you should definitely be able to connect.
>       >       >       >       >       >
>       >       >       >       >       >       I wouldn't try to launch x11 in the guest just yet. fbcon in Linux is
>       >       >       >       >       >       enough to render something on the screen. You should be able to see the
>       >       >       >       >       >       Linux text-based console rendered graphically, connecting to it via vnc.
>       >       >       >       >       >
>       >       >       >       >       >       Sorry for the basic question, but have you tried all the following?
>       >       >       >       >       >
>       >       >       >       >       >       vncviewer 127.0.0.1:0
>       >       >       >       >       >       vncviewer 127.0.0.1:1
>       >       >       >       >       >       vncviewer 127.0.0.1:2
>       >       >       >       >       >       vncviewer 127.0.0.1:5900
>       >       >       >       >       >       vncviewer 127.0.0.1:5901
>       >       >       >       >       >       vncviewer 127.0.0.1:5902
>       >       >       >       >       >
>       >       >       >       >       >       Given that from the xenstore-ls logs everything seems to work correctly
>       >       >       >       >       >       I am not sure what else to suggest. You might have to add printf to QEMU
>       >       >       >       >       >       ui/vnc.c and hw/display/xenfb.c to see what is going wrong.
>       >       >       >       >       >
>       >       >       >       >       >       Cheers,
>       >       >       >       >       >
>       >       >       >       >       >       Stefano
>       >       >       >       >       >
>       >       >       >       >       >
>       >       >       >       >       >       On Mon, 7 Nov 2022, Vipul Suneja wrote:
>       >       >       >       >       >       > Hi Stefano,
>       >       >       >       >       >       > Thanks!
>       >       >       >       >       >       >
>       >       >       >       >       >       > Any input further on "xenstore-ls" logs?
>       >       >       >       >       >       >
>       >       >       >       >       >       > I am trying to run the x0vncserver & x11vnc server manually on guest
>       >       machine(xen_guest_image_minimal)
>       >       >       image
>       >       >       >       but it's
>       >       >       >       >       failing
>       >       >       >       >       >       with the below
>       >       >       >       >       >       > error.
>       >       >       >       >       >       >
>       >       >       >       >       >       > root@raspberrypi4-64:/usr/bin# x0vncserver
>       >       >       >       >       >       > x0vncserver: unable to open display ""
>       >       >       >       >       >       > root@raspberrypi4-64:/usr/bin#
>       >       >       >       >       >       > root@raspberrypi4-64:/usr/bin# x11vnc
>       >       >       >       >       >       > ###############################################################
>       >       >       >       >       >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  **  WARNING  **  WARNING  **  WARNING  **  WARNING  **   @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@        YOU ARE RUNNING X11VNC WITHOUT A PASSWORD!!        @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  This means anyone with network access to this computer   @#
>       >       >       >       >       >       > #@  may be able to view and control your desktop.            @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@ >>> If you did not mean to do this Press CTRL-C now!! <<< @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  You can create an x11vnc password file by running:       @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@       x11vnc -storepasswd password /path/to/passfile      @#
>       >       >       >       >       >       > #@  or   x11vnc -storepasswd /path/to/passfile               @#
>       >       >       >       >       >       > #@  or   x11vnc -storepasswd                                 @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  (the last one will use ~/.vnc/passwd)                    @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  and then starting x11vnc via:                            @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@      x11vnc -rfbauth /path/to/passfile                    @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  an existing ~/.vnc/passwd file from another VNC          @#
>       >       >       >       >       >       > #@  application will work fine too.                          @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  You can also use the -passwdfile or -passwd options.     @#
>       >       >       >       >       >       > #@  (note -passwd is unsafe if local users are not trusted)  @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  Make sure any -rfbauth and -passwdfile password files    @#
>       >       >       >       >       >       > #@  cannot be read by untrusted users.                       @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  Use x11vnc -usepw to automatically use your              @#
>       >       >       >       >       >       > #@  ~/.vnc/passwd or ~/.vnc/passwdfile password files.       @#
>       >       >       >       >       >       > #@  (and prompt you to create ~/.vnc/passwd if neither       @#
>       >       >       >       >       >       > #@  file exists.)  Under -usepw, x11vnc will exit if it      @#
>       >       >       >       >       >       > #@  cannot find a password to use.                           @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  Even with a password, the subsequent VNC traffic is      @#
>       >       >       >       >       >       > #@  sent in the clear.  Consider tunnelling via ssh(1):      @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@    http://www.karlrunge.com/x11vnc/#tunnelling            @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  Or using the x11vnc SSL options: -ssl and -stunnel       @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  Please Read the documentation for more info about        @#
>       >       >       >       >       >       > #@  passwords, security, and encryption.                     @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@    http://www.karlrunge.com/x11vnc/faq.html#faq-passwd    @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@  To disable this warning use the -nopw option, or put     @#
>       >       >       >       >       >       > #@  'nopw' on a line in your ~/.x11vncrc file.               @#
>       >       >       >       >       >       > #@                                                           @#
>       >       >       >       >       >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
>       >       >       >       >       >       > ###############################################################
>       >       >       >       >       >       > 09/03/2018 12:58:41 x11vnc version: 0.9.16 lastmod: 2019-01-05  pid: 424
>       >       >       >       >       >       > 09/03/2018 12:58:41 XOpenDisplay("") failed.
>       >       >       >       >       >       > 09/03/2018 12:58:41 Trying again with XAUTHLOCALHOSTNAME=localhost ...
>       >       >       >       >       >       > 09/03/2018 12:58:41
>       >       >       >       >       >       > 09/03/2018 12:58:41 *** XOpenDisplay failed. No -display or DISPLAY.
>       >       >       >       >       >       > 09/03/2018 12:58:41 *** Trying ":0" in 4 seconds.  Press Ctrl-C to abort.
>       >       >       >       >       >       > 09/03/2018 12:58:41 *** 1 2 3 4
>       >       >       >       >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
>       >       >       >       >       >       > 09/03/2018 12:58:45 Trying again with XAUTHLOCALHOSTNAME=localhost ...
>       >       >       >       >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
>       >       >       >       >       >       > 09/03/2018 12:58:45 Trying again with unset XAUTHLOCALHOSTNAME ...
>       >       >       >       >       >       > 09/03/2018 12:58:45
>       >       >       >       >       >       >
>       >       >       >       >       >       > 09/03/2018 12:58:45 ***************************************
>       >       >       >       >       >       > 09/03/2018 12:58:45 *** XOpenDisplay failed (:0)
>       >       >       >       >       >       >
>       >       >       >       >       >       > *** x11vnc was unable to open the X DISPLAY: ":0", it cannot continue.
>       >       >       >       >       >       > *** There may be "Xlib:" error messages above with details about the failure.
>       >       >       >       >       >       >
>       >       >       >       >       >       > Some tips and guidelines:
>       >       >       >       >       >       >
>       >       >       >       >       >       > ** An X server (the one you wish to view) must be running before x11vnc is
>       >       >       >       >       >       >    started: x11vnc does not start the X server.  (however, see the -create
>       >       >       >       >       >       >    option if that is what you really want).
>       >       >       >       >       >       >
>       >       >       >       >       >       > ** You must use -display <disp>, -OR- set and export your $DISPLAY
>       >       >       >       >       >       >    environment variable to refer to the display of the desired X server.
>       >       >       >       >       >       >  - Usually the display is simply ":0" (in fact x11vnc uses this if you forget
>       >       >       >       >       >       >    to specify it), but in some multi-user situations it could be ":1", ":2",
>       >       >       >       >       >       >    or even ":137".  Ask your administrator or a guru if you are having
>       >       >       >       >       >       >    difficulty determining what your X DISPLAY is.
>       >       >       >       >       >       >
>       >       >       >       >       >       > ** Next, you need to have sufficient permissions (Xauthority)
>       >       >       >       >       >       >    to connect to the X DISPLAY.   Here are some Tips:
>       >       >       >       >       >       >
>       >       >       >       >       >       >  - Often, you just need to run x11vnc as the user logged into the X session.
>       >       >       >       >       >       >    So make sure to be that user when you type x11vnc.
>       >       >       >       >       >       >  - Being root is usually not enough because the incorrect MIT-MAGIC-COOKIE
>       >       >       >       >       >       >    file may be accessed.  The cookie file contains the secret key that
>       >       >       >       >       >       >    allows x11vnc to connect to the desired X DISPLAY.
>       >       >       >       >       >       >  - You can explicitly indicate which MIT-MAGIC-COOKIE file should be used
>       >       >       >       >       >       >    by the -auth option, e.g.:
>       >       >       >       >       >       >        x11vnc -auth /home/someuser/.Xauthority -display :0
>       >       >       >       >       >       >        x11vnc -auth /tmp/.gdmzndVlR -display :0
>       >       >       >       >       >       >    you must have read permission for the auth file.
>       >       >       >       >       >       >    See also '-auth guess' and '-findauth' discussed below.
>       >       >       >       >       >       >
>       >       >       >       >       >       > ** If NO ONE is logged into an X session yet, but there is a greeter login
>       >       >       >       >       >       >    program like "gdm", "kdm", "xdm", or "dtlogin" running, you will need
>       >       >       >       >       >       >    to find and use the raw display manager MIT-MAGIC-COOKIE file.
>       >       >       >       >       >       >    Some examples for various display managers:
>       >       >       >       >       >       >
>       >       >       >       >       >       >      gdm:     -auth /var/gdm/:0.Xauth
>       >       >       >       >       >       >               -auth /var/lib/gdm/:0.Xauth
>       >       >       >       >       >       >      kdm:     -auth /var/lib/kdm/A:0-crWk72
>       >       >       >       >       >       >               -auth /var/run/xauth/A:0-crWk72
>       >       >       >       >       >       >      xdm:     -auth /var/lib/xdm/authdir/authfiles/A:0-XQvaJk
>       >       >       >       >       >       >      dtlogin: -auth /var/dt/A:0-UgaaXa
>       >       >       >       >       >       >
>       >       >       >       >       >       >    Sometimes the command "ps wwwwaux | grep auth" can reveal the file location.
>       >       >       >       >       >       >
>       >       >       >       >       >       >    Starting with x11vnc 0.9.9 you can have it try to guess by using:
>       >       >       >       >       >       >
>       >       >       >       >       >       >               -auth guess
>       >       >       >       >       >       >
>       >       >       >       >       >       >    (see also the x11vnc -findauth option.)
>       >       >       >       >       >       >
>       >       >       >       >       >       >    Only root will have read permission for the file, and so x11vnc must be run
>       >       >       >       >       >       >    as root (or copy it).  The random characters in the filenames will of course
>       >       >       >       >       >       >    change and the directory the cookie file resides in is system dependent.
>       >       >       >       >       >       >
>       >       >       >       >       >       > See also: http://www.karlrunge.com/x11vnc/faq.html
>       >       >       >       >       >       >
>       >       >       >       >       >       > Regards,
>       >       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >       >
>       >       >       >       >       >       > On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja <vsuneja63@gmail.com> wrote:
>       >       >       >       >       >       >       Hi Stefano,
>       >       >       >       >       >       > Thanks!
>       >       >       >       >       >       >
>       >       >       >       >       >       > I used xen-guest-image-minimal(simple console based image) as a guest with fbcon &
>       fbdev
>       >       enabled in
>       >       >       kernel
>       >       >       >       >       configurations but
>       >       >       >       >       >       still
>       >       >       >       >       >       > the same error can't open the display.
>       >       >       >       >       >       > below are the outcome of "xenstore-ls":
>       >       >       >       >       >       >
>       >       >       >       >       >       > root@raspberrypi4-64:~/guest1# xenstore-ls
>       >       >       >       >       >       > tool = ""
>       >       >       >       >       >       >  xenstored = ""
>       >       >       >       >       >       > local = ""
>       >       >       >       >       >       >  domain = ""
>       >       >       >       >       >       >   0 = ""
>       >       >       >       >       >       >    control = ""
>       >       >       >       >       >       >     feature-poweroff = "1"
>       >       >       >       >       >       >     feature-reboot = "1"
>       >       >       >       >       >       >    domid = "0"
>       >       >       >       >       >       >    name = "Domain-0"
>       >       >       >       >       >       >    device-model = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      backends = ""
>       >       >       >       >       >       >       console = ""
>       >       >       >       >       >       >       vkbd = ""
>       >       >       >       >       >       >       vfb = ""
>       >       >       >       >       >       >       qnic = ""
>       >       >       >       >       >       >      state = "running"
>       >       >       >       >       >       >     1 = ""
>       >       >       >       >       >       >      backends = ""
>       >       >       >       >       >       >       console = ""
>       >       >       >       >       >       >       vkbd = ""
>       >       >       >       >       >       >       vfb = ""
>       >       >       >       >       >       >       qnic = ""
>       >       >       >       >       >       >      state = "running"
>       >       >       >       >       >       >    backend = ""
>       >       >       >       >       >       >     vbd = ""
>       >       >       >       >       >       >      1 = ""
>       >       >       >       >       >       >       51712 = ""
>       >       >       >       >       >       >        frontend = "/local/domain/1/device/vbd/51712"
>       >       >       >       >       >       >        params = "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
>       >       >       >       >       >       >        script = "/etc/xen/scripts/block"
>       >       >       >       >       >       >        frontend-id = "1"
>       >       >       >       >       >       >        online = "1"
>       >       >       >       >       >       >        removable = "0"
>       >       >       >       >       >       >        bootable = "1"
>       >       >       >       >       >       >        state = "4"
>       >       >       >       >       >       >        dev = "xvda"
>       >       >       >       >       >       >        type = "phy"
>       >       >       >       >       >       >        mode = "w"
>       >       >       >       >       >       >        device-type = "disk"
>       >       >       >       >       >       >        discard-enable = "1"
>       >       >       >       >       >       >        feature-max-indirect-segments = "256"
>       >       >       >       >       >       >        multi-queue-max-queues = "4"
>       >       >       >       >       >       >        max-ring-page-order = "4"
>       >       >       >       >       >       >        node = "/dev/loop0"
>       >       >       >       >       >       >        physical-device = "7:0"
>       >       >       >       >       >       >        physical-device-path = "/dev/loop0"
>       >       >       >       >       >       >        hotplug-status = "connected"
>       >       >       >       >       >       >        feature-flush-cache = "1"
>       >       >       >       >       >       >        discard-granularity = "4096"
>       >       >       >       >       >       >        discard-alignment = "0"
>       >       >       >       >       >       >        discard-secure = "0"
>       >       >       >       >       >       >        feature-discard = "1"
>       >       >       >       >       >       >        feature-barrier = "1"
>       >       >       >       >       >       >        feature-persistent = "1"
>       >       >       >       >       >       >        sectors = "1794048"
>       >       >       >       >       >       >        info = "0"
>       >       >       >       >       >       >        sector-size = "512"
>       >       >       >       >       >       >        physical-sector-size = "512"
>       >       >       >       >       >       >     vfb = ""
>       >       >       >       >       >       >      1 = ""
>       >       >       >       >       >       >       0 = ""
>       >       >       >       >       >       >        frontend = "/local/domain/1/device/vfb/0"
>       >       >       >       >       >       >        frontend-id = "1"
>       >       >       >       >       >       >        online = "1"
>       >       >       >       >       >       >        state = "4"
>       >       >       >       >       >       >        vnc = "1"
>       >       >       >       >       >       >        vnclisten = "127.0.0.1"
>       >       >       >       >       >       >        vncdisplay = "0"
>       >       >       >       >       >       >        vncunused = "1"
>       >       >       >       >       >       >        sdl = "0"
>       >       >       >       >       >       >        opengl = "0"
>       >       >       >       >       >       >        feature-resize = "1"
>       >       >       >       >       >       >        hotplug-status = "connected"
>       >       >       >       >       >       >        request-update = "1"
>       >       >       >       >       >       >     vkbd = ""
>       >       >       >       >       >       >      1 = ""
>       >       >       >       >       >       >       0 = ""
>       >       >       >       >       >       >        frontend = "/local/domain/1/device/vkbd/0"
>       >       >       >       >       >       >        frontend-id = "1"
>       >       >       >       >       >       >        online = "1"
>       >       >       >       >       >       >        state = "4"
>       >       >       >       >       >       >        feature-abs-pointer = "1"
>       >       >       >       >       >       >        feature-raw-pointer = "1"
>       >       >       >       >       >       >        hotplug-status = "connected"
>       >       >       >       >       >       >     console = ""
>       >       >       >       >       >       >      1 = ""
>       >       >       >       >       >       >       0 = ""
>       >       >       >       >       >       >        frontend = "/local/domain/1/console"
>       >       >       >       >       >       >        frontend-id = "1"
>       >       >       >       >       >       >        online = "1"
>       >       >       >       >       >       >        state = "1"
>       >       >       >       >       >       >        protocol = "vt100"
>       >       >       >       >       >       >     vif = ""
>       >       >       >       >       >       >      1 = ""
>       >       >       >       >       >       >       0 = ""
>       >       >       >       >       >       >        frontend = "/local/domain/1/device/vif/0"
>       >       >       >       >       >       >        frontend-id = "1"
>       >       >       >       >       >       >        online = "1"
>       >       >       >       >       >       >        state = "4"
>       >       >       >       >       >       >        script = "/etc/xen/scripts/vif-bridge"
>       >       >       >       >       >       >        mac = "e4:5f:01:cd:7b:dd"
>       >       >       >       >       >       >        bridge = "xenbr0"
>       >       >       >       >       >       >        handle = "0"
>       >       >       >       >       >       >        type = "vif"
>       >       >       >       >       >       >        hotplug-status = "connected"
>       >       >       >       >       >       >        feature-sg = "1"
>       >       >       >       >       >       >        feature-gso-tcpv4 = "1"
>       >       >       >       >       >       >        feature-gso-tcpv6 = "1"
>       >       >       >       >       >       >        feature-ipv6-csum-offload = "1"
>       >       >       >       >       >       >        feature-rx-copy = "1"
>       >       >       >       >       >       >        feature-xdp-headroom = "1"
>       >       >       >       >       >       >        feature-rx-flip = "0"
>       >       >       >       >       >       >        feature-multicast-control = "1"
>       >       >       >       >       >       >        feature-dynamic-multicast-control = "1"
>       >       >       >       >       >       >        feature-split-event-channels = "1"
>       >       >       >       >       >       >        multi-queue-max-queues = "4"
>       >       >       >       >       >       >        feature-ctrl-ring = "1"
>       >       >       >       >       >       >   1 = ""
>       >       >       >       >       >       >    vm = "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
>       >       >       >       >       >       >    name = "guest2"
>       >       >       >       >       >       >    cpu = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      availability = "online"
>       >       >       >       >       >       >     1 = ""
>       >       >       >       >       >       >      availability = "online"
>       >       >       >       >       >       >    memory = ""
>       >       >       >       >       >       >     static-max = "2097152"
>       >       >       >       >       >       >     target = "2097152"
>       >       >       >       >       >       >     videoram = "0"
>       >       >       >       >       >       >    device = ""
>       >       >       >       >       >       >     suspend = ""
>       >       >       >       >       >       >      event-channel = ""
>       >       >       >       >       >       >     vbd = ""
>       >       >       >       >       >       >      51712 = ""
>       >       >       >       >       >       >       backend = "/local/domain/0/backend/vbd/1/51712"
>       >       >       >       >       >       >       backend-id = "0"
>       >       >       >       >       >       >       state = "4"
>       >       >       >       >       >       >       virtual-device = "51712"
>       >       >       >       >       >       >       device-type = "disk"
>       >       >       >       >       >       >       multi-queue-num-queues = "2"
>       >       >       >       >       >       >       queue-0 = ""
>       >       >       >       >       >       >        ring-ref = "8"
>       >       >       >       >       >       >        event-channel = "4"
>       >       >       >       >       >       >       queue-1 = ""
>       >       >       >       >       >       >        ring-ref = "9"
>       >       >       >       >       >       >        event-channel = "5"
>       >       >       >       >       >       >       protocol = "arm-abi"
>       >       >       >       >       >       >       feature-persistent = "1"
>       >       >       >       >       >       >     vfb = ""
>       >       >       >       >       >       >      0 = ""
>       >       >       >       >       >       >       backend = "/local/domain/0/backend/vfb/1/0"
>       >       >       >       >       >       >       backend-id = "0"
>       >       >       >       >       >       >       state = "4"
>       >       >       >       >       >       >       page-ref = "275022"
>       >       >       >       >       >       >       event-channel = "3"
>       >       >       >       >       >       >       protocol = "arm-abi"
>       >       >       >       >       >       >       feature-update = "1"
>       >       >       >       >       >       >     vkbd = ""
>       >       >       >       >       >       >      0 = ""
>       >       >       >       >       >       >       backend = "/local/domain/0/backend/vkbd/1/0"
>       >       >       >       >       >       >       backend-id = "0"
>       >       >       >       >       >       >       state = "4"
>       >       >       >       >       >       >       request-abs-pointer = "1"
>       >       >       >       >       >       >       page-ref = "275322"
>       >       >       >       >       >       >       page-gref = "1284"
>       >       >       >       >       >       >       event-channel = "10"
>       >       >       >       >       >       >     vif = ""
>       >       >       >       >       >       >      0 = ""
>       >       >       >       >       >       >       backend = "/local/domain/0/backend/vif/1/0"
>       >       >       >       >       >       >       backend-id = "0"
>       >       >       >       >       >       >       state = "4"
>       >       >       >       >       >       >       handle = "0"
>       >       >       >       >       >       >       mac = "e4:5f:01:cd:7b:dd"
>       >       >       >       >       >       >       mtu = "1500"
>       >       >       >       >       >       >       xdp-headroom = "0"
>       >       >       >       >       >       >       multi-queue-num-queues = "2"
>       >       >       >       >       >       >       queue-0 = ""
>       >       >       >       >       >       >        tx-ring-ref = "1280"
>       >       >       >       >       >       >        rx-ring-ref = "1281"
>       >       >       >       >       >       >        event-channel-tx = "6"
>       >       >       >       >       >       >        event-channel-rx = "7"
>       >       >       >       >       >       >       queue-1 = ""
>       >       >       >       >       >       >        tx-ring-ref = "1282"
>       >       >       >       >       >       >        rx-ring-ref = "1283"
>       >       >       >       >       >       >        event-channel-tx = "8"
>       >       >       >       >       >       >        event-channel-rx = "9"
>       >       >       >       >       >       >       request-rx-copy = "1"
>       >       >       >       >       >       >       feature-rx-notify = "1"
>       >       >       >       >       >       >       feature-sg = "1"
>       >       >       >       >       >       >       feature-gso-tcpv4 = "1"
>       >       >       >       >       >       >       feature-gso-tcpv6 = "1"
>       >       >       >       >       >       >       feature-ipv6-csum-offload = "1"
>       >       >       >       >       >       >    control = ""
>       >       >       >       >       >       >     shutdown = ""
>       >       >       >       >       >       >     feature-poweroff = "1"
>       >       >       >       >       >       >     feature-reboot = "1"
>       >       >       >       >       >       >     feature-suspend = ""
>       >       >       >       >       >       >     sysrq = ""
>       >       >       >       >       >       >     platform-feature-multiprocessor-suspend = "1"
>       >       >       >       >       >       >     platform-feature-xs_reset_watches = "1"
>       >       >       >       >       >       >    data = ""
>       >       >       >       >       >       >    drivers = ""
>       >       >       >       >       >       >    feature = ""
>       >       >       >       >       >       >    attr = ""
>       >       >       >       >       >       >    error = ""
>       >       >       >       >       >       >    domid = "1"
>       >       >       >       >       >       >    store = ""
>       >       >       >       >       >       >     port = "1"
>       >       >       >       >       >       >     ring-ref = "233473"
>       >       >       >       >       >       >    console = ""
>       >       >       >       >       >       >     backend = "/local/domain/0/backend/console/1/0"
>       >       >       >       >       >       >     backend-id = "0"
>       >       >       >       >       >       >     limit = "1048576"
>       >       >       >       >       >       >     type = "xenconsoled"
>       >       >       >       >       >       >     output = "pty"
>       >       >       >       >       >       >     tty = "/dev/pts/1"
>       >       >       >       >       >       >     port = "2"
>       >       >       >       >       >       >     ring-ref = "233472"
>       >       >       >       >       >       >     vnc-listen = "127.0.0.1"
>       >       >       >       >       >       >     vnc-port = "5900"
>       >       >       >       >       >       >    image = ""
>       >       >       >       >       >       >     device-model-pid = "788"
>       >       >       >       >       >       > vm = ""
>       >       >       >       >       >       >  d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f = ""
>       >       >       >       >       >       >   name = "guest2"
>       >       >       >       >       >       >   uuid = "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
>       >       >       >       >       >       >   start_time = "1520600274.27"
>       >       >       >       >       >       > libxl = ""
>       >       >       >       >       >       >  1 = ""
>       >       >       >       >       >       >   device = ""
>       >       >       >       >       >       >    vbd = ""
>       >       >       >       >       >       >     51712 = ""
>       >       >       >       >       >       >      frontend = "/local/domain/1/device/vbd/51712"
>       >       >       >       >       >       >      backend = "/local/domain/0/backend/vbd/1/51712"
>       >       >       >       >       >       >      params = "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
>       >       >       >       >       >       >      script = "/etc/xen/scripts/block"
>       >       >       >       >       >       >      frontend-id = "1"
>       >       >       >       >       >       >      online = "1"
>       >       >       >       >       >       >      removable = "0"
>       >       >       >       >       >       >      bootable = "1"
>       >       >       >       >       >       >      state = "1"
>       >       >       >       >       >       >      dev = "xvda"
>       >       >       >       >       >       >      type = "phy"
>       >       >       >       >       >       >      mode = "w"
>       >       >       >       >       >       >      device-type = "disk"
>       >       >       >       >       >       >      discard-enable = "1"
>       >       >       >       >       >       >    vfb = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      frontend = "/local/domain/1/device/vfb/0"
>       >       >       >       >       >       >      backend = "/local/domain/0/backend/vfb/1/0"
>       >       >       >       >       >       >      frontend-id = "1"
>       >       >       >       >       >       >      online = "1"
>       >       >       >       >       >       >      state = "1"
>       >       >       >       >       >       >      vnc = "1"
>       >       >       >       >       >       >      vnclisten = "127.0.0.1"
>       >       >       >       >       >       >      vncdisplay = "0"
>       >       >       >       >       >       >      vncunused = "1"
>       >       >       >       >       >       >      sdl = "0"
>       >       >       >       >       >       >      opengl = "0"
>       >       >       >       >       >       >    vkbd = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      frontend = "/local/domain/1/device/vkbd/0"
>       >       >       >       >       >       >      backend = "/local/domain/0/backend/vkbd/1/0"
>       >       >       >       >       >       >      frontend-id = "1"
>       >       >       >       >       >       >      online = "1"
>       >       >       >       >       >       >      state = "1"
>       >       >       >       >       >       >    console = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      frontend = "/local/domain/1/console"
>       >       >       >       >       >       >      backend = "/local/domain/0/backend/console/1/0"
>       >       >       >       >       >       >      frontend-id = "1"
>       >       >       >       >       >       >      online = "1"
>       >       >       >       >       >       >      state = "1"
>       >       >       >       >       >       >      protocol = "vt100"
>       >       >       >       >       >       >    vif = ""
>       >       >       >       >       >       >     0 = ""
>       >       >       >       >       >       >      frontend = "/local/domain/1/device/vif/0"
>       >       >       >       >       >       >      backend = "/local/domain/0/backend/vif/1/0"
>       >       >       >       >       >       >      frontend-id = "1"
>       >       >       >       >       >       >      online = "1"
>       >       >       >       >       >       >      state = "1"
>       >       >       >       >       >       >      script = "/etc/xen/scripts/vif-bridge"
>       >       >       >       >       >       >      mac = "e4:5f:01:cd:7b:dd"
>       >       >       >       >       >       >      bridge = "xenbr0"
>       >       >       >       >       >       >      handle = "0"
>       >       >       >       >       >       >      type = "vif"
>       >       >       >       >       >       >      hotplug-status = ""
>       >       >       >       >       >       >   type = "pvh"
>       >       >       >       >       >       >   dm-version = "qemu_xen"
>       >       >       >       >       >       > root@raspberrypi4-64:~/guest1#
>       >       >       >       >       >       >
>       >       >       >       >       >       > Any input as per above? Looking forward to hearing from you.
>       >       >       >       >       >       >
>       >       >       >       >       >       > Regards,
>       >       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >       >
>       >       >       >       >       >       > On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       >       >       >       >       Hi Vipul,
>       >       >       >       >       >       >
>       >       >       >       >       >       >       If you look at the QEMU logs, it says:
>       >       >       >       >       >       >
>       >       >       >       >       >       >       VNC server running on 127.0.0.1:5900
>       >       >       >       >       >       >
>       >       >       >       >       >       >       That is the VNC server you need to connect to. So in theory:
>       >       >       >       >       >       >
>       >       >       >       >       >       >         vncviewer 127.0.0.1:5900
>       >       >       >       >       >       >
>       >       >       >       >       >       >       should work correctly.
>       >       >       >       >       >       >
>       >       >       >       >       >       >
>       >       >       >       >       >       >       If you have:
>       >       >       >       >       >       >
>       >       >       >       >       >       >         vfb = ["type=vnc"]
>       >       >       >       >       >       >
>       >       >       >       >       >       >       in your xl config file and you have "fbdev" in your Linux guest, it
>       >       >       >       >       >       >       should work.
>       >       >       >       >       >       >
>       >       >       >       >       >       >       If you connect to the VNC server but you get a black screen, it might be
>       >       >       >       >       >       >       a guest configuration issue. I would try with a simpler guest, text only
>       >       >       >       >       >       >       (no X11, no Wayland) and enable the fbdev console (fbcon). See
>       >       >       >       >       >       >       Documentation/fb/fbcon.rst in Linux. You should be able to see a
>       >       >       >       >       >       >       graphical console over VNC.
>       >       >       >       >       >       >
>       >       >       >       >       >       >       If that works, then you know that the fbdev kernel driver (xen-fbfront)
>       >       >       >       >       >       >       works correctly.
>       >       >       >       >       >       >
>       >       >       >       >       >       >       If it doesn't work, the output of "xenstore-ls" would be interesting.
>       >       >       >       >       >       >
>       >       >       >       >       >       >       Cheers,
>       >       >       >       >       >       >
>       >       >       >       >       >       >       Stefano
>       >       >       >       >       >       >
>       >       >       >       >       >       >
>       >       >       >       >       >       >       On Wed, 19 Oct 2022, Vipul Suneja wrote:
>       >       >       >       >       >       >       > Hi Stefano,
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > Thanks for the response!
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > I am following the same link you shared from the beginning. Tried the command
>       >       "vncviewer
>       >       >       localhost:0"
>       >       >       >       in DOM0
>       >       >       >       >       but
>       >       >       >       >       >       same
>       >       >       >       >       >       >       issue "Can't open
>       >       >       >       >       >       >       > display", below are the logs:
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > root@raspberrypi4-64:~# vncviewer localhost:0
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > TigerVNC Viewer 64-bit v1.11.0
>       >       >       >       >       >       >       > Built on: 2020-09-08 12:16
>       >       >       >       >       >       >       > Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
>       >       >       >       >       >       >       > See https://www.tigervnc.org for information on TigerVNC.
>       >       >       >       >       >       >       > Can't open display:
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > Below are the netstat logs, i couldn't see anything running at port 5900 or
>       5901:
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > root@raspberrypi4-64:~# netstat -tuwx
>       >       >       >       >       >       >       > Active Internet connections (w/o servers)
>       >       >       >       >       >       >       > Proto Recv-Q Send-Q Local Address           Foreign Address         State    
>        
>       >       >       >       >       >       >       > tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472    
>        ESTABLISHED
>       >       >       >       >       >       >       > Active UNIX domain sockets (w/o servers)
>       >       >       >       >       >       >       > Proto RefCnt Flags       Type       State         I-Node Path
>       >       >       >       >       >       >       > unix  8      [ ]         DGRAM      CONNECTED      10565 /dev/log
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10891
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13791
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10843
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10573
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      14510
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13249
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      13887
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      10599
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      14005
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13258
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13248
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      14003
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10572
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10786
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         DGRAM      CONNECTED      13186
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10864
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10812
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      14083
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10813
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      14068
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13256
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10571
>       /var/run/xenstored/socket
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      10842
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      13985
>       >       >       >       >       >       >       > unix  3      [ ]         DGRAM      CONNECTED      13185
>       >       >       >       >       >       >       > unix  2      [ ]         STREAM     CONNECTED      13884
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      14528
>       >       >       >       >       >       >       > unix  2      [ ]         DGRAM      CONNECTED      13785
>       >       >       >       >       >       >       > unix  3      [ ]         STREAM     CONNECTED      14034
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > Attaching xen log files of /var/log/xen.
>       >       >       >       >       >       >       > I didn't get the role of QEMU here because as mentioned earlier, I am porting
>       in
>       >       raspberrypi
>       >       >       4B.
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > Regards,
>       >       >       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       > On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <sstabellini@kernel.org>
>       wrote:
>       >       >       >       >       >       >       >       It usually works the way it is described in the guide:
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >     
>       >       >       >       >       >       >     
>       >       >       >       >       >     
>       >       >       >       >     
>       >       >       >     
>       >       >     
>       >     
>              https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       You don't need to install any VNC-related server software because it is
>       >       >       >       >       >       >       >       already provided by Xen (to be precise it is provided by QEMU working
>       >       >       >       >       >       >       >       together with Xen.)
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       You only need the vnc client in dom0 so that you can connect, but you
>       >       >       >       >       >       >       >       could also run the vnc client outside from another host. So basically
>       >       >       >       >       >       >       >       the following should work when executed in Dom0 after creating DomU:
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >         vncviewer localhost:0
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also use
>       >       >       >       >       >       >       >       netstat -taunp to check if there is anything running at port 5900 or
>       >       >       >       >       >       >       >       5901?
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       Cheers,
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       Stefano
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       On Tue, 18 Oct 2022, Vipul Suneja wrote:
>       >       >       >       >       >       >       >       > Hi Stefano,
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > Thanks for the response!
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > I could install tigerVNC, x11vnc & libvncserver in Dom0
>       xen-image-minimal but
>       >       only
>       >       >       manage to
>       >       >       >       install
>       >       >       >       >       >       >       libvncserver(couldn't
>       >       >       >       >       >       >       >       install tigervnc
>       >       >       >       >       >       >       >       > & x11vnc because of x11
>       >       >       >       >       >       >       >       > support missing, it's wayland) in DOMU custom graphical image. I
>       tried
>       >       running
>       >       >       vncviewer with
>       >       >       >       IP
>       >       >       >       >       address &
>       >       >       >       >       >       port
>       >       >       >       >       >       >       in dom0 to
>       >       >       >       >       >       >       >       access the domu
>       >       >       >       >       >       >       >       > graphical image display as per below commands.
>       >       >       >       >       >       >       >       >  
>       >       >       >       >       >       >       >       >  vncviewer 192.168.1.42:5901
>       >       >       >       >       >       >       >       >  
>       >       >       >       >       >       >       >       >  But it showing can't open display, below are the logs:
>       >       >       >       >       >       >       >       >  
>       >       >       >       >       >       >       >       > root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > TigerVNC Viewer 64-bit v1.11.0
>       >       >       >       >       >       >       >       > Built on: 2020-09-08 12:16
>       >       >       >       >       >       >       >       > Copyright (C) 1999-2020 TigerVNC Team and many others (see
>       README.rst)
>       >       >       >       >       >       >       >       > See https://www.tigervnc.org for information on TigerVNC.
>       >       >       >       >       >       >       >       > Can't open display:
>       >       >       >       >       >       >       >       > root@raspberrypi4-64:~/guest1#
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > I am not exactly sure what the issue is but I thought only
>       libvncserver in
>       >       DOMU could
>       >       >       work to
>       >       >       >       get
>       >       >       >       >       access but
>       >       >       >       >       >       it
>       >       >       >       >       >       >       did not
>       >       >       >       >       >       >       >       work. 
>       >       >       >       >       >       >       >       > If TigerVNC is the issue here then is there any other VNC source
>       which could
>       >       be
>       >       >       installed for
>       >       >       >       both
>       >       >       >       >       x11 &
>       >       >       >       >       >       >       wayland supported
>       >       >       >       >       >       >       >       images?
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > Regards,
>       >       >       >       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini
>       <sstabellini@kernel.org>
>       >       wrote:
>       >       >       >       >       >       >       >       >       VNC is typically easier to setup, because SDL needs extra
>       libraries at
>       >       >       >       >       >       >       >       >       build time and runtime. If QEMU is built without SDL support it
>       won't
>       >       >       >       >       >       >       >       >       start when you ask for SDL.
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       VNC should work with both x11 and wayland in your domU. It
>       doesn't work
>       >       >       >       >       >       >       >       >       at the x11 level, it exposes a special fbdev device in your
>       domU that
>       >       >       >       >       >       >       >       >       should work with:
>       >       >       >       >       >       >       >       >       - a graphical console in Linux domU
>       >       >       >       >       >       >       >       >       - x11
>       >       >       >       >       >       >       >       >       - wayland (but I haven't tested this so I am not 100% sure
>       about it)
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       When you say "it doesn't work", what do you mean? Do you get a
>       black
>       >       >       >       >       >       >       >       >       window?
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
>       >       >       >       >       >       >       >       >       (drivers/video/fbdev/xen-fbfront.c). I would try to get a
>       graphical
>       >       text
>       >       >       >       >       >       >       >       >       console up and running in your domU before attempting
>       x11/wayland.
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       Cheers,
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       Stefano
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
>       >       >       >       >       >       >       >       >       > Hi,
>       >       >       >       >       >       >       >       >       > Thanks!
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > I have ported xen minimal image as DOM0 & custom wayland GUI
>       based
>       >       image as
>       >       >       DOMU in
>       >       >       >       raspberry
>       >       >       >       >       pi4B. I
>       >       >       >       >       >       >       am trying to
>       >       >       >       >       >       >       >       make GUI
>       >       >       >       >       >       >       >       >       display up
>       >       >       >       >       >       >       >       >       > for guest machine. I tried using sdl, included below line in
>       >       guest.conf file
>       >       >       >       >       >       >       >       >       > vfb= [ 'sdl=1' ]
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > But it is throwing below error:
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
>       >       >       >       >       >       >       >       >       > Parsing config from guest1.cfg
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain
>       3:error on
>       >       QMP
>       >       >       socket:
>       >       >       >       Connection
>       >       >       >       >       reset by
>       >       >       >       >       >       >       peer
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain
>       3:Error
>       >       happened
>       >       >       with the
>       >       >       >       QMP
>       >       >       >       >       connection to
>       >       >       >       >       >       >       QEMU
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_dm.c:3351:device_model_postconfig_done:
>       Domain
>       >       3:Post DM
>       >       >       startup
>       >       >       >       configs
>       >       >       >       >       failed,
>       >       >       >       >       >       >       rc=-26
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_create.c:1867:domcreate_devmodel_started:
>       Domain
>       >       3:device
>       >       >       model
>       >       >       >       did not
>       >       >       >       >       start:
>       >       >       >       >       >       -26
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
>       Model
>       >       already
>       >       >       exited
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_domain.c:1183:libxl__destroy_domid:
>       Domain
>       >       3:Non-existant
>       >       >       domain
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_domain.c:1137:domain_destroy_callback:
>       Domain
>       >       3:Unable to
>       >       >       destroy
>       >       >       >       guest
>       >       >       >       >       >       >       >       >       > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
>       >       3:Destruction of
>       >       >       domain
>       >       >       >       failed
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > Another way is VNC, i could install tigervnc in DOM0 but same
>       i
>       >       couldn't in
>       >       >       guest
>       >       >       >       machine
>       >       >       >       >       because it
>       >       >       >       >       >       >       doesn't support
>       >       >       >       >       >       >       >       >       x11(supports wayland
>       >       >       >       >       >       >       >       >       > only). I am completely blocked here, Need your support to
>       enable the
>       >       display
>       >       >       up.
>       >       >       >       >       >       >       >       >       > Any alternative of VNC which could work in both x11 & wayland
>       >       supported
>       >       >       images?
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > Any input on VNC, SDL or any other way to proceed on this?
>       Looking
>       >       forward to
>       >       >       hearing
>       >       >       >       from
>       >       >       >       >       you.
>       >       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >       > Regards,
>       >       >       >       >       >       >       >       >       > Vipul Kumar
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >       >
>       >       >       >       >       >       >
>       >       >       >       >       >       >
>       >       >       >       >       >       >
>       >       >       >       >       >
>       >       >       >       >       >
>       >       >       >       >       >
>       >       >       >       >
>       >       >       >       >
>       >       >       >       >
>       >       >       >
>       >       >       >
>       >       >       >
>       >       >
>       >       >
>       >       >
>       >
>       >
>       >
> 
> 
> 
--8323329-1586963452-1671751428=:4079--

