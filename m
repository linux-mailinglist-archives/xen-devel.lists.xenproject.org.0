Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B16ED645
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525608.816881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr2ye-0001xl-GT; Mon, 24 Apr 2023 20:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525608.816881; Mon, 24 Apr 2023 20:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr2ye-0001uv-CK; Mon, 24 Apr 2023 20:40:00 +0000
Received: by outflank-mailman (input) for mailman id 525608;
 Mon, 24 Apr 2023 20:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3T1=AP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr2yc-0001up-D1
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:39:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b532cee-e2e0-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:39:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDED261B22;
 Mon, 24 Apr 2023 20:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55934C433D2;
 Mon, 24 Apr 2023 20:39:52 +0000 (UTC)
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
X-Inumbo-ID: 2b532cee-e2e0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682368793;
	bh=qLIRSD0Y/Jg+pFreHba21RLW+7JMAMNvvTDYgDgsZwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YFZ4y/Brf51EZVDAExxH/35yc3CbkeQ4kh0G3/mkU4zY3FL4w+wgoi/JKVtxtvQbd
	 TqIMOx+W7/POg8YrylISeijGE/cWL4Tm/8BJhpEcutbDcChkFLiYKcfchfpIPsEgJo
	 EA2rvTKOmfPnFapC3eVu20etwlD+H+pDVcveN7XGIXGZaM6R+H1UoUXVLuTpsvKwgN
	 0pCUhxP67lueO+4WZSOg5PuRWnfYYcIRi0tJzsiQCn9xsjkCkRcnbnu/I0rJM86Ihq
	 xUtqyt5PjVEIBpI9++K08CTWF47kbPhGWIN/VCAmTr9Y/EdQrulHZs3c3jZc9AzUHF
	 1u1f3Fj8/FVSA==
Date: Mon, 24 Apr 2023 13:39:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: Re: xen cache colors in ARM
In-Reply-To: <CA+SAi2uBmnUA0Z=+Ji_jaoOGjS8H8ea1_aRuRm=_B89oidxHCA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2304241337280.3419@ubuntu-linux-20-04-desktop>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com> <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop> <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com> <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com> <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com> <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com> <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com> <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com>
 <CA+SAi2upd1P=KzbQS2BpD5zr3+OA=mrq7JiC7Zou9XSEJ_OYhA@mail.gmail.com> <43f5fdaa-47c7-6ec9-c477-dac62a5bceae@amd.com> <CA+SAi2uBmnUA0Z=+Ji_jaoOGjS8H8ea1_aRuRm=_B89oidxHCA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-150838559-1682368793=:3419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-150838559-1682368793=:3419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Oleg, 

Here is the issue from your logs:

SError Interrupt on CPU0, code 0xbe000000 -- SError

SErrors are special signals to notify software of serious hardware
errors.  Something is going very wrong. Defective hardware is a
possibility.  Another possibility if software accessing address ranges
that it is not supposed to, sometimes it causes SErrors.

Cheers,

Stefano



On Mon, 24 Apr 2023, Oleg Nikitenko wrote:

