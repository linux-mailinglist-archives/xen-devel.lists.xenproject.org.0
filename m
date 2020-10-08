Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F547287C31
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4592.12114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNL-0000FM-5t; Thu, 08 Oct 2020 19:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4592.12114; Thu, 08 Oct 2020 19:14:51 +0000
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
	id 1kQbNK-0000Dv-SX; Thu, 08 Oct 2020 19:14:50 +0000
Received: by outflank-mailman (input) for mailman id 4592;
 Thu, 08 Oct 2020 19:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNJ-0008Lk-Cp
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 416f730f-5ee2-4de1-9eb9-1ac8d5dc2294;
 Thu, 08 Oct 2020 19:14:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN7-0004Rh-94
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN7-0003sr-8D
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN5-0006So-CS; Thu, 08 Oct 2020 20:14:35 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNJ-0008Lk-Cp
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:49 +0000
X-Inumbo-ID: 416f730f-5ee2-4de1-9eb9-1ac8d5dc2294
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 416f730f-5ee2-4de1-9eb9-1ac8d5dc2294;
	Thu, 08 Oct 2020 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Oq5CHXwRLYwRce8o8pCzzReKPSkGwMOpuff7iZeMKgQ=; b=rr/uDGHWHd6MHYYEVEgQlIJHvW
	4udzSG1lv9NsnZ8Gc5LQsioCLB/VTKMaLSWGdLodAM6K6yaLy0g1KUbPsLZ6X7LZ6yWOJXdb5HAzb
	5EzVD2VfP+iQRym3dPL1+OlWwF0Fdph4c42Fy/YkRESvg9Tix1E0AEFZfaM/mlzkm5Yc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0004Rh-94
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0003sr-8D
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0006So-CS; Thu, 08 Oct 2020 20:14:35 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 08/13] sg-report-flight: Nicer output for --refer-to-flight option
Date: Thu,  8 Oct 2020 20:14:17 +0100
Message-Id: <20201008191422.5683-9-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the flight summary lines together, before the URLs.  This makes
it considerably easier to read.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index d9f0b964..f6ace190 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -796,12 +796,17 @@ sub includes ($) {
     }
 }    
 
-sub printout_flightheader ($) {
-    my ($r) = @_;
-    bodyprint <<END;
+sub printout_flightheaders {
+    foreach my $r (@_) {
+	bodyprint <<END;
 flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
+END
+    }
+    foreach my $r (@_) {
+	bodyprint <<END;
 $c{ReportHtmlPubBaseUrl}/$r->{Flight}/
 END
+    }
 }
 
 sub printout {
@@ -814,12 +819,7 @@ sub printout {
 $r->{Flight}: $r->{OutcomeSummary}
 END
     includes(\@includebeginfiles);
-
-    printout_flightheader($r);
-
-    foreach my $ref_r (@refer_to_flights) {
-	printout_flightheader($ref_r);
-    }
+    printout_flightheaders $r, @refer_to_flights;
 
     if (defined $r->{Overall}) {
         bodyprint "\n";
-- 
2.20.1


