Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11A69DA818
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844751.1260258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUu-0004et-Gz; Wed, 27 Nov 2024 12:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844751.1260258; Wed, 27 Nov 2024 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUu-0004aM-Da; Wed, 27 Nov 2024 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 844751;
 Wed, 27 Nov 2024 12:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUt-0004Yj-1T
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:23 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28b59f8f-acbe-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 13:50:19 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso4894826e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:19 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:18 -0800 (PST)
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
X-Inumbo-ID: 28b59f8f-acbe-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI4YjU5ZjhmLWFjYmUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzExODE5Ljk0NDkxNywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711819; x=1733316619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFk+JVoO6jJ82E1hzFEd4LqERyYR6iKKhEgzSQ920Ew=;
        b=WQI8SVd4Lnf1jKpH0TqwcakGE4VlWOGgOYfz85e7C3OH9c7Cj3WJkPJaD4ecXplJXe
         F/5822i9Wu1qu7tmg88d9IO6wdu6V4aiIoRLXC/9bpONJqrJgs9/kgBFXL5l5ibobUE+
         6oDEumkiFU4dM9CrxnPWeMsMMJwtS7XzxqO8E4poUg6EmgOgQ1y06JWcpDARM2BFTB3j
         TXk1luvZQW4I0O/V5P7D/cek72YRGnGR21CtyEQUvCM67r3szbJ6U+3SEWp9rpMvyfTr
         Ra26NmilOzf71B16EGH4o95eEmRngEkNzRJpFbQw+4x9y+ENph2U3Nt1FHUuAY8TmKrX
         /HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711819; x=1733316619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFk+JVoO6jJ82E1hzFEd4LqERyYR6iKKhEgzSQ920Ew=;
        b=wcZBftBPirSIKFv/PN1kLkdAqqYSLvnJVR195ysCohfNGH9v/Gy4ahSQ8LL9JrPkMK
         c1PLEcz6E/O7GZk75n1EZPiVfDWLVKfFVkgq3a9uiI+WXqvrWvjKvT2mnPUfgfZTG5rn
         pWZgp+9bELv4tDHpg3RJKGxFWXXMzuirc6IhZ7N6H3Cqy6dsR84foWWo/cRufTyEw6u9
         +/q2RcaSg6b9hEby4LH21twbUvmJpxyOJ2de/AbTWiTcesCxxs/7lnV6OEkxgl+iomAE
         q7taotBwjM7bFVKqolDyReZOLmscjqBKH3FDl4U/uhJ2ZrhqeaxEx1Rv12NE1+OTpuut
         4eCg==
X-Gm-Message-State: AOJu0YxMbr8+H86f6HB2n7eOlTokZlqmnFHhInYaz4GhyHxahxXz0yBx
	zNJ1fxyohd5JemWE5L3gz3Q//Mk8O82iom2Br/yPlhL1kq6GJXW3gNqV1A==
X-Gm-Gg: ASbGncvoV62BURnDfShY2ztMpldod2ymSn2zBCXdYTkRqiU19qiUzGM/acYQSo9UFHz
	FM2WLiDF2Po4TKNs2AgyMzcqUog47NXTi7ztIdK2Z0mbBr/yqjfPpZ4spVfpJ8EmPgT5K8fa++S
	i8Q8Q4cNZAO81SJxQJ13BEZn6W3hq2A5cycjTvI5xs0z5nFz2LQGFTrRPHAXOHdbuY+U2q43GlE
	43G6wU+RreMkCOzcrxE4W/s3UHqq0vO9z0Wn9iN8UhiTHFNZQ4=
X-Google-Smtp-Source: AGHT+IEtCS5jEQ4Ctfxyle6YJ3nFmVflvqq7XZvda8k58SPVAJICGdGGC8zsf5xcn2lfv7gvcDHDWQ==
X-Received: by 2002:a05:6512:b15:b0:539:e317:b05f with SMTP id 2adb3069b0e04-53df00de3a9mr1519882e87.28.1732711818904;
        Wed, 27 Nov 2024 04:50:18 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/6] xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page tables
Date: Wed, 27 Nov 2024 13:50:10 +0100
Message-ID: <eed2acbf660cadbfb267e7854e9f67eb382cc966.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the destroy_xen_mappings() function, which removes page
mappings in Xen's page tables between a start address s and an end
address e.
The function ensures that both s and e are page-aligned
and verifies that the start address is less than or equal to the end
address before calling pt_update() to invalidate the mappings.
The pt_update() function is called with INVALID_MFN and PTE_VALID=0
in the flags, which tell pt_update() to remove mapping. No additional
ASSERT() is required to check these arguments, as they are hardcoded in
the call to pt_update() within destroy_xen_mappings().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/mm.c | 6 ------
 xen/arch/riscv/pt.c | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 9359dc7f33..f2bf279bac 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -360,12 +360,6 @@ int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
     return 0;
 }
 
-int destroy_xen_mappings(unsigned long s, unsigned long e)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
                                enum XENSHARE_flags flags)
 {
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index d62aceb36c..8d35ef5ca8 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
     return pt_update(virt, mfn, nr_mfns, flags);
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+    return pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0);
+}
+
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
-- 
2.47.0