> Hello,
> 
> Thanks guys.
> I found out where the problem was.
> Now dom0 booted more. But I have a new one.
> This is a kernel panic during Dom0 loading.
> Maybe someone is able to suggest something ?
> 
> Regards,
> O.
> 
> [    3.771362] sfp_register_bus: upstream ops attach
> [    3.776119] sfp_register_bus: Bus registered
> [    3.780459] sfp_register_socket: register sfp_bus succeeded
> [    3.789399] of_cfs_init
> [    3.789499] of_cfs_init: OK
> [    3.791685] clk: Not disabling unused clocks
> [   11.010355] SError Interrupt on CPU0, code 0xbe000000 -- SError
> [   11.010380] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
> [   11.010393] Workqueue: events_unbound async_run_entry_fn
> [   11.010414] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   11.010422] pc : simple_write_end+0xd0/0x130
> [   11.010431] lr : generic_perform_write+0x118/0x1e0
> [   11.010438] sp : ffffffc00809b910
> [   11.010441] x29: ffffffc00809b910 x28: 0000000000000000 x27: ffffffef69ba88c0
> [   11.010451] x26: 0000000000003eec x25: ffffff807515db00 x24: 0000000000000000
> [   11.010459] x23: ffffffc00809ba90 x22: 0000000002aac000 x21: ffffff807315a260
> [   11.010472] x20: 0000000000001000 x19: fffffffe02000000 x18: 0000000000000000
> [   11.010481] x17: 00000000ffffffff x16: 0000000000008000 x15: 0000000000000000
> [   11.010490] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [   11.010498] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [   11.010507] x8 : 0000000000000000 x7 : ffffffef693ba680 x6 : 000000002d89b700
> [   11.010515] x5 : fffffffe02000000 x4 : ffffff807315a3c8 x3 : 0000000000001000
> [   11.010524] x2 : 0000000002aab000 x1 : 0000000000000001 x0 : 0000000000000005
> [   11.010534] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
> [   11.010545] Hardware name: D14 Viper Board - White Unit (DT)
> [   11.010548] Workqueue: events_unbound async_run_entry_fn
> [   11.010556] Call trace:
> [   11.010558]  dump_backtrace+0x0/0x1c4
> [   11.010567]  show_stack+0x18/0x2c
> [   11.010574]  dump_stack_lvl+0x7c/0xa0
> [   11.010583]  dump_stack+0x18/0x34
> [   11.010588]  panic+0x14c/0x2f8
> [   11.010597]  print_tainted+0x0/0xb0
> [   11.010606]  arm64_serror_panic+0x6c/0x7c
> [   11.010614]  do_serror+0x28/0x60
> [   11.010621]  el1h_64_error_handler+0x30/0x50
> [   11.010628]  el1h_64_error+0x78/0x7c
> [   11.010633]  simple_write_end+0xd0/0x130
> [   11.010639]  generic_perform_write+0x118/0x1e0
> [   11.010644]  __generic_file_write_iter+0x138/0x1c4
> [   11.010650]  generic_file_write_iter+0x78/0xd0
> [   11.010656]  __kernel_write+0xfc/0x2ac
> [   11.010665]  kernel_write+0x88/0x160
> [   11.010673]  xwrite+0x44/0x94
> [   11.010680]  do_copy+0xa8/0x104
> [   11.010686]  write_buffer+0x38/0x58
> [   11.010692]  flush_buffer+0x4c/0xbc
> [   11.010698]  __gunzip+0x280/0x310
> [   11.010704]  gunzip+0x1c/0x28
> [   11.010709]  unpack_to_rootfs+0x170/0x2b0
> [   11.010715]  do_populate_rootfs+0x80/0x164
> [   11.010722]  async_run_entry_fn+0x48/0x164
> [   11.010728]  process_one_work+0x1e4/0x3a0
> [   11.010736]  worker_thread+0x7c/0x4c0
> [   11.010743]  kthread+0x120/0x130
> [   11.010750]  ret_from_fork+0x10/0x20
> [   11.010757] SMP: stopping secondary CPUs
> [   11.010784] Kernel Offset: 0x2f61200000 from 0xffffffc008000000
> [   11.010788] PHYS_OFFSET: 0x0
> [   11.010790] CPU features: 0x00000401,00000842
> [   11.010795] Memory Limit: none
> [   11.277509] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> пт, 21 апр. 2023 г. в 15:52, Michal Orzel <michal.orzel@amd.com>:
>       Hi Oleg,
> 
>       On 21/04/2023 14:49, Oleg Nikitenko wrote:
>       >       
>       >
>       >
>       > Hello Michal,
>       >
>       > I was not able to enable earlyprintk in the xen for now.
>       > I decided to choose another way.
>       > This is a xen's command line that I found out completely.
>       >
>       > (XEN) $$$$ console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
>       timer_slop=0
>       Yes, adding a printk() in Xen was also a good idea.
> 
>       >
>       > So you are absolutely right about a command line.
>       > Now I am going to find out why xen did not have the correct parameters from the device tree.
>       Maybe you will find this document helpful:
>       https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt
> 
>       ~Michal
> 
>       >
>       > Regards,
>       > Oleg
>       >
>       > пт, 21 апр. 2023 г. в 11:16, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
>       >
>       >
>       >     On 21/04/2023 10:04, Oleg Nikitenko wrote:
>       >     >       
>       >     >
>       >     >
>       >     > Hello Michal,
>       >     >
>       >     > Yes, I use yocto.
>       >     >
>       >     > Yesterday all day long I tried to follow your suggestions.
>       >     > I faced a problem.
>       >     > Manually in the xen config build file I pasted the strings:
>       >     In the .config file or in some Yocto file (listing additional Kconfig options) added to SRC_URI?
>       >     You shouldn't really modify .config file but if you do, you should execute "make olddefconfig" afterwards.
>       >
>       >     >
>       >     > CONFIG_EARLY_PRINTK
>       >     > CONFIG_EARLY_PRINTK_ZYNQMP
>       >     > CONFIG_EARLY_UART_CHOICE_CADENCE
>       >     I hope you added =y to them.
>       >
>       >     Anyway, you have at least the following solutions:
>       >     1) Run bitbake xen -c menuconfig to properly set early printk
>       >     2) Find out how you enable other Kconfig options in your project (e.g. CONFIG_COLORING=y that is not enabled by default)
>       >     3) Append the following to "xen/arch/arm/configs/arm64_defconfig":
>       >     CONFIG_EARLY_PRINTK_ZYNQMP=y
>       >
>       >     ~Michal
>       >
>       >     >
>       >     > Host hangs in build time. 
>       >     > Maybe I did not set something in the config build file ?
>       >     >
>       >     > Regards,
>       >     > Oleg
>       >     >
>       >     > чт, 20 апр. 2023 г. в 11:57, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >     >
>       >     >     Thanks Michal,
>       >     >
>       >     >     You gave me an idea.
>       >     >     I am going to try it today.
>       >     >
>       >     >     Regards,
>       >     >     O.
>       >     >
>       >     >     чт, 20 апр. 2023 г. в 11:56, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >     >
>       >     >         Thanks Stefano.
>       >     >
>       >     >         I am going to do it today.
>       >     >
>       >     >         Regards,
>       >     >         O.
>       >     >
>       >     >         ср, 19 апр. 2023 г. в 23:05, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>
>       <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
>       >     >
>       >     >             On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
>       >     >             > Hi Michal,
>       >     >             >
>       >     >             > I corrected xen's command line.
>       >     >             > Now it is
>       >     >             > xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin
>       bootscrub=0 vwfi=native sched=null
>       >     >             > timer_slop=0 way_size=65536 xen_colors=0-3 dom0_colors=4-7";
>       >     >
>       >     >             4 colors is way too many for xen, just do xen_colors=0-0. There is no
>       >     >             advantage in using more than 1 color for Xen.
>       >     >
>       >     >             4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.
>       >     >             Each color is 256M. For 1600M you should give at least 7 colors. Try:
>       >     >
>       >     >             xen_colors=0-0 dom0_colors=1-8
>       >     >
>       >     >
>       >     >
>       >     >             > Unfortunately the result was the same.
>       >     >             >
>       >     >             > (XEN)  - Dom0 mode: Relaxed
>       >     >             > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
>       >     >             > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
>       >     >             > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>       >     >             > (XEN) Coloring general information
>       >     >             > (XEN) Way size: 64kB
>       >     >             > (XEN) Max. number of colors available: 16
>       >     >             > (XEN) Xen color(s): [ 0 ]
>       >     >             > (XEN) alternatives: Patching with alt table 00000000002cc690 -> 00000000002ccc0c
>       >     >             > (XEN) Color array allocation failed for dom0
>       >     >             > (XEN)
>       >     >             > (XEN) ****************************************
>       >     >             > (XEN) Panic on CPU 0:
>       >     >             > (XEN) Error creating domain 0
>       >     >             > (XEN) ****************************************
>       >     >             > (XEN)
>       >     >             > (XEN) Reboot in five seconds...
>       >     >             >
>       >     >             > I am going to find out how command line arguments passed and parsed.
>       >     >             >
>       >     >             > Regards,
>       >     >             > Oleg
>       >     >             >
>       >     >             > ср, 19 апр. 2023 г. в 11:25, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >     >             >       Hi Michal,
>       >     >             >
>       >     >             > You put my nose into the problem. Thank you.
>       >     >             > I am going to use your point.
>       >     >             > Let's see what happens.
>       >     >             >
>       >     >             > Regards,
>       >     >             > Oleg
>       >     >             >
>       >     >             >
>       >     >             > ср, 19 апр. 2023 г. в 10:37, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>
>       <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>:
>       >     >             >       Hi Oleg,
>       >     >             >
>       >     >             >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
>       >     >             >       >       
>       >     >             >       >
>       >     >             >       >
>       >     >             >       > Hello Stefano,
>       >     >             >       >
>       >     >             >       > Thanks for the clarification.
>       >     >             >       > My company uses yocto for image generation.
>       >     >             >       > What kind of information do you need to consult me in this case ?
>       >     >             >       >
>       >     >             >       > Maybe modules sizes/addresses which were mentioned by @Julien Grall <mailto:julien@xen.org
>       <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>> ?
>       >     >             >
>       >     >             >       Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be not the
>       one
>       >     >             >       Xen booted with. The error you are observing most likely is due to dom0 colors configuration not
>       being
>       >     >             >       specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you provided, this
>       parameter
>       >     >             >       is set, I strongly doubt that this is the actual command line in use.
>       >     >             >
>       >     >             >       You wrote:
>       >     >             >       xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin
>       bootscrub=0 vwfi=native
>       >     >             >       sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
>       >     >             >
>       >     >             >       but:
>       >     >             >       1) way_szize has a typo
>       >     >             >       2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
>       >     >             >       (XEN) Xen color(s): [ 0 ]
>       >     >             >
>       >     >             >       This makes me believe that no colors configuration actually end up in command line that Xen booted
>       with.
>       >     >             >       Single color for Xen is a "default if not specified" and way size was probably calculated by asking
>       HW.
>       >     >             >
>       >     >             >       So I would suggest to first cross-check the command line in use.
>       >     >             >
>       >     >             >       ~Michal
>       >     >             >
>       >     >             >
>       >     >             >       >
>       >     >             >       > Regards,
>       >     >             >       > Oleg
>       >     >             >       >
>       >     >             >       > вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org
>       <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:sstabellini@kernel.org
>       <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>:
>       >     >             >       >
>       >     >             >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>       >     >             >       >     > Hi Julien,
>       >     >             >       >     >
>       >     >             >       >     > >> This feature has not been merged in Xen upstream yet
>       >     >             >       >     >
>       >     >             >       >     > > would assume that upstream + the series on the ML [1] work
>       >     >             >       >     >
>       >     >             >       >     > Please clarify this point.
>       >     >             >       >     > Because the two thoughts are controversial.
>       >     >             >       >
>       >     >             >       >     Hi Oleg,
>       >     >             >       >
>       >     >             >       >     As Julien wrote, there is nothing controversial. As you are aware,
>       >     >             >       >     Xilinx maintains a separate Xen tree specific for Xilinx here:
>       >     >             >       >     https://github.com/xilinx/xen <https://github.com/xilinx/xen> <https://github.com/xilinx/xen
>       <https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <https://github.com/xilinx/xen> <https://github.com/xilinx/xen
>       <https://github.com/xilinx/xen>>>
>       >     >             >       >
>       >     >             >       >     and the branch you are using (xlnx_rebase_4.16) comes from there.
>       >     >             >       >
>       >     >             >       >
>       >     >             >       >     Instead, the upstream Xen tree lives here:
>       >     >             >       >     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>>>
>       >     >             >       >
>       >     >             >       >
>       >     >             >       >     The Cache Coloring feature that you are trying to configure is present
>       >     >             >       >     in xlnx_rebase_4.16, but not yet present upstream (there is an
>       >     >             >       >     outstanding patch series to add cache coloring to Xen upstream but it
>       >     >             >       >     hasn't been merged yet.)
>       >     >             >       >
>       >     >             >       >
>       >     >             >       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>       >     >             >       >     you as you already have Cache Coloring as a feature there.
>       >     >             >       >
>       >     >             >       >
>       >     >             >       >     I take you are using ImageBuilder to generate the boot configuration? If
>       >     >             >       >     so, please post the ImageBuilder config file that you are using.
>       >     >             >       >
>       >     >             >       >     But from the boot message, it looks like the colors configuration for
>       >     >             >       >     Dom0 is incorrect.
>       >     >             >       >
>       >     >             >
>       >     >             >
>       >     >             >
>       >     >
>       >
> 
> 
> 
--8323329-150838559-1682368793=:3419--

