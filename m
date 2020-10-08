Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEB287C34
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4595.12147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNR-0000Sr-6I; Thu, 08 Oct 2020 19:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4595.12147; Thu, 08 Oct 2020 19:14:57 +0000
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
	id 1kQbNR-0000Qc-1J; Thu, 08 Oct 2020 19:14:57 +0000
Received: by outflank-mailman (input) for mailman id 4595;
 Thu, 08 Oct 2020 19:14:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNP-0008Lp-7b
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f973d24-873e-46a8-bcde-8c3007f0adab;
 Thu, 08 Oct 2020 19:14:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN6-0004RR-Ba
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:36 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN6-0003rk-Ag
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:36 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN4-0006So-H8; Thu, 08 Oct 2020 20:14:34 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNP-0008Lp-7b
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:55 +0000
X-Inumbo-ID: 9f973d24-873e-46a8-bcde-8c3007f0adab
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9f973d24-873e-46a8-bcde-8c3007f0adab;
	Thu, 08 Oct 2020 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jdLmqoSD6rDtlzGT0JaoPu0SLWweyf2QtJXodAcLoIs=; b=M1XpsdZqmQsGnsgADvoCw34qln
	jwEZXO3ISx42rvA/ViFuHHH0KyN2ZFwZPtqsxUIFPGJbyABrc+pxclLivEAx621td/F3lKwJjTW0S
	6N6/R5X2K/7bVcpU2ldKHwx9dIcD0ox7dV40iyxxzsiNaMNIMUTCbHJTMgNzIWW6h5TE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN6-0004RR-Ba
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:36 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN6-0003rk-Ag
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:36 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0006So-H8; Thu, 08 Oct 2020 20:14:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/13] sg-report-flight: Break out printout_flightheader
Date: Thu,  8 Oct 2020 20:14:15 +0100
Message-Id: <20201008191422.5683-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index a07e03cb..4b33facb 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -783,6 +783,14 @@ sub includes ($) {
     }
 }    
 
+sub printout_flightheader ($) {
+    my ($r) = @_;
+    bodyprint <<END;
+flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
+$c{ReportHtmlPubBaseUrl}/$r->{Flight}/
+END
+}
+
 sub printout {
     my ($r, @failures) = @_;
     $header_text = '';
@@ -793,10 +801,9 @@ sub printout {
 $r->{Flight}: $r->{OutcomeSummary}
 END
     includes(\@includebeginfiles);
-    bodyprint <<END;
-flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
-$c{ReportHtmlPubBaseUrl}/$r->{Flight}/
-END
+
+    printout_flightheader($r);
+
     if (defined $r->{Overall}) {
         bodyprint "\n";
         bodyprint $r->{Overall};
-- 
2.20.1


