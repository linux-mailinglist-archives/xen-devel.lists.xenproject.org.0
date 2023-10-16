Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE07CA976
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617569.960268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNh4-00044V-Hc; Mon, 16 Oct 2023 13:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617569.960268; Mon, 16 Oct 2023 13:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNh4-00042D-Es; Mon, 16 Oct 2023 13:31:38 +0000
Received: by outflank-mailman (input) for mailman id 617569;
 Mon, 16 Oct 2023 13:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsNh2-000427-Rg
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:31:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 528cf0c3-6c28-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:31:34 +0200 (CEST)
Received: from AM6PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:20b:2e::19)
 by DU5PR08MB10398.eurprd08.prod.outlook.com (2603:10a6:10:51f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:31:31 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::2e) by AM6PR05CA0006.outlook.office365.com
 (2603:10a6:20b:2e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 13:31:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 13:31:30 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Mon, 16 Oct 2023 13:31:30 +0000
Received: from 9e2c742f7b81.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10378EEB-123D-4221-836E-002BF12F2463.1; 
 Mon, 16 Oct 2023 13:31:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e2c742f7b81.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 13:31:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8096.eurprd08.prod.outlook.com (2603:10a6:20b:58b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 13:31:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:31:16 +0000
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
X-Inumbo-ID: 528cf0c3-6c28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yAZN0TUi50zVdoWm0Ve0fhs//+isYRRcT/AXWAbQ5I=;
 b=UKtyAJCRZVUnB0gX5YI6a4j5fSPeQFvMrIyjtX3L8aA5iaTTbNaezH4ird943y1OPSx71BsJgd4LyfTquuGfH/+dxfZlV5rRBkfSv3BwMrTv39IxQw+ekyI3OXFPUaBMcAOPL5MAeTzqAksCbJH8waKEzpYs2T2c+CT0Y+JIigY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10a6acccc241518e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+HSms1fLr/K3bxL3zz4abPjDRUe82BFAallmG+oFP4kYRBUz6HHphEs1uPDgxrFGeoK/Nb0qUPrjamos0nEQcKQJM4nOdFZlNm+m64g9k/uuE+vPmdoPx6tRTwuHSPdP1TviWctCZ2enkwso3GT7SpEut9pJ5zl+jTcWzAIEUFE8MuLhZONcvHdK6j8XLF8bqz+Ry7OjXBy+hdXA2qXOB9G1clXVNXmxDZ8Y+kHPDKBzoZ2BLddKAXW6owe1gcgtrr87PvEkBFvfB2BOfBs51bQQA7JPOBJBd17hYx80o8GunLp1/e9wH8g9P/8U3S8KjpnpVfSZ3FOEZUaZNBIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yAZN0TUi50zVdoWm0Ve0fhs//+isYRRcT/AXWAbQ5I=;
 b=YvZDjYBoXuec4M4udwpQ26pG2fwCy9toj7snXRdtjxN3CDXLxSlUCJPDjlUThkUXVebFANX5RGCT4M1F3HCjY0d8HniBbuCchEt5I70N2TUzUBv7u23jf2gJO76by6DxGbvbKkYYWOTWfBKvOSGU8Oz9lh2motMvJbXIqPRd3Mg0p6/EC2Hn/xXJlZk3BVJYNTu/Ay9dr+oPnBEaOJ9vaQqtLPvkZCjYV/bZLBOtw31RLdfFxQDB+Tlg8ccAm8q5OwjAsCuuycFDWWAcd8j9p9YOSiADe71D8Z+yLq2F34z7nuVAF+BRXZJSAxVT7KnZ0x+UUUIhAlqabt4B6f/9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yAZN0TUi50zVdoWm0Ve0fhs//+isYRRcT/AXWAbQ5I=;
 b=UKtyAJCRZVUnB0gX5YI6a4j5fSPeQFvMrIyjtX3L8aA5iaTTbNaezH4ird943y1OPSx71BsJgd4LyfTquuGfH/+dxfZlV5rRBkfSv3BwMrTv39IxQw+ekyI3OXFPUaBMcAOPL5MAeTzqAksCbJH8waKEzpYs2T2c+CT0Y+JIigY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Topic: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Index: AQHZ/el7rXFHK+9WvkOYQpiDC7n8ALBMJIIAgABJsYA=
Date: Mon, 16 Oct 2023 13:31:16 +0000
Message-ID: <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
 <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
In-Reply-To: <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB8096:EE_|AM7EUR03FT050:EE_|DU5PR08MB10398:EE_
X-MS-Office365-Filtering-Correlation-Id: d816ffbc-555b-40ac-6984-08dbce4c352b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DMYou8EGET1tMKQrfSi3xD/3HCmLIgwdzb1rhlZdbn6mvbqs2sH5sYhp7mv4U6eZPjufuI+hXNN0Nog4WajXj34qtcVYTCTnZdEIIi2Klqwg5Is8VPyOS1ob+qA1aGb93cj0NagPZb0zsRoh4Rl/TGTBiHoxE5L6B7alPLgKprW+nFfv35TBvmSSbWB+zJhjkTmWadzGk9Q9QzGLqB7mHhltNV8esT1olqpW3D4QEl8j8UyxqMHJOqY3NwzQ3pk8mqoJ6nEfNoam7ouhkx0yqALeOqP7/2QUReVeuS7k98pR9YXMiaPnDSOLBxa9PLAXbCaJFqHJzrUCICRd7TBJrnv8iHA2HGkaZXNbjGCOKgLs0bCofoQJnNEsLo3XUjOCahKHXXI6Jw4vLDr++n4LDilW4HA0Al/lQu6jMl5Utf/UCDqe26jKx54waxP8POdDV1+twq840toY9dlg64LiFLQ4TZJ/gyuHLgQ6ZHCtxtxau2rldL9G3BzluNGX+QKanQ9WHpTrqqk4H4OzbZkGqnIpDMBzTAH54Jk7BwCWvitZyykxhjEY7P6QzT3nbULhKhRRWYqXDb8a5O4HKPpQyqbKZ7DXII+ViNUJ6z7RtDca62KBXujigNrzUZror3h7QVdmgWm1AmrLRMGR8teKEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(33656002)(6512007)(38100700002)(38070700005)(26005)(122000001)(2616005)(478600001)(6486002)(5660300002)(8936002)(4326008)(86362001)(2906002)(4744005)(54906003)(6916009)(316002)(91956017)(66556008)(64756008)(66446008)(36756003)(66476007)(41300700001)(76116006)(66946007)(71200400001)(8676002)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C35A078F7DB14F42B18B5AB41E4A08A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad4f20e5-6d77-42a7-3b53-08dbce4c2c61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TUGip4baSA9cqKliHjkVvAwhCU6JzmCi8Egecy7dnLlYr6uh7kvojgoqNTF+dsMfHDBwB4J2h1O2vQZhYh5A0egMDvbAPIkymwjOOvzUuMAYyTtEw7YoNDoS069oq02zhCF7s3I+XxOupfmRf+fWyqOOQIWx1LqAMQ3NWKWvaCpSpD2DErgKaIE2kkeTTMYbv+ZlP+QpiD6QpZoe1wW71dvkZckCPnLKpCrigEkHgvciR8QqPRBUGoQQjc/WnVAr6djSirIPlw4Q3HnXTjWedHifXZb+5N7Qetea1sB84P10C53x3J67ECiRuuaSb1+AknLhEMilXty7onApHHIns2+WzJjMOrVWKjOtVM8hrEfpz6QVDwgjQtVuqpvqUhL+4Qmb3TVPwZ+wd7vlBRmmh5NA9RZP8bVSF6H1JNNK1h4F4xrATli8cE2UJL2t6HG9/S39UZNlHZEDLAXce5KFdFOIliQZpxp/t3O+fRTjlzhxn7stBAWKGT/3vjBIEB8TKoThhaf8G7StBYelgPb1ZPmopuksrd7SJMrpzgq3Nbpy2tqmoFjYNqjAIJE/49mm7RCJSv4JX5THHK66/b4ia7rQFDnehGp9ND7rhoLqyadQnsxqWIM1j4xFsKl6TtmHqoDYhNI++3fh75aK49hmZh8Y0TyNIyGqdmPyVJpFtyeomTFslqAlzJTg3EnwnvxCG/hZZILFqz5t3Q2EPr205O9Rq449Iujosm46r8xihIg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(6486002)(70206006)(478600001)(70586007)(54906003)(26005)(316002)(336012)(53546011)(6506007)(6512007)(41300700001)(2616005)(4326008)(8936002)(2906002)(5660300002)(36756003)(8676002)(33656002)(6862004)(81166007)(86362001)(47076005)(36860700001)(82740400003)(356005)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:31:30.7462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d816ffbc-555b-40ac-6984-08dbce4c352b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10398

Hi Julien,

> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 13/10/2023 16:24, Federico Serafini wrote:
>> Add missing parameter names, no functional change.
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>  xen/drivers/passthrough/arm/smmu.c | 6 +++---
>=20
> This file is using the Linux coding style because it is imported from Lin=
ux. I was under the impression we would exclude such file for now.
>=20
> Looking at exclude-list.json, it doesn't seem to be present. I think this=
 patch should be replaced with adding a line in execlude-list.json.

I think that during one of the discussions we said that this file already d=
eviated quite a lot from the status in Linux and we wanted to turn it to Xe=
n coding style in the future hence it is not listed in the exclude file.
At the end having a working smmu might be critical in a safety context so i=
t will make sense to also check this part of xen.

@Rahul: do you agree ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


