Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8340F460
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189096.338637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vn-0004Z1-IS; Fri, 17 Sep 2021 08:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189096.338637; Fri, 17 Sep 2021 08:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vn-0004Qd-C9; Fri, 17 Sep 2021 08:46:23 +0000
Received: by outflank-mailman (input) for mailman id 189096;
 Fri, 17 Sep 2021 08:46:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vl-0003AK-FI
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5c2337a-1793-11ec-b674-12813bfff9fa;
 Fri, 17 Sep 2021 08:46:12 +0000 (UTC)
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
X-Inumbo-ID: b5c2337a-1793-11ec-b674-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ygfYeKRHUam3n76JUrPhA5cc2MCBioaXf/z5nQljajU=;
  b=PXdInP1qkoK0HX/luY4x9tM+D5uac7N8fnWx5mP1TvUmuykJaT7S9zha
   68IMer5LyAPlKHN01f1Nrmw8LJ0uhwunoLiSesmBg9GaBcSgcBJfMtRcI
   hI9o6lvxCLZNDSiqLOD+RRsa7kapzFOBbSLQBRxxX8h02e5jrdA1Ruuiy
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CXyVjty1K4B7IfW+acmd4wWK5wt94QebHnEe10gHKYcgtacvTTk7UXAaa1xDk3c5vqe0JbxrlS
 4CwMXp0sJ/z4BNeMoIR2FigOHuNhGTC7aQ8JqzScEDNQm8jB7pCgzxKSIAMqVsU+HXuskv9L7x
 bNUoGpCuP7v6Dw9pChzUDknPp/dJ+EI4QkreVtn0xCmrA+A7DwvQ1FU5b8r3NMWMquaZT16R7F
 uWLadfRkFqotYV86M8wQc26GU58bOFrsq7XoBfFNvib9S3iWmZDudMPV3GQG2dE7/8MtsLhwys
 EM9LpMrY8ctZyDGni6srMhqZ
X-SBRS: 5.1
X-MesageID: 52955352
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WaLL86IJ9GqZ9ZnnFE+RLZIlxSXFcZb7ZxGr2PjKsXjdYENS1mFSn
 2ZNWjjQaf/ZamL1fot/bYux8EhQ7cSAmoNrTwZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2AgelP5
 tNtrKWBbhsFMovCmr5DXShXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpq150TRquED
 yYfQSBTKzvxXgdvAFwwGoozgfialEX0dwQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9Qv3VosdG7y/8v9Cm0CIyyoYDxh+fUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mly7XWyxaUAHAeSTxMY8Bgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoa8kOTLNzfQ2
 gm7izQSi5Mdj5RV2ZS0qAWvby2XmnTZcuIkzlyJBTv4v1wmOtfNi5+AsgeAvK0ZRGqNZhzY5
 iFVxZLGhAwbJczVzESwrPMx8KZFDhpvGAbVh0JmV7Il/i6kk5JIVdENuGwiTKuF38BtRNMIX
 KMxkVgKjHOwFCHzBUOSX25XI59ypUQHPY6+Ps04lvIUPvBMmPavpUmCn3J8OlwBdmB3ycnT3
 r/AKq6R4YsyU/w7nFJauc9EieJDKt8CKZP7GsmgkkXPPUu2T3+JU7YVWGZinchgt/jsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARMBkwuj2iSccG1nqBlLMdvSYHq2llpjVQREALpi8yJLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:ToqY0qw7bTpHHS80/MlFKrPwLr1zdoMgy1knxilNoRw8SKKlfq
 GV7Y0mPHDP6Ar5NEtNpTnEAtjkfZq+z+8S3WByB8bAYOCOggLBR+sO0WKh+UyFJ8SXzJ876U
 4KSclD4bPLYmSS9fyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="52955352"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 2/6] xen/memory: Remove tail padding from TRC_MEM_* records
Date: Fri, 17 Sep 2021 09:45:55 +0100
Message-ID: <20210917084559.22673-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Four TRC_MEM_* records supply custom structures with tail padding, leaking
stack rubble into the trace buffer.  Three of the records were fine in 32-bit
builds of Xen, due to the relaxed alignment of 64-bit integers, but
POD_SUPERPAGE_SPLITER was broken right from the outset.

