Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64E3B9E90
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 11:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149100.275598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzFtX-00022s-LF; Fri, 02 Jul 2021 09:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149100.275598; Fri, 02 Jul 2021 09:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzFtX-0001zu-HT; Fri, 02 Jul 2021 09:55:35 +0000
Received: by outflank-mailman (input) for mailman id 149100;
 Fri, 02 Jul 2021 09:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVfj=L2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lzFtV-0001zo-EB
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 09:55:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fbf92dc-1a8b-4f12-99ea-c3a9077968d1;
 Fri, 02 Jul 2021 09:55:31 +0000 (UTC)
Received: from AM5PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:203:90::29) by VE1PR08MB4912.eurprd08.prod.outlook.com
 (2603:10a6:802:a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 09:55:29 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::26) by AM5PR0402CA0019.outlook.office365.com
 (2603:10a6:203:90::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Fri, 2 Jul 2021 09:55:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 09:55:28 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Fri, 02 Jul 2021 09:55:28 +0000
Received: from aa0dd6780e09.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B04FDB58-CCF6-4D29-92AB-2AE20734A897.1; 
 Fri, 02 Jul 2021 09:54:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa0dd6780e09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jul 2021 09:54:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3880.eurprd08.prod.outlook.com (2603:10a6:20b:86::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Fri, 2 Jul
 2021 09:54:42 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5%9]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 09:54:42 +0000
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
X-Inumbo-ID: 8fbf92dc-1a8b-4f12-99ea-c3a9077968d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAeN4g9hFqVqKa89MWTgNV1qnWJrfTy96z5kl5qbVYA=;
 b=MNXREkDXf83qR398MUpiuQJLdvHrPl3X9Qz5gZAAWYOtNt75pd9BitsZpVK02DW9fztpmkMMoZRTF7sZOqf86uep+OpQhveni7byob6+rKnO4mbDpqFFPZo3fCErnHDZeoeW6mkxcegkfuUBWYlMMb8nqmsDCBatiC0XMQx/a/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ebc7a716a0c72ea9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbFLS3PzWzUmJyoa9Or9fsW3CJC5o6FOGVqf26D2iERwhuaOsKuq5gzrUt0yRFxR1R1f8Wexjx/ZZJhHl2idazLC89VXSRAnpVZwFO/NKB/IklB+pN3dmBHjLbrbaObvDycj2TaFZVdG6kYbAmv6ZbafRWoslStY2W7MKd3TPm3/Hqg3LeeKEY47vuoLRUsGdQzjOOmRX/Xy1fu5UikeE8Oomld+w5AkKhRRxpOz0qdukJgF7nfF4Dys76qHdPNFEJu2JIPnMGzn/JNSunED+jzbyv38sOKhxAWH8dBd+GL4ByzFKtn6R77w0U5LbqSbnO+duewW6zqj0SOFTqK8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAeN4g9hFqVqKa89MWTgNV1qnWJrfTy96z5kl5qbVYA=;
 b=HG+Gk7zB3fHUKzDVDLTTV1BHXkmia1NrPsbIn0C2hkY4U6ZZvCzzZ4X+6W/8JrK78zexZOqdmPYXxieKvz862ItYtEyZnXXQ+81pB4CmEZ/CbVNs/+hprJXWRkah66IRs8h1sqC06h5WTnvHZBwPNaP6rzbyVltz53POGfP8kMSIunfelu+0CkqYVbiHgcNgW+KxTmEISv4pg9fUZ0Ylv2YgE5nHnI20vEjIRC3N6Atz4U7kLqXlQlmLcRiOHwI9Izho0gesjNkfvzo/jisoHd3/g+Cfuv1M9GiuOO3V7hMp8uOP4g2V4aA1Fj6RyGCeN2eYRFjCSlxU3L8l22k5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAeN4g9hFqVqKa89MWTgNV1qnWJrfTy96z5kl5qbVYA=;
 b=MNXREkDXf83qR398MUpiuQJLdvHrPl3X9Qz5gZAAWYOtNt75pd9BitsZpVK02DW9fztpmkMMoZRTF7sZOqf86uep+OpQhveni7byob6+rKnO4mbDpqFFPZo3fCErnHDZeoeW6mkxcegkfuUBWYlMMb8nqmsDCBatiC0XMQx/a/I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
Thread-Topic: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
Thread-Index: AQHXaeBuO8lC15Rvy0GU2dq6zulC56ssS6GAgACREoCAAAMWgIACnQOA
Date: Fri, 2 Jul 2021 09:54:41 +0000
Message-ID: <8BD37A47-7F82-4710-A37C-9C9C933913A9@arm.com>
References:
 <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
 <11df0a34-724a-63ad-1822-4bd8aa364ab0@xen.org>
 <BE2AB42D-A896-4FFE-856C-DA494D8DF1C8@arm.com>
 <f1a4cdb5-c525-8d6b-5f4d-7e2f2c090dcf@xen.org>
In-Reply-To: <f1a4cdb5-c525-8d6b-5f4d-7e2f2c090dcf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0834fae0-2706-47c4-69a6-08d93d3f85bd
x-ms-traffictypediagnostic: AM6PR08MB3880:|VE1PR08MB4912:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4912213EBA88665262BB05D4FC1F9@VE1PR08MB4912.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qHGMzuIxcPRy0HgoUcHUwKbf/XpCK5P07x5yS8GU4kV/jyuIl0X/943gsNQuXSHtWxLmBTjiE+rbq0qUl3SS82zeXJURjz3ACuxzuAP8bRrkd/6KjhqI7HE7YXdBYJ5D1xPBY5EgGi8B4f1YxQHIacvfqf7DVZxX7zZyWb8Y8s44v2tsYocTngySrByPvzGNOp0X6KIrDB4lhDVOPZ97qYMCuuVDvB3vpB+18mgCz4kCeEdO5NheSqX0C4zAIFuDYpV44tVRWNtf0JX1zzVhFZwBnKwnj5i+ndG04GtFPga8cPcIaKeVNBRprWaKhk7rX2Y0ShXXPxXAyU2e59BA5MXy4/LwY1FbpKv1K0ppfBwkngF62ntN0fB2GvAPk45R6jJNAWT1F1Dwdv4g7Y3m4SdzrVlfxv3xUEnaovdkD5p0BciX4w1eRBGVjZa3YXoKwmBzIHivz+d85dqrMxW8on8C/pqKn1TBkAFloM7OMxc35JtnmlLhEDVoTdLuCveHvIbtd64J0T2Yh2H23I4TOkoELvAFKHbLdlb3cath6dl9gvotbuF4dh6VoWFTR4ai8X0sl1Bkl4T191TWga0IpAiP3+2f6CV2W9VYATrebK12S4uEBtqFQcG25jp8gFO/u4iqHj1eSy5qvKB5/5xxoUOntmDuLph0FViFFhQzITu+5gN6NBCqPcNkHWnc81IhyDHqnaDYg2+89xyoJMTz6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(8936002)(26005)(6506007)(53546011)(86362001)(4326008)(2616005)(36756003)(186003)(83380400001)(8676002)(64756008)(66476007)(33656002)(6512007)(122000001)(71200400001)(38100700002)(2906002)(6916009)(76116006)(91956017)(54906003)(66446008)(5660300002)(478600001)(66946007)(316002)(6486002)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Il2Mn1fX1U/ECRXTvI1RMcLDkRebICnJ/bpMENTQgx0gGbmjEzaZErG+BFJn?=
 =?us-ascii?Q?GuqI1Dzfny8E6ZPncDagFaRVj4FAIrnMPM11gzCmS6Rlgx4T+gbxI+U/XRXU?=
 =?us-ascii?Q?cKNwqkAZ4LR0leSit0lnkJ5W0r8KREV4igr4xfyadXrCOVPQVipdAbpRcv3z?=
 =?us-ascii?Q?6BBLlEe5LV0/SHRaYE0wwZLIVcVTYofVw3QGzNm+q4y1ymz6YFE17TeZpFvB?=
 =?us-ascii?Q?76yHgn0KEZ7HjGLG+hl5tg0A6XokC1557HFDod5QNh6P1sQk1v4Uevf0j9z7?=
 =?us-ascii?Q?uhf+c4tLQaH4gQKrItM8pMkmVhvhrYa+NUxFP2uQZe1sc3ctKB8LJ9wG6gCU?=
 =?us-ascii?Q?260jlSp3hxL77L77wBDtmQV6Y9SqX/a0m9DwZVX0uDb62pe+W5qfioB+SLPG?=
 =?us-ascii?Q?scl3UC4M/8Nvaw16gSvJ8bTSnLXxiVLijRmZJoxrygNNnRX+ds09EDvJDadB?=
 =?us-ascii?Q?WlFQzYYvhQS1CRWXVvUpHcgYnhLXCRgOnRqyTLxpIUgxZ4l9xshbjdBFv4ZI?=
 =?us-ascii?Q?Yu8Tc8kPonHVFps7MNxG/uT5d73Lz5evD8rtho1KJJbvSVNbojmqdZVLPOuD?=
 =?us-ascii?Q?bOJpXbs1R3N0CfLTlwuxcXunrCsFRmehMyAMWpumJQ5WyGMaLmBsoEP3jPt9?=
 =?us-ascii?Q?VrpUy8cy/n4fuCMQcdV3sYWT79eAchvYQAuGAjL1F8AzEYbjV11Jgb2R7tmm?=
 =?us-ascii?Q?urlV0dpcU9Wpj/eXbbxUDBv+KFruUhiWMxw8s0EOr52NoDr+/WPeJVahE3Jy?=
 =?us-ascii?Q?IIQqgz0bekK6oGhObRCVsTbFLhNed7fvBQTzYp2dUnjVwdvgZxTL72oI0Scy?=
 =?us-ascii?Q?4ikxC9CqxmJtcpxEl358jI1orQ8YKcA2uXA89zcgh9uR0UryHZNxa7JQFkHg?=
 =?us-ascii?Q?wNVxl4hxPJKreVZ9/lBgmI/+sl4p2t/dYIsY13u0i17YoSr++FlJ5FbKE8GR?=
 =?us-ascii?Q?BWIAuOanQoQwaTAGw25faGkE4D4DIJ3ffRghAB/BavGvTWyFJa0FRt7ojtjw?=
 =?us-ascii?Q?9IptX//eIEMJhvEn3D8Y+R6VSk8s4eg/luYb/pl/iI8I/LC7fEr6/mtLRyKr?=
 =?us-ascii?Q?Q1cTis8aIq7VxMruUXAh2FCYDfRoiim2Y30oCtTToXmhVZWXNL2497/D05gH?=
 =?us-ascii?Q?hc3mUe1zZJqMXkaCA16lD9dXOayEBN5XiuxVxUB5j2JW4hld5T+vTO0pZD2U?=
 =?us-ascii?Q?yhJUITw6+zhzpscznxb4dEiNniWMqGbnE1AwatAvWX8aFx6jQu0rXyv5v8Lf?=
 =?us-ascii?Q?wxbhss7TvQQfykj3pSeHWAD74RyTEffE0a9y3MsGq905xA8dvFqM0Kwr0Zjg?=
 =?us-ascii?Q?OTao+ipjHweig/CZfGJA03uu?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C020664E04687A4CA6FDCE216D7383AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3880
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba9d5ff7-9b82-436a-972b-08d93d3f6a12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G6Lqg5eGLpcQdNM3ZgZtvHg5lmtmy+uJ7pPjZ+3/ZJo3SuSzNxq2W59F/TQ5AzFrn9n1Kb4jo3AeMeWBfiPriZdWYTEA9l7++CehywaLFkFLPR5vYk7HG0oscSRPbgbVW14ybDmuH61youdxXr+k0x+NUIdbruRW1i2R+E8O+lhbfvWLk9V8VVbiCye5N0g2PjQk4Mk/caBS0JBQsZopWjl4OVNBiBpH63wqXJcMfTV89FAZTUSTNAiNQHtYSe2SJ0o7rrE/6NiE14gkrG6VndMKDPIDkKPhd3Z/Jy1cb9fUqomenauGkRYvHqrfgj3EZDR/bsGZfTYf/XxAJj5e+2KZWXCq6kmQv98LE9ACJ6F6DHpiCiWNX4DMyI7pYisM+WoXbXEtiyAdXYKMIQRHp2f5TQWyoOVXhnVj8J3K/J+JdxttfynkaDii14rV3kPBHh2RKNw1ztPoDOMoZHGE4VWy6hilgGWcimfl3rHI5IFe2XeOD0+XrnlaojRuv+CZqT/Ldgz1ONuiCnDGG+Z2Plh+70O28W18lnnEI0yQRRY9vKq67SIOu+PzCVzKvS5NmekrTSrParD7H3E2EY2EVqg9IeJi2SvWhqakHZaiLLX4FtmmqiC0xJdJwA5Z2qB0gKtJ5sGm7XjoQowpugm2km/Hz3alh9SLo04r91D2GrEgaWTwN45bcr2qO3IrGmxcZ6y1tOkhZShF43SwgOwGaA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(36840700001)(46966006)(478600001)(54906003)(6486002)(316002)(336012)(2616005)(6862004)(2906002)(81166007)(47076005)(8936002)(4326008)(33656002)(8676002)(82740400003)(107886003)(83380400001)(356005)(82310400003)(36860700001)(86362001)(70206006)(70586007)(6506007)(53546011)(6512007)(36756003)(5660300002)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 09:55:28.4453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0834fae0-2706-47c4-69a6-08d93d3f85bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4912

Hi Julien,

> On 30 Jun 2021, at 7:00 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 30/06/2021 18:49, Rahul Singh wrote:
>> Hi Julien,
>=20
> Hi,
>=20
>>> On 30 Jun 2021, at 10:09 am, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 25/06/2021 17:37, Rahul Singh wrote:
>>>> SMR allocation should be based on the number of supported stream
>>>> matching register for each SMMU device.
>>>> Issue introduced by commit 5e08586afbb90b2e2d56c175c07db77a4afa873c
>>>> when backported the patches from Linux to XEN to fix the stream match
>>>> conflict issue when two devices have the same stream-id.
>>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> ---
>>>>  xen/drivers/passthrough/arm/smmu.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthro=
ugh/arm/smmu.c
>>>> index d9a3a0cbf6..da2cd457d7 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu.c
>>>> +++ b/xen/drivers/passthrough/arm/smmu.c
>>>> @@ -149,6 +149,7 @@ typedef enum irqreturn irqreturn_t;
>>>>  #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
>>>>  #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
>>>>  #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(voi=
d *), n)
>>>> +#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(voi=
d *), n)
>>>>    static void __iomem *devm_ioremap_resource(struct device *dev,
>>>>  					   struct resource *res)
>>>> @@ -2221,7 +2222,7 @@ static int arm_smmu_device_cfg_probe(struct arm_=
smmu_device *smmu)
>>>>  		smmu->smr_mask_mask =3D smr >> SMR_MASK_SHIFT;
>>>>    		/* Zero-initialised to mark as invalid */
>>>> -		smmu->smrs =3D devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KER=
NEL);
>>>> +		smmu->smrs =3D kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL)=
;
>>>=20
>>> I noticed this is already in... However, I am a bit puzzled into why th=
is was switched devm_kzalloc() to kzalloc_array(). This doesn't matter for =
Xen as they are just wrappers to x*alloc() but a mention in the commit mess=
age would have been useful.
>> Yes we can use the devm_kzalloc(..) but then we have to pass (sizeof(*sm=
mu->smrs) * size ) as size argument to devm_kzalloc(..)
>> I thought for better code readability I will use kzalloc_array() as the =
function name suggests we are allocating memory for an array.
>=20
> My point is devm_k*alloc() and k*alloc() are quite different on the paper=
. One will allocate memory for a given device while the other is unknown me=
mory.
>=20
> It would have been better to call the function devm_kzalloc_array() to ke=
ep to keep the code coherent. Can you please send a patch to make the switc=
h?

