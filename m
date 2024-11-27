Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DD9DA817
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844750.1260253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUu-0004ak-BL; Wed, 27 Nov 2024 12:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844750.1260253; Wed, 27 Nov 2024 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUu-0004Yv-52; Wed, 27 Nov 2024 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 844750;
 Wed, 27 Nov 2024 12:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUs-0004Yj-CM
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:22 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286c6ae6-acbe-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 13:50:19 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53de101525eso770412e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:19 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:17 -0800 (PST)
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
X-Inumbo-ID: 286c6ae6-acbe-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI4NmM2YWU2LWFjYmUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzExODE5LjYzMTgyOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711818; x=1733316618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JNBrrPsLPU7gs7L0kheJ+EuL2eLZdEORSMBnPqz9mu8=;
        b=hM+C3sALGcNbtIqns/IChF4Wg8cEwEqMzWQ1eus+l5JRsktX0E5qhTJM8gqgNkGX4m
         uC97JxSIE1uzujZyb6C0D/Aq40kkmoa83wrNwUnGqT1Kkq70J3inktLdHR+hXlzoFi9H
         6ewc6QILMjAa27v5KTxTD4U7xrs/3FcZwKHwpMhmTDTResl+9E90qIjDP7Fcj76PjwBV
         ufHQEOxaEuv6+D2FjSCvd+K7Y2ZzQ0KZMgPzFM/9wLCAgEoCqfClqUiqzNFdTzLkb5kj
         ZFRTLXwIhPGslcUdrdPkt9CAR89N9aGI4xPJBlodXlwOUf34R3h0+ppArWYXPAGNXuYN
         08OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711818; x=1733316618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNBrrPsLPU7gs7L0kheJ+EuL2eLZdEORSMBnPqz9mu8=;
        b=YT3626FDGTD03u4WiHCMCuUr5GTzmaFPdAOhHc2HlcMZLWihPkeJRvtQJVZt0CAeDP
         b1GD/AWWEw11D5NiEMqS3VLnCiMa0kIDZ89U6Gd6qSW75XtRvbOzuRPI0Xal5qe5NTQR
         LbOsKavNNNthpnbwql0+7HjK9y/DDY6cqmMIm6Si39eD+3qd5q/KSv036beh10LEPOWy
         wNNDRiJtezq4BPJjDszjFCHe+2M5t+t1eIiQIxR104SSclmJTXhis0zzQi9HvQA5jP8W
         CW71cZ26fYYFIOdWdXsyr7vXClQkiqoo1fE+03hRiYR6uGnqvvcD9q1osbEgz2rvPxGR
         Tv1w==
X-Gm-Message-State: AOJu0Yy1gq7Jx49PzzuRYqKxBfNEFL1CDlCjRNg+Nd8l0KLyhqOo46xL
	e9RWdDmFh3h46LUE8PzHlTjOp8QIcYtLpcTncr3FUEOSkOPgQTgybk/WwA==
X-Gm-Gg: ASbGnct+bW0FG+ZfcfzHl+j46MtE4rJldT/BPzfodLWpoz4RD1oNNRW6ypGfPTrI5X5
	aEZeEmeguv6jVTEAhXa1R7ZMMJb7RsOYuFSJO7qwAc2JMoE2mBVNIze6nXl2m+nhvCzb3Zz/T2u
	VTLP8ykbRUNTKyJ0Jf7xIVWTTW0hgo/72v5ghQaACpWz9D+gYvLSGelnwVVwjS2n9rQ/f9laS8S
	4hsXngJVf5PjUnwqxUMZ5Qavd7Ds6sSsCsPg1qfng5yjfOaurE=
X-Google-Smtp-Source: AGHT+IFctF3e2Sr9dF39hCDOsO+iUrrZgPKMrUT5iAV9fqx6shODCzq3rzwZMWVnWZiRkRniv9c6Aw==
X-Received: by 2002:a05:6512:3d06:b0:53d:e5f0:32c1 with SMTP id 2adb3069b0e04-53de885729emr2227277e87.28.1732711818209;
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
Subject: [PATCH v1 0/6] Unflattening and relocation of host device tree
Date: Wed, 27 Nov 2024 13:50:09 +0100
Message-ID: <cover.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current patch series introduces the relocation of the host device tree file
to free up low memory and also it is expected that discard_initial_modules()
will be called sooner or later, it will discard the FDT boot module,
and remove_early_mappings() will destroy the early mappings.

In addition to relocation, unflattening is introduced to create the tree of
struct device_node for the host device tree.

To implement this, several things have been introduced:
 - destroy_xen_mappings() function, which removes page mappings from Xen's
   page tables. This is necessary for clear_fixmap().
 - {set,clear}_fixmap() functions to manage mappings in the fixmap region,
   which are expected to be used in copy_from_paddr() to copy the FDT to Xen's
   heap.
 - A new config HAS_CMO is introduced (in anticipation of future use). This is
   despite the fact that hardware ( "available" to me ) with the hypervisor
   extension is generally I/O-coherent ( and it is preferred way mentioned in
   the RISC-V spec ) and should not be an issue in QEMU as it doesn't emulate
   caches.
   This config introduces stubs for clean_and_invalidate_dcache_va_range()
   and clean_dcache_va_range(), which are expected to be used in
   copy_from_paddr() and flush_page_to_ram(), which in turn are expected to be
   used during the call to xmalloc_bytes() in relocate_fdt().
 - The introduction of copy_from_paddr() to copy the FDT to an address
   allocated in Xen's heap.

Oleksii Kurochko (6):
  xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page
    tables
  xen/riscv: reorder includes in asm/page.h alphabetically
  xen/riscv: add {set,clear}_fixmap() functions for managing fixmap
    entries
  xen/riscv: introduce cache management operations (CMO)
  xen/riscv: implement relocate_fdt()
  xen/riscv: relocating and unflattening host device tree

 xen/arch/riscv/Kconfig              |  3 ++
 xen/arch/riscv/include/asm/fixmap.h |  5 +++
 xen/arch/riscv/include/asm/mm.h     | 10 ++++-
 xen/arch/riscv/include/asm/page.h   | 30 +++++++++++++--
 xen/arch/riscv/mm.c                 |  9 ++---
 xen/arch/riscv/pt.c                 | 27 ++++++++++++++
 xen/arch/riscv/setup.c              | 57 ++++++++++++++++++++++++++++-
 7 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.47.0


