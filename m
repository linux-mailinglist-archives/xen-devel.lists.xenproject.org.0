Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799E9B91C4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829111.1244196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWL-0000n4-1H; Fri, 01 Nov 2024 13:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829111.1244196; Fri, 01 Nov 2024 13:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWK-0000kO-U4; Fri, 01 Nov 2024 13:16:56 +0000
Received: by outflank-mailman (input) for mailman id 829111;
 Fri, 01 Nov 2024 13:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZeD=R4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6rWJ-0000Hs-9W
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:16:55 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea2593e-9853-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 14:16:51 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53c73f01284so2345111e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:16:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm549745e87.194.2024.11.01.06.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:16:45 -0700 (PDT)
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
X-Inumbo-ID: 8ea2593e-9853-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlYTI1OTNlLTk4NTMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDY3MDExLjYzMjExNywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467006; x=1731071806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wj/BA7TzXLORt8+splUrdfYdcSoOnFHA3Scx8dfz8qw=;
        b=SyNFcay/WnkgWmvPsLJiIIW7X1r6Ll0BX67Z9E0twDMjhH5Tc1ZOexDsF9tZhggg9/
         rlcqdgNBvmt2anLljfR0GC/h3qKBktpkDPt8Zek/L4Hjnp0PS778uIlJM24+J/wGAf8m
         o9iuBQ7WtwzjM3nnMX3/L7/K0Iq/lnHfJ/wP794XxZsr0JlMjRQylRQSClfTYaIcaYJq
         pk0qzXoI6aGeNxnCUaDmbd6yY9o/1jUJaC0lX88hm/gStzYTXIwJwEBvHxqM8Mwqsk4C
         38+0FaScG21CTlFDB6f7jeyMuSk4TXIL2ddiv1m9NVBdTTbL+niGgK5utu3w7B4Neo/2
         VB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467006; x=1731071806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wj/BA7TzXLORt8+splUrdfYdcSoOnFHA3Scx8dfz8qw=;
        b=wCuxN7qo3Yp2C2lLqTazQAteUBr6zg0Ujo3d2Yotaqi/cqS1XXB8J2j3bAKcZvB8HI
         Fp93dNhax+Hr2mh6CcahuHObj7DwW7/dgR+a4gq8mh9gNHtH/NFUORBDMNZ39t46CaVo
         4DFNuEXIu5uu13J8XMj/vVo5/yJiuzF6QgYdkHf/atvt8bJF33CUezm2Qp8FwltNI2Af
         VmkZBZOXFSQZto15MBCZJnW/B48yx/l9b8b0nnJd8yc9hnSCXNYU9diH+1UFZxFWoiNG
         zLGRw19mmJPz9mbo+XQ0x6n5WqsnThvGyLCXBj+Cc/QWMmHyRXn3KJuwixK4udxrArVf
         tY1w==
X-Gm-Message-State: AOJu0Yx07RlAhmQLVo0Y/OFpwLsB9DpzRqDdu7Lrd9rFvnn2YIcFiMtp
	zpzkIP6QrdklMnEW0IcHoatPXxRvc2ycXEPTPx2FHWWJ+aEZr9I8+/ifiw==
X-Google-Smtp-Source: AGHT+IFqZFLhU6CFQaOBWHmhTPIFe7njEHAJRb9pBXDVEbLWPUm/DZxfwdfFjhBwQPi7iPxjd5CATg==
X-Received: by 2002:a05:6512:3196:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-53c79e15e5bmr3600679e87.1.1730467005747;
        Fri, 01 Nov 2024 06:16:45 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Setup memory management for RISC-V
Date: Fri,  1 Nov 2024 14:16:39 +0100
Message-ID: <cover.1730465154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.

In the case of RISC-V 64, which has a large virtual address space
(the minimum supported MMU mode is Sv39, providing GBs of VA space),
so frame table is mapped starting from physical address
0 to ram_end.
This simplifies the calculations and thereby improves performance for
page_to_mfn(), mfn_to_page() as there is no frametable_base_pdx or
frametable_base_mfn ( if CONFIG_PDX_COMPRESSION=n).

The directmap_virt_start is introduced and shifted lower in the VA space to
(DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
wasting a large portion of the directmap space, this also allows for simple
VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
(for Sv39; for other MMU mode boundaries will be bigger ) by masking the
higher bits of the RAM start address to enable the use of superpages in
map_pages_to_xen().

In addition, initialize the VMAP_DEFAULT region, finalize the boot allocator,
and update the system state from early_boot to boot.

Introduce share_xen_page_with_guest() to deal with linkage error which occurs
because of DCE:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

The function maddr_to_virt() is introduced as part of this patch series.

virt_to_maddr() is updated as it is started to use direct_virt_start which is
introduced in this patch series.

---
Changes in V3:
 - Update the cover letter message as DIRECTMAP connected things were changed.
 - Update setup_mm(), setup_{directmap,frametable}_mappings.
 - Introduce ROUNDDOWN in <xen/macros.h>
 - All other details please look at the specific patch.
---
Changes in V2:
 - update the cover letter message.
 - merge first 3 patches to "introduce setup_mm()" patch as after setup_mm()
   rework all the things in first two patches of v1 started to use changes
   introduced in "introduce setup_mm()" patch.
 - add Acked-by for some patch series.
 - All other details please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: introduce setup_mm()
  xen/riscv: initialize the VMAP_DEFAULT virtual range
  xen/riscv: finalize boot allocator and transition to boot state

 xen/arch/riscv/include/asm/mm.h    |  13 ++-
 xen/arch/riscv/include/asm/setup.h |   2 +
 xen/arch/riscv/mm.c                | 152 +++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                |   6 ++
 xen/arch/riscv/setup.c             |  14 +++
 xen/include/xen/macros.h           |   1 +
 6 files changed, 178 insertions(+), 10 deletions(-)

-- 
2.47.0


