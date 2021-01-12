Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A42F2E00
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65612.116269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHxm-0006PK-Gq; Tue, 12 Jan 2021 11:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65612.116269; Tue, 12 Jan 2021 11:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHxm-0006Ox-DZ; Tue, 12 Jan 2021 11:35:50 +0000
Received: by outflank-mailman (input) for mailman id 65612;
 Tue, 12 Jan 2021 11:35:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzHxl-0006Oq-77
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:35:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1047d7b2-3028-426d-84a7-897137ed15a2;
 Tue, 12 Jan 2021 11:35:47 +0000 (UTC)
Received: from DB8PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:a0::42)
 by VI1PR08MB3040.eurprd08.prod.outlook.com (2603:10a6:803:45::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 11:35:22 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::29) by DB8PR09CA0029.outlook.office365.com
 (2603:10a6:10:a0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 11:35:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 11:35:22 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Tue, 12 Jan 2021 11:35:22 +0000
Received: from 56dded32ba90.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63E6CB18-E6A2-4DE3-A831-F07525B3E9D3.1; 
 Tue, 12 Jan 2021 11:35:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56dded32ba90.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 11:35:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:35:15 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:35:15 +0000
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
X-Inumbo-ID: 1047d7b2-3028-426d-84a7-897137ed15a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwKHPik9KTIlWB7plu+6fTnAo3M/ShlaTW3TKLrdTMQ=;
 b=iumfffF2x+QWZLgSikNTtBmjizlcEbqxaGQIJ/zifK8PJflaW6hDL8i+IJ08memJ7RS373ipW7y+A0tyU9vU7qaQM7r7XuWgq4YVwV5GzkxFfx6jkBomgnR07v0DYANqYQsFTtMLzeQohpxQIonUt1Zb9m1cwa1Z/m9fQe4nMeU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa9bdccaa1bba4e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxQ/oPgQOvZXJwdqCJ7evDfCFw8iUrVsTpUpfmgDWw9G3KfkokIGe2Wdk0iv4aTkCz7YymV1MrSEYRptlRtM0iX6vfmAr5HPVhwxDbePuG7BBYEMPyv+wPBMsBUm0HJOr81SfE1MZZKOMxYrOjLUd3dvcrY74uANXs31nXeTt/lxsXzCKqkzKd0SeSKQqOqGBln80SR63s9IOaBMt3ZX7JqgD/fguXzKclVr3Aif0FoPfTkXLM92PDaox+vX1SX8gfG4sVhcUgIl3h4H9FpsxoWh4BRL4+D/KTmGBlePBPofYLDCCJTV5hoEc5+uwB5SGcdsovQrpKWhne7RhPWExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwKHPik9KTIlWB7plu+6fTnAo3M/ShlaTW3TKLrdTMQ=;
 b=OUDzGRMicq1ozE+3uiswIX8IoR4g2oJsJzC7pnSwbDDyNBOPMMJ7kpeT+ERJWDImo4NlkXxtlo1MAw2IA+q5JA+z6OW3N9L12pCr+0//MA8SEtB8GpyMTALtw3qnLqCK6cn49msxLDx2ed+WKwSEJIQH0Pfd0q0gh7FsQ1AmyWY8RicManTJLA3kjlz68JlPgbGWoL4O0t56CVcM0ZycTO+6I+TaAnfnSLybICqdhmPb8sqaH4c12J4N9wKAZHEKjjX41PVc+CbNutvzaMeQQ7BWt4MN4WQSIn4VNx6+80tyRIS8zXlZZ3fyR4yp4sfoNTCMiueE8+Frzsc7A062tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwKHPik9KTIlWB7plu+6fTnAo3M/ShlaTW3TKLrdTMQ=;
 b=iumfffF2x+QWZLgSikNTtBmjizlcEbqxaGQIJ/zifK8PJflaW6hDL8i+IJ08memJ7RS373ipW7y+A0tyU9vU7qaQM7r7XuWgq4YVwV5GzkxFfx6jkBomgnR07v0DYANqYQsFTtMLzeQohpxQIonUt1Zb9m1cwa1Z/m9fQe4nMeU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 10/11] xen/arm: smmuv3: Replace linux functions with
 xen functions.
Thread-Topic: [PATCH v4 10/11] xen/arm: smmuv3: Replace linux functions with
 xen functions.
Thread-Index: AQHW5c3ziqfg08UM3kK3n1F6OraRk6oj4mAA
Date: Tue, 12 Jan 2021 11:35:15 +0000
Message-ID: <8C52CDEB-8570-43F0-BDE3-F92466847D6F@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <85c1bdd22dc6f50c9d1dfd73e0ddf83c2c307dcf.1610115608.git.rahul.singh@arm.com>
In-Reply-To:
 <85c1bdd22dc6f50c9d1dfd73e0ddf83c2c307dcf.1610115608.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0ce731d-30bb-4ec9-1183-08d8b6ee25a8
