Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9F2C4C04
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 01:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38185.70887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki57m-000405-HR; Thu, 26 Nov 2020 00:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38185.70887; Thu, 26 Nov 2020 00:27:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki57m-0003zg-EJ; Thu, 26 Nov 2020 00:27:02 +0000
Received: by outflank-mailman (input) for mailman id 38185;
 Thu, 26 Nov 2020 00:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aPbE=FA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ki57k-0003zb-Sw
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 00:27:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7de5fef2-b3f8-4454-835e-663d5b0f776b;
 Thu, 26 Nov 2020 00:27:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45ECF20872;
 Thu, 26 Nov 2020 00:26:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aPbE=FA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ki57k-0003zb-Sw
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 00:27:00 +0000
X-Inumbo-ID: 7de5fef2-b3f8-4454-835e-663d5b0f776b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7de5fef2-b3f8-4454-835e-663d5b0f776b;
	Thu, 26 Nov 2020 00:27:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 45ECF20872;
	Thu, 26 Nov 2020 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606350419;
	bh=8MznRGGIWMF1T443v1SevCrhPebJV8D4im1mfsrrw/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qNC4oe7N7JDh+YUMplFm0CIeQ7GCFk4iNuwOPk2CxHZj8N1f9AewZQ941MU27zc30
	 UMDMZ+yh31evXGlQRktuf2UhpmvDFkqDC4VoEuPDJJJwL7p+GEJg2p73sKGYKKfU7h
	 QJ9vmn37ZP0pXUCD2+qGgD5xPle25MzvKjWQGCyw=
Date: Wed, 25 Nov 2020 16:26:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 07/12] automation: add alpine linux x86 build jobs
In-Reply-To: <20201125042745.31986-7-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.21.2011251624410.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s> <20201125042745.31986-7-sstabellini@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Nov 2020, Stefano Stabellini wrote:
> Allow failure for these jobs. Currently they fail because hvmloader
> doesn't build with musl. The failures don't block the pipeline.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> This patch is probably required: https://github.com/alpinelinux/aports/blob/master/main/xen/musl-hvmloader-fix-stdint.patch


We could simply disable the hvmloader build when it is not necessary.
When OVMF, SeaBios, and Rombios are all disabled, it doesn't make sense
to build hvmloader. If this assumption is correct, then the patch below
fixes the Alpine Linux build (as long as we pass --disable-seabios and
--disable-rombios appropriately)


diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 48bd9ab731..a6aada576f 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -55,6 +55,15 @@ CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
 CONFIG_GOLANG       := @golang@
+ifeq ($(CONFIG_ROMBIOS),y)
+CONFIG_FIRMWARE=y
+endif
+ifeq ($(CONFIG_SEABIOS),y)
+CONFIG_FIRMWARE=y
+endif
+ifeq ($(CONFIG_OVMF),y)
+CONFIG_FIRMWARE=y
+endif
 
 CONFIG_SYSTEMD      := @systemd@
 SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
diff --git a/tools/Makefile b/tools/Makefile
index ed71474421..9821a7f5d5 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -14,7 +14,7 @@ SUBDIRS-y += examples
 SUBDIRS-y += hotplug
 SUBDIRS-y += xentrace
 SUBDIRS-$(CONFIG_XCUTILS) += xcutils
-SUBDIRS-$(CONFIG_X86) += firmware
+SUBDIRS-$(CONFIG_FIRMWARE) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
 SUBDIRS-y += xentop

