Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6F22CBFB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:22:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1P8-0005kQ-Qg; Fri, 24 Jul 2020 17:22:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1P8-0005eH-0j
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:42 +0000
X-Inumbo-ID: 3bb38216-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb38216-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1On-00021j-7W; Fri, 24 Jul 2020 18:22:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 04/11] Executive: Export opendb_tests
Date: Fri, 24 Jul 2020 18:22:09 +0100
Message-Id: <20200724172216.28204-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
References: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

sg-report-host-history is going to want this in a moment

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 33de3708..c1095bac 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -49,7 +49,7 @@ BEGIN {
                       task_spec_desc findtask findtask_spec @all_lock_tables
                       restrictflight_arg restrictflight_cond
                       report_run_getinfo report_altcolour
-                      report_altchangecolour
+                      report_altchangecolour opendb_tests
                       report_blessingscond report_find_push_age_info
                       tcpconnect_queuedaemon plan_search
                       manual_allocation_base_jobinfo
-- 
2.20.1


