Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EF7EEDE3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634902.990495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ubc-0001Si-Rl; Fri, 17 Nov 2023 08:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634902.990495; Fri, 17 Nov 2023 08:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ubc-0001QD-P8; Fri, 17 Nov 2023 08:53:40 +0000
Received: by outflank-mailman (input) for mailman id 634902;
 Fri, 17 Nov 2023 08:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3ubb-0001Px-FZ
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:53:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cafcf93f-8526-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 09:53:36 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 24BDE4EE0744;
 Fri, 17 Nov 2023 09:53:34 +0100 (CET)
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
X-Inumbo-ID: cafcf93f-8526-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v5 0/2] use the documentation for MISRA C:2012 Dir 4.1
Date: Fri, 17 Nov 2023 09:53:24 +0100
Message-Id: <cover.1700211131.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses some concerns raised on patches 2 and 3 from [1].
Note that patch 1 from that series has already been applied.

Patch 1 comprises a modified version of patches 2 and 3 of the previous series.
Patch 2 is brand new, as it merely clarifies how to write such documentation.

[1] https://lore.kernel.org/xen-devel/cover.1696231870.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (2):
  automation/eclair: make the docs for MISRA C:2012 Dir 4.1 visible to
    ECLAIR
  docs/misra: add guidance on the format of  Dir 4.1 docs for ECLAIR

 automation/eclair_analysis/build.sh   | 31 +++++++++++++++++++++++----
 automation/eclair_analysis/prepare.sh |  7 +++---
 docs/misra/C-runtime-failures.rst     |  8 +++++++
 3 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.34.1

