Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD7B27E2B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083199.1442830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrbC-0005Nq-5F; Fri, 15 Aug 2025 10:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083199.1442830; Fri, 15 Aug 2025 10:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrbC-0005M3-2J; Fri, 15 Aug 2025 10:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1083199;
 Fri, 15 Aug 2025 10:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qfu=23=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1umrbA-0005Lx-Nk
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:23:48 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e93a20-79c1-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 12:23:38 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id B2E488403EB;
 Fri, 15 Aug 2025 06:23:36 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-05.internal (MEProxy); Fri, 15 Aug 2025 06:23:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Aug 2025 06:23:34 -0400 (EDT)
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
X-Inumbo-ID: e7e93a20-79c1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755253416; x=1755339816; bh=VfbWa6ZOG79mwYmoIlmwVOUp1+sEopcTEg9
	w8VoJEmc=; b=OnqWsMh6NvuuKf91HwEmSSlqqudiQZbMnh+7kjx7lwfVrxTeWex
	3xuoyNXdvR5CgbYfBHxCE0p8kOEhGEXAOGGvSs5n9eQlBqpbf0U9/NQ3porzv6pi
	KhCYszlJBlBaDr82KB1JFSZCfytpxmbOouX9lbPwpjsx9U0fKYAy6jyRmqVXdkcN
	H1gVMS1HYH0FgMXJO7S1OwJbaMZen/drLOJX2PXFKcCHBpF2b3BfESkv95h8xsdK
	4AhUfFNP7J4YX5Zg+sXlNr0VGAR8jewjqJI5ejq8Q6SFJtGr5uJtzejlpZd/c6vZ
	2p5UVG4AiGrnMfDuRPc0/OnwujV9tylEIAw==
X-ME-Sender: <xms:pwqfaLhE3YpBq7QzutrENiDxAC7hq5HnBLuOh8JCxkC0dutLPd9cgg>
    <xme:pwqfaHtUDl9_EG4L2wVDPPM6C3YZsSVTDIC-sJqMgP10d8_6Ec8pDI3qVEJy3b4mZ
    g6PPTyYM19tVVf9e04>
X-ME-Received: <xmr:pwqfaGsA3UbAMqa2b5eW7tkJWNBdvddmg0hGbZ1fGq7KpdQG7ZDhc0hNsoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgvrhhgihihucfm
    ihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvphgrmhdrtghomheqnecuggftrf
    grthhtvghrnhepffffvdeifeeijefhheefuedvvedtheffjeeiveehgfettedvgedujefg
    udejgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdpnhgspghrtghpthhtohepuddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsvghrghhihigpkhhisghrihhk
    segvphgrmhdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghs
    rdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprh
    gtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhi
    vghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pwqfaEGTa95tdu2ba6dGbwAPpjejCNgAGXKNcDSlRmxZddRu1TaGDA>
    <xmx:pwqfaJPr6m6DiRn2BeiT_VHt6hho6Gcxe446xUD1c6kEyVFO7wwahg>
    <xmx:pwqfaLJ6-776Qy-qSpcFLE-dVZjU-z6J5OlfcYWjOuhgJ7R9th9m3g>
    <xmx:pwqfaK-UmHbUzEsWORS-h2fHN_PFN-pnGJo3LS2myiAw5ro-C9ZiIQ>
    <xmx:pwqfaPHBMTDjGnZk6OL6A-BCUA0b5bCITd_9RndNJbrOfVDlArbixg>
    <xmx:qAqfaFqp1Zys_xPr8XEZWBV49nqUc6RRR_BfOpUmUm-jozDPLosFGs5jnrpT>
Feedback-ID: iff35298b:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
Date: Fri, 15 Aug 2025 13:23:30 +0300
Message-Id: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the system configured for safety it may not be desirable to do guest-triggered
dynamic memory allocations at runtime, or allow changing memory layout by
adjusting AVC size after boot.
This patch introduces `avc_prealloc` boot parameter that enables allocation of
AVC nodes in advance so that no Xen heap allocations take place at runtime.

In case when pre-allocated cache is exhausted the reclaim of old nodes is
started, just as before, but no new node added to cache while cache is full.
AV is computed and returned to requester, but not cached during the reclaim.
So there's some performance penalty here.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
This RFC presents one possible way to hard limit the memory AVC can consume.
With current implementation of AV cache threshold reclaim of memory only starts
after threshold has been reached, and we only reclaim up to AVC_CACHE_RECLAIM=16
nodes at a time.
As allocation of new nodes is always allowed, in a hypothetical situation of
great AVC pressure when more then AVC_CACHE_RECLAIM new nodes are quickly
requested while reclaim is still in progress, it won't be possible to decrease
allocation below threshold.
Does this scenario make sense? Or is there a better way to address it? Thank you!

  -Sergiy
---
 docs/misc/xen-command-line.pandoc |  9 +++++++
 xen/xsm/flask/avc.c               | 44 ++++++++++++++++++++++++++-----
 xen/xsm/flask/flask_op.c          |  3 +++
 xen/xsm/flask/include/avc.h       |  2 ++
 4 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a75b6c9301..9044827e78 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
 Specify a maximum amount of available memory, to which Xen will clamp
 the e820 table.
 
