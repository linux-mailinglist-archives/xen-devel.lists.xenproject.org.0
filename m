Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB07D4146
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 22:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621612.968240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1z2-0002UL-4J; Mon, 23 Oct 2023 20:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621612.968240; Mon, 23 Oct 2023 20:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1z2-0002RU-13; Mon, 23 Oct 2023 20:57:08 +0000
Received: by outflank-mailman (input) for mailman id 621612;
 Mon, 23 Oct 2023 20:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv1z0-0002RO-RW
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 20:57:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7df1d6c-71e6-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 22:57:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 795ACCE2154;
 Mon, 23 Oct 2023 20:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877C6C433C8;
 Mon, 23 Oct 2023 20:57:00 +0000 (UTC)
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
X-Inumbo-ID: b7df1d6c-71e6-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698094621;
	bh=mowxrgC91/O5/XxmHSI3XUwURyfMqm7Hdd6IIx27xpc=;
	h=Date:From:To:cc:Subject:From;
	b=QaWIUgfEWo1/6f9ZE1IiJaEuhZcgF/ECwoUKMSKBUuQmHqQoW21U5Ci2aljh46YdH
	 kX8qcyDwBw/CZqnQB/rp3F9bJsqMbzu8SXA5lLkahL3ZeIyhb0Icdw4bjQ/fXSG4m5
	 vDt1xp7nqe9stCtMOs4fgz0ndIb/TolkD1w4iF+eiF327Z6+RL93T4j9dRk2CdgU6F
	 7MwluT7zd+9OUqSH3jPEnJJ433DLNqeqd2N0fSWaSxAUoTGeIofkFBw3Kn5uIU5tvk
	 2k1lm3KxSJ/jNgzBKR3OBcd26x2Zsmx41b+utG9L+2Mb49YlobO/7CqOmJ8p7SayAd
	 tyO+6/HGDSx1w==
Date: Mon, 23 Oct 2023 13:56:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
    michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, Henry.Wang@arm.com
Subject: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Message-ID: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f61b5a32a1..a5a5f2bffb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -246,6 +246,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
+M:	Michal Orzel <michal.orzel@amd.com>
 R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
-- 
2.25.1


