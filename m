Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHDpC6NRFWrzUQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 09:54:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CA5D2140
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 09:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319627.1587107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRmbA-000172-Cc; Tue, 26 May 2026 07:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319627.1587107; Tue, 26 May 2026 07:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRmbA-00014A-92; Tue, 26 May 2026 07:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1319627;
 Tue, 26 May 2026 07:53:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wRmb8-000144-Pg
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 07:53:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRmb7-002dKg-LW
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:53:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a155156-2eae-0a2a0a5409dd-0a2a4503df20-48
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 09:53:09 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a155165-672d-0a2a45030019-d155da36d54d-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 09:53:09 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bd6460b0d11so1802271066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 00:53:09 -0700 (PDT)
Received: from notebook.. ([88.230.42.151]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm469327166b.40.2026.05.26.00.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 00:53:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779781989; x=1780386789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6eRFZO9V4PBQZFEyiFZAw6yCeJgapdJdBUGhAdLYgM=;
        b=mZJD56PSyZmKY48R7eclUo/PGkPpnHd6zdBHEryWo+pjxXElDb4mJF3ptQkY+BNIHK
         b1bRjd3YEaJScJ7fQKzLl+md5k4wwiCeQSDUKB1rayJKeu4l/ACHB1j+w0VE5HRZLLck
         ZU2Y0raYlLdKoWPhNujIQOrdEakOn69DPbWlvj6A6x8DJWF/4j6ONkqUvbOkXRwt9fre
         2yj94ujtfi89PCauQANAlqsz31vSltWSWMGz91iV74f9PyZSll/iKO2bNlR1C3zk3Ek6
         risO1qNTsriO3wzLuMAI1fj09PyIjf89BEU8l2zZcyPIxyUQ5EZ8/m+vxR+169in5TZ7
         5qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781989; x=1780386789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6eRFZO9V4PBQZFEyiFZAw6yCeJgapdJdBUGhAdLYgM=;
        b=kxWbkls5fkrgH0hOj6Crm4tLNUaAdRSf6IAl8crAFyUgncb7sk8n1QyANS7Fz2QOAl
         ieCXC+o4DdTU9kO7cpagm5erTPikRjc1WrQtp1r3zFpM2O9PyvFEewijrGlfqzGyvV9r
         wQk2eBATQ1zG0BzjcEV6GdZZg3Lc4XSg0FnQjy8KJlBIOUBQ7AVePPTNa/5F+snzrFLZ
         Nu3KUXqCqGuVzaxz9jLha4+5Jjb1lUwE/0LWE/9GYUO8Zzc4RqqoEMTiH02oehUIJNBA
         cIMQxGHcKLQBDIjao10tI0s0L7uUi3pDAuvVKu3LTZUV/3KNF3Io83tToV6rkMD/hSoO
         NYew==
X-Gm-Message-State: AOJu0Yy/W6IRvhYgjgHusUcS1B4BwNhkj8ytM3DUkJoC1qTvcyOrAgms
	OQq/XHre2HJHLCf1lceEPUg+qwnlfDWXC0cyi2DdaIXzHd/6cxQrX0YN0HkevQ==
X-Gm-Gg: Acq92OHQ1I9yJ5QX0nij1YJj5/prq2ZmPrOV8xy7086T9hy2RwEBJA/lq2VXl9VcED+
	a11RdD7FdEIerJ3f4cVFkDFZE394FsNYyRnGzwOLf25NjgEddPAAJMTQ5SL7B9duAFLVsVI1Ebv
	r24PybJ81J/8nPYDpcIfEn/iXHzGbdVo1GEens4VxtdQvnlRNCebBk07oolDbh9Ak02FazwmNUo
	uMzvJ8Cs1SCNBgEy6rKHQqiggAdWufdjH7RbivEQEyuJG/fZsUwGaFKQbOu2oeYKGkKzz/NnZYp
	O0SfhHv0evTtPo9mSzKeg/Mk1nBGKIPkyy/bXM4GysAgdARkD/45+ngVFqeCGqQng2iadITX+5h
	FWfG7p5RHR4LFdwo3hgeB45GSj9q+TEyUa5IAlK4Vz3Z1Pg72t8k5Ot7vkI4lamP4Qi/u1ll5XY
	57Y3E8EkNsXT09mGpOWukuKZgNc3ZmNrhtVQ==
X-Received: by 2002:a17:907:3e0c:b0:bd4:d0f2:67b4 with SMTP id a640c23a62f3a-bdd25fdcb0cmr1089432866b.34.1779781988771;
        Tue, 26 May 2026 00:53:08 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jgross@suse.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	stewart.hildebrand@amd.com,
	jbeulich@suse.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2] xen/sched: remove stale file path comments in common/sched directory
