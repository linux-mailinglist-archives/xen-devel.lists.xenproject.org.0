Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156F7EB3E0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632830.987309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vTJ-0004gL-KV; Tue, 14 Nov 2023 15:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632830.987309; Tue, 14 Nov 2023 15:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vTJ-0004cR-GR; Tue, 14 Nov 2023 15:37:01 +0000
Received: by outflank-mailman (input) for mailman id 632830;
 Tue, 14 Nov 2023 15:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZdVB=G3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r2vTH-0004Ze-VR
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:36:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a55fa335-8303-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:36:58 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 13EC64EE0747;
 Tue, 14 Nov 2023 16:36:55 +0100 (CET)
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
X-Inumbo-ID: a55fa335-8303-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 2/2] docs/misra: add guidance on the format of Dir 4.1 docs for ECLAIR
Date: Tue, 14 Nov 2023 16:36:48 +0100
Message-Id: <c2ca76c67bfeaf1fab106af4bda6d6107e722208.1699975581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699975581.git.nicola.vetrini@bugseng.com>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Additional guidance on the formatting of the document for ECLAIR
is supplied.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/C-runtime-failures.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
index 1052b2afca13..cac51d6b2596 100644
--- a/docs/misra/C-runtime-failures.rst
+++ b/docs/misra/C-runtime-failures.rst
@@ -12,6 +12,14 @@ built-in checks that are present in the language.
 The presence of such documentation is requested by MISRA C:2012 Directive 4.1,
 whose headline states: "Run-time failures shall be minimized".
 
+The ECLAIR checker for MISRA C:2012 Directive 4.1 requires the documentation
+to be supplied using the following format:
+
+``Documentation for MISRA C:2012 Dir 4.1: <category> <description>``
+
+The matched categories are the ones listed below (e.g., ``overflow`` and
+``unexpected wrapping``). The content of the description is not checked and can
+span multiple lines.
 
 Documentation for MISRA C:2012 Dir 4.1: overflow
 ________________________________________________
-- 
2.34.1


