Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIgoNp69rmlEIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881B238DF0
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249411.1546919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlQ-0006mH-I7; Mon, 09 Mar 2026 12:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249411.1546919; Mon, 09 Mar 2026 12:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlQ-0006lT-E7; Mon, 09 Mar 2026 12:31:12 +0000
Received: by outflank-mailman (input) for mailman id 1249411;
 Mon, 09 Mar 2026 12:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWt/=BJ=bounce.vates.tech=bounce-md_30504962.69aebd88.v1-38f089334e9845c5a00cae713d259456@srs-se1.protection.inumbo.net>)
 id 1vzZlO-0005Rm-SE
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:10 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d944a38b-1bb3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:31:08 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fTxFN1w12z1XLF8j
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 38f089334e9845c5a00cae713d259456; Mon, 09 Mar 2026 12:31:04 +0000
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
X-Inumbo-ID: d944a38b-1bb3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059464; x=1773329464;
	bh=8+F/N10Okp6RfYj1zYdJt0ofiEUV907OfuUloITkdiw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wSM3FQH5mNlY+zX9aKEo3rsRUwYf0BWwg/YLlRJBE2J6wDfRxNgQTpCfIStEaJDpW
	 /PXz9cff2jtHpHQpm16eZvp2Wu6aCvYH7qMcKHnC3+Gj1urYIoIfoOGJIk7CKOsYB1
	 pmFgtQh24WlxT0oh67lWZB8r8SuwjXQw9E2tWt8X3xkI0hyM+Ia0C8qJ8GBMbxhh48
	 UEL7ABQEALS9WfdUREsprMnlUh6G5clXeb5BdLvdNikrygLFrtCjnm39JamFoJGuoB
	 uJU7YjzCTOYO/3aeEn2p9fnXr7PAHSdKV8nPlBvBaaD0Ul39TZUl9R5tPaNMsgAExi
	 cgDrMuJsD8ELg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059464; x=1773319964; i=julian.vetter@vates.tech;
	bh=8+F/N10Okp6RfYj1zYdJt0ofiEUV907OfuUloITkdiw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SfTmeYvB+GVhEgrnLB1artUKzYiFGONKBzb8OMJzg8NDKlJOhts2mSQVROHVr0PZy
	 z6dPHOnPb8ZjvWmw9wahgVSh/XGlknesZxa+5g5hD8WFLrabRjIqMroUlYqh7Rhi7a
	 3Qdz+HVwDfKgT5k3JaIafvH5GmoNqfeiBlR+W/poOsr9b2uHpiDTJnVz41iBoTDQzZ
	 uGktBdWo1Xs7berDVb+QtCOjzrb01NkhsiZdSG5Qav5q02pa0FW7e9kuE73cAc+Z9Y
	 PyvcZ//bXzJzQmeQbLn/+imle9ZG3JvmJy9jdMuIGltJg3NgPklHARCdInrBpOHRHL
	 lfLLIQvv+P7cg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=206/7]=20x86/dmop:=20Add=20XEN=5FDMOP=5Fenable=5Fext=5Fdest=5Fid=20DM=20op?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059463079
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-6-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.38f089334e9845c5a00cae713d259456?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8881B238DF0
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
	NEURAL_HAM(-0.00)[-0.282];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Xen cannot simply advertise XEN_HVM_CPUID_EXT_DEST_ID to the guest
without knowing that the device model will handle extended destination
IDs correctly for passthrough MSIs. A device model that still uses
XEN_DOMCTL_bind_pt_irq would pass only the low 8 bits of the destination
ID, misrouting interrupts to vCPUs with APIC IDs greater than 255. So,
add a DM op XEN_DMOP_enable_ext_dest_id that the device model can call
during domain setup (before vCPUs are started) to signal that it will
use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings. When
called, Xen sets ext_dest_id_enabled in struct hvm_domain, so it's
visible to the guest via CPUID.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- New patch addressing feedback from Roger
---
 tools/include/xendevicemodel.h        | 14 ++++++++++++++
 tools/libs/devicemodel/core.c         | 10 ++++++++++
 xen/arch/x86/hvm/dm.c                 |  5 +++++
 xen/arch/x86/include/asm/hvm/domain.h |  7 +++++++
 xen/include/public/hvm/dm_op.h        |  9 +++++++++
 5 files changed, 45 insertions(+)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 0d5d7b0ff1..270d76fe9c 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -412,6 +412,20 @@ int xendevicemodel_unbind_pt_msi_irq(
     xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
     uint8_t gvec, uint64_t msi_addr, uint32_t msi_data);
 
+/**
+ * This function signals to Xen that this device model will use
+ * xendevicemodel_bind_pt_msi_irq() for all passthrough MSI bindings.
+ * After this call, Xen will advertise XEN_HVM_CPUID_EXT_DEST_ID to the
+ * guest, enabling 15-bit destination IDs. Must be called before the
+ * guest vCPUs are started!
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced.
+ * @return 0 on success, -1 on failure.
+ */
+int xendevicemodel_enable_ext_dest_id(
+    xendevicemodel_handle *dmod, domid_t domid);
+
 #endif /* XENDEVICEMODEL_H */
 
 /*
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 4a52fe4750..03838aa37b 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -689,6 +689,16 @@ int xendevicemodel_unbind_pt_msi_irq(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
 
+int xendevicemodel_enable_ext_dest_id(
+    xendevicemodel_handle *dmod, domid_t domid)
+{
+    struct xen_dm_op op = {
+        .op = XEN_DMOP_enable_ext_dest_id,
+    };
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
 {
     return osdep_xendevicemodel_restrict(dmod, domid);
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3d530d948f..7738400540 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -374,6 +374,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
         [XEN_DMOP_bind_pt_msi_irq]                  = sizeof(struct xen_dm_op_bind_pt_msi_irq),
         [XEN_DMOP_unbind_pt_msi_irq]                = sizeof(struct xen_dm_op_bind_pt_msi_irq),
+        [XEN_DMOP_enable_ext_dest_id]               = 0,
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -708,6 +709,10 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
 
+    case XEN_DMOP_enable_ext_dest_id:
+        d->arch.hvm.ext_dest_id_enabled = true;
+        break;
+
     default:
         rc = ioreq_server_dm_op(&op, d, &const_op);
         break;
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index abf9bc448d..770bc96970 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -105,6 +105,13 @@ struct hvm_domain {
     /* Compatibility setting for a bug in x2APIC LDR */
     bool bug_x2apic_ldr_vcpu_id;
 
+    /*
+     * Set by the device model via XEN_DMOP_enable_ext_dest_id to indicate
+     * it uses XEN_DMOP_bind_pt_msi_irq (raw MSI addr/data) for passthrough.
+     * Controls advertisement of XEN_HVM_CPUID_EXT_DEST_ID to the guest.
+     */
+    bool ext_dest_id_enabled;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fd0f3a6a99..2814fe1c3d 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -447,6 +447,15 @@ typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
 #define XEN_DMOP_bind_pt_msi_irq   21
 #define XEN_DMOP_unbind_pt_msi_irq 22
 
+/*
+ * XEN_DMOP_enable_ext_dest_id: Signal to Xen that this device model will use
+ * XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing raw MSI
+ * address/data fields. Once called, Xen will advertise
+ * XEN_HVM_CPUID_EXT_DEST_ID to the guest. Must be called before the guest
+ * starts.
+ */
+#define XEN_DMOP_enable_ext_dest_id 23
+
 struct xen_dm_op_bind_pt_msi_irq {
     /* IN - physical IRQ (pirq) */
     uint32_t machine_irq;
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


