Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45A8D04C0
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730805.1136025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj5-00058i-Hk; Mon, 27 May 2024 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730805.1136025; Mon, 27 May 2024 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj5-00056h-Ax; Mon, 27 May 2024 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 730805;
 Mon, 27 May 2024 14:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uY6H=M6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sBbj4-00056V-Jq
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:53:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de1a8f6f-1c38-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 16:53:24 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 7E3D44EE0738;
 Mon, 27 May 2024 16:53:22 +0200 (CEST)
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
X-Inumbo-ID: de1a8f6f-1c38-11ef-b4bb-af5377834399
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
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 0/4] various ECLAIR and MISRA improvements
Date: Mon, 27 May 2024 16:53:15 +0200
Message-Id: <cover.1716814609.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series contains various miscellaneous changes to the ECLAIR and deviations
for MISRA rules

Nicola Vetrini (4):
  docs/misra: exclude gdbsx from MISRA compliance
  automation/eclair_analysis: avoid an ECLAIR warning about escaping
  x86: address violations of MISRA C Rule 8.4
  x86/traps: address violation of MISRA C Rule 8.4

 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++--
 docs/misra/exclude-list.json                     | 8 ++++++++
 xen/arch/x86/desc.c                              | 1 +
 xen/arch/x86/mm.c                                | 2 +-
 xen/arch/x86/traps.c                             | 1 +
 5 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.34.1

