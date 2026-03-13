Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKg0OJo/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E122875FF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254162.1550155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fP-0007Fd-B3; Fri, 13 Mar 2026 16:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254162.1550155; Fri, 13 Mar 2026 16:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fP-0007D4-7V; Fri, 13 Mar 2026 16:47:15 +0000
Received: by outflank-mailman (input) for mailman id 1254162;
 Fri, 13 Mar 2026 16:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tB25=BN=bounce.vates.tech=bounce-md_30504962.69b43f8f.v1-9da3346c299f433282428ef7ed5b675a@srs-se1.protection.inumbo.net>)
 id 1w15fN-0006fv-Ps
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:47:13 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 488de31f-1efc-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:47:13 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVl36qcFzPm0PrJ
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:47:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9da3346c299f433282428ef7ed5b675a; Fri, 13 Mar 2026 16:47:11 +0000
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
X-Inumbo-ID: 488de31f-1efc-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773420432; x=1773690432;
	bh=DC1CKIcFBppLbjt/OuTdGZjS7i/aioQOlGzfj9vAJWw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DHcafeb2jsW8ePN6TSPuXt+3/Zsn94Zbs2W3vE1NYyL+A/vszksw6iM5iCeaK70l+
	 QIZJ3C+2fMFnMa4AkMWXe7YLJkpYNMMArD2ItuPscpDYtnIqulIbSb05M64CZkcQZK
	 1ZZM1ecUZ/s+8hHtzW1njm0BF/rKN65DCe3LnO3YWeo8fUvnjc1P2n+nrQqtD1Liev
	 mCaDr20y/nihr7AwI9H8U8KCffbz7zmexTJe8iPAEwqftIA+Ke45MUIU0eUZX7MhwT
	 svBdfUF6CYFbKr47+R/dk0gN9lxhu8oaCXJmy6ONnUk1zZmXlggE0hWgxmIjyjeGK+
	 RQfAanWIrs+1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773420432; x=1773680932; i=thierry.escande@vates.tech;
	bh=DC1CKIcFBppLbjt/OuTdGZjS7i/aioQOlGzfj9vAJWw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jCgcUw+5Z/HD50i3W59KgMwRQe20btR+deRevV1za7jt5holRqhr/vydfmN9rMGS+
	 L+yaCLidmV6FL8EqZdhZLRlsHvW+DRj6XhucEeq9BYAyqTJxXxbiuTxsxAinxTtith
	 Eqwb4K//tLKZzxoDpafNzvmbT0/HeTBieITPZTuC/XAabj7S6rDbsjN/jTKfgINYlR
	 Jy4pEwoScH4zW/PIfy6qQKK0pLPiQdUqR6a8yXvspeNDapp9rGrPaRofB5isxGE+Jw
	 iTylEKcMQNgVr4ndCXGipfzLLNMvK0atfjvYGusva9b/hvYGH9U+OTFjfHTINVXLxR
	 uDC71unpe+dag==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/4]=20q35/xen:=20Add=20Xen=20support=20for=20Q35?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773420431033
To: qemu-devel@nongnu.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, "Anthony PERARD" <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Message-Id: <20260313164649.794591-3-thierry.escande@vates.tech>
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9da3346c299f433282428ef7ed5b675a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:47:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:thierry.escande@vates.tech,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.519];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8E122875FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch intializes HVM pc machine in pc_q35_init() if Xen support is
enabled.

As done for i440 machine, this also cleanups unrealized flash devices.
See commit dd29b5c30c (xen: cleanup unrealized flash devices).

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 hw/i386/pc_q35.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index cb23322f5a..89dd736d95 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -35,8 +35,10 @@
 #include "hw/core/loader.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/xen/xen-x86.h"
 #include "system/tcg.h"
 #include "system/kvm.h"
+#include "system/xen.h"
 #include "hw/i386/kvm/clock.h"
 #include "hw/pci-host/q35.h"
 #include "hw/pci/pcie_port.h"
@@ -190,6 +192,10 @@ static void pc_q35_init(MachineState *machine)
         x86ms->below_4g_mem_size = machine->ram_size;
     }
 
+    if (xen_enabled()) {
+        xen_hvm_init_pc(pcms, &machine->ram);
+    }
+
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
@@ -206,7 +212,11 @@ static void pc_q35_init(MachineState *machine)
 
     /* allocate ram and load rom/bios */
     memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
-    pc_memory_init(pcms, system_memory, pci_memory, pci_hole64_size);
+    if (!xen_enabled()) {
+        pc_memory_init(pcms, system_memory, pci_memory, pci_hole64_size);
+    } else {
+        pc_system_flash_cleanup_unused(pcms);
+    }
 
     object_property_add_child(OBJECT(machine), "q35", phb);
     object_property_set_link(phb, PCI_HOST_PROP_RAM_MEM,
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


