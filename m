Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC628F669
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7543.19788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5oV-0000YS-F7; Thu, 15 Oct 2020 16:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7543.19788; Thu, 15 Oct 2020 16:09:11 +0000
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
	id 1kT5oV-0000Xz-BT; Thu, 15 Oct 2020 16:09:11 +0000
Received: by outflank-mailman (input) for mailman id 7543;
 Thu, 15 Oct 2020 16:09:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5oT-0000WV-Rf
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6149a3bf-9f7e-44f6-b055-eb9cb7ea1ec5;
 Thu, 15 Oct 2020 16:09:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oN-0000g0-Hg
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:03 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oN-0006ay-ER
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WP-0000oB-FP; Thu, 15 Oct 2020 16:50:29 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5oT-0000WV-Rf
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:09 +0000
X-Inumbo-ID: 6149a3bf-9f7e-44f6-b055-eb9cb7ea1ec5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6149a3bf-9f7e-44f6-b055-eb9cb7ea1ec5;
	Thu, 15 Oct 2020 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=pacL1ullUVs7eBNosppLBDynVv2r14S6C90c7shdrs4=; b=ymWNHGrAQqb+8EtIaJSaYB3mJx
	rTiYue9Ejhobk1qFqt/o2f0h/em6GcGqfMG8YTa8pFNdpf2TX5LT3Ti/RPfIJe4wrrxRBWsalNA1r
	7izg5bd8uAl+CKhOrV/k/sMNd/Fcnq97HODaqFGXitgdOqKNVf0E8msu6JvxP/g/RZ8U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oN-0000g0-Hg
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:03 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oN-0006ay-ER
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0000oB-FP; Thu, 15 Oct 2020 16:50:29 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 11/17] Introduce real-retry blessing
Date: Thu, 15 Oct 2020 16:50:13 +0100
Message-Id: <20201015155019.20705-12-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Nothing produces this yet.  (There's play-retry as well of course but
we don't need to document that really.)

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 README.dev          | 9 +++++----
 cr-daily-branch     | 3 ++-
 cr-disk-report      | 2 +-
 cr-try-bisect       | 4 ++--
 cr-try-bisect-adhoc | 2 +-
 cs-bisection-step   | 4 ++--
 sg-report-flight    | 2 +-
 7 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/README.dev b/README.dev
index 2cbca109..3d09b3c6 100644
--- a/README.dev
+++ b/README.dev
@@ -381,10 +381,11 @@ These are the principal (intended) blessings:
    commissioning, and that blessing removed and replaced with `real'
    when the hosts are ready.
 
- * `real-bisect' and `adhoc-bisect': These are found only as the
-   blessing of finished flights.  (This is achieved by passing
-   *-bisect to sg-execute-flight.)  This allows the archaeologist
-   tools to distinguish full flights from bisection steps.
+ * `real-bisect', `real-retry', `adhoc-bisect': These are found only
+   as the blessing of finished flights.  (This is achieved by passing
+   *-bisect or *-retry to sg-execute-flight.)  This allows the
+   archaeologist tools to distinguish full flights from bisection
+   steps and retries.
 
    The corresponding intended blessing (as found in the `intended'
    column of the flights table) is `real'.  So the hosts used by the
diff --git a/cr-daily-branch b/cr-daily-branch
index 23060588..285ea361 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -76,7 +76,8 @@ case $branch in
 	treeurl=`./ap-print-url $branch`;;
 esac
 
-blessings_arg=--blessings=${DAILY_BRANCH_TESTED_BLESSING:-real}
+blessings_arg=${DAILY_BRANCH_TESTED_BLESSING:-real}
+blessings_arg=--blessings=${blessings_arg},${blessings_arg}-retest
 sgr_args+=" $blessings_arg"
 
 force_baseline='' # Non-empty = indication why we are forcing baseline.
diff --git a/cr-disk-report b/cr-disk-report
index 543d35bf..d76fd72f 100755
--- a/cr-disk-report
+++ b/cr-disk-report
@@ -38,7 +38,7 @@ our $graphs_px=0;
 our $graphs_py=0;
 open DEBUG, ">/dev/null" or die $!;
 
-our @blessings = qw(real real-bisect);
+our @blessings = qw(real real-retry real-bisect);
 # for these blessings column is       "<blessing> <branch>"
 # for other blessings column is       "<intended> [<blessing>]"
 
diff --git a/cr-try-bisect b/cr-try-bisect
index a2b77b9a..6adc2bcc 100755
--- a/cr-try-bisect
+++ b/cr-try-bisect
@@ -59,7 +59,7 @@ compute_state_done_callback () {
 compute_state_callback () {
 	compute_state_core \
 		--basis-template=$basisflight \
-                --blessings=$OSSTEST_BLESSING,$OSSTEST_BLESSING-bisect \
+                --blessings=$OSSTEST_BLESSING,$OSSTEST_BLESSING-bisect,$OSSTEST_BLESSING-retry \
                 "$@" $branch $job $testid
 }
 
@@ -78,7 +78,7 @@ perhaps_bisect_step () {
                 echo "already completed $branch $job $testid"
                 return
         fi
-        perhaps_bisect_step_core $OSSTEST_BLESSING $OSSTEST_BLESSING-bisect
+        perhaps_bisect_step_core $OSSTEST_BLESSING $OSSTEST_BLESSING-bisect $OSSTEST_BLESSING-real
 }
 
 subject_prefix="[$branch bisection]"
diff --git a/cr-try-bisect-adhoc b/cr-try-bisect-adhoc
index caadfd80..c2cfa475 100755
--- a/cr-try-bisect-adhoc
+++ b/cr-try-bisect-adhoc
@@ -49,7 +49,7 @@ export OSSTEST_BLESSING=adhoc
 
 compute_state_callback () {
 	compute_state_core \
-        	--blessings=real,real-bisect,adhoc-bisect \
+        	--blessings=real,real-retry,real-bisect,adhoc-bisect \
                 $bisect "$@" $branch $job $testid
 }
 
diff --git a/cs-bisection-step b/cs-bisection-step
index 762966da..8b391448 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -7,7 +7,7 @@
 # usage:
 #   ./cs-bisection-setup [<options>] <branch> <job> <testid>
 # options, usually:
-#      --blessings=real,real-bisect
+#      --blessings=real,real-retry,real-bisect
 #
 # First entry in --blessings list is the blessing of the basis
 # (non-bisection) flights.  This should not be the same as the
@@ -45,7 +45,7 @@ use HTML::Entities;
 use Osstest::Executive;
 use URI::Escape;
 
-our @blessings= qw(real real-bisect);
+our @blessings= qw(real real-retry real-bisect);
 our @revtuplegenargs= ();
 our $broken;
 
diff --git a/sg-report-flight b/sg-report-flight
index cbd39599..51a409ed 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -120,7 +120,7 @@ die if defined $specver{this}{flight};
 die if defined $specver{that}{flight} &&
     grep { $_ ne 'flight' } keys %{ $specver{that} };
 
-push @blessings, 'real', 'real-bisect' unless @blessings;
+push @blessings, 'real', 'real-retry', 'real-bisect' unless @blessings;
 
 csreadconfig();
 
-- 
2.20.1


