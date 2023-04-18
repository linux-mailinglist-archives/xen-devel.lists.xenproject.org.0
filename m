Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD356E6B53
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 19:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523021.812756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popNP-0006xH-BI; Tue, 18 Apr 2023 17:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523021.812756; Tue, 18 Apr 2023 17:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popNP-0006uz-6q; Tue, 18 Apr 2023 17:44:23 +0000
Received: by outflank-mailman (input) for mailman id 523021;
 Tue, 18 Apr 2023 17:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l0Ed=AJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1popNO-0006ut-1O
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 17:44:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4dbb4cd-de10-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 19:44:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A99D6379A;
 Tue, 18 Apr 2023 17:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67801C433D2;
 Tue, 18 Apr 2023 17:44:16 +0000 (UTC)
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
X-Inumbo-ID: a4dbb4cd-de10-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681839857;
	bh=YHktAOKFRbBnAqDNEvIzBF7nkKCUyfWRhBgJqb2pazg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZiZ3a+gBgJSu9TVaAuk8otdSKY1zaPb7fVt6Q3yU74MFlQV4blalTvDP/2fygbznP
	 NNjn5+9q5e2oB7CQczPfxiogOUAzChIM1JjEWox6KyeoIrV0GsRTL+YXREDw9DrGsp
	 P5ApsxF+gHK2UahFdaRCRAESm/aaGWLmDhU2Xt08icor274r0D5VMouyFWpa6vGN3C
	 ZZmd1FrJ9nhXpPBTrYsdQQWx9DgfADg0TRiNHPmuy7JcXpNxWEvdyK9e33XUXBe8mD
	 8MTpD7Dt1pcP2BBuHsEa9BJZqS3gXjhb0lLzffxkN6XGa4ZMnUlgdYYjmUiasrRJx8
	 kAPrbJleguSPQ==
Date: Tue, 18 Apr 2023 10:44:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>, michal.orzel@amd.com
Subject: Re: xen cache colors in ARM
In-Reply-To: <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com> <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com> <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> Hi Julien,
> 
> >> This feature has not been merged in Xen upstream yet
> 
> > would assume that upstream + the series on the ML [1] work
> 
> Please clarify this point.
> Because the two thoughts are controversial.

Hi Oleg,

As Julien wrote, there is nothing controversial. As you are aware,
Xilinx maintains a separate Xen tree specific for Xilinx here:
https://github.com/xilinx/xen

and the branch you are using (xlnx_rebase_4.16) comes from there.


Instead, the upstream Xen tree lives here:
https://xenbits.xen.org/gitweb/?p=xen.git;a=summary


The Cache Coloring feature that you are trying to configure is present
in xlnx_rebase_4.16, but not yet present upstream (there is an
outstanding patch series to add cache coloring to Xen upstream but it
hasn't been merged yet.)


Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
you as you already have Cache Coloring as a feature there.


I take you are using ImageBuilder to generate the boot configuration? If
so, please post the ImageBuilder config file that you are using.

But from the boot message, it looks like the colors configuration for
Dom0 is incorrect.

