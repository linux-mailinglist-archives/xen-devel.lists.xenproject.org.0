Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F79BB7C2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 15:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830029.1244961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4W-00072M-5Q; Mon, 04 Nov 2024 14:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830029.1244961; Mon, 04 Nov 2024 14:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4W-000703-27; Mon, 04 Nov 2024 14:28:48 +0000
Received: by outflank-mailman (input) for mailman id 830029;
 Mon, 04 Nov 2024 14:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/Au=R7=bounce.vates.tech=bounce-md_30504962.6728da16.v1-7508323027114daba6c0ca034902f9e2@srs-se1.protection.inumbo.net>)
 id 1t7y4U-0006XR-FJ
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 14:28:46 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 163327b8-9ab9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 15:28:41 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xhv3B5J1lzS62JQD
 for <xen-devel@lists.xenproject.org>; Mon,  4 Nov 2024 14:28:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7508323027114daba6c0ca034902f9e2; Mon, 04 Nov 2024 14:28:38 +0000
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
X-Inumbo-ID: 163327b8-9ab9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEyOC4xMzAiLCJoZWxvIjoibWFpbDEyOC0xMzAuYXRsNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE2MzMyN2I4LTlhYjktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzMwNTIxLjQyMDMyNSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjhkYTE2LnYxLTc1MDgzMjMwMjcxMTRkYWJhNmMwY2EwMzQ5MDJmOWUyQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730730518; x=1730991018;
	bh=D1mN7WnP9SMvYAR3LcZNqcutNoBQ8YN4wFayrsZS04Q=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0XViHl0wfl4HMvkoQADMlPavxemCWShHiTypJhvxZo14p2ONEFvgvuxDzwJRxneal
	 ao3shHuFtao7KBmtJIOd5ILdGHWJ5zxOGujqsCnZz3VkK65FLDD23meiD+njgOpALe
	 MISmEnwZFYpTZFSitLsbDkU8M31eTn8t+VO1BcpyaQneHL9kGLztyp2HJwK01xzFMW
	 P5xPEZebrd8ZYYMG6X5TnI4Yuje5PhcKqOMFxIBGJi3uDuJKyU5qqStYJ+/kEXaO/N
	 N0scAJJ5/+rrUTlMrC7iYCbt6TeIPPNuK2TTAgd4TpOCgY0VWK8HniuXpk9Nx+siUu
	 LHgIWDZNueQ5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730730518; x=1730991018; i=teddy.astie@vates.tech;
	bh=D1mN7WnP9SMvYAR3LcZNqcutNoBQ8YN4wFayrsZS04Q=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CUvLai+jL8bxt37xAnUBo+ad6c8ZXTeRgsvb1RG9zxFtXxlkIRHkvG0Q9LY1kg7wl
	 hgFWWNvx87U2JxxMctjrwLrz8so/leYZJine3aFhanDYfJ0RJ2UEikdkGVJwYEEh2B
	 fZgFzLBFZcBs9xB7o4K9Qy/rtsfyZmMF+ZDGRjO6jeNJYhzWrd2VB7DKeyieKMoCaS
	 20wz5IVp3CJIVQBCmQTX1qPScomcGGj5ITSGyo7OnVyAZRcf3+HvTM8HorWda9mUDb
	 x9HJIXpNFH8RgGPF23WnNZnl379EDgmzsVYzkpZlhkqOQm3qLKbeaqsdEJnzkKHjMT
	 /vBJUShljHC+g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v4=202/5]=20docs/designs:=20Add=20a=20design=20document=20for=20IOMMU=20subsystem=20redesign?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730730517418
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <b847b3653a7410600e9e4bf87b515bdccd6d9496.1730718102.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1730718102.git.teddy.astie@vates.tech>
References: <cover.1730718102.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7508323027114daba6c0ca034902f9e2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241104:md
Date: Mon, 04 Nov 2024 14:28:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Current IOMMU subsystem has some limitations that make PV-IOMMU practically impossible.
One of them is the assumtion that each domain is bound to a single "IOMMU domain", which
also causes complications with quarantine implementation.

