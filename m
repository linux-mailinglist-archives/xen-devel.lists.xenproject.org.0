Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E377B2EB2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610427.949819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Ju-0008Cq-Q5; Fri, 29 Sep 2023 08:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610427.949819; Fri, 29 Sep 2023 08:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Ju-0008A0-L6; Fri, 29 Sep 2023 08:57:58 +0000
Received: by outflank-mailman (input) for mailman id 610427;
 Fri, 29 Sep 2023 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qm9Jt-0007us-0i
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:57:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 476c3b42-5ea6-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:57:55 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 6D9AD4EE0739;
 Fri, 29 Sep 2023 10:57:54 +0200 (CEST)
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
X-Inumbo-ID: 476c3b42-5ea6-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH 0/4] Address violations of MISRA C:2012 Rule 8.3
Date: Fri, 29 Sep 2023 10:56:13 +0200
Message-Id: <cover.1695972930.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains small and uncontroversial patches to address some
violations of Rule 8.3.
No functonal changes are introduced.

Federico Serafini (4):
  video/vesa: drop bool_t
  x86/uaccess: address violations of MISRA C:2012 Rule 8.3
  x86/xstate: address a violation of MISRA C:2012 Rule 8.3
  x86/psr: address a violation of MISRA C:2012 Rule 8.3

 xen/arch/x86/include/asm/psr.h     | 2 +-
 xen/arch/x86/include/asm/uaccess.h | 6 +++---
 xen/arch/x86/xstate.c              | 8 ++++----
 xen/drivers/video/vesa.c           | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1


