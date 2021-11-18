Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A5455526
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 08:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227129.392750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbW1-00066M-1Z; Thu, 18 Nov 2021 07:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227129.392750; Thu, 18 Nov 2021 07:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbW0-000649-Uo; Thu, 18 Nov 2021 07:07:24 +0000
Received: by outflank-mailman (input) for mailman id 227129;
 Thu, 18 Nov 2021 07:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bdp6=QF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1mnbW0-000643-46
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 07:07:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2d8089-483e-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 08:07:21 +0100 (CET)
Received: from AS8P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::34)
 by AS8PR08MB6725.eurprd08.prod.outlook.com (2603:10a6:20b:394::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 18 Nov
 2021 07:07:19 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::66) by AS8P251CA0009.outlook.office365.com
 (2603:10a6:20b:2f2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:17 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Thu, 18 Nov 2021 07:07:16 +0000
Received: from 3404ec6f49be.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBFDFCEC-013D-4094-BC64-E74A81DF8E2B.1; 
 Thu, 18 Nov 2021 07:07:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3404ec6f49be.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 07:07:09 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6281.eurprd08.prod.outlook.com (2603:10a6:10:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 07:07:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5%3]) with mapi id 15.20.4669.013; Thu, 18 Nov 2021
 07:07:02 +0000
Received: from [10.169.172.97] (203.126.0.113) by
 SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 07:06:59 +0000
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
X-Inumbo-ID: 2c2d8089-483e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=komqyoBXhTKnEseJYljA9LNOtqyhDG4nqHbtSQHMFeQ=;
 b=W5OB7tgde++GHYjrPzvewNDW48CNfI8fdUAu/xIoG3i/8ms5g3CXiwjnKYuHfsWM1GoS7g+Y2gtbfmzMBL/A77qQw3nMyGZYYT1zeN8YJNzUrNxcQtiXbETbtpmR2aw2PUEGyHTZr56ZGi+XPkFMCVZbBrKMB27JUW21yeiQK4c=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2d8fa461fd852a8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0npoRjAaxz1USGorVJ1POpL0MpDw0rosDveEm/01OdsAG1RdbW+jbabR1eh6oer5g/WWAyp33L54hg/gy3+LaNIiLfktsM7u0tFYafuNuDY8ySj6uPdR7aCu6Jc1WfyFjqsgZIg4Hf4w5vyrH8Jjw88g4HButC56z8/x5OTNn48s10fR8QYZZxIJI7vcmNm1jcDvq4FB7UJswiKNjXL34Hge4Xpenoek5EEDEFSLzH0Reqh4fXS6Lc8Hu7fKDjZppODVojtxBJdNIWDmySlXgoBsYkdDrBHBRk+1+zmXI99iDvHCwoNwhf8+a4EVzdWiGDewGQH8MQ1XhFemh5/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=komqyoBXhTKnEseJYljA9LNOtqyhDG4nqHbtSQHMFeQ=;
 b=bM5thjRApN0n4MUJgDE4Io++v/EdPL1ztvvpAu9dJPjc3kalODxzCJmesGldA7/FlLSwuovcauOLx6QjbVZYeYj4UjKmwTk+fV/MJwwLAuSzxPylStevEBkFPa/tmOQwwy4YnFt3sxpfSoK8vYYZvYmzOz8lJAoyZtpqg9exRhHgVcQTbQrhKI/S/0rOuLUjByXZxfD8zp9NWKAcKwQfiooiPgXAtoFvn2IIzvToB1jojtZz0IonUbacJdZlhc0Nbu5AYCrBFVfv7q7nhh6Rm6FMJKZoPqwG68nt4acs1RgLAIusEbew2LraRz6aqnwjJQUFzdvSzOAN8klOF8s7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=komqyoBXhTKnEseJYljA9LNOtqyhDG4nqHbtSQHMFeQ=;
 b=W5OB7tgde++GHYjrPzvewNDW48CNfI8fdUAu/xIoG3i/8ms5g3CXiwjnKYuHfsWM1GoS7g+Y2gtbfmzMBL/A77qQw3nMyGZYYT1zeN8YJNzUrNxcQtiXbETbtpmR2aw2PUEGyHTZr56ZGi+XPkFMCVZbBrKMB27JUW21yeiQK4c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <9e1d181c-69fa-72d2-40b3-72ce6479c3eb@arm.com>
Date: Thu, 18 Nov 2021 15:06:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] x86/alternatives: adjust alternative_vcall0()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
 <9b6620ae-308b-c1c9-939f-74e24c647e5b@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <9b6620ae-308b-c1c9-939f-74e24c647e5b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f82d291c-d85a-4410-2943-08d9aa620e3e
