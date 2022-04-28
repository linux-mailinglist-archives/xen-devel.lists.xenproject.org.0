Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE53051284B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 02:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315895.534582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njsJy-00043I-Mc; Thu, 28 Apr 2022 00:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315895.534582; Thu, 28 Apr 2022 00:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njsJy-00040v-Je; Thu, 28 Apr 2022 00:47:50 +0000
Received: by outflank-mailman (input) for mailman id 315895;
 Thu, 28 Apr 2022 00:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njsJx-00040p-Av
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 00:47:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2c5253e-c68c-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 02:47:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D344561F17;
 Thu, 28 Apr 2022 00:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA0CC385A9;
 Thu, 28 Apr 2022 00:47:45 +0000 (UTC)
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
X-Inumbo-ID: d2c5253e-c68c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651106866;
	bh=3+gJ4Ng4DtJIAMyvKT20XOPQNDT7Tze15FEwFqKjeog=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dPFlWjkVJEZRA5gheen+n/ly97LwLx+GLO+H32yOrf9n3YFWZYe1yFJ+0S17ZZyiL
	 bf2peYekMwHeOt1sB8W36YKAUG3lC59meD4Fflf72e5n+WOcjMvLZrfN8qkYhNf0l2
	 JH3Z27WUSSaAv9DetBQ33V80rkpMALrowSUWgehoPVYbbqW94mjFc9XoSe3AVOcuxE
	 p6YihAIEeYJ1i1oHLuXGml0d/EuxOfX9qQLzHPCtWqtgkvbIgf8XqSGr5GdqCnkvcB
	 EPPIvFTTOyzt7BjG6wordqK7G47YzKuCA8OUgtk4dmilwK1hXt1kf9oOMVIRGaGKE2
	 kriCN4ZhiYmVg==
Date: Wed, 27 Apr 2022 17:47:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, David Vrabel <dvrabel@amazon.co.uk>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
In-Reply-To: <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop>
References: <osstest-169781-mainreport@xen.org> <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org> <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop> <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Apr 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On Thu, 28 Apr 2022, 00:02 Stefano Stabellini, <sstabellini@kernel.org> wrote
>       It seems to me that it is acceptable to allocate memory with interrupt
>       disabled during __init. I cannot see any drawbacks with it. I think we
>       should change the ASSERT to only trigger after __init: system_state ==
>       SYS_STATE_active.
> 
>       What do you think?
> 
> 
> This would solve the immediate problem but not the long term one (i.e cpu hotplug).
> 
> So I think it would be better to properly fix it right away.

Yeah, you are right about cpu hotplug. I think both statements are true:

- it is true that this is supposed to work with cpu hotplug and these
  functions might be directly affected by cpu hotplug (by a CPU coming
  online later on)

- it is also true that it might not make sense to ASSERT at __init time
  if IRQs are disabled. There might be other places, not affected by cpu
  hotplug, where we do memory allocation at __init time with IRQ
  disabled. It might still be a good idea to add the system_state ==
  SYS_STATE_active check in the ASSERT, not to solve this specific
  problem but to avoid other issues.


In regard to gicv3_lpi_allocate_pendtable, I haven't thought about the
implications of cpu hotplug for LPIs and GICv3 before. Do you envision
that in a CPU hotplug scenario gicv3_lpi_init_rdist would be called when
the extra CPU comes online?

Today gicv3_lpi_init_rdist is called based on the number of
rdist_regions without checking if the CPU is online or offline (I think ?)

