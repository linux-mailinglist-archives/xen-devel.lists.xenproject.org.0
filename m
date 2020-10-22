Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320F29635A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10596.28256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5L-0002HO-0D; Thu, 22 Oct 2020 17:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10596.28256; Thu, 22 Oct 2020 17:09:06 +0000
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
	id 1kVe5K-0002Gj-Sk; Thu, 22 Oct 2020 17:09:06 +0000
Received: by outflank-mailman (input) for mailman id 10596;
 Thu, 22 Oct 2020 17:09:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5I-0002GB-Su
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e49d44e6-1121-4059-adb0-b8ea33001a15;
 Thu, 22 Oct 2020 17:09:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5H-0005tI-Iv
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:03 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5H-0005V6-GN
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiG-00059e-4k; Thu, 22 Oct 2020 17:45:16 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5I-0002GB-Su
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:04 +0000
X-Inumbo-ID: e49d44e6-1121-4059-adb0-b8ea33001a15
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e49d44e6-1121-4059-adb0-b8ea33001a15;
	Thu, 22 Oct 2020 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jyYAayf5B+K21/iZZz63Au1pWfx5cy+b2HyWQ2k+sfw=; b=E3pXTXt0upA4zBxDHgZwtEZVsm
	wr1soaVACF6w6hzG5J3gaN7ZbKofp1JIgDhaeORq9iEB+dFuRr2pjNabUeFh4bkhT6Qa461KfS4A4
	DnMLAtypNzSwmrIXtDCoFuBQie/n1yEyQvt68n51GUYH2PKFVxyBolqANh+tOeSxXk40=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5H-0005tI-Iv
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:03 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5H-0005V6-GN
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-00059e-4k; Thu, 22 Oct 2020 17:45:16 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 10/16] host reuse fixes: Fix running of steps adhoc
Date: Thu, 22 Oct 2020 17:45:00 +0100
Message-Id: <20201022164506.1552-11-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a ts script is run by hand, for adhoc testing, there is no
OSSTEST_TESTID variable in the environment and the script does not
know it's own step number.  Such adhoc runs are not tracked as steps
in the steps table.

For host lifecycle purposes, treat these as ad-hoc out-of-flight uses,
based only on the taskid (which will usually be a person's personal
static task).

Without this, these adhoc runs fail with a constraint violating trying
to insert a flight/job/step row into the host lifecycle table: the
constraint requires the step to be specified but it is NULL.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 4fa42e5d..04555113 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -588,7 +588,7 @@ END
     };
 
 
-    if (!defined $flight) {
+    if (!defined $flight || !defined $tstepno) {
 	db_retry($dbh_tests,[], sub {
 	    $insertq->execute($hostname, $ttaskid,
 			      undef,undef,
-- 
2.20.1


