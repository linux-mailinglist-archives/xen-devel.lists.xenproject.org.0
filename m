Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFD287C30
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4588.12066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNB-0008Ps-FY; Thu, 08 Oct 2020 19:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4588.12066; Thu, 08 Oct 2020 19:14:41 +0000
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
	id 1kQbNB-0008PL-9t; Thu, 08 Oct 2020 19:14:41 +0000
Received: by outflank-mailman (input) for mailman id 4588;
 Thu, 08 Oct 2020 19:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbN9-0008Lk-CT
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fe6d655-919e-4e1e-9e8e-ff9316426a99;
 Thu, 08 Oct 2020 19:14:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0004RF-H1
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0003qs-GK
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN3-0006So-LB; Thu, 08 Oct 2020 20:14:33 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbN9-0008Lk-CT
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:39 +0000
X-Inumbo-ID: 2fe6d655-919e-4e1e-9e8e-ff9316426a99
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2fe6d655-919e-4e1e-9e8e-ff9316426a99;
	Thu, 08 Oct 2020 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9Pahmn/najHz4bedXTajTfnABim3bLuns9qaaY31+FA=; b=afGK+zxF6x9uECYrUOBwrdu1DR
	eFI7a3coUQeF/RMrGetzuBEJPfDhvAltSegyyeNveMqfEpXAyGChj4M9PW4hO6wUyAtNO7YR4qWWv
	r/pdTgJ7Xw1GQlhB28xeBmoXdag60D6Kgh4zXBjHdYUNcCpQQsYTi52dxmyBXOIyta+0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0004RF-H1
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0003qs-GK
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN3-0006So-LB; Thu, 08 Oct 2020 20:14:33 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 04/13] cri-args-hostlists: New debug var $OSSTEST_REPORT_JOB_HISTORY_RUN
Date: Thu,  8 Oct 2020 20:14:13 +0100
Message-Id: <20201008191422.5683-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

No effect if this is empty.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 6cdff53f..7019c0c7 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -121,6 +121,7 @@ start_email () {
 
 	date >&2
 
+	$OSSTEST_REPORT_JOB_HISTORY_RUN \
 	with-lock-ex -w $globallockdir/report-lock \
 	  ./sg-report-job-history --report-processing-start-time \
 	    --html-dir=$job_html_dir --flight=$flight
-- 
2.20.1


