Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6340B601B09
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 23:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424605.672151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okXNM-0001Pd-Mz; Mon, 17 Oct 2022 21:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424605.672151; Mon, 17 Oct 2022 21:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okXNM-0001MR-JT; Mon, 17 Oct 2022 21:10:20 +0000
Received: by outflank-mailman (input) for mailman id 424605;
 Mon, 17 Oct 2022 21:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9e=2S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okXNK-0001ML-Vp
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 21:10:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ae7b92-4e60-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 23:10:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86C9CB81681;
 Mon, 17 Oct 2022 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4458CC433C1;
 Mon, 17 Oct 2022 21:10:14 +0000 (UTC)
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
X-Inumbo-ID: 19ae7b92-4e60-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666041015;
	bh=suD0QuASoqrCJuGlyIYi9GSAY3zAJmoaFv3ILy/1xxA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mDqLIHZJd27yJN1psmO7yTMhHt6BYiB7ud/SbtHDRShclACvQu2CO7PHSJTHY8fQu
	 QYBHO5zysPWKS+puaE2393OSSKt2jQtcbPPZP0btyoZiH1uKY1KaSGy2HsiW9W8JLt
	 Z4TWov6dofoSuf9HYA0EyvNuP4d87Xzs88KPZRzIPZaifXX2jqCazdfWVdktt/OEW4
	 xnGvg8L6geE5AYQZ3OkIsruCqL+I65qxKKFzLPL2lymXnydXrOkVsILFoE8AaE3oRn
	 CdHBjbR0/7kGHzZNKRoHEnzlzNNAD5k2iCsOovM1+b8iUZyTjlR7c8w3gEHCroheA1
	 9HoZ35yqTyJIQ==
Date: Mon, 17 Oct 2022 14:10:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vipul Suneja <vsuneja63@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    oleksandr_andrushchenko@epam.com, oleksandr_tyshchenko@epam.com, 
    jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: Porting Xen in raspberry pi4B
In-Reply-To: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-113100523-1666040577=:2351079"
Content-ID: <alpine.DEB.2.22.394.2210171403360.2351079@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-113100523-1666040577=:2351079
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210171403361.2351079@ubuntu-linux-20-04-desktop>

VNC is typically easier to setup, because SDL needs extra libraries at
build time and runtime. If QEMU is built without SDL support it won't
start when you ask for SDL.

VNC should work with both x11 and wayland in your domU. It doesn't work
at the x11 level, it exposes a special fbdev device in your domU that
should work with:
- a graphical console in Linux domU
- x11
- wayland (but I haven't tested this so I am not 100% sure about it)

When you say "it doesn't work", what do you mean? Do you get a black
window?

You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
(drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text
console up and running in your domU before attempting x11/wayland.

Cheers,

Stefano

On Mon, 17 Oct 2022, Vipul Suneja wrote:
> Hi,
> Thanks!
> 
> I have ported xen minimal image as DOM0 & custom wayland GUI based image as DOMU in raspberry pi4B. I am trying to make GUI display up
> for guest machine. I tried using sdl, included below line in guest.conf file
> vfb= [ 'sdl=1' ]
> 
> But it is throwing below error:
> 
> root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
> Parsing config from guest1.cfg
> libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket: Connection reset by peer
> libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP connection to QEMU
> libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup configs failed, rc=-26
> libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did not start: -26
> libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed
> 
> Another way is VNC, i could install tigervnc in DOM0 but same i couldn't in guest machine because it doesn't support x11(supports wayland
> only). I am completely blocked here, Need your support to enable the display up.
> Any alternative of VNC which could work in both x11 & wayland supported images?
> 
> Any input on VNC, SDL or any other way to proceed on this? Looking forward to hearing from you.
> 
> Regards,
> Vipul Kumar
--8323329-113100523-1666040577=:2351079--

