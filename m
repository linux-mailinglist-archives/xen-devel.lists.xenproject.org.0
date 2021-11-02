Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C134428B5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 08:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219744.380709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoN7-0007hj-T4; Tue, 02 Nov 2021 07:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219744.380709; Tue, 02 Nov 2021 07:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoN7-0007ef-PD; Tue, 02 Nov 2021 07:38:17 +0000
Received: by outflank-mailman (input) for mailman id 219744;
 Tue, 02 Nov 2021 07:38:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uKY1=PV=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mhoN6-0007eZ-Eo
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 07:38:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec40b01-e334-41e9-b14f-493a22cd2d56;
 Tue, 02 Nov 2021 07:38:13 +0000 (UTC)
Received: from AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) by DB8PR08MB5273.eurprd08.prod.outlook.com
 (2603:10a6:10:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 07:38:10 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::85) by AM5PR0402CA0014.outlook.office365.com
 (2603:10a6:203:90::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 2 Nov 2021 07:38:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 07:38:10 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Tue, 02 Nov 2021 07:38:09 +0000
Received: from 36b90b1a0f5a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BA2CF52-8316-4815-B0F8-672B88A6CC51.1; 
 Tue, 02 Nov 2021 07:37:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36b90b1a0f5a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Nov 2021 07:37:59 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1879.eurprd08.prod.outlook.com (2603:10a6:4:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 07:37:55 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5%3]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 07:37:55 +0000
Received: from [10.169.188.84] (203.126.0.112) by
 SG2PR06CA0139.apcprd06.prod.outlook.com (2603:1096:1:1f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 07:37:52 +0000
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
X-Inumbo-ID: bec40b01-e334-41e9-b14f-493a22cd2d56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxghCdd8Lo8ENFDjUBpbNTbKyeQ+3JEpBY0azmnY/UI=;
 b=Asu0+t2FQjoSTXeTcG5ZTLUwVoFNwRvHpZeic/vv7brCO76hu4VyRIAgH6CZ4GvCneLJuwUCyzD7AF3mtjE4t/czC5M0HgtEkePChOGEr+Qgx7jl3v2OZyjTKdciUnVfDkf9TzrwgU69xMwvsNVThtyZ9APdGcSPHqxS20gY8uk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07257a2aa4e43840
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lH70X3k7YSagjSZ2wIwLdzx7GWJMA8XH4fDvCn5PWujJJciLVebQcyR10llWgoFYD4qvnGzglwl29VTmX8t0Z0Smm1i63qV50oC+bJcF1Mk12ClZGwgzXyEpy++5rwp5puXXhOoJGLs3Xu8VP8vWLEZYfQ9gkibJuVg2dtc/UvokLYXWYWKf93D0KsdE8jn/QVEUpy7zPL0FNT637IUp/a65yG/LHJu6ZizikfZKY0IuAgvcXCd5zXY/uNiysbY5EfRqafyCFZiSM137ODk5knSVHUlvSfGqqJIlgpDH43U0rfz8E6IS3KKXZh5ZUu/YhQoZWN4bHS/f6UgpxxKFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxghCdd8Lo8ENFDjUBpbNTbKyeQ+3JEpBY0azmnY/UI=;
 b=MWRtIhcdeqME0a9drV3T29L2Oy4gr+ObFnm9S4XJgXnvY5YZxKSrzI6qc9vlg89yxdPRR9JwlqrCyG+06qK0E9oWiCViJfnRob9FRUO+QjqEhGJ7+RunUBImnFM4NHL47Bouh8qnIRTXTAq7vu72RuOG98vRkH/MmNH0euf4JOk4T5jx+MYxdJEvhdGJ+fC83rF6Yy8DnS7OhNJ7+OBA3B6XjFDG7mWjv6GrZ8u+V0g0jCQBfdSYYoUjrmER67KIMK5Ki+nTuPw31aXR9+yuUsmbXJeg4aLijrlHEuba6fvxyabc5j1S6U5ms89rLznq+2ARa7LLidu5qoo7ohhoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxghCdd8Lo8ENFDjUBpbNTbKyeQ+3JEpBY0azmnY/UI=;
 b=Asu0+t2FQjoSTXeTcG5ZTLUwVoFNwRvHpZeic/vv7brCO76hu4VyRIAgH6CZ4GvCneLJuwUCyzD7AF3mtjE4t/czC5M0HgtEkePChOGEr+Qgx7jl3v2OZyjTKdciUnVfDkf9TzrwgU69xMwvsNVThtyZ9APdGcSPHqxS20gY8uk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <74ea74b7-d9e9-a030-753d-a1108cc244d0@arm.com>
Date: Tue, 2 Nov 2021 15:37:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
Content-Language: en-US
In-Reply-To: <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0139.apcprd06.prod.outlook.com
 (2603:1096:1:1f::17) To DB9PR08MB6857.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4011dc7f-7312-492b-1bb3-08d99dd3b838
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1879:|DB8PR08MB5273:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB52730E5D6A0F14BA012AFE889E8B9@DB8PR08MB5273.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W7BmzTotlSkYvyCHvcAOP8TdesP7WZ2OUa8B1PjC/p3pXt8fcD3p/RtMN+rq1lzKoNwjWK8pytyAsXlTydQcxa1F8byd7kcOfJ1vo7sYgNEDXf/Fq/jRTaOJESRZ+x+QmL76mfymAGbgIngi0ympJspdzMJ5/wvdLkPePQQ5+BBev/hcAdF7cREZM8QWdTB54nFhlpUEEQhXkKCXQZdk2rmfAwVftoCu9hWTP/IBGhott2x+ga3oJwJYPRAu75+2BuQrYcjKLR2bGmgwXDXXif+2oE41YsX6W60RpA1SXimM0tz9+03dWKoxVo6FFiDKseH/kE9jn+QaC6FrdZi8W/NNqEyaZ8cJZpFQjIC5E0sE7QXI1Yhg6BCowQXtY7B1hCl8K/iyfcYelOWbwnTlL3Z9VQ0KecyL5b0prrFK6372d1/p5FBl+0rWUUNH5yIBUO31bM2f5efFgSN4V7v8TYoY79mzgmGB6yCGG2S1D5Hcj1ERTqg6bJjnw8VwfT+KV3ah357Rt+JjpsbtvBt1q6VN67084En0BUmD6BAjquvKt04CRI5HfD4czNxxemzyfN97foXLTOnmRZafiJWit3XeHGRBfnDWoa8nBYBHiKpzgEm0ep+am4FehA91wSOjY8V3BI/DJYm6mOF7+0/ZP9Q4jOcoy2i/QP7ZCepppwJzFwi1ebbWevduz8OsrCCFdqRn/KkljmOuwmQ8Gj0VfH/TZqtffwU+jg+0CY55gA4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(66946007)(6486002)(83380400001)(66556008)(4326008)(31686004)(956004)(8936002)(8676002)(186003)(38100700002)(66476007)(110136005)(5660300002)(316002)(86362001)(53546011)(31696002)(508600001)(26005)(16576012)(2906002)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1879
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dea55ac-eb21-47b6-a257-08d99dd3af18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p7TP/js0uR3wcU/QKCNQPM9IStUL60DBs/6BBEpQojJGsqEyEFMdxFxR3miPhjhBukwjsJl4xV6MbVUFwb2gwLx5DmcuzatodVsq1fHKGXsF5S8ZyzUWTkk9io+Zh/L5hRnymBX+rUkbXo/7cEmHYcE8OLQ+Fjrf80EQsQqv8zxNGIYHlEaTN/aeQjuYY1mNnOYPQbKh6iVfE8iTatBPXRUhVKtpXj7pKFM4TakuxiFhOEpumJKE/FwOyQC/6kVKYW5hyimrNOtLc3YFCg1FmwXHwD5sQROxaTq1aW6Hl7Zf4ZwaEaw/0ZuwbSGP3iPuIIWlB1jDQM8gazXH0s5haVyw1EF/G6beeKco+lqvCJfC9POJciFTbv3038oZ9WahoCr4/qrMdHYVBbkAaHwHOVXDXtzJ1owyXHZETM7W24foNisVCFLIMm7da1Wqif26SMdS1aSow7j0oan2eJzRCADb0Pc9YY5BEhiIhEI4QlGXpCghkRitqINEzZNo9XN8jqnklYVkg+CVsgv/SJyNes6JzVWkyuhYglclUlwpE7ANDoJKmdtZ6arTddtJGoovZbNyT/zsQpJCM/wjrniYmX8nOpCzsBXDHpcC1xWGoMlLo6dzQuze3wWDbrssMMS4uNHm7cQapOmZj4glOWBEftKq8e6fSwmlXSmIiO7FaP5kdMGvVV9NRh3Ckf02wWoSiaNIPthgeTiiQL/lMjzSpLhy6DN6wzw/04T+DjzMaq8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(31686004)(336012)(5660300002)(26005)(508600001)(36860700001)(86362001)(82310400003)(36756003)(2616005)(956004)(2906002)(31696002)(47076005)(70206006)(316002)(8936002)(356005)(6486002)(16576012)(54906003)(70586007)(53546011)(4326008)(81166007)(186003)(110136005)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 07:38:10.2551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4011dc7f-7312-492b-1bb3-08d99dd3b838
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5273

Hi Oleksandr,

On 2021/11/1 14:14, Oleksandr Andrushchenko wrote:
> 
> 
> On 29.10.21 10:33, Roger Pau Monné wrote:
>> On Thu, Oct 28, 2021 at 05:55:25PM +0000, Oleksandr Andrushchenko wrote:
>>>
>>> On 28.10.21 19:03, Roger Pau Monné wrote:
>>>> On Thu, Oct 28, 2021 at 02:23:34PM +0000, Oleksandr Andrushchenko wrote:
>>>>> On 28.10.21 16:36, Roger Pau Monné wrote:
>>>>>> On Thu, Oct 28, 2021 at 12:09:23PM +0000, Oleksandr Andrushchenko wrote:
>>>>>>> Hi, Julien!
>>>>>>>
>>>>>>> On 27.10.21 20:35, Julien Grall wrote:
>>>>>>>> Hi Oleksandr,
>>>>>>>>
>>>>>>>> On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
>>>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>>>
>>>>>>>>> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
>>>>>>>>> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
>>>>>>>>> the base address may not be aligned in the way that the translation
>>>>>>>>> always work. If not adjusted with respect to the base address it may not be
>>>>>>>>> able to properly convert SBDF and crashes:
>>>>>>>>>
>>>>>>>>> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
>>>>>>>> I can't find a printk() that may output this message. Where does this comes from?
>>>>>>> That was a debug print. I shouldn't have used that in the patch description, but
>>>>>>> probably after "---" to better explain what's happening
>>>>>>>> Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.
>>>>>>> This is from dom0 I am working on now.
>>>>>>>> IMHO, the stack trace should come from usptream Xen or need some information to explain how this was reproduced.
>>>>>>>>
>>>>>>>>> (XEN) Data Abort Trap. Syndrome=0x6
>>>>>>>>> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
>>>>>>>> I can understnad that if we don't substract GUEST_VPCI_ECAM, we would (in theory) not get the correct BDF. But... I don't understand how this would result to a data abort in the hypervisor.
>>>>>>>>
>>>>>>>> In fact, I think the vPCI code should be resilient enough to not crash if we pass the wrong BDF.
>>>>>>> Well, there is no (?) easy way to validate SBDF. And this could be a problem if we have a misbehaving
>>>>>>> guest which may force Xen to access the memory beyond that of PCI host bridge
>>>>>> How could that be? The ECAM region exposed to the guest you should be
>>>>>> the same as the physical one for dom0?
>>>>> Ok, I have a Designware PCI hist which has 2 ECAM regions (I am starting to
>>>>> implement the driver for it, so I can be wrong here):
>>>>> - Root Complex ECAM area ("dbi"), it is something like 0x3000 bytes long
>>>>> - "Client" ECAM area ("config")
>>>>> So from Dom0 POV we have 2 ECAM regions and for the guest
>>>>> we always emulate a single big region:
>>>> You need support for multiple ECAM regions. That's how we do it on x86
>>>> PVH dom0. See register_vpci_mmcfg_handler and related machinery.
>>> Is it common for a PCI host bridge to have multiple ECAM regions?
>>> Currently on Arm we were about to support "pci-host-ecam-generic" [1],
>>> e.g. generic ECAM host bridge which normally (?) has a single ECAM
>>> region [2]. But the host bridge I want to support has multiple, so
>>> strictly speaking it is not the one that we implement.
>> It's possible on x86 to have multiple ECAM regions, whether that means
>> multiple host bridges, or host bridges having multiple ECAM regions is
>> unknown to me. It's all reported in the MCFG ACPI table (see PCI
>> Firmware document for the detailed description of MCFG) using the
>> "Configuration Space Base Address Allocation Structure", and there can
>> be multiple of those structures.
> As we are currently supporting generic ECAM host bridge which
> has a single ECAM region I think the existing code we have and
> about to upstream is ok as is for now.
> I own a bridge which has 2 ECAM regions, so I will work towards
> adding its support soon.
>>
>>> Arm folks, do we want this generalization at this moment to align with x86
>>> with this respect?
>>>
>>> We can live with the current approach and when I have my driver implemented
>>> I can send patches to make that generalization.
>>>>> /*
>>>>>      * 256 MB is reserved for VPCI configuration space based on calculation
>>>>>      * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
>>>>>      */
>>>>> #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>>>>> #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>>>>>
>>>>> So, we have the base address and size of the emulated ECAM space
>>>>> not connected to the real host bridge
>>>>>> And for domUs you really need to fix vpci_{read,write} to not
>>>>>> passthrough accesses not explicitly handled.
>>>>> Do you mean that we need to validate SBDFs there?
>>>>> This can be tricky if we have a use-case when a PCI device being
>>>>> passed through if not put at 0000:00:0.0, but requested to be, for
>>>>> example, 0000:0d:0.0. So, we need to go over the list of virtual
>>>>> devices and see if SBDF the guest is trying to access is a valid SBDF.
>>>>> Is this what you mean?
>>>> No, you need to prevent accesses to registers not explicitly handled
>>>> by vpci. Ie: do not forward unhandled accesses to
>>>> vpci_{read,wrie}_hw).
>>> I see, so those which have no handlers are not passed to the hardware.
>>> I need to see how to do that
>> Indeed. Without fixing that passthrough to domUs is completely unsafe,
>> as you allow domUs full access to registers not explicitly handled by
>> current vPCI code.
> Well, my understanding is: we can let the guest access whatever
> registers it wants with the following exceptions:
> - "special" registers we already trap in vPCI, e.g. command, BARs
> - we must not let the guest go out of the configuration space of a
> specific PCI device, e.g. prevent it from accessing configuration
> spaces of other devices.
> The rest accesses seem to be ok to me as we do not really want:
> - have handlers and emulate all possible registers
> - we do not want the guest to fail if it accesses a valid register which
> we do not emulate.

I am tring to review your patch, please point out if there is anything
wrong. IIUC, vPCI only emulates some registers, and forward unhandled
accesses to physical device configuration space (if the accesses passed 
the validate.)?
Does that make the context inconsistent in physical device's 
configuration space? For example, one register in physical device
config space is related to another register. But we just emulate
only one in vPCI?


>>
>> Regards, Roger.
>>
> Thanks,
> Oleksandr
> 

