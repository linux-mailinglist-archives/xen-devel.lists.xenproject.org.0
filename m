Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B6416174
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194350.346222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ51-0002p0-2I; Thu, 23 Sep 2021 14:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194350.346222; Thu, 23 Sep 2021 14:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ50-0002mX-VB; Thu, 23 Sep 2021 14:52:06 +0000
Received: by outflank-mailman (input) for mailman id 194350;
 Thu, 23 Sep 2021 14:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RP5N=ON=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mTQ4z-0002mR-MB
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:52:05 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0cde1d4-1c7d-11ec-ba4d-12813bfff9fa;
 Thu, 23 Sep 2021 14:52:04 +0000 (UTC)
Received: from AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) by DB6PR0802MB2566.eurprd08.prod.outlook.com
 (2603:10a6:4:a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 14:52:03 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::d6) by AM5PR0201CA0022.outlook.office365.com
 (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:52:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:52:02 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 14:52:00 +0000
Received: from 0d8b64f886bf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AF9AD22-7D81-4C82-8B6B-942862198891.1; 
 Thu, 23 Sep 2021 14:51:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d8b64f886bf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 14:51:46 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 14:51:44 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Thu, 23 Sep 2021
 14:51:44 +0000
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
X-Inumbo-ID: d0cde1d4-1c7d-11ec-ba4d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUDPicpPpTARMQlSPA5/agCsr7gquYRqozuTjvJn4vY=;
 b=PmpoaKrB2HNGU0WoEauo8W/kFXFzTlZhu0dNrtNiBJ3CkqDLedvbXY/divvY7rBXZS0aN+Y7dpyRep2UIrP8r9BYsLHkPpYK+eg8KqG/xeUlkqzCa8dPbaIiLyNgO8e1z5JggsYV/ujGGcPq7PX3Mo11BH9IYt5+c3uOMChW20A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d309d9a9a1e8393c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xtyf9J6Inq/YlsZoJt6hT6mWEJTAuv95TzmQp29x9Bto1ppLDUAhZGSQaT9EzgK1uh+DI2a0ukWKqTtFsdc1XqaZBBsYxMy6HHqSaVNmBnmdIDrYz4QaLFXDgiUNfuFbh6/GH6pyc/FIXR1Sm+I407iNEku652GbJNXPnFh9w5png5FUgHKiqoYJjPf/zP9c2Glk93lQrVSxImEWecfL96+m2NnP8dBIVsHcj7XZcdYu/pDSYiBVvaocBXFw+NvvZm2Yit9ja2NkTsK/gsKMXi3UX1msHZbNeEo+ibznfCNpDcxQle2xIfD4XNRps2Q5Lr5yDLIqqvzJ+tcrlwDpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zUDPicpPpTARMQlSPA5/agCsr7gquYRqozuTjvJn4vY=;
 b=J6oB2bcC5RLfTX/Rkm7pM814/stXOGd67THSVESr0jdXziVdD7bLleJ2N0bVAIGn9qAlQi7iZcvH/o8OrcYpE75Dlayq9flKUN3Mqs1B2AcjxVUuib+HzO87NMXK/aOFvpEHXMmgjs4E1p8hyPteJ8xEMVRb3PQ/xrtnI2fCfbtfKYncbmAe/bTd+9AhsJH27wotD+8TMIZohB2FySp48b8otmC3MD4wlfqNIeUhkPA/g2+4NG2G/uuCsfm3eV6TDbD//LdcJm8SZRARZ7hZmCHaCJoMFhiSmwiDSNT7KKaAT1gkXF9kozUogv8nv36wg8F7Nx921z9wBOCGxU/7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUDPicpPpTARMQlSPA5/agCsr7gquYRqozuTjvJn4vY=;
 b=PmpoaKrB2HNGU0WoEauo8W/kFXFzTlZhu0dNrtNiBJ3CkqDLedvbXY/divvY7rBXZS0aN+Y7dpyRep2UIrP8r9BYsLHkPpYK+eg8KqG/xeUlkqzCa8dPbaIiLyNgO8e1z5JggsYV/ujGGcPq7PX3Mo11BH9IYt5+c3uOMChW20A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
Thread-Topic: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
Thread-Index: AQHXoyUczCdL3CcIR0eYq/JO8eFke6uxzsGA
Date: Thu, 23 Sep 2021 14:51:44 +0000
Message-ID: <FFA5F03B-93E3-40AD-B98E-82141788999D@arm.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 462f082d-0e74-45ea-6c2f-08d97ea1b42e
x-ms-traffictypediagnostic: PA4PR08MB6032:|DB6PR0802MB2566:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB256618CC80BF1DBDC18B7AFB9DA39@DB6PR0802MB2566.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KPPog++FqUDZVEBQO2x9pK8kIB5Eg9a8NFOaVCrMS7OVEIaJKpHAUidqAMUjz823ClMw/33m/B79gi/dAcpUxoR27du4g4Cal4SYmVs7TrVhjcfYeXHBb/5rwXB6Hitpe93cxpG1wZswiRnsRTZF9TAfAFORzg6qzPuzwlJitCrF8SIdbTZVRNlnCNrqj1kEd1BSZlkqm3cvmWlipSn+xVZA3bKM85RktVyYWRcAfO3gLYDZ2y7cELTradDRkFmdM73IcUaDjt2cn7Iwk6/uDm2noEMwBz96GlTFZDGJi+LwYbBrjKWbPHPxRNvVyNFFyGAU95Z7N//+6/CGtBlsUOiZOYuPRLPiaMxMeNIunL7nFQUDff8ljkvdt3GHJFyl6/kt8YIc+7ApC+NEMJGuN6ckFUT5Ln8TjyCGGecyOPEpHCVLRhzBDMWyTWsskxMo2OtqP3rEYiZwuyf9HGF9Seo5ksRzY35WmwVhzUPyHoPvb3kIZYkeKstMYNw84w0crrU0c4EoQlOJI4R9WrNfKPytjtzE2NwnLqYnJSglEtRCKTVJEH9qT1SXjh4poGbf6NPx0m3m2b75uGNuLqX+X1DPczCFk7bD2oTJux6a/e1XHdIc46sl/v2Q8TkY/oAe5ujHNiMejcxPFoaYcdooGson8XjxZz7urGk11JUX6zSonJgUQc2w0j+DGnGZQFRwR5YQwmZD2f+A9qUHFp/RZ6jQ5zMaQEunpJUjSms61/b1vAIzje1fRitpqZE3hxGI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(66556008)(64756008)(66446008)(26005)(8676002)(66946007)(4326008)(508600001)(6512007)(8936002)(38070700005)(186003)(6916009)(38100700002)(71200400001)(2906002)(316002)(54906003)(122000001)(83380400001)(5660300002)(36756003)(2616005)(33656002)(86362001)(66476007)(6486002)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7558E0D4BE902A44A12E7347C91A1A96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71a15ea1-ea24-41d8-7688-08d97ea1a93f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VkTKuxslo5GP3yZN8hHibN6wAPHbRWHDLPPnOCSXxaoeSmIbFR3NxRuQbKzhp9FnKET0Jq8SplsD71KsRCzACLlqcEbpIKSx8a2GxCKeuUw7Mn+1RoALXr4cLQVGuVnjz9LzqPyYpLmbSGZskreEJh5OFEphmvPo/TL11MSZgA/YhHwEmtAbDupyKSmkL9u6iR1ZxscgdcDYWH4rI7QtGbPn5ossLiOt6gPbpoKTEmfAexVWWD2IsqpMpsQ59/IIblbDi+rd9dXXDQmT8aDkxQ+rAnM64BO6gYnXIfFOSOIwu0SqUQDTDPIRICzKL2jQfvtph1QzD8758QGlJLQrvlt5QOu8riGYCTdD+nOFPqGE4pznn1AFcDCT211nSMsUfBRWe/0mlNDERfU9PzPOiXZglu7YRs/2i3PTtrWI8+Yewki2BXZw9l84fyBnR+QmOWnad8BM7BAWgdSNOxtquEaBe4cWuPRiAfnjsqEET+tm7aK4EcOxD2rtPm9ynDtLXWmou2tgyIV/1ZnpvocQC662lDrWoev2YgUd+QliCUFefgfjzLRmVvXUd6rHwCFRrkZbKFJFe+wZhraruczTO8VpbShpUans7CUhH+GgDdGpmD5EYzJXKBAL1xROwc9sY+4m8fVo0C5Sj1hpljLykQJmx9HUzLXdjL16BC9eydnH9b4rwGpEumu3eos/dMcZF0I0JLNQhdZsNPVAtccsKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(186003)(86362001)(6506007)(36756003)(53546011)(33656002)(508600001)(36860700001)(336012)(2616005)(47076005)(8936002)(4326008)(82310400003)(83380400001)(54906003)(70206006)(70586007)(2906002)(356005)(6486002)(316002)(6512007)(81166007)(6862004)(5660300002)(8676002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:52:02.6871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462f082d-0e74-45ea-6c2f-08d97ea1b42e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2566

Hi Oleksandr,

> On 6 Sep 2021, at 14:42, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote=
:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Allocate anonymous domheap pages as there is no strict need to
> account them to a particular domain.
>=20
> Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
> domU and dom0 can allocate" the dom0 cannot allocate memory outside
> of the pre-allocated region. This means if we try to allocate
> non-anonymous page to be accounted to dom0 we will get an
> over-allocation issue when assigning that page to the domain.
> The anonymous page, in turn, is not assigned to any domain.
>=20
> CC: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/optee.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..83b4994 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -410,7 +410,7 @@ static struct shm_rpc *allocate_and_pin_shm_rpc(struc=
t optee_domain *ctx,
>     if ( !shm_rpc )
>         return ERR_PTR(-ENOMEM);
>=20
> -    shm_rpc->xen_arg_pg =3D alloc_domheap_page(current->domain, 0);
> +    shm_rpc->xen_arg_pg =3D alloc_domheap_page(NULL, 0);
>     if ( !shm_rpc->xen_arg_pg )
>     {
>         xfree(shm_rpc);
> @@ -774,7 +774,7 @@ static int translate_noncontig(struct optee_domain *c=
tx,
>      * - There is a plan to implement preemption in the code below, which
>      *   will allow use to increase default MAX_SHM_BUFFER_PG value.
>      */
> -    xen_pgs =3D alloc_domheap_pages(current->domain, order, 0);
> +    xen_pgs =3D alloc_domheap_pages(NULL, order, 0);
>     if ( !xen_pgs )
>         return -ENOMEM;
>=20
> @@ -938,7 +938,7 @@ static bool copy_std_request(struct cpu_user_regs *re=
gs,
>=20
>     BUILD_BUG_ON(OPTEE_MSG_NONCONTIG_PAGE_SIZE > PAGE_SIZE);
>=20
> -    call->xen_arg_pg =3D alloc_domheap_page(current->domain, 0);
> +    call->xen_arg_pg =3D alloc_domheap_page(NULL, 0);
>     if ( !call->xen_arg_pg )
>     {
>         set_user_reg(regs, 0, OPTEE_SMC_RETURN_ENOMEM);
> --=20
> 2.7.4
>=20
>=20


