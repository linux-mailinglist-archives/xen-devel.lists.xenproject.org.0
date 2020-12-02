Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ADB2CBFCF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42766.76959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTD3-0002K2-8u; Wed, 02 Dec 2020 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42766.76959; Wed, 02 Dec 2020 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTD3-0002Jd-4b; Wed, 02 Dec 2020 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 42766;
 Wed, 02 Dec 2020 14:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zz6=FG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkTD1-0002JY-CW
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:34:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b5146b8-5bbe-4742-b875-35a99ccda972;
 Wed, 02 Dec 2020 14:34:15 +0000 (UTC)
Received: from DB6P18901CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::24)
 by DB6PR0801MB2039.eurprd08.prod.outlook.com (2603:10a6:4:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 2 Dec
 2020 14:34:12 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::a8) by DB6P18901CA0014.outlook.office365.com
 (2603:10a6:4:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:34:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:34:12 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Wed, 02 Dec 2020 14:34:12 +0000
Received: from 0fcb9b8f3ebe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FB74C3A-0303-48B0-B6A9-24741F837892.1; 
 Wed, 02 Dec 2020 14:34:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fcb9b8f3ebe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 14:34:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6042.eurprd08.prod.outlook.com (2603:10a6:10:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 14:34:05 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 14:34:05 +0000
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
X-Inumbo-ID: 1b5146b8-5bbe-4742-b875-35a99ccda972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdfQ7/VJjzhu2i+wNCFu7xNJ6fP1Vv/UOiGCcIXYGEY=;
 b=0/GWS2E/hbSL5qpuT8tjtb24vPubGQXWOuqlYSiyEcttLnMAIsd+n3wX0G5WVgiHhroj+NTAdl6Ky4VYjXQNKBBoI+yADN3YvDtDyUTVyUev37OxUDgLB6SP54DRpyF6Yz3r03x4p4DgFIJLLLPrTPp/5CNzudR1s+aDtPln490=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd3d42341e0b9908
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXIrfVbCgGxmY4t42EfYdDGTv8qyJs0h84NBvrLFzC4o93h4xQ5L/B4kDUCnhA2dE9hcdhtpSnjzWSJKu3g5eFlgYSRAfTfhHXhGFOatH+prUL0LJc+eyzG5MpPJnsB1gmoGl72D7VE2wWDMa0+58KDRCeLdHpyt+I6qGb43+DP3JoY6yuz+eikXSGhp7VWRBZIV7LqLHB/Jf1HK/QLW5ZXkAwWj8h9dq/9w9bqca+eWJZNhvVmaaUZ978h/6CwEImvrcZ/nyHOhKtPfgND0mwxWwkeZXapD8R2CWgQtfRmi5MRrF38+fLSI++0ANO+8fODuMC+BL8GXDg4HmX4vAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdfQ7/VJjzhu2i+wNCFu7xNJ6fP1Vv/UOiGCcIXYGEY=;
 b=ZB/iPj0xIyn/UCzb+a16nRl03wJDJeT2BpCcaVU/O3vs2Rfw/JmD8TUcw3l8ZFgHrU4Ou6uSoxIWy9aM52ECvATfaFqDWi5DN8pr94VdAE9vMWBL80TX/Z58YG/4IdQPI2+lD/fXCofHkdzNKTPZByc9ebKuCXP4+AlsOt5M5yUmTWvzFmQSjPzLAClXdbaRzHP/EZzfZZCcyPKBcBRiX1IR0vaCqYunroTh7mcWBVbddAWAhtp8UMkpcFzcOQApbCyFs52/mi3dFrAwaLN94wJ2dRTt7lvvGYdhjaZQmLlKyJ2fH4rfblfukDmGecBlwUObpm7/5YA2mAyt/JFXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdfQ7/VJjzhu2i+wNCFu7xNJ6fP1Vv/UOiGCcIXYGEY=;
 b=0/GWS2E/hbSL5qpuT8tjtb24vPubGQXWOuqlYSiyEcttLnMAIsd+n3wX0G5WVgiHhroj+NTAdl6Ky4VYjXQNKBBoI+yADN3YvDtDyUTVyUev37OxUDgLB6SP54DRpyF6Yz3r03x4p4DgFIJLLLPrTPp/5CNzudR1s+aDtPln490=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Topic: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Index: AQHWxBX830xFguE4YkK2klATz/ucYKnjEigAgADWCQA=
Date: Wed, 2 Dec 2020 14:34:05 +0000
Message-ID: <804B8C95-FF10-4FE5-AC82-9959EC9B8041@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011724350.1100@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012011724350.1100@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: de81d9ae-44bf-4363-0594-08d896cf568d
x-ms-traffictypediagnostic: DBBPR08MB6042:|DB6PR0801MB2039:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB203910AAB87142A53BACCB87FCF30@DB6PR0801MB2039.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4ZwzT93HDsDRNJ1bq+3Bs54E55NCcxJe/K6SqZU2C4+aeVk7KpFT3HaCjO3bFcIePqBaRwLwVSeIm6+FWflZkkoXfhP3Q4vHZEN1ejFC2scqLYYrKjxP6fmd1w6/V2f7f0qORzk8/5ylHA2gLstbLbC85+8y2vIX9uurJLEMlCO0vFdvPGxIaX0UGs5jr0vxryfnHAExeyU9y4VZjT/SjNksci+iPWgh5bBCDJLe8qBx0xb/t7iDGj1r696+OtOMzAxpKS6tNliirKjcMJywtPzNMCjhO6yKeyO4M/1shwtOAh5woDL0qz763g7SaRl7Yfq7LBDhjyt1lD4vmnD78/omqqoC5lIinxbQ0sQyLuQenfgy5IsYROaAdKGTLwDd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(33656002)(5660300002)(66946007)(91956017)(76116006)(478600001)(8936002)(2906002)(83380400001)(6916009)(54906003)(6512007)(8676002)(6486002)(71200400001)(316002)(2616005)(30864003)(66476007)(36756003)(66446008)(64756008)(6506007)(4326008)(66556008)(86362001)(53546011)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?snmung5B5c26qC/UJPX104nbPXnn0+pEwzywGkrVWqN2lfjuaWQ1+ZR5OnGx?=
 =?us-ascii?Q?WMVq1Cp3mp2vfXsGd8Kf7B+cuUduBcG/yBoMAVn801rSOdRKtABiLjjhRtH1?=
 =?us-ascii?Q?s88bCmDi15wgt0NJd5K0V5snFOTKHO78kdxSmSupfZNiwrArHANSRjCzDLE1?=
 =?us-ascii?Q?mGIAk3CsPyU99n3FT5uUf5kUJsH2vGvWSIUNyo696GjHjXVg5r+1SMqi54sf?=
 =?us-ascii?Q?qKWwVO5bl4aJrwP8f6y7tmPjjMp65FDLy+pM15xIoIu3XIWqcZpffRLTm5Pw?=
 =?us-ascii?Q?KVbQ5YK2TUGDC/phIb/qHIPt7P6YyUiraqcmFPn1x0Oz8F4qFjM1uxJqc+ya?=
 =?us-ascii?Q?4y5v1Dxu+sx/tcwacEkGS9ZmpIQQ9TMeI781f03tk7cUKOldb1nrZOB3rl+J?=
 =?us-ascii?Q?a7GiAWbMjpnKMtAgvoAaJmyGma/NlKts604obeZwk6oyvOskMUOuoBkcGsZp?=
 =?us-ascii?Q?NBPVwUSerVzBuo/syEOn++VVRxBNdqqAmUnZ2kNXFqGrLmsZidaGvbInbFES?=
 =?us-ascii?Q?CiBi6dokAjDW4SceEZsiSJBK85mnEX5ZbzAV20iudogk/V5gEgU0lwOkIoXT?=
 =?us-ascii?Q?BTJPZFCNbYMO95/LIvoYKI5ihLRMqVMcaqwfWETY8pSDsTXysVG+e5vEY+kf?=
 =?us-ascii?Q?mL00ec028E1Kog5BBgEd6h7f5yfajDBlG9S/uzlrjynmunrX97ICCcZ3otJo?=
 =?us-ascii?Q?AJE/A/UFhbReTN61Lzd72JtyqMsetT68XxSMoWE/L2qxbcF+MEws1OGtt+YL?=
 =?us-ascii?Q?5NOiw8tS8Egc0cxj2qL85poRVS5FrDMhFoPy9dhrsaOY77cwMX5RG0LL1NzF?=
 =?us-ascii?Q?Pbu/ySYZRzmu4bfw6TcposE4MMIlXcE31l0M5NyG4SLM5i51ZPy6gxNb+EoZ?=
 =?us-ascii?Q?TESqd2Zv1YFyFi1fgrLOWXKaqY2TbQTDxXn0g4dPunuSJ3mYwaJINiv/Uys9?=
 =?us-ascii?Q?p7/DG1KGhyg9zq8QvZ89XMiAdGg2sYQ5Qm1Wr/Wo+++jGTccL0YONEDVrq+f?=
 =?us-ascii?Q?VDaE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B36034BE497744382163D40EC59EBEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6042
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e27ede6-33bf-4bbb-0e43-08d896cf5236
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PN5mlqrwJsK11B7UiYJ6whM5ePyyUgP5YUgunEnFLWP4mVZtFoY8HIrPfItXVA6XqJiPQmgp6oFftVnE4G7kAK/vYnjmZhBfWMAXX0/vGDhjrLeqYrLX3CmAp37GAJ7XxM+8rqiYftSBLLlL/ZEv+bwMG3pCFU3PLYKxFjuYOVqiQEHxLhfk5LD3yCzBmgC4yNS9Bo+8ZbuwfoSX3tS0bLOCi2IoBvmm89oy4KSp9IjtkAgNQr3zdpfkbbEE7dh2bJFPF7fUfO8RUjoq6O4mzf6DSxZvUtpbw/KaXNueiCVXqqZ8HpmQxJiyVczZIxojcpI/pJWvsCYZxc1gZTYo2bz+y45iX1lcEkhpp1Jy1UGoxpvm2Sn/iIAXjARY7vZuLCgN/hXi5qUaCjF245/Cmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(26005)(33656002)(186003)(30864003)(4326008)(2616005)(47076004)(86362001)(107886003)(6862004)(2906002)(82310400003)(356005)(6506007)(53546011)(336012)(82740400003)(54906003)(6486002)(36756003)(5660300002)(83380400001)(6512007)(81166007)(8936002)(478600001)(316002)(70206006)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:34:12.7324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de81d9ae-44bf-4363-0594-08d896cf568d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2039

Hello Stefano,

> On 2 Dec 2020, at 1:48 am, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 26 Nov 2020, Rahul Singh wrote:
>> struct io_pgtable_ops, struct io_pgtable_cfg, struct iommu_flush_ops,
>> and struct iommu_ops related code are linux specific.
>>=20
>> Remove code related to above struct as code is dead code in XEN.
>=20
> There are still instances of struct io_pgtable_cfg after applying this
> patch in the following functions:
> - arm_smmu_domain_finalise_s2
> - arm_smmu_domain_finalise
>=20

Ok. I will remove the instances.
>=20
>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 457 --------------------------
>> 1 file changed, 457 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 40e3890a58..55d1cba194 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -599,7 +593,6 @@ struct arm_smmu_domain {
>> 	struct arm_smmu_device		*smmu;
>> 	struct mutex			init_mutex; /* Protects smmu pointer */
>>=20
>> -	struct io_pgtable_ops		*pgtbl_ops;
>> 	bool				non_strict;
>>=20
>> 	enum arm_smmu_domain_stage	stage;
>> @@ -1297,74 +1290,6 @@ static void arm_smmu_tlb_inv_context(void *cookie=
)
>> 	arm_smmu_cmdq_issue_sync(smmu);
>> }
>>=20
>> -static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t si=
ze,
>> -					  size_t granule, bool leaf, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -	struct arm_smmu_cmdq_ent cmd =3D {
>> -		.tlbi =3D {
>> -			.leaf	=3D leaf,
>> -			.addr	=3D iova,
>> -		},
>> -	};
>> -
>> -	cmd.opcode	=3D CMDQ_OP_TLBI_S2_IPA;
>> -	cmd.tlbi.vmid	=3D smmu_domain->s2_cfg.vmid;
>> -
>> -	do {
>> -		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> -		cmd.tlbi.addr +=3D granule;
>> -	} while (size -=3D granule);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gat=
her,
>> -					 unsigned long iova, size_t granule,
>> -					 void *cookie)
>> -{
>> -	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
>> -				  size_t granule, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -
>> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
>> -	arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
>> -				  size_t granule, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -
>> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
>> -	arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static const struct iommu_flush_ops arm_smmu_flush_ops =3D {
>> -	.tlb_flush_all	=3D arm_smmu_tlb_inv_context,
>> -	.tlb_flush_walk =3D arm_smmu_tlb_inv_walk,
>> -	.tlb_flush_leaf =3D arm_smmu_tlb_inv_leaf,
>> -	.tlb_add_page	=3D arm_smmu_tlb_inv_page_nosync,
>> -};
>> -
>> -/* IOMMU API */
>> -static bool arm_smmu_capable(enum iommu_cap cap)
>> -{
>> -	switch (cap) {
>> -	case IOMMU_CAP_CACHE_COHERENCY:
>> -		return true;
>> -	case IOMMU_CAP_NOEXEC:
>> -		return true;
>> -	default:
>> -		return false;
>> -	}
>> -}
>> -
>> static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>> {
>> 	struct arm_smmu_domain *smmu_domain;
>> @@ -1421,7 +1346,6 @@ static void arm_smmu_domain_free(struct iommu_doma=
in *domain)
>> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>>=20
>> 	iommu_put_dma_cookie(domain);
>> -	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
>>=20
>> 	if (cfg->vmid)
>> 		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>> @@ -1429,7 +1353,6 @@ static void arm_smmu_domain_free(struct iommu_doma=
in *domain)
>> 	kfree(smmu_domain);
>> }
>>=20
>> -
>> static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_doma=
in,
>> 				       struct arm_smmu_master *master,
>> 				       struct io_pgtable_cfg *pgtbl_cfg)
>> @@ -1437,7 +1360,6 @@ static int arm_smmu_domain_finalise_s2(struct arm_=
smmu_domain *smmu_domain,
>> 	int vmid;
>> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>> -	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
>>=20
>> 	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>> 	if (vmid < 0)
>> @@ -1461,20 +1383,12 @@ static int arm_smmu_domain_finalise(struct iommu=
_domain *domain,
>> {
>> 	int ret;
>> 	unsigned long ias, oas;
>> -	enum io_pgtable_fmt fmt;
>> -	struct io_pgtable_cfg pgtbl_cfg;
>> -	struct io_pgtable_ops *pgtbl_ops;
>> 	int (*finalise_stage_fn)(struct arm_smmu_domain *,
>> 				 struct arm_smmu_master *,
>> 				 struct io_pgtable_cfg *);
>> 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>>=20
>> -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
>> -		return 0;
>> -	}
>> -
>> 	/* Restrict the stage to what we can actually support */
>> 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>>=20
>> @@ -1483,40 +1397,17 @@ static int arm_smmu_domain_finalise(struct iommu=
_domain *domain,
>> 	case ARM_SMMU_DOMAIN_S2:
>> 		ias =3D smmu->ias;
>> 		oas =3D smmu->oas;
>> -		fmt =3D ARM_64_LPAE_S2;
>> 		finalise_stage_fn =3D arm_smmu_domain_finalise_s2;
>> 		break;
>> 	default:
>> 		return -EINVAL;
>> 	}
>>=20
>> -	pgtbl_cfg =3D (struct io_pgtable_cfg) {
>> -		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
>> -		.ias		=3D ias,
>> -		.oas		=3D oas,
>> -		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENCY,
>> -		.tlb		=3D &arm_smmu_flush_ops,
>> -		.iommu_dev	=3D smmu->dev,
>> -	};
>> -
>> -	if (smmu_domain->non_strict)
>> -		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
>> -
>> -	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
>> -	if (!pgtbl_ops)
>> -		return -ENOMEM;
>> -
>> -	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
>> -	domain->geometry.aperture_end =3D (1UL << pgtbl_cfg.ias) - 1;
>> -	domain->geometry.force_aperture =3D true;
>> -
>> 	ret =3D finalise_stage_fn(smmu_domain, master, &pgtbl_cfg);
>> 	if (ret < 0) {
>> -		free_io_pgtable_ops(pgtbl_ops);
>> 		return ret;
>> 	}
>>=20
>> -	smmu_domain->pgtbl_ops =3D pgtbl_ops;
>> 	return 0;
>> }
>>=20
>> @@ -1626,71 +1517,6 @@ out_unlock:
>> 	return ret;
>> }
>>=20
>> -static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova=
,
>> -			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>> -{
>> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
>> -
>> -	if (!ops)
>> -		return -ENODEV;
>> -
>> -	return ops->map(ops, iova, paddr, size, prot, gfp);
>> -}
>> -
>> -static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long=
 iova,
>> -			     size_t size, struct iommu_iotlb_gather *gather)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -	struct io_pgtable_ops *ops =3D smmu_domain->pgtbl_ops;
>> -
>> -	if (!ops)
>> -		return 0;
>> -
>> -	return ops->unmap(ops, iova, size, gather);
>> -}
>> -
>> -static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	if (smmu_domain->smmu)
>> -		arm_smmu_tlb_inv_context(smmu_domain);
>> -}
>> -
>> -static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
>> -				struct iommu_iotlb_gather *gather)
>> -{
>> -	struct arm_smmu_device *smmu =3D to_smmu_domain(domain)->smmu;
>> -
>> -	if (smmu)
>> -		arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static phys_addr_t
>> -arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
>> -{
>> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
>> -
>> -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY)
>> -		return iova;
>> -
>> -	if (!ops)
>> -		return 0;
>> -
>> -	return ops->iova_to_phys(ops, iova);
>> -}
>> -
>> -static struct platform_driver arm_smmu_driver;
>> -
>> -static
>> -struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fw=
node)
>> -{
>> -	struct device *dev =3D driver_find_device_by_fwnode(&arm_smmu_driver.d=
river,
>> -							  fwnode);
>> -	put_device(dev);
>> -	return dev ? dev_get_drvdata(dev) : NULL;
>> -}
>> -
>> static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>> {
>> 	unsigned long limit =3D smmu->strtab_cfg.num_l1_ents;
>> @@ -1701,206 +1527,6 @@ static bool arm_smmu_sid_in_range(struct arm_smm=
u_device *smmu, u32 sid)
>> 	return sid < limit;
>> }
>>=20
>> -static struct iommu_ops arm_smmu_ops;
>> -
>> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>> -{
>> -	int i, ret;
>> -	struct arm_smmu_device *smmu;
>> -	struct arm_smmu_master *master;
>> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> -
>> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
>> -		return ERR_PTR(-ENODEV);
>> -
>> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>> -		return ERR_PTR(-EBUSY);
>> -
>> -	smmu =3D arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
>> -	if (!smmu)
>> -		return ERR_PTR(-ENODEV);
>> -
>> -	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
>> -	if (!master)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	master->dev =3D dev;
>> -	master->smmu =3D smmu;
>> -	master->sids =3D fwspec->ids;
>> -	master->num_sids =3D fwspec->num_ids;
>> -	dev_iommu_priv_set(dev, master);
>> -
>> -	/* Check the SIDs are in range of the SMMU and our stream table */
>> -	for (i =3D 0; i < master->num_sids; i++) {
>> -		u32 sid =3D master->sids[i];
>> -
>> -		if (!arm_smmu_sid_in_range(smmu, sid)) {
>> -			ret =3D -ERANGE;
>> -			goto err_free_master;
>> -		}
>> -
>> -		/* Ensure l2 strtab is initialised */
>> -		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
>> -			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
>> -			if (ret)
>> -				goto err_free_master;
>> -		}
>> -	}
>> -
>> -	return &smmu->iommu;
>> -
>> -err_free_master:
>> -	kfree(master);
>> -	dev_iommu_priv_set(dev, NULL);
>> -	return ERR_PTR(ret);
>> -}
>> -
>> -static void arm_smmu_release_device(struct device *dev)
>> -{
>> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> -	struct arm_smmu_master *master;
>> -
>> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
>> -		return;
>> -
>> -	master =3D dev_iommu_priv_get(dev);
>> -	arm_smmu_detach_dev(master);
>> -	kfree(master);
>> -	iommu_fwspec_free(dev);
>> -}
>> -
>> -static struct iommu_group *arm_smmu_device_group(struct device *dev)
>> -{
>> -	struct iommu_group *group;
>> -
>> -	/*
>> -	 * We don't support devices sharing stream IDs other than PCI RID
>> -	 * aliases, since the necessary ID-to-device lookup becomes rather
>> -	 * impractical given a potential sparse 32-bit stream ID space.
>> -	 */
>> -	if (dev_is_pci(dev))
>> -		group =3D pci_device_group(dev);
>> -	else
>> -		group =3D generic_device_group(dev);
>> -
>> -	return group;
>> -}
>> -
>> -static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>> -				    enum iommu_attr attr, void *data)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	switch (domain->type) {
>> -	case IOMMU_DOMAIN_UNMANAGED:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_NESTING:
>> -			*(int *)data =3D (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED);
>> -			return 0;
>> -		default:
>> -			return -ENODEV;
>> -		}
>> -		break;
>> -	case IOMMU_DOMAIN_DMA:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			*(int *)data =3D smmu_domain->non_strict;
>> -			return 0;
>> -		default:
>> -			return -ENODEV;
>> -		}
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -}
>> -
>> -static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>> -				    enum iommu_attr attr, void *data)
>> -{
>> -	int ret =3D 0;
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	mutex_lock(&smmu_domain->init_mutex);
>> -
>> -	switch (domain->type) {
>> -	case IOMMU_DOMAIN_UNMANAGED:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_NESTING:
>> -			if (smmu_domain->smmu) {
>> -				ret =3D -EPERM;
>> -				goto out_unlock;
>> -			}
>> -
>> -			if (*(int *)data)
>> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
>> -			else
>> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
>> -			break;
>> -		default:
>> -			ret =3D -ENODEV;
>> -		}
>> -		break;
>> -	case IOMMU_DOMAIN_DMA:
>> -		switch(attr) {
>> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			smmu_domain->non_strict =3D *(int *)data;
>> -			break;
>> -		default:
>> -			ret =3D -ENODEV;
>> -		}
>> -		break;
>> -	default:
>> -		ret =3D -EINVAL;
>> -	}
>> -
>> -out_unlock:
>> -	mutex_unlock(&smmu_domain->init_mutex);
>> -	return ret;
>> -}
>> -
>> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args=
 *args)
