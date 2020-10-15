Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857B928F62F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7523.19757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wq-0006sz-Hq; Thu, 15 Oct 2020 15:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7523.19757; Thu, 15 Oct 2020 15:50:56 +0000
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
	id 1kT5Wq-0006s9-CW; Thu, 15 Oct 2020 15:50:56 +0000
Received: by outflank-mailman (input) for mailman id 7523;
 Thu, 15 Oct 2020 15:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5Wo-0006GR-Re
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5e58849-0ead-484c-8253-532dfd143437;
 Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WQ-00088L-GG
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WQ-0005H7-FM
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WO-0000oB-ON; Thu, 15 Oct 2020 16:50:28 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5Wo-0006GR-Re
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:54 +0000
X-Inumbo-ID: a5e58849-0ead-484c-8253-532dfd143437
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a5e58849-0ead-484c-8253-532dfd143437;
	Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/UKradk/z4OgKrjjcpnOfZ9csQk7I4shSwqTZgX4ibw=; b=1AN05+e+5E0n5jtCCVluZ9s+Mg
	cACAFIPLJyoHMpAVkpkURdXSZFEhoDC323dAUZNgOanvjicq7WHNVsheb9kCFQKyTH1pv4Pv1VsBK
	GBWDZEnUyLX7LmsHDOZ4Q8ExvSW7cbzWIYQQY+/RTnbNEq8o7lxwj1TFvSmFFbodPoDc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-00088L-GG
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-0005H7-FM
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0000oB-ON; Thu, 15 Oct 2020 16:50:28 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 09/17] sg-report-flight: Provide --refer-to-flight option
Date: Thu, 15 Oct 2020 16:50:11 +0100
Message-Id: <20201015155019.20705-10-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This just generates an extra heading and URL at the top of the output.
In particular, it doesn't affect the algorithms which calculate
regressions.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sg-report-flight b/sg-report-flight
index 2ab1637f..bcd896a8 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -42,6 +42,7 @@ our $htmldir;
 our $want_info_headers;
 our ($branch, $branches_cond_q);
 our @allows;
+our (@refer_to_flights);
 our (@includebeginfiles,@includefiles);
 
 open DEBUG, ">/dev/null";
@@ -66,6 +67,8 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
         push @includebeginfiles, $1;
     } elsif (m/^--include=(.*)$/) {
         push @includefiles, $1;
+    } elsif (m/^--refer-to-flight=(.*)$/) {
+        push @refer_to_flights, $1;
     } elsif (restrictflight_arg($_)) {
         # Handled by Executive
     } elsif (m/^--allow=(.*)$/) {
@@ -504,6 +507,16 @@ END
         die unless defined $specflight;
     }
 }
+sub find_refer_to_flights () {
+    my $ffq = $dbh_tests->prepare("SELECT * FROM flights WHERE flight=?");
+    @refer_to_flights = map {
+	my $flight = $_;
+	$ffq->execute($flight);
+	my $row = $ffq->fetchrow_hashref();
+	die "refer to flight $flight not found\n" unless $row;
+	{ Flight => $flight, FlightInfo => $row };
+    } @refer_to_flights;
+}
 
 sub examineflight ($) {
     my ($flight) = @_;
@@ -804,6 +817,10 @@ END
 
     printout_flightheader($r);
 
+    foreach my $ref_r (@refer_to_flights) {
+	printout_flightheader($ref_r);
+    }
+
     if (defined $r->{Overall}) {
         bodyprint "\n";
         bodyprint $r->{Overall};
@@ -1878,6 +1895,7 @@ db_retry($dbh_tests, [], sub {
     if (defined $mro) {
 	open MRO, "> $mro.new" or die "$mro.new $!";
     }
+    find_refer_to_flights();
     findspecflight();
     my $fi= examineflight($specflight);
     my @fails= justifyfailures($fi);
-- 
2.20.1


