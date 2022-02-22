Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3B4BFDDA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277110.473538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXWI-0003pc-JX; Tue, 22 Feb 2022 15:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277110.473538; Tue, 22 Feb 2022 15:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXWI-0003nZ-GI; Tue, 22 Feb 2022 15:56:06 +0000
Received: by outflank-mailman (input) for mailman id 277110;
 Tue, 22 Feb 2022 15:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+sy=TF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nMXWH-0003nR-7y
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:56:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe09::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01e285b-93f7-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:56:04 +0100 (CET)
Received: from AS8P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::25)
 by VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:56:01 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::eb) by AS8P250CA0020.outlook.office365.com
 (2603:10a6:20b:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27 via Frontend
 Transport; Tue, 22 Feb 2022 15:56:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 15:56:00 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 22 Feb 2022 15:56:00 +0000
Received: from dc9c918bfe2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65346AE2-B0A3-400F-A789-9C262FBD1106.1; 
 Tue, 22 Feb 2022 15:55:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc9c918bfe2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Feb 2022 15:55:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3132.eurprd08.prod.outlook.com (2603:10a6:5:1c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 22 Feb
 2022 15:55:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:55:52 +0000
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
X-Inumbo-ID: f01e285b-93f7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q96EPRLN6lOCNXhoIsVcJhkAY3USlWnDsqaneI8vgz4=;
 b=rRYzK7LH7nuthG+zYZYDz9xA6r/WapHStNSmKcbfulxZy4V2JqYVwLvxSzcg3Pal2olv6Trnw00betP81usxyKTJBkc1RRnEH47e1ut+Dc0Z4fg9jDMiNYTQlpSd9jvIfIqmQVB6EWcOjdoR0IT7ndoIOHktp7w9eeMnydJi/+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 949761d3e2e41497
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKspROY1vWnGi2pQPWaMwaTuhHxt1wY0VuIn1jtz9NV/2CSOY54BEsfiswIEDTS4vrlmE2D3zOdIamSUNdFTY37i5Yk+eTPKfwchLgD3monqqSW8ra/ZT0MHNiRCnGWOEFcv+u4PEFIq6/F2dW8WZuLRueV3fjrIbpZqTuENs25BOgamww4Wlzv7EJSDIqq76nAvi+oEtKBHGzX5vdZZxPLHkJfQ9J2xmztthBFbfc2vFlPXc4LmHF4WAtXcqs2cF6GEwYvHaSsyF/9DAuhFMI1c47TtcNqtq/sO7+6PvJ8EXLf4A9yXO3UfRHL+4amx15fuO647JXQA17xEcilZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q96EPRLN6lOCNXhoIsVcJhkAY3USlWnDsqaneI8vgz4=;
 b=WJgfk7TEGoNN2IhcbRYA8+nrboV0izVdnEnBmuDSOTeLb6zsUO/9xnSR/wXSr/QFcbP0Zu5doTiTOklI9+0nT7zlhbRaHwuoSUvpmssKknrSMB6Zw2iyHIAfYt5xrugkk3qD0TlDiCZ/4vJEifSE/LUpeWXL2D6oXNC+qNgISsG23P41dW59ctgyIdBVVhBwETnyVY2eFp3DUB00aNc/GXwH4RMN1xq6Q7SSJiz052yVHIfhO0cty4WteKa/60RBUrJakvxfk0DnfEdi1aioiEvyW1zrAilfNCBaZG3nFaDjN3MNnyuUSQlGb6MWSVc5hjUcE+bLbGFQ2e92wmKgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q96EPRLN6lOCNXhoIsVcJhkAY3USlWnDsqaneI8vgz4=;
 b=rRYzK7LH7nuthG+zYZYDz9xA6r/WapHStNSmKcbfulxZy4V2JqYVwLvxSzcg3Pal2olv6Trnw00betP81usxyKTJBkc1RRnEH47e1ut+Dc0Z4fg9jDMiNYTQlpSd9jvIfIqmQVB6EWcOjdoR0IT7ndoIOHktp7w9eeMnydJi/+A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks}
 arrays with XEN_PT_LEVEL_{ORDER, MASK}
Thread-Topic: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks}
 arrays with XEN_PT_LEVEL_{ORDER, MASK}
