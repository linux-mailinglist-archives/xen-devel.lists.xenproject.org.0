Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A526D77DD82
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584245.914743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD3E-0001hX-0Q; Wed, 16 Aug 2023 09:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584245.914743; Wed, 16 Aug 2023 09:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD3D-0001fT-Ts; Wed, 16 Aug 2023 09:42:51 +0000
Received: by outflank-mailman (input) for mailman id 584245;
 Wed, 16 Aug 2023 09:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWD3C-0001bp-2j
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:42:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 433ad24b-3c19-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:42:49 +0200 (CEST)
Received: from AS9PR05CA0162.eurprd05.prod.outlook.com (2603:10a6:20b:496::11)
 by DU0PR08MB7415.eurprd08.prod.outlook.com (2603:10a6:10:353::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:42:19 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:496:cafe::bd) by AS9PR05CA0162.outlook.office365.com
 (2603:10a6:20b:496::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 09:42:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:42:19 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Wed, 16 Aug 2023 09:42:19 +0000
Received: from 408c78ffa2da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA346EA8-73BC-4270-A637-FB6F33D81D81.1; 
 Wed, 16 Aug 2023 09:42:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 408c78ffa2da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:42:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7995.eurprd08.prod.outlook.com (2603:10a6:10:3e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:42:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:42:10 +0000
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
X-Inumbo-ID: 433ad24b-3c19-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyc5k0f3wuC+i2n7CFbAc9WmyIlwAhkTyIiR9LtlzpQ=;
 b=ocU8nwZ0LjgeuKr43Nc1sZhz0nWkNB5G5lRkDm/u/dA95ZUDAs/6tqL9La2wGCIq4GPFwOzEFt45hnCV/zjj+Uo5GvUOw2ob5saCHV6F7IZXZ8syRCmYr3byGKbAgGVJR4tVvGqcnPWf+yik8+phxHs2NS7b1WcwtwPc/5+cTOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 340ccf021bb13d36
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8NE3T9wYzy0Zl4bMUblNUaS/BMz39T6j+NKPE5ebEFVINex4Ym6OwWu54q+t1JA60HEWs2LbYNnx+QLtvbIkZbztY9MDJYRVYqY15jkd06LTYPKlQCIjU/8wDFwitGpqAmDVEyOeGooqo6SioOpBHe0X5hlg5N0w2OrI9LK4yCU1i8pmApyBtVVElVpFY9/DRmf1JrCiTz22iyQnH3X6AgH+r0aJUC7P2QxpXYd/EBieNFtz1OHV2hcP2k5iwSjz4KA/lEfNZDHaQQI4v8yTLtVo19zx2EEtZRh0bS1mzcgoW6uWAwHYQLwvgR7Bv9HqciaDwIzVvkcutIqHusVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyc5k0f3wuC+i2n7CFbAc9WmyIlwAhkTyIiR9LtlzpQ=;
 b=IYvFcHS1y2Wk6njLc7kwJSLAPh8HcnX83ALveT9soTBGc6Hxd5WGoBtGSZmC47yje95u+B8i288Xe2DVcqG1Zbp0ho8e6PSsJEoP6hxMYjE1QORPduanul8PrDAC0ikPssh8uHWzEuVmBpNm6opRwzcO1dZk/cstEaMzeiK9k2q5H7DKcnEFZf7OuJP/cyO+Z32zwz4SxyJzuP8agernz3Ul7VNFmVRWYhChcUtIQ39KdH0PGz3vqv1x75zN/CJtnYTd+X3jg2lseXWsfHenooBjdMwZJfXmhxbTLo03y9XDLmvERKgVYJHTGWABUQAP6ct5jepkF26ABS7Ju6GmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyc5k0f3wuC+i2n7CFbAc9WmyIlwAhkTyIiR9LtlzpQ=;
 b=ocU8nwZ0LjgeuKr43Nc1sZhz0nWkNB5G5lRkDm/u/dA95ZUDAs/6tqL9La2wGCIq4GPFwOzEFt45hnCV/zjj+Uo5GvUOw2ob5saCHV6F7IZXZ8syRCmYr3byGKbAgGVJR4tVvGqcnPWf+yik8+phxHs2NS7b1WcwtwPc/5+cTOk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v11 05/14] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v11 05/14] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZw6jC4h4BaZ+kAkGxoWym/HzFj6/sxH0A
