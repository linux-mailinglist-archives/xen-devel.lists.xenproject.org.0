Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EA50981A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 09:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309804.526281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQp4-0008BJ-NC; Thu, 21 Apr 2022 07:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309804.526281; Thu, 21 Apr 2022 07:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQp4-00089I-IJ; Thu, 21 Apr 2022 07:01:50 +0000
Received: by outflank-mailman (input) for mailman id 309804;
 Thu, 21 Apr 2022 07:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/n2O=U7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nhQp3-0007N9-2B
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 07:01:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94f76c4-c140-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 09:01:48 +0200 (CEST)
Received: from AM6PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::26)
 by PAXPR08MB7036.eurprd08.prod.outlook.com (2603:10a6:102:208::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 07:01:41 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80::4) by AM6PR10CA0049.outlook.office365.com
 (2603:10a6:209:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 07:01:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 07:01:40 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 21 Apr 2022 07:01:40 +0000
Received: from f4556d51b140.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5573A7CB-E376-4BDB-A29C-5CD2DEDCFE2D.1; 
 Thu, 21 Apr 2022 07:01:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4556d51b140.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 07:01:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS4PR08MB8071.eurprd08.prod.outlook.com (2603:10a6:20b:58a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 07:01:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 07:01:31 +0000
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
X-Inumbo-ID: e94f76c4-c140-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xIcU96ZbrD7FqvIuy4Xpm+ZwhPyAu1JGyRqhzRBv9s=;
 b=bDI21dRQ+kFaIKgaez0M77ZqEa3e+2Zc8xpKC3eZ72z/UrAVB2IAOpRUymL+biiXFER11FKLw8yQtaaWzP+6jhiz4YW3wjpc0ITp/aZQhISkdp55fMHB666wDA4WIDIi4/d2poCkq9gX/GTqjjqph/mB7LQXAK4Q2tWyC1iYyjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04da220d14e6d16f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu1D85Cl6qaURPK5Q8vq6R/0QfziuqrW5h9DuIHBlpuvQSHeIG6WYrWjzoEm4dP+GeG0/v5OgGJUZqEZEIQuqB5/q9WStJfS/i4atnBgsO0Ok1LBBplRJ+XMy1F9oJW7qDNMU+mk7/ABrs9RE2nO0nmaXqn0keKZpvWB2bbKPZxXwPCybseUaTlWU4pdQoQB7CKY2Sge7tw/BhaQb6fMyreu1qFO8ucG8g4c/gwxATcsE1n91vGofs/MJGe46CtC2TmvMwG5bo5KetP2CfNEJc9Oi2NtP3+lETgAwBAV8icBKrgJY0A4c/xTrYkJ1uDoLByhZdMcFfS9uunI6IzNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xIcU96ZbrD7FqvIuy4Xpm+ZwhPyAu1JGyRqhzRBv9s=;
 b=NbqChWjWnts/Y6DdWPkkQElroN6LfDW+hySGaQDFlk6xyqCwDSDOtoFUIeYE6suGQpLPSt6NNv8QuxeBaBlGQYOtiInbbSyl9JbEasdjN2U8yqEze7xN23jvItujM9OK0NueYn9x8AnMDln3CDnIyJrMjyfv8fIrChOnOeUO2nwSQLitKIHFq4grkAiuAXj3ZmeXO1JvuP6daxilpVdFPz38j+OaFNMRKkNY6BR7QurDHyW+k0UvKyBD98clVmJsbFrLRBEYeHM0hnkmhq8jXH4hoYTAxGU+kzHdjDQfz4clwA0x8a8bWg0EpFUV//GS7RoEn91ua96LHUtWOznFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xIcU96ZbrD7FqvIuy4Xpm+ZwhPyAu1JGyRqhzRBv9s=;
 b=bDI21dRQ+kFaIKgaez0M77ZqEa3e+2Zc8xpKC3eZ72z/UrAVB2IAOpRUymL+biiXFER11FKLw8yQtaaWzP+6jhiz4YW3wjpc0ITp/aZQhISkdp55fMHB666wDA4WIDIi4/d2poCkq9gX/GTqjjqph/mB7LQXAK4Q2tWyC1iYyjw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <265745cb-40f4-22d8-8c85-ffc89b2baf04@arm.com>
Date: Thu, 21 Apr 2022 15:01:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 03/10] xen/arm: add CONFIG_ARM_EFI to stub EFI API
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, nd@arm.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-4-wei.chen@arm.com>
 <alpine.DEB.2.22.394.2204201724430.915916@ubuntu-linux-20-04-desktop>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2204201724430.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: abb1cd32-07ed-4ab6-e09b-08da2364c96d
X-MS-TrafficTypeDiagnostic:
	AS4PR08MB8071:EE_|VE1EUR03FT009:EE_|PAXPR08MB7036:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB70360D4F3E765F63784B1ACD9EF49@PAXPR08MB7036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5pwH9q7xxuR5rewbwG2xiDUA6R/hOxmyCSDb1OYmr6ygzcRdqW9ttWSrlIwivEK/9wBtReihcJfeyZNiTehjtJvyo4UTJt95Xs3lk2aYARaZ4evLzefqea9pM7P00X9cP4Zd+mY/DDc9NcLpM/FkvsO9yl15LCsdEuEAdb530BK/lyYUSZXUEKYvYhCpo9tOq39hAG3mitlDFL4GmaZyUrkgLzRTo5NDzvtHwxpPoI/SUPvH53DuAZ0jBAA0N0MpeKryP2Y0nzLqbyTtnuvatzoKBXde5R9ALahLh0+JmjdKuxgOF0mbZUDTaV1gjHwutW+mojcc4VNe3dYFpEsLB4DkPjytgZ6TaN61vbju+NtL/FlyJUgKKhNY2S9lWILQ/kz2vMgT3mG0dV5syFDIrz3ST+YKujR8YMjZSmaayTjFwBucI/19gOHcSG2QTe0o0gj/sDxlzEggOiGG1HbtMZMwnKoi58IzHfL5iZ5MIf1+ufgY5ZXx/kobOWn9ABY6/t6cBb5lQAC8quFDdUL4OjAh+u5AsmXYP/cWD7BqifpujQigMTsmJ8dXmQpNjjDT3RCg6FAaGcYVIf3RMIeK/Tvkw2jEXBHOT40w4xbvrJD4rf2etfmTruS0nBX/1Wpj5T0dgxxQPgzw5n3atWE4i9/8JKH4ujbLuOz+SoiiVuzCO7eA5WCjb54/FuONTXoPhvsvgToGJkXEbXmPNgqZ/hi7pnaeBJBK8+5RlOY7bAQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(53546011)(8936002)(38100700002)(66946007)(31696002)(54906003)(316002)(508600001)(6486002)(66556008)(66476007)(6916009)(6666004)(2616005)(186003)(4326008)(8676002)(5660300002)(31686004)(6512007)(26005)(2906002)(6506007)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96dce694-757c-4975-696e-08da2364c39e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3q2WdEy1EXLOvGI+VjzwEIbKZ6246/ABta5vFxrOeZ1TNWyK8eNoJ5T8Dr8CziLqd2jLXjRYFvySwtBbpOvw1Kc4KR6SPuJEGPtw/xcPUEBwEodJChR+Uaz7g8Gv1Ju8Gb/4JwsjkLsE5BcffUtlDhhM0LXJpZJwqcjn1nxRNetnR0Pb7zL1QMmo9XtwNBbbIwq6AXHS+Grj3PuwOVT7MXlHDfozDUvWIJo/s2roWV/Pc7V6gAEeVbuBXvwkrTUyB89/ARR9vvLUPit+5qGhCSNz1RgJX8WEpP5/kEHiKafeIqOYO9SuoMVSlrLXspnTGtgzieMYTk9Evojki1Uo6ri3E0XE95n5KADYCIigg2rh9iKJX77vDqKx1A06AumajcScbLR2Jnl3/9BInz61U8bCYxdf+MHb+vPiNpVkVvpgy6E+UXT2vpM6BO4kMbWvs2DHobVv9I5qYYCgPOdzijX39UjUcSuHRwvlf7JYoPgZOeXooIS0ZFxjwv3clSLSxMhglnPEX9zJ88Kn4mYex4yVoPcSncdeHg3ddNbSVG0cen9y5FwQD8x35cCeSauRMOevIAtefNjrifblHwfSnvBYP/5wTt/LDEi6Sc2LOJ7Xx0bYofz554N4WhKNV2OeyMfMqw8TNqTkrcNNhMi4D5FHcT4HpBcvfRqbFCHaz01MhN7nZ/qzJsA8RiGpAQa6j0cQbM251tUmQafCXGa7uw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400005)(70206006)(70586007)(54906003)(81166007)(47076005)(336012)(36756003)(356005)(36860700001)(316002)(6862004)(8676002)(4326008)(31686004)(8936002)(2906002)(6512007)(86362001)(508600001)(26005)(2616005)(6486002)(107886003)(53546011)(40460700003)(186003)(31696002)(5660300002)(83380400001)(6506007)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 07:01:40.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb1cd32-07ed-4ab6-e09b-08da2364c96d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7036

