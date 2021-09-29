Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96F41C000
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198699.352338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7y-0002BV-Lx; Wed, 29 Sep 2021 07:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198699.352338; Wed, 29 Sep 2021 07:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU7y-000286-Gt; Wed, 29 Sep 2021 07:35:42 +0000
Received: by outflank-mailman (input) for mailman id 198699;
 Wed, 29 Sep 2021 07:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU7w-00025H-Kv
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:35:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3e14de3-4705-4b92-9b1a-70e28bc43979;
 Wed, 29 Sep 2021 07:35:39 +0000 (UTC)
Received: from AM5PR0602CA0020.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::30) by DB9PR08MB6828.eurprd08.prod.outlook.com
 (2603:10a6:10:26e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Wed, 29 Sep
 2021 07:35:36 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::73) by AM5PR0602CA0020.outlook.office365.com
 (2603:10a6:203:a3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 07:35:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:35:36 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Wed, 29 Sep 2021 07:35:34 +0000
Received: from b3de1c9bdd44.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 761E49FD-EF59-427A-9E53-B4C10B9143C9.1; 
 Wed, 29 Sep 2021 07:35:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3de1c9bdd44.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:35:24 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:35:20 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:35:20 +0000
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
X-Inumbo-ID: a3e14de3-4705-4b92-9b1a-70e28bc43979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIjdK7QjOT4c/q9rcaKd2cg7zUzTEW/PNV6L3CcU7c0=;
 b=p8P+c3ZUomDWvYAUBGcnvtgxVH0V4fwwWmtHGt8cbl58JqYTZk7MrpIm162bhs+YzdsSHhGqBCBbIWgfcSfLykfBjIH0NmndJurohwsZzETt52ecMUIXl6hZ64nL6Ebq/YrlNf9Ig51xEG+CVDODBDQ+U+QOXCf8PIfn9RPQ0bA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f76c3558eb2d61ad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAkSt+PBMqep8Zg3IF8IT5ZCrRABLADc1PRUtQsL/yAANg+chU3Oh3wHD37aeNQS2U7V+4P+LJoGxXYJ5nTJ4+TKX5xisQRnug2iY1yxyOyFdQa91YEwSUutG3VMZUWkOg5fefDXRVYQXIweejKd93dWNhxUau/+7Bamamb7jDSwsI8Qz53A5qogIu8DL8BShIFB2i5WMNm5TRsS2pk8T9oW8rTf56dPAkK9Wwt5VsIXpUh7DXLj5Gcj2LvRfQIwaHewMgLaXPVFZnMoCQ+lub5bLRQ0gl71wVj0xL4Qme7w2BUPjxlYNQ3NbwLsyqV7v+kqadf2jpYfzSWiVWKSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QIjdK7QjOT4c/q9rcaKd2cg7zUzTEW/PNV6L3CcU7c0=;
 b=QI/RH4cPetgIlDEZXxtJj/jVhzzi10SP2FQXvs4W3iTVFOGdM0pjdHDTy+Y8Fu2KCgQhjbz+zvpqVFqozL9SacX3PVl7q9+w5mc67hl6apGMgJqvsLI9L0RKZigL8KKJ1spSpw43NKzrLZHj2464drlVtrnHi5nFlHQ+9O43ntgZ9awKcXKLLirQKB9Sxe+/msQdYS5RLqTO2W1Ys8Lh6ZXaaVfqOfUGEjJhs7aBIhJLME7PF5vkO8g699ihGSDqx5TSUnxLxmrxBvw07Tm8w5dSAU+AxOl8JeSEvMVDO0MVki/T5aqX3Z5zxA6moCs3hHeJ4Nnf1CXj0KMdqeVziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIjdK7QjOT4c/q9rcaKd2cg7zUzTEW/PNV6L3CcU7c0=;
 b=p8P+c3ZUomDWvYAUBGcnvtgxVH0V4fwwWmtHGt8cbl58JqYTZk7MrpIm162bhs+YzdsSHhGqBCBbIWgfcSfLykfBjIH0NmndJurohwsZzETt52ecMUIXl6hZ64nL6Ebq/YrlNf9Ig51xEG+CVDODBDQ+U+QOXCf8PIfn9RPQ0bA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 08/17] xen/device-tree: Add dt_get_pci_domain_nr helper
