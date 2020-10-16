Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94762909FF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8200.21865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSwP-0002lh-M2; Fri, 16 Oct 2020 16:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8200.21865; Fri, 16 Oct 2020 16:50:53 +0000
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
	id 1kTSwP-0002l2-IW; Fri, 16 Oct 2020 16:50:53 +0000
Received: by outflank-mailman (input) for mailman id 8200;
 Fri, 16 Oct 2020 16:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTSwO-0002kW-1P
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:52 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ec779fb-f0ff-45f5-b639-0fd43946a544;
 Fri, 16 Oct 2020 16:50:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSwM-0001df-EY
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSwM-0001Zw-CS
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTSwK-00052F-IL; Fri, 16 Oct 2020 17:50:48 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTSwO-0002kW-1P
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:52 +0000
X-Inumbo-ID: 4ec779fb-f0ff-45f5-b639-0fd43946a544
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4ec779fb-f0ff-45f5-b639-0fd43946a544;
	Fri, 16 Oct 2020 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=oi4GrmO6y5ften/EbtP56tMNPhNNhc9gnYGJmyUO+5s=; b=m5nWLjUVCJTIT0Z5yboCPoRSiv
	xw0oSeBkrjzkn3WG+Yuv/pmGE9HqIRBCI6yVJCU3pbis6tBKz7GDy828Qllh+ZUcrfUpBYdHrdQPc
	R4adMF5I2X7IOCM5lkhqDctqmSwMoBw9R7hyKtJkAiyk+wR0lLT5lsHmgIXpuS0XU+lA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwM-0001df-EY
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwM-0001Zw-CS
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwK-00052F-IL; Fri, 16 Oct 2020 17:50:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/2] sg-run-job: Allow per-job control of test host reuse
Date: Fri, 16 Oct 2020 17:50:40 +0100
Message-Id: <20201016165041.6716-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index c64ae026..69ee715b 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -42,10 +42,11 @@ proc per-host-finish {} {
 }
 
 proc run-job {job} {
-    global jobinfo builds flight ok truncate need_xen_hosts
+    global jobinfo builds flight ok reuse_ok truncate need_xen_hosts
     global nested_layers_hosts truncate_globs skip_globs anyskipped
 
     set ok 1
+    set reuse_ok 1
     set truncate 0
     set anyskipped 0
     jobdb::prepare $job
@@ -128,7 +129,7 @@ proc run-job {job} {
 	run-ts !broken =                  ts-host-reuse final host
     }
     set reuse {}
-    if {$ok} { lappend reuse --post-test-ok }
+    if {$ok && $reuse_ok} { lappend reuse --post-test-ok }
     eval [list per-host-ts !broken  = { ts-host-reuse final }] $reuse
 
     if {$ok} { setstatus pass                                             }
-- 
2.20.1