Moreover, current IOMMU subsystem is not entirely well-defined, for instance, the behavior
of map_page between ARM SMMUv3 and x86 VT-d/AMD-Vi greatly differs. On ARM, it can modifies
the domain page table while on x86, it may be forbidden (e.g using HAP with PVH), or only
modifying the devices PoV (e.g using PV).

The goal of this redesign is to define more explicitely the behavior and interface of the
IOMMU subsystem while allowing PV-IOMMU to be effectively implemented.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in V2:
* nit s/dettach/detach/

Changed in v4:
* updated for iommu_context locking changes
---
 docs/designs/iommu-contexts.md | 403 +++++++++++++++++++++++++++++++++
 1 file changed, 403 insertions(+)
 create mode 100644 docs/designs/iommu-contexts.md

diff --git a/docs/designs/iommu-contexts.md b/docs/designs/iommu-contexts.md
new file mode 100644
index 0000000000..9d6fb95549
--- /dev/null
+++ b/docs/designs/iommu-contexts.md
@@ -0,0 +1,403 @@
+# IOMMU context management in Xen
+
+Status: Experimental
+Revision: 0
+
+# Background
+
+The design for *IOMMU paravirtualization for Dom0* [1] explains that some guests may
+want to access to IOMMU features. In order to implement this in Xen, several adjustments
+needs to be made to the IOMMU subsystem.
+
+This "hardware IOMMU domain" is currently implemented on a per-domain basis such as each
+domain actually has a specific *hardware IOMMU domain*, this design aims to allow a
+single Xen domain to manage several "IOMMU context", and allow some domains (e.g Dom0
+[1]) to modify their IOMMU contexts.
+
+In addition to this, quarantine feature can be refactored into using IOMMU contexts
+to reduce the complexity of platform-specific implementations and ensuring more
+consistency across platforms.
+
+# IOMMU context
+
+We define a "IOMMU context" as being a *hardware IOMMU domain*, but named as a context
+to avoid confusion with Xen domains.
+It represents some hardware-specific data structure that contains mappings from a device
+frame-number to a machine frame-number (e.g using a pagetable) that can be applied to
+a device using IOMMU hardware.
+
+This structure is bound to a Xen domain, but a Xen domain may have several IOMMU context.
+These contexts may be modifiable using the interface as defined in [1] aside some
+specific cases (e.g modifying default context).
+
+This is implemented in Xen as a new structure that will hold context-specific
+data.
+
+```c
+struct iommu_context {
+    u16 id; /* Context id (0 means default context) */
+    struct list_head devices;
+
+    struct arch_iommu_context arch;
+
+    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
+};
+```
+
+A context is identified by a number that is domain-specific and may be used by IOMMU
+users such as PV-IOMMU by the guest.
+
+struct arch_iommu_context is splited from struct arch_iommu
+
+```c
+struct arch_iommu_context
+{
+    spinlock_t pgtables_lock;
+    struct page_list_head pgtables;
+
+    union {
+        /* Intel VT-d */
+        struct {
+            uint64_t pgd_maddr; /* io page directory machine address */
+            domid_t *didmap; /* per-iommu DID */
+            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the context uses */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            struct page_info *root_table;
+        } amd;
+    };
+};
+
+struct arch_iommu
+{
+    spinlock_t mapping_lock; /* io page table lock */
+    struct {
+        struct page_list_head list;
+        spinlock_t lock;
+    } pgtables;
+
+    struct list_head identity_maps;
+
+    union {
+        /* Intel VT-d */
+        struct {
+            /* no more context-specific values */
+            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            unsigned int paging_mode;
+            struct guest_iommu *g_iommu;
+        } amd;
+    };
+};
+```
+
+IOMMU context information is now carried by iommu_context rather than being integrated to
+struct arch_iommu.
+
+# Xen domain IOMMU structure
+
+`struct domain_iommu` is modified to allow multiples context within a single Xen domain
+to exist :
+
+```c
+struct iommu_context_list {
+    uint16_t count; /* Context count excluding default context */
+
+    /* if count > 0 */
+
+    uint64_t *bitmap; /* bitmap of context allocation */
+    struct iommu_context *map; /* Map of contexts */
+};
+
+struct domain_iommu {
+    /* ... */
+
+    struct iommu_context default_ctx;
+    struct iommu_context_list other_contexts;
+
+    /* ... */
+}
+```
+
+default_ctx is a special context with id=0 that holds the page table mapping the entire
+domain, which basically preserve the previous behavior. All devices are expected to be
+bound to this context during initialization.
+
+Along with this default context that always exist, we use a pool of contexts that has a
+fixed size at domain initialization, where contexts can be allocated (if possible), and
+have a id matching their position in the map (considering that id != 0).
+These contexts may be used by IOMMU contexts users such as PV-IOMMU or quarantine domain
+(DomIO).
+
+# Platform independent context management interface
+
+A new platform independant interface is introduced in Xen hypervisor to allow
+IOMMU contexts users to create and manage contexts within domains.
+
+```c
+/* Direct context access functions (not supposed to be used directly) */
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_no);
+void iommu_put_context(struct iommu_context *ctx);
+
+/* Flag for default context initialization */
+#define IOMMU_CONTEXT_INIT_default (1 << 0)
+
+/* Flag for quarantine contexts (scratch page, DMA Abort mode, ...) */
+#define IOMMU_CONTEXT_INIT_quarantine (1 << 1)
+
+int iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ctx_no, u32 flags);
+
+/* Flag to specify that devices will need to be reattached to default domain */
+#define IOMMU_TEARDOWN_REATTACH_DEFAULT (1 << 0)
+
+/*
+ * Flag to specify that the context needs to be destroyed preemptively
+ * (multiple calls to iommu_context_teardown will be required)
+ */
+#define IOMMU_TEARDOWN_PREEMPT (1 << 1)
+
+int iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags);
+
+/* Allocate a new context, uses CONTEXT_INIT flags */
+int iommu_context_alloc(struct domain *d, u16 *ctx_no, u32 flags);
+
+/* Free a context, uses CONTEXT_TEARDOWN flags */
+int iommu_context_free(struct domain *d, u16 ctx_no, u32 flags);
+
+/* Move a device from one context to another, including between different domains. */
+int iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                           device_t *dev, u16 ctx_no);
+
+/* Add a device to a context for first initialization */
+int iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no);
+
+/* Remove a device from a context, effectively removing it from the IOMMU. */
+int iommu_detach_context(struct domain *d, device_t *dev);
+```
+
+This interface will use a new interface with drivers to implement these features.
+
+Some existing functions will have a new parameter to specify on what context to do the operation.
+- iommu_map (iommu_legacy_map untouched)
+- iommu_unmap (iommu_legacy_unmap untouched)
+- iommu_lookup_page
+- iommu_iotlb_flush
+
+These functions will modify the iommu_context structure to accomodate with the
+operations applied, these functions will be used to replace some operations previously
+made in the IOMMU driver.
+
+# IOMMU platform_ops interface changes
+
+The IOMMU driver needs to expose a way to create and manage IOMMU contexts, the approach
+taken here is to modify the interface to allow specifying a IOMMU context on operations,
+and at the same time, simplifying the interface by relying more on iommu
+platform-independent code.
+
+Added functions in iommu_ops
+
+```c
+/* Initialize a context (creating page tables, allocating hardware, structures, ...) */
+int (*context_init)(struct domain *d, struct iommu_context *ctx,
+                    u32 flags);
+/* Destroy a context, assumes no device is bound to the context. */
+int (*context_teardown)(struct domain *d, struct iommu_context *ctx,
+                        u32 flags);
+/* Put a device in a context (assumes the device is not attached to another context) */
+int (*attach)(struct domain *d, device_t *dev,
+              struct iommu_context *ctx);
+/* Remove a device from a context, and from the IOMMU. */
+int (*detach)(struct domain *d, device_t *dev,
+              struct iommu_context *prev_ctx);
+/* Move the device from a context to another, including if the new context is in
+   another domain. d corresponds to the target domain. */
+int (*reattach)(struct domain *d, device_t *dev,
+                struct iommu_context *prev_ctx,
+                struct iommu_context *ctx);
+
+#ifdef CONFIG_HAS_PCI
+/* Specific interface for phantom function devices. */
+int (*add_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                 struct iommu_context *ctx);
+int (*remove_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                    struct iommu_context *ctx);
+#endif
+
+/* Changes in existing to use a specified iommu_context. */
+int __must_check (*map_page)(struct domain *d, dfn_t dfn, mfn_t mfn,
+                             unsigned int flags,
+                             unsigned int *flush_flags,
+                             struct iommu_context *ctx);
+int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
+                               unsigned int order,
+                               unsigned int *flush_flags,
+                               struct iommu_context *ctx);
+int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                                unsigned int *flags,
+                                struct iommu_context *ctx);
+
+int __must_check (*iotlb_flush)(struct domain *d,
+                                struct iommu_context *ctx, dfn_t dfn,
+                                unsigned long page_count,
+                                unsigned int flush_flags);
+
+void (*clear_root_pgtable)(struct domain *d, struct iommu_context *ctx);
+```
+
+These functions are redundant with existing functions, therefore, the following functions
+are replaced with new equivalents :
+- quarantine_init : platform-independent code and IOMMU_CONTEXT_INIT_quarantine flag
+- add_device : attach and add_devfn (phantom)
+- assign_device : attach and add_devfn (phantom)
+- remove_device : detach and remove_devfn (phantom)
+- reassign_device : reattach
+
+Some functionnal differences with previous functions, the following should be handled
+by platform-independent/arch-specific code instead of IOMMU driver :
+- identity mappings (unity mappings and rmrr)
+- device list in context and domain
+- domain of a device
+- quarantine
+
+The idea behind this is to implement IOMMU context features while simplifying IOMMU
+drivers implementations and ensuring more consistency between IOMMU drivers.
+
+## Phantom function handling
+
+PCI devices may use additionnal devfn to do DMA operations, in order to support such
+devices, an interface is added to map specific device functions without implying that
+the device is mapped to a new context (that may cause duplicates in Xen data structures).
+
+Functions add_devfn and remove_devfn allows to map a iommu context on specific devfn
+for a pci device, without altering platform-independent data structures.
+
+It is important for the reattach operation to care about these devices, in order
+to prevent devices from being partially reattached to the new context (see XSA-449 [2])
+by using a all-or-nothing approach for reattaching such devices.
+
+# Quarantine refactoring using IOMMU contexts
+
+The quarantine mecanism can be entirely reimplemented using IOMMU context, making
+it simpler, more consistent between platforms,
+
+Quarantine is currently only supported with x86 platforms and works by creating a
+single *hardware IOMMU domain* per quarantined device. All the quarantine logic is
+the implemented in a platform-specific fashion while actually implementing the same
+concepts :
+
+The *hardware IOMMU context* data structures for quarantine are currently stored in
+the device structure itself (using arch_pci_dev) and IOMMU driver needs to care about
+whether we are dealing with quarantine operations or regular operations (often dealt
+using macros such as QUARANTINE_SKIP or DEVICE_PGTABLE).
+
+The page table that will apply on the quarantined device is created reserved device
+regions, and adding mappings to a scratch page if enabled (quarantine=scratch-page).
+
+A new approach we can use is allowing the quarantine domain (DomIO) to manage IOMMU
+contexts, and implement all the quarantine logic using IOMMU contexts.
+
+That way, the quarantine implementation can be platform-independent, thus have a more
+consistent implementation between platforms. It will also allows quarantine to work
+with other IOMMU implementations without having to implement platform-specific behavior.
+Moreover, quarantine operations can be implemented using regular context operations
+instead of relying on driver-specific code.
+
+Quarantine implementation can be summarised as
+
+```c
+int iommu_quarantine_dev_init(device_t *dev)
+{
+    int ret;
+    u16 ctx_no;
+
+    if ( !iommu_quarantine )
+        return -EINVAL;
+
+    ret = iommu_context_alloc(dom_io, &ctx_no, IOMMU_CONTEXT_INIT_quarantine);
+
+    if ( ret )
+        return ret;
+
+    /** TODO: Setup scratch page, mappings... */
+
+    ret = iommu_reattach_context(dev->domain, dom_io, dev, ctx_no);
+
+    if ( ret )
+    {
+        ASSERT(!iommu_context_free(dom_io, ctx_no, 0));
+        return ret;
+    }
+
+    return ret;
+}
+```
+
+# Platform-specific considerations
+
+## Reference counters on target pages
+
+When mapping a guest page onto a IOMMU context, we need to make sure that
+this page is not reused for something else while being actually referenced
+by a IOMMU context. One way of doing it is incrementing the reference counter
+of each target page we map (excluding reserved regions), and decrementing it
+when the mapping isn't used anymore.
+
+One consideration to have is when destroying the context while having existing
+mappings in it. We can walk through the entire page table and decrement the
+reference counter of all mappings. All of that assumes that there is no reserved
+region mapped (which should be the case as a requirement of teardown, or as a
+consequence of REATTACH_DEFAULT flag).
+
+Another consideration is that the "cleanup mappings" operation may take a lot
+of time depending on the complexity of the page table. Making the teardown operation preemptable can allow the hypercall to be preempted if needed also preventing a malicious
+guest from stalling a CPU in a teardown operation with a specially crafted IOMMU
+context (e.g with several 1G superpages).
+
+## Limit the amount of pages IOMMU contexts can use
+
+In order to prevent a (eventually malicious) guest from causing too much allocations
+in Xen, we can enforce limits on the memory the IOMMU subsystem can use for IOMMU context.
+A possible implementation can be to preallocate a reasonably large chunk of memory
+and split it into pages for use by the IOMMU subsystem only for non-default IOMMU
+contexts (e.g PV-IOMMU interface), if this limitation is overcome, some operations
+may fail from the guest side. These limitations shouldn't impact "usual" operations
+of the IOMMU subsystem (e.g default context initialization).
+
+## x86 Architecture
+
+TODO
+
+### Intel VT-d
+
+VT-d uses DID to tag the *IOMMU domain* applied to a device and assumes that all entries
+with the same DID uses the same page table (i.e same IOMMU context).
+Under certain circonstances (e.g DRHD with DID limit below 16-bits), the *DID* is
+transparently converted into a DRHD-specific DID using a map managed internally.
+
+The current implementation of the code reuses the Xen domain_id as DID.
+However, by using multiples IOMMU contexts per domain, we can't use the domain_id for
+contexts (otherwise, different page tables will be mapped with the same DID).
+The following strategy is used :
+- on the default context, reuse the domain_id (the default context is unique per domain)
+- on non-default context, use a id allocated in the pseudo_domid map, (actually used by
+quarantine) which is a DID outside of Xen domain_id range
+
+### AMD-Vi
+
+TODO
+
+## Device-tree platforms
+
+### SMMU and SMMUv3
+
+TODO
+
+* * *
+
+[1] See pv-iommu.md
+
+[2] pci: phantom functions assigned to incorrect contexts
+https://xenbits.xen.org/xsa/advisory-449.html
\ No newline at end of file
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

