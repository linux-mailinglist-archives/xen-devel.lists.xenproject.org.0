Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE+7Ipq9rmlEIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F9238DDA
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249409.1546902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlO-0006K7-S6; Mon, 09 Mar 2026 12:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249409.1546902; Mon, 09 Mar 2026 12:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlO-0006HW-NX; Mon, 09 Mar 2026 12:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1249409;
 Mon, 09 Mar 2026 12:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VG/=BJ=bounce.vates.tech=bounce-md_30504962.69aebd87.v1-18a1a1d1df8149379ba464e21f873ad8@srs-se1.protection.inumbo.net>)
 id 1vzZlM-0005Rm-Rz
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:08 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b9d31f-1bb3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:31:06 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fTxFM3ypbz1XLF7l
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 18a1a1d1df8149379ba464e21f873ad8; Mon, 09 Mar 2026 12:31:03 +0000
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
X-Inumbo-ID: d7b9d31f-1bb3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059463; x=1773329463;
	bh=Mx7xiEpCf87KqJdZ5mo3DMQmHNKXahVe5TvPx89UTcQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q4fxtnhuffHtZoXaXfGXNRFa+aF9DMczP4kP9e0mvKQY803coNgRiq0HdwZQpSZUJ
	 I2+6JYiuEN5FW9kcHAYlrCaJXmD7TrlzpiNxlIY5FiBgb3SC5i1v9wPrRmywMsoIeM
	 mOUrNcE+xUDqj7jBDcGOf/aeQMtS25pxgbre0yzIULd6JfMUBVKTJmir4730lVEuAs
	 L7q+A7SjSnO72FmBsQqNG+0Hnp0SbHEk7v+9OmcjaJQ7HevaGSoOLAPkUqAFTw7F5R
	 V/3hNxH6sZkzMhBBU+6Xv2GaMikQmKES924VsOJh3R2wkIrLIKqtnsc/mbMaNNI38R
	 +znp5tfH+de/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059463; x=1773319963; i=julian.vetter@vates.tech;
	bh=Mx7xiEpCf87KqJdZ5mo3DMQmHNKXahVe5TvPx89UTcQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QwXrRM0B4KQ7VTIFOhOnI/cKO8u9el1Gi4Qp67yPPSq89B7vmTGRM1UJ6oybNkGiP
	 aon7NlViXYTsPa5JbUEsz7PaKx8jY3Gpyhh+A/41ABgbsBzfUiVxqgD6XapRBupUiV
	 xLglYlL7EkOrJO/SlYMxEcZVkDqQyrM87z+sgZZ4ooxZgAasZCdX4XK9XpzYsFbNKm
	 oz64x5R8FyU9iKMqQKcIzNelqkjnVsn9UeVO8X2waE7UEUOjAWzov7JrZ/68biSF/U
	 SRLm2S+jmmMKuAzCzeYigfGk578/Yzq1cHxKdO+5zwKKV1PW5GV0S0oY+F8Ksh3SU4
	 Xm5g8a5RVbhmQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=203/7]=20x86/hvm:=20Support=20extended=20destination=20IDs=20in=20virtual=20MSI=20and=20IO-APIC?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059462248
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-3-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.18a1a1d1df8149379ba464e21f873ad8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 428F9238DDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.345];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Use the newly defined masks to extract the full 15-bit destination ID
from guest MSI addresses and IO-APIC RTEs. In hvm_inject_msi() combine
the standard bits [19:12] with the extended bits [11:5] of the MSI
address into a 15-bit destination ID for LAPIC delivery. Increase the
dest parameter of vmsi_deliver() and hvm_girq_dest_2_vcpu_id() from
uint8_t to uint32_t. In vmsi_deliver_pirq() extract the full destination
from gflags via XEN_DOMCTL_VMSI_X86_FULL_DEST(). In msi_gflags() pack
the extended bits from the MSI address into the new
XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK field of gflags. In
vioapic_deliver() read the combined 15-bit destination using the
VIOAPIC_RTE_DEST() macro. Extend ioapic_check() to check for extended
destination bits set in a domain that does not advertise
XEN_HVM_CPUID_EXT_DEST_ID and refuse to restore the IO-APIC state,
preventing silent interrupt misrouting after live migration.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- Added additional check to the vioapic_check that makes sure that the
  extended bits are not set for domains that don't support it