Thread-Index: AQHYJwz3/5rVW4vmxU2XDig/F0ROyKyfuzqA
Date: Tue, 22 Feb 2022 15:55:52 +0000
Message-ID: <66B2C3AB-A61C-4CC7-8249-AA925B2774FD@arm.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-4-julien@xen.org>
In-Reply-To: <20220221102218.33785-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be5778bf-31dc-44bd-4577-08d9f61bd297
x-ms-traffictypediagnostic:
	DB7PR08MB3132:EE_|AM5EUR03FT043:EE_|VI1PR08MB5486:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB548684782C48EA6360EABEC49D3B9@VI1PR08MB5486.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HpZlxlUtn6Dz59QGXFmrcDI0nUx0e82yqeihGJXEq5D3s+29T7W8RGgN2PgApv6Qe3sHTwqtOyo+jI74tFqgK7UKqy7yhlqppLKi9cfsTWcdkxI7VXPh48G4Qp0mg82mJAZQiAkITN8cnIdaxk4gwBIouGxsPo8FcO3RVnGr0M6cmagjgHrK/8AZK89kL2DUicBofMMXNnPD0GF1XE9ZMJg0IvRPNZdITaCUH7aSvWt5MVWwEp4sUyjWAOYwkVB0GfzDJLNJ3P8k49oUvZ0GqnDt2syHoc7PsEV7ZM2p6rtfmaejjT6JKWkZ62pv7WxakwH+niH3r2wcUR/Q8CaMklSo0l/w1X3Exjhp4hRexrOSdVYSMyoPR4b9ean23LElRgGk68rFtvJ3wzCXez8GKPILjx+NUwjfZaXE7fMN/20rdLNJtpqVI0nltfamGliJJML80QVltlmWDg8aGJofK7LpgVja3whdz9ITD+Of1fbwcecog2zSANjSmLJvi8WRRfhmyYqnOSAKl/2bHXt3O1R0A96sHuw9FcB+cHF1oJY4UXksQdUgha/oM+o2Qvf5EvsyHRcx2i1WWbLlnGkgGB2A5hRTf7ElmaZ3zvkU5kT+ATEuNlGhMMYnyHjdq4ARmbNpzq0SlFE9nQxATLEPMHbqijlgT7zB3gZpOWhP6i62JsT/tc9lRplQxB3FtcZD38Nnim8F3g00LUmBid6jA1sPOoqv2H7saO9ymv975QjD+nOZuEuLr/LiGsFTM4h5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(64756008)(66556008)(38100700002)(66446008)(38070700005)(6486002)(8676002)(122000001)(66476007)(66946007)(91956017)(5660300002)(6916009)(316002)(4326008)(54906003)(76116006)(83380400001)(2906002)(8936002)(36756003)(2616005)(33656002)(71200400001)(186003)(26005)(508600001)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6279783AE37A9848A8F08CBEB4363C38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3132
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bc82c72-af39-4a5b-3e78-08d9f61bcd8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iM8NJBTTKjYIT/DRQvwPUbJIhzdX0YUiIyoBc4erk0KowV321XOYT1+UQAsRWeEoz/GFgoXMRqjjQSbUYMSa28qILFfSzIab7T89EEep/Cqz/tWVbMFAhtkDK9q+HSzPXj2X6E3uhzKF262AzQoo5pQl/zKH2/i1CAqFeQC5FeePmY5NyLN5qcr/2LwK+h1ErIPwc9LyWcuR28tC5sjC169V7766sqMgmCdyzQVVor0tbqXCyG/JnWIiVufHzbrtVUYSWE2Go4sBSDfWbEcSsPVsvNHtfT9rieZ59OBA84UKGnyvSBA8zSdYrLp2eHHKcMq0dCzvGO7rM7Pve8lqFDR9dXmnRfOOIEuEsBcUHFhdRNQ0qNS0sXKErwlBIAJCi9b1JjKot6RCpBGYku0Ovf8fGFhVMFqyV0B1/6BzdEYHROAi5keUB3h0f/GREltenBSyBR4zoDo7nEhE2n7/fDoksNtt+zkVOo2vXBNHEBx3rF7vnT29qRyAhta0wAXKuvBbtOQXUkWxRkUr+bVb5Y8dpZkHDNbOFNmubSFAEoqHBRCWt+6psl1oIgGu5+FQMcnY8gsvbydYWb57klMB+3gNMT+vMMQSLXvGlIxVjK9hggoHoB88vU4/K/da5zKO6W6Q7mAT0gpqcT0NDCI2gC4y49WUT1EBJgTncmV2Kh64l4t3pr0y4DJ9eDpfsQjm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(2616005)(40460700003)(33656002)(6486002)(6506007)(6512007)(53546011)(107886003)(508600001)(47076005)(36860700001)(2906002)(186003)(5660300002)(4326008)(54906003)(8936002)(26005)(8676002)(316002)(356005)(82310400004)(86362001)(336012)(81166007)(70586007)(70206006)(83380400001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:56:00.6689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be5778bf-31dc-44bd-4577-08d9f61bd297
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5486

Hi Julien,

> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The array level_orders and level_masks can be replaced with the
> recently introduced macros LEVEL_ORDER and LEVEL_MASK.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

One open question: At this stage the convenience aliases that you
kept in include/asm/lpae.h are used in a very limited number of places.
Could we remove those and use only XEN_PT_LEVEL_* to make the
code a bit more coherent.

Not something to do here but could be done in a following patch after
this serie

Cheers
Bertrand

>=20
> ---
>    Changes in v3:
>        - Fix clashes after prefixing the PT macros with XEN_PT_
>=20
>    Changes in v2:
>        - New patch
>=20
>    The goal is to remove completely the static arrays so they
>    don't need to be global (or duplicated) when adding superpage
>    support for Xen PT.
>=20
>    This also has the added benefits to replace a couple of loads
>    with only a few instructions working on immediate.
> ---
> xen/arch/arm/p2m.c | 17 ++++++-----------
> 1 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 493a1e25879a..1d1059f7d2bd 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -37,12 +37,6 @@ static unsigned int __read_mostly max_vmid =3D MAX_VMI=
D_8_BIT;
>  */
> unsigned int __read_mostly p2m_ipa_bits =3D 64;
>=20
> -/* Helpers to lookup the properties of each level */
> -static const paddr_t level_masks[] =3D
> -    { ZEROETH_MASK, FIRST_MASK, SECOND_MASK, THIRD_MASK };
> -static const uint8_t level_orders[] =3D
> -    { ZEROETH_ORDER, FIRST_ORDER, SECOND_ORDER, THIRD_ORDER };
> -
> static mfn_t __read_mostly empty_root_mfn;
>=20
> static uint64_t generate_vttbr(uint16_t vmid, mfn_t root_mfn)
> @@ -233,7 +227,7 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain=
 *p2m,
>      * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
>      * 0. Yet we still want to check if all the unused bits are zeroed.
>      */
> -    root_table =3D gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] +
> +    root_table =3D gfn_x(gfn) >> (XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL) +
>                                 XEN_PT_LPAE_SHIFT);
>     if ( root_table >=3D P2M_ROOT_PAGES )
>         return NULL;
> @@ -380,7 +374,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn=
,
>     if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>     {
>         for ( level =3D P2M_ROOT_LEVEL; level < 3; level++ )
> -            if ( (gfn_x(gfn) & (level_masks[level] >> PAGE_SHIFT)) >
> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT))=
 >
