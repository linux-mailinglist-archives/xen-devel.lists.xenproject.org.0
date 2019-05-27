Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F92B8A7
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 17:59:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVHxu-0000im-Iz; Mon, 27 May 2019 15:55:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E92+=T3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hVHxs-0000ig-Mz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:55:08 +0000
X-Inumbo-ID: cc308083-8097-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc308083-8097-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 15:55:06 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: aAjiksEGHhm0K4Z5CfwfNI3ubw7KRdmQXfM5AwZ0gz9rjTApXfpOZs02zpBXdpXlw/UjgVaFkS
 JtP0baYUgcnhqJxHaWS8gSjHZaYGCOYYUSeoEb0k7mALIhQsnqWkzwoI/XZHCNv9pIpCZkFKg+
 Q11a64gLbMWWWf9WBoDPdJzxjUWPKZkeS0v2an+umT4xJy9P1tuHO32D+KSye7rt9MMphI7Sk5
 GqO2T4aoqsBpqxJa3+3E7PeFoJIlr6jLqgQHJXcK1Bd5KYPo3JN/eKgD885hcerN4Q6c3oJX4I
 p0k=
X-SBRS: 2.7
X-MesageID: 929053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; d="scan'208,223";a="929053"
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
References: <20190412200813.25447-1-tamas@tklengyel.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
Date: Mon, 27 May 2019 16:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412200813.25447-1-tamas@tklengyel.com>
Content-Type: multipart/mixed; boundary="------------4BB61A2C767782DAA2300E52"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/altp2m: cleanup p2m_altp2m_lazy_copy
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------4BB61A2C767782DAA2300E52
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 4/12/19 9:08 PM, Tamas K Lengyel wrote:
> The p2m_altp2m_lazy_copy is responsible for lazily populating an altp2m view
> when the guest traps out due to no EPT entry being present in the active view.
> Currently the function took several inputs that it didn't use and also
> locked/unlocked gfns when it didn't need to.

Wow, the code you're cleaning up was really all over the place.  Thanks
for this.

The code in your patch looks correct; but while you've gotten rid of the
redundant host p2m lookup, there's still a redundant altp2m lookup.  Is
there any reason not to take it to its logical conclusion, like the
attached patch?

NB this is compile-tested only; definitely double-check it for logic errors.

 -George

--------------4BB61A2C767782DAA2300E52
Content-Type: text/x-patch;
	name="0001-x86-altp2m-cleanup-p2m_altp2m_lazy_copy.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-x86-altp2m-cleanup-p2m_altp2m_lazy_copy.patch"

=46rom 41c89a229c8cfbf2f747a56482b8cc805158af81 Mon Sep 17 00:00:00 2001
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 14:08:13 -0600
Subject: [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy

The p2m_altp2m_lazy_copy is responsible for lazily populating an
altp2m view when the guest traps out due to no EPT entry being present
in the active view.  Currently, in addition to taking a number of
unused argements, the whole calling convention has a number of
redundant p2m lookups: the function reads the hostp2m, even though the
caller has just read the same hostp2m entry; and then the caller
re-reads the altp2m entry that the function has just read (and possibly s=
et).

Rework this function to make it a bit more rational.  Specifically:

- Pass the current hostp2m entry values we have just read for it to
  use to populate the altp2m entry if it finds the entry empty.

- If the altp2m entry is not empty, pass out the values we've read so
  the caller doesn't need to re-walk the tables

- Either way, return with the gfn 'locked', to make clean-up handling
  more consistent.

Rename the function to better reflect this functionality.

While we're here, change bool_t to bool, and return true/false rather
than 1/0.

It's a bit grating to do both the p2m_lock() and the get_gfn(),
knowing that they boil down to the same thing at the moment; but we
have to maintain the fiction until such time as we decide to get rid
of it entirely.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
---
 xen/arch/x86/hvm/hvm.c    | 19 +++++---
 xen/arch/x86/mm/p2m.c     | 95 +++++++++++++++++++++------------------
 xen/include/asm-x86/p2m.h |  5 ++-
 3 files changed, 67 insertions(+), 52 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ed1ff9c87f..2f4e7bd30e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1691,6 +1691,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned=
 long gla,
     int sharing_enomem =3D 0;
     vm_event_request_t *req_ptr =3D NULL;
     bool_t ap2m_active, sync =3D 0;
+    unsigned int page_order;
=20
     /* On Nested Virtualization, walk the guest page table.
      * If this succeeds, all is fine.
@@ -1757,19 +1758,23 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsign=
ed long gla,
     hostp2m =3D p2m_get_hostp2m(currd);
     mfn =3D get_gfn_type_access(hostp2m, gfn, &p2mt, &p2ma,
                               P2M_ALLOC | (npfec.write_access ? P2M_UNSH=
ARE : 0),
-                              NULL);
+                              &page_order);
=20
     if ( ap2m_active )
     {
-        if ( p2m_altp2m_lazy_copy(curr, gpa, gla, npfec, &p2m) )
+        p2m =3D p2m_get_altp2m(curr);
+
+        /*=20
+         * Get the altp2m entry if present; or if not, propagate from
+         * the host p2m.  NB that this returns with gfn locked in the
+         * altp2m.
+         */
+        if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt, &p2ma, p=
age_order) )
         {
-            /* entry was lazily copied from host -- retry */
-            __put_gfn(hostp2m, gfn);
+            /* Entry was copied from host -- retry fault */
             rc =3D 1;
-            goto out;
+            goto out_put_gfn;
         }
