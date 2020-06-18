Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8761FFED3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:42:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm4BF-0001hV-0T; Thu, 18 Jun 2020 23:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm4BD-0001gW-In
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:42:47 +0000
X-Inumbo-ID: 694a04f6-b1bd-11ea-bb0d-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 694a04f6-b1bd-11ea-bb0d-12813bfff9fa;
 Thu, 18 Jun 2020 23:42:46 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D43ECA30D9;
 Fri, 19 Jun 2020 01:42:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D166CA30C7;
 Fri, 19 Jun 2020 01:42:44 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xNpoFLq-6dLZ; Fri, 19 Jun 2020 01:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5D0B3A30D9;
 Fri, 19 Jun 2020 01:42:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id J3KGtSk5WrGH; Fri, 19 Jun 2020 01:42:44 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 346BAA30C7;
 Fri, 19 Jun 2020 01:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2A1182059A;
 Fri, 19 Jun 2020 01:42:14 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FFFWMQ1p63gx; Fri, 19 Jun 2020 01:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8A390215FA;
 Fri, 19 Jun 2020 01:42:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1NMEayWZazcC; Fri, 19 Jun 2020 01:42:08 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6C8F72059A;
 Fri, 19 Jun 2020 01:42:08 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:42:08 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2064075230.9820955.1592523728387.JavaMail.zimbra@cert.pl>
In-Reply-To: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 6/7] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyI5Kl+C5
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
Cc: "Kang, Luwei" <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Allow to specify the size of per-vCPU trace buffer upon
domain creation. This is zero by default (meaning: not enabled).

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/libxl/libxl_types.idl          | 2 ++
 tools/libxl/libxl_x86.c              | 5 +++++
 tools/xl/xl_parse.c                  | 4 ++++
 5 files changed, 14 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 935d3bc50a..986ebbd681 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.VmtracePtSize = int(xc.vmtrace_pt_size)
 
  return nil}
 
@@ -1592,6 +1593,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.vmtrace_pt_size = C.int(x.VmtracePtSize)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 663c1e86b4..41ec7cdd32 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -516,6 +516,7 @@ GicVersion GicVersion
 Vuart VuartType
 }
 Altp2M Altp2MMode
+VmtracePtSize int
 }
 
 type domainBuildInfoTypeUnion interface {
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..04c1704b72 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -645,6 +645,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
 
+    ("vmtrace_pt_size", integer),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index e57f63282e..14be2b395a 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -404,6 +404,11 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
             libxl_defbool_val(info->u.hvm.altp2m))
             altp2m = libxl_defbool_val(info->u.hvm.altp2m);
 
+        if (xc_hvm_param_set(xch, domid, HVM_PARAM_VMTRACE_PT_SIZE,
+                             info->vmtrace_pt_size)) {
+            LOG(ERROR, "Couldn't set HVM_PARAM_VMTRACE_PT_SIZE");
+            goto out;
+        }
         if (xc_hvm_param_set(xch, domid, HVM_PARAM_HPET_ENABLED,
                              libxl_defbool_val(info->u.hvm.hpet))) {
             LOG(ERROR, "Couldn't set HVM_PARAM_HPET_ENABLED");
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7b7e..6ab98dda55 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1861,6 +1861,10 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_long(config, "vmtrace_pt_size", &l, 1)) {
+        b_info->vmtrace_pt_size = l;
+    }
+
     if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
         b_info->num_ioports = num_ioports;
         b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
-- 
2.20.1


