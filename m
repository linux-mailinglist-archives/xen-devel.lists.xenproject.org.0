Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8358B090D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711372.1111273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYq-00006N-F9; Wed, 24 Apr 2024 12:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711372.1111273; Wed, 24 Apr 2024 12:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYq-0008WO-Bb; Wed, 24 Apr 2024 12:17:16 +0000
Received: by outflank-mailman (input) for mailman id 711372;
 Wed, 24 Apr 2024 12:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcL4=L5=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1rzbTk-0007vC-Jt
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:12:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c5bf2b-0233-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:11:59 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id A6F134EE0739;
 Wed, 24 Apr 2024 14:11:58 +0200 (CEST)
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
X-Inumbo-ID: d9c5bf2b-0233-11ef-909a-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 0/2] x86: address remaining violation of Rule 7.2
Date: Wed, 24 Apr 2024 14:11:31 +0200
Message-Id: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series addresses the last violations of MISRA C:2012 Rule 7.2.
This rule will soon be tagged as clean for ECLAIR in a future patch. 

Alessandro Zucchelli (2):
  pci: add suffix 'U' to PCI_CONF_ADDRESS macro.
  x86/msr: add suffix 'U' to MSR_AMD_CSTATE_CFG macro.

 xen/arch/x86/include/asm/msr-index.h | 2 +-
 xen/arch/x86/x86_64/pci.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


