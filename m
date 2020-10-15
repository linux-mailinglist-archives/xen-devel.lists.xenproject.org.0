Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5C28F66B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7544.19800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5oa-0000c1-MY; Thu, 15 Oct 2020 16:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7544.19800; Thu, 15 Oct 2020 16:09:16 +0000
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
	id 1kT5oa-0000bX-JP; Thu, 15 Oct 2020 16:09:16 +0000
Received: by outflank-mailman (input) for mailman id 7544;
 Thu, 15 Oct 2020 16:09:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5oY-0000WV-Rm
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd9e91f7-be31-4013-a56f-e8777305bc8c;
 Thu, 15 Oct 2020 16:09:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oV-0000gF-CJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:11 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oV-0006c9-BS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:11 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WQ-0000oB-6Q; Thu, 15 Oct 2020 16:50:30 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5oY-0000WV-Rm
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:14 +0000
X-Inumbo-ID: fd9e91f7-be31-4013-a56f-e8777305bc8c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fd9e91f7-be31-4013-a56f-e8777305bc8c;
	Thu, 15 Oct 2020 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=sjdvYyM1PnXhPbXqN8m96KPPeA795n+928eEa0JNcoo=; b=rkJjFYWXXI5rcMm20svd5AyiKo
	wD//qzGLFyxtvnmo/nqrCsX9lTuJB1NwS+KXH2h2mdHDCEuPrThi1A0jwl1xWL+HFm7b8HkmIS5EM
	vck74Xe4WaZ+T5VoJ40m4SK9/P9INOd59mc/6f8u17cqvvNrgejc7a57P5B7VD/VGi1I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oV-0000gF-CJ
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:11 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oV-0006c9-BS
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:11 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-0000oB-6Q; Thu, 15 Oct 2020 16:50:30 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 14/17] Honour OSSTEST_SIMULATE_FAIL_RETRY for immediate retries
Date: Thu, 15 Oct 2020 16:50:16 +0100
Message-Id: <20201015155019.20705-15-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
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