x-ms-traffictypediagnostic: VE1PR08MB5838:|VI1PR08MB3040:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB30406C6B2802B010D2E7B6759DAA0@VI1PR08MB3040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:792;OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6hiBL0phxsqU4pA8fzTGyrYNPb26NJVK7RPQirHCFrEoh+kv9otvvHRAAQNJ9bFz+obRtOE7nM9arrd7ejnyhuHdYP5uZVmmaa6bq3OkkMn9nVdRCa0gZn88i7HzpfBpohyeo2QdSu++rtONSaS0Q3Vbvl9mbicqTPtGLiyTUrTHqCnQvugWy7qmYa3WvSWMMot4LcuB/KSsOIm7XpSXFZh/d4SaEZSLd3vx5YNtEP5FS3Apx6WFCj/dWXcM+E5OpvxKXhOYs0MahpTY11+chjUTZCZmLDjRo1eGnd9EusZw1HFrcqNqwFo0y4miwFjAg7NFq98rEEYa2yfTCehfOXnuXddL5K4XVLGGV84E4HnNVeF1fc5xUB324vvSmk3BUgbYESmHvvaZeb4jHdFLCuvB/en0E9SklreLEaeRcRcNvHmBH1FH6sxd6qQliyGz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(2616005)(6512007)(5660300002)(186003)(2906002)(91956017)(6636002)(66946007)(36756003)(66476007)(83380400001)(71200400001)(478600001)(37006003)(6486002)(6506007)(316002)(86362001)(66446008)(8936002)(66556008)(4326008)(76116006)(54906003)(26005)(53546011)(6862004)(8676002)(33656002)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?hrCs+MqflhxAuCCbtneeNH//yyJ5RB9u62zDRuf3W+RZZNgyhzzUYISdE9ot?=
 =?us-ascii?Q?jMNHKbrUwIkgwr+/FZAq9eZwIDQoMcOJqC2mcEnUqGhvR2v/uAGmJFcV2ViT?=
 =?us-ascii?Q?fApudiIU3nfoqT1kv1Gg8kH6I8X63jpwuWi8FVkm0sf1ugzvjMlIpH1rrKO0?=
 =?us-ascii?Q?zGNx2z6FXqHdm76AOQ2QkHBOg6IrwqN8l9ETIpq1GNNvR9vB5RkS1OglE6eP?=
 =?us-ascii?Q?sc7+aebCc+qXsuS6bTmD2c2+JCa2YM1SIYpclPc5VrxKbTtsWVQBXmbEuTE1?=
 =?us-ascii?Q?EarAm1DGuP1SJmJku0cv2UfAR7Ua8xR+jwex4mLX7raN4L3ZMkpu/adkgYK4?=
 =?us-ascii?Q?/4LL1E/f5kO61u1Srtke30VSxw2j81pg0S4I8fYO6J95o1RXkTIUHWtpvSZd?=
 =?us-ascii?Q?va8+bj/OBt8zMfaPRNhNO2g/rnYgv1HX26uph8v0cc5WIg54MyjWbjqwFNVu?=
 =?us-ascii?Q?xh729g29PJ0h0MtbX6qLCf3rkfP3ZOYF8uxGa7cGAFbFpkbQq5RwaUtDCAuk?=
 =?us-ascii?Q?1eY3qzn/XtmoT87wZhBTwvoW9mRcB00nyKkod+3XVd+O/vLtdApEqjA5mlLq?=
 =?us-ascii?Q?3+L9UlWg562pV8Fw3rWOimV20Eoi4H96KXTzhqccNyEaJD6t+KHP0OwcocuX?=
 =?us-ascii?Q?V8AAtp4SnQ1/X8zBV/wlyGI7GxSQKR1zmfC1KIxVGiLV5yAJmDC9jpqRD7em?=
 =?us-ascii?Q?DSPRz+h0cjWzkJedYXKG1DDrgk8a4sJKGezwXgdz7mX7INIxi8+yg2PwR4kJ?=
 =?us-ascii?Q?SxEDjFfRDONIWedG3Q4zbvWzq6B2et0XqTFYADHhqybF5CaEMKjOXu0FT+6K?=
 =?us-ascii?Q?lr8Lsr2R/eneB3MMfs7vE8NI4H9678bHJuSKUVN/vzu+fdSOmXP3XHIROuWX?=
 =?us-ascii?Q?uRPpruoxucyX1N6vPhDP3KKCxjLtj6Ks1QcoBpJ2uWzRB/7he0SwEWOqNC1Y?=
 =?us-ascii?Q?DiKOY2OvvW73o9W0MSQCwXnbTtbRQeqXrJSsUPsAIqcwEQ668VVdTzH1Yat7?=
 =?us-ascii?Q?LLlZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <98C9AFF979DCC24DBEBDF1543F68CCCF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2372f92-6fa9-4cae-f8a6-08d8b6ee218d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	93bjl+yG8h+QdFMWE0DhbQdy7840Mngssuuj5qbLhRgC3yGk59K4wu9AnuscDm1O7U4ESRAOVMlXy+f6HgtLkHJS1vo3df67fiLWQUiBM+TyGLKnQkcVsqB0WhF7gpsWhlBfhuZ4kC5K8S0QbfGzjk0dYe2NuvrExaJ6O7g26pqrCMqe1LVQaSnqlIj4t22iQ2E11YnK48LAMpbdKj9Clpvo/RRGQD200aOisWS0naQBxvInZbdFKRgZlJ645p1OXggAv8TGzhoolPXT/Lhpb0qzBhU1eU5+UsdHNXwjVPXDvdZHwre0fMfOp1SQcyXg4PfBvljDdAAVcZSlUjyH0EW++YeLL5PvcgHJVPQqW4wQmjm0GjeDu3F0CXFEWACtqmRTPzp7bukMTKaLlxRTbTC1uoshzY13pK3LSR3My1snNZI2zT2JSXgQ5iK5ENrrESFXhpsGn1DzXjuTpcWXbNULXiJgGyBAmYGZV5HAo17GwL1PfxyUqlYVYJwUrnfT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36756003)(5660300002)(34020700004)(6486002)(186003)(336012)(8936002)(70206006)(81166007)(82310400003)(86362001)(356005)(70586007)(6862004)(47076005)(33656002)(478600001)(6636002)(316002)(26005)(6512007)(37006003)(54906003)(53546011)(4326008)(83380400001)(6506007)(107886003)(8676002)(2616005)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:35:22.3088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ce731d-30bb-4ec9-1183-08d8b6ee25a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3040

