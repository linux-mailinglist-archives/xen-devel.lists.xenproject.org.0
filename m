Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28237577D5F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369359.600730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLyS-00027o-3I; Mon, 18 Jul 2022 08:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369359.600730; Mon, 18 Jul 2022 08:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLyR-00024y-Ve; Mon, 18 Jul 2022 08:19:27 +0000
Received: by outflank-mailman (input) for mailman id 369359;
 Mon, 18 Jul 2022 08:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDLyQ-00024s-DQ
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:19:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 551114dc-0672-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:19:24 +0200 (CEST)
Received: from AM6PR10CA0078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::19)
 by AM5PR0802MB2593.eurprd08.prod.outlook.com (2603:10a6:203:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 08:19:22 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::e3) by AM6PR10CA0078.outlook.office365.com
 (2603:10a6:209:8c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Mon, 18 Jul 2022 08:19:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 08:19:19 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 18 Jul 2022 08:19:19 +0000
Received: from 8a89f3a10fb9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 345D46B2-E52B-44BB-89F9-B8D2DF1806E5.1; 
 Mon, 18 Jul 2022 08:19:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a89f3a10fb9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 08:19:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3367.eurprd08.prod.outlook.com (2603:10a6:20b:44::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 08:19:07 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:19:07 +0000
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
X-Inumbo-ID: 551114dc-0672-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RoFnJVweWxPUlNbHbLQDxgqPeGWEUSPv1z3v46jWNz+x28TnZJXkCQBldFDxobQ0ApjPtZEvjR3WEZ2C+dKBu3UsnM80dMC471J3JdHELyLQDp7Tbk1Yu4kiz7xGnkaD+JjSLFiaVJISnjPqEUjPqQZ5fDqb0lIGBUhmd2FTs6Zv7TI/nMCSQXwwMtQ5ZdbG/zakw+dsur7M4vnw+sCv7DhwrDALSFSoTFhYZwQNZ0OT9mdM7paMzkdV6Qoz8hb2U3vLu34LOg4YmNseDuLwmM1UgaIF7Y/e6q5bFlcsAq7NLcY7z6v11UclOcfudVcwPwgvV669JU9EW/PgOFfGbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g6d8Ro0Yxe62ViASgmY2GXjGbikG0PCi8ly4bRu7c4=;
 b=MHElfvqdGDwKphFIO0+0o1nlrx0ewBhGbGnKKuoYZj37vETsTD1KB34gqYcNDr3sKLJlt/U84OavrtNqEhmlIDvrm+2Hpz3anN5KRL9iRrFdQXc8a5p/nDoOCrDkq24/NPpPTKwMXxVOCExH1tAVhpjSQRYQHlfA9m7b/fp9SzUkxA2Y6VPQ1NvhN38RF9SYB1Qq4R4mxhPNoUOG1KNlS5xYtTuUwT/goU4TuIu/+FakZMxXmWZFa0Juyg7F/J67XRE9yTeT0Kq5dcRUCQAMpwphhByPRkOnlV1bDVtqlhWk4OD1P/m/U5Ykg38GtjF8ZXtLGlQv06Q0q9eitz/iqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g6d8Ro0Yxe62ViASgmY2GXjGbikG0PCi8ly4bRu7c4=;
 b=uOAt17Lz3XMbeY2HlyrEyPgNRnD9RXiEnQQA389SB60U4kDO6An0CqE3xq2umz/tsqHmiK1SUm9+uGH9+JdG+BQAuwzpKg6sMu1xUjwFDDo4OH+ZjqUGSSSpv+QDO9dyH3ZrJhi7zizrT+/Up/M32sGH1bsgb04yP9PehpZUqZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b2de34b28723259
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5mDZ7UYW0t7cVPxCUPLEbl1GArb7ECOiiH4RcEUuXNKNl0kk8Av9e2hnefm/aZoVUU4rC+jlwudtg37BdYoIOdYZ5NA77lMEOOw+KnxhBXltILENcw3ZMU6l1vaHpqpXtwwL3TD0hAdT9RbUbRt20oE3LeqcDKRLM8cqrwxwUA0UdC6zAIo6tE0RHfGrk/OALb+3+zTY6ifyfodUgbxwNBKI+Zhv8pTR1Re1esA4ZDe3TN1kv9jxwWXIPrCdN/YjsV8d3acrhZ5xo7qeKhGl8yz2hQIbWkrptSrkHaOjieAwj/5iuNZEx6+EGmHVLb9BoOm0ucrG2b+91xTl85mLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g6d8Ro0Yxe62ViASgmY2GXjGbikG0PCi8ly4bRu7c4=;
 b=bYtBFM2dzz3/7JMiUtX5JTnvlDE89e+co2dBG5EiMCXNworgLGbE9jShjUe1hrFfPGf4zCBa86MIZfGHDPN8ximoxMbPh1z6abjAG6m/L39Gi4k75TVjAWPncD4U9Crx8nOPTLetBbp5S6q4cbF+cEIn45GPxXtbjf1Zj2UT9gbHmVrgdGvSMGxVh8h8TESTafMtMiSYNqVOJloGqGNAJRRvspf1QXUWJcSvFRyneiNo4qUDZO/DvVJK13AZCpvKhvSxXmNjhS5ru62yi9A3DygjtoRVGzr8AqN+V+OPF9ljo4FKoyKEl9DRpw7f+TQrReiaSkhs5SlOuRHU+YaxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g6d8Ro0Yxe62ViASgmY2GXjGbikG0PCi8ly4bRu7c4=;
 b=uOAt17Lz3XMbeY2HlyrEyPgNRnD9RXiEnQQA389SB60U4kDO6An0CqE3xq2umz/tsqHmiK1SUm9+uGH9+JdG+BQAuwzpKg6sMu1xUjwFDDo4OH+ZjqUGSSSpv+QDO9dyH3ZrJhi7zizrT+/Up/M32sGH1bsgb04yP9PehpZUqZA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <b7b1b735-e16e-2bf5-e634-e56291dab61b@arm.com>
Date: Mon, 18 Jul 2022 16:18:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-3-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220715170312.13931-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0185.apcprd06.prod.outlook.com (2603:1096:4:1::17)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6ec72924-637e-4b19-a200-08da689636b5
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3367:EE_|VE1EUR03FT053:EE_|AM5PR0802MB2593:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9MDlax4Pmqc0G5imWkq5qDQlI2eFH2scUsy3A523GHIpaZMHnIKnH2DlvSlJ/8TLyj/HkoVGExBB6mdOdAHm8SyU/R5/d9OkqvQnOnWFrCtBrAJW7H/TvDiN55HLhtS372ZmHAScGAP6az3IYfGcMJYFKp35NSyQFpZY3S5jTCXkRfhgNqabAkY5jBLePkSRxLV8kybRVlEM1EUIjQ31MlJxOQ2MRpKDvl7hOq2HYcgTEkF3OAXXQve0q1JSHIuSPMEhjrjdM9nKPiefAaLDY2/q24gS3MvO6y5YaJ2g9CyijC7GXDdd9RyjrstVDXLBVO7NHBeEV6OvOww50f30pNEDy1vq13QIrmIavBGLRXDjw1LmmjCcA0jLR67Gg5wB+ZSP7Zfnoi4JMIPAl5Kg1Iu1XvNVdnqqDxBiTOF8/ySvl8jq5wO33XkN5GYgjdLtvEIzliPsfUstlA5/lGteB7GGTdVzev3RDTQ/1AARc6rZfucXOM6SjNG5DYeGgjHYBKL/pQH2xEyo42t3oYG/mnBdt24bEXa53E/yxG7elHxRrCpS6/jLLKe1O0KQPgcSVIKsjqKFGN24vynBdOfOsQAPA8ygH40pWKgqZ8yhEf+GBPQYJwTTy/WcsdADqz86bAEDsqvmyfckZF5xXnbTbThs0tnlfhw7sWZrTfgygdDozXSFOp2Imx9orpKlp2oaLf1/CmVR11XWFKsaKTAD8iQkNojHisw/8+vTd9vnrziGrpYrzSmGW+QEhrXBFzLukJTkMShBzAY73tmT0HPc7+x84OUrdltudXGl7PCBMFtyWcZLHmKxtYDgw0iKzlIugiVh/Y3G4Iq1ogVpfY74q3w6OStKPlcVBkH5gMms+Ck=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(83380400001)(6512007)(26005)(186003)(41300700001)(6666004)(2906002)(86362001)(53546011)(6506007)(478600001)(6486002)(5660300002)(2616005)(8936002)(31696002)(38100700002)(316002)(4326008)(8676002)(54906003)(66476007)(66946007)(36756003)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25f76191-8f08-41b0-90bf-08da68962f06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fyfnvRHM+dXtnD6gevKwKDta3AO8+i9Tte7ZMCjI0Uzm4/gpB9FzFUqBJVQoFZ63UaZJ2MY1yzpKAWQLNzS7PhFwpqBQNhJizNGFLAThFULftPD2NXaWq4+doaqAi8RTvepJ7YQ2GISlo9KpJFoYVn8eV8pWSGD9BNCF/wDBPLDr0osa2bq3LGrRwVZzYLhoU64yA0OrCTEfeNAdTX7GsSGHlfU9pzWvOXxymWuDcvYhsKTr/8e/aLSw3yRbc8qktgAkGsJLhXNjfo3tFVHTnSHldJuWb60njUdd8Y94xMYxPLxV9AkJU/eC6HrywgdB1uTZbEOKIPx3orzIujGDOpTqq2zlDTa5J9hctsFV5CcLDwSsfT6siDwlnHWmLr1PKlHTejSihpZMp3x5P3XyCLmhbb56JCzRRP7fgfUFcPEcO+Gal3stiVhdc5GaeSakLiXmk2S3ni6GHqpiqeKlvnw+Nv4OP5DqQhS1Dqm51VM9WJpzKMq2i4ReTh3Q18ySUVHSIgXZ8xOjU6wBjtxCFy0cqYxrnqd2YSIKl9QI4w0l5+gef5fmBW4qtjGleHlmZi/8bJVlv/dnCXD4xJi7jdWdwmHr6qbZm4tOU9TPAoqPEz0hQj8Q62sEZQk+UdMI+D77QsJwuzcFZlMhMxexn4MZghNl7S0Sp2XeNKTjt+O4Hxa7c18Wz+IsuAzcqFWGYwxfVMPoIcletSkomeJHc/YiW8WBrY0ltOSJVEA5BPe1lKsgxmtJbhbnDFUVxBw6ogTJdVuzTPNrR+Zo0EGVofJIu0h4kMrAwdyS/rTcGaw04lAQgzIqbZ0F7MTASOaWk0+2Rk4Bq6tvPdvbmQ8/rC/bsvxi1DE7QPkz+H2lYaM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966006)(40470700004)(36840700001)(26005)(40460700003)(82310400005)(186003)(54906003)(6512007)(47076005)(2616005)(336012)(36756003)(40480700001)(70206006)(41300700001)(31686004)(478600001)(36860700001)(6486002)(2906002)(8936002)(86362001)(316002)(81166007)(6506007)(83380400001)(53546011)(5660300002)(6666004)(70586007)(356005)(82740400003)(31696002)(8676002)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:19:19.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec72924-637e-4b19-a200-08da689636b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2593

Hi Julien,

On 2022/7/16 1:03, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, init_heap_pages() will call free_heap_pages() page
> by page. To reduce the time to initialize the heap, we will want
> to provide multiple pages at the same time.
> 
> init_heap_pages() is now split in two parts:
>      - init_heap_pages(): will break down the range in multiple set
>        of contiguous pages. For now, the criteria is the pages should
>        belong to the same NUMA node.
>      - _init_heap_pages(): will initialize a set of pages belonging to
>        the same NUMA node. In a follow-up patch, new requirements will
>        be added (e.g. pages should belong to the same zone). For now the
>        pages are still passed one by one to free_heap_pages().
> 
> Note that the comment before init_heap_pages() is heavily outdated and
> does not reflect the current code. So update it.
> 
> This patch is a merge/rework of patches from David Woodhouse and
> Hongyan Xia.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Interestingly, I was expecting this patch to perform worse. However,
> from testing there is a small increase in perf.
> 
> That said, I mainly plit the patch because it keeps refactoring and
> optimization separated.
> 
> Changes in v2:
>      - Rename init_contig_pages() to _init_heap_pages()
>      - Fold is_contig_page()
> ---
>   xen/common/page_alloc.c | 77 ++++++++++++++++++++++++++---------------
>   1 file changed, 50 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 078c2990041d..eedb2fed77c3 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1778,16 +1778,44 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>   }
>   
>   /*
> - * Hand the specified arbitrary page range to the specified heap zone
> - * checking the node_id of the previous page.  If they differ and the
> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
> - * not freeing it to the buddy allocator.
> + * This function should only be called with valid pages from the same NUMA
> + * node.
>    */
> +static void _init_heap_pages(const struct page_info *pg,
> +                             unsigned long nr_pages,
> +                             bool need_scrub)
> +{
> +    unsigned long s, e;
> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +
> +    s = mfn_x(page_to_mfn(pg));
> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> +    if ( unlikely(!avail[nid]) )
> +    {
> +        bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
> +                        (find_first_set_bit(e) <= find_first_set_bit(s));
> +        unsigned long n;
> +
> +        n = init_node_heap(nid, s, nr_pages, &use_tail);
> +        BUG_ON(n > nr_pages);
> +        if ( use_tail )
> +            e -= n;
> +        else
> +            s += n;
> +    }
> +
> +    while ( s < e )
> +    {
> +        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> +        s += 1UL;
> +    }
> +}
> +
>   static void init_heap_pages(
>       struct page_info *pg, unsigned long nr_pages)
>   {
>       unsigned long i;
> -    bool idle_scrub = false;
> +    bool need_scrub = scrub_debug;
>  

You have changed idle_scrub to need_scrub, but haven't mentioned this
in commit log, and I also haven't found related discussion in v1. I
am very clear about this change.

Cheers,
Wei Chen

>       /*
>        * Keep MFN 0 away from the buddy allocator to avoid crossing zone
> @@ -1812,35 +1840,30 @@ static void init_heap_pages(
>       spin_unlock(&heap_lock);
>   
>       if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
> -        idle_scrub = true;
> +        need_scrub = true;
>   
> -    for ( i = 0; i < nr_pages; i++ )
> +    for ( i = 0; i < nr_pages; )
>       {
> -        unsigned int nid = phys_to_nid(page_to_maddr(pg+i));
> +        unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +        unsigned long left = nr_pages - i;
> +        unsigned long contig_pages;
>   
> -        if ( unlikely(!avail[nid]) )
> +        /*
> +         * _init_heap_pages() is only able to accept range following
> +         * specific property (see comment on top of _init_heap_pages()).
> +         *
> +         * So break down the range in smaller set.
> +         */
> +        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>           {
> -            unsigned long s = mfn_x(page_to_mfn(pg + i));
> -            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> -            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
> -                            IS_ALIGNED(s, 1UL << MAX_ORDER) &&
> -                            (find_first_set_bit(e) <= find_first_set_bit(s));
> -            unsigned long n;
> -
> -            n = init_node_heap(nid, mfn_x(page_to_mfn(pg + i)), nr_pages - i,
> -                               &use_tail);
> -            BUG_ON(i + n > nr_pages);
> -            if ( n && !use_tail )
> -            {
> -                i += n - 1;
> -                continue;
> -            }
> -            if ( i + n == nr_pages )
> +            if ( nid != (phys_to_nid(page_to_maddr(pg))) )
>                   break;
> -            nr_pages -= n;
>           }
>   
> -        free_heap_pages(pg + i, 0, scrub_debug || idle_scrub);
> +        _init_heap_pages(pg, contig_pages, need_scrub);
> +
> +        pg += contig_pages;
> +        i += contig_pages;
>       }
>   }
>   

