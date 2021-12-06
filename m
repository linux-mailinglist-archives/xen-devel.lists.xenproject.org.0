Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B370469975
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239185.414565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFIP-0004A2-Ij; Mon, 06 Dec 2021 14:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239185.414565; Mon, 06 Dec 2021 14:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFIP-00047T-FO; Mon, 06 Dec 2021 14:48:49 +0000
Received: by outflank-mailman (input) for mailman id 239185;
 Mon, 06 Dec 2021 14:48:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muFIO-000467-13
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:48:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muFIN-0007fS-Va
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:48:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muFIN-0005td-Ui
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:48:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muFIH-0000he-Ip; Mon, 06 Dec 2021 14:48:41 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=UW2k1BtVHnHqEg+VZyCrefmLxXbX7VEIKtelnPPraTo=; b=FdcPLk5stZRTlzf2v/pSm6T9T+
	f0eP9v0mhIQ2IEMRWBnEH6uE6QLjWeUDpwRTOSWDhH2My/OO5LPgYu8Gqt5Ct4jMwLidfY/JoOvQB
	zd2Q87IuLRlY1qLy1pqB1cTMnmSQBPpzZyh2Yk+jm1RgAMdvFZHOeNgjOpr5n/qMuWMw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25006.8899.913446.519189@mariner.uk.xensource.com>
Date: Mon, 6 Dec 2021 14:48:35 +0000
To: xen-devel@lists.xenproject.org
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Doug Goldstein <cardoe@cardoe.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: [PATCH for-xen-stable] MAINTAINERS: Resign from my tools stable branch maintainership

As below.  CCing many people out of staging's MAINTAINERS entries for
bits of tools/.

I will be applying this shortly, to all stable trees, because I need
to do something about the just-released 4.16 tree and it will be
easier if I just make that like the others.

Note that my @citrix and @eu.citrix email was already wrong here, for
some time - Citrix corporate email was not working well, so I changed
my MAINTAINERS entries a year or two ago, but apparently I overlooked
it.

My iwj@xenproject mail will continue to work.

Ian.

From c623a84c2a4fda1cd25f5347a6298706218eb5fb Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 6 Dec 2021 14:40:24 +0000
Subject: [PATCH for-xen-stable] MAINTAINERS: Resign from tools stable branch
 maintainership

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85f660c30f..f4c08d0b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -60,7 +60,7 @@ The maintainer for this branch is:
 
 Tools backport requests should also be copied to:
 
-	Ian Jackson <Ian.Jackson@eu.citrix.com>
+	TODO - Loooking for new tools stable maintainer
 
 
 	Unstable Subsystem Maintainers
-- 
2.20.1


