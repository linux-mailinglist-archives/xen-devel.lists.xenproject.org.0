Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1CD50983E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 09:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309816.526302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQsi-000158-Iv; Thu, 21 Apr 2022 07:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309816.526302; Thu, 21 Apr 2022 07:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQsi-00011c-Fc; Thu, 21 Apr 2022 07:05:36 +0000
Received: by outflank-mailman (input) for mailman id 309816;
 Thu, 21 Apr 2022 07:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/n2O=U7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nhQsg-00011S-Pk
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 07:05:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f745f88-c141-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 09:05:33 +0200 (CEST)
Received: from DB6PR0501CA0038.eurprd05.prod.outlook.com (2603:10a6:4:67::24)
 by DU2PR08MB7341.eurprd08.prod.outlook.com (2603:10a6:10:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 07:05:31 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::90) by DB6PR0501CA0038.outlook.office365.com
 (2603:10a6:4:67::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 07:05:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 07:05:31 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Thu, 21 Apr 2022 07:05:30 +0000
Received: from a8f3234f7f5e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE6560BF-D1E4-4E95-8974-41FE49EE2AF6.1; 
 Thu, 21 Apr 2022 07:05:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8f3234f7f5e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 07:05:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4936.eurprd08.prod.outlook.com (2603:10a6:20b:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 07:05:22 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 07:05:22 +0000
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
X-Inumbo-ID: 6f745f88-c141-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ+obiYyCB7rESgWXHYYrBcZ79Glzjlht246yinLcgg=;
 b=WdQ4LzE964lKgLO2UsWrglwljV3xSqBwn4P6zKJocHJBSERyutTtJw8myeax6JSdwTCC5T98MYAyCjmbRSKLsewo6ZsG5FtOmn8+kLkjKYLG7ZLIK9qlFS+f8QtuOI+3A6qhD8Zb5bXXn09XaZxrtHIRcsq4JRXTnMFD19c8oe0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ed7141db5728a4f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efUPtaAEdZ8jXNTb1L/2VYPc08qn6Twkr409i4nA3Vd9VVPoX3LPfpj9fhb4W+IovMUjqj8PH7bIAkV+IIDIFPa9OhzKXto5u48XNW75sv7eVioULALV1OxIPt/MJCk/tFVIveCnJ2ezCoT6zKiH8cChS6Ai7R55jcYkkKkgInuxlG8v7ojyK6oGQVnGiy5FoY3YXiiqE7IkiqdyLgZR96EriIBT62YIMFYX7pYV3PT29vdzQ1hbC0Hsuren024z1iuFUNiDk0L29qrGyoaeME6XjTI/wMB1GPgdmy/VdPVsXs2ZZ+9ZCESYk8FkvscbzI9LWlIDuac6DOvOLJzbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ+obiYyCB7rESgWXHYYrBcZ79Glzjlht246yinLcgg=;
 b=G7j/0LfkuvF/IKbuQ6M3wbxepgb0g0jVcBFMF5eJesCEqlrLj2VkcaNHj/A9nbL0BS2JEqa/ctITYcHFOgXUiIY63wiuLkd7S/qygL79mzhfq3gSqxWsYvYIlFdizNYE6KIqAyDaB+cb0rqSADAJkTVvmB1r2HaVTv8OspS6aL4Ke/jKS3kVAXmrdpSfivZ/qW+lSOvBIEeArhtSRC9B80eeaE3rd+2rRKO873aA8B6W1Rx8fKRH/gJrlGm74yMmoAy33Y0Fp9A4eZFTRNbOQB+u9RuaK6/guntMtCzjvYFw4UrjbQPW9LzYzlIfGME/nryBGUX3VU2ljfDamu+W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ+obiYyCB7rESgWXHYYrBcZ79Glzjlht246yinLcgg=;
 b=WdQ4LzE964lKgLO2UsWrglwljV3xSqBwn4P6zKJocHJBSERyutTtJw8myeax6JSdwTCC5T98MYAyCjmbRSKLsewo6ZsG5FtOmn8+kLkjKYLG7ZLIK9qlFS+f8QtuOI+3A6qhD8Zb5bXXn09XaZxrtHIRcsq4JRXTnMFD19c8oe0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <6e5a59a9-c61a-92e4-d3f8-6bbcb49372fa@arm.com>
Date: Thu, 21 Apr 2022 15:05:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from early
 uart
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-2-wei.chen@arm.com>
 <VI1PR08MB3056693E070014DD4F7A885F92F29@VI1PR08MB3056.eurprd08.prod.outlook.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <VI1PR08MB3056693E070014DD4F7A885F92F29@VI1PR08MB3056.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b2490fd7-4399-453b-d7c1-08da23655293
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4936:EE_|DB5EUR03FT049:EE_|DU2PR08MB7341:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB7341CCE5ECE6607D764ECAEE9EF49@DU2PR08MB7341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8EF8zcDM27DLU6zKD69eDfHtEfxt617XbDLMiBBJjs4C7icTRBSahU60VSEehLGhFZBwPRkX1X814vXT3CFgho1Vjs3ugq5HVJrsp3F46y6LspFMb+CtRm/R/vh8GiNrU6sDSMO8MsPD/aGDu1rt9ngkXBfBDyti02CHLtP2I5Jk8rtlN/Vx/8tLIZJycAq1lbXL0l5UNOaQBQxK45xeESRL0wuxzd8XtGmKcxkeE5erWiOKapQ931CNPrYZwkTn4u8WW7sBhA+aRJVegNy4oOooowJmUcChWz8ueu6yZWbiPrFNQ26727S+CXFvf8QAmBJehGGc60Z1TNwMm55iz07RWbHzlWvOFX7YHYPy8/20C0QLin2B8rrcXUFyroIeSOpCL4GUqBn1mbcoR4kNBjNINY7rIcq2ZgaUbECZVE7WdgMLC1ERZlQ8+nrYEDeYdGZowvRaYDwobJFuutitWrSRoZTWez3dJJc+k7s5kh5DfxAw3Rmoieaoa5wlIDXlaO4ZM5AZ3W/ymjB9rIyZWMLZnJ3aeaErA+mG3AsGUTgDVv89ufIXM85rjU+gHxn/EWCbh8X83NfsFPgKPiNkLJLc5T++KFjK9D549K+PJ6QlMirZf/fZtOXtXjSdq4WSAaXx8PxI9aYij/xe4htVhde0kLn2tfA2BnYa729nlcf3DiIct+KigNssl9ZlOWRojnyuuEqvFshHVDK4HbENxzAXOD+SWgha2jiFW/MF2bM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(4326008)(6486002)(8676002)(54906003)(316002)(53546011)(2906002)(6512007)(508600001)(31696002)(110136005)(86362001)(66476007)(6666004)(83380400001)(2616005)(186003)(26005)(66946007)(66556008)(31686004)(8936002)(5660300002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f7ae7e2-5c49-4c84-0736-08da23654cfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVL39RFkB0RMXaZwLfAZAFw02s3iq90B8E6OgB2fGm3uNQbbzjBNj9rizumekWJ2DMRiZXkR4/r9ALIGn9DlS4Dp0bEJec8dDKL1v8sDX4KmIMY5CanuwvKqzCKwju/d/xNGHB/24Af0W9IvQqGp0iLdruJuNQJ9XH0YBOOOv+r3OJaMEUrrinAinFj/OZFnpl7BwW6q/VxGPfKQoU1KGPLybZi7fJ3lXY81uJyznga1JP22CdwaQPkKieAK64tOueAim3X/AIpEHfWIqZ3PvZnE2Fza5DXTNhz+ptomNjahkZ5zf63cJcQvg7LVZIfFFRW3UqGevfA2H7JsAZ/hbxicG00bHcxvg0sGaOem6yosz6DJuWx78JfNSFxDhcuDFkt445pket74waEi8fWss280jeSdLVxAaZFnnAHLBcC+xnTFSMCavBXr2+TY0ntqbgAwkIVO157qgH/PvPwvlsK8KSPdD74WM3PWzilkw/NooiVHflnLoX8XF8LWn3B+xnFeGkk6IUZ4qS5n5mkRf+iZzdlKR7E2bK5nWBvVCxnTBTDgET5BNaudV16Xc0nrWHd6Wd9ZgbHWcoQ6npd5ZayE4GfBqnsHUCQWW9TXmXLeZ+yiQCt5iPMG+Uv+mBUHRkaFy0Z9l1OypskOl/wDATNAqqXkBg/XkycFpfoGjjHzFJawz/pP206q8/BZtIzqlVF8JaRCWx1ZF6z0Za9EqA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(6512007)(6486002)(110136005)(54906003)(186003)(5660300002)(8936002)(31686004)(36756003)(8676002)(4326008)(2616005)(2906002)(107886003)(26005)(70586007)(70206006)(86362001)(82310400005)(83380400001)(40460700003)(356005)(336012)(36860700001)(81166007)(47076005)(316002)(53546011)(6506007)(6666004)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 07:05:31.0280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2490fd7-4399-453b-d7c1-08da23655293
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7341

Hi Jiamei,

On 2022/4/19 17:13, Jiamei Xie wrote:
> Hi Wei,
> 
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Wei Chen
>> Sent: 2022年4月18日 17:07
>> To: --to=xen-devel@lists.xenproject.org; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Julien Grall <jgrall@amazon.com>
>> Subject: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from early
>> uart
>>
>> Current putn function that is using for early print
>> only can print low 32-bit of AArch64 register. This
>> will lose some important messages while debugging
>> with early console. For example:
>> (XEN) Bringing up CPU5
>> - CPU 0000000100000100 booting -
>> Will be truncated to
>> (XEN) Bringing up CPU5
>> - CPU 00000100 booting -
>>
>> In this patch, we increased the print loops and shift
>> bits to make putn print 64-bit number.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm64/head.S | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index e62c48ec1c..2bb7906f69 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -866,17 +866,19 @@ puts:
>>           ret
>>   ENDPROC(puts)
>>
>> -/* Print a 32-bit number in hex.  Specific to the PL011 UART.
>> +/*
>> + * Print a 64-bit number in hex.
>>    * x0: Number to print.
>>    * x23: Early UART base address
>> - * Clobbers x0-x3 */
>> + * Clobbers x0-x3
>> + */
>>   putn:
>>           adr   x1, hex
>> -        mov   x3, #8
>> +        mov   x3, #16
>>   1:
>>           early_uart_ready x23, 2
>> -        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
>> -        lsr   x2, x2, #28
>> +        and   x2, x0, #(0xf<<60)     /* Mask off the top nybble */
>> +        lsr   x2, x2, #60
>>           ldrb  w2, [x1, x2]           /* Convert to a char */
>>           early_uart_transmit x23, w2
>>           lsl   x0, x0, #4             /* Roll it through one nybble at a time */
>> --
>> 2.25.1
>>
> 
> I have tested the whole patch series on Armv8A(config without NUMA) and X86(config with NUMA), both can enter Dom0 successfully and the X86 NUMA works normally.
> 
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
> 

Thanks for your testing!

> Regards,
> Jiamei Xie

