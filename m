Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8F45A942
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229784.397296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0T-0004Q8-LV; Tue, 23 Nov 2021 16:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229784.397296; Tue, 23 Nov 2021 16:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0T-0004OL-IH; Tue, 23 Nov 2021 16:50:57 +0000
Received: by outflank-mailman (input) for mailman id 229784;
 Tue, 23 Nov 2021 16:50:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0R-0004Nw-JO
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0R-0007yu-Gs
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0R-0000Re-Fg
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:55 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mpZ0P-00073B-CK; Tue, 23 Nov 2021 16:50:53 +0000
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
	bh=KITrTSK7PkaAEwbfEZCFh3Db1KPpHJ0nM4gGWg26FJg=; b=RIpEdYU1CHswjsNth/4cMWn2Tk
	bENIibk8C+vZIee6D9oCo3JW2g+aOIkgTJDNCkrYlGPjWbzaE03imxYzpd7xNDq9nbnUhcqKFAxjM
	8KLwgfMBsGMrbsN5rPtvH2IixK5XAcJbA/foejLIfk+Ou3LDW4dINQ8g6aOxykeWQTIg=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.16 0/3] Changes from release technician checklist
Date: Tue, 23 Nov 2021 16:50:41 +0000
Message-Id: <20211123165044.29546-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am about to push these to xen.git#staging-4.16.

Roger, I have not messed with the furniture in CHANGELOG.md on either
staging-4.16 or staging.

Ian.

Ian Jackson (3):
  Config.mk: switch to named tags (for stable branch)
  SUPPORT.md: Set Release Notes link
  Turn off debug by default

 Config.mk         | 8 +++-----
 SUPPORT.md        | 4 ++--
 tools/Rules.mk    | 2 +-
 xen/Kconfig.debug | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.20.1

