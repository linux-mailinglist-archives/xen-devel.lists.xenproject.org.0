Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5782909CC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8186.21818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSiZ-0000iB-FE; Fri, 16 Oct 2020 16:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8186.21818; Fri, 16 Oct 2020 16:36:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSiZ-0000hi-Ao; Fri, 16 Oct 2020 16:36:35 +0000
Received: by outflank-mailman (input) for mailman id 8186;
 Fri, 16 Oct 2020 16:36:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTSiY-0000fz-4h
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45b47129-a002-42b0-b25a-756216792b4a;
 Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiR-0001KS-V9
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:27 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiR-0008DH-TH
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTSiP-0004zo-Tx; Fri, 16 Oct 2020 17:36:26 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTSiY-0000fz-4h
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:34 +0000
X-Inumbo-ID: 45b47129-a002-42b0-b25a-756216792b4a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 45b47129-a002-42b0-b25a-756216792b4a;
	Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=KMKNzsrzb73R7NSUV3lC+qhLhryXWiv87mxwA+2FYvE=; b=dmEGiXJ43dABmSvfydSCn0JAiH
	t3T8SPLO2wGb0uHD7W8dCUd3BRTxwStR/FNeVds1RErlp15lnQqon7Ro50ctmdzXIAdu1NpfTbZuU
	ppTO0xHDVSqX7BlTgYUG3PLUFkuD8kB+2LZeylFs61PvUv5+XO8/AROi3+ruu/i62vfo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiR-0001KS-V9
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:27 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiR-0008DH-TH
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiP-0004zo-Tx; Fri, 16 Oct 2020 17:36:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/3] known_hosts handling: Fix over-broad SQL query
Date: Fri, 16 Oct 2020 17:36:13 +0100
Message-Id: <20201016163615.5086-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should match only "*_host" and "host".  We don't want it matching
"*host" without a "_".

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index f2d8a0e1..5e6b15d9 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2796,7 +2796,7 @@ sub known_hosts () {
 
     my $hostsq= $dbh_tests->prepare(<<END);
         SELECT val FROM runvars
-         WHERE flight=? AND name LIKE '%host'
+         WHERE flight=? AND (name = 'host' OR name LIKE '%\\_host')
          GROUP BY val
 END
     $hostsq->execute($flight);
-- 
2.20.1


