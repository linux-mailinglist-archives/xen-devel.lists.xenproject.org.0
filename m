Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7042D57C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209113.365465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawVw-0003ID-Bq; Thu, 14 Oct 2021 08:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209113.365465; Thu, 14 Oct 2021 08:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawVw-0003Fo-7j; Thu, 14 Oct 2021 08:55:00 +0000
Received: by outflank-mailman (input) for mailman id 209113;
 Thu, 14 Oct 2021 08:54:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mawVu-0003Fi-Un
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:54:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e0483cd-dfe2-4dd7-ad3b-563fccc69656;
 Thu, 14 Oct 2021 08:54:57 +0000 (UTC)
Received: from AS9PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::33) by VI1PR08MB3760.eurprd08.prod.outlook.com
 (2603:10a6:803:c1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Thu, 14 Oct
 2021 08:54:53 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::60) by AS9PR0301CA0017.outlook.office365.com
 (2603:10a6:20b:468::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 08:54:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 08:54:52 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 14 Oct 2021 08:54:52 +0000
Received: from b09a8326ebd7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AA6DCFF-20FB-47B1-B3CB-6CEADEA446AB.1; 
 Thu, 14 Oct 2021 08:54:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b09a8326ebd7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 08:54:41 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5258.eurprd08.prod.outlook.com (2603:10a6:10:e0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Thu, 14 Oct
 2021 08:54:38 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 08:54:38 +0000
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
X-Inumbo-ID: 7e0483cd-dfe2-4dd7-ad3b-563fccc69656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYJXEF5xZIle0JkB7WDknxafdr4nqw1UdyEtRkQhDzo=;
 b=jmAW8VsjRixwyjkNxg9kvQbChhY9VaR0UDFJvtRJHWg144GHhp58vZwb5fSe7DyOGiGmzWWJw9wDUHt85PHFnCjLeQ1yiY3XNjNsBo3VvKyud3E8vil2e2nl+k2s6+QVQ8SSKnN89ZsOm/OqLSSNVG703Gn8o7m7RsgkfHwv4Ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4fe785c23b252a91
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXSY1ZXC7LLWcdZTBrG1WbRXCUqpgR2+n/stYbZ9hvW22mNLipCcwH4bEHpCTktPu84uLTMeIOkK7glF4UxVvi8OKRb4X7VzANkEkky8PTNhvIpibPNpsWqpie/8VjkXeNWGLawAht7R6oeMt14Cyd0y2wSzkpcE+jxjWc89CrFrTubhxZOklZRs6aQD95xK8CRq08FtMdvvOViggU7qmxMtml0d1q9M4D9nUKHA6e8+sVpmFYhWVrnuuLLYfrxiRL+co1LT3gBaU7TI67WbGtOsiR7iW2qVSMXB8SXkSKnsOarPC+S5qUG2koXtDs3rHXMFVWNBS9kBf7n8E2jrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYJXEF5xZIle0JkB7WDknxafdr4nqw1UdyEtRkQhDzo=;
 b=gKIjWrCnRGQOl6RePbg2v+LmXWitdnZ60vXJ7GVtPYGqFXrOxKMOcCIqCSt0u/0/0wgGLLXi+SaQrYcEJbZvW8OBGWtXMK9nJVqOJOlm52IYMGWjX8fG+ovFpxFi+a5RjScXHg8DnUB2WFEn6AkwN2jKOwiCfTzXn5vdA9WJYEf3wiFbbzdvIehMiwvBNMRim86eW9Alv3gZ1gPRV1JWgEjd+6WBHd/YukNjdovpx5us2QTI9KsR0kksQdlUseED43+YfjY3frI9Tmc/l0jHs/PcZXM9aXU9ViCKj/f2aIgXlhZKlRES9MejqAfqq7x5rTgqBa0/6W61vE271I88JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYJXEF5xZIle0JkB7WDknxafdr4nqw1UdyEtRkQhDzo=;
 b=jmAW8VsjRixwyjkNxg9kvQbChhY9VaR0UDFJvtRJHWg144GHhp58vZwb5fSe7DyOGiGmzWWJw9wDUHt85PHFnCjLeQ1yiY3XNjNsBo3VvKyud3E8vil2e2nl+k2s6+QVQ8SSKnN89ZsOm/OqLSSNVG703Gn8o7m7RsgkfHwv4Ps=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
Thread-Topic: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
Thread-Index: AQHXwNgx8NpL0VHy4UKLU+O7ZFIg1avSMIwA
Date: Thu, 14 Oct 2021 08:54:38 +0000
Message-ID: <3294EDDF-FA64-4CC1-B47E-D7924B382ED7@arm.com>
References: <20211014084718.21733-1-michal.orzel@arm.com>
In-Reply-To: <20211014084718.21733-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 85b40ecf-9a4b-4b91-b6b9-08d98ef049c6
x-ms-traffictypediagnostic: DB8PR08MB5258:|VI1PR08MB3760:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3760728EEDB9556979C940499DB89@VI1PR08MB3760.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hZEOIneND+he98AXMS225hvceZPg8zcxJd2CrTSUpUmmd/VgP9ESumjQCOpiuHrEFvbHWnlQml6JqP7N51GLrFR9bu7vhb4LR55fm91Zb2RlGL5Ud3g8A8tmJTkwiZktxPx1KuJkJIY3b5JtHHklY0JgeBz43BklK6QXlQVBhCOv5vePujVNu45PAbkZLwTo5gbYDZuqjJyDCCUaN4+dqS5y3gN32eirCgrEk2fylKV2cniLtNs0DOEqrSusP+PHxviN1R4A/3QBBhyoiFUNbI5bEJeYRKKMzxg2OKF7yIFvDoUSzaRlDWEbWP42886MQJVy0yTAW/5xXui9+ENV1YpNwxkPrzqtl8rU0o3RRVsGp2RIV8ooLt1BWxSHeEkRllTlfdzqF3WxwOHZ6V7gkHZ5Vr0N6qHV34FhuzKLXuM8snqE+V1ay/BBvVOUQfnEg0KgDwH4Qt8cr7JW50RbeB+QY1hbtAM713WplB0gOx5BWViPBQrD4XVNYzfozOBcsohc9Wb7ZIHR3wlUqudKI0FuLW9id0jEQ6kbM2+Bq0E1uwggj1lUGuHV60NSI1lCOi9fZPiUaQC09fvZKFeRZQJ9VtaVnqph8OErzoykrEyEN/oCh2Ujv50gP3yezge44/0+JzcvHco1lRgD+DWT6yHkQcZNfkr0JYx3OJYaQ0dJkpwvDmZr6NEp/cT+aeGkdF5jTe4ncTXThQVxvOwEcRxi/0nw5llZPQQruPxPGkxVKe70wsXlsvQjpDw0UFXo72avjPnLYS2KvWDZs/KiB0W5+CnRoP7KnGhKNQ0YqpWJ/AlbTCbT/psRrqh0BLZR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(26005)(37006003)(316002)(36756003)(54906003)(6862004)(8936002)(2616005)(83380400001)(4326008)(8676002)(53546011)(86362001)(7416002)(33656002)(186003)(6636002)(6512007)(122000001)(64756008)(71200400001)(66556008)(508600001)(66946007)(66476007)(91956017)(966005)(66446008)(38100700002)(2906002)(5660300002)(76116006)(6486002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8A0780232C378441B049A0627FFAD4AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5258
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	856acf03-af16-4325-fb27-08d98ef04150
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pb2D/rwQIN+EvRJGhJVJGJg9NNrdlsUV/hHdmLwi3LylXUciEL4heKGgQZW6q91a0n7YurIu3dnFKdEhyiOvoguJB69vqI3NwzEX69v/ENtaE20DWtLSdzuNnj29kCwy4s+IRbAIakr/ZUeZjLsIvMIaAlJGrBdZI6Ej7HgQBlXhnxs7X8uBmHQY0N/i4QuC29LMnGoSy/d1XyEjOANrKBQnTTi95fWSzUEhVS4xcDaAAWNvWrzsfKyoFeWUUFBMf0NH9kv80lmniGHmLw8A7suQB0zr3ApQsPwLF+jrWVyraNmkAdeo0WdKLHqo9dluEVPD5JL/XCJRvmak92pdiXDbPAdjK1k7iZUl74CFqg+XzKlhnpFXnglxxZho3QbX1kqemZIr2WaNr5JZ9Ht2Wfw4jy3XKpKlnjUtSgOI4qBdzWEdZcuFPYiIEkWc01TV2NQgu67MaUws4LRoaRz3ns92z6teHcHp3zqVJ9BI9DdS2d4hZ+4QKdWaf3L7G4lP2ttHumEISBswTm4FKKkUsP/O0L6i4xTU2bGhNQ+GxMgimZiHTb4ZNP8yryrQuxnSYghoa9LPmCj5sFBF/QVZUQw0RlHqnCrrYo+Ls0bCqaiy1RZWiUMygKTdGPf61jlQ8+hdxMANx+ZVCdv01xgxmt5CEKIohEH8A0P+iZOVHRHl1pop5vZMlYlOeFi7ZlU0SmeSSuVMJGMzaUW68HnM/QLX3hgSHJFw3vdU16jb2qim3ru6Mku3zwuT6yqEqSS2O4iB2aG8xEWj6IkBst0GtKyN0iWYNbz3Q5Yz2nRNwcU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(86362001)(53546011)(6512007)(6862004)(6506007)(26005)(83380400001)(6636002)(508600001)(107886003)(6486002)(33656002)(2906002)(70586007)(36756003)(4326008)(966005)(186003)(47076005)(316002)(37006003)(54906003)(336012)(8936002)(5660300002)(2616005)(356005)(8676002)(81166007)(36860700001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:54:52.9651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b40ecf-9a4b-4b91-b6b9-08d98ef049c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3760

Hi Michal,

> On 14 Oct 2021, at 09:47, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> This reverts commit 2075b410ee8087662c880213c3aca196fb7ade22.
>=20
> During the discussion [1] that took place after
> the patch was merged it was agreed that it should
> be reverted to avoid introducing a bad interface.
>=20
> Furthermore, the patch rejected usage of flag
> XEN_DOMCTL_CDF_vpci for x86 which is not true
> as it should be set for dom0 PVH.
>=20
> Due to XEN_DOMCTL_CDF_vpmu being introduced after
> XEN_DOMCTL_CDF_vpci, modify its bit position
> from 8 to 7.
>=20
> [1] https://marc.info/?t=3D163354215300039&r=3D1&w=3D2
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/ocaml/libs/xc/xenctrl.ml  | 1 -
> tools/ocaml/libs/xc/xenctrl.mli | 1 -
> xen/arch/arm/domain.c           | 3 +--
> xen/arch/x86/domain.c           | 6 ------
> xen/common/domain.c             | 3 +--
> xen/include/public/domctl.h     | 3 +--
> 6 files changed, 3 insertions(+), 14 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl=
.ml
> index 86758babb3..addcf4cc59 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -69,7 +69,6 @@ type domain_create_flag =3D
> 	| CDF_XS_DOMAIN
> 	| CDF_IOMMU
> 	| CDF_NESTED_VIRT
> -	| CDF_VPCI
> 	| CDF_VPMU
>=20
> type domain_create_iommu_opts =3D
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctr=
l.mli
> index 0fdb0cc169..0a5ce529e9 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -62,7 +62,6 @@ type domain_create_flag =3D
>   | CDF_XS_DOMAIN
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
> -  | CDF_VPCI
>   | CDF_VPMU
>=20
> type domain_create_iommu_opts =3D
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index ad21c9b950..eef0661beb 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -628,8 +628,7 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
> {
>     unsigned int max_vcpus;
>     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_=
hap);
> -    unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_C=
DF_vpci |
> -                                   XEN_DOMCTL_CDF_vpmu);
> +    unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_C=
DF_vpmu);
>=20
>     if ( (config->flags & ~flags_optional) !=3D flags_required )
>     {
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 79c2aa4636..ef1812dc14 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -662,12 +662,6 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>         return -EINVAL;
>     }
>=20
> -    if ( config->flags & XEN_DOMCTL_CDF_vpci )
> -    {
> -        dprintk(XENLOG_INFO, "vPCI cannot be enabled yet\n");
> -        return -EINVAL;
> -    }
> -
>     if ( config->vmtrace_size )
>     {
>         unsigned int size =3D config->vmtrace_size;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8543fb54fd..8b53c49d1e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -486,8 +486,7 @@ static int sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci |
> -           XEN_DOMCTL_CDF_vpmu) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
>     {
>         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>         return -EINVAL;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index a53cbd16f4..238384b5ae 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,8 @@ struct xen_domctl_createdomain {
> #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
> #define _XEN_DOMCTL_CDF_nested_virt   6
> #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> -#define XEN_DOMCTL_CDF_vpci           (1U << 7)
> /* Should we expose the vPMU to the guest? */
> -#define XEN_DOMCTL_CDF_vpmu           (1U << 8)
> +#define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>=20
> /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
> --=20
> 2.29.0
>=20
>=20


