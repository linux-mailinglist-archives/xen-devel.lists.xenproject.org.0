Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EE9D9B68
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843846.1259425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOh-0000U3-My; Tue, 26 Nov 2024 16:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843846.1259425; Tue, 26 Nov 2024 16:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOh-0000RZ-HP; Tue, 26 Nov 2024 16:26:43 +0000
Received: by outflank-mailman (input) for mailman id 843846;
 Tue, 26 Nov 2024 16:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1p=SV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFyOg-0000RJ-3m
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:26:42 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34bb82dc-ac13-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 17:26:37 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffa678ddd2so48015031fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:26:36 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffaf7c0c9dsm15210421fa.87.2024.11.26.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 08:26:34 -0800 (PST)
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
X-Inumbo-ID: 34bb82dc-ac13-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM0YmI4MmRjLWFjMTMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjM4Mzk3Ljc3OTAzNCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638395; x=1733243195; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAi459Rx+AU9UamZBySFkdMVIp2YkVf38zBa8eU1ZCk=;
        b=ZzgSByHZjeeYsMuRXB6WVGN91kRgvL3ilVO5S1cN4lsJP0k+wf6z2L4dLtW4QllBO5
         JHjAcGBryBz6rPj87d1GQ3qM8jYVblCNnm4Z6TxRFP/jQzkQ9psO8w6Q77n0KSlqAaf7
         9eyjQmnHR4L4p6WG+q+W/A7zL3Ky2XN5921E7rIvmWiHmax76aR2/CiB2+/kHKgBi970
         R6i2NQWCX9O7djWo/LQusWWAi9VA2TSOUdsJCiB7Q8VTnwOubha4k4d3nYBQD3OtKUXz
         RNKigMxQ+RuEYPaesaWvlBf+sIKeUxFa6qV6du2rxlnvbz/ucbJjkcOWG4UkbzVl8ryh
         9Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638395; x=1733243195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAi459Rx+AU9UamZBySFkdMVIp2YkVf38zBa8eU1ZCk=;
        b=vcvSew+oL78TMWgGflZ3WLlmhHeQOP9BX+ZmMt5SPbGicCOuFEnp2ZHoRtnYU9Mfp9
         maKysUugCKXWPiN1jurTw9TT9/jFmGTYSoVvIQauYVhIVFdHZG4eLZDOsMYqrjRPtpqL
         fd6hl+vvf5JRcl4YFa9WdZeQWQPWimVevVWBPBO6CCBiY8oZlniFRrAIjzuWyOEHJDFy
         KwLyjZPMcmB7YnKJAe9529XrzNYOCmBwEbe6iA088O2lK0r4he8uXpz0b0gPFq1rkMyO
         D9mHXkSJGFCaUu6otBeHnjjT0JLVnCGHm+Oh5x4ULQI6TpgZp4bfcu6KvtCC7qsMiKbL
         JsKg==
X-Gm-Message-State: AOJu0YwGFI01M6E3feCndoQpOY7wW4lyDKIBPRJGShhFTdCYXxi7cwGZ
	KSeSicqliUgiZs1cCQF5XyOD9v7dfiPn4g5lPBESoHPhzihIrlZfun+Dpw==
X-Gm-Gg: ASbGnctm3fbH/U3wKWpf3lUUcjcqzDcE1kEgwHt18q2YgSbm6pKBg54sWXdHRKrkQnc
	0to2s+x5G77u2z+3n1OwNXo1RpLOb2M+HlyfWzbRT9CWMfVOJ0f6515Z3+SPOUdK9tQrmjTzkRJ
	zCKZuytCCc9y6f9OBUCPdJe5KukbG6TFmLMq/+ZNute2FMUwtFBmBcxwDFvxsVJe/mEVmnqRzyt
	UAubEswKLnSqGVa9rTyLutD3Ael7MV6+SMP4s50/iWaigNdmwQ=
X-Google-Smtp-Source: AGHT+IFeZ9XyGD1vpncfTyg7P3lBGbwIAz/cH0q2ImJ5yjlyazmBq+lu3RVwADS2sFqg5zL1qxuUgg==
X-Received: by 2002:a2e:bd10:0:b0:2f3:eeab:7f17 with SMTP id 38308e7fff4ca-2ffa71d8f22mr78549641fa.41.1732638395044;
        Tue, 26 Nov 2024 08:26:35 -0800 (PST)
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
Subject: [PATCH v7 0/3] Setup memory management for RISC-V
Date: Tue, 26 Nov 2024 17:26:29 +0100
Message-ID: <cover.1732637041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.

The frametable_virt_start variable is introduced with substracting
of an offest ( taking into account that RAM start could be not 0 ) to save
virtual address space of FRAMETABLE. Also it simplifies the
calculations and thereby improves performance for page_to_mfn(), mfn_to_page()
as there is no frametable_base_pdx or frametable_base_mfn ( if CONFIG_PDX_COMPRESSION=n);

The directmap_virt_start is introduced and shifted lower in the VA space to
(DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
wasting a large portion of the directmap space, this also allows for simple
VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
(for Sv39; for other MMU mode boundaries will be bigger ) by masking the
bits of the RAM start address to enable the use of superpages in
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

Introduce DIRECTMAP_VIRT_END to have a convient way to do some basic
checks of address ranges.

---
Changes in V7:
 - Rebase on top of current staging.
 - refactor maddr_to_virt().
 - Update DIRECTMAP_SIZE to be inclusive.
 - Add Acked-by for the first patch of this patch series.
---
Changes in V6:
 - Rebase on top of current staging.
 - Update the cover letter message.
 - Other changes are only connected to path 1 of the current patch series some
   please look at the changes there.
---
Changes in V5:
 - Rebase on top of current staging.
 - Drop unnecessary local variables.
 - Fix issue with virt_to_maddr() ( used DIRECTMAP_VIRT_START in if-condition
   instead of direct_virt_start ).
 - Update setup_directmap_mappings() and setup_frametable_mappings() ( details
   look in patch 1).
---
Changes in V4:
 - Rebase on top of current staging.
 - Fix issues with setup_frametable_mappings() and setup_directmap_mappings().
 - Drop unnecessary local variables.
 - Minor log messsages fixes.
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

 xen/arch/riscv/include/asm/config.h |   3 +-
 xen/arch/riscv/include/asm/mm.h     |  19 ++--
 xen/arch/riscv/include/asm/setup.h  |   2 +
 xen/arch/riscv/mm.c                 | 159 ++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                 |   6 ++
 xen/arch/riscv/setup.c              |  14 +++
 xen/include/xen/macros.h            |   1 +
 7 files changed, 191 insertions(+), 13 deletions(-)

-- 
2.47.0


