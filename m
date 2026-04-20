Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMp0IOWL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F6433B2B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286479.1567573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBL-000307-2q; Mon, 20 Apr 2026 20:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286479.1567573; Mon, 20 Apr 2026 20:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBK-0002kN-T5; Mon, 20 Apr 2026 20:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1286479;
 Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue0-0006IW-LG
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue0-00EWC2-1x
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-5cb7-0a2a0a5109dd-0a2a4508c320-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:56 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839e-63b5-0a2a45080019-22cac1c59c98-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:50 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=QHeYVgAjoAe2aeyzRnA9SjAaQGGMS5KFcHverUnPbaE0xdYsYbbfpAzsen8s6X4NnAaGSLFaihsmFazNvfG5+s0lGodMF99KDWyzJUYWXu603latBFwPdEsMHQ44Am9HyLoilxqvTfwGda4pPSyr/FFYsYURtvjALB1FDXc6I7k+ckcIvX+UL52Wqnw2aTUxfSWabc15IHghbn94xmnUOKcTC0AW4fABs+QBOPfxNBmEmtgn52UaA45d9qXuW0qFCm9lzjoLKUrwtlhE6OHuKE+VfTudwjpkxBj7IK5loLZ5DPsHtrVW8kQviM9JkE3FKtq0NIHIOvVeteyX7vZDKA==; s=purelymail1; d=purelymail.com; v=1; bh=SVKLQ6kcKUAU2bennXpDwH0c/FyTIXAe5xYEJVfFFsY=; h=Feedback-ID:Received:From:To:Subject:Date;
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
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 09/43] altp2m: Move do_altp2m_op to common code
Date: Mon, 20 Apr 2026 15:50:08 -0400
Message-Id: <20260420195042.207624-10-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c1860d/1776714656-C2B74DB1-90B90380/0/0
X-purgate-type: clean
X-purgate-size: 26850
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	NEURAL_SPAM(0.00)[0.437];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D27F6433B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves the altp2m HVMOP implementation to common code, making it
possible to re-use it across architectures. In this commit, the entire
implementation is gated behind CONFIG_X86, with no changes to the body of
do_altp2m_op. A stub implementation is added for ARM, which will be removed
once do_altp2m_op has been modified to add ARM support.

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/2 of the common do_altp2m_op phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/hvm.c   | 400 -------------------------------------
 xen/common/altp2m.c      | 413 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h |  11 ++
 3 files changed, 424 insertions(+), 400 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b6e91adce17..4adcc3c49d95 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4526,406 +4526,6 @@ static int hvmop_get_param(
     return rc;
 }
