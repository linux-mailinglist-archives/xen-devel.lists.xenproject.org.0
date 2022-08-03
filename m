Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A18588ED8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 16:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379972.613917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJFah-00054A-53; Wed, 03 Aug 2022 14:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379972.613917; Wed, 03 Aug 2022 14:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJFah-00051x-2Q; Wed, 03 Aug 2022 14:43:19 +0000
Received: by outflank-mailman (input) for mailman id 379972;
 Wed, 03 Aug 2022 14:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oJFaf-00051q-Uc
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 14:43:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9bb122d4-133a-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 16:43:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36C8511FB;
 Wed,  3 Aug 2022 07:43:16 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8549E3F70D;
 Wed,  3 Aug 2022 07:43:14 -0700 (PDT)
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
X-Inumbo-ID: 9bb122d4-133a-11ed-bd2d-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] doc: Add git commands to generate Fixes
Date: Wed,  3 Aug 2022 15:43:04 +0100
Message-Id: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add git commands examples that can be used to generate fixes and how to
use the pretty configuration for git.
This should make it easier for contributors to have the right format.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 docs/process/sending-patches.pandoc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 7ff7826c992b..9c4c4655323b 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -102,6 +102,10 @@ E.g.:
 
     Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
 
+If git was configured as explained earlier, this can be retrieved using
+``git log --pretty=fixes`` otherwise ``git log --abbrev=12 --oneline`` will
+give the proper tag and title.
+
 ### Backport:
 
 A backport tag is an optional tag in the commit message to request a
-- 
2.25.1


