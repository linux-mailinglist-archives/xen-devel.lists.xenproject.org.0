Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B628F62D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7521.19734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wh-0006dR-FB; Thu, 15 Oct 2020 15:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7521.19734; Thu, 15 Oct 2020 15:50:47 +0000
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
	id 1kT5Wh-0006cR-6h; Thu, 15 Oct 2020 15:50:47 +0000
Received: by outflank-mailman (input) for mailman id 7521;
 Thu, 15 Oct 2020 15:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5We-0006GR-RR
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a670aa57-38dc-4535-97dc-1bc30af5c51d;
 Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-000882-JI
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-0005Fq-IS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WN-0000oB-PA; Thu, 15 Oct 2020 16:50:27 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5We-0006GR-RR
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:44 +0000
X-Inumbo-ID: a670aa57-38dc-4535-97dc-1bc30af5c51d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a670aa57-38dc-4535-97dc-1bc30af5c51d;
	Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9Pahmn/najHz4bedXTajTfnABim3bLuns9qaaY31+FA=; b=unmqpZyDago95DXw00wFDinbP4
	Ewy2V1ZSOw3/0aBYfww8ftOk4YPyIH9V7WfPz0ngDwfM+At55jWSdctFxhM5F6UeuGJyRgbTAvm7+
	Y7X3EL8D+T2GjpByD82SOCIN41pJ/l5RtBHTbdjGHbhrZ4uuRMCng7LQaTaU9enXoCZs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-000882-JI
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0005Fq-IS
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WN-0000oB-PA; Thu, 15 Oct 2020 16:50:27 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 06/17] cri-args-hostlists: New debug var $OSSTEST_REPORT_JOB_HISTORY_RUN
Date: Thu, 15 Oct 2020 16:50:08 +0100
Message-Id: <20201015155019.20705-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
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


