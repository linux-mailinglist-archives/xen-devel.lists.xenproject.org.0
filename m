Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A81DA0BE
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7eE-0008E0-0O; Tue, 19 May 2020 19:11:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7eC-0008Cb-Ml
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:11:28 +0000
X-Inumbo-ID: 658c60d2-9a04-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 658c60d2-9a04-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:10:26 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Ve-0001da-5v; Tue, 19 May 2020 20:02:38 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 15/38] buster: make-hosts-flight: Add to possible
 suites for hosts flight
Date: Tue, 19 May 2020 20:02:07 +0100
Message-Id: <20200519190230.29519-16-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 make-hosts-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/make-hosts-flight b/make-hosts-flight
index 92da1c7c..e2c3776a 100755
--- a/make-hosts-flight
+++ b/make-hosts-flight
@@ -26,7 +26,7 @@ blessing=$4
 buildflight=$5
 
 : ${ALL_ARCHES:=amd64 i386 arm64 armhf}
-: ${ALL_SUITES:=stretch jessie}
+: ${ALL_SUITES:=buster stretch jessie}
 # ^ most preferred suite first
 
 : ${PERHOST_MAXWAIT:=20000} # seconds
-- 
2.20.1


