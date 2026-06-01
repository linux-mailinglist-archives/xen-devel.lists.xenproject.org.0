Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G0pIEMZHWrtVgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 07:31:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AC619B56
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 07:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323679.1589353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTvET-00032D-7S; Mon, 01 Jun 2026 05:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323679.1589353; Mon, 01 Jun 2026 05:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTvET-0002zJ-0Y; Mon, 01 Jun 2026 05:30:37 +0000
Received: by outflank-mailman (input) for mailman id 1323679;
 Mon, 01 Jun 2026 05:30:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wTvER-0002zD-Em
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 05:30:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTvEQ-002lQA-CM
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:30:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d18f4-5cb7-0a2a0a5109dd-0a2a4509c6d4-38
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 07:30:34 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d18fa-2497-0a2a45090019-d155dd2ed41b-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 07:30:34 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so1292538f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 22:30:34 -0700 (PDT)
Received: from notebook.. ([85.107.102.236]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm23887497f8f.7.2026.05.31.22.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 22:30:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780291834; x=1780896634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kESKCReRvdG2nIzf0m15JQppR3YrmAZl9AdmyZwBps=;
        b=J9gdg12ipB36wxSfJDH6J4BUa0PhOQXGY4sktKsvPOa5bew63gt5P61UyBFIBnebgg
         Ns9xeT5KHgab66p1rTnsWRsLB/wKWTSpHcQusSiEdKMC8xNVy7nio6sFRSQeOwhJ5WCk
         jj1k2juObHlenCF49n/PZ1BxKuoG0qX4kAVqjpKSL20ihAqTZXpWx+v7PtK9YN3YF1xN
         ZxYssOYBcZYMXod+53zSV5kBsiJ3S5hmbPAqImUSKuUrDKK4wcU+f53aEcUb/h1NTHuA
         jaEsP51/6WUCgJkb29zhujADYgmqioKlqTlKLYGe1YJ6qlQxY9Al3qGUmjJkEZoUyIS4
         UmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291834; x=1780896634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kESKCReRvdG2nIzf0m15JQppR3YrmAZl9AdmyZwBps=;
        b=SYDe6INGeg3fy2nIRxbDLA6XfhZWhdLtbtuFI3CQnUb1aP/Ry2Q22zTVyrT3vTRMSF
         WmDhRUN+feLiNGWksxpEb1byRjcSNhjv9EGnplGGPiTW9oJsyK0IbK2+7hg5dyb/u0Of
         rC5QVaX6+IYOOKUNNBDl/2fUPlK6YkiHVE1fMuLQVaklnB+qe+llWz5TGYHqrF74fycp
         DkMnBxGfstGn4KQnM8L+pbEuI6x/t8SRZEE7nqkCE33KLT8FfrwTGJng6ULQ2c1NnpKv
         5XRFpYz29CPCq9vp0tgW9gSqewAmtJ0KxikVYSqejvsSS85pw0RMX6b16ftg2GaXc59A
         daqw==
X-Gm-Message-State: AOJu0YxM6j8o8oGFsQ1sQi3svTwW6cwY96VD6EG/Lc1oYeddAnHCNdXM
	aELehMuspkWgM8uinSFDJvpBHUxsTpabwyZoJzdWRPqbc+ipUCqpqRJeISMO+A==
X-Gm-Gg: Acq92OHPNWZMgOrkVSc0r9I2Xup56kTl64Vd8qfGy6h9MwcSL1z8TObkhBowmqzDAoA
	y7qFeo9AxSByB8vwJejudbKsIIc4xp+mFHQOMQqeWMvFl71LLW5JWC7dmWC2omdzC3Oj2urUssL
	bKLR0kD+xM6XumJCF8fbfkXFRzt7WDiS1kwKYbI4qzSUmxDsE7qyYZbJqlDq1bm/GAfb2oz4To4
	+d1GeHhhK/ZRMA+xH5LYv4fBwQrW4XeOAZNt+a6YhOWqADjX4Y5daw6O7uGUK4qlXHGcQwouJlE
	tRorjI2DNrXgqnURnR4JF9iVkNyndDPuETByDgO7xa98fwYv0qYZ4Whm1IYVde61mmBLzvOpZZf
	oMnQ916CdJ3trUgIKjoPXWMiFcmgnQ8N78i2Emd43gYIwcB/NwEm6Mrw0OebZkCikZ96B5vwzxf
	rOZkZfg+/nZYqwokrR1yHOL6ZFTBWVuZeKTAg=
X-Received: by 2002:a5d:5c02:0:b0:460:1301:dec8 with SMTP id ffacd0b85a97d-460131122a5mr2094758f8f.3.1780291833549;
        Sun, 31 May 2026 22:30:33 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jgross@suse.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	stewart.hildebrand@amd.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH] xen/sched: fix stale schedule.c references in comments
