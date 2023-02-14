Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D0A6970B7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 23:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495593.765939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS3k0-0004P7-Ig; Tue, 14 Feb 2023 22:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495593.765939; Tue, 14 Feb 2023 22:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS3k0-0004NQ-Fp; Tue, 14 Feb 2023 22:25:36 +0000
Received: by outflank-mailman (input) for mailman id 495593;
 Tue, 14 Feb 2023 22:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS3jz-0004NG-09
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 22:25:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e00cd9d-acb6-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 23:25:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AE4361937;
 Tue, 14 Feb 2023 22:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FFAC433EF;
 Tue, 14 Feb 2023 22:25:29 +0000 (UTC)
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
X-Inumbo-ID: 7e00cd9d-acb6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676413530;
	bh=7NFfVDI72T27LvlvJp/EOq8RRDqEW1nSI1jeM0wJ26M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eIYDXIIIs2NRU33fK8C7rir3SXF4GY17v5fuHm8wrBTmd8SgFYCPKk1ZNYFdOXcMr
	 chMdZSfAYrqx9RsZzYgGbVCd0XAqBppVlTlAEa9rHCqNniC2djmwjQ0qxHXvrNATwc
	 xhOx5uERUDBlMmC/22hPuxpaV8IDU8SIo3iKBxyAvrxnjdCK050uuqNrjBG6Exl0BQ
	 NOX78A3GSCGYsWMtPwmprEysbr9EivGBUzXOQ17N+HMv3cG2zalAO+FFnXWG/DKQwi
	 XodnUNqOP1g7kjwHBv8XCcB1yfPSpucTGUS9Wx4yt/pqn4aczxopOZLYd2lMPscMVu
	 4bI4qN99Nk6dA==
Date: Tue, 14 Feb 2023 14:25:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, wei.chen@arm.com, 
    bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
In-Reply-To: <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
References: <20230214085635.3170962-1-luca.fancellu@arm.com> <20230214085635.3170962-3-luca.fancellu@arm.com> <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Jan Beulich wrote:
> On 14.02.2023 09:56, Luca Fancellu wrote:
> > --- a/docs/misra/exclude-list.json
> > +++ b/docs/misra/exclude-list.json
> > @@ -1,4 +1,209 @@
> >  {
> >      "version": "1.0",
> > -    "content": []
> > +    "content": [
> > +        {
> > +            "rel_path": "arch/arm/arm64/cpufeature.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/arm/arm64/insn.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/arm/arm64/lib/find_next_bit.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/boot.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/cpu_idle.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/cpuidle_menu.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/lib.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/acpi/power.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/amd.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/centaur.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/common.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/hygon.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/intel.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/intel_cacheinfo.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/mcheck/mce-apei.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/mtrr/*"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/cpu/mwait-idle.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/delay.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/dmi_scan.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/domain.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/genapic/*"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/i387.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/irq.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/mpparse.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/srat.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/time.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/traps.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/usercopy.c"
> > +        },
> > +        {
> > +            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c"
> > +        },
> > +        {
> > +            "rel_path": "common/bitmap.c"
> > +        },
> > +        {
> > +            "rel_path": "common/bunzip2.c"
> > +        },
> > +        {
> > +            "rel_path": "common/cpu.c"
> > +        },
> > +        {
> > +            "rel_path": "common/earlycpio.c"
> > +        },
> > +        {
> > +            "rel_path": "common/inflate.c"
> > +        },
> > +        {
> > +            "rel_path": "common/libfdt/*"
> > +        },
> > +        {
> > +            "rel_path": "common/lz4/decompress.c"
> > +        },
> > +        {
> > +            "rel_path": "common/notifier.c"
> > +        },
> > +        {
> > +            "rel_path": "common/radix-tree.c"
> > +        },
> > +        {
> > +            "rel_path": "common/rcupdate.c"
> > +        },
> > +        {
> > +            "rel_path": "common/softirq.c"
> > +        },
> > +        {
> > +            "rel_path": "common/tasklet.c"
> > +        },
> > +        {
> > +            "rel_path": "common/ubsan/ubsan.c"
> > +        },
> > +        {
> > +            "rel_path": "common/un*.c"
> > +        },
> > +        {
> > +            "rel_path": "common/vsprintf.c"
> > +        },
> > +        {
> > +            "rel_path": "common/xz/*"
> > +        },
> > +        {
> > +            "rel_path": "common/zstd/*"
> > +        },
> > +        {
> > +            "rel_path": "crypto/rijndael.c"
> > +        },
> > +        {
> > +            "rel_path": "crypto/vmac.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/apei/*"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/hwregs.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/numa.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/osl.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/reboot.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/tables.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/tables/*"
> > +        },
> > +        {
> > +            "rel_path": "drivers/acpi/utilities/*"
> > +        },
> > +        {
> > +            "rel_path": "drivers/char/ehci-dbgp.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/char/xhci-dbc.c"
> > +        },
> > +        {
> > +            "rel_path": "drivers/cpufreq/*"
> > +        },
> > +        {
> > +            "rel_path": "drivers/video/font_*"
> > +        },
> > +        {
> > +            "rel_path": "lib/list-sort.c"
> > +        },
> > +        {
> > +            "rel_path": "lib/mem*.c"
> > +        },
> > +        {
> > +            "rel_path": "lib/rbtree.c"
> > +        },
> > +        {
> > +            "rel_path": "lib/str*.c"
> > +        },
> > +        {
> > +            "rel_path": "lib/xxhash32.c"
> > +        },
> > +        {
> > +            "rel_path": "lib/xxhash64.c"
> > +        }
> > +    ]
> >  }
> 
> Patch 1's example has a "comment" field, which no entry makes use of.
> Without that, how does it become clear _why_ a particular file is to
> be excluded? The patch description here also doesn't provide any
> justification ...

It would be good to have a couple of pre-canned justifications as the
reason for excluding one file could be different from the reason for
excluding another file. Some of the reasons:

- imported from Linux
- too many false positives


That said, we don't necessarily need to know the exact reason for
excluding one file to be able to start scanning xen with cppcheck
automatically. If someone wants to remove a file from the exclude list
in the future they just need to show that cppcheck does a good job at
scanning the file and we can handle the number of violations.

I take that with this exclude list, not accounting for rule 20.7,
cppcheck reports zero violations overall?

