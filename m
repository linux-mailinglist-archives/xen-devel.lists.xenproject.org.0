Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3720417022
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195212.347828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiDC-0005Gd-8H; Fri, 24 Sep 2021 10:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195212.347828; Fri, 24 Sep 2021 10:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiDC-0005Dd-31; Fri, 24 Sep 2021 10:13:46 +0000
Received: by outflank-mailman (input) for mailman id 195212;
 Fri, 24 Sep 2021 10:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiDB-0005DX-8Y
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:13:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d40249b-1d79-463a-bcbf-53b2e97c97c2;
 Fri, 24 Sep 2021 10:13:42 +0000 (UTC)
Received: from AM5PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:206:1::20)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 10:13:41 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::82) by AM5PR04CA0007.outlook.office365.com
 (2603:10a6:206:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 10:13:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:13:40 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Fri, 24 Sep 2021 10:13:39 +0000
Received: from e68fd4dda50b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7427E9C3-1591-43A1-A2FC-948BAC14583F.1; 
 Fri, 24 Sep 2021 10:13:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e68fd4dda50b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:13:27 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3803.eurprd08.prod.outlook.com (2603:10a6:10:7f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 10:13:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:13:25 +0000
Received: from [10.169.190.22] (203.126.0.113) by
 SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 10:13:23 +0000
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
X-Inumbo-ID: 9d40249b-1d79-463a-bcbf-53b2e97c97c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0p843kXw5D0c+OyBjvTrcjNQBSNRMvYTz/gjTVOgj8=;
 b=5StRR+AcSvc/nHSgJuc2vLkciSGDG0tC409w2o5eR9eF+Qj8Xiwnsz3xuEmjOoVQ/DpgRdBR6PUNmjtkNlgvcs8KPlxSog0nC7Ffp/wvBF03SRHnUDMX2ZwDzXDztKtXKsJh2bk64XG1WTwG6bImvXqOXkyWVPGYJGv9KL+BMO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05ee377574518d19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhpabmuyDqh4ZifmhBLFKBmOblX+StqJluU61IZdVkQYizFuEzhmK+Jueopjj9HDegg0i1Pw63rVJx0mCz6ebtO3/BIEELA6693HHyeQ0dC1A3Jckb5KoSwI4y4uJM8PPUUZPozsF8MaOsqTjcsaocOP/MzqHxpqrWP16IqIXccwe3hBpQav5YcxelAlI+O6EtoSy+TsHo5RkKqZnd7qWEmLRvQZst0QVMSPBrqTfF+VD3XiXPIT7qZDUHc7+fZgye7EuVD0bwLxGYYlIt5e7Oc97ijPCHqD7wOdi51uentYmmX7lQieSUD2TZtJZ1S9c/L0/EKs1vu3dDzw9OB6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g0p843kXw5D0c+OyBjvTrcjNQBSNRMvYTz/gjTVOgj8=;
 b=ItUY7mK6QMxy5R2mF87i6GXlZB8/7uYeRqb8CV6NveaNMkuyLvWcTHpEDXxdSsSZexwHX4VyslKy5hjpaTfWkaVcGI+/Tpqx8GwFI5BNv/3KkJMus9Sht8G6N+ByZ7n+/EW0j/DfurBFvYMRA21GBhvYIjoMbS/pIL+OHDI2gqu1FbFDw9efJOtohKCpOtm/s3n52Fvu5eWoN9x6G4p/A0+xWwPL3y8fhjgPFx7Vd2MMrZwxrcv0yJdsReaiJtrjfz4vkvFk7sAHanY8FrPCgp0cncbcDHkmWt6EWKssYae5kk2EgjwoPbnZMmlufw+Cgi8wzWLLPXJFquwVHE656Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0p843kXw5D0c+OyBjvTrcjNQBSNRMvYTz/gjTVOgj8=;
 b=5StRR+AcSvc/nHSgJuc2vLkciSGDG0tC409w2o5eR9eF+Qj8Xiwnsz3xuEmjOoVQ/DpgRdBR6PUNmjtkNlgvcs8KPlxSog0nC7Ffp/wvBF03SRHnUDMX2ZwDzXDztKtXKsJh2bk64XG1WTwG6bImvXqOXkyWVPGYJGv9KL+BMO0=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Message-ID: <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
Date: Fri, 24 Sep 2021 18:13:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66170ae2-774a-423f-1bee-08d97f43fb6b
X-MS-TrafficTypeDiagnostic: DB7PR08MB3803:|AM0PR08MB5489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5489E467FC99A8038DB689D99EA49@AM0PR08MB5489.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IwyJVpDxOF52/0PQu7+wmWsKZPFiKbMOmlg1A0v8hxwE6y1/5xPIiM9Lm7hrlfgS4VFLu8nVS5asRLFTEIwWNaFhHztapM9AhqJ6Wp6Z4fcC5MM96EKrxjBwYUo9LEz6xi38WJI1D8FUQ9N9/JgI0uCi8lGgLPk5Ljbavrcia60YWiz7eCV3GamxvdAvo37iockfCP3TPnuUppKk5uK3pYbXUVpDNNvrcTwB28w/0kRZ5i/ImumbsMcKvQ0mH1ZsNe59NIv+C2QxbwwzJBhzXx7/+YqDPy77HJk4i0zQ0O7fkSN6i3MiCP/V99K/qmyRrp+B6dvQ84k1/jXkWw0HNZtuUanWA/f68iaFuVnr27hsXt4Yv0CXuYiwJu5qbtVfGlLtLT6Ettwzintls3biYLmw+r5d0DsIemf0J7Arha/3YCxhIV4FMqLuydRd3wkT6fb+TtOPnr+i1/u1wAN9tiChog7LJ6vZxzC2b33yA7GoF9x4Hf1J8cR8th4suj+AdxwLzVom5+cNywNvbAbV91xpf5tutuvJa3ONdfIqF4+MJ1+Vb1wT+C5/LifAT/VRSGXkRft4N+Qh/7G01a45ImMRhtZSj7v2f8nw+uUoy/20BsziWN45EZL2S3oku5+8qYiV1NeUZ8zR3J03i9lkxjaHD+QdNNL5Oapq3HVX2nZQZLBex13neeI2ZpHDiU/EOO966oQanPm69A+UFmQ1Lz1iMLRqyaATnlHJRih2vkLbe0XyrCZ10Kc4br5dqFzHAM+lRxX/VEoW+OyLiaj/Y8uE40ne59Y0o6G/D+77siK0noVg/towNM2KJZkY3tOR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(5660300002)(31696002)(36756003)(8676002)(966005)(508600001)(6666004)(86362001)(6486002)(2616005)(4326008)(8936002)(66946007)(38100700002)(186003)(26005)(956004)(83380400001)(31686004)(2906002)(6916009)(316002)(66556008)(66476007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3803
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ea29d8d-bd6f-40d1-b94c-08d97f43f201
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pGt1AEVxq2EEodfy+aII2QSduMuFhMpcWzj5uKK6JY1GveXQGCUcUm6us/ZIWJZ5uK6CHhmecEehLDZAqf9mWBFdqfgu8xj0LswzLOcj/K/IgyXgIawLVs7Y2Ud07YSrHZeqvqu5MY7iWkpZp+veW1ZkSxTOEQi1a2isPHy5XvJoxmIhYSJT8TgRRk5hK1sXS5MhK+akk/qTodIBy1IKtuM1ld5uFwj89YTBRiiY5e6k/B+XpfaRQe3Z/Fu1v3hXr8RenUT62cE4egemHCyyFdVAJF+vEALK3t5vcWJJCYwqz1TDeMonUv7fOhTlOhpvLkz8UX+jX8NOVA5i6IVKMs/Nsp0VSRYA7m4HGxRT/48mvBmD9KNAkE5ue3uKjsDSEEoMO6Xq0ncwQ4FwzLCiZuZYrZFCPI4Q5He8BoRn3mYcpmQ1ofdqZtwkvYJ0glNZTW81YFFFXb6ZJArccc9/JrxWHTm+UftycyH3/wJplBykD2ItO89HvuIleGlJhAXl6xhDlawdq9yPz5a14Mf5QygXBKTH9A0eN4scIV3YWSgZbtsxCsU6vR35fISQv23qKSx1tmEB7zxxTVb+LGEhadwWBLiWzHrJ+rfha8RTgYTAJiCljChKRy67PGVy7XHTQcvCU0OZpnBWec8fRdSsa2Aczk1TqdCojIV4ZwcIUZEdj4hOzW5KIFiJbNnI6iJ42WKvdmNvU1v+UcjdJKHVQ2Q59BB5NU5qz51uTKJdZqxKy0J8EarJtLhReNFHJKFj8JzK57DnKCozAsnRLSz2c9O7NqYfDxaENA98mGjtEw4B7s+311ZsfzbNL3wbb4Gq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(186003)(70586007)(966005)(81166007)(8936002)(36860700001)(70206006)(47076005)(36756003)(6486002)(316002)(4326008)(31696002)(6666004)(26005)(356005)(2906002)(16576012)(2616005)(53546011)(86362001)(6862004)(83380400001)(336012)(31686004)(956004)(5660300002)(8676002)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:13:40.6222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66170ae2-774a-423f-1bee-08d97f43fb6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489

Hi Stefano,

On 2021/9/24 11:31, Stefano Stabellini wrote:
> On Thu, 23 Sep 2021, Wei Chen wrote:
>> Arm platforms support both ACPI and device tree. We don't
>> want users to select device tree NUMA or ACPI NUMA manually.
>> We hope usrs can just enable NUMA for Arm, and device tree
>            ^ users
> 
>> NUMA and ACPI NUMA can be selected depends on device tree
>> feature and ACPI feature status automatically. In this case,
>> these two kinds of NUMA support code can be co-exist in one
>> Xen binary. Xen can check feature flags to decide using
>> device tree or ACPI as NUMA based firmware.
>>
>> So in this patch, we introduce a generic option:
>> CONFIG_ARM_NUMA for user to enable NUMA for Arm.
>                        ^ users
>

OK

>> And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
>> to select when HAS_DEVICE_TREE option is enabled.
>> Once when ACPI NUMA for Arm is supported, ACPI_NUMA
>> can be selected here too.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>   xen/arch/arm/Kconfig | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 865ad83a89..ded94ebd37 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -34,6 +34,17 @@ config ACPI
>>   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>>   	  an alternative to device tree on ARM64.
>>   
>> + config DEVICE_TREE_NUMA
>> +	def_bool n
>> +	select NUMA
>> +
>> +config ARM_NUMA
>> +	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
>> +	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> 
> Should it be: depends on HAS_DEVICE_TREE ?
> (And eventually depends on HAS_DEVICE_TREE || ACPI)
> 

As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
option can be selected by users. And depends on has_device_tree
or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.

If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
does it become a loop dependency?

https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html
> 
>> +	---help---
>> +
>> +	  Enable Non-Uniform Memory Access (NUMA) for Arm architecutres
>                                                        ^ architectures
> 
> 
>> +
>>   config GICV3
>>   	bool "GICv3 driver"
>>   	depends on ARM_64 && !NEW_VGIC
>> -- 
>> 2.25.1
>>