Hi Stefano,

On 2022/4/21 8:25, Stefano Stabellini wrote:
> On Mon, 18 Apr 2022, Wei Chen wrote:
>> x86 is using compiler feature testing to decide EFI
>> build enable or not. When EFI build is disabled, x86
>> will use a efi/stub.c file to replace efi/runtime.c
>> for build objects. Following this idea, we introduce
>> a stub file for Arm, but use CONFIG_ARM_EFI to decide
>> EFI build enable or not.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v1 -> v2:
>> 1. Use CONFIG_ARM_EFI to replace CONFIG_EFI
>> 2. Remove help text and make CONFIG_ARM_EFI invisible.
>> 3. Merge one following patch:
>>     xen/arm: introduce a stub file for non-EFI architectures
>> 4. Use the common stub.c instead of creating new one.
>> ---
>>   xen/arch/arm/Kconfig      | 5 +++++
>>   xen/arch/arm/Makefile     | 2 +-
>>   xen/arch/arm/efi/Makefile | 5 +++++
>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ecfa6822e4..5f1b0121b0 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -6,6 +6,7 @@ config ARM_64
>>   	def_bool y
>>   	depends on !ARM_32
>>   	select 64BIT
>> +	select ARM_EFI
>>   	select HAS_FAST_MULTIPLY
>>   
>>   config ARM
>> @@ -33,6 +34,10 @@ config ACPI
>>   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>>   	  an alternative to device tree on ARM64.
>>   
>> +config ARM_EFI
>> +	bool
>> +	depends on ARM_64
> 
> As ARM_EFI is selected by ARM_64 and it cannot be enable via a menu (it
> is hidden) there is no need for the "depends" line here
> 

