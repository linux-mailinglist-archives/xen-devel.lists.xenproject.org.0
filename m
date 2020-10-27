Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699629ADB5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12859.33311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPH7-0001wJ-Ik; Tue, 27 Oct 2020 13:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12859.33311; Tue, 27 Oct 2020 13:44:33 +0000
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
	id 1kXPH7-0001vc-Ew; Tue, 27 Oct 2020 13:44:33 +0000
Received: by outflank-mailman (input) for mailman id 12859;
 Tue, 27 Oct 2020 13:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPH5-0001b2-7V
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:31 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f23b889a-f9db-4df0-bd39-42713a532765;
 Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-0007w3-Ee
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-00024b-CL
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGc-0002Uo-MM; Tue, 27 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPH5-0001b2-7V
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:31 +0000
X-Inumbo-ID: f23b889a-f9db-4df0-bd39-42713a532765
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f23b889a-f9db-4df0-bd39-42713a532765;
	Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=0tVI4eo+1zS+zccZupV965ruxpbEgNilUw/RkAp3VIk=; b=En0amqcxDJ3ef96nNC1ptH1/zK
	DB0rGug4qsKF16JkFyfKhngx78Cuxc41vBRIfbC162XkQrjjxcSf4IpA3DNXg6Jo2MZYZMgDNf4iW
	Vzd4OsS/fTggZ3EFUAJuZBOkeisplk9C4E7vKbgo1t2kQ/GOMG/9Nfr2wqF+5o5he2Yg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-0007w3-Ee
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-00024b-CL
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGc-0002Uo-MM; Tue, 27 Oct 2020 13:44:02 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/7] pdu-snmp: Refactor model handling
Date: Tue, 27 Oct 2020 13:43:51 +0000
Message-Id: <20201027134354.25561-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it easier to see waht is going on and to add new model(s).

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-snmp | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/pdu-snmp b/pdu-snmp
index a4918f53..74244145 100755
--- a/pdu-snmp
+++ b/pdu-snmp
@@ -28,15 +28,28 @@ use Data::Dumper;
 
 my $community= 'private';
 
-my $baseoid= '.1.3.6.1.4.1.318.1.1.4.4.2.1';
-my $baseoid_write= "$baseoid.3";
-my $baseoid_name= "$baseoid.4";
-my $baseoid_read= "$baseoid.3";
+our ($baseoid, $baseoid_write, $baseoid_name, $baseoid_read);
+
+sub model_msw () {
+    # APC MasterSwitch
+    $baseoid= '.1.3.6.1.4.1.318.1.1.4.4.2.1';
+    $baseoid_name= "$baseoid.4";
+    $baseoid_read= "$baseoid.3";
+    $baseoid_write= "$baseoid.3";
+}
+
+sub model_apc6 () {
+    # APC MasterSwitch protocol version 6 (?)
+    model_msw();
+    $baseoid_write= '.1.3.6.1.4.1.318.1.1.12.3.3.1.1.4';
+}
+
+my $model_name = 'msw';
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
     $_ = shift @ARGV;
-    if (m/^--apc6$/) {
-	$baseoid_write= '.1.3.6.1.4.1.318.1.1.12.3.3.1.1.4';
+    if (m/^--(\w+)$/ && ${*::}{"model_$1"}) {
+	$model_name= $1;
     } else {
 	die "$_ ?";
     }
@@ -44,6 +57,8 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
 
 if (@ARGV<2 || @ARGV>3 || $ARGV[0] =~ m/^-/) { die "bad usage\n$usagemsg"; }
 
+${*::}{"model_$model_name"}->();
+
 our ($max_retries) = 16; # timeout = 0.05 * max_retries^2
 our ($dnsname,$outlet,$action) = @ARGV;
 
-- 
2.20.1


