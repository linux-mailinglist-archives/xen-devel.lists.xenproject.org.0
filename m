Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151A7D7637
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 23:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623312.971067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvl0t-0004ah-45; Wed, 25 Oct 2023 21:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623312.971067; Wed, 25 Oct 2023 21:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvl0t-0004YS-1E; Wed, 25 Oct 2023 21:02:03 +0000
Received: by outflank-mailman (input) for mailman id 623312;
 Wed, 25 Oct 2023 21:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvl0r-0004YM-Hl
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 21:02:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9a33d3-7379-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 23:02:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EB8CFB8329C;
 Wed, 25 Oct 2023 21:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A583C433C7;
 Wed, 25 Oct 2023 21:01:58 +0000 (UTC)
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
X-Inumbo-ID: bd9a33d3-7379-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698267719;
	bh=SxJfVyjrVi1TgJ5tSdOfiDPOpKYWXJtzrApT4ppXCGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h8dr1WotxQCPanzwkEj6am45wtt/jPb6vhlvi+ZebqaCQIQTqmT1cua+K7nRNPqVL
	 DLMIVtpv92VZ0AZHb8PE1Tws5XaBoR5MP0nN47VorFq6EfwbSJZtkwZSCW4EFPxi95
	 bTjNzKAPSqob3mUMFfQRUsyFe7hlXN1zLPjc7CEQVSvS+zTYR7doivGIdcQwrA4YQz
	 ymOyf5a7+FxmUaJPkG3rsP2jJEGYkoJP27CrrWBCuFawPgSuHNPrP63Xd0hxbkMwJ9
	 WHejMJ1c42BOgp+Q7ISWkhTgR3pEGOBLwREHlNS6qbDUjI0uUc7pZrFSvmmzvyIQqn
	 zSmAGbiyPrmog==
Date: Wed, 25 Oct 2023 14:01:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded
 in memory
In-Reply-To: <08284b00-7b37-4f4b-b4c6-f465dae75b86@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310251401350.271731@ubuntu-linux-20-04-desktop>
References: <20231024102858.29067-1-julien@xen.org> <F5195B0D-C337-4221-9395-56F625497671@arm.com> <alpine.DEB.2.22.394.2310241252140.271731@ubuntu-linux-20-04-desktop> <08284b00-7b37-4f4b-b4c6-f465dae75b86@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/10/2023 20:52, Stefano Stabellini wrote:
> > On Tue, 24 Oct 2023, Bertrand Marquis wrote:
> > > Hi Julien,
> > > 
> > > > On 24 Oct 2023, at 12:28, Julien Grall <julien@xen.org> wrote:
> > > > 
> > > > From: Julien Grall <jgrall@amazon.com>
> > > > 
> > > > In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> > > > we decided to require Xen to be loaded below 2 TiB to simplify
> > > > the logic to enable the MMU. The limit was decided based on
> > > > how known platform boot plus some slack.
> > > > 
> > > > We had a recent report that this is not sufficient on the AVA
> > > > platform with a old firmware [1]. But the restriction is not
> > > > going to change in Xen 4.18. So document the limit clearly
> > > > in docs/misc/arm/booting.txt.
> > > > 
> > > > [1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org
> > > > 
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > > 
> > > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Added for for-4.19
> 
> It was actually meant for 4.18 as we didn't want to include the patch to
> increase the reserved area for the identity mapping [1]. But I failed to use
> the proper tag.
> 
> Henry provided a release-ack and the patch is now committed.

Thanks for letting me know. I took the commit out of for-4.19 and
rebased it.

