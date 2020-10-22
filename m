Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C0296302
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10568.28193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdii-0007tL-0w; Thu, 22 Oct 2020 16:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10568.28193; Thu, 22 Oct 2020 16:45:43 +0000
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
	id 1kVdih-0007sR-PU; Thu, 22 Oct 2020 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 10568;
 Thu, 22 Oct 2020 16:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdig-0007J4-GN
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16143a18-e853-431d-a4a4-b49a52ec336c;
 Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0005KC-J3
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0007Qi-H8
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiD-00059e-Pb; Thu, 22 Oct 2020 17:45:13 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdig-0007J4-GN
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:42 +0000
X-Inumbo-ID: 16143a18-e853-431d-a4a4-b49a52ec336c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 16143a18-e853-431d-a4a4-b49a52ec336c;
	Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=V79wG/LQmL2k7Tyv4zkT6Uv1QsFd5R/iMJN6smjFWKQ=; b=vkinM3MIoJN07Athigc4mvVWxC
	LGxBzYZc9nN3fYT4Uo3b7H2XpVHUb/Lp5P4IPZ6nGxlfUxmWKZcRHQ2WnV7jbl/ZNGlRpu20EX1sk
	qFAyyFWk3kKPSsraoAWMq2uzY5Y40a8wcuMUDsqJOC6a4j1oo8Mbb5kB+HokgSVMO7Is=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0005KC-J3
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0007Qi-H8
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiD-00059e-Pb; Thu, 22 Oct 2020 17:45:13 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 01/16] share in jobdb: Break out $checkconstraints and move call
Date: Thu, 22 Oct 2020 17:44:51 +0100
Message-Id: <20201022164506.1552-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This must happen after we introduce our new row or it is not
effective!

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index f69ce277..071f31f1 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -582,6 +582,11 @@ END
           VALUES (?,        ?,      ?,      ?,   ?,      ?,     ?     )
 END
 
+    my $checkconstraints = sub {
+	$constraintsq->execute($hostname, $ttaskid);
+	$constraintsq->fetchrow_array() or confess "$hostname ?";
+    };
+
     my $ojvn = "$ho->{Ident}_lifecycle";
 
     if (length $r{$ojvn}) {
@@ -654,8 +659,6 @@ END
 		push @lifecycle, "$omarks$otj:$o->{stepno}$osuffix";
 	    }
 	}
-	$constraintsq->execute($hostname, $ttaskid);
-	$constraintsq->fetchrow_array() or confess "$hostname ?";
 
 	if (defined $flight) {
 	    $insertq->execute($hostname, $ttaskid,
@@ -670,6 +673,7 @@ END
 			      undef,
 			      undef,undef);
 	}
+	$checkconstraints->();
     });
 
     if (defined $flight) {
-- 
2.20.1


