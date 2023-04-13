Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE16E0C48
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520633.808429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuwY-0004uc-B7; Thu, 13 Apr 2023 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520633.808429; Thu, 13 Apr 2023 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuwY-0004sE-8I; Thu, 13 Apr 2023 11:16:46 +0000
Received: by outflank-mailman (input) for mailman id 520633;
 Thu, 13 Apr 2023 11:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmuwW-0004s8-Qp
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:16:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaaf72df-d9ec-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 13:16:42 +0200 (CEST)
Received: from AS9PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::14) by AS8PR08MB5942.eurprd08.prod.outlook.com
 (2603:10a6:20b:29f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:16:38 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::7e) by AS9PR01CA0035.outlook.office365.com
 (2603:10a6:20b:542::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 11:16:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 11:16:36 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 13 Apr 2023 11:16:35 +0000
Received: from 0d84159f08d7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33B58FD5-443D-4119-98CF-B201F18E2EDA.1; 
 Thu, 13 Apr 2023 11:16:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d84159f08d7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:16:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6226.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:16:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:16:22 +0000
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
X-Inumbo-ID: aaaf72df-d9ec-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bA0eVWBnPdXLQXkC9X3VWUJ+ot9sWzORV2Kx2lSobI=;
 b=aelvx9QnNuU1cppr+I9HrbkmcZuCDMaAGbjjNW9XGWw7Em0qmoWYGo5WDGo+MFWdQB8UzuSFTh8N6clVGQIhNQQ9tbUcZycPqr6rOEp4pJi1rJRaOcnfLXZSH7Z4r29W7sExBN/vqTkPOcz+eAjNt8iddk0aWnz4c43h/d8nNC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc6t2s1WPEAs37dKPda17MAHFqbgc00cS075TBex9EHlUtA0Rqm5zxHFkMuBqngwtwSNPdy0slE36sVd2vZRgaJGQ+POfGGFBL8oFRgx0FeEKsYfO+8/64CKiJNEMG+o4g2fnkXzmZQSVdA+Pn7KpmJsIHCIrDRNVp33EbZxR51dflDcVbuPywW24fvCXaobhZMqsbXYHOcWT/tVxMgWHzZWiHiksn520YVMpLETa6p8BkdbYPOeFhnd8ZKWVX1DAsJzUUX2Fnq0jszyb3MbrlsnZf8B7uDGnLeKH2ds7GY54X14ii2hPHO1WKM83yo/rnEfZdYzB0VP7shgR0j33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bA0eVWBnPdXLQXkC9X3VWUJ+ot9sWzORV2Kx2lSobI=;
 b=LUkKrRWCmt/cCsQBfQJXwWqarRnb8nUjNVhEcHSoIVsPrbOSHd8XFcCFoR2j3TRRhxDhiaM7pd1qCZrYsLFwfY1qg6JGa2gjt1krcC9uVFLzSQHHYbUV77lwL8FpzzS37zBxapRSnU7pSK7EMT2ZRJHTS+AF8fZkMr/5RqmDFUIE/XPvEjtpyCckVw41B9tGIb0mXNJQDTZdoGtJHvK9gf2g1JmSo8Sx5EE0uNtPoPaLqiUKPIKZoFlidEUoV4OTb3s+iodK9RzsDX+Cg+pVvRuOV9J8RQ2WWptb0NkQpS1hzsxblNrL8EkOKDB80ayOi5LWChomUexJ6swcb0xbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bA0eVWBnPdXLQXkC9X3VWUJ+ot9sWzORV2Kx2lSobI=;
 b=aelvx9QnNuU1cppr+I9HrbkmcZuCDMaAGbjjNW9XGWw7Em0qmoWYGo5WDGo+MFWdQB8UzuSFTh8N6clVGQIhNQQ9tbUcZycPqr6rOEp4pJi1rJRaOcnfLXZSH7Z4r29W7sExBN/vqTkPOcz+eAjNt8iddk0aWnz4c43h/d8nNC4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Index: AQHZbdfc5IUuFaQpQE2OHTLbOE6lL68pFi8g
Date: Thu, 13 Apr 2023 11:16:22 +0000
Message-ID:
 <AS8PR08MB7991020558FDF641D9E89C7192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-10-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6AE5779DD03AEF4B9F88C8470DE294F9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6226:EE_|AM7EUR03FT051:EE_|AS8PR08MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 6482099a-1398-4ea6-1d27-08db3c108b8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gzzaCJQn2mmxhJ9vQyyc88FFg8ZglnfhQ6kjctnF69vtP3Fmj+FAG5999uvNg9ch/Bp2FlJQX0KYGPpeTyLtg2pltZISegpbwNwlOvxRPzgW6WqM2OXHUscZW5PJG6Xf3bOZy0EUg3sXkugDG+p8VBF6v1Cg7mQY50/HTMdl7xZ0SAc7DnxeKvCzqZFzlUwSr9vOIuv/awGo0jtzCgvZu1glNdotuvO0DEwY2mvJbxEpVPk6m2g7yFiVGuQPyvsuq5E8wVIFJSOtaV7VZP43UsR40cvTjT36tDjB9Ktq7Jh+Aga9abadwBAMPALZlgJbnkUncwVTjyTEA4+aPBWdjEgEjq7jRIIsPG5+M9hGsOCnhFLRU+RMmnPbZ3MQ05nVHIcMijUq8mpPtNgyO1upbdHPD1QEQaZ8C7BHyjLFktkq7HlG7A26GJqkRpJu2pgu7wlfawIqdI63ahTsOFo1jS6CoriDJRT6x/RXzZr1b84ubD4jLJ8yIn/odV4LC7VJ362Yn3phpEUVhveJVfO/rC29wq+JrFi+GjuvDxpLqMCLBVdagC1g8NSnExvWfYHFUf1IDpWc1cAHvbFusUSIlknHwn/H2yv/Yu0pG/wdgWjjEGpoP5AHdlX/goJI9k8b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(26005)(8676002)(186003)(8936002)(38100700002)(6506007)(9686003)(478600001)(316002)(33656002)(54906003)(86362001)(76116006)(66946007)(110136005)(64756008)(4326008)(66556008)(7696005)(66476007)(66446008)(71200400001)(55016003)(41300700001)(122000001)(83380400001)(38070700005)(52536014)(5660300002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6226
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05d54294-d292-4bce-3b75-08db3c10835a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Ik2TXdFCAdcQCi1+Jq7+BFke9bMsNpjHS25MYOrt1/GPM8dsGLIAHHiPGXiG3NNQFfhxrnZMWyeyeeD26DLl8PGJlBGkOGw68FWIDmRkuray0lVFTiz+Y5O9PQY0ZioohSViEhI6YHnWjI4zy6mFYK15lT/0tg+4+IeFECeLAy1aaYq3g5t6ZqIP9IIgUzJYcoRIPHmM/8etr90HUW0ff2dQLCBcd9cDuBs1OvCHzMBzAcaCUA5gjr7aI7Q2QljbvsLqnFXqVyJ8nDWFZvQBB9Ila4/qGhNIV2L6kfJCpXvk5tHqUfw7PEiSF/HNpNh0txIKc+vxj+6qipfZxNXDjecYWW0N8eeoGN/FOiOvSaigE3MwaIhLF7iPeHV+6OvXv3RPQQlFqvII0Y1W1mukPfv45zKxk8qEkd9S9QTk4M9C8iTmy+gShvPpn6HtvCxZsA+i3wpR9r/UcE/TlIKM/S6oiK3oXsYY0RWtDMIjRc0RRrYq4hbUSKpXI7/8Rvxwr9aU2upbURJOuFngOXHxFyCnDE/E8MOT+l310jE2r6lnSGV0JNOJ7A9T97bXT6BhaslIFAXAzVxQdS846VNDtJ8asYesW/s0CGd3x8JAYujBIqPrOZZkVh1oOMOpIi5ay0Mq8yOcRTqkrmXDvLbv8rhZL3BOXGU0Ay82tYE+Nl3SzN+8jNXCaX2l15K3XI5K/xT8lgv+NkVgu+0vYNLFA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(36840700001)(40470700004)(46966006)(8676002)(33656002)(36860700001)(83380400001)(47076005)(336012)(7696005)(478600001)(40460700003)(26005)(6506007)(54906003)(110136005)(9686003)(186003)(2906002)(52536014)(5660300002)(81166007)(316002)(4326008)(356005)(82310400005)(70586007)(70206006)(41300700001)(55016003)(82740400003)(8936002)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:16:36.0725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6482099a-1398-4ea6-1d27-08db3c108b8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5942

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
>=20
> Adds support for sending a FF-A direct request. Checks that the SP also
> supports handling a 32-bit direct request. 64-bit direct requests are
> not used by the mediator itself so there is not need to check for that.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/ffa.c | 112
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index f129879c5b81..f2cce955d981 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>      return true;
>  }
>=20
> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> +{
> +    switch ( resp->a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp->a2 )
> +            return resp->a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +        return FFA_RET_OK;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a=
2,
> +                               register_t a3, register_t a4)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D fid,
> +        .a1 =3D a1,
> +        .a2 =3D a2,
> +        .a3 =3D a3,
> +        .a4 =3D a4,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static int32_t ffa_features(uint32_t id)
> +{
> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> +}
> +
> +static bool check_mandatory_feature(uint32_t id)
> +{
> +    int32_t ret =3D ffa_features(id);
> +
> +    if (ret)

Coding style nit: You need spaces before and after "ret", i.e.
if ( ret )

With this fixed:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

