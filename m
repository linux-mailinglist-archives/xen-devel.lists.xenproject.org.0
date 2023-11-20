Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696367F123A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636631.992238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cA-0004YB-Hs; Mon, 20 Nov 2023 11:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636631.992238; Mon, 20 Nov 2023 11:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52cA-0004Vv-F1; Mon, 20 Nov 2023 11:38:54 +0000
Received: by outflank-mailman (input) for mailman id 636631;
 Mon, 20 Nov 2023 11:38:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52c8-0004F8-P3
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:38:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e10163-8799-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:38:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF0582190B;
 Mon, 20 Nov 2023 11:38:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83BA713499;
 Mon, 20 Nov 2023 11:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9RPpHktFW2W0PQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:38:51 +0000
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
X-Inumbo-ID: 60e10163-8799-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnX4ToMxO+Gp+nTZBJENzZgJaVz1u/+9SpL+enjwp60=;
	b=a4sJVGfKCQO0aQs3MhUMfChA4vxCbAHwoet6siJbCsne1QDpCJgiVSo+8vn83nHriWL22E
	ab5b2xSc1LtS6QSixXFQHYZGwwYoDl0ljiRJbkXbhuIZn8q2Eho7WineFhaEPIBxNhCCfm
	S14lo3ik2/NkE0H5UzieKoljRyzBJIM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 01/13] xen/spinlock: fix coding style issues
Date: Mon, 20 Nov 2023 12:38:30 +0100
Message-Id: <20231120113842.5897-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231120113842.5897-1-jgross@suse.com>
References: <20231120113842.5897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Fix some coding style issues in spinlock coding:

- Instead of u64 etc. use the preferred uint64_t etc. types
- Remove some trailing spaces
- Add missing spaces in "if" statements
- Add some missing blank lines

While modifying the line, add const for the observed_head() parameter.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
V3:
- add const for the observed_head() parameter (Jan Beulich)
---
 xen/common/spinlock.c      | 20 +++++++++++---------
 xen/include/xen/spinlock.h | 16 ++++++++--------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 7f453234a9..d7194e518c 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -100,7 +100,7 @@ void check_lock(union lock_debug *debug, bool try)
      * every lock must be consistently observed else we can deadlock in
      * IRQ-context rendezvous functions (a rendezvous which gets every CPU
      * into IRQ context before any CPU is released from the rendezvous).
-     * 
+     *
      * If we can mix IRQ-disabled and IRQ-enabled callers, the following can
      * happen:
      *  * Lock is held by CPU A, with IRQs enabled
@@ -108,7 +108,7 @@ void check_lock(union lock_debug *debug, bool try)
      *  * Rendezvous starts -- CPU A takes interrupt and enters rendezbous spin
      *  * DEADLOCK -- CPU B will never enter rendezvous, CPU A will never exit
      *                the rendezvous, and will hence never release the lock.
-     * 
+     *
      * To guard against this subtle bug we latch the IRQ safety of every
      * spinlock in the system, on first use.
      *
@@ -151,12 +151,12 @@ static void check_barrier(union lock_debug *debug)
 
     /*
      * For a barrier, we have a relaxed IRQ-safety-consistency check.
-     * 
+     *
      * It is always safe to spin at the barrier with IRQs enabled -- that does
      * not prevent us from entering an IRQ-context rendezvous, and nor are
      * we preventing anyone else from doing so (since we do not actually
      * acquire the lock during a barrier operation).
-     * 
+     *
      * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
      * is clearly wrong, for the same reason outlined in check_lock() above.
      */
@@ -262,7 +262,7 @@ void spin_debug_disable(void)
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 #define LOCK_PROFILE_REL                                                     \
-    if (lock->profile)                                                       \
+    if ( lock->profile )                                                     \
     {                                                                        \
         lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
         lock->profile->lock_cnt++;                                           \
@@ -270,10 +270,10 @@ void spin_debug_disable(void)
 #define LOCK_PROFILE_VAR    s_time_t block = 0
 #define LOCK_PROFILE_BLOCK  block = block ? : NOW();
 #define LOCK_PROFILE_GOT                                                     \
-    if (lock->profile)                                                       \
+    if ( lock->profile )                                                     \
     {                                                                        \
         lock->profile->time_locked = NOW();                                  \
-        if (block)                                                           \
+        if ( block )                                                         \
         {                                                                    \
             lock->profile->time_block += lock->profile->time_locked - block; \
             lock->profile->block_cnt++;                                      \
@@ -298,7 +298,7 @@ static always_inline spinlock_tickets_t observe_lock(spinlock_tickets_t *t)
     return v;
 }
 
-static always_inline u16 observe_head(spinlock_tickets_t *t)
+static always_inline uint16_t observe_head(const spinlock_tickets_t *t)
 {
     smp_rmb();
     return read_atomic(&t->head);
@@ -412,7 +412,7 @@ int _spin_trylock(spinlock_t *lock)
      */
     got_lock(&lock->debug);
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-    if (lock->profile)
+    if ( lock->profile )
         lock->profile->time_locked = NOW();
 #endif
     return 1;
@@ -616,6 +616,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
     case XEN_SYSCTL_LOCKPROF_reset:
         spinlock_profile_reset('\0');
         break;
+
     case XEN_SYSCTL_LOCKPROF_query:
         pc->nr_elem = 0;
         par.rc = 0;
@@ -624,6 +625,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
         pc->time = NOW() - lock_profile_start;
         rc = par.rc;
         break;
+
     default:
         rc = -EINVAL;
         break;
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 16d933ae7e..02a062a5b0 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -81,8 +81,8 @@ struct lock_profile {
     struct lock_profile *next;       /* forward link */
     const char          *name;       /* lock name */
     struct spinlock     *lock;       /* the lock itself */
-    u64                 lock_cnt;    /* # of complete locking ops */
-    u64                 block_cnt;   /* # of complete wait for lock */
+    uint64_t            lock_cnt;    /* # of complete locking ops */
+    uint64_t            block_cnt;   /* # of complete wait for lock */
     s_time_t            time_hold;   /* cumulated lock time */
     s_time_t            time_block;  /* cumulated wait time */
     s_time_t            time_locked; /* system time of last locking */
@@ -122,7 +122,7 @@ struct lock_profile_qhead {
         prof->lock = &(s)->l;                                                 \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
-    } while(0)
+    } while( 0 )
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
@@ -153,10 +153,10 @@ struct lock_profile_qhead { };
 #endif
 
 typedef union {
-    u32 head_tail;
+    uint32_t head_tail;
     struct {
-        u16 head;
-        u16 tail;
+        uint16_t head;
+        uint16_t tail;
     };
 } spinlock_tickets_t;
 
@@ -164,10 +164,10 @@ typedef union {
 
 typedef struct spinlock {
     spinlock_tickets_t tickets;
-    u16 recurse_cpu:SPINLOCK_CPU_BITS;
+    uint16_t recurse_cpu:SPINLOCK_CPU_BITS;
 #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
 #define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
+    uint16_t recurse_cnt:SPINLOCK_RECURSE_BITS;
 #define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
     union lock_debug debug;
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-- 
2.35.3