Date: Mon,  1 Jun 2026 08:30:22 +0300
Message-Id: <20260601053022.6044-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780291834-89F84A53-DF2DF3FD/0/0
X-purgate-type: clean
X-purgate-size: 4494
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,xenproject.org,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:frn1furkan10@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D35AC619B56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several files in xen/common/sched still reference schedule.c in
their comments, which was the original name of xen/common/sched/core.c
before commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool
coding to dedicated directory") renamed and moved it.

Update the comments to reference core.c instead.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/credit.c  |  2 +-
 xen/common/sched/credit2.c |  4 ++--
 xen/common/sched/rt.c      | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 07656a57e9..fbcdc53f7b 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -873,7 +873,7 @@ csched_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
     struct csched_unit *svc = CSCHED_UNIT(unit);
 
     /*
-     * We have been called by vcpu_migrate() (in schedule.c), as part
+     * We have been called by vcpu_migrate() (in core.c), as part
      * of the process of seeing if vc can be migrated to another pcpu.
      * We make a note about this in svc->flags so that later, in
      * csched_unit_wake() (still called from vcpu_migrate()) we won't
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..7eefcf480e 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -666,14 +666,14 @@ static inline bool has_cap(const struct csched2_unit *svc)
  * runq, _always_ happens by means of tickling:
  *  - when an unit wakes up, it calls csched2_unit_wake(), which calls
  *    runq_tickle();
- *  - when a migration is initiated in schedule.c, we call csched2_res_pick(),
+ *  - when a migration is initiated in core.c, we call csched2_res_pick(),
  *    csched2_unit_migrate() (which calls migrate()) and csched2_unit_wake().
  *    csched2_res_pick() looks for the least loaded runq and return just any
  *    of its processors. Then, csched2_unit_migrate() just moves the unit to
  *    the chosen runq, and it is again runq_tickle(), called by
  *    csched2_unit_wake() that actually decides what pcpu to use within the
  *    chosen runq;
- *  - when a migration is initiated in sched_credit2.c, by calling  migrate()
+ *  - when a migration is initiated in credit2.c, by calling  migrate()
  *    directly, that again temporarily use a random pcpu from the new runq,
  *    and then calls runq_tickle(), by itself.
  */
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 4b637aa9db..8aa6ee31eb 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -80,7 +80,7 @@
  * from all physical cpus.
  *
  * The lock is already grabbed when calling wake/sleep/schedule/ functions
- * in schedule.c
+ * in core.c
  *
  * The functions involes RunQ and needs to grab locks are:
  *    unit_insert, unit_remove, context_saved, runq_insert
@@ -894,8 +894,8 @@ rt_free_udata(const struct scheduler *ops, void *priv)
 }
 
 /*
- * It is called in sched_move_domain() and sched_init_vcpu
- * in schedule.c.
+ * It is called in sched_move_domain() and sched_init_vcpu()
+ * in core.c.
  * When move a domain to a new cpupool.
  * It inserts units of moving domain to the scheduler's RunQ in
  * dest. cpupool.
@@ -1074,7 +1074,7 @@ runq_pick(const struct scheduler *ops, const cpumask_t *mask, unsigned int cpu)
 
 /*
  * schedule function for rt scheduler.
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed in core.c, no need to lock here
  */
 static void cf_check
 rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
@@ -1168,7 +1168,7 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
 
 /*
  * Remove UNIT from RunQ
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed in core.c, no need to lock here
  */
 static void cf_check
 rt_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
@@ -1281,7 +1281,7 @@ runq_tickle(const struct scheduler *ops, const struct rt_unit *new)
 /*
  * Should always wake up runnable unit, put it back to RunQ.
  * Check priority to raise interrupt
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed in core.c, no need to lock here
  * TODO: what if these two units belongs to the same domain?
  */
 static void cf_check
-- 
2.34.1


