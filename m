Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01C77DDAD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584259.914763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD7E-0002tN-Mo; Wed, 16 Aug 2023 09:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584259.914763; Wed, 16 Aug 2023 09:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD7E-0002ri-Jk; Wed, 16 Aug 2023 09:47:00 +0000
Received: by outflank-mailman (input) for mailman id 584259;
 Wed, 16 Aug 2023 09:46:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWD7C-0002rY-Kq
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:46:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ff0289-3c19-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:46:57 +0200 (CEST)
Received: from DB3PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:8:1::25) by
 DB5PR08MB9998.eurprd08.prod.outlook.com (2603:10a6:10:489::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Wed, 16 Aug 2023 09:46:51 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::77) by DB3PR06CA0012.outlook.office365.com
 (2603:10a6:8:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 09:46:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:46:51 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Wed, 16 Aug 2023 09:46:51 +0000
Received: from a8a20b6ae07d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F284E36A-5C8A-436E-A733-0BF62CC34B1A.1; 
 Wed, 16 Aug 2023 09:46:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8a20b6ae07d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:46:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:46:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:46:38 +0000
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
X-Inumbo-ID: d6ff0289-3c19-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhjLLh8DeNoSK9bn27tkjmHk1yX+GGaww8XXEY0YHyQ=;
 b=62bZ8UrhIPKxnU4zxPqA9Zs3fSpdpgoLrBlEWT4zq89mzfaQUYzZCB49Xd41i1Hd42K4R0uEi28GQbXMabwPNiFKR3hfNUtk2E8IpK3FaikXYW7V3YVBVASfKa8qKUENK54uJCVtn30l2bWmtgROnGPuTxoPT1XSIHP9aRoiHwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c120f91d5e5c215
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGp1U+yCtVf7kdyEYCEYw+WvvtFzgWpMM+lJxhLX1Jq3bKsLyXSbk4EL//x70MrPp7it9Ir3+l9ODh0eWPVblWWw9x4LBwEBb0lmqUTLc2dT8RB4IZBBQLr/8ouxeWYlxjnTK3vBGdXRQTzF/ogRSBrSxa/wcp3EL/oQvMmT3c+0j++FEHj34Wisxgl6OIymbXYPTO6qr18P7VtRwO7Dal42yEA6J07B7HroeEGs6Fjper2ppTX8oqV70h6dMh2j03BrL5T7t9qozyVNjZn1KIwmprRhNHGfIUlv8QBNajQT8h3npbNfnj1QzA8ZcBlsJvHstylLfmPORiw9eKbYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhjLLh8DeNoSK9bn27tkjmHk1yX+GGaww8XXEY0YHyQ=;
 b=YeApfhHJppKpqFURSoitV5MJm3esNGBY6l8VwQ8hYEaOpFKL94TPAmlmLOn3fp/Ny/nmzkHG7hof8leZDMx14MtsnQ17frlUWAXlCfUhbCQUQmxwy/wMpZE6E8f51aqc+kTzSBei3zdPC0WVH4sm9TL98ibF8Re0DVTF55gYRM5pMoSrOwrfbZWLLNVyiIMnVYR6IXZMwltKI6gS3k2YRnpKM3Hfo2Z+Jc/2G2K9eievfpTK/JZXs48/rg416m0OyewuU/GrhbZIaFJ/HWgllTZ9x+vLgajqHRQbyhXckEbGv//t4nD0J+tcameUBGRJLuzZzo6OcyYa4ISBj7DhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhjLLh8DeNoSK9bn27tkjmHk1yX+GGaww8XXEY0YHyQ=;
 b=62bZ8UrhIPKxnU4zxPqA9Zs3fSpdpgoLrBlEWT4zq89mzfaQUYzZCB49Xd41i1Hd42K4R0uEi28GQbXMabwPNiFKR3hfNUtk2E8IpK3FaikXYW7V3YVBVASfKa8qKUENK54uJCVtn30l2bWmtgROnGPuTxoPT1XSIHP9aRoiHwU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v11 11/14] xen/arm: ffa: improve lock granularity
