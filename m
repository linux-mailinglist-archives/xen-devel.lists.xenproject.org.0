Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC56A4DE7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 23:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502947.775005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlqg-00060N-M0; Mon, 27 Feb 2023 22:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502947.775005; Mon, 27 Feb 2023 22:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlqg-0005xr-JM; Mon, 27 Feb 2023 22:19:58 +0000
Received: by outflank-mailman (input) for mailman id 502947;
 Mon, 27 Feb 2023 22:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pWlqf-0005xl-Tc
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 22:19:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbfe2363-b6ec-11ed-a550-8520e6686977;
 Mon, 27 Feb 2023 23:19:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3528B60A16;
 Mon, 27 Feb 2023 22:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE56CC433D2;
 Mon, 27 Feb 2023 22:19:50 +0000 (UTC)
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
X-Inumbo-ID: dbfe2363-b6ec-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677536392;
	bh=0xaBgoYEfb3JLn0g9cNw3Cj0C6Ya8NC9jJbSdXrxv6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l3+ZdqG5s3e6vJK8YHqMSTcwOG5hDx/VZIyy8CRGj6uGBDI+AIhkvdnaBc49qEVLd
	 Zl4D015eSdPZ4SwgWbA3rsTymqRBcNhsNfCrywPQn/7GREH03JIfu/eBIVMDjHcoGo
	 xejfiAJ/Cf1QpUq2tNb83uuxTDBp45tTnumYYslW2Dw4u98GB2m+BnJ1x9EuplIUEu
	 EbByTNrZsMp6RqotrM4Kn96CdONxe/hM0zYJkDhEI8yrHzwo8ZgMJNKy0IrcEokUde
	 u5aFSiHhLtWzCpCO3BBqOsuKz2QMkdFOIuYy8hmOyzqxaid9It9fd4AeKkcXY9pJys
	 JksTZzTQxFcgg==
Date: Mon, 27 Feb 2023 14:19:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
In-Reply-To: <80D0D2C7-AA0A-490D-85E5-0CA3F5EECF34@arm.com>
Message-ID: <alpine.DEB.2.22.394.2302271418390.3680@ubuntu-linux-20-04-desktop>
References: <20230214085635.3170962-1-luca.fancellu@arm.com> <20230214085635.3170962-3-luca.fancellu@arm.com> <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com> <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop> <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
 <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop> <14a4bccd-f316-fca9-a04d-5bd639307e9b@suse.com> <340CAA3C-DC15-4826-9022-0348BB3CE6C9@arm.com> <alpine.DEB.2.22.394.2302161732490.2127160@ubuntu-linux-20-04-desktop>
 <80D0D2C7-AA0A-490D-85E5-0CA3F5EECF34@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1934655835-1677536392=:3680"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1934655835-1677536392=:3680
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Feb 2023, Luca Fancellu wrote:
> Hi Stefano,
> 
> >> Hi Jan,
> >> 
> >> my personal opinion is that we can’t handle them for files that needs to be kept
> >> in sync from an external source, because we can’t justify findings or tag false
> >> positives, if we are lucky we might fix the non compliances but even in that case
> >> there might be times when the fix goes through and cases where the fix is objected
> >> by the maintainers just because their project is not following the MISRA standard.
> >> 
> >> On our side, what we can do is track these files and from time to time check that
> >> they are still eligible to backport, because when they are not anymore we could
> >> just port them to Xen coding style and start doing direct changes.
> >> 
> >> 
> >> @Stefano/@Bertrand/@Julien thanks for your effort on the list, yesterday morning
> >> I’ve also had a look on the Michal’s file list and I’ve tracked down the origin, here
> >> my findings, maybe we could merge your list with mine?
> > 
> > Yes to merge the two lists, but I think we should keep only items that we
> > actually need for the sake of having a cleaner baseline. So I would only
> > add things we need today to reduce the noise on cppcheck results
> > (excluding 20.7 and also excluding unusedStructMember which I think we
> > should probably stop scanning with cppcheck altogether).
> 
> Yes I thought about excluding unusedStructMember, I see there are a lot of findings on x86
> which are not real findings, it’s just that the tool has not the complete picture.
> 
> Here the ways are two:
> 1) exclude globally unusedStructMember
> 2) exclude unusedStructMember only on some selected files (available only on cppcheck)
>     this requires some work to add a field to this list, like “cppcheck-error-exclude” and a list,
>     comma separated, of error-id to be suppressed from the corresponding file.

