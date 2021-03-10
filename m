Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B73342D1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96207.181833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1UR-0005A6-LJ; Wed, 10 Mar 2021 16:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96207.181833; Wed, 10 Mar 2021 16:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1UR-00059h-HI; Wed, 10 Mar 2021 16:15:15 +0000
Received: by outflank-mailman (input) for mailman id 96207;
 Wed, 10 Mar 2021 16:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-00059N-1d
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0005wA-0f
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UP-0008J1-VZ
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lK1UO-0006gF-6o; Wed, 10 Mar 2021 16:15:12 +0000
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
	bh=nKJhwlsQyr5FIFxPgIYngPFt2WkRaA5VnrAWq3JncXQ=; b=Aku1C5M3p8wQiwt0tZEA0ssNSL
	g9eOIHpnacpab6zTMG8mGyxghw3Nv1oEGOsOrVcYfGqUx9PF0DvDPbCWEGxEWSUg/nL65QiqMvPnu
	32r6C0Dhnc4VG8rm2a6XA20LytgNhUdXVTjSt5yJWP55oztBpIh6ieJKLYTH5llqU56I=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH 4.15 v2 0/3] Start 4.15 changelog
Date: Wed, 10 Mar 2021 16:14:58 +0000
Message-Id: <20210310161501.13680-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The administriva parts of this (1/, 2/) are a little belated.

For for the substance 3/ I have information from SUPPORT.md.  There is
much other information to put here but right now there are several
blockers in tree and I don't want to distract from fixing them.
I had a look through the git logs but it's really hard to see the wood
for the trees.  I still intend to go and diff some docs.

If anyone feels like sending me updates for CHANGELOG.md that would be
welcome, but I will send out a further call for contributions later.

Thanks to the reviewers of v1; I have taken those comments on board.
If there are no prompt objections I will commit this shortly.

Ian Jackson (3):
  MAINTAINERS: Make myself the owner of the changelog
  CHANGELOG.md: Add sections for 4.14 (belated) and 4.15 (prospective)
  CHANGELOG.md: Glean some information from SUPPORT.md

 CHANGELOG.md                                  | 15 ++++++++++++++-
 MAINTAINERS                                   |  2 +-
 docs/process/release-technician-checklist.txt |  2 ++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.20.1