Ok. I will modify the code as per your request as below . I will use devm_k=
calloc(..) as this will be more coherent.

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index da2cd457d7..658c40433c 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -149,7 +149,8 @@ typedef enum irqreturn irqreturn_t;
 #define kzalloc(size, flags)           _xzalloc(size, sizeof(void *))
 #define devm_kzalloc(dev, size, flags) _xzalloc(size, sizeof(void *))
 #define kmalloc_array(size, n, flags)  _xmalloc_array(size, sizeof(void *)=
, n)
-#define kzalloc_array(size, n, flags)  _xzalloc_array(size, sizeof(void *)=
, n)
+#define devm_kcalloc(dev, n, size, flags)                      \
+       _xzalloc_array(size, sizeof(void *), n)
=20
 static void __iomem *devm_ioremap_resource(struct device *dev,
                                           struct resource *res)
@@ -2222,7 +2223,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_=
device *smmu)
                smmu->smr_mask_mask =3D smr >> SMR_MASK_SHIFT;
=20
                /* Zero-initialised to mark as invalid */
-               smmu->smrs =3D kzalloc_array(sizeof(*smmu->smrs), size, GFP=
_KERNEL);
+               smmu->smrs =3D devm_kcalloc(smmu->dev, size, sizeof(*smmu->=
smrs),
+                                                               GFP_KERNEL)=
;
                if (!smmu->smrs)
                        return -ENOMEM;

Regards,
Rahul

>=20
> Cheers,
>=20
> --=20
> Julien Grall


