Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5B9B4A27
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827374.1241960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5lg6-000673-FN; Tue, 29 Oct 2024 12:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827374.1241960; Tue, 29 Oct 2024 12:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5lg6-000642-CZ; Tue, 29 Oct 2024 12:50:30 +0000
Received: by outflank-mailman (input) for mailman id 827374;
 Tue, 29 Oct 2024 12:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cc3+=RZ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1t5lg5-00063w-2s
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:50:29 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da4ce5e-95f4-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 13:50:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 46EC1A42DA0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 12:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F58C4CEE6
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 12:50:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb3110b964so42680531fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 05:50:23 -0700 (PDT)
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
X-Inumbo-ID: 5da4ce5e-95f4-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjVkYTRjZTVlLTk1ZjQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA2MjI1LjU3MzQxOSwic2VuZGVyIjoiYXJkYkBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206223;
	bh=qpqKiCVwGj7SngGYaK80lZw41JwmB+AhSP70a/Xdq1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CNogKg6tqY6sYLa0yTfsV5VM6EVLVTHwA1XFvDsJBdjbefzq6skxJ2WRC8h5F/ZPN
	 wgnZnZQ+atgQhNinzsM/BjTs64o5NG9aYccpy2M/gVvSPGWys7inlm3bQjtkNIF8Rv
	 f28N24sPOhuixaI4XoricXRxRM+Ry4NHkSCcJ9W4W277irpfVL7H76HqAdvdorKQTy
	 L0XV8KPLxvoqaIlo0lmAAqHwdl7MQ9HwIdZNnkzqcElJkRuDHPtZFY8qt9lBVPxjBd
	 CkgtcqqdCO8j00EDtB0yTB5SMmjnoBj+nwQjZ5nKOm/UmV8yx8ETrcDGXIvPXtHkCt
	 OBa+cUmjZWkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNTv/vn4e0XAVVslcU/eVDCFQty7AGuPEx0KBRxLd1eG/ifp772zygWQT1F8xGzfxMlpHGQG4GFC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt5HOeSQFDTZOZwDthOw45f1AZbQyPe/5zGLsLlAffmTawAIsa
	vatzqKiFFw2M2/a1rNOhaUCeuTgya449hSjTZP4ebzcsPY4OYhG6WblPirBaark25aqED4lD9f0
	C/jf1liyCMAMHWO+vvw1cx1BzD2Q=
X-Google-Smtp-Source: AGHT+IE13vCSXiGikajW15oEuXQauuOovUNSx/7h82mtO6lP6mJ0KIW1b6Z6Cr+GGo7IZepi0dmFbUBD16EkW4eCRpY=
X-Received: by 2002:a05:651c:2204:b0:2fb:6057:e67e with SMTP id
 38308e7fff4ca-2fcbe08cdc1mr50995891fa.32.1730206222187; Tue, 29 Oct 2024
 05:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Oct 2024 13:50:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
Message-ID: <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] x86/xen: Drop absolute references from startup code
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 18:09, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> This series was broken out of the series I sent recently [0], after
> Jason pointed out that my Xen startup code changes conflict with his
> changes to make the PVH startup code position independent.
>
> Jason's work reduces the delta of my changes, and given that my other
> series will likely advance at a much slower pace, the Xen changes are
> presented here so they can be merged independently.
>
> The end result after applying this series (see below) is that there are
> no longer any Xen-related absolute relocations that need to be applied
> to .head.text, a section which carries code that may be invoked from the
> 1:1 mapping of memory before the kernel virtual mapping is up.  The use
> of absolute references in this code section has resulted in a few boot
> issues that were very hard to track down (Clang built kernels running
> under SEV-SNP in particular, which does not provide the best debug
> experience).
>
> Even though the occurrences in the Xen startup code were fine, there is
> now a lot of C code emitted into .head.text as well, and so it would be
> helpful to teach objtool to reject absolute references entirely in this
> section (or rely on the linker for that). Therefore, not relying on them
> in the first place is a step towards that goal.
>
> Changes since v2 [2]:
> - add Jason's Tested-by to patch #4
> - use a better name for the linker defined symbols used in the ELF notes
>   (patch #4)
> - add a comment in the linker script explaining why the symbol values
>   are constructed in the way they are
> - rebase onto v6.12-rc2
>
> Changes since v1 [1]:
> - add Jason's Rb to patches #2, #3 and #5
> - drop the use of a 32-bit field for the ELF note- QEMU reads a u64 and
>   so the top word needs to remain 0x0
> - tweak #ifdefs in patch #4 so the hypercall_page linker symbol does not
>   depend on CONFIG_XEN_PV
> - rebase onto v6.12-rc1
>
> Changes wrt [0]:
> - add Jason's Rb to patch #1
> - rebase onto xen/tip's linux-next branch
> - split out fix for GDT descriptor size field
> - add patch to remove the zeroing of phys_base, which is no longer
>   needed
> - use a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY, and use its contents
>   to obtain the build time physical address of pvh_startup_xen()
>
> [0] https://lore.kernel.org/all/20240925150059.3955569-30-ardb+git@google.com
> [1] https://lore.kernel.org/all/20240926104113.80146-7-ardb+git@google.com/
> [2] https://lore.kernel.org/all/20240930071513.909462-7-ardb+git@google.com/
>
> Relocation section '.rela.head.text' at offset 0xb428 contains 15 entries:
>   Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 000000000018  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 18
> 00000000002f  000e00000002 R_X86_64_PC32     0000000000000000 pvh_start_info + 2f
> 000000000037  000f00000002 R_X86_64_PC32     0000000000000000 pvh_start_info_sz + 37
> 000000000042  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 4092
> 000000000060  001000000002 R_X86_64_PC32     000000000000002c xen_elfnote_phys3[...] + 60
> 000000000068  001100000002 R_X86_64_PC32     0000000000000000 phys_base + 68
> 00000000006e  001200000002 R_X86_64_PC32     0000000000005000 pvh_init_top_pgt + 6e
> 000000000089  001300000002 R_X86_64_PC32     0000000000006000 pvh_level3_ident_pgt + 89
> 000000000091  001400000002 R_X86_64_PC32     0000000000008000 pvh_level3_kernel_pgt + 91
> 0000000000a3  001500000002 R_X86_64_PC32     0000000000009000 pvh_level2_kernel_pgt + a3
> 0000000000be  001200000002 R_X86_64_PC32     0000000000005000 pvh_init_top_pgt + be
> 0000000000de  000800000002 R_X86_64_PC32     0000000000000000 .init.data + 1c
> 0000000000e9  001600000002 R_X86_64_PC32     0000000000000000 xen_prepare_pvh - 4
> 0000000000f8  001700000002 R_X86_64_PC32     0000000000000000 pvh_bootparams - 4
> 0000000000fd  001800000004 R_X86_64_PLT32    0000000000000000 startup_64 - 4
>
> Relocation section '.rela.note.Xen' at offset 0xb668 contains 1 entry:
>   Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 00000000002c  001a00000002 R_X86_64_PC32     0000000000000000 xen_elfnote_phys3[...] + 0
>
> Cc: Jason Andryuk <jason.andryuk@amd.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: x86@kernel.org
> Cc: xen-devel@lists.xenproject.org
>

Ping?