+### avc_prealloc
+> `= <boolean>`
+
+> Default: `false`
+
+Allocate XSM Access Vector Cache at boot. This forbids runtime dynamic
+allocation of AVC nodes from Xen heap and changing AVC size via
+FLASK_SETAVC_THRESHOLD hypercall.
+
 ### badpage
 > `= List of [ <integer> | <integer>-<integer> ]`
 
diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 3d39e55cae..19e524fe35 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -21,6 +21,7 @@
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
+#include <xen/param.h>
 #include <xen/prefetch.h>
 #include <xen/kernel.h>
 #include <xen/sched.h>
@@ -84,6 +85,7 @@ struct avc_cache {
     atomic_t        lru_hint;    /* LRU hint for reclaim scan */
     atomic_t        active_nodes;
     u32            latest_notif;    /* latest revocation notification */
+    struct hlist_head freelist;
 };
 
 /* Exported via Flask hypercall */
@@ -97,6 +99,9 @@ static struct avc_cache avc_cache;
 
 static DEFINE_RCU_READ_LOCK(avc_rcu_lock);
 
+bool __read_mostly opt_avc_prealloc = false;
+boolean_param("avc_prealloc", opt_avc_prealloc);
+
 static inline int avc_hash(u32 ssid, u32 tsid, u16 tclass)
 {
     return (ssid ^ (tsid<<2) ^ (tclass<<4)) & (AVC_CACHE_SLOTS - 1);
@@ -239,6 +244,16 @@ void __init avc_init(void)
     }
     atomic_set(&avc_cache.active_nodes, 0);
     atomic_set(&avc_cache.lru_hint, 0);
+    INIT_HLIST_HEAD(&avc_cache.freelist);
+    for ( i = 0; opt_avc_prealloc && i < avc_cache_threshold + 1; i++ )
+    {
+        struct avc_node *node = xzalloc(struct avc_node);
+        if ( !node )
+        {
+            break;
+        }
+        hlist_add_head(&node->list, &avc_cache.freelist);
+    }
 }
 
 int avc_get_hash_stats(struct xen_flask_hash_stats *arg)
@@ -280,7 +295,10 @@ int avc_get_hash_stats(struct xen_flask_hash_stats *arg)
 static void cf_check avc_node_free(struct rcu_head *rhead)
 {
     struct avc_node *node = container_of(rhead, struct avc_node, rhead);
-    xfree(node);
+    if ( opt_avc_prealloc )
+        hlist_add_head(&node->list, &avc_cache.freelist);
+    else
+        xfree(node);
     avc_cache_stats_incr(frees);
 }
 
@@ -293,7 +311,10 @@ static void avc_node_delete(struct avc_node *node)
 
 static void avc_node_kill(struct avc_node *node)
 {
-    xfree(node);
+    if ( opt_avc_prealloc )
+        hlist_add_head(&node->list, &avc_cache.freelist);
+    else
+        xfree(node);
     avc_cache_stats_incr(frees);
     atomic_dec(&avc_cache.active_nodes);
 }
@@ -344,11 +365,22 @@ static inline int avc_reclaim_node(void)
 
 static struct avc_node *avc_alloc_node(void)
 {
-    struct avc_node *node;
+    struct avc_node *node = NULL;
 
-    node = xzalloc(struct avc_node);
-    if (!node)
-        goto out;
+    if ( opt_avc_prealloc )
+    {
+        if ( hlist_empty(&avc_cache.freelist) )
+            goto out;
+
+        node = hlist_entry(avc_cache.freelist.first, struct avc_node, list);
+        hlist_del(&node->list);
+    }
+    else
+    {
+        node = xzalloc(struct avc_node);
+        if ( !node )
+            goto out;
+    }
 
     INIT_RCU_HEAD(&node->rhead);
     INIT_HLIST_NODE(&node->list);
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index ea7dd10dc8..5415a696a0 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -226,6 +226,9 @@ static int flask_security_setavc_threshold(
 {
     int rv = 0;
 
+    if ( opt_avc_prealloc )
+        return -EACCES;
+
     if ( arg->threshold != avc_cache_threshold )
     {
         rv = domain_has_security(current->domain, SECURITY__SETSECPARAM);
diff --git a/xen/xsm/flask/include/avc.h b/xen/xsm/flask/include/avc.h
index e29949f5a8..d6122f3dc9 100644
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -95,6 +95,8 @@ int avc_has_perm(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 struct xen_flask_hash_stats;
 int avc_get_hash_stats(struct xen_flask_hash_stats *arg);
 extern unsigned int avc_cache_threshold;
+/* pre-allocate AVC at boot and forbid SETAVC_THRESHOLD flask_op */
+extern bool opt_avc_prealloc;
 
 #ifdef CONFIG_XSM_FLASK_AVC_STATS
 DECLARE_PER_CPU(struct avc_cache_stats, avc_cache_stats);
-- 
2.25.1


