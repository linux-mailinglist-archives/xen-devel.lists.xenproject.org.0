Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D87D51DB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621971.968991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHXQ-0006UH-Hg; Tue, 24 Oct 2023 13:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621971.968991; Tue, 24 Oct 2023 13:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHXQ-0006RJ-Eg; Tue, 24 Oct 2023 13:33:40 +0000
Received: by outflank-mailman (input) for mailman id 621971;
 Tue, 24 Oct 2023 13:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5Q5=GG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qvHXP-0006RD-2H
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:33:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef2a8a2e-7271-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:33:37 +0200 (CEST)
Received: from DU7PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::20) by AS2PR08MB8336.eurprd08.prod.outlook.com
 (2603:10a6:20b:558::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 24 Oct
 2023 13:33:29 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::5c) by DU7PR01CA0023.outlook.office365.com
 (2603:10a6:10:50f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Tue, 24 Oct 2023 13:33:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.18 via Frontend Transport; Tue, 24 Oct 2023 13:33:29 +0000
Received: ("Tessian outbound d1b3e404ba03:v215");
 Tue, 24 Oct 2023 13:33:29 +0000
Received: from 60e0430aced0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2554C6F-5796-4E64-BEF2-5167EA875212.1; 
 Tue, 24 Oct 2023 13:33:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60e0430aced0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Oct 2023 13:33:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GVXPR08MB10407.eurprd08.prod.outlook.com (2603:10a6:150:159::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 13:33:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 13:33:20 +0000
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
X-Inumbo-ID: ef2a8a2e-7271-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ofgUXmJITgTD8V9BfccIS4sLkKCoGSkXsXvcQDcOxQ=;
 b=G0upr1zsaHbylSGhPntGmTSxamPt6vbptFtrAaHxGxUrSL2vC0442MipWzCK/CHn00+pzyjFBQ681txtA9Hnn+0TW/oltoOmeL1l5t+GdRsIMrEaiVLYXSeyw1FZAtqXWljHkWF8f/2mQVDBA0n2/3PBxIKhjQTeL0DbW65HbU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5d787c55567681f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBd7+z82uM+9ATzwJAb7sZ2Z6Fe++pQ19od6Hlh0692XKcKDXBXEi+LRn/1ogxxncMLdBie2y+F0LwFR0KNcleagupExf1FBl2nAfKhohH/kGMa4PC3+fzCfU3OGro1yQXxFLN47qm+4EVtk9Z4U0ZdwldSGoZwdea6uvTAsLeo+k/ZM5orZR/6r/uq5A+3rLSa+5xRGT+iyEZehjEa2cm8f9i3a4g945wGVdDgZwq5jsDiHDdesxZ1lBkOkF0Qk6MBjx1KPDh/Ea0BdYjdsNIhELBdR6uaSSJ+8ILNq4CNhcONCuwVXTnSqmod2H/AVg7cYVjDBfwahLo2DiZpulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ofgUXmJITgTD8V9BfccIS4sLkKCoGSkXsXvcQDcOxQ=;
 b=PQbzMItavEW9OZsSfMA0AqOgXnPFrDyGGsJvo2JA+2pE8vhDrPWiNIvc/RvaJA/NwOXx2TMKT34q0LMA3/yQBOCguCCqDdosu0F4Se58HFytXFBHcF+D0Bpyx8IfRWacFTX39mbnQoYsYseRhagarg+rehPyKt9svQ8o5U08cU8r9l/eMTRKYNkJfJwI0rwqcrg7UeygpJo4CrIBSzKiDnA7U7IribUBqwYqaDE/8w9lYFHnxpQAkPx1MwSoENh1g8djqeeP2ZvZ4c5AAxdKBklvZyldUMsZBkkbDURdvup8pAre4ZYVS7kjWDILCiVM9Ndxyjz+Wz6Ddp0MlkGLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ofgUXmJITgTD8V9BfccIS4sLkKCoGSkXsXvcQDcOxQ=;
 b=G0upr1zsaHbylSGhPntGmTSxamPt6vbptFtrAaHxGxUrSL2vC0442MipWzCK/CHn00+pzyjFBQ681txtA9Hnn+0TW/oltoOmeL1l5t+GdRsIMrEaiVLYXSeyw1FZAtqXWljHkWF8f/2mQVDBA0n2/3PBxIKhjQTeL0DbW65HbU4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH for-4.19] xen/arm64: domctl: Avoid unreachable code in
 subarch_do_domctl()
Thread-Topic: [PATCH for-4.19] xen/arm64: domctl: Avoid unreachable code in
 subarch_do_domctl()
Thread-Index: AQHaBdnC4y/97Q3UX0qYJDw3uJ9yWrBY8Y4A
Date: Tue, 24 Oct 2023 13:33:20 +0000
Message-ID: <12FE5EA7-34F4-4FB4-A822-2AB5FCB0F2C7@arm.com>
References: <20231023175220.42781-1-julien@xen.org>
In-Reply-To: <20231023175220.42781-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GVXPR08MB10407:EE_|DB5PEPF00014B9D:EE_|AS2PR08MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 7899dfdb-7dd0-466d-d362-08dbd495cf20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oyvLrbBwSTHBicksFNJHVqF7nf33NKSWLjVUmoHuIQFNZcg9Plgj+XRnsOeQHeAhGAG3Q7sV25byh5/eFxjDBD/UqPzoGCu0qiqjEH6u/XrSy4fCp9h24JT7G5OExT95+ot5RMapVd5dq4ocx05ZFTt/ECjZB/56mzVmuiDPy2KCLjoS4PmSexE2J3d+uji5fhqVRtlNpewTiBEgtiqtLT6fZ7LEMBb/4ksEek7CbWKdcUpbAN0AItPz7FrVQd4PkC2sVpM7NTS7/jzhptDx49b8vSYNN3g4cuEhgJM7hDd2u3fyeEZ/c725XUPV0JdN0j7I8dRbLTS986k4s7Hrk0ApteJ4qUANs/GtcikL1EU+7/4E9nJaBM3CjKK/RpUj1hC+fcbfim4r2V6QaFdV/7XvB43fgV/TdH9UcUnGnV/6J8YyPwIjeNUbezkiUmUdJ968zsDzZY6BEigNsYcvSjUldGTWuti4jH/Mg8adqRxZqK7Ygtx9d6YB3vl/kuX5hsvRa9d/qp4kTiGXF8n3cuQ8SCd/yQAu/7fRN9bmPTY8CflNHIUzlq0MUTz2CirQJBISWdAVrpk01aML7xfbeYzTwUsEyPNS+HVPUvu5vIu49CW67BUfjO0K6m0qSweZx5usrXQUto74f1j0QcQHgQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(38100700002)(2906002)(86362001)(36756003)(5660300002)(4326008)(8936002)(8676002)(33656002)(478600001)(71200400001)(6506007)(2616005)(122000001)(66476007)(41300700001)(54906003)(91956017)(66446008)(6916009)(76116006)(66556008)(66946007)(316002)(83380400001)(64756008)(6486002)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3A201012162F2A429C54AAAF9150C7B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10407
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9275af04-b163-4466-d914-08dbd495c9c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lprAqLIjM0A4Txh/j5u3c7J5qDspT9yIRZTJt4Phl5WnsbsEzc5JCjTR5EYdNRL/MlUvqpAvfzjG1ssJQXf4iP9WpXUApoRLH7VgWPw418bxQy9RK9eu0YqCMpi+ZuE+3AUZs9TT4xipScIKIIe/ApfF96Kfcy/nYJ3B94h3ksV+OpmKo16dVCa53vLw1sB1VAuWIsk+TtQvAQWShQjLuzg8Te05qyqoAIF4nkzEXDdcgi+xgPuCstqPJ69EIf8wxWnWeVrIEQpmbeOYTIHBfdl4Dp+E+mTHnS8M/kgrcwFwHOuqX5dsUpvVgEuMcUIpocESt0ECmoWQRnH3d4XFNlNhcYDoc8SLnXPA8J7E1BvfgaRjNBXDUgruqVFFlKtTu7EgxGyaHZmwNhKrNPtbsWvHYwVIphLoydmnc8lC12fAxO0aS108AW/kxlZvGNYXzw6ueYWEb2sAxyogkXWpd0w7PwWhQRmTMPeUe3O4duh9hHOMit9wAVKA8xZ+wLjaw0il1LEjTURtj3FNOFxV6FJmW/RI7zqVRe4ALsO9sE5k0I3YimmubpcEv/lk5lGPCYORVP/SGCdqC/WGn1nTCPVHB1Y7GEupqsfJUd3zw3oceNdqtm3FWfVLpjCiDp0qmNytkgKXSrA4Mee10y/JQoUEH31W/JStjHL3WY8hgOG/j2KJqGtGE2SSgiQYlrvXXHGy0E9WAnyLWh0hmSaOoiJDNg4Zv9z9CK5VJxLYZl7kJUf9b44bsKLOWiUw6VdA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(47076005)(8936002)(478600001)(6486002)(54906003)(316002)(6862004)(70586007)(4326008)(41300700001)(8676002)(70206006)(5660300002)(40480700001)(2906002)(53546011)(83380400001)(6506007)(107886003)(86362001)(6512007)(81166007)(82740400003)(36860700001)(26005)(36756003)(40460700003)(336012)(356005)(2616005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:33:29.3307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7899dfdb-7dd0-466d-d362-08dbd495cf20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8336

Hi Julien,

> On 23 Oct 2023, at 19:52, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The 'break' the XEN_DOMCTL_set_address_size is unreachable and tools
> like Eclair will report as a violation of Misra Rule 2.1.
>=20
> Furthermore, the nested switch is not very easy to read. So move
> out the nested switch in a separate function to improve the
> readability and hopefully address the MISRA violation.
>=20
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> Only compiled tested. Waiting for the CI to confirm there is no
> regression.
> ---
> xen/arch/arm/arm64/domctl.c | 34 +++++++++++++++++++---------------
> 1 file changed, 19 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 14fc622e9956..8720d126c97d 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -33,27 +33,31 @@ static long switch_mode(struct domain *d, enum domain=
_type type)
>     return 0;
> }
>=20
> +static long set_address_size(struct domain *d, uint32_t address_size)
> +{
> +    switch ( address_size )
> +    {
> +    case 32:
> +        if ( !cpu_has_el1_32 )
> +            return -EINVAL;
> +        /* SVE is not supported for 32 bit domain */
> +        if ( is_sve_domain(d) )
> +            return -EINVAL;
> +        return switch_mode(d, DOMAIN_32BIT);
> +    case 64:
> +        return switch_mode(d, DOMAIN_64BIT);
> +    default:
> +        return -EINVAL;
> +    }
> +}
> +
> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> {
>     switch ( domctl->cmd )
>     {
>     case XEN_DOMCTL_set_address_size:
> -        switch ( domctl->u.address_size.size )
> -        {
> -        case 32:
> -            if ( !cpu_has_el1_32 )
> -                return -EINVAL;
> -            /* SVE is not supported for 32 bit domain */
> -            if ( is_sve_domain(d) )
> -                return -EINVAL;
> -            return switch_mode(d, DOMAIN_32BIT);
> -        case 64:
> -            return switch_mode(d, DOMAIN_64BIT);
> -        default:
> -            return -EINVAL;
> -        }
> -        break;
> +        return set_address_size(d, domctl->u.address_size.size);
>=20
>     default:
>         return -ENOSYS;
> --=20
> 2.40.1
>=20
>=20


