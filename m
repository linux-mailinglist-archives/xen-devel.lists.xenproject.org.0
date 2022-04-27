Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CA511124
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 08:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314378.532417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njb8t-0000Dv-3l; Wed, 27 Apr 2022 06:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314378.532417; Wed, 27 Apr 2022 06:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njb8t-0000BY-09; Wed, 27 Apr 2022 06:27:15 +0000
Received: by outflank-mailman (input) for mailman id 314378;
 Wed, 27 Apr 2022 06:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q6ah=VF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njb8r-0000BS-5z
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 06:27:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe02::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11c1ddc2-c5f3-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 08:27:11 +0200 (CEST)
Received: from AM6P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::15)
 by HE1PR0801MB1882.eurprd08.prod.outlook.com (2603:10a6:3:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 06:27:07 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::2f) by AM6P191CA0038.outlook.office365.com
 (2603:10a6:209:7f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 06:27:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:27:06 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 27 Apr 2022 06:27:05 +0000
Received: from 5802543eca52.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 15867770-A631-4EB3-8778-CB18276260B7.1; 
 Wed, 27 Apr 2022 06:26:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5802543eca52.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 06:26:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR0802MB2590.eurprd08.prod.outlook.com (2603:10a6:800:ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 06:26:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 06:26:55 +0000
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
X-Inumbo-ID: 11c1ddc2-c5f3-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JSbA1aE6Na+q1MZ2qXsAPt0LwtSFphwApCVi1Nx+yG87IwkBs7ng88vQ7yEfXo92Gni9hZRTzZqSwjWz6KSul3RbfQWZY/FBTxLHYp0bvYnepotbT3q02JDX1jjxYniX7cvBVGdRbrhCrAKARtQe8BrV7QbA+C0oiiy9SsoilIOyMNCLNU8ySvFrMWErozBS08o7qqXeGgh3hMhYcZ5/b4iUhcTJCPREuv7H00umQJEeJ8E5R9ChsSLt0J2NT/aJcGONZV8fcuMBcU0A55ojqxjR9ADoZwV8y23zNJrHyVtYRFHuj01lqUPWz0A/YrShsGIPd8RpPt8yNHiL2Wwwzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5h1RGpd18C//EniB6JdZ2FKRhqfZ1+dLqJqi6X25ds=;
 b=Hl90H58MSVD3qq0Kc+L9M/xI8lTDinF7JsvchLfGVcOI/59j1KOUkFH0hq1/e3TCiYz6nQ6cbKX/OpAninAMF20b6YWNwuny0xjM431V183YfstNy0XMkVKOIql37ClUDgp3mwts2nHBs2JvvGeiJoiN5U4nl/rbSeun83Kc6xLMw5D6rNwmf2DvlivL72VE8CBcCO1ZFSeA9NGUmAiJ1SdIo/t/nfbgIhxCerpHPthKjN8v1sT3FmspMNaFfbOfcxi/DqEGPmEJBGQZugaMMq9IyhCbS3UDv1Y0ng+Mem5rMGQ6Q0XbYrQkIacVs5bi50B9OzXcv4ZBS9B7Wxkhcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5h1RGpd18C//EniB6JdZ2FKRhqfZ1+dLqJqi6X25ds=;
 b=fyT3KZsY7MPa222r9f5hpA9PuQ19CxG3jURYU4FhC6yd8t5rgS4r7DyvC++84cdTf9flZ6E5BXVq4kW5+R97vlVUk4ukk2uSzddMNMbEM9j4/LGAwi60ha0qhgl40HrGriUIQLhghPrgRw6LM+i7zWvksqMudi1cCm6PdaAlXYA=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0416e6d0d7e8328
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOpknIYWaqYv2GCHOdyfmAuVUD4L9itzCSO94eOgHTP03OYMlq6YslHNBn/sz1A9dXAwP1VMVeyTRoRv4Z1nX6p187TSXCIk0lvv0Ttqc/5ZHMkr9jYRxXqdDlqTrLELWwvmyKjeKLeayIWA2C7Ug3tjkEOAU2d+QkzjZGhf68lKw7UM6AtEHc4Qg1LkVd6nJeCjrfix/gLx7n7hz/Zzi7Q19CAVutz1o0Zn0l98TPBvT16zh4xqOwXqaDShqMPdtgvMw0NjVr3mdhSFfViisPAl9W9mTPC+b3Qbx7ZDSaEucQ3HRbN1sBUU+02BK9cSLZzSCUtaNIloVMl1RM6Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5h1RGpd18C//EniB6JdZ2FKRhqfZ1+dLqJqi6X25ds=;
 b=K3bmFASUNXy24Hq2EaS1/YmM1dFtxzgmpqlmkU+NsV+8tbcdjTm5e07WgiG5VERQyTx+/gCxjg78F/lJI9DsYoG+/YNQC4T+bo4+b4dBisFF2WDrvVMcARTB/f1snB3WBQPEmPExLsSt0myXzzz7AE3++ihQ6KlS4LzKAqitSKXzb8ikH5DLTMw0v2Q9qpku/WGAJWGmPhPFK+k2T9jRexalWJtkrUXuZc8y5Ol6TdLb2fd2psmFGhYVnpKQe0T4J43JFJyd8MExyHa1dm6naG4ZEgw4iU4XYeVfeW1KWglXXoOYyLIr7FrVYhAS63/P+ec2hOvWZP0kQBLYJAIevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5h1RGpd18C//EniB6JdZ2FKRhqfZ1+dLqJqi6X25ds=;
 b=fyT3KZsY7MPa222r9f5hpA9PuQ19CxG3jURYU4FhC6yd8t5rgS4r7DyvC++84cdTf9flZ6E5BXVq4kW5+R97vlVUk4ukk2uSzddMNMbEM9j4/LGAwi60ha0qhgl40HrGriUIQLhghPrgRw6LM+i7zWvksqMudi1cCm6PdaAlXYA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <d70072d3-bac7-63e8-a2fa-3e724c53c5f7@arm.com>
Date: Wed, 27 Apr 2022 14:26:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
 <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
 <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
 <413651ff-55a4-61cf-efed-7ac82f7c6723@suse.com>
 <PAXPR08MB74202E608E9A967458664E7A9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <bcb8a2e1-7670-8a53-4d81-114a30963a66@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <bcb8a2e1-7670-8a53-4d81-114a30963a66@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2c91990f-0f88-4e81-8a9b-08da2816f32f
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2590:EE_|AM5EUR03FT005:EE_|HE1PR0801MB1882:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB188242A5F1F395CFE87021E39EFA9@HE1PR0801MB1882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hnbj68cbsyE/n+LTwRTSbXMfbzDRp86iFxNEcSxIa7x5cuuFpwe5iBonjpqX25/oC2HDTrKJIHsbWL23tOQyxm4yWBtw1Ig2QI8ECN0eWKjR+rCPXxaXrsp+dnFE6LVfMSVfNS6DyB3lQVlsinjZpArsfnCTQBwj9o5P2l6vXHMO4YGH15AXVBMEu1cmVWoxQbJdztnpH2JDTrdhtPRBNLuB9PXQy2zze7JdHnNq/CQ99PKc3wxgwoqMMPaxS17KPX1whJ7JHlBDTbGOX24r7PRzZxHXBeMRWDClGQBQNO3hMcR72kg+ZFjJF0pJDOgbhdSQNunE+8UB0bx7Du/uK6xVH3t/kyBzJLqazxRX61EkGVzlOQ/dLKolXpOYC3/Mb8kVtoSmyCwEHOUIcTtQqCs6rN3/U3AG8fsisP65OcdRpJFc7+bx/RQOk+f3sRItVnx2e+NNOyNBukrfxCFxWuyQl9t5GV6Xra9Y+HBCHKJaQrCcXOoYrDMEV2X+fZbFQdW52ccKBFNwegbBoEtk57+nrEhM7AI+DyVQ7EmvNwJQbjVuawLiFWmiBxwVWBNloZjPeBbxr5esX/0JrqGFh2LL9Nd7bYRMSLVvhnsC4njzma5DN/zEVoh2bwg8nqdfD1vgi30Q7asOXnwJaQ1J57iCqLUgS+nyNRj+/aOAdOK9a/yYdmksPDbHWwWTv6ytio0tbP8wBb3flisvVuuBM1NeCRuWIujDR0cvbTy/634Eg0xR0KrntXtywlI0nCO/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(83380400001)(186003)(6506007)(53546011)(508600001)(31686004)(8936002)(36756003)(5660300002)(2906002)(66476007)(4326008)(2616005)(54906003)(31696002)(6916009)(66946007)(8676002)(66556008)(6512007)(316002)(6666004)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7931ab2a-4851-4584-5cae-08da2816ecc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wxWAuLj0w5WRD8RHbBkbuJTaO21mZgcUP9+PiLxyzN43HsvmXgTUT4B22BeZlu48sbb/IyMQtPoZe0Pao9ZMylJLbyZyeU7AhobmO87Teljp2bepSseURRs8cF14jNUwXpb1fx5SfBT8d2P0rdlKEtxOmsdHpwecjZMGlyXDuutkTaJxqwoMGmaZZlHn52ATDCUvGCVMcgGX05yeslV7+QDYCZgFV+INx3DUwVBNtBoFZq/DKpBzAyPd+c2f2hS6JhCXmIHwMM+dv1mQKlkvFY6Es74ahIvFqXnGu0sT6tgLShTLyS/10QehTXEc+y6mZsGPs+9HWbGOl4IHAU0maUcJzwXOXsdPv4r1yw6nzBLgZqEPQ62Ybb1kSTJRs38FW6gPWx990H8OKWVoZAxquXc1QsXgS0e5iNB9Q7xzU6GNPmzjvXJSWZBtX7Uv6p8BYS2OyOoTwpxvC/gwxAZjTwYOCV5X9wiQvCFZd5zgN7bVKZCDI4j3nyVCvhiefXPZl86Z0kpgDhnsuiA/fvmuxTQtYnXTWZaikKuRv7Jbe/PTm+oqQ8x+cn4tXrYNfYdHzGYhFsqlkSl/SntIcqP6LzJXFEg+/67suNfNsXv/Z0Z+vfP7r+V+lyqfYbeb4ZXgwh5d05bNuYw+n1pzGRuIV/OFw1gp5PTPDF65LoVBanRzgup21qAzNHhmgmBmw6Fcyc1xsNKxMz5HLxibi5Q1I0Y0k93gd/FdGv6a36SFlGyCZpXvAxNQ83b7O1BCiZMU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(86362001)(2906002)(2616005)(36860700001)(81166007)(336012)(40460700003)(186003)(70206006)(5660300002)(70586007)(36756003)(83380400001)(47076005)(356005)(82310400005)(6666004)(53546011)(6506007)(6512007)(31696002)(26005)(4326008)(6862004)(8936002)(8676002)(31686004)(63350400001)(54906003)(63370400001)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:27:06.0092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c91990f-0f88-4e81-8a9b-08da2816f32f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1882

Hi Jan,

On 2022/4/27 13:54, Jan Beulich wrote:
> On 27.04.2022 04:56, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年4月26日 22:31
>>>
>>> On 26.04.2022 12:37, Wei Chen wrote:
>>>> On 2022/4/26 16:53, Jan Beulich wrote:
>>>>> On 18.04.2022 11:07, Wei Chen wrote:
>>>>>> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
>>>>>> similarity index 71%
>>>>>> rename from xen/arch/x86/efi/stub.c
>>>>>> rename to xen/arch/x86/efi/stub-x86.c
>>>>>> index 9984932626..2cd5c8d4dc 100644
>>>>>> --- a/xen/arch/x86/efi/stub.c
>>>>>> +++ b/xen/arch/x86/efi/stub-x86.c
>>>>>
>>>>> I'm not happy to see a file named *x86*.[ch] under x86/. I think the
>>>>> x86 file wants to simply include the common one (and the symlinking
>>>>> be suppressed when a real file already exists). Naming the common
>>>>> file stub-common.c wouldn't help, as a similar anomaly would result.
>>>>>
>>>>
>>>> How about using stub-arch.c to indicate this stub file only contains
>>>> the arch specific contents? However, we cannot predict what link files
>>>> will be created in this directory in the future. If someone needs to
>>>> create a stub-arch.c link file in the future, can we solve it at that
>>>> time?  Or do you have any suggestions?
>>>
>>> I did provide my suggestion. I do not like stub-arch.c any better than
>>> stub-x86.c or stub-common.c.
>>>
>>
>> With my limited English level, I can only see that you don't like this, but
>> I can't get what you want clearly from your comments. I can only guess:
>> For "x86 file wants to simply include the common one":
>> 1. Did you mean, x86 still keeps it stub.c and includes all its original
>>     contents. The common/efi/stub.c link behavior will be ignored, because
>>     of x86 has a real stub.c? And common/efi/stub.c still can works for
>>     other architectures like Arm whom doesn't have a real stub.c?
>>     But in previous version's discussion, I had said I created a stub.c in
>>     Arm/efi, and copied Arm required functions from x86/efi/stub.c. But
>>     people didn't like it. If my guess is correct, I don't know what is
>>     the essential difference between the two approaches.
>> 2. Keeps stub.c in x86/efi, and use it to include common/stub.c.
>>     I think this may not be the right understanding, but I can't think
>>     of any other understanding.
> 
> 2 is what I've been suggesting.
> 

Got it, thanks!

> Jan
> 

