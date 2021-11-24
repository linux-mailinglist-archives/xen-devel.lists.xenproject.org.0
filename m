Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7245B8BE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230317.398163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpq11-0001mU-Vb; Wed, 24 Nov 2021 11:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230317.398163; Wed, 24 Nov 2021 11:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpq11-0001jt-ST; Wed, 24 Nov 2021 11:00:39 +0000
Received: by outflank-mailman (input) for mailman id 230317;
 Wed, 24 Nov 2021 11:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDHO=QL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mpq10-0001jn-OE
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:00:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c138bb08-4d15-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 12:00:37 +0100 (CET)
Received: from DB6PR07CA0180.eurprd07.prod.outlook.com (2603:10a6:6:43::34) by
 AS4PR08MB7430.eurprd08.prod.outlook.com (2603:10a6:20b:4e2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15; Wed, 24 Nov 2021 11:00:36 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::b) by DB6PR07CA0180.outlook.office365.com
 (2603:10a6:6:43::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Wed, 24 Nov 2021 11:00:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 11:00:34 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Wed, 24 Nov 2021 11:00:27 +0000
Received: from 2918ea206796.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC9953F4-CE83-416D-8D9C-A92A874E678C.1; 
 Wed, 24 Nov 2021 11:00:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2918ea206796.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 11:00:11 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1939.eurprd08.prod.outlook.com (2603:10a6:203:4c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:00:10 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%9]) with mapi id 15.20.4649.026; Wed, 24 Nov 2021
 11:00:09 +0000
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
X-Inumbo-ID: c138bb08-4d15-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuKyEtE1j8hPGd8AmGbiDWEIBIkmHFmIrj952QgirMM=;
 b=x76hN2k9bp0WokXocfzSsdRnDm03xwYPuYu1FiySSeeFw1SplGuSx6ofl+fXcUtnnadFBozzOZNAvHb9AREDQZJBd8Zrd/2f0O8vh4ex98vu5RrJj66+9ydEAP7GKCMc7L3ugRJ2W4UhmQI2dI/kyJy8RPc1GS4NpC05BAGc0AI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: adbb343335619ebe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAVEL+OAsmLAz8+pVgEVQMIM+FbMz+CfUHX6VSCfqshXTAtcz2NzZbXZy9UHosbaCeRYtuIlrFltswCogEzDS+OmapJFKqOHIr2ZClgNKtPTFMsnr35vRdY3tV408W2bXvpZXJvMK36LxyVSff1bbskuMFtCxiMzUyoPtrQJZbQq8UOL0Fd5T0ZokjaUcMtOCPZH2HiHrKunAXrH1yIHDwn+ik0m7DA0+2cJC6fsTW4ahdgA+G0tsmgPtuA1MfpJ/bSdteW5FQOoGkcv8ZF7BxZ70Xq62fqjIfPN0jbWSa03l71Byqnrg8gGvrkR/0KZKMWPzRypKR0g9kJvFTUJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuKyEtE1j8hPGd8AmGbiDWEIBIkmHFmIrj952QgirMM=;
 b=Nwb2nwteci/ltDqOdeDztAHPh3a5YCHQfKdHbRL1Et9CRXCaMbkmFqYo02VURRd9Oaigw7kOybR4VUGX8CVQz00BnGnU8NSc0yXmu8yrSaYu7c6xl2XtNA/6LETQLRzLRwRPbrP4nhob347sFkMDIDPai64SuDH+Xua4uIVmhpSZEeHoupgRUz0fLr00FDsAS2ff0Y1shqsJ6J/sGCVRbU+hJbJYF0THL9SnTnHFf03ta8QOKDfFtJ47o2xFWfLRegSbl7wHXSoL+eaEutkIlx1/eBeEE+InlSwvWRcedSKebnk4xgwsuI+9IYpKEAx7Xy/pWiW70rGhHWVQcOZUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuKyEtE1j8hPGd8AmGbiDWEIBIkmHFmIrj952QgirMM=;
 b=x76hN2k9bp0WokXocfzSsdRnDm03xwYPuYu1FiySSeeFw1SplGuSx6ofl+fXcUtnnadFBozzOZNAvHb9AREDQZJBd8Zrd/2f0O8vh4ex98vu5RrJj66+9ydEAP7GKCMc7L3ugRJ2W4UhmQI2dI/kyJy8RPc1GS4NpC05BAGc0AI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Topic: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Index: AQHX4QlLPJHRFd6iGEayNemX9MfPqawSgtAA
