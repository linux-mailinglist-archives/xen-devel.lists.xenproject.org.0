Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A491F53C8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizCO-0007MN-I8; Wed, 10 Jun 2020 11:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sk3H=7X=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jizCN-0007MI-C7
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:47:15 +0000
X-Inumbo-ID: 207010f8-ab10-11ea-8496-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 207010f8-ab10-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 11:47:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jizCL-0003LT-Jq; Wed, 10 Jun 2020 12:47:13 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] production-config: Update to current coverity tools
Date: Wed, 10 Jun 2020 12:47:06 +0100
Message-Id: <20200610114706.27514-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Matthew Krasnick <Matthew.Krasnick@synopsys.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 2017.07 tarball had a leading "./" but the 2019.03 one doesn't,
so we must change CoverityToolsStripComponents.

The old tools we are currently using do not work any more - they are
rejected by Coverity Scan.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
Reported-by: Matthew Krasnick <Matthew.Krasnick@synopsys.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <xadimgnik@gmail.com>
---
 production-config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/production-config b/production-config
index 7a8c0fd3..b7b9a062 100644
--- a/production-config
+++ b/production-config
@@ -123,8 +123,8 @@ CoverityEmail security@xen.org
 # This is only read from daily-cron-settings-real, everything else
 # gets the default/dummy path
 CoverityUploadUrl https://scan.coverity.com/builds?project=XenProject
-CoverityTools cov-analysis-linux64-2017.07.tar.gz
-CoverityToolsStripComponents 2
+CoverityTools cov-analysis-linux64-2019.03.tar.gz
+CoverityToolsStripComponents 1
 
 # We use the IP address because Citrix can't manage reliable nameservice
 #DebianMirrorHost debian.uk.xensource.com
-- 
2.20.1


