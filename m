Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C885596C7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355393.583029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4flf-0003Iw-Jm; Fri, 24 Jun 2022 09:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355393.583029; Fri, 24 Jun 2022 09:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4flf-0003GC-Fl; Fri, 24 Jun 2022 09:38:23 +0000
Received: by outflank-mailman (input) for mailman id 355393;
 Fri, 24 Jun 2022 09:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4fld-0003G6-Us
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:38:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6263fd62-f3a1-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 11:38:21 +0200 (CEST)
Received: from AM6P194CA0072.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::49)
 by AM0PR08MB5124.eurprd08.prod.outlook.com (2603:10a6:208:161::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 09:38:18 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::78) by AM6P194CA0072.outlook.office365.com
 (2603:10a6:209:84::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 09:38:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 09:38:17 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 24 Jun 2022 09:38:17 +0000
Received: from 3cc7c35f207b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1987DA18-1A00-4D6A-8475-735CD44F0CDA.1; 
 Fri, 24 Jun 2022 09:38:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cc7c35f207b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 09:38:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6877.eurprd08.prod.outlook.com (2603:10a6:102:13a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 09:38:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 09:38:08 +0000
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
X-Inumbo-ID: 6263fd62-f3a1-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eUWT0GdGlOPYpO9Mjz0OzZWjc5yAN0D5qh8VF5LqkIMAfNABl6DPr+haJPDr1TZJ+XlUit8i3szmqMu95VKsRzfIzN7XEghhprTObwwF5xGZzjchQNvGuMomB2y4OQyXiomqP122HLR7TCWyUd79yRdrNNkLSqsroB9YmwpF0UAdUxTTVfb7M5t1Q4n3m6QYHC2ABRj+ZKrV1QKGRbnQrUqzHuXc6LKdZ1JkCA35BWn0C9LMXkNvr0gL9VPktVkRc5fnZUvymV9HrS+ZDm9p4K8m3MNBtDnDZnYGkiPn0KkGd2wxVnZ9pujMpCbWdI6AkaXYfdrW7p+bTB1Vl0M1Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47zris70NczLohxHcqqyqI9T/geQc7MaURXI/wB9rt8=;
 b=Kyf7MNpyI8OYYffR2hza0KXMZb1ifPAnacJjET6LQWA2OH44qHyKmB8y16YShpnqc/X5L0xCQLHU7knahxqt5jowm79tcqRS1py6tjMVOnTAOAE0MkQ4MZtUwDcSi66W5VD3qb7ISquVBP62ZPKKgCntBlB4nbPT2Jl4fxTZjL8YBo6trl73VujfLJoBG6B+8Px3J8J0eJonPoQYjyfpJR2zr9TQNVJXIjhqAnVokY3eDY0GChXnXTwQyby6sXB5rw/+nh2RqYuyahBLA5hqWxAKzuF1eeh7cD+udoTwyFZxO8MtYat95O18bVJhYgleKca2aMdyBSo8loV8hgNmfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47zris70NczLohxHcqqyqI9T/geQc7MaURXI/wB9rt8=;
 b=3b06ryTAtWNKPeL+2Hh0K4i+CDGdQO8wkDvPYtP/PEDVDZvgv9FHniUihPjxJiWahyMLPypmgHhkES02EckWTPUicZgvTPnyeiVf/70wmxWA5vKiQtWjJ9pOmrhLAZLbn4JHUVlwLkzuXPnqYgNXhiTCaT1f9RWKhDy8CYpoAhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 737a7835669229de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFtkLk+14lpjRxNG+e+ajcWO74L03vnWM69ORzq00Xp2fITe05RwJJRYd58fK4Badus1KX4IaMzcUDbj5KDtmAcJV2LvSuSSzlSubBdwI1XnImchmlvM2VwUsf1iTwj94ahcNw2XQ3NR7EG/4ut1GGWzYDKxM5qsUmEFrmGqnc9dDtn5SmyTf9c/NZi30cR5WPKeV4lqY+dLigaGNuJxcsQbb+zGmMiv5DEoQsJNMm6RXPIEKwB+sGWBTwqNhOcvPeWGQ/lucoWLtI1/7Zvp+5JwZhGgbekg4GBOuazDX9HqJ7okN50Pdi80Nw/DWKoCPYZBAm0y2TW/dDT8joZDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47zris70NczLohxHcqqyqI9T/geQc7MaURXI/wB9rt8=;
 b=fEwiQXl8BKfx8v4eiffjRTxe5M62J5c78m+c3nx+m0qXWXXmg4m92cpk51cm5XRusypijHMkGKIheAgD1Vb999OPnaiCjT7D0lTtQDo7ZoxStoTY3QCIAqEpq5xOfzEobIuRJeSR9o8MICfiSHGktf4zFLr1fOrUrId5NZV0Rw4DSIYMhgJAwk7F4a4mbavn5lNB6OCoFPN4EqxjSiMsjspNZmpHi2G+B87dpYnjPO57gQU7HeQeFa+Xo61WKmcUGMDNBCz/6Yg+WEW7H87UGM3EfI9ogLGaxIITJ3LUJcvinjQe2P6oNQ4Mx98/lEQnt+OTgNSq5ng3DS327vmjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47zris70NczLohxHcqqyqI9T/geQc7MaURXI/wB9rt8=;
 b=3b06ryTAtWNKPeL+2Hh0K4i+CDGdQO8wkDvPYtP/PEDVDZvgv9FHniUihPjxJiWahyMLPypmgHhkES02EckWTPUicZgvTPnyeiVf/70wmxWA5vKiQtWjJ9pOmrhLAZLbn4JHUVlwLkzuXPnqYgNXhiTCaT1f9RWKhDy8CYpoAhk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
Thread-Topic: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while
 preparing the CPU
Thread-Index: AQHYf9MHjBymRs/pn0u9upJvLeFm3q1eWpcAgAAB+wA=
Date: Fri, 24 Jun 2022 09:38:08 +0000
Message-ID: <68A4ADAB-9D74-43F7-886C-1A49485D4E77@arm.com>
References: <20220614094157.95631-1-julien@xen.org>
 <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
In-Reply-To: <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dafb6ecf-ea50-4ff6-933e-08da55c54497
x-ms-traffictypediagnostic:
	PAXPR08MB6877:EE_|VE1EUR03FT036:EE_|AM0PR08MB5124:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FhwWqTZzUJ7n/M2SjPZIEB1AzJhzIpYqDDqeAfvjzkIYJTCuIvNuLTqeHEJLwbUTi3DrkSXaonkrK2+8rMyTEUPDOCOEfM4ldmaolpsKP4xRgjaFLLZLSVlvp4lZhWHDKs8C7+JBBsubv0dqB6Oj/XMWmIr/QnrArKFc95fPRD9n9MYwLA+tuyG+bn+xn7yDzy/hQin4QqF6bKpzN8wWdKnw7svwhjvW3M2C3GYfddL6Bj+1AUU7jhNZ0yqTXEu1CB7NoZk7zqZ7GQ1uTo4CfUWBYTafJeoBX5te2kx0zrPmO2b+vOGsvm+MxBJNo8leR+N+6Qqw01gqEppqPXRKHoP19nwZSJz+1QJgN3eUIb9IKs116ltSpdqzBWYrkJYLzZyuuO09BVEa4JXSKt5WAPzgU7Wm4Y+JRIIt7tprm7/u1u4m1dVORzpqrzFg02TvLTqOOsKzjCswITjW27uEY+4hGygqdLSLQBORa6DieiVhHe2uRwrxobTfJAfG9/stZGw0mgrxIUUU37KJ0gSuim4ic2a7LuRMWv7qFtWU+uPyYamoiMnecpcKtaP3NI9EoAtrXcBUae/Tv+3XiM3ZrkeieYMqcvxx9wBl/lPP2hjOSY2Vd6acgz1F8GJ4c+la+PtNPJe7WZ7kjfRXawbpK1YeQFZ0pE3PWsHS5a3VuqdFZJOYZeT/QCAsY3PJNEf2tkCIib2LfY+0sqhKkiksDsmmBSp49HM/Bf3aLiLjzh2ej422ZDNGajintjdaokJ3kIdLSSSBJMQk4FvkaNtbiseYioi4dC1K8MEqEkKXfylQHwDt+84CdRPbDHK27fEI1gvPIsj8vWowkIjp2eWWLg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(64756008)(66946007)(91956017)(66446008)(76116006)(66476007)(66556008)(2616005)(71200400001)(54906003)(8676002)(4326008)(86362001)(38070700005)(5660300002)(6916009)(122000001)(8936002)(186003)(6506007)(53546011)(83380400001)(38100700002)(6512007)(478600001)(36756003)(41300700001)(33656002)(26005)(6486002)(2906002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3ED143ECBC438B408AA79B78F9B094DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6877
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbecd789-f18f-430e-c1f1-08da55c53f3e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	COpEFGUchJmOGM2cXzr2TyRFCAn2CnQhFb/8yc9naZgt6BmACwvrDAut523Dom90FRwXKEESb5eIBC5VOmJ7kCQnfRELD8UL5nfTj4CGsgP9jbAvtSOo3e2q7Zh2Fi1yE7cA9hogMtEXKt0ziDkm05C0GLOLx352JtTb+m7Cxbm5wqz1ok+HCHPZO1l1n8ytdFQdMe0Qrcc9qqJ43Lu9YgqbDBe3YWYh71l6+tYA4bAndOu2+z/f0wtqV+4wGktL8nKrOSIxukidHhAAzSVgudVjI9L6LHNe8HyrUZntB/zJRGJ+oeFjlnSMMCf+8Nj9lSQ/FapP8W2lfrUyqGAl9jcj3DsUPO3cw2/CcYQzDsmeXxqvxkwzLAwZ0hMkuUQtuIVh70HCf8a73oMDHeg9WgEluNK+A12xtwFGCVYHAYJd+Z9wSQ2xQYxD5T8xYxZs86fh8XgzBBR5uTs+kaXgUOScSFPFNCMjqdjiPVehJ4hMKtbuIgtLpdnRjPgDW5yhd+6GN2F4SQXZZTiljf01u5wbImHHkaPp1jS8nQ5zOe4gLaG9OwpRlSCAfV5z1DiKWtCBNCCImcsArFuduCkPreVzGjYUtoD93pJOhWtWc/LRCahQesMu94YfLkYnECg8/mFpXVlH/3l4rIKgoQIxEI73mb0ZmVyKm82oLHxzTX3oEO0ydSFKnNRjjCTYbOzeYV/LJ+zRW7Or8rHlnXEBJuDI0GulJYLnL9SnoqZVinX/d55AajspbMovYN1y0YlnRIn7yNodsQmUC3h53TKu5KORGYLTG4+6+lKU1Bm60UASa8AwB8f2nZG7n4aCv+xM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(8936002)(70586007)(70206006)(4326008)(40480700001)(36756003)(33656002)(316002)(81166007)(8676002)(6862004)(356005)(336012)(2616005)(83380400001)(6486002)(54906003)(2906002)(47076005)(40460700003)(6506007)(41300700001)(82740400003)(82310400005)(478600001)(5660300002)(26005)(53546011)(86362001)(6512007)(107886003)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 09:38:17.2931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dafb6ecf-ea50-4ff6-933e-08da55c54497
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5124

Sorry, this was suppose to be off list but nothing wrong in making everybod=
y aware I guess :-)

Bertrand

> On 24 Jun 2022, at 10:31, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
> [OFFLIST]
>=20
>> On 14 Jun 2022, at 10:41, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
>> xmalloc()" extended the checks in _xmalloc() to catch any use of the
>> helpers from context with interrupts disabled.
>>=20
>> Unfortunately, the rule is not followed when initializing the per-CPU
>> IRQs:
>>=20
>> (XEN) Xen call trace:
>> (XEN) [<002389f4>] _xmalloc+0xfc/0x314 (PC)
>> (XEN) [<00000000>] 00000000 (LR)
>> (XEN) [<0021a7c4>] init_one_irq_desc+0x48/0xd0
>> (XEN) [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
>> (XEN) [<00280834>] init_secondary_IRQ+0x10/0x2c
>> (XEN) [<00288fa4>] start_secondary+0x194/0x274
>> (XEN) [<40010170>] 40010170
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus=
() <=3D 1)' failed at common/xmalloc_tlsf.c:601
>> (XEN) ****************************************
>>=20
>> This is happening because zalloc_cpumask_var() may allocate memory
>> if NR_CPUS is > 2 * sizeof(unsigned long).
>>=20
>> Avoid the problem by allocate the per-CPU IRQs while preparing the
>> CPU.
>>=20
>> This also has the benefit to remove a BUG_ON() in the secondary CPU
>> code.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> I still have issues after applying this patch on qemu-arm32:
>=20
> (XEN) CPU0: Guest atomics will try 1 times before pausing the domain^M^M
> (XEN) Bringing up CPU1^M^M
> (XEN) CPU1: Guest atomics will try 1 times before pausing the domain^M^M
> (XEN) Assertion 'test_bit(_IRQ_DISABLED, &desc->status)' failed at arch/a=
rm/gic.c:124^M^M
> (XEN) ----[ Xen-4.17-unstable arm32 debug=3Dy Not tainted ]----^M^M
> (XEN) CPU: 1^M^M
> (XEN) PC: 0026f134 gic_route_irq_to_xen+0xa4/0xb0^M^M
> (XEN) CPSR: 400001da MODE:Hypervisor^M^M
> (XEN) R0: 00000120 R1: 000000a0 R2: 40002538 R3: 00000000^M^M
> (XEN) R4: 40004f00 R5: 000000a0 R6: 40002538 R7: 8000015a^M^M
> (XEN) R8: 00000000 R9: 40004f14 R10:3fe10000 R11:43fefeec R12:40002ff8^M^=
M
> (XEN) HYP: SP: 43fefed4 LR: 0026f0b8^M^M
> (XEN) ^M^M
> (XEN) VTCR_EL2: 00000000^M^M
> (XEN) VTTBR_EL2: 0000000000000000^M^M
> (XEN) ^M^M
> (XEN) SCTLR_EL2: 30cd187f^M^M
> (XEN) HCR_EL2: 00000038^M^M
> (XEN) TTBR0_EL2: 00000000bfffa000^M^M
> (XEN) ^M^M
> (XEN) ESR_EL2: 00000000^M^M
> (XEN) HPFAR_EL2: 00000000^M^M
> (XEN) HDFAR: 00000000^M^M
> (XEN) HIFAR: 00000000^M^M
> (XEN) ^M^M
> (XEN) Xen stack trace from sp=3D43fefed4:^M^M
> (XEN) 00000000 40004f00 00000000 40002538 8000015a 43feff0c 00272a4c 4000=
2538^M^M
> (XEN) 002a47c4 00000019 00000000 0026ee28 40010000 43feff2c 00272b30 0030=
9298^M^M
> (XEN) 00000001 0033b248 00000001 00000000 40010000 43feff3c 0026f7ac 0000=
0000^M^M
> (XEN) 00201828 43feff54 0027ac3c bfffa000 00000000 00000000 00000001 0000=
0000^M^M
> (XEN) 400100c0 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000^M^M
> (XEN) Xen call trace:^M^M
> (XEN) [<0026f134>] gic_route_irq_to_xen+0xa4/0xb0 (PC)^M^M
> (XEN) [<0026f0b8>] gic_route_irq_to_xen+0x28/0xb0 (LR)^M^M
> (XEN) [<00272a4c>] setup_irq+0x104/0x178^M^M
> (XEN) [<00272b30>] request_irq+0x70/0xb4^M^M
> (XEN) [<0026f7ac>] init_maintenance_interrupt+0x40/0x5c^M^M
> (XEN) [<0027ac3c>] start_secondary+0x1e8/0x270^M^M
> (XEN) [<400100c0>] 400100c0^M^M
>=20
> Just wanted to signal before you push this out.
>=20
> I will investigate deeper and come back to you.
>=20
> Cheers
> Bertrand


