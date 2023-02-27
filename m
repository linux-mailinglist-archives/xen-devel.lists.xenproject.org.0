Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566506A4520
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:49:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502658.774555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeoE-0005MF-Lq; Mon, 27 Feb 2023 14:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502658.774555; Mon, 27 Feb 2023 14:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeoE-0005Iy-IM; Mon, 27 Feb 2023 14:48:58 +0000
Received: by outflank-mailman (input) for mailman id 502658;
 Mon, 27 Feb 2023 14:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hUI=6X=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pWeoC-0005Is-Q3
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:48:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbcad65b-b6ad-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:48:55 +0100 (CET)
Received: from AM6PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:6e::34)
 by AS2PR08MB9692.eurprd08.prod.outlook.com (2603:10a6:20b:604::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Mon, 27 Feb
 2023 14:48:53 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::77) by AM6PR02CA0021.outlook.office365.com
 (2603:10a6:20b:6e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 14:48:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.16 via Frontend Transport; Mon, 27 Feb 2023 14:48:53 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Mon, 27 Feb 2023 14:48:53 +0000
Received: from 490f95cec287.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D94D4280-329E-4C8F-B0F8-095C37A75250.1; 
 Mon, 27 Feb 2023 14:48:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 490f95cec287.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Feb 2023 14:48:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5647.eurprd08.prod.outlook.com (2603:10a6:800:1b2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:48:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:48:39 +0000
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
X-Inumbo-ID: dbcad65b-b6ad-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgk1oCjyVY9ja+3zfXTQLFhzrjUGIMb5fwkTK2FrSNs=;
 b=E7GW98x8OH9oQ4YPEwAeuX3qxp4q9A7unxq39sqinxKDJEc6sLpDcS0c+6MOErHaBEYbITVKBholsN5/TJxF1ppy3TUoFcjejh7CeiV43yhUDMxxbF1uO8qx7VNTZsmmYM/h2bCf+4CQQsXDH8zOc96dj88KO2O9/de/dSZjKG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 235306aadbd222af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkDMUxxlRvpWMq4TOF7zpK1gbazjcFBwivixZ2/iuP/h7nqRKAWoPUq9AS+MlLPMjbWk57u1fYzg9GjjVGUGy3oAH49vLdN6pr7RDO4Gfgk9TVSN4wxBi3zi8zpWnH1FMTtjujit7HlAtWgpbnCi7wUzHkh5ty+y7IGS+kI/Hbs0IYLmkcz4gnEgkKIGVvV1NWPKzZWXbHjmApTIFf9eVDquxPv+n+Yuf0M/2dD15QyEgu185fDixgULtfrj0uQb4NKv7W10BnSyaam7DT1uuWTR7XXnOc5HisnjUKI3Gka6FAyPwGKC87iRrnObG0CFbeyx2ySmqZDcKydMQMZMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgk1oCjyVY9ja+3zfXTQLFhzrjUGIMb5fwkTK2FrSNs=;
 b=AUvQi8VSK4bgdiy038IPKZyDOoxPzVMy3b+aLlM6NnsoaimMwyYLRKzzcH4uEL1Lxtk9ccVbzCb+E4yervaL5Y7Wp2fp/IhpPAQDp+F3DVAjtpxp1Ryh21BG/bJHc6IfnoO0SjZTGEqqIE+ZdE+HaQUsLgJWzop9Gw4rJfdgrxU0yEh9QOpjbp8CryLr9uFG5G49Qyl832aVK4RryYZByDTWtOdyDf7jFZZvIASloGFhhTmE2ggSPrh34d4BppgaSqkCAlUO/lywKrxHSIlTl5qPNx+E9exUa0hgKb7+1icKbUNDRdIugRBOVa9lWzq1Gv0Wz9zkXF06v+u9kRsXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgk1oCjyVY9ja+3zfXTQLFhzrjUGIMb5fwkTK2FrSNs=;
 b=E7GW98x8OH9oQ4YPEwAeuX3qxp4q9A7unxq39sqinxKDJEc6sLpDcS0c+6MOErHaBEYbITVKBholsN5/TJxF1ppy3TUoFcjejh7CeiV43yhUDMxxbF1uO8qx7VNTZsmmYM/h2bCf+4CQQsXDH8zOc96dj88KO2O9/de/dSZjKG8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 09/20] xen/arm: ffa: add support for FFA_ID_GET
Thread-Topic: [XEN PATCH v7 09/20] xen/arm: ffa: add support for FFA_ID_GET
Thread-Index: AQHZRtMaqQfE5Y/rpE6cfyFi/Dbnk67i53QA
Date: Mon, 27 Feb 2023 14:48:39 +0000
Message-ID: <FF2BBB34-102C-425F-9A9A-2D6FA1BEB2D4@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <82e4e0c3ac1614822fddd90336c22e6fad5b485e.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <82e4e0c3ac1614822fddd90336c22e6fad5b485e.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5647:EE_|AM7EUR03FT055:EE_|AS2PR08MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed2b639-f4f4-47fa-f246-08db18d1bee1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Nd431pvPVXG/i13vyx0Pj8Kc1ugKzFk3SKAbiOU8V92sO+fcoZzEME+Rf2um1/k26ah13YKL+3mdo9VuOnHiRHvSDk/agDAnLUtg0H6Oq/pArgQZpxAJKvNPQ+Ae+sYu5G52ftrKblXiPxOGokqmOh3DcHtex5b5pB9zfQqp6aMAf0+gUlwZTOpruZ1k3i1Ve5BR93xTdk9OsrcGUl3wdkdC32S7iwvNzx6KJ0dA+ef2iWDkLvndJUDulyF2AURKltb3qgVMx4YxaRNwXrKJdOgBeh/cwj3sNaCLSGzCQ7Z1q4jL41Xl7r4d49g3yOtVJkyPlaTBvRPWQr9bRPE3I6NHO3UeQQoFgEXX2kotY5JWy/cloC6FaeW3raLu53yZyTobx5kU+fAe95/ygysOmEdvdObC7C9O5+dRwdX4T8kn54eZG3CXDe/4OG0RjR8OGTwRhIt4nr+vm7ORfEUaEiCeOWBrV+d0+8ui6S6zcH2ukTEnteP7+urMt3XmUSe+uYXG+s7Ux8qEF/SeLUwtktD2NfNaUXQXvXsQ9abkVyEt9n+a2o/c35blBAHdtKmyhlT3t0D5IviPz3nfd9ylMZQEEpOkAe3kXZEuCpqA2m5Y+1n4/8SUzFfJZIe6CjwmFmyf3NCQOsMinlWUwtJAuBlvutrI9qn+arZ9+i0ssNcyajYlZRkfXgQGd4LwerqL0TRvvbc62atjyyre7srz/DCxjchAfk3DMt/4orZJlXM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39850400004)(366004)(346002)(451199018)(36756003)(8936002)(5660300002)(6512007)(6506007)(53546011)(38100700002)(316002)(122000001)(83380400001)(26005)(186003)(2616005)(86362001)(33656002)(54906003)(91956017)(66946007)(76116006)(66476007)(41300700001)(6916009)(66446008)(66556008)(4326008)(8676002)(64756008)(478600001)(71200400001)(6486002)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <419C19DCA2DF5A46B6477A5BC15E4D4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aacb6945-68b3-4da4-5c96-08db18d1b689
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iGPco0Tv3i5T8IqIsJ2wlzusZnIvoJP5px31Mu/OOSwGr8b77HL5RSff6ZJG4cbSE0rfyXKwWApm381k5/v6oAE7bweQ03U0L+m3HHjKowFWwm70kdtSd/J/6QFrOKk5KrkC0VHjHbvqq4419xDji0g4CU07SKy2TJFo48GYbC5bUIO8notZGqwcom/64TqMRGaiQTg1/4y8Rz63jB20tS7cCeZp4YUMl2KaAlnv/MVqgyeeFMbWomAuapx7gSzapMURm8qaSSfU7YWycoUf4xwWc63jQjp7T9JFCyGIvNt6tx6yucTxSJvJ8tRXONeHO89Re/b7rKLjNw6RvuZwM6KaP8DMQtcDi4FzADkc1YtYrA+gfa4RqsjTNJyaYyHrtb0wEGVv8yV5xIwTOxX1JqRe2jCTkOUsdbFvojI95QfRXfeI1VIJ3Sz0Y+uoASQhQxU7hK32p47m8ZBI46E5I44iLT1e0zYfHIlsVRiFpu5nf5/mmh8rDkPZS+x7/zzGVPeL6vC5eQoq533mzZgAgYa/KECNZr/cjrOkY9xRlIj1YCseIOOKWLuA9DZ+Fw8ayfHi2tulExqrlYdcpBRfQBx8EHs9Nxvqd/d2RdKtmgyqlbXLlZyCs7mW3kQmZj9t7qAG71dASUFq9YvfFkeMGYa3Le8bkoIObRTVHkEQv7GiHmNSkXuQ8wy+H+//X+L9H37PWG5tgKl92XfwWB2SEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(376002)(396003)(451199018)(36840700001)(46966006)(40470700004)(83380400001)(6506007)(40460700003)(36756003)(36860700001)(86362001)(6862004)(8936002)(82740400003)(81166007)(47076005)(356005)(5660300002)(40480700001)(82310400005)(33656002)(478600001)(336012)(2616005)(26005)(6512007)(6486002)(53546011)(70206006)(4326008)(8676002)(2906002)(70586007)(316002)(186003)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:48:53.2298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed2b639-f4f4-47fa-f246-08db18d1bee1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9692

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for the FF-A function FFA_ID_GET to return the ID of the
> calling client.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 21 ++++++++++++++++++++-
> 1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 8b0b80ce1ff5..463fd7730573 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -167,6 +167,12 @@ static bool ffa_get_version(uint32_t *vers)
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
> @@ -181,6 +187,12 @@ static void set_regs(struct cpu_user_regs *regs, reg=
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
> @@ -210,6 +222,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
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
> @@ -221,7 +236,11 @@ static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
>=20
> -    if ( !ffa_version )
> +     /*
> +      * We can't use that last possible domain ID or get_vm_id() would c=
ause
> +      * an overflow.
> +      */
> +    if ( !ffa_version || d->domain_id =3D=3D UINT16_MAX)
>         return -ENODEV;

In reality the overflow could only happen if this is called by the IDLE dom=
ain right now.
Anyway this could change and this is making the code more robust at no real=
 cost.

I would just suggest here to return a different error code like ERANGE for =
example to
prevent missing ENODEV with other cases not related to FFA not being availa=
ble.

Cheers
Bertrand

>=20
>     ctx =3D xzalloc(struct ffa_ctx);
> --=20
> 2.34.1
>=20


