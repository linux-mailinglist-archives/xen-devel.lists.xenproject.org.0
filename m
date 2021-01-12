Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C52F2E13
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65624.116305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI0B-0006mq-MK; Tue, 12 Jan 2021 11:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65624.116305; Tue, 12 Jan 2021 11:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI0B-0006mQ-IX; Tue, 12 Jan 2021 11:38:19 +0000
Received: by outflank-mailman (input) for mailman id 65624;
 Tue, 12 Jan 2021 11:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzI0A-0006mL-Cx
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:38:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d90f54e-cbc6-48c5-a07a-b160599d28a0;
 Tue, 12 Jan 2021 11:38:17 +0000 (UTC)
Received: from AM6PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:2e::39)
 by VI1PR0801MB1807.eurprd08.prod.outlook.com (2603:10a6:800:4f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:38:14 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::b8) by AM6PR05CA0026.outlook.office365.com
 (2603:10a6:20b:2e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 11:38:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 11:38:14 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Tue, 12 Jan 2021 11:38:14 +0000
Received: from 00f150a849fa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67443046-44AE-4333-B64A-E2FAA57B7C92.1; 
 Tue, 12 Jan 2021 11:38:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00f150a849fa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 11:38:08 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:38:07 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:38:07 +0000
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
X-Inumbo-ID: 7d90f54e-cbc6-48c5-a07a-b160599d28a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQnVDaUBzrw12rMxaGc0cp0ZsyxG+I8gGW0uREmK/dM=;
 b=F3XOWkuVZPpwyN6ZmelyyRu/I159ZMIje9MSgWMy3KwrrklKVL2VdGil7bvH1ihzlLdDgaOwdzuxi70tTFyGZoOUcR6hVpeeKse9IqWsifAXG7PYt0YhZNXJuXG3Bq1lOAAbLFNCVWHK3oibJXFDfzHlSmCUeGn0Z/SD4k915j0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78cf1e33fce50c8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NspsDwtFNePqrSiCCAqYfIR6FZ47YrChWhiaHFZYyaPQvOuj4uc3MLN+xLAvxmuXjcM7epEx6byk76MhLFms9L/BUnjcAWboR2U3L2sHv86wT0nPiYooG2ANIdOv2V7/Nx1B4hlMlDZgx8T6h9e67CbZFMfO+TUbXdAHjGkhMOa96nu57d4bKV5PXQ+I4Z1rPbIFKSU0gKoscwmtN147tTd917Yl3CVJdIYVslWjMzCq24UzvQBtttAhF5IIRolkMdZf/0HhuhRgA+HjPBaoxNdJe9wSOJBTD7Z28Qlo03n0F7pGZS2HIxz6hiDS8hP25hfegbWlG33v/qHQm22+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQnVDaUBzrw12rMxaGc0cp0ZsyxG+I8gGW0uREmK/dM=;
 b=O9e1AdtfFCSN9xfGkZaWfPpQU+nReretVxQXEpMae4l+MB/g9SDmvh8VKA7sA06kDgRfVyq4UJfJWRtX57IzME4h/TodS4xN5JOX+RvOGiAIKnDl31bVpaqh9anwVCHLLH0f5G93fbckN/+5y++GFnA3EsK14gXP3P7BxEoTQ7wvpDOVm51+gHLEwDocIN30qNd4FIqtMbMl9GdKNpEJQP85KA+U3E0nbxZtcgS4uK8zHq3LTOxqMX/Iu86KkbMojTVbPhSEtCRc0hETxiOAv/PM6LHJFpkotdjvly0sChoOEip0dfz7/mklRce2Whf5CcVZE62NnVw37humA4B0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQnVDaUBzrw12rMxaGc0cp0ZsyxG+I8gGW0uREmK/dM=;
 b=F3XOWkuVZPpwyN6ZmelyyRu/I159ZMIje9MSgWMy3KwrrklKVL2VdGil7bvH1ihzlLdDgaOwdzuxi70tTFyGZoOUcR6hVpeeKse9IqWsifAXG7PYt0YhZNXJuXG3Bq1lOAAbLFNCVWHK3oibJXFDfzHlSmCUeGn0Z/SD4k915j0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 05/11] xen/arm: smmuv3: Remove Linux specific code that
 is not usable in XEN
