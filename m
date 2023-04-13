Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AE6E0BE2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520624.808407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuc9-0001tj-At; Thu, 13 Apr 2023 10:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520624.808407; Thu, 13 Apr 2023 10:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuc9-0001rC-7x; Thu, 13 Apr 2023 10:55:41 +0000
Received: by outflank-mailman (input) for mailman id 520624;
 Thu, 13 Apr 2023 10:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmuc7-0001r6-NP
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:55:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b912dceb-d9e9-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 12:55:37 +0200 (CEST)
Received: from DUZPR01CA0277.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::21) by GVXPR08MB7728.eurprd08.prod.outlook.com
 (2603:10a6:150:6a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 10:55:33 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::f7) by DUZPR01CA0277.outlook.office365.com
 (2603:10a6:10:4b9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 10:55:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 10:55:32 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 13 Apr 2023 10:55:32 +0000
Received: from 4080c0bc5b40.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 448A4F4C-DD8C-4774-B5BD-5762DF691FF4.1; 
 Thu, 13 Apr 2023 10:55:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4080c0bc5b40.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 10:55:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10099.eurprd08.prod.outlook.com (2603:10a6:20b:628::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:55:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:55:13 +0000
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
X-Inumbo-ID: b912dceb-d9e9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7an/gZhtDrWRNg2OCaW8n6WhijrkmtfSxkjWDk2/8wU=;
 b=ESitETdiT1Ie66Gv8DiGSlWKjNt4wtMQDCo1vah4/P+ef9+MpOPBLmg5GY7FbpF6wcoNISR0J8UTtnvuRLAR6U8sfQeIzuL4AqUm2uzKoBKjZqJF1FYcnltIhKuYvBM1Q7Okdriw+Ofdf9A6zWr73CG0hsFksLYHkdD7wOa79f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh+lifeKc2lLyKL4NbEaZ775l2BpKDxCBtFI3AVfGZQylXpoP682RgB90BfPqxlS63JF3IBCjpV76TnaAHbnqJytVywVvk/RXeEfljAA1E16MRVexL/lXqFmn7uejZGQxgEtLqwjLO7bcARg5Tpkn5kWTdDPURNpToetHnlttaUDlSrPpjhHm1fRuChNxxTAM/L5N4gJ3eIF9o1gdOuz/uMR7ufbX1okvqrtTSs8HS4Ezz6fdez18PNtbADBQMD/IVHSVpAF9CD5nlXWPmpF1Io/xNPpoiC2IBFTE4gpDcVzRzoRZvY9B9kkEFHDWJdIGRzaw93MayllX9yFsURjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7an/gZhtDrWRNg2OCaW8n6WhijrkmtfSxkjWDk2/8wU=;
 b=XCySfI+Xaa/Ay7S8qP+BQo0P8023gwh8AyYXwBQj37ejpdvNJ6pvzq+jBTQ3nMZtv2O/7HB1sIdKMbhXDqakTSsXFtf6hVVYs8wdxouEbzIT/n8Z1iNyj7E/rGQovKwvjcGRqwtJ6Ju8srK+C4pDef72iq1CZcnakMiVQLWXYRbpmn+ExEtzeu5dTn2OZsKLFkSTzT7noCPlM8KfGLaqtxd/x6OR3dn1a1Gc8jbK+Em5S8a/fM47SDsDA0FCCBeSbEdhcJmw4n2BGNz/K8qi2//vmrRIHtAoACDfg7Dmmglld2LUvdPBQeQZjcHFMlLItsuwMyeDl9gikHiT1GoXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7an/gZhtDrWRNg2OCaW8n6WhijrkmtfSxkjWDk2/8wU=;
 b=ESitETdiT1Ie66Gv8DiGSlWKjNt4wtMQDCo1vah4/P+ef9+MpOPBLmg5GY7FbpF6wcoNISR0J8UTtnvuRLAR6U8sfQeIzuL4AqUm2uzKoBKjZqJF1FYcnltIhKuYvBM1Q7Okdriw+Ofdf9A6zWr73CG0hsFksLYHkdD7wOa79f0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k pages
Thread-Topic: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k
 pages
Thread-Index: AQHZbdfbHuhV0b3KPUiyzqcZuUyyg68pEPqQ
Date: Thu, 13 Apr 2023 10:55:13 +0000
Message-ID:
 <AS8PR08MB7991C16F543C4B1C4611572F92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-8-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-8-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3767CAB25120244EB39A17645D99F2A6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10099:EE_|DBAEUR03FT039:EE_|GVXPR08MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e2aefb-fd21-4ac1-7c55-08db3c0d9a74
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k9+hC3buFul2nfqkP2IP/Md9zXujGPlfzzDy9IHyB7B2Ppn2Wn9FJmoa608IALFkWzPN4LVAhKmvMz0kFsUyBTgK5UgwIVjfvmtagn8T4QXIaYwvxpCn8ycqW8/0b8JGKl0jC8Kn3QkDxdRULwVtmxWUz7UzURu52P62c8BLXhllHFn62mMQLe+65JXgF5kPW6fgZVxpbKVMDyC5G+wKbdENry+4bZEZ9RJp3VUn3lrUNqZEF57s+2WVpYRPoV+4zxaWUJ1zPD1Q4rDiCJRYciWZLIXIh+Zlrdcgbe0leBf5ISpXq7JgHfc3JNxHjj1oduo1GCyzHOA/bIdh9tvMfff6h030vPhxhSm9QXi3seJC9NSeyEHZvCCVhy+BSfwLdOav4ylN3hw0IGEdL0/SRAMTJhHBErqmEGUO6YbouDV16yayJG5wbq8h/izyyKexxJpPO/Jf8XgU385iGYPApRjleq3v5W4ZfiXiYL/OCc31v2bsNbJ05ml1R+iScx5eZ3coqtkkk2f6sAwEohZC0+iMBW0S71uP9JxWf29hRopuO4p/0gc6TVHmZSreo195jzLA55m3Jb4DrpPyAzuaQwx2Y6ZvZbFO15g5qCpvJjI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(5660300002)(41300700001)(33656002)(122000001)(38100700002)(4744005)(2906002)(52536014)(55016003)(38070700005)(8676002)(86362001)(4326008)(66556008)(8936002)(66446008)(66946007)(64756008)(66476007)(316002)(83380400001)(76116006)(6506007)(54906003)(110136005)(26005)(9686003)(186003)(7696005)(478600001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e0ec7bc-7f98-4615-eace-08db3c0d8ec8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eZNQY1OQQ2l+TvsJjOCfqYoR0G3hkzQBdmH1MWEtanK/MLNhCGWKYcS85z+gjcKsh7X9XQt7WQN0nOwXSN+czz1xvscBVU5cgzLhsF1Er2zAwiKwlv0OT4wu9aaLp+4xzOUUkrDHaXuCyu2R6z3HIUR2ecVpGpsvO5ML3Q/lp1Snp9V0ReFTPS0bAH4x/xodu2DKMXvyDu1dYlc491z8TOaeZXMpnsV/YPG3jvuGAFWhxnEclWoM/LE5iqwS8h+5SBftEpvo+2Jsv61Y8VwIegfSNeYBLvlVshIWyBG+ZBfiWQBXABBvVrxW3KS2UtlQFS9OkEruTCc/TO96LLN4bN+9bY3+2Ko2ejJfXphoRvRJ6z9RPgMkdfxzTE474kTj+a6fA+UThY+tSuDsW13UqdXTFFnYD5WR7JH/VqES5V1vcnwzJSA2iTZA4spwYWbdQx0XxQs7AbL6V3eHZ7sRs9eQ8aQ9sgoex5WnJf78+kgEhn5lcvUaTU/YyGm1O6R5J/nsBw1twXSaWjZI4R0X6KRtUjYR7oUV1h74IHhSjh97Esay6I5RxcURCo1vhm9+E1HNkSdeVB/JCsH4gxRGyW4YL3bTumyqU35ZzCPg71a0uC4/Sc/ZKvdHWMblOD0vrGKcYlFftw7xsFvpHP5G3iFr4Ywfw/Im9pXkdMq0Cdx3YKWaiO2yCmTPUXne17xP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(7696005)(8676002)(70206006)(4326008)(54906003)(478600001)(70586007)(41300700001)(110136005)(316002)(33656002)(86362001)(336012)(9686003)(6506007)(26005)(47076005)(83380400001)(4744005)(40480700001)(82310400005)(5660300002)(36860700001)(55016003)(8936002)(186003)(52536014)(81166007)(2906002)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:55:32.6623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e2aefb-fd21-4ac1-7c55-08db3c0d9a74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7728

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k page=
s
>=20
> Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
> mediator since the current implementation only works if Xen page size is
> the same as the FFA page size.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

