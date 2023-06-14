Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F872F9C6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548648.856681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NA5-0007vD-DO; Wed, 14 Jun 2023 09:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548648.856681; Wed, 14 Jun 2023 09:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NA5-0007sU-AF; Wed, 14 Jun 2023 09:51:33 +0000
Received: by outflank-mailman (input) for mailman id 548648;
 Wed, 14 Jun 2023 09:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZpN=CC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q9NA3-0007sI-K2
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:51:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09535f38-0a99-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:51:30 +0200 (CEST)
Received: from AM6PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::35)
 by AS2PR08MB9344.eurprd08.prod.outlook.com (2603:10a6:20b:597::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 09:51:26 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::b8) by AM6PR10CA0094.outlook.office365.com
 (2603:10a6:209:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Wed, 14 Jun 2023 09:51:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 09:51:25 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 14 Jun 2023 09:51:25 +0000
Received: from e9fc9322af6b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B01051C-A44B-424E-8C99-586B9B1187DB.1; 
 Wed, 14 Jun 2023 09:51:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9fc9322af6b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Jun 2023 09:51:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 09:51:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 09:51:18 +0000
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
X-Inumbo-ID: 09535f38-0a99-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIzVhYmomZWZUbdg4SShtbg54CHyllQjw/0c8ZtktO4=;
 b=BfTJk2vPUioELh1qUw1FOwmcOlGiukjLG3hnL8HYrs+/Ptd8oSfH3/v0O7eZB3JPXK8QGuB55dUMU3Nj6c1p7b80HgyohU87UWhMY6pLR7IES2OMzaMdiH4UhPnqnw1dmbbYLC954qGUfocqRsmHCTnE8RfiSqGf/2+QfQoE6DM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6eabe98afe714aef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9b6dxrBjmj2RlF8PjxYEoZKQupWuJ42T2obGMomaIE5xyPshaGiDvmdPjVsJwDxdMyxjA/4ezsugwGD4fgkIIFk97zLqVZ9ztDHKVqa9kRqOBTlc4JxmMvxQUuV1GNyPorXXnMBsoJA6XFu+Kdp57jY97JZZVSmKMRTNxKLKP7PacehPg1hOoYeWG7DbNtI7gmXVBYrOaobQ5mFS9VK9uft7XpM1gfm0KlTBTlr0p0kYq9LSEkMsavv0xCy5u3PWTBCafOiiiOqDhyN6ChjzHUXbkOrZpT5HbqhNoLd0RKr7ktjRlgQ/TCeS/7uKYYGhQqOw4tuuXGVssdoCtgq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIzVhYmomZWZUbdg4SShtbg54CHyllQjw/0c8ZtktO4=;
 b=C1NuC8AJxc9Z1UopNJrDkB3fCDIiO7eQcNu9+8QArw9uvM4inUCGxsceYLUmtdm78C97ChbJDs25AcCYJMd1kIPasCpF/RZZDDA4kbf2+ALWZZIGkNK4baQe1J5ouz4LDXCzaCtneYH5lv9gvCKpZ6kHgu9UKe8nGkwgBEyK+b8Rv2rLImUA+AkG/gR0LCZlbF9FIxbKLq/Wq54De/7EQ6OL9+sOxtrmayb0R+2hYWi2uRFeI08K+dmE/p6r4i6LQB7Kt2ZKoLJh6+hBiviv9LabNyHRQDZx+Jz55FA68ll0970+2nMRgrObUbgP4op1qU5zE9HqKH/c4yF7zK7E3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIzVhYmomZWZUbdg4SShtbg54CHyllQjw/0c8ZtktO4=;
 b=BfTJk2vPUioELh1qUw1FOwmcOlGiukjLG3hnL8HYrs+/Ptd8oSfH3/v0O7eZB3JPXK8QGuB55dUMU3Nj6c1p7b80HgyohU87UWhMY6pLR7IES2OMzaMdiH4UhPnqnw1dmbbYLC954qGUfocqRsmHCTnE8RfiSqGf/2+QfQoE6DM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Thread-Topic: [PATCH] xen: Append a newline character to panic() where missing
Thread-Index: AQHZnpIm6GPbd9zls0aOGDf+8HsR9K+KDlMA
Date: Wed, 14 Jun 2023 09:51:15 +0000
Message-ID: <67F5F6D4-E9B4-4862-ACB4-4A95191D5CD8@arm.com>
References: <20230614073018.21303-1-michal.orzel@amd.com>
In-Reply-To: <20230614073018.21303-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB5985:EE_|AM7EUR03FT053:EE_|AS2PR08MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 678254da-b17e-4f7f-f1f7-08db6cbceb0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zK+XSsuYnqytE2wRtTd8xLhByt9AP5x7KCkZKV5CKLdx4irL3aFFUsrWH8/OnDggVw3AuX8iN2wmqQfOKD6VAalT8RmbhMyEYX4JOl1EGUCsok31CpwY1Nf0E+C+zfAotg1ZfOluWu0l4pbgkeIdWpX/vGXifF4H/iMMHuGhMEDAI1R/ElarZKRcEvjo6kea74XPjMyVtIpDmcBbK6tonLQsn+vxKIr8TCYAXRKPUn/KxZoG9X2pAl7Ig+Zlb7+RxV74DUltjo8fL+2msxoVj6dyifEkFkW9MgxQpgFgwW4undVNFmbc7YxMx4SR65vt1GMu0g1bQVbr2+yNUTr+Fcynq1WzM+vtHlTX1MCJQa7GjZqHl6idkOaDPpOt5QWtqZK9Cg+j/M3CPcdEPMnOYwlidQo8b4Pi+kyhn6omIyGvtXZ+/Gm98igpZ0gdfXTdxUNngQfQCF7BxEZUksTyDWmrgUdNIwd5d1zEj8zW+FDzLEuDa1MvfLoSV1vlprM/mvGkyJAndS+UGmXccSymyGkYADw07rishlVjGixE/3kxkp2/qndDG2JTA+1aWqjS+/Y7qOCUPwN7oA6yJh7zZaqfLGKrZsIO9ic1YpBmDodJ9cDTyAhkqtmSOGo350lBBQqXFgFZzo2Lu+YuRlJ5sQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199021)(6486002)(6666004)(86362001)(36756003)(83380400001)(2616005)(38100700002)(38070700005)(122000001)(6512007)(33656002)(6506007)(26005)(53546011)(186003)(76116006)(5660300002)(2906002)(54906003)(66446008)(316002)(41300700001)(8676002)(8936002)(66946007)(66556008)(6916009)(4326008)(91956017)(66476007)(71200400001)(478600001)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <257FBF3943D0D34698AB8C0642728FC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3647276-40ab-447b-a099-08db6cbce4ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6b2YkhlWaVxVwCqrsJtKLNzBwBAAVQT45iorllAXqqaABfN5CN9kNOSkpBSIOMQZtV66/ang7OT33r1cXivaPFv+JXSO16HDHD6toq7LmBBP+t1fgsnSuL8QZEyCBVs5+nog2HU2pYbh1iKBN6QijYkvFTw6pr1e+FtyW1PFj+9X+gKLG+EYm6mne31Ml8OmZcdIm1QTkOBcyUTaAzboKeuXlRp87zW3LtKFOkZZMV2q8osKbOLMqFOSOFxUxXNoE65EX6PsCLOpxTt1PfZafC98DYus1baonLXG0HqHqkjSPXCjqh2i8KUNtZSf8JElVLDAGCnxmEJ7Q3676NW+mP/UEJV1Xst3BGQbri0A2gBhFHkBxTjWrWz3VwMBgg16MgjeYXncA9sHsnVPXj6AzJrNeNQdij97ga4SQeZvSwnleXwFlEpuCpnZF/EZovtk4xJtgwY/f45PqmJqgGZ6nbaEzesrF8a4f0KDVA679eH72zJuB/GuTNASutkBlvjsivnxVSevhFueZ8QnvnvFE+u+8xtPOtaO/lFctLMWQ/7BXQ9QibtFjvlXeWpauHqHAjMcNlRJnQdVRoNY80Msq7XTsU4oOSHl8Fohh0HUNJ3dTBmOExQhA1KVTJ7Hq/vSTy9Zxnoz2fvWWrNDgDsAX3kibHeL75r2gWj3toIvNkV3W7Z1SB7J7XLSn4/3p2xROf6uVzsnMSgUq57COQdnhPwqt8KIKJvnHuym3Fd9HOf6bJtgTJh7Bv4I8MKB55iq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(54906003)(83380400001)(6506007)(36860700001)(26005)(33656002)(86362001)(53546011)(2616005)(6512007)(356005)(82740400003)(336012)(82310400005)(81166007)(186003)(478600001)(6666004)(47076005)(40480700001)(6486002)(36756003)(2906002)(41300700001)(316002)(8936002)(8676002)(70206006)(5660300002)(6862004)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:51:25.5774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678254da-b17e-4f7f-f1f7-08db6cbceb0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9344

