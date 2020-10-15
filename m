Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7328F66C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7548.19848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5os-0000tN-6z; Thu, 15 Oct 2020 16:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7548.19848; Thu, 15 Oct 2020 16:09:34 +0000
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
	id 1kT5os-0000sf-1O; Thu, 15 Oct 2020 16:09:34 +0000
Received: by outflank-mailman (input) for mailman id 7548;
 Thu, 15 Oct 2020 16:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5oq-0000mi-UO
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b574eae-3e04-4a0f-bdce-bb8145bcf898;
 Thu, 15 Oct 2020 16:09:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5op-0000gy-LC
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:31 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5op-0006g4-KA
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:31 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WQ-0000oB-PH; Thu, 15 Oct 2020 16:50:30 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5oq-0000mi-UO
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:32 +0000
X-Inumbo-ID: 7b574eae-3e04-4a0f-bdce-bb8145bcf898
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7b574eae-3e04-4a0f-bdce-bb8145bcf898;
	Thu, 15 Oct 2020 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/E/dZdst6zLSlIoKGnfjgU1l91GnjdF0tvF6OifHDMo=; b=CDw6OgNva7Jc9kANBV8ub63OU5
	Z4obG4I7LgAvfcTDkI3XGp0QSS5xJSdstWVWEvrlRY3bn87mXJqSRfsoijN74T5zrRaULsaE7b4Xm
	7CQ2Npcvs/F5cgVCfLwliuj06uC9QmJ22n0txD39LKwKESfO3Y4LWtTkdWvYpYFPIzYc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5op-0000gy-LC
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:31 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5op-0006g4-KA
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:31 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-0000oB-PH; Thu, 15 Oct 2020 16:50:30 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 16/17] sg-report-flight: Include count of blockers, and of jobs, in mro
Date: Thu, 15 Oct 2020 16:50:18 +0100
Message-Id: <20201015155019.20705-17-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mro will now contain exactly one of "blockers" or "tolerable".

Nothing uses this yet.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sg-report-flight b/sg-report-flight
index 51a409ed..fd266586 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1128,13 +1128,16 @@ END
     }
 
     if (!$heisen_why) {
+	my $n_blockers = scalar grep { $_->{Blocker} } @failures;
+	print MRO "njobs ", scalar(@{ $fi->{JobTexts} }), "\n";
+	print MRO "nblockers $n_blockers\n" if $n_blockers;
 	if (!@failures) {
 	    print MRO "tolerable\nperfect\n" or die $!;
 	    $fi->{Overall}.= "Perfect :-)\n";
 	} elsif (grep { $_->{Blocker} eq 'regression' } @failures) {
 	    $fi->{OutcomeSummary}= "regressions - $fi->{OutcomeSummary}";
 	    $fi->{Overall}.= "Regressions :-(\n";
-	} elsif (!grep { $_->{Blocker} } @failures) {
+	} elsif (!$n_blockers) {
 	    $fi->{OutcomeSummary}= "tolerable $fi->{OutcomeSummary}";
 	    print MRO "tolerable\n" or die $!
 		unless defined $heisen_why;
-- 
2.20.1