For now, I would exclude globally


> Regarding the list, I merged your list with mine (and Michal’s work) to create a complete list,
> I think it’s better to have it complete because all those files are external and even if today we don’t
> have findings for some of these files, we could have some in the future, and since we know today 
> that we can’t do direct changes to them, in my opinion it’s better to list them now instead of forgetting
> them later.
> 
> I left out for now these files to start a discussion for them, because I think they should be included in
> the analysis:
> 
> common/symbols-dummy.c:
>   this file accepts direct changes, cppcheck complains about misra-c2012-8.4 but I think it is right, also
>   Coverity complains about the same findings, they can be fixed adding declarations on symbols.h I think
>   and removing the declarations from symbol.c module
> 
> common/version.c:
>   Apart from unusedStructMember, cppcheck is confused only on 2 findings that compares one local symbol
>   and one linker defined symbol, could we have just one tag to suppress those two findings instead of removing
>   completely the file? This file is under our control, so we could push changes.
> 
> include/xen/lib.h:
>   Findings are from the bsearch function, which is derived from Linux, but I can see the codestyle is the Xen style
>   and it seems (I might be wrong) that it has diverged from Linux, so we might do changes and fix the findings that
>   are correct, void* arithmetic is working because gcc make it work assigning a sizeof of 1, using char* pointers we
>   have the same result without having the undefined behaviour (correct me if I am wrong).
> 
> include/xen/sort.h:
>   Also this one is derived from Linux, but seems that we converted it to our coding style and we can do direct changes,
>   the same reasoning about void* pointers arithmetic applies here.
> 
> 
> What are your thoughts?

I am good with this


> Here the merged list, capturing also Jan comments:
> 
> {
>    "version": "1.0",
>    "content": [
>        {
>            "rel_path": "arch/arm/arm64/cpufeature.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/arm/arm64/insn.c",
>            "comment": "Imported on Linux"
>        },
>        {
>            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/acpi/boot.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/acpi/cpu_idle.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/acpi/cpuidle_menu.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/acpi/lib.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/amd.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/centaur.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/common.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/hygon.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/intel.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/intel_cacheinfo.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/mtrr/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/cpu/mwait-idle.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/delay.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/dmi_scan.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/mpparse.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/srat.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/time.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/bitmap.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/bunzip2.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/earlycpio.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/inflate.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/libfdt/*",
>            "comment": "External library"
>        },
>        {
>            "rel_path": "common/livepatch_elf.c",
>            "comment" : "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
>        },
>        {
>            "rel_path": "common/lzo.c",
>            "comment" : "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/lz4/decompress.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/radix-tree.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/ubsan/ubsan.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/un*.c",
>            "comment": "unlz4.c implementation by Yann Collet, the others un* are from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/xz/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "common/zstd/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "crypto/*",
>            "comment": "Origin is external and documented in crypto/README.source"
>        },
>        {
>            "rel_path": "drivers/acpi/apei/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/hwregs.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/numa.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/osl.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/tables.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/tables/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/acpi/utilities/*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "drivers/video/font_*",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "lib/list-sort.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "lib/rbtree.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "lib/xxhash*.c",
>            "comment": "Imported from Linux, ignore for now"
>        },
>        {
>            "rel_path": "xsm/flask/*",
>            "comment" : "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
>        }
>    ]
> }
> 
> 
> 
--8323329-1934655835-1677536392=:3680--