Thread-Topic: [XEN PATCH v11 11/14] xen/arm: ffa: improve lock granularity
Thread-Index: AQHZw6jF7Y91X1Up20iaWTQaErEA8K/sxbuA
Date: Wed, 16 Aug 2023 09:46:37 +0000
Message-ID: <048D866B-183D-4D19-BFC6-049150AD60DC@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-12-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-12-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB5976:EE_|DBAEUR03FT003:EE_|DB5PR08MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: e20e3c6d-be3d-4793-85f6-08db9e3db772
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gCt4zThxPPqiZJTgydDWIloNol4LijiWDgrfeNiSpVGo1JsT7pLUqI9G+mhGtJ2AL6FTD62NU/w0LtWAGXy4tR6EtnW59g1YP+w/2g/bXo+VeEXc2mBdVHLjpx9M7qkGT7NhXrIL4OUNgBLKkTaS4b25enD6U7GKoUrYkPnQXKN7HR1HRLwH6CuiqoAUPmS3SZT0XY7VQhKL7cyUMsEfv937ZqrntXBPHGJLBzL4+Z7RbAV/ekpIooJCCB92mUkMS8OfzP4VjmZJatn/PqN8+dIWasg8mvNd7ehbVi/QqNorFWJWdX2d+XLrXWNzB7ToWX+Ipmy9Pwm/a6Zd/BVyCHn2HHDlKmjIFDmYkqNsYx3R4gyySXacZZ5L4pRBrhkWV3xsbWIwKSHD1KUKCX5mwnyBuU5iDtQJxwHrbk7G3U26CG/FnlMMhcx5vIKoBSC3imZdR42STvMN00KHSRN9kEpH9jbX1zWGg3hQtAnk5QgxHJneq+xfyjWuwJoM15fgUSdrd5HaNq77Budg3WNSpx8LBbAI4Ysp5sR1asJ2Wx/BOjRxWeAlJDRf7P4GlGN8xzUJshm7SE3l8ga0ngR+7QpaM8asMBoV2mKjfFJbZFSyAzXRV9n1lSABeF9yyb8VqcojAupW871d2mR2Y0HTsg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(91956017)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <694C52AE7114314D95C6F04640E8B033@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d09e7bc-6dbc-4653-6fe9-08db9e3daf9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	anOe7ntRm/e4FuofVTnVbly3b6a6wVU7RpyVqYgIkczOGHP2womG2HXn56+qvH9ZMah16HbwKR8JemowUP/XsAuTNVjUKZKdkNRPD5mLOfdU69CIcRss0aYrMMc79dCQTHbg6icptKhwdFwilCsXfBZf1+ijvQKQtjagW4DZbYBNDfXeBByh9/18wna6p6vFT8kYPOOBvTouLanXnNGvTc/5R5j1gxEUUx6ufMLDbRtSYxc2Aek9o7aV1ene32qwLRaYQ/TNkgYz1vnpzeqUybqbrgf848cZb+A6mkSA8au/F59uBV4lsSrK48Nbi8lFFTtxbsSadLy8kRWc95oX4ENlHdNAHbmCoGn2tZxj2zysKVDENIXzesVsbHSRgEeruC6qe6CPWy87sNkVJD3N3/Y/K7jSocBdYwqTat2kzZvvvSBHVHlHbjU/BNMMh1eW5zT+edfhmW6spGmQlzp02VWX+h5Sm2sehXDrqwDlWrMteZ6ecfyq1mmHtsTXZYc71rKQILIuENOxt3tizSbKVA0onbcx7nh7KzPLTUbftJA4CUSe0FbXXkHdFfJvsQNLIumWZO1YrILV6gY8nU0iKiYfwGomYesF2B9i/uoG8wZ0IerlDNcf8EzQUo0s9rzJaQ+3Fn1JdadX4Szki3jZS8gFfj8IKcvRyKgAHrrs6qMx+Jp74FlOXcxkvWjTQ4GwU0/SE/L9obm6ndVq68DX7yfnQSvXUuZtghQxIcNwx6CiEoB35nUGUo/N6VNF4Cax
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(316002)(356005)(82740400003)(81166007)(70586007)(70206006)(36860700001)(41300700001)(5660300002)(47076005)(8936002)(6862004)(4326008)(8676002)(2906002)(40460700003)(83380400001)(26005)(40480700001)(478600001)(336012)(86362001)(6512007)(53546011)(33656002)(6506007)(36756003)(6486002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:46:51.0986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e20e3c6d-be3d-4793-85f6-08db9e3db772
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9998

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> The single lock in struct ffa_ctx is complemented with rx_lock and tx_loc=
k.
>=20
> The old lock is used for small critical sections, like increasing
> shm_count or adding another shm to shm_list.
>=20
> rx_lock and tx_lock are only acquired using spin_trylock() which for
> well-behaving guests should always succeed. Guests using the RX and TX
> buffers are expected to serialize accesses before doing the FF-A
> request.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - No changes except resolving conflicts since "xen/arm: ffa: support
>  sharing large memory ranges" was dropped.
> ---
> xen/arch/arm/tee/ffa.c | 107 +++++++++++++++++++++++++++++------------
> 1 file changed, 77 insertions(+), 30 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 75700938c444..eb4a58fec470 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -363,6 +363,13 @@ struct ffa_ctx {
>     struct list_head shm_list;
>     /* Number of allocated shared memory object */
>     unsigned int shm_count;
> +    /*
> +     * tx_lock is used to serialize access to tx
> +     * rx_lock is used to serialize access to rx
> +     * lock is used for the rest in this struct
> +     */
> +    spinlock_t tx_lock;
> +    spinlock_t rx_lock;
>     spinlock_t lock;
> };
>=20
> @@ -768,7 +775,9 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>     if ( !ffa_rx )
>         return FFA_RET_DENIED;
>=20
> -    spin_lock(&ctx->lock);
> +    if ( !spin_trylock(&ctx->rx_lock) )
> +        return FFA_RET_BUSY;
> +
>     if ( !ctx->page_count || !ctx->rx_is_free )
>         goto out;
>     spin_lock(&ffa_rx_buffer_lock);
> @@ -819,7 +828,7 @@ out_rx_release:
> out_rx_buf_unlock:
>     spin_unlock(&ffa_rx_buffer_lock);
> out:
> -    spin_unlock(&ctx->lock);
> +    spin_unlock(&ctx->rx_lock);
>=20
>     return ret;
> }
> @@ -830,13 +839,15 @@ static int32_t handle_rx_release(void)
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
>=20
> -    spin_lock(&ctx->lock);
> +    if ( !spin_trylock(&ctx->rx_lock) )
> +        return FFA_RET_BUSY;
> +
>     if ( !ctx->page_count || ctx->rx_is_free )
>         goto out;
>     ret =3D FFA_RET_OK;
>     ctx->rx_is_free =3D true;
> out:
> -    spin_unlock(&ctx->lock);
> +    spin_unlock(&ctx->rx_lock);
>=20
>     return ret;
> }
> @@ -947,21 +958,43 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>     }
> }
>=20
> +static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> +{
> +    bool ret =3D true;
> +
> +    spin_lock(&ctx->lock);
> +    if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
> +        ret =3D false;
> +    else
> +        ctx->shm_count++;
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> +{
> +    spin_lock(&ctx->lock);
> +    ASSERT(ctx->shm_count > 0);
> +    ctx->shm_count--;
> +    spin_unlock(&ctx->lock);
> +}
> +
> static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
>                                              unsigned int page_count)
> {
>     struct ffa_shm_mem *shm;
>=20
> -    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT ||
> -         ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> +    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
> +        return NULL;
> +    if ( !inc_ctx_shm_count(ctx) )
>         return NULL;
>=20
>     shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
>     if ( shm )
> -    {
> -        ctx->shm_count++;
>         shm->page_count =3D page_count;
> -    }
> +    else
> +        dec_ctx_shm_count(ctx);
>=20
>     return shm;
> }
> @@ -971,8 +1004,7 @@ static void free_ffa_shm_mem(struct ffa_ctx *ctx, st=
ruct ffa_shm_mem *shm)
>     if ( !shm )
>         return;
>=20
> -    ASSERT(ctx->shm_count > 0);
> -    ctx->shm_count--;
> +    dec_ctx_shm_count(ctx);
>     put_shm_pages(shm);
>     xfree(shm);
> }
> @@ -1180,7 +1212,11 @@ static void handle_mem_share(struct cpu_user_regs =
*regs)
>         goto out_set_ret;
>     }
>=20
> -    spin_lock(&ctx->lock);
> +    if ( !spin_trylock(&ctx->tx_lock) )
> +    {
> +        ret =3D FFA_RET_BUSY;
> +        goto out_set_ret;
> +    }
>=20
>     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
>         goto out_unlock;
> @@ -1272,7 +1308,9 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>     if ( ret )
>         goto out;
>=20
> +    spin_lock(&ctx->lock);
>     list_add_tail(&shm->list, &ctx->shm_list);
> +    spin_unlock(&ctx->lock);
>=20
>     uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
>=20
> @@ -1280,7 +1318,7 @@ out:
>     if ( ret )
>         free_ffa_shm_mem(ctx, shm);
> out_unlock:
> -    spin_unlock(&ctx->lock);
> +    spin_unlock(&ctx->tx_lock);
>=20
> out_set_ret:
>     if ( ret =3D=3D 0)
> @@ -1289,6 +1327,18 @@ out_set_ret:
>             set_regs_error(regs, ret);
> }
>=20
> +/* Must only be called with ctx->lock held */
> +static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t ha=
ndle)
> +{
> +    struct ffa_shm_mem *shm;
> +
> +    list_for_each_entry(shm, &ctx->shm_list, list)
> +        if ( shm->handle =3D=3D handle )
> +            return shm;
> +
> +    return NULL;
> +}
> +
> static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> {
>     struct domain *d =3D current->domain;
> @@ -1299,29 +1349,26 @@ static int handle_mem_reclaim(uint64_t handle, ui=
nt32_t flags)
>     int ret;
>=20
>     spin_lock(&ctx->lock);
> -    list_for_each_entry(shm, &ctx->shm_list, list)
> -    {
> -        if ( shm->handle =3D=3D handle )
> -            goto found_it;
> -    }
> -    shm =3D NULL;
> -    ret =3D FFA_RET_INVALID_PARAMETERS;
> -    goto out;
> -found_it:
> +    shm =3D find_shm_mem(ctx, handle);
> +    if ( shm )
> +        list_del(&shm->list);
> +    spin_unlock(&ctx->lock);
> +    if ( !shm )
> +        return FFA_RET_INVALID_PARAMETERS;
>=20
>     uint64_to_regpair(&handle_hi, &handle_lo, handle);
>     ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +
>     if ( ret )
>     {
> -        shm =3D NULL;
> -        goto out;
> +        spin_lock(&ctx->lock);
> +        list_add_tail(&shm->list, &ctx->shm_list);
> +        spin_unlock(&ctx->lock);
> +    }
> +    else
> +    {
> +        free_ffa_shm_mem(ctx, shm);
>     }
> -
> -    list_del(&shm->list);
> -
> -out:
> -    free_ffa_shm_mem(ctx, shm);
> -    spin_unlock(&ctx->lock);
>=20
>     return ret;
> }
> --=20
> 2.34.1
>=20


