Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7EC29ADB1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12857.33285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPGw-0001lL-TF; Tue, 27 Oct 2020 13:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12857.33285; Tue, 27 Oct 2020 13:44:22 +0000
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
	id 1kXPGw-0001kn-Pk; Tue, 27 Oct 2020 13:44:22 +0000
Received: by outflank-mailman (input) for mailman id 12857;
 Tue, 27 Oct 2020 13:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPGv-0001b2-7P
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a14440a3-c76a-4308-aae1-ceb979216295;
 Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-0007vx-UJ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-00023g-TN
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGc-0002Uo-7J; Tue, 27 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPGv-0001b2-7P
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:21 +0000
X-Inumbo-ID: a14440a3-c76a-4308-aae1-ceb979216295
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a14440a3-c76a-4308-aae1-ceb979216295;
	Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=xllzJu2rVf2X8UnmOfyzoIVs8umEVd2ts2o3jPuGX7A=; b=QERZ262VuOMUg98KAxp3jEQxUj
	OcoMDfabWuGwEjNd/YgRs/CfWLM8/rKXq6mRNfOSyJu3PW2z8p1uNTZTZFRb3LBsJ0VB6w67d6IeN
	u4h7mudX1C74P9dWyiYR7M/U5DXd6cP92v/zxswYvUuwdxvxbVLMG63H7inddR5jhbXg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-0007vx-UJ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-00023g-TN
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGc-0002Uo-7J; Tue, 27 Oct 2020 13:44:02 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/7] pdu-snmp: Rename from pdu-msw
Date: Tue, 27 Oct 2020 13:43:49 +0000
Message-Id: <20201027134354.25561-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are going to make this script control PDUs other than APC ones.

No overall functional change for internal callers.  Anyone out-of-tree
using this script will need to change the name of the program they run.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/PDU/msw.pm  | 2 +-
 README              | 2 +-
 pdu-msw => pdu-snmp | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename pdu-msw => pdu-snmp (95%)

diff --git a/Osstest/PDU/msw.pm b/Osstest/PDU/msw.pm
index 19d9f56b..614216d4 100644
--- a/Osstest/PDU/msw.pm
+++ b/Osstest/PDU/msw.pm
@@ -33,7 +33,7 @@ sub new {
 sub pdu_power_state {
     my ($mo, $on) = @_;
     my $onoff= $on ? "on" : "off";
-    system_checked("./pdu-msw @{ $mo->{Args} } $onoff");
+    system_checked("./pdu-snmp @{ $mo->{Args} } $onoff");
 }
 
 1;
diff --git a/README b/README
index ef6c4e60..70f8ae73 100644
--- a/README
+++ b/README
@@ -656,7 +656,7 @@ HostProp_<host>_PowerILOM
 
         msw [--apc6] <pdu> <port-name-regexp|port-num>
              Control an APC masterswitch via SNMP.  The SNMP
-             community is `private'.  See the `pdu-msw' script.
+             community is `private'.  See the `pdu-snmp' script.
 
         ipmi <mgmt> [<user> [<pass> [<ipmitool options...>]]]
              Use IPMI by (by running ipmitool).  <mgmt> is the name or
diff --git a/pdu-msw b/pdu-snmp
similarity index 95%
rename from pdu-msw
rename to pdu-snmp
index c57f9f7c..581a60b0 100755
--- a/pdu-msw
+++ b/pdu-snmp
@@ -19,7 +19,7 @@
 
 my $usagemsg= <<END;
 usage:
-  pdu-msw SWITCH-DNS-NAME PORT-NAME-REGEXP|PORT [[delayed-]on|off|0|1|reboot]
+  pdu-snmp SWITCH-DNS-NAME PORT-NAME-REGEXP|PORT [[delayed-]on|off|0|1|reboot]
 END
 
 use strict qw(refs vars);
@@ -89,7 +89,7 @@ if ($outlet =~ m/^\d+$/) {
                    ($t->[2] ? '*' : ''),
                    $t->[0], $t->[1]);
         }
-        die "pdu-msw $dnsname: ".
+        die "pdu-snmp $dnsname: ".
             (@found ? "multiple ports match" : "no ports match").
             "\n";
     }
@@ -119,7 +119,7 @@ sub get () {
 
 sub show () {
     my $mean = get();
-    printf "pdu-msw $dnsname: #%s \"%s\" = %s\n", $useport, $usename, $mean;
+    printf "pdu-snmp $dnsname: #%s \"%s\" = %s\n", $useport, $usename, $mean;
     return $mean;
 }
 
-- 
2.20.1


