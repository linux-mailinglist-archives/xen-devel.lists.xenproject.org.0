Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB92D7659
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 14:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50579.89285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniH0-00011f-AL; Fri, 11 Dec 2020 13:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50579.89285; Fri, 11 Dec 2020 13:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniH0-00011G-6j; Fri, 11 Dec 2020 13:15:50 +0000
Received: by outflank-mailman (input) for mailman id 50579;
 Fri, 11 Dec 2020 13:15:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df1x=FP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kniGy-000118-Gm
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 13:15:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8842043-f52b-49a3-9e46-776af32077eb;
 Fri, 11 Dec 2020 13:15:47 +0000 (UTC)
Received: from AM6P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::26)
 by DBBPR08MB4553.eurprd08.prod.outlook.com (2603:10a6:10:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 11 Dec
 2020 13:15:45 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::1b) by AM6P192CA0013.outlook.office365.com
 (2603:10a6:209:83::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 13:15:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 13:15:45 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Fri, 11 Dec 2020 13:15:44 +0000
Received: from 77c82f939123.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8118355A-4FF1-4D29-AB3B-B4A9241AC075.1; 
 Fri, 11 Dec 2020 13:15:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77c82f939123.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 13:15:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 13:15:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 13:15:05 +0000
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
X-Inumbo-ID: c8842043-f52b-49a3-9e46-776af32077eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9yaz6ZfSjicd0DadFFb622WPH4VUCuIsmFFsvFKT0o=;
 b=JO+Y3yfdYMiabn/mpD2crtXxNNUgvNi+O8MxzvyQ60nHeKLnzqs+oTYb5XTwPwG+fg2p4CX0R0Xsy7OEvUeBn3ESEDcZayKntPQXt0r+SwjecTGeGUI86uXIICLnyDPzIFvHdkgi11SK4toSNs3jxX2eYVMli7FUUL+Rf2ZVNJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a5112ff9cb75e87
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bORRjMi2pra05J7cksibIuWv4w8WFj2QWKLRUVhe2BzOVpXkXIZbHSMRonwSsZEZtgiFETgqb9XKhAxFZp/vsTjYmxYWAdZ/g6Zv34aw1mVDUvO5pv+xJocMJQSR2eiWSZ0bdkDGfQYojgvP2a6xAyL8BdXS6iV92IIgfT6UDYItkUPEN9I2SzRl/SbreauY7Jr0L9wtGe6wz3SZmZhnvd+GPK6xL4ygS3zgzwN3HqrCJL15RB/n8mOrDlSc9ZSAbjank8J3fcqDqeefN6lfGI9DKvjssrPudPBPUCVz2MbtB7se9wCsB4YC1DS9sVxQ7fDs2O2waThruNjLXELohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9yaz6ZfSjicd0DadFFb622WPH4VUCuIsmFFsvFKT0o=;
 b=MyzkX/ArU77+03X8RzZ5xhUGQF2Nk8bOFWd8qLO26kVT/myIfv39Yupra1t3WWIDmgYHG/uqesY3GOh+pqv46zti16bjOLgIxVY/fDSfgfLGfE1T563TOgVMys5o4xYKP+gCVJ+1wKqwi3A6dAwNxqN/CuR2ALnzdMJfp2kPaWZQc2vlYG9uo84qdxNODj/GMrku3ghIrfmcCvieYk7Hp9mSSSzwTD7j1kagWPtIxCljE2RFjBRt52Yhag39zkbBNbAmsHWo3mB2senVYbFim0pLKdhUATz0UaUk387AwQsmmsh/yxhtioJDxoT2dvxVaFI3ocaFdKMRrqVsdQn6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9yaz6ZfSjicd0DadFFb622WPH4VUCuIsmFFsvFKT0o=;
 b=JO+Y3yfdYMiabn/mpD2crtXxNNUgvNi+O8MxzvyQ60nHeKLnzqs+oTYb5XTwPwG+fg2p4CX0R0Xsy7OEvUeBn3ESEDcZayKntPQXt0r+SwjecTGeGUI86uXIICLnyDPzIFvHdkgi11SK4toSNs3jxX2eYVMli7FUUL+Rf2ZVNJc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 8/8] xen/arm: smmuv3: Remove linux compatibility
 functions.
Thread-Topic: [PATCH v3 8/8] xen/arm: smmuv3: Remove linux compatibility
 functions.
