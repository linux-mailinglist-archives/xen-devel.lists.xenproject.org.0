Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60349541BCF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 23:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343523.568870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyhAh-0002GI-WA; Tue, 07 Jun 2022 21:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343523.568870; Tue, 07 Jun 2022 21:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyhAh-0002Dt-SG; Tue, 07 Jun 2022 21:55:31 +0000
Received: by outflank-mailman (input) for mailman id 343523;
 Tue, 07 Jun 2022 21:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyhAg-0002Dn-Sj
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 21:55:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7d4c03-e6ac-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 23:55:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7C6761768;
 Tue,  7 Jun 2022 21:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749E5C385A5;
 Tue,  7 Jun 2022 21:55:25 +0000 (UTC)
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
X-Inumbo-ID: 8a7d4c03-e6ac-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654638926;
	bh=Wf4mpmab6OumvfGAsjsDUb6O4YEDpkpZwwzVRTvvVmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=agVfJOcHwOsJSslTtgbtoXo6V3I1rxzyX7KPE1Sh4pMKRN9Ab4YTO/V5erJ050WvK
	 98V5Phh6cL0KV0a4K/N4dysYhY4f1OCVUW9X7UIQcy56HnMhunrenVx1ofIDRD9M6J
	 zr35wNFMPajI57T+zkC2de6WgGDU+N9O1LyufOEiMSE0CBCk85d7CTc/3KlY4YkVFd
	 Uxhwq7MvMpmMXYkPddp+htmBbZjXFY8uDqXl6oUq1vO6Lj0xhbOgm9PgUXbgJvQ58G
	 bloUjQ+vJ0Gn2LSQcXyUs/PpCCxgl21KM/c91bVE+KZDcw45D6erqeXcKVAOysfshr
	 YelDCQ8M/w0Uw==
Date: Tue, 7 Jun 2022 14:55:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jens Wiklander <jens.wiklander@linaro.org>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Xen FF-A mediator
In-Reply-To: <20220607101010.3136600-1-jens.wiklander@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop>
References: <20220607101010.3136600-1-jens.wiklander@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jun 2022, Jens Wiklander wrote:
> Hi,
> 
> This patch sets add a FF-A [1] mediator modeled after the TEE mediator
> already present in Xen. The FF-A mediator implements the subset of the FF-A
> 1.1 specification needed to communicate with OP-TEE using FF-A as transport
> mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
> design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
> partition of itself to each guest in Xen.
> 
> The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> except that only the subset needed for OP-TEE is implemented so far. The
> hooks needed to inform OP-TEE that a guest is created or destroyed is part
> of the FF-A specification.
> 
> It should be possible to extend the FF-A mediator to implement a larger
> portion of the FF-A 1.1 specification without breaking with the way OP-TEE
> is communicated with here. So it should be possible to support any TEE or
> Secure Partition using FF-A as transport with this mediator.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> 
> Thanks,
> Jens

Hi Jens,

Many thanks for the patches! I tried to apply them to the master branch
but unfortunately they don't apply any longer. Could you please rebase
them on master (or even better rebase them on staging) and resend?

Thank you!



> Jens Wiklander (2):
>   xen/arm: smccc: add support for SMCCCv1.2 extended input/output
>     registers
>   xen/arm: add FF-A mediator
> 
>  xen/arch/arm/Kconfig         |   11 +
>  xen/arch/arm/Makefile        |    1 +
>  xen/arch/arm/arm64/smc.S     |   43 +
>  xen/arch/arm/domain.c        |   10 +
>  xen/arch/arm/ffa.c           | 1624 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vsmc.c          |   19 +-
>  xen/include/asm-arm/domain.h |    4 +
>  xen/include/asm-arm/ffa.h    |   71 ++
>  xen/include/asm-arm/smccc.h  |   42 +
>  9 files changed, 1821 insertions(+), 4 deletions(-)
>  create mode 100644 xen/arch/arm/ffa.c
>  create mode 100644 xen/include/asm-arm/ffa.h


