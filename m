Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D814F57A
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:42:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgpm-0007kA-P4; Sat, 01 Feb 2020 00:40:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YQT+=3V=merlin.srs.infradead.org=batv+14355fafd9c313d768ee+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgpk-0007k4-FF
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:40:24 +0000
X-Inumbo-ID: 6d1cd58a-448b-11ea-8396-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d1cd58a-448b-11ea-8396-bc764e2007e4;
 Sat, 01 Feb 2020 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nk3z6XaeRBEM9bziIyWifNyhZU2gwIvya4gg0/C9meo=; b=c2JzLyzaaGpYnVJSC4IAtJ928W
 0pNVJ2KpkZUznNcia7xhfkEqdcFJXC1KlO7ZqozvGH6fofXHAXc5vjmT+cY0MzVfSeNb15GCt3CDv
 mAnpyEfpqRs/JC7n7cweGjg/J6HgKQwWmIxBCbpHkmCFoIZByUzku9ZlYX+EMNjNrFsWvP8+jfzQA
 ci9SMLHDtgk0VP1f7hor+P8tmfjdKnKtuQ8LkIU5acWuFLy9YQabmQ0llbFd+YpcGd4C6SeODrJL6
 oj/118FAaA6v5eWEdmTAtFXAc82uPHSPNUYZzLxStB4W8BxhwGW0uKgRUfhEqNKdrXf+Ejikm7h1w
 rj3nk8hA==;
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgpf-0007tF-4B; Sat, 01 Feb 2020 00:40:19 +0000
Message-ID: <723edf8e07ed0cbaacb6bce40bb98de3b88d69be.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 01 Feb 2020 00:40:16 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH] libxc: migrate migration stream definitions
 into Xen public headers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Content-Type: multipart/mixed; boundary="===============5387920960443220953=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5387920960443220953==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-VIIJYbdB+zAQ/dVm7tDk"


--=-VIIJYbdB+zAQ/dVm7tDk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

These data structures will be used for live update, which is basically
just live migration from one Xen to the next on the same machine via
in-memory data structures, instead of across the network.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Well-excellent-carry-on-then-by: Ian Jackson <ian.jackson@eu.citrix.com>
Go-with-that-for-now-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/libxc/xc_sr_common.c            |  20 ++---
 tools/libxc/xc_sr_common_x86.c        |   4 +-
 tools/libxc/xc_sr_restore.c           |   2 +-
 tools/libxc/xc_sr_restore_x86_hvm.c   |   4 +-
 tools/libxc/xc_sr_restore_x86_pv.c    |   8 +-
 tools/libxc/xc_sr_save.c              |   2 +-
 tools/libxc/xc_sr_save_x86_hvm.c      |   4 +-
 tools/libxc/xc_sr_save_x86_pv.c       |  12 +--
 tools/libxc/xc_sr_stream_format.h     |  97 +-------------------
 xen/include/Makefile                  |   2 +-
 xen/include/public/migration_stream.h | 125 ++++++++++++++++++++++++++
 11 files changed, 156 insertions(+), 124 deletions(-)
 create mode 100644 xen/include/public/migration_stream.h

diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xc_sr_common.c
index dd9a11b4b5..92f9332e73 100644
--- a/tools/libxc/xc_sr_common.c
+++ b/tools/libxc/xc_sr_common.c
@@ -91,7 +91,7 @@ int write_split_record(struct xc_sr_context *ctx, struct =
xc_sr_record *rec,
 int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *re=
c)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rhdr rhdr;
+    struct mr_rhdr rhdr;
     size_t datasz;
=20
     if ( read_exact(fd, &rhdr, sizeof(rhdr)) )
@@ -142,15 +142,15 @@ static void __attribute__((unused)) build_assertions(=
void)
 {
     BUILD_BUG_ON(sizeof(struct xc_sr_ihdr) !=3D 24);
     BUILD_BUG_ON(sizeof(struct xc_sr_dhdr) !=3D 16);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rhdr) !=3D 8);
