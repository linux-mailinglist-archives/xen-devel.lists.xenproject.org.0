Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D72E3262E2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 13:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90293.170861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcWZ-0007I6-QO; Fri, 26 Feb 2021 12:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90293.170861; Fri, 26 Feb 2021 12:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcWZ-0007Hh-NJ; Fri, 26 Feb 2021 12:47:15 +0000
Received: by outflank-mailman (input) for mailman id 90293;
 Fri, 26 Feb 2021 12:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFcWY-0007Hc-FD
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 12:47:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac330070-f04c-4735-a967-284d75cf0018;
 Fri, 26 Feb 2021 12:47:13 +0000 (UTC)
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
X-Inumbo-ID: ac330070-f04c-4735-a967-284d75cf0018
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614343633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TTmReDTxShveKOqNK8OL+sYeF1+NYzAecet5R2MbJoQ=;
  b=Vvwtc42JnZyWdVfNAtCH4MU0l1czFFPuFEAR5S1UKuIqop2Qrs5orBbT
   FUYGleMyZ8s+jpa1N8FRXIzrUGOnz8MeEEslMHt0x0meajYQU9NxQEZTv
   BmKH4hYi62KZGokZsUD3M3vQzgwDLV926Ut4y9L/fvBfMlF4CqxJLoeR6
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v8APfeoICnLJYMl1h45CPp0NUX/+VzU7qZplYHZ8oFSXCiHK73o+vgjTdcOzZGugHa2RuFIThM
 I7SWBox6xaHu2fYt0yoN/tRWay5aY7sIHUDJHDAjIXZCf4gLjDQyU6UX/ttGSjEcCqLX4ZoPv0
 tzOAUaoMeAajbmpBIJBMOBCGU9q7sdJLdkyrOHL25ioXWf9CZL1a/E1o517e836GePZvDOsUEW
 vCz6lwZIhsYw386mbs4zw4nCpFNI3b1IYvNGU2UI2Q0JOmJAqTVcBBLN6IyjA4BDDlo/ltI94p
 PJ0=
X-SBRS: 5.2
X-MesageID: 38292703
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38292703"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] cirrus-ci: Drop obsolete dependency
Date: Fri, 26 Feb 2021 12:46:47 +0000
Message-ID: <20210226124647.19596-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

markdown as a dependency was dropped in 4.12

Fixes: 5d94433a66 ("cirrus-ci: introduce some basic FreeBSD testing")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>

https://cirrus-ci.com/build/6589407613419520 is a successful run with this
change in effect.
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 5e3e46368e..0efff6fa98 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -4,7 +4,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
-  install_script: pkg install -y seabios markdown gettext-tools gmake
+  install_script: pkg install -y seabios gettext-tools gmake
                                  pkgconf python libiconv bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
-- 
2.11.0


