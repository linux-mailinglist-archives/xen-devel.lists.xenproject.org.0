Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D87296300
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10558.28096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiJ-0007Ja-Qa; Thu, 22 Oct 2020 16:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10558.28096; Thu, 22 Oct 2020 16:45:19 +0000
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
	id 1kVdiJ-0007JE-NK; Thu, 22 Oct 2020 16:45:19 +0000
Received: by outflank-mailman (input) for mailman id 10558;
 Thu, 22 Oct 2020 16:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiH-0007J4-LK
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61030cba-ae82-48ad-b164-aef21b3733e6;
 Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0005KI-3b
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0007RI-2W
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiE-00059e-Aq; Thu, 22 Oct 2020 17:45:14 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiH-0007J4-LK
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
X-Inumbo-ID: 61030cba-ae82-48ad-b164-aef21b3733e6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 61030cba-ae82-48ad-b164-aef21b3733e6;
	Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=VA0MrPoomWT3D4MkBrEL/LD+ZtLasw0letLMtdwmVoo=; b=p4+G4XG0pUFpbh94MGkdGu02z5
	WqnNdxe2RlLXu9VjaAGH2FXurQYatuo4cFX0LN8VOud5EL04EqVLbgzy2N+JYEAvZMMm9GVlEw5NJ
	lJNBqLCrTaMXAascAik3c1Cwr34TLJDtSlpopt+Eq0WptgWNnUss9FjtoBlaN+be3ovI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0005KI-3b
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0007RI-2W
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiE-00059e-Aq; Thu, 22 Oct 2020 17:45:14 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 03/16] PDU/IPMI: Retransmit, don't just wait
Date: Thu, 22 Oct 2020 17:44:53 +0100
Message-Id: <20201022164506.1552-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a system for which
   ipmitool -H sabro0m -U root -P XXXX -I lanplus power on
seems to work but doesn't take effect the first time.

Retransit each retry.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/PDU/ipmi.pm | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Osstest/PDU/ipmi.pm b/Osstest/PDU/ipmi.pm
index 98e8957f..21c94d98 100644
--- a/Osstest/PDU/ipmi.pm
+++ b/Osstest/PDU/ipmi.pm
@@ -66,11 +66,12 @@ sub pdu_power_state {
 	return;
     }
 
-    system_checked((@cmd, qw(power), $onoff));
-
     my $count = 60;
     for (;;) {
         last if $getstatus->() eq $onoff;
+
+	system_checked((@cmd, qw(power), $onoff));
+
         die "did not power $onoff" unless --$count > 0;
         sleep(1);
     }
-- 
2.20.1


