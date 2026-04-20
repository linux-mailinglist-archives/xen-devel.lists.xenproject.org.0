Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDMiA+SL5mlOyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1711433AD0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286520.1567731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBs-0001Lp-BY; Mon, 20 Apr 2026 20:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286520.1567731; Mon, 20 Apr 2026 20:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBq-0000y1-Jf; Mon, 20 Apr 2026 20:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1286520;
 Mon, 20 Apr 2026 20:06:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEusj-0007oA-P2
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:06:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuse-009HKD-PE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:06:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e686da-5cb7-0a2a0a5109dd-0a2a4505af3a-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:06:06 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6872d-aaa8-0a2a45050019-22cac1c5d822-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:06:06 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 894788268; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:06:02 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=c6Uo50C3us1qXsCWidSWfDOGOxihcFAWL2GAjzQ3mgcmdXFMu/mRs8jfHz0jMmN5HAqUSz9USKAqpKqAVJeSz0YTClxj/Li28FsH3Cojha6EWVTuvRIFCm8WgIbjnsj1NsSmBKqUgPwHmq+ykNUHP9TIMq7tGc5n2eID7bpEiHWKBkQEoy7Mr2S5J5NFxouspxF++aMgCkgVDVgL2gnphoqd7y+ESKz7ew60In54QNupWFplE06re304wNpqkxYEhmBUeslwVxeWJ82NXoZ2XBO6j/DjMVgS7vlqwXbT1nuSaDj7sWK6PmDE9DwBmwhJC6vmz0oFm6S0BUZ+ld4rUA==; s=purelymail1; d=purelymail.com; v=1; bh=vaO/7eskJABAM8GcpLXrSRGVxvX12VbJzyiOSdPRPvg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 28/43] altp2m: Move altp2m_vcpu_{initialise,destroy} to common code
Date: Mon, 20 Apr 2026 16:05:42 -0400
Message-Id: <20260420200557.207930-1-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c201ff/1776715566-E336C443-30DAC370/0/0
X-purgate-type: clean
X-purgate-size: 4770
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.873];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B1711433AD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves the altp2m_vcpu_initialise and altp2m_vcpu_destroy
functions to common code. This makes it possible to use them in the common
implementation of HVMOP_altp2m_set_domain_state.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the altp2m_vcpu_{initialise,destroy} phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  6 -----
 xen/arch/x86/mm/altp2m.c          | 41 -------------------------------
 xen/common/altp2m.c               | 41 +++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h          |  6 +++++
 4 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index b3d348386a00..43dd5d2acd9c 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -105,10 +105,6 @@ int altp2m_get_effective_entry(struct p2m_domain *ap2m=
, gfn_t gfn, mfn_t *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate);
=20
-/* Alternate p2m VCPU */
-void altp2m_vcpu_initialise(struct vcpu *v);
-void altp2m_vcpu_destroy(struct vcpu *v);
-
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
@@ -151,8 +147,6 @@ static inline int _altp2m_get_effective_entry(struct p2=
m_domain *ap2m,
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
-void altp2m_vcpu_initialise(struct vcpu *v);
-void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 46374373848d..0542e3ef9196 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -14,47 +14,6 @@
 #include "mm-locks.h"
 #include "p2m.h"
=20
-void
-altp2m_vcpu_initialise(struct vcpu *v)
-{
-    if ( !v->domain->nr_altp2m )
-        return;
-
-    if ( v !=3D current )
-        vcpu_pause(v);
-
-    vcpu_altp2m(v).p2midx =3D 0;
-    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
-
-    altp2m_vcpu_update_p2m(v);
-
-    if ( v !=3D current )
-        vcpu_unpause(v);
-}
-
-void
-altp2m_vcpu_destroy(struct vcpu *v)
-{
-    struct p2m_domain *p2m;
-
-    if ( !v->domain->nr_altp2m )
-        return;
-
-    if ( v !=3D current )
-        vcpu_pause(v);
-
-    if ( (p2m =3D altp2m_get_altp2m(v)) )
-        atomic_dec(&p2m->active_vcpus);
-
-    altp2m_vcpu_disable_ve(v);
-
-    vcpu_altp2m(v).p2midx =3D INVALID_ALTP2M;
-    altp2m_vcpu_update_p2m(v);
-
-    if ( v !=3D current )
-        vcpu_unpause(v);
-}
-
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn)
 {
     struct domain *d =3D v->domain;
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index a731ad7cdab8..e699b64678d8 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -59,6 +59,47 @@ void altp2m_teardown(struct domain *d)
     XVFREE(d->altp2m_p2m);
 }
=20
+#ifdef CONFIG_X86
+void altp2m_vcpu_initialise(struct vcpu *v)
+{
+    if ( !v->domain->nr_altp2m )
+        return;
+
+    if ( v !=3D current )
+        vcpu_pause(v);
+
+    vcpu_altp2m(v).p2midx =3D 0;
+    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
+
+    altp2m_vcpu_update_p2m(v);
+
+    if ( v !=3D current )
+        vcpu_unpause(v);
+}
+
+void altp2m_vcpu_destroy(struct vcpu *v)
+{
+    struct p2m_domain *p2m;
+
+    if ( !v->domain->nr_altp2m )
+        return;
+
+    if ( v !=3D current )
+        vcpu_pause(v);
+
+    if ( (p2m =3D altp2m_get_altp2m(v)) )
+        atomic_dec(&p2m->active_vcpus);
+
+    altp2m_vcpu_disable_ve(v);
+
+    vcpu_altp2m(v).p2midx =3D INVALID_ALTP2M;
+    altp2m_vcpu_update_p2m(v);
+
+    if ( v !=3D current )
+        vcpu_unpause(v);
+}
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index f5a4d0e60562..7defe6126563 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -24,6 +24,12 @@ int altp2m_init(struct domain *d);
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
=20
+#ifdef CONFIG_X86
+/* Alternate p2m VCPU */
+void altp2m_vcpu_initialise(struct vcpu *v);
+void altp2m_vcpu_destroy(struct vcpu *v);
+#endif
+
 #ifdef CONFIG_ALTP2M
=20
 /* Alternate p2m HVM on/off per domain */
--=20
2.34.1


