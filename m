Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0124B15E0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 20:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269967.464128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIEoH-00088S-P6; Thu, 10 Feb 2022 19:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269967.464128; Thu, 10 Feb 2022 19:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIEoH-00085w-MA; Thu, 10 Feb 2022 19:08:53 +0000
Received: by outflank-mailman (input) for mailman id 269967;
 Thu, 10 Feb 2022 19:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWbD=SZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nIEoG-00085o-2m
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 19:08:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f8ea96-8aa4-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 20:08:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1394F611AA;
 Thu, 10 Feb 2022 19:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A048C004E1;
 Thu, 10 Feb 2022 19:08:48 +0000 (UTC)
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
X-Inumbo-ID: e0f8ea96-8aa4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644520128;
	bh=vvyQcAA0GQuumxKGjBeJxeBCn9zZvuPWsPTX2tTmyEs=;
	h=Date:From:To:cc:Subject:From;
	b=mPJ3ZG0QX/i0AulhBWdwKYDn4dFg8lO7KXxscxybsAG3QvYLDbxjVXWaaW5TsaZ17
	 lFeWhHWfsuASYFToqnYu1AL1YlfmxJ/k7uqhSWYNsrvtO81fDrS2EoGS840dbO+Udr
	 +1TbzvIGUsl9a1z9IRg8sVX3iKgcM/M819qQ6w6XAkyxRqySgBnGv0RE6w4Gk+gh8S
	 ydXg8/mllSaOq6WrJG+8VKQ57QxraiWqbGXhWR78jZmo4+v1IXeWcw5mAXsFI8PocG
	 Eo5leSmY+VLIEAMMpvuqNUqPbVZrJPmJePWCEuSAewNcVKBPeAELmIN15GKl4IX/1u
	 tKEKOk6tLkzzg==
Date: Thu, 10 Feb 2022 11:08:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: bertrand.marquis@arm.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, julien@xen.org, 
    Volodymyr_Babchuk@epam.com
Subject: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
Message-ID: <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 64934cc070..d41572128b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -230,8 +230,8 @@ F:	tools/libs/ctrl/xc_arinc653.c
 ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
+M:	Bertrand Marquis <bertrand.marquis@arm.com>
 R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
-R:	Bertrand Marquis <bertrand.marquis@arm.com>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	docs/misc/arm/

