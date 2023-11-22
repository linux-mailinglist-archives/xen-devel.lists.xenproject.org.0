Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1AA7F42D5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638584.995298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jtb-0002J9-V1; Wed, 22 Nov 2023 09:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638584.995298; Wed, 22 Nov 2023 09:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jtb-0002H2-SF; Wed, 22 Nov 2023 09:51:47 +0000
Received: by outflank-mailman (input) for mailman id 638584;
 Wed, 22 Nov 2023 09:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vowI=HD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r5jtb-0002Gw-7U
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:51:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf4c23fa-891c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:51:45 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.203.136])
 by support.bugseng.com (Postfix) with ESMTPSA id C75E14EE073C;
 Wed, 22 Nov 2023 10:51:43 +0100 (CET)
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
X-Inumbo-ID: bf4c23fa-891c-11ee-98e1-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [XEN PATCH v4 0/2] xen/mm: address violatios of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed, 22 Nov 2023 10:51:27 +0100
Message-Id: <cover.1700645120.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/2 does some preparation work, hence it needs to be committed as first.
Patch 2/2 is the one that effectively address the violations adding
missing parameter names and uniforming function declarations and definitions.

Federico Serafini (2):
  x86/mm: preparation work to uniform modify_xen_mappings* interfaces
  xen/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3

 xen/arch/arm/mmu/pt.c   |  4 ++--
 xen/arch/ppc/mm-radix.c |  2 +-
 xen/arch/x86/mm.c       | 13 +++++++------
 xen/include/xen/mm.h    | 16 +++++++++-------
 4 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.34.1


