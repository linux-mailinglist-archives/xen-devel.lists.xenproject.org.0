Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9742C1302
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35114.66496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khGYa-0004Kf-N8; Mon, 23 Nov 2020 18:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35114.66496; Mon, 23 Nov 2020 18:27:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khGYa-0004KG-Jx; Mon, 23 Nov 2020 18:27:20 +0000
Received: by outflank-mailman (input) for mailman id 35114;
 Mon, 23 Nov 2020 18:27:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khGYZ-0004K8-GQ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:27:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khGYX-0007a9-VS; Mon, 23 Nov 2020 18:27:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khGYX-0003rA-Jg; Mon, 23 Nov 2020 18:27:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGYZ-0004K8-GQ
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=v8AYlSkV+k3q8JSiD8YvMwRTa5fXhluaknB6u6qK634=; b=LvHzQOnPsJEjHZwEzfec+omYV4
	QCmj/yex+J0N13O5i7EOH7010nUidzredCawIlB+6hSsjVwzBdixgcsCkpxPb62RpfLmbCSdk9Ix9
	i7f02EvB26axUZG9mh3Wb7OB6ap0VnBn15GRxRdVZ4VGNK3g7PKJl2UIZQ6xpRcLp7is=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGYX-0007a9-VS; Mon, 23 Nov 2020 18:27:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGYX-0003rA-Jg; Mon, 23 Nov 2020 18:27:17 +0000
Subject: Re: AW: AW: AW: AW: AW: Xen data from meta-virtualization layer
To: Leo Krueger <leo.krueger@zal.aero>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Peng Fan <peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>,
 Cornelia Bruelhart <cornelia.bruelhart@zal.aero>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
References: <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>
 <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
 <5dc63ee2-f1ce-31fc-cb6a-fe4dae929fb3@xen.org>
 <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b67581c6-6682-5059-55d1-a9c695a8cdc3@xen.org>
Date: Mon, 23 Nov 2020 18:27:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 22/11/2020 22:55, Leo Krueger wrote:
> Hi Julien,

Hi Leo,

> 
> finally I could try out what you suggested, please find my answers inline.

Thank you for sending the logs!

> 
>> -----Ursprüngliche Nachricht-----
>> Von: Julien Grall <julien@xen.org>
>> Gesendet: Mittwoch, 18. November 2020 13:24
>> An: Stefano Stabellini <stefano.stabellini@xilinx.com>; Leo Krueger
>> <leo.krueger@zal.aero>
>> Cc: Peng Fan <peng.fan@nxp.com>; brucea@xilinx.com; Cornelia Bruelhart
>> <cornelia.bruelhart@zal.aero>; oleksandr_andrushchenko@epam.com; xen-
>> devel@lists.xenproject.org; Bertrand.Marquis@arm.com
>> Betreff: Re: AW: AW: AW: AW: Xen data from meta-virtualization layer
>>
>> Hi,
>>
>> On 17/11/2020 23:53, Stefano Stabellini wrote:
>>> Adding Bertrand, Oleksandr, Julien, and others -- they have a more
>>> recent experience with GICv3 ITS than me and might be able to help.
>>> I am attaching the device tree Leo sent a few days ago for reference.
>>>
>>>
>>> Typically when you can set the ethernet link up and no packets are
>>> exchanged it is because of a missing interrupt. In this case a missing
>>> MSI.
>>>
>>> Bertrand, I believe you tried the GIC ITS driver with PCI devices
>>> recently. It is expected to work correctly with MSIs in Dom0, right?
>>
>> OSSTest has some hardware (e.g. Thunder-X) where ITS is required to boot
>> Dom0. I haven't seen any failure on recent Xen. We are testing 4.11 and
>> onwards on Thunder-X.
>>
>> However, it may be possible that some more work is necessary for other
>> hardware (e.g. workaround, missing code...). See more below.
>>
>>>
>>>
>>>
>>> On Tue, 17 Nov 2020, Leo Krueger wrote:
>>>> Hi,
>>>>
>>>> I enabled CONFIG_HAS_ITS (what a stupid mistake by me to not set it
>>>> before...) but then had to add the following node to my device tree
>>>>
>>>> 	gic_lpi_base: syscon@0x80000000 {
>>>> 		compatible = "gic-lpi-base";
>>
>> I couldn't find this compatible defined/used in Linux 5.10-rc4. @Leo, could
>> you clarify which flavor/version of Linux you are using?
> 
> It is Linux 4.19 from Yocto (Warror release). XEN 4.13.2.

Do you have a link to the Linux tree? Is there any additional patches on 
top of vanilla?

> While searching around the Internet for any solution, I came across [0] which contained the gic-lpi-base node.
> So I just tried adding it (quite desperate I know) and voila, it at least brought me one step further (XEN exposing the ITS)...

I am slightly confused to how this would help. Xen and, AFAICT, Linux 
don't understand gic-lpi-base. Do you have modification in your Linux to 
use it?

Looking at the DT changes in [0], it looks like the node is not a child 
of gic@. So I think Xen will map the region to Dom0.

There are two things that I can notice:
   1) This region is RAM, but I can't find any reserve node. Is there 
