Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5B311FD5
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 21:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82268.152032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Tnt-0002fq-Sk; Sat, 06 Feb 2021 20:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82268.152032; Sat, 06 Feb 2021 20:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Tnt-0002fT-PL; Sat, 06 Feb 2021 20:03:37 +0000
Received: by outflank-mailman (input) for mailman id 82268;
 Sat, 06 Feb 2021 20:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SMBC=HI=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l8Tns-0002fO-6u
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 20:03:36 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 367b384a-c30a-454b-8e79-9fa8e1ce46dc;
 Sat, 06 Feb 2021 20:03:35 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id u20so10538909qku.7
 for <xen-devel@lists.xenproject.org>; Sat, 06 Feb 2021 12:03:34 -0800 (PST)
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
X-Inumbo-ID: 367b384a-c30a-454b-8e79-9fa8e1ce46dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lTAa5xIKptH7yVh7rmoF3zRc9qlRhOfeqFHTB4JCXjc=;
        b=J88jMf6tXnY7c7DkCNPiQhhVJ0Trdm/lDEbTvmo4B1RIC4nE7+E6relvm9ou1YKgUu
         +h8LMav2VhywXmTd7f03/NuItdY0rAnazi9+QV1HP0Q6VlqGppMSl2NfFPADWBwHQUDc
         fHiIdOXJzuP80urERBhCsdFj8m/pm+RYR0dSf8LEXGe4M2JVSWI12R7EB73OmuhOkaRU
         eBeGE+pdw0Dh8h0D5OUydN+ZtgLPD55L3NIfsdecBUq7Cm7JLOzu2IJUM3oP9UaDIcLh
         pXbEnDiRmBilf1GssJwpgGPf62LkFtXLVeWU4FlHFoGcktQFXKk4lKJs2idPLIG/Y5p7
         Untw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lTAa5xIKptH7yVh7rmoF3zRc9qlRhOfeqFHTB4JCXjc=;
        b=TLdHKW+cTuZo6YDm1pk+YETbabW80bmuz6dNDNHILKNCGeVUvl7k9P56RaAHqOkHF7
         Zp0WvC8TR/liQtAapYcM/p5arAs4bRg5qroxY5bdKRRj4mKkBIGkeKK938VExTej36A9
         6u305lDh9U4Grk/4TnbHvQCC+1LZKKoq/oXCMAi+eLD+GsuGLWXvtuKXvK+JopfJpkEk
         4chgyH5FsfH/B7ogtnU8Pefx5E03B7eGU5S+oWxXcMMJ5yJpXy4DO49VtjYG0WtuOzph
         QeU0Wf4oX9ffP6v1Fht0dMoYdZ1xN4ohlIyX+aZWx+XU5lRVSTy9w/0lTDNyHOpeqh2s
         7F2w==
X-Gm-Message-State: AOAM533CFKYzftEgij/AEOw47vKgc1eiG0QspR9O7uooma0KPG+szi39
	DxL/xBAVt2x9jxh9S46PUzLcV0jgNDrD1RVAzE6GQlM3AK7l+A==
X-Google-Smtp-Source: ABdhPJwoDdkst/4e0ogd8xJP8lbu2ldiv6QfpwVSuKHWjb6XnVvSlFuqj+BlRwH+rL+dYypEg7yv8+P1BD8/nxfO120=
X-Received: by 2002:a05:620a:152b:: with SMTP id n11mr9908742qkk.267.1612641814097;
 Sat, 06 Feb 2021 12:03:34 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Sat, 6 Feb 2021 12:03:23 -0800
Message-ID: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
Subject: Linux DomU freezes and dies under heavy memory shuffling
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Roman Shaposhnik <roman@zededa.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

all of a sudden (but only after a few days of running normally), on a stock
Ubuntu 18.04 (Bionic with 4.15.0 kernel) DomU I'm seeing Microsoft's .net
runtime go into a heave GC cycle and then freeze and die like what is
shown below. This is under stock Xen 4.14.0 on a pretty unremarkable
x86_64 box made by Supermicro.

I would really appreciate any thoughts on the subject or at least directions
in which I should go to investigate this. At this point -- this part
of Xen is a
bit of a mystery to me -- but I'm very much willing to learn ;-)