Thread-Topic: [PATCH v3 08/17] xen/device-tree: Add dt_get_pci_domain_nr
 helper
Thread-Index: AQHXtJW4akzPy06fZESxWckJ42Gz9au6n/AA
Date: Wed, 29 Sep 2021 07:35:20 +0000
Message-ID: <E66E6BF0-5C3D-4290-BF0E-F23473A0B012@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <f70ac215cd0c62d71231b8f61f12c1f8d801710e.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <f70ac215cd0c62d71231b8f61f12c1f8d801710e.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 946df0d2-12ae-4e94-a32b-08d9831bba63
x-ms-traffictypediagnostic: PAXPR08MB6511:|DB9PR08MB6828:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6828543FAC78CAD60539B3639DA99@DB9PR08MB6828.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zeBpK7+Mq3dzbJ07VAvVTT1YmU/HZUDEWkVZhqd72+Xgf3hUm5BLSlrp+u/iqS50Ncxf43QTTquFlaWMuHblDieEw77XmBgqxoc2xRfpv+HVf2ai0ecQ2pLqqZr2dgpAHKG9LmJzhRtTzOmE1JMtvOj+5dNQWzvTYTtrMGucw4/udu7frWVqjKntPwv6l46sf08TjqvlF956XurHAPcuEuC0IbN53UPFLYbjJxmqQeM+iFO2RfDr0J8ne1r238G+Ev6siUZW0HTLFvgYDjufM9bJ+Wer0/uRT0KSH7zozvNul7SfGXupQ0VixLllGI4wc6btj9EqmK2V+0Bsr0wVCI5lN+RZ2kp+mViYQ99JLPAK4bndDxSGDNsJbUL2o2330oH6TNES5ZDyk8Zh+RDQbYnvuOuLtIzB8YMTjFU+uJ2neh9QgK4gqmPA4VRqspkFCxbZhpQzupqeo6GMBtsUpzRvDiEQN7u2JcoLEOZQMl3Sz449JVfIjxDarTi4rTJ4kQgmEOKCW0ZQoGiV0+uc6q1lMj/NBPbX+JZLcZqjwPiHnukBGgwVkDS0KKsEgcaF42YGzyScG4cp8Am06kMFO+jP66wxl9AqI163dFdebYf7PPSGNz+t/B5dhnnDuxo7ivLvwmXrKwAPNL8BF1R/XYZrBfYgT7ffwqegMaO9OboBqSs48xNUF0pst9Y+r5NUVdnFmSuqIIwBU1bq07UWdYedQo4mkrNB3W0BAWHav65pBFvS/J7Ld88PF92jvWdF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8936002)(86362001)(2906002)(5660300002)(38100700002)(66946007)(66476007)(37006003)(316002)(4326008)(36756003)(66556008)(76116006)(71200400001)(186003)(66446008)(64756008)(54906003)(83380400001)(91956017)(6862004)(122000001)(8676002)(26005)(6636002)(2616005)(6486002)(6506007)(38070700005)(33656002)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06703B33A1400A409071D27CF6B12A00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2874122f-2970-4dc8-13ad-08d9831bb11c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lcvPLHGlBnrGQKE4IkwNtvjsTgDXHNf7CkKyCFEXkdrCIsTExbHmM2YjJ2FAXuTeWaNLTIepELwMq3wLjSedtLTsaB1VTclj9Weki0rrpn7glLubrtp8rHKO551nXymTKtjrg5WtI9l+B/u1342cLxmN9CjqOMSIjdEo+puADNlJ68YiQjRDhycAniTFqIRTpCR9PpUF4aNjppvGqNc98jhAQyTvZcdTyfurJZTKy6sfr3zDDW8uz1wIg9Oy860qLx16oNp3KrGSte7tsIMtBcePytFf5zS5CliW1E3xxxHeyc5Y51ahRcLvIR6WunmX/RfXvJxrvBpZHgDpSxyiGx3sWptmeaE6+thzG+PHcMGEmQgTVDFXnWE+Pn5yjQDwgkHyK/g+hzPHXa1GlTNOzn5QTvZfJqXQkG7hVQ0p4hrKhGXTWNKSNqsewFvMkroG3fkbXJXxjuk3GSV49QF1jO5LWMHgYmzo6rnLydYZlBNRBLPLsyxOS6P25uCUhAZHMV7iHbx3aHHHMFYzefdSYr1+GzFt4DgBPVRYBadjtOZ8LT8ZmofO8w09Wa4c9C2OJfgePYrc9GTeg9LZpIvQstQtvGtzkd5v7xqF7iNo/vQYHxBYtqShgQTHDWJCnSSO0Gc8e+Z49T62Y4Lj2zqZ85WaUi4pvKjpxusOk/QB5TfvQEYPs2r+Dg/geWVW4b1iW/WylZndlDYqvouE8zqAxw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(70586007)(6486002)(47076005)(2616005)(70206006)(33656002)(36756003)(316002)(6512007)(26005)(54906003)(37006003)(6636002)(6862004)(336012)(53546011)(186003)(6506007)(508600001)(86362001)(356005)(36860700001)(82310400003)(81166007)(8936002)(5660300002)(8676002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:35:36.2934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 946df0d2-12ae-4e94-a32b-08d9831bba63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6828

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Based Linux commit 41e5c0f81d3e676d671d96a0a1fafb27abfbd9d7
>=20
> Import the Linux helper of_get_pci_domain_nr. This function will try to
> obtain the host bridge domain number by finding a property called
> "linux,pci-domain" of the given device node.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable
>  Linux commit-id
> - Remove return value as those are not valid for XEN
> Change in v2: Patch introduced in v2
> ---
> xen/common/device_tree.c      | 12 ++++++++++++
> xen/include/xen/device_tree.h | 17 +++++++++++++++++
> 2 files changed, 29 insertions(+)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 53160d61f8..ea93da1725 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2183,6 +2183,18 @@ void __init dt_unflatten_host_device_tree(void)
>     dt_alias_scan();
> }
>=20
> +int dt_get_pci_domain_nr(struct dt_device_node *node)
> +{
> +    u32 domain;
> +    int error;
> +
> +    error =3D dt_property_read_u32(node, "linux,pci-domain", &domain);
> +    if ( !error )
> +        return -EINVAL;
> +
> +    return (u16)domain;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 3ffe3eb3d2..2297c59ce6 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -832,6 +832,23 @@ int dt_count_phandle_with_args(const struct dt_devic=
e_node *np,
>                                const char *list_name,
>                                const char *cells_name);
>=20
> +/**
> + * dt_get_pci_domain_nr - Find the host bridge domain number
> + *            of the given device node.
> + * @node: Device tree node with the domain information.
> + *
> + * This function will try to obtain the host bridge domain number by fin=
ding
> + * a property called "linux,pci-domain" of the given device node.
> + *
> + * Return:
> + * * > 0    - On success, an associated domain number.
> + * * -EINVAL    - The property "linux,pci-domain" does not exist.
> + *
> + * Returns the associated domain number from DT in the range [0-0xffff],=
 or
> + * a negative value if the required property is not found.
> + */
> +int dt_get_pci_domain_nr(struct dt_device_node *node);
> +
> #ifdef CONFIG_DEVICE_TREE_DEBUG
> #define dt_dprintk(fmt, args...)  \
>     printk(XENLOG_DEBUG fmt, ## args)
> --=20
> 2.17.1
>=20