-
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_page_data_header)  !=3D 8);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_x86_pv_info)       !=3D 8);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_x86_pv_p2m_frames) !=3D 8);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_x86_pv_vcpu_hdr)   !=3D 8);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_x86_tsc_info)      !=3D 24);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params_entry)  !=3D 16);
-    BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        !=3D 8);
+    BUILD_BUG_ON(sizeof(struct mr_rhdr) !=3D 8);
+
+    BUILD_BUG_ON(sizeof(struct mr_page_data_header)  !=3D 8);
+    BUILD_BUG_ON(sizeof(struct mr_x86_pv_info)       !=3D 8);
+    BUILD_BUG_ON(sizeof(struct mr_x86_pv_p2m_frames) !=3D 8);
+    BUILD_BUG_ON(sizeof(struct mr_x86_pv_vcpu_hdr)   !=3D 8);
+    BUILD_BUG_ON(sizeof(struct mr_x86_tsc_info)      !=3D 24);
+    BUILD_BUG_ON(sizeof(struct mr_hvm_params_entry)  !=3D 16);
+    BUILD_BUG_ON(sizeof(struct mr_hvm_params)        !=3D 8);
 }
=20
 /*
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xc_sr_common_x86.=
c
index 011684df97..1627ff72d6 100644
--- a/tools/libxc/xc_sr_common_x86.c
+++ b/tools/libxc/xc_sr_common_x86.c
@@ -3,7 +3,7 @@
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_tsc_info tsc =3D {};
+    struct mr_x86_tsc_info tsc =3D {};
     struct xc_sr_record rec =3D {
         .type =3D REC_TYPE_X86_TSC_INFO,
         .length =3D sizeof(tsc),
@@ -23,7 +23,7 @@ int write_x86_tsc_info(struct xc_sr_context *ctx)
 int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *re=
c)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_tsc_info *tsc =3D rec->data;
+    struct mr_x86_tsc_info *tsc =3D rec->data;
=20
     if ( rec->length !=3D sizeof(*tsc) )
     {
diff --git a/tools/libxc/xc_sr_restore.c b/tools/libxc/xc_sr_restore.c
index 5e31908ca8..29c264ecc7 100644
--- a/tools/libxc/xc_sr_restore.c
+++ b/tools/libxc/xc_sr_restore.c
@@ -335,7 +335,7 @@ static int process_page_data(struct xc_sr_context *ctx,=
 unsigned int count,
 static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record=
 *rec)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_page_data_header *pages =3D rec->data;
+    struct mr_page_data_header *pages =3D rec->data;
     unsigned int i, pages_of_data =3D 0;
     int rc =3D -1;
=20
diff --git a/tools/libxc/xc_sr_restore_x86_hvm.c b/tools/libxc/xc_sr_restor=
e_x86_hvm.c
index 3f78248f32..e5b25f4280 100644
--- a/tools/libxc/xc_sr_restore_x86_hvm.c
+++ b/tools/libxc/xc_sr_restore_x86_hvm.c
@@ -25,8 +25,8 @@ static int handle_hvm_params(struct xc_sr_context *ctx,
                              struct xc_sr_record *rec)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_hvm_params *hdr =3D rec->data;
-    struct xc_sr_rec_hvm_params_entry *entry =3D hdr->param;
+    struct mr_hvm_params *hdr =3D rec->data;
+    struct mr_hvm_params_entry *entry =3D hdr->param;
     unsigned int i;
     int rc;
=20
diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xc_sr_restore=
_x86_pv.c
index 16e738884e..8e43ddcfd7 100644
--- a/tools/libxc/xc_sr_restore_x86_pv.c
+++ b/tools/libxc/xc_sr_restore_x86_pv.c
@@ -585,7 +585,7 @@ static int update_guest_p2m(struct xc_sr_context *ctx)
  * Cross-check the legitimate combinations.
  */
 static bool valid_x86_pv_info_combination(
-    const struct xc_sr_rec_x86_pv_info *info)
+    const struct mr_x86_pv_info *info)
 {
     switch ( info->guest_width )
     {
@@ -602,7 +602,7 @@ static int handle_x86_pv_info(struct xc_sr_context *ctx=
,
                               struct xc_sr_record *rec)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_pv_info *info =3D rec->data;
+    struct mr_x86_pv_info *info =3D rec->data;
=20
     if ( ctx->x86.pv.restore.seen_pv_info )
     {
@@ -675,7 +675,7 @@ static int handle_x86_pv_p2m_frames(struct xc_sr_contex=
t *ctx,
                                     struct xc_sr_record *rec)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_pv_p2m_frames *data =3D rec->data;
+    struct mr_x86_pv_p2m_frames *data =3D rec->data;
     unsigned int start, end, x, fpp =3D PAGE_SIZE / ctx->x86.pv.width;
     int rc;
=20
@@ -734,7 +734,7 @@ static int handle_x86_pv_vcpu_blob(struct xc_sr_context=
 *ctx,
                                    struct xc_sr_record *rec)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_pv_vcpu_hdr *vhdr =3D rec->data;
+    struct mr_x86_pv_vcpu_hdr *vhdr =3D rec->data;
     struct xc_sr_x86_pv_restore_vcpu *vcpu;
     const char *rec_name;
     size_t blobsz;
diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
index fa736a311f..41af26909e 100644
--- a/tools/libxc/xc_sr_save.c
+++ b/tools/libxc/xc_sr_save.c
@@ -87,7 +87,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *page, *orig_page;
     uint64_t *rec_pfns =3D NULL;
     struct iovec *iov =3D NULL; int iovcnt =3D 0;
-    struct xc_sr_rec_page_data_header hdr =3D { 0 };
+    struct mr_page_data_header hdr =3D { 0 };
     struct xc_sr_record rec =3D {
         .type =3D REC_TYPE_PAGE_DATA,
     };
diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xc_sr_save_x86_=
hvm.c
index d99efe65e5..c4dc42479f 100644
--- a/tools/libxc/xc_sr_save_x86_hvm.c
+++ b/tools/libxc/xc_sr_save_x86_hvm.c
@@ -80,8 +80,8 @@ static int write_hvm_params(struct xc_sr_context *ctx)
     };
=20
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_hvm_params_entry entries[ARRAY_SIZE(params)];
-    struct xc_sr_rec_hvm_params hdr =3D {
+    struct mr_hvm_params_entry entries[ARRAY_SIZE(params)];
+    struct mr_hvm_params hdr =3D {
         .count =3D 0,
     };
     struct xc_sr_record rec =3D {
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xc_sr_save_x86_p=
v.c
index f3ccf5bb4b..916c5aad41 100644
--- a/tools/libxc/xc_sr_save_x86_pv.c
+++ b/tools/libxc/xc_sr_save_x86_pv.c
@@ -485,7 +485,7 @@ static int write_one_vcpu_basic(struct xc_sr_context *c=
tx, uint32_t id)
     unsigned int i, gdt_count;
     int rc =3D -1;
     vcpu_guest_context_any_t vcpu;
-    struct xc_sr_rec_x86_pv_vcpu_hdr vhdr =3D {
+    struct mr_x86_pv_vcpu_hdr vhdr =3D {
         .vcpu_id =3D id,
     };
     struct xc_sr_record rec =3D {
@@ -583,7 +583,7 @@ static int write_one_vcpu_basic(struct xc_sr_context *c=
tx, uint32_t id)
 static int write_one_vcpu_extended(struct xc_sr_context *ctx, uint32_t id)
 {
     xc_interface *xch =3D ctx->xch;
-    struct xc_sr_rec_x86_pv_vcpu_hdr vhdr =3D {
+    struct mr_x86_pv_vcpu_hdr vhdr =3D {
         .vcpu_id =3D id,
     };
     struct xc_sr_record rec =3D {
@@ -620,7 +620,7 @@ static int write_one_vcpu_xsave(struct xc_sr_context *c=
tx, uint32_t id)
     xc_interface *xch =3D ctx->xch;
     int rc =3D -1;
     DECLARE_HYPERCALL_BUFFER(void, buffer);
-    struct xc_sr_rec_x86_pv_vcpu_hdr vhdr =3D {
+    struct mr_x86_pv_vcpu_hdr vhdr =3D {
         .vcpu_id =3D id,
     };
     struct xc_sr_record rec =3D {
@@ -686,7 +686,7 @@ static int write_one_vcpu_msrs(struct xc_sr_context *ct=
x, uint32_t id)
     int rc =3D -1;
     size_t buffersz;
     DECLARE_HYPERCALL_BUFFER(void, buffer);
-    struct xc_sr_rec_x86_pv_vcpu_hdr vhdr =3D {
+    struct mr_x86_pv_vcpu_hdr vhdr =3D {
         .vcpu_id =3D id,
     };
     struct xc_sr_record rec =3D {
@@ -793,7 +793,7 @@ static int write_all_vcpu_information(struct xc_sr_cont=
ext *ctx)
  */
 static int write_x86_pv_info(struct xc_sr_context *ctx)
 {
-    struct xc_sr_rec_x86_pv_info info =3D {
+    struct mr_x86_pv_info info =3D {
         .guest_width =3D ctx->x86.pv.width,
         .pt_levels =3D ctx->x86.pv.levels,
     };
@@ -816,7 +816,7 @@ static int write_x86_pv_p2m_frames(struct xc_sr_context=
 *ctx)
     int rc; unsigned int i;
     size_t datasz =3D ctx->x86.pv.p2m_frames * sizeof(uint64_t);
     uint64_t *data =3D NULL;
-    struct xc_sr_rec_x86_pv_p2m_frames hdr =3D {
+    struct mr_x86_pv_p2m_frames hdr =3D {
         .end_pfn =3D ctx->x86.pv.max_pfn,
     };
     struct xc_sr_record rec =3D {
diff --git a/tools/libxc/xc_sr_stream_format.h b/tools/libxc/xc_sr_stream_f=
ormat.h
index 37a7da6eab..0700cde54f 100644
--- a/tools/libxc/xc_sr_stream_format.h
+++ b/tools/libxc/xc_sr_stream_format.h
@@ -1,6 +1,8 @@
 #ifndef __STREAM_FORMAT__H
 #define __STREAM_FORMAT__H
=20
+#include <xen/migration_stream.h>
+
 /*
  * C structures for the Migration v2 stream format.
  * See docs/specs/libxc-migration-stream.pandoc
@@ -41,101 +43,6 @@ struct xc_sr_dhdr
     uint32_t xen_minor;
 };
=20
-#define DHDR_TYPE_X86_PV  0x00000001U
-#define DHDR_TYPE_X86_HVM 0x00000002U
-
-/*
- * Record Header
- */
-struct xc_sr_rhdr
-{
-    uint32_t type;
-    uint32_t length;
-};
-
-/* All records must be aligned up to an 8 octet boundary */
-#define REC_ALIGN_ORDER               (3U)
-/* Somewhat arbitrary - 128MB */
-#define REC_LENGTH_MAX                (128U << 20)
-
-#define REC_TYPE_END                        0x00000000U
-#define REC_TYPE_PAGE_DATA                  0x00000001U
-#define REC_TYPE_X86_PV_INFO                0x00000002U
-#define REC_TYPE_X86_PV_P2M_FRAMES          0x00000003U
-#define REC_TYPE_X86_PV_VCPU_BASIC          0x00000004U
-#define REC_TYPE_X86_PV_VCPU_EXTENDED       0x00000005U
-#define REC_TYPE_X86_PV_VCPU_XSAVE          0x00000006U
-#define REC_TYPE_SHARED_INFO                0x00000007U
-#define REC_TYPE_X86_TSC_INFO               0x00000008U
-#define REC_TYPE_HVM_CONTEXT                0x00000009U
-#define REC_TYPE_HVM_PARAMS                 0x0000000aU
-#define REC_TYPE_TOOLSTACK                  0x0000000bU
-#define REC_TYPE_X86_PV_VCPU_MSRS           0x0000000cU
-#define REC_TYPE_VERIFY                     0x0000000dU
-#define REC_TYPE_CHECKPOINT                 0x0000000eU
-#define REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST  0x0000000fU
-
-#define REC_TYPE_OPTIONAL             0x80000000U
-
-/* PAGE_DATA */
-struct xc_sr_rec_page_data_header
-{
-    uint32_t count;
-    uint32_t _res1;
-    uint64_t pfn[0];
-};
-
-#define PAGE_DATA_PFN_MASK  0x000fffffffffffffULL
-#define PAGE_DATA_TYPE_MASK 0xf000000000000000ULL
-
-/* X86_PV_INFO */
-struct xc_sr_rec_x86_pv_info
-{
-    uint8_t guest_width;
-    uint8_t pt_levels;
-    uint8_t _res[6];
-};
-
-/* X86_PV_P2M_FRAMES */
-struct xc_sr_rec_x86_pv_p2m_frames
-{
-    uint32_t start_pfn;
-    uint32_t end_pfn;
-    uint64_t p2m_pfns[0];
-};
-
-/* X86_PV_VCPU_{BASIC,EXTENDED,XSAVE,MSRS} */
-struct xc_sr_rec_x86_pv_vcpu_hdr
-{
-    uint32_t vcpu_id;
-    uint32_t _res1;
-    uint8_t context[0];
-};
-
-/* X86_TSC_INFO */
-struct xc_sr_rec_x86_tsc_info
-{
-    uint32_t mode;
-    uint32_t khz;
-    uint64_t nsec;
-    uint32_t incarnation;
-    uint32_t _res1;
-};
-
-/* HVM_PARAMS */
-struct xc_sr_rec_hvm_params_entry
-{
-    uint64_t index;
-    uint64_t value;
-};
-
-struct xc_sr_rec_hvm_params
-{
-    uint32_t count;
-    uint32_t _res1;
-    struct xc_sr_rec_hvm_params_entry param[0];
-};
-
 #endif
 /*
  * Local variables:
diff --git a/xen/include/Makefile b/xen/include/Makefile
index c3e0283d34..9161716e8f 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -101,7 +101,7 @@ all: headers.chk headers99.chk headers++.chk
 PUBLIC_HEADERS :=3D $(filter-out public/arch-% public/dom0_ops.h, $(wildca=
rd public/*.h public/*/*.h) $(public-y))
=20
 PUBLIC_C99_HEADERS :=3D public/io/9pfs.h public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS :=3D $(filter-out public/%ctl.h public/xsm/% public/%h=
vm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+PUBLIC_ANSI_HEADERS :=3D $(filter-out public/%ctl.h public/migration_strea=
m.h public/xsm/% public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS=
))
=20
 public/io/9pfs.h-prereq :=3D string
 public/io/pvcalls.h-prereq :=3D string
diff --git a/xen/include/public/migration_stream.h b/xen/include/public/mig=
ration_stream.h
new file mode 100644
index 0000000000..de5b736362
--- /dev/null
+++ b/xen/include/public/migration_stream.h
@@ -0,0 +1,125 @@
+#ifndef __XEN_MIGRATION_STREAM_H__
+#define __XEN_MIGRATION_STREAM_H__
+
+#if !defined(__XEN__) && !defined(__XEN_TOOLS__)
+#error "Migration stream definitions are intended for use by node control =
tools only"
+#endif
+
+/*
+ * C structures for the Migration and Live Update.
+ * See docs/specs/libxc-migration-stream.pandoc
+ */
+
+#include "xen.h"
+
+/*
+ * The domain types are used in the libxc stream domain header and will al=
so
+ * be used in corresponding records for live update.
+ */
+#define DHDR_TYPE_X86_PV  0x00000001U
+#define DHDR_TYPE_X86_HVM 0x00000002U
+
+/*
+ * Record Header
+ */
+struct mr_rhdr
+{
+    uint32_t type;
+    uint32_t length;
+};
+
+/* All records must be aligned up to an 8 octet boundary */
+#define REC_ALIGN_ORDER               (3U)
+/* Somewhat arbitrary - 128MB */
+#define REC_LENGTH_MAX                (128U << 20)
+
+#define REC_TYPE_END                        0x00000000U
+#define REC_TYPE_PAGE_DATA                  0x00000001U
+#define REC_TYPE_X86_PV_INFO                0x00000002U
+#define REC_TYPE_X86_PV_P2M_FRAMES          0x00000003U
+#define REC_TYPE_X86_PV_VCPU_BASIC          0x00000004U
+#define REC_TYPE_X86_PV_VCPU_EXTENDED       0x00000005U
+#define REC_TYPE_X86_PV_VCPU_XSAVE          0x00000006U
+#define REC_TYPE_SHARED_INFO                0x00000007U
+#define REC_TYPE_X86_TSC_INFO               0x00000008U
+#define REC_TYPE_HVM_CONTEXT                0x00000009U
+#define REC_TYPE_HVM_PARAMS                 0x0000000aU
+#define REC_TYPE_TOOLSTACK                  0x0000000bU
+#define REC_TYPE_X86_PV_VCPU_MSRS           0x0000000cU
+#define REC_TYPE_VERIFY                     0x0000000dU
+#define REC_TYPE_CHECKPOINT                 0x0000000eU
+#define REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST  0x0000000fU
+
+#define REC_TYPE_OPTIONAL             0x80000000U
+#define REC_TYPE_LIVE_UPDATE          0x40000000U
+
+/* PAGE_DATA */
+struct mr_page_data_header
+{
+    uint32_t count;
+    uint32_t _res1;
+    uint64_t pfn[0];
+};
+
+#define PAGE_DATA_PFN_MASK  0x000fffffffffffffULL
+#define PAGE_DATA_TYPE_MASK 0xf000000000000000ULL
+
+/* X86_PV_INFO */
+struct mr_x86_pv_info
+{
+    uint8_t guest_width;
+    uint8_t pt_levels;
+    uint8_t _res[6];
+};
+
+/* X86_PV_P2M_FRAMES */
+struct mr_x86_pv_p2m_frames
+{
+    uint32_t start_pfn;
+    uint32_t end_pfn;
+    uint64_t p2m_pfns[0];
+};
+
+/* X86_PV_VCPU_{BASIC,EXTENDED,XSAVE,MSRS} */
+struct mr_x86_pv_vcpu_hdr
+{
+    uint32_t vcpu_id;
+    uint32_t _res1;
+    uint8_t context[0];
+};
+
+/* X86_TSC_INFO */
+struct mr_x86_tsc_info
+{
+    uint32_t mode;
+    uint32_t khz;
+    uint64_t nsec;
+    uint32_t incarnation;
+    uint32_t _res1;
+};
+
+/* HVM_PARAMS */
+struct mr_hvm_params_entry
+{
+    uint64_t index;
+    uint64_t value;
+};
+
+struct mr_hvm_params
+{
+    uint32_t count;
+    uint32_t _res1;
+    struct mr_hvm_params_entry param[0];
+};
+
+#endif /* __XEN_MIGRATION_STREAM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */


--=-VIIJYbdB+zAQ/dVm7tDk
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
MjAxMDA0MDE2WjAvBgkqhkiG9w0BCQQxIgQg7lWSD73bPnIwBxGuUwVgCyf/x/aybOKh+rR3FJ7I
KQkwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAAB1ph+WF3woGO9bzpcW5PDy7tkc+cUGki7oKGXYapV217duQ2By1AKBLy4nD7uS
D2/6oPv8XPyJGWUK/Zvl5CYMC3t4/3hvUVAA7aVeOii20NeXPp42luX8F4u3C5SPTKJZaSWXueQ6
nvn+OcRE0WNZSPvArrONs06jRl2mOQ1LX7Co+jKLPUUoMTPnrWf2Hz5k42Z+qDbMEemR2K/NckS+
4G6zOEb687RLodDdAbOzH0MZxXoY4RcYkTAi1jBoR/BUJSocVUMIRRAjnKD4H+NlAkTEa5mvxH1z
I8putC1XbtPvfcbJkYD9nBuLH++nVliw27wofn/a/EF07YcHERQAAAAAAAA=


--=-VIIJYbdB+zAQ/dVm7tDk--



--===============5387920960443220953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5387920960443220953==--


