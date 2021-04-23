Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3C3696B7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116484.222324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTO-00084V-42; Fri, 23 Apr 2021 16:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116484.222324; Fri, 23 Apr 2021 16:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTO-000846-0U; Fri, 23 Apr 2021 16:16:06 +0000
Received: by outflank-mailman (input) for mailman id 116484;
 Fri, 23 Apr 2021 16:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTM-00082v-3w
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c77d37c6-6766-4ce5-bcd9-5c044828a554;
 Fri, 23 Apr 2021 16:16:02 +0000 (UTC)
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
X-Inumbo-ID: c77d37c6-6766-4ce5-bcd9-5c044828a554
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FsT8vvDcYT5FDetvhVj8ocsH//yAfXcxWD8SI48U9Oc=;
  b=af1Kn1zU4PT+EiHdKiX0DwSAZi/kxmMa1Fivg58kIWrrDEUCaDWJraHp
   88367FZNymuR5ICSlnWqGhjk36IJu08cOdxo1qwFad/GeDbxzl0rfTXO3
   1o2ts7TwkqgBnQlTneHZQLbkYdNyquhUodEbGGVbdgrX22wGz42my82Uj
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5C9moXt+/ueguOQHh65Yi4Tfu06nqZm3bcHQVpj5Ncf4XWyMMHKjrUviqsmf8bwgAWCVn5AIl4
 eE2VMEC1qKiouq5OLGpX1hS+nRIiJRGsiRETlVN3J7Qttid5fcZ70zBZVpcLuUNmOpjcJXHwR6
 SCRaQRx8tdy+/fJ24ddxFBYDtyOK8Q4oRuxs0KhJY49jEaFeh4NowqpM9iO1Gw6sIFqtd/O9uV
 C/xeyuGz5knKhTrGFGz2DP71dTVmykYhMUUqlfk4c6v1y8TrFaFlUpWJJjmtJRyQwXkt8TSm+A
 7VM=
X-SBRS: 5.1
X-MesageID: 42285498
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qwi5hK5NlCPQPmYwiwPXwE3XdLJzesId70hD6mlaY3VuHPCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO8sFJ2lWxTrv3btEZF64eLZskXdMgD36+I178
 ddWodkDtmYNzRHpOb8pDK1CtMxhOSAmZrY4Nv261dIYUVUZ7p77wF/YzzrdXFeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7ag+a7OWhIICwUq7wODl1qTmdrHOiOVwwsEVHd3yaoimF
 K16jDR3LmpsP2w13bntlP70pI+orTc4+oGIMSNj8QPQw+c6DqVWA==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42285498"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/8] libxl: Replace deprecated QMP command by "query-cpus-fast"
Date: Fri, 23 Apr 2021 17:15:51 +0100
Message-ID: <20210423161558.224367-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We use the deprecated QMP command "query-cpus" which is removed in the
QEMU 6.0 release. There's a replacement which is "query-cpus-fast",
and have been available since QEMU 2.12 (April 2018).

This patch try the new command first and when the command isn't
available, it fall back to the deprecated one so libxl still works
with older QEMU versions.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    This is v2 of '[XEN PATCH for-4.15] libxl: Replace deprecated QMP
    command by "query-cpus-fast"' as the patch never made it into the
    release.
    
    changes:
    - introduce a fallback for when the new command isn't available.

 tools/libs/light/libxl_domain.c | 103 ++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5d4ec9071160..8c003aa7cb04 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1740,6 +1740,35 @@ static int libxl__set_vcpuonline_xenstore(libxl__gc *gc, uint32_t domid,
     return rc;
 }
 
