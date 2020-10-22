Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BA2962FE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10564.28169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiX-0007c1-TE; Thu, 22 Oct 2020 16:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10564.28169; Thu, 22 Oct 2020 16:45:33 +0000
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
	id 1kVdiX-0007b2-No; Thu, 22 Oct 2020 16:45:33 +0000
Received: by outflank-mailman (input) for mailman id 10564;
 Thu, 22 Oct 2020 16:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiW-0007J4-GJ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bfb5d76-f5c8-40c1-9df1-aa70e381cd8b;
 Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0005KF-Pr
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0007Qx-Ot
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiE-00059e-38; Thu, 22 Oct 2020 17:45:14 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiW-0007J4-GJ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:32 +0000
X-Inumbo-ID: 1bfb5d76-f5c8-40c1-9df1-aa70e381cd8b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1bfb5d76-f5c8-40c1-9df1-aa70e381cd8b;
	Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=pVToY0m3Sc+yduYNkjYcp+9aOZ5fk0ZnWu2I935eP+I=; b=mbfhseFH6bQXqaNQMBa7wubdjY
	9aJgs0UHrwf56Pda0zztYS98M3mWdtQ6SCMltkv5tbQPsMMvKmwWmy7+kYJqDoSPewOzimwKQvPtj
	anFermhV+Lf2ugm+sMI1Biz8GkQUQLKANSVWRTimvAPBtjYK4nG3be9szLR0PwHEsVao=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0005KF-Pr
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0007Qx-Ot
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiE-00059e-38; Thu, 22 Oct 2020 17:45:14 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 02/16] share in jobdb: Move out-of-flight special case higher up
Date: Thu, 22 Oct 2020 17:44:52 +0100
Message-Id: <20201022164506.1552-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids running the runvar computation loop outside flights.
This is good amongst other things because that loop prints warnings
about undef $flight and $job.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 071f31f1..4fa42e5d 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -587,6 +587,18 @@ END
 	$constraintsq->fetchrow_array() or confess "$hostname ?";
     };
 
+
+    if (!defined $flight) {
+	db_retry($dbh_tests,[], sub {
+	    $insertq->execute($hostname, $ttaskid,
+			      undef,undef,
+			      undef,
+			      undef,undef);
+	    $checkconstraints->();
+	});
+	return;
+    }
+
     my $ojvn = "$ho->{Ident}_lifecycle";
 
     if (length $r{$ojvn}) {
@@ -660,26 +672,17 @@ END
 	    }
 	}
 
-	if (defined $flight) {
-	    $insertq->execute($hostname, $ttaskid,
-			      $flight, $job,
-			      ($mode eq 'selectprep')+0,
+	$insertq->execute($hostname, $ttaskid,
+			  $flight, $job,
+			  ($mode eq 'selectprep')+0,
                 # ^ DBD::Pg doesn't accept perl canonical false for bool!
                 #   https://rt.cpan.org/Public/Bug/Display.html?id=133229
-			      $tident, $tstepno);
-	} else {
-	    $insertq->execute($hostname, $ttaskid,
-			      undef,undef,
-			      undef,
-			      undef,undef);
-	}
+			  $tident, $tstepno);
 	$checkconstraints->();
     });
 
-    if (defined $flight) {
-	push @lifecycle, $newsigil if length $newsigil;
-	store_runvar($ojvn, "@lifecycle");
-    }
+    push @lifecycle, $newsigil if length $newsigil;
+    store_runvar($ojvn, "@lifecycle");
 }
 
 sub current_stepno ($) { #method
-- 
2.20.1


