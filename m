Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CE66BAAC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478516.741768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLzI-00078q-Pu; Mon, 16 Jan 2023 09:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478516.741768; Mon, 16 Jan 2023 09:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLzI-00075f-Mq; Mon, 16 Jan 2023 09:41:08 +0000
Received: by outflank-mailman (input) for mailman id 478516;
 Mon, 16 Jan 2023 09:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Os5i=5N=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHLzH-00075Z-M2
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:41:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6181641-9581-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 10:41:06 +0100 (CET)
Received: from AS9PR06CA0196.eurprd06.prod.outlook.com (2603:10a6:20b:45d::22)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 09:40:55 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::3b) by AS9PR06CA0196.outlook.office365.com
 (2603:10a6:20b:45d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 09:40:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 09:40:54 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Mon, 16 Jan 2023 09:40:54 +0000
Received: from d5c67f4d84b7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6969F8D1-AF23-45C0-B46C-96CE31B03AE7.1; 
 Mon, 16 Jan 2023 09:40:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5c67f4d84b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Jan 2023 09:40:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8747.eurprd08.prod.outlook.com (2603:10a6:20b:55f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 09:40:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 09:40:40 +0000
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
X-Inumbo-ID: e6181641-9581-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3P0XiTgynu573SmPp/QcDNdyG9IX1u1LFbgNqKMTuk=;
 b=WijJ/n6QB3QsEki369209ninq/OelMS3EMwgnS3pjCGktSTFDCZU1LN5kcrCh6E09E/01KKOGvSt1o5hW2TQo7B2Fx7074/+brFELqWK32ST1nsCtMA7Zyl+/hGVoFmPpCOqg6aLmhnr3NbTf6yivtoDtDOlq327aEuaID7eTzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad01db07b5d3269f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3cKJAPnltdFeqOexwNHHhz/ONeUhf1TpKDTLaGEuHaOea5CVlp91sMiTO0PK9KHUAF1np96F5wrRBwIfn4hkPc6g49NBdVloQlPUPLKVn7/JUGnk9+6FsX14Xp2vRogt7S7rmBBGFnqvXtMdy1bbVWJZ2xaoMjNi+s/5oRsbIiHiYo7PHDdAFAy6qDFLA8Ox0JDdpGIiTeCGVBRNQcNF/At+Z4AnKkWWAnwAUPO5cMk2YBT20opoaa1ooVkmctStBnRkY+GOHQ/EqKbHFqrimamek4iLCjx69ftUWqSXFIq8EgV6LL5H0RRD9Im+EkwdU2cK/6M27eYkzbRSxD9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3P0XiTgynu573SmPp/QcDNdyG9IX1u1LFbgNqKMTuk=;
 b=O5fXeLUxfe98qze6nxd3XiWgkskLKoieuosYgZ71kXkDS2F2SHqiSU6b/689/GZAHWRqjcdmOOIkUezXnTZGBZZN4zysKND+xovi0aMLFPOC0esdRcGJ7jbGAmCg+UKBusHSicVnZipXPZVq11hAKDUUjrWlbU/Xjwocty9iFYLuxe58uGd5GPTqDBj4sMBuFgXDLKxQO93897hoyXuwTapHVqjzyFB/2d6QoNlGoUQ4uViS1oomnKXVIdrlx2V7cpt9WKIuMA1B4FY0a51ByvhJgi31vHpS08l4rY9cPLEC4rK8owa5Misrz4yI/eikeR+nlmJ6QipasC0kGdfOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3P0XiTgynu573SmPp/QcDNdyG9IX1u1LFbgNqKMTuk=;
 b=WijJ/n6QB3QsEki369209ninq/OelMS3EMwgnS3pjCGktSTFDCZU1LN5kcrCh6E09E/01KKOGvSt1o5hW2TQo7B2Fx7074/+brFELqWK32ST1nsCtMA7Zyl+/hGVoFmPpCOqg6aLmhnr3NbTf6yivtoDtDOlq327aEuaID7eTzI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <1ed674f8-4e69-de96-aca0-c25e589cc998@arm.com>
Date: Mon, 16 Jan 2023 17:40:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
 <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
 <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
 <71e806f4-8bd2-dd47-67b9-958bb9061c7b@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <71e806f4-8bd2-dd47-67b9-958bb9061c7b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0178.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::9) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8747:EE_|AM7EUR03FT009:EE_|AS8PR08MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b48b5b-5e9e-41ca-27e9-08daf7a5c394
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rSuVt6Hc0ZZs3xQqRZQoxgwFjg+M7f9HGdyS1qMVEeLHYpzTxru1Y3L4/tM/QK8+OzAB8SUt8Cek+5Fzg5fOXBptpdLl4ImASZMb8DWOu4CRdy11HAReWOollprdUoNEy6KuMbrmQZ3xGcHEXiG8G24XLgw+eb+uESzZ8dqv3Zmg0KtOgOBo/yZDrLza8gyEfKBlPvbuz3YZbdSpeQOcnEW/LgNYNpt7ZR/p+rBKuRJsLGFZSiI6dKdF8ouYoUVUENypy9xCAPyp6HNcsWXum0T2Je6/V+d45UgGtBtMdwXgCG3/O56wgPhrV3lxQ91OPp0Y+C2sRAdTxdJjLHfAPWzCmnyK/CzaqZ7aoL88lp4/QWzFUPwlLXLEF1/EIFohlyzUXUoKqLXsuHiV00ehbSvJ+eJhiOGfbYWH/V90ZPfN+fhtMonjqjWb2lUF+sq8y0QdscoFpJMMtNqLIbRUhbCml1ngKYztDyaGDKpP3+pAURSy65ttA5vWOxH9e0iCy6aMYVZLvCh4lOh/ZD+SyOmFbd5VIlWKhesiqklN52erW8YjSTAI/u6S3ncLYQAbtMEdUok5bPXiVALQHjhaeUf1KU98KMPuo9Pi4obFNa1DXIgHJq8G8bfgMDSf8/BRnDMcg6ueLFVHtMquIIU9gehBCK6F/tmAoaf4POqJnDbwmsHN5a3t/gioVBbgFHc3E/FJn5NwIUdNTpBmH57WwMLmorKZXi+dlJ0An58/oGU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(36756003)(5660300002)(53546011)(6666004)(6506007)(6512007)(186003)(83380400001)(31696002)(86362001)(2616005)(2906002)(26005)(38100700002)(316002)(31686004)(54906003)(110136005)(41300700001)(4326008)(66476007)(66556008)(66946007)(8936002)(8676002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8747
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27927cdc-99da-4e9d-4ae0-08daf7a5ba8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eghg5/Ca4S9YjXr8pyAXAM2vzJwaYdxY6levEHYf4uEd0GDLJVddjfU8qW2sANLj/ibGNSELgHq27OWRaJDZXCKV4pJj2pyWaWdsO9pOctKT0nUNdco4ve1jf2dsDyX4HD45o5yU09vIpCKzaQMpTj6yzYad3G0xCAU0qRr1RL4/m2CG9s/m2zcTFzFcsN4is5j31nJncLcXmKdkALMI9fveEF1LRCEhiv+/15gr6Ic2/TseSKxKL00pZbRMWJTTI3tIh5FB4dsqaTj9gI3THtO/W26tKzYBY7ytf8oxugqmLXbamScfkdZ+Gk7AptR9YMhG5EM+G4S2mxIXqNBDZ0rg/BTMuELiS/CUC68vg0A6pptun7wQYJQNFq8/q21Z+ccwngh7zWtIDHU5K3uBfyc3/AAj0sNdpuwZDdmobonNWquneglWAPLK35z58WJ3tLKiwC7KjprXoBWzcel6FG0BFEjDZbxIZpBKwvwyTHG0XH06CO2EaIUnBVVyN7DjhpdtlafV2AKzOEme/MVg1p2h6HroTi8Ex7WWU5Lka5oo3rHxrLGJTTA58X1YJe5M25lr3fTgDKHY620LW/YnBrBHw6HIWIZBHEvX4xmwMXtcYXp4BOVvHwWmFFF95gd7gB98wUeaV5j9FjLmWmNQs8FBDef+zJ9uWqMEH+51bpLu8PM/YVk3WQ9QKTqY/hsvvddwVxAyC5pNtUoHWMV60HjWU2de/9wp5DuQqxun/rk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(82740400003)(356005)(86362001)(31696002)(81166007)(31686004)(40460700003)(36756003)(47076005)(40480700001)(2616005)(82310400005)(54906003)(110136005)(316002)(5660300002)(70586007)(70206006)(41300700001)(8676002)(6506007)(6666004)(4326008)(6486002)(83380400001)(8936002)(26005)(186003)(53546011)(478600001)(336012)(6512007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 09:40:54.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b48b5b-5e9e-41ca-27e9-08daf7a5c394
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944

Hi Julien,

On 2023/1/12 17:47, Julien Grall wrote:
> Hi,
> 
> On 12/01/2023 08:11, Jan Beulich wrote:
>> On 12.01.2023 07:31, Wei Chen wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2023年1月11日 0:47
>>>>
>>>> On 10.01.2023 09:49, Wei Chen wrote:
>>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>>> @@ -28,6 +28,20 @@ enum dt_numa_status {
>>>>>       DT_NUMA_OFF,
>>>>>   };
>>>>>
>>>>> +/*
>>>>> + * In ACPI spec, 0-9 are the reserved values for node distance,
>>>>> + * 10 indicates local node distance, 20 indicates remote node
>>>>> + * distance. Set node distance map in device tree will follow
>>>>> + * the ACPI's definition.
> 
> Looking at the ACPI spec, I agree that the local node distance is 
> defined to 10. But I couldn't find any mention of the value 20.
> 
> How is NUMA_REMOTE_DISTANCE is meant to be used? Is this a default 
> value? If so, maybe we should add "DEFAULT" in the name.
> 

I think you're right, maybe we can rename NUMA_REMOTE_DISTANCE
to NUMA_DEFAULT_DISTANCE.Different pairs of nodes may have different 
remote distance values, I can not define one value for them.

And why use 20 as default value, I have followed the ACPI's logic.
In ACPI NUMA, when ACPI doesn't provide SLIT table, 20 will be used
for all nodes default distance.

>>>>> + */
>>>>> +#define NUMA_DISTANCE_UDF_MIN   0
>>>>> +#define NUMA_DISTANCE_UDF_MAX   9
>>>>> +#define NUMA_LOCAL_DISTANCE     10
>>>>> +#define NUMA_REMOTE_DISTANCE    20
>>>>
>>>> In the absence of a caller of numa_set_distance() it is entirely 
>>>> unclear
>>>> whether this tying to ACPI used values is actually appropriate.
>>>>
>>>
>>>  From Kernel's NUMA device tree binding, it seems DT NUMA are reusing
>>> ACPI used values for distances [1].
>>
>> I can't find any mention of ACPI in that doc, so the example values used
>> there matching ACPI's may also be coincidental. In no event can a Linux
>> kernel doc serve as DT specification. 
> 
> The directory Documentation/devicetree is the de-facto place where all 
> the bindings are described. This is used by most (to not say all) users.
> 
> I vaguely remember there were plan in the past to move the bindings out 
> of the kernel. But it looks like this has not been done. Yet, they tend 
> to be reviewed independently from the kernel.
> 
> So, as Wei pointed, if we don't follow them then we will not be able to 
> re-use Device-Tree shipped.
> 
>> If values are to match ACPI's, I
>> expect a DT spec to actually say so.
> I don't think it is necessary to say that. Bindings are not meant to 
> change and a developer can rely on the local distance value to not 
> change with the current bindings.
> 
> So IMHO, it is OK to assume that the local distance value is the same 
> between ACPI and DT. That would definitely simplify the parsing and code.
> 

Thanks for clarifying this.

Cheers,
Wei Chen

> Cheers,
> 

