Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103899FEAC6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863552.1274960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt3-0007pd-W4; Mon, 30 Dec 2024 21:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863552.1274960; Mon, 30 Dec 2024 21:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt3-0007lh-R5; Mon, 30 Dec 2024 21:01:17 +0000
Received: by outflank-mailman (input) for mailman id 863552;
 Mon, 30 Dec 2024 21:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMt1-0006nk-PN
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:15 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 344ec987-c6f1-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 22:01:14 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id A0742506D34;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
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
X-Inumbo-ID: 344ec987-c6f1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKAAcZsb1zf/Sx09ApHUwHb6yPd9REXI9uLqVexVt6k=;
	b=EZfsna/WG9f6kP91AejpJsdQ7VK0QiUtVLhv5Sp6HtKy3F7uyqz4og5RhrBUli1Lmm0h/Z
	v0Ck/JjX0YVdygeJnrRK7YrA4PA81Jqg1zbW1XMQFB9sGSmeH0r94p7hKYSMzy+utqZmLb
	5LQLry8jvw/pkxOvG8IbGWvwKzVPokSMWp264GJvEr8CsaMfjnAfzQnNd4F6YagO/C3tZ3
	SW0VNSv0VIy3mjM2a7sIN5yyBjX1r5xO0ryT5G04iU3jSyjxm9HTilknbJ5oF1cuSOJk87
	wd4O1j0W36S4fXibXvAkgCiwuprUFiODabUuVdMcuay2BTOWxM0JChMWrebn5Q==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH 4/5] docs/man: fix typo: hexidecimal -> hexadecimal
Date: Mon, 30 Dec 2024 22:00:32 +0100
Message-Id: <3a3f8f625af48fe2cac19bfab976c811c6cec6f4.1735585600.git.maxi@daemonizer.de>
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
References: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was found by the lintian tool (Debian package checker) during
packaging xen for Debian.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/man/xl-pci-configuration.5.pod | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index db3360307c..ec76f590b7 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -89,7 +89,7 @@ device. For example, running L<lspci(1)> in a Linux guest where B<vslot>
 was specified as C<8> would identify the device as C<00:08.0>. Virtual domain
 and bus numbers are always 0.
 
-B<NOTE:> This parameter is always parsed as a hexidecimal value.
+B<NOTE:> This parameter is always parsed as a hexadecimal value.
 
 =item Default Value
 
-- 
2.39.5


