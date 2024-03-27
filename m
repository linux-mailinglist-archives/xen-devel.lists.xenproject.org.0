Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1088E331
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698545.1090341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTZU-0004q2-5i; Wed, 27 Mar 2024 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698545.1090341; Wed, 27 Mar 2024 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTZU-0004nf-2b; Wed, 27 Mar 2024 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 698545;
 Wed, 27 Mar 2024 13:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTZS-0004nT-Dl
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:44:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ccb4f9-ec40-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:44:00 +0100 (CET)
Received: from DU7P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::15)
 by DB8PR08MB5531.eurprd08.prod.outlook.com (2603:10a6:10:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:43:58 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::f1) by DU7P189CA0012.outlook.office365.com
 (2603:10a6:10:552::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:43:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:43:57 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300");
 Wed, 27 Mar 2024 13:43:57 +0000
Received: from af7ed2f9c7d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE009322-B104-4F91-9E99-1F160F15332F.1; 
 Wed, 27 Mar 2024 13:43:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af7ed2f9c7d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:43:51 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7552.eurprd08.prod.outlook.com (2603:10a6:102:24f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:43:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:43:49 +0000
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
X-Inumbo-ID: 10ccb4f9-ec40-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AcpXWBemYBeIqeh6gsPkaIV0Y8RH18pgQVfW9P7fpPsuSm7JDsnajkB+yatO49wU7+6RjsEziwEU09wjZBVFLOWOWTZeebqHRmLddqyhpGpA9niuoyPN3n51tYqju+a5wh3hefZZo93LK/7VpPaChdgl7oOjEdgyWSg6CkB/O3BcnR2nFruA4bNx3eihCfTCUYcLOWZWF2bAx/dP8rVXT6QYfLeADrq62TbHUQjfo/OOsU0M7wzcgIyvEQB1LBVT9k+I503OCmEYSAHtOsnGcOAekH2iPCpMIbssUc9/mxDcWsHGVfM52D1BvBwkpVv0v4UucWnj410StF6ZU2rREg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDLj7wRklPxfouvU5vbm09pKQSKxZhlgC9SFnOszY2E=;
 b=K7H6DmoL+mTIT369/nZQPZRgGiJj819w5DGJo/Mu568IgBqvTGtpkP5xCpnJIQW2J7dYoYwJEO5RrgX0Ojf5EcViU6SZJGP7wVBNLdRMHdEwtW+hxLsPDNk95uTuWADF6gmMl4s4EvIjSzKSEVWilJ8F4E5Je1tL6VgxB0i1QTcd7pEl3IL8T3bcOjzSWjBSb3IusXVeexZFjsHnBHtGarWAT1rEAKyrAfjUcXM0JQ5tRV6ZqGIsfrbhGnxGvMrSQHGbNI5WwHyKynmBc6bCcZqiP3PggPjkwEIiA08933Gc6+sMGmnJNWgJqBDzRJ1iR87XjVFMXq4Kkpvt2kS30w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDLj7wRklPxfouvU5vbm09pKQSKxZhlgC9SFnOszY2E=;
 b=IwbShjZCEDChMaUTU5bP99wFET0akxJ8WzlYk/HNaqdPCPn8PCwPEs154UQobv1rmwUEVbnwHDDaMpB6VUYIEJSdo9Cwy2Wi9OkoqZoWOJqxHTmbNrMN4Je6l3ydvU4rbBwDgIV6pJ/YGqpHDCh/u77+WqwUqUL6hl5ABAxO/WI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0357f2a63b0b631e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4IA1yeDi9eTjC40ZQZ2bcsZyQAE0Jyp5pA0gY2SM+PLk08RDoLtnxZoKA6u1POEXKMt7eaol4Hww9eGbpAvJb6NtYgFWo4UD3tzAU+Cq3wBbToExKQxJN8icqgJvJ2vBNiznyEShVnYragL3iSWX0wZWKFK2cnFP/gSYr2txmVFbEyuw5x9QExRruil2BeiZmwmAAyW9qsXu4IXrfl0gsDBO0cWd7p8of5pMbjLCHWMmAQSIUU9bAHwkwnb2m0JES7QG1T8d/mK+I4LbhHprQugKQ7zPqdclvtS6gWCqdrdsm6k8AZi1eBhy9SZKKF71RpzecTtUqrzssTxRIeJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDLj7wRklPxfouvU5vbm09pKQSKxZhlgC9SFnOszY2E=;
 b=eqW2yi8EBEK0xFlLFOf1geN8RTd6tbg09d+wfT2ahEecrPGmahznDUjM19hRieskKmmcud8ugAF5GUrduQbvSBzqPIQtF0W3ITlRoD34OE8qZWiEGYPTXiRUSp1bT89UqVGl/tF52QiR5c0ok8ioBzjdQaIO+vY7jtF9Ak4lo7Z1bsKTxau/T/Z7j9I71aTt8Pu0Yi1Uhakmoz+bpAGJLKH+n5G8zP5qWAg2yFZOom+XMFWicFT7Zshsqz0KiTADHJk9MxWgOuFf5XTc/9O2oNhn8eiQza0U28DbkVjcNVfsDxIcYpe+aJnle0lM5CgU2/zLci6wpmow0utO+odCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDLj7wRklPxfouvU5vbm09pKQSKxZhlgC9SFnOszY2E=;
 b=IwbShjZCEDChMaUTU5bP99wFET0akxJ8WzlYk/HNaqdPCPn8PCwPEs154UQobv1rmwUEVbnwHDDaMpB6VUYIEJSdo9Cwy2Wi9OkoqZoWOJqxHTmbNrMN4Je6l3ydvU4rbBwDgIV6pJ/YGqpHDCh/u77+WqwUqUL6hl5ABAxO/WI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 5/6] xen/arm: ffa: separate rxtx buffer routines
Thread-Topic: [XEN PATCH 5/6] xen/arm: ffa: separate rxtx buffer routines
Thread-Index: AQHafphRyx1suD/hEEaNU2WoRq6yHLFLnFoA
Date: Wed, 27 Mar 2024 13:43:49 +0000
Message-ID: <9C23C915-E25B-4BDF-B33D-68FF339BFE6B@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-6-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-6-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7552:EE_|DB5PEPF00014B98:EE_|DB8PR08MB5531:EE_
X-MS-Office365-Filtering-Correlation-Id: d9775323-c623-477e-5f14-08dc4e63f3d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O43Zd/uA9EjBuGeBP1Zgdnxbqif5GeomzOGELkoSGb5Dcr87DNjobu7OvNYnEwY2N37kFSL9yKEJlWC9p/pFtwxlf3cJX24hBs2z+91GVhyYLWuNiNSBgBSZvigTfLIfi7boZRxlZ12lWVoaMf0JYmG8lURS3OCVJSO12SuaMiImP6cR+UrtoVkKje5PPFnfjLOUJy8wsuc+FEwa96sRbzmLUqiWUIQr9Q69UsG/RJijt3TLsxjg/sX6Ojeq/pSze/n6dkj2WcTeR9eTjzXzMUM+z3E0hU9dCvF2cGTZyyWJfpvHmRpcjLIojdIHWNG+XLF3RiugNbjRY4aHy4CTKt14MRiilccwyNXiacERGgDNCtqJ+qsrNdIXfjXlF7Ni3Cw4JaD40qsVsiMptqhbcp0wZb4kGO6Wld0CoW0nn81TlIdYyBj33JmVdlhBFSsXCTDnhuXIdmWwb4imnRWSHIi2h9Rv3zwhz8FXE/et4HFZ708xTiVQnEdKFGfmPgQVvWqLeP/wySP/Zs7HWhuAVWCwGJ92ztYjUztGPLXMv+KbmQByTvItI1gfZwAfQr1g2WOSVh8iwMRk25sbu69FHBIMpcGOF5DGSHlTxf+hHRRZ8R1X07h5Y9dsnZybcHZ1J3yBCC+U1xzZ8scRNHDCs4F5bIvUMtg9HrqvTFVt+uOKdKpl844eGBSmQvDK7t0rhrv15cOMQMFKpdVthU+EvBxo9jJHn01C89EyKTYsClA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A48FAF995DCFA647AD192F5B65FF89F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c46c027e-e59e-4dd9-503f-08dc4e63ee99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7pjTlzLs/nlSYyDWdIuxQkCdqwh3CoH8hVyMw1hcICW4GeZ0XkQRNpfoNFLfVScWJz4DRT/JQra2/APNov+V6bJvlcv+NMZP42rbeCoj2v35vBHy0XSCqWX1qYPM9M/SHLUqlvIHhesOwStiiPZS4yCJPLeONYnsNVCJtRf82yB0/XrCcTkA/3/XO+GfzyNVD5FloDYZVIdPoo3O+ijOg/DRgO6Gib7DN5V/fUAYJ7jNIO+4GQ9NB13J8BnPGYqvxsYxFAyHZN3Yj9ZVUlRQ3ZBw842gJXqZumCXZreggDnvDChzTUldVKSIW1HiBvBotLIvqUhlk0e6Qa+IbVPwTXLPiyjOf7WgSPJ6yxLXqGsAjrFgSqqbQuQYEKI9lXs1xEjKH4c+nbuv9EnS2YVKYzWGytKkupT5qleQkgdYgUvmz2MxmV/jzYKUd/ieFw/wrmiiuMC7slttbVbDG2AQ/LmgS8LdM4M7dlISTwTY9H2/tmiyYI7VxeoXuLjt27z/uKze1S/+EFp6V7qejNvy5ZmTDk8UWxGMJHWX89sySgxy0HyLRXP675sdsMyRQBsEIw3R2D7KzwuHB5AG9SFXomTm6C0Eh8eIvLFt4+5ibJqcnBt5x+vYLDptpIZ4FLHQD+ALr5zWauaC8KpIQDFLP0taGikZxp+9TVmecRgR/q/QfW39fE4JwEvpZE1wc537DrgKK77MhcCwBarhr1ovXwlblgRUcWXNdNZA/Py6lgJZK6R2buKQHo2kZcZFSZ1O
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:43:57.8859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9775323-c623-477e-5f14-08dc4e63f3d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5531

Hi Jens,

> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Move rxtx buffer routines into a spearate file for easier navigation in
> the source code.
>=20
> Add ffa_rxtx_init(), ffa_rxtx_destroy(), and ffa_rxtx_domain_destroy() to
> handle the ffa_rxtx internal things on initialization and teardown.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/Makefile      |   1 +
> xen/arch/arm/tee/ffa.c         | 174 +-------------------------
> xen/arch/arm/tee/ffa_private.h |   7 ++
> xen/arch/arm/tee/ffa_rxtx.c    | 216 +++++++++++++++++++++++++++++++++
> 4 files changed, 229 insertions(+), 169 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_rxtx.c
>=20
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index be644fba8055..f0112a2f922d 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,5 +1,6 @@
> obj-$(CONFIG_FFA) +=3D ffa.o
> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> +obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 7a2803881420..4f7775b8c890 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -65,26 +65,6 @@
>=20
> #include "ffa_private.h"
>=20
> -/*
> - * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> - * structs ending with _1_1 are defined in FF-A-1.1-REL0.
> - */
> -
> -/* Endpoint RX/TX descriptor */
> -struct ffa_endpoint_rxtx_descriptor_1_0 {
> -    uint16_t sender_id;
> -    uint16_t reserved;
> -    uint32_t rx_range_count;
> -    uint32_t tx_range_count;
> -};
> -
> -struct ffa_endpoint_rxtx_descriptor_1_1 {
> -    uint16_t sender_id;
> -    uint16_t reserved;
> -    uint32_t rx_region_offs;
> -    uint32_t tx_region_offs;
> -};
> -
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> @@ -145,12 +125,6 @@ static bool check_mandatory_feature(uint32_t id)
>     return !ret;
> }
>=20
> -static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> -                            uint32_t page_count)
> -{
> -    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> -}
> -
> static void handle_version(struct cpu_user_regs *regs)
> {
>     struct domain *d =3D current->domain;
> @@ -166,127 +140,6 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>     ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> -static uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> -    register_t rx_addr, uint32_t page_count)
> -{
> -    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -    struct page_info *tx_pg;
> -    struct page_info *rx_pg;
> -    p2m_type_t t;
> -    void *rx;
> -    void *tx;
> -
> -    if ( !smccc_is_conv_64(fid) )
> -    {
> -        /*
> -         * Calls using the 32-bit calling convention must ignore the upp=
er
> -         * 32 bits in the argument registers.
> -         */
> -        tx_addr &=3D UINT32_MAX;
> -        rx_addr &=3D UINT32_MAX;
> -    }
> -
> -    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> -    {
> -        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
> -               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> -        return FFA_RET_INVALID_PARAMETERS;
> -    }
> -
> -    /* Already mapped */
> -    if ( ctx->rx )
> -        return FFA_RET_DENIED;
> -
> -    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
> -    if ( !tx_pg )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    /* Only normal RW RAM for now */
> -    if ( t !=3D p2m_ram_rw )
> -        goto err_put_tx_pg;
> -
> -    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> -    if ( !tx_pg )
> -        goto err_put_tx_pg;
> -
> -    /* Only normal RW RAM for now */
> -    if ( t !=3D p2m_ram_rw )
> -        goto err_put_rx_pg;
> -
> -    tx =3D __map_domain_page_global(tx_pg);
> -    if ( !tx )
> -        goto err_put_rx_pg;
> -
> -    rx =3D __map_domain_page_global(rx_pg);
> -    if ( !rx )
> -        goto err_unmap_tx;
> -
> -    ctx->rx =3D rx;
> -    ctx->tx =3D tx;
> -    ctx->rx_pg =3D rx_pg;
> -    ctx->tx_pg =3D tx_pg;
> -    ctx->page_count =3D page_count;
> -    ctx->rx_is_free =3D true;
> -    return FFA_RET_OK;
> -
> -err_unmap_tx:
> -    unmap_domain_page_global(tx);
> -err_put_rx_pg:
> -    put_page(rx_pg);
> -err_put_tx_pg:
> -    put_page(tx_pg);
> -
> -    return ret;
> -}
> -
> -static void rxtx_unmap(struct ffa_ctx *ctx)
> -{
> -    unmap_domain_page_global(ctx->rx);
> -    unmap_domain_page_global(ctx->tx);
> -    put_page(ctx->rx_pg);
> -    put_page(ctx->tx_pg);
> -    ctx->rx =3D NULL;
> -    ctx->tx =3D NULL;
> -    ctx->rx_pg =3D NULL;
> -    ctx->tx_pg =3D NULL;
> -    ctx->page_count =3D 0;
> -    ctx->rx_is_free =3D false;
> -}
> -
> -static uint32_t ffa_handle_rxtx_unmap(void)
> -{
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    if ( !ctx->rx )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    rxtx_unmap(ctx);
> -
> -    return FFA_RET_OK;
> -}
> -
> -static int32_t ffa_handle_rx_release(void)
> -{
> -    int32_t ret =3D FFA_RET_DENIED;
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    if ( !spin_trylock(&ctx->rx_lock) )
> -        return FFA_RET_BUSY;
> -
> -    if ( !ctx->page_count || ctx->rx_is_free )
> -        goto out;
> -    ret =3D FFA_RET_OK;
> -    ctx->rx_is_free =3D true;
> -out:
> -    spin_unlock(&ctx->rx_lock);
> -
> -    return ret;
> -}
> -
> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> {
>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -522,8 +375,7 @@ static int ffa_domain_teardown(struct domain *d)
>     if ( !ctx )
>         return 0;
>=20
> -    if ( ctx->rx )
> -        rxtx_unmap(ctx);
> +    ffa_rxtx_domain_destroy(d);
>=20
>     ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
> @@ -538,7 +390,6 @@ static int ffa_relinquish_resources(struct domain *d)
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> -    int e;
>     unsigned int major_vers;
>     unsigned int minor_vers;
>=20
> @@ -596,36 +447,21 @@ static bool ffa_probe(void)
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
>=20
> -    ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> -    if ( !ffa_rx )
> +    if ( !ffa_rxtx_init() )
>         return false;
>=20
> -    ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> -    if ( !ffa_tx )
> -        goto err_free_ffa_rx;
> -
> -    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
> -    if ( e )
> -    {
> -        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> -        goto err_free_ffa_tx;
> -    }
>     ffa_version =3D vers;
>=20
>     if ( !ffa_partinfo_init() )
> -        goto err_free_ffa_tx;
> +        goto err_rxtx_destroy;
>=20
>     INIT_LIST_HEAD(&ffa_teardown_head);
>     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0)=
;
>=20
>     return true;
>=20
> -err_free_ffa_tx:
> -    free_xenheap_pages(ffa_tx, 0);
> -    ffa_tx =3D NULL;
> -err_free_ffa_rx:
> -    free_xenheap_pages(ffa_rx, 0);
> -    ffa_rx =3D NULL;
> +err_rxtx_destroy:
> +    ffa_rxtx_destroy();
>     ffa_version =3D 0;
>=20
>     return false;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 6b32b69cfe90..98236cbf14a3 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -263,6 +263,13 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
>                                       uint32_t w4, uint32_t w5, uint32_t =
*count,
>                                       uint32_t *fpi_size);
>=20
> +bool ffa_rxtx_init(void);
> +void ffa_rxtx_destroy(void);
> +void ffa_rxtx_domain_destroy(struct domain *d);
> +uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +     register_t rx_addr, uint32_t page_count);
> +uint32_t ffa_handle_rxtx_unmap(void);
> +int32_t ffa_handle_rx_release(void);
>=20
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> new file mode 100644
> index 000000000000..661764052e67
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -0,0 +1,216 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/domain_page.h>
> +#include <xen/mm.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +/* Endpoint RX/TX descriptor defined in FF-A-1.0-REL */
> +struct ffa_endpoint_rxtx_descriptor_1_0 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_range_count;
> +    uint32_t tx_range_count;
> +};
> +
> +/* Endpoint RX/TX descriptor defined in FF-A-1.1-REL0 */
> +struct ffa_endpoint_rxtx_descriptor_1_1 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_region_offs;
> +    uint32_t tx_region_offs;
> +};
> +
> +uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +     register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        /*
> +         * Calls using the 32-bit calling convention must ignore the upp=
er
> +         * 32 bits in the argument registers.
> +         */
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }
> +
> +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> +    {
> +        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
> +               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> +        return FFA_RET_INVALID_PARAMETERS;
> +    }
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +
> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_rx_pg;
> +
> +    tx =3D __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx =3D __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx =3D rx;
> +    ctx->tx =3D tx;
> +    ctx->rx_pg =3D rx_pg;
> +    ctx->tx_pg =3D tx_pg;
> +    ctx->page_count =3D page_count;
> +    ctx->rx_is_free =3D true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +
> +    return ret;
> +}
> +
> +static void rxtx_unmap(struct ffa_ctx *ctx)
> +{
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->rx_is_free =3D false;
> +}
> +
> +uint32_t ffa_handle_rxtx_unmap(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx->rx )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    rxtx_unmap(ctx);
> +
> +    return FFA_RET_OK;
> +}
> +
> +int32_t ffa_handle_rx_release(void)
> +{
> +    int32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !spin_trylock(&ctx->rx_lock) )
> +        return FFA_RET_BUSY;
> +
> +    if ( !ctx->page_count || ctx->rx_is_free )
> +        goto out;
> +    ret =3D FFA_RET_OK;
> +    ctx->rx_is_free =3D true;
> +out:
> +    spin_unlock(&ctx->rx_lock);
> +
> +    return ret;
> +}
> +
> +static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> +                            uint32_t page_count)
> +{
> +    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> +}
> +
> +static int32_t ffa_rxtx_unmap(void)
> +{
> +    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
> +}
> +
> +void ffa_rxtx_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( ctx->rx )
> +        rxtx_unmap(ctx);
> +}
> +
> +void ffa_rxtx_destroy(void)
> +{
> +    bool need_unmap =3D ffa_tx && ffa_rx;
> +
> +    if ( ffa_tx )
> +    {
> +        free_xenheap_pages(ffa_tx, 0);
> +        ffa_tx =3D NULL;
> +    }
> +    if ( ffa_rx )
> +    {
> +        free_xenheap_pages(ffa_rx, 0);
> +        ffa_rx =3D NULL;
> +    }
> +
> +    if ( need_unmap )
> +        ffa_rxtx_unmap();
> +}
> +
> +bool ffa_rxtx_init(void)
> +{
> +    int e;
> +
> +    ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> +    if ( !ffa_rx )
> +        return false;
> +
> +    ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> +    if ( !ffa_tx )
> +        goto err;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> +        goto err;
> +    }
> +    return true;
> +
> +err:
> +    ffa_rxtx_destroy();
> +
> +    return false;
> +}
> --=20
> 2.34.1
>=20


