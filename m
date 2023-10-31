Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52C7DCDC1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625721.975344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiR-0005ur-8f; Tue, 31 Oct 2023 13:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625721.975344; Tue, 31 Oct 2023 13:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiR-0005rL-0J; Tue, 31 Oct 2023 13:23:31 +0000
Received: by outflank-mailman (input) for mailman id 625721;
 Tue, 31 Oct 2023 13:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiP-0003rs-TX
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ad206158-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:23:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF6F7DA7;
 Tue, 31 Oct 2023 06:24:08 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40DC03F738;
 Tue, 31 Oct 2023 06:23:26 -0700 (PDT)
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
X-Inumbo-ID: ad206158-77f0-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 8/8] feedback from the community
Date: Tue, 31 Oct 2023 13:23:04 +0000
Message-Id: <20231031132304.2573924-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/.clang-format | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/.clang-format b/xen/.clang-format
index 7880709fe1fd..bfc1d104af84 100644
--- a/xen/.clang-format
+++ b/xen/.clang-format
@@ -29,8 +29,8 @@ AlignArrayOfStructures: Left
 # [not specified]
 # Align consecutive assignments (supported in clang-format 3.8)
 AlignConsecutiveAssignments:
-  Enabled: true
-  AcrossEmptyLines: true
+  Enabled: false
+  AcrossEmptyLines: false
   AcrossComments: false
 
 # [not specified]
@@ -46,8 +46,8 @@ AlignConsecutiveDeclarations: None
 # Align values of consecutive macros (supported in clang-format 9)
 AlignConsecutiveMacros:
   Enabled: true
-  AcrossEmptyLines: true
-  AcrossComments: true
+  AcrossEmptyLines: false
+  AcrossComments: false
 
 # [not specified]
 # Align escaped newlines to the right (supported in clang-format 5)
-- 
2.34.1