Hi Michal,

> On 14 Jun 2023, at 09:30, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Missing newline is inconsistent with the rest of the callers, since
> panic() expects it.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

And I agree with Julien: trailing punctuation is not an issue and
I would definitely not require you to fix it.

Cheers
Bertrand

> ---
> xen/arch/arm/bootfdt.c            | 2 +-
> xen/arch/arm/domain_build.c       | 6 +++---
> xen/arch/x86/cpu/microcode/core.c | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index b6f92a174f5f..2673ad17a1e1 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const =
void *fdt, int node,
>                                  size_cells, data);
>=20
>     if ( rc =3D=3D -ENOSPC )
> -        panic("Max number of supported reserved-memory regions reached."=
);
> +        panic("Max number of supported reserved-memory regions reached.\=
n");
>     else if ( rc !=3D -ENOENT )
>         return rc;
>     return 0;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 579bc8194fed..d0d6be922db1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -74,7 +74,7 @@ int __init parse_arch_dom0_param(const char *s, const c=
har *e)
>=20
>         return 0;
> #else
> -        panic("'sve' property found, but CONFIG_ARM64_SVE not selected")=
;
> +        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n=
");
> #endif
>     }
>=20
> @@ -697,7 +697,7 @@ static void __init allocate_static_memory(struct doma=
in *d,
>     return;
>=20
>  fail:
> -    panic("Failed to allocate requested static memory for domain %pd.", =
d);
> +    panic("Failed to allocate requested static memory for domain %pd.\n"=
, d);
> }
>=20
> /*
> @@ -769,7 +769,7 @@ static void __init assign_static_memory_11(struct dom=
ain *d,
>     return;
>=20
>  fail:
> -    panic("Failed to assign requested static memory for direct-map domai=
n %pd.",
> +    panic("Failed to assign requested static memory for direct-map domai=
n %pd.\n",
>           d);
> }
>=20
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microco=
de/core.c
> index e65af4b82ea3..c3fee629063e 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -524,7 +524,7 @@ static int control_thread_fn(const struct microcode_p=
atch *patch)
>          */
>         if ( wait_for_condition(wait_cpu_callout, (done + 1),
>                                 MICROCODE_UPDATE_TIMEOUT_US) )
> -            panic("Timeout when finished updating microcode (finished %u=
/%u)",
> +            panic("Timeout when finished updating microcode (finished %u=
/%u)\n",
>                   done, nr_cores);
>=20
>         /* Print warning message once if long time is spent here */
>=20
> base-commit: 2f69ef96801f0d2b9646abf6396e60f99c56e3a0
> --=20
> 2.25.1
>=20


