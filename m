Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBA588806
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379604.613182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8uk-0003Sl-Cl; Wed, 03 Aug 2022 07:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379604.613182; Wed, 03 Aug 2022 07:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8uk-0003Q1-9y; Wed, 03 Aug 2022 07:35:34 +0000
Received: by outflank-mailman (input) for mailman id 379604;
 Wed, 03 Aug 2022 07:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oJ8ui-0003Pv-GQ
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:35:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id da082e02-12fe-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 09:35:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC03713D5;
 Wed,  3 Aug 2022 00:35:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB893F73B;
 Wed,  3 Aug 2022 00:35:29 -0700 (PDT)
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
X-Inumbo-ID: da082e02-12fe-11ed-924f-1f966e50362f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools: make misra convert tool executable
Date: Wed,  3 Aug 2022 08:35:20 +0100
Message-Id: <65d730eb0543c507e76b33285bb9d3430662732b.1659444520.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misra document conversion script to be executable.

Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/tools/convert_misra_doc.py | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 xen/tools/convert_misra_doc.py

diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
old mode 100644
new mode 100755
-- 
2.25.1