Thread-Topic: [PATCH v4 05/11] xen/arm: smmuv3: Remove Linux specific code
 that is not usable in XEN
Thread-Index: AQHW5c2cgMQClWiZRUKOWdkuXQc9LKoj4y4A
Date: Tue, 12 Jan 2021 11:38:07 +0000
Message-ID: <338E4B7F-50C6-48E9-8A54-77B5FC4CC151@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <ced37da262ce72b9d1dfbc8a05580ba4672127d0.1610115608.git.rahul.singh@arm.com>
In-Reply-To:
 <ced37da262ce72b9d1dfbc8a05580ba4672127d0.1610115608.git.rahul.singh@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3166be2d-d418-406a-503f-08d8b6ee8c23
x-ms-traffictypediagnostic: VE1PR08MB5838:|VI1PR0801MB1807:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB180711231FFA0DB48B0583339DAA0@VI1PR0801MB1807.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 luzIKw0s9iHXDAUN4CDztwEZV1inxqdLOwLLwhsgTsFW/yFwTDi2FohphWr+hc0NefOvGn9yV1CBrCGKNOiaJjqd3g68N0Rq5y/6dLIjh8Gl1RhhnIW2eDPR4TxY9PSLh/yR7XlXjGPcLLDFpNzVpqPRqg7ttmVBoA9uP4ZK+4hPRErbvE5X1dQUbClA722On1elT/E2VstKb+OZbAeGE+S4KboujTmXyaGeL68epp51ufOas4FVGPW7IhNtpcRSfPLTtyOmMW0e+COt3p9a0Kofvs+YLC0+L/p+EVX6wgBkhChZ8ZK+g3PHT41WeRaPaPnhRiU5A+2cvGu8WSzFW/r4Urji1g/78QHff+xmcbSUQdNei/n4TFXHgCfaoqzSgoLjJsVECU2bGcRW88W3Qw/wMNTiE8ujqmIZ44HQBnqDhk1LF+NrB/jdryMTaB2e
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(54906003)(76116006)(4326008)(66556008)(26005)(316002)(6506007)(8936002)(86362001)(66446008)(33656002)(55236004)(30864003)(64756008)(53546011)(6862004)(8676002)(91956017)(6636002)(186003)(2906002)(66946007)(6512007)(2616005)(5660300002)(37006003)(478600001)(6486002)(83380400001)(71200400001)(36756003)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?CxXq+yUgkfnPRibV1shMBC7uET9wJx677LMiFBhbfKRKWZpNwONYDuKllvvP?=
 =?us-ascii?Q?7hqbKZZU2FdfPBLDbw1QbHl3dirReXjt82Tw8cZqGOmHmnmVANuB4h9JNaqx?=
 =?us-ascii?Q?MGJZov6pv6IfXfvU7rVA4KcY3t5932mzZKRfciSh87tjApRyeNdzc/gnDJCT?=
 =?us-ascii?Q?lUxtLfhUlbl1RdxAO909Ffs1Ca7RrtnZUkkSfLr0Yrfle9L+UgPS4I5GkmFc?=
 =?us-ascii?Q?HJJvNdUpCsA7fFLHMTrcRdTv4HG9U8odMoSVFuMn/1t2p5ViMHveN7NqEKbG?=
 =?us-ascii?Q?3DVeJ/bowMbZ327dHfRKr8YgQYDn90vsnRL6hKmAE3I0dLR3m3Nh1R+s8ZLN?=
 =?us-ascii?Q?xQOCedRe9kSLFS0gG2V01v6GeXWMz5NZfc1MtYgfw7S/Lt0Fjk3Y/DPqju5Q?=
 =?us-ascii?Q?jMdCL31zZ8O7gvX8/uO+yRnQYkQQwFlhFf7f/3YdW90gcrxR0dzpok7T6Wxd?=
 =?us-ascii?Q?1+J+ZpYSA+iO+RZ8wWBJ0sXNV0xmB6Z6xgleglWeNfn9Rn0flRkikEUB5rBA?=
 =?us-ascii?Q?99vJ/5malcra0HaDf3Uydy23a9TR8fLLG/2CfaNzWxEVcXm0zLbnXwJBoyXe?=
 =?us-ascii?Q?10YoY6yKnm9oudid/jNxwvTWiV6/JZIE40p5krAXY7HMW2ItK/9vG9FXYUhp?=
 =?us-ascii?Q?sAM4ijZu/1qd3GFCizZwWb0Tq6g4/38j6P9RdPVtTt1+iCPnTW9D6xcjjb6r?=
 =?us-ascii?Q?xaglUiRZPJYmoGA/iM0Ythi6X5yQ3iAq/MMkAVxbGR0PpJdHRUcVdQj0Peux?=
 =?us-ascii?Q?IYfpgwFFmx8HC/ARhPhQvjuaj6uLmevctq3vY0w99RNurbXRIc2S+Fh83D9e?=
 =?us-ascii?Q?EI8Zy1zZ63F6MH/eNqqtPiV8wNF1Aif4m4Jy0ZJk98RcXiiCxQftrr1XfMRN?=
 =?us-ascii?Q?PRTK3IZ2B9/NOS4r9Dc/OTiHO3TdULVRCGyuxrJXDUDU94rojUOjqUEEOwvr?=
 =?us-ascii?Q?97gQyXilHkjSDPPH8jtjMgI5VY1bQazGqxD2O9OfTL0eTqlC5q73Xt20OsnH?=
 =?us-ascii?Q?hcUr?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <384D1EF963FB574CBEF8CF2B59954BBC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03180bd3-26c7-4b70-56f6-08d8b6ee87ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gylm0vTLJVQ3pl2ihRMnOiMVXkpYtdcI4iIvIlQdhaLUrRPxYeB509TshXu8OhKZ8K8KhLwKld3m5eOnvS2rCEE93vc0QzboH/97oPAYTtXuJ+XipJ0Ee2QOg5BMZjkcM8ahP9Mj3vYfRz4+KHuGQI5UWeVJJtl5n7Uu2/3p+XxiJNG+kIKb/4wgIn7yLIEbZ/VoFEey0B0si7gH7ddwHmkLxPDZHgMmfAiJ5M8NmCh4iwPQ2niNNhoD8jrlmIsuwph/qaYcJtpfGC6SDMpKFYeKRKTX0deHc62hU02UhSiKWawIHmjUKR/DGgwzfFJ0gSryw/i7c2XDEr7Zt0yLj07NhNjuKVaj9nMJaTxJARN4DygOKmQFoVq7swhcKUew56NzU32kMukJjgo/52Q89nV6cqXHChvbqI3GhRCrbQYlT7WeYyTOgvgBf7fgtKZveUFxjFjhwjKkXJKt36TwKANGPM4x1CuXBNEcB9iCGiiIxKOFYBV1hqT69DGeWp68
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(82740400003)(36756003)(2906002)(33656002)(5660300002)(8676002)(70586007)(186003)(70206006)(6486002)(2616005)(356005)(8936002)(316002)(82310400003)(34020700004)(54906003)(37006003)(26005)(53546011)(6862004)(107886003)(6506007)(47076005)(6512007)(30864003)(55236004)(6636002)(478600001)(336012)(81166007)(83380400001)(86362001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:38:14.0762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3166be2d-d418-406a-503f-08d8b6ee8c23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1807

Hi,

> On 8 Jan 2021, at 14:46, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Remove code that is related to below functionality :
> 1. struct io_pgtable_ops
> 2. struct io_pgtable_cfg
> 3. struct iommu_flush_ops,
> 4. struct iommu_ops
> 5. module_param_named, MODULE_PARM_DESC, module_platform_driver,
>    MODULE_*
> 6. IOMMU domain-types
> 7. arm_smmu_set_bus_ops
> 8. iommu_device_sysfs_add, iommu_device_register,
>    iommu_device_set_fwnode
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V3:
> - Commit message is updated to add more detail what is removed in this
>  patch.
> - remove instances of io_pgtable_cfg.
> - Added back ARM_SMMU_FEAT_COHERENCY feature.
> Changes in V4: Rebase
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 475 ++------------------------
> 1 file changed, 21 insertions(+), 454 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 869f38b753..5ce14850b4 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -394,13 +394,7 @@
> #define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
> #define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
>=20
> -#define MSI_IOVA_BASE			0x8000000
> -#define MSI_IOVA_LENGTH			0x100000
> -
> static bool disable_bypass =3D 1;
> -module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
> -MODULE_PARM_DESC(disable_bypass,
> -	"Disable bypass streams such that incoming transactions from devices th=
at are not attached to an iommu domain will report an abort back to the dev=
ice and will not be allowed to pass through the SMMU.");
>=20
> enum pri_resp {
> 	PRI_RESP_DENY =3D 0,
> @@ -552,6 +546,19 @@ struct arm_smmu_strtab_cfg {
> 	u32				strtab_base_cfg;
> };
>=20
> +struct arm_lpae_s2_cfg {
> +	u64			vttbr;
> +	struct {
> +		u32			ps:3;
> +		u32			tg:2;
> +		u32			sh:2;
> +		u32			orgn:2;
> +		u32			irgn:2;
> +		u32			sl:2;
> +		u32			tsz:6;
> +	} vtcr;
> +};
> +
> /* An SMMUv3 instance */
> struct arm_smmu_device {
> 	struct device			*dev;
> @@ -633,7 +640,6 @@ struct arm_smmu_domain {
> 	struct arm_smmu_device		*smmu;
> 	struct mutex			init_mutex; /* Protects smmu pointer */
>=20
> -	struct io_pgtable_ops		*pgtbl_ops;
> 	bool				non_strict;
> 	atomic_t			nr_ats_masters;
>=20
> @@ -1491,7 +1497,6 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_=
domain *smmu_domain,
> 	return ret ? -ETIMEDOUT : 0;
> }
>=20
> -/* IO_PGTABLE API */
> static void arm_smmu_tlb_inv_context(void *cookie)
> {
> 	struct arm_smmu_domain *smmu_domain =3D cookie;
> @@ -1512,86 +1517,10 @@ static void arm_smmu_tlb_inv_context(void *cookie=
)
> 	arm_smmu_cmdq_issue_sync(smmu);
> }
>=20
> -static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t siz=
e,
> -					  size_t granule, bool leaf, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain =3D cookie;
> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -	struct arm_smmu_cmdq_ent cmd =3D {
> -		.tlbi =3D {
> -			.leaf	=3D leaf,
> -			.addr	=3D iova,
> -		},
> -	};
> -
> -	if (!size)
> -		return;
> -
> -	cmd.opcode	=3D CMDQ_OP_TLBI_S2_IPA;
> -	cmd.tlbi.vmid	=3D smmu_domain->s2_cfg.vmid;
> -
> -	do {
> -		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -		cmd.tlbi.addr +=3D granule;
> -	} while (size -=3D granule);
> -}
> -
> -static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gath=
er,
> -					 unsigned long iova, size_t granule,
> -					 void *cookie)
> -{
> -	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
> -}
> -
> -static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
> -				  size_t granule, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain =3D cookie;
> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -
> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
> -	arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
> -				  size_t granule, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain =3D cookie;
> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -
> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
> -	arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static const struct iommu_flush_ops arm_smmu_flush_ops =3D {
> -	.tlb_flush_all	=3D arm_smmu_tlb_inv_context,
> -	.tlb_flush_walk =3D arm_smmu_tlb_inv_walk,
> -	.tlb_flush_leaf =3D arm_smmu_tlb_inv_leaf,
> -	.tlb_add_page	=3D arm_smmu_tlb_inv_page_nosync,
> -};
> -
> -/* IOMMU API */
> -static bool arm_smmu_capable(enum iommu_cap cap)
> -{
> -	switch (cap) {
> -	case IOMMU_CAP_CACHE_COHERENCY:
> -		return true;
> -	case IOMMU_CAP_NOEXEC:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
> -static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
> +static struct iommu_domain *arm_smmu_domain_alloc(void)
> {
> 	struct arm_smmu_domain *smmu_domain;
>=20
> -	if (type !=3D IOMMU_DOMAIN_UNMANAGED &&
> -	    type !=3D IOMMU_DOMAIN_DMA &&
> -	    type !=3D IOMMU_DOMAIN_IDENTITY)
> -		return NULL;
> -
> 	/*
> 	 * Allocate the domain and initialise some of its data structures.
> 	 * We can't really do anything meaningful until we've added a
> @@ -1601,12 +1530,6 @@ static struct iommu_domain *arm_smmu_domain_alloc(=
unsigned type)
> 	if (!smmu_domain)
> 		return NULL;
>=20
> -	if (type =3D=3D IOMMU_DOMAIN_DMA &&
> -	    iommu_get_dma_cookie(&smmu_domain->domain)) {
> -		kfree(smmu_domain);
> -		return NULL;
> -	}
> -
> 	mutex_init(&smmu_domain->init_mutex);
> 	INIT_LIST_HEAD(&smmu_domain->devices);
> 	spin_lock_init(&smmu_domain->devices_lock);
> @@ -1638,9 +1561,6 @@ static void arm_smmu_domain_free(struct iommu_domai=
n *domain)
> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>=20
> -	iommu_put_dma_cookie(domain);
> -	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
> -
> 	if (cfg->vmid)
> 		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>=20
> @@ -1649,21 +1569,20 @@ static void arm_smmu_domain_free(struct iommu_dom=
ain *domain)
>=20
>=20
> static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domai=
n,
> -				       struct arm_smmu_master *master,
> -				       struct io_pgtable_cfg *pgtbl_cfg)
> +				       struct arm_smmu_master *master)
> {
> 	int vmid;
> +	struct arm_lpae_s2_cfg arm_lpae_s2_cfg;
> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
> -	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
> +	typeof(&arm_lpae_s2_cfg.vtcr) vtcr =3D &arm_lpae_s2_cfg.vtcr;
>=20
> 	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
> 	if (vmid < 0)
> 		return vmid;
>=20
> -	vtcr =3D &pgtbl_cfg->arm_lpae_s2_cfg.vtcr;
> 	cfg->vmid	=3D (u16)vmid;
> -	cfg->vttbr	=3D pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> +	cfg->vttbr	=3D arm_lpae_s2_cfg.vttbr;
> 	cfg->vtcr	=3D FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, vtcr->tsz) |
> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, vtcr->sl) |
> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, vtcr->irgn) |
> @@ -1678,49 +1597,15 @@ static int arm_smmu_domain_finalise(struct iommu_=
domain *domain,
> 				    struct arm_smmu_master *master)
> {
> 	int ret;
> -	unsigned long ias, oas;
> -	enum io_pgtable_fmt fmt;
> -	struct io_pgtable_cfg pgtbl_cfg;
> -	struct io_pgtable_ops *pgtbl_ops;
> 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -
> -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
> -		return 0;
> -	}
>=20
> 	/* Restrict the stage to what we can actually support */
> 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>=20
> -
> -	pgtbl_cfg =3D (struct io_pgtable_cfg) {
> -		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
> -		.ias		=3D ias,
> -		.oas		=3D oas,
> -		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENCY,
> -		.tlb		=3D &arm_smmu_flush_ops,
> -		.iommu_dev	=3D smmu->dev,
> -	};
> -
> -	if (smmu_domain->non_strict)
> -		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
> -
> -	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> -	if (!pgtbl_ops)
> -		return -ENOMEM;
> -
> -	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
> -	domain->geometry.aperture_end =3D (1UL << pgtbl_cfg.ias) - 1;
> -	domain->geometry.force_aperture =3D true;
> -
> -	ret =3D arm_smmu_domain_finalise_s2(smmu_domain, master, &pgtbl_cfg);
> -	if (ret < 0) {
> -		free_io_pgtable_ops(pgtbl_ops);
> +	ret =3D arm_smmu_domain_finalise_s2(smmu_domain, master);
> +	if (ret < 0)
> 		return ret;
> -	}
>=20
> -	smmu_domain->pgtbl_ops =3D pgtbl_ops;
> 	return 0;
> }
>=20
> @@ -1937,76 +1822,6 @@ out_unlock:
> 	return ret;
> }
>=20
> -static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> -{
> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
> -
> -	if (!ops)
> -		return -ENODEV;
> -
> -	return ops->map(ops, iova, paddr, size, prot);
> -}
> -
> -static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long =
iova,
> -			     size_t size, struct iommu_iotlb_gather *gather)
> -{
> -	int ret;
> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> -	struct io_pgtable_ops *ops =3D smmu_domain->pgtbl_ops;
> -
> -	if (!ops)
> -		return 0;
> -
> -	ret =3D ops->unmap(ops, iova, size, gather);
> -	if (ret && arm_smmu_atc_inv_domain(smmu_domain, 0, iova, size))
> -		return 0;
> -
> -	return ret;
> -}
> -
> -static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
> -{
> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> -
> -	if (smmu_domain->smmu)
> -		arm_smmu_tlb_inv_context(smmu_domain);
> -}
> -
> -static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
> -				struct iommu_iotlb_gather *gather)
> -{
> -	struct arm_smmu_device *smmu =3D to_smmu_domain(domain)->smmu;
> -
> -	if (smmu)
> -		arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static phys_addr_t
> -arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
> -{
> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
> -
> -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY)
> -		return iova;
> -
> -	if (!ops)
> -		return 0;
> -
> -	return ops->iova_to_phys(ops, iova);
> -}
> -
> -static struct platform_driver arm_smmu_driver;
> -
> -static
> -struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwn=
ode)
> -{
> -	struct device *dev =3D driver_find_device_by_fwnode(&arm_smmu_driver.dr=
iver,
> -							  fwnode);
> -	put_device(dev);
> -	return dev ? dev_get_drvdata(dev) : NULL;
> -}
> -
> static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
> {
> 	unsigned long limit =3D smmu->strtab_cfg.num_l1_ents;
> @@ -2017,8 +1832,6 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
evice *smmu, u32 sid)
> 	return sid < limit;
> }
>=20
> -static struct iommu_ops arm_smmu_ops;
> -
> static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> {
> 	int i, ret;
> @@ -2026,16 +1839,12 @@ static struct iommu_device *arm_smmu_probe_device=
(struct device *dev)
> 	struct arm_smmu_master *master;
> 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>=20
> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
> +	if (!fwspec)
> 		return ERR_PTR(-ENODEV);
>=20
> 	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
> 		return ERR_PTR(-EBUSY);
>=20
> -	smmu =3D arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> -	if (!smmu)
> -		return ERR_PTR(-ENODEV);
> -
> 	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
> 	if (!master)
> 		return ERR_PTR(-ENOMEM);
> @@ -2081,153 +1890,11 @@ err_free_master:
> 	return ERR_PTR(ret);
> }
>=20
> -static void arm_smmu_release_device(struct device *dev)
> -{
> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> -	struct arm_smmu_master *master;
> -
> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
> -		return;
> -
> -	master =3D dev_iommu_priv_get(dev);
> -	arm_smmu_detach_dev(master);
> -	arm_smmu_disable_pasid(master);
> -	kfree(master);
> -	iommu_fwspec_free(dev);
> -}
> -
> -static struct iommu_group *arm_smmu_device_group(struct device *dev)
> -{
> -	struct iommu_group *group;
> -
> -	/*
> -	 * We don't support devices sharing stream IDs other than PCI RID
> -	 * aliases, since the necessary ID-to-device lookup becomes rather
> -	 * impractical given a potential sparse 32-bit stream ID space.
> -	 */
> -	if (dev_is_pci(dev))
> -		group =3D pci_device_group(dev);
> -	else
> -		group =3D generic_device_group(dev);
> -
> -	return group;
> -}
> -
> -static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
> -				    enum iommu_attr attr, void *data)
> -{
> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> -
> -	switch (domain->type) {
> -	case IOMMU_DOMAIN_UNMANAGED:
> -		switch (attr) {
> -		case DOMAIN_ATTR_NESTING:
> -			*(int *)data =3D (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED);
> -			return 0;
> -		default:
> -			return -ENODEV;
> -		}
> -		break;
> -	case IOMMU_DOMAIN_DMA:
> -		switch (attr) {
> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			*(int *)data =3D smmu_domain->non_strict;
> -			return 0;
> -		default:
> -			return -ENODEV;
> -		}
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> -				    enum iommu_attr attr, void *data)
> -{
> -	int ret =3D 0;
> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> -
> -	mutex_lock(&smmu_domain->init_mutex);
> -
> -	switch (domain->type) {
> -	case IOMMU_DOMAIN_UNMANAGED:
> -		switch (attr) {
> -		case DOMAIN_ATTR_NESTING:
> -			if (smmu_domain->smmu) {
> -				ret =3D -EPERM;
> -				goto out_unlock;
> -			}
> -
> -			if (*(int *)data)
> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
> -			else
> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
> -			break;
> -		default:
> -			ret =3D -ENODEV;
> -		}
> -		break;
> -	case IOMMU_DOMAIN_DMA:
> -		switch(attr) {
> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			smmu_domain->non_strict =3D *(int *)data;
> -			break;
> -		default:
> -			ret =3D -ENODEV;
> -		}
> -		break;
> -	default:
> -		ret =3D -EINVAL;
> -	}
> -
> -out_unlock:
> -	mutex_unlock(&smmu_domain->init_mutex);
> -	return ret;
> -}
> -
> static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *=
args)
> {
> 	return iommu_fwspec_add_ids(dev, args->args, 1);
> }
>=20
> -static void arm_smmu_get_resv_regions(struct device *dev,
> -				      struct list_head *head)
> -{
> -	struct iommu_resv_region *region;
> -	int prot =3D IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> -
> -	region =3D iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> -
> -	iommu_dma_get_resv_regions(dev, head);
> -}
> -
> -static struct iommu_ops arm_smmu_ops =3D {
> -	.capable		=3D arm_smmu_capable,
> -	.domain_alloc		=3D arm_smmu_domain_alloc,
> -	.domain_free		=3D arm_smmu_domain_free,
> -	.attach_dev		=3D arm_smmu_attach_dev,
> -	.map			=3D arm_smmu_map,
> -	.unmap			=3D arm_smmu_unmap,
> -	.flush_iotlb_all	=3D arm_smmu_flush_iotlb_all,
> -	.iotlb_sync		=3D arm_smmu_iotlb_sync,
> -	.iova_to_phys		=3D arm_smmu_iova_to_phys,
> -	.probe_device		=3D arm_smmu_probe_device,
> -	.release_device		=3D arm_smmu_release_device,
> -	.device_group		=3D arm_smmu_device_group,
> -	.domain_get_attr	=3D arm_smmu_domain_get_attr,
> -	.domain_set_attr	=3D arm_smmu_domain_set_attr,
> -	.of_xlate		=3D arm_smmu_of_xlate,
> -	.get_resv_regions	=3D arm_smmu_get_resv_regions,
> -	.put_resv_regions	=3D generic_iommu_put_resv_regions,
> -	.pgsize_bitmap		=3D -1UL, /* Restricted during device attach */
> -};
> -
> /* Probing and initialisation functions */
> static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
> 				   struct arm_smmu_queue *q,
> @@ -2927,16 +2594,6 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
> 		smmu->oas =3D 48;
> 	}
>=20
> -	if (arm_smmu_ops.pgsize_bitmap =3D=3D -1UL)
> -		arm_smmu_ops.pgsize_bitmap =3D smmu->pgsize_bitmap;
> -	else
> -		arm_smmu_ops.pgsize_bitmap |=3D smmu->pgsize_bitmap;
> -
> -	/* Set the DMA mask for our table walker */
> -	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
> -		dev_warn(smmu->dev,
> -			 "failed to set DMA mask for table walker\n");
> -
> 	smmu->ias =3D max(smmu->ias, smmu->oas);
>=20
> 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
> @@ -3016,43 +2673,6 @@ static unsigned long arm_smmu_resource_size(struct=
 arm_smmu_device *smmu)