- Addressed comments from Jan -> Replaced all constants by a proper define
---
 xen/arch/x86/hvm/irq.c             | 11 ++++++++++-
 xen/arch/x86/hvm/vioapic.c         | 21 +++++++++++++++++++--
 xen/arch/x86/hvm/vmsi.c            |  8 +++++---
 xen/arch/x86/include/asm/hvm/hvm.h |  4 ++--
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f64361113..b520fc1150 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -374,7 +374,16 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp = (uint32_t) addr;
-    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
+    /*
+     * Standard MSI destination address bits 19:12 (8 bits).
+     * Extended MSI destination address bits 11:5 (7 more bits).
+     *
+     * As XEN_HVM_CPUID_EXT_DEST_ID is advertised, the guest may use bits 11:5
+     * for high destination ID bits, expanding to 15 bits total. Guests unaware
+     * of this feature set these bits to 0, so this is backwards-compatible.
+     */
+    uint32_t dest = (MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK) << MSI_ADDR_DEST_ID_BITS) |
+                     MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK);
     uint8_t  dest_mode = !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode = (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index d7a4105a57..9602572dc4 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -411,7 +411,9 @@ static void ioapic_inj_irq(
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
-    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
+    uint32_t dest = ((uint32_t)vioapic->redirtbl[pin].fields.ext_dest_id <<
+                     VIOAPIC_RTE_DEST_ID_UPPER_BITS) |
+                    vioapic->redirtbl[pin].fields.dest_id;
     uint8_t dest_mode = vioapic->redirtbl[pin].fields.dest_mode;
     uint8_t delivery_mode = vioapic->redirtbl[pin].fields.delivery_mode;
     uint8_t vector = vioapic->redirtbl[pin].fields.vector;
@@ -618,6 +620,21 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
              e->fields.reserved[0] || e->fields.reserved[1] ||
              e->fields.reserved[2] || e->fields.reserved2 )
             return -EINVAL;
+
+        /*
+         * An RTE in the saved state has ext_dest_id bits set. Check that
+         * the destination Xen has extended destination ID support enabled,
+         * otherwise interrupt routing to APIC IDs > 255 would be broken
+         * after restore.
+         */
+        if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled )
+        {
+            printk(XENLOG_G_ERR "HVM restore: %pd IO-APIC RTE %u has "
+                                "extended destination ID bits set but "
+                                "XEN_HVM_CPUID_EXT_DEST_ID is not enabled\n",
+                                d, i);
+            return -EINVAL;
+        }
     }
 
     return 0;
@@ -659,7 +676,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_check, ioapic_load, 1,
                           HVMSR_PER_DOM);
 
 void vioapic_reset(struct domain *d)
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 27b1f089e2..36ea898ac7 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -66,7 +66,7 @@ static void vmsi_inj_irq(
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -109,7 +109,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
     int vector = pirq_dpci->gmsi.gvec;
-    uint8_t dest = (uint8_t)flags;
+    uint32_t dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(flags);
     bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
     uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
     bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
@@ -125,7 +125,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest_mode)
 {
     int dest_vcpu_id = -1, w = 0;
     struct vcpu *v;
@@ -802,6 +802,8 @@ static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
      */
     return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_EXT_DEST_ID_MASK),
+                     XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
                      XEN_DOMCTL_VMSI_X86_RH_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..11256d5e67 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -295,11 +295,11 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, uint64_t at_tsc);
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest_mode);
 
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


