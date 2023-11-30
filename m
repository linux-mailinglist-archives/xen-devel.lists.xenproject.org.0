Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06157FF3EA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645012.1006744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHL-0006im-1B; Thu, 30 Nov 2023 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645012.1006744; Thu, 30 Nov 2023 15:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHK-0006en-S6; Thu, 30 Nov 2023 15:48:38 +0000
Received: by outflank-mailman (input) for mailman id 645012;
 Thu, 30 Nov 2023 15:48:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcd2=HL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8jHJ-0006a5-Gf
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:48:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebacaf32-8f97-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:48:35 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-59-158-146.retail.telecomitalia.it [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id B8E994EE0739;
 Thu, 30 Nov 2023 16:48:34 +0100 (CET)
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
X-Inumbo-ID: ebacaf32-8f97-11ee-98e4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 0/2] x86/p2m: address a violation of MISRA C:2012 Rule 8.3
Date: Thu, 30 Nov 2023 16:48:20 +0100
Message-Id: <cover.1701344917.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/2 does some preparation work, hence it needs to be committed as first.
Patch 2/2 addresses the violation.

Federico Serafini (2):
  x86/p2m: preparation work for xenmem_add_to_physmap_one()
  x86/p2m: address a violation of MISRA C:2012 Rule 8.3

 xen/arch/x86/mm/p2m.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1


