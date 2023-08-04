Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9F7708E2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 21:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577294.904301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0Kc-0006K8-Uh; Fri, 04 Aug 2023 19:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577294.904301; Fri, 04 Aug 2023 19:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0Kc-0006IT-Rt; Fri, 04 Aug 2023 19:19:26 +0000
Received: by outflank-mailman (input) for mailman id 577294;
 Fri, 04 Aug 2023 19:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS0Kb-0006IN-0E
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 19:19:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b0a1c1-32fb-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 21:19:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8805620F9;
 Fri,  4 Aug 2023 19:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25950C433C7;
 Fri,  4 Aug 2023 19:19:19 +0000 (UTC)
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
X-Inumbo-ID: d0b0a1c1-32fb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691176760;
	bh=apUVt5yHL5/JjzyZ1TVPnIPul2cJTe3/wdu6vBwZRDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s4zUD85T/SQ/hK/Fuer+JmtdB5L7KTyljYWxK4UX4KDKry53SCZV38Ju+2W1oLOQx
	 2hdIoKj1qjHWBM0En+rjgTBRIE2QeXpVXuPc3dRIy+AQoOLDbtXNT1QbJyeeY53aHI
	 0Wl3hPBlmWvpKnE1i/FZbCFFR8zPiS8mqI9tpO+sF7mcDhiWH7C5jV+/UK5Uffhdc3
	 SYZnrEbSqp4ZAaS4xq7thAvueJE8yzD3PnXMQbN6XMGOs+pxRmMJfV6xaTj7WFYJJl
	 L6EiHsgOukLqwHsLv7RjxvnpXlJJ7GeiKmtEZ0XbdobO6A+t1ucRhW+gpFqL9a4Uf2
	 rhzzsdgtf6Gdw==
Date: Fri, 4 Aug 2023 12:19:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, cardoe@cardoe.com, 
    andrew.cooper3@citrix.com, simone.ballarin@bugseng.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] automation: add missing "needs"
In-Reply-To: <c2a229d2-8df0-8ca3-1484-f3da55b988f1@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308041219120.2127516@ubuntu-linux-20-04-desktop>
References: <20230804011018.2888869-1-sstabellini@kernel.org> <c2a229d2-8df0-8ca3-1484-f3da55b988f1@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Aug 2023, Michal Orzel wrote:
> On 04/08/2023 03:10, Stefano Stabellini wrote:
> > 
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > The test artifacts export jobs don't need prerequisites, so we should
> > specify "needs" with an empty array for them. That way, they are not
> > going to fruitlessly wait for previous jobs (ECLAIR jobs) to complete
> > before continuing.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

> Looking at the whole pipeline, I can see that now only ECLAIR jobs do not specify needs.
> Shouldn't we also add "needs: []" for them?

Yes it could be good for consistency and future-proofness, but
technically it is not required now because the ECLAIR jobs come first.

