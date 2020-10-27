Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7629ADAF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12856.33274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPGr-0001gn-LH; Tue, 27 Oct 2020 13:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12856.33274; Tue, 27 Oct 2020 13:44:17 +0000
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
	id 1kXPGr-0001gG-HC; Tue, 27 Oct 2020 13:44:17 +0000
Received: by outflank-mailman (input) for mailman id 12856;
 Tue, 27 Oct 2020 13:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPGq-0001b2-78
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca71bba4-5000-4fcb-9d25-00ed036ea09f;
 Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-0007w0-7T
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-00024D-5h
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGc-0002Uo-Eu; Tue, 27 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPGq-0001b2-78
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:16 +0000
X-Inumbo-ID: ca71bba4-5000-4fcb-9d25-00ed036ea09f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ca71bba4-5000-4fcb-9d25-00ed036ea09f;
	Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=juiCgnMY9/QgNhWg1mZv5w6KyG10Ju4wvLuPHHdxwak=; b=cfmBjS2VvCrPXT2Enw1FWAmqvT
	+e13+JUKzFNeQ7nHxEEzB4eNuVRR8UJNo70aN+Eb7Hnpjqlp6KZ34HUA1tdHOYrsO9AbQMLpAiy85
	+LT8/tLo2aelV1/pvS+qUY3siqYvkVbzKFZyHjhviEhlv5ANufpOWqQivOU37qULxlCA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-0007w0-7T
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-00024D-5h
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGc-0002Uo-Eu; Tue, 27 Oct 2020 13:44:02 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/7] pdu-snmp: Centralise base OIDs
Date: Tue, 27 Oct 2020 13:43:50 +0000
Message-Id: <20201027134354.25561-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not hardcoode .3 and .4 in the main logic.

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-snmp | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/pdu-snmp b/pdu-snmp
index 581a60b0..a4918f53 100755
--- a/pdu-snmp
+++ b/pdu-snmp
@@ -27,8 +27,11 @@ use Net::SNMP;
 use Data::Dumper;
 
 my $community= 'private';
+
 my $baseoid= '.1.3.6.1.4.1.318.1.1.4.4.2.1';
 my $baseoid_write= "$baseoid.3";
+my $baseoid_name= "$baseoid.4";
+my $baseoid_read= "$baseoid.3";
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
     $_ = shift @ARGV;
@@ -52,7 +55,7 @@ die "SNMP error $error " unless defined $session;
 
 sub getname ($) {
     my ($port) = @_;
-    my $oid= "$baseoid.4.$port";
+    my $oid= "$baseoid_name.$port";
     my $res= $session->get_request($oid);
     if ($res) {
         my $name= $res->{$oid};
@@ -96,7 +99,7 @@ if ($outlet =~ m/^\d+$/) {
     ($useport,$usename)= @{ $found[0] };
 }
 
-my $read_oid= "$baseoid.3.$useport";
+my $read_oid= "$baseoid_read.$useport";
 my $write_oid= "$baseoid_write.$useport";
 
 my @map= (undef, qw(
-- 
2.20.1


