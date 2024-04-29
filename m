Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D18B5D66
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714216.1115335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpV-0002tA-WF; Mon, 29 Apr 2024 15:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714216.1115335; Mon, 29 Apr 2024 15:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpV-0002rR-TE; Mon, 29 Apr 2024 15:22:09 +0000
Received: by outflank-mailman (input) for mailman id 714216;
 Mon, 29 Apr 2024 15:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDZ7=MC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s1SpT-0002rB-Qw
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:22:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d07f806-063c-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:22:06 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 8EC554EE0738;
 Mon, 29 Apr 2024 17:22:05 +0200 (CEST)
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
X-Inumbo-ID: 3d07f806-063c-11ef-909b-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/3] automation/eclair: do not allow failure for triggered analyses
Date: Mon, 29 Apr 2024 17:21:56 +0200
Message-Id: <cover.1714401209.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1/3 does some preparation work.

Patch 2/3, as the title says, removes allow_failure = true for triggered
analyses.

Patch 3/3 makes explicit that initally no files are tagged as adopted, this
is needed by the scheduled analysis.

Federico Serafini (3):
  automation/eclair: tag Rule 7.2 as clean and temporarily remove Rules
    1.1 and 8.2
  automation: do not allow failure for triggered analyses
  automation/eclair: make explicit there are no adopted files by default

 automation/eclair_analysis/ECLAIR/analysis.ecl | 4 ++++
 automation/eclair_analysis/ECLAIR/tagging.ecl  | 2 +-
 automation/gitlab-ci/analyze.yaml              | 1 -
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1


