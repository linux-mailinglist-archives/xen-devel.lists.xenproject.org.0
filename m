Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA57EEDE1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634904.990512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ube-0001nm-DI; Fri, 17 Nov 2023 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634904.990512; Fri, 17 Nov 2023 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ube-0001hk-9Y; Fri, 17 Nov 2023 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 634904;
 Fri, 17 Nov 2023 08:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3ubc-0001Q3-FT
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:53:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd5772c2-8526-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:53:39 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 230574EE0C87;
 Fri, 17 Nov 2023 09:53:38 +0100 (CET)
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
X-Inumbo-ID: cd5772c2-8526-11ee-98dc-6d05b1d4d9a1
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
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [XEN PATCH v5 2/2] docs/misra: add guidance on the format of  Dir 4.1 docs for ECLAIR
Date: Fri, 17 Nov 2023 09:53:26 +0100
Message-Id: <f5373ffb9bd9aa1120c35e9cb445d48e01c9656c.1700211131.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700211131.git.nicola.vetrini@bugseng.com>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Additional guidance on the formatting of the document for ECLAIR
is supplied.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
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


