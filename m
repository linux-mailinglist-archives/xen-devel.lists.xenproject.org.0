Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9B2D765F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 14:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50582.89299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniHc-00019A-RS; Fri, 11 Dec 2020 13:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50582.89299; Fri, 11 Dec 2020 13:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kniHc-00018j-N5; Fri, 11 Dec 2020 13:16:28 +0000
Received: by outflank-mailman (input) for mailman id 50582;
 Fri, 11 Dec 2020 13:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df1x=FP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kniHb-00018Z-Ct
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 13:16:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8addfdb6-df57-4ca3-b5a5-97dd1ed240c1;
 Fri, 11 Dec 2020 13:16:25 +0000 (UTC)
Received: from AS8PR04CA0262.eurprd04.prod.outlook.com (2603:10a6:20b:330::27)
 by DB6PR0801MB1752.eurprd08.prod.outlook.com (2603:10a6:4:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 13:16:23 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::f2) by AS8PR04CA0262.outlook.office365.com
 (2603:10a6:20b:330::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 13:16:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 13:16:22 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Fri, 11 Dec 2020 13:16:22 +0000
Received: from a45c0b59d6f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3D06D0D-D44A-4336-A657-AC0CCBD08270.1; 
 Fri, 11 Dec 2020 13:16:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a45c0b59d6f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 13:16:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 13:16:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 13:16:00 +0000
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
X-Inumbo-ID: 8addfdb6-df57-4ca3-b5a5-97dd1ed240c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x7W0wue6NMEBQWtTlpsdnXGUyktP2p2dn+tYcWezpU=;
 b=Ho8aZRBILnmP7WRPqvLCCts6Xi+1VZh9+MffvGabsW+1o4VABogq5FsK2N43kaS/+rUCJiVQ7R/bwxiWtueS8fhrMnhE2kr3JotFi5ANHA+4isZV/q02E0lWWmrYjqnlqS/htAmkDYmtVogJn+ZpW0giR9Dvkg8xjFAzY6SkeH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19b4176c48bab463
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGNAGnx7GNK0RTq0BraL0j0sHIH3GO5W9B4E/vmxtzgRP18b5tMReGxL5pxRGYpXAluWPmxRlZEwqbKM/FR6/swJpLzLV1dIciQ0YAfRHmTiDaf/655AYeowby2ialHkRnKywumjIsacOx20M+WD34q8gOdVxoNs0RdjOYx+ITySHAKrzYVwjmdmU46j73BHWjCWyJdmWCtFK11veP5/Zu43n32zSi3kkI+PAJoxR1/PWAr1gKOghC23jTD3lmmO8S+l/mnCZl7Nfxxq4v2IRbivY7R5/6xGKJqGNjZ0f/C7qzfwj8ELpv6EfGbI5WjG4+wJSefY8Dvw8m4ACji1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x7W0wue6NMEBQWtTlpsdnXGUyktP2p2dn+tYcWezpU=;
 b=IrOyv0ZXZ9+RUiIN+Vvbuz7k0qOB/0j6F22xQ1ld284ZPpbGM8VlXgnP1ab4N5iuGx0/5JkPRu9DAeyIlSxPwvq8gMw4pSa+RDRZTsaGfyAqLZ9YeO6bwpLTk96dWayaQQWpj+zKqFSBzqn8Rz6nrQK/ucyTjVzP9wa7muuw2+HOXQQ/W/cbgrhnqtk40xpXm4ARexrnuDlBG752y0MAl5EkX3lPGNCKQOvA+4DQDFUwsGleSWAMLV45cbGBrkv4ph1d7imur62dIuz90GitLCVXiuVhgYiuKvfgC4FfTh6J09i58g4+zbcxAExDUPZMtPiBaGoy82PKuPwpWKWLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x7W0wue6NMEBQWtTlpsdnXGUyktP2p2dn+tYcWezpU=;
 b=Ho8aZRBILnmP7WRPqvLCCts6Xi+1VZh9+MffvGabsW+1o4VABogq5FsK2N43kaS/+rUCJiVQ7R/bwxiWtueS8fhrMnhE2kr3JotFi5ANHA+4isZV/q02E0lWWmrYjqnlqS/htAmkDYmtVogJn+ZpW0giR9Dvkg8xjFAzY6SkeH4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Topic: [PATCH v3 6/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Index: AQHWzxYNKr+sDTzECkSEC1bUGUlHeKnx4V0A
Date: Fri, 11 Dec 2020 13:16:00 +0000
Message-ID: <7803EA32-61B6-443D-9E1D-32789659DBF0@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <91b9845a03068d92aeaaa86fa67d4d06b2824652.1607617848.git.rahul.singh@arm.com>
In-Reply-To:
 <91b9845a03068d92aeaaa86fa67d4d06b2824652.1607617848.git.rahul.singh@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32e64e99-436e-48ac-4d90-08d89dd6f4b0
x-ms-traffictypediagnostic: DB6PR08MB2693:|DB6PR0801MB1752:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1752B85FB14ED977C1DC6F799DCA0@DB6PR0801MB1752.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F4EME2C/KhUMzvzts1Ni0zGTfw4xRycAK4boMCTCpzfk/v6PRfJfyehZIx6obkxN/iQluKHPlRAdsD2Pt2nsSveSGTmZ8HwkS9cytk8VgjIkux/VApW2ECFbOvsA3j+w6STiLx2GbH8GkhdP5MPdK1sqMZsT2c2I7AOVwszQ8UGQCsRdX2M/A9eYq8PsII38JEQSEyVPRWHmhT4JBqqGcwEPqPFUc+rmIY+ocRrDY7Yx0NtFZs5EU+W/GFE5IUC45oKFyUkSXD4bl3LLB2+W6aS7Mmkv0vHuNg/P4CwDrOKMAZDOuGTnWQ4T56rJZkNznBZTZig6R912xZO9VRGH5rgxTytD3lvtIZcD6VozdvZgg3jo75+H1arhE4x318tt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(33656002)(66556008)(316002)(66476007)(30864003)(64756008)(76116006)(91956017)(66946007)(5660300002)(71200400001)(26005)(6506007)(186003)(53546011)(2616005)(86362001)(66446008)(83380400001)(37006003)(54906003)(6486002)(6512007)(8676002)(4326008)(6862004)(2906002)(36756003)(478600001)(6636002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?o9MoOfM+XlTpdDxbpV6IG0kCMktbAfB4HRAGimD2zo0DunkQopqY6A8lLICK?=
 =?us-ascii?Q?ptpT0s6Cy6/sIJb9pkGpzkYBMI9FSgeFRU0iBuHwEg0Ju4sUm12juSCyjfr3?=
 =?us-ascii?Q?IITs7WcFIela3Hhp0QC3VfgH+S99yI5MEpnnf7MMZcjKj+6/EOP6lgJYyC8t?=
 =?us-ascii?Q?j2yaaC9JbgnatZqgmzo7uzMFkgIxsyTG4UtC0HasML69NVIDiqQoFThg9JQL?=
 =?us-ascii?Q?MHFHULrcZcs45Q0dznwglNETNFf9EfQHgnsJXTA4o+IEzP6CxNdhxGmmQiet?=
 =?us-ascii?Q?z1mTi9gJ4qxPlVjHKqcLF9dnMR3fmAk1lqIJYUA9CYFduDh6APxRjwu2CXKV?=
 =?us-ascii?Q?QJ2VhXZSUaCX6D4AVZSlHoAFuKivjm49g6AFrpYwqTpFz19i56dI1u7nvLPZ?=
 =?us-ascii?Q?rOQX+WpMoGATcFnexzjYmd5IsVAYqF2otqhfuEDDNSMokxgiSOtCc80Vh5Z/?=
 =?us-ascii?Q?HQpTEYP8WA1d1nIkI3p/SuzNziZEHGbapMTFffo79XCRAyYOWONgb4jViNkl?=
 =?us-ascii?Q?/jzxTK3Kzl1TKXt42h/rEhyAMBc4cBQQaiPhLaRc4S+UmVHIAG4z/xO3/sz1?=
 =?us-ascii?Q?1HJjUnH5fXih8sCQwQepGO+Hk8z9NjIGHIiLDQ7sZaUUJGPag1MXiRxHh7or?=
 =?us-ascii?Q?2Xm1lafxqKdhtLBIERMpZTWCagKX3fmox1Qzotfx4+9fPOjWp4sJjPiGUasQ?=
 =?us-ascii?Q?cexPqhk89DO46J335U8IevWzuWNp8NVD7vvC3yyDC/JIgUcklBdbsv7VFaXv?=
 =?us-ascii?Q?pT+xGkhxdUQV1Xs55s+uQOaQ61z7TFnhgswqzSCHuTNSZZNdgoU/GrctyOXh?=
 =?us-ascii?Q?Iw0ydQn0lRXHrgtgFVFEQiIE3iIbNKqUIMpEUYQTI2IvY8c/tW7TI6jvjBjo?=
 =?us-ascii?Q?01uKTxWoQYrRukN3dVF3f1PF/YjTW+SsDFIZCz6/KBrQElXOSzP6oImLZLWO?=
 =?us-ascii?Q?Jw3mKThCy1d6obd3uzpjMNXqPhBCN+Ko6x7Jn7jMszzPsIbQeIb+u3vlSF6b?=
 =?us-ascii?Q?vMEg?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E722718FDC41C4E95104B2D317B55FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59f8c60a-8fd6-4ae6-c0b5-08d89dd6e7a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Pm0ViqwBnjBS0cjFcNVB0RTpoIRwddGhK2YO2dAfz4wsKpOTE9FJB5SYOsUWM2J+AChMlijkV2la+R7doby/RXAdkUPC3yrwyJ7AUrX6s61KpF5h1QvGMPTWaC99/BTMhvpDvE63lj9VpZ6ZEFGhM/VP/Ev6HzgV/AVEzSRzJryRrSHncbtMa//5wiB2Yxzxt7LuOtF9BtrPv/pv8JCePGQfv11BoorHv8YiJLjOGNNMher9YvapmOCHNlXz9O19Wg+BTMJUFGGnxXPf0sye4ryQbvngSdgyHSyqgyAOv2fVFOAGIfkC0yK7bmMhkhP5lYlZ/EuAcqMz3K6SECfIf3RZJfPcV0wbUfdDJjWeURCWIwFZi/t4xJHx07TkiXwum0/sLq2Ny06WealCtd1zg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(336012)(5660300002)(30864003)(6636002)(316002)(47076004)(6486002)(186003)(54906003)(83380400001)(53546011)(356005)(6512007)(82310400003)(37006003)(82740400003)(478600001)(6862004)(8936002)(81166007)(26005)(2616005)(36756003)(6506007)(33656002)(70206006)(8676002)(86362001)(2906002)(107886003)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:16:22.5842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e64e99-436e-48ac-4d90-08d89dd6f4b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1752

Hi,

> On 10 Dec 2020, at 16:57, Rahul Singh <Rahul.Singh@arm.com> wrote:
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
> Changes in v3:
> - Commit message is updated to add more detail what is removed in this
>  patch.
> - remove instances of io_pgtable_cfg.
> - Added back ARM_SMMU_FEAT_COHERENCY feature.
>=20
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 475 ++------------------------
> 1 file changed, 21 insertions(+), 454 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 0f16c63c49..2966015e5d 100644
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
> @@ -1493,7 +1499,6 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_=
domain *smmu_domain,
> 	return ret ? -ETIMEDOUT : 0;
> }
>=20
> -/* IO_PGTABLE API */
> static void arm_smmu_tlb_inv_context(void *cookie)
> {
> 	struct arm_smmu_domain *smmu_domain =3D cookie;
> @@ -1514,86 +1519,10 @@ static void arm_smmu_tlb_inv_context(void *cookie=
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
> @@ -1603,12 +1532,6 @@ static struct iommu_domain *arm_smmu_domain_alloc(=
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
> @@ -1640,9 +1563,6 @@ static void arm_smmu_domain_free(struct iommu_domai=
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
> @@ -1651,21 +1571,20 @@ static void arm_smmu_domain_free(struct iommu_dom=
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
> @@ -1680,49 +1599,15 @@ static int arm_smmu_domain_finalise(struct iommu_=
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
> @@ -1939,76 +1824,6 @@ out_unlock:
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
> @@ -2019,8 +1834,6 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
evice *smmu, u32 sid)
> 	return sid < limit;
> }
>=20
> -static struct iommu_ops arm_smmu_ops;
> -
> static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> {
> 	int i, ret;
> @@ -2028,16 +1841,12 @@ static struct iommu_device *arm_smmu_probe_device=
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
> @@ -2083,153 +1892,11 @@ err_free_master:
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
> @@ -2929,16 +2596,6 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
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
> @@ -3018,43 +2675,6 @@ static unsigned long arm_smmu_resource_size(struct=
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
> @@ -3147,68 +2767,15 @@ static int arm_smmu_device_probe(struct platform_=
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


