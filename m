Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B094BF6C4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276653.472882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSqH-0001A6-AD; Tue, 22 Feb 2022 10:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276653.472882; Tue, 22 Feb 2022 10:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSqH-00017Z-6t; Tue, 22 Feb 2022 10:56:25 +0000
Received: by outflank-mailman (input) for mailman id 276653;
 Tue, 22 Feb 2022 10:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IN1Y=TF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nMSqG-00017R-7X
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:56:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 128ca1e9-93ce-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 11:56:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F465106F;
 Tue, 22 Feb 2022 02:56:22 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8F113F70D;
 Tue, 22 Feb 2022 02:56:20 -0800 (PST)
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
X-Inumbo-ID: 128ca1e9-93ce-11ec-8eb8-a37418f5ba1a
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] Rename psr_mode_is_{32bit/user} to regs_mode_is_{32bit/user}
Date: Tue, 22 Feb 2022 11:56:11 +0100
Message-Id: <20220222105613.20668-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The request to rename psr_mode_is_32bit to regs_mode_is_32bit was make during
a discussion [1]. Because psr_mode_is_user shares the same prototype, we should
rename it as well to keep the naming consistent.

[1] https://marc.info/?l=xen-devel&m=156457538423787&w=2

Michal Orzel (2):
  xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
  xen/arm: Rename psr_mode_is_user to regs_mode_is_user

 xen/arch/arm/arm64/vsysreg.c    |  4 ++--
 xen/arch/arm/include/asm/regs.h |  6 ++---
 xen/arch/arm/traps.c            | 42 ++++++++++++++++-----------------
 xen/arch/arm/vcpreg.c           |  4 ++--
 xen/arch/arm/vtimer.c           |  2 +-
 5 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.29.0


