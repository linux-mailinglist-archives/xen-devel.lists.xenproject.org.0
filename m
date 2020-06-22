Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D568D203EDD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:13:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQwP-0003Uk-GA; Mon, 22 Jun 2020 18:13:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQwN-0003UR-OU
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:13:07 +0000
X-Inumbo-ID: 0445adf4-b4b4-11ea-beb6-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0445adf4-b4b4-11ea-beb6-12813bfff9fa;
 Mon, 22 Jun 2020 18:13:05 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6DBA2A28AD;
 Mon, 22 Jun 2020 20:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 68515A289F;
 Mon, 22 Jun 2020 20:13:03 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id o5U_5lY6m-8j; Mon, 22 Jun 2020 20:13:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CE166A28AD;
 Mon, 22 Jun 2020 20:13:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CrZv7OGCmzBA; Mon, 22 Jun 2020 20:13:02 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AA7CEA289F;
 Mon, 22 Jun 2020 20:13:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 95E6B21760;
 Mon, 22 Jun 2020 20:12:32 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iIwhw7ECFOeD; Mon, 22 Jun 2020 20:12:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 05B4721CD0;
 Mon, 22 Jun 2020 20:12:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zQy07s7sB-yu; Mon, 22 Jun 2020 20:12:26 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id DC4FA21CC8;
 Mon, 22 Jun 2020 20:12:26 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:12:26 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <192922589.11444004.1592849546858.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 6/7] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xILnWivP
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, "Kang,
 Luwei" <luwei.kang@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Allow to specify the size of per-vCPU trace buffer upon
domain creation. This is zero by default (meaning: not enabled).

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 docs/man/xl.cfg.5.pod.in             | 10 ++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libxl/libxl_create.c           |  1 +
 tools/libxl/libxl_types.idl          |  2 ++
 tools/xl/xl_parse.c                  |  4 ++++
 6 files changed, 20 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1f..78f434b722 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -278,6 +278,16 @@ memory=8096 will report significantly less memory available for use
 than a system with maxmem=8096 memory=8096 due to the memory overhead
 of having to track the unused pages.
 
+=item B<vmtrace_pt_size=BYTES>
+
+Specifies the size of processor trace buffer that would be allocated
+for each vCPU belonging to this domain. Disabled (i.e. B<vmtrace_pt_size=0>
+by default. This must be set to non-zero value in order to be able to
+use processor tracing features with this domain.
+
+B<NOTE>: The size value must be between 4 kB and 4 GB and it must
+be also a power of 2.
+
 =back
 
 =head3 Guest Virtual NUMA Configuration
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
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 75862dc6ed..32204b83b0 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .vmtrace_pt_size = b_info->vmtrace_pt_size,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
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