Date: Wed, 24 Nov 2021 11:00:09 +0000
Message-ID: <8FB59B18-9750-4039-9098-1B55FA36B922@arm.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-2-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-2-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c9700e27-502c-4f70-2c87-08d9af39a3ab
x-ms-traffictypediagnostic: AM5PR0801MB1939:|AS4PR08MB7430:
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB7430B7F5951FF1ED0B0BBCEEFC619@AS4PR08MB7430.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mVniJEs32k5UtNKj+BkGaCxkllSbtgAFOH2P1if6s37COiAXFTWNLXKpQFUArZm70LQnvOAWWBmj7ZvheqzFuM4TT4B+QpHflE3Mq1zrwfXPDZR3nE1gOOplm/029ky5/wseGLCk5bezXbR1QrSWeFvs8lCl6X/Vs38Pe36FY164tYiiUuALaNFqfytcXH3TodwE0CPVRsLKIUaKtbcmPBOIHzjuDESt5cKJAZ/KbRfAF79vj3cuw4bx7YyVZhFJ9YvX4C967khI+l95IawL/PG28wVOGicIkIoCFiXwB3FWWNcL00Jea4YOqe4r/Xv3H7eDZH1Oy67dQbQNjtX11fXA8XP7C1veSYEm3350HlXVacQkw7LeDlxnWBAyiJEnhGKBKBBXQVQHQjXsZuqxhkvcmPoe1X1gjcW7E/df3P9+wjz+M88YD+7uKZ97s6rAsw5nmtnNFSwNY58hLBsuJ9JMY7gK4aehnXgv+A8GEWWFckJ5LSWAAOBvtso+cCBXYtG0MJEIplgbIlqu4hEVx6+y8zUTO0STA73mxJU3INLfd2RaNoumvTupwgH/0Qq3+FoeymzAIIxu/eU5mLFfJl3n2C8JlMuiGb4C4kCfs67g4HcB5szVjTTEA4s2+5ZKXPOlRwgyJEKDRq0mPx1ZLpXTCulRzaMnO4I7vRxfx/twxIrLIF1v6DHe44jCRPXG9iZCLs4io3/TX6M3wAIig+vUiJJqtsVmztksOzHzad0HrQhwPhxtdzk0Lo4Ud0FC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33656002)(2616005)(6486002)(38100700002)(64756008)(38070700005)(26005)(2906002)(54906003)(122000001)(66556008)(76116006)(91956017)(186003)(66476007)(66446008)(6916009)(4326008)(5660300002)(7416002)(36756003)(53546011)(6506007)(71200400001)(6512007)(508600001)(316002)(8676002)(66946007)(83380400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8D084265A0AA2D46BF7899DEC6C2FE18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1939
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	034b0ec4-0a84-4c37-74ab-08d9af39951d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JvlUf+36Zjz53XJ1pV0Ajx6uBYH25GqExvnYdOS2WltvJueBhfGtTwWZebOs+z2FFghjpfX9E7dZUc3eIWfYQ9VA7lLWkevfZnIxSoppc4DC6bojk7+cbazNSd1AHYIGApqN1tcGsPMnxPYuvOc4Fz+ZtUJG6Y51HW5Nqsj9RvShorxCBa1yCqpWw9tWR343jMxV5mcntjllUn/mpY5JG0qzcqgWpRmVlNsTF/bvtlDssMNYhn96CY++rsjj7JtPAC2pyZGFHhDL33zhxwoNYIzv7cgyIYJAc50OrpowUcpfBAPr0bTieH5hrGf9L85B8xNHSCmWK2grkZ+YH83C18eLwCIXgPqL+NCZPAdETL58D4dI9m/3enkbE13kMfix2eRNTfxx15jL9DMU88C6s0m8/aTk8hBNYL44KbgED9dwEz+qv21iBhxFcOX70N0qOmaWF8OSEgbtTzrwReALvQJF747TGHAoMbz/sLaOKqyh0BErPz9SZooSadweG09OYnPM1S3fqpW2FU5H5UxyydTqtSl6YGu+fb3Qx3zc69IulchIngd0gNatBI5lki6Co96C7hrr6hYrVaNIwgeSeL6zfwBcmzzX9FYwMYz4r9tg0W+r7i23kfAsAtHCgSF2ucL9vQM/oiqrLefcWEfh4F4xi+0qB/PAu9CAqzLx2M7JifQRQ9thX+mOnZ2s3iLWOEyxJMXApPd1vJXZNFvJqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6862004)(70586007)(6512007)(316002)(186003)(356005)(83380400001)(8676002)(6486002)(336012)(5660300002)(26005)(2906002)(6506007)(47076005)(53546011)(36860700001)(81166007)(508600001)(36756003)(54906003)(33656002)(86362001)(8936002)(4326008)(82310400004)(70206006)(2616005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 11:00:34.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9700e27-502c-4f70-2c87-08d9af39a3ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7430

Hi Oleksandr,

> On 24 Nov 2021, at 7:59 am, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> To better reflect the nature of the device type and not to make any
> confusion rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE which it
> really is.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> New in v6
> ---
> xen/arch/arm/pci/pci-host-generic.c | 2 +-
> xen/arch/arm/pci/pci-host-zynqmp.c  | 2 +-
> xen/arch/arm/pci/pci.c              | 2 +-
> xen/include/asm-arm/device.h        | 2 +-
> 4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-h=
ost-generic.c
> index 33457fbe9615..46de6e43cc72 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -32,7 +32,7 @@ static int __init pci_host_generic_probe(struct dt_devi=
ce_node *dev,
>     return pci_host_common_probe(dev, &pci_generic_ecam_ops);
> }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
> .dt_match =3D gen_pci_dt_match,
> .init =3D pci_host_generic_probe,
> DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-ho=
st-zynqmp.c
> index 61a9807d3d58..516982bca833 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -49,7 +49,7 @@ static int __init pci_host_generic_probe(struct dt_devi=
ce_node *dev,
>     return pci_host_common_probe(dev, &nwl_pcie_ops);
> }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
> .dt_match =3D nwl_pcie_dt_match,
> .init =3D pci_host_generic_probe,
> DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 082c14e127a8..78b97beaef12 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -46,7 +46,7 @@ static int __init dt_pci_init(void)
>=20
>     dt_for_each_device_node(dt_host, np)
>     {
> -        rc =3D device_init(np, DEVICE_PCI, NULL);
> +        rc =3D device_init(np, DEVICE_PCI_HOSTBRIDGE, NULL);
>         /*
>          * Ignore the following error codes:
>          *   - EBADF: Indicate the current device is not a pci device.
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 3782660751b6..086dde13eb6b 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -37,7 +37,7 @@ enum device_class
>     DEVICE_SERIAL,
>     DEVICE_IOMMU,
>     DEVICE_GIC,
> -    DEVICE_PCI,
> +    DEVICE_PCI_HOSTBRIDGE,
>     /* Use for error */
>     DEVICE_UNKNOWN,
> };
> --=20
> 2.25.1
>=20
>=20


