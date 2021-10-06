Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588BC423B72
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202685.357682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY46e-0004d5-Eq; Wed, 06 Oct 2021 10:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202685.357682; Wed, 06 Oct 2021 10:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY46e-0004ad-BK; Wed, 06 Oct 2021 10:25:00 +0000
Received: by outflank-mailman (input) for mailman id 202685;
 Wed, 06 Oct 2021 10:24:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY46c-0004aG-Ch
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:24:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6f5c298-268f-11ec-bf57-12813bfff9fa;
 Wed, 06 Oct 2021 10:24:57 +0000 (UTC)
Received: from DBBPR09CA0010.eurprd09.prod.outlook.com (2603:10a6:10:c0::22)
 by AS8PR08MB6181.eurprd08.prod.outlook.com (2603:10a6:20b:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:24:53 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::19) by DBBPR09CA0010.outlook.office365.com
 (2603:10a6:10:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 10:24:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:24:53 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Wed, 06 Oct 2021 10:24:53 +0000
Received: from cb861a1f410b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEA43292-75C6-494E-A4C6-7341D2198B77.1; 
 Wed, 06 Oct 2021 10:24:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb861a1f410b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:24:45 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 10:24:40 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:24:40 +0000
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
X-Inumbo-ID: a6f5c298-268f-11ec-bf57-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGuEWqhbYe87zQ3H3XB166o8BTmn7TOQc9TQu7yALZU=;
 b=9fOXeKGlAghPm79UG3VMz7OE49MNjsvpSgH70987sr1wYMaidHnA/KBkQo8cGKyZBCKKDzntI2qjtkzKqlFxE+/ZaGRRGjdO+0DzhrRM2pztRR2XE1D9NNvRMGVzGte4+AJoPnY2S4xFGv6l5Y4K3Sb039GOG16AazWvLTvOp+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98cb9726210c6116
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciM1fqoePA8YofBiWIEWyCBvnoOn/oa7iO6zhXj6f3m/vG6BdXIGWpA0YBYVv9Oo2NiWN4RoGk1oWiqtWLc9c55vWh+wTB48qQz3Zb/yPIVyw4oxlLN+/Lh4h4nNkMIv/KCca+mqnrrNYuzROR7LMaxjQZDBKY5+4sWXREkFdKrfnMGI4kPmSqgY8K5JfHO7mfKvO7FPxLNS7YbFsi7Re77dc0ZY9V+M3/5krqo+zWK+PKFFSUkbOIuTPBxnomoAXXqsiGn28bBZC3gRO2V5N3UUexvloFoUVKbnoV+YC7OgJMd2IpfjsEq2rX8kM7wgb68lENxjdGAzA86/IT+T0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGuEWqhbYe87zQ3H3XB166o8BTmn7TOQc9TQu7yALZU=;
 b=kMvFDsyejWZj/+d6qxEZ3yFRK4V4bTtBAWZTWy3RtlXNEFKNv7oJcvyvguKz74IhNZ+9PHOMGXY01IMG5EMsyRVzVFHC7Lsk7Odg544EmH8DPiKwPp2uKA9MAh/3zDW/nWSgtbb8C0JIvYmeEmcmjmckh30V2zTcy+lG1nRnfKquhFP7+6+tAJIqTSxfnhNaZRff8mdtL9GhPQsg4Hq9xRRmCtxBrcS1/8yyvRwZwJcjjMMifqX4O1T5YQm9GcV4MireIKqGF61u/6qH3spoIjoACMipN4BqoegJcgIh1do1B0UzWiT5Q2/50z/RnVXF1tJj3ApuTVVvE9462cEwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGuEWqhbYe87zQ3H3XB166o8BTmn7TOQc9TQu7yALZU=;
 b=9fOXeKGlAghPm79UG3VMz7OE49MNjsvpSgH70987sr1wYMaidHnA/KBkQo8cGKyZBCKKDzntI2qjtkzKqlFxE+/ZaGRRGjdO+0DzhrRM2pztRR2XE1D9NNvRMGVzGte4+AJoPnY2S4xFGv6l5Y4K3Sb039GOG16AazWvLTvOp+E=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Topic: [PATCH v4 11/11] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Index: AQHXuSng2klfq7Tkyke3eqid9tvkWqvFxmkA
Date: Wed, 6 Oct 2021 10:24:40 +0000
Message-ID: <0F6082D7-B252-4E10-857F-6D70748320A9@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-12-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-12-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cf884641-d562-4d5e-a99a-08d988b3897a
x-ms-traffictypediagnostic: AM6PR08MB4803:|AS8PR08MB6181:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB618161FA19B2BCF4D02F3F7EFCB09@AS8PR08MB6181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:425;OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UUmQQhLvDSkcy2G6+dIVexuuu2wm3beL6ThvjhHfWE0wmdacqLmi1mjIS7eGSwoAmd0Rvd5kQVW8rbMhgQV1DDlZ3zC0Swa/FtxCcFvPHfJd2ItQqaoWImr/NfWUCp3Hbz9qGk2A/opUHsUoiJGDgF0tsY8QD0M3Fl64VxP7tw/NIz1cgYYZOr1a/riaQcuM2dfGXONGty4cqxaD0jUG0aP2x3qK//d1LIxXd37fC5vGjUUlpZuLotHTWyIZ9UE+DsFm2LEj43C1xbpmr9FrSVb3TVBrKxk3oFr7llBEm2aJ9aWX4/g/knCZLU5audiAKceu1b9GO8Tii/M1oNGojt+rJQvOjZNYEuScraeVi4pru+/qXVPIaE3K1Y+Wln1x08VvaJ4NiwAd5fklud9+Ti+KE6AgEcSh1fIwIS0RrqIVv5YpPBQa7dFhEGYZjjrn4R8+U/vivn7q0stcyEST1k7sWIUTko2b+vbPe7brwe0h4kSqDNYgN757B2naPCsM38HmZHFNCjMuNLhm8cg3021eSN9Yp1VqQ2nxJSo3z8clz5lec2M0YBx3zbY1kvnx2xqPDzkStqgcx7Hw3gD3SxqAY2upkGzGlI/1WLulahI2Jr6z2v17Vry71cLgyPtelG+zk1EnNhcBTBm1XkvZVsSC4Y8d4zXnLIiEx4dAsyfW8VfPQYgSMrDtRaJbUC0FFTWBGifjDotl4/VuicLaqdLGon0JW238sOomZVKkTfs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(26005)(4326008)(7416002)(508600001)(2906002)(6486002)(54906003)(36756003)(6916009)(8676002)(71200400001)(33656002)(66556008)(53546011)(8936002)(66446008)(91956017)(66476007)(5660300002)(76116006)(2616005)(6506007)(83380400001)(38100700002)(86362001)(6512007)(186003)(66946007)(64756008)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21AEF3D1B0606C4C8AF6B1A84C465EC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f66101d1-3e67-4b06-f963-08d988b381b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fhfbq3MayOWG2Sa7vGJITmJhDJQcFleYNUgnAu5GFRJwzV4DbnZbh0ekf1J9EzQHhxPQJqHInF2+hOZC7TNkltNDRqGQopcOs4eefLaknPS3MlG4QFI3H+OGX5ZfuwLYz0C0ngO4zZW6Ys1aKIIx1daJ4OPg4fKZ8DhrsW4Bn+fekMiWBp4dFUTJLjNXjYBRl8dbqW+7b/2RtbHjOJJyhbGLRb71ZVguxtCGfFfEir5vqGL7mz2KJRbSmyTcgNcmI7tNH5i37gaS/vQBCGKdg7aZk+ClEelgm2bBJRw6mbsEsRIbvopR96dsFjqzpeqIygyNkIuAw2T27r3q+HaRzvspsIk9fD5TbSRpK12ht6GgYWTJeQ2jdjXODgyBPPB4jrA3YRcWpKorqy86wVtezgagPCI7K5fOkiAmwD60qlISC4I75qdlX3xkDxLFH9eifzatTxJpmpII9XDP0vIttdLjNYE1PK7IC5gkPag8N4LQfNiOlmU1ZajWsuXhnzZWftM4W21TH44GyWVFfTT0cEnscqlEO2Z2JapSTIIDzLG/xKPfj2ZUiePqMoPkfG4+EuURXS3dT1zgYM2boBFZalfipHgJA7REz2iTi+FEdgcCx68Gj+AaRU9ZCa9UiiawQLQ9DE/M6zDW9YxjApIBpVsLgC8zliAFq6gwJSfKs61mViJLrNMsJYXQfzuiNYoMQltpTaaLHgrkYq/khTQ3kQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(83380400001)(186003)(33656002)(82310400003)(6862004)(5660300002)(86362001)(8676002)(336012)(6506007)(26005)(53546011)(2616005)(47076005)(8936002)(4326008)(70206006)(107886003)(70586007)(6512007)(508600001)(316002)(54906003)(2906002)(81166007)(6486002)(36756003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:24:53.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf884641-d562-4d5e-a99a-08d988b3897a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6181

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> vPCI may map and unmap PCI device memory (BARs) being passed through whic=
h
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
>=20
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
>=20
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
>=20
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> [x86 changes]
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Since v2:
> - update commit message with more insight on x86, IOREQ and Arm
> - restored order of invocation for IOREQ and vPCI processing (Jan)
> Since v1:
> - Moved the check for pending vpci work from the common IOREQ code
>   to hvm_do_resume on x86
> - Re-worked the code for Arm to ensure we don't miss pending vPCI work
> ---
> xen/arch/arm/traps.c   | 13 +++++++++++++
> xen/arch/x86/hvm/hvm.c |  6 ++++++
> xen/common/ioreq.c     |  9 ---------
> 3 files changed, 19 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fbde..b246f51086e3 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
> #include <xen/symbols.h>
> #include <xen/version.h>
> #include <xen/virtual_region.h>
> +#include <xen/vpci.h>
>=20
> #include <public/sched.h>
> #include <public/xen.h>
> @@ -2304,6 +2305,18 @@ static bool check_for_vcpu_work(void)
>     }
> #endif
>=20
> +    if ( has_vpci(v->domain) )
> +    {
> +        bool pending;
> +
> +        local_irq_enable();
> +        pending =3D vpci_process_pending(v);
> +        local_irq_disable();
> +
> +        if ( pending )
> +            return true;
> +    }
> +
>     if ( likely(!v->arch.need_flush_to_ram) )
>         return false;
>=20
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index aa418a3ca1b7..c491242e4b8b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>=20
>     pt_restore_timer(v);
>=20
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>     if ( !vcpu_ioreq_handle_completion(v) )
>         return;
>=20
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d732dc045df9..689d256544c8 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -25,9 +25,7 @@
> #include <xen/lib.h>
> #include <xen/paging.h>
> #include <xen/sched.h>
> -#include <xen/softirq.h>
> #include <xen/trace.h>
> -#include <xen/vpci.h>
>=20
> #include <asm/guest_atomics.h>
> #include <asm/ioreq.h>
> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, iore=
q_t *p)
>=20
> bool vcpu_ioreq_handle_completion(struct vcpu *v)
> {
> -    struct domain *d =3D v->domain;
>     struct vcpu_io *vio =3D &v->io;
>     struct ioreq_server *s;
>     struct ioreq_vcpu *sv;
>     enum vio_completion completion;
>     bool res =3D true;
>=20
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }
> -
>     while ( (sv =3D get_pending_vcpu(v, &s)) !=3D NULL )
>         if ( !wait_for_io(sv, get_ioreq(s, v)) )
>             return false;
> --=20
> 2.25.1
>=20


