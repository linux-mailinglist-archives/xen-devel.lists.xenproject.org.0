Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491D7D67D5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622782.969917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvalu-0005z7-B0; Wed, 25 Oct 2023 10:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622782.969917; Wed, 25 Oct 2023 10:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvalu-0005vp-8I; Wed, 25 Oct 2023 10:05:54 +0000
Received: by outflank-mailman (input) for mailman id 622782;
 Wed, 25 Oct 2023 10:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNCc=GH=citrix.com=prvs=655f6113c=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1qvalt-0005vh-LL
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:05:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11408635-731e-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:05:49 +0200 (CEST)
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
X-Inumbo-ID: 11408635-731e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698228348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nWlfqUZNWWkypZXn/me9OvdRKuV0M++1ZoJRq6eCasg=;
  b=CPhRR7lw1hK9rzWH1oqe0enzhsBOMaVo1GA4tGq8KzlDwd1oHnAoVD4u
   +Skrue7lQ/9ko+TjWgQlxczf85NGQgyNKETflQqRFUFqk359VmWJo0jwJ
   7cARIz2w23z2r5rCrXebuRDwS4xU2I9BEyF+Q896AWbEIU5XczS9tk1XM
   M=;
X-CSE-ConnectionGUID: 5K3il+SPQZaXVJX+o3bzqg==
X-CSE-MsgGUID: y22LdAO+S9mp1ebM27O0PA==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126454579
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Eoovp6P4xHBu7hfvrR3Ll8FynXyQoLVcMsEvi/4bfWQNrUongjECn
 TFLUGiFbvuNM2D9fNt3aYWz/UIAvpeHzt9kTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5AFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rtUWmBKt
 scgEQIEXi6ht6Gxm7ipU+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTIJ8yguauwGX4aTpbgFmUubA28y7YywkZPL3FaYCLJoHWGJoE9qqej
 nOcpUD1KzZZD42a0WOI+Ff22ciXpQquDer+E5Xnr6U30TV/3Fc7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWnpFaUsxhaXMBfe9DW8ynUlPCSuVzAQDFZH3geMLTKqfPaWxR39
 QSIm5DSPQVduY2ra0Le8eyevyq9bH19wXA5WcMUcecUy4C98dFp1k6eH4gL/L2d1IOvRW+qq
 9yehG1u3+9N0JRjO7CTpwivvt66mnTeoufZDC38WXis6ktCfJSkYYOzgbQwxa0bdNnAJrVtU
 WJtpiR/0AztJcvU/MB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk4Yp9bI2W0M
 RSD5Gu9AaO/2lPwM8ebhKroVqwXIVXIT4y5Bpg4kPIVCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mTCpYNl5DUf4P5GPvG48gPUoDmnhWKZX7GcqqkHxKENO2OBaodFvyGALQNLhivPvf+V69H
 hQ2H5Li9iizmdbWOkH/mbP/53hQRZTnLfgac/BqS9M=
IronPort-HdrOrdr: A9a23:qbtXQK2Wqqw4HmfYXaOvtgqjBLYkLtp133Aq2lEZdPUCSL39qy
 nOppQmPHDP4wr5NEtLpTniAsi9qBHnmqKdurNhWItKNTOO0FdASrsO0WKI+VPd8kPFmtK0es
 1bAs9D4HGbNykYsS5aijPIceod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AjqYQL2opnoam+eXZ6lTQxq/mUZ0GKXzZj0zoGn2?=
 =?us-ascii?q?xOVhLeP6SElWC4awxxg=3D=3D?=
X-Talos-MUID: 9a23:G989+gbfECtgg+BTpmW2oD1LE4RTsqG2UU0HtM9ZnJG8HHkl
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126454579"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xenstored: do not redirect stderr to /dev/null
Date: Wed, 25 Oct 2023 11:05:23 +0100
Message-ID: <87fbae122fd2d75852026d621358031c72c9a36d.1698227069.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

By default stderr gets redirected to /dev/null because oxenstored daemonizes itself.
This must be a left-over from pre-systemd days.

In ee7815f49f ("tools/oxenstored: Set uncaught exception handler") a workaround was added to log exceptions
directly to syslog to cope with standard error being lost.

However it is better to not lose standard error (what if the connection to syslog itself fails, how'd we log that?),
and use the '--no-fork' flag to do that.
This flag is supported by both C and O versions of xenstored.

Both versions also call sd_notify so there is no need for forking.

Leave the default daemonize as is so that xenstored keeps working on non-Linux systems as before.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 433e4849af..09a1230cee 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -52,7 +52,7 @@
 # like "--trace-file @XEN_LOG_DIR@/xenstored-trace.log"
 # See "@sbindir@/xenstored --help" for possible options.
 # Only evaluated if XENSTORETYPE is "daemon".
-XENSTORED_ARGS=
+XENSTORED_ARGS=--no-fork
 
 ## Type: string
 ## Default: Not defined, tracing off
-- 
2.41.0