Date: Tue, 26 May 2026 10:52:36 +0300
Message-Id: <20260526075236.14265-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525102539.27050-1-frn1furkan10@gmail.com>
References: <20260525102539.27050-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779781989-3A179938-86F1FD74/0/0
X-purgate-type: clean
X-purgate-size: 4066
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,xenproject.org,amd.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:frn1furkan10@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 883CA5D2140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
dedicated directory") moved the scheduler files from xen/common/ to
xen/common/sched and renamed some of them, but did not update the
in-file path comments at the top of each file.

Remove the comments rather than updating them, as they are redundant
information already conveyed by the filename itself.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/arinc653.c     | 1 -
 xen/common/sched/boot-cpupool.c | 2 --
 xen/common/sched/compat.c       | 4 ----
 xen/common/sched/core.c         | 1 -
 xen/common/sched/cpupool.c      | 1 -
 xen/common/sched/credit.c       | 1 -
 xen/common/sched/credit2.c      | 1 -
 xen/common/sched/null.c         | 1 -
 8 files changed, 12 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index d8a5380557..32c596a23c 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -1,5 +1,4 @@
 /******************************************************************************
- * sched_arinc653.c
  *
  * An ARINC653-compatible scheduling algorithm for use in Xen.
  *
diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
index 03be73efdd..3ffe1f26bd 100644
--- a/xen/common/sched/boot-cpupool.c
+++ b/xen/common/sched/boot-cpupool.c
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * xen/common/boot_cpupools.c
- *
  * Code to create cpupools at boot time.
  *
  * Copyright (C) 2022 Arm Ltd.
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index a02204ec9a..5574393cb4 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -1,7 +1,3 @@
-/****************************************************************************
- * schedule.c
- *
- */
 
 #ifndef __COMMON_SCHED_COMPAT_C__
 #define __COMMON_SCHED_COMPAT_C__
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..8e2b75bc35 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -4,7 +4,6 @@
  * (C) 2004      - Mark Williamson - Intel Research Cambridge
  ****************************************************************************
  *
- *        File: common/schedule.c
  *      Author: Rolf Neugebauer & Keir Fraser
  *              Updated for generic API by Mark Williamson
  *
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f5459c2779..081e1053eb 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1,5 +1,4 @@
 /******************************************************************************
- * cpupool.c
  * 
  * Generic cpupool-handling functions.
  *
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index e9a91d11c3..07656a57e9 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2,7 +2,6 @@
  * (C) 2005-2006 - Emmanuel Ackaouy - XenSource Inc.
  ****************************************************************************
  *
- *        File: common/csched_credit.c
  *      Author: Emmanuel Ackaouy
  *
  * Description: Credit-based SMP CPU scheduler
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 75316d42b7..77475ee363 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3,7 +3,6 @@
  * (C) 2009 - George Dunlap - Citrix Systems R&D UK, Ltd
  ****************************************************************************
  *
- *        File: common/sched_credit2.c
  *      Author: George Dunlap
  *
  * Description: Credit-based SMP CPU scheduler
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index c8e327e3cd..5f15779b07 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1,5 +1,4 @@
 /*
- * xen/common/sched_null.c
  *
  *  Copyright (c) 2017, Dario Faggioli, Citrix Ltd
  *
-- 
2.34.1


