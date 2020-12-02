Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCDC2CBDFF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42720.76862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRx5-0002ZB-Ej; Wed, 02 Dec 2020 13:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42720.76862; Wed, 02 Dec 2020 13:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRx5-0002Yp-Bb; Wed, 02 Dec 2020 13:13:47 +0000
Received: by outflank-mailman (input) for mailman id 42720;
 Wed, 02 Dec 2020 13:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zz6=FG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkRx4-0002Yj-Km
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:13:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 999b570c-ab0b-47df-b356-a799c0c58d9b;
 Wed, 02 Dec 2020 13:13:44 +0000 (UTC)
Received: from AM7PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:20b:110::13)
 by DB8PR08MB5338.eurprd08.prod.outlook.com (2603:10a6:10:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Wed, 2 Dec
 2020 13:13:42 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::75) by AM7PR04CA0003.outlook.office365.com
 (2603:10a6:20b:110::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 13:13:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 13:13:42 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Wed, 02 Dec 2020 13:13:41 +0000
Received: from a111c2080f6c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE896D0E-4039-479F-AC03-03280FD4248D.1; 
 Wed, 02 Dec 2020 13:13:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a111c2080f6c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 13:13:04 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5244.eurprd08.prod.outlook.com (2603:10a6:10:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 13:13:03 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 13:13:03 +0000
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
X-Inumbo-ID: 999b570c-ab0b-47df-b356-a799c0c58d9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEz9Y3eMvGLMljvFhW1rS0tAmWJXxUok54w5uvoLmg=;
 b=8wOxEGcqEJHLymnems8Lb73R0KXaJ3UxSSQKvuiyp4SY9JqWYkRW99iOwQHfPpd3oSsmNkpu9eaaFqqJWGz6VTirvxqYQDH2wAji7baJ0mOWQd48N4vo/Iln1LL6HAi2vfrQfm2GEfvBPdj/lHkEym8CdhjcNrr+j/JkzIeotyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea822e5d80b74535
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP03TGUZhSktOMwhQkHXrB7tnDsMoQDwodJKb7gn7uI/qDGHyVyfdzeeFTsSn8AiJGoB/fEfomvK+q4PUki5PoL2jd/VKrl3lbdKQoGHw4jKJEaZnu0qbZT0CXGOCibp4rFDvMrGjLegCd2qaTzpIB3H20O9WaHCks1E7f1YB9S+h78WB8n7paDU5sRx05pYeZU/KpEaQV8M7BEMNgcheOYT/MPbV9JoXsFIpACPWvPj16VD///CvQ+v8fibtZMfIyIFREegA7mRLfGXq/TUymlR3SDniKxOxR0jvBPZv7PkyERT+MWoom3JuvkzxosN1K+E/ccWbUd6t8/NshUmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEz9Y3eMvGLMljvFhW1rS0tAmWJXxUok54w5uvoLmg=;
 b=EYrouWkzdPWkQAqK+/tUX6R7OsY7WYyTxVoYvdxnrLOWTyhO5YsEBSv755lEm/OLLLntlnvBb/wJTapTYqN7ZYofOMJTGNXp14qFVtnC1yxEsFmlrFxY2ntcM5TUKyN9sjPQ+9rbgY5vDMI//XUds+ntcLGp/nCpfHOX82q9jpyeq3AzR70KkXgezW3aMkD91eK+Jp8fKjPAQEkmVGKlItaO39qNa3dLidpvJowZHaEvmcKStcJ9dcYBUICmnpApjDSQO1NZzBFY1CTJ/qiBOjG6hOAeahwEDDChH39bDbpDI3NycLS+0mM5ryksco8g5iBUyl1q/2RLqYZQC1MV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEz9Y3eMvGLMljvFhW1rS0tAmWJXxUok54w5uvoLmg=;
 b=8wOxEGcqEJHLymnems8Lb73R0KXaJ3UxSSQKvuiyp4SY9JqWYkRW99iOwQHfPpd3oSsmNkpu9eaaFqqJWGz6VTirvxqYQDH2wAji7baJ0mOWQd48N4vo/Iln1LL6HAi2vfrQfm2GEfvBPdj/lHkEym8CdhjcNrr+j/JkzIeotyE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/8] xen/arm: Remove support for Stage-1 translation on
 SMMUv3.
Thread-Topic: [PATCH v2 6/8] xen/arm: Remove support for Stage-1 translation
 on SMMUv3.
Thread-Index: AQHWxBX8ar/P6AWgZUeUeAQIZFy5kKnjAtQAgADOu4A=
Date: Wed, 2 Dec 2020 13:13:03 +0000
Message-ID: <54C9C8EE-083D-47E8-82FD-461D240F8C68@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <29d40e76341983b175250b71e7b7a290895effd0.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011645170.1100@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012011645170.1100@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 685f997a-9b2b-467f-e373-08d896c4174d
x-ms-traffictypediagnostic: DB8PR08MB5244:|DB8PR08MB5338:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5338DC3D5B3419B9B31F8410FCF30@DB8PR08MB5338.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8jL5E+c5VMZhgtWmLqCfcGwhA8QzO00k5FxOTo+1O7xQUGLG+oJnHVwcD8A4HG43mkc7JLleZhK+WKn6y1Gd1tRUb7U8VAr9faur/r52xqtZqivCQTIHOpsCCUUdZR3CBCDGKC9IYPXeFeVNazk5sb4mUdvQECx/fUiG7o24o1W/B/jYvb41hSWG4MDk3mmB+/m+VILWMscWT/HtKUbDZ/RxwnNYsWuESkPkT2XBE2rf2FuSqYRgo2Fsqm+Nj61j5O0zv6fMpQdJT67jwyXQTpLjjnPCRO6g0sW8BzrYeBm6QtMW2ERMkzwiNDAnVHpsp2OK9bKCKyxBUc6CC7vuWN9hFmkhSpoldjVE68Lg5d1NQtePQEQe6prCrduM1/SI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(6486002)(186003)(2906002)(478600001)(6512007)(6916009)(26005)(53546011)(2616005)(6506007)(316002)(8676002)(54906003)(86362001)(83380400001)(8936002)(33656002)(66476007)(64756008)(66446008)(66556008)(76116006)(5660300002)(91956017)(71200400001)(4326008)(36756003)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?fhdmFqRsPDoAEn95wBzSYoMcNHHxBSGprZS1ed9wbQlmNiTQB+aLikAl9OPF?=
 =?us-ascii?Q?RFDSWgNaW3/5rKay4lX1h2RBGSVjEQZDxGbUIVpptaZmlGngoxni2+do6Slq?=
 =?us-ascii?Q?vN9bgkMuIdcafv38+vtHChvvMmrWxygnvr925Ud8W4qD53ZoprxauV0I2uzI?=
 =?us-ascii?Q?jfTka75HBzqIONyddzF1d5n3t0+0qfAlCUwbhHDyt67L/vjzQDyp6RDJiusW?=
 =?us-ascii?Q?rE9PZJKaLDIs3CmkKlGP+pl4L0XN70Tg2/6045io0Jp1f2CERxnfjP+ZGTPZ?=
 =?us-ascii?Q?e0M0qQiGPPaMtRH+6SafI8M1jORBJUDzhbSdgVGH0KevS9Gh2SoIiP3rCNCV?=
 =?us-ascii?Q?QxdpxaUblyRJN3bZ9+HzTu/SetwrApLBz+agURza35ufOOIHkvMKlKxuSEcR?=
 =?us-ascii?Q?4Pd1GDQ7AZipUFvCinV5g80f5MY1dRUn8rSBrGXieaM4NQ/NWveenX6fQ5dD?=
 =?us-ascii?Q?6I/G7/ZG4XB2wKAU025RqVocFmbFyPBkI9H7+PMXQpw83PE5vI2BXliAyEPg?=
 =?us-ascii?Q?j6XWf2LRimTwWin+wysPJFeL58xcp4a/pD2BeS/QBYaURFHfBiBQH0Kah6Ps?=
 =?us-ascii?Q?68s8KiNcMbZxv7qZle0stVTQ06rZDZZ6o5Si3rWX0MrbwRINxSoi95gRCKWy?=
 =?us-ascii?Q?AQAIOdvPECoXZ+OLHHHlwUrYUWn4lTB+Qcw8DBKL+MqSWIIXHtZ3HlSMmCsl?=
 =?us-ascii?Q?JsZJj88/EZ/spxKml/eDpQR1Fb2n6OSlVZY77y+JAhtBU8FhkZhvVvtlcWvl?=
 =?us-ascii?Q?MMJmmbpk+H3oRBoz4/9lDDeigvdgZ7gHs6bnyMwcO6MoEbs2ILWmnJwVtqZo?=
 =?us-ascii?Q?ut76mQAWZatSzNtV978U0uYuw78CGPF31XIGZWKyFusjLQBWon8DYpxXeDzt?=
 =?us-ascii?Q?vsZdlR6jvMoTUc0JAC/2lO4A8SZvtbam+b9pFLyemrdJSWJxnyiYoOo2Evbb?=
 =?us-ascii?Q?dZRFa7qrZGA3Tb4zwD3SyK/LUYAf+X+lsAI8d8z1uI8oj5v6Lrtt6TTB7t6U?=
 =?us-ascii?Q?LFHe?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5B7C67E2CEDBE41A5E93EC05E111CDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5244
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6690022-dfe9-4680-e9b9-08d896c4006f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x75jURq6KakhfySZoI5uAXj7carwsVmnUoCra9pzQ/3eB+A9mb78a+o6fZW01+f3ckjLmiNMjjBItI3VCiwV4ASqgPICLDH+BOvnPxZVYTXksVC3r6A2OYh0bWJWE+U+BTsDSV+ygn2qNN00ZK12o+jFStOo22bW9Rro6jjZ3dcz24rNaAqaY0oiLzl6ZGD7+d91Kv3qiirAY6hc6zT3qWQ73IykzoWNp3Rj1Eg9e2trLOKOjUj2JKMkpHua/rlzE6B82QVg6yclS5v7kxHGMK6+Ug1tAfDOls79XzEU73kVSFTkBKPhejauOz4IXkL75aCvrM466CVGPPv86xFvRhcGwdexGXd9LqxrWaVmllqd+6JBmnoRK4/goTIgGQqtkDlkbVdVzw0GVsadBqw8DA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(47076004)(8936002)(54906003)(6862004)(86362001)(6486002)(107886003)(2616005)(2906002)(36906005)(82740400003)(70206006)(33656002)(4326008)(70586007)(316002)(83380400001)(5660300002)(36756003)(82310400003)(81166007)(356005)(186003)(336012)(26005)(53546011)(6506007)(8676002)(6512007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 13:13:42.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685f997a-9b2b-467f-e373-08d896c4174d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5338

Hello Stefano,

> On 2 Dec 2020, at 12:53 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 26 Nov 2020, Rahul Singh wrote:
>> Linux SMMUv3 driver supports both Stage-1 and Stage-2 translations.
>> As of now only Stage-2 translation support has been tested.
>>=20
>> Once Stage-1 translation support is tested this patch can be added.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> [...]
>=20
>=20
>> @@ -1871,19 +1476,9 @@ static int arm_smmu_domain_finalise(struct iommu_=
domain *domain,
>> 	}
>>=20
>> 	/* Restrict the stage to what we can actually support */
>> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
>> +	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>=20
> It would be good to add an helpful error message if
> ARM_SMMU_FEAT_TRANS_S2 is missing.
>=20

Ack. I will add error message.

Regards,
Rahul
>=20
>> 	switch (smmu_domain->stage) {
>> -	case ARM_SMMU_DOMAIN_S1:
>> -		ias =3D (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
>> -		ias =3D min_t(unsigned long, ias, VA_BITS);
>> -		oas =3D smmu->ias;
>> -		fmt =3D ARM_64_LPAE_S1;
>> -		finalise_stage_fn =3D arm_smmu_domain_finalise_s1;
>> -		break;
>> 	case ARM_SMMU_DOMAIN_NESTED:
>> 	case ARM_SMMU_DOMAIN_S2:
>> 		ias =3D smmu->ias;


