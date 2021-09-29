Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECBB41BFFC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198690.352316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7T-00018I-3d; Wed, 29 Sep 2021 07:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198690.352316; Wed, 29 Sep 2021 07:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7S-00015N-VA; Wed, 29 Sep 2021 07:35:10 +0000
Received: by outflank-mailman (input) for mailman id 198690;
 Wed, 29 Sep 2021 07:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU7S-0000z7-EI
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:35:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06d33ed-1c63-48a9-9f98-bbdd67f58764;
 Wed, 29 Sep 2021 07:35:08 +0000 (UTC)
Received: from AM6P193CA0114.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::19)
 by VI1PR08MB3168.eurprd08.prod.outlook.com (2603:10a6:803:49::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:35:05 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::7a) by AM6P193CA0114.outlook.office365.com
 (2603:10a6:209:85::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 07:35:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 07:35:04 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Wed, 29 Sep 2021 07:35:03 +0000
Received: from 4feecd25145a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 689AD135-4C96-422E-AA2B-CEAA657D4D57.1; 
 Wed, 29 Sep 2021 07:34:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4feecd25145a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:34:51 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 07:34:49 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:34:49 +0000
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
X-Inumbo-ID: a06d33ed-1c63-48a9-9f98-bbdd67f58764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I8CkTLCs7oBtYa/e5HNW/QH8dygDMbatGsUJoZIdWw=;
 b=a+7mhTOSGMB9vqmlp7EvGD+dPJPBieB0Poz5sFegv3mKdTWJBy3d3sy9gy3/lMUjJB5YrVkTpQZfrlUFoQvdQwY5r6woyTJwp3alsj/gA4ryuAiUQcddRfIcCpMn6Tz0sVvHhP3hVR+eiA2zIK11F/dvydTKAxmknAbBdD5XOJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ebef743791d2ad0e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf/1bZGCYH9F/wFgPZruUFtfGXio45l4QLE9XpvEBGfMBAeZhmfBChJYHM8ElqkvsfuUvQQVeu2S03HOKrjn/5KFRm5RtwQXpuG+rfPZbkOFkkN0mw5P1WljKC8O36FxC6PSQiCFSB8OKB9znhShUUYfy9B+kDHYxEUHhxkdqSdLiBMt3PsC1sOB4IRkHuhzKlG6YWnDaiq6z6NwbnPe8GNoSaehc7U9Tc68g2Xi2jg58RYKdiSHWhvI6FLn61ExF/dufog6L/BZ+b3hUw0P3qrDX7kMMmcDid1o8zgBggkp/RkkCBTQ5WgB0eMG7jGmfLJ+cDt64A2bpDqdUuGODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6I8CkTLCs7oBtYa/e5HNW/QH8dygDMbatGsUJoZIdWw=;
 b=cjiC/kH+6khrh57avPFs0kAKyDldr5fjUrgJHgi2tW+EY0AMV+vQXtTYkCIhJMxGzgplGNk8+nOhFdXBV6ONfGBcDexRjAuIWhWt2AGsPbODwpXUgRD4s6DY3qZwW/x4Y9FHs53gxGQjZt0GJqP8xlN1Z1ZAl5xr+hKGQ/P6hyxv6/MXXhYzKzCt19GzO1lY6rxeUKYwxt2cCATyDvhd7TgUQd8lekINf6DOBWkMglNPGOwuRGuxLxkCQY0JEUwYzqlOaFj9/DXxze2UhxdCj+QVTn8jjlOqv1CYQBfNbAREtHuZ/ppbCKjMMf9z6YHAx6YoKLuBzUpQN6JsIsoBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I8CkTLCs7oBtYa/e5HNW/QH8dygDMbatGsUJoZIdWw=;
 b=a+7mhTOSGMB9vqmlp7EvGD+dPJPBieB0Poz5sFegv3mKdTWJBy3d3sy9gy3/lMUjJB5YrVkTpQZfrlUFoQvdQwY5r6woyTJwp3alsj/gA4ryuAiUQcddRfIcCpMn6Tz0sVvHhP3hVR+eiA2zIK11F/dvydTKAxmknAbBdD5XOJI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v3 06/17] xen/device-tree: Add
 dt_property_read_variable_u32_array helper
Thread-Topic: [PATCH v3 06/17] xen/device-tree: Add
 dt_property_read_variable_u32_array helper