> 		return SZ_128K;
> }
>=20
> -static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
> -{
> -	int err;
> -
> -#ifdef CONFIG_PCI
> -	if (pci_bus_type.iommu_ops !=3D ops) {
> -		err =3D bus_set_iommu(&pci_bus_type, ops);
> -		if (err)
> -			return err;
> -	}
> -#endif
> -#ifdef CONFIG_ARM_AMBA
> -	if (amba_bustype.iommu_ops !=3D ops) {
> -		err =3D bus_set_iommu(&amba_bustype, ops);
> -		if (err)
> -			goto err_reset_pci_ops;
> -	}
> -#endif
> -	if (platform_bus_type.iommu_ops !=3D ops) {
> -		err =3D bus_set_iommu(&platform_bus_type, ops);
> -		if (err)
> -			goto err_reset_amba_ops;
> -	}
> -
> -	return 0;
> -
> -err_reset_amba_ops:
> -#ifdef CONFIG_ARM_AMBA
> -	bus_set_iommu(&amba_bustype, NULL);
> -#endif
> -err_reset_pci_ops: __maybe_unused;
> -#ifdef CONFIG_PCI
> -	bus_set_iommu(&pci_bus_type, NULL);
> -#endif
> -	return err;
> -}
> -
> static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t=
 start,
