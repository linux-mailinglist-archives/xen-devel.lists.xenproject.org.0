Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDC48D44B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 10:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257036.441434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7w7W-00037r-Bv; Thu, 13 Jan 2022 09:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257036.441434; Thu, 13 Jan 2022 09:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7w7W-00035F-8X; Thu, 13 Jan 2022 09:10:10 +0000
Received: by outflank-mailman (input) for mailman id 257036;
 Thu, 13 Jan 2022 09:10:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnG4=R5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n7w7U-000359-Dx
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 09:10:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98dfa603-7450-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 10:10:06 +0100 (CET)
Received: from AM5PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:206:1::48)
 by AM6PR08MB4643.eurprd08.prod.outlook.com (2603:10a6:20b:c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 09:09:53 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::d9) by AM5PR04CA0035.outlook.office365.com
 (2603:10a6:206:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Thu, 13 Jan 2022 09:09:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 09:09:52 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Thu, 13 Jan 2022 09:09:52 +0000
Received: from d6682d5fde38.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0B4AFDD-8545-4C72-92CA-E9E3E7FDE0A3.1; 
 Thu, 13 Jan 2022 09:09:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6682d5fde38.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jan 2022 09:09:46 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2224.eurprd08.prod.outlook.com
 (2603:10a6:800:9f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 09:09:43 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::cf1:97d5:63ff:e9b0]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::cf1:97d5:63ff:e9b0%12]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 09:09:42 +0000
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
X-Inumbo-ID: 98dfa603-7450-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJnGsVNctt45zM2zh0YY+aAE9eSAAvdaGy41jNfhQCE=;
 b=uPHLpvcbqdrjhvpbC7nq8QqIn+irWkW/iQgZWku+x5o81SxWyvxn4P31jyoBcGtMJAJQDTKy8m+kmkpA3fJzhzQ/4O4LwMlLLgZpy0CaMH44UjMMYmZR2FL1ze6e2ajmkYeleegPUiolqI7uoOfOHLraCosmvZlQWJ2PLSOL2xs=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f554e2a67321fe3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCew6YUscnJN8TUF0Np5fsGS5vUJAD/ogSgJtiHlMFbMwEiBAMH2uexv3pKwOPtsFKFQmtzLcvmgMohXJwT4nRJBansfEPqo3x1zWA4h+vxF2iOAVvPn2RRRP7Mjtwf/5q83gvXsVjanwLn2xh3VnIuVCJ0xiC/BYLQZbK0RJsBha2KFH378ib4ndvPxCamwExyssB03lA7mS+fWjXo/L07vO0ySkrrOVwP/Tu+ZvMcP3YzDRZrtbJDj28+jHkCrM4nIUBFYWKEswDoMFWioKQXPrqu2u+SpAZMNmLYRAQ3EzoTuLPH+L/GkIP//gAXpne1E4Qc0iDLhB4SvIlC0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJnGsVNctt45zM2zh0YY+aAE9eSAAvdaGy41jNfhQCE=;
 b=NmO2kNvFxCBt0cWIdFK6gbjioZAgvP5a7fyYseSrL0htRkm1rWII77ghr1E8AIw0cOJFMU9W2+sqhnwXwJKBpKZRXCwZW424I1ZEYcY2U5rioZDFY0Hs2vLpHcuJ7zAEPZfpub0eMZKyOZxxpupx/6VvEKw5mR2v/IsYQkuVrt8BGIZWPgBLkrzDak43cNYfjoFL7jdi4h+I22xqhCBunJ/4bJTcvSYDLNjqAi2pqpOp+4paKXVDb1YkoqRUIDRZVdxlmL6zGCqa4s0EO5IeghQ99lZEeQZqunjQXRuPK4/W12DqqPwNwmLSqNWoayXICM2lDomcbOEAbXZhu4lirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJnGsVNctt45zM2zh0YY+aAE9eSAAvdaGy41jNfhQCE=;
 b=uPHLpvcbqdrjhvpbC7nq8QqIn+irWkW/iQgZWku+x5o81SxWyvxn4P31jyoBcGtMJAJQDTKy8m+kmkpA3fJzhzQ/4O4LwMlLLgZpy0CaMH44UjMMYmZR2FL1ze6e2ajmkYeleegPUiolqI7uoOfOHLraCosmvZlQWJ2PLSOL2xs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [XEN PATCH v2 1/5] xen: introduce xen,enhanced dom0less property
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20220113005855.1180101-1-sstabellini@kernel.org>
Date: Thu, 13 Jan 2022 09:09:34 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Bertrand.Marquis@arm.com,
 julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C435312C-1697-4D7D-8F7A-E7BFFA8AED38@arm.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-1-sstabellini@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::34) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b142b755-b763-4af6-5b95-08d9d67475bd
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2224:EE_|AM5EUR03FT048:EE_|AM6PR08MB4643:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4643196224F6966221131EABE4539@AM6PR08MB4643.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G7vQO6rC0cW1zV67fzXaOJAMr3Y36Iv9zGa+Y4fzjyHIFXZIKCyvd9M7lhQGMtcmSZxncDS0AM8E1puKbU5YCLRHz7B7DcQOctmINm1ksQ+w59wSv6bIl6lu+RtVJq5IDjeXguknKv5xm4FlI2xmv4wgb40rifMp3/8TO2bXLSDTmkGAH/3tuZh+qINo/J+ciYfCbsKaL4upi391wiTTlPkL8BtOcrcM2zOUSqSIsMFAwbsuaQQl4J94kEMRfFo5QKGOkA+dy+7amviJBqS+2Lqfc9tYr8p+pL+x1fYVtfNrc9lLwdD1BpkJgRMAXMoM7mBSaUWSMvHhGjQ51guxMnlcApVO0BZKmtOQ3Mb+Cx4Mu2r4W5lAr4MkagI9559F3yd0gT/14HYfaZByAKiYO1FYzviH9jeg6I7UeCdAaPhJz4lO0JU/RWSfCIuHUl9w9ofPQgl8mIXwlPDT8uP4WbzPmI1Hj7cZ0Bkmv2WkGnB8BPQPqzQUcfaRS5Gbpm/LbqrGGAxNaQhUHMNa0ZLNeet/4Na1U3m9LgoVe0+y0UnHXMGjdRcp3mYLgssKp1yKrMiv8VVf/tKKdQIFzuCVXD7StA17JwaAsm2GbzQpjuUPkcl02LTKPjQ/smGZeslwZS4UBmzYX1cMYmLzqNlX0nKRavvu+vfPVRZIh10EFaZG9TN4ZZysxX34PanTs24GNgEWZs++mo6xI/PtprkB74HhpjTLkPbwTjVFasdsSZl23JC9EiA8lLjpkVjGBtwn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(4326008)(2616005)(8936002)(52116002)(6666004)(38350700002)(38100700002)(6916009)(508600001)(6486002)(66946007)(66476007)(26005)(6506007)(53546011)(186003)(8676002)(33656002)(54906003)(66556008)(316002)(83380400001)(2906002)(6512007)(5660300002)(44832011)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2224
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6bbdb646-2340-4926-0ede-08d9d6746f78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NeVemtLfKJMXad8jOL5sirdu8kYoZ91X5LoMZvGLAlB+IdxRO8uN3hG0l7SoL51GWaahizLGC9Z+nwwxTu2e4Xf57JxoYII0Pe+rU0eZkA7czFDIC0PABi56RBbwa7RYXai678kaalzOfUvsciqqkuF4H13kac5DMRiP9goxxwZXs19y1RlMbioGpU1PGOphtObuqEMtFkHl3c8nRotpT7OlD7uLLkV11G8dHctAYtlPeBaGTShsG02/dVlV6TrHPtaJrBecrRRnUJwvW1GnwJBoTfSWeQw9bmMSMdhbZQ6sv5MFymGSkdJiGdt696J8WnxCg6gPOzr2vbAH1bAj3bIUkaqgS7K4eaCvW5mo9uVT7ZLnPcHKO0B5zBNlNbLZNVNf6dA01Bhp7+flsPM+8S+5OGtxTrjd1EnnnD+L/5fL8Rm45S9qAsTgfMAFpvVyUsa/81xr7cJ1kBP/2OX725cetLls8HcifSVHwU4lEGoWV7EakpgogUYXoRBmHitgdMdfLUSgCAkpf3nsfqoSRA69nb4I5zdmXTOCKRDju3NSUDqB8h7JToHDDPiNmexPw7tmGCPBgmGPNGg5gfLd9lMaYPFxW1BAcSu2FPwR4zuhBEPDHU0gu9os4m+YZVBKiiivbe8IdPQBDKtzyGv9zRN2doWAgWOt6Wt/DTn8w06IaNR8B7PmZEzMyDP6aK7zUbl9i0MS70IbPVteIZkht3dTkmN3UXrXTdiYfpvagOZl9rxbvnXbmuQMQrbtSwc1kLR7jbJ/7ilODgUfnnpIpF4K7BSaPmiEHZlObHsY1dF6BkdfRK/OLnwfPlw+mjTW0pkbUPxvS5ALq3zJb1SZ9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(83380400001)(6506007)(336012)(53546011)(82310400004)(107886003)(316002)(26005)(186003)(5660300002)(36756003)(40460700001)(33656002)(81166007)(8676002)(86362001)(6862004)(47076005)(36860700001)(6512007)(6666004)(44832011)(2616005)(4326008)(54906003)(356005)(63350400001)(2906002)(63370400001)(8936002)(6486002)(508600001)(70206006)(70586007)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:09:52.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b142b755-b763-4af6-5b95-08d9d67475bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4643



