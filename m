Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9276F287C2C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4589.12076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNB-0008R0-T9; Thu, 08 Oct 2020 19:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4589.12076; Thu, 08 Oct 2020 19:14:41 +0000
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
	id 1kQbNB-0008Pu-Nt; Thu, 08 Oct 2020 19:14:41 +0000
Received: by outflank-mailman (input) for mailman id 4589;
 Thu, 08 Oct 2020 19:14:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNA-0008Lp-70
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:40 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5df7ad22-b9f2-4ff2-9714-6aae44ef43a1;
 Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0004R6-Fx
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0003q2-DN
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN2-0006So-J0; Thu, 08 Oct 2020 20:14:32 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNA-0008Lp-70
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:40 +0000
X-Inumbo-ID: 5df7ad22-b9f2-4ff2-9714-6aae44ef43a1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5df7ad22-b9f2-4ff2-9714-6aae44ef43a1;
	Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ChVOyZirwRN6GYYGaNTGSTLn1c+zNQzFzRYYMg92a3g=; b=HVb4luVkT4nDBJNxgkuiziSfyB
	H/FFq85YUFlxAz1yUwwmlaRA/axLnjcqwmyq1oFZ9NrYNP55r5b0hKatkOXo3vMQKtmOH4VeJuNTF
	ksINsB/0CGPboMAeDleV2LNmtCk6H4gwzBmT/AEiZHWnngiDwW9bNR/teod6tCCieV0E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0004R6-Fx
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0003q2-DN
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN2-0006So-J0; Thu, 08 Oct 2020 20:14:32 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 02/13] Honour OSSTEST_SIMULATE_FAIL in sg-run-job
Date: Thu,  8 Oct 2020 20:14:11 +0100
Message-Id: <20201008191422.5683-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a Tcl list of globs for <job>.<step>, and allows for
simulating particular test failures.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sg-run-job b/sg-run-job
index dd76d4f2..c64ae026 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -406,7 +406,14 @@ proc spawn-ts {iffail testid args} {
     jobdb::spawn-step-commit $flight $jobinfo(job) $stepno $testid
 
     set xprefix {}
-    if {[var-or-default env(OSSTEST_SIMULATE) 0]} { set xprefix echo }
+    if {[var-or-default env(OSSTEST_SIMULATE) 0]} {
+	set xprefix echo
+	foreach ent [var-or-default env(OSSTEST_SIMULATE_FAIL) {}] {
+	    if {[string match $ent $jobinfo(job).$testid]} {
+		set xprefix OSSTEST_SIMULATE_FAIL
+	    }
+	}
+    }
 
     set log [jobdb::step-log-filename $flight $jobinfo(job) $stepno $ts]
     set redirects {}
-- 
2.20.1


