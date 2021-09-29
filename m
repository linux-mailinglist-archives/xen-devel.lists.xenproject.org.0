Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2CC41C5DF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199156.353040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZrF-0002uD-Iq; Wed, 29 Sep 2021 13:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199156.353040; Wed, 29 Sep 2021 13:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZrF-0002ry-De; Wed, 29 Sep 2021 13:42:49 +0000
Received: by outflank-mailman (input) for mailman id 199156;
 Wed, 29 Sep 2021 13:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVZrE-0002rs-Dw
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:42:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a65f1e55-6b0f-451c-8f5e-2ace51002102;
 Wed, 29 Sep 2021 13:42:47 +0000 (UTC)
Received: from DB7PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:36::34)
 by AM0PR08MB3380.eurprd08.prod.outlook.com (2603:10a6:208:e4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 13:42:31 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::a9) by DB7PR05CA0021.outlook.office365.com
 (2603:10a6:10:36::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:42:31 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:42:31 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Wed, 29 Sep 2021 13:42:27 +0000
Received: from af24f523c9ec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89ED3D68-48CA-4649-8CD4-35BCF88909B3.1; 
 Wed, 29 Sep 2021 13:42:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af24f523c9ec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 13:42:16 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6496.eurprd08.prod.outlook.com (2603:10a6:102:df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 13:42:12 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 13:42:12 +0000
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
X-Inumbo-ID: a65f1e55-6b0f-451c-8f5e-2ace51002102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgklEmJv5KWJcOjW60lRH5oWCx7Ng7cH+53tB11knY0=;
 b=XoEFt09EY4QR4g7ZWPLX/yElDo/qnTT5+pbb+cIPjR/wY1FGOHGpef2yMaSIC/hGQjmWgHSsMyN/PiV7BtmoMuWXngKSDkKm+Z7Ge12D/SRVv8bjqRapOjvRqVKtHsvNeA/ZvF6xT8i0vjfdZ9OdD/x51S9I4EhS3iu1K1yypS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8d14c3f15e8d3ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZBEo3A/mJ21iZscOheF4vvAyo4wWuqwWz591vRfpiDoyL0/mN9sBeuqNE+37GLCpDs5uQpNo/ph9xEhdzFshv0Q1Ni5X0D8levr5Ym+nTVj+/uH7FLIrhBEdHoM4Twt4l1AhPUR+HBlmXsgJHJ5Xbc07gJXSamCeyEZNLZs4I4sQkvmYyZQhYNiYbZ4qwYGVZYH4SvOoO3H1fdHj38vNn1EFrJQ5aoNUzNrJRl96Bn1tjyEhTDifNzPhQXyUGUdVpyi/0czO+oIN9aRLILP7CmFlEVReZC6g7lPfTZp4aUYMBvFbapPlPHj1ZlZDlHTJJOK7ikB839cCcrCyj++Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pgklEmJv5KWJcOjW60lRH5oWCx7Ng7cH+53tB11knY0=;
 b=i05aVKyIN2TFHqKX0X8bJ0ND5c1g3fW8ybKWyTjWDxRIirTmQHt0tGew8z8fGtv/pb9H6kWsKmsYyADZvShJgLkcFyUrCZHp2Iy7PUlE6IcGD+z9D6P3f9oZUNGHTpPaJh0nbeVOnXe0MNFp7cPqAxYBOx+O2DA5r+6Swg38H0zwJEx913iaR3xNP2nATu/PrgHl+g5CQjvxxB31D4pvhWGCcPg3zbYp2wt7hwodVtncc1+paUTM05p6RnblwC2Dd9EWMexVc7vFT2XR6lQDg6u2bhIpeiBklTnkpCmufmVVpfpCQ4ckQpPtiKd38bpLn8i8JHHg7WawhNs+qA5T6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgklEmJv5KWJcOjW60lRH5oWCx7Ng7cH+53tB11knY0=;
 b=XoEFt09EY4QR4g7ZWPLX/yElDo/qnTT5+pbb+cIPjR/wY1FGOHGpef2yMaSIC/hGQjmWgHSsMyN/PiV7BtmoMuWXngKSDkKm+Z7Ge12D/SRVv8bjqRapOjvRqVKtHsvNeA/ZvF6xT8i0vjfdZ9OdD/x51S9I4EhS3iu1K1yypS0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 16/17] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v3 16/17] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXtJYZNsoakdSb20yaB3wcBYqJ26u7BnAA
