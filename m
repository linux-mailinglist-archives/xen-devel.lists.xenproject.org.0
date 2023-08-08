Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70D773A1D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579748.907858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk2-00059l-1P; Tue, 08 Aug 2023 12:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579748.907858; Tue, 08 Aug 2023 12:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk1-00057l-UP; Tue, 08 Aug 2023 12:23:13 +0000
Received: by outflank-mailman (input) for mailman id 579748;
 Tue, 08 Aug 2023 12:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTLk0-0004sp-S1
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:23:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56056ff7-35e6-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 14:23:10 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DA9164EE0737;
 Tue,  8 Aug 2023 14:23:08 +0200 (CEST)
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
X-Inumbo-ID: 56056ff7-35e6-11ee-8613-37d641c3527e
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 0/2] x86: address MISRA C:2012 Rule 5.3 and 8.3
Date: Tue,  8 Aug 2023 14:22:49 +0200
Message-Id: <cover.1691488505.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is the part of series [1] that needed further adjustments. The first
two patches of that series are already committed.
The changes in this version are detailed in the individual commit messages.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg00492.html

Nicola Vetrini (2):
  x86/vmsi: rename variables to address MISRA C:2012 Rule 5.3
  x86/setup: address MISRA C:2012 Rule 5.3 and 8.3

 xen/arch/x86/hvm/vmsi.c          | 46 ++++++++++++++++----------------
 xen/arch/x86/include/asm/setup.h |  2 +-
 xen/arch/x86/setup.c             |  3 +--
 3 files changed, 25 insertions(+), 26 deletions(-)

-- 
2.34.1


