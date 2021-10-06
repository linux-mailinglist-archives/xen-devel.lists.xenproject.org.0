Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8070423B6A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202676.357670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY462-0003zX-0D; Wed, 06 Oct 2021 10:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202676.357670; Wed, 06 Oct 2021 10:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY461-0003wf-TJ; Wed, 06 Oct 2021 10:24:21 +0000
Received: by outflank-mailman (input) for mailman id 202676;
 Wed, 06 Oct 2021 10:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY460-0003wZ-Ke
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:24:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ffb2dd0-268f-11ec-bf57-12813bfff9fa;
 Wed, 06 Oct 2021 10:24:18 +0000 (UTC)
Received: from DB7PR03CA0096.eurprd03.prod.outlook.com (2603:10a6:10:72::37)
 by AM6PR08MB3958.eurprd08.prod.outlook.com (2603:10a6:20b:a6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:24:15 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::c9) by DB7PR03CA0096.outlook.office365.com
 (2603:10a6:10:72::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 10:24:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:24:15 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Wed, 06 Oct 2021 10:24:15 +0000
Received: from 1559fed18904.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 96065CF1-C33A-4C57-83B6-8C45D30A5200.1; 
 Wed, 06 Oct 2021 10:24:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1559fed18904.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:24:06 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6776.eurprd08.prod.outlook.com (2603:10a6:20b:350::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:24:02 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:24:02 +0000
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
X-Inumbo-ID: 8ffb2dd0-268f-11ec-bf57-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3j4r5YO2fyOp4hY/NACH/zn4szN890eJEQyJ5RSjEk=;
 b=tM4QdeD1eu1RF7TAz0SH2aMPkmPP8zEThkv+kIIxv6wzQ54bhnzQdMwBRdmy3m07s3eaJfy2g5dgg6rBmh4qwMhQPtkBx37zvf40tt8Z8SmiWj4er2qm2a2N8nIRSLNHR2v7rOyHrbtViJraorTc2EJ/cpNwp7ZO/HqhiLTqjfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f830691af9f06b86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgDY5bTzQ7na6nyrHcfohSA9FHiNesSEKMwzN2s/41xSzFCk/4hwbuHeHs75ZNzskKOxGdopjBSdU7s5TYPQ5i3XWXto/JwhQer3kQrSgEreRjSAxZx6LL4YdGMQKjoCKerYeIAzrUoxi1FXJclZLgXWbILEA3OexRBfgcRGT73dj01FOogYqInl12GZPlN7jEYvdgBJXW/keG9+Ao0RQ6ezO2c8eR5LZcRuVimzeNS6h14TixbR3XUMU2qQFlg0gRLkkPyhOVJZcqfEabyFenGJL8apIlMHAsYN9KT2J2Xqf7jbFhtGAauBBVlMJCzsPP1wivJQV2UHewPv1G1gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3j4r5YO2fyOp4hY/NACH/zn4szN890eJEQyJ5RSjEk=;
 b=D3X2jugF3MLzSg6UWuitE4p7eCNKdrfq+T8KXseKksoIHd//5kWjH4mM5UzM9VRUe5aSvapd32M2LbT/NeMscH/3CWseqizqHdHB6DZcF4UFn416RZiVJ/rwXPE9eO1/gkLUgNFKp3ySPzxYIt0ylyChzGDrA0X9twE/y8m2htF7wZYiHJhu4cAbDQK4Lt/IEGiWr8+PP59jIQ01m/wDnZk0O6ZHf9tWdGT/11KxrFOaNhWJKdOkPRqetZ2Im7ss0mCpqaSinuTy1Un8vTE4EhToYUAMCVGyCzT8jiby+kyZalxLjMCW+iQxHhfe44mCYaDXvEDzi1rgdlSdUBcjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3j4r5YO2fyOp4hY/NACH/zn4szN890eJEQyJ5RSjEk=;
 b=tM4QdeD1eu1RF7TAz0SH2aMPkmPP8zEThkv+kIIxv6wzQ54bhnzQdMwBRdmy3m07s3eaJfy2g5dgg6rBmh4qwMhQPtkBx37zvf40tt8Z8SmiWj4er2qm2a2N8nIRSLNHR2v7rOyHrbtViJraorTc2EJ/cpNwp7ZO/HqhiLTqjfY=
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
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v4 03/11] xen/arm: Introduce pci_find_host_bridge_node
 helper
Thread-Topic: [PATCH v4 03/11] xen/arm: Introduce pci_find_host_bridge_node
 helper
Thread-Index: AQHXuSnbk6lAyqcLOUmLtP1GAsLbT6vFxjwA
Date: Wed, 6 Oct 2021 10:24:02 +0000
Message-ID: <DFBD9E2E-06DB-46C6-A807-FFCC442E245B@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-4-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-4-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 36543349-8e8f-4eda-253b-08d988b372d7
x-ms-traffictypediagnostic: AS8PR08MB6776:|AM6PR08MB3958:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB39584E380B1E11942473002DFCB09@AM6PR08MB3958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 15bnOmV3YGGbIHkxpw0Al5Py95K6baXf78avk6FaHSDq9Cr7Ny6h4ko+vQb3PgjFbLqqIYZYsuKT2WX8sR3bfgJ6G0N+Gd15uGLbdaXXzBIEkTsK+7g1qvEqouP722rMusx9f1c3Bu3rFMilL+UaDv+qNjYcSvWm0TBWgx22S7JUAzb36xT2+fbNQEEgpmygCulisE24P6vdqmIKDuUYlnAdeN4QkRHYGsWRD9Z//50Xjgq4tCtRZZYWApZt9iGi8k79pFmFjsRX+XD6kGHyjkqqh5M/ZGw9lvYK05PC4GPw0wbb0bf4EyL5hcUCi/BvYGBELuTZU+95oWcz6v033qWooeR9OQ7Qf6FL8m7mIMNQF9loRHyBzh3ZbpbuGxFctQIVniGz603MvXIcn3eJdcjyNYTGlLJGh7zm3RqhmB4y29Vxp7rraV8XXP5qMz91LDsRuJOQP+Kvi4IcDJbiZiDf/irgjqNHOXSEmxyuiLBoduR9PsoGVHEyo6/RYWkTQ2avEYb39cqwFCW+qU5LdLNRa7S0uolJ/VAH9gAY/j5qLgDps5g2qZvBARRJ5YcIaqF3qf/3TGnCn3vMj7ryvCkQ63y7ZOIZA7STsmwF9iI+9mh6z3dj1KH5vmKqB6tO31lqRHhGH9zGDnzRUKOA2hepAokWiyHI5Fyd6tJqJ6B51ehD0VtCPvkclh5Md453uj4cjpWqK5UFeadtMqIM5AyJv4KiPYAU2Gtk6nXoWyCDa4Yk0YEec4Ii6k5ItDxH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(316002)(38100700002)(66446008)(71200400001)(6916009)(53546011)(33656002)(5660300002)(508600001)(6486002)(6506007)(2906002)(86362001)(7416002)(91956017)(26005)(66946007)(6512007)(66556008)(2616005)(8676002)(76116006)(4326008)(64756008)(66476007)(38070700005)(8936002)(186003)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <11E45BD6FBCA4B44A6035FE2CD4B85AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6776
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7931c1d4-eb0a-44af-6c1a-08d988b36b07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1GqW4XFjv0by59ssFhbvgeViU4SH6LuIge8u6yr+ICuTXDXzLkihP8zD/NUoeQw07nblWXM4/7Q3JngX8kq39Y5KE2+Yjsku0ARIKxQ4LO227wmdLapP1eHbULldoD+Rjd6UpGYiLwBdeHyDXhthGaO1cUVUjqUEkotPLWajhSVZlihTOL7BUbfCIX6L93nCjFq96st4/YpxtJlcDZx1y/29UgcsG3m20R5M/TBPyvjKWr8OJzgG6bnxQBVS7BK0+ql5Ec34L1a9cQJ0kTh9r7lDK/e1P27RtnfrHGmvGsb4xOztVDR4GX53occmLwxPJO9udQqLedNbHyOuPw7JztLZX5axHMuyIj7SV/aMNsvfDvlliSvkI2r1yZQ/WY778Qou/IfXc5v6PHPP5KSYSIKdGcvtxtj4vgvUhh7Id7FqutfbjgOD8lA8zWQnGRmUnKKcSanCIbFweyNYG1wqX3N1CX7OqIwICw0q76nodnMEOPH457jNBNPTR8VHfoP7aCjMXV7ZwwoZq3qGMZsmdsddNeqexgfI/OVAVAd5vDYaavP+D9FO3NXZWumx8a+y9GGogyvE+0JKjjMPkVju8BihOtsgQMf20DD7ns2ysrqj06RSr63AHQlp2H6EY3rL+v+Iq7EYBsLP8l8BoY5soGqaUGD8tPkdoZ4tqHJCWxEqAVEoSCarMzNQuSpGOlKttO0LkW2mzaxj6EAT1RnJAQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(356005)(6512007)(107886003)(70586007)(70206006)(2906002)(81166007)(6486002)(54906003)(316002)(4326008)(36756003)(6506007)(33656002)(186003)(47076005)(36860700001)(26005)(53546011)(82310400003)(336012)(8936002)(86362001)(8676002)(6862004)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:24:15.6791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36543349-8e8f-4eda-253b-08d988b372d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Get host bridge node given a PCI device attached to it.
>=20
> This helper will be re-used for adding PCI devices by the subsequent
> patches.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Since v2:
> - !! dropped Stefano's r-b because of the changes
> - s/PRI_pci/%pp after rebase onto Arm series
> ---
> xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
> xen/include/asm-arm/pci.h          |  1 +
> 2 files changed, 17 insertions(+)
>=20
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index 593beeb48ce4..592c01aae5bb 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -276,6 +276,22 @@ int pci_get_host_bridge_segment(const struct dt_devi=
ce_node *node,
>     return -EINVAL;
> }
>=20
> +/*
> + * Get host bridge node given a device attached to it.
> + */
> +struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct pci_dev *pdev =3D dev_to_pci(dev);
> +
> +    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find PCI bridge for %pp\n", &pdev->=
sbdf);
> +        return NULL;
> +    }
> +    return bridge->dt_node;
> +}
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 603a1fc072d1..e6d4000e2ac8 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -99,6 +99,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *=
bridge,
> struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bu=
s);
> int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                 uint16_t *segment);
> +struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
>=20
> static always_inline bool is_pci_passthrough_enabled(void)
> {
> --=20
> 2.25.1
>=20
>=20


