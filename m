Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE6529D17
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 10:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330579.553967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqt2I-0003wF-QN; Tue, 17 May 2022 08:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330579.553967; Tue, 17 May 2022 08:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqt2I-0003tG-NQ; Tue, 17 May 2022 08:58:34 +0000
Received: by outflank-mailman (input) for mailman id 330579;
 Tue, 17 May 2022 08:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKDR=VZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nqt2G-0003tA-Gx
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 08:58:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8680a760-d5bf-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 10:58:31 +0200 (CEST)
Received: from AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12)
 by AM4PR0802MB2305.eurprd08.prod.outlook.com (2603:10a6:200:5f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 08:58:30 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::12) by AS9PR06CA0062.outlook.office365.com
 (2603:10a6:20b:464::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 08:58:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 08:58:29 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Tue, 17 May 2022 08:58:29 +0000
Received: from d9ed81a8533a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 032A63CD-6677-4009-8F69-16BED9174C6E.1; 
 Tue, 17 May 2022 08:58:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9ed81a8533a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 08:58:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3207.eurprd08.prod.outlook.com (2603:10a6:209:42::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 08:58:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:58:19 +0000
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
X-Inumbo-ID: 8680a760-d5bf-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RzW0xefCA/3Q4+zSD9/mSD0BBrLnkmOt3CthRmsXfYIF0ncnTU6aBGdLpjd3F2RF3ryPyDGZ/3NcjLVRQWtbEtfZ7vCEiQYquFv25Mf/FVsbK4WkYT+DM1p3UIim568myG6J5ICqih9rh7HSeS1DM905y1X5+OQiQM4jdeA2hIY9RpqVABnyzOPV0moWSOrK5GBL429J/z0zaM8xs7qb8MtleTBknBk32bQMIpSDNFaCTUXKH3M8NglsvYvc2kjYqkGvX/khgQkZhtfjY3zL4DoG3m5DEn86jkLbHSYR4MvpyzIFKXyjs7rRuysIb2qLPvDMyT8fnGOwCEoAw72U5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10wHUjDuDNEQyWZqwt7Dfjx5Ae5tYxjzFLMn4L83xOM=;
 b=d1mX+VcwuHIqoWSGiSnO2XdvL3m3gt52SVORXtYx8MJ03EAbheks9qo7Gz8RwoziGYlHBuZ8NUxoKjRW8EyaPUePrelT/NUq0PiUjenuxcurenL1jPFGceNw7DL6N8AG2ketv+OHRdEDbUMKRFMblfW9XypeB3oK2sU3LpMbPuSPPUq/nCpGgQt5XjDettv5R1EFSw1+asJCGXQaZFeGpRuaRjIPLb+2o7CPUcOzsDsUMxJpMdtGLxTQpHmBN1WX/KINuCgykTtIS7heFWDeJhmgJaRvjRarf/wI7Ew//HHq+oQ8TXwpGu7K58elczTMUk5nANb2cxNwFUDOac/sDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10wHUjDuDNEQyWZqwt7Dfjx5Ae5tYxjzFLMn4L83xOM=;
 b=GbAQJG10z2P3M9Ij45cvf6FnjYdaT/fSnLpUBCC8a92xkpGmmCsIYLAZLlYn9HbvELjlvPGa/+8+aMARZQwyjb8oOlFuecpOsptCh0m1gwvP4IfCXUkdTL27qIHoDopnrwMLDkKoKTaNVH9Q8K24FIvEpYA6HVqhbDU89dB+m4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a8972e2e24b43b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5J6ImnobAJpgl0G7dqxKsT+h0OXCYPZ1rFR1W+Fix2MRCJbcoqcFtjl96hUq/KtIQIR8NX2DZcgPT35dV3ecvGdp2tY6zidvFdpOEo0kATU7jdMHVZjWPpa9+tNapFDcANPgMkvfkXeOcCy4mspCvw+PXpyerRxSaR9mMsC2lTL53n/hVSvRIEQ3T47GpubgvcI0+tdCHIag5deea5wY8s7KGEvBMN4lYg5BBiLARa5YH+N5V+32FCWgxSqIYh4ebocIV9XSyZ/7lDsW4RcFLeg6VuoBQW7JhTxcME0xjBP/nIW7TDocwUIKxAJiqfqaWciJWW0T0DN9X32cjQw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10wHUjDuDNEQyWZqwt7Dfjx5Ae5tYxjzFLMn4L83xOM=;
 b=j8J/c2gWwizZDpYydTQZ72uQ0PIDaUSF9pNb9Chsx/nNIMscY2sud/HZdMeYgDxtYe7TfhhLLjhJHuD44EdSOEw7ASbr/kB0pyAGwO153IC446cFPgT6hqqqGK2IcCyf+QcdN3rHczZKzDrbq26Dvq4kH9Jbt9t2LodX7TiNJdXHa/Fl5vi0iRyCi6DzSqZRdVXWKXBYckHYIUciELqDXw+MxngT/gkgnT37tHMBcOKs019Pz/1zxwcDQY5SpxZky4/vlqPTUwFyq8SD/YyrQiuBgwNAb8bGy0toKOQumikZ0sHnBXRqdOD1TanhFX90v12kICy8yqpaY+gk052e1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10wHUjDuDNEQyWZqwt7Dfjx5Ae5tYxjzFLMn4L83xOM=;
 b=GbAQJG10z2P3M9Ij45cvf6FnjYdaT/fSnLpUBCC8a92xkpGmmCsIYLAZLlYn9HbvELjlvPGa/+8+aMARZQwyjb8oOlFuecpOsptCh0m1gwvP4IfCXUkdTL27qIHoDopnrwMLDkKoKTaNVH9Q8K24FIvEpYA6HVqhbDU89dB+m4A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Topic: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Index: AQHYaUbNn/1ZVAYT+kGgDN69tRiyPq0ixfIA
Date: Tue, 17 May 2022 08:58:18 +0000
Message-ID: <89313424-EB15-4A9B-B215-178460F035C4@arm.com>
References: <20220516170246.19908-1-julien@xen.org>
In-Reply-To: <20220516170246.19908-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c15483d5-d2ad-4fb4-9abc-08da37e369ce
x-ms-traffictypediagnostic:
	AM6PR08MB3207:EE_|AM5EUR03FT046:EE_|AM4PR0802MB2305:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB230591C38238FFF6E46DFBF19DCE9@AM4PR0802MB2305.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9VloGLj6p8EUpCTWmeDlRwifLYmA9QzPqzQqmetU5xmOkIK0a9BXJscVWjTNIt6gpaZr1DHrRnIdy6XFjRAVZJ1dsNUhucCwmMCvWaPL4dtGXV8woYqM9Cyy64IDb+dEOdo7wVqlipqYg3mx5kAZtFvvq48eGzK54TLCGObJQL099rUvd4awEVyXutfhXUUsfcUldFgk/WqvI3o+JFk3syZh+8bWw+01jRuPAWSTCIFrsGbpaCrCGAiuhDTfDBAgKJCdRdnr6XcSYcqO0Erad9UC5GhGHUaaXiHVcqL4b6vzQ+ebyRxfoMXyC3xNPTSlyKy/yL2lM72NjUneCVyYeMBJoVMkc3o9xfOMwUYO9K/lDcgHVf04HESf3IMAR9iO47Ujw3ccmjNkOqs7DuSPTQIrgVOnCqRtEK+wlKsWGIfTQiRVVo/ytqeny4uQJm0SoyyvWkLTsnmuJgN4kWLZZBFVud99RXY32yH82DDwApy4tH/uW2DK6l7xE7duIL974zxfh13+XQ5+R3Kq3vqo2Ci/aBbcrSy7kMOcAydfP7RERVZeb+WaGYaOMibiYA8eowFv5aMK92BOT8oN1bPxF8GhnCEcngnkkHZWwTB9bCDirYfgyyKHIhGPS9seDw76zNPnrHmO4YVkD9+4SBELWu4X7maVzvSKuG3N3PHi45IuqP3OM9JxtaZvKrhnjjiTI8dvzkwdUT66jWZP898lCyPA+SHmKT2sEO3UIiFys0/GYfIXYJZvMf6zxZpLsiNw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(26005)(6512007)(186003)(316002)(38070700005)(66476007)(8676002)(54906003)(86362001)(2906002)(53546011)(122000001)(66946007)(6506007)(76116006)(4326008)(64756008)(66446008)(66556008)(2616005)(91956017)(71200400001)(508600001)(6486002)(8936002)(6916009)(83380400001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B27061753E3E8408987B13464685770@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3207
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a52de86-e9dc-41bc-52e9-08da37e36320
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4HO0798Gu9/glgs3tZDCTziiJgLILFyL1c064tq8WzUZCZL7vsZw4oZB02SiRG2GkvT8n8mSma4KEYVljiidOQ4CZ9JaYqKi+fx8GhvqMgOuQl7SLWVwjpCPkkh4mmif3oehCsxfj/cv24oAbY7Q6VBsXqGiEXrNFYALKW7R1reZgNaj44dz5UOVopfK1PEEue8nOzepnsQTkio+cc2sr6p0zUkh3TXUREFF2FMBvcAiQVCS46qtBqP0S9tStj2Kv/56CK5OnCQNDKMr6bulagqVY/GMNFkDZcsYU2b/EW6VqaYfpl4oeNTx5ZPehN9yiewDO6U69J3H6w5f2mB2huNiuH57DUwWjszqAaV5Av6xUOa7+9NdOCDSPODkSRWNGHSXtoc7DsIf/UBBHdvE6T2MPUS3RevGeC41Q3ZhlXYMUdpeTcUrSQghVFN7hLICbylSCxuqyik5XKChDB5PAROCzFZGx8UTAE/Z7SCZOYxJTdCCAXx06DtIeJ/fXthsCc2d2gSS1zjwZrSxafzcAVYqaScAAedx3COAH3LOhn8MnvYTaqShuezCjEvoEeluCAfWNLz0Ec0lJ8pfAFLZ5gProDVtYxGssOIKxuWV19FstpyJwQCwAJ0O3cwzVepeh+/pqH3Ft+K6+e40ffu2RJwnCC2IVADGI5fyGnBdmvMjzieMjweV12cVJp+RDy5S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(6486002)(83380400001)(316002)(2616005)(107886003)(6512007)(40460700003)(47076005)(82310400005)(6506007)(2906002)(6862004)(508600001)(8936002)(53546011)(26005)(81166007)(86362001)(70586007)(70206006)(4326008)(8676002)(356005)(186003)(336012)(36860700001)(54906003)(33656002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:58:29.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c15483d5-d2ad-4fb4-9abc-08da37e369ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2305

Hi Julien,

> On 16 May 2022, at 18:02, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
> alloc/free" extended the checks in the buddy allocator to catch any
> use of the helpers from context with interrupts disabled.
>=20
> Unfortunately, the rule is not followed in the LPI code when allocating
> the pending table:
>=20
> (XEN) Xen call trace:
> (XEN)    [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
> (XEN)    [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
> (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
> (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
> (XEN)    [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
> (XEN)    [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
> (XEN)    [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+=
0x20/0x50
> (XEN)    [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
> (XEN)    [<0000000000284518>] start_secondary+0x1a8/0x234
> (XEN)    [<0000010722aa4200>] 0000010722aa4200
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus(=
) <=3D 1)' failed at common/page_alloc.c:2212
> (XEN) ****************************************
>=20
> For now the patch extending the checks has been reverted, but it would
> be good to re-introduce it (allocation with interrupt is not desirable).
>=20
> The logic is reworked to allocate the pending table when preparing the
> CPU.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the print fixed as pointed by Michal you can add my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

(Fix could be done on commit but that is up to you).

Cheers
Bertrand


