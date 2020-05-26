Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAE1E322F
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsK-0007wl-VY; Tue, 26 May 2020 22:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsJ-0007we-Pr
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:16:43 +0000
X-Inumbo-ID: 940e59e8-9f9e-11ea-8993-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940e59e8-9f9e-11ea-8993-bc764e2007e4;
 Tue, 26 May 2020 22:16:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eTEhCJ/mCCQHeXvQIyLpMeRUv7+peNP5dOgSSyYqLeB8zC+ed1/0TLuZK6vlVfNIGko+tqoG6n
 T7tMQUngaCKt/CXqMWtz78gIUTSeILGE7F3iFtIVjw/A07LtYHI2dIOIvbWsaIIfu0zpY8wJdD
 E+JfePvQ5/J4argGdB4m3kuEaLcVRz2a2AHMkqGWHej1vCte7MTRA3UpthGlsjaOQYG52nOozm
 xYVIFntpnV9nFNthvSZuv8kjS7hXLlBLzTWqCj9lFSpl6qPgJjBYLv8bZ+t+iD4XzGpSYbigZ3
 Ol0=
X-SBRS: 2.7
X-MesageID: 18759804
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="18759804"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 5/5] automation/containerize: Add a shortcut for Debian
 unstable
Date: Tue, 26 May 2020 23:16:12 +0100
Message-ID: <20200526221612.900922-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526221612.900922-1-george.dunlap@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- New

CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
---
 automation/scripts/containerize | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index fbc4bc22d6..b71edd736c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -22,6 +22,7 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
+    _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
 esac
@@ -91,4 +92,3 @@ exec docker run \
     -${termint}i --rm -- \
     ${CONTAINER} \
     ${cmd}
-
-- 
2.25.1


