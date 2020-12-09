Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F482D4407
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48294.85374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0H2-0005ux-F0; Wed, 09 Dec 2020 14:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48294.85374; Wed, 09 Dec 2020 14:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0H2-0005uY-Be; Wed, 09 Dec 2020 14:16:56 +0000
Received: by outflank-mailman (input) for mailman id 48294;
 Wed, 09 Dec 2020 14:16:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn0H0-0005uT-1v
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:16:54 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74b127dc-c732-47f7-ab2d-0b8d16de4052;
 Wed, 09 Dec 2020 14:16:52 +0000 (UTC)
Received: from AM6PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:6e::19)
 by PR3PR08MB5787.eurprd08.prod.outlook.com (2603:10a6:102:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Wed, 9 Dec
 2020 14:16:50 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::72) by AM6PR02CA0006.outlook.office365.com
 (2603:10a6:20b:6e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 14:16:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 14:16:49 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Wed, 09 Dec 2020 14:16:49 +0000
Received: from a467417626a3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 003A9122-9980-4C96-B08C-07980B00DBEA.1; 
 Wed, 09 Dec 2020 14:16:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a467417626a3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 14:16:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2693.eurprd08.prod.outlook.com (2603:10a6:6:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Wed, 9 Dec
 2020 14:16:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:16:10 +0000
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
X-Inumbo-ID: 74b127dc-c732-47f7-ab2d-0b8d16de4052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4izZKCVsdEjKthzaBsRUktlaPI4UQdr3VkDWbU0Rydo=;
 b=QRXrn0r6V7y4CLWybjeLHq1aDDFIMa4GwLdTbEgKYlJF04iP68ssLFsya3gbd69hCIEi4n+ZvrvUr2AzgQAAZK16JuhcN3UKN9RsKCWTWobyOyIl3qVgO8L2IoiMycXEULKMC/nWBiCav9CR/jFWK/ts6CqpZQU3uMER5HBMzKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 024de50e573ef70f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4X8bGnk352HdGnDorp2q1THtw/2QZhA+EjqkhoSOPVuS9qKfMMb2xgFxbo3Cv7cDGBbpLxdCDvCY6C9dt4sjVLq0ACogt3B2sldtIBMcbiNoVDlB5yBa3wXwUb6GZC5OC6IcHZ/0f7EVeLw9iuXIU7jOCcgQM2VDl+/39q4eFm2LbMhK7sHO8xSMsmPr+NxM5ofbR+E+JLBeajbPd9BvpsNk//WuOjTnjBeWYLK9lx4+9GglLwaP/r8R+rFx0rodkr605voG9INNYvHlmbrNwRG/lnYWlhZxTpDbLlwKOt0olCEfXjQuicfITCgbENt7eS9zD4iHVggD/OlQlbAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4izZKCVsdEjKthzaBsRUktlaPI4UQdr3VkDWbU0Rydo=;
 b=ByRD55oh6kVikCg/PIRPl6vHc+X7R2KkTB/lCWqZjmhkVob2YezzKZ01XhF1weTQJ7GjfNaniIUFQQprVtkK/oS6ykxXOCKMRVByJXxPcw0NVWNx97goF7NFRHLg3CwUzifdwpxNHnUZsrA3EJl8JsOXCKvwCeKx41JrCqXpeev/S8FZAhDj3tbM0vJIeZpSxlxkV8GzaUvAqUnSoELKCbagR/5Chgjv9CyG8P9MEvTbXQVDeFcc7lYU+tK6UQCy3L+SnnbFXpA2z8X7F/g1OHBOg5JVz2GBC2No1cUF8sKz/ru8CsPRK0Lm3TFapswxaYZbKG7+R/pC+ezjXCbYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4izZKCVsdEjKthzaBsRUktlaPI4UQdr3VkDWbU0Rydo=;
 b=QRXrn0r6V7y4CLWybjeLHq1aDDFIMa4GwLdTbEgKYlJF04iP68ssLFsya3gbd69hCIEi4n+ZvrvUr2AzgQAAZK16JuhcN3UKN9RsKCWTWobyOyIl3qVgO8L2IoiMycXEULKMC/nWBiCav9CR/jFWK/ts6CqpZQU3uMER5HBMzKQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 5/8] lib: move init_constructors()
Thread-Topic: [PATCH v3 5/8] lib: move init_constructors()
Thread-Index: AQHWwayh7DilyZtY2UyuPRFMdOVH76nu6FSA
Date: Wed, 9 Dec 2020 14:16:10 +0000
Message-ID: <469DDA0B-66C9-4F57-B647-E2CD7AFE84F1@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <c67ca263-8a82-d0c8-e6e1-6afdeeb9df8c@suse.com>
In-Reply-To: <c67ca263-8a82-d0c8-e6e1-6afdeeb9df8c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76571e28-02e9-47dc-37a2-08d89c4d11f2
x-ms-traffictypediagnostic: DB6PR08MB2693:|PR3PR08MB5787:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB57878420FA9072A62AC0D26E9DCC0@PR3PR08MB5787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E04s2a+IjXhvnuxL13jZnFduTDex1vilmfapdxPrb5qpuhq4BM+QigOZ+JAsOgyznUhNnLfibr+2NaC4B5+D3y/eQkAOVCkQYe/VdOKl4GfuOPu2ebmiWHV9L9s4p+aDsQTXoai0sYUTUIdXuckoEAOwKDHp9f3IcS0JWVMe2d9TXZzkzNCf/Af/tK44KE3SF+pDNNQarB2rtusKPHrD3HgyaEFFUlvSuFIw4PQsp8qa/tEjAOdfx4AFJIB/HvdKv71uUJke4iestcmTgD0qkhOCbwb21xzs5psBHyDPxDmhq70cf2xrud/47J5dS6uLRu1JtkvVHAI22J7n4LNQAwl/98BfIbeUev+vja7ocOpQP4JCT5RZs1cmICa55Gxa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(53546011)(26005)(64756008)(508600001)(8936002)(6916009)(8676002)(2616005)(36756003)(66946007)(6486002)(6506007)(66476007)(186003)(54906003)(2906002)(5660300002)(6512007)(83380400001)(66556008)(76116006)(66446008)(71200400001)(86362001)(91956017)(4326008)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?HVpEoiNr/pIlqOXKGPWpgldWKnxGea9X+S3Uoln5QAbOW9ib21GT9Q7GA/3K?=
 =?us-ascii?Q?TbgkHs70Ziy6YpNRXhhw/375R6pcRH3hJAldxnsIXeHoSmIWxQ/BuFZGfFQb?=
 =?us-ascii?Q?q2NirO3cIwRbdRSTaBEIuITvUsbiF9iT8xtKk1lHWGYsigY7fRm1cHGUGKb0?=
 =?us-ascii?Q?RJ6vAdX8CmM+a91Ky41XhI2Qg57pjddMc8JrJXGlnPX/WaUzyD9vQpMhWZmB?=
 =?us-ascii?Q?QKMUZ5Rt3NEW1ErzB3P+dUvw1+jaVhgz0hJVbWt2G7yfOzlYwRbZZm2sggEo?=
 =?us-ascii?Q?Q3UcQh+Ankty9mKNhCRyDM95qBmhMggheDsuH6hGKYb8Tqx4+utpPtwmxK23?=
 =?us-ascii?Q?UpN9ZvojoKRMB2KdTHkASwIJDpeSTDBb95cEl6TTYv8fgTbhFy52tknf0uYz?=
 =?us-ascii?Q?syKCo3mWBgrUA4lFuG5DnMEyqu2tibkbnThsc2uDYZvvqLG5z83Nav4TsGSY?=
 =?us-ascii?Q?CYk8j2yxqU5BhGN4RjMZf5enWcx08b8tmki925v0oyNnEDa8Al8MxA/V7QvA?=
 =?us-ascii?Q?L24qIYgJnG983mK2y+CkgZq7PYgJ68erTGsEgGUy26EiphK9gGN6jDG165Lj?=
 =?us-ascii?Q?twYdrKBZK/9LqPnnGEhMn2JMTP0I2420jXVMNk/m+5V5j8B09jqX7AU5Ro1o?=
 =?us-ascii?Q?kU8TZwHCQnTjdoFDyN9oDOCSLxMLrQsDzl2QeCC4L2CZ41g2W6yjAZx0p60Z?=
 =?us-ascii?Q?IfRK4ECLbUXHvRip+uFR6R3hx9eEuCX9jgu51GXkOvVAdu4SeDNVpQB23yOO?=
 =?us-ascii?Q?FA2Cbp2kVRvZ6qISU9wsnNVvGOvi1Wv4KjfH39qa3z/ogDWn1/rlWl3wupzF?=
 =?us-ascii?Q?yGb/f1ISjz0YEnYcLAyYXHeVTsqqWPjW0phj1QJS3VcHDKmAZbWNCdZZF14Z?=
 =?us-ascii?Q?TaD0MBBnpAXxQ3TsQah5YmlKqs+7y51SmNony9KJLLoCZ4LmUC2do2LGg/UI?=
 =?us-ascii?Q?yR3kPAjzdLyxH+T9OXjk+d1zxwsQ4Yg+POmA3wjYE4i2ACeG/gmQsH28J8u2?=
 =?us-ascii?Q?b/BC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1FDED7345616542B49D668D7772A5D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2693
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f43d9cb6-c540-4658-e12d-08d89c4cfa36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g4oBPbQ1JqwDa9wYFRkahRaX0sgPXck2q8TVvqtHpvQE2OQ01s6+JHLMsXhtYW2r0E0B0ZGqM7AtNl2yjSAYIZK6G3znnYF9oyE9ngAB+Mdm+DzjCYzy5Qr4burLKh9txd/HYa1cfsimJtGwUOehGnjFvooLBVCnewTx/iuf6AhWEGnClRbY7zdZ+6lOEDmQgLfD91s+3q8DYacL1CV8yQfql8Sgl2K9gRQP5M+Bd7/gbJZCkMRCUp5r9uOQmyA5/67kzp22jqYPbnr6y5sJU3FOKj7fRm+D3qQjiKyJJdQdjQ1VoQ5YpkVoiSTucAJV3tHy6E1fdFLgZK1pMpeWVxrLEoIUHE3T8CfHwWEfsnSTWQS9NkceM4QECuiTDdRHZAByFBvUjzMKyYmyZuQloA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(6506007)(4326008)(356005)(33656002)(2906002)(107886003)(70206006)(83380400001)(8676002)(336012)(86362001)(2616005)(508600001)(53546011)(81166007)(36756003)(5660300002)(26005)(70586007)(6486002)(186003)(6862004)(54906003)(6512007)(47076004)(8936002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 14:16:49.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76571e28-02e9-47dc-37a2-08d89c4d11f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5787

Hi Jan,


> On 23 Nov 2020, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> ... into its own CU, for being unrelated to other things in
> common/lib.c.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/lib.c | 14 --------------
> xen/lib/Makefile |  1 +
> xen/lib/ctors.c  | 25 +++++++++++++++++++++++++
> 3 files changed, 26 insertions(+), 14 deletions(-)
> create mode 100644 xen/lib/ctors.c
>=20
> diff --git a/xen/common/lib.c b/xen/common/lib.c
> index 6cfa332142a5..f5ca179a0af4 100644
> --- a/xen/common/lib.c
> +++ b/xen/common/lib.c
> @@ -1,6 +1,5 @@
> #include <xen/lib.h>
> #include <xen/types.h>
> -#include <xen/init.h>
> #include <asm/byteorder.h>
>=20
> /*
> @@ -423,19 +422,6 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c=
)
> #endif
> }
>=20
> -typedef void (*ctor_func_t)(void);
> -extern const ctor_func_t __ctors_start[], __ctors_end[];
> -
> -void __init init_constructors(void)
> -{
> -    const ctor_func_t *f;
> -    for ( f =3D __ctors_start; f < __ctors_end; ++f )
> -        (*f)();
> -
> -    /* Putting this here seems as good (or bad) as any other place. */
> -    BUILD_BUG_ON(sizeof(size_t) !=3D sizeof(ssize_t));
> -}
> -
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 99f857540c99..72c72fffecf2 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,5 +1,6 @@
> obj-$(CONFIG_X86) +=3D x86/
>=20
> +lib-y +=3D ctors.o
> lib-y +=3D ctype.o
> lib-y +=3D list-sort.o
> lib-y +=3D parse-size.o
> diff --git a/xen/lib/ctors.c b/xen/lib/ctors.c
> new file mode 100644
> index 000000000000..5bdc591cd50a
> --- /dev/null
> +++ b/xen/lib/ctors.c
> @@ -0,0 +1,25 @@
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +
> +typedef void (*ctor_func_t)(void);
> +extern const ctor_func_t __ctors_start[], __ctors_end[];
> +
> +void __init init_constructors(void)
> +{
> +    const ctor_func_t *f;
> +    for ( f =3D __ctors_start; f < __ctors_end; ++f )
> +        (*f)();
> +
> +    /* Putting this here seems as good (or bad) as any other place. */
> +    BUILD_BUG_ON(sizeof(size_t) !=3D sizeof(ssize_t));
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
>=20
>=20


