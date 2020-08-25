Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6862517E2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXK5-00037d-3Z; Tue, 25 Aug 2020 11:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXK3-00030Q-Nq
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:03 +0000
X-Inumbo-ID: b19490b2-c058-4329-a9a1-733ef059d4d3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b19490b2-c058-4329-a9a1-733ef059d4d3;
 Tue, 25 Aug 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+W+gxPv+xaht3JmfkVeGkYgcEA14CyqHNgRnc6oiKqI=;
 b=FGA4Cgh3mcYMKFfFFHPSPMJPMzEIWL/g7RVBlxWOqJ09EJ6PpYCBlK3F
 U0+v7W+ruojbhTqRcs51YNObOT92PpAtdwM9avk/1BXjKLB8vmIXHPFDA
 QXGqA+Nwy7ODhQccPen7c+89qQd7aDcHKYMjT+f30aAjRx1/VputdDze8 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zXfyi3zCrZhMIFs2g0/BA0XJ9n+PpxsVEDM3EIr5SrNOKK9u8wmSU4IQaYUWQsgg0dC5jsNIi9
 lhUstGcSUa/pHx0TsXUb9Ie2bG/zC/MxqhyECGmCrPpWkjKVg2YElhbMS5WE4/1Ho+TVrIEd0M
 IxdA2M7pxzKWcIkn8tWin4wKVdOY4JofLBlORW8OyBoxSkHGHu8jnumR9E0AwUy5PVk5ebxugj
 NcHsOue1EDezGLWSlEMi6XP/Y4T08/7VQjKDbqPGdTmWWWEEzk9ok7mlF5r+4a3UvIrINttGxv
 n1w=
X-SBRS: 2.7
X-MesageID: 25246379
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25246379"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/12] sg-run-job: Minor whitespace (formatting)
 changes
Date: Tue, 25 Aug 2020 12:40:33 +0100
Message-ID: <20200825114041.16290-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
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

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index df3d08d0..3db05b34 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -30,12 +30,12 @@ proc per-host-prep {} {
     per-host-ts .       xen-boot/@        ts-host-reboot
 
     per-host-ts .       host-ping-check-xen/@ ts-host-ping-check
-    per-host-ts .       =(*)             {ts-leak-check basis}
+    per-host-ts .       =(*)            { ts-leak-check basis }
 }
 
 proc per-host-finish {} {
     if {[nested-hosts-p]} { set broken fail } { set broken broken }
-    per-host-ts .       =                {ts-leak-check check}
+    per-host-ts .       =               { ts-leak-check check }
     per-host-ts !$broken capture-logs/@(*) ts-logs-capture
 }
 
@@ -96,7 +96,7 @@ proc run-job {job} {
 	
 	if {![nested-hosts-p]} break
 
-	per-host-ts . final-poweroff {ts-host-powercycle --power=0}
+	per-host-ts . final-poweroff { ts-host-powercycle --power=0 }
 
         set need_xen_hosts [lunappend nested_layers_hosts]
     }
@@ -549,7 +549,7 @@ proc setup-test-pair {} {
     run-ts . =              ts-debian-install      dst_host
     run-ts . =              ts-debian-fixup        dst_host          + debian
     run-ts . =              ts-guests-nbd-mirror + dst_host src_host + debian
-    per-host-ts . =(*)     {ts-leak-check basis}
+    per-host-ts . =(*)    { ts-leak-check basis }
     run-ts . =              ts-guest-start       + src_host          + debian
 }
 proc need-hosts/test-pair {} { return {src_host dst_host} }
-- 
2.20.1


