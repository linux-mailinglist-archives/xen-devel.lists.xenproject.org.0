Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D776A5E58
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503620.775956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xR-0007N3-E7; Tue, 28 Feb 2023 17:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503620.775956; Tue, 28 Feb 2023 17:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xR-0007HM-5W; Tue, 28 Feb 2023 17:40:09 +0000
Received: by outflank-mailman (input) for mailman id 503620;
 Tue, 28 Feb 2023 17:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuWh=6Y=citrix.com=prvs=4168872ba=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pX3xP-0006sS-HB
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:40:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efab59e6-b78e-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 18:40:06 +0100 (CET)
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
X-Inumbo-ID: efab59e6-b78e-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677606006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=U9Ac8kfawVwJyTiVqm0kbmJdZ36EQ83/TJ8nOn83CLs=;
  b=ZyNxqXQE7XpitWStBxkVZKonIsFUdM37MDIlrdvN2SBFWluioPjaLbbD
   mMLBEQvc2f1z7b1kTeeWunC3Fl1SPen+6a+XX31JDTh5tKK8xqdwhzl+/
   OSLqPLps8GjhQAhsYrwS8JIwAoB18fF/ZIPLhsrgClKJOADd3k1cYJWsR
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101312544
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/ZIn368CLMgzU7CS/cvyDrUDTn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jFLXDrUMqrZMzCnftxxad61pBlVvpGGy4JlHgc9/iE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmP6ob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklj1
 sBIeTIkbim4uMuv7LOSTeI8nc0seZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAnXTlfDBJ7l6ErLEz4kDYzRBr0airO93QEjCPbZwNxx3B/
 D+aowwVBDkYOd6+1WOr0UiWh/DCvBHwSbgKNpy3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ikcQlr+xN14hRjfz9pA2ZxWv2/fAlUzLZ+C36fV71vwFQZLeeWKWxxVny6v0QN4+WGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxP4M4PFyhJEfUQD1
 XCzIK6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+habQHUP7hlvf/VyOkwz
 zq4H5HXoyizrcWkOnWHmWLtBQtiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ895m5Ytzgp
 ynnMmcBkQqXuJEyAVnSApyVQO+1DMkXQLNSFXBEAGtELFB4Odb+sfdOLMBoFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:U9KYOqvnPFYs4oODgEjJyNm+7skDi9V00zEX/kB9WHVpm5qj5q
 STdZUguSMc5wx9ZJhNo6H4BEDEewK7yXcX2+Ys1NWZLWzbUTCTXeJfBOLZqlXd8m/FltK1s5
 0QEZSWJ+eAdWSS5vyKhzVQfexL/PC3tIi0gO/F1XdkSkVPY6FkqyN0EBySHEEzZAQuP/QEPa
 vZztdDryC7eXwRKuCyBnxAYvPKoMfCno/nZxlDJxNP0mizZGOTg4LHLw==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="101312544"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2 2/3] tools/xenctrl: add xc_get_cpu_version()
Date: Tue, 28 Feb 2023 17:39:31 +0000
Message-ID: <20230228173932.28510-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230228173932.28510-1-sergey.dyasli@citrix.com>
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

As a wrapper for XENPF_get_cpu_version platform op.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 tools/include/xenctrl.h   |  1 +
 tools/libs/ctrl/xc_misc.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3..8aa747dc2e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1186,6 +1186,7 @@ int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 265f15ec2d..f2f6e4348e 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -226,6 +226,26 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
     return ret;
 }
 
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
+{
+    int ret;
+    DECLARE_PLATFORM_OP;
+
+    if ( !xch || !cpu_ver )
+        return -1;
+
+    platform_op.cmd = XENPF_get_cpu_version;
+    platform_op.u.pcpu_version.xen_cpuid = cpu_ver->xen_cpuid;
+
+    ret = do_platform_op(xch, &platform_op);
+    if ( ret != 0 )
+        return ret;
+
+    *cpu_ver = platform_op.u.pcpu_version;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
-- 
2.17.1


