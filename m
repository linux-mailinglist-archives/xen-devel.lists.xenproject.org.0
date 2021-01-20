Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2232FD418
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71578.128282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FX5-0006zZ-00; Wed, 20 Jan 2021 15:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71578.128282; Wed, 20 Jan 2021 15:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FX4-0006z9-SW; Wed, 20 Jan 2021 15:36:30 +0000
Received: by outflank-mailman (input) for mailman id 71578;
 Wed, 20 Jan 2021 15:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziLf=GX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l2FX3-0006z2-6P
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:36:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26b0d184-e4f9-45b3-8fc6-a9120f9f9d98;
 Wed, 20 Jan 2021 15:36:28 +0000 (UTC)
Received: from DB6PR0802CA0025.eurprd08.prod.outlook.com (2603:10a6:4:a3::11)
 by PR3PR08MB5804.eurprd08.prod.outlook.com (2603:10a6:102:83::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 15:36:26 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::3f) by DB6PR0802CA0025.outlook.office365.com
 (2603:10a6:4:a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 15:36:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 15:36:25 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Wed, 20 Jan 2021 15:36:25 +0000
Received: from ce57f3b96105.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28F36AC9-D869-436B-890F-222369591696.1; 
 Wed, 20 Jan 2021 15:36:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce57f3b96105.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Jan 2021 15:36:18 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 15:36:17 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 15:36:17 +0000
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
X-Inumbo-ID: 26b0d184-e4f9-45b3-8fc6-a9120f9f9d98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk5tF/uBLTpVBXQPB7cnu9Fm6ekcECdlIiJME0S1ask=;
 b=1E/8Pt/GDZ0cyoo53u1atyWnvIdm8L3TbvkNe7DWYkryy5GFZTh02XOMRCY3+WByy1bx1xr7Urz+wQ9Y6G0/hhi+GvA0sEd+kTKelIK4OnKQazIO15Y2tafKSdmZnMqcjP19OrjXScU/e7QhsuVmDugj6LR4f+QAgy15V9+rxkc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f59763dda92a1e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0mNItDAqkjIFjGDBaDJ3gRrHCHOE4UY5uwctD9/QePJqbgzju4DM2Iyr6gDsO/PBtV36E6HBOtMe5SCTV0G5+SNL/5KswfLSwNZgjBCQM13qnln6ZNTFd2xa+WMI1HjmUW023Yi5XPwYyEldRVRSDgnAVcVovbqk7z5BORkm3Srj1gqAnDl+5qZpZisgtby9cp/js3Fce1YhLVDyXxUNkhRs3n83P7G4Yh1Bpwop40FA1xezX/mOyRm2cA4FEwP6UEkCDRZmNL8X6IVbRuRplVsHp8MNwoYv16bS7ATbchTgUkzN96mMkMJyR3X2wOMSY0GQJUTxjgC7ZJPuNKySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk5tF/uBLTpVBXQPB7cnu9Fm6ekcECdlIiJME0S1ask=;
 b=KbcKIYbKOZLSsWP8D/kSyIPlsA7exzAPq2Pvb0TygrKIsRm6JKqm9zjRPItfkakUniypZh31RArJ/P7JcVGcTuKvvKqj306wBSZ6JkM97zkzKzEhEC5/QZRfrd/vheYxe3XmjYRFTWyVS0DHRQPMAb7YLaHjrmhMV2iFO+kxTyfX/LMkC22QUBypIJCukMWq+ov5dtbuZbU8OS7i2M/Ga3m8HteebCfUlMp1wBsSvhfXdG9t76kORThVYQt76hDi932pAVjasAkMaXk+t7/0moa0YfM5iL0eLp0MEYvJyX5FUDDI/WEXFhADbziACgrhxHmUaehSk0dHeboHtrsdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk5tF/uBLTpVBXQPB7cnu9Fm6ekcECdlIiJME0S1ask=;
 b=1E/8Pt/GDZ0cyoo53u1atyWnvIdm8L3TbvkNe7DWYkryy5GFZTh02XOMRCY3+WByy1bx1xr7Urz+wQ9Y6G0/hhi+GvA0sEd+kTKelIK4OnKQazIO15Y2tafKSdmZnMqcjP19OrjXScU/e7QhsuVmDugj6LR4f+QAgy15V9+rxkc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 08/10] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Topic: [PATCH v5 08/10] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Index: AQHW7zzqrrhlnhkgj0uR383CHkuypqowpYKA