=20
-/*
- * altp2m operations are envisioned as being used in several different
- * modes:
- *
- * - external: All control and decisions are made by an external agent
- *   running domain 0.
- *
- * - internal: altp2m operations are used exclusively by an in-guest
- *   agent to protect itself from the guest kernel and in-guest
- *   attackers.
- *
- * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
- *   but makes requests of an agent running outside the domain for
- *   bigger changes (such as modifying altp2m entires).
- *
- * This corresponds to the three values for HVM_PARAM_ALTP2M
- * (external, mixed, limited). All three models have advantages and
- * disadvantages.
- *
- * Normally hypercalls made by a program in domain 0 in order to
- * control a guest would be DOMCTLs rather than HVMOPs.  But in order
- * to properly enable the 'internal' use case, as well as to avoid
- * fragmentation, all altp2m subops should come under this single
- * HVMOP.
- *
- * Note that 'internal' mode (HVM_PARAM_ALTP2M =3D=3D XEN_ALTP2M_mixed)
- * has not been evaluated for safety from a security perspective.
- * Before using this mode in a security-critical environment, each
- * subop should be evaluated for safety, with unsafe subops
- * blacklisted in xsm_hvm_altp2mhvm_op().
- */
-static int do_altp2m_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-#ifdef CONFIG_ALTP2M
-    struct xen_hvm_altp2m_op a;
-    struct domain *d =3D NULL;
-    int rc =3D 0;
-    uint64_t mode;
-
-    if ( !altp2m_supported() )
-        return -EOPNOTSUPP;
-
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a.pad1 || a.pad2 ||
-         (a.version !=3D HVMOP_ALTP2M_INTERFACE_VERSION) )
-        return -EINVAL;
-
-    switch ( a.cmd )
-    {
-    case HVMOP_altp2m_get_domain_state:
-    case HVMOP_altp2m_set_domain_state:
-    case HVMOP_altp2m_vcpu_enable_notify:
-    case HVMOP_altp2m_vcpu_disable_notify:
-    case HVMOP_altp2m_create_p2m:
-    case HVMOP_altp2m_destroy_p2m:
-    case HVMOP_altp2m_switch_p2m:
-    case HVMOP_altp2m_set_suppress_ve:
-    case HVMOP_altp2m_set_suppress_ve_multi:
-    case HVMOP_altp2m_get_suppress_ve:
-    case HVMOP_altp2m_set_mem_access:
-    case HVMOP_altp2m_set_mem_access_multi:
-    case HVMOP_altp2m_get_mem_access:
-    case HVMOP_altp2m_change_gfn:
-    case HVMOP_altp2m_get_p2m_idx:
-    case HVMOP_altp2m_set_visibility:
-        break;
-
-    default:
-        return -EOPNOTSUPP;
-    }
-
-    d =3D rcu_lock_domain_by_any_id(a.domain);
-
-    if ( d =3D=3D NULL )
-        return -ESRCH;
-
-    if ( !is_hvm_domain(d) )
-    {
-        rc =3D -EOPNOTSUPP;
-        goto out;
-    }
-
-    if ( (a.cmd !=3D HVMOP_altp2m_get_domain_state) &&
-         (a.cmd !=3D HVMOP_altp2m_set_domain_state) &&
-         !d->altp2m_active )
-    {
-        rc =3D -EOPNOTSUPP;
-        goto out;
-    }
-
-    mode =3D d->arch.hvm.params[HVM_PARAM_ALTP2M];
-
-    if ( XEN_ALTP2M_disabled =3D=3D mode )
-    {
-        rc =3D -EINVAL;
-        goto out;
-    }
-
-    if ( d->nr_altp2m =3D=3D 0 )
-    {
-        rc =3D -EOPNOTSUPP;
-        goto out;
-    }
-
-    if ( (rc =3D xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
-        goto out;
-
-    switch ( a.cmd )
-    {
-    case HVMOP_altp2m_get_domain_state:
-        a.u.domain_state.state =3D altp2m_active(d);
-        rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-
-    case HVMOP_altp2m_set_domain_state:
-    {
-        struct vcpu *v;
-        bool ostate;
-
-        if ( nestedhvm_enabled(d) )
-        {
-            rc =3D -EINVAL;
-            break;
-        }
-
-        rc =3D domain_pause_except_self(d);
-        if ( rc )
-            break;
-
-        ostate =3D d->altp2m_active;
-        d->altp2m_active =3D !!a.u.domain_state.state;
-
-        /* If the alternate p2m state has changed, handle appropriately */
-        if ( d->altp2m_active !=3D ostate &&
-             (ostate || !(rc =3D altp2m_init_by_id(d, 0))) )
-        {
-            for_each_vcpu( d, v )
-            {
-                if ( !ostate )
-                    altp2m_vcpu_initialise(v);
-                else
-                    altp2m_vcpu_destroy(v);
-            }
-
-            if ( ostate )
-                altp2m_flush(d);
-        }
-        else if ( rc )
-            d->altp2m_active =3D false;
-
-        domain_unpause_except_self(d);
-        break;
-    }
-
-    case HVMOP_altp2m_vcpu_enable_notify:
-    {
-        struct vcpu *v;
-
-        if ( a.u.enable_notify.pad ||
-             a.u.enable_notify.vcpu_id >=3D d->max_vcpus )
-        {
-            rc =3D -EINVAL;
-            break;
-        }
-
-        if ( !cpu_has_vmx_virt_exceptions )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        v =3D d->vcpu[a.u.enable_notify.vcpu_id];
-
-        rc =3D altp2m_vcpu_enable_ve(v, _gfn(a.u.enable_notify.gfn));
-        break;
-    }
-
-    case HVMOP_altp2m_vcpu_disable_notify:
-    {
-        struct vcpu *v;
-
-        if ( a.u.disable_notify.vcpu_id >=3D d->max_vcpus )
-        {
-            rc =3D -EINVAL;
-            break;
-        }
-
-        if ( !cpu_has_vmx_virt_exceptions )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        v =3D d->vcpu[a.u.enable_notify.vcpu_id];
-
-        altp2m_vcpu_disable_ve(v);
-        break;
-    }
-
-    case HVMOP_altp2m_create_p2m:
-        rc =3D altp2m_init_next_available(d, &a.u.view.view,
-                                        a.u.view.hvmmem_default_access);
-        if ( !rc )
-            rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-
-    case HVMOP_altp2m_destroy_p2m:
-        rc =3D altp2m_destroy_by_id(d, a.u.view.view);
-        break;
-
-    case HVMOP_altp2m_switch_p2m:
-        rc =3D altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
-        break;
-
-    case HVMOP_altp2m_set_suppress_ve:
-        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
-            rc =3D -EINVAL;
-        else
-        {
-            gfn_t gfn =3D _gfn(a.u.suppress_ve.gfn);
-            unsigned int altp2m_idx =3D a.u.suppress_ve.view;
-            bool suppress_ve =3D a.u.suppress_ve.suppress_ve;
-
-            rc =3D p2m_set_suppress_ve(d, gfn, suppress_ve, altp2m_idx);
-        }
-        break;
-
-    case HVMOP_altp2m_set_suppress_ve_multi:
-    {
-        uint64_t max_phys_addr =3D (1UL << d->arch.cpuid->extd.maxphysaddr=
) - 1;
-
-        a.u.suppress_ve_multi.last_gfn =3D min(a.u.suppress_ve_multi.last_=
gfn,
-                                             max_phys_addr);
-
-        if ( a.u.suppress_ve_multi.pad1 ||
-             a.u.suppress_ve_multi.first_gfn > a.u.suppress_ve_multi.last_=
gfn )
-            rc =3D -EINVAL;
-        else
-        {
-            rc =3D p2m_set_suppress_ve_multi(d, &a.u.suppress_ve_multi);
-            if ( (!rc || rc =3D=3D -ERESTART) && __copy_to_guest(arg, &a, =
1) )
-                rc =3D -EFAULT;
-        }
-        break;
-    }
-
-    case HVMOP_altp2m_get_suppress_ve:
-        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
-            rc =3D -EINVAL;
-        else
-        {
-            gfn_t gfn =3D _gfn(a.u.suppress_ve.gfn);
-            unsigned int altp2m_idx =3D a.u.suppress_ve.view;
-            bool suppress_ve;
-
-            rc =3D p2m_get_suppress_ve(d, gfn, &suppress_ve, altp2m_idx);
-            if ( !rc )
-            {
-                a.u.suppress_ve.suppress_ve =3D suppress_ve;
-                rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-            }
-        }
-        break;
-
-    case HVMOP_altp2m_set_mem_access:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.mem_access.pad )
-            rc =3D -EINVAL;
-        else
-            rc =3D p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0=
,
-                                    a.u.mem_access.access,
-                                    a.u.mem_access.view);
-        break;
-
-    case HVMOP_altp2m_set_mem_access_multi:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.set_mem_access_multi.pad ||
-             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr=
 )
