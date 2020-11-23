Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730BA2C134F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35122.66508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khGmk-00063N-4Q; Mon, 23 Nov 2020 18:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35122.66508; Mon, 23 Nov 2020 18:41:58 +0000
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
	id 1khGmk-00062y-0t; Mon, 23 Nov 2020 18:41:58 +0000
Received: by outflank-mailman (input) for mailman id 35122;
 Mon, 23 Nov 2020 18:41:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khGmi-00062t-1G
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:41:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khGmg-0007un-HU; Mon, 23 Nov 2020 18:41:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khGmg-0004wA-9P; Mon, 23 Nov 2020 18:41:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGmi-00062t-1G
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=20n6of72vjnzsOaDGpjvEGBeHQ8aEYL1sayx0U86rec=; b=BTQyY1mBryRsF93eYlYiqXvDb9
	OMP8KCgjrwoejOpKRN7ZB0eUNih4Tzj85EZr5RyATOCrOS8IiPHj8n1KKVg6ajJGgwm7/SGRXL6se
	rM0ToMQVlSVUB+m6XKy7wWOXJneNIJRiKHgfyRhBCh+H5bqXV/fshQc2Fs2JAjNfG2xI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGmg-0007un-HU; Mon, 23 Nov 2020 18:41:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khGmg-0004wA-9P; Mon, 23 Nov 2020 18:41:54 +0000
Subject: Re: Xen data from meta-virtualization layer
To: Rahul Singh <Rahul.Singh@arm.com>, Leo Krueger <leo.krueger@zal.aero>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Peng Fan <peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>,
 Cornelia Bruelhart <cornelia.bruelhart@zal.aero>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
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
 <50B2EEEF-4BF2-4511-98D5-F165A70E2EC6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <15608dee-1f95-2b08-9fe5-cd015f4d1cdf@xen.org>
Date: Mon, 23 Nov 2020 18:41:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <50B2EEEF-4BF2-4511-98D5-F165A70E2EC6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 23/11/2020 11:41, Rahul Singh wrote:
> Hello ,

Hi Rahul,

>> On 22 Nov 2020, at 10:55 pm, Leo Krueger <leo.krueger@zal.aero> wrote:
>> root@kontron-sal28:~# ip link set up dev gbe0
>> (XEN) vgic-v3-its.c:902:d0v0 vITS  cmd 0x0c: 000000170000000c 0000000000000001 0000000000000000 0000000000000000
>> (XEN) vgic-v3-its.c:902:d0v0 vITS  cmd 0x05: 0000000000000005 0000000000000000 0000000000000000 0000000000000000
>> [   34.034598] Atheros 8031 ethernet 0000:00:00.3:05: attached PHY driver [Atheros 8031 ethernet] (mii_bus:phy_addr=0000:00:00.3:05, irq=POLL)
>> [   34.041111] 8021q: adding VLAN 0 to HW filter on device gbe0
>> [   34.041209] IPv6: ADDRCONF(NETDEV_UP): gbe0: link is not ready
>> root@kontron-sal28:~# [   35.041951] fsl_enetc 0000:00:00.0 gbe0: Link is Down
>> [   38.114426] fsl_enetc 0000:00:00.0 gbe0: Link is Up - 1Gbps/Full - flow control off
>> [   38.114508] IPv6: ADDRCONF(NETDEV_CHANGE): gbe0: link becomes ready
>>
>> Does that tell you anything?
>>
> 
> I just checked the logs shared, what I found out that there’s is an error while booting to configure the MSI for the PCI device because of that there will be case that Device Id generate out-of-band is not mapped correctly to ITS device table created while initialising the MSI for the device.
> I might be wrong let someone else also comments on this.

I think there might be multiple issues. You spotted one below :).

> [    0.173964] OF: /soc/pcie@1f0000000: Invalid msi-map translation - no match for rid 0xf8 on           (null)

Leo, just to confirm, this error message is not spotted when booting 
Linux on baremetal?

Cheers,

-- 
Julien Grall

