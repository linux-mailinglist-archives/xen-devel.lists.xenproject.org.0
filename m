Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09575FE82
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569201.889509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjT-0001nc-BV; Mon, 24 Jul 2023 17:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569201.889509; Mon, 24 Jul 2023 17:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzjT-0001lF-8U; Mon, 24 Jul 2023 17:52:31 +0000
Received: by outflank-mailman (input) for mailman id 569201;
 Mon, 24 Jul 2023 17:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixEc=DK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qNzjR-0001ku-MI
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:52:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db02f064-2a4a-11ee-b23c-6b7b168915f2;
 Mon, 24 Jul 2023 19:52:28 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.223.75])
 by support.bugseng.com (Postfix) with ESMTPSA id DF4D64EE073E;
 Mon, 24 Jul 2023 19:52:25 +0200 (CEST)
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
X-Inumbo-ID: db02f064-2a4a-11ee-b23c-6b7b168915f2
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 0/3] IRQ: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon, 24 Jul 2023 19:50:26 +0200
Message-Id: <cover.1690217195.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch serie addresses violations of rules 8.2 and 8.3 related to the IRQ
module.
Changes are divided by architecture.
No functional changes.

Federico Serafini (3):
  xen/irq: add missing parameter names
  xen/arm: irq: address violations of MISRA C: 2012 Rules 8.2 and 8.3
  x86/irq: address violations of MISRA C:2012 Rules 8.2 and 8.3

 xen/arch/arm/irq.c             |  7 ++--
 xen/arch/x86/include/asm/irq.h | 32 +++++++++---------
 xen/arch/x86/irq.c             | 28 ++++++++--------
 xen/include/xen/irq.h          | 59 +++++++++++++++++-----------------
 xen/include/xen/softirq.h      |  2 +-
 5 files changed, 65 insertions(+), 63 deletions(-)

-- 
2.34.1