Ok, I will remove it.

> 
>>   config GICV3
>>   	bool "GICv3 driver"
>>   	depends on ARM_64 && !NEW_VGIC
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 1d862351d1..bb7a6151c1 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -1,6 +1,5 @@
>>   obj-$(CONFIG_ARM_32) += arm32/
>>   obj-$(CONFIG_ARM_64) += arm64/
>> -obj-$(CONFIG_ARM_64) += efi/
>>   obj-$(CONFIG_ACPI) += acpi/
>>   obj-$(CONFIG_HAS_PCI) += pci/
>>   ifneq ($(CONFIG_NO_PLAT),y)
>> @@ -20,6 +19,7 @@ obj-y += domain.o
>>   obj-y += domain_build.init.o
>>   obj-y += domctl.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>> +obj-y += efi/
>>   obj-y += gic.o
>>   obj-y += gic-v2.o
>>   obj-$(CONFIG_GICV3) += gic-v3.o
>> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
>> index 4313c39066..75ef180233 100644
>> --- a/xen/arch/arm/efi/Makefile
>> +++ b/xen/arch/arm/efi/Makefile
>> @@ -1,4 +1,9 @@
>>   include $(srctree)/common/efi/efi-common.mk
>>   
>> +ifeq ($(CONFIG_ARM_EFI),y)
>>   obj-y += $(EFIOBJ-y)
>>   obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>> +else
>> +EFIOBJ-y += stub.o
>> +obj-y += stub.o
> 
> The change to EFIOBJ-y is not needed here as EFIOBJ-y is not used.
> Only obj-y += stub.o should be enough
> 

I add stub.o to EFIOBJ-y that's because I want to use the clean-files
in efi-common.mk. Otherwise the link of stub.c in arm/efi will not
be cleaned in "make clean".

>> +endif
>> -- 
>> 2.25.1
>>

