Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEA48D39E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 09:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257023.441401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vUf-0005HI-Jh; Thu, 13 Jan 2022 08:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257023.441401; Thu, 13 Jan 2022 08:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vUf-0005DM-Fr; Thu, 13 Jan 2022 08:30:01 +0000
Received: by outflank-mailman (input) for mailman id 257023;
 Thu, 13 Jan 2022 08:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WE3=R5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n7vUd-0005D3-B6
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 08:29:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd4f8ac-744a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 09:29:58 +0100 (CET)
Received: from AM6P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::39)
 by AM0PR08MB3316.eurprd08.prod.outlook.com (2603:10a6:208:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 08:29:45 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::49) by AM6P192CA0026.outlook.office365.com
 (2603:10a6:209:83::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 08:29:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 08:29:44 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Thu, 13 Jan 2022 08:29:44 +0000
Received: from 824a189e7d2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F046AC0-5D12-4161-9916-2BBD75F5A18F.1; 
 Thu, 13 Jan 2022 08:29:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 824a189e7d2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jan 2022 08:29:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR08MB2853.eurprd08.prod.outlook.com (2603:10a6:6:1d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 08:29:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4844.019; Thu, 13 Jan 2022
 08:29:28 +0000
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
X-Inumbo-ID: fdd4f8ac-744a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbyiUFt3Q7OaC4Btyf0dw7vN1y0TUmlvYD4uWuYYkEs=;
 b=opCu6k4pgHvDPfLY/oO1RCSsn2K6zAAZMnD3/J9OHqiL5ahAM6M5EE7jLIc8kdv7fTqJs/RTmeYcftx4m7sm19yatqDGN34kOT79OAP3M1peB6BB3OFsvrwZUZKJuYqKfbAEljVOF9AoxHrNSyReBRBY2wLQ7UYSNCt+n9HmgTc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dde9b556c27ceabd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIwOvPVrd/fBT1mpTMWKsC03l7sd6egkyz6BzTug6zidRKjkUsAoD5vbzUqRyPUQ1Ycr8swpQFrl46uub/s3X41q2/tsnfFhDnRnayka7gjh3Fz/d6cRUb2I36LQ+iI7PLBW3LG5zjniBHq4vaCiVs+ToBNMf2VnYSiY6pQBxF1m9Ru9TcrVi9W+wgpMc6Ket2/iVpmKsRrwGOVsGkX7p8537QCmcgy1VduA3pVZXM9nLB7HSW3o3Q/vp28KWqWEjteNLrG/JKmM+4U8iWN1kDRpB/tAorlljKbyyvuzhd7FLPC0Icu8yOJxF+/enuJzWjR64rVFzTcllzOvFxVdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbyiUFt3Q7OaC4Btyf0dw7vN1y0TUmlvYD4uWuYYkEs=;
 b=m7fcsritW96jyZRFFsTqcJPYI3XW/UARJUeoZ2AXjx2/XXohu4gCBQKsoasyiEzkL/d5M7548o4PTley7OFVq46SlTn290eFEyN16qFD0SYuVWh9qPX+OWVK0bzDtIB/9d4bCwS3gkaHNJxY+m8Ay9fdXeqz7z3rjv8iqWVUmQH9b/7FumH3DdCxJ60Gorjwuo8hhZx93ij+sO1jCADpXcgKHG7BY/j9ZPY6DL0ZLJDVR/8Yj+muwxqZIhjknXBaSJs7mjWwU4UdL4/GChkA1Km4uok33S58Fu59w7azPTW5PxRCmnTPBDVHCrdi/E5Na/VWl7igHDqfIau5JZbMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbyiUFt3Q7OaC4Btyf0dw7vN1y0TUmlvYD4uWuYYkEs=;
 b=opCu6k4pgHvDPfLY/oO1RCSsn2K6zAAZMnD3/J9OHqiL5ahAM6M5EE7jLIc8kdv7fTqJs/RTmeYcftx4m7sm19yatqDGN34kOT79OAP3M1peB6BB3OFsvrwZUZKJuYqKfbAEljVOF9AoxHrNSyReBRBY2wLQ7UYSNCt+n9HmgTc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [XEN PATCH v2 1/5] xen: introduce xen,enhanced dom0less property
Thread-Topic: [XEN PATCH v2 1/5] xen: introduce xen,enhanced dom0less property
Thread-Index: AQHYCBjDVbDadtJPZUCNvtY/uFI3UqxgnyoA
Date: Thu, 13 Jan 2022 08:29:28 +0000
Message-ID: <77925E54-B875-4D00-846C-BB957D70BF79@arm.com>
References:
 <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-1-sstabellini@kernel.org>
In-Reply-To: <20220113005855.1180101-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4fdc0c22-3cd7-450b-14b2-08d9d66eda72
x-ms-traffictypediagnostic:
	DB6PR08MB2853:EE_|VE1EUR03FT014:EE_|AM0PR08MB3316:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3316FDEBD36C4D49851905C49D539@AM0PR08MB3316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F+3spM0TZ37Q/P/2gWDhmI5ks8vg0cpDHNUiwgt781BRDMZxZF98geM3T6a7wC56nFXuw+/1dwbA18mY/Qk0V3bKyx3/Dx6T0iyptzb70SsFkRVkEfNYg888hUuAc5gL248N5pxNRX0MfXI9ruBeLEZ52II8yUV9vulH9+UadZbTzGf9WzCL0KK5UMXBYf8xWzcezXj+gEoGK4XMG2e39nsiPF53fzweS0j0HrJDZZ07sNqH0PAAb3hLCbbCILA3kRDgKV5TS6UgqgldNDvKU77Zdw/wQJn6Rc4aPlO2cKz01+abcIzFvCjkUpXK63NWHXEQ7zaKzqlpRb6NN3asGgqmqtLLd1eaJAR6lgeWUoHy1/IU34tAIEhxJSFLF+ExDDTr7pmFVvvyX8CPBfe0pTHnN/c+X9qM1pAndzW72wbUf+CF8dNFxo9I0Vdn7lwB/KiYl2e7V/BDeQMbaAq3n98YhuD2MGgt5m8Wk0pgjOWK9pGjzQAHb55AWq2cG7uoYAHCjIqkMn9IURKANQUEmHl1kIa/EvCpu1HgWpItpxE21qv2dcLSKViLPzzekDmMZkFhn1BJpedF3ZP57sIgwkjsnaAAoxQkXKibNGPUicBn6vU17mCQAZBy08R6M/u9p0o4/G3BsXTWxlRaL4ZzN80ZcWde0UMl4g0Yewo/KQVElKIrXdSP6pZXcOB0fbCEmxYfMGTkz66BbZeh0UIz3i3Zm0/BWNNfDY6Xvr1+mCzx/q3khCISkHVUVANf9bhu5z7TcSv8lVhyzskroaGeaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(38100700002)(83380400001)(91956017)(122000001)(8936002)(36756003)(6506007)(26005)(4326008)(186003)(8676002)(86362001)(508600001)(6486002)(2906002)(316002)(5660300002)(38070700005)(53546011)(66446008)(6916009)(66946007)(54906003)(66556008)(33656002)(2616005)(64756008)(66476007)(6512007)(71200400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F35061F6F0CDBA4DA0833A0A99B268A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2853
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9327eed-e046-422e-57e4-08d9d66ed0b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Js+jq9VNkwbPeX7MRjzxTspqc+tgSWuVDalBh8BRaymU81c6jM0bPHBKQqNSKIzXWvujFeEqrb6ieXeyJ7V9JlYor5zgPvsLZPZReourP1j9URMaWR3w13R3ly+m+yqEcj91urJqvppBw55DQis1pChNcPjmkSeoBcQ9sbj5wQwEUkzVCTm/QsFQE81XYZ4LDKuRaPIbtr+1optA9cEGb5Od/yfBfx2GdWEWEZvzg4yCXzCiKyk3v933EO5181YrqhlphbOBrTsIPd8d5Y8w0pE8yNTTs7mM+u8WSs9lxbAH/rAMxpjDWU0iwwyzS68rFCFHXSU8VqZ0VzuGRNneLmZaPr4nD4HUFqbxacInnnIIySdZ/6gRyIs4Qcum9b4qIdVXSXd3AJaPYFvCOXvvaqnWi3AmAnHr9QhIAK0PwwxIC5j5VVoEh43F4LHqIQk3BnUH3ptw/5WCXzeCiiVaa6L7KWXkDnFclRsx0sHySXF5jOZSpBKFtMY4ge/nRLlKrHt4K666UEo+qrLM6AcA9/8cwnuYragbfeTfjFuD4EyM5uXsD/s+mgEOQ2EONEI0sLyhG+itsfAceqXOZCK5KmJn7uVR+ZTgqstSFpQYmj921anQca6Ufghk7vNyXJzshFh0tvftRxoBZhRzZHrJYxocM/yr8ugf3ZySjDuVm6dwZzbCTMa6NSNb8Ag0O2rU+W16RycHBDUu5nwUfVc3PXhJcwSq1+E+7gIcpg1eqqJF6NjknJHYUJ1kNnhu8Kaq8PDXPzgl64Vzg8aGhKN/DvUght385V5Xqun/GvAEC3k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(508600001)(4326008)(33656002)(83380400001)(86362001)(81166007)(53546011)(36756003)(316002)(40460700001)(54906003)(356005)(26005)(82310400004)(186003)(70586007)(2616005)(6862004)(6486002)(5660300002)(107886003)(36860700001)(6512007)(6506007)(8936002)(336012)(47076005)(8676002)(2906002)(70206006)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 08:29:44.8223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdc0c22-3cd7-450b-14b2-08d9d66eda72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3316

Hi Stefano,

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

You should also say here that you set this option to true in the code for d=
om0
and that the option is only for DomUs.

>=20
> This patch only parses the property. Next patches will make use of it.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>

With the previous added in commit message:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

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


