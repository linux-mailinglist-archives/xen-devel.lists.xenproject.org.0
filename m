Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476529635B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10595.28244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5F-0002F8-NR; Thu, 22 Oct 2020 17:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10595.28244; Thu, 22 Oct 2020 17:09:01 +0000
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
	id 1kVe5F-0002Ej-K0; Thu, 22 Oct 2020 17:09:01 +0000
Received: by outflank-mailman (input) for mailman id 10595;
 Thu, 22 Oct 2020 17:09:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5E-0002Eb-7k
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfec223b-9a9f-4bac-8dd4-dfbb138bdaa5;
 Thu, 22 Oct 2020 17:08:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5C-0005sw-UZ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:08:58 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5C-0005Tq-TA
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:08:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiG-00059e-L7; Thu, 22 Oct 2020 17:45:16 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5E-0002Eb-7k
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:00 +0000
X-Inumbo-ID: dfec223b-9a9f-4bac-8dd4-dfbb138bdaa5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dfec223b-9a9f-4bac-8dd4-dfbb138bdaa5;
	Thu, 22 Oct 2020 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jomMV8uxLbcen1kF7hY6ev+qMAIxd7EdISVfjmqx5yM=; b=N2TvamoVcy3UV9381dfufm20ym
	w3ylL5ogO+Ryu0b6CCn0GtVCxiuXzqvNVFuTXpRoBfZCwjR/kKaq2ncideCTRWr3wXnGo5EekXx+4
	sXBT6v+zLG0p2NMkJrqUUevymK/hQ1C1HenDso0mEtKz4N0gYCJg9LHr8+wnuiHxG6lM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5C-0005sw-UZ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:08:58 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5C-0005Tq-TA
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:08:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-00059e-L7; Thu, 22 Oct 2020 17:45:16 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 12/16] Introduce guest_mk_lv_name
Date: Thu, 22 Oct 2020 17:45:02 +0100
Message-Id: <20201022164506.1552-13-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This changes the way the disk name is constructed but not to any
overall effect.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 9 +++++++--
 ts-debian-install      | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 5e6b15d9..12aaba79 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -76,7 +76,7 @@ BEGIN {
                       target_jobdir target_extract_jobdistpath_subdir
                       target_extract_jobdistpath target_extract_distpart
 		      target_tftp_prefix
-                      lv_create lv_dev_mapper
+                      lv_create lv_dev_mapper guest_mk_lv_name
 
                       poll_loop tcpconnect await_tcp
                       contents_make_cpio file_simple_write_contents
@@ -2177,6 +2177,11 @@ sub guest_var_commalist ($$) {
     return split /\,/, guest_var($gho,$runvartail,'');
 }
 
+sub guest_mk_lv_name ($$) {
+    my ($gho, $suffix) = @_;
+    return "$gho->{Name}".$suffix;
+}
+
 sub prepareguest ($$$$$$) {
     my ($ho, $gn, $hostname, $tcpcheckport, $mb,
         $boot_timeout) = @_;
@@ -2205,7 +2210,7 @@ sub prepareguest ($$$$$$) {
     # If we have defined guest specific disksize, use it
     $mb = guest_var($gho,'disksize',$mb);
     if (defined $mb) {
-	store_runvar("${gn}_disk_lv", $r{"${gn}_hostname"}.'-disk');
+	store_runvar("${gn}_disk_lv", guest_mk_lv_name($gho, '-disk'));
     }
 
     if (defined $mb) {
diff --git a/ts-debian-install b/ts-debian-install
index f07dd676..8caa9d76 100755
--- a/ts-debian-install
+++ b/ts-debian-install
@@ -100,7 +100,7 @@ END
 
     my $cfg= "/etc/xen/$gho->{Name}.cfg";
     store_runvar("$gho->{Guest}_cfgpath", $cfg);
-    store_runvar("$gho->{Guest}_swap_lv", "$gho->{Name}-swap");
+    store_runvar("$gho->{Guest}_swap_lv", guest_mk_lv_name($gho, "-swap"));
 }
 
 prep();
-- 
2.20.1


