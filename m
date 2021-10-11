Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326304289C4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205609.360969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrku-0003KZ-9C; Mon, 11 Oct 2021 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205609.360969; Mon, 11 Oct 2021 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrku-0003IB-6C; Mon, 11 Oct 2021 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 205609;
 Mon, 11 Oct 2021 09:37:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZrkr-0003I0-Ti
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:37:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9f0f834-2a76-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 09:37:56 +0000 (UTC)
Received: from DB6PR0501CA0033.eurprd05.prod.outlook.com (2603:10a6:4:67::19)
 by AM9PR08MB7118.eurprd08.prod.outlook.com (2603:10a6:20b:41e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 09:37:55 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::5e) by DB6PR0501CA0033.outlook.office365.com
 (2603:10a6:4:67::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Mon, 11 Oct 2021 09:37:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 09:37:54 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Mon, 11 Oct 2021 09:37:54 +0000
Received: from 2c61be027c83.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 650C7615-DBF3-45B8-B3B1-45BDA6967CCC.1; 
 Mon, 11 Oct 2021 09:37:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c61be027c83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 09:37:48 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2311.eurprd08.prod.outlook.com (2603:10a6:4:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 09:37:44 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 09:37:44 +0000
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
X-Inumbo-ID: e9f0f834-2a76-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ElrMXzpdlSNruvcRylv8x2LgXKxe7aDYpMZgWR9LEo=;
 b=UY3jEbfA8U+rp/vd4lGLDryBUHIB1HFHycl+0IgvomKZrlKX2xLxGs1PbwCQLqq8FMULeJhuRxwKd8VWTJ8Xk+8AVWGvetRsV5ubIwLcia/3B1xWyo2phBMHbgB036tJ4YK35gckTt7TEWJvAeoDSXGonVayQj1/PfyQZkHG84I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6aad0bebcd9fb76
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIdgeYkYQo5v2RlbB0VvUP/cT3r/OkXlrufIzxP8kxZNJsozw6Snbhn2zW14nRYt2OIzFYs5kx+p7SpjyN3nwINImry3GyWhWAxIqXhIg9nIdtqOfnYy77mtcIxlp4Uh0I2Fic1IUdG6SM1ceZIkMO0wV4+cd17irfbhzFq2Jp5XrF05C0+VFEpwCCroU3NtamPvsry2XN8/LY7LeZ65jDlRnXvccUXaJzVZY/ZEgXcfbXxEn9dYC5x4p+Edxw37KH3zcbg8P2lBkqv/5zKxglFK+RbEnlJtUIQZP7haoaffE7XK8rYbof3diNU7hYvtkA+yqXXXlM1tOeO2LPMm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ElrMXzpdlSNruvcRylv8x2LgXKxe7aDYpMZgWR9LEo=;
 b=Az2OdAqoD5I8wAaGDNJqvxDfyoh6MkUBgf/3EH1pJlVrPVdwnofnBZm/5ZrXyRhfaLQY59tGlATgRhocb3gc+zwKF2m+TZKoLaUkBUs0aWQV4EQEk0ev3P4FJYNS0yD/0kIlU4FPE+XDdXHdS083IO4mM/7rqUG9YqF3lFKmgk9VGqfcj69wD9pLLrbJDkPeP4A/wG/feIFZkhLDLNO4uRF8E0zpASQbTntKUAMKrrs23zcy94U9Topr4s15K0UHSNJ8ahlBAYW4qq5i4O8AQjbJeRNOmg1uhBA96xJcUephWM3vO9WTiPTllZeivkzuntVogtrPMDzf7sT/6cjHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ElrMXzpdlSNruvcRylv8x2LgXKxe7aDYpMZgWR9LEo=;
 b=UY3jEbfA8U+rp/vd4lGLDryBUHIB1HFHycl+0IgvomKZrlKX2xLxGs1PbwCQLqq8FMULeJhuRxwKd8VWTJ8Xk+8AVWGvetRsV5ubIwLcia/3B1xWyo2phBMHbgB036tJ4YK35gckTt7TEWJvAeoDSXGonVayQj1/PfyQZkHG84I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/efi: Fix null pointer dereference
Thread-Topic: [PATCH] arm/efi: Fix null pointer dereference
Thread-Index: AQHXvnWYcaBPG2QbfEGAFop12nzuY6vNilyA
Date: Mon, 11 Oct 2021 09:37:44 +0000
Message-ID: <3608432D-0D55-4373-B262-328A096C1388@arm.com>
References: <20211011075638.23785-1-luca.fancellu@arm.com>
In-Reply-To: <20211011075638.23785-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4b1768be-d0ee-403e-55c3-08d98c9acd56
x-ms-traffictypediagnostic: DB6PR0802MB2311:|AM9PR08MB7118:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7118C2581779412EDF152B4D9DB59@AM9PR08MB7118.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:514;OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cZq90CvRQZkaue0dhWicriE9Kku7dyGaY0W8RPTVxXlUpEow3XsDyWDo/OBPDqwKm11tvINupQwNSZ6EeWyQ+wBbYjHGYpgUFWbM1LuI6tsUTGu0rzeTATYZAMrUcQpgIAGWeqjyb94eAmhPKd1jCJA/alit0qqmTn5KG86xmSJxAc6dDwpV1oPs5txFLYGHKpDU55iUf5sKrrOjLx0v7cZyGcxvdx+mgu6hdDO1eWmVnVct3JLpUniUupyvNUmeL8Yk5y6Jh30s1Waps1L997F3Fv2fwnh1pgeH+q39WPe3ci/5M7Ap2MFXi3S2xi3oZbPdDlDF0QxCu0DPZ5xVgdtQNxgtrKO5pLOiggwuCwwdjZZEGGNVxq80WZIJLcNGo/c2GLgnwBS70jp+e97MTyI8pssuSu/q6+jFo7NGI+b7mw412NF9KPksrLd0YJhVsROWus1CurTJCeBMdC/7nvZ/2/MNLDtJM44+HxbL6oxQP/6ls9EksqOraZ7e4UTnrBrmzsBj4FWG9yftlWsEKAkvRC0uengkwwcATZkP0zATC5KAhAK7EYTTw5voInBaIKQRkdWh4mFkfeFZisPcAKX8w50LLVuD88t6qRD4klpqp4xGxy5VIMUN1BpxELLIfavNlZdGe7mRG6iOuUJbMoDV2vs+0RTIWEgOp9bcmBbQtq4nKteuqdCOcsQtF6lQkrLgkOXTGmm3wyMUN9EGdRzCsN/2F/qbsPNwDot6B35Ks+Y/d5v4irDBVQGk4TES
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(76116006)(186003)(54906003)(6636002)(66556008)(66446008)(38070700005)(6512007)(83380400001)(86362001)(37006003)(36756003)(91956017)(316002)(66476007)(508600001)(64756008)(26005)(4326008)(6506007)(38100700002)(5660300002)(122000001)(8936002)(6862004)(33656002)(53546011)(2906002)(2616005)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BDAE621BD4F087428C6E06E9215539E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2311
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2520fc94-96ce-4478-a86e-08d98c9ac754
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hx151nY22pK5CeqShQBtvRhapA1VrlVBll95RHkqCpNNSTcxwojck1O/ZM+5oX3tOlsBNot+GzCKHQKuNsi08I5FXoeKUtJ+XJ4qpqE5iwN7ofL0UNyUgl7Uh0ECkCQX8Sh7JW3gxeZkNC2tJqZBlB5O3lPknYYCUlKR+L83t0oEmGDvn3+HHxtzUqJqQScp191COF6q303Wl5D1kV8tJw7TAF//iaRdcCGk4CbtS/0SZVf2e71TquTPCvVNXhn6Ghs2xFoTYkU1QCA9njNdWGr4U3vONxnGvSGtCz2KTnf3Tyhe6qwY+aHts3jpUGUb0S7/vhUda+7K65H3ag3LMINMkzeMK/mi9unmrGOz2w1xEl4S5ax0WDpwCv0B4GbXPBODhhpIPDR366kCIc9kP9SIsOuE9RMHGhCLWvWBxfKDqcoygMs1T47TguxrEXpdn8WYVLH/sTJoymnMMMggZ8pCat4FkFJRfUHe2pyWUX6KEAgjQLIXFSgPWBneVo/Cm/+Cop2eFD68K/ZdOmaDY09k+wVOBtlpCuXmgCd2ufwHExFoMo7xzwkX+UylR5SapQP2EpU5RhoEy0wX9alc2XzLBG4u1a/TpOkhlkz6VfFg7GE3cdhwJgO4yIYg0qOha4rJvW7aQHVA92slr34u6Pa91fGtr4tWf+om1CIpjvObmSrTjxtHf1jT89mL6T+95Pm25a9ru/AlrR8lW8Hq5Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(2616005)(356005)(5660300002)(8676002)(83380400001)(70586007)(6486002)(508600001)(36860700001)(186003)(37006003)(6636002)(26005)(70206006)(6862004)(2906002)(81166007)(47076005)(8936002)(4326008)(6506007)(36756003)(316002)(336012)(33656002)(86362001)(53546011)(54906003)(82310400003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:37:54.7405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1768be-d0ee-403e-55c3-08d98c9acd56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7118

Hi Luca,

> On 11 Oct 2021, at 08:56, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Fix for commit 60649d443dc395243e74d2b3e05594ac0c43cfe3
> that introduces a null pointer dereference when the
> fdt_node_offset_by_compatible is called with "fdt"
> argument null.
>=20
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: 60649d443d ("arm/efi: Introduce xen,uefi-cfg-load DT property")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/efi/efi-boot.h | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index a3e46453d4..e63dafac26 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -593,7 +593,8 @@ static bool __init efi_arch_use_config_file(EFI_SYSTE=
M_TABLE *SystemTable)
>     dtbfile.ptr =3D fdt;
>     dtbfile.need_to_free =3D false; /* Config table memory can't be freed=
. */
>=20
> -    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
> +    if ( fdt &&
> +         (fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0)=
 )
>     {
>         /* Locate chosen node */
>         int node =3D fdt_subnode_offset(fdt, 0, "chosen");
> --=20
> 2.17.1
>=20


