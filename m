Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0728F66D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7546.19824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5ok-0000kh-FE; Thu, 15 Oct 2020 16:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7546.19824; Thu, 15 Oct 2020 16:09:26 +0000
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
	id 1kT5ok-0000jr-8T; Thu, 15 Oct 2020 16:09:26 +0000
Received: by outflank-mailman (input) for mailman id 7546;
 Thu, 15 Oct 2020 16:09:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5oi-0000WV-SA
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33e90831-08e4-4696-aef3-6363429603ce;
 Thu, 15 Oct 2020 16:09:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5og-0000gb-Fb
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:22 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5og-0006eP-Er
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:22 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WP-0000oB-NK; Thu, 15 Oct 2020 16:50:29 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5oi-0000WV-SA
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:24 +0000
X-Inumbo-ID: 33e90831-08e4-4696-aef3-6363429603ce
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 33e90831-08e4-4696-aef3-6363429603ce;
	Thu, 15 Oct 2020 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=T/OCcqRxeQc9x8tpxs5RGS4FPCqsIq9O+7k8X7cgE7E=; b=x4/oegTzScwg1bFjxBllaeFo5f
	DdYOED9tMHlPQ86HkMWdFYsr+UWXnFQhKl79+h/Cux0yMxM5InJfvqUZfOd+v2W/Fd91004LnnJx9
	gWFDwg0CAqPALj2uN5Pna/HvBNfvNP25FbGJ/5NkP/6j3lwW9Hk8Lnl1LPdKTqjoRqYc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5og-0000gb-Fb
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:22 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5og-0006eP-Er
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:22 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0000oB-NK; Thu, 15 Oct 2020 16:50:29 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 12/17] cri-args-hostlists: Move flight_html_dir variable
Date: Thu, 15 Oct 2020 16:50:14 +0100
Message-Id: <20201015155019.20705-13-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is only used in report_flight.  We are going to want to call
report_flight from outside start_email, without having to set that
variable ourselves.

The variable isn't actually used in start_email.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 52e39f33..52cac195 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -113,7 +113,6 @@ start_email () {
 	printf '%s\n' "`getconfig EmailStdHeaders`"
 	printf 'Subject: %s' "${subject_prefix:-[$branch test] }"
 
-	local flight_html_dir=$OSSTEST_HTMLPUB_DIR/
 	local job_html_dir=$OSSTEST_HTML_DIR/
 	local host_html_dir=$OSSTEST_HTML_DIR/host/
 
@@ -143,6 +142,7 @@ start_email () {
 
 report_flight () {
 	local flight=$1
+	local flight_html_dir=$OSSTEST_HTMLPUB_DIR/
 	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
 		--allow=allow.all --allow=allow.$branch \
 		$sgr_args $flight >tmp/$flight.report
-- 
2.20.1