From my completely uneducated guess it feels like some kind of an issue
between DomU shuffling memory much more than normal and Xen somehow
getting unhappy about that:

[376900.874560] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [dotnet:3518]
[376900.874764] Kernel panic - not syncing: softlockup: hung tasks
[376900.874793] CPU: 0 PID: 3518 Comm: dotnet Tainted: G L
4.15.0-112-generic #113-Ubuntu
[376900.874824] Hardware name: Xen HVM domU, BIOS 4.14.0 12/15/2020
[376900.874847] Call Trace:
[376900.874860] <IRQ>
[376900.874874] dump_stack+0x6d/0x8e
[376900.874892] panic+0xe4/0x254
[376900.874911] watchdog_timer_fn+0x21e/0x230
[376900.874928] ? watchdog+0x30/0x30
[376900.874947] __hrtimer_run_queues+0xdf/0x230
[376900.874970] hrtimer_interrupt+0xa0/0x1d0
[376900.874989] xen_timer_interrupt+0x20/0x30
[376900.875008] __handle_irq_event_percpu+0x44/0x1a0
[376900.875031] handle_irq_event_percpu+0x32/0x80
[376900.875053] handle_percpu_irq+0x3d/0x60
[376900.875071] generic_handle_irq+0x28/0x40
[376900.875090] __evtchn_fifo_handle_events+0x172/0x190
[376900.875112] evtchn_fifo_handle_events+0x10/0x20
[376900.875133] __xen_evtchn_do_upcall+0x49/0x80
[376900.875156] xen_evtchn_do_upcall+0x2b/0x50
[376900.875177] xen_hvm_callback_vector+0x90/0xa0
[376900.875197] </IRQ>
[376900.875211] RIP: 0010:smp_call_function_single+0xdc/0x100
[376900.875230] RSP: 0018:ffffaaa3c1807c20 EFLAGS: 00000202 ORIG_RAX:
ffffffffffffff0c
[376900.875261] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[376900.875288] RDX: 0000000000000001 RSI: 0000000000000003 RDI:
0000000000000003
[376900.875314] RBP: ffffaaa3c1807c70 R08: fffffffffffffffc R09:
0000000000000002
[376900.875341] R10: 0000000000000040 R11: 0000000000000000 R12:
ffff8e0ab2c1de70
[376900.875368] R13: 0000000000000000 R14: ffffffff95a7ecd0 R15:
ffffaaa3c1807d08
[376900.875396] ? flush_tlb_func_common.constprop.10+0x230/0x230
[376900.875424] ? flush_tlb_func_common.constprop.10+0x230/0x230
[376900.875449] ? unmap_page_range+0xbbc/0xd00
[376900.875470] smp_call_function_many+0x1cc/0x250
[376900.875491] ? smp_call_function_many+0x1cc/0x250
[376900.875513] native_flush_tlb_others+0x3c/0xf0
[376900.875534] flush_tlb_mm_range+0xae/0x110
[376900.875552] tlb_flush_mmu_tlbonly+0x5f/0xc0
[376900.875574] arch_tlb_finish_mmu+0x3f/0x80
[376900.875592] tlb_finish_mmu+0x23/0x30
[376900.875610] unmap_region+0xf7/0x130
[376900.875629] do_munmap+0x276/0x450
[376900.875647] vm_munmap+0x69/0xb0
[376900.875664] SyS_munmap+0x22/0x30
[376900.875682] do_syscall_64+0x73/0x130
[376900.875701] entry_SYSCALL_64_after_hwframe+0x41/0xa6
[376900.875721] RIP: 0033:0x7f05ad52dd59
[376900.875737] RSP: 002b:00007f05a8037150 EFLAGS: 00000246 ORIG_RAX:
000000000000000b
[376900.875765] RAX: ffffffffffffffda RBX: 000056517e2a08c0 RCX:
00007f05ad52dd59
[376900.875791] RDX: 0000000000000000 RSI: 0000000000006a00 RDI:
00007f05aad8f000
[376900.875818] RBP: 0000000000006a00 R08: 0000000000020b18 R09:
0000000000000000
[376900.875844] R10: 0000000000020ad0 R11: 0000000000000246 R12:
0000000000000001
[376900.875870] R13: 0000000000000000 R14: 000056517eb02300 R15:
00007f05aad8f000

Thanks,
Roman.

