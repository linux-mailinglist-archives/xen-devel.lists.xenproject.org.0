Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9D286712
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3728.11192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAq-0005EG-TM; Wed, 07 Oct 2020 18:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3728.11192; Wed, 07 Oct 2020 18:28:24 +0000
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
	id 1kQEAp-00059i-Ad; Wed, 07 Oct 2020 18:28:23 +0000
Received: by outflank-mailman (input) for mailman id 3728;
 Wed, 07 Oct 2020 18:28:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3U-00072Q-JQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:48 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63ddb3e7-36d5-4845-aacd-4b3ceeeb0b9b;
 Wed, 07 Oct 2020 18:19:48 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkB-0007CF-VH; Wed, 07 Oct 2020 19:00:52 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3U-00072Q-JQ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:48 +0000
X-Inumbo-ID: 63ddb3e7-36d5-4845-aacd-4b3ceeeb0b9b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 63ddb3e7-36d5-4845-aacd-4b3ceeeb0b9b;
	Wed, 07 Oct 2020 18:19:48 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkB-0007CF-VH; Wed, 07 Oct 2020 19:00:52 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 76/82] sg-report-flight: Reformat slightly
Date: Wed,  7 Oct 2020 19:00:18 +0100
Message-Id: <20201007180024.7932-77-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is more regular and will make the next commit easier to
understand.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 0413a730..7dc218cf 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1472,9 +1472,11 @@ END
 	  $srow->{tident},
 	  "$c{ResultsHtmlPubBaseUrl}/host/$srow->{hostname}.html",
 	  $srow->{hostname};
-	my $rel = $srow->{olive} ?
+	my $rel =
+	  $srow->{olive} ?
 	  "<td align=\"center\" bgcolor=\"$red\">share</td>"
-	  : $srow->{prep_started} ?
+	  :
+	  $srow->{prep_started} ?
 	  "<td align=\"center\" bgcolor=\"$purple\">prep.</td>"
 	  :
 	  "<td align=\"center\">reuse</td>";
-- 
2.20.1


