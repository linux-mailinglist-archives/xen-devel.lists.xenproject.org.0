Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24D503459
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 07:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306112.521280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbKZ-0008Uv-79; Sat, 16 Apr 2022 05:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306112.521280; Sat, 16 Apr 2022 05:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbKZ-0008SJ-4I; Sat, 16 Apr 2022 05:50:47 +0000
Received: by outflank-mailman (input) for mailman id 306112;
 Sat, 16 Apr 2022 05:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=APt2=U2=gmail.com=cheyenne.wills@srs-se1.protection.inumbo.net>)
 id 1nfbKX-0008SD-BU
 for xen-devel@lists.xen.org; Sat, 16 Apr 2022 05:50:45 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2726de28-bd49-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 07:50:44 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ec04a2ebadso99020107b3.12
 for <xen-devel@lists.xen.org>; Fri, 15 Apr 2022 22:50:43 -0700 (PDT)
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
X-Inumbo-ID: 2726de28-bd49-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1UIFF5U/Ka4zr1pIlbdRJ1zFRVaVz1C9GcXIRGvn7qw=;
        b=L41egicTDgm7U2qK/btcKbQcn1Dmli0MwNufDUaAt9jUYHlhs47WWouQ+sbaH+Pcan
         gDYUPriQCv68EZW5210tYIJ+WBsmpQKBWSAbeBB/u0cUUc4NWPLGYl4Bst5buGLoBUpm
         MBqO6hG8M7/us9Qx+InP9KrdY2BvlAdlYob6q87qfVBiG8lr5d08OjhQfxFjrp5V/Ggh
         yraoV/UDLs4r1/VGnQAUT9ovCCJ4pyYT9nAhmcoV9PCYnKEkbBQovkw/LLiNbFogZ/pS
         RKBZ4D7+YylWdVghSSZdkSbTMJwlXuFLfECVlLBI9FdSA74MdhmlOMNltfuJCo6HNtcj
         g67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1UIFF5U/Ka4zr1pIlbdRJ1zFRVaVz1C9GcXIRGvn7qw=;
        b=WiYblyblReclE5fQGy5G39P0hQ0NTWzfuqoGQz348zxQj6Zg2r3IDbFtATc9MUq3fv
         lv86pVvFdMY7/CFHk3IfocwW6RCUESDxVYTB5R/tw/s+XHAgxtZN/wCWeuF5Bfr52cjv
         ZeNbCkYtLf428BnyXXHrIGIzXn8d9wnECAhOy7GqMAisFsRvQ2Xv3BLG+FSGgDjUj2FX
         2OJF75z5yU08id78B6m8Da9Aqjkk/SfKA3U1dBdVCpxyZNEpLmK5JwJ9weDKrBxEBiSH
         QUrSdMjbLPwfHCYP0uRGuu2E6MjrlZvvFYYEzFHbR8x1C3WY+SgGt48VQWMdVCQxyeXX
         Stzw==
X-Gm-Message-State: AOAM533RoU5cy2KPgzxVMXxAAh3P0QG6n5Jr7yRes9Yxzkf57miQEfKq
	53J62yCxIPzSU/pY/NAAUhwzVKqAKZKxjFS2lIdqWWi5EO8=
X-Google-Smtp-Source: ABdhPJwt58nP7W7gPl3OFZjvGV5M+jDkoP2s3ykLuet2YEbWGJsFCQJxjlieCHI0r91xn22xaYiTEfAxu6mC1oJHK2U=
X-Received: by 2002:a81:2551:0:b0:2ef:2d02:8979 with SMTP id
 l78-20020a812551000000b002ef2d028979mr1967836ywl.352.1650088242250; Fri, 15
 Apr 2022 22:50:42 -0700 (PDT)
MIME-Version: 1.0
From: Cheyenne Wills <cheyenne.wills@gmail.com>
Date: Fri, 15 Apr 2022 23:50:31 -0600
Message-ID: <CAHpsFVfYE0TfCEON1fuNsoxT54TgwAy9EJTM5utQEjtNMEd3NQ@mail.gmail.com>
Subject: [BUG] RIP panic when using gdbsx and CONFIG_GDBSX is not set
To: xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"

I have a reproducible Xen hypervisor crash (tried 4.15 and 4.16) when
using gdbsx to perform debugging on a guest.

steps to reproduce:

xen host system built without CONFIG_GDBSX configured

start a linux guest
attach gdbsx to the guest (e.g. gdbsx -a {domid} 64 9999

on a remote system, set up a debugging session for the linux kernel on the guest

(in linux source tree that matches the guest)
gdb vmlinux
target remote {remotexen}:9999
lx-symbol

At this point the xen system will have crashed with a RIP panic

Rebuilding the xen hypervisor with CONFIG_GDBSX fixes the panic.

-----
I'm using a gentoo system for the host DOM0 system and used the gentoo
xen/xen-tools ebuild packages.  I've tried the:

xen-4.15.2-r2.ebuild and xen-4.16.0-r5.ebuild

I was able to resolve the problem by stepping through their ebuild
steps and performing a manual "make menuconfig" to enable CONFIG_GDBSX
right before the compile step.

---- capture from xen serial console ----
-----
(XEN) ----[ Xen-4.16.0  x86_64  debug=n  Not tainted ]----
(XEN) CPU:    6
(XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
(XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277fff
(XEN) rdx: 0000560164cad1e0   rsi: 0000000000000000   rdi: ffff830856277db0
(XEN) rbp: 0000560164cad1e0   rsp: ffff830856277c90   r8:  0000000000000001
(XEN) r9:  0000000000000001   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff830856277db0   r13: 0000000000000000   r14: ffff83085624f000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000372660
(XEN) cr3: 00000004e64e4000   cr2: 0000000000000144
(XEN) fsb: 00007f02cdbbb740   gsb: ffff888173a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040269984> (iommu_do_domctl+0x4/0x30):
(XEN)  00 0f 1f 00 f3 0f 1e fa <f6> 86 44 01 00 00 20 74 0b 0f ae e8 e9 ab 1b 00
(XEN) Xen stack trace from rsp=ffff830856277c90:
(XEN)    ffff82d04035cd5f 0000000000000000 ffffffff8109e860 ffff830856277ef8
(XEN)    ffffffff0c926d00 0000000000000000 aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa
(XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa
(XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa ffff82d040580120 ffff8308562834b0
(XEN)    ffff82d040461d00 0000000000000000 ffff830856277e68 0000560164cad1e0
(XEN)    0000560164cad1e0 ffff830856277db0 0000000000000000 ffff82d040239e46
(XEN)    ffffc90040ebbb0c 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 00000000c0000102 0000000000000000
(XEN)    ffffc90040ebbaa8 00000000c0000102 0000000d00000000 ffffffff8109e860
(XEN)    00000014000003e8 0000000000000001 0000000000000000 ffffffff82a15ec0
(XEN)    00005601656f06c0 0000000000000004 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff830856277ef8 ffff82d040238ff0
(XEN)    0000560164cad1e0 0000000000000000 0000000000000000 ffff83085623c000
(XEN)    ffff82d0402f8c59 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 ffffffffffffffff 0000000000000000 0000000000000000
(XEN)    ffff830856277ef8 ffff82d0402f5161 ffff83085623c000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffff82d040366288 0000000000000000 ffff88811703ad00 00007ffcb2259d60
(XEN) Xen call trace:
(XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
(XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
(XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
(XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
(XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
(XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x11/0x90
(XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
(XEN)
(XEN) Pagetable walk from 0000000000000144:
(XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 6:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 0000000000000144
(XEN) ****************************************
(XEN)

