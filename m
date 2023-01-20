Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4B676127
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 00:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482201.747602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJ0O3-00013w-PL; Fri, 20 Jan 2023 23:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482201.747602; Fri, 20 Jan 2023 23:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJ0O3-00012f-MR; Fri, 20 Jan 2023 23:01:31 +0000
Received: by outflank-mailman (input) for mailman id 482201;
 Fri, 20 Jan 2023 23:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pJ0O2-00012Z-QL
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 23:01:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ddabf3e-9916-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 00:01:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EACF620D9;
 Fri, 20 Jan 2023 23:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11F8C433EF;
 Fri, 20 Jan 2023 23:01:23 +0000 (UTC)
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
X-Inumbo-ID: 5ddabf3e-9916-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674255685;
	bh=9gQIzIMM5cpDiv+kGDBATwvbTuivHW/jbIB8qFx/DIs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lfvwb1p5WWreKh/wXmf8LkJtCv/9Rb0tabEzYiI3VmfeCmIaPfwz3iWhRjfOogzQe
	 PY4ExOyvn7d3Qjpxko7HASllFs6/7UrfaJ9lAO9euBl74sTTmuvTYGb4bwftM0L6wj
	 MawzY0m5AgCz9cSEdxiGNxYRY1v3moAFLVZ00fz5seLakPCbNF1uUi8o16Pb1ULXWl
	 s4tDuWn/0etFiBLKj533O47aTKXfl/aokxULITyG+kjJr/9qClSK5rw2X6dT2FyHFm
	 4nOiLsjNdaVL68VbmtoNbjqoYVc0FbKlc5q4BGLNGzLvaKNx0PdcAXaG65BT2pKKWO
	 bs469z/9opGVg==
Date: Fri, 20 Jan 2023 15:01:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
In-Reply-To: <0a7d3da6-efe7-2cf1-563a-3c5c2ec473b2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301201455100.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-3-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop> <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org> <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
 <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org> <2017e0d4-dd02-e81d-99f4-1ef47fc9e774@amd.com> <42b138a6-59f5-7614-d96f-30e1784c97a4@xen.org> <0a7d3da6-efe7-2cf1-563a-3c5c2ec473b2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-450487461-1674255684=:731018"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-450487461-1674255684=:731018
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jan 2023, Ayan Kumar Halder wrote:
> Hi Julien/Michal,
> 
> On 20/01/2023 17:49, Julien Grall wrote:
> > 
> > 
> > On 20/01/2023 16:03, Michal Orzel wrote:
> > > Hi Julien,
> > 
> > Hi Michal,
> > 
> > > 
> > > On 20/01/2023 16:09, Julien Grall wrote:
> > > > 
> > > > 
> > > > On 20/01/2023 14:40, Michal Orzel wrote:
> > > > > Hello,
> > > > 
> > > > Hi,
> > > > 
> > > > > 
> > > > > On 20/01/2023 10:32, Julien Grall wrote:
> > > > > > 
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > On 19/01/2023 22:54, Stefano Stabellini wrote:
> > > > > > > On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> > > > > > > > 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
> > > > > > > > 2. One should use 'PRIx64' to display 'u64' in hex format. The
> > > > > > > > current
> > > > > > > > use of 'PRIpaddr' for printing PTE is buggy as this is not a
> > > > > > > > physical
> > > > > > > > address.
> > > > > > > > 
> > > > > > > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > > > > > > 
> > > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > 
> > > > > > 
> > > > > > I have committed the patch.
> > > > > The CI test jobs (static-mem) failed on this patch:
> > > > > https://gitlab.com/xen-project/xen/-/pipelines/752911309
> > > > 
> > > > Thanks for the report.
> > > > 
> > > > > 
> > > > > I took a look at it and this is because in the test script we
> > > > > try to find a node whose unit-address does not have leading zeroes.
> > > > > However, after this patch, we switched to PRIpaddr which is defined as
> > > > > 016lx/016llx and
> > > > > we end up creating nodes like:
> > > > > 
> > > > > memory@0000000050000000
> > > > > 
> > > > > instead of:
> > > > > 
> > > > > memory@60000000
> > > > > 
> > > > > We could modify the script,
> > > > 
> > > > TBH, I think it was a mistake for the script to rely on how Xen describe
> > > > the memory banks in the Device-Tree.
> > > > 
> > > > For instance, from my understanding, it would be valid for Xen to create
> > > > a single node for all the banks or even omitting the unit-address if
> > > > there is only one bank.
> > > > 
> > > > > but do we really want to create nodes
> > > > > with leading zeroes? The dt spec does not mention it, although [1]
> > > > > specifies that the Linux convention is not to have leading zeroes.
> > > > 
> > > > Reading through the spec in [2], it suggested the current naming is
> > > > fine. That said the example match the Linux convention (I guess that's
> > > > not surprising...).
> > > > 
> > > > I am open to remove the leading. However, I think the CI also needs to
> > > > be updated (see above why).
> > > Yes, the CI needs to be updated as well.
> > 
> > Can either you or Ayan look at it?
> 
> Does this change match the expectation ?
> 
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 2b59346fdc..9f5e700f0e 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -20,7 +20,7 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      domu_size="10000000"
>      passed="${test_variant} test passed"
>      domU_check="
> -current=\$(hexdump -e '16/1 \"%02x\"'
> /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
> +current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@$[0-9]*/reg
> 2>/dev/null)
>  expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
>  if [[ \"\${expected}\" == \"\${current}\" ]]; then
>         echo \"${passed}\"

We need to check for ${domu_base} with or without leading zeroes:

current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@*(0)${domu_base}/reg 2>/dev/null)
--8323329-450487461-1674255684=:731018--

