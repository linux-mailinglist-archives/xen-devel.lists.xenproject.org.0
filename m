Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E97948E27
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 13:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772854.1183297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIiC-0001K8-Dv; Tue, 06 Aug 2024 11:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772854.1183297; Tue, 06 Aug 2024 11:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIiC-0001Hk-AY; Tue, 06 Aug 2024 11:50:44 +0000
Received: by outflank-mailman (input) for mailman id 772854;
 Tue, 06 Aug 2024 11:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbIiB-0001Hc-05
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 11:50:43 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178c0f6d-53ea-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 13:50:39 +0200 (CEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476BoQcq016373;
 Tue, 6 Aug 2024 06:50:26 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476BoQ4R009825
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 06:50:26 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 06:50:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 06:50:25 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476BoPT0044809;
 Tue, 6 Aug 2024 06:50:25 -0500
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
X-Inumbo-ID: 178c0f6d-53ea-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722945026;
	bh=ITZ380bjRYsLPXZoSRvWEuPfymBXO69Wp3tIMO2jzbw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fPAe0u17Z6+xcan208mN66WJNiurIRk/JZ8wq+HALXEudB3UvNyE/+v3FfLqfH1oH
	 vB1qwonTvneXh/qietZdqM1Wr4KNou76xSTzfKyBicX7KwarqR1OQDHRPVmRIC1x04
	 nCheLhder0KqdbnDImvKrPY5QV1UPn8VyWFmhEmQ=
Date: Tue, 6 Aug 2024 17:20:24 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Message-ID: <pm2tulzvwuexw6stt2gx6nxbhnmqy36tbswde7j26wtq3x6wob@hyxxarp32or5>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
 <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
 <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
 <csvohhbfi7ilqjzmozhb7u75jp7kfncpyj335hz5vksjw7lr46@57puayor4b4r>
 <ff6a7077-efbb-4002-9426-a9f05760f8f8@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ff6a7077-efbb-4002-9426-a9f05760f8f8@xen.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi

On 12:08-20240806, Julien Grall wrote:
> Hi,
> 
> On 06/08/2024 11:35, Amneesh Singh wrote:
> > On 10:56-20240806, Julien Grall wrote:
> >> On 06/08/2024 10:50, Amneesh Singh wrote:
> >>> On 10:16-20240806, Julien Grall wrote:
> >>>> Hi,
> >>>>
> >>>> On 19/07/2024 12:33, Amneesh Singh wrote:
> >>>>> Quite a few TI K3 devices do not have clock-frequency specified in their
> >>>>> respective UART nodes.
> >>>>
> >>>> Can you outline why fixing the device-tree is not solution?
> >>> Because other frequencies, say 96MHz or 192 MHz are also valid inputs.
> >>
> >> Are you saying this is configurable by the user? Or do you mean the
> >> firmware can configure it?
> > u-boot or some other bootloader are free to configure it. And usually,
> > linux's clock driver will pick it up using clk_get_rate (if not
> > specified in the DT), I think. Now, in case we add the frequency to the
> > DT, it may not match with the actual frequency configured before Xen
> > initialisation. Since, there is no equivalent to clk_get_rate under Xen,
> > and the fact I'm using imagebuilder, I found it easier to pass the
> > frequency the way I did.
> 
> Thanks for the explanation. I haven't looked in details, but how
> difficult would it be to implement clk_get_rate() (at least just enough
> to work for the UART) in Xen?
To be honest, I have no idea, I am not at all familiar with linux's
clock API. I just did this to get UART to work under Xen.
> >>>>
> >>>>> However hard-coding the frequency is not a
> >>>>    > solution as the function clock input can differ between SoCs.
> >>>>
> >>>> Can you provide some details how Linux is handling those SoCs?
> >>> Yes, like omap-uart under xen, the 8250_omap driver also parses the DT,
> >>> but unlike omap-uart, falls back to clk_get_rate() and if the value is
> >>> still zero, it defaults to 48MHz.
> >>
> >> Thanks for the information. Then my next question is why Linux can get
> >> away with a default value and not Xen?
> > Sure why not? I guess, we can use a default value if everything fails
> > but there should still be a way for the user to specify the frequency.
> 
> I think I am still missing something. Why would Xen allow the user to
> specify the clock speed if Linux doesn't? At least to me, it is more
> likely that a user would want to boot Linux on your HW than Xen...
That was not worded correctly, apologies. What I meant was a way for
the user to specify it since apart from DT, unlike linux, there is no
way for Xen to determine the frequency other than using default of
course.
> 
> > Of course, we can instead just force the user to change the DT slightly
> > by just specifying the frequency. However, I feel it is easier to add it
> > here, especially when there's already a method to pass these options via
> > the command-line in place.
>  > I believe, this is the best we can do with this.
> 
> The problem is the command line is OS/hypervisor specific. But the
> problem you describe doesn't seem Xen specific. This is where the DT is
> handy because you describe once and it can be used everywhere.
> 
> Overall, at the moment, I don't think the command line option is the
> right approach. If I am not mistaken, it would make Xen less
> user-friendly (compare to Linux) to boot on your HW as the user would
You are correct that it's an extra step, but curently, it's either
specifying it in the bootarg or specifying in the DT. Both are the
things that the user would have to do. I just went with what was easier
for me as a user. It is pretty similar to the current com1/com2
interface anyway.

> need to specify the clockspeed on the command line. I think we should
> investigate other approaches such as implementing partially
> clk_get_rate() (if this is how Linux manage to retrieve the clock speed
> without any command line option).
I guess, we can just ditch the entire idea, and just use the a default
fallback and just print a message informing the user that there is no
frequency in the DT. I do not think implementing clk_get_rate (or any
clock API) is feasible or worth the effort to be completely honest.
What do you think? I do not particularly have any issues with that. I 
feel like this is a niche case (at least now) anyway.
> 
> Cheers,
> 
> --
> Julien Grall
> 
>

Regards
Amneesh

