Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA7900CBD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 22:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736620.1142740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxq-0001kb-MB; Fri, 07 Jun 2024 20:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736620.1142740; Fri, 07 Jun 2024 20:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxq-0001j3-Ic; Fri, 07 Jun 2024 20:13:30 +0000
Received: by outflank-mailman (input) for mailman id 736620;
 Fri, 07 Jun 2024 20:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZm=NJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sFfxp-0001UP-72
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 20:13:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64df7cf0-250a-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 22:13:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A1AA4EE073E;
 Fri,  7 Jun 2024 22:13:21 +0200 (CEST)
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
X-Inumbo-ID: 64df7cf0-250a-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH for-4.19 v2 0/3] address remaining violations of Rule 20.12
Date: Fri,  7 Jun 2024 22:13:15 +0200
Message-Id: <cover.1717790683.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the remaining violations of Rule 20.12, and
consequently sets the rule (and others) as clean to enable the gating.

Patches 1 and 2 are retained from the previous version, while patch 3
was sent standalone and now merged in this series, as it depends
on the previous two patches.

Nicola Vetrini (3):
  x86/domain: deviate violation of MISRA C Rule 20.12
  automation/eclair_analysis: address remaining violations of MISRA C
    Rule 20.12
  automation/eclair_analysis: add more clean MISRA guidelines

 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 automation/eclair_analysis/ECLAIR/tagging.ecl    | 4 +++-
 docs/misra/safe.json                             | 8 ++++++++
 xen/arch/x86/domain.c                            | 1 +
 xen/arch/x86/domctl.c                            | 1 +
 5 files changed, 19 insertions(+), 1 deletion(-)

--
2.34.1

