Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8ED29ADB8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12863.33335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPHH-000287-8v; Tue, 27 Oct 2020 13:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12863.33335; Tue, 27 Oct 2020 13:44:43 +0000
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
	id 1kXPHH-00027W-4F; Tue, 27 Oct 2020 13:44:43 +0000
Received: by outflank-mailman (input) for mailman id 12863;
 Tue, 27 Oct 2020 13:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPHF-0001b2-7f
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ba1eb07-fff5-4634-a0eb-c9e6eb2c3882;
 Tue, 27 Oct 2020 13:44:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-0007w9-TI
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-00025I-RV
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGd-0002Uo-4S; Tue, 27 Oct 2020 13:44:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPHF-0001b2-7f
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:41 +0000
X-Inumbo-ID: 2ba1eb07-fff5-4634-a0eb-c9e6eb2c3882
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2ba1eb07-fff5-4634-a0eb-c9e6eb2c3882;
	Tue, 27 Oct 2020 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=wq7mzu+ToDMU3LijsJ/aE5ctMgAPIjBlbDtSDRbuAHo=; b=KFP2JGznwmC3nlWKz5vo4yJ1xs
	6OHQE5SgihgX6Hoqr5tqEy/obBhH63LYdRCir5GTNPytlIkCZBBP7/Qewo4NfqlBJG0H/VvenCK2A
	da5yPGEz31JU6hu9nMFwqZqL7rCQW0je8S55Va7sUVMEocySGzQX0xqFnsnrdT3e8RPA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-0007w9-TI
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-00025I-RV
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-0002Uo-4S; Tue, 27 Oct 2020 13:44:03 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 6/7] PDU::snmp, PDU::msw: Rename from msw to snmp
Date: Tue, 27 Oct 2020 13:43:53 +0000
Message-Id: <20201027134354.25561-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retain the old name for compatibility with existing configuration.

No change other than to messages.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/PDU/msw.pm  | 14 +-------------
 Osstest/PDU/snmp.pm | 39 +++++++++++++++++++++++++++++++++++++++
 README              |  9 ++++++---
 3 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 Osstest/PDU/snmp.pm

diff --git a/Osstest/PDU/msw.pm b/Osstest/PDU/msw.pm
index 614216d4..099ef778 100644
--- a/Osstest/PDU/msw.pm
+++ b/Osstest/PDU/msw.pm
@@ -22,18 +22,6 @@ use warnings;
 
 use Osstest;
 
-use parent qw(Osstest::PDU::unsupported);
-
-sub new {
-    my ($class, $ho, $methname, @args) = @_;
-
-    return bless { Args => \@args }, $class;
-}
-
-sub pdu_power_state {
-    my ($mo, $on) = @_;
-    my $onoff= $on ? "on" : "off";
-    system_checked("./pdu-snmp @{ $mo->{Args} } $onoff");
-}
+use parent qw(Osstest::PDU::snmp);
 
 1;
diff --git a/Osstest/PDU/snmp.pm b/Osstest/PDU/snmp.pm
new file mode 100644
index 00000000..dca60df7
--- /dev/null
+++ b/Osstest/PDU/snmp.pm
@@ -0,0 +1,39 @@
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2013 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+
+package Osstest::PDU::snmp;
+
+use strict;
+use warnings;
+
+use Osstest;
+
+use parent qw(Osstest::PDU::unsupported);
+
+sub new {
+    my ($class, $ho, $methname, @args) = @_;
+
+    return bless { Args => \@args }, $class;
+}
+
+sub pdu_power_state {
+    my ($mo, $on) = @_;
+    my $onoff= $on ? "on" : "off";
+    system_checked("./pdu-snmp @{ $mo->{Args} } $onoff");
+}
+
+1;
diff --git a/README b/README
index 70f8ae73..33c4d2cc 100644
--- a/README
+++ b/README
@@ -654,9 +654,9 @@ HostProp_<host>_PowerILOM
         manual          Asks the user on the controlling terminal
         unsupported     Fails whenever a power operation is needed
 
-        msw [--apc6] <pdu> <port-name-regexp|port-num>
-             Control an APC masterswitch via SNMP.  The SNMP
-             community is `private'.  See the `pdu-snmp' script.
+        snmp --<model> <pdu> <port-name-regexp|port-num>
+             Control a PDU via SNMP.  The SNMP community is `private'.
+             See the `pdu-snmp' script for supported model names.
 
         ipmi <mgmt> [<user> [<pass> [<ipmitool options...>]]]
              Use IPMI by (by running ipmitool).  <mgmt> is the name or
@@ -667,6 +667,9 @@ HostProp_<host>_PowerILOM
              Does nothing if `on|off|both' is inapplicable, and has
              less error checking and less defaulting than ipmi.
 
+        msw ....
+             Deprecated alias for snmp.
+
         Supported specially are:
 
         <delay>
-- 
2.20.1


