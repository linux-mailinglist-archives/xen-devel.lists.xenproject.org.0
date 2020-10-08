Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3575287C92
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4624.12248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbl0-0003jO-E2; Thu, 08 Oct 2020 19:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4624.12248; Thu, 08 Oct 2020 19:39:18 +0000
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
	id 1kQbl0-0003if-9t; Thu, 08 Oct 2020 19:39:18 +0000
Received: by outflank-mailman (input) for mailman id 4624;
 Thu, 08 Oct 2020 19:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbky-0003hn-QU
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a5a942f-8fc3-4da1-8101-93938b5f8d44;
 Thu, 08 Oct 2020 19:39:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbky-0004z7-1J
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkx-0005PW-Vh
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN7-0006So-6d; Thu, 08 Oct 2020 20:14:37 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbky-0003hn-QU
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:16 +0000
X-Inumbo-ID: 8a5a942f-8fc3-4da1-8101-93938b5f8d44
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8a5a942f-8fc3-4da1-8101-93938b5f8d44;
	Thu, 08 Oct 2020 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=sjdvYyM1PnXhPbXqN8m96KPPeA795n+928eEa0JNcoo=; b=buqk5P9CeNW/avktkVxJlwMMIz
	cKnL2ED0j3xq0Z1AD+G+3ZUZ7lNZupIYRopQoS/YBv0oaRCagb6drCYwFjWJxUDlFIj5XXr5U9xWb
	S8DPeKW1hU+YBJVacfELEi5MaixS6DetQ4Qw1TOJYSFq+YfpSwOrgboT7jxg+lzyi3xg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbky-0004z7-1J
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkx-0005PW-Vh
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0006So-6d; Thu, 08 Oct 2020 20:14:37 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 12/13] Honour OSSTEST_SIMULATE_FAIL_RETRY for immediate retries
Date: Thu,  8 Oct 2020 20:14:21 +0100
Message-Id: <20201008191422.5683-13-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is primarily useful for debugging the immediate-retry logic, but
it seems churlish to delete it again.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/cr-daily-branch b/cr-daily-branch
index bea8734e..3e58d465 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -517,6 +517,10 @@ while true; do
 		--branch=$branch --revision-osstest=$narness_rev \
 		'^build-*' --debug --blessings=real
 
+	if [ "${OSSTEST_SIMULATE_FAIL_RETRY+y}" = y ]; then
+		export OSSTEST_SIMULATE_FAIL="${OSSTEST_SIMULATE_FAIL_RETRY}"
+	fi
+
 	export OSSTEST_RESOURCE_WAITSTART=$original_start
 	execute_flight $rflight $OSSTEST_BLESSING-retest
 	report_flight $rflight
-- 
2.20.1


