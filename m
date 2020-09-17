Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E626D802
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 11:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIqVE-0003OD-Ej; Thu, 17 Sep 2020 09:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shEK=C2=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1kIqVD-0003O8-Hv
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 09:46:55 +0000
X-Inumbo-ID: d6e65f82-bae5-4237-804e-e54c97f15158
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d6e65f82-bae5-4237-804e-e54c97f15158;
 Thu, 17 Sep 2020 09:46:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD86912FC;
 Thu, 17 Sep 2020 02:46:53 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 136903F68F;
 Thu, 17 Sep 2020 02:46:52 -0700 (PDT)
Subject: Re: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
 <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <da14d8f8-453a-9271-2803-2ffc85ca10ee@arm.com>
Date: Thu, 17 Sep 2020 10:46:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 17/09/2020 01:31, Stefano Stabellini wrote:

Hi,

> On Wed, 16 Sep 2020, Julien Grall wrote:
>> On 14/09/2020 15:26, Daniel Wagner2 wrote:
>>> Hi Julien,
>>
>> Hi Daniel,
>>
>> I am moving the thread to xen-devel and adding a couple of more folks.
>>
>>>>
>>>>>
>>>>> this is the full version of the fdt that threw the error:
>>>>> https://pastebin.com/63TZ9z3k
>>>>> The problematic memory node appears in line 126
>>>>
>>>> Thanks! The output looks corrupted as some of the lines are not valid DTB:
>>>>
>>>> fsl,pins = * 0x000000009300184c [0x00000048];
>>>>
>>>> Although, I am not sure if it is just U-boot dumping the DTB differently.
>>>>
>>>> Anyway, after removing the "corrupted" line, I managed to get a compile
>>> the
>>>> DTB. I don't have a Colibri IMX8QXP. However, given this is an early
>>> parsing
>>>> error, I have just embed the DTB in Xen binary via CONFIG_DTB_FILE.
>>>>
>>>> Unfortunately I couldn't reproduce your error. This either suggests the
>>> DTB gets
>>>> corrupted or Xen doesn't access the DTB with the correct memory attribute.
>>>>
>>>> Do you have the DTB in hand?
>>>
>>> Sorry for the corrupted version, I've uploaded the DTB
>>> (fsl-imx8qxp-colibri-eval-v3.dtb) to
>>> https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6?usp
>>> =sharing
>>>
>>> I have also uploaded my modified xen source files.
>>> 1. arch/arm/bootfdt.c
>>> where I have added the additional printk's seen in the log and
>>> 2. arch/arm/setup.c
>>> where I rerun the devicetree parser in line 935 to get the logs, since the
>>> console is not yet initialised when the function is called for the first
>>> time and I
>>> didn't manage to enable earlyprintk.
>>>
>>> I think the breaking point is the second memory bank which appears in the
>>> logs (see the output line marked with "!!")  with start=0x8 8000 0000 and
>>> size=0.
>>> It isn't specified in the DTB, so I am not sure where this comes from.
>>> It has size=0 so
>>> if ( !size )
>>>      {
>>>          printk("invalid size, bank %d\n",i);
>>>          return -EINVAL;
>>>      }
>>> In bootfdt.c makes the function stop.
>>>
>>> Log:
>>> (XEN) arch/arm/bootfdt.c: early_scan_node
>>> (XEN) -> fdt: node `memory@80000000': parsing
>>> (XEN) -> process_memory_node
>>> (XEN)
>>> (XEN) arch/arm/bootfdt.c: process_memory_node
>>> (XEN) ->found memory:reg
>>> (XEN) ->cell=
>>> (XEN) ->banks=2
>>> (XEN) ->mem->nr_banks=1
>>> (XEN) ->NR_MEM_BANKS=128
>>> (XEN) ->start=0x80200000 size=0x7fe00000
>>> !! (XEN) ->start=0x880000000 size=0
>>> (XEN) invalid size, bank 1
>>> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>>
>> When I tried to run it on the model I get:
>>
>> (XEN) device_tree_for_each_node: memory@80000000
>> (XEN)
>> (XEN) arch/arm/bootfdt.c: early_scan_node
>> (XEN) -> fdt: node `memory@80000000': parsing
>> (XEN) -> process_memory_node
>> (XEN)
>> (XEN) arch/arm/bootfdt.c: process_memory_node
>> (XEN) ->found memory:reg
>> (XEN) ->cell=
>> (XEN) ->banks=1
>> (XEN) ->mem->nr_banks=0
>> (XEN) ->NR_MEM_BANKS=128
>> (XEN) ->start=0x80000000 size=0x40000000
>> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>>
>>>
>>> Btw 8_8000_0000 is the start address of this systems DDR Main memory,
>>> according to the Reference Manual of the i.MX8QXP.
>> I couldn't find this value in the DT. It is possible that U-boot is modifying
>> the memory node before jumping to Xen (or Linux).

U-Boot almost always rewrites the memory node, filling in its own view
of DRAM. It's actually not that easy to avoid that.
This is in U-Boot's colibri-imx8x.h:
#define CONFIG_SYS_SDRAM_BASE           0x80000000
#define PHYS_SDRAM_1                    0x80000000
#define PHYS_SDRAM_2                    0x880000000
#define PHYS_SDRAM_1_SIZE               SZ_2G           /* 2 GB */
#define PHYS_SDRAM_2_SIZE               0x00000000      /* 0 GB */

The Colibri iMX8X SoM seems to support "Up to 2GB LPDDR4", so not sure
why we have the upper memory here at all. It could just set
CONFIG_NR_DRAM_BANKS to 1 and be done. But anyway ...

>> Looking at Linux, they seem to ignore any bank with size == 0. I am starting
>> to wonder whether your DT is (ab)using it.
>>
>> Do you have Linux running on baremetal on this board? If so would you mind to
>> dump the DT from the userspace (via /proc/device-tree) this time?
>>
>> In any case, we may want to relax the check in Xen. Any opinions?
> 
> Yeah, ignoring a bank with size=0 is fine. I checked the epapr and it

Not sure you meant this, but the official DT spec replaced ePAPR for a
while now: https://www.devicetree.org/specifications/
It has been heavily updated and even got some bug fixes.

> doesn't specify that size=0 is invalid, so I think it is actually better
> to ignore it and continue even from a spec perspective.

Yeah, I don't see any harm as well with ignoring 0 sized banks.

Just not sure if that has any implication with the number of memory
banks that Xen wants to deal with (it if counts two, but there is only
one valid one).

Cheers,
Andre

