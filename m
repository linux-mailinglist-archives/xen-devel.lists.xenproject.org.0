Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE1E82D82D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667312.1038453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKwe-0005gz-DO; Mon, 15 Jan 2024 11:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667312.1038453; Mon, 15 Jan 2024 11:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKwe-0005e4-AH; Mon, 15 Jan 2024 11:15:56 +0000
Received: by outflank-mailman (input) for mailman id 667312;
 Mon, 15 Jan 2024 11:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLQD=IZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rPKwb-0005dy-VU
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:15:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721bd66c-b397-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 12:15:53 +0100 (CET)
Received: from AS9PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:488::26)
 by AS4PR08MB7479.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 11:15:44 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:488:cafe::b1) by AS9PR05CA0028.outlook.office365.com
 (2603:10a6:20b:488::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 11:15:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 11:15:44 +0000
Received: ("Tessian outbound 1076c872ecc6:v228");
 Mon, 15 Jan 2024 11:15:44 +0000
Received: from d00e78ca29c9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88501D4A-7537-41A8-961B-A573FEE6BE93.1; 
 Mon, 15 Jan 2024 11:15:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d00e78ca29c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Jan 2024 11:15:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB7931.eurprd08.prod.outlook.com (2603:10a6:150:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Mon, 15 Jan
 2024 11:15:34 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a856:52ca:c1c6:a21d]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a856:52ca:c1c6:a21d%4]) with mapi id 15.20.7181.024; Mon, 15 Jan 2024
 11:15:34 +0000
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
X-Inumbo-ID: 721bd66c-b397-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a6ugnSzZsFYbEHbXzxXBSDeLFlw/qRbbGar7FZdEmjRQ2KwxEtntqlCdutyUKFMWXYXzTVRB8Glk3iVCWKxoXgRAxbpsF/++4D8rJQN1l/Gm8zKEU7SVZp/jw0dMKFgCqTp+OfkfhE8VVreobF6ePIAeNRFTScmrRxExg8lAaT0Quw69o41N369qjjxJbioG71MolBnUc0xt6eCaZpOnfDhodfSJVFBsGlTNvucarGoye5uQ72dPRtj4gvAWWnMsN2U92OhJ/GomWlY9Nh5Y9wD+CyE4In2OKaL6ELpreksRa1EJYfmwUOPXYq54Og5SDLgMjMtjcO19TVl9W/Bubg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gudoaZhbtfJ4EoLZI29GsH9a+MtZ54bxh7M8d6YYiA0=;
 b=mcl2zC+QBPIH+8kNHf5uS0FHs1A+j5GVH1d42Y2V1Ccs+MoR5U35x2d7JkwQmGc8dSE8lgBpliNa/foznRHsSyBxsjtKpfe16DMFpuye/jiz4MLhZV/CnUjQjxNIb1hsZ9oInpoiLf1snEtjDZn4BnQwfFC2zFHnbsWpRWEHzQqEmkif8+DGvm9UyO1zgcH0zo9wkOPo350YKoJ7o8c0vaZy4MRCXiD5nzS1Wz2Hd7PHWkEjsgwsalWMmCuD2MfT8R3Vdo3NjrVnDUpCOpzW8A8psqDfl46sF18kjC307TT8qP7/xYz31cXxg/Ffe5bfVXEoE44m3nrzubcFtwNf1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gudoaZhbtfJ4EoLZI29GsH9a+MtZ54bxh7M8d6YYiA0=;
 b=tD3PTkB+YJHClv0YWPwaigPLJ4JwzFpt6K78v50RfJUuPiQCITJaSCjNztAedJ4ZZEBd5zh0m9sJ5DsqH76BVVyUYW7FyHx2AO+2CR0Vtrmi0xwpTSZ5hZEHotgGA8F7+ZfHGpqcAS3yPHIOzBPbk2GwgwLOCtaU7L/wQa2bz04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76c0c380fdec197d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enlagUCjcxW/vFN/tEx0utX3DjQ3qeCT3be2KoyFpR5hMhTIgxuU3QpdXqDHjPYHE4pHtXK7PzsbyeYUOEv2qGwcXJjA4NP6wLfNZQmVReUOCsPLc3SoppSR5oB3m2xh+ASO+MgvdLK9ypUIQ/cqU2uoOoCMrLoCUpcA0TXAKC/vOHWKUuI4RQHyAsOlfjER03TOEhwum9Ojqc5wKV1ACQnXPQ6+Pb/HtZtfI2PHdEJ7lk5l4G7HIKPsa9InGQkySKaA+MUuvWFW/kINrfh87C9jtkYN8Jag9PGgTJCDtYhAuI2uLHZNH51VgZA1uKQnzQkTo/PLHqzYsWx11tW/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gudoaZhbtfJ4EoLZI29GsH9a+MtZ54bxh7M8d6YYiA0=;
 b=nGvVim8uZZ4o22o5IUlbkEQN9rlhC/YMoJvzhl5nORk4rwheCCqeGBaBRxsN7iJPxNfEv4tHd2+k/ggFqDjWh0aFHIQ7jtbcNSXxe5ngd8nXYs3EMGoKap3JOF8lj2dMegPVR00zzFF/IbH/uFYqTMMbOcW2qIDtipkO5gKYYYvoIAQtMrfKiXIMTwDpyVVpYMtw6Y2ZvUr9IF68mOP7eYud25C0AzkRFU6lLTioNXfT84hqnx8NQVfEqyZ4kMcUEhTrWIB6hmDfr2/SA1JM2mBHs5KDDJ0gn6QnNwFkPPQeDL1OTuW2AvkJq9JpoOUG2VsVCyjG4umsAIK1egUC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gudoaZhbtfJ4EoLZI29GsH9a+MtZ54bxh7M8d6YYiA0=;
 b=tD3PTkB+YJHClv0YWPwaigPLJ4JwzFpt6K78v50RfJUuPiQCITJaSCjNztAedJ4ZZEBd5zh0m9sJ5DsqH76BVVyUYW7FyHx2AO+2CR0Vtrmi0xwpTSZ5hZEHotgGA8F7+ZfHGpqcAS3yPHIOzBPbk2GwgwLOCtaU7L/wQa2bz04=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Topic: [XEN PATCH v2] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Index: AQHaLbct3uqrhXbQ3UuIzfHMXy5EtLDa7NWA
