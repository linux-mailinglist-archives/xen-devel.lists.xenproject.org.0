Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76B5320BE
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 04:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336106.560408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntK1C-0007Te-BJ; Tue, 24 May 2022 02:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336106.560408; Tue, 24 May 2022 02:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntK1C-0007QU-79; Tue, 24 May 2022 02:11:30 +0000
Received: by outflank-mailman (input) for mailman id 336106;
 Tue, 24 May 2022 02:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aI9d=WA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ntK1A-0007QO-7h
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 02:11:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8d07a3-db06-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 04:11:25 +0200 (CEST)
Received: from AS9PR06CA0399.eurprd06.prod.outlook.com (2603:10a6:20b:461::12)
 by GV1PR08MB7988.eurprd08.prod.outlook.com (2603:10a6:150:9c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Tue, 24 May
 2022 02:11:19 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::7c) by AS9PR06CA0399.outlook.office365.com
 (2603:10a6:20b:461::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 24 May 2022 02:11:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 02:11:18 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 24 May 2022 02:11:18 +0000
Received: from 51f33537193e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 154F6ED0-4A91-4840-93A3-BBE308A154F3.1; 
 Tue, 24 May 2022 02:11:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51f33537193e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 02:11:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB3026.eurprd08.prod.outlook.com (2603:10a6:208:65::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 02:11:10 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 02:11:10 +0000
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
X-Inumbo-ID: cf8d07a3-db06-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O+i2jnSqgdmkpqRO0EnZ7tRe+ZZKk+0EeSyWMqcAznB26xdhKPeUDx8x1tHIdFFgaq+EzeTjU/YHoP54l5ex4ZLSnrshUu8gFs42/BCkWcy1MHz4MjLpo0fNLSKpsj9XadlWcMdfYHOh7NnEDLj7VKeA8x7KLLQW1lNbU8KduFn85Xy62mX8ol29MYeMRVoDUzaAyLRzcWrsxaRjtvvR96IrdKIHEfLv+XPdcoQYnPdc6W83Yh0XJarQ2Joso9PHFmWuOkmMGkpELbnIkT8sd1p7VqLtyEEYFrqmZM0zXmWj8DwJ4HrNpRQwfdR8Pnrm1+Px6TUfGyrjEHE5uCDtSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we4sp6FJIc8sUnN1oES1diycTTvQaCrLF7fG1CLbc/A=;
 b=kzwKYR6JPjmlCMAzscoYYkpmqbgHOGYuY4mDl9/Cjf/wua3SYyfQAV23l6K1zHWTwY5HMMRKlIOwj1AlBOGarPEydisMmIVpGzEaOVuO4Z6Na2sZiJ23fq8TyMhHx8kQ8zwTKLdnHNtaOWIBUozcSoHLmmCkAzoobhTNy9w7mpTgMzoTDMfmIlpbC+V+oSeCpyrt0XvnXGwRTDxYZD7ErdLIm6gq3R3yMobReiPb9CgDqs3dX8QuuCYIYaP44wFHEIvz59917cymyFWs690LnWVEoKAT3JVqtRnacK0htDeLJ7g6bnjPW0Uug8ykZiVT/8G0MmXTUZTaGWIxEGUbfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we4sp6FJIc8sUnN1oES1diycTTvQaCrLF7fG1CLbc/A=;
 b=mbHC+V6+IaeTi5sRj0LXeC1CepJyGIohM/Ndye06F2plzl/x6YFDn+MpZuqrWb41eb9JVmnqf9IAzmxqkaVyNdsrQhZ4itBtsLaJPUxS5eBkURYxwIprp2P3TP2KknmpwuBadQEtR8X/nlaWL+9fCCaCr1yUhMEIRezvs57fVtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 781e0a48dea9fc09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2jvKRWhbswJII42e3iZvNdzHwiQlRaHQucCbOmRSPaFsGHsBGy8h1eGYoMyqoSqSU5FSilENcWwZlvEQ9hvlLEg5ETfKG7g4j1P9FWGkHF9IO5pmDK7t1oiwDpgUIkKBK9A2H2iNSIOtR9wMIgltRgMdQUUaZFaSpsD4IBcYlJs2Yyeh+E0Py6xL4kM1UH35mBYv7LhrRmoHqPUG8vscVNkRqluKRBGqVKU2Xvgp01Z7dIGIiYlrK68fVs/BNpEjKeImKKjybt6SVChluLL33xf3K4BQGceEJPOInsl96nhapsOkiJpT4iYcY2nAak0grfEFjdXPELxV5F6lqaViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we4sp6FJIc8sUnN1oES1diycTTvQaCrLF7fG1CLbc/A=;
 b=Spu5ewnuEPtrQoWqLuYE9CdPoou7dN8Zsd05OQjRZ68IEQKJEOysLpn3TOGxKcbXLqM24GISTIGKuXxpPgaaAfwrkHg2LDdtoAouK/CvkeHm+XUZEow0mcNz1oBWeoh6FbNN/E9OBWFaQ3GdamJVvmVEsmVT0qUSRY1Xc2vIm2YiLnUld3/XrgCtapdjy0qK4vgMJe42zlVq8bSxVdj7JJkDY/aoKqqE8pG48fTxlQjSRCm0XXhiBJAsXedMIReJlAl1NONMX74DrdGy32KXFXjNAPrEi5WuxQVebIeymgdzr7bTlB68O41usu9BWQVKGTDzYMuFlElJ6abKThzcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we4sp6FJIc8sUnN1oES1diycTTvQaCrLF7fG1CLbc/A=;
 b=mbHC+V6+IaeTi5sRj0LXeC1CepJyGIohM/Ndye06F2plzl/x6YFDn+MpZuqrWb41eb9JVmnqf9IAzmxqkaVyNdsrQhZ4itBtsLaJPUxS5eBkURYxwIprp2P3TP2KknmpwuBadQEtR8X/nlaWL+9fCCaCr1yUhMEIRezvs57fVtM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <a2df72fb-4751-ce8b-3def-2bd7382f658d@arm.com>
Date: Tue, 24 May 2022 10:11:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-11-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220520120937.28925-11-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8ea0b0c1-e1e6-44fa-06d0-08da3d2ab0a6
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3026:EE_|AM5EUR03FT061:EE_|GV1PR08MB7988:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB7988B7B9780871661B210FD89ED79@GV1PR08MB7988.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CTzRaM4ks2RTm42pyxKeobhyE6650wHRbD6etlCT4ooU2ni2PnYS821wousq15EgOGfNO+DtkMr+gndOW8abAdRRE8W4fmMzPr7t4QLVRuu03TZS3/9oUworxeH3mC4sBXtpCt5IOHDk5A9SE8CRATnCalKtQDSLEbep73jOh0J5/1gRs4kE0g6OlQwaOS/edMLpCvKXoo4AarTtFzsVYfd5T7nv6BFWcFHxqOiQblZShybjvkJiB8bEiE/6k4f3/w7rAitXLlRSqax1lXQLY7vYRHCF++BQCdgjBk/qfLLbDbdulP4gtpNThKtXTRrhH9ZjJJmsZR39GPOivQa/dzBtilOT555Ih37ZQ2P74HraoxbckqHguB6U1OzZ6SQYn2AEBLbePeqby6HUy2Ol/F4KmjsF38c4tMwVeoHe+xiNbFi9yrDcM/Nel7eDUrlBVHgvJzJWgPC2V0nndHMEZiYO5gav3rVtT8cocfHOeChBS7D25Ujpkh2gs8lC503xW13MO0mgc7NvK/9OESQkXnYrGBvDjZgyJp0wBGzZpEtPFOTX6p0hYXMLSZZA/jy+yzTuYRQhaiBXyByM9+28/I9kiRaRJ5V5iyhFCZOyaknD1smG0QfPCMvRoq+vGvXCKxigP0P5OcXKIaFuaQYl7KyxMdohNXf9uNjQr0xQURSsuNQVaeXlqsC1WU3jzV0hMpYnOmEIb3cB3smK5dzdoMhMSmNEyik0S3mCYxgogV0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(26005)(6512007)(8936002)(53546011)(66476007)(316002)(31696002)(66946007)(66556008)(186003)(36756003)(31686004)(86362001)(6506007)(5660300002)(83380400001)(6486002)(2906002)(508600001)(38100700002)(30864003)(7416002)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1325f35e-bb63-421d-8855-08da3d2aab4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hk/tcNYhAESXWYb3TlVsx5XSfoYu+8QpISi0XwvoLzG2nRVEZJu/VUHUNHqOD5aa11slQOLAa75hlf1mPqdoIHxKJQ3/7hMO0UCFsqRtVYBr8UqbdcVOZ/yXXfvF7+G4QNqjQGWCKDQuzvWuhWcUfO4fta4jzQHYCQsacjC7kMMIO0DFhypWDn/mpAybjFHQjEpayvpca/gV23Qwj4nLcZKFQ0rjOn/hTp2SHoY25RstZ2pMG2K+tdOGQMET5NbMMN0R+NoGtVQo7V0ka8fymKuabRN5nBn6LyzefIHJUbSEV27geJ2FHuw/M6SVO8L+GLuk7V/csCvqenKN05Vw9y1g7O+BQQChjIob7RlO7/RabpI4FUNFU2YUXX1E7o941GNybbJDuuLgUoUJbqwH5hWXcnYgyEGA+fuONTsv7eggyBUdYv1FF001T9WcqyH4EsFQh36A+nU3b8x2VQdju3mp0avIwn9/2yzVhXUBcnd2OcBoyeryc8gJGiU4l+LBTtqfJuFz035H1eRqSwlESvlzBBnyzykDr/w7FPyT6Y+PWkOs3x8RHcJGFPkQ9IRyc61G/2a2HKTUy1aZhDbeDz3StvExki8ybFAqvOMzHjQfYD7eDgljIKUfGDZBnQT9oBsQWofawytgaey+3hsEOpSfqdxXFEocm/FAh8rg7VoxPE/i5JgnlWBZY/mkSiAg6mNdO/qfciW9NsHW7b6ktA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(31686004)(6506007)(36860700001)(26005)(30864003)(82310400005)(6512007)(31696002)(54906003)(316002)(40460700003)(508600001)(5660300002)(186003)(2616005)(336012)(4326008)(8676002)(53546011)(36756003)(47076005)(86362001)(2906002)(83380400001)(6486002)(70206006)(70586007)(356005)(107886003)(81166007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 02:11:18.7159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea0b0c1-e1e6-44fa-06d0-08da3d2ab0a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7988

Hi Julien,

On 2022/5/20 20:09, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> The basic idea is like Persistent Kernel Map (PKMAP) in Linux. We
> pre-populate all the relevant page tables before the system is fully
> set up.
> 
> We will need it on Arm in order to rework the arm64 version of
> xenheap_setup_mappings() as we may need to use pages allocated from
> the boot allocator before they are effectively mapped.
> 
> This infrastructure is not lock-protected therefore can only be used
> before smpboot. After smpboot, map_domain_page() has to be used.
> 
> This is based on the x86 version [1] that was originally implemented
> by Wei Liu.
> 
> The PMAP infrastructure is implemented in common code with some
> arch helpers to set/clear the page-table entries and convertion
> between a fixmap slot to a virtual address...
> 
> As mfn_to_xen_entry() now needs to be exported, take the opportunity
> to swich the parameter attr from unsigned to unsigned int.
> 
> [1] <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> [julien: Adapted for Arm]
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>      Changes in v4:
>          - Move xen_fixmap in fixmap.h and add a comment about its usage.
>          - Update comments
>          - Use DECLARE_BITMAP()
>          - Replace local_irq_{enable, disable} with an ASSERT() as there
>            should be no user of pmap() in interrupt context.
> 
>      Changes in v3:
>          - s/BITS_PER_LONG/BITS_PER_BYTE/
>          - Move pmap to common code
> 
>      Changes in v2:
>          - New patch
> 
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/arm/Kconfig              |  1 +
>   xen/arch/arm/include/asm/fixmap.h | 24 +++++++++++
>   xen/arch/arm/include/asm/lpae.h   |  8 ++++
>   xen/arch/arm/include/asm/pmap.h   | 32 ++++++++++++++
>   xen/arch/arm/mm.c                 |  7 +--
>   xen/common/Kconfig                |  3 ++
>   xen/common/Makefile               |  1 +
>   xen/common/pmap.c                 | 72 +++++++++++++++++++++++++++++++
>   xen/include/xen/pmap.h            | 16 +++++++
>   9 files changed, 158 insertions(+), 6 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/pmap.h
>   create mode 100644 xen/common/pmap.c
>   create mode 100644 xen/include/xen/pmap.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..a89a67802aa9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -14,6 +14,7 @@ config ARM
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
>   	select HAS_PDX
> +	select HAS_PMAP
>   	select IOMMU_FORCE_PT_SHARE
>   
>   config ARCH_DEFCONFIG
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> index 1cee51e52ab9..365a2385a087 100644
> --- a/xen/arch/arm/include/asm/fixmap.h
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -5,20 +5,44 @@
>   #define __ASM_FIXMAP_H
>   
>   #include <xen/acpi.h>
> +#include <xen/pmap.h>
>   
>   /* Fixmap slots */
>   #define FIXMAP_CONSOLE  0  /* The primary UART */
>   #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
>   #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
>   #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
> +#define FIXMAP_PMAP_BEGIN (FIXMAP_ACPI_END + 1) /* Start of PMAP */
> +#define FIXMAP_PMAP_END (FIXMAP_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
> +
> +#define FIXMAP_LAST FIXMAP_PMAP_END
> +
> +#define FIXADDR_START FIXMAP_ADDR(0)
> +#define FIXADDR_TOP FIXMAP_ADDR(FIXMAP_LAST)
>   
>   #ifndef __ASSEMBLY__
>   
> +/*
> + * Direct access to xen_fixmap[] should only happen when {set,
> + * clear}_fixmap() is unusable (e.g. where we would end up to
> + * recursively call the helpers).
> + */
> +extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
> +
>   /* Map a page in a fixmap entry */
>   extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
>   /* Remove a mapping from a fixmap entry */
>   extern void clear_fixmap(unsigned map);
>   
> +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
> +
> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> +{
> +    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
> +
> +    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
> +}
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ASM_FIXMAP_H */
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index aecb320dec45..fc19cbd84772 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -4,6 +4,7 @@
>   #ifndef __ASSEMBLY__
>   
>   #include <xen/page-defs.h>
> +#include <xen/mm-frame.h>
>   
>   /*
>    * WARNING!  Unlike the x86 pagetable code, where l1 is the lowest level and
> @@ -168,6 +169,13 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>           third_table_offset(addr)            \
>       }
>   
> +/*
> + * Standard entry type that we'll use to build Xen's own pagetables.
> + * We put the same permissions at every level, because they're ignored
> + * by the walker in non-leaf entries.
> + */
> +lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
> +
>   #endif /* __ASSEMBLY__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
> new file mode 100644
> index 000000000000..74398b4c4fe6
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/pmap.h
> @@ -0,0 +1,32 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <xen/mm.h>
> +
> +#include <asm/fixmap.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    lpae_t *entry = &xen_fixmap[slot];
> +    lpae_t pte;
> +
> +    ASSERT(!lpae_is_valid(*entry));
> +

Sometimes it is very difficult for me to determine whether to
use ASSERT or fixed check in this situation. In debug=n config,
is there any risk of pte override of arch_pmap_map should be
prevented? IMO, it's better to provide a return value for this
function and use a fixed check here.

> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> +    pte.pt.table = 1;
> +    write_pte(entry, pte);
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    lpae_t pte = {};
> +

We have checked lpae_is_valid() in arch_pmap_map. So can we add a
!lpae_is_valid check here and return directly?

> +    write_pte(&xen_fixmap[slot], pte);
> +
> +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
> +}
> +
> +void arch_pmap_map_slot(unsigned int slot, mfn_t mfn);
> +void arch_pmap_clear_slot(void *ptr);
> +
> +#endif /* __ASM_PMAP_H__ */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 52b2a0394047..bd1348a99716 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -305,12 +305,7 @@ void dump_hyp_walk(vaddr_t addr)
>       dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
>   }
>   
> -/*
> - * Standard entry type that we'll use to build Xen's own pagetables.
> - * We put the same permissions at every level, because they're ignored
> - * by the walker in non-leaf entries.
> - */
> -static inline lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned attr)
> +lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
>   {
>       lpae_t e = (lpae_t) {
>           .pt = {
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index d921c74d615e..5b6b2406c028 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -49,6 +49,9 @@ config HAS_KEXEC
>   config HAS_PDX
>   	bool
>   
> +config HAS_PMAP
> +	bool
> +
>   config HAS_SCHED_GRANULARITY
>   	bool
>   
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index b1e076c30b81..3baf83d527d8 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -29,6 +29,7 @@ obj-y += notifier.o
>   obj-y += page_alloc.o
>   obj-$(CONFIG_HAS_PDX) += pdx.o
>   obj-$(CONFIG_PERF_COUNTERS) += perfc.o
> +obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>   obj-y += preempt.o
>   obj-y += random.o
>   obj-y += rangeset.o
> diff --git a/xen/common/pmap.c b/xen/common/pmap.c
> new file mode 100644
> index 000000000000..9355cacb7373
> --- /dev/null
> +++ b/xen/common/pmap.c
> @@ -0,0 +1,72 @@
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/pmap.h>
> +#include <asm/fixmap.h>
> +
> +/*
> + * Simple mapping infrastructure to map / unmap pages in fixed map.
> + * This is used to set the page table before the map domain page infrastructure
> + * is initialized.
> + *
> + * This structure is not protected by any locks, so it must not be used after
> + * smp bring-up.
> + */
> +
> +/* Bitmap to track which slot is used */
> +static __initdata DECLARE_BITMAP(inuse, NUM_FIX_PMAP);
> +
> +void *__init pmap_map(mfn_t mfn)
> +{
> +    unsigned int idx;
> +    unsigned int slot;
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +    ASSERT(!in_irq());
> +
> +    idx = find_first_zero_bit(inuse, NUM_FIX_PMAP);
> +    if ( idx == NUM_FIX_PMAP )
> +        panic("Out of PMAP slots\n");
> +
> +    __set_bit(idx, inuse);
> +
> +    slot = idx + FIXMAP_PMAP_BEGIN;
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +
> +    /*
> +     * We cannot use set_fixmap() here. We use PMAP when the domain map
> +     * page infrastructure is not yet initialized, so map_pages_to_xen() called
> +     * by set_fixmap() needs to map pages on demand, which then calls pmap()
> +     * again, resulting in a loop. Modify the PTEs directly instead. The same
> +     * is true for pmap_unmap().
> +     */
> +    arch_pmap_map(slot, mfn);
> +
> +    return fix_to_virt(slot);
> +}
> +
> +void __init pmap_unmap(const void *p)
> +{
> +    unsigned int idx;
> +    unsigned int slot = virt_to_fix((unsigned long)p);
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +    ASSERT(in_irq());
> +

Why this condition is in_irq? Is it for TLB operation in arch_pmap_unmap?

Cheers,
Wei Chen

> +    idx = slot - FIXMAP_PMAP_BEGIN;
> +
> +    __clear_bit(idx, inuse);
> +    arch_pmap_unmap(slot);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
> new file mode 100644
> index 000000000000..93e61b10870e
> --- /dev/null
> +++ b/xen/include/xen/pmap.h
> @@ -0,0 +1,16 @@
> +#ifndef __XEN_PMAP_H__
> +#define __XEN_PMAP_H__
> +
> +/* Large enough for mapping 5 levels of page tables with some headroom */
> +#define NUM_FIX_PMAP 8
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/mm-frame.h>
> +
> +void *pmap_map(mfn_t mfn);
> +void pmap_unmap(const void *p);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __XEN_PMAP_H__ */

