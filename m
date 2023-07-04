Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87432747432
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558421.872507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh81-0005MU-1L; Tue, 04 Jul 2023 14:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558421.872507; Tue, 04 Jul 2023 14:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGh80-0005JM-U7; Tue, 04 Jul 2023 14:35:40 +0000
Received: by outflank-mailman (input) for mailman id 558421;
 Tue, 04 Jul 2023 14:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGh7z-0005JF-DF
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:35:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe02::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0b32e9-1a78-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:35:38 +0200 (CEST)
Received: from DU2PR04CA0188.eurprd04.prod.outlook.com (2603:10a6:10:28d::13)
 by DB8PR08MB5354.eurprd08.prod.outlook.com (2603:10a6:10:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:35:31 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::bb) by DU2PR04CA0188.outlook.office365.com
 (2603:10a6:10:28d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:35:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:35:31 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Tue, 04 Jul 2023 14:35:31 +0000
Received: from 168dc085fa6f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9F33600-BDBD-4DC7-AF68-52DBD044B484.1; 
 Tue, 04 Jul 2023 14:35:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 168dc085fa6f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:35:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8237.eurprd08.prod.outlook.com (2603:10a6:150:5d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:35:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:35:16 +0000
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
X-Inumbo-ID: 0b0b32e9-1a78-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+rZJlQ1eC64c5Kq4Za0wz2FbOXczQGH8R/vTXItowE=;
 b=GKzTp23tT0MeMfOovpic2ejI7wFQiV1IGrPf2wBpE2dpLFsQ5Vks2yGoiEE1y+BMOomT0TmPEAnxbjjwG9zJMMP/NbzxJZVESMnpFfLfJAUlTMlkzC0CXWr4VytnTzy1UwvFRswqqfYLcQVOGoKLr9jJ42o/EJa24ttALUXTuPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9dc3cd63b91531d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiHJFWjoU5D7777zsFdh4woyjFaqO6Xk8Ut1phuBYKXejExyteshgG0UFCyctKdo0cFM2TuWqJgC1FrKV9BjEcwcUp9qn591jY5Li8fYk2DwkUK9U7dChsDnEmutJQ9n17EXKMv5OYFNFw7qEt3nArOzJNiYT342at9wYXf28WXPS9C2q8E0KOKxf6zh6Qoc1fRxGTE3GjZJ9QC461l9hrFlMHkunbjRppfPST00YwVbG3dtBi742Uh2jXrsrpSeWEsD01CP/YizmD0cTU6eJZqDkf5jb4aZtBMDNjJdZfiF+9oa3+yCzi6Lb2ktD79hntkRSYvooAWK4EG6ZKdw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+rZJlQ1eC64c5Kq4Za0wz2FbOXczQGH8R/vTXItowE=;
 b=YmbUzQOcaBnrO6MtF1pbM/lqlcYBS2GhN7tB+NKasTt5duAcSw952btUq8vETlX9chxvh8lIrHngWVjnSzmYK69vGPuWc/MYukuI3CbF3vz2cjy7bmnrPCFjVJxp79p4it0WiMKVu0cJGuKo4XyqXAX0i6Ff46jLqaQZhuUt4DP9x+GdqkHmwyiBwtavdUVs2ZeKZeGC4ywr+O8CTeBh7SSqcmDLQN8VOx4Z4d9L5MRzm7OS14d+Pj448E47PZJnLikzBCyr4+2DDfypRboD/Dvq9ywbRrn56mxhdhyznxp+0cWz9rnGMpNJcdKDe+/dt0TMEJWlvVZZDbiIcpOHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+rZJlQ1eC64c5Kq4Za0wz2FbOXczQGH8R/vTXItowE=;
 b=GKzTp23tT0MeMfOovpic2ejI7wFQiV1IGrPf2wBpE2dpLFsQ5Vks2yGoiEE1y+BMOomT0TmPEAnxbjjwG9zJMMP/NbzxJZVESMnpFfLfJAUlTMlkzC0CXWr4VytnTzy1UwvFRswqqfYLcQVOGoKLr9jJ42o/EJa24ttALUXTuPc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>,
	"federico.serafini@bugseng.com" <federico.serafini@bugseng.com>
Subject: Re: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Thread-Topic: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Thread-Index: AQHZqs0B2zzuMPxesEq0PvPe7uOM1q+ps9kA
Date: Tue, 4 Jul 2023 14:35:16 +0000
Message-ID: <B186E9AD-1DBE-41B2-ADE9-850F1ACC4078@arm.com>
References: <20230629210150.69525-1-julien@xen.org>
In-Reply-To: <20230629210150.69525-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8237:EE_|DBAEUR03FT030:EE_|DB8PR08MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abe300b-2588-4ec1-dbb5-08db7c9beb42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HtaIxZGEC+7II/iIThVIuQCgfEMckEvA9BGYjIbuivv459s7J3/R6f4mRutpbHfBbSSJjFrs+XvxOTL8qjdJ8EEvwjob8+/mZjs/LO9vCOd3/NK5bADrchOKBa+AaS6JIsvNi4WJ47c9hE129rpT9cxMMYbDWEeZmsyI0SzP18UDXeMz023YKxNNMWeWxD2SAPTbZ3H1Gm0Gsk4WFVYcENEH7qkJrXExxxEwlzTkW43wQZhnpuTm+Ooq9UYNksMxy4KMDOiQNIsPDpI86oqySzG/0z2nWau587VNfAaFEPzMNlsi/+qATAMbpZSbUuUYMvG9Z1SUGSjOE8VcitDC7dENlKq0+g24bMkEGXvXqD6DtU/6JbwB5WX15++tPLuIDu+FjcyLW2HCkVuj37Z1OqyrtZCs+AuaHvpyhgALVhfGQHQc0wdP6d9GJIHyCNuDEzG9daYCQpYcnigV6sQE8tSnAa5ybLmWQce4KC0VqrvMQrbiv+Q+4RV5mcjiNT+dZfSo7oeXTDWPbT1l7EvIOdMtVMXjsQQFlvsSL9VHovrkLrqGw3RAI9LpNMur15yxhWjKlLc0LN/LVN//tPPe9R08P0PXpnZBiMm0iABsGEb6Yhc9bhgy2ZydlXhwGSmmuuw1nnXyKkLIlaDCaeHg9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(478600001)(71200400001)(6512007)(6506007)(86362001)(2616005)(186003)(53546011)(38100700002)(54906003)(66476007)(64756008)(6916009)(66556008)(4326008)(66946007)(66446008)(83380400001)(91956017)(76116006)(6486002)(316002)(122000001)(8676002)(8936002)(38070700005)(41300700001)(2906002)(5660300002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3319E8BA585A3F4A8DC57110E7B9EE0D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8237
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42c3eb7d-cf38-4296-e288-08db7c9be295
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o8/7ZzrB7Q010kYpZm/vqto8AztIQ5kqp1lULcX9pSRLTf+Z5dmYrwpRjsgJbcV6zMeNkOHSXobmyEoivz2IbyfV34PnZHa2PyTbgvNnB+HglqwoVxb8A+hKDHytsr35TWay68dqTwtzB0qsK1gcWbClOXGfcZRECxNEP06H4QR8aS5Tih2BtG1pXIyIfpjQcF5hJMKoC52Or0bNvlGztqpzA82GGwCLPN5cdNIjsSzEz1jq6A41unzZqKDEPjz/A0c914+aLGm7IrREBPpXX7Ix5HMl+jaPuVg6O5U2lSluAisvi3sWFbsfAdpgUUDl1mRJIAfhyKQWMLkuSoDRQMc5qmIesc0F4jxP6l7qchYFZrAqwY1+SKKd6bMTyfFJfv+5mt4N8UxLR0bfw3MFkRL68bccRe4lQdj9bClASN5S7OsyDeJl4gOONkqDr7xnBLigSBO7Cin55a9l6L9n+cVI9UjSgVVfAXs9bP5KLsytfRnx69Bv5/uulTg/VF1SnX7RCiBWrF5IC8NBU1rmgGAyDdC2KxhH6Y2QAxCDurrySD1EXBC81gR0IUsWh+8JdcC8vuBjlRcMpaQyWkPldzsPkcX1HGmUZd8x8gL4bA/xPtnuBOAR1DKqCcMn9Pv4KbtW9lqUbtGCsHvHCvxPnZZO4Fpu6oyC9WMdGmKQAclatZfoODP+GnZCkt0sIIMAi+RhQqGraC+t2TqvUMes6QkbOae72dzhcbzko8kM172ladQBplkl25uzxPFOgXi5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(107886003)(53546011)(81166007)(54906003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:35:31.1859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abe300b-2588-4ec1-dbb5-08db7c9beb42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5354

Hi Julien,

> On 29 Jun 2023, at 23:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Both the stub and the x86 prototypes for replace_grant_host_mapping()
> and create_grant_host_mapping() will define the first parameter (and
> third for the former) as uint64_t. Yet Arm will define it as
> 'unsigned long'.
>=20
> While there are no differences for 64-bit, for 32-bit it means
> that the address should be truncated as 32-bit guest could support
> up to 40-bit addresses.
>=20
> So replace 'unsigned long' with 'uint64_t' for the first parameter
> (and third parameter for replace_grant_host_mapping()).
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Cc: federico.serafini@bugseng.com
> ---
> xen/arch/arm/include/asm/grant_table.h | 6 +++---
> xen/arch/arm/mm.c                      | 6 +++---
> 2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/includ=
e/asm/grant_table.h
> index f2d115b97d8b..d3c518a926b9 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -36,10 +36,10 @@ static inline bool gnttab_release_host_mappings(const=
 struct domain *d)
>     return true;
> }
>=20
> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>                               unsigned int flags, unsigned int cache_flag=
s);
> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> -                               unsigned long new_gpaddr, unsigned int fl=
ags);
> +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> +                               uint64_t new_gpaddr, unsigned int flags);
>=20
> /*
>  * The region used by Xen on the memory will never be mapped in DOM0
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0a3e1f3b64b6..53773368d036 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
>     return;
> }
>=20
> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>                               unsigned int flags, unsigned int cache_flag=
s)
> {
>     int rc;
> @@ -1600,8 +1600,8 @@ int create_grant_host_mapping(unsigned long gpaddr,=
 mfn_t frame,
>         return GNTST_okay;
> }
>=20
> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> -                               unsigned long new_gpaddr, unsigned int fl=
ags)
> +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> +                               uint64_t new_gpaddr, unsigned int flags)
> {
>     gfn_t gfn =3D gaddr_to_gfn(gpaddr);
>     struct domain *d =3D current->domain;
> --=20
> 2.40.1
>=20
>=20