Date: Mon, 15 Jan 2024 11:15:34 +0000
Message-ID: <766738F2-9DE5-4B75-8579-5D49DEA5BC1D@arm.com>
References: <20231213112557.2393086-1-jens.wiklander@linaro.org>
In-Reply-To: <20231213112557.2393086-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB7931:EE_|AMS0EPF00000197:EE_|AS4PR08MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 5166b869-a431-4348-4056-08dc15bb5132
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 URSOXGVoCqfS04K4Gzqer2fudNonFamcwuwqpL73ZvLRLSxclI3g7ACHNwF9lr0sw7sBL6uaal7ie4OAFIG9F00OG7RasfAWvUBRnFfepr3LOzz3n/CTYqTnzsTqpb3oYpXsTFR24uKv8nNFgYCjLoIPDGFutB34PU4f8qNPW5c1o6L42rnJ/tYDWKUcK6YPVQRraM2DiUcFCTEm2Hupx8RqdOMO01rmqZ/6jxyjQQW2EdqAzU9pLs0+QsvNublzys5TxpEf8XYf4LkC2TKPRmroekcWpyXOB4brrao+754uzL08jzBQ4XXD6a7KkMMDTvL819px7UXIuekbg+A6lq136KF9GEOhaU+PmH+2qMCCaYxXFdtYYOdRyJcFFtGo1nsJl4JwluDpvRB9ZBYlym786YTRzg67f5ZR3+ymKuLLWFB+7VzuAk6JBXzluT8i/Udzzq6/zdGIcSYQ16gyZs6L+Clx84rWfdo1JttPNFXTphFgdDhk9U9Xa4ReMm6oMrSzLdAfS4vPYan+7bGIF7I3zFFp3M/GN0jt4FhXX3AiNcP5b3BM1jSXPfXPQ8KDGW1A9t72rIy6aP7fXxX5rNhCh6+WjlOVfRabOw3VP4xpkLEXIQVJzKdTS3VJuflGp0gMADG/2dru0iFpZKcwNg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66446008)(76116006)(64756008)(66476007)(66946007)(6916009)(66556008)(33656002)(122000001)(36756003)(54906003)(8676002)(316002)(8936002)(6512007)(6486002)(4326008)(38100700002)(91956017)(38070700009)(2906002)(30864003)(5660300002)(83380400001)(41300700001)(86362001)(71200400001)(478600001)(2616005)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7433E64C93066446A36AD50F7882CEF9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7931
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6dedcc8-b2fb-4ca5-fb38-08dc15bb4aff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bA5PvgNxOqoacFyjmCYD8E7BxgzH/J6IITIQAqowvT6I1gPhfXz8W9GN3n4+wbrxZ/MRbpSj7+gJvusoFcczTVYT4A+rCSDtqSmtBIKfUNCoimHigMGr1mKg88Z2JNdmGoE2AvQGIiKOtCAShXYYYWTYKS3b2i8Hnh6TGZ8xKFDgZtiyev16Fk0oy/h3fbEK+rYo+y963tTOrA4ZNaA/W0RwCLP94Z8FGqH8s46IUTx6RcxMr8BY247E0MpI3OASC5SXT68RUgWRrJfb+lRK1HO44vMQMKZ2b4OF9Sm908hziwzpmL7TksG/0k4s10tGNy2RGimE8roMpl5WzcfO/uCp8L/DjBnRg+HfyfG0fjzXhQt7aNno6FQn7OU/SvKDKv31Qw9mANr+zCCY0yOiqZSdMVIOlqa4Gm6g/stK6fhwsM2xIV7x0N86Sw9kkmCXj/km7msaSsFnl2OrH0mnvtdrbe94WKfXAAnAtdB2usM1prjOHmuUTapkr1MhD/9UO9uczT5cG40/gdcDUut/zTlNa4ycZCyk/6vvNqIu7VfL6r6juwU25+QKC4UWptYIeJsOxyheJWGjMrLQAR9C/EK6yvdffO1jiz6L/PezHSQoDIiglePqIVCTcYIA7JeDyQAae1I+hBwoGIQKWrTrmfCFZ8+fWRcKWgK3cPnylxJBHnyDbmmQ/aep/tGofNebj5N8N4HzxmhlazjayCH3fkZfpQsM3MDRf8VbhEq9SJOx5Hgj9BC69fOpuXEO7JGx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(83380400001)(6512007)(107886003)(336012)(26005)(2616005)(82740400003)(36860700001)(47076005)(5660300002)(6862004)(8676002)(30864003)(8936002)(2906002)(478600001)(6486002)(4326008)(6506007)(53546011)(316002)(54906003)(70206006)(70586007)(41300700001)(33656002)(356005)(36756003)(81166007)(86362001)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 11:15:44.4301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5166b869-a431-4348-4056-08dc15bb5132
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7479

