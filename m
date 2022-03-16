Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051194DAA79
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 07:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291056.493803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUMrq-0003SE-3K; Wed, 16 Mar 2022 06:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291056.493803; Wed, 16 Mar 2022 06:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUMrp-0003QP-Vw; Wed, 16 Mar 2022 06:10:41 +0000
Received: by outflank-mailman (input) for mailman id 291056;
 Wed, 16 Mar 2022 06:10:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aGOr=T3=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1nUMro-0003PX-Od
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 06:10:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2bfec2-a4ef-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 07:10:37 +0100 (CET)
Received: from AS9PR07CA0012.eurprd07.prod.outlook.com (2603:10a6:20b:46c::17)
 by VI1PR08MB4398.eurprd08.prod.outlook.com (2603:10a6:803:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Wed, 16 Mar
 2022 06:10:33 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::a7) by AS9PR07CA0012.outlook.office365.com
 (2603:10a6:20b:46c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13 via Frontend
 Transport; Wed, 16 Mar 2022 06:10:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Wed, 16 Mar 2022 06:10:32 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 16 Mar 2022 06:10:32 +0000
Received: from 780adab837f5.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CAC35A3-B512-4476-8426-33C97EF2EE70.1; 
 Wed, 16 Mar 2022 06:10:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 780adab837f5.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Mar 2022 06:10:22 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by DB8PR08MB4074.eurprd08.prod.outlook.com (2603:10a6:10:a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 06:10:19 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::16b:a4c0:c06b:6fc4]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::16b:a4c0:c06b:6fc4%6]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 06:10:19 +0000
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
X-Inumbo-ID: cb2bfec2-a4ef-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13dVwcIeBc/+Ms5FyRQcakRJCpzEmRV+3eVQosM2yJ8=;
 b=WVdX1vdJlil+0Bkdzcpq1spJwwrZHMjihDZXhHlTFnbUkVRUmzIyQbtQNer37Mu/6BGFJuvP+5JJpmx5vao7N/+qcoZXt/91GLZ4nB/HsXCQ8UoZKmnzLj9RNps8lhZns7SUuimZslYeMCWmubElHFmYhefbgtkEU9WSex/a0/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cjs6lv4gK9qU/4zDCGAcScZ06PlnyvTY9zS41aGABtHV+Lt8o6i8n/+a4Cd8BfWCLsPU/A2p3jtYbcgyHK6t3y432oHvmUhGbHePugyezXc19v4NIDirgfV+WqL7/NlVAhw42gBjg+BoxRzoiP7JXool4edRfHxXaYFFyMkyDVAr/ozG/i3wyp2hwTWn1BTj/nW2fPRIPahRXOpy+ztzVpHA60SVpERJiUDmmaSwiVTv+7gtApXQ4TfMq3UX1tJr0/ORaNS3XREFJvzVjWnEgf6K6QDduEWiLB8MVYpM3/Hz1GBnS30SQ9XBaX9o91QJmlFQPEN+sCcyCb6bjNmgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13dVwcIeBc/+Ms5FyRQcakRJCpzEmRV+3eVQosM2yJ8=;
 b=OQHGi1ArXHo6yAAXwrDfnQuNyLN26JKIGyCj1PYJ9RuyDIYu7as+UYVNN/C8I2fkOVu1JuUMOkZXeYnHkmdtz0RsN8rDw76Um6/B1DOB2DlcsJo+t8n0AkNKNSKGnvyC+BQLRPRkI3J6Wqzpk8Au8NUD8MkoD5cFzggt/AoM9bkdUVYz1t6UfMxX7M8reW/BvJwXkRCXKwm1naxobDggXP/Ii9Kp7LL8jizlOaQcUOf1CRylg0GBzNx++e7+GcvxY1+D5ibfRB042NdFJWQ3/bU2rT5G+a01/KgSnI8PJ213nnBgALdi6mIMtH9greXYp8M8Gg/LeO5J9nW6KbaGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13dVwcIeBc/+Ms5FyRQcakRJCpzEmRV+3eVQosM2yJ8=;
 b=WVdX1vdJlil+0Bkdzcpq1spJwwrZHMjihDZXhHlTFnbUkVRUmzIyQbtQNer37Mu/6BGFJuvP+5JJpmx5vao7N/+qcoZXt/91GLZ4nB/HsXCQ8UoZKmnzLj9RNps8lhZns7SUuimZslYeMCWmubElHFmYhefbgtkEU9WSex/a0/w=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <Julien.Grall@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: RE: [PATCH v3 19/19] xen/arm: mm: Re-implement
 setup_frame_table_mappings() with map_pages_to_xen()
Thread-Topic: [PATCH v3 19/19] xen/arm: mm: Re-implement
 setup_frame_table_mappings() with map_pages_to_xen()