>                  gfn_x(p2m->max_mapped_gfn) )
>                 break;
>=20
> @@ -423,7 +417,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn=
,
>          * The entry may point to a superpage. Find the MFN associated
>          * to the GFN.
>          */
> -        mfn =3D mfn_add(mfn, gfn_x(gfn) & ((1UL << level_orders[level]) =
- 1));
> +        mfn =3D mfn_add(mfn,
> +                      gfn_x(gfn) & ((1UL << XEN_PT_LEVEL_ORDER(level)) -=
 1));
>=20
>         if ( valid )
>             *valid =3D lpae_is_valid(entry);
> @@ -434,7 +429,7 @@ out_unmap:
>=20
> out:
>     if ( page_order )
> -        *page_order =3D level_orders[level];
> +        *page_order =3D XEN_PT_LEVEL_ORDER(level);
>=20
>     return mfn;
> }
> @@ -808,7 +803,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2=
m, lpae_t *entry,
>     /* Convenience aliases */
>     mfn_t mfn =3D lpae_get_mfn(*entry);
>     unsigned int next_level =3D level + 1;
> -    unsigned int level_order =3D level_orders[next_level];
> +    unsigned int level_order =3D XEN_PT_LEVEL_ORDER(next_level);
>=20
>     /*
>      * This should only be called with target !=3D level and the entry is
> --=20
> 2.32.0
>=20