Date: Wed, 29 Sep 2021 13:42:12 +0000
Message-ID: <21569545-B5FB-4C9E-88A6-C5C26CD40661@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <7f19d0802a9ac7544ddefe96f282ba7f97caefe9.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <7f19d0802a9ac7544ddefe96f282ba7f97caefe9.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 821e9264-680a-4d83-1f19-08d9834efc88
x-ms-traffictypediagnostic: PAXPR08MB6496:|AM0PR08MB3380:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3380E9A29887C2EE2FE344ED9DA99@AM0PR08MB3380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +ZhUy0B9Iddru1x9uxEo/K7wmz3RL+915qupOT7/BK1pz3lEzi48Ipym9ugwuYOlD0eIhmqRc2qx1eRJwvLZXqOUab2Fs7YzIQHI2jqNZQVIVNxx91mQyV6ZTUpamoYrGSaaIsnVYF7ylk0tt6+fSI5KSqlvqU2cr92CkAlJcZb2ojA2IGcyetEfoPeKJiPEZj6M8O9Xl8mslNPSqeqI7NyI7rLYKptMnaPbUOpnhOWPqYOLbjfcz5n0sLuKm1G1iy0LoBMMbSWtbhbaYOWbbGZr9iHSG2dm2gIttaJyOxDeGnozR1KHhFjX27Yq1FmNnBTfm5ZGY479EDp9cjXYRnZ/39nNuSKZjFL1Q4LeMD7jW/UGu6ZzpKTTfruTE6fd8IdLm6NzeiCeVGqshLjjtQoQ4oFPF/clz6BPSILVf08UiIYWwgbK9bBTOIEPmTjoe294heuggrsX/MGT0cUd4nRbtNXXzBaZqeoXfmIQj8LCtuijhcsFnvUBQvc6aEWUL1jSaySnNH49OHPihBu3TpVBz6RirU0AeN8XPttRPNyZvQMLpCDutgZ/HkqdlFA8hpoSgSthz6lLd4b9+Sq9EL42Qgaskjvc/VJIyUEv/sBETOCmvkOukg+4gXAYRHEaHruuMTVqhZ2Adxk+WmfIcKGwIDu8tXVN5yH8xl2L3Z2zdEPCd4ziQM2o8vIxIWFw62u972KVfyeK0nZD+MwS2aPmae584IS53F4XlkvHoEI48LlX2wj+OYD4KH1hMGHE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(36756003)(64756008)(186003)(8936002)(4326008)(6862004)(53546011)(316002)(26005)(91956017)(6506007)(66946007)(66556008)(76116006)(66446008)(66476007)(83380400001)(6636002)(6486002)(508600001)(54906003)(122000001)(37006003)(2906002)(86362001)(6512007)(38100700002)(2616005)(71200400001)(5660300002)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B43DE908182354FAA9345C5CD7FBD3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6496
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d57f5ef0-7f69-4253-9654-08d9834ef142
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oX6Cb/cQwCFMjSu5QDHHbtKqVSA9OtTyQ9S7SRdnJR93g7Do5/UTx1S/+0gakvR9U+ZPB+j6r/PzUtek6n8U2i2CLOr9gSYQTvILBFK3tAlk5jxLdnhj3LzsNKPeMMLK5FOTis22CbSGjyGMqiw4CkrT9e4/gkk0IjmGTQOrRxoXo+QpJ1toKeg0N6sWzEytu64qVoS7+sGouBxt7Q1ANIdHAn8QrEu84HeH05xIospUqf+Ua5R6CYEZNguaGztQIDHhq3SbFCs3+/X4EpUQatwG3UMJ7/NH+cjYb1qwae4KUuSkOvBCP8+0WWPBTE5AdHqn+2U2OSlrwizZSSJ1c5c9tx/ZVSfm3Et9QrAia6/dzOY4JkRKmJTykX59lTwxfh0/xqAWXQLZ5I2jgHcgRh0zgtok9ArwML2U/pYvm3LpqamwYsGHLrMoXBKthuGc4UWtbuo0d+x5Kz4o7QJjJ6jH/GNb8bcAaa/Tk+89TzwtnKg7rH3KP4ztattp9sa0LeTemJdyFI3U9FK411ZlwvJ5i0x2KANxNaNU1GwYXz9peuxc+SWJQrLqySNB5F2/VqBXLKUorb1x36eTgZ8tYinIOIuevaG8KsOfQrYyRt2DbKE/Dnkr7kntzln/RlfrER1x8ob05nsjVpnUwQ5a+QJpbKD426dAUgA26JlpF5O+foVJc6N/GOnD/DLOROl8/JC2+WjzfFj+ftrDKL7kyQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(37006003)(53546011)(26005)(70586007)(86362001)(8936002)(8676002)(6506007)(70206006)(33656002)(6636002)(82310400003)(5660300002)(508600001)(186003)(2616005)(81166007)(4326008)(356005)(36756003)(6512007)(2906002)(336012)(6862004)(83380400001)(36860700001)(47076005)(54906003)(107886003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:42:31.7012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 821e9264-680a-4d83-1f19-08d9834efc88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3380

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
>=20
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Make GUEST_VPCI_MEM_ADDR address 2MB aligned
> Change in v2:
> - enable doamin_vpci_init() when XEN_DOMCTL_CDF_vpci is set for domain.
> ---
> tools/include/libxl.h            |   6 ++
> tools/libs/light/libxl_arm.c     | 105 +++++++++++++++++++++++++++++++
> tools/libs/light/libxl_create.c  |   3 +
> tools/libs/light/libxl_types.idl |   1 +
> tools/xl/xl_parse.c              |   2 +
> xen/include/public/arch-arm.h    |  10 +++
> 6 files changed, 127 insertions(+)
>=20
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..3362073b21 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -358,6 +358,12 @@
>  */
> #define LIBXL_HAVE_BUILDINFO_ARM_VUART 1
>=20
> +/*
> + * LIBXL_HAVE_BUILDINFO_ARM_VPCI indicates that the toolstack supports v=
irtual
> + * PCI for ARM.
> + */
> +#define LIBXL_HAVE_BUILDINFO_ARM_VPCI 1
> +
> /*
>  * LIBXL_HAVE_BUILDINFO_GRANT_LIMITS indicates that libxl_domain_build_in=
fo
>  * has the max_grant_frames and max_maptrack_frames fields.
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..52f1ddce48 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *fd=
t,
>     return fdt_property(fdt, "reg", regs, sizeof(regs));
> }
>=20
> +static int fdt_property_values(libxl__gc *gc, void *fdt,
> +        const char *name, unsigned num_cells, ...)
> +{
> +    uint32_t prop[num_cells];
> +    be32 *cells =3D &prop[0];
> +    int i;
> +    va_list ap;
> +    uint32_t arg;
> +
> +    va_start(ap, num_cells);
> +    for (i =3D 0 ; i < num_cells; i++) {
> +        arg =3D va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, name, prop, sizeof(prop));
> +}
> +
> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
> +                                    unsigned addr_cells,
> +                                    unsigned size_cells,
> +                                    unsigned num_regs, ...)
> +{
> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
> +    be32 *cells =3D &regs[0];
> +    int i;
> +    va_list ap;
> +    uint64_t arg;
> +
> +    va_start(ap, num_regs);
> +    for (i =3D 0 ; i < num_regs; i++) {
> +        /* Set the memory bit field */
> +        arg =3D va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +
> +        /* Set the vpci bus address */
> +        arg =3D addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, addr_cells , arg);
> +
> +        /* Set the cpu bus address where vpci address is mapped */
> +        set_cell(&cells, addr_cells, arg);
> +
> +        /* Set the vpci size requested */
> +        arg =3D size_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, size_cells, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
> static int make_root_properties(libxl__gc *gc,
>                                 const libxl_version_info *vers,
>                                 void *fdt)
> @@ -668,6 +720,53 @@ static int make_vpl011_uart_node(libxl__gc *gc, void=
 *fdt,
>     return 0;
> }
>=20
> +static int make_vpci_node(libxl__gc *gc, void *fdt,
> +        const struct arch_info *ainfo,
> +        struct xc_dom_image *dom)
> +{
> +    int res;
> +    const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
> +    const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
> +    const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
> +
> +    res =3D fdt_begin_node(fdt, name);
> +    if (res) return res;
> +
> +    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
> +    if (res) return res;
> +
> +    res =3D fdt_property_string(fdt, "device_type", "pci");
> +    if (res) return res;
> +
> +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
> +    if (res) return res;
> +
> +    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
> +    if (res) return res;
> +
> +    res =3D fdt_property_cell(fdt, "#address-cells", 3);
> +    if (res) return res;
> +
> +    res =3D fdt_property_cell(fdt, "#size-cells", 2);
> +    if (res) return res;
> +
> +    res =3D fdt_property_string(fdt, "status", "okay");
> +    if (res) return res;
> +
> +    res =3D fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +        GUEST_ROOT_SIZE_CELLS, 2,
> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SI=
ZE,
> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,
> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
> +    if (res) return res;
> +
> +    res =3D fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
> static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                              const struct xc_dom_image *d=
om)
> {
> @@ -971,6 +1070,9 @@ next_resize:
>         if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
>             FDT( make_optee_node(gc, fdt) );
>=20
> +        if (libxl_defbool_val(info->arch_arm.vpci))
> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> +
>         if (pfdt)
>             FDT( copy_partial_fdt(gc, fdt, pfdt) );
>=20
> @@ -1189,6 +1291,9 @@ void libxl__arch_domain_build_info_setdefault(libxl=
__gc *gc,
>     /* ACPI is disabled by default */
>     libxl_defbool_setdefault(&b_info->acpi, false);
>=20
> +    /* VPCI is disabled by default */
> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
> +
>     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>         return;
>=20
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index e356b2106d..529e475489 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -632,6 +632,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_co=
nfig *d_config,
>         if (info->passthrough =3D=3D LIBXL_PASSTHROUGH_SYNC_PT)
>             create.iommu_opts |=3D XEN_DOMCTL_IOMMU_no_sharept;
>=20
> +        if ( libxl_defbool_val(b_info->arch_arm.vpci) )
> +            create.flags |=3D XEN_DOMCTL_CDF_vpci;
> +
>         /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
>         libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
>=20
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 3f9fff653a..78b1ddf0b8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>=20
>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                ("vuart", libxl_vuart_type),
> +                               ("vpci", libxl_defbool),
>                               ])),
>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                               ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..ffafbeffb4 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>         }
>         if (d_config->num_pcidevs && c_info->type =3D=3D LIBXL_DOMAIN_TYP=
E_PV)
>             libxl_defbool_set(&b_info->u.pv.e820_host, true);
> +        if (d_config->num_pcidevs)
> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>     }
>=20
>     if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 727541a321..acd97eb327 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -431,6 +431,11 @@ typedef uint64_t xen_callback_t;
> #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
> #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
>=20
> +/* Guest PCI-PCIe memory space where config space and BAR will be availa=
ble.*/
> +#define GUEST_VPCI_ADDR_TYPE_MEM            xen_mk_ullong(0x02000000)
> +#define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
> +#define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
> +
> /*
>  * 16MB =3D=3D 4096 pages reserved for guest to use as a region to map it=
s
>  * grant table in.
> @@ -446,6 +451,11 @@ typedef uint64_t xen_callback_t;
> #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1=
GB */
> #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
>=20
> +/* 4GB @ 4GB Prefetch Memory for VPCI */
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
> +#define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
> +
> #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ =
8GB */
> #define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
>=20
> --=20
> 2.17.1
>=20


