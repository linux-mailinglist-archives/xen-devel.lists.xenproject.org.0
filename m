Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEFB775486
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 09:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580725.909120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2W-0007nM-3b; Wed, 09 Aug 2023 07:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580725.909120; Wed, 09 Aug 2023 07:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTe2W-0007lD-0p; Wed, 09 Aug 2023 07:55:32 +0000
Received: by outflank-mailman (input) for mailman id 580725;
 Wed, 09 Aug 2023 07:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTe2U-0007l2-RH
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 07:55:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bdfebd5-368a-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 09:55:29 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8FF924EE073F;
 Wed,  9 Aug 2023 09:55:28 +0200 (CEST)
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
X-Inumbo-ID: 1bdfebd5-368a-11ee-b280-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 0/2] xen: address MISRA C:2012 Rule 5.3
Date: Wed,  9 Aug 2023 09:55:07 +0200
Message-Id: <cover.1691567429.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains two patches left from previous series addressing the same
MISRA Rule [1] [2], to make a standalone patch with the more involved changes
that the first patch of [1] brings. The review comments on the respective threads
about these patches have been addressed.

[1] https://lore.kernel.org/xen-devel/cover.1691492441.git.nicola.vetrini@bugseng.com/
[2] https://lore.kernel.org/xen-devel/cover.1691488505.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (2):
  x86/vmsi: rename variables to address MISRA C:2012 Rule 5.3
  xen/delay: address MISRA C:2012 Rule 5.3.

 xen/arch/x86/hvm/vmsi.c | 22 +++++++++++-----------
 xen/include/xen/delay.h |  8 ++++++--
 2 files changed, 17 insertions(+), 13 deletions(-)

--
2.34.1

