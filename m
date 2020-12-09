Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DE2D4143
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48173.85185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxpU-0006hS-W1; Wed, 09 Dec 2020 11:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48173.85185; Wed, 09 Dec 2020 11:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxpU-0006h1-RM; Wed, 09 Dec 2020 11:40:20 +0000
Received: by outflank-mailman (input) for mailman id 48173;
 Wed, 09 Dec 2020 11:40:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmxpT-0006gv-3P
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:40:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dedb4548-2145-4fe8-b93f-cf89efe11e36;
 Wed, 09 Dec 2020 11:40:17 +0000 (UTC)
Received: from DB6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::16) by
 AM6PR08MB3959.eurprd08.prod.outlook.com (2603:10a6:20b:aa::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 9 Dec 2020 11:40:16 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::75) by DB6P191CA0006.outlook.office365.com
 (2603:10a6:6:28::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 11:40:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 9 Dec 2020 11:40:16 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Wed, 09 Dec 2020 11:40:16 +0000
Received: from 3918bbb3866e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25ED851B-E927-4A18-B01A-FEBAD5C3B5AA.1; 
 Wed, 09 Dec 2020 11:40:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3918bbb3866e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 11:40:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 11:40:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:40:00 +0000
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
X-Inumbo-ID: dedb4548-2145-4fe8-b93f-cf89efe11e36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KpoOcniabhfGTxW9b5H+Y2FnQw5rFkheUMJwStrqbo=;
 b=QJj/T3nA6HG1uxKFjsBIgO++LmxtYwY5hqSdMrTOK7ECBI09jsXDoxdNhSgKXvPRtOqNks+M0jVngpoa4fOREh/8m++Zw4+zRgmZwxXODrvJzTtVW8YP5ZRkpMsq1uKDLNq8rBFR3hNzUcyOF/p5mglNKfVX32/2uCPghaT9ppM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41e6ce38710fa98f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb9onrpQKvSfWl1Z4zXDpHqGiNXZhnTkbkyLPRbGGbvLxHkWL6nbi8awBnRBAWx3l52nYjQmUx5cB7p0NwWYtB2Py8efRoptfm+Od2EDaqAAVbYr/00rcVZDycb8bg05VlgvQcQOUXfkZx/HGaXc9VNuhjwovVzJZhJ0sNeeGnwkdXmkrJTTUiN5T78y22tpuWim7J0kuC6RuQRg8OGlbLFdd1pirP76i4O+PxgPXrrQGS6AMyOig5QY9fY/qiuCvIY9b3GPQdEpHey9sUamaGZszBGUFyEK+ezKDLQ5b8wHek/LbdVpyy00e2pYU0zzpi8jzLq4zdRpe7fjswFzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KpoOcniabhfGTxW9b5H+Y2FnQw5rFkheUMJwStrqbo=;
 b=TgZ7MFG1dQ8ncpCPIbdzV4ELJGGz8rleiJ54Gd/GseZtGsowrqzkM6e6Fj62i5UhI99E8l0QFLzO90xiwCXxCSoMkf6GVMJFenO/75xu5DQgzW+sl+OWNAVydBZmOOZeXGlsAxnOyshDnNov6p2ci+NzmFVw2QCsiURubVW7eHN3zpH/U54CH/Ke79zU4zS8E96/R1UWbiqtyHAsZucogzqP6Hn8RcgN+WlKuRFtqW2c6CZ4LBMyAzg2i19pDHbN/iWOtdXOVG87pWQPtFpoBT63JzO8LBhd/bDJLtJOSTv9s5+q12/p9eSRGvWqV0EQ0JmuDLnRnOaLE5KSsQjQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KpoOcniabhfGTxW9b5H+Y2FnQw5rFkheUMJwStrqbo=;
 b=QJj/T3nA6HG1uxKFjsBIgO++LmxtYwY5hqSdMrTOK7ECBI09jsXDoxdNhSgKXvPRtOqNks+M0jVngpoa4fOREh/8m++Zw4+zRgmZwxXODrvJzTtVW8YP5ZRkpMsq1uKDLNq8rBFR3hNzUcyOF/p5mglNKfVX32/2uCPghaT9ppM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/8] lib: move parse_size_and_unit()
