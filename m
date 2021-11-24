Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3945B8C3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230325.398175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpq3E-0002TU-Gk; Wed, 24 Nov 2021 11:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230325.398175; Wed, 24 Nov 2021 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpq3E-0002QA-Cw; Wed, 24 Nov 2021 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 230325;
 Wed, 24 Nov 2021 11:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDHO=QL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mpq3C-0002Pg-Hk
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:02:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe09::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12085927-4d16-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 12:02:53 +0100 (CET)
Received: from AM5P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::27)
 by DB6PR08MB2646.eurprd08.prod.outlook.com (2603:10a6:6:20::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25; Wed, 24 Nov
 2021 11:02:49 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::cc) by AM5P194CA0017.outlook.office365.com
 (2603:10a6:203:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 24 Nov 2021 11:02:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 11:02:48 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Wed, 24 Nov 2021 11:02:48 +0000
Received: from e9f3d3264b8c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6227B697-C2CA-4621-898B-BD6CFD951C97.1; 
 Wed, 24 Nov 2021 11:02:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9f3d3264b8c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 11:02:39 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4438.eurprd08.prod.outlook.com (2603:10a6:20b:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:02:37 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%9]) with mapi id 15.20.4649.026; Wed, 24 Nov 2021
 11:02:37 +0000
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
X-Inumbo-ID: 12085927-4d16-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMJyNYNgJdHqUmD7o1LWtmmO1ml0hOJHRWMVoxJO+mk=;
 b=vwzIE3SxzSf0sunzEYYRxT2/bS0Ni977PCR2eBMCm9xnjEEx/rhTkwyMe8GPnJ0b9TKk0ZiZEzSmFhtlKaF7GQfKzd55l/5fdsBQ/k7U0Y+GaoPsE3yKwY9OJt6pv9LghoA9Plv9TqKC+n/VecPjxdzlFviL3RGYMJHSrGLyeS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14b78c0abba0fd7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og2viONCg4DIbOgcV+sIWsSKeqEl4+4KTDM/NlE1DQ8RttBndDQtCSuPY5IQY7D7rdxPstwGVw+ERI4M13yC+ja5DcQsqtNQw8qLw7dtb6YDn01t5yENf+bJmGjNsHPki2aqsq/FeK+8cxWtL7NnFw/gnbhWexM/DYwe13IkpfHeAHXiQsV7m7A8p0Bz+FmY1ILoWEKlLmSxmhQWXPnDebMvFEFggtlepQmvCX957uIdcdxz9d5f80VxuqPZ0ScR7DgFJgXMUeJ5sxwRj0jIJLZJMwuO5irtyNwdL7IRlW4YnIr5Gi55z8jCjcT8H2zskrQISUtcfm2lwhIkoYFq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMJyNYNgJdHqUmD7o1LWtmmO1ml0hOJHRWMVoxJO+mk=;
 b=j87oV6UAThtjhFDE7f/bdtick9GqwUspJiB/THzYEcK1uJw6FWJ7o3L7IH1HEQvOP14yonyQduSoU0f5cnAuuA+e+txm9HQk5ZX0ojK3p6cX/35GxbCMhc6YjGK5BpC+4x+40u/BgY3/s5EjCy55LkivDoaGf4LhJjn8IjUR33XVwX14324EA8u4VxKO4ZemT6OMm/mEh4GwhN8q6fKj7So4duohGJdlFJ2gfLaVGWZ+0W4Y+tqNojDCiBcVqVhT4nyYLRy7V6MIlGyDCfBsFMorhTiHwhF3InQTqfJbf3vNTbm9TOSOFHhjd3UQsHEf6jP0p7TW528ZiZ4FZYPfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMJyNYNgJdHqUmD7o1LWtmmO1ml0hOJHRWMVoxJO+mk=;
 b=vwzIE3SxzSf0sunzEYYRxT2/bS0Ni977PCR2eBMCm9xnjEEx/rhTkwyMe8GPnJ0b9TKk0ZiZEzSmFhtlKaF7GQfKzd55l/5fdsBQ/k7U0Y+GaoPsE3yKwY9OJt6pv9LghoA9Plv9TqKC+n/VecPjxdzlFviL3RGYMJHSrGLyeS0=
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
Subject: Re: [PATCH v7 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Topic: [PATCH v7 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Index: AQHX4QlRvZ/qWKTm3kqr3TSiQ/z7NqwSg4AA
Date: Wed, 24 Nov 2021 11:02:37 +0000
Message-ID: <CD685D2D-93D2-41A4-BD86-6B70932419B4@arm.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-8-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-8-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 621ef998-9f70-4c99-a9a4-08d9af39f3f8
x-ms-traffictypediagnostic: AM6PR08MB4438:|DB6PR08MB2646:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB264620009DC168CE1C5E22ACFC619@DB6PR08MB2646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1agG6fW4KNomDMZQKHlSvrG8etTrLH2rYyMrxNrQg9LpJo3n5wk5uuL4T+pxiuIEwtCqpbijSpvYf3jFr3+CbETbmSwTohquvBbpX8kxiHItWFKtmV/rfiM5/lzTvgcee6yWyY5W+Xoz+ee/mjOH6wjy6Q61vDvLSUa3sM/Sh2KplPBfUv25pDDLsFDco4qaFDvZdmTJ7/Xv25Zlx6NSmw7IVV/dmws3/jjefyFyKrOshqXAF+Yeqk64Eaht2KLFZTk+LgPXXkrmmDDarFySXJ6OkQWsMYIP/NYw4E5IW5RMg7SeogYzUh8vqfkInal8bWksGov3KP6haLvoh45Osowmvnk5oHUE4Hk1My1FhVUlbcei9tNhW+RoTK3/dEge/WqwAbhBjxY5hf8c59LBmLgQ5ZRWqPrnHTq6dh7hnKkKdxF3gSu9uxENRPTdLnDxHOHmg1NSLjn0fry6av1SeIuNyvr8hom1sX9EsXvoBSKHmGl2LXsjuFTnDbz+y+yr0ox+4E24CNuOx0DGylD7CvmVl+iUPyVux972jutcRwD6h+/U6B8z9sF/kXClyiq/7nWHVV7mAZfqYfQQGlfiFqcZmHN0nuETMUbYthBsap5Ys/6v3cPEGw388wPUdDpR6H5GBfBPwfIHWpeakZgxKNbmXUQrlcH+GDTS8QDuXvsabq/gDW+HAKj78K/W+IoG8Ox1C3MyFUvAaAEhCkQkPkyHCLM3KVyogyAnzqbGJio=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(508600001)(7416002)(71200400001)(53546011)(66446008)(66946007)(8936002)(64756008)(2616005)(38100700002)(66556008)(66476007)(91956017)(6916009)(186003)(6506007)(8676002)(5660300002)(4326008)(54906003)(26005)(2906002)(6512007)(38070700005)(83380400001)(316002)(86362001)(6486002)(33656002)(76116006)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4D5BC903DD4F014CB8AFFFA003432A93@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	017e2058-f978-4bd2-4bed-08d9af39ed4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z5mJVy235LBd1KZrujLB54rNDZctAfR7RiMv3PS5uzYl6KrhikhQKnh5F2CUBCHlWBut0MsZlj0x5DXxTcEpZEJAFaMYLBOO8RzypkbuxIx9CuPpDmwYMpmEiIz5ara/ZWdXO4llGS9KDzmuoTsM5C9kyRSC/+W8+5CgciQJxLVALY2buvbiV/X7MHKmAAhuEwkwcSzWwuY5g0Q2Sjq9LXMzEewQUqu8BTniZZuZ8Dy60d69mRCmdrZreEKec7zRAS2PshP6X47zEXj2Et3rRrAvvecWqc0qLptUX9YkgQXpFX+YIqlYJ3Zaw6IKSP0hOrjEUuCTUb/Dm/YuLb4ywLRQxqbOfxrDE1ozdEeQXJcToi5khJ+Qz0g7hsIDOf7SgS/dOWK85J6P339OlD+0CMWaCWFDHpiD14WFkJrTJjpdE+ak2a1IQAe1HacuUxGlM7Cft/bgQGteFoIAu/D5JFWiGBs5ydT+VeK/n+trRdjN9qG7h31g42kaOYa75VAbHTLx9gRDgD92epaQ7nxxh8afM1yXlwhAFxHyUjuTgAe9u1QhuDavqNXyldwlsZtez1ALLEP6s7OOq0Ak3of4LhzYJdoZPVy6qO8OLFf/sDkug/QQFqbbKNN0/uwm83WIS63cNEatAalj72S4fOVJvtrwdvRy/Ef0blOoVbo3ESJyNr3w2B/jKCkkdHGTE8iJBIvAJLjJxVJ7bxQN4wfHhYnVOqW4i/W2kwIkRtHRmhNHPXCsqOn2bNdamT8VBhwo
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(8936002)(36756003)(356005)(70586007)(2906002)(2616005)(6512007)(54906003)(508600001)(6486002)(70206006)(336012)(6862004)(4326008)(26005)(186003)(86362001)(6506007)(53546011)(8676002)(316002)(36860700001)(83380400001)(33656002)(81166007)(82310400004)(5660300002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 11:02:48.9343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621ef998-9f70-4c99-a9a4-08d9af39f3f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2646

Hi Oleksandr,

> On 24 Nov 2021, at 7:59 am, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> There is no reason to use void pointer while passing ECAM ops to the
> pci_host_common_probe function as it is anyway casted to struct pci_ecam_=
ops
> inside. For that reason remove the void pointer and pass struct pci_ecam_=
ops
> pointer as is.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> New in v4
> ---
> xen/arch/arm/pci/ecam.c            | 4 ++--
> xen/arch/arm/pci/pci-host-common.c | 6 ++----
> xen/include/asm-arm/pci.h          | 5 +++--
> 3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 4f71b11c3057..6aeea12a68bf 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -24,8 +24,8 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *=
bridge,
>                                pci_sbdf_t sbdf, uint32_t where)
> {
>     const struct pci_config_window *cfg =3D bridge->cfg;
> -    struct pci_ecam_ops *ops =3D
> -        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
> +    const struct pci_ecam_ops *ops =3D
> +        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>     unsigned int devfn_shift =3D ops->bus_shift - 8;
>     void __iomem *base;
>=20
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index 1b18480adf02..b1a26eb840ab 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -198,18 +198,16 @@ static int pci_bus_find_domain_nr(struct dt_device_=
node *dev)
>     return domain;
> }
>=20
> -int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops)
> {
>     struct pci_host_bridge *bridge;
>     struct pci_config_window *cfg;
> -    struct pci_ecam_ops *ops;
>     int err;
>=20
>     if ( dt_device_for_passthrough(dev) )
>         return 0;
>=20
> -    ops =3D (struct pci_ecam_ops *) data;
> -
>     bridge =3D pci_alloc_host_bridge();
>     if ( !bridge )
>         return -ENOMEM;
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 679fc83f713b..7c7449d64fca 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -65,7 +65,7 @@ struct pci_host_bridge {
>     struct list_head node;           /* Node in list of host bridges */
>     uint16_t segment;                /* Segment number */
>     struct pci_config_window* cfg;   /* Pointer to the bridge config wind=
ow */
> -    struct pci_ops *ops;
> +    const struct pci_ops *ops;
> };
>=20
> struct pci_ops {
> @@ -94,7 +94,8 @@ struct pci_ecam_ops {
> /* Default ECAM ops */
> extern const struct pci_ecam_ops pci_generic_ecam_ops;
>=20
> -int pci_host_common_probe(struct dt_device_node *dev, const void *data);
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops);
> int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
>                             uint32_t reg, uint32_t len, uint32_t *value);
> int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
> --=20
> 2.25.1
>=20


