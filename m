Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2B7FF7E3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 18:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645101.1006957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kdq-0006Pf-CD; Thu, 30 Nov 2023 17:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645101.1006957; Thu, 30 Nov 2023 17:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kdq-0006NI-8j; Thu, 30 Nov 2023 17:15:58 +0000
Received: by outflank-mailman (input) for mailman id 645101;
 Thu, 30 Nov 2023 17:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4Nc=HL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8kdo-0006Ly-TE
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 17:15:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4650ac-8fa4-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 18:15:55 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 87CD54EE0739;
 Thu, 30 Nov 2023 18:15:54 +0100 (CET)
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
X-Inumbo-ID: 1f4650ac-8fa4-11ee-98e4-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs/misra: fix a typo in rules.rst
Date: Thu, 30 Nov 2023 18:15:43 +0100
Message-Id: <d385998bd7f45c9753db504f8b89db5ed8bc90ce.1701364429.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/rules.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 53dab0070c7b..75921b9a3463 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -531,7 +531,7 @@ maintainers if you want to suggest a change.
        the future or with another compiler.  For these reasons we discourage
        the introduction of new reserved identifiers in Xen, and we see it as
        positive the reduction of reserved identifiers. At the same time,
-       certain identifiers starting with wo underscores are also commonly used
+       certain identifiers starting with two underscores are also commonly used
        in Linux (e.g. __set_bit) and we don't think it would be an improvement
        to rename them.
 
-- 
2.34.1


