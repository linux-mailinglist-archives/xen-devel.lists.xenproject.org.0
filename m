Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314F9BB7C1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 15:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830028.1244948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4U-0006g3-Vl; Mon, 04 Nov 2024 14:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830028.1244948; Mon, 04 Nov 2024 14:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4U-0006bX-RU; Mon, 04 Nov 2024 14:28:46 +0000
Received: by outflank-mailman (input) for mailman id 830028;
 Mon, 04 Nov 2024 14:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU59=R7=bounce.vates.tech=bounce-md_30504962.6728da16.v1-c73bd8112cf84b748d25877597e6fecd@srs-se1.protection.inumbo.net>)
 id 1t7y4U-0006XR-4Y
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 14:28:46 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16330b5d-9ab9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 15:28:41 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xhv3B0fpxzS62J3L
 for <xen-devel@lists.xenproject.org>; Mon,  4 Nov 2024 14:28:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c73bd8112cf84b748d25877597e6fecd; Mon, 04 Nov 2024 14:28:38 +0000
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
X-Inumbo-ID: 16330b5d-9ab9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEyOC4xMzAiLCJoZWxvIjoibWFpbDEyOC0xMzAuYXRsNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE2MzMwYjVkLTlhYjktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzMwNTIxLjQxOTQ3OSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjhkYTE2LnYxLWM3M2JkODExMmNmODRiNzQ4ZDI1ODc3NTk3ZTZmZWNkQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730730518; x=1730991018;
	bh=lagNsxIirOQVnbaqxV6zpDUMQQ7gHdhShgfs5hmfEI0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S7A4OsWV+sxjicgIdSRTyrIEEzbaoXMma9Txhytr6cDZsrDqTcPWOcp3FtNpWtyB0
	 wrznw//qrv6UJrxXyqDLznlE38HVPXq5koIVcee3r3XSL7sPae7ljJMYbqy3jNBer1
	 /N8+JJ2wZWDc/S/DOo8im1bky3B3PxzHT9qxqgUKO9VJgs5kCPGCusy1r+1ZUkL2xt
	 PBIquYwbrVUVMxvinzF6W4XdFKPhOzqGPEM2FuYDWp+2SPriyHYUz0n0hyEfU0iMQD
	 pdNeGDZSEqvtISeBv1kRmuxpz03IU22LV4m95O03Sm+PEDvsxwW3FQggBqpISglRhQ
	 PDA0hvjUZyrBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730730518; x=1730991018; i=teddy.astie@vates.tech;
	bh=lagNsxIirOQVnbaqxV6zpDUMQQ7gHdhShgfs5hmfEI0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YrsxMLV2wloinoEvmT7QtNKKZDMO5jbrL8a768H5MRY7ttNZ59GEiz4YsCa+ncm0/
	 bx1g68l61TlGw3GTaMWzbccoIqnZZA1uyjSMOJGj0TmErJtwBHXLZ3SfDgENlolvp5
	 IaMCI9uTnhFYJ471xnodHP1Dx24Sr8L4SQoVbFHoGG4eASG3IeGiDjG43ndAejnYkN
	 JE34CRCmFdBePn0jYgVc27j/rcGlRNM35fmKZ+irSeon4L4Nqk6iklc5vwxK4l2uoY
	 uTfWZ3BJFyRWaEJAxR6tbkzRrgvs87570lLnEuGYOyCYn5nlO/nuOOswqlMJC7io2S
	 cjt5xa95yl4/A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v4=201/5]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730730517125
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <787ca634b46c582dad04ab1cc93c840c4f739fa7.1730718102.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1730718102.git.teddy.astie@vates.tech>
References: <cover.1730718102.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c73bd8112cf84b748d25877597e6fecd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241104:md
Date: Mon, 04 Nov 2024 14:28:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Some operating systems want to use IOMMU to implement various features (e.g
VFIO) or DMA protection.
This patch introduce a proposal for IOMMU paravirtualization for Dom0.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changes in v4:
* added init and remote_op commands
---
 docs/designs/pv-iommu.md | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 docs/designs/pv-iommu.md

diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
new file mode 100644
index 0000000000..7df9fa0b94
--- /dev/null
+++ b/docs/designs/pv-iommu.md
@@ -0,0 +1,116 @@
+# IOMMU paravirtualization for Dom0
+
+Status: Experimental
+
+# Background
+
+By default, Xen only uses the IOMMU for itself, either to make device adress
+space coherent with guest adress space (x86 HVM/PVH) or to prevent devices
+from doing DMA outside it's expected memory regions including the hypervisor
+(x86 PV).
+
+A limitation is that guests (especially privildged ones) may want to use
+IOMMU hardware in order to implement features such as DMA protection and
+VFIO [1] as IOMMU functionality is not available outside of the hypervisor
+currently.
+
+[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/latest/driver-api/vfio.html
+
+# Design
+
+The operating system may want to have access to various IOMMU features such as
+context management and DMA remapping. We can create a new hypercall that allows
+the guest to have access to a new paravirtualized IOMMU interface.
+
+This feature is only meant to be available for the Dom0, as DomU have some
+emulated devices that can't be managed on Xen side and are not hardware, we
+can't rely on the hardware IOMMU to enforce DMA remapping.
+
+This interface is exposed under the `iommu_op` hypercall.
+
+In addition, Xen domains are modified in order to allow existence of several
+IOMMU context including a default one that implement default behavior (e.g
+hardware assisted paging) and can't be modified by guest. DomU cannot have
+contexts, and therefore act as if they only have the default domain.
+
+Each IOMMU context within a Xen domain is identified using a domain-specific
+context number that is used in the Xen IOMMU subsystem and the hypercall
+interface.
+
+The number of IOMMU context a domain is specified by either the toolstack or
+the domain itself.
+
+# IOMMU operations
+
+## Initialize PV-IOMMU
+
+Initialize PV-IOMMU for the domain.
+It can only be called once.
+
+## Alloc context
+
+Create a new IOMMU context for the guest and return the context number to the
+guest.
+Fail if the IOMMU context limit of the guest is reached.
+
+A flag can be specified to create a identity mapping.
+
+## Free context
+
+Destroy a IOMMU context created previously.
+It is not possible to free the default context.
+
+Reattach context devices to default context if specified by the guest.
+
+Fail if there is a device in the context and reattach-to-default flag is not
+specified.
+
+## Reattach device
+
+Reattach a device to another IOMMU context (including the default one).
+The target IOMMU context number must be valid and the context allocated.
+
+The guest needs to specify a PCI SBDF of a device he has access to.
+
+## Map/unmap page
+
+Map/unmap a page on a context.
+The guest needs to specify a gfn and target dfn to map.
+
+Refuse to create the mapping if one already exist for the same dfn.
+
+## Lookup page
+
+Get the gfn mapped by a specific dfn.
+
+## Remote command
+
+Make a PV-IOMMU operation on behalf of another domain.
+Especially useful for implementing IOMMU emulation (e.g using QEMU)
+or initializing PV-IOMMU with enforced limits.
+
+# Implementation considerations
+
+## Hypercall batching
+
+In order to prevent unneeded hypercalls and IOMMU flushing, it is advisable to
+be able to batch some critical IOMMU operations (e.g map/unmap multiple pages).
+
+## Hardware without IOMMU support
+
+Operating system needs to be aware on PV-IOMMU capability, and whether it is
+able to make contexts. However, some operating system may critically fail in
+case they are able to make a new IOMMU context. Which is supposed to happen
+if no IOMMU hardware is available.
+
+The hypercall interface needs a interface to advertise the ability to create
+and manage IOMMU contexts including the amount of context the guest is able
+to use. Using these informations, the Dom0 may decide whether to use or not
+the PV-IOMMU interface.
+
+## Page pool for contexts
+
+In order to prevent unexpected starving on the hypervisor memory with a
+buggy Dom0. We can preallocate the pages the contexts will use and make
+map/unmap use these pages instead of allocating them dynamically.
+
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

