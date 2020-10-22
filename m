Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295C296362
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10603.28316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5i-0002f6-SK; Thu, 22 Oct 2020 17:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10603.28316; Thu, 22 Oct 2020 17:09:30 +0000
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
	id 1kVe5i-0002e6-NF; Thu, 22 Oct 2020 17:09:30 +0000
Received: by outflank-mailman (input) for mailman id 10603;
 Thu, 22 Oct 2020 17:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5h-0002cx-1W
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a78ae94-1a34-442e-8627-7d4668985e07;
 Thu, 22 Oct 2020 17:09:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5f-0005uZ-Vr
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:27 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5f-0005aW-UB
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiG-00059e-T6; Thu, 22 Oct 2020 17:45:16 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5h-0002cx-1W
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:29 +0000
X-Inumbo-ID: 7a78ae94-1a34-442e-8627-7d4668985e07
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7a78ae94-1a34-442e-8627-7d4668985e07;
	Thu, 22 Oct 2020 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tffHUjllB3zjo74/ONxS2tl01DELgFF4aymKZDnBl6s=; b=l85ZnbYzAVvw+Bl6L2MKk6LvYa
	Mhia8nAexPHBnkeZ12z2yFLRT95RfIt9lqPu2MoOpFIa63aCS+hhE6ZIUX/utCtFQW+4k7mIPTW+t
	fThutrSQocFtDz3ne6Q+u4ffmox/Au1esazD7tKyZblx7uLUUkW0WlyMH0rP+mOxErCU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5f-0005uZ-Vr
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:27 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5f-0005aW-UB
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-00059e-T6; Thu, 22 Oct 2020 17:45:16 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 13/16] Prefix guest LV names with the job name
Date: Thu, 22 Oct 2020 17:45:03 +0100
Message-Id: <20201022164506.1552-14-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This means that a subsequent test which reuses the same host will not
use the same LVs.  This is a good idea because reusing the same LV
names in a subsequent job means relying on the "ad hoc run" cleanup
code.  This is a bad idea because that code is rarely tested.

And because, depending on the situation, the old LVs may even still be
in use.  For example, in a pair test, the guest's LVs will still be
set up for use with nbd.

It seems better to fix this by using a fresh LV rather than adding
more teardown code.

The "wear limit" on host reuse is what prevents the disk filling up
with LVs from old guests.

ts-debian-fixup needs special handling, because Debian's xen-tools'
xen-create-image utility hardcodes its notion of LV name construction.
We need to rename the actual LVs (perhaps overwriting old ones from a
previous ad-hoc run) and also update the config.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm |  2 +-
 ts-debian-fixup        | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 12aaba79..9362a865 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2179,7 +2179,7 @@ sub guest_var_commalist ($$) {
 
 sub guest_mk_lv_name ($$) {
     my ($gho, $suffix) = @_;
-    return "$gho->{Name}".$suffix;
+    return $job."_$gho->{Name}".$suffix;
 }
 
 sub prepareguest ($$$$$$) {
diff --git a/ts-debian-fixup b/ts-debian-fixup
index a878fe50..810b3aba 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -37,6 +37,27 @@ sub savecfg () {
     $cfg= get_filecontents("$cfgstash.orig");
 }
 
+sub lvnames () {
+    my $lvs = target_cmd_output_root($ho, "lvdisplay --colon", 30);
+    foreach my $suffix (qw(disk swap)) {
+	my $old = "$gho->{Name}-$suffix";
+	my $new = "${job}_${old}";
+	my $full_old = "/dev/$gho->{Vg}/$old";
+	my $full_new = "/dev/$gho->{Vg}/$new";
+	$cfg =~ s{\Q$full_old\E(?![0-9a-zA-Z/_.-])}{
+            logm "Replacing in domain config \`$&' with \`$full_new'";
+            $full_new;
+        }ge;
+	if ($lvs =~ m{^ *\Q$full_old\E}m) {
+	    if ($lvs =~ m{^ *\Q$full_new\E}m) {
+		# In case we are re-running (eg, adhoc)
+		target_cmd_root($ho, "lvremove -f $full_new", 30);
+	    }
+	    target_cmd_root($ho, "lvrename $full_old $new", 30);
+	}
+    }
+}
+
 sub ether () {
 #    $cfg =~ s/^ [ \t]*
 #        ( vif [ \t]* \= [ \t]* \[ [ \t]* [\'\"]
@@ -207,6 +228,7 @@ sub writecfg () {
 }
 
 savecfg();
+lvnames();
 ether();
 access();
 $console = target_setup_rootdev_console_inittab($ho,$gho,"$mountpoint");
-- 
2.20.1