Hi Rahul,

> On 8 Jan 2021, at 14:46, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Replace all Linux device tree handling function with the XEN
> functions.
>=20
> Replace all Linux ktime function with the XEN time functions.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v3:
> - This patch is introduce in this version.
> Changes in V4:
> - Move this patch one patch earlier so that there is no need to remove
>   the code.
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index f5f8b4c981..2dfadc6a65 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -682,7 +682,7 @@ static void parse_driver_options(struct arm_smmu_devi=
ce *smmu)
> 	int i =3D 0;
>=20
> 	do {
> -		if (of_property_read_bool(smmu->dev->of_node,
> +		if (dt_property_read_bool(smmu->dev->of_node,
> 						arm_smmu_options[i].prop)) {
> 			smmu->options |=3D arm_smmu_options[i].opt;
> 			dev_notice(smmu->dev, "option %s\n",
> @@ -754,17 +754,17 @@ static void queue_inc_prod(struct arm_smmu_ll_queue=
 *q)
>  */
> static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
> {
> -	ktime_t timeout;
> +	s_time_t timeout;
> 	unsigned int delay =3D 1, spin_cnt =3D 0;
>=20
> 	/* Wait longer if it's a CMD_SYNC */
> -	timeout =3D ktime_add_us(ktime_get(), sync ?
> +	timeout =3D NOW() + MICROSECS(sync ?
> 					    ARM_SMMU_CMDQ_SYNC_TIMEOUT_US :
> 					    ARM_SMMU_POLL_TIMEOUT_US);
>=20
> 	while (queue_sync_cons_in(q),
> 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
> -		if (ktime_compare(ktime_get(), timeout) > 0)
> +		if ((NOW() > timeout) > 0)
> 			return -ETIMEDOUT;
>=20
> 		if (wfe) {
> @@ -990,13 +990,13 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu=
_device *smmu,
>  */
> static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 syn=
c_idx)
> {
> -	ktime_t timeout;
> +	s_time_t timeout;
> 	u32 val;
>=20
> -	timeout =3D ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
> +	timeout =3D NOW() + MICROSECS(ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
> 	val =3D smp_cond_load_acquire(&smmu->sync_count,
> 				    (int)(VAL - sync_idx) >=3D 0 ||
> -				    !ktime_before(ktime_get(), timeout));
> +				    !(NOW() < timeout));
>=20
> 	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
> }
> @@ -2649,7 +2649,7 @@ static int arm_smmu_device_dt_probe(struct platform=
_device *pdev,
> 	u32 cells;
> 	int ret =3D -EINVAL;
>=20
> -	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> +	if (!dt_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> 		dev_err(dev, "missing #iommu-cells property\n");
> 	else if (cells !=3D 1)
> 		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
> --=20
> 2.17.1
>=20


