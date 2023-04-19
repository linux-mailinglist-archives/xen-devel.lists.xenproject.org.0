Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B456E8252
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 22:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523792.814189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE3D-00076i-W7; Wed, 19 Apr 2023 20:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523792.814189; Wed, 19 Apr 2023 20:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE3D-00073w-ST; Wed, 19 Apr 2023 20:05:11 +0000
Received: by outflank-mailman (input) for mailman id 523792;
 Wed, 19 Apr 2023 20:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ppE3C-00073q-L6
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 20:05:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4f374e-deed-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 22:05:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FFAE6135A;
 Wed, 19 Apr 2023 20:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A254C433D2;
 Wed, 19 Apr 2023 20:05:05 +0000 (UTC)
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
X-Inumbo-ID: 7b4f374e-deed-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681934706;
	bh=skettEFhn5mLTCfTNgZ5V3AOrv9yC9N0PC6N1/XXApA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pClq4ub2UWdWgmvOXlN4pPFqHJKJ72tJbCC3xIpyGU7VStfHCv1lfdeSnwpTiSpDV
	 1hqqzuDztb3kYpfnrI6MkpzfwntbX/tJbAHXsqZWyj9xCd78OWCKKjqR7JDHZURNU1
	 qSRO1Num4chsJu3GkNp2vOydMoJpZBTCPgJETrARze9xgaNystidjOonrhd7Sbh4WR
	 tbKESFZZ80WhfU+6Y+yoWAO3gPEd/2+FhPRLE8e5B3yoWdq0ha7IshwyaNjtgF4c7J
	 AlEXBfiaVJdkzDfqypbGJP3MPoYttIQ6C/bW27MXGzGieS365abEhctdX3OdbBgRmh
	 1oBVHT0KrCmDQ==
Date: Wed, 19 Apr 2023 13:05:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: Re: xen cache colors in ARM
In-Reply-To: <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com> <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com> <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com> <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop> <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com> <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-133349997-1681934706=:15580"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-133349997-1681934706=:15580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
> Hi Michal,
> 
> I corrected xen's command line.
> Now it is
> xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
> timer_slop=0 way_size=65536 xen_colors=0-3 dom0_colors=4-7";

4 colors is way too many for xen, just do xen_colors=0-0. There is no
advantage in using more than 1 color for Xen.

4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.
Each color is 256M. For 1600M you should give at least 7 colors. Try:

xen_colors=0-0 dom0_colors=1-8



> Unfortunately the result was the same.
> 
> (XEN)  - Dom0 mode: Relaxed
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Coloring general information
> (XEN) Way size: 64kB
> (XEN) Max. number of colors available: 16
> (XEN) Xen color(s): [ 0 ]
> (XEN) alternatives: Patching with alt table 00000000002cc690 -> 00000000002ccc0c
> (XEN) Color array allocation failed for dom0
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Error creating domain 0
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> I am going to find out how command line arguments passed and parsed.
> 
> Regards,
> Oleg
> 
> ср, 19 апр. 2023 г. в 11:25, Oleg Nikitenko <oleshiiwood@gmail.com>:
>       Hi Michal,
> 
> You put my nose into the problem. Thank you.
> I am going to use your point.
> Let's see what happens.
> 
> Regards,
> Oleg
> 
> 
> ср, 19 апр. 2023 г. в 10:37, Michal Orzel <michal.orzel@amd.com>:
>       Hi Oleg,
> 
>       On 19/04/2023 09:03, Oleg Nikitenko wrote:
>       >       
>       >
>       >
>       > Hello Stefano,
>       >
>       > Thanks for the clarification.
>       > My company uses yocto for image generation.
>       > What kind of information do you need to consult me in this case ?
>       >
>       > Maybe modules sizes/addresses which were mentioned by @Julien Grall <mailto:julien@xen.org> ?
> 
>       Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be not the one
>       Xen booted with. The error you are observing most likely is due to dom0 colors configuration not being
>       specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you provided, this parameter
>       is set, I strongly doubt that this is the actual command line in use.
> 
>       You wrote:
>       xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native
>       sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
> 
>       but:
>       1) way_szize has a typo
>       2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
>       (XEN) Xen color(s): [ 0 ]
> 
>       This makes me believe that no colors configuration actually end up in command line that Xen booted with.
>       Single color for Xen is a "default if not specified" and way size was probably calculated by asking HW.
> 
>       So I would suggest to first cross-check the command line in use.
> 
>       ~Michal
> 
> 
>       >
>       > Regards,
>       > Oleg
>       >
>       > вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
>       >
>       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>       >     > Hi Julien,
>       >     >
>       >     > >> This feature has not been merged in Xen upstream yet
>       >     >
>       >     > > would assume that upstream + the series on the ML [1] work
>       >     >
>       >     > Please clarify this point.
>       >     > Because the two thoughts are controversial.
>       >
>       >     Hi Oleg,
>       >
>       >     As Julien wrote, there is nothing controversial. As you are aware,
>       >     Xilinx maintains a separate Xen tree specific for Xilinx here:
>       >     https://github.com/xilinx/xen <https://github.com/xilinx/xen>
>       >
>       >     and the branch you are using (xlnx_rebase_4.16) comes from there.
>       >
>       >
>       >     Instead, the upstream Xen tree lives here:
>       >     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>
>       >
>       >
>       >     The Cache Coloring feature that you are trying to configure is present
>       >     in xlnx_rebase_4.16, but not yet present upstream (there is an
>       >     outstanding patch series to add cache coloring to Xen upstream but it
>       >     hasn't been merged yet.)
>       >
>       >
>       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>       >     you as you already have Cache Coloring as a feature there.
>       >
>       >
>       >     I take you are using ImageBuilder to generate the boot configuration? If
>       >     so, please post the ImageBuilder config file that you are using.
>       >
>       >     But from the boot message, it looks like the colors configuration for
>       >     Dom0 is incorrect.
>       >
> 
> 
> 
--8323329-133349997-1681934706=:15580--

