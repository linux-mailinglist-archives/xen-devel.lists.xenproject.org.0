Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5806A7853
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 01:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504272.776860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXWhi-0007WF-Gr; Thu, 02 Mar 2023 00:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504272.776860; Thu, 02 Mar 2023 00:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXWhi-0007Th-Dq; Thu, 02 Mar 2023 00:21:50 +0000
Received: by outflank-mailman (input) for mailman id 504272;
 Thu, 02 Mar 2023 00:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXWhh-0007Tb-HB
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 00:21:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3793e3a1-b890-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 01:21:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1955AB8119A;
 Thu,  2 Mar 2023 00:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6474EC433EF;
 Thu,  2 Mar 2023 00:21:43 +0000 (UTC)
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
X-Inumbo-ID: 3793e3a1-b890-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677716504;
	bh=HiG5sGWJHGo1P9kF+5ROkOmITj9p1fEO+7XYUM5daDo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J5ZpTE9x2UFeTQhZJLwfCkLRYtssWZdJJp3Z88kQo5uF/6c5I9/wCQtn+ayLXXP1a
	 hvQr2qJ35+bzjZEoUjKxon3rcpEboXaUij2OLl1YC01H7ov3UKv86UCWejxdF0Y99T
	 ElABItE0jEarg4u8gXqJdJ2afMl4K1kKQunKXsVsnU96A7gUTOR1ZlLNKBDnE98fQ4
	 MCxOGH6aDXe6mIWoJIcwqiqTJvqMdWu3K1RsrNiUsv9hv5zWjSI/mVCIV6SRg+Yy2c
	 PNa1O6Hx85QKew0kPWQ5RyPpukP6cNg3OseDd0k/aEkZtycUsvm9y2ph1rl2DW9hjy
	 BOMKWbwvhe34w==
Date: Wed, 1 Mar 2023 16:21:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/2] xen/misra: add entries to exclude-list.json
In-Reply-To: <20230301095320.264301-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303011605310.3680@ubuntu-linux-20-04-desktop>
References: <20230301095320.264301-1-luca.fancellu@arm.com> <20230301095320.264301-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Mar 2023, Luca Fancellu wrote:
> Add entries to the exclude-list.json for those files that need to be
> excluded from the analysis scan.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>


I checked the results both x86 and arm and they look much more
reasonable (with the exception of the way too many unusedStructMember
reports on x86).

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> This list is originated from Michal's work here:
> https://patchwork.kernel.org/project/xen-devel/patch/20221116092032.4423-1-michal.orzel@amd.com/#25123099
> and changed to adapt to this task.
> Changes from v1:
>  - updated list with new files from Stefano
>  - add comment field for every entry (Jan)
> ---
> ---
>  docs/misra/exclude-list.json | 199 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 1fb0ac67747b..ca1e2dd678ff 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -1,4 +1,201 @@
>  {
>      "version": "1.0",
> -    "content": []
> +    "content": [
> +        {
> +            "rel_path": "arch/arm/arm64/cpufeature.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/arm/arm64/insn.c",
> +            "comment": "Imported on Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/boot.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpu_idle.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpuidle_menu.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/lib.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/amd.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/centaur.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/common.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/hygon.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/intel.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/intel_cacheinfo.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mtrr/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mwait-idle.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/delay.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/dmi_scan.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/mpparse.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/srat.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/time.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/bitmap.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/bunzip2.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/earlycpio.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/inflate.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/libfdt/*",
> +            "comment": "External library"
> +        },
> +        {
> +            "rel_path": "common/livepatch_elf.c",
> +            "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
> +        },
> +        {
> +            "rel_path": "common/lzo.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/lz4/decompress.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/radix-tree.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/ubsan/ubsan.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/un*.c",
> +            "comment": "unlz4.c implementation by Yann Collet, the others un* are from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/xz/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "common/zstd/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "crypto/*",
> +            "comment": "Origin is external and documented in crypto/README.source"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/apei/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/hwregs.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/numa.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/osl.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/tables.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/tables/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/utilities/*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "drivers/video/font_*",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "lib/list-sort.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "lib/rbtree.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "lib/xxhash*.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "xsm/flask/*",
> +            "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
> +        }
> +    ]
>  }
> -- 
> 2.34.1
> 

