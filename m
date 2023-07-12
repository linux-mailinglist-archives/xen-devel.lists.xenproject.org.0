Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAE750089
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562027.878586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUjb-0003Wd-2P; Wed, 12 Jul 2023 07:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562027.878586; Wed, 12 Jul 2023 07:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUja-0003Ud-VV; Wed, 12 Jul 2023 07:58:02 +0000
Received: by outflank-mailman (input) for mailman id 562027;
 Wed, 12 Jul 2023 07:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhes=C6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qJUjY-0003UT-Tx
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:58:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10e150f-2089-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 09:57:58 +0200 (CEST)
Received: from DB6PR0301CA0082.eurprd03.prod.outlook.com (2603:10a6:6:30::29)
 by DU0PR08MB8020.eurprd08.prod.outlook.com (2603:10a6:10:3e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 07:57:45 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::e1) by DB6PR0301CA0082.outlook.office365.com
 (2603:10a6:6:30::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 07:57:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 07:57:45 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 12 Jul 2023 07:57:45 +0000
Received: from 5e870411b807.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B77E8EFC-1BE0-4BB8-9825-B131B84B8EBF.1; 
 Wed, 12 Jul 2023 07:57:38 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e870411b807.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 07:57:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9499.eurprd08.prod.outlook.com (2603:10a6:20b:60d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 07:57:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 07:57:36 +0000
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
X-Inumbo-ID: d10e150f-2089-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnnKBZQZxUkEz5UVFz6ZTc8ezpNMUjVqaz3fAmrMhIE=;
 b=UvT9UWL16sgxM4XixrThfKJrZh5Ub1r01VeD0608fzbTPFJbEevg42B0j8PB3Ma0D6cT+E87T+80rfT1PGOpmNTqtRpfmSVqe8L5gA9ySkcCLqlFHwvFFSoD4V70i/JAhGgNv2ZQ1iHnRT8P27NIUX4AbPkDZygfSMCfp0x/0Z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea5eb9677861b59f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSG1K+Ph1OMICipd6NR2n8qAacHLpjlCnGl8OtreitGxJmRNW8J25goQHUpTwfYejh2FL64Htky0w8QCB9TkwfoNU17T5YXGst74EsbX9xXrMzwVVNeQLQ2zejvAR25R0gth4Q1lvFr/W6MsxYkGhxqgWTYE27uW/Pi+G9LcGSnDxW/Rn8AgeV5M6HwzTn2f+6SOFIEQPB08RmIQgUpbpn2+G13JgpCbqPV/pquWNUldM9WO6uqdkSrMbdSoma/7tZwPACZ0lwg1JNgCKEJrOAI+KN/5tyhYi11tYHmh0It/iu5apPhrwlUyJKvHc1MkvqwpEb23t4mnwVpWPgQJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnnKBZQZxUkEz5UVFz6ZTc8ezpNMUjVqaz3fAmrMhIE=;
 b=VzQ8zPWeYRPZrYkXkCi9wR0bQ4RojGzaZUwXytJIT/FPskdOzvt6CrhDnN5XbYLyNy4+BiISyqh5mOUK8/l5jatiEeOBONOmD4pLUpc7Hjv1j644EjFvbX4xGbP2ixCY0dN9Yj8kueVaDUkFjPKHQqrjQL7C0srOuBo+6+ljbQCUl/B3nhEuo7WCyAPSGpT6qJ6ehvUaIht7/JHyNWcQg+NyMOYRsscuBR+cr6f8lEbGosaM+X7v0l3CyldqaoHqpaKYfqay6HmVAoncqcrf/FcvVVAQIVwGYPJL1GYSA0dsXUv+qWi+JssbaWWTrdEc76EF1d5tp/vbAbAwvidcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnnKBZQZxUkEz5UVFz6ZTc8ezpNMUjVqaz3fAmrMhIE=;
 b=UvT9UWL16sgxM4XixrThfKJrZh5Ub1r01VeD0608fzbTPFJbEevg42B0j8PB3Ma0D6cT+E87T+80rfT1PGOpmNTqtRpfmSVqe8L5gA9ySkcCLqlFHwvFFSoD4V70i/JAhGgNv2ZQ1iHnRT8P27NIUX4AbPkDZygfSMCfp0x/0Z4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to
 arch_domain_teardown()
Thread-Topic: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to
 arch_domain_teardown()
Thread-Index: AQHZryQNhqeVJwRMkEqOYe/pkcUwVq+1zrYA
Date: Wed, 12 Jul 2023 07:57:36 +0000
Message-ID: <390DD2B7-0C48-4875-888D-4B319001E8EE@arm.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org>
In-Reply-To: <20230705093433.2514898-3-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9499:EE_|DBAEUR03FT019:EE_|DU0PR08MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: cb70819c-bf00-453d-af3a-08db82adad62
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o/Hpj5cXee+mmsbJdw6wDIjuGdQlKcChkba+YsLkNyWl+s6LSWGx/1PUTiLyZCTXAOoIhi9hwUTeF8XM4nP4Pcqu8sDSclv35+K+OXeGEE1M6bztxYdcJYZxEL3pXL1qggbxuLQ+Zy6B8v9j3zgLAvaiAF9DvqRbC1FuC+K1p85MPtb1DINBeDYW/uOkhrV9icNwulWWupUi3dTvNRiIe7PkeEiuB/7d+MuENNcLMcpivdf8bKUwk1arWBnMPd5foxEyIuMT1G9paAS9brPZRdho0rCXnZloh7Ff6P10J44M+S2hLdCoZ4WTSRVBdb3YHpok/1yG4/lMx1P8BlSg9dw//QVepWv0DJKkoq6pu+RBPzX7Ro1q2EkupSdgLa44cLgaCgZ4MCpToX2eN6kJsztPW+m9sVAwCXuXcfDornltW4emWTTsPPQ3l7yj8eDJ0AgocXPYcAqcyFVlVGrynVNdS5vgCR8R+yN4sGObJXNPJOSyiN+o/XV3xcik4dy7QGVX2n2zpI6qdaI8b/VOx+EeuD2Q2eL+eMwdLtgva5BGjc+IyRhf6NWm5H+6zvRAod/meIxCXxa9kyc5Wno0Su57wKKxeyw7m5NAxFIqefH+EPVMGDzOFLo4N8BjFM0aL8AtlVROTmCuGdbofzUkaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199021)(6486002)(6916009)(4326008)(66476007)(66946007)(76116006)(91956017)(66556008)(64756008)(66446008)(478600001)(6506007)(53546011)(122000001)(38100700002)(54906003)(71200400001)(316002)(41300700001)(6512007)(38070700005)(8936002)(8676002)(86362001)(5660300002)(186003)(33656002)(2906002)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30B2659762F6F64BB770A2ADE6974766@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10376211-af4f-4731-34f8-08db82ada821
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GpbVsE5fCFumlMJwv/WLr1fTciYQWdCvFm1vcJMlNnH2dwcAgkiCc2UIb5Jx1EDk2dz7vHCxW99obHDMzDSSYsgUWR74zTH0PQq/M17gGT1trZk1zad6oyAEG1e6jzXzchnTyxhtRp8efO0P+RMEKmBPVx/BwdhHFl7yyOiPx+0L1GOp9O5LFmu0Shw5CtE9ni+hFoRMZtgvlTw74sQuCBgEHAJ6OxVIb4ABdKaGOyJZD2fWoHOut/HslKbDEDt95rUpb9piIg9ERAYsk/R12QiwEGhIpRclyei1yqNBYK2p/2AnEaaVWdop4tTLTJkju6AKBdckfc7xk8k6qoxFc4v/lmjQNft45EUGo+tsS6nRz17TibNMezyRts3TuxxJxyPhwRsaVwjFj/bWM8myakcQ2J0WfDvJusJE0FFTzsbAqQ6Bqw6VD0Na2UlOirk1Eoo+wkCyUAk4FtgN76U/QY/7bsRm/0Z8qRH760kob8TJDEE3kpS1rY/xOwjg8QllAP4C5cGUOOixInlUceSQQAwZKmTfmyelrAz8xC6vJEVwryONMzhK7n+UUlRtPAJpA9xR3loruSifxcySeTXpd6XaiLxZop73MfcCvaNshIMQ+pSxmiWFNOOP4eVM0vOUUOLfoBvxWJWAZ55vluhFVR//RUk23oOzyfJWxCLbJ64rruSYhGR4Xh1bLFE5vZm6hbv0hDC2OBYKPSgNGqjGMg+1gmhQ82fu7pjXDlZ6h5MSWxOMp42VSzztPeeO5msY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(70586007)(70206006)(4326008)(36860700001)(40460700003)(478600001)(36756003)(54906003)(86362001)(40480700001)(107886003)(26005)(186003)(336012)(6506007)(53546011)(33656002)(6512007)(6486002)(47076005)(82310400005)(82740400003)(81166007)(356005)(2616005)(41300700001)(8936002)(8676002)(6862004)(5660300002)(2906002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 07:57:45.2779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb70819c-bf00-453d-af3a-08db82adad62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8020

Hi Jens,

> On 5 Jul 2023, at 11:34, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Adds a progress state for tee_domain_teardown() to be called from
> arch_domain_teardown(). tee_domain_teardown() calls the new callback
> domain_teardown() in struct tee_mediator_ops.
>=20
> An empty domain_teardown() callback is added to the OP-TEE mediator.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/domain.c              | 36 ++++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/tee/tee.h |  7 ++++++
> xen/arch/arm/tee/optee.c           |  6 +++++
> xen/arch/arm/tee/tee.c             |  8 +++++++
> 4 files changed, 57 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 15d9709a97d2..18171decdc66 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -795,6 +795,42 @@ fail:
>=20
> int arch_domain_teardown(struct domain *d)
> {
> +    int ret =3D 0;
> +
> +    BUG_ON(!d->is_dying);
> +
> +    /* See domain_teardown() for an explanation of all of this magic. */
> +    switch ( d->teardown.arch_val )
> +    {
> +#define PROGRESS(x)                             \
> +        d->teardown.arch_val =3D PROG_ ## x;      \
> +        fallthrough;                            \
> +    case PROG_ ## x
> +
> +        enum {
> +            PROG_none,
> +            PROG_tee,
> +            PROG_done,
> +        };
> +
> +    case PROG_none:
> +        BUILD_BUG_ON(PROG_none !=3D 0);
> +
> +    PROGRESS(tee):
> +        ret =3D tee_domain_teardown(d);
> +        if ( ret )
> +            return ret;
> +        break;
> +
> +    PROGRESS(done):
> +        break;
> +
> +#undef PROGRESS
> +
> +    default:
> +        BUG();
> +    }
> +
>     return 0;
> }
>=20
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/as=
m/tee/tee.h
> index f483986385c8..da324467e130 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -34,6 +34,7 @@ struct tee_mediator_ops {
>      * guest and create own structures for the new domain.
>      */
>     int (*domain_init)(struct domain *d);
> +    int (*domain_teardown)(struct domain *d);
>=20
>     /*
>      * Called during domain destruction to relinquish resources used
> @@ -62,6 +63,7 @@ struct tee_mediator_desc {
>=20
> bool tee_handle_call(struct cpu_user_regs *regs);
> int tee_domain_init(struct domain *d, uint16_t tee_type);
> +int tee_domain_teardown(struct domain *d);
> int tee_relinquish_resources(struct domain *d);
> uint16_t tee_get_type(void);
>=20
> @@ -93,6 +95,11 @@ static inline int tee_relinquish_resources(struct doma=
in *d)
>     return 0;
> }
>=20
> +static inline int tee_domain_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
> static inline uint16_t tee_get_type(void)
> {
>     return XEN_DOMCTL_CONFIG_TEE_NONE;
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 301d205a36c5..c91bd7d5ac25 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -268,6 +268,11 @@ static int optee_domain_init(struct domain *d)
>     return 0;
> }
>=20
> +static int optee_domain_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
> static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
> {
>     return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> @@ -1732,6 +1737,7 @@ static const struct tee_mediator_ops optee_ops =3D
> {
>     .probe =3D optee_probe,
>     .domain_init =3D optee_domain_init,
> +    .domain_teardown =3D optee_domain_teardown,
>     .relinquish_resources =3D optee_relinquish_resources,
>     .handle_call =3D optee_handle_call,
> };
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 3964a8a5cddf..ddd17506a9ff 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -52,6 +52,14 @@ int tee_domain_init(struct domain *d, uint16_t tee_typ=
e)
>     return cur_mediator->ops->domain_init(d);
> }
>=20
> +int tee_domain_teardown(struct domain *d)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    return cur_mediator->ops->domain_teardown(d);
> +}
> +
> int tee_relinquish_resources(struct domain *d)
> {
>     if ( !cur_mediator )
> --=20
> 2.34.1
>=20


