Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62B9C44C2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834090.1249583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYy8-0007pp-SM; Mon, 11 Nov 2024 18:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834090.1249583; Mon, 11 Nov 2024 18:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYy8-0007nJ-Pe; Mon, 11 Nov 2024 18:16:56 +0000
Received: by outflank-mailman (input) for mailman id 834090;
 Mon, 11 Nov 2024 18:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tAYy6-0007n0-MG
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:16:54 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f70dfed-a059-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:16:51 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so7428737e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 10:16:51 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d82689a79sm1633691e87.109.2024.11.11.10.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 10:16:47 -0800 (PST)
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
X-Inumbo-ID: 1f70dfed-a059-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmNzBkZmVkLWEwNTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQ5MDExLjMwNzMxNywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731349008; x=1731953808; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btPxOZrx0cdYKhW9OuqDxy9dlyo3PeDwDv4OVN788/c=;
        b=EExvbt1Rx/Q+lWmFgX+V1wlBhys75MmMyb3e6TIGmJSfGH4pF8cIBkPPq9VNGtMWM4
         c/np+jkmjUw3yudDXyFO6UDCgK+o+a0AXLzmZPCFm2rbvu5P2rIIJdy+i22ZVgVqc1IN
         bg7nwdMB1qLkx0QewtAo8BsEYUp8G4n5USf5lUt+21cJLds0nLrPiVwlDcTVThO/vo42
         ecT5YJtM35i1sIyjZFcP58prHHqmL86Xwns+faEvnOS7QdTvfWEFiuQfT8A7306P9ZQT
         XZFUkLPtCs5TmqEERuOvPhjj+0CLX1TI/14bbqrmCAIY/TIb2lRey3kyOO9rsQvLdrzf
         XrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349008; x=1731953808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btPxOZrx0cdYKhW9OuqDxy9dlyo3PeDwDv4OVN788/c=;
        b=INn9eIFnAg0jCvBH3PO4MQj1uiedMcB0EbeD4+ea0/+cOcQ0d2xO9jr3eWMKp0urIi
         iRPj3SZI7v0GguJC4fGCFOzwZE1QHKoAjaq82CvyWOfTJTnrHWNWVcJmi0sLoJx9ST3n
         GjlT6nc7e3X5yCLCDG+A+mI69KkR16ign8GPFYNlhi/URPvpiggQk04r1aap2qCMbgjA
         2fd957A+BzbWdRhwZziHnEr1pwN4VoNVS9HG+i0QbnxvRsuIX8XyNyOJEf2YAIJxznMa
         k9Pf9u/VaEMpIUe5XfEhec3WNZ5sI9DpzuAtSqeUrG8Dk0Ms1MqoMAd7cfgxtOOtP9RS
         EyOA==
X-Gm-Message-State: AOJu0YyOClQYE0PjdNp18/zsx2+pUrP+X/gtf9j2wD34rXnzJSJy7L/m
	Sgd7P6sB5o+oT1vcYXWDU98NYS8MhIhh363KYZg7fulEtLd4fc3DuwzT+w==
X-Google-Smtp-Source: AGHT+IHDWx1nXYPdxLyfvkTfAyLKK7f6pOn+xoTOyBXB5KxyUrI5mB8DUMy+kNWSES6Y2damQYffMA==
X-Received: by 2002:a05:6512:1108:b0:539:89a8:600f with SMTP id 2adb3069b0e04-53d862c7292mr9440390e87.23.1731349007279;
        Mon, 11 Nov 2024 10:16:47 -0800 (PST)
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
Subject: [PATCH v5 0/3] Setup memory management for RISC-V
Date: Mon, 11 Nov 2024 19:16:41 +0100
Message-ID: <cover.1731344883.git.oleksii.kurochko@gmail.com>
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

 xen/arch/riscv/include/asm/mm.h    |  17 ++-
 xen/arch/riscv/include/asm/setup.h |   2 +
 xen/arch/riscv/mm.c                | 161 +++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                |   6 ++
 xen/arch/riscv/setup.c             |  14 +++
 xen/include/xen/macros.h           |   1 +
 6 files changed, 190 insertions(+), 11 deletions(-)

-- 
2.47.0


