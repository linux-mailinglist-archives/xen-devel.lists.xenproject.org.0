Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3857D2B2F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620990.966915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHO-0003Tz-TQ; Mon, 23 Oct 2023 07:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620990.966915; Mon, 23 Oct 2023 07:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHO-0003Qu-Pp; Mon, 23 Oct 2023 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 620990;
 Mon, 23 Oct 2023 07:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qupHN-0003Om-N7
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:23:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055ad1be-7175-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 09:23:12 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 52DBC4EE0740;
 Mon, 23 Oct 2023 09:23:10 +0200 (CEST)
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
X-Inumbo-ID: 055ad1be-7175-11ee-98d5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/8] x86: address some violations of MISRA C:2012 Rule 8.2
Date: Mon, 23 Oct 2023 09:22:55 +0200
Message-Id: <cover.1698045505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses some of the violations of Rule 8.2 adding the
missing parameter names.

Federico Serafini (8):
  x86/hvm: address violations of MISRA C:2012 Rule 8.2
  x86/mmconfig: address violations of MISRA C:2012 Rule 8.2
  x86/vpmu: address a violation of MISRA C:2012 Rule 8.2
  x86/smp: address a violation of MISRA C:2012 Rule 8.2
  x86/pci: address a violation of MISRA C:2012 Rule 8.2
  x86/physdev: address violations of MISRA C:2012 Rule 8.2
  x86/platform_hypercall: address violations of MISRA C:2012 Rule 8.2
  x86/sysctl: address a violation of MISRA C:2012 Rule 8.2

 xen/arch/x86/include/asm/pci.h    | 2 +-
 xen/arch/x86/include/asm/smp.h    | 2 +-
 xen/arch/x86/include/asm/vpmu.h   | 2 +-
 xen/arch/x86/physdev.c            | 6 +++---
 xen/arch/x86/platform_hypercall.c | 6 +++---
 xen/arch/x86/sysctl.c             | 2 +-
 xen/arch/x86/x86_64/mmconfig.h    | 4 ++--
 xen/drivers/passthrough/x86/hvm.c | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.34.1