Date: Wed, 20 Jan 2021 15:36:17 +0000
Message-ID: <4058FD07-18C0-4441-B61F-FD27C0FC4367@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <c392bcf9f3a4d22b0e67240d52498c719ff3a3a6.1611153615.git.rahul.singh@arm.com>
In-Reply-To:
 <c392bcf9f3a4d22b0e67240d52498c719ff3a3a6.1611153615.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2745f8c2-9404-49a1-defd-08d8bd5925e9
x-ms-traffictypediagnostic: PAXPR08MB6432:|PR3PR08MB5804:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB580435381F7F08DE6BD47B9F9DA20@PR3PR08MB5804.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:416;OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 utwCn8DheXvDMAgAMj+RCDiG+dBxKm+FywTPDbbMSHJyXfvKV7MpYn4tT4sJ0zrtqhNfV2Gu8BXakqwP1366E96pAyhWOEymMtTCKfoTB3uzeAjy/05kdJyNciBSfX0l9YAX9j81yr+lUW/dqCa4mjwi7XfR4j5z8ny1ddq8/URc7yYwcJlYIYN85i7+TmDbKVXfHOFRIvs66BtdIoqa3f/H/FK0aVuM/AuDabSUvTM9jCQwFeHLltom7XYHRdsiRghuOR3VMV+0GIbU5di7CMEHQTtRvvRv3rR0BunT4jb4w+nw4OiWTZuY5bwZMB3gfXjNSfgWe+/nboyTzzCG+DvgUcQw2YdWNFcxuGsKPnCKlS38uJXFwNOa878AMltnLIof5iUYfpBRkNwYYP3Ke6MVqKRl2auCyjKQVPXKPAmqpUO17ZVbKBKoPbAyq/7FlRhi1G7Sb9L8fNp3bGcC+ZzeIRJM/b49ujV8/Bud9AcH3GwL3KAqwJJtXYsFHk4unsPweu80DU/2tnLDQYfQKyN350dfubDSlobNC9YD22BJbjXpdkaU5XQRQPF8a0mvisbnC13jqcEbnid441TcZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(6512007)(86362001)(478600001)(2616005)(4326008)(54906003)(36756003)(64756008)(91956017)(66476007)(83380400001)(55236004)(5660300002)(6486002)(53546011)(66946007)(8936002)(37006003)(33656002)(186003)(71200400001)(2906002)(26005)(66446008)(76116006)(6506007)(66556008)(6636002)(316002)(6862004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?9bxcRQj4jxd8TyMl+bXDdQOISGvIeL05Z2NcWB5nMR2SerHJSNLAqRAQODph?=
 =?us-ascii?Q?EzJhVb9PciiUq8f1lVRbW6ZrlFhFCox9FHA8MI25PHshPbBUzc42kNc/0VeR?=
 =?us-ascii?Q?DQEL+jSWYBvELiuQxoatjLIaQkecqUYTw0xWy/DeSZuiFJeaNTZrioreht4E?=
 =?us-ascii?Q?o209m6npTAcoqPWTBmZ2I0GFXH0b9FhMP7J5JvX7n2H9/BXQso1NS/TjzHQp?=
 =?us-ascii?Q?htXxrBIHQHgLTVRN8dVj+KqFKaF3GFocj0CaEEFklLB71jC1/Fbz2WDBfY/g?=
 =?us-ascii?Q?r4iF+/2bY6HXNhu1196+FUBlXITE3r1uvGjJrwQUvS/if9ORxpTZFOfy0ice?=
 =?us-ascii?Q?RE+RIAdMrsXCBwTtNA98JHixSzM2DoCUU2eHEyF0uiNFeQ0TPOJD5I8uLxdT?=
 =?us-ascii?Q?XUVKB2YRIoQJXC3QmVlU2tCvYPRMng7r5TE5Rg6ulzzCr1E6CTHOqBSUPcle?=
 =?us-ascii?Q?oE9iSjfkmOcPoPA1tev0dnhaPTvuHmxioA2IfHeDzlkYwWIWChK5cZiPBDfc?=
 =?us-ascii?Q?3HdFkZgXlGltWxomsIEbN4U3cGboT3ywp+vlmIX6B8QN8N8rcVKrors2r2yG?=
 =?us-ascii?Q?nei1ncb8oXYj32Az2k0TwyLwF/EFtZiR4T8V4ooXFo5iEhLwySawdvmqhJN2?=
 =?us-ascii?Q?6p6ePrW3B8+P3F+OD8uyrYc257syzO4zFRALluZDi5NfK0AzE4dfGOmxR/Hz?=
 =?us-ascii?Q?Ksp2sEAPU5nP1WuBcxWGNPj3ofE3yZSW+IK6azwWZNf4drmGGRAQeA69Zpzd?=
 =?us-ascii?Q?BH5IM9QsV96m4iIKwNT8+PwNyYZe9Jx171s8RPG+UgHu+uTqDtruNr0Th5UC?=
 =?us-ascii?Q?+f/RmEKuWJ+3M+yrPN4gO0z6v8B3b2q3cDS1QZmBWStGlM0VEUCbCfy5L/hr?=
 =?us-ascii?Q?TNI8kQC3ZJ4U5w68/aLka7F+Vpb3kNTQMWaS2lTDB5wWnibL5ipeKojYi61d?=
 =?us-ascii?Q?7CtzsvNPoqCazs+Iao0VkLKoNsJg7M1KCLr+VYYCcYfP6Wlka8oe6qSGJcI4?=
 =?us-ascii?Q?S36i?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0952D3E9B4087A48ACA2362D95184187@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4966162-3deb-4353-fce0-08d8bd592104
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vDPrztCdS5B14I76nBKMJJkpSUkvVd9+5RDVlCdtnKeh0m3RLZpDUj06or3A3MACJgtE/ho+zeYYXwXfRkeaPxvGuNHUqiJnLzGqUS2UWBWTMInTrgmwwH/1xLtCPKPupv/Bsz/3a9nd7mOyNL3M/BoGBjanWXcSwND2S+gHN3MkCgAzhy4aNb7DrxvkkzL/dAWwZdMoMZezjq4B9pufzovRMVm8L39d9B54R2YV7ARVNw8rcLLsqyTkXrhT5QCaOpkN6RqAoo8lRRW8bqx0uD7sPb2w0V8QTy5APcQ4wlGCDVVw/Y7DflaalhgFUg+ESvyW6IaTQ6bsdiyMUkeRUB9u/1PkXMgGCDzjC4MSmZEucs6UqRY8GmNZ09lxGcZrj4qAdMWyHlpW1PQwErRmZNuaESGeUS3Y01ohiUDu9UtVwaXcOU1a64Ct253LNSjWJJHyVajwHy8N+F28ycacBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(6486002)(2906002)(47076005)(6636002)(316002)(82310400003)(478600001)(81166007)(4326008)(55236004)(5660300002)(8676002)(70206006)(70586007)(107886003)(54906003)(6512007)(26005)(356005)(186003)(53546011)(86362001)(8936002)(36756003)(37006003)(83380400001)(6862004)(2616005)(6506007)(336012)(33656002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 15:36:25.8678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2745f8c2-9404-49a1-defd-08d8bd5925e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5804

Hi Rahul,


> On 20 Jan 2021, at 14:52, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Backport commit df561f6688fef775baa341a0f5d960becd248b11
> "treewide: Use fallthrough pseudo-keyword" from Linux kernel.
>=20
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v3:
> - This patch is introduce in this version.
> Changes since v4:
> - Add more information about the merged patch in commit message.
> ---
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 5ce14850b4..f5f8b4c981 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -932,7 +932,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_de=
vice *smmu)
> 		 */
> 		return;
> 	case CMDQ_ERR_CERROR_ILL_IDX:
> -		/* Fallthrough */
> 	default:
> 		break;
> 	}
> @@ -2488,7 +2487,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> 	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
> 	case IDR0_STALL_MODEL_FORCE:
> 		smmu->features |=3D ARM_SMMU_FEAT_STALL_FORCE;
> -		/* Fallthrough */
> +		fallthrough;
> 	case IDR0_STALL_MODEL_STALL:
> 		smmu->features |=3D ARM_SMMU_FEAT_STALLS;
> 	}
> @@ -2505,7 +2504,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> 	switch (FIELD_GET(IDR0_TTF, reg)) {
> 	case IDR0_TTF_AARCH32_64:
> 		smmu->ias =3D 40;
> -		/* Fallthrough */
> +		fallthrough;
> 	case IDR0_TTF_AARCH64:
> 		break;
> 	default:
> @@ -2589,7 +2588,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> 	default:
> 		dev_info(smmu->dev,
> 			"unknown output address size. Truncating to 48-bit\n");
> -		/* Fallthrough */
> +		fallthrough;
> 	case IDR5_OAS_48_BIT:
> 		smmu->oas =3D 48;
> 	}
> --=20
> 2.17.1
>=20
>=20