-
-        mfn =3D get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL);
     }
     else
         p2m =3D hostp2m;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 278e1c114e..385146ca63 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2397,65 +2397,74 @@ bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *=
v, unsigned int idx)
 }
=20
 /*
- * If the fault is for a not present entry:
- *     if the entry in the host p2m has a valid mfn, copy it and retry
- *     else indicate that outer handler should handle fault
+ * Read info about the gfn in an altp2m, locking the gfn.
  *
- * If the fault is for a present entry:
- *     indicate that outer handler should handle fault
+ * If the entry is valid, pass the results back to the caller.
+ *
+ * If the entry was invalid, and the host's entry is also invalid,
+ * return to the caller without any changes.
+ *
+ * If the entry is invalid, and the host entry was valid, propagate
+ * the host's entry to the altp2m (retaining page order), and indicate
+ * that the caller should re-try the faulting instruction.
  */
-
-bool_t p2m_altp2m_lazy_copy(struct vcpu *v, paddr_t gpa,
-                            unsigned long gla, struct npfec npfec,
-                            struct p2m_domain **ap2m)
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long =
gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int page_o=
rder)
 {
-    struct p2m_domain *hp2m =3D p2m_get_hostp2m(v->domain);
-    p2m_type_t p2mt;
-    p2m_access_t p2ma;
-    unsigned int page_order;
-    gfn_t gfn =3D _gfn(paddr_to_pfn(gpa));
+    p2m_type_t ap2mt;
+    p2m_access_t ap2ma;
     unsigned long mask;
-    mfn_t mfn;
-    int rv;
-
-    *ap2m =3D p2m_get_altp2m(v);
-
-    mfn =3D get_gfn_type_access(*ap2m, gfn_x(gfn), &p2mt, &p2ma,
-                              0, &page_order);
-    __put_gfn(*ap2m, gfn_x(gfn));
-
-    if ( !mfn_eq(mfn, INVALID_MFN) )
-        return 0;
+    gfn_t gfn;
+    mfn_t amfn;
+    int rc;
=20
-    mfn =3D get_gfn_type_access(hp2m, gfn_x(gfn), &p2mt, &p2ma,
-                              P2M_ALLOC, &page_order);
-    __put_gfn(hp2m, gfn_x(gfn));
+    /*
+     * NB we must get the full lock on the altp2m here, in addition to
+     * the lock on the individual gfn, since we may change a range of
+     * gfns below.
+     */
+    p2m_lock(ap2m);
+   =20
+    amfn =3D get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, NULL);
=20
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return 0;
+    if ( !mfn_eq(amfn, INVALID_MFN) )
+    {
+        p2m_unlock(ap2m);
+        *mfn  =3D amfn;
+        *p2mt =3D ap2mt;
+        *p2ma =3D ap2ma;
+        return false;
+    }
=20
-    p2m_lock(*ap2m);
+    /* Host entry is also invalid; don't bother setting the altp2m entry=
=2E */
+    if ( mfn_eq(*mfn, INVALID_MFN) )
+    {
+        p2m_unlock(ap2m);
+        return false;
+    }
=20
     /*
      * If this is a superpage mapping, round down both frame numbers
-     * to the start of the superpage.
+     * to the start of the superpage.  NB that we repupose `amfn`
+     * here.
      */
     mask =3D ~((1UL << page_order) - 1);
-    mfn =3D _mfn(mfn_x(mfn) & mask);
-    gfn =3D _gfn(gfn_x(gfn) & mask);
+    amfn =3D _mfn(mfn_x(*mfn) & mask);
+    gfn =3D _gfn(gfn_l & mask);
=20
-    rv =3D p2m_set_entry(*ap2m, gfn, mfn, page_order, p2mt, p2ma);
-    p2m_unlock(*ap2m);
+    rc =3D p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
+    p2m_unlock(ap2m);
=20
-    if ( rv )
+    if ( rc )
     {
-        gdprintk(XENLOG_ERR,
-	    "failed to set entry for %#"PRIx64" -> %#"PRIx64" p2m %#"PRIx64"\n"=
,
-	    gfn_x(gfn), mfn_x(mfn), (unsigned long)*ap2m);
-        domain_crash(hp2m->domain);
+        gprintk(XENLOG_ERR,
+        "failed to set entry for %#"PRIx64" -> %#"PRIx64" altp2m %#"PRIx=
16". rc: %"PRIi32"\n",
+        gfn_l, mfn_x(amfn), vcpu_altp2m(current).p2midx, rc);
+        domain_crash(ap2m->domain);
     }
-
-    return 1;
+   =20
+    return true;
 }
=20
 enum altp2m_reset_type {
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 719513f4ba..905fad7c8d 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -879,8 +879,9 @@ void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
 void p2m_flush_altp2m(struct domain *d);
=20
 /* Alternate p2m paging */
-bool_t p2m_altp2m_lazy_copy(struct vcpu *v, paddr_t gpa,
-    unsigned long gla, struct npfec npfec, struct p2m_domain **ap2m);
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long =
gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int page_o=
rder);
=20
 /* Make a specific alternate p2m valid */
 int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);
--=20
2.20.1


--------------4BB61A2C767782DAA2300E52
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------4BB61A2C767782DAA2300E52--