Hi Jens,

Very sorry for the long delay.

> On 13 Dec 2023, at 12:25, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> When an FF-A enabled guest is destroyed it may leave behind memory
> shared with SPs. This memory must be reclaimed before it's reused or an
> SP may make changes to memory used by a new unrelated guest. So when the
> domain is teared down add FF-A requests to reclaim all remaining shared
> memory.
>=20
> SPs in the secure world are notified using VM_DESTROYED that a guest has
> been destroyed. An SP is supposed to relinquish all shared memory to allo=
w
> reclaiming the memory. The relinquish operation may need to be delayed if
> the shared memory is for instance part of a DMA operation.
>=20
> The domain reference counter is increased when the first FF-A shared
> memory is registered and the counter is decreased again when the last
> shared memory is reclaimed. If FF-A shared memory registrations remain
> at the end of of ffa_domain_teardown() a timer is set to try to reclaim
> the shared memory every second until the memory is reclaimed.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> Hi,
>=20
> This is a follow-up to the RFC patch. In this patch, I take an explicit
> reference on the domain when FF-A shared memory is registered. I've
> discovered that it might not be strictly necessary until all the shared
> pages are released with put_page() they also keep a reference to the
> domain.
>=20
> I'm not entirely sure what is the status of the shared memory when the
> domain has turned into a zombie. We still hold references on the shared
> pages until put_page() is called on each. Is that enough to guarantee tha=
t
> they will not be reused?
>=20
> Thanks,
> Jens
>=20
> v2:
> - Update commit message to match the new implementation
> - Using a per domain bitfield to keep track of which SPs has been notifie=
d
>  with VM_DESTROYED
> - Holding a domain reference counter to keep the domain as a zombie domai=
n
>  while there still is shared memory registrations remaining to be reclaim=
ed
> - Using a timer to retry reclaiming remaining shared memory registrations
>=20
> ---
> xen/arch/arm/tee/ffa.c | 270 ++++++++++++++++++++++++++++++++++-------
> 1 file changed, 224 insertions(+), 46 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 183528d13388..22906a6e1cff 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -54,6 +54,7 @@
> #include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/sizes.h>
> +#include <xen/timer.h>
> #include <xen/types.h>
>=20
> #include <asm/event.h>
> @@ -384,11 +385,6 @@ struct ffa_ctx {
>     unsigned int page_count;
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
> -    /*
> -     * Number of SPs that we have sent a VM created signal to, used in
> -     * ffa_domain_teardown() to know which SPs need to be signalled.
> -     */
> -    uint16_t create_signal_count;
>     bool rx_is_free;
>     /* Used shared memory objects, struct ffa_shm_mem */
>     struct list_head shm_list;
> @@ -402,6 +398,15 @@ struct ffa_ctx {
>     spinlock_t tx_lock;
>     spinlock_t rx_lock;
>     spinlock_t lock;
> +    /* Used if domain can't be teared down immediately */
> +    struct domain *teardown_d;
> +    struct list_head teardown_list;
> +    s_time_t teardown_expire;
> +    /*
> +     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> +     * notified that this guest is being destroyed.
> +     */
> +    unsigned long vm_destroy_bitmap[];
> };
>=20
> struct ffa_shm_mem {
> @@ -436,6 +441,12 @@ static void *ffa_tx __read_mostly;
> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> +
> +/* Used if domain can't be teared down immediately */

Please adapt the comment as this for all domains.
Suggest: Used to track domains that could not be teared down immediately.

> +static struct timer ffa_teardown_timer;
> +static struct list_head ffa_teardown_head;
> +static DEFINE_SPINLOCK(ffa_teardown_lock);
> +
> static bool ffa_get_version(uint32_t *vers)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -850,7 +861,6 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>             goto out_rx_release;
>         }
>=20
> -

You have several style changes like that in the patch.
Those are not major so I am ok if you keep them in the patch but please
mention in the commit messages that you do some code style fixes.

>         memcpy(ctx->rx, ffa_rx, sz);
>     }
>     ctx->rx_is_free =3D false;
> @@ -989,53 +999,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>     }
> }
>=20
> -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     bool ret =3D true;
>=20
>     spin_lock(&ctx->lock);
> +
> +    /*
> +     * If this is the first shm added, increase the domain reference
> +     * counter as we may need to domain around a bit longer to reclaim t=
he

This sentence needs fixing (need to keep the domain..)

> +     * shared memory in the teardown path.
> +     */
> +    if ( !ctx->shm_count )
> +        get_knownalive_domain(d);
> +
>     if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
>         ret =3D false;
>     else
>         ctx->shm_count++;
> +
>     spin_unlock(&ctx->lock);
>=20
>     return ret;
> }
>=20
> -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     spin_lock(&ctx->lock);
> +
>     ASSERT(ctx->shm_count > 0);
>     ctx->shm_count--;
> +
> +    /*
> +     * If this was the last shm removed, let go of the domain reference =
we
> +     * took in inc_ctx_shm_count() above.
> +     */
> +    if ( !ctx->shm_count )
> +        put_domain(d);
> +
>     spin_unlock(&ctx->lock);
> }
>=20
> -static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
>                                              unsigned int page_count)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     struct ffa_shm_mem *shm;
>=20
>     if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
>         return NULL;
> -    if ( !inc_ctx_shm_count(ctx) )
> +    if ( !inc_ctx_shm_count(d, ctx) )
>         return NULL;
>=20
>     shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
>     if ( shm )
>         shm->page_count =3D page_count;
>     else
> -        dec_ctx_shm_count(ctx);
> +        dec_ctx_shm_count(d, ctx);
>=20
>     return shm;
> }
>=20
> -static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *sh=
m)
> +static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
>     if ( !shm )
>         return;
>=20
> -    dec_ctx_shm_count(ctx);
> +    dec_ctx_shm_count(d, ctx);
>     put_shm_pages(shm);
>     xfree(shm);
> }
> @@ -1303,7 +1335,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>         goto out_unlock;
>     }
>=20
> -    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> +    shm =3D alloc_ffa_shm_mem(d, page_count);
>     if ( !shm )
>     {
>         ret =3D FFA_RET_NO_MEMORY;
> @@ -1347,7 +1379,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>=20
> out:
>     if ( ret )
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
> out_unlock:
>     spin_unlock(&ctx->tx_lock);
>=20
> @@ -1398,7 +1430,7 @@ static int handle_mem_reclaim(uint64_t handle, uint=
32_t flags)
>     }
>     else
>     {
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
>     }
>=20
>     return ret;
> @@ -1481,6 +1513,41 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>     }
> }
>=20
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t sp_id)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D start; n < end; n++ )
> +    {
> +        if ( subscr[n] =3D=3D sp_id )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int create_signal_count)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> +                               subscr_vm_created_count,
> +                               subscr_vm_destroyed[n]) )
> +            continue;
> +
> +        set_bit(n, ctx->vm_destroy_bitmap);
> +    }
> +}
> +
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> @@ -1496,11 +1563,14 @@ static int ffa_domain_init(struct domain *d)
>     if ( d->domain_id >=3D UINT16_MAX)
>         return -ERANGE;
>=20
> -    ctx =3D xzalloc(struct ffa_ctx);
> +    ctx =3D xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
> +                              BITS_TO_LONGS(subscr_vm_destroyed_count));
>     if ( !ctx )
>         return -ENOMEM;
>=20
>     d->arch.tee =3D ctx;
> +    ctx->teardown_d =3D d;
> +    INIT_LIST_HEAD(&ctx->shm_list);
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> @@ -1510,64 +1580,169 @@ static int ffa_domain_init(struct domain *d)
>         {
>             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u=
 to  %u: res %d\n",
>                    get_vm_id(d), subscr_vm_created[n], res);
> -            ctx->create_signal_count =3D n;
> +            vm_destroy_bitmap_init(ctx, n);