Thread-Index: AQHXtJWYkyWVi1zlh0y0nXHkIxlt4Ku6n8oA
Date: Wed, 29 Sep 2021 07:34:49 +0000
Message-ID: <3A325D3C-714A-4DA4-91F5-B905728D163F@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <9dba5f3457d9ead9084ac73297bf5a65e665a8d9.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <9dba5f3457d9ead9084ac73297bf5a65e665a8d9.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 947ac49c-6172-497e-5697-08d9831ba7a3
x-ms-traffictypediagnostic: PA4PR08MB6271:|VI1PR08MB3168:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB316813AB8742599C88FA4F079DA99@VI1PR08MB3168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S16HjX2y78Zl2u8l/zTdogZxvbTCKcPLsYCM6dp5VVCJKfAglVytm8jnERO7nd5KWUhvXukeI3Ny4vGOVhslhs3RQBK52/27M10PSpeUUfUhjP2yQDV03zEwXFKyJ1XA/7DnqYG6TqYDkMArrnwU5IxSIT7P6hfWYJA3EGLEJOSIwvSG4oEW8pThF1xqn+1Q2QKCpZz12cM8vMy/fmO1Wq13oyWXPjKyxhwbCQCnaAOjXgXfBLpJiNPoP0z40s5B/lQE98vU9MtAEzLlPNEHfJR8S03j2Q9FsfMpPLoQysQw5AhZ9PHvWpvesyHsfwimSSeEH5kUUA0/MnBMC1JTGVA39DA+rIYyg3yywQgrwjq1RTU52mAH07CYFxXF5DvntA7b8yGPUi4PfsAjhmfL+Td/4o7wdQXt8ZPLcCsQyw48k+jDdbyEMRlOVh3WsglM8ZDerdNR9btcbItHt9RJl58bw9gU3nvKdA6pyyT+d6E+7MSGpgY+xu9QojzSLTldVYdykVfOjj1bUZUTen9/hWAIkGQY6GgZtGUVkNhg1HYs0fPft3AOgu8uO2d08jgrHjeJJ7OaBnGs4tp/LX0Sw+/BisvCE8lhnD/TK9JUPiYRE349oGdnIzwtIUN5Dek6UspMa5wtR4GTSHN8Eip2iNk8d+BkOQ64Lf3CSTXrZfgnVytTmhESnXKe5KCidQDduRCPY7uIcjzoMIcYevzDomJPADkqO6lgwRBPA2BA13Ffa0IbtmkKNDMNbzjGrh4m
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(33656002)(53546011)(54906003)(2906002)(37006003)(71200400001)(316002)(6506007)(38070700005)(86362001)(122000001)(38100700002)(64756008)(66476007)(66556008)(8676002)(66446008)(66946007)(76116006)(91956017)(6486002)(6512007)(8936002)(6862004)(4326008)(36756003)(508600001)(83380400001)(6636002)(2616005)(5660300002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5EFB03D8EDF5449A04A7A8D880F7667@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	481da0f5-fdeb-4683-53d3-08d9831b9e6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zyocVGLUiz+qavYEaFMJ3077sYT9j8SG+96XBW+GERbhp48BZkU4VWh41Rq7nhA1/of+5pm3BkQAaGT0hS9GhqrqXskfUzgT1oIAgygMfMNsN1W/+QOu/bEGosimviPo3dSQN9xZYqtmaZQ8dLn7NwTeXzYWcu3CynQ1pY3gKzZw9nvsbY4lm+v8haspxnBmEqGi8GonvcgiF6msuER6mAH6Pxq0lZ4sSMRBjU8t3jMyxff4X+kvElnb1ObU/VsF6dIZY4bLObZw+wAvMJSzGz7ods/Il77S3FRRaJysKmqqw2vDD7A11pHdSImNlA/8/gNSE7CVbr+D9JogwA0smEKkSEYKOxGob22mmnrqtCNox4EzupYJlpGOyOTwpPJqXqxpb2zvPSZcJ/4qwYQV6junJ7BBV+7KKfmbrsz+67yly4ZA5fvS5We1C1+i4UEIcN2EPsRGs3yndHUmr9MzTVmSenUPAySHNxbcUh2NVuMiBv5O+2r4msJ98VbiKyxRpUglQ2IIbP/DnmpVuK85uNPLwKpaGCSO6/AWmyubce2ilBHQwesHkAjk9xVOSweqFmLTeI4P6cjIScd+rcFmg/BoYbvpCyrrT8N/Rw4EWmd1WZtYN8baUxo5O2QXjiQF42l9j2nZOjfZnOUiDRXrAs2FjzMKA46D+u2wk1msXMnlkVc+8D4i/yQOVcHc0tU4ilVXljcaZ6lckGXHjnEDlA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(356005)(86362001)(36756003)(6512007)(6486002)(336012)(508600001)(2616005)(81166007)(33656002)(47076005)(83380400001)(8936002)(4326008)(70586007)(6636002)(54906003)(8676002)(70206006)(186003)(5660300002)(37006003)(36860700001)(316002)(82310400003)(26005)(6506007)(53546011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:35:04.8911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947ac49c-6172-497e-5697-08d9831ba7a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3168

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3
>=20
> Import the Linux helper of_property_read_variable_u32_array. This
> function find and read an array of 32 bit integers from a property,
> with bounds on the minimum and maximum array size.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable=20
>  Linux commit-id
> Change in v2: Patch introduced in v2
> ---
> xen/common/device_tree.c      | 61 +++++++++++++++++++++++++++++++++++
> xen/include/xen/device_tree.h | 26 +++++++++++++++
> 2 files changed, 87 insertions(+)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 03d25a81ce..53160d61f8 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,67 @@ int dt_property_read_string(const struct dt_device_n=
ode *np,
>     return 0;
> }
>=20
> +/**
> + * dt_find_property_value_of_size
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @min:    minimum allowed length of property value
> + * @max:    maximum allowed length of property value (0 means unlimited)
> + * @len:    if !=3DNULL, actual length is written to here
> + *
> + * Search for a property in a device node and valid the requested size.
> + *
> + * Return: The property value on success, -EINVAL if the property does n=
ot
> + * exist, -ENODATA if property does not have a value, and -EOVERFLOW if =
the
> + * property data is too small or too large.
> + */
> +static void *dt_find_property_value_of_size(const struct dt_device_node =
*np,
> +                                            const char *propname, u32 mi=
n,
> +                                            u32 max, size_t *len)
> +{
> +    const struct dt_property *prop =3D dt_find_property(np, propname, NU=
LL);
> +
> +    if ( !prop )
> +        return ERR_PTR(-EINVAL);
> +    if ( !prop->value )
> +        return ERR_PTR(-ENODATA);
> +    if ( prop->length < min )
> +        return ERR_PTR(-EOVERFLOW);
> +    if ( max && prop->length > max )
> +        return ERR_PTR(-EOVERFLOW);
> +
> +    if ( len )
> +        *len =3D prop->length;
> +
> +    return prop->value;
> +}
> +
> +int dt_property_read_variable_u32_array(const struct dt_device_node *np,
> +                                        const char *propname, u32 *out_v=
alues,
> +                                        size_t sz_min, size_t sz_max)
> +{
> +    size_t sz, count;
> +    const __be32 *val =3D dt_find_property_value_of_size(np, propname,
> +                        (sz_min * sizeof(*out_values)),
> +                        (sz_max * sizeof(*out_values)),
> +                        &sz);
> +
> +    if ( IS_ERR(val) )
> +        return PTR_ERR(val);
> +
> +    if ( !sz_max )
> +        sz =3D sz_min;
> +    else
> +        sz /=3D sizeof(*out_values);
> +
> +    count =3D sz;
> +    while ( count-- )
> +        *out_values++ =3D be32_to_cpup(val++);
> +
> +    return sz;
> +}
> +
> int dt_property_match_string(const struct dt_device_node *np,
>                              const char *propname, const char *string)
> {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index b02696be94..1693fb8e8c 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -366,6 +366,32 @@ bool_t dt_property_read_u32(const struct dt_device_n=
ode *np,
> bool_t dt_property_read_u64(const struct dt_device_node *np,
>                             const char *name, u64 *out_value);
>=20
> +
> +/**
> + * dt_property_read_variable_u32_array - Find and read an array of 32 bi=
t
> + * integers from a property, with bounds on the minimum and maximum arra=
y size.
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @out_values: pointer to return found values.
> + * @sz_min: minimum number of array elements to read
> + * @sz_max: maximum number of array elements to read, if zero there is n=
o
> + *      upper limit on the number of elements in the dts entry but only
> + *      sz_min will be read.
> + *
> + * Search for a property in a device node and read 32-bit value(s) from
> + * it.
> + *
> + * Return: The number of elements read on success, -EINVAL if the proper=
ty
> + * does not exist, -ENODATA if property does not have a value, and -EOVE=
RFLOW
> + * if the property data is smaller than sz_min or longer than sz_max.
> + *
> + * The out_values is modified only if a valid u32 value can be decoded.
> + */
> +int dt_property_read_variable_u32_array(const struct dt_device_node *np,
> +                                        const char *propname, u32 *out_v=
alues,
> +                                        size_t sz_min, size_t sz_max);
> +
> /**
>  * dt_property_read_bool - Check if a property exists
>  * @np: node to get the value
> --=20
> 2.17.1
>=20


