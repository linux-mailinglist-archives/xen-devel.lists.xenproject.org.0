Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1101808D06
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 17:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650026.1015237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBH7O-0003vO-E8; Thu, 07 Dec 2023 16:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650026.1015237; Thu, 07 Dec 2023 16:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBH7O-0003tl-BP; Thu, 07 Dec 2023 16:20:54 +0000
Received: by outflank-mailman (input) for mailman id 650026;
 Thu, 07 Dec 2023 16:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBH7N-0003tf-EI
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 16:20:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 961d28b3-951c-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 17:20:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC0C153B;
 Thu,  7 Dec 2023 08:21:36 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CEE833F762;
 Thu,  7 Dec 2023 08:20:46 -0800 (PST)
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
X-Inumbo-ID: 961d28b3-951c-11ee-98e7-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] MAINTAINERS: Hand over the release manager role to Oleksii Kurochko
Date: Fri,  8 Dec 2023 00:20:36 +0800
Message-Id: <20231207162036.1921323-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've finished the opportunity to do two releases (4.17 and 4.18)
and Oleksii Kurochko has volunteered to be the next release manager.
Hand over the role to him by changing the maintainership of the
CHANGELOG.md.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fcf5a6f36..702032cc12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -278,7 +278,7 @@ S:	Supported
 F:	xen/drivers/passthrough/arm/smmu-v3.c
 
 Change Log
-M:	Henry Wang <Henry.Wang@arm.com>
+M:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
 R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
-- 
2.25.1


