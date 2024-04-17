Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2CB8A8C36
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 21:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707736.1105956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5s-0004a1-UC; Wed, 17 Apr 2024 19:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707736.1105956; Wed, 17 Apr 2024 19:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5s-0004XS-Pq; Wed, 17 Apr 2024 19:37:20 +0000
Received: by outflank-mailman (input) for mailman id 707736;
 Wed, 17 Apr 2024 19:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCN8=LW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxB5q-0004XH-Mi
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 19:37:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f4002b-fcf1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 21:37:17 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 3C4874EE073C;
 Wed, 17 Apr 2024 21:37:15 +0200 (CEST)
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
X-Inumbo-ID: e5f4002b-fcf1-11ee-b909-491648fe20b8
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v3 0/2] address violations of MISRA C Rule 16.2
Date: Wed, 17 Apr 2024 21:37:10 +0200
Message-Id: <cover.1713382466.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A respin of the last two patches from the previous series.
No changes other than the different SAF comment id because SAF-4-safe was
already taken.

Nicola Vetrini (2):
  xen/domctl: address violations of MISRA C Rule 16.2
  eclair_analysis: deviate x86 emulator for Rule 16.2

 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 6 ++++++
 docs/misra/safe.json                             | 8 ++++++++
 xen/common/domain.c                              | 1 +
 4 files changed, 22 insertions(+)

-- 
2.34.1