Date: Wed, 16 Aug 2023 09:42:10 +0000
Message-ID: <88FFE10A-73C6-43BB-B0A2-2A1AB1D9320A@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-6-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-6-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7995:EE_|AM7EUR03FT020:EE_|DU0PR08MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d942a3-f495-4778-51ad-08db9e3d1577
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I6o43J9ELTKxJLvL5A+6Hwm+tNCCZdCA3G8HlpnBEdsQcGHSWNOYDeIiFUcdIKNG1cA+twmUEjMyHE6XU7Z3kC9bXMHm/f939h9mMdAE0gnaqMAlwzkn3JXJQHipWXtZQ5KOSUpq49Bhdeg17fsMwhuLxEaU6TUXrpmTxoweZDvnhOMwfifyyv9AljiQ4meLAU/lSEYeWvxM/zRlJiZPT+pyZJFk19psKnPLMRIZiuCrlozSf0Ylh7wr7rzvqoTbs0kZED7w8b8pDPlHOftSO3XXOnsqUO040wGfwxVw4BomkiJ3bfSJ1p/qpMngK9BS9ntGxcDVbZ2JtExsofUFvWqWwXmuSgckuLA244UXsQ9GPeG8GkM+UyjDik/mxKf/Svmb1KtOkNn5TNPop4pTEUFavHh5Tc1Scz0CVJrFejJh8qg0crdat0K/AOeLotrAu5cxXqwRPiBdTe9F0XvKJEEghs7c3Bl2l5TVDy/9BHJGKuk8FesV5lzOx49pCovDi/NxA9TBYN2AwDvsrRSzi+89AV4zqx0echkktyUM6qV8hFlC/oI43pdJhz7GTLpDZJ7a3qU5IieSh8Fr+kQIFIgH+LkgiRg/7qea62yirKANkAwPlJHNOzU88AQOMrFCbNx11h0W2Iy1tELDUwxV4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(36756003)(2616005)(6486002)(6506007)(71200400001)(33656002)(6512007)(53546011)(5660300002)(41300700001)(122000001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(4326008)(8676002)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <329820456DE16F4DAC16F2061688E1CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d312227d-354e-4358-2730-08db9e3d1049
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y9THdGjHWbnoipN/Yd7JB4ZeHPzDqu7BeK4uOqwLm1mG3qH9C/qlvCHPg85LXoj9nr6cUMKiNCRsoL1JLd9n4dKOJ6Ehh44+QQs9m+NKtDvtwfgLiJ6CbTuEGOjRGD9ZowleOzJafHFCnTy4BArFYrl/MPCDh3dn7vZpEPJbj3tb/mXUlCI1pYySluy5tODaCgPgih+g9e2sz4EF5dW2pt+II8Q9IhHEOxtBSVb+4wKCVILAj4D8wuRR9eBP4or6Cj2SP6dZE2ayHr5/hbcFliDDcJ6jwqTH5ta3ewtigbw9IjhcuJxyE95m44fgcf9xxy56N1uBmyJ42WeFrBynGwdPWMi0QBPIgMbZLQhnCEiNSXeIMuBjkyXPVRh5e2LOz1x9rHrDA9NZIkUUjbHLaNg3WqJk75740XaLKfazgnMK88xJryBrWhEVdMqCMKvQtPqz+b4puXUsiGDGKl50lsGogfN5/DeytQUagz3x07uGbGez+ksqizb2FJu/j3NzuDleKWWnzz+9qlY44DS96piGwLN8gitXcNfmpVeJY16/7si8qPg5ELn0sORzQpMVKw8ssbMqkRKReQxifhBv7cd7tUZjb6WX9jDaZG0h0eL2WuQNJfviehgQWb1x0o9uCfce+VXzqjs8gL2c5YjKSrcWAC+edHmpPD0zehE3EOIP4pMRqUnY71TJJwSkZcLnDgSuI9NKAdwfdVWDzX79HQvZ+EGYsGG/w+TsnCmWUTWUr1tRx356IGZE1JfzW6nZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(83380400001)(86362001)(478600001)(40480700001)(336012)(36756003)(2616005)(6486002)(6506007)(33656002)(6512007)(53546011)(26005)(5660300002)(41300700001)(36860700001)(82740400003)(316002)(54906003)(356005)(81166007)(70206006)(70586007)(4326008)(6862004)(8676002)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:42:19.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d942a3-f495-4778-51ad-08db9e3d1577
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7415

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
> from a guest. The requests are forwarded to the SPMC and the response is
> translated according to the FF-A version in use by the guest.
>=20
> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> caller (the guest in this case), so once it is done with the buffer it
> must be released using FFA_RX_RELEASE before another call can be made.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - Fixing a typo in a comment and adding another comment as requested
> ---
> xen/arch/arm/tee/ffa.c | 134 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 134 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 6c76c9885774..6c889bf97002 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -166,7 +166,18 @@
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> +/*
> + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> + * structs ending with _1_1 are defined in FF-A-1.1-REL0.
> + */
> +
> /* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> struct ffa_partition_info_1_1 {
>     uint16_t id;
>     uint16_t execution_context;
> @@ -189,6 +200,7 @@ struct ffa_ctx {
>      */
>     uint16_t create_signal_count;
>     bool rx_is_free;
> +    spinlock_t lock;
> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> @@ -203,9 +215,15 @@ static uint16_t subscr_vm_destroyed_count __read_mos=
tly;
> /*
>  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
>  * number of pages used in each of these buffers.
> + *
> + * The RX buffer is protected from concurrent usage with ffa_rx_buffer_l=
ock.
> + * Note that the SPMC is also tracking the ownership of our RX buffer so
> + * for calls which uses our RX buffer to deliver a result we must call
> + * ffa_rx_release() to let the SPMC know that we're done with the buffer=
.
>  */
> static void *ffa_rx __read_mostly;
> static void *ffa_tx __read_mostly;
> +static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>=20
> static bool ffa_get_version(uint32_t *vers)
> {
> @@ -512,6 +530,103 @@ static uint32_t handle_rxtx_unmap(void)
>     return FFA_RET_OK;
> }
>=20
> +static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint3=
2_t w3,
> +                                         uint32_t w4, uint32_t w5,
> +                                         uint32_t *count)
> +{
> +    int32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    /*
> +     * FF-A v1.0 has w5 MBZ while v1.1 allows
> +     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +     *
> +     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> +     * rxtx buffer so do the partition_info_get directly.
> +     */
> +    if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> +         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( w5 )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    spin_lock(&ctx->lock);
> +    if ( !ctx->page_count || !ctx->rx_is_free )
> +        goto out;
> +    spin_lock(&ffa_rx_buffer_lock);
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( ret )
> +        goto out_rx_buf_unlock;
> +    /*
> +     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> +     * share with the SPMC. We must give it back using ffa_rx_release()
> +     * once we've copied the content.
> +     */
> +
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +        for ( n =3D 0; n < *count; n++ )
> +        {
> +            dst[n].id =3D src[n].id;
> +            dst[n].execution_context =3D src[n].execution_context;
> +            dst[n].partition_properties =3D src[n].partition_properties;
> +        }
> +    }
> +    else
> +    {
> +        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ctx->rx_is_free =3D false;
> +out_rx_release:
> +    ffa_rx_release();
> +out_rx_buf_unlock:
> +    spin_unlock(&ffa_rx_buffer_lock);
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static int32_t handle_rx_release(void)
> +{
> +    int32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock(&ctx->lock);
> +    if ( !ctx->page_count || ctx->rx_is_free )
> +        goto out;
> +    ret =3D FFA_RET_OK;
> +    ctx->rx_is_free =3D true;
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> {
>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -568,6 +683,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t count;
>     int e;
>=20
>     if ( !ctx )
> @@ -597,6 +713,24 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>         else
>             set_regs_success(regs, 0, 0);
>         return true;
> +    case FFA_PARTITION_INFO_GET:
> +        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> +                                      get_user_reg(regs, 2),
> +                                      get_user_reg(regs, 3),
> +                                      get_user_reg(regs, 4),
> +                                      get_user_reg(regs, 5), &count);
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, count, 0);
> +        return true;
> +    case FFA_RX_RELEASE:
> +        e =3D handle_rx_release();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
>     case FFA_MSG_SEND_DIRECT_REQ_64:
>         handle_msg_send_direct_req(regs, fid);
> --=20
> 2.34.1
>=20