Here you could just break and ..

>             return -EIO;
>         }
>     }
> -    ctx->create_signal_count =3D subscr_vm_created_count;
> -
> -    INIT_LIST_HEAD(&ctx->shm_list);
> +    vm_destroy_bitmap_init(ctx, subscr_vm_created_count);

call with n and return -EIO if n !=3D vm_created_count.

>=20
>     return 0;
> }
>=20
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> +static void send_vm_destroyed(struct domain *d)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     unsigned int n;
> +    int32_t res;
>=20
> -    for ( n =3D start; n < end; n++ )
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
>     {
> -        if ( subscr[n] =3D=3D sp_id )
> -            return true;
> -    }
> +        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> +            continue;
>=20
> -    return false;
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> +                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
> +        }
> +        else
> +        {
> +            clear_bit(n, ctx->vm_destroy_bitmap);
> +        }
> +    }
> }
>=20
> -/* This function is supposed to undo what ffa_domain_init() has done */
> -static int ffa_domain_teardown(struct domain *d)
> +static void reclaim_shms(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> -    unsigned int n;
> +    struct ffa_shm_mem *shm, *tmp;
>     int32_t res;
>=20
> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> +    {
> +        register_t handle_hi;
> +        register_t handle_lo;
> +
> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> +        if ( res )
> +        {
> +            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> +                   d, shm->handle, res);
> +        }
> +        else
> +        {
> +            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> +                   d, shm->handle);
> +            list_del(&shm->list);
> +            free_ffa_shm_mem(d, shm);
> +        }
> +    }
> +}
> +
> +static bool ffa_domain_teardown_continue(struct ffa_ctx *ctx)
> +{
> +    send_vm_destroyed(ctx->teardown_d);
> +    reclaim_shms(ctx->teardown_d);
> +
> +    if ( ctx->shm_count )
> +    {
> +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, ret=
rying\n", ctx->teardown_d);
> +        return false;
> +    }
> +    else
> +    {
> +        return true;
> +    }
> +}
> +
> +static void ffa_teardown_timer_callback(void *arg)
> +{
> +    struct ffa_ctx *ctx;
> +    bool do_free;
> +
> +    spin_lock(&ffa_teardown_lock);
> +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
> +                                   teardown_list);
> +    spin_unlock(&ffa_teardown_lock);
> +
>     if ( !ctx )
> -        return 0;
> +    {
> +        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> +        return;
> +    }
>=20
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    do_free =3D ffa_domain_teardown_continue(ctx);
> +
> +    spin_lock(&ffa_teardown_lock);
> +    list_del(&ctx->teardown_list);
> +    if ( !do_free )
> +    {
> +        ctx->teardown_expire =3D NOW() + SECONDS(1);
> +        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> +    }
> +    spin_unlock(&ffa_teardown_lock);
> +
> +    if ( do_free )
>     {
>         /*
> -         * Skip SPs subscribed to the VM created event that never was
> -         * notified of the VM creation due to an error during
> -         * ffa_domain_init().
> +         * domain_destroy() has likely been called (via put_domain() in
> +         * reclaim_shms()) by now, so we can't touch the domain
> +         * structure anymore.
>          */
> -        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_cou=
nt,
> -                               subscr_vm_created_count,
> -                               subscr_vm_destroyed[n]) )
> -            continue;
> +        xfree(ctx);
> +    }
>=20
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> -                                     FFA_MSG_SEND_VM_DESTROYED);
> +    spin_lock(&ffa_teardown_lock);
> +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
> +                                   teardown_list);

