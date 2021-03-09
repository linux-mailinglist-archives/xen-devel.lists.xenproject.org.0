Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0E332913
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95514.180334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdge-000401-5J; Tue, 09 Mar 2021 14:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95514.180334; Tue, 09 Mar 2021 14:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdge-0003zO-0N; Tue, 09 Mar 2021 14:50:16 +0000
Received: by outflank-mailman (input) for mailman id 95514;
 Tue, 09 Mar 2021 14:50:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-0003zB-DE
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-0000wC-7a
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-00052P-6M
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lJdga-0003Go-8I; Tue, 09 Mar 2021 14:50:12 +0000
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
	bh=RzxvfHJokDsv+18cnaKl++7V5AArLUMaNSi6hR4ytuw=; b=g6LSOEc/Z5tPoiX+/tylwLidtK
	zQfcY6z+LKe02rqMg/HqOXw6j9rYh7DEJpUEzIYVBIxn7lBzZjYC8HAiJk1/5X+DGtyAE3l/zTONG
	+EjGK1dx8VP6ijobYCyYY/4G+y4O5kHcwhVWiUBBeqF8FOXhRM8mR9n0sgsk0SCoqWbc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 4.15 0/2] Start 4.15 changelog
Date: Tue,  9 Mar 2021 14:49:59 +0000
Message-Id: <20210309145002.30359-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The administriva parts of this (1/, 2/) is a little belated.

For for the substance 3/ I have information from SUPPORT.md.  There is
much other information to put here but right now there are several
blockers in tree and I don't want to distract from fixing them.

I had a look through the git logs but it's really hard to see the wood
for the trees.  I will go and diff some docs.

If anyone feels like sending me updates for CHANGELOG.md that would be
welcome, but I will send out a further call for contributions later.

Ian Jackson (3):
  MAINTAINERS: Make myself the owner of the changelog
  CHANGELOG.md: Clear out 4.14 stuff and start 4.15 info
  CHANGELOG.md: Glean some information from SUPPORT.md

 CHANGELOG.md | 33 +++++++++------------------------
 MAINTAINERS  |  2 +-
 2 files changed, 10 insertions(+), 25 deletions(-)

-- 
2.20.1


