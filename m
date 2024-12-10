Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270139EBFAF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 00:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853449.1266902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLA7J-0007dA-3H; Tue, 10 Dec 2024 23:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853449.1266902; Tue, 10 Dec 2024 23:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLA7J-0007a4-0c; Tue, 10 Dec 2024 23:58:13 +0000
Received: by outflank-mailman (input) for mailman id 853449;
 Tue, 10 Dec 2024 23:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLA7H-0007Zi-O9
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 23:58:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a7d47e5-b752-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 00:58:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19E96A41BCD;
 Tue, 10 Dec 2024 23:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4081EC4CED6;
 Tue, 10 Dec 2024 23:58:06 +0000 (UTC)
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
X-Inumbo-ID: 9a7d47e5-b752-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733875087;
	bh=GH8NOQPYYEdNNrAcx2somaPYxu6r/O8X7+ylgFu/Pus=;
	h=Date:From:To:cc:Subject:From;
	b=Eh3zr1TzHz5j0NZw/ZrsMgRU8AZhxWJGIhsQStC9YeA2en6374OSxeFftRUsM+ncx
	 uRd+bZSUG6tXvCtPMUb/WMTayzqXIWtJ7JsqxYpLbqqkLx/5Mskjyvxyjt1DzBKoMB
	 +Bib0oyPGDlmFp1ZeqMV+8/cDQ5haLrjitgJmdaSA09LfXVndyqo+cPGv4ZmqF6gAA
	 QDpPOHJQVVVx64vJekGA83KUnN5yf3b2Nnp5snNCecXUPO93LK4NkStukGY3btg6Zx
	 IHBe2DGmPZab00JpIRs4d50efVMZOSEBoGHhQ3yWuFkQExLD3EWKv05bhOXwnHrMvc
	 V2TYe/HlFqHww==
Date: Tue, 10 Dec 2024 15:58:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, kelly.choi@cloud.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, roger.pau@cloud.com, committers@xenproject.org
Subject: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
Message-ID: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1197079066-1733873006=:463523"
Content-ID: <alpine.DEB.2.22.394.2412101523360.463523@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1197079066-1733873006=:463523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2412101523361.463523@ubuntu-linux-20-04-desktop>

In recognition of their outstanding work and years of service to the Xen
Community, please join me in welcoming Anthony, Michal, and Roger as
Committers and REST Maintainers.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 026aa25a53..34ad49bc39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -662,8 +662,11 @@ K:	\b(xsm|XSM)\b
 
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Anthony PERARD <anthony.perard@vates.tech>
+M:	Michal Orzel <michal.orzel@amd.com>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
+M:	Roger Pau Monné <roger.pau@citrix.com>
 M:	Stefano Stabellini <sstabellini@kernel.org>
 L:	xen-devel@lists.xenproject.org
 S:	Supported
--8323329-1197079066-1733873006=:463523--

