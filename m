Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD09DA812
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844752.1260273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUv-00053X-Nq; Wed, 27 Nov 2024 12:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844752.1260273; Wed, 27 Nov 2024 12:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUv-000518-Kc; Wed, 27 Nov 2024 12:50:25 +0000
Received: by outflank-mailman (input) for mailman id 844752;
 Wed, 27 Nov 2024 12:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUu-0004Yj-1T
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:24 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29814a79-acbe-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 13:50:21 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so3989737e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:21 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:20 -0800 (PST)
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
X-Inumbo-ID: 29814a79-acbe-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI5ODE0YTc5LWFjYmUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzExODIxLjI1MzU2MSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711820; x=1733316620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVDvF5YqyyLTl9nNm34usBBdPtMjgbaktt06G1afM/M=;
        b=O0gB0lBrGt0J8QHqUWjGh3sVSPMkrjWK/pLj29G0drKlFsqu6/xZfqr9bC4maPlfzk
         IP7yRMDsmOVfmMA0iQo4SWThIMd5RqYaF3XijJFUxHOIIS2W8kg1w9rMWFqK5eL2wIc6
         49XG03wuoFkILmmlU2GBmeEvmB0ZW58IK2UhtRjRKFT0O7G0E11gIBCTJrLUq0L1PAzJ
         GMRJq3DQgeCe6oMoiucsiSHixny7q1bZLa8JjdLWVjpeEVs3fUX9Oknd0QsgO3mFWYEY
         hirB8fgQwXjDnVOuEOQvrPZD7GZBFrl7v09YrgVJl0yaMuFc3j9nzMAhkxQ7gF1ajsAy
         IkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711820; x=1733316620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVDvF5YqyyLTl9nNm34usBBdPtMjgbaktt06G1afM/M=;
        b=AwZ+oKuNOQQ1+zsSEGvj27wMC2iFpj+TMCA907cdnZAXCcZG5v2PZQE80GRDrAsC+C
         XkSWewpChJYibSfSLPM992h5o08QBHEtlWwNhkY434eyfqeE7vVAKb4nR2iQPsRPVf7u
         vRTJcMD0LLUJ+FZL7rVbjcGBJ1jVpoA23NrAHre6MJ3p94Rq4P+35vgYLp2ZY764IwPo
         QcUDtAfXtqL6Dypbv4A2/CksnpoL+CXD2tmjgdBHKcPWSc08WryLlSBsOttD3ROSQ1Bm
         WTy3g3zh8jQ1xUe2RQTTr09br9807OXwPmq9kXykIlKpJqwgw8R5gUfi+DDn6chxjSlz
         K2aQ==
X-Gm-Message-State: AOJu0YyPMLf/9uszE9pgn1/98KKIUWJt2RX4Wn32I8JJIRY2mqK3WxMh
	hiiwCU3CIrRsWNYfk7aF2HgPQq9BAfms4RXElHaIjbA+wIR0laF3CyfGEA==
X-Gm-Gg: ASbGncvUBRdOkVF4pb1upN8h1DpNQ3yqOtwDNw8ngTHOpJBZptVAnsOSd2A/Oh+14rt
	KMIjtcFdSfPfzDRj4anrpXgXziRuA0dIzoqpNgmjQr2vzntEBnTUdPwCoLmY/+bssgOJxB7tl84
	32SaiQBq8/UADJMQq++lp/pS+ilNnFVai7aCXOD0UDJ3LTWXF8/P9PA6YBNBQg8qeRTWIzdBnPl
	K/7AW2cwnXlkmrBDjXua0PMRl9EQU+VNczvz76tW58QM3f4u94=
X-Google-Smtp-Source: AGHT+IHrzpuEseSFO9gOn9yNkiZ71guV/3ErvZjDGwhl4x02Ued71294I6HeJfRHYSKswtxj+xcFyg==
X-Received: by 2002:a05:6512:b1e:b0:53d:ecf6:aadc with SMTP id 2adb3069b0e04-53df0104754mr1896350e87.43.1732711820255;
        Wed, 27 Nov 2024 04:50:20 -0800 (PST)
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
Subject: [PATCH v1 3/6] xen/riscv: add {set,clear}_fixmap() functions for managing fixmap entries
Date: Wed, 27 Nov 2024 13:50:12 +0100
Message-ID: <2badea2de39b7614d38a620d1b718478de1fc82c.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce set_fixmap() and clear_fixmap() functions to manage mappings
in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
is expected to be updated; look at setup_fixmap_mappings() ) at a specified
fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
mapping from a fixmap entry by calling destroy_xen_mappings().

Both functions ensure that the operations succeed by asserting that their
respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
A `BUG_ON` check is used to trigger a failure if any issues occur during
the mapping or unmapping process.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/fixmap.h |  5 +++++
 xen/arch/riscv/pt.c                 | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 818c8ce07b..e399a15f53 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -32,6 +32,11 @@
  */
 extern pte_t xen_fixmap[];
 
+/* Map a page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map);
+
 #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
 
 static inline unsigned int virt_to_fix(vaddr_t vaddr)
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 8d35ef5ca8..ed9a943d4c 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -8,6 +8,7 @@
 #include <xen/pmap.h>
 #include <xen/spinlock.h>
 
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/page.h>
 
@@ -433,3 +434,21 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
 }
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    int res;
+
+    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL);
+    BUG_ON(res != 0);
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map)
+{
+    int res;
+
+    res = destroy_xen_mappings(FIXMAP_ADDR(map), FIXMAP_ADDR(map) + PAGE_SIZE);
+    BUG_ON(res != 0);
+}
-- 
2.47.0


