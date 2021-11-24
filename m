Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C912345B746
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230210.397980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoQG-0002Iw-UU; Wed, 24 Nov 2021 09:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230210.397980; Wed, 24 Nov 2021 09:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoQG-0002GH-RB; Wed, 24 Nov 2021 09:18:36 +0000
Received: by outflank-mailman (input) for mailman id 230210;
 Wed, 24 Nov 2021 09:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PI+J=QL=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1mpoQF-0002GB-Fa
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:18:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e955cad-4d07-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 10:18:33 +0100 (CET)
Received: from AS8P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::23)
 by PAXPR08MB7171.eurprd08.prod.outlook.com (2603:10a6:102:209::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 09:18:29 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::3e) by AS8P251CA0003.outlook.office365.com
 (2603:10a6:20b:2f2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 09:18:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 09:18:29 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Wed, 24 Nov 2021 09:18:28 +0000
Received: from c3ac5a2797fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29A0365C-5614-4E69-9A4B-D9CFEB794076.1; 
 Wed, 24 Nov 2021 09:18:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3ac5a2797fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 09:18:19 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VI1PR0802MB2350.eurprd08.prod.outlook.com (2603:10a6:800:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 09:18:14 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::8124:9971:1db2:b704]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::8124:9971:1db2:b704%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 09:18:13 +0000
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
X-Inumbo-ID: 7e955cad-4d07-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb5urJYlBso7KqbUc04sq/uKwMh56HtYHB/URJ0O/VM=;
 b=AyqdPHs7HDJmflLSSBMNPXmtVxH+zLi2n8sw3OPmcXhlucQqjiuzVNLjBTk2DUn84AOqzxiTIwC4iYM3xlgxld5Sni920VZQ+0KM3GrfesGH0M7h57neMNFyIS27vRBOe2NY9PEaM8Spp5kQGMkd09jaB3nebMq+YrvxlF6pMDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBtBM2vkdndbrKgo83v4gMBSLqL6Wu1LMu9T5MObYM7XOCSetDkNtcLbPvfW1Ld3TQhUes/AbcUYOgGZtAoUdO5zWfamUGi+Ms7tx8uLkd9cO+0ocrQU9hkke2FUxHS1n2QqdK+jiThnd4EgsESxZotHtSABn85r5ninfq7DreJxSZ9DRKmHAW8PgbsOV4CjYblavyuR3rKUM4vdVoZMmaT7Jj3Uf4r+gZvOQSERQIi6inDS+GXPidBy25mDKEQzFejE4xvs1fHo+f6UV8bHrW5JPjBbIQMoHsINnIqSHlMzuts12Ar3DmX19vBMWxgutYBiQRwLkNKBelGOfERblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb5urJYlBso7KqbUc04sq/uKwMh56HtYHB/URJ0O/VM=;
 b=Xdh2PUW/izQGaTzJnMe/y71guqsEJAVOjeyG5UVM55wUrwEBUXfDZchUu2MaLH16A29yixPZnScvsq6jjVtzednh+lF5m+WaMo+MB/6sttOCAqhxzzpBocm23/m5CcfCfEvt0THx7ZvFZ3vDeAkHrGxgBJJP/ycZorfRTUOhuJhaseB8AaG+2yHmRkW1n/8R4+0es/wZBn0DR++7RAnvZ5+Ymk1UPeAzQ/GxuG8O8lo23WkHOt6yYTDdgGmgjyY7ETjvJsA6l1OUJ7DuPuLnX0J2FKLu+Hf/dLG79pBWJ9sJYsxxaOER8RwsyPAh/BjxUslRTztytGWuzYrNe8iBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb5urJYlBso7KqbUc04sq/uKwMh56HtYHB/URJ0O/VM=;
 b=AyqdPHs7HDJmflLSSBMNPXmtVxH+zLi2n8sw3OPmcXhlucQqjiuzVNLjBTk2DUn84AOqzxiTIwC4iYM3xlgxld5Sni920VZQ+0KM3GrfesGH0M7h57neMNFyIS27vRBOe2NY9PEaM8Spp5kQGMkd09jaB3nebMq+YrvxlF6pMDY=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: RE: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Topic: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
 DEVICE_PCI_HOSTBRIDGE
Thread-Index: AQHX4QlXsLfLgNpRV0eaX68wxlPhzKwSZXzw
Date: Wed, 24 Nov 2021 09:18:13 +0000
Message-ID:
 <VI1PR08MB3056E1C96D436E4D9993D3EF92619@VI1PR08MB3056.eurprd08.prod.outlook.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-2-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-2-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6902A91DB1EEFD48890A2029D3DCE7EC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 02dd4a94-7821-45b1-b2a2-08d9af2b60c6
x-ms-traffictypediagnostic: VI1PR0802MB2350:|PAXPR08MB7171:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB71715C89001B021D71286B9D92619@PAXPR08MB7171.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Af7l7jd4/N5j/IstgeEjjJaY5le1yVOnqbDiFJNu1JM+rVb8z5LW6a1mZClWdlu9AOtHWWd9vJahC15SI6T3ZBrQWJmfyHuoFMRymAIqC/Zl+y8x/d5OXgPpL/8Kj/2GBaxnlx33BX1pFtFOM2HEoiiChECSp9iJ0ewdxY4f75m+5Le1Wn0hLeiswwllE3nwSpJtPjVIZ7e+SVkHBhCMJtH9M5sTFfgCVi++NW4+HzMg9kTTCjuTgMY60I8567LeKNct85/eEu0OvOtf0a/0hosak+qQIKuw4IX6kl2qKauOW2JQ2v+mj2UmhyQbiNBX+VKfGkPiFPiVsjuiIjDuhMC2xw5aCnxUZOOLJyj01GTtaDOmVaehIV//9D5BXdT3VOzWdAVEpObugMkI6KaQPMToyQGVGGAir0X8KPkthDw51I7Xx3RYqGUC1gIIAT+zMoDiWEbRJLDEnHSvaTO7SfscfFkLUWO36z6PwwZhJUK5nmeE2PlxzoT4WT65Y4ldnYfQg+/FW6tCPPLmkGdFPxwfN1BpTnYgTrnFlLAF3i7h8sOhszFHs7pq86ULL928OCtgKKhcq1teuzrjFJcTLXgZUH76q6SHAJZ8+O01BLXQcHQt99EB5JUKguFGmZH19IQcbUI3GMmdWq3Z0zK1VlrLatFFtRTAZwuNpIANpvZ/0dKm8IuCSRJO4sAQXGZ5Q9XzQAdgzCRdgB4/R26Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(7416002)(5660300002)(8936002)(316002)(33656002)(38070700005)(53546011)(66446008)(110136005)(66476007)(66556008)(64756008)(54906003)(6506007)(4326008)(26005)(2906002)(122000001)(66946007)(7696005)(86362001)(38100700002)(76116006)(186003)(55016003)(52536014)(9686003)(83380400001)(8676002)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2350
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0007220e-bd75-4953-ac6b-08d9af2b5774
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x2A2TMoESDfJYDsfCFtwf/mKE560vt/g40egnlWYtWhkeNfAfrS2Tw0nyjJyzN59TJBEBKSnqF/qrbudpj5SOc7zBDNodrLjvnvvdrSnDhPWai1e87GzyD6tKBjVw1AcdMuUG2qAqwtEYA/d+AYZREqacj0CndP/VjCDr0RjbCT7Msn2AaW0kHXLozA6jo0T6cneovqjFbjq55n4F2diJPjC/CEkGsNfOorr8ytGj4mPjrvEq+rwEfje3q7/PNTbtIqJ11DBwPiGmYPr/BvdepOGcXS72MVKCSJ/8vn1IFrWVipgjrPDy8mYxZweK0SX4GuYDkfbHRCJu38pGcsveyjNhIrKUtgG6Kp7W8qsW8csjFEFgeivYI40JygsPmzaCHkvnHGJamBR5WcJYlcRIWWotJEBmrvq6k9/rRL2SWSkzmudZ7l/5xJ76gmbyYMRnJeQdir+O/t+hSJ5pTZzMO1t7Jju6vkLj32eUJF03iQ9bF0dPaVxK1Ei94pi4HygYTCamRpazZDOLLSQOAfLNiPHEvH7FVhi+GRLASWnCKgT5cI2CR2sIVo33PGaZU6vBOFIRy1CZ54pwYO+YKy5MNhVuBAg6bXaAAWv4lPVCB8JtxEpavJ0N3Rkqo76E8k1rrVNKWjtOIIfZ0c8X0TwbcYMr4xgPw/iWJEKjxOZ3EsEiMuh+tZ1spgnVlgKucIDv3h6Zi6INqlDSYIUy1yraw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(356005)(47076005)(83380400001)(7696005)(55016003)(81166007)(36860700001)(70206006)(82310400004)(54906003)(4326008)(8676002)(6506007)(52536014)(336012)(26005)(53546011)(8936002)(508600001)(9686003)(316002)(70586007)(2906002)(33656002)(107886003)(5660300002)(110136005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 09:18:29.1136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dd4a94-7821-45b1-b2a2-08d9af2b60c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7171



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Oleksandr Andrushchenko
> Sent: 2021=1B$BG/=1B(B11=1B$B7n=1B(B24=1B$BF|=1B(B 16:00
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; sstabellini@kernel.org;
> oleksandr_tyshchenko@epam.com; volodymyr_babchuk@epam.com;
> Artem_Mygaiev@epam.com; roger.pau@citrix.com; jbeulich@suse.com;
> andrew.cooper3@citrix.com; george.dunlap@citrix.com; paul@xen.org;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Rahul Singh
> <Rahul.Singh@arm.com>; Oleksandr Andrushchenko
> <oleksandr_andrushchenko@epam.com>; Julien Grall <jgrall@amazon.com>
> Subject: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to
> DEVICE_PCI_HOSTBRIDGE
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> To better reflect the nature of the device type and not to make any
> confusion rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE which it
> really is.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksandr Andrushchenko
> <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> New in v6
> ---
>  xen/arch/arm/pci/pci-host-generic.c | 2 +-
>  xen/arch/arm/pci/pci-host-zynqmp.c  | 2 +-
>  xen/arch/arm/pci/pci.c              | 2 +-
>  xen/include/asm-arm/device.h        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-
> host-generic.c
> index 33457fbe9615..46de6e43cc72 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -32,7 +32,7 @@ static int __init pci_host_generic_probe(struct
> dt_device_node *dev,
>      return pci_host_common_probe(dev, &pci_generic_ecam_ops);
>  }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
>  .dt_match =3D gen_pci_dt_match,
>  .init =3D pci_host_generic_probe,
>  DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-
> host-zynqmp.c
> index 61a9807d3d58..516982bca833 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -49,7 +49,7 @@ static int __init pci_host_generic_probe(struct
> dt_device_node *dev,
>      return pci_host_common_probe(dev, &nwl_pcie_ops);
>  }
>=20
> -DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
>  .dt_match =3D nwl_pcie_dt_match,
>  .init =3D pci_host_generic_probe,
>  DT_DEVICE_END
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 082c14e127a8..78b97beaef12 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -46,7 +46,7 @@ static int __init dt_pci_init(void)
>=20
>      dt_for_each_device_node(dt_host, np)
>      {
> -        rc =3D device_init(np, DEVICE_PCI, NULL);
> +        rc =3D device_init(np, DEVICE_PCI_HOSTBRIDGE, NULL);
>          /*
>           * Ignore the following error codes:
>           *   - EBADF: Indicate the current device is not a pci device.
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 3782660751b6..086dde13eb6b 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -37,7 +37,7 @@ enum device_class
>      DEVICE_SERIAL,
>      DEVICE_IOMMU,
>      DEVICE_GIC,
> -    DEVICE_PCI,
> +    DEVICE_PCI_HOSTBRIDGE,
>      /* Use for error */
>      DEVICE_UNKNOWN,
>  };
> --
> 2.25.1
>=20

[Jiamei Xie]=20
LGTM.
Reviewed-by: Jiamei xie <jiamei.xie@arm.com>=20


