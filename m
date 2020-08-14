Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B686F244DA3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTj-0004ft-Ra; Fri, 14 Aug 2020 17:26:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dR8-00024Q-Ih
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:14 +0000
X-Inumbo-ID: 6b5755eb-4432-4471-9473-e8db0f7611cc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b5755eb-4432-4471-9473-e8db0f7611cc;
 Fri, 14 Aug 2020 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XmWan6OFdoSDp1zEPNim1kFyWC0CH8DOuEHNE4WvvE4=;
 b=M5h0ExAPZVnrWTFUNrE89pkZsws3f3haiic7K9iAV9x8fgSaxAP3Y3vZ
 LNXZPohjnOVhTOjifiIgyp/lgK0NwWnVoVnVxpXZqD6pm/URIiujQus5J
 3bdA1UahD1OH0LL/7DYe7qQxCVlzKeFnFY8wYE4O9BYINXEnEY+8mEx05 o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RbQPsOt4BO8h0D6vJ8aPEhpNu3oLmc0qdbt0ewN4gzhFQPkSIpR2DEJ7yr1jiUYcuislsWGmg3
 FbLC48Wdj29gtostV3Fb6dN+PO/Wdrru0yIZm/zrfeOND5XZfE5i2bL0sF7lVw9DErTMxnW0OQ
 hN3A0TQ24Fls56aOCx3L8AFVpMYtWAEbUm4NUdOpRB5GKpI7BnPvAuCqdVaetgCLb3/48hhciJ
 5C5h4DkY57nUe+fwmHW4YlBAkWFGGUlxJaC4Aids1Ef6SFLNDNvU4KMi9o4Zh+bZbqToVtbsVw
 UG4=
X-SBRS: 2.7
X-MesageID: 24576910
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576910"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/60] history reporting (nfc): Rename "existing" to
 "previous"
Date: Fri, 14 Aug 2020 18:21:13 +0100
Message-ID: <20200814172205.9624-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This seems more idiomatic use of English.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 2724ef27..f37dd4a2 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -32,7 +32,7 @@ our $limit= 2000;
 our $timelimit= 86400 * (366 + 14);
 our $flightlimit;
 our $htmlout = ".";
-our $read_existing=1;
+our $read_previous=1;
 our $doinstall=1;
 our $maxjobs=10;
 our @blessings;
@@ -58,7 +58,7 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
     } elsif (m/^--html-dir=(.*)$/) {
         $htmlout= $1;
     } elsif (m/^--regenerate$/) {
-        $read_existing= 0;
+        $read_previous= 0;
     } elsif (m/^--no-install$/) {
         $doinstall= 0;
     } elsif (m/^--debug/) {
@@ -84,7 +84,7 @@ sub cache_row_key ($) {
     return join $; , map { $jr->{$_} } @cache_row_key_cols;
 }
 
-sub cache_read_existing ($) {
+sub cache_read_previous ($) {
     my ($html_file) = @_;
     if (!open H, $html_file) {
         return if $!==ENOENT;
@@ -501,7 +501,7 @@ foreach my $host (sort keys %hosts) {
     my $pid = fork // die $!;
     if (!$pid) {
 	opendb_tests();
-	cache_read_existing("$htmlout/$host.html") if $read_existing;
+	cache_read_previous("$htmlout/$host.html") if $read_previous;
 	db_retry($dbh_tests, [], sub {
             mainquery($host);
 	    reporthost $host;
-- 
2.11.0


