Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3928F62E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7522.19746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wm-0006mK-4B; Thu, 15 Oct 2020 15:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7522.19746; Thu, 15 Oct 2020 15:50:52 +0000
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
	id 1kT5Wl-0006l1-VL; Thu, 15 Oct 2020 15:50:51 +0000
Received: by outflank-mailman (input) for mailman id 7522;
 Thu, 15 Oct 2020 15:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5Wj-0006GR-RP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6d92408-c0d2-446a-afef-747eb7d61167;
 Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-000888-Vc
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-0005GM-Um
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WO-0000oB-91; Thu, 15 Oct 2020 16:50:28 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5Wj-0006GR-RP
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:49 +0000
X-Inumbo-ID: d6d92408-c0d2-446a-afef-747eb7d61167
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d6d92408-c0d2-446a-afef-747eb7d61167;
	Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=e3H0s2+WzQtNrHrJPYnYMyg0OSRyEJNxDWc8yLBsrEc=; b=g11WSl3PbOg704AUjUeAfnRHnt
	55RaGFyjVc6ODZWVVFOrP0uH3pNZO5YUsLfMDZhZBfeZPVK+4IhEfJUxO6kPNL//a0o1kpCi+EN6H
	436yHTfkTvRU+Kvapj38GQ2sNfniIWIMlYahKdMNIjnKL34qnQdMe6By+gh+IneR7cpA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-000888-Vc
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0005GM-Um
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0000oB-91; Thu, 15 Oct 2020 16:50:28 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 07/17] cri-args-hostlists: Break out report_flight and publish_logs
Date: Thu, 15 Oct 2020 16:50:09 +0100
Message-Id: <20201015155019.20705-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

NFC.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cri-args-hostlists | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 7019c0c7..52e39f33 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -128,10 +128,7 @@ start_email () {
 
 	date >&2
 
-	./sg-report-flight --report-processing-start-time \
-	        --html-dir=$flight_html_dir/$flight/ \
-		--allow=allow.all --allow=allow.$branch \
-		$sgr_args $flight >tmp/$flight.report
+	report_flight $flight
 	./cr-fold-long-lines tmp/$flight.report
 
 	date >&2
@@ -144,11 +141,23 @@ start_email () {
 	date >&2
 }
 
+report_flight () {
+	local flight=$1
+	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
+		--allow=allow.all --allow=allow.$branch \
+		$sgr_args $flight >tmp/$flight.report
+}
+
+publish_logs () {
+	local flight=$1
+	./cr-publish-flight-logs ${OSSTEST_PUSH_HARNESS- --push-harness} \
+	    $flight >&2
+}
+
 publish_send_email () {
 	local flight=$1
+	publish_logs $flight
 	exec >&2
-	./cr-publish-flight-logs ${OSSTEST_PUSH_HARNESS- --push-harness} \
-	    $flight
 	send_email tmp/$flight.email
 }
 
-- 
2.20.1


