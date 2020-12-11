Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091512D7426
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50375.89015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfxV-00010G-2Z; Fri, 11 Dec 2020 10:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50375.89015; Fri, 11 Dec 2020 10:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfxU-0000ze-Ud; Fri, 11 Dec 2020 10:47:32 +0000
Received: by outflank-mailman (input) for mailman id 50375;
 Fri, 11 Dec 2020 10:47:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUI=FP=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1knfxT-0000zP-LS
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:47:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ffe559c-faa2-41a2-8854-333585e44b95;
 Fri, 11 Dec 2020 10:47:30 +0000 (UTC)
Received: from AS8PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:312::34)
 by DBBPR08MB4346.eurprd08.prod.outlook.com (2603:10a6:10:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 10:47:28 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::b3) by AS8PR04CA0059.outlook.office365.com
 (2603:10a6:20b:312::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13 via Frontend
 Transport; Fri, 11 Dec 2020 10:47:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 10:47:28 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Fri, 11 Dec 2020 10:47:27 +0000
Received: from ea805283bef2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6E95099-EF90-498D-B83E-AF5D53533BB4.1; 
 Fri, 11 Dec 2020 10:46:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea805283bef2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 10:46:50 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4629.eurprd08.prod.outlook.com (2603:10a6:10:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 10:46:48 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3654.013; Fri, 11 Dec 2020
 10:46:48 +0000
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
X-Inumbo-ID: 0ffe559c-faa2-41a2-8854-333585e44b95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zLMZpv/HzrZx5MO2wX7WXWcoDxwiaK0i66zyzHvxlM=;
 b=MxWq9U2gBwp+03VgqYJwJxqHcXf8mJUUsD0+MZ+BvfURFoxilYkKvs88n0zhbiq/WFhlco/zTmBKox+oe1jZt/CKuBRKQsSFYwUWJOJ7BWN3DDZOPQyx+qIi0+UBLFBL7PwbBbQXKTGsuvScH4h3ZiZPM9PFckuXg57Mx82PFKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5db55475e6605dc3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAq2xfMuabPgpev0p8URFxz5/xeHeEI/Ex07pMxUREFNKxBIp4ZPPYQz/joVYjlMgWBhy6rW6P/1fs21GHEDZKF3IbFmi9VXEkj9XMQpfQPmXFs7I9rJTryF9/C3bwms0MraIcbyBKcG+YvRwJWk8gqGlRx/4gIH/HJhGK2h9wrIqXMy6k0Q2Ys3sjLIWU9b3DQhRHkyJIrUSE1DurtwfqtVxq1yH/MfD23nrvEgvOsh2sX+ifxLUbGFz71CRMztD5g3dt7HR+fyfmfmMCfOdKNzMM7fc6UBJjZVVxY4YhJaWv07XyJCaFnvY9XKqaaBxUIGimAqtQx/Ygd5Msp7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zLMZpv/HzrZx5MO2wX7WXWcoDxwiaK0i66zyzHvxlM=;
 b=WWoPgKPBTzOXPFct3aqAJdGIspt+hspK6GsLCO3X3J0a+D8dg/PEzmAQsGkp3BahQMJ3bT7kCW+MCmlD78FwVHjrAt5o59svTg+WNcCz01hWjEayU5Ku1re6XiVMT6FesBkLZ1myvX1mLW4W7Klw15EnULFa5z+nPcALgO7mgtm6lEUQQkDOqnwYSzrZxnncsVCMnvHoxpirbdKGHH1FLR9PbI6uDYJ33xlMlRf155r6E4nARuNCVSnLPuFZcmPr6Owehi3MOGo7Qe6lJWtQpMD1AMtijD1vNyksUmjaYWAd03n6JlTEbr1BTHo5s1wUxySvk7JYN+b8HrogmOwVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zLMZpv/HzrZx5MO2wX7WXWcoDxwiaK0i66zyzHvxlM=;
 b=MxWq9U2gBwp+03VgqYJwJxqHcXf8mJUUsD0+MZ+BvfURFoxilYkKvs88n0zhbiq/WFhlco/zTmBKox+oe1jZt/CKuBRKQsSFYwUWJOJ7BWN3DDZOPQyx+qIi0+UBLFBL7PwbBbQXKTGsuvScH4h3ZiZPM9PFckuXg57Mx82PFKU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/8] xen/arm: Remove support for Stage-1 translation on
 SMMUv3.
Thread-Topic: [PATCH v3 4/8] xen/arm: Remove support for Stage-1 translation
 on SMMUv3.
Thread-Index: AQHWzxXY77Y6xwXFHEep3JN+7VkcoanxG7eAgACb9YA=
Date: Fri, 11 Dec 2020 10:46:48 +0000
Message-ID: <0904E964-5987-4972-A643-A0FE43F5A99E@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <a5e3509bbc4ce21e0d9d176d7a2984ef40ad0ae3.1607617848.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012101532110.6285@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012101532110.6285@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56e3bae8-81f0-456e-61f9-08d89dc2274b
x-ms-traffictypediagnostic: DBBPR08MB4629:|DBBPR08MB4346:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4346966ED762BB53D8A8D2CEFCCA0@DBBPR08MB4346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gLg8oquWBQ6OQ9gymBK+vsEdZeLu2+9tZeSCecUXHJMx6h856XPM+T1TpgHz21xZ0csNVoluBczmuEIkgpvULy2aCYQA9+D6A/2xWASE7GNRxgl8FrMasXyksjEk2MlCnFMarITP39I0Ijw7DrjkkaZS3pnJt2zBAZMZv02VpzKfBw7skopQtt681O+ySL1K3b64r9cqeoMNG4vP1/KtX7SXI4xuHQzS6P6CNlSUNbdN/BlJ6xK3xLB1lAobCzXbHxbPiC1mmqhOwzlFCwrlNRm8vYKa0aA+2+gewQOnxbf74IPUdlI2o86ICcQEiolt0Yz5WJRj1oCXZiRMJmSx0gv9f9Hnrr8oZTxlgdlziXXFj3fqUqEC7RWe0hTtEXiU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(2616005)(26005)(186003)(64756008)(66556008)(316002)(66446008)(6916009)(5660300002)(83380400001)(91956017)(8676002)(66476007)(6486002)(66946007)(71200400001)(54906003)(6506007)(53546011)(36756003)(86362001)(4326008)(8936002)(76116006)(2906002)(478600001)(33656002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?YvSkXY9EVbILUu29chIexfNaycfwKQr5ulMELIRA8oVGTZQluVglp5Ytub53?=
 =?us-ascii?Q?Ksyq3vpziXYlSHljvGPcSYqtcYHPOL7Z3AnnNjOCf4G7fjp2qSc26CljJVR/?=
 =?us-ascii?Q?daFp4x2TTLonFy435ssxo8/yCwGQalylh2A7306hQPM50qKlA/7pS4FPnHgh?=
 =?us-ascii?Q?d4VwW0Ca6+TAggdY2SsnhXCVqgv6owS/Tg1SHkhf6LnKEulnUyQVzX93i3Ig?=
 =?us-ascii?Q?3QBGl1sKM+eP9bXMzgSP9e80nLcsnPhX/kp8iQLF82QVUL37tgQAiOZqL/cJ?=
 =?us-ascii?Q?+td8OOqg5x+23LZd70QlPPmWHcafVcBdzSTK02yeGH3Kyyx3AtTX+AOygrr8?=
 =?us-ascii?Q?zccRNEd7raSdUwJob/8jDTjAIZuvc3H2vKiCC642Aojugv+A8iR4cXhP7otp?=
 =?us-ascii?Q?FWdXZF7GqqetcZqJ7xo8cJaIewcGVPflAVhwMmG7K+kkYOiGIEdeAWLyXb1I?=
 =?us-ascii?Q?zLaQ2mabMwIW0gGRAZ9KKhidIw7WpnzBpEAmcqIykE38IeLI8ZQYFaefjcdr?=
 =?us-ascii?Q?GY168Y+KQCs6IFGZbGwKB3rmmMsusNkm8/WPjhd2VhhFQPYeSgNtNiOEEpBA?=
 =?us-ascii?Q?OJN8jhPEwjTbSLTJx1r6xqlphTZ8bCGCXU6mxeYolQ/+zrt6z/Bep0HcdSza?=
 =?us-ascii?Q?/x4p6PUPkCCHCMM21KxmFdBHZQbNR0jQj2P9t1BO7I7kpfSMeB1j8AMyKUHI?=
 =?us-ascii?Q?9jpTn71JiNx62qOzehLrc61g1iSqTIWILjGFRLQI3WB7lfZ9tmfb703mqHEW?=
 =?us-ascii?Q?Gz3DQYPmS2EerQxJ/yxe6d7ztZWIImou15QY4LSc/5niLsPYRsjCKLDjiksb?=
 =?us-ascii?Q?LWH80R2KfS4ez9dTppLcRZtCpaGGArICBXTqkyfThdUfWJ2rG+jgIy/An1yn?=
 =?us-ascii?Q?QbEGaUZNfIONIGui2kpA9uZAhCZGP3l5odr6KlK+7rKP41moJLVYYvnQSgiE?=
 =?us-ascii?Q?bg1+TcX0CdmSboQATFbJVkrFeoUPnUy4x+NjcvpbVYPy7O32QQ/ayDNbNT4R?=
 =?us-ascii?Q?tMFY?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFAFE71D63E0B54E933B0FA654546243@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4629
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18a42812-31bf-4bee-5d25-08d89dc20fab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dmdg6zBFZcBzBC/itgBJ/WQbDcdOUly9BlnTJSdw6p3yP7/PuoZx2oS4i+eOEgH2Evzs4KlnnJDCKfZZU5WtAv4xzvVTvOJ6wITJqIfz6Up8Tn/LlnnlRMr7lhWAGehsoX1892w1EKOjhtkqlnUoZLxtAdn0kev4aUAF52GKvbNhIC/ZcpOPDv1OG9/MNyAxkSfxuJP957ScHUXFaX0Y2U2IsbuC9CF9F7XRrcdTyfMC7QeieDzzv/mQzeqcYlyflsrUF0+kVyMs2hyWwxAAyWe0Fdpv3zsxVdmvz54DF4/vl11OMj9G1pidTgTM2XVSuEfhRt5N0tdJ4G8Gk7EIBB0Ueiu+A2OLVOdTYmfFoYjuVtEHkAVIs1uN5rk+jyfgpxeOsy8jobI1JfONgN8Xmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(46966005)(82740400003)(53546011)(82310400003)(81166007)(83380400001)(70206006)(6506007)(2616005)(8936002)(107886003)(70586007)(2906002)(6486002)(186003)(8676002)(6512007)(33656002)(54906003)(36756003)(26005)(86362001)(4326008)(356005)(6862004)(478600001)(316002)(5660300002)(47076004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 10:47:28.0143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e3bae8-81f0-456e-61f9-08d89dc2274b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4346

Hello Stefano,

> On 11 Dec 2020, at 1:28 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 10 Dec 2020, Rahul Singh wrote:
>> @@ -2087,29 +1693,8 @@ static int arm_smmu_domain_finalise(struct iommu_=
domain *domain,
>> 	}
>>=20
>> 	/* Restrict the stage to what we can actually support */
>> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
>> -
>> -	switch (smmu_domain->stage) {
>> -	case ARM_SMMU_DOMAIN_S1:
>> -		ias =3D (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
>> -		ias =3D min_t(unsigned long, ias, VA_BITS);
>> -		oas =3D smmu->ias;
>> -		fmt =3D ARM_64_LPAE_S1;
>> -		finalise_stage_fn =3D arm_smmu_domain_finalise_s1;
>> -		break;
>> -	case ARM_SMMU_DOMAIN_NESTED:
>> -	case ARM_SMMU_DOMAIN_S2:
>> -		ias =3D smmu->ias;
>> -		oas =3D smmu->oas;
>> -		fmt =3D ARM_64_LPAE_S2;
>> -		finalise_stage_fn =3D arm_smmu_domain_finalise_s2;
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> +	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>> +
>=20
> Last time we agreed on adding an error message?

Yes I added in next patch to report error if Stage-2 is not supported=20

if (reg & IDR0_S2P)                                                        =
=20
        smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;                        =
      =20
                                                                           =
    =20
    if (!(reg & IDR0_S2P)) {                                               =
    =20
        dev_err(smmu->dev, "no stage-2 translation support!\n");           =
    =20
        return -ENXIO;                                                     =
    =20
    }


Regards,
Rahul


