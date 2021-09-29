Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0541C5E0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199157.353050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZrL-0003Ey-T3; Wed, 29 Sep 2021 13:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199157.353050; Wed, 29 Sep 2021 13:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZrL-0003CB-Pc; Wed, 29 Sep 2021 13:42:55 +0000
Received: by outflank-mailman (input) for mailman id 199157;
 Wed, 29 Sep 2021 13:42:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVZrK-0003Bc-GW
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:42:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61a74d2b-70a9-4362-8321-dad6a140112e;
 Wed, 29 Sep 2021 13:42:53 +0000 (UTC)
Received: from AM0PR03CA0088.eurprd03.prod.outlook.com (2603:10a6:208:69::29)
 by AS8PR08MB6487.eurprd08.prod.outlook.com (2603:10a6:20b:33e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:42:51 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::1) by AM0PR03CA0088.outlook.office365.com
 (2603:10a6:208:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 13:42:51 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:42:50 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Wed, 29 Sep 2021 13:42:49 +0000
Received: from 88a2a7138c70.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F82425CF-A882-4795-80B8-3168991BCFD1.1; 
 Wed, 29 Sep 2021 13:42:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 88a2a7138c70.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 13:42:38 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5724.eurprd08.prod.outlook.com (2603:10a6:102:85::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:42:35 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 13:42:35 +0000
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
X-Inumbo-ID: 61a74d2b-70a9-4362-8321-dad6a140112e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK6htvme9xg7hSsrL/AXnqo3AzT3yL+ksC2ZRu1U1qg=;
 b=0+K4YQneDNcEeHXLuq6FC6kiUCJsOlre8UvhbKZXdTbxwqZ/laxWaVrVTNx8cHIff2RC2xHiHkrLNWf0rxH16Ap2C2gmhqPOCuEbitDUgx+yAtBZe1Mw5sNx+VDxCdAuV8oU0+J21rBafzpD/vxO77vlgoRPOwIF0y3dbJNWEIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90eb376cf091c9cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTo9e3USnb24yQS2GGeRJYqBEAt9FYuw07O+0KcFsuJRYCU2fdNm9dJOWP0a4RKXWPdHoISjiWODkCMYeF9Pep1wc0qIReCLim+wihSS042IcmLht7a+oXwOH1d43cpA83cpltNZf4LhbgW6DECJHPxVdOAIhLljjPG96uO4SmxE0N/Pf8/7UQ0iBVcU/3Ni+ypVcaO1u8jaN8/zquNCbGjP/qsQBZ7JT4OjY2w27vnMgzXe5EfClTKrbn1M6Z2/mX3ySLpdBhE5tqCDnYVejHrMQBK6dvghN3fT0VmspCjujvaxkcOnwV9WyRfZnjUxOvziWBZa063T3L0Dvyw+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GK6htvme9xg7hSsrL/AXnqo3AzT3yL+ksC2ZRu1U1qg=;
 b=FtGMC0aBXYDehbEir/MVTetpuX2CDW8PFfdMzOO8e1MZrhjVr+Ps7ifMRD4rbqwYV4c4bv8+Fn+gHFaFoDYg5VIjy6ebc89QwtuFDIeB/yHa+fUSGwZjNocZc8jG2fITy0EJ+kzEb2kq7PYyVT1/DDLNSFYFzsCwCOELhbxbbDQ81RFkPZr/pSbZZnHAbIWla+//L+yJ2Hh+GbWaQd5M+KOzg+0drStgSjDDcpJNm9ThD4WQkkAgqVK7YNp1k1dIZEAPDeeTAurbPxaCCRe1tCP4JgI19qM294wzsnU1Xhc/ItZnFpGh7YlOPjejxBeov4PPj6mqqwWVtd8PWUNOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK6htvme9xg7hSsrL/AXnqo3AzT3yL+ksC2ZRu1U1qg=;
 b=0+K4YQneDNcEeHXLuq6FC6kiUCJsOlre8UvhbKZXdTbxwqZ/laxWaVrVTNx8cHIff2RC2xHiHkrLNWf0rxH16Ap2C2gmhqPOCuEbitDUgx+yAtBZe1Mw5sNx+VDxCdAuV8oU0+J21rBafzpD/vxO77vlgoRPOwIF0y3dbJNWEIA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/17] xen/arm: Add linux,pci-domain property for hwdom
 if not available.
Thread-Topic: [PATCH v3 17/17] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
Thread-Index: AQHXtJYkOb3La5Yps0eoFpxXuc4i76u7BooA
Date: Wed, 29 Sep 2021 13:42:35 +0000
Message-ID: <7EA77A3D-68A7-4738-A7B6-0C144BB741A1@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <f290d8e2f9b3780c5a956a8032aba6f35de83a90.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <f290d8e2f9b3780c5a956a8032aba6f35de83a90.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f8deb226-96c6-436a-59e4-08d9834f0802
x-ms-traffictypediagnostic: PR3PR08MB5724:|AS8PR08MB6487:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6487A3940B9665D3405D9EE99DA99@AS8PR08MB6487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fo5GyJJWPQGZnNJXFjg2eP5jq1vU7ydatcyPjoLg/xAEI9WuxNzu4luVZoQPaEbdIl3wkBVvUvJFMDQvVhitS6/F5IX8BT7f3PgPz4jYcpGf6xl7TNY3N2HqCZ2Bxa4UPThQWW/JH8hMooZHdWxgHWi0z3dNXkNgIxpcFf9tORJ98p/1v5dcgGBXV/ecTkgGOi5LKFpJTXr4RmtdYwvlkpBBEGhcA2AfLIdxOvVsF4byWAgZN0waFnFNLEDV8Q1sB9Nex2pplWRX4czvHrh9hRhJsLf57YPncEV7blh4GSFsqZ4V/ztZtcePGrIMqvjXPjUwMDcBhyEeZrihHc0smtJ3+YUhvydHiYjyzPYCZAT6Eamq1AvHJS2HTa9uVGf0bQ/6ovGsj6pHlH2zGbrkaf/2iYiFCPrXG3zjb8PDkZEMhXNr/HHK0db4FrIO4b9ur/LbxRnuC1IV/hxDDo6UjCrL/eJjEV2ljIKxhCIo78J0LYQgg9exrmBNqEzmv2rzVECuEistgHwt8yEWe2oBKTgxB9xcTLhSEuIm8kBed0VDznbu/YlkpNg9vXXg74kC78XK/eoLM09Wq7YcFVLU5Ssob+ruIYIlnjmo0YHEqFd+mh5+HyblMcVph5mapdN569tZnYJ3fK/qEne07cNYr83+5E8hdrdUVnVxz+Xkcok5A2Bg2hHnUocsvrfNX9S05GYikT7fsrOs1i0q5oUbBZn3CF24Uno350N6XseBoHN/JhLCOJ7qRZLJUDUdcLRr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(53546011)(6506007)(2906002)(122000001)(71200400001)(6486002)(26005)(33656002)(37006003)(36756003)(6512007)(38100700002)(2616005)(8676002)(4326008)(54906003)(64756008)(6862004)(316002)(186003)(8936002)(508600001)(66476007)(66556008)(66446008)(66946007)(76116006)(86362001)(91956017)(5660300002)(6636002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9348349101CA564B9CEAE45AE9C5CA27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5724
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	41b3e227-560c-43b1-b2e4-08d9834efebe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QRZjsde9bFpXxQoC6ElTn8lJzoZoKwUDziyKzQNXfUEZhhAaSXHpNOOHKcYwyUFkGBB7xQDBVhoLp/0W4yL7bY2HLwbqsnCOUOJ0JyVQAPo1HvekNb/dCP/G+muwwh0G/i/gUweoKGRAoyp7qn9Tdol25/CkxZDcAUy2whAjBE0lj1Ye7PHuweAmjS2N+fB46Uprws3bMuz3yZP8tr+duls0ZklcnPQu0CUCir5ML0NjucEMD/JvSOpqSIJrOffKTdj/cDj6JY3c9P4h6j8ZkYnvKB3h5ycK65DJNUPjPd5i29bkpeHSariOSEfmm7pmeqJqSf1XJj7g4KiDp4DyC8dkNamlAFYfvdjZPDXJdk1ShVf+u+bUGDGxS6FWeqwudAHZBUNMyVrXaSEIWgilh7qopq/mSmYN/23u1vd6LlzcbienwmYPDCVcRFCp23NmlL7Duinbt/th/vYAi2YibiNVaQnoN5hD9SoxXQE77mHxi9riaoTHU0fYnl+pIQhdDLVIXsmKi90gCYKJBexYo7gtTEjOkvoRbINInhuSJjiUjBlmF6WYXBcJd5hQXRlLOc7+Lhx4r5la+qLlI5itJtCxGigcmwX497vmpmP0L5EQgrOOTFt5zwdcMws0YaG0hWA7Iw5BZyDnJn/q0m85UNXmIfb5ngC9Ga7oPMIh2HJNRoB6QLNFr15IyZBWgrn40vWUo3flFYanTl3Dj/I7nw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(70586007)(70206006)(2616005)(356005)(8936002)(82310400003)(336012)(54906003)(6636002)(508600001)(37006003)(53546011)(6512007)(33656002)(81166007)(2906002)(36860700001)(107886003)(8676002)(316002)(36756003)(4326008)(5660300002)(186003)(47076005)(86362001)(6506007)(26005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:42:50.8543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8deb226-96c6-436a-59e4-08d9834f0802
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6487

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> If the property is not present in the device tree node for host bridge,
> XEN while creating the dtb for hwdom will create this property and
> assigns the already allocated segment to the host bridge
> so that XEN and linux will have the same segment for the host bridges.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Use is_pci_passthrough_enabled()
> Change in v2:
> - Add linux,pci-domain only when pci-passthrough command line option is e=
nabeld
> ---
> xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
> xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
> xen/include/asm-arm/pci.h          |  9 +++++++++
> 3 files changed, 46 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1731ae2028..026c9e5c6c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -743,6 +743,22 @@ static int __init write_properties(struct domain *d,=
 struct kernel_info *kinfo,
>             return res;
>     }
>=20
> +    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "=
pci") )
> +    {
> +        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
> +        {
> +            uint16_t segment;
> +
> +            res =3D pci_get_host_bridge_segment(node, &segment);
> +            if ( res < 0 )
> +                return res;
> +
> +            res =3D fdt_property_cell(kinfo->fdt, "linux,pci-domain", se=
gment);
> +            if ( res )
> +                return res;
> +        }
> +    }
> +
>     /*
>      * Override the property "status" to disable the device when it's
>      * marked for passthrough.
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index c5941b10e9..593beeb48c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -255,6 +255,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_=
t segment, uint8_t bus)
>=20
>     return NULL;
> }
> +
> +/*
> + * This function will lookup an hostbridge based on config space address=
.
> + */
> +int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                uint16_t *segment)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->dt_node !=3D node )
> +            continue;
> +
> +        *segment =3D bridge->segment;
> +        return 0;
> +    }
> +
> +    return -EINVAL;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 5532ce3977..7cb2e2f1ed 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -90,6 +90,8 @@ int pci_generic_config_write(struct pci_host_bridge *br=
idge, pci_sbdf_t sbdf,
> void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                pci_sbdf_t sbdf, uint32_t where);
> struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bu=
s);
> +int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                uint16_t *segment);
>=20
> static always_inline bool is_pci_passthrough_enabled(void)
> {
> @@ -104,5 +106,12 @@ static always_inline bool is_pci_passthrough_enabled=
(void)
>     return false;
> }
>=20
> +static inline int pci_get_host_bridge_segment(const struct dt_device_nod=
e *node,
> +                                              uint16_t *segment)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EINVAL;
> +}
> +
> #endif  /*!CONFIG_HAS_PCI*/
> #endif /* __ARM_PCI_H__ */
> --=20
> 2.17.1
>=20