>> -{
>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>> -}
>> -
>> -static void arm_smmu_get_resv_regions(struct device *dev,
>> -				      struct list_head *head)
>> -{
>> -	struct iommu_resv_region *region;
>> -	int prot =3D IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>> -
>> -	region =3D iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
>> -					 prot, IOMMU_RESV_SW_MSI);
>> -	if (!region)
>> -		return;
>> -
>> -	list_add_tail(&region->list, head);
>> -
>> -	iommu_dma_get_resv_regions(dev, head);
>> -}
>=20
> Arguably this could have been removed previously as part of the MSI
> patch, but that's OK either way.

Ack.=20
>=20
>=20
>> -static struct iommu_ops arm_smmu_ops =3D {
>> -	.capable		=3D arm_smmu_capable,
>> -	.domain_alloc		=3D arm_smmu_domain_alloc,
>> -	.domain_free		=3D arm_smmu_domain_free,
>> -	.attach_dev		=3D arm_smmu_attach_dev,
>> -	.map			=3D arm_smmu_map,
>> -	.unmap			=3D arm_smmu_unmap,
>> -	.flush_iotlb_all	=3D arm_smmu_flush_iotlb_all,
>> -	.iotlb_sync		=3D arm_smmu_iotlb_sync,
>> -	.iova_to_phys		=3D arm_smmu_iova_to_phys,
>> -	.probe_device		=3D arm_smmu_probe_device,
>> -	.release_device		=3D arm_smmu_release_device,
>> -	.device_group		=3D arm_smmu_device_group,
>> -	.domain_get_attr	=3D arm_smmu_domain_get_attr,
>> -	.domain_set_attr	=3D arm_smmu_domain_set_attr,
>> -	.of_xlate		=3D arm_smmu_of_xlate,
>> -	.get_resv_regions	=3D arm_smmu_get_resv_regions,
>> -	.put_resv_regions	=3D generic_iommu_put_resv_regions,
>> -	.pgsize_bitmap		=3D -1UL, /* Restricted during device attach */
>> -};
>> -
>> /* Probing and initialisation functions */
>> static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>> 				   struct arm_smmu_queue *q,
>> @@ -2515,21 +2139,10 @@ static int arm_smmu_device_hw_probe(struct arm_s=
mmu_device *smmu)
>> 	default:
>> 		dev_info(smmu->dev,
>> 			"unknown output address size. Truncating to 48-bit\n");
>> -		fallthrough;
>> 	case IDR5_OAS_48_BIT:
>> 		smmu->oas =3D 48;
>> 	}
>>=20
>> -	if (arm_smmu_ops.pgsize_bitmap =3D=3D -1UL)
>> -		arm_smmu_ops.pgsize_bitmap =3D smmu->pgsize_bitmap;
>> -	else
>> -		arm_smmu_ops.pgsize_bitmap |=3D smmu->pgsize_bitmap;
>> -
>> -	/* Set the DMA mask for our table walker */
>> -	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
>> -		dev_warn(smmu->dev,
>> -			 "failed to set DMA mask for table walker\n");
>> -
>> 	smmu->ias =3D max(smmu->ias, smmu->oas);
>>=20
>> 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>> @@ -2595,9 +2208,6 @@ static int arm_smmu_device_dt_probe(struct platfor=
m_device *pdev,
>>=20
>> 	parse_driver_options(smmu);
>>=20
>> -	if (of_dma_is_coherent(dev->of_node))
>> -		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
>> -
>=20
> Why this change? The ARM_SMMU_FEAT_COHERENCY flag is still used in
> arm_smmu_device_hw_probe.

I remove this as this is linux specific.  I will remove ARM_SMMU_FEAT_COHER=
ENCY flag  used in arm_smmu_device_hw_probe

Regards,
Rahul



