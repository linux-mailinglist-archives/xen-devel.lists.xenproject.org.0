Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E874446A4C2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239779.415764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIs4-0002Pu-1E; Mon, 06 Dec 2021 18:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239779.415764; Mon, 06 Dec 2021 18:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIs3-0002NZ-TT; Mon, 06 Dec 2021 18:37:51 +0000
Received: by outflank-mailman (input) for mailman id 239779;
 Mon, 06 Dec 2021 18:37:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIs1-0002Mh-Mq
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIs1-0004P0-M2
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIs1-0005wH-L1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:49 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZd-0001ab-GN; Mon, 06 Dec 2021 18:18:49 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=I5yXtPyPBnrZoZJSoImKqyDBmegh/vmnKZGykPQCUgw=; b=LKM4x4aOGRg1SL7JkO8jyOpTxl
	4mqvOrGATgpUiY2idBUfn37XvJplz5x5aDacHFnj2gbLKI3uR3aVx59pOwFi3PdCMJyL+7/0MfCVx
	RysZcOYygo2daovJry2ZcX/n+FVeBDRap2//JE7vx/D8I9+coDKhBSnxWekvU6rvGqio=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 11/13] TestSupport: sub broken: document that it does not return.
Date: Mon,  6 Dec 2021 18:18:37 +0000
Message-Id: <20211206181839.23463-12-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index ebe436275..8103ea1d3 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -261,6 +261,7 @@ sub fail ($) {
 sub broken ($;$) {
     my ($m, $newst) = @_;
     # must be run outside transaction
+    # dies or exits
     my $affected;
     $newst= 'broken' unless defined $newst;
     eval {
-- 
2.20.1