+static int qmp_parse_query_cpus_fast(libxl__gc *gc,
+                                     libxl_domid domid,
+                                     const libxl__json_object *response,
+                                     libxl_bitmap *const map)
+{
+    int i;
+    const libxl__json_object *cpu;
+
+    libxl_bitmap_set_none(map);
+    /* Parse response to QMP command "query-cpus-fast":
+     * [ { 'cpu-index': 'int',...} ]
+     */
+    for (i = 0; (cpu = libxl__json_array_get(response, i)); i++) {
+        unsigned int cpu_index;
+        const libxl__json_object *o;
+
+        o = libxl__json_map_get("cpu-index", cpu, JSON_INTEGER);
+        if (!o) {
+            LOGD(ERROR, domid, "Failed to retrieve CPU index.");
+            return ERROR_QEMU_API;
+        }
+
+        cpu_index = libxl__json_object_get_integer(o);
+        libxl_bitmap_set(map, cpu_index);
+    }
+
+    return 0;
+}
+
 static int qmp_parse_query_cpus(libxl__gc *gc,
                                 libxl_domid domid,
                                 const libxl__json_object *response,
@@ -1778,8 +1807,13 @@ typedef struct set_vcpuonline_state {
     int index; /* for loop on final_map */
 } set_vcpuonline_state;
 
+static void set_vcpuonline_qmp_cpus_fast_queried(libxl__egc *,
+    libxl__ev_qmp *, const libxl__json_object *, int rc);
 static void set_vcpuonline_qmp_cpus_queried(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *, int rc);
+static void set_vcpuonline_qmp_query_cpus_parse(libxl__egc *,
+    libxl__ev_qmp *qmp, const libxl__json_object *,
+    bool query_cpus_fast, int rc);
 static void set_vcpuonline_qmp_add_cpu(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *response, int rc);
 static void set_vcpuonline_timeout(libxl__egc *egc,
@@ -1840,8 +1874,8 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
                                              set_vcpuonline_timeout,
                                              LIBXL_QMP_CMD_TIMEOUT * 1000);
             if (rc) goto out;
-            qmp->callback = set_vcpuonline_qmp_cpus_queried;
-            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus", NULL);
+            qmp->callback = set_vcpuonline_qmp_cpus_fast_queried;
+            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus-fast", NULL);
             if (rc) goto out;
             return AO_INPROGRESS;
         default:
@@ -1860,11 +1894,39 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
+static void set_vcpuonline_qmp_cpus_fast_queried(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
+{
+    EGC_GC;
+    set_vcpuonline_state *svos = CONTAINER_OF(qmp, *svos, qmp);
+
+    if (rc == ERROR_QMP_COMMAND_NOT_FOUND) {
+        /* Try again, we probably talking to a QEMU older than 2.12 */
+        qmp->callback = set_vcpuonline_qmp_cpus_queried;
+        rc = libxl__ev_qmp_send(egc, qmp, "query-cpus", NULL);
+        if (rc) goto out;
+        return;
+    }
+
+out:
+    set_vcpuonline_qmp_query_cpus_parse(egc, qmp, response, true, rc);
+}
+
 static void set_vcpuonline_qmp_cpus_queried(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
 {
     EGC_GC;
     set_vcpuonline_state *svos = CONTAINER_OF(qmp, *svos, qmp);
+
+    set_vcpuonline_qmp_query_cpus_parse(egc, qmp, response, false, rc);
+}
+
+static void set_vcpuonline_qmp_query_cpus_parse(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response,
+    bool query_cpus_fast, int rc)
+{
+    EGC_GC;
+    set_vcpuonline_state *svos = CONTAINER_OF(qmp, *svos, qmp);
     int i;
     libxl_bitmap current_map;
 
@@ -1876,7 +1938,11 @@ static void set_vcpuonline_qmp_cpus_queried(libxl__egc *egc,
     if (rc) goto out;
 
     libxl_bitmap_alloc(CTX, &current_map, svos->info.vcpu_max_id + 1);
-    rc = qmp_parse_query_cpus(gc, qmp->domid, response, &current_map);
+    if (query_cpus_fast) {
+        rc = qmp_parse_query_cpus_fast(gc, qmp->domid, response, &current_map);
+    } else {
+        rc = qmp_parse_query_cpus(gc, qmp->domid, response, &current_map);
+    }
     if (rc) goto out;
 
     libxl_bitmap_copy_alloc(CTX, final_map, svos->cpumap);
@@ -2121,6 +2187,9 @@ typedef struct {
 
 static void retrieve_domain_configuration_lock_acquired(
     libxl__egc *egc, libxl__ev_slowlock *, int rc);
+static void retrieve_domain_configuration_cpu_fast_queried(
+    libxl__egc *egc, libxl__ev_qmp *qmp,
+    const libxl__json_object *response, int rc);
 static void retrieve_domain_configuration_cpu_queried(
     libxl__egc *egc, libxl__ev_qmp *qmp,
     const libxl__json_object *response, int rc);
@@ -2198,8 +2267,8 @@ static void retrieve_domain_configuration_lock_acquired(
         if (rc) goto out;
         libxl_bitmap_alloc(CTX, &rdcs->qemuu_cpus,
                            d_config->b_info.max_vcpus);
-        rdcs->qmp.callback = retrieve_domain_configuration_cpu_queried;
-        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus", NULL);
+        rdcs->qmp.callback = retrieve_domain_configuration_cpu_fast_queried;
+        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus-fast", NULL);
         if (rc) goto out;
         has_callback = true;
     }
@@ -2210,6 +2279,30 @@ static void retrieve_domain_configuration_lock_acquired(
         retrieve_domain_configuration_end(egc, rdcs, rc);
 }
 
+static void retrieve_domain_configuration_cpu_fast_queried(
+    libxl__egc *egc, libxl__ev_qmp *qmp,
+    const libxl__json_object *response, int rc)
+{
+    EGC_GC;
+    retrieve_domain_configuration_state *rdcs =
+        CONTAINER_OF(qmp, *rdcs, qmp);
+
+    if (rc == ERROR_QMP_COMMAND_NOT_FOUND) {
+        /* Try again, we probably talking to a QEMU older than 2.12 */
+        rdcs->qmp.callback = retrieve_domain_configuration_cpu_queried;
+        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus", NULL);
+        if (rc) goto out;
+        return;
+    }
+
+    if (rc) goto out;
+
+    rc = qmp_parse_query_cpus_fast(gc, qmp->domid, response, &rdcs->qemuu_cpus);
+
+out:
+    retrieve_domain_configuration_end(egc, rdcs, rc);
+}
+
 static void retrieve_domain_configuration_cpu_queried(
     libxl__egc *egc, libxl__ev_qmp *qmp,
     const libxl__json_object *response, int rc)
-- 
Anthony PERARD