any specific code in Linux to reserve it?
   2) The implementation in U-boot seems to suggest that the firmware 
will configure the LPIs and then enable it. If that's the case, then Xen 
needs to re-use the table in the DT rather than allocating a new one. 
However, I would have expected an error message in the log:

    "GICv3: CPUx: Cannot initialize LPIs"

At least Xen should not expose gic-lpi-base to the kernel, but I will 
wait on more details about the Linux kernel used before commenting more.

I would also be interested to know more details about the failure when 
gic-lpi-base is not added in your DT. In particular, I am interested to 
understand why Xen would not expose the ITS as we don't parse that node.

[...]

> For XEN 4.13.2 I had to adapt your patch slightly [1], see below (yes I know, quite ugly in parts).

No worries, debug patches are not meant to be nice to read ;).

> Find attached the boot log and an output of "xl dmesg" which is truncated due to the large amount of messages.
> 
> When enabling the network interface (gbe0), the following output is visible:
> 
> root@kontron-sal28:~# ip link set up dev gbe0
> (XEN) vgic-v3-its.c:902:d0v0 vITS  cmd 0x0c: 000000170000000c 0000000000000001 0000000000000000 0000000000000000
> (XEN) vgic-v3-its.c:902:d0v0 vITS  cmd 0x05: 0000000000000005 0000000000000000 0000000000000000 0000000000000000

0xc is INV and 0x5 is SYNC. Most likely the driver unmask the interrupt 
by writing in the property table (access are not trapped to Xen) and 
then requested to invalidate the cache state.

> [   34.034598] Atheros 8031 ethernet 0000:00:00.3:05: attached PHY driver [Atheros 8031 ethernet] (mii_bus:phy_addr=0000:00:00.3:05, irq=POLL)
> [   34.041111] 8021q: adding VLAN 0 to HW filter on device gbe0
> [   34.041209] IPv6: ADDRCONF(NETDEV_UP): gbe0: link is not ready
> root@kontron-sal28:~# [   35.041951] fsl_enetc 0000:00:00.0 gbe0: Link is Down
> [   38.114426] fsl_enetc 0000:00:00.0 gbe0: Link is Up - 1Gbps/Full - flow control off
> [   38.114508] IPv6: ADDRCONF(NETDEV_CHANGE): gbe0: link becomes ready
> 
> Does that tell you anything?

It is at least a good sign because it means Linux is able to 
initialize/talk to the vITS.

I would lean towards one (or multiple) issue with pITS and/or the 
device-tree exposed to Linux. I am not entirely what exactly... I think 
having more details about the Linux setup would be helpful.

I will reply on Rahul's e-mail separately.

Cheers,

-- 
Julien Grall