Thread-Index: AQHYJxD6oxkwfhIw+UynauC6SQGhlazBqLzg
Date: Wed, 16 Mar 2022 06:10:19 +0000
Message-ID:
 <VE1PR08MB5677EE10016F05DA46E24177E6119@VE1PR08MB5677.eurprd08.prod.outlook.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-20-julien@xen.org>
In-Reply-To: <20220221102218.33785-20-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 077C34184B3CB3499525A868907ADF2D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 53ff7aa8-b5f7-49e3-726c-08da0713adec
x-ms-traffictypediagnostic:
	DB8PR08MB4074:EE_|AM5EUR03FT020:EE_|VI1PR08MB4398:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43981072CF08D4B3790517CFE6119@VI1PR08MB4398.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d3nNus1UUx1nsYmiVYNBGuE/C/VbavqcHaOaUi2e8fZvxG8w60txqRvmZAuCgQf4LY+5kfnHRyC68OJ8YSpX7UY3zGSqqy11XAwPITz0PIYQYtVQBseP11CQRYMzHSfIjG6xeBpz8r/poWZOaM/wqoSKhtRCI7vDUXNFlf+ZL97+dhAW0GMp1GosHwMS2HLfiaWjgbGQ+PR701RvKq+2mOsWIqW2cDvAB7NZHE6H7eUQ43SgWto/0yv8D/yckfHNIgUjnUFIDcg/hFdxlYIq7zCe3Dohp+gEmFXLANYOwBKh1YgysWFtwmtJ14lpP3k6DdL7IjC9qxsIS1z13ssc4/vWpnGsJFkKhipt4+be+HiHJeFsgTgROS9AmoeXLrv/FNtcWs+IQDBZ7i821hmAobWpOTtv18t0PzJQiBHGC0Il8+nFGx6MC7ChQn2mXOSd6eILeSnzdgnCranpxTNC1o3X5kcuktGHKBFMbBZfSHlzd4ftwPgbhYLdjXXWK0P3EhHWUA5pP/GljGjsfmk5YNvS9c9rSVq8tXX5Xv9ZT/ekMfvhw4R6elJF8VF6MnPyznBDRG7xEbul4rJD9fFd47lAKce7oh63tPCkS373zIe9PEa9EjtGiWtYECq5tNbW+8zpc89ROjelNksxr14bAiOf4mEnSn90EQug+NKmnIgzaBEAnGP55hEdT/wz2/C01tbY6nzQ69d0l9KCg2Unng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(71200400001)(508600001)(66556008)(38100700002)(76116006)(66476007)(66446008)(64756008)(66946007)(110136005)(316002)(8676002)(86362001)(54906003)(26005)(186003)(4326008)(53546011)(9686003)(7696005)(6506007)(83380400001)(2906002)(33656002)(8936002)(52536014)(55016003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4074
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26de8d1c-4fca-44ca-beea-08da0713a5b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/PDpS9SocXhlvTc90Qm2fQg1jW76GwczerurN8rLC/vmNBP1oT0kPhrUOEV0kUDeaGB+bmI1c+oCMwZNJY6XGDAel7CD19/DnQ7yCKNhFimKTYj2SqiD9Bm+7JvLnmvJCdsj1F3NpUzAbA2MWUc4/4lMpTLq7xAsRH+Qrlkihfixc6vu4ZkP3SCkZBEAwmWXok8Vy/ezs4TKoxDRElzD9lzqZE8MJLdCvn/J2GpC5APlQ5InYsVdS6ET0yUd0jxYKac6nWTIffPcj3pD8goVy9CdFOKB8H2ZNs3QVEPWXqaZIj5J1D1yEVvIfa75I44HCed7eL8NKA5cv2pocHqifKebs356C903cSN4aVYSPF6DXxI3i+lG4Y/TeInByqMALRoRO/Kr+gMtt2iN9IXEXGxxtJhUk/+QpXaAx0/2uWFupUe9mhCYGtZL354ex3M0qfADgDSkrV4p+G2RsCujfpzDRkY+ohO6RbbcVCbtke/wQp7fd3FV7UBNVG1IPbRcIm522vbawnFTh7TPs6km17CQoVvq4H/Mka5Q3A8HUJnoJAEdqn38tEQdmkHxQ0977V0kdGvyMVtKdQcAMRyHHm2S5m0tCtEB8DRRmzz8yqZnDaVbBD6xKgSqniE556ZzDIVUR985xI2oI8MzudN7tJT+t9RE+vdBCtRDUnPHdI75UYqGC9KtsN9v4H2hXrOs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400004)(33656002)(356005)(81166007)(40460700003)(316002)(86362001)(54906003)(110136005)(5660300002)(8936002)(8676002)(70206006)(70586007)(4326008)(2906002)(83380400001)(107886003)(47076005)(36860700001)(6506007)(508600001)(336012)(186003)(26005)(55016003)(53546011)(9686003)(7696005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 06:10:32.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ff7aa8-b5f7-49e3-726c-08da0713adec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4398

Hi Julien,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jul=
ien
> Grall
> Sent: 2022=1B$BG/=1B(B2=1B$B7n=1B(B21=1B$BF|=1B(B 18:22
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <Julien.Grall@arm.com>; Stefano Stabelli=
ni
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Julien Grall
> <jgrall@amazon.com>
> Subject: [PATCH v3 19/19] xen/arm: mm: Re-implement
> setup_frame_table_mappings() with map_pages_to_xen()
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
>=20
> This has the advantage to remove the differences between 32-bit and
> 64-bit code.
>=20
> Lastly remove create_mappings() as there is no more callers.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>     Changes in v3:
>         - Fix typo in the commit message
>         - Remove the TODO regarding contiguous bit
>=20
>     Changes in v2:
>         - New patch

For the all 19 patches:

Tested-by: Hongda Deng <Hongda.Deng@arm.com>

> ---
>  xen/arch/arm/mm.c | 63 ++++-------------------------------------------
>  1 file changed, 5 insertions(+), 58 deletions(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 4af59375d998..d73f49d5b6fc 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -354,40 +354,6 @@ void clear_fixmap(unsigned map)
>      BUG_ON(res !=3D 0);
>  }
>=20
> -/* Create Xen's mappings of memory.
> - * Mapping_size must be either 2MB or 32MB.
> - * Base and virt must be mapping_size aligned.
> - * Size must be a multiple of mapping_size.
> - * second must be a contiguous set of second level page tables
> - * covering the region starting at virt_offset. */
> -static void __init create_mappings(lpae_t *second,
> -                                   unsigned long virt_offset,
> -                                   unsigned long base_mfn,
> -                                   unsigned long nr_mfns,
> -                                   unsigned int mapping_size)
> -{
> -    unsigned long i, count;
> -    const unsigned long granularity =3D mapping_size >> PAGE_SHIFT;
> -    lpae_t pte, *p;
> -
> -    ASSERT((mapping_size =3D=3D MB(2)) || (mapping_size =3D=3D MB(32)));
> -    ASSERT(!((virt_offset >> PAGE_SHIFT) % granularity));
> -    ASSERT(!(base_mfn % granularity));
> -    ASSERT(!(nr_mfns % granularity));
> -
> -    count =3D nr_mfns / XEN_PT_LPAE_ENTRIES;
> -    p =3D second + second_linear_offset(virt_offset);
> -    pte =3D mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
> -    if ( granularity =3D=3D 16 * XEN_PT_LPAE_ENTRIES )
> -        pte.pt.contig =3D 1;  /* These maps are in 16-entry contiguous c=
hunks. */
> -    for ( i =3D 0; i < count; i++ )
> -    {
> -        write_pte(p + i, pte);
> -        pte.pt.base +=3D 1 << XEN_PT_LPAE_SHIFT;
> -    }
> -    flush_xen_tlb_local();
> -}
> -
>  #ifdef CONFIG_DOMAIN_PAGE
>  void *map_domain_page_global(mfn_t mfn)
>  {
> @@ -846,36 +812,17 @@ void __init setup_frametable_mappings(paddr_t ps,
> paddr_t pe)
>      unsigned long frametable_size =3D nr_pdxs * sizeof(struct page_info)=
;
>      mfn_t base_mfn;
>      const unsigned long mapping_size =3D frametable_size < MB(32) ? MB(2=
) :
> MB(32);
> -#ifdef CONFIG_ARM_64
> -    lpae_t *second, pte;
> -    unsigned long nr_second;
> -    mfn_t second_base;
> -    int i;
> -#endif
> +    int rc;
>=20
>      frametable_base_pdx =3D mfn_to_pdx(maddr_to_mfn(ps));
>      /* Round up to 2M or 32M boundary, as appropriate. */
>      frametable_size =3D ROUNDUP(frametable_size, mapping_size);
>      base_mfn =3D alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20=
-12));
>=20
> -#ifdef CONFIG_ARM_64
> -    /* Compute the number of second level pages. */
> -    nr_second =3D ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
> -    second_base =3D alloc_boot_pages(nr_second, 1);
> -    second =3D mfn_to_virt(second_base);
> -    for ( i =3D 0; i < nr_second; i++ )
> -    {
> -        clear_page(mfn_to_virt(mfn_add(second_base, i)));
> -        pte =3D mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
> -        pte.pt.table =3D 1;
> -        write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i=
], pte);
> -    }
> -    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >>
> PAGE_SHIFT,
> -                    mapping_size);
> -#else
> -    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
> -                    frametable_size >> PAGE_SHIFT, mapping_size);
> -#endif
> +    rc =3D map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          frametable_size >> PAGE_SHIFT, PAGE_HYPERVISOR=
_RW);
> +    if ( rc )
> +        panic("Unable to setup the frametable mappings.\n");
>=20
>      memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
>      memset(&frame_table[nr_pdxs], -1,
> --
> 2.32.0
>=20


