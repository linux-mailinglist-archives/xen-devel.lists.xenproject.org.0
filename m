Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE56E5CBA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522664.812156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohBx-0005E3-JS; Tue, 18 Apr 2023 09:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522664.812156; Tue, 18 Apr 2023 09:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohBx-0005Ad-F8; Tue, 18 Apr 2023 09:00:01 +0000
Received: by outflank-mailman (input) for mailman id 522664;
 Tue, 18 Apr 2023 09:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VaWE=AJ=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1pohBv-0005AX-Uw
 for xen-devel@lists.xen.org; Tue, 18 Apr 2023 08:59:59 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 645f1f92-ddc7-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 10:59:57 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pohBs-0007jm-GL; Tue, 18 Apr 2023 08:59:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.26.51]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pohBs-0005Na-9K; Tue, 18 Apr 2023 08:59:56 +0000
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
X-Inumbo-ID: 645f1f92-ddc7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=m+ZrO9nhwpVQLFDKyx6aOZTYNCTiQ++joqo9YEZCgws=; b=TNVCFat8TogxQvgIJbxMq49lXD
	MOrRvTMpqz3geYKdvJ8FF34kAK53IrBZ6L9g+MJnZp61F7IyVrkuSnpEPxqr8sNyplEhhErgjd4Mt
	VMT/VyXG8imPlgfoK/iYiTZHRE7hWVm72762eEbcdf2iYdCoP8t4SsbpMkUq5gJGdnuA=;
Message-ID: <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org>
Date: Tue, 18 Apr 2023 09:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
To: Oleg Nikitenko <oleshiiwood@gmail.com>, xen-devel@lists.xen.org
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Stefano, + Bertrand, +Carlo,

On 18/04/2023 09:43, Oleg Nikitenko wrote:
> Hello,

Hi,

> I tried to turn on this scheme and ran into panic.
> Where was I wrong ?

This feature has not been merged in Xen upstream yet. So can you tell us 
what patches did you apply or which tree?

> 
> Xen command line
> xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M
> dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
> timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";

Can you provide the following information:
  * HW
  * Where are the banks located?
  * Where do you load the various modules (e.g. kernel, xen...)?

> 
> Xen config color build settings
> CONFIG_COLORING=y
> 
> Xen log:
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Coloring general information
> (XEN) Way size: 64kB
> (XEN) Max. number of colors available: 16
> (XEN) Xen color(s): [ 0 ]
> (XEN) alternatives: Patching with alt table 00000000002cc690 ->
> 00000000002ccc0c
> (XEN) Color array allocation failed for dom0
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Error creating domain 0
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...

Cheers,

-- 
Julien Grall