X-MS-TrafficTypeDiagnostic: DBBPR08MB6281:|AS8PR08MB6725:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB67255EB6C51F3345CCB6E4CD9E9B9@AS8PR08MB6725.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UdC9pay2sluZg9CMekBTKB2iUdCWDfkxOUzaK3MAM6GpSHhSlKDbt0AGi9yYXs4GyELT/WV+yw2DQbc5HNCqtTWFhYG4ljXCIcx3XMZFzeJmmuuZC6AlHgAosT0YT2ZXj6Qg10oPGhCMW/yv0v20wPm3CKE0d5EuEyw2eTFiTmC32HI6HwGh0wapxFSAmrpWk1M3YQPbRhJOtNNpr2lrFSo0VgxMwIcNTUBOH9gpySart2RIPS0mWZrjtlg2mlccCRtaz2is9oMmbKrSZvHKNoEaS2pLQL4zx+dNf+LhUjZepfqhsRw7XbipUMtu2tczIsHz/BTEay6DilnohaOwO2ECyafJW6hzK9heA8zyiNCh0JsWn4KbT6HUl4+T8oRIZseaR4WHwJGVauXdn2CpMq/lYzxT303rO9yGzuZAKYDUUkwhnp28H5rLQUA70H3MMWF0iZFIg2olLrGhS/AL3U1MTbQrLvXCh3HUhzqQWAy6bwLoDnfhQOVgm6a3+gp4KK8UYKQZSSboIb9zeI4k952MogUC9cnSoziqK0fz5GXOPGVO1r6KJ0kqqBBkuKoa2QIeEnwmxM3Eh5lW5jZ7VfaI37z7TnaPvc2pxgVgK4ZU48v0o5L1rBdKh15WQbI+gKtm4jrqwoYGtx7n9qluQSmIDgkvTjHbGWdBfH9stBeTfQOlwl7xuYiqpFisIl0cYI0yyJ53fw5BN/FFi2bASFBT/MPQ/hnRayFy0gILdiQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(16576012)(508600001)(8936002)(4744005)(6486002)(66946007)(31686004)(2906002)(186003)(31696002)(6666004)(316002)(26005)(2616005)(110136005)(54906003)(956004)(36756003)(5660300002)(8676002)(4326008)(38100700002)(53546011)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68fd8a26-f4a2-48a4-7c5f-08d9aa6204e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vZZc2nwPk7TfBkRQgSZfBzTVnS8JS4zbb3Qq2QOwFrwcFqNWvIZFxbgDF1sJe4caRW7TNMwkqkCI1OxT7UWsowuqNL/zp0Bsgn/mEaYv8JOx8pv5lMPvEabvsgSCAW+VZgY19MUWs89QcZQNGcmubxz5zdQl2XG2D0vdkHsSIA08EyozJGyJeI38yM1j9ZoBhiWPZ+HcnhFpGxf+do/zuq3IODGUMMunab854qPtAlpEhcJH42PbnRNWPzsAR7jGn0AJ03rK2DoQGTd1QDA2T6UeB84bsNvaDD8dJjYyfRWhCYYVfzXf/ofl/Y/L9PLohUtQdGRL74EsGqQb3HgTjMTylV+w6SI8ZN9dHPvCdg8I8QCS5OrZu3547qO/xyNxPVSlc8+zfdVs7OR/OAMzCPEkLH6yeuxuGAmlsCEn4tSH/rCmEZDM0u0RoabcNogWND6B1zb2n4YEFmCeJ+K0b1YvnF9Yg1iXtzIYUi0LuHVwM7sAbg7NIlWmnnvCl9pTTmMPoaQn95+Ug06yAY3dLqRMKBTNkeyDrfiJSQFWirZTE6NRu6RdZInT4qIxBNJdtsWYpPZsJTNm4JfVu+Ue8obgjfaXekENtV3YcatlFMpbwkIhgiSNebeIZDiZlY3FHcEsTEzXjEOLjAgfW8MeJpn/b0HXgRKv9A12Zr2N9fqgV7qtunLBWuGqJwVKDsCNaJu19HG13MpIIoxv2v+Ad/HgNTq5Ki6/ZS61MFWsurfqcwtu6gf2OZErJzd9N3a6pJOKmJjl8TYu+GD4WGRWHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(316002)(16576012)(63350400001)(336012)(956004)(110136005)(4744005)(36756003)(70586007)(81166007)(6486002)(63370400001)(186003)(5660300002)(107886003)(36860700001)(6666004)(86362001)(8676002)(356005)(82310400003)(26005)(70206006)(53546011)(31686004)(47076005)(54906003)(508600001)(2906002)(8936002)(31696002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:17.1519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f82d291c-d85a-4410-2943-08d9aa620e3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6725



On 2021/11/17 16:00, Jan Beulich wrote:
> I'm puzzled about two inconsistencies with other alternative_vcall<N>()
> here: There's a check missing that the supplied function pointer is
> actually pointing to a function taking no args. And there's a pointless
> pair of parentheses. Correct both.
> 
> Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/asm-x86/alternative.h
> +++ b/xen/include/asm-x86/alternative.h
> @@ -218,7 +218,8 @@ extern void alternative_branches(void);
>   
>   #define alternative_vcall0(func) ({             \
>       ALT_CALL_NO_ARG1;                           \
> -    ((void)alternative_callN(0, int, func));    \
> +    (void)sizeof(func());                       \
> +    (void)alternative_callN(0, int, func);      \
>   })
>   
>   #define alternative_call0(func) ({              \
> 
> 

Reviewed-by: Wei Chen <Wei.Chen@arm.com>

