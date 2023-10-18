Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF067CDF9B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618617.962484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V8-0001an-To; Wed, 18 Oct 2023 14:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618617.962484; Wed, 18 Oct 2023 14:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V8-0001YW-Qk; Wed, 18 Oct 2023 14:26:22 +0000
Received: by outflank-mailman (input) for mailman id 618617;
 Wed, 18 Oct 2023 14:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7V6-0001YD-Rz
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc24918-6dc2-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:26:19 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 112834EE0739;
 Wed, 18 Oct 2023 16:26:17 +0200 (CEST)
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
X-Inumbo-ID: 4dc24918-6dc2-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/7] x86: address some violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:53 +0200
Message-Id: <cover.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses some of the violations of Rule 8.2 adding the
missing parameter names.

Federico Serafini (7):
  x86/mctelem: address violations of MISRA C:2012 Rule 8.2
  x86/mtrr: address violation of MISRA C:2012 Rule 8.2
  x86/domain: address violations of MISRA C:2012 Rule 8.2
  x86/cpuidle: address violations of MISRA C:2012 Rule 8.2
  x86/mcaction: address a violation of MISRA C:2012 Rule 8.2
  x86/vmce: address violations of MISRA C:2012 Rule 8.2
  x86/hpet: address violations of MISRA C:2012 Rule 8.2

 xen/arch/x86/cpu/mcheck/mcaction.h |  2 +-
 xen/arch/x86/cpu/mcheck/mctelem.c  |  2 +-
 xen/arch/x86/cpu/mcheck/mctelem.h  | 25 +++++++++++++------------
 xen/arch/x86/cpu/mcheck/vmce.h     |  8 ++++----
 xen/arch/x86/hpet.c                |  2 +-
 xen/arch/x86/include/asm/cpuidle.h | 11 ++++++-----
 xen/arch/x86/include/asm/domain.h  | 26 +++++++++++++-------------
 xen/arch/x86/include/asm/hpet.h    |  2 +-
 xen/arch/x86/include/asm/mtrr.h    | 10 +++++-----
 9 files changed, 45 insertions(+), 43 deletions(-)

-- 
2.34.1