Why not using list_empty here ?

> +    spin_unlock(&ffa_teardown_lock);
>=20
> -        if ( res )
> -            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> -                   get_vm_id(d), subscr_vm_destroyed[n], res);
> -    }
> +    if ( ctx )
> +        set_timer(&ffa_teardown_timer, ctx->teardown_expire);

I am a bit lost in the teardown_expire here.

Why not just always set the timer to NOW() + SECONDS(1) ?
Don't you have the risk of using an entry where the value was set previousl=
y and would now
be in the past ?

By the way could you create a proper define for the SECONDS(1) part so
that one wanting to do this more or less frequently would just have to chan=
ge
one define value instead ?

> +}
> +
> +static void ffa_queue_ctx_teardown(struct ffa_ctx *ctx)
> +{
> +    ctx->teardown_expire =3D  NOW() + SECONDS(1);
> +
> +    spin_lock(&ffa_teardown_lock);
> +
> +    /*
> +     * The timer is already active if there are queued teardown entries.
> +     */
> +    if ( list_empty(&ffa_teardown_head) )
> +        set_timer(&ffa_teardown_timer, ctx->teardown_expire);
> +
> +    list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> +
> +    spin_unlock(&ffa_teardown_lock);
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */
> +static int ffa_domain_teardown(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
>=20
>     if ( ctx->rx )
>         rxtx_unmap(ctx);
>=20
> +    send_vm_destroyed(d);
> +    reclaim_shms(d);
> +
> +    if ( ctx->shm_count )
> +    {
> +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, ret=
rying\n", d);

This block of code is the same as ffa_domain_teardown_continue so you could=
 just call it and ..

> +        ffa_queue_ctx_teardown(ctx);

call this if it returns false.

Overall i am a bit thinking that we could just have a generic function for =
one
context doing:
- try send vm_destroy
- try reclaim shms
- if succeed free tee
- if not put the context at the end of the teardown list and refire the tim=
er if needed

It feels that we have a bit of code duplication here that might be possible=
 to reduce a bit.


> +        return 0;
> +    }
> +
>     XFREE(d->arch.tee);
>=20
>     return 0;
> @@ -1733,6 +1908,9 @@ static bool ffa_probe(void)
>     if ( !init_sps() )
>         goto err_free_ffa_tx;
>=20
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
>     return true;
>=20
> err_free_ffa_tx:
> --=20
> 2.34.1

Cheers
Bertrand


