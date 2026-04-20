Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN9AOuOL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B1433ACE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286482.1567602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBM-0003a1-Sh; Mon, 20 Apr 2026 20:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286482.1567602; Mon, 20 Apr 2026 20:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBM-0003OF-JC; Mon, 20 Apr 2026 20:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1286482;
 Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue2-0006It-4i
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-00EWC2-Hl
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-5cb7-0a2a0a5109dd-0a2a4508c320-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-63b5-0a2a45080019-22cac1c5ec94-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:53 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=PJC6vAx39QYhhYufZEnwEGLPQM6gOCrIWNOV40YBgzgMKXw1ddLQv7aEQcW4Br8sfz1QckVvYSqBT3BbimUkqExezwv7bX14ArzGrsqSzX+CoJpzXkPgUaRHWKLw2YGj+lC/mZtYBkRwezUkaBlyCrSVdoIO5pkVDSvkRFDAEcCQwfWdePjGKfbx907cDTrT6zzhc3KClP6QIwudqs5rLF5+kdfrR+UDmwV7s1AwBdUVAm0sP3CRoOdyh9w9Tcik5i2pmr41aPooN7/HL1uDJ52ABCrMCY4IDtyBMDULt/Vd+1QxNTvCRmGjLOqr/LoKmRKzjEEBlbJvvgDUEQn8bA==; s=purelymail1; d=purelymail.com; v=1; bh=BL+nVHDN3Ay2hLoHiDXEh2wB+DvkjUQnXBWbZIQGO7E=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 14/43] altp2m: Move altp2m_{init,teardown} to common code
Date: Mon, 20 Apr 2026 15:50:13 -0400
Message-Id: <20260420195042.207624-15-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c1860d/1776714657-C3D7BDB1-695BFE6A/0/0
X-purgate-type: clean
X-purgate-size: 6140
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
	NEURAL_HAM(-0.00)[-0.863];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9E9B1433ACE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves the init and teardown routines into common code. The
functions are gated by CONFIG_X86, so there is effectively no difference
despite common code normally being compiled for ARM.

This commit contains only renames/code movement, and no functional change i=
s intended.

This is commit 3/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  8 -----
 xen/arch/x86/mm/altp2m.c          | 45 ----------------------------
 xen/arch/x86/mm/p2m-basic.c       |  1 +
 xen/common/altp2m.c               | 49 +++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h          | 13 ++++++++
 5 files changed, 63 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 7cff40beb7c6..13017525a62f 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -97,12 +97,6 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, uns=
igned int idx)
     return true;
 }
=20
-/* Initialize altp2m views */
-int altp2m_init(struct domain *d);
-
-/* Free altp2m views */
-void altp2m_teardown(struct domain *d);
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
=20
@@ -184,8 +178,6 @@ static inline int _altp2m_get_effective_entry(struct p2=
m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
-int altp2m_init(struct domain *d);
-void altp2m_teardown(struct domain *d);
 struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
 bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 371bf3f0b8d4..46374373848d 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -123,51 +123,6 @@ void altp2m_vcpu_disable_ve(struct vcpu *v)
     }
 }
=20
-int altp2m_init(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-    struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
-
-    altp2m_lock_init(d);
-    d->altp2m_p2m =3D xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
-
-    if ( !d->altp2m_p2m )
-        return -ENOMEM;
-
-    for ( i =3D 0; i < d->nr_altp2m; i++ )
-    {
-        d->altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
-        if ( p2m =3D=3D NULL )
-        {
-            altp2m_teardown(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class =3D p2m_alternate;
-        p2m->access_required =3D hostp2m->access_required;
-        _atomic_set(&p2m->active_vcpus, 0);
-    }
-
-    return 0;
-}
-
-void altp2m_teardown(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i =3D 0; i < d->nr_altp2m; i++ )
-    {
-        if ( !d->altp2m_p2m[i] )
-            continue;
-        p2m =3D d->altp2m_p2m[i];
-        d->altp2m_p2m[i] =3D NULL;
-        p2m_free_one(p2m);
-    }
-
-    XVFREE(d->altp2m_p2m);
-}
-
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *=
mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate)
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 433e7d08b78f..67cef5d2b6ef 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/types.h>
 #include <asm/altp2m.h>
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 3a3283f0860a..cda653b713f0 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -2,8 +2,10 @@
 #include <xen/altp2m.h>
 #include <xen/guest_access.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
=20
 #include <asm/altp2m.h>
+#include <asm/p2m.h>
=20
 #include <public/hvm/params.h>
=20
@@ -13,6 +15,53 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
=20
+#if CONFIG_X86
+int altp2m_init(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+    struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
+
+    altp2m_lock_init(d);
+    d->altp2m_p2m =3D xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i =3D 0; i < d->nr_altp2m; i++ )
+    {
+        d->altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
+        if ( p2m =3D=3D NULL )
+        {
+            altp2m_teardown(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class =3D p2m_alternate;
+        p2m->access_required =3D hostp2m->access_required;
+        _atomic_set(&p2m->active_vcpus, 0);
+    }
+
+    return 0;
+}
+
+void altp2m_teardown(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i =3D 0; i < d->nr_altp2m; i++ )
+    {
+        if ( !d->altp2m_p2m[i] )
+            continue;
+        p2m =3D d->altp2m_p2m[i];
+        d->altp2m_p2m[i] =3D NULL;
+        p2m_free_one(p2m);
+    }
+
+    XVFREE(d->altp2m_p2m);
+}
+#endif /* CONFIG_X86 */
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index be627152668a..85ef22c2b29e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,19 @@
=20
 #include <public/hvm/hvm_op.h>
=20
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+#ifdef CONFIG_X86
+/* Initialize altp2m views */
+int altp2m_init(struct domain *d);
+
+/* Free altp2m views */
+void altp2m_teardown(struct domain *d);
+#endif
+
 #ifdef CONFIG_ALTP2M
=20
 /* Alternate p2m HVM on/off per domain */
--=20
2.34.1


