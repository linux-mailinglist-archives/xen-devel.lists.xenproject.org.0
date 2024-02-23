Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96039860D8C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684683.1064685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRWX-00086T-Rm; Fri, 23 Feb 2024 09:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684683.1064685; Fri, 23 Feb 2024 09:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRWX-000845-MR; Fri, 23 Feb 2024 09:07:17 +0000
Received: by outflank-mailman (input) for mailman id 684683;
 Fri, 23 Feb 2024 09:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXte=KA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rdRWV-00083u-Sw
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:07:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0b37b7-d22a-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:07:13 +0100 (CET)
Received: from Dell.bugsneg.com (unknown [37.161.242.66])
 by support.bugseng.com (Postfix) with ESMTPSA id 5290C4EE073F;
 Fri, 23 Feb 2024 10:07:12 +0100 (CET)
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
X-Inumbo-ID: ef0b37b7-d22a-11ee-98f5-efadbce2ee36
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/2] automation/eclair: update deviations and tags
Date: Fri, 23 Feb 2024 10:06:58 +0100
Message-Id: <cover.1708677243.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deviate Rules 5.7 and 18.7.

Tag Rule 8.2 ad clean.

Federico Serafini (2):
  automation/eclair: fully deviate MISRA C:2012 Rules 5.7 and 18.7
  automation/eclair: tag MISRA C:2012 Rule 8.2 as clean

 automation/eclair_analysis/ECLAIR/deviations.ecl | 14 ++++++++++++++
 automation/eclair_analysis/ECLAIR/tagging.ecl    |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.34.1


