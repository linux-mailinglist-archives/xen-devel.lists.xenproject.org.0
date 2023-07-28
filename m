Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808B766C13
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 13:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571440.895302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLzV-0006Uc-BN; Fri, 28 Jul 2023 11:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571440.895302; Fri, 28 Jul 2023 11:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLzV-0006Rq-45; Fri, 28 Jul 2023 11:50:41 +0000
Received: by outflank-mailman (input) for mailman id 571440;
 Fri, 28 Jul 2023 11:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8l51=DO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qPLzU-0006Fz-A2
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 11:50:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7195ab6-2d3c-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 13:50:38 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.4.37])
 by support.bugseng.com (Postfix) with ESMTPSA id AAD204EE073F;
 Fri, 28 Jul 2023 13:50:34 +0200 (CEST)
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
X-Inumbo-ID: f7195ab6-2d3c-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 0/2] IRQ: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Fri, 28 Jul 2023 13:49:00 +0200
Message-Id: <cover.1690544434.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses violations of rules 8.2 and 8.3 related to the IRQ
module.
No functional changes.

Federico Serafini (2):
  xen/IRQ: address violations of MISRA C: 2012 Rules 8.2 and 8.3
  x86/IRQ: address violations of MISRA C: 2012 Rules 8.2 and 8.3

 xen/arch/arm/irq.c             |  2 +-
 xen/arch/x86/include/asm/irq.h | 30 ++++++++++++-------------
 xen/arch/x86/irq.c             |  4 ++--
 xen/include/xen/irq.h          | 41 +++++++++++++++++-----------------
 xen/include/xen/softirq.h      |  2 +-
 5 files changed, 40 insertions(+), 39 deletions(-)

-- 
2.34.1