> On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> Introduce a new "xen,enhanced" dom0less property to enable/disable PV
> driver interfaces for dom0less guests. Currently only "enabled" and
> "disabled" are supported property values (and empty). Leave the option
> open to implement further possible values in the future (e.g.
> "xenstore" to enable only xenstore.)
>=20
> This patch only parses the property. Next patches will make use of it.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>

Hi Stefano,

Subject to Bertrand=E2=80=99s comment on commit message:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Just a small curiosity, why we use the prefix =E2=80=9Cxen,=E2=80=9D for th=
e property? I thought since the node uses
a =E2=80=9Cxen,domain" compatible we could use just =E2=80=9Cenhanced=E2=80=
=9D just like the other properties =E2=80=9Cvpl011=E2=80=9D, =E2=80=9Cnr_sp=
is=E2=80=9D, ...

Cheers,
Luca

> ---
> Changes in v2:
> - rename kinfo.enhanced to kinfo.dom0less_enhanced
> - set kinfo.dom0less_enhanced to true for dom0
> - handle -ENODATA in addition to -EILSEQ
> ---
> docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
> xen/arch/arm/domain_build.c           |  8 ++++++++
> xen/arch/arm/include/asm/kernel.h     |  3 +++
> 3 files changed, 29 insertions(+)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 71895663a4..38c29fb3d8 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -169,6 +169,24 @@ with the following properties:
>     Please note that the SPI used for the virtual pl011 could clash with =
the
>     physical SPI of a physical device assigned to the guest.
>=20
> +- xen,enhanced
> +
> +    A string property. Possible property values are:
> +
> +    - "enabled" (or missing property value)
> +    Xen PV interfaces, including grant-table and xenstore, will be
> +    enabled for the VM.
> +
> +    - "disabled"
> +    Xen PV interfaces are disabled.
> +
> +    If the xen,enhanced property is present with no value, it defaults
> +    to "enabled". If the xen,enhanced property is not present, PV
> +    interfaces are disabled.
> +
> +    In the future other possible property values might be added to
> +    enable only selected interfaces.
> +
> - nr_spis
>=20
>     Optional. A 32-bit integer specifying the number of SPIs (Shared
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..9144d6c0b6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
>                                  const struct dt_device_node *node)
> {
>     struct kernel_info kinfo =3D {};
> +    const char *dom0less_enhanced;
>     int rc;
>     u64 mem;
>=20
> @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
>=20
>     kinfo.vpl011 =3D dt_property_read_bool(node, "vpl011");
>=20
> +    rc =3D dt_property_read_string(node, "xen,enhanced", &dom0less_enhan=
ced);
> +    if ( rc =3D=3D -EILSEQ ||
> +         rc =3D=3D -ENODATA ||
> +         (rc =3D=3D 0 && !strcmp(dom0less_enhanced, "enabled")) )
> +        kinfo.dom0less_enhanced =3D true;
> +
>     if ( vcpu_create(d, 0) =3D=3D NULL )
>         return -ENOMEM;
>=20
> @@ -3095,6 +3102,7 @@ static int __init construct_dom0(struct domain *d)
>=20
>     kinfo.unassigned_mem =3D dom0_mem;
>     kinfo.d =3D d;
> +    kinfo.dom0less_enhanced =3D true;
>=20
>     rc =3D kernel_probe(&kinfo, NULL);
>     if ( rc < 0 )
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm=
/kernel.h
> index 874aa108a7..c4dc039b54 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -36,6 +36,9 @@ struct kernel_info {
>     /* Enable pl011 emulation */
>     bool vpl011;
>=20
> +    /* Enable PV drivers */
> +    bool dom0less_enhanced;
> +
>     /* GIC phandle */
>     uint32_t phandle_gic;
>=20
> --=20
> 2.25.1
>=20
>=20