Thread-Index: AQHWzxYmAyN3BeJ+Bke0TiYbqyxvo6nx4RoA
Date: Fri, 11 Dec 2020 13:15:04 +0000
Message-ID: <88AA5EB2-928C-42E7-9A57-DB430036D48E@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
In-Reply-To:
 <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 603256a8-b8c3-475d-3423-08d89dd6de71
x-ms-traffictypediagnostic: DB6PR08MB2693:|DBBPR08MB4553:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4553D0C5C763BF2C019502149DCA0@DBBPR08MB4553.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:873;OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gGFI7lTBkcnnqrUVPFjfdI2Uw1buL7Gg1xV0AXntNTQEyV7ckX872o3asrMKdzsT7NKQqu+IzUR30PdFUtSZ5+ZcgOMBumr6nM3hHZnLlBpswCpb1puswVscCO5fev1tuwNeGCUMYr+WoCqGrDeK8H24lwG8wn9Ed5XUbJeG+n5a06VsPGfPtYsisL7pDzMxoxhhZsogo+BFhjUveKFqpSz301hTAsJMIjpRKN0qgE/pwh6yboeWnXyxsFc+k1y0i/mitYdq9KBto16u8rIdyihT8Gx8odDTxbX/EUUDxbfFHkVijn1z7flyKAvdHq2YGlmtIdlmx7H9bg4r9jQtuWBhverqT7tFuPgdUg0myezRWRL5znMc10OGjAJsKrx8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(33656002)(66556008)(316002)(66476007)(64756008)(76116006)(91956017)(66946007)(5660300002)(71200400001)(26005)(6506007)(186003)(53546011)(2616005)(86362001)(66446008)(83380400001)(37006003)(54906003)(6486002)(6512007)(8676002)(4326008)(6862004)(2906002)(36756003)(478600001)(6636002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?EpRWtH0GUucIdvUdPsm7ofFWDuDBqW399OLd+rT7iDJIwCgUjn9LAs3VfjpX?=
 =?us-ascii?Q?sAy+HO0Z54evZQ8BYts5lyI2t8Yk1XYTp8NVDQ1ZRbhjmgM4Fxb1RkRkDY4P?=
 =?us-ascii?Q?a1+6f5+asZMx2XLLJF5jdulB8VAaggYvEBmd3FZifu1NmNLVBzcpabt5FaP4?=
 =?us-ascii?Q?zRxoN7o/FHonp22XtSJc1Ve4nzVi1fPNhbRi0rgsXn60tUV/P4a9Ut792ULW?=
 =?us-ascii?Q?ZYMztvi1Ov0zpgsXbXpWmLIH+2g1ksYFNIlIkGw5pkliaqukJU/awumeoG7K?=
 =?us-ascii?Q?Ux3MZH7ZlxqDyBjDGc2x8uDCI64uEnASSNbbxMBRnR+B7jcc15ACijeR3MVS?=
 =?us-ascii?Q?oysnW9aOIQ33Ld0XaxyQkfe5xdu4K9eKqTAjvjC2fs3VMRC/jxm9Fz1PQZMG?=
 =?us-ascii?Q?p1Nx7nC0jjJShm+nWs07U+Sx08e6QY+lu0O/8m05fbEu1OabAjxDlUfJ0q0+?=
 =?us-ascii?Q?ZaIZq0+rQuaS1MkL3Sl297QaZRr/GGklLWn5KF8EyAeq51GU+2xH1WU96oJO?=
 =?us-ascii?Q?N8BNsoukuyFgLMtkvhBYbbKD5NNYBeo5Y/PpkLt9iGPvqzseXmQ3FxTt60wN?=
 =?us-ascii?Q?BOLOaX46G9vgobv7GChRPJlydZA919Ls2PZLY0lV0NdGL8mJqW9tnN/4mm+m?=
 =?us-ascii?Q?WEcQUrgVYWP8xpsu54u6dtvg8wrG0n/ZH6fBe7Uh2NRB24WLmI47epH3/Bu7?=
 =?us-ascii?Q?JTwrUKR/NTiGf1C5u1tc1uLQeZYHdCLOTkk3imjGRLsu4VTqCo+ZzmeW2qVj?=
 =?us-ascii?Q?5r4LnJbj4tbUuohHBzwo2/b7Erp8RdItt8/VXqM29Ii167NVqGyr0lMbWPTQ?=
 =?us-ascii?Q?1z5kKXhSAG5MuJiBe1XaFWvz4NtbKdXgBo6lHCMsalvcFVRufzsRxPhV4N+T?=
 =?us-ascii?Q?ZLsPiM0POLidzU9/mSLJRAI8MT9qAs0VuWRd/CJ8CCByPrtoOLamtSzdvjXG?=
 =?us-ascii?Q?EsfVXPTQbDg/vwXRAcWzS51H0XB+8t3BKH3aDtF/FRvHZfpCL6Nn267sFlLX?=
 =?us-ascii?Q?Ue2P?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79753DA0668DBF45A952618DCB218046@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0a8c2f2a-9cd1-489f-56e0-08d89dd6c668
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIQSRq9hW4MF9FMBQtDu0nnjBQnzWeyfssvW1oVWUcV1kjpjy6uohbNAoIjqTBgblDsc9mnWbf1HY3KQPW+vTOhpXMtNekfz3CHQ2+ISxGW90oQBAY6N9EI/9ArIFgXWQlLqOXjouoyb7zd7w4aIpwIsNxXoLCnHNZ7SL3a8d1uZSyn7J/DXm8zG9cGy7Z7gZV/vR/wO6vIGMhcilC/h9YDMBZLK1Pj5EdIL2kTCMNCLl90wlsXCRroDfeoBzZ+k0mv/4A1iCGic9j/WToChvRiHrztCMSI8OEQe8gpxbuHDVIY7vlK9DmDM3O5RS6XXA+moUGhjkk9Y3RI5lILFjJ4vSLvHJqAdx1GGa+1uV8+W6L/Wlap8UpjF3FOrry+njK/WRiyjX6I/wlSvyomWtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(82740400003)(53546011)(83380400001)(6486002)(81166007)(82310400003)(2616005)(6506007)(107886003)(8936002)(54906003)(33656002)(70586007)(2906002)(70206006)(8676002)(36756003)(37006003)(86362001)(6636002)(186003)(26005)(6512007)(478600001)(6862004)(316002)(356005)(4326008)(5660300002)(47076004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:15:45.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603256a8-b8c3-475d-3423-08d89dd6de71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4553

Hi Rahul,

> On 10 Dec 2020, at 16:57, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Replace all Linux compatible device tree handling function with the XEN
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
>=20
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 32 +++++++--------------------
> 1 file changed, 8 insertions(+), 24 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 65b3db94ad..c19c56ebc8 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -101,22 +101,6 @@ typedef unsigned int		gfp_t;
>=20
> #define GFP_KERNEL		0
>=20
> -/* Alias to Xen device tree helpers */
> -#define device_node			dt_device_node
> -#define of_phandle_args		dt_phandle_args
> -#define of_device_id		dt_device_match
> -#define of_match_node		dt_match_node
> -#define of_property_read_u32(np, pname, out)	\
> -		(!dt_property_read_u32(np, pname, out))
> -#define of_property_read_bool		dt_property_read_bool
> -#define of_parse_phandle_with_args	dt_parse_phandle_with_args
> -
> -/* Alias to Xen time functions */
> -#define ktime_t s_time_t
> -#define ktime_get()			(NOW())
> -#define ktime_add_us(t, i)		(t + MICROSECS(i))
> -#define ktime_compare(t, i)		(t > (i))
> -
> /* Alias to Xen allocation helpers */
> #define kzalloc(size, flags)	_xzalloc(size, sizeof(void *))
> #define kfree	xfree
> @@ -922,7 +906,7 @@ static void parse_driver_options(struct arm_smmu_devi=
ce *smmu)
> 	int i =3D 0;
>=20
> 	do {
> -		if (of_property_read_bool(smmu->dev->of_node,
> +		if (dt_property_read_bool(smmu->dev->of_node,
> 						arm_smmu_options[i].prop)) {
> 			smmu->options |=3D arm_smmu_options[i].opt;
> 			dev_notice(smmu->dev, "option %s\n",
> @@ -994,17 +978,17 @@ static void queue_inc_prod(struct arm_smmu_ll_queue=
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
> @@ -1232,13 +1216,13 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_sm=
mu_device *smmu,
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
> @@ -2969,7 +2953,7 @@ static int arm_smmu_device_dt_probe(struct platform=
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


