Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984532019D
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 00:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87118.164223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDExC-0003KW-3g; Fri, 19 Feb 2021 23:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87118.164223; Fri, 19 Feb 2021 23:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDExB-0003K7-Vu; Fri, 19 Feb 2021 23:12:53 +0000
Received: by outflank-mailman (input) for mailman id 87118;
 Fri, 19 Feb 2021 23:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UiAT=HV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lDExA-0003K2-LQ
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 23:12:52 +0000
Received: from mail-ej1-x62f.google.com (unknown [2a00:1450:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8806fea4-79bf-41f2-97fe-8bc5ea13e82c;
 Fri, 19 Feb 2021 23:12:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n13so16525594ejx.12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 15:12:51 -0800 (PST)
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
X-Inumbo-ID: 8806fea4-79bf-41f2-97fe-8bc5ea13e82c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/OGhTTpzZyxgJI2DnqG489Zc4ZGYVreMMujCNnLjP0k=;
        b=fDBb6+JwnaBVMspwPgonOOXeDao65TPrPjSWlDhu9vFfLrzFb3e8XiMUWDlJCXYgev
         BR991ro84Gz3Ny7HH+u91pQASpeygB0ONNsrseULy88dS4oEXWJhttZC2vQMNPxLwJRc
         KaDjOlurvlcmfuQrEBErGmduPhGEb8yp8nCBw6EuXzsHc+u+gmckgS9+kevs1iyP2Ys8
         /zqD4xTrtUNAp8g2VwSf7yRV0uDOkL8Pk/IkMadTq9/kNsGUJsF3sEk6IzcIi17AKLn1
         Y3odwawgxCqg0KFb+ZCUX2LQegpIOFhX49iUHImR/pVPCXhNnlMY5/RhIatOvZUqr3/Q
         MoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/OGhTTpzZyxgJI2DnqG489Zc4ZGYVreMMujCNnLjP0k=;
        b=swzUrOqGQF1apaTupbAOUvzoHYbhn0VvUWF3+xkPSdSYrAcHeJ39522WuMCxplaZ4M
         +AqmfOjw0bR4JohNGmU5Qn4Sbsjkvyw7mn4VddWsb2bO+JkMyaBCe6xvTuFA46f57IrS
         mdPYGmmmgwrUbnOUQ5PXtFVodG19iWYwbbuYF9eqsErZ+B0lQSevkOnDMpy3K984wzks
         SlXmde8UwG7KMUTVlxg9KSMzcfYoIgionAuvEfQK8mQqbYsL8PEMr6I9es+WvZkYR6mA
         y113eRkRDXexyqL6g9rURUKvzJY+j8FZq8dG6KAyCLvNktzrPWL/LUlAfhGcBA9gsz74
         PYEw==
X-Gm-Message-State: AOAM532+/J7ph1RMdH4y74dzOr1DVivCPO/Io+V6qAzqJsey9am91pGI
	aVC/Ei3aRMUEr5dzbtaLqXRDhds9NsawwCca1X8=
X-Google-Smtp-Source: ABdhPJzsfKxK5E9dWZ39p0jar1FBU13tw9u7DbwX9uNfK/IwohdH4AE8ep/pD65aOg/QzlYjFAOraRl7Bjo0BgeQyz4=
X-Received: by 2002:a17:906:6096:: with SMTP id t22mr11101785ejj.34.1613776371022;
 Fri, 19 Feb 2021 15:12:51 -0800 (PST)
MIME-Version: 1.0
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 19 Feb 2021 23:12:40 +0000
Message-ID: <CAJ=z9a0bi2fAcaTMwez5AyQbqP1u1P1r0hzeXb2SK2vRd8O37Q@mail.gmail.com>
Subject: ISPENDR implementation (WAS Re: [linux-linus test] 159463:
 regressions - FAIL)
To: osstest service owner <osstest-admin@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Fri, 19 Feb 2021 at 22:19, osstest service owner
<osstest-admin@xenproject.org> wrote:
>
> flight 159463 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/159463/

[...]

>  test-arm64-arm64-xl-seattle                                  fail

[...]

>  test-arm64-arm64-xl-thunderx                                 pass

While looking at the log to check whether we fixed the Arm bug, I
noticed that Linux will boot on Thunder-X but not Seattle.

From the log:

(XEN) d0v3: vGICD: unhandled word write 0x00000020000000 to ISPENDR44
Feb 18 17:01:19.426532 (XEN) traps.c:2013:d0v3 HSR=0x93820047
pc=0xffff8000104aec2c gva=0xffff80001000522c gpa=0x000000e111022c

[...]

Feb 18 17:01:19.618568 [   27.097702] Call trace:

Feb 18 17:01:19.618612 [   27.100215]  gic_retrigger+0x2c/0x38

Feb 18 17:01:19.630516 [   27.103861]  irq_startup+0x78/0x138

Feb 18 17:01:19.630575 [   27.107419]  __enable_irq+0x70/0x80

Feb 18 17:01:19.630622 [   27.110978]  enable_irq+0x50/0xa0

Feb 18 17:01:19.642499 [   27.114363]  xgbe_one_poll+0xc8/0xd8

Feb 18 17:01:19.642558 [   27.118009]  net_rx_action+0x110/0x3a8

Feb 18 17:01:19.642605 [   27.121828]  __do_softirq+0x124/0x288

Feb 18 17:01:19.654496 [   27.125560]  irq_exit+0xe0/0xf0

Feb 18 17:01:19.654555 [   27.128772]  __handle_domain_irq+0x68/0xc0

Feb 18 17:01:19.654603 [   27.132939]  gic_handle_irq+0xa8/0xe0

Feb 18 17:01:19.654647 [   27.136671]  el1_irq+0xb0/0x180

Feb 18 17:01:19.666482 [   27.139883]  arch_cpu_idle+0x18/0x28

Feb 18 17:01:19.666540 [   27.143528]  default_idle_call+0x24/0x5c

Feb 18 17:01:19.666587 [   27.147524]  do_idle+0x204/0x278

Feb 18 17:01:19.678517 [   27.150819]  cpu_startup_entry+0x24/0x68

Feb 18 17:01:19.678577 [   27.154812]  secondary_start_kernel+0x174/0x188

Feb 18 17:01:19.678625 [   27.159415] Code: f9409063 d37e6821 91080021
8b010061 (b9000022)

Feb 18 17:01:19.690480 [   27.165582] ---[ end trace a7aadb3ae629b57f ]---

It looks like that Linux will now try to set the interrupt pending by
writing ISPENDR when the interrupt is re-enabled.

I think the ISPENDR write emulation is easier to implement compare to
the other missing IS{PENDR, ACTIVER).

It should be possible to emulate as follows:
  1) For virtual interrupts, just call vgic_inject_irq()
  2) For physical interrupts, set pending at the HW level. This will
raise an interrupt that will call vgic_inject_irq().

The vGIC in KVM will directly set the physical interrupt active to
avoid the round trip. But I am not sure we can do it safely in our
current vGIC to avoid the guest de-activating the interrupt too early
(the virtual interrupt may already be pending/active).

Any thoughts?

Cheers,

