Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC179378A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596371.930246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMB-000050-VB; Wed, 06 Sep 2023 08:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596371.930246; Wed, 06 Sep 2023 08:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMB-0008To-SE; Wed, 06 Sep 2023 08:57:51 +0000
Received: by outflank-mailman (input) for mailman id 596371;
 Wed, 06 Sep 2023 08:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kCQ=EW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qdoM9-0008TQ-Ln
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:57:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c6688f-4c93-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:57:48 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-6-207-235.retail.telecomitalia.it [87.6.207.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 85CE54EE0737;
 Wed,  6 Sep 2023 10:57:47 +0200 (CEST)
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
X-Inumbo-ID: 73c6688f-4c93-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/4] xen/x86: address some violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed,  6 Sep 2023 10:57:37 +0200
Message-Id: <cover.1693990010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie addresses some violations of MISRA C:2012 Rules 8.2 and 8.3
for x86-64.

Federico Serafini (4):
  x86/genapic: address a violation of MISRA C:2012 Rule 8.3
  x86/io: address violations of MISRA C:2012 Rule 8.3
  x86/io_apic: address violations of MISRA C:2012 Rules 8.2 and 8.3
  xen/vpci: address a violation of MISRA C:2012 Rule 8.3

 xen/arch/x86/include/asm/genapic.h | 2 +-
 xen/arch/x86/include/asm/hap.h     | 2 +-
 xen/arch/x86/include/asm/io.h      | 2 +-
 xen/arch/x86/include/asm/io_apic.h | 4 ++--
 xen/include/xen/vpci.h             | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1


