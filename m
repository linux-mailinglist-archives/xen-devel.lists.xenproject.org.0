Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A69C94A2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 22:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836813.1252705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBhav-0008Mz-7p; Thu, 14 Nov 2024 21:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836813.1252705; Thu, 14 Nov 2024 21:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBhav-0008KU-3r; Thu, 14 Nov 2024 21:41:41 +0000
Received: by outflank-mailman (input) for mailman id 836813;
 Thu, 14 Nov 2024 21:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBhat-0008KO-25
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 21:41:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c66664-a2d1-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 22:41:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 291665C612C;
 Thu, 14 Nov 2024 21:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1521C4CECD;
 Thu, 14 Nov 2024 21:41:31 +0000 (UTC)
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
X-Inumbo-ID: 37c66664-a2d1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjM3YzY2NjY0LWEyZDEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjIwNDk1LjI0OTM2Mywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731620493;
	bh=/VzcZt4sclUkkjNLpuFOZ733u1qmCSDyBgi88JaEetE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YwioryWNZwg/GlyuVQHmVQEgoqEQ9eM58B8VoIQCR3Mhq7z2sKRB+2zlrdo9DL6MJ
	 UCiYOp2L0AmpQYimY2o1UQSpYF1A//ghnO3yBGoTzyoAHB8NFtlrHWkrpqO7JSszuv
	 FlpJ5fBSsQDVYmJDSO9lSDhwe+SBL2Ex1baALR/TFrEMIytrl592cNmTI0dSsEopCo
	 gePsuKo23EJ4gzjBDAWAf7Q4VhRx3G8H46STS3mgUqZSpgvG2ZVOMrwZqT/Weup8EX
	 NoZXb9i53jdVQMfe72QmDQAWDIArR6IbveNSI2d1yCh0Gi8SEFFS7n6ls+ucqMA30Z
	 sZb/RjyJKRGeg==
Date: Thu, 14 Nov 2024 13:41:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
In-Reply-To: <7eef8e7a-e2a1-41bd-8805-b00a2bc0ae1a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2411141323290.850075@ubuntu-linux-20-04-desktop>
References: <20241106134132.2185492-1-luca.fancellu@arm.com> <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com> <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org> <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com> <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com> <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org> <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop> <92564de9-24f7-4259-bc45-a95680101693@xen.org> <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
 <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org> <7ba02037-05ec-491a-92c6-de7195d298ed@amd.com> <7eef8e7a-e2a1-41bd-8805-b00a2bc0ae1a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Julien Grall wrote:
> On 14/11/2024 12:22, Michal Orzel wrote:
> > 
> > 
> > On 14/11/2024 13:04, Julien Grall wrote:
> > > 
> > > 
> > > Hi Michal,
> > > 
> > > On 14/11/2024 11:48, Michal Orzel wrote:
> > > > 
> > > > 
> > > > On 14/11/2024 11:31, Julien Grall wrote:
> > > > > Looking at the code, I think /memreserve/ and /reserved-memory are not
> > > > > mapped in Xen and everything in /reserved-memory is mapped to dom0.
> > > > Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not?
> > > 
> > > I was wondering the same. The main issue I can think of with
> > > /memreserve/ is some of the regions will likely be for Xen own usage. So
> > Can you give example of regions defined as reserved for Xen usage (other
> > than static-mem)?
> 
> The spin table to bring-up CPUs.

Yes, maybe my EFI runtime services example was not ideal, but basically
any firmware "stuff" that is expected to survive the end of the
firmware/bootloader boot sequence and should not be accessed directly by
the OS could be under /memreserve/  The spin table is a good example.


> > > we would need to have a way to exclude them from dom0.
> > > 
> > >   >  From the discussion> we're having it seems like we should treat them
> > > equally. Also, looking at Luca patch,
> > > > we seem to special case /memreserve/ and only allow for overlap
> > > > /memresrve/ with boot modules
> > > > and not /reserved-memory/ with boot modules. If we are going to claim
> > > > that all the boot modules
> > > > can be marked as reserved by the bootloader, then I think we should
> > > > treat them equally providing
> > > > the same experience to dom0.
> > > 
> > > In my mind, /memreserved/ and /reserved-memory/ are different. The
> > > former doesn't say what the region is for, but the latter will indicate
> > > it.
> > In the context of this patch, I don't agree. We're discussing overlap, and
> > if a region A
> > from /memreserve/ overlaps fully with a module A, we know what is the
> > purpose of it.
> > Today it's initrd, but as you say we cannot rule out other modules as well.
> 
> To give a concrete example, the /reserved-region/ can be used to reserve space
> for the VGA buffer. It would be odd that someone would put the boot module in
> the middle of the VGA buffer... If Xen ends up to use the VGA buffer (not the
> case today), then it would be a problem. Xen would need to be reworked to move
> all boot modules outside of the memory because it can access the VGA (or any
> other reserved regions).
> 
> The problem is slightly different for /memreserve/ because we don't exactly
> know what the regions are for until we parse the rest of the DT. Yes
> technically, a user could put the initrd in the wrong place. So the problem is
> the same. But this is a relexation I am more willing to accept over
> /reserved-region/ right now.

Looking at the specification, I believe we should handle
/reserved-memory and /memreserve/ differently. Note that I have not
reviewed this patch; my comments are based solely on the expected Xen
behavior at the specification level.

Given that /reserved-memory regions are designated for special driver
use, I think Xen should remap all /reserved-memory regions to Dom0.
Ideally, Xen would determine which driver requires each /reserved-memory
region and assign only the relevant region to the respective domain,
rather than assigning all regions to Dom0. However, for now, we can take
this as an initial simplification.

On the other hand, since /memreserve/ is not intended for general use
and we do not know its content, I believe /memreserve/ should not be
mapped to Dom0 or any domain. It could be included in Xen's directmap,
but Xen itself should not access it. If another device tree node
represents a range or a subset of a range also described in
/memreserve/, that node should take precedence, and the corresponding
range should be assigned to Dom0 (or another domain, such as DomU, or
Xen, as appropriate). Unfortunately, this implies Xen needs to
understand the linux,initrd node.

I think /memreserve/ is valuable for protecting certain areas from the
operating system. For instance, it could be used as a storage area for
guest EFI variables in a VM, where the guest OS should never access the
range. However, I do not believe the initrd range is a good use of
/memreserve/ and similar items, which are meant to be freed anyway and
where Linux already knows the exact range and its intended use. So I
would not change Xen to start reserving the initrd range for Linux. The
likely reason U-Boot uses /memreserve/ is that the U-Boot code
implementing this behavior predates the introduction of
/reserved-memory.

