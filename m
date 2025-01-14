Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60747A109DB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 15:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871440.1282433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiE7-0008Dz-N3; Tue, 14 Jan 2025 14:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871440.1282433; Tue, 14 Jan 2025 14:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiE7-0008BP-KL; Tue, 14 Jan 2025 14:49:07 +0000
Received: by outflank-mailman (input) for mailman id 871440;
 Tue, 14 Jan 2025 14:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xX/k=UG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tXiE5-0008BJ-QW
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 14:49:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b28315a3-d286-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 15:49:03 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 61BBA4EE0744;
 Tue, 14 Jan 2025 15:49:01 +0100 (CET)
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
X-Inumbo-ID: b28315a3-d286-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736866142; bh=DJ6jpLTmOUZYj3qjLrzX6AalQlIrFW29F8p7tbjACOY=;
	h=From:To:Cc:Subject:Date:From;
	b=ObCQxmbDnkUk46KAJj/I/dnKkruCH/3vGnQ1PxaHMs3K57zI12cyjM0FLUTGLaFx6
	 vW3pWZSapvH6mfAeE3FmSGu5olMOKmjCk/ZggJ6gzNth013dM2JZmr76bbB1HeqYVh
	 dJu69vTEPGl8+40UP3kar6bNBQ9rMGalbDv3fLL3N47TrenNaAh/ZP3dVkjYPA4zeI
	 iy0PdUT/pvkLNqe46PQL5jsmdZ+8bJVxFTvg3pIY9LHwTYndEHNVFBb7FekZBJnGtX
	 +Gm5ULOeHbSUXV4qQoz00U1D0DnDPG2WywB5fvV7fFJv6xL+4OhL2P1dq/KVsnfbRP
	 TNFXQdZt9I9sg==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] MAINTAINERS: Change reviewer of the ECLAIR integration
Date: Tue, 14 Jan 2025 15:48:54 +0100
Message-ID: <8c370ced911457c883360836bd5afda747426a13.1736856521.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simone Ballarin is no longer actively involved in reviewing
the ECLAIR integration for Xen. I am stepping up as a reviewer.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 392f780f7617..c11b82eca98f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -297,7 +297,7 @@ F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
 
 ECLAIR
-R:	Simone Ballarin <simone.ballarin@bugseng.com>
+R:	Nicola Vetrini <nicola.vetrini@bugseng.com>
 S:	Supported
 F:	automation/eclair_analysis/
 F:	automation/scripts/eclair
-- 
2.43.0


