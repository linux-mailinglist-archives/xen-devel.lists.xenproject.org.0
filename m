Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA650981D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 09:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309811.526292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQr0-0000SB-61; Thu, 21 Apr 2022 07:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309811.526292; Thu, 21 Apr 2022 07:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQr0-0000QJ-2G; Thu, 21 Apr 2022 07:03:50 +0000
Received: by outflank-mailman (input) for mailman id 309811;
 Thu, 21 Apr 2022 07:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/n2O=U7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nhQqy-0000QB-Ls
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 07:03:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 309a193a-c141-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 09:03:47 +0200 (CEST)
Received: from AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44)
 by AM4PR08MB2690.eurprd08.prod.outlook.com (2603:10a6:205:5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 07:03:45 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::f4) by AM6PR05CA0031.outlook.office365.com
 (2603:10a6:20b:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 07:03:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 07:03:44 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Thu, 21 Apr 2022 07:03:44 +0000
Received: from e493116380c2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5D9CF31-07B1-448C-83DB-B94D7A32BDCC.1; 
 Thu, 21 Apr 2022 07:03:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e493116380c2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 07:03:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4936.eurprd08.prod.outlook.com (2603:10a6:20b:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 07:03:35 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 07:03:35 +0000
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
X-Inumbo-ID: 309a193a-c141-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9Esg3YoA6ses4DC0rYJeS9nw9MCvXOmCUoUxocmDVI=;
 b=8nPEELgMIpyJqKiSINbeIiRslqpSEK5WcByEL/LOfbvOyn8BKAh6iOXoR8E60LYa/CYmkLoUAJcTRmsf3FhYqXWCZFGBgNgqOaOKGvgWVp0qyb/kRfDZs2Qz1QWmZrWfWL0Nvo5NtYks54G9R8XUOWcrEn4OIkVuVHixAtHfcw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a57343a8b927f19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2flMK5ccI4SvnGgwUhued0y4gnuU57Nx1+Ubq0zdsvVy6o0w+OiUtxm/dcSXSW8sFfxFQbpKZ/T2Bt28vzH57MMkDaZrdPuGCmNpO0kiNqmpsHWFKw0mM4V0RL1YuXXkGz1ijSrhw5HAao65YYzzYboFrF2WT+6Hy7MIUbNL73lmA126+9WMrjauoC3guDHCOvx8melfO8nZoyQPSxZHDnSfiJr00k8y4E08oCyhcjtw/Q0DAuQRHxW1U7IRNEp5dkL7NsoFcqL3LhRs2ugIwSr0sKe3/ofgCN0uYggt98okrc52nvxk3FJyjpkwR8LuaBwP2UOojiAnDBPJIRQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9Esg3YoA6ses4DC0rYJeS9nw9MCvXOmCUoUxocmDVI=;
 b=QiRyCidcdm21p55gycx7rvEgmgH+B6eZADkLmgEkL2h/vENpnyqqAYF+LyTz5UQvfXpkm82u8mxxpcv3pulhNOw501ZxXjm7H6yztm6fqHf9OQ7+UVNLpJeL26QM7+9jTNL5F9yO8RHi2Cn5xElsrAt6S+Fc07kQFxeWUgJHmF/UmfTo4mQyW+bNCTi0uHZtHPq7TtaXUDLPJCepZwbt+Tc/Oh09VMLq8NK8s0FCdSnKdm13hSQckROVKlK6XLFK13D8ptvHH1q3e/H1Kv5ZQ3ZiR0ImVFRWVpFvwShfkGpT+mQ5BI1g9Dt/BKOjYr8rafabth6dCaiQFVNHryfbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9Esg3YoA6ses4DC0rYJeS9nw9MCvXOmCUoUxocmDVI=;
 b=8nPEELgMIpyJqKiSINbeIiRslqpSEK5WcByEL/LOfbvOyn8BKAh6iOXoR8E60LYa/CYmkLoUAJcTRmsf3FhYqXWCZFGBgNgqOaOKGvgWVp0qyb/kRfDZs2Qz1QWmZrWfWL0Nvo5NtYks54G9R8XUOWcrEn4OIkVuVHixAtHfcw8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <de8082c4-47a4-305c-3110-5c5990a2229f@arm.com>
Date: Thu, 21 Apr 2022 15:03:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 06/10] xen: introduce an arch helper for default dma
 zone status
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-7-wei.chen@arm.com>
 <9ab21bd5-7208-0000-5274-3c970ec6768e@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <9ab21bd5-7208-0000-5274-3c970ec6768e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f9e74e81-cebd-4cd8-136c-08da2365133a
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4936:EE_|AM5EUR03FT040:EE_|AM4PR08MB2690:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2690868CA9341A5BF8BAC5B99EF49@AM4PR08MB2690.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WsNDahYxfquEkuaBtE17aOPDckbfnd27glb2OpkuxchPxUXrH1FJ/Mp1egKNQ7Su22XfjiY8BlvQQ4M7yZq9oM9R54Dw/Wd2PmG/C1ZKPJV94qTfNst7mMRd/0jPTT6AUbNwx0UUrqFQlz+x6rHtlwueKquBfyxOwdmar0LGUsdqgOxJFC2v37xLduZkrsol4CPIgFxvsKRdcKLxNrGqS2NlVGPB7rvFot9zyqgJTrvwdlRFZdn2eMkwk8qXhIVPi+aYyJjb48e0hqii33cc65bUUUwWpuz6MXbkUWZRPl46Rry748kt1wMeQ5bCPsUkFjJVLKzeTcvJbHuBnT2iIvlDo6OHsGE2YTk83GSaDZpjdyS3S0EXsfJST95Yav37ZambFgHNYya+HCX6I5S/BdPdyhNHpWgv2+7LOppNcJWnpAz4PTx0X64BsnaqcPehApCpRez2vVw46AQ5XhCoy2DfS/EV5MTNccYGpvZxuDbvDHLyzQYzYNwAZRVqP9m9jzuJhZxVBtefwi3VzFNEQhEShzhAxduaA6Amglkr0lvQr2GrRkB373BPJ860LiUkO/nWx6vZ8+uRFtKiplnkKGbLHLRCkaMg+VdrV+WvaToEKJYZxOFesRIHlps1rKtfAhBg/buFqVvGqAClYSnHKvGr02+uv9Ub/y/n8G4SUU08GQW5PXnPJCrf69Hcrp1NQEqH2UCQIFDngX1MLzILOrk7p9wJYDmBp2mDoJijgjtBc3LuFvwZe0+/TtQoMjqJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(4326008)(6486002)(8676002)(6916009)(54906003)(316002)(4744005)(53546011)(2906002)(6512007)(508600001)(31696002)(86362001)(66476007)(6666004)(83380400001)(2616005)(186003)(26005)(66946007)(66556008)(31686004)(8936002)(5660300002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1e5cef6-d72d-46ef-9b04-08da23650daa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4veYHLiITE8ZfwALXGxe9b6CqqM0HlmYyOOt9N7jjEfm/FYznilFOsxibIZqLzriQWFYx2TljwPYtbvLTrq4Dw/ECMCviFc3keCALYxMj/Y5Z68FE8zukcD5QoiJPZLFu1OnFba/Nt+jfTR/6WDvVKGzHYBqM6Z5vCD52Mp/Sv3rpVDWx/TJGBR9pQmgUCKy+cSWsw0r/nMa0V4ze4TCFYpA7KYVwfjDhQp+CfzfdRgUfsxM4xcBbr5YMe/mqmvwDBSkCa9NQQ0EIbGZEDLHbjQ3x1+//HrSKDpRTUUis2tagzWqxUr2KWvSbt3NIuuJJxJxZuy/S9C+oWhHAwLahEAxEUjqtSv7UK8i7ginXctu8x/XrzBvEAlJUXM5M8lI7MJsvzq1dNCriJX5jsfii2AJh2DjB/ptQArRpmYgbDbxmqhE3EsMLPMxlFZtcLum1W+bDxztT55n4TFzJHVaE4aRU/LN8xytr6lScPaUbmY6e5gWiROL3/R0zyj8qyKfa79VYPwNUXsgbneGsbM+U7PeXeMOiyiRix83GriYEmmOxwiPAu1hbbhR9O6BiCO/cuqEkR5sg0IlXiF390qzovBVIsLPCLImwjmzABhrNiF2GhZff9Gf8vgwPhwhVyY7q3gHTUys4uQXvXRT9mK0vGL5UvYBygW1ecFyd811C9T6mvxZ3ifkJBExbvRcN6JcFFFU9wLJnL7hK+v53zXnRA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2906002)(26005)(336012)(6512007)(8936002)(316002)(54906003)(186003)(70206006)(70586007)(82310400005)(81166007)(6506007)(83380400001)(8676002)(6862004)(4326008)(31686004)(53546011)(6666004)(508600001)(4744005)(36756003)(47076005)(86362001)(2616005)(31696002)(5660300002)(356005)(36860700001)(6486002)(40460700003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 07:03:44.7059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e74e81-cebd-4cd8-136c-08da2365133a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2690

Hi Jan,

On 2022/4/19 17:18, Jan Beulich wrote:
> On 18.04.2022 11:07, Wei Chen wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>>       }
>>       nr_bootmem_regions = 0;
>>   
>> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
>> +    if ( !dma_bitsize && arch_have_default_dmazone() )
>>           dma_bitsize = arch_get_dma_bitsize();
> 
> Considering its purpose, may I suggest "want" instead of "have" in the
> hook name?
> 

Ok, I will do it.

> Jan
> 