We could pack the datastructures to remove the padding, but xentrace_format
has no way of rendering the upper half of a 16-bit field.  Instead, expand all
16-bit fields to 32-bit.

For POD_SUPERPAGE_SPLINTER, introduce an order field as it is relevant
information, and to matche DECREASE_RESERVATION, and so it doesn't require a
__packed attribute to drop tail padding.

Update xenalyze's structures to match, and introduce xentrace_format rendering
which was absent previously.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>

The xentrace_format script isn't remotely Py3 compatible, and was another
script missed by our previous efforts.
---
 tools/xentrace/formats    |  4 ++++
 tools/xentrace/xenalyze.c | 12 ++++++------
 xen/arch/x86/mm/p2m-pod.c | 17 +++++++++--------
 xen/common/memory.c       |  4 ++--
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/tools/xentrace/formats b/tools/xentrace/formats
index deac4d8598b0..0fcc327a4078 100644
--- a/tools/xentrace/formats
+++ b/tools/xentrace/formats
@@ -136,6 +136,10 @@
 0x0010f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_map      [ domid = %(1)d ]
 0x0010f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_unmap    [ domid = %(1)d ]
 0x0010f003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_transfer [ domid = %(1)d ]
+0x0010f005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  decrease_reservation   [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
+0x0010f010  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_populate           [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
+0x0010f011  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_zero_reclaim       [ d%(5)d gfn 0x%(2)08x%(1)08x => mfn 0x%(4)08x%(3)08x, order %(6)u ]
+0x0010f012  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pod_superpage_splinter [ d%(3)d gfn 0x%(2)08x%(1)08x, order %(4)u ]
 
 0x00201001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ eip = 0x%(1)08x, eax = 0x%(2)08x ]
 0x00201101  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hypercall  [ rip = 0x%(2)08x%(1)08x, eax = 0x%(3)08x ]
diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 5de167031e01..12dcca964645 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8121,7 +8121,7 @@ void mem_pod_zero_reclaim_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn, mfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( v && v->hvm.vmexit_valid )
@@ -8171,7 +8171,7 @@ void mem_pod_populate_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn, mfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
@@ -8204,14 +8204,14 @@ void mem_pod_superpage_splinter_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn;
-        int d:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
     {
-        printf(" %s pod_spage_splinter d%d g %llx\n",
+        printf(" %s pod_spage_splinter d%d o%d g %"PRIx64"\n",
                ri->dump_header,
-               r->d, (unsigned long long)r->gfn);
+               r->d, r->order, r->gfn);
     }
 }
 
@@ -8255,7 +8255,7 @@ void mem_decrease_reservation_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn;
-        int d:16,order:16;
+        uint32_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 8abc57265c10..90f02ae765f6 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -819,8 +819,8 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn)
     if ( tb_init_done )
     {
         struct {
-            u64 gfn, mfn;
-            int d:16,order:16;
+            uint64_t gfn, mfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
@@ -987,8 +987,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
             if ( tb_init_done )
             {
                 struct {
-                    u64 gfn, mfn;
-                    int d:16,order:16;
+                    uint64_t gfn, mfn;
+                    uint32_t d, order;
                 } t;
 
                 t.gfn = gfn_x(gfns[i]);
@@ -1217,8 +1217,8 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
     if ( tb_init_done )
     {
         struct {
-            u64 gfn, mfn;
-            int d:16,order:16;
+            uint64_t gfn, mfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
@@ -1260,12 +1260,13 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
     if ( tb_init_done )
     {
         struct {
-            u64 gfn;
-            int d:16;
+            uint64_t gfn;
+            uint32_t d, order;
         } t;
 
         t.gfn = gfn_x(gfn);
         t.d = d->domain_id;
+        t.order = order;
 
         __trace_var(TRC_MEM_POD_SUPERPAGE_SPLINTER, 0, sizeof(t), &t);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 63642278fda9..8fd88ccb70bf 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -450,8 +450,8 @@ static void decrease_reservation(struct memop_args *a)
         if ( tb_init_done )
         {
             struct {
-                u64 gfn;
-                int d:16,order:16;
+                uint64_t gfn;
+                uint32_t d, order;
             } t;
 
             t.gfn = gmfn;
-- 
2.11.0