> 				      resource_size_t size)
> {
> @@ -3145,68 +2765,15 @@ static int arm_smmu_device_probe(struct platform_=
device *pdev)
> 	if (ret)
> 		return ret;
>=20
> -	/* Record our private device structure */
> -	platform_set_drvdata(pdev, smmu);
> -
> 	/* Reset the device */
> 	ret =3D arm_smmu_device_reset(smmu, bypass);
> 	if (ret)
> 		return ret;
>=20
> -	/* And we're up. Go go go! */
> -	ret =3D iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
> -				     "smmu3.%pa", &ioaddr);
> -	if (ret)
> -		return ret;
> -
> -	iommu_device_set_ops(&smmu->iommu, &arm_smmu_ops);
> -	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
> -
> -	ret =3D iommu_device_register(&smmu->iommu);
> -	if (ret) {
> -		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> -	}
> -
> -	return arm_smmu_set_bus_ops(&arm_smmu_ops);
> -}
> -
> -static int arm_smmu_device_remove(struct platform_device *pdev)
> -{
> -	struct arm_smmu_device *smmu =3D platform_get_drvdata(pdev);
> -
> -	arm_smmu_set_bus_ops(NULL);
> -	iommu_device_unregister(&smmu->iommu);
> -	iommu_device_sysfs_remove(&smmu->iommu);
> -	arm_smmu_device_disable(smmu);
> -
> 	return 0;
> }
>=20
> -static void arm_smmu_device_shutdown(struct platform_device *pdev)
> -{
> -	arm_smmu_device_remove(pdev);
> -}
> -
> static const struct of_device_id arm_smmu_of_match[] =3D {
> 	{ .compatible =3D "arm,smmu-v3", },
> 	{ },
> };
> -MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
> -
> -static struct platform_driver arm_smmu_driver =3D {
> -	.driver	=3D {
> -		.name			=3D "arm-smmu-v3",
> -		.of_match_table		=3D arm_smmu_of_match,
> -		.suppress_bind_attrs	=3D true,
> -	},
> -	.probe	=3D arm_smmu_device_probe,
> -	.remove	=3D arm_smmu_device_remove,
> -	.shutdown =3D arm_smmu_device_shutdown,
> -};
> -module_platform_driver(arm_smmu_driver);
> -
> -MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations=
");
> -MODULE_AUTHOR("Will Deacon <will@kernel.org>");
> -MODULE_ALIAS("platform:arm-smmu-v3");
> -MODULE_LICENSE("GPL v2");
> --=20
> 2.17.1
>=20


