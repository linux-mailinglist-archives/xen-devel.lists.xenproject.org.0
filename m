Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5B234584
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:13:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TuO-0004GX-LI; Fri, 31 Jul 2020 12:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TuM-0004Ac-VB
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:13:06 +0000
X-Inumbo-ID: 2defe6f6-d327-11ea-8e2c-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2defe6f6-d327-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:13:02 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMy-0001W4-0G; Fri, 31 Jul 2020 12:38:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 23/41] Executive: Export opendb_tests
Date: Fri, 31 Jul 2020 12:38:02 +0100
Message-Id: <20200731113820.5765-24-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
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
index 2f81e89d..8e4c5b9a 100644
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