Thread-Topic: [PATCH v3 4/8] lib: move parse_size_and_unit()
Thread-Index: AQHWwayC7RWAkHGkqkKPXBnWs+PFuqnuvLOA
Date: Wed, 9 Dec 2020 11:40:00 +0000
Message-ID: <F9B5D8B2-67CA-4912-97BE-5A980ED572EB@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <489b3707-9e9c-184b-3e1f-1d28fd1fb0ee@suse.com>
In-Reply-To: <489b3707-9e9c-184b-3e1f-1d28fd1fb0ee@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9ed098d-576b-4398-aeb0-08d89c3732bc
x-ms-traffictypediagnostic: DBBPR08MB6075:|AM6PR08MB3959:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB395964C22B97BF748C97EADE9DCC0@AM6PR08MB3959.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:187;OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MAFGFE1Smts5HoQZ5s7tyFdTM/WudcUIf6m2IYBm6Si+/zj9ttsoZALG/qkbxyhkwfRX2Gq0p4c9vb3psbRj9Htsw66yFs94O3KFJiE534T3sLP3QoVPvuVd0SvbmG3I38FXnxt8rE6PIVi3b1fSIQUFmmQU4XyqMX7FSTq3q8nFWIwPOCRCkNheiP2sRxZ6YWabpe86adqiiO2G08m2p8vU6H5kG6twzrPnAnKv6yQ1NhuTBOVMH9ciZgqIGtRSSlw3NF7PZT+S07r+Rg2TQ9CYEzVy7uC6ZHhXdMMHt0zfyPcko3uaBFENMIfQiydGMMcFbV7PJIuSa6m0FdvPw63+HnYfB1ZJAm8z+Yx1C0KHDcQH2aveHLJ1RxwGLsEw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(64756008)(33656002)(83380400001)(6916009)(8676002)(66946007)(2616005)(76116006)(86362001)(54906003)(2906002)(53546011)(66556008)(71200400001)(66446008)(508600001)(8936002)(6486002)(6512007)(5660300002)(4326008)(91956017)(186003)(6506007)(36756003)(66476007)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?AH0uqVPb473FX12hEWqug4/IjmeJa3Z/nChqHC+KBr1hquwSCnN7FSTulAVc?=
 =?us-ascii?Q?thHRI1RenGmP0DN0ldkrjn+knjw4SNpuUMX2T78Ut0qhDzgRlt7IV1zVi2wr?=
 =?us-ascii?Q?k8+mZa2RXjpy46trUocbWgNcZHJfrIPLCvR56jT//Y9/GC5F50XxKnCLvCcA?=
 =?us-ascii?Q?FceQuDD05xt8jyhqdlObjdDQRC7jlt5hx7mxtOQttBtuelSzqUH05E+403F4?=
 =?us-ascii?Q?f7+fpOMIklYKz/Oqsgwd0YNfRZz2rGeZMOERV2rptGikrmLfDEJ9rjA+p+cF?=
 =?us-ascii?Q?1LtdPnsLmUdh502QRJFmj5dmUXJnLwxaxnWHK3dDt3bE3oMCHXNb77XqBBKk?=
 =?us-ascii?Q?zkzBF89VTPLOIcW78P70AKRPuQgk6JnwmgjiBoYebMe1rX/7t6zckQO8N1cW?=
 =?us-ascii?Q?BOwd2RbgJ0QY66f8Kr5Eoc21X8dK1Wo7X3xGa/DdI2iY5xNtIgs2YmatvniE?=
 =?us-ascii?Q?HzeOUGP8L4J/E0pYsG42BG96Br9MiNd8FPGgXXR38LELtHeanlJEexGGfGxd?=
 =?us-ascii?Q?bDt7ocWMQPJENKLX1mG8m9i4TxUWwzNCI6GHmVWjStLoPZdCPYQeCw/dALuo?=
 =?us-ascii?Q?T7ZtIJDSlNvyuhXNGnWc2kNCu6UwsoiqJ/2VeL06p5D0wa+6XzJOkltMjyLI?=
 =?us-ascii?Q?MUYAQxdTDBkbbmEi4gUl0nA3LKnOD4QBCvvpq18nvBAsAvKfNKAbxcFoUh9O?=
 =?us-ascii?Q?Pzt6Oqm2wQlJ+fRhXi2WC4MVICnlQ0l6Z0ewdInbbOI4iMZp2PigNv0nQdzI?=
 =?us-ascii?Q?q/7NkwbsOjIIAZyRCrVN5PbcPBrMCzK3h4n5dx96REzCgpIntjeZ/YjLY4I0?=
 =?us-ascii?Q?kE0Ecq4Z9hVduxR/vC8nPifNzXg/N+NhDYuRxCADHY1kIyhGYauaZTnmtB1F?=
 =?us-ascii?Q?b9/4qnSmLlFyWXAxjcTGd1GwoHBtm7A9KzFrJjfWN+HG+ERMYO9jJVIDbM2K?=
 =?us-ascii?Q?RKhJ0guOwuH9JREet6kG7mYAWrihumcFO7xh924IDMf8qO6WwcYtm4PdHoGq?=
 =?us-ascii?Q?Mq0V?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A0608BDA842C4444B1A9D6DDD5D6B68D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ea865fc-df24-473d-dd32-08d89c372932
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jTZGtPIub500pOg4gJSvwMWhR+JUuC9a+iFL3jdn5tgJc7l/0P+OsFf0O/+JQKgQHKlzPrq8b+HazTkBPzpPYMolgrOcvfgML60PTl+Qvvi1RqYPV89fCMg2y7L88+8PoXCLL92Z9aeyquiu+whIxmjNvjgo++PZBo2cy9/WRhyLwHetYONDX74kKdZtKmKs4KwnbMuxokkNj8HpYUhKnz/oIfcNMjenKO2JRdcR6jRwT+kv9q+aSoWHgXjyp0vSExLgOc1/pnRtYNZxRh+zVwO+A34JubZiSnTHEArZpmfCmr0SEFUE2zkaCB++L6xsHigHQtPOxoEtmeD+0UAk3YPdrtHr7WKO8wwnBgpdN6a4L7+aC+6haXoeyA9zT+5k2TACXzKLcADCvH9APPAggA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(36756003)(26005)(6512007)(8676002)(47076004)(33656002)(186003)(2906002)(107886003)(70586007)(6506007)(70206006)(478600001)(86362001)(8936002)(4326008)(83380400001)(336012)(356005)(6862004)(316002)(53546011)(6486002)(5660300002)(2616005)(81166007)(82310400003)(54906003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:40:16.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ed098d-576b-4398-aeb0-08d89c3732bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3959



> On 23 Nov 2020, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> ... into its own CU, to build it into an archive.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/lib.c     | 39 ----------------------------------
> xen/lib/Makefile     |  1 +
> xen/lib/parse-size.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
> 3 files changed, 51 insertions(+), 39 deletions(-)
> create mode 100644 xen/lib/parse-size.c
>=20
> diff --git a/xen/common/lib.c b/xen/common/lib.c
> index a224efa8f6e8..6cfa332142a5 100644
> --- a/xen/common/lib.c
> +++ b/xen/common/lib.c
> @@ -423,45 +423,6 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c=
)
> #endif
> }
>=20
> -unsigned long long parse_size_and_unit(const char *s, const char **ps)
> -{
> -    unsigned long long ret;
> -    const char *s1;
> -
> -    ret =3D simple_strtoull(s, &s1, 0);
> -
> -    switch ( *s1 )
> -    {
> -    case 'T': case 't':
> -        ret <<=3D 10;
> -        /* fallthrough */
> -    case 'G': case 'g':
> -        ret <<=3D 10;
> -        /* fallthrough */
> -    case 'M': case 'm':
> -        ret <<=3D 10;
> -        /* fallthrough */
> -    case 'K': case 'k':
> -        ret <<=3D 10;
> -        /* fallthrough */
> -    case 'B': case 'b':
> -        s1++;
> -        break;
> -    case '%':
> -        if ( ps )
> -            break;
> -        /* fallthrough */
> -    default:
> -        ret <<=3D 10; /* default to kB */
> -        break;
> -    }
> -
> -    if ( ps !=3D NULL )
> -        *ps =3D s1;
> -
> -    return ret;
> -}
> -
> typedef void (*ctor_func_t)(void);
> extern const ctor_func_t __ctors_start[], __ctors_end[];
>=20
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 764f3624b5f9..99f857540c99 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -2,3 +2,4 @@ obj-$(CONFIG_X86) +=3D x86/
>=20
> lib-y +=3D ctype.o
> lib-y +=3D list-sort.o
> +lib-y +=3D parse-size.o
> diff --git a/xen/lib/parse-size.c b/xen/lib/parse-size.c
> new file mode 100644
> index 000000000000..ec980cadfff3
> --- /dev/null
> +++ b/xen/lib/parse-size.c
> @@ -0,0 +1,50 @@
> +#include <xen/lib.h>
> +
> +unsigned long long parse_size_and_unit(const char *s, const char **ps)
> +{
> +    unsigned long long ret;
> +    const char *s1;
> +
> +    ret =3D simple_strtoull(s, &s1, 0);
> +
> +    switch ( *s1 )
> +    {
> +    case 'T': case 't':
> +        ret <<=3D 10;
> +        /* fallthrough */
> +    case 'G': case 'g':
> +        ret <<=3D 10;
> +        /* fallthrough */
> +    case 'M': case 'm':
> +        ret <<=3D 10;
> +        /* fallthrough */
> +    case 'K': case 'k':
> +        ret <<=3D 10;
> +        /* fallthrough */
> +    case 'B': case 'b':
> +        s1++;
> +        break;
> +    case '%':
> +        if ( ps )
> +            break;
> +        /* fallthrough */
> +    default:
> +        ret <<=3D 10; /* default to kB */
> +        break;
> +    }
> +
> +    if ( ps !=3D NULL )
> +        *ps =3D s1;
> +
> +    return ret;
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


