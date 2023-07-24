Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5275FBD1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569141.889420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyJL-0004ut-Pc; Mon, 24 Jul 2023 16:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569141.889420; Mon, 24 Jul 2023 16:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyJL-0004sD-Mo; Mon, 24 Jul 2023 16:21:27 +0000
Received: by outflank-mailman (input) for mailman id 569141;
 Mon, 24 Jul 2023 16:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNyJK-0004s7-55
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:21:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22174553-2a3e-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 18:21:24 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id 669AB4EE073E;
 Mon, 24 Jul 2023 18:21:22 +0200 (CEST)
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
X-Inumbo-ID: 22174553-2a3e-11ee-b23b-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs/misra: document the usage of array range initializers
Date: Mon, 24 Jul 2023 18:19:19 +0200
Message-Id: <5dc1aa0a5cd2ee3410047956f8e69c32c4b227ca.1690215341.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usage of a documented GNU extension that allows a range of elements
in an array to be initalized to the same value using a designated
initalizer is added to this document, to fully comply with
MISRA C:2012 Rule 1.1.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/C-language-toolchain.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 8651f59118..785aed1eaf 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -196,6 +196,10 @@ The table columns are as follows:
      - X86_64
      - See Section "6.9 128-bit Integers" of GCC_MANUAL.
 
+   * - Designated initializer for a range of elements
+     - ARM64, X86_64
+     - See Section "6.29 Designated Initializers" of GCC_MANUAL
+
 
 Translation Limits
 __________________
-- 
2.34.1


