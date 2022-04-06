Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6074F56F7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299675.510740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0UE-0006Q6-Pq; Wed, 06 Apr 2022 07:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299675.510740; Wed, 06 Apr 2022 07:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0UE-0006O1-Mp; Wed, 06 Apr 2022 07:53:54 +0000
Received: by outflank-mailman (input) for mailman id 299675;
 Wed, 06 Apr 2022 07:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUIs=UQ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nc0UD-0006Nu-I3
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:53:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b26c940f-b57e-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 09:53:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 137D323A;
 Wed,  6 Apr 2022 00:53:51 -0700 (PDT)
Received: from [10.57.6.245] (unknown [10.57.6.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6443A3F718;
 Wed,  6 Apr 2022 00:53:48 -0700 (PDT)
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
X-Inumbo-ID: b26c940f-b57e-11ec-8fbc-03012f2f19d4
Message-ID: <44d035c4-f2ff-b726-ed67-5c09d472ccde@arm.com>
Date: Wed, 6 Apr 2022 09:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>
References: <20220402054223.10304-1-peng.fan@oss.nxp.com>
 <20220402054223.10304-2-peng.fan@oss.nxp.com>
 <fd4b0cc7-3cb9-3f56-5db7-31d41b24611c@arm.com>
 <DU0PR04MB9417FBA3876918C0FD7F187188E79@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <DU0PR04MB9417FBA3876918C0FD7F187188E79@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.04.2022 09:39, Peng Fan wrote:
>> Subject: Re: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
>>
>> Hi Peng,
>>
>> On 02.04.2022 07:42, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> The i.MX LPUART Documentation:
>>>
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
>>>
>> nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8QMIEC&amp;data=0
>> 4%7C01%7Cp
>>>
>> eng.fan%40nxp.com%7Cc7d221ce800342bbd7c108da179e72ca%7C686ea1d
>> 3bc2b4c6
>>>
>> fa92cd99c5c301635%7C0%7C1%7C637848266543058498%7CUnknown%7C
>> TWFpbGZsb3d
>>>
>> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
>> 3D%7C
>>>
>> 3000&amp;sdata=3CV%2FoJViSFzqRby0h577SiusHRQnC8KiXscntQW%2BZOs
>> %3D&amp;
>>> reserved=0 Chatper 13.6 Low Power Universal Asynchronous Receiver/
>>> Transmitter (LPUART)
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>  xen/drivers/char/Kconfig      |   8 +
>>>  xen/drivers/char/Makefile     |   1 +
>>>  xen/drivers/char/imx-lpuart.c | 275
>>> ++++++++++++++++++++++++++++++++++
>>>  xen/include/xen/imx-lpuart.h  |  64 ++++++++
>>>  4 files changed, 348 insertions(+)
>>>  create mode 100644 xen/drivers/char/imx-lpuart.c  create mode
>> 100644
>>> xen/include/xen/imx-lpuart.h
>>>
>>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig index
>>> 2ff5b288e2..0efdb2128f 100644
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>>>  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>>>  	  based board, say Y.
>>>
>>> +config HAS_IMX_LPUART
>>> +	bool "i.MX LPUART driver"
>>> +	default y
>>> +	depends on ARM_64
>>> +	help
>>> +	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
>>> +	  say Y.
>> Why did you move "say Y" to the next line?
> 
> I configured vimrc with " set cc=75,100 ", the "." will be at 80, so I
> move "say Y." to next line.
> 
It won't be at 80 but at 77 which is less than 80 (required by CODING_STYLE)
unless you found a requirement to split lines in Kconfig files at 75.

Cheers,

