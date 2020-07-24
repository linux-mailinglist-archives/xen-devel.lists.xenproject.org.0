Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEACF22CC1C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:25:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1Rk-0006Ye-NW; Fri, 24 Jul 2020 17:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jz1Rj-0006YV-Es
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:25:23 +0000
X-Inumbo-ID: a77e8ba8-cdd2-11ea-8863-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a77e8ba8-cdd2-11ea-8863-bc764e2007e4;
 Fri, 24 Jul 2020 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jYMvCtLjkFi3+NHJYjdS2mDK6TqR9cJuhYfypiJ3erw=; b=kPS2tixcI04pWkhHd8CuFyMQ0C
 vFswrl6MEi2ALq428YSTpo9SbdXlY04LAqTsi0aiswSDSLmoWSyixgGAk0et3s1DmFm1uhLu2ICJ+
 ooZ6UI8rpJKBYtajpDeuX9Y17s4QjMoculSOK/6pIOf33URpT3VPmOnmlV1DPKqfTD60=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz1Rh-0005vD-Qp; Fri, 24 Jul 2020 17:25:21 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz1Rh-0003wy-G2; Fri, 24 Jul 2020 17:25:21 +0000
Subject: Re: Porting Xen to Jetson Nano
To: Srinivas Bangalore <srini@yujala.com>, xen-devel@lists.xenproject.org,
 'Christopher Clark' <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
Date: Fri, 24 Jul 2020 18:25:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000001d661cb$45cdaa10$d168fe30$@yujala.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/07/2020 16:01, Srinivas Bangalore wrote:
> Hi Julien,

Hello,

> 
> Thanks for the tips. Comments inline...

I struggled to find your comment inline as your e-mail client doesn't 
quote my answer. Please configure your e-mail client to use some form of 
quoting (the usual is '>').


> Here's the output, truncated since it goes into an infinite loop printing
> the same info:
> [..]
> (XEN) Allocating 1:1 mappings totalling 128MB for dom0:
> (XEN) BANK[0] 0x00000088000000-0x00000090000000 (128MB)
> (XEN) Grant table range: 0x000000fec00000-0x000000fec68000
> (XEN) Loading zImage from 00000000e1000000 to
> 0000000088080000-000000008a23c808
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading dom0 DTB to 0x000000008fe00000-0x000000008fe34444
> (XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs
> (XEN) ........done.
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) ***************************************************
> (XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
> (XEN) This option is intended to aid debugging of Xen by ensuring
> (XEN) that all output is synchronously delivered on the serial line.
> (XEN) However it can introduce SIGNIFICANT latencies and affect
> (XEN) timekeeping. It is NOT recommended for production use!
> (XEN) ***************************************************
> (XEN) 3... 2... 1...
> (XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to
> Xen)
> (XEN) Freed 296kB init memory.
> (XEN) dom0 IPA 0x0000000088080000
> (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> (XEN) 0TH[0x0] = 0x004000017f0f377f
> (XEN) 1ST[0x2] = 0x02c00000800006fd
> (XEN) Mem access check
> (XEN) dom0 IPA 0x0000000088080000
> (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
> (XEN) 0TH[0x0] = 0x004000017f0f377f
> (XEN) 1ST[0x2] = 0x02c00000800006fd
> (XEN) Mem access check

The instruction abort issue looks normal as the mapping is marked as 
non-executable.

Looking at the rest of bits, bits 55:58 indicates the type of mapping 
used. The value suggest the mapping has been considered to be used 
p2m_mmio_direct_c (RW cacheable MMIO). This looks wrong to me because 
RAM should be mapped using p2m_ram_rw.

Looking at your DT, it looks like the region is marked as reserved. On 
Xen 4.8, reserved-memory region are not correctly handled (IIRC this was 
only fixed in Xen 4.13). This should be possible to confirm by enable 
CONFIG_DEVICE_TREE_DEBUG in your .config.

The option will debug more information about the mapping to dom0 on your 
console.

However, given you are using an old release, you are at risk at keep 
finding bugs that have been resolved in more recent releases. It would 
probably better if you switch to Xen 4.14 and report any bug you can 
find there.

> 
> [..]
> 
> I added the printk for 'Mem access check' inside the 'case FSC_FLT_PERM' of
> the switch (fsc) code following the lookup. That's what you see in the
> output above.
> So it does seem like there's a memory access fault somehow.
>   
>>
>> (XEN)  HPFAR_EL2: 0000000000000000
>>
>> (XEN)    FAR_EL2: 00000000a0080000
>>
>> (XEN)
>>
>> (XEN) Guest stack trace from sp=0:
>>
>> (XEN)   Failed to convert stack to physical address
> 
> [...]
> 
>> It seems the DOM0 kernel did not get added to the task list….
> 
>   From a look at the dump, dom0 vCPU0 has been scheduled and running on
> pCPU0.
> 
>>
>> Boot args for Xen and Dom0 are here:
>> (XEN) Checking for initrd in /chosen
>>
>> (XEN) linux,initrd limits invalid: 0000000084100000 >=
>> 0000000084100000
>>
>> (XEN) RAM: 0000000080000000 - 00000000fedfffff
>>
>> (XEN) RAM: 0000000100000000 - 000000017f1fffff
>>
>> (XEN)
>>
>> (XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
>>
>> (XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel
>> console=hvc0 earlyprintk=xen earlycon=xen rootfstype=ext4 rw rootwait
>> root=/dev/mmcblk0p1 rdinit=/sbin/init
> 
> You want to use earlycon=xenboot here.
> 
>>
>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080020000
>>
>> (XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000
>>
>> (XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
>>
>> (XEN)
>>
>> (XEN) Command line: console=dtuart earlyprintk=xen
>> earlycon=uart8250,mmio32,0x70006000 sync_console dom0_mem=512M
>> log_lvl=all guest_loglvl=all console_to_ring
> 
> FWIW, earlyprintk and earlycon are not understood by Xen. They are only
> useful for Dom0.
> 
> BTW, to Christopher's point, the dtb did have some issues. I had to hack the
> 'interrupt-controller' node to get the GICv2 working.
> I have attached the .dts file that I'm using.

Best regards,

-- 
Julien Grall

