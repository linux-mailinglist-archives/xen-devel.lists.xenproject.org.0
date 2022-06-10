Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F5545F38
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345957.571677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza5z-0001Lo-Hn; Fri, 10 Jun 2022 08:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345957.571677; Fri, 10 Jun 2022 08:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza5z-0001Iw-Dq; Fri, 10 Jun 2022 08:34:19 +0000
Received: by outflank-mailman (input) for mailman id 345957;
 Fri, 10 Jun 2022 08:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nza5y-0001Ib-DE
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:34:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1cde20e8-e898-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:34:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7A912FC;
 Fri, 10 Jun 2022 01:34:15 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331933F73B;
 Fri, 10 Jun 2022 01:34:13 -0700 (PDT)
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
X-Inumbo-ID: 1cde20e8-e898-11ec-bd2c-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] small fixes
Date: Fri, 10 Jun 2022 10:33:55 +0200
Message-Id: <20220610083358.101412-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small independent fixes.

Michal Orzel (3):
  xen/arm: traps: Fix reference to invalid erratum ID
  xen/arm: gicv2: Rename gicv2_map_hwdown_extra_mappings
  xen/console: Fix incorrect format tags for struct tm members

 xen/arch/arm/gic-v2.c      | 4 ++--
 xen/arch/arm/traps.c       | 2 +-
 xen/drivers/char/console.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1


