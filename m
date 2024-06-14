Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD1908FC4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 18:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740799.1147892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9Y1-0005Vz-Ej; Fri, 14 Jun 2024 16:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740799.1147892; Fri, 14 Jun 2024 16:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9Y1-0005UE-Bh; Fri, 14 Jun 2024 16:13:05 +0000
Received: by outflank-mailman (input) for mailman id 740799;
 Fri, 14 Jun 2024 16:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldK3=NQ=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sI9Y0-0005U8-8E
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 16:13:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f99b2bfb-2a68-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 18:13:02 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-46-197-197.retail.telecomitalia.it [79.46.197.197])
 by support.bugseng.com (Postfix) with ESMTPSA id E03DE4EE0756;
 Fri, 14 Jun 2024 18:13:00 +0200 (CEST)
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
X-Inumbo-ID: f99b2bfb-2a68-11ef-90a3-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] Address violations of MISRA C:2012 Rule 5.3
Date: Fri, 14 Jun 2024 18:12:24 +0200
Message-Id: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope.

In this series are modified files x86/mm.c and x86/e820.c in which occurred
instances of variable names shadowing a global variable; these patches are aimed
to remove said occurrences leading to partial compliance under MISRA C:2012
Rule 5.3.

No functional change.

Alessandro Zucchelli (2):
  x86/mm address violations of MISRA C:2012 Rule 5.3
  x86/e820 address violations of MISRA C:2012 Rule 5.3

 xen/arch/x86/e820.c | 74 ++++++++++++++++++++++-----------------------
 xen/arch/x86/mm.c   | 12 ++++----
 2 files changed, 43 insertions(+), 43 deletions(-)

-- 
2.34.1


