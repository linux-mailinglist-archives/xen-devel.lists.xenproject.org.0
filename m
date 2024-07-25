Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EB93CAF0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 00:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765152.1175735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX79W-0008Ne-DL; Thu, 25 Jul 2024 22:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765152.1175735; Thu, 25 Jul 2024 22:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX79W-0008Lz-An; Thu, 25 Jul 2024 22:41:38 +0000
Received: by outflank-mailman (input) for mailman id 765152;
 Thu, 25 Jul 2024 22:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sX79U-0008Lt-UW
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 22:41:37 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9da018-4ad7-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 00:41:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7BC6ECE1689;
 Thu, 25 Jul 2024 22:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5812AC4AF0C;
 Thu, 25 Jul 2024 22:41:29 +0000 (UTC)
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
X-Inumbo-ID: 0a9da018-4ad7-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721947290;
	bh=sOVM4r7mU3j5oVQ/ecTboEcugQf38pMenhU9TEOvlxc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TeByrUzyDl2nBdnWYmTW0arfbTqBl94g10G03CJELfYPuRF2Q+G9RJzlQF4eg86BR
	 Ff3cQD/kJkFqJAv7pdwE4L5Wwsg0JK2jW/fj3sEfDgK9V4SK8WLSitAw6/i9Qitk84
	 J7zjmNDnJlfldti0ybOCIugpexix5r4xZ1HNV8UvHGUJq6E7EHXa8nyxeWyhq+/ixS
	 y7EjRwcxc/XQG3XWvEi7Cd5BSxhIP6nnde/Nn/W6FR3umS61Ut6worIshOKX8swhmc
	 /Yh38XtxkVVPWttWVtcKUNylQHGLPqqecE9ci+wOJA8E0+LLkspgK473rSHY8gkO6V
	 De97BHXbQ4BBQ==
Date: Thu, 25 Jul 2024 15:41:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Techguru <techguru@byiq.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: Re: Xen for Apple Silicon (M1 and beyond)
In-Reply-To: <99c8f34c61b59a16edb0fd11d214267e@mail.infomaniak.com>
Message-ID: <alpine.DEB.2.22.394.2407251540130.4857@ubuntu-linux-20-04-desktop>
References: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com> <alpine.DEB.2.22.394.2407241309170.4857@ubuntu-linux-20-04-desktop> <99c8f34c61b59a16edb0fd11d214267e@mail.infomaniak.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1760869520-1721947290=:4857"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1760869520-1721947290=:4857
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 25 Jul 2024, Techguru wrote:
> A bit about Apple Silicon M1(2,3,4) architecture, SoC and motherboard. (AFAIK)
> 
> There are no EFI assumptions nor contracts, and no EFI firmware.
> Between those 4 generations of silicon, there are about 80 different roles "SoC cores/components" can play, each with its own signed Apple
> Firmware.
> Most of those SoC cores/functions have nothing to do with the traditional ARM compute cores.
> At least one of those SoC cores is actually an x86 processor core (on models which support HDMI), running x86 firmware.
> Many of the other non-compute cores (Networking, USC (A-C), Thunderbolt ... yada yada) are various size Arm cores running an Apple RTOS
> Variant of L4 microkernel.
> Each of those, again, has its own Apple Signed firmware which is paired with a particular Darwin kernel release.
> One point of friction is that there is no stable ABI spec for each of the firmware modules.   Apple reserves the right to completely change
> the firmware's
> interface with the paired Darwin kernel.
> 
> It is perhaps best to think of the SoC and related motherboard hardware as a "compute cluster" rather than a single von-neuman machine.
> 
> I could be wrong about a lot of the above, and invite corrections with citations.
> 
> For this, do you know if 4K pages are supported (in addition to 16K)? It
> would be a lot easier to keep running Xen using 4K pages and run guests
> on top of Xen which use 16K pages. In the past, we had Linux using 64K
> pages running on top of Xen using 4K pages for example.
> 
> Given the state of all of the _other_ SoC cores running L4 RTOS, I have reservations about running with anything other than 16k native
> pages.  Will have to
> investigate what options, if any, are available for keeping 16k pages for existing firmware, while presenting 4k pages to guest OS.
> 
> However, both Rosetta and Docker appear to run 4k guests just fine, so not sure how many pushups they are doing in the process.

I just wanted to clarify that I am suggesting to run Xen with 4K pages
and the guests with 16K pages. I am *not* suggesting to change the page
granularity of the guests.
--8323329-1760869520-1721947290=:4857--

