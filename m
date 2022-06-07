Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6A541F53
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 01:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343546.568893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyiI2-0002Em-F7; Tue, 07 Jun 2022 23:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343546.568893; Tue, 07 Jun 2022 23:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyiI2-0002Bi-BO; Tue, 07 Jun 2022 23:07:10 +0000
Received: by outflank-mailman (input) for mailman id 343546;
 Tue, 07 Jun 2022 23:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyiI0-0002Bc-5w
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 23:07:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c618745-e6b6-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 01:07:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 111B8609D0;
 Tue,  7 Jun 2022 23:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CDEC3411C;
 Tue,  7 Jun 2022 23:07:04 +0000 (UTC)
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
X-Inumbo-ID: 8c618745-e6b6-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654643224;
	bh=LWfyMb2v5MSdyL+3ClcROnPz1ASejoPP0cLJZf/35SU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=liQYECUeX1Q6fBqgwq2D3ZXwL4V0xoawyK0hCPgfVSXpD26d0ss9qqxyUg7LefCfz
	 WIKOvKC8V4B0/Xse2MjmssJbX46oII0O5chMInC23VMoby+QO+p3LwleEFdL5j0dde
	 4Ot5h2bc3Nyqs6EsB2b5zas4f9P5N3RuQke3syPmBRU3aoN7+G2AToPL+LVcUpcLst
	 zVvPNjriyLhYmVieVbT11r0B3tMLjEmlv4Jj9MQjrhUdaJB26kaC7HOTITmxRS2FJO
	 vAoV1ocSXycYOv0+PRe6He69vyE9Q5e0zr8Ckk1bdes1R+S4X1aR2IUrK4f7q9/a/x
	 2rGQcUYjgZwhA==
Date: Tue, 7 Jun 2022 16:07:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Xen FF-A mediator
In-Reply-To: <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2206071606550.21215@ubuntu-linux-20-04-desktop>
References: <20220607101010.3136600-1-jens.wiklander@linaro.org> <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jun 2022, Stefano Stabellini wrote:
> On Tue, 7 Jun 2022, Jens Wiklander wrote:
> > Hi,
> > 
> > This patch sets add a FF-A [1] mediator modeled after the TEE mediator
> > already present in Xen. The FF-A mediator implements the subset of the FF-A
> > 1.1 specification needed to communicate with OP-TEE using FF-A as transport
> > mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
> > design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
> > partition of itself to each guest in Xen.
> > 
> > The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> > except that only the subset needed for OP-TEE is implemented so far. The
> > hooks needed to inform OP-TEE that a guest is created or destroyed is part
> > of the FF-A specification.
> > 
> > It should be possible to extend the FF-A mediator to implement a larger
> > portion of the FF-A 1.1 specification without breaking with the way OP-TEE
> > is communicated with here. So it should be possible to support any TEE or
> > Secure Partition using FF-A as transport with this mediator.
> > 
> > [1] https://developer.arm.com/documentation/den0077/latest
> > 
> > Thanks,
> > Jens
> 
> Hi Jens,
> 
> Many thanks for the patches! I tried to apply them to the master branch
> but unfortunately they don't apply any longer. Could you please rebase
> them on master (or even better rebase them on staging) and resend?
> 
> Thank you!

One question without having looked at the patches in details. These
patches are necessary to mediate OS (e.g. Linux) interactions with
OPTEE. The difference between xen/arch/arm/ffa.c and
xen/arch/arm/tee/optee.c is the transport mechanism: shared mem vs. SMC.
Is that right?

If only the transport is different, would it make sense to place ffa.c
under xen/arch/arm/tee?

Without having looked at the details of the transport or the FF-A
protocol let me ask you a question. Do you think it would be possible to
share part of the implementation with xen/arch/arm/tee/optee.c? I am
asking because intuitively, if only the transport is differenti I would
have thought that some things could be common. But it doesn't look like
the current patches are reusing anything from xen/arch/arm/tee/optee.c.
Are the two protocols too different?