-        {
-            rc =3D -EINVAL;
-            break;
-        }
-
-        /*
-         * Unlike XENMEM_access_op_set_access_multi, we don't need any bit=
s of
-         * the 'continuation' counter to be zero (to stash a command in).
-         * However, 0x40 is a good 'stride' to make sure that we make
-         * a reasonable amount of forward progress before yielding,
-         * so use a mask of 0x3F here.
-         */
-        rc =3D p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_li=
st,
-                                      a.u.set_mem_access_multi.access_list=
,
-                                      a.u.set_mem_access_multi.nr,
-                                      a.u.set_mem_access_multi.opaque,
-                                      0x3F,
-                                      a.u.set_mem_access_multi.view);
-        if ( rc > 0 )
-        {
-            a.u.set_mem_access_multi.opaque =3D rc;
-            rc =3D -ERESTART;
-            if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_altp=
2m_op_t),
-                                       &a, u.set_mem_access_multi.opaque) =
)
-                rc =3D -EFAULT;
-        }
-        break;
-
-    case HVMOP_altp2m_get_mem_access:
-        if ( !vm_event_is_enabled(current) )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        if ( a.u.mem_access.pad )
-            rc =3D -EINVAL;
-        else
-        {
-            xenmem_access_t access;
-
-            rc =3D p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access=
,
-                                    a.u.mem_access.view);
-            if ( !rc )
-            {
-                a.u.mem_access.access =3D access;
-                rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-            }
-        }
-        break;
-
-    case HVMOP_altp2m_change_gfn:
-        if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
-            rc =3D -EINVAL;
-        else
-            rc =3D altp2m_change_gfn(d, a.u.change_gfn.view,
-                                   _gfn(a.u.change_gfn.old_gfn),
-                                   _gfn(a.u.change_gfn.new_gfn));
-        break;
-
-    case HVMOP_altp2m_get_p2m_idx:
-    {
-        struct vcpu *v;
-
-        if ( !altp2m_active(d) )
-        {
-            rc =3D -EOPNOTSUPP;
-            break;
-        }
-
-        if ( (v =3D domain_vcpu(d, a.u.get_vcpu_p2m_idx.vcpu_id)) =3D=3D N=
ULL )
-        {
-            rc =3D -EINVAL;
-            break;
-        }
-
-        a.u.get_vcpu_p2m_idx.altp2m_idx =3D altp2m_vcpu_idx(v);
-        rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-        break;
-    }
-
-    case HVMOP_altp2m_set_visibility:
-    {
-        unsigned int idx =3D a.u.set_visibility.altp2m_idx;
-
-        if ( a.u.set_visibility.pad )
-            rc =3D -EINVAL;
-        else if ( !altp2m_active(d) )
-            rc =3D -EOPNOTSUPP;
-        else
-            rc =3D altp2m_set_view_visibility(d, idx, a.u.set_visibility.v=
isible);
-        break;
-    }
-
-    default:
-        ASSERT_UNREACHABLE();
-        rc =3D -EOPNOTSUPP;
-        break;
-    }
-
- out:
-    rcu_unlock_domain(d);
-
-    return rc;
-#else /* !CONFIG_ALTP2M */
-    return -EOPNOTSUPP;
-#endif /* CONFIG_ALTP2M */
-}
-
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
=20
 /*
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 1a4e102324d4..a43b3a3e34b3 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -1,5 +1,418 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/altp2m.h>
+#include <xen/guest_access.h>
+#include <xen/vm_event.h>
+
+#include <asm/altp2m.h>
+
+#include <public/hvm/params.h>
+
+#include <xsm/xsm.h>
+
+#ifdef CONFIG_X86
+#include <asm/hvm/nestedhvm.h>
+/*
+ * altp2m operations are envisioned as being used in several different
+ * modes:
+ *
+ * - external: All control and decisions are made by an external agent
+ *   running domain 0.
+ *
+ * - internal: altp2m operations are used exclusively by an in-guest
+ *   agent to protect itself from the guest kernel and in-guest
+ *   attackers.
+ *
+ * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
+ *   but makes requests of an agent running outside the domain for
+ *   bigger changes (such as modifying altp2m entires).
+ *
+ * This corresponds to the three values for HVM_PARAM_ALTP2M
+ * (external, mixed, limited). All three models have advantages and
+ * disadvantages.
+ *
+ * Normally hypercalls made by a program in domain 0 in order to
+ * control a guest would be DOMCTLs rather than HVMOPs.  But in order
+ * to properly enable the 'internal' use case, as well as to avoid
+ * fragmentation, all altp2m subops should come under this single
+ * HVMOP.
+ *
+ * Note that 'internal' mode (HVM_PARAM_ALTP2M =3D=3D XEN_ALTP2M_mixed)
+ * has not been evaluated for safety from a security perspective.
+ * Before using this mode in a security-critical environment, each
+ * subop should be evaluated for safety, with unsafe subops
+ * blacklisted in xsm_hvm_altp2mhvm_op().
+ */
+int do_altp2m_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    struct xen_hvm_altp2m_op a;
+    struct domain *d =3D NULL;
+    int rc =3D 0;
+    uint64_t mode;
+
+    if ( !altp2m_supported() )
+        return -EOPNOTSUPP;
+
+    if ( copy_from_guest(&a, arg, 1) )
+        return -EFAULT;
+
+    if ( a.pad1 || a.pad2 ||
+         (a.version !=3D HVMOP_ALTP2M_INTERFACE_VERSION) )
+        return -EINVAL;
+
+    switch ( a.cmd )
+    {
+    case HVMOP_altp2m_get_domain_state:
+    case HVMOP_altp2m_set_domain_state:
+    case HVMOP_altp2m_vcpu_enable_notify:
+    case HVMOP_altp2m_vcpu_disable_notify:
+    case HVMOP_altp2m_create_p2m:
+    case HVMOP_altp2m_destroy_p2m:
+    case HVMOP_altp2m_switch_p2m:
+    case HVMOP_altp2m_set_suppress_ve:
+    case HVMOP_altp2m_set_suppress_ve_multi:
+    case HVMOP_altp2m_get_suppress_ve:
+    case HVMOP_altp2m_set_mem_access:
+    case HVMOP_altp2m_set_mem_access_multi:
+    case HVMOP_altp2m_get_mem_access:
+    case HVMOP_altp2m_change_gfn:
+    case HVMOP_altp2m_get_p2m_idx:
+    case HVMOP_altp2m_set_visibility:
+        break;
+
+    default:
+        return -EOPNOTSUPP;
+    }
+
+    d =3D rcu_lock_domain_by_any_id(a.domain);
+
+    if ( d =3D=3D NULL )
+        return -ESRCH;
+
+    if ( !is_hvm_domain(d) )
+    {
+        rc =3D -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( (a.cmd !=3D HVMOP_altp2m_get_domain_state) &&
+         (a.cmd !=3D HVMOP_altp2m_set_domain_state) &&
+         !d->altp2m_active )
+    {
+        rc =3D -EOPNOTSUPP;
+        goto out;
+    }
+
+    mode =3D d->arch.hvm.params[HVM_PARAM_ALTP2M];
+
+    if ( XEN_ALTP2M_disabled =3D=3D mode )
+    {
+        rc =3D -EINVAL;
+        goto out;
+    }
+
+    if ( d->nr_altp2m =3D=3D 0 )
+    {
+        rc =3D -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( (rc =3D xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
+        goto out;
+
+    switch ( a.cmd )
+    {
+    case HVMOP_altp2m_get_domain_state:
+        a.u.domain_state.state =3D altp2m_active(d);
+        rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+
+    case HVMOP_altp2m_set_domain_state:
+    {
+        struct vcpu *v;
+        bool ostate;
+
+        if ( nestedhvm_enabled(d) )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        rc =3D domain_pause_except_self(d);
+        if ( rc )
+            break;
+
+        ostate =3D d->altp2m_active;
+        d->altp2m_active =3D !!a.u.domain_state.state;
+
+        /* If the alternate p2m state has changed, handle appropriately */
+        if ( d->altp2m_active !=3D ostate &&
+             (ostate || !(rc =3D altp2m_init_by_id(d, 0))) )
+        {
+            for_each_vcpu( d, v )
+            {
+                if ( !ostate )
+                    altp2m_vcpu_initialise(v);
+                else
+                    altp2m_vcpu_destroy(v);
+            }
+
+            if ( ostate )
+                altp2m_flush(d);
+        }
+        else if ( rc )
+            d->altp2m_active =3D false;
+
+        domain_unpause_except_self(d);
+        break;
+    }
+
+    case HVMOP_altp2m_vcpu_enable_notify:
+    {
+        struct vcpu *v;
+
+        if ( a.u.enable_notify.pad ||
+             a.u.enable_notify.vcpu_id >=3D d->max_vcpus )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        if ( !cpu_has_vmx_virt_exceptions )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        v =3D d->vcpu[a.u.enable_notify.vcpu_id];
+
+        rc =3D altp2m_vcpu_enable_ve(v, _gfn(a.u.enable_notify.gfn));
+        break;
+    }
+
+    case HVMOP_altp2m_vcpu_disable_notify:
+    {
+        struct vcpu *v;
+
+        if ( a.u.disable_notify.vcpu_id >=3D d->max_vcpus )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        if ( !cpu_has_vmx_virt_exceptions )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        v =3D d->vcpu[a.u.enable_notify.vcpu_id];
+
+        altp2m_vcpu_disable_ve(v);
+        break;
+    }
+
+    case HVMOP_altp2m_create_p2m:
+        rc =3D altp2m_init_next_available(d, &a.u.view.view,
+                                        a.u.view.hvmmem_default_access);
+        if ( !rc )
+            rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+
+    case HVMOP_altp2m_destroy_p2m:
+        rc =3D altp2m_destroy_by_id(d, a.u.view.view);
+        break;
+
+    case HVMOP_altp2m_switch_p2m:
+        rc =3D altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
+        break;
+
+    case HVMOP_altp2m_set_suppress_ve:
+        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
+            rc =3D -EINVAL;
+        else
+        {
+            gfn_t gfn =3D _gfn(a.u.suppress_ve.gfn);
+            unsigned int altp2m_idx =3D a.u.suppress_ve.view;
+            bool suppress_ve =3D a.u.suppress_ve.suppress_ve;
+
+            rc =3D p2m_set_suppress_ve(d, gfn, suppress_ve, altp2m_idx);
+        }
+        break;
+
+    case HVMOP_altp2m_set_suppress_ve_multi:
+    {
+        uint64_t max_phys_addr =3D (1UL << d->arch.cpuid->extd.maxphysaddr=
) - 1;
+
+        a.u.suppress_ve_multi.last_gfn =3D min(a.u.suppress_ve_multi.last_=
gfn,
+                                             max_phys_addr);
+
+        if ( a.u.suppress_ve_multi.pad1 ||
+             a.u.suppress_ve_multi.first_gfn > a.u.suppress_ve_multi.last_=
gfn )
+            rc =3D -EINVAL;
+        else
+        {
+            rc =3D p2m_set_suppress_ve_multi(d, &a.u.suppress_ve_multi);
+            if ( (!rc || rc =3D=3D -ERESTART) && __copy_to_guest(arg, &a, =
1) )
+                rc =3D -EFAULT;
+        }
+        break;
+    }
+
+    case HVMOP_altp2m_get_suppress_ve:
+        if ( a.u.suppress_ve.pad1 || a.u.suppress_ve.pad2 )
+            rc =3D -EINVAL;
+        else
+        {
+            gfn_t gfn =3D _gfn(a.u.suppress_ve.gfn);
+            unsigned int altp2m_idx =3D a.u.suppress_ve.view;
+            bool suppress_ve;
+
+            rc =3D p2m_get_suppress_ve(d, gfn, &suppress_ve, altp2m_idx);
+            if ( !rc )
+            {
+                a.u.suppress_ve.suppress_ve =3D suppress_ve;
+                rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+            }
+        }
+        break;
+
+    case HVMOP_altp2m_set_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.mem_access.pad )
+            rc =3D -EINVAL;
+        else
+            rc =3D p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0=
,
+                                    a.u.mem_access.access,
+                                    a.u.mem_access.view);
+        break;
+
+    case HVMOP_altp2m_set_mem_access_multi:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.set_mem_access_multi.pad ||
+             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr=
 )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        /*
+         * Unlike XENMEM_access_op_set_access_multi, we don't need any bit=
s of
+         * the 'continuation' counter to be zero (to stash a command in).
+         * However, 0x40 is a good 'stride' to make sure that we make
+         * a reasonable amount of forward progress before yielding,
+         * so use a mask of 0x3F here.
+         */
+        rc =3D p2m_set_mem_access_multi(d, a.u.set_mem_access_multi.pfn_li=
st,
+                                      a.u.set_mem_access_multi.access_list=
,
+                                      a.u.set_mem_access_multi.nr,
+                                      a.u.set_mem_access_multi.opaque,
+                                      0x3F,
+                                      a.u.set_mem_access_multi.view);
+        if ( rc > 0 )
+        {
+            a.u.set_mem_access_multi.opaque =3D rc;
+            rc =3D -ERESTART;
+            if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_altp=
2m_op_t),
+                                       &a, u.set_mem_access_multi.opaque) =
)
+                rc =3D -EFAULT;
+        }
+        break;
+
+    case HVMOP_altp2m_get_mem_access:
+        if ( !vm_event_is_enabled(current) )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        if ( a.u.mem_access.pad )
+            rc =3D -EINVAL;
+        else
+        {
+            xenmem_access_t access;
+
+            rc =3D p2m_get_mem_access(d, _gfn(a.u.mem_access.gfn), &access=
,
+                                    a.u.mem_access.view);
+            if ( !rc )
+            {
+                a.u.mem_access.access =3D access;
+                rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+            }
+        }
+        break;
+
+    case HVMOP_altp2m_change_gfn:
+        if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
+            rc =3D -EINVAL;
+        else
+            rc =3D altp2m_change_gfn(d, a.u.change_gfn.view,
+                                   _gfn(a.u.change_gfn.old_gfn),
+                                   _gfn(a.u.change_gfn.new_gfn));
+        break;
+
+    case HVMOP_altp2m_get_p2m_idx:
+    {
+        struct vcpu *v;
+
+        if ( !altp2m_active(d) )
+        {
+            rc =3D -EOPNOTSUPP;
+            break;
+        }
+
+        if ( (v =3D domain_vcpu(d, a.u.get_vcpu_p2m_idx.vcpu_id)) =3D=3D N=
ULL )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        a.u.get_vcpu_p2m_idx.altp2m_idx =3D altp2m_vcpu_idx(v);
+        rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
+        break;
+    }
+
+    case HVMOP_altp2m_set_visibility:
+    {
+        unsigned int idx =3D a.u.set_visibility.altp2m_idx;
+
+        if ( a.u.set_visibility.pad )
+            rc =3D -EINVAL;
+        else if ( !altp2m_active(d) )
+            rc =3D -EOPNOTSUPP;
+        else
+            rc =3D altp2m_set_view_visibility(d, idx, a.u.set_visibility.v=
isible);
+        break;
+    }
+
+    default:
+        ASSERT_UNREACHABLE();
+        rc =3D -EOPNOTSUPP;
+        break;
+    }
+
+ out:
+    rcu_unlock_domain(d);
+
+    return rc;
+}
+#else
+int do_altp2m_op(
+    XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+#endif
=20
 /*
  * Local variables:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index b3b21124dd7e..be627152668a 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -2,8 +2,12 @@
 #ifndef __XEN_ALTP2M_H__
 #define __XEN_ALTP2M_H__
=20
+#include <xen/errno.h>
+#include <xen/param.h>
 #include <xen/sched.h>
=20
+#include <public/hvm/hvm_op.h>
+
 #ifdef CONFIG_ALTP2M
=20
 /* Alternate p2m HVM on/off per domain */
@@ -12,6 +16,8 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
=20
+int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
+
 #else /* CONFIG_ALTP2M */
=20
 static inline bool altp2m_active(const struct domain *d)
@@ -19,6 +25,11 @@ static inline bool altp2m_active(const struct domain *d)
     return false;
 }
=20
+static inline int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_ALTP2M */
=20
 #endif /* __XEN_ALTP2M_H__ */
--=20
2.34.1


