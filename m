Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB935E7900
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 13:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410726.653865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgS3-0001kP-Ev; Fri, 23 Sep 2022 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410726.653865; Fri, 23 Sep 2022 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgS3-0001h4-Bj; Fri, 23 Sep 2022 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 410726;
 Fri, 23 Sep 2022 11:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQMd=Z2=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1obgS1-0001gy-Qw
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 11:02:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3824c2c3-3b2f-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 13:02:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1462F139F;
 Fri, 23 Sep 2022 04:02:37 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427953F73D;
 Fri, 23 Sep 2022 04:02:29 -0700 (PDT)
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
X-Inumbo-ID: 3824c2c3-3b2f-11ed-9647-05401a9f4f97
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: static event channel
Date: Fri, 23 Sep 2022 12:02:16 +0100
Message-Id: <cover.1663928523.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fix issues related to static event channel series.

Rahul Singh (2):
  xen: Add static event channel in SUPPORT.md on ARM
  xen/arm: fix booting ACPI based system after static evtchn series

 SUPPORT.md           | 7 +++++++
 xen/arch/arm/setup.c | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1


