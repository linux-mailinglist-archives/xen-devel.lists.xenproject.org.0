Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B223F7754CC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 10:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580759.909160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFk-0003EF-HP; Wed, 09 Aug 2023 08:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580759.909160; Wed, 09 Aug 2023 08:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFk-0003Bg-Eg; Wed, 09 Aug 2023 08:09:12 +0000
Received: by outflank-mailman (input) for mailman id 580759;
 Wed, 09 Aug 2023 08:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohew=D2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qTeFj-0003Ba-Bg
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 08:09:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0459be0a-368c-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 10:09:09 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 848F64EE073F;
 Wed,  9 Aug 2023 10:09:08 +0200 (CEST)
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
X-Inumbo-ID: 0459be0a-368c-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/3] automation/eclair: update ECL configurations and builds
Date: Wed,  9 Aug 2023 10:07:58 +0200
Message-Id: <cover.1691568344.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains new ECL configurations and adds some build options
in the ARM64 build.

Simone Ballarin (3):
  automation/eclair: update clean guidelines
  automation/eclair: add ECL deviations
  automation/eclair: update analyzed builds

 .../eclair_analysis/ECLAIR/deviations.ecl     | 34 ++++++++-----------
 automation/eclair_analysis/ECLAIR/tagging.ecl | 17 ++++++++--
 automation/eclair_analysis/xen_arm_config     | 14 +++-----
 automation/eclair_analysis/xen_x86_config     |  9 -----
 4 files changed, 34 insertions(+), 40 deletions(-)

-- 
2.34.1


