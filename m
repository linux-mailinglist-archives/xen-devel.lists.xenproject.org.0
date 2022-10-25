Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E84360C7D5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429666.680788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG6E-0002D6-ES; Tue, 25 Oct 2022 09:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429666.680788; Tue, 25 Oct 2022 09:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG6E-0002Az-Bb; Tue, 25 Oct 2022 09:19:54 +0000
Received: by outflank-mailman (input) for mailman id 429666;
 Tue, 25 Oct 2022 09:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onG6C-0002At-SR
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:19:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2d678e57-5446-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 11:19:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58C9CD6E;
 Tue, 25 Oct 2022 02:19:56 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00C493F792;
 Tue, 25 Oct 2022 02:19:47 -0700 (PDT)
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
X-Inumbo-ID: 2d678e57-5446-11ed-91b5-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.13 0/2] Backports for XSA-409 fixes
Date: Tue, 25 Oct 2022 09:19:35 +0000
Message-Id: <20221025091937.44961-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

This series is a backported series for XSA-409 fixes from master for
4.13, which cherry-picking commits:
3783e583319f arm/p2m: Rework p2m_init()
c7cff1188802 xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()

Andrew Cooper (1):
  arm/p2m: Rework p2m_init()

Henry Wang (1):
  xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()

 xen/arch/arm/domain.c     |  2 +-
 xen/arch/arm/p2m.c        | 58 +++++++++++++++++++++++++++++----------
 xen/include/asm-arm/p2m.h | 14 +++++++---
 3 files changed, 55 insertions(+), 19 deletions(-)

-- 
2.17.1


