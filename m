Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AE75782C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565053.882902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh6l-0005O9-PL; Tue, 18 Jul 2023 09:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565053.882902; Tue, 18 Jul 2023 09:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh6l-0005LI-Li; Tue, 18 Jul 2023 09:35:03 +0000
Received: by outflank-mailman (input) for mailman id 565053;
 Tue, 18 Jul 2023 09:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLh6j-0005L6-Lt
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:35:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cc0b65a-254e-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:34:59 +0200 (CEST)
Received: from DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) by PA4PR08MB6256.eurprd08.prod.outlook.com
 (2603:10a6:102:e6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 09:34:48 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::50) by DUZPR01CA0025.outlook.office365.com
 (2603:10a6:10:46b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32 via Frontend
 Transport; Tue, 18 Jul 2023 09:34:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:34:48 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Tue, 18 Jul 2023 09:34:48 +0000
Received: from 44dc659f22bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98DDDD9C-EBA5-4968-B97F-F3B9865AE9AD.1; 
 Tue, 18 Jul 2023 09:34:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44dc659f22bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:34:37 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DB9PR08MB6412.eurprd08.prod.outlook.com (2603:10a6:10:23d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:34:36 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:34:35 +0000
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
X-Inumbo-ID: 5cc0b65a-254e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/g4k9D9SvR5mKHxvJhhHBkmqMlgOSwvcoxhNKuGuP4=;
 b=ddOKPqt5qvi5i5H3N2ZCy0pSJxqg/P73EPxhOmPSzlpoRDKWKHeIQr4kv/pJRsu+Dj1ja/L7OyA268oouS1YfptrZL6ZzgrBSJR/52uEQEp5zxIjmi1N/P4hqJKfEIh6YczLxPz9h6JZAtBlY256ch80kd0/TJ2kLmyz3H8u0f4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75667ec8af444dca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axxv49FL0jpi2XNei41+FW2eUaR6UnH74tsSRhIWz+HdRruK0TIREEVlUkgAly4La63O4H7KU9CF6n+ZmnXk73Ctgv/YSeX5NjyH6d/pIwXNZ3WurjqeMmnZNOc8/uXPkCV8KedngSDMjfGGSHAJ12UJw1YOou2SjinsXpAHHHw7n5+z9Pncjj56JuZJlq3W3TGuYwxkI7XUGkz3w0Xyltq2E+rPAVvtUBjj1q41U41UvXwfFk4SH2gPmNdpgg1FXbYStrUdjDhxI2+QCqtP2M5kJEuuXTzZxSbEL3hJBRfFd7NPGef9uPu5eu9L/gpEE28UDdS9RnfaV5bPTl2O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/g4k9D9SvR5mKHxvJhhHBkmqMlgOSwvcoxhNKuGuP4=;
 b=BdteZDbx6vBGZ20KQM2cYSzFwTSIX2e8NHvYeNBOs34p2D13kj1+yf0nogZWo+CnKs59viFL0ySA3k4cz0s9qfE+X8OCIu2zf74qfK60/Y32gCm7N4gZ5BK8IGBrVAdqQar61uEpCFLKSDAz9k/s6ldQPAAZEYinfrO3owQbocK9oPmzeRRHNOvo2MUCPH8iFWTOFiLPFkmHaUQ7xUdAGrN0mv8O0gm5mYtObT31JlhGW5pkbS23HAenACDAKtb01tXvVwJXySzo8O/Lt/waJ94wTUqhpi8qtCJYh4Z9eaISm97ccLGgdFGnljZFIcDUSz5b7sG1pF+67XM6zZSxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/g4k9D9SvR5mKHxvJhhHBkmqMlgOSwvcoxhNKuGuP4=;
 b=ddOKPqt5qvi5i5H3N2ZCy0pSJxqg/P73EPxhOmPSzlpoRDKWKHeIQr4kv/pJRsu+Dj1ja/L7OyA268oouS1YfptrZL6ZzgrBSJR/52uEQEp5zxIjmi1N/P4hqJKfEIh6YczLxPz9h6JZAtBlY256ch80kd0/TJ2kLmyz3H8u0f4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>
Subject: Re: [XEN PATCH v10 09/24] xen/arm: ffa: add support for FFA_ID_GET
Thread-Topic: [XEN PATCH v10 09/24] xen/arm: ffa: add support for FFA_ID_GET
Thread-Index: AQHZuH9UE3hx62s6skKCeGk62Jh6i6+/RRWA
Date: Tue, 18 Jul 2023 09:34:35 +0000
Message-ID: <468942F1-A41C-4152-9745-9E6205CCDA1A@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-10-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-10-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|DB9PR08MB6412:EE_|DBAEUR03FT037:EE_|PA4PR08MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd3d75b-06bc-4e0c-2dd0-08db87723ac4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MGM8RAgNiDFUX5WsIq9gO3w6OevuTc3c+GzIDZRQOk7ZXrX6jUZocFRhhdEgjD9LcG7zhRiN/53WcbZQPPJcWNLTK229j1nHnlWY7YhoDyBlUpblybcPXooHbaEWzKYukh8XOkY42Xtz1E9nq/rTJPWPLGn1KnytceU12I3XTRXi/R87N0zjA7f6UYF3f6ged5BV9Xu6fGBCuMwJnlVfI7nAXStodqmIi+4BIISyLsL0ILIMm8RgPM+5JuMFl2iA8URvrQ2J/N+Ke1DRFCX+2oU+FZCMjNvoprOcUFwXlMencnG20zAzlJfIRD00XFyHm1dgqiVUGhDGFERlK6OIkYQGxvIy8XYfRGjzKXVPblyAk2vl1AGaqgexzDLLAdWBU8hTRsJoAd5AuaL7Nk2TJ/7idbTx9/1NaiDmQOWG2PNdpyu4XS3oRJMrOAPzsSIFtP5u36FQEvGS3SJZSgNK6L80Qzxt1GQsyYEpCTbuqvI3aRAWBGFkcB4qWv1BNE2r6pAYBfncHZUL5W5IA3d+DCFctOIPYaoGbN4VNgP/3EZOCzzQxY1wR35zcOGQeaFlyXubTtapotXx0Y3vC/CW9jf0783yBYPO01SkZG+Nn/gn48LMcxOoDBlR3YdmZfANbIcUhiPJFfkcUL99BQBU0A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(91956017)(478600001)(66556008)(66946007)(66476007)(64756008)(54906003)(5660300002)(4326008)(66446008)(6916009)(316002)(76116006)(8676002)(8936002)(2906002)(41300700001)(71200400001)(6506007)(6512007)(53546011)(6486002)(33656002)(38100700002)(186003)(2616005)(36756003)(122000001)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <074D4CD228B45D408FF2AD5F008525A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6412
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89fcd673-684c-450f-950d-08db87723343
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	95AVwxQInuhSLcY13vV6o2nEQp6H6RH/ihGaQtYlJZRz/pIQ8tsWWSrHSEnAsRn6QGqxPzxIsZeXXxJEpjTXFZ6cKOLwne85KrssPxbNg81UrGfUVBDrisVA0GkhE4Sa6kC0t5g0Z0k9TSuzggmjOq08FPxisuocdBq1LgCwDn4rwaB8mdUjyOPObJmXlw7w9H2RbehtKdt7Kly6pSrOGIzsTGz20I4uJlx+mtH0F5kTneRLDqBCDEUdcJU4Wbixn7ybULxOL8m/rzmqBfASJwCEJ/gPgGH1BJjI+I9ypPu6s/vmkMKmwZuzeLzHekSIWAtPQvvIMle7SKUH9xYwTHeA38j+RY7RG1u6W3Bdb4+w9b6S74/b82APLqxKarUceHLzJa3c0W9dvHOUxhlzgXNuU2UScUXLiLGMsGvy1XqWRmdYDG0uxeDnq6ZLWmOARh1gK2OxpqQZcnsi4lz0FmgM+y/uYxkgiPGmGrpGmFscd/B4CUGZQtjXy2r6oyzrZrszrxu6F7qHpFZjyUv3txp5U4mgZaCEKo+n5X/baxU1HOI4Q3stQVJ6c/7QSFst+zZQ1D5fsafWuoT+Nmubv7gjsXvXD7WcIoeOqoBKgN3IYNFcxwYbKnEZxLmSj1EDwm/H9AYWMRs0fpFvHLOsH0zmpmMPYBwL1uIlLUM6CkDDxpw92mSc62Qafftw6REoLML+W7HeHVa7j7Q9z3UH0g8s1wW4cflnyi3Lo3p7g1yt22rg8P0en0x86z2gz6CM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(86362001)(2906002)(33656002)(36756003)(40460700003)(40480700001)(6512007)(2616005)(186003)(36860700001)(336012)(47076005)(26005)(6506007)(53546011)(82740400003)(81166007)(6486002)(356005)(70206006)(54906003)(316002)(70586007)(5660300002)(478600001)(4326008)(6862004)(41300700001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:34:48.4857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd3d75b-06bc-4e0c-2dd0-08db87723ac4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6256

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for the FF-A function FFA_ID_GET to return the ID of the
> calling client.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
> 1 file changed, 21 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index f0a2715d4bbf..e157ed20ad8b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
>     return true;
> }
>=20
> +static uint16_t get_vm_id(const struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> static void set_regs(struct cpu_user_regs *regs, register_t v0, register_=
t v1,
>                      register_t v2, register_t v3, register_t v4, registe=
r_t v5,
>                      register_t v6, register_t v7)
> @@ -195,6 +201,12 @@ static void set_regs(struct cpu_user_regs *regs, reg=
ister_t v0, register_t v1,
>         set_user_reg(regs, 7, v7);
> }
>=20
> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +                             uint32_t w3)
> +{
> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> static void handle_version(struct cpu_user_regs *regs)
> {
>     struct domain *d =3D current->domain;
> @@ -224,6 +236,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     case FFA_VERSION:
>         handle_version(regs);
>         return true;
> +    case FFA_ID_GET:
> +        set_regs_success(regs, get_vm_id(d), 0);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -237,6 +252,12 @@ static int ffa_domain_init(struct domain *d)
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> +     /*
> +      * We can't use that last possible domain ID or get_vm_id() would c=
ause
> +      * an overflow.
> +      */
> +    if ( d->domain_id >=3D UINT16_MAX)
> +        return -ERANGE;
>=20
>     ctx =3D xzalloc(struct ffa_ctx);
>     if ( !ctx )
> --=20
> 2.34.1
>=20


