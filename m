Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633236CAC4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118788.225037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0q-00027p-Ox; Tue, 27 Apr 2021 18:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118788.225037; Tue, 27 Apr 2021 18:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0q-00027O-Lp; Tue, 27 Apr 2021 18:00:44 +0000
Received: by outflank-mailman (input) for mailman id 118788;
 Tue, 27 Apr 2021 18:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-000279-DZ
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-0004pc-Aw
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0p-0001lJ-9A
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:43 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0n-0003ln-8q; Tue, 27 Apr 2021 19:00:41 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=pT4CoDCgL5NrpGe49CSBrGo4Pg7w41vK4bXDlDYaoAg=; b=uZsl5TIZbbY5yxRq+4csWKLPp2
	mmdzPFNjQZXTvdHYUzqf77xYhXY+dHtp0Q52nfsvk5CF4QShUEdAtPtI2G+OACdGIB8/Z+R9kXMce
	K6rB6WjLU0PJk1/ep3yo0dk+2BwuNnnE7QEVeAfWr363Hd81nhnDEv6yfxPCRoOnLp9U=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 0/7] Fixes for postgresql etc. upgrade
Date: Tue, 27 Apr 2021 19:00:26 +0100
Message-Id: <20210427180033.9439-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Evidently it has been a while since I last ran this script since
it really didn't work at all.  Fix it.

Ian Jackson (7):
  mg-schema-test-database: posgtres compat: psql transactions
  mg-schema-test-database: Be slightly more defensive
  mg-schema-test-database: posgtres compat: Cope with schema name
  mg-schema-test-database: GetOpt compat: work around arg bundling bug
  mg-schema-test-database: posgtres compat: Sequences
  mg-schema-test-database: Fix following host_lifecycle
  mg-schema-test-database: posgtres compat: tidy messages

 mg-schema-create        |  2 +-
 mg-schema-test-database | 41 +++++++++++++++++++++++++----------------
 2 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.20.1


