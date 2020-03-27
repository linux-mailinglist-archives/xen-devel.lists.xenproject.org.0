Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47B195D6C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:18:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtW2-00047B-59; Fri, 27 Mar 2020 18:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtW1-000471-Ey
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:33 +0000
X-Inumbo-ID: f27668f8-7056-11ea-92cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f27668f8-7056-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW0-0004UK-33; Fri, 27 Mar 2020 18:15:32 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:21 +0000
Message-Id: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [OSSTEST PATCH 1/6] TestSupport: export guest_find_lv
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We'll need this in a moment.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 1c13e2af..5fb78468 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -114,7 +114,7 @@ BEGIN {
                       prepareguest_part_xencfg
                       guest_umount_lv guest_await guest_await_dhcp_tcp
                       guest_checkrunning $guest_state_running_re
-                      target_check_ip guest_find_ether
+                      target_check_ip guest_find_ether guest_find_lv
                       guest_find_domid guest_check_up guest_check_up_quick
                       guest_get_state guest_await_reboot
                       guest_await_shutdown guest_await_destroy guest_destroy
-- 
2.11.0


