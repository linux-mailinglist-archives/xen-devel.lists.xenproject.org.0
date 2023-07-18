Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8B757934
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 12:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565090.882982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhqO-00070I-85; Tue, 18 Jul 2023 10:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565090.882982; Tue, 18 Jul 2023 10:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhqO-0006yd-40; Tue, 18 Jul 2023 10:22:12 +0000
Received: by outflank-mailman (input) for mailman id 565090;
 Tue, 18 Jul 2023 10:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLhqM-0006yX-MV
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 10:22:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34d48a4-2554-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 12:22:09 +0200 (CEST)
Received: from AS4P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::6)
 by DU0PR08MB8042.eurprd08.prod.outlook.com (2603:10a6:10:3e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 10:22:05 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e2:cafe::9a) by AS4P195CA0002.outlook.office365.com
 (2603:10a6:20b:5e2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 10:22:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 10:22:05 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Tue, 18 Jul 2023 10:22:05 +0000
Received: from e9ec91e7b19f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87F7D2B3-4356-4200-AE4C-E56D34FD1753.1; 
 Tue, 18 Jul 2023 10:21:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9ec91e7b19f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 10:21:58 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AS8PR08MB9364.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 10:21:55 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 10:21:55 +0000
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
X-Inumbo-ID: f34d48a4-2554-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKfTXqcIkG7wvy24x4435IHOuEQhDz69tFHffTq02O0=;
 b=U+ZMpzW7nS7S8QP6S1E9rLEtXyKA4OKVVxF2nb5bgl0iY7InqTZIcIxp47/t+J1P76X6WzkcfLSqdF0Mq6HPbHn7K/dst9lmyX6oNuEtIVMHq18zyShf5Km0dsE6QMlYyP+j7tMpNH/haAuwsDJqVMsFEW1CTQm8WfMkMgdN7BU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b8aa35ec9dc67d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgn4sN3WqW0F6vRUMEo8qCiO9VLCV/jlpMz6+uNNX3pM1siccBV8+e96oqzxU8nhRCFixqGJci+DAzeTpqwY/6rTZ5XJ+eEAUnF3y1AnSW6HVA8A10nsKOgqIzssjJCAT63NetijonGodKejmnvShSex3ad4pQ95X9zI9Q9nWGNUx4uSxZRa2vQgOsyKhtkU6CfuPkfQV1xey+fweiExyBN7tf0PF/Clx1cFW7zNHbLFrt+kT68/k0or4pv/NMdMXDaSs1QLHJP3falJHzQrQuepBIyXVdzP3o+hRO5QwyU2KfXhpXk5xmD1su4ImJjyJaGcK08baJWGba95DT1ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKfTXqcIkG7wvy24x4435IHOuEQhDz69tFHffTq02O0=;
 b=HpZybrIv+ROkJ3yTJMJZ314M7m6v6qlYHUB3OznRJYLzd54aJ8xqHQ7aw+1i7SeZeloQ7RxmhM9zDy8wCG5xIWloxfQpK5ip5/BBFKH5rCdXeHIjkPMU01R5x327szBUYzuFjvpMZItpReXGu8i6hvPaL0n7mYo8xiBDEQln69ju1BHS/hRtqV+sFOktfTMDjg2Q4UvkwWs1qpGHECHczI146jylr6lcZZSughSwPIHRVy0zEbn2kabf4Ef5cms+Wi7sDORT1unyPJi7E8gb1AN4ZDM3tyiik2573qo3DbU5Og6h+Lyhv+p8sYNHirPr5T3ng+36TViuJJ5we2pHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKfTXqcIkG7wvy24x4435IHOuEQhDz69tFHffTq02O0=;
 b=U+ZMpzW7nS7S8QP6S1E9rLEtXyKA4OKVVxF2nb5bgl0iY7InqTZIcIxp47/t+J1P76X6WzkcfLSqdF0Mq6HPbHn7K/dst9lmyX6oNuEtIVMHq18zyShf5Km0dsE6QMlYyP+j7tMpNH/haAuwsDJqVMsFEW1CTQm8WfMkMgdN7BU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>
Subject: Re: [XEN PATCH v10 14/24] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v10 14/24] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZuH9YF/Z3OeEtnU6SqiWq2d4poa+/Uk+A
Date: Tue, 18 Jul 2023 10:21:55 +0000
Message-ID: <D09E02DC-DE2A-4876-B5E7-10DD131EC98F@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-15-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-15-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|AS8PR08MB9364:EE_|AM7EUR03FT013:EE_|DU0PR08MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 83450ee3-983d-42ac-29a3-08db8778d5a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DahoaX6RMTv1IqfGlCxUnzaZf7hggiOLSFKKXosllA9c6Jpo7LMfcjQVwBzSO8U9MA+M0rMwaxOKWA1kj3Eu4+l/HG+atuy6FiBseKf5+bBRYD3+khrIjdGGXzlpUp26H5nOamPPHLNX6vJ9AcJgqcdcWdskR3R6tUhcBeoP6UjPJOOAzDHfgcEGIbmIwTsp/aSsIILWfJuVCSHYImPWhGEHC3X5mUse9j5HYgaBinXkEvk5zusaqORsWzytcWFEt2F+NQEVsYK9g1o9sBhzaHGe51qEhjxAPspWa9MbXt5ZfB3SopcVkFQB/oCa2VZsJOLx6NNREPIDeKLfxrdnzLSIPh3BjFzpJKRSr/uGubcCnOrqlsHmvz27OxyjMz44MYuaPCz5QowIdZwK+5IW/jyXnPddiDv3rZnJuN+D+hfrM+IQnvw5tSzyMNUCjSMxwcQbHjsZ/XJ3osQNlZuijsIt9FA2mkBAwihZhEsn+rckTAxxE7EV50iV79tcHWnr4M+Xjew3WtUWv/Vo2vSOpGJVSk+qfWtFUlq2osHA5JBAgSYyyFwaI1B3L8GJqktNhhaaSCGtfZ3eskusjcSGqTrO7VW7vc3kULNlknHtqHJCjOskhQ9bAJwD4BlxWFbUpOqt24TeR7j1nJRjlM8QwQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199021)(66556008)(54906003)(478600001)(71200400001)(6486002)(91956017)(53546011)(6506007)(186003)(36756003)(2616005)(316002)(6512007)(2906002)(76116006)(4326008)(66946007)(66476007)(41300700001)(66446008)(5660300002)(8676002)(8936002)(122000001)(64756008)(6916009)(38100700002)(86362001)(38070700005)(83380400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32D48C7FFFD6AF4A96CCA62A5ABCA5CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d3a9ebe-c31c-4b33-86a2-08db8778cfe0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jMyUxmgcOmh+lbCknxBADrzaKRHrCXwHp5SlKy7VooD6AYo2vq1kb7T6BHaKjxF1goxztsi7n+mbR+iRe64Mrje2CK8sBG3WQ3zZoCgafSxT76fNmsk2RVLy8LqkNuye/Pi4yQBuK62GeJE6gV0Kqyy6vHPJiM2J69kY+hTVmWlfPYdsaFGPnnKHDQSCkXHjfHtUgQa50wuZx9jr5OcOykE2DaXRvb8aLKm7k+IPCKu8l0d5Klp451ETm9AZOP5iesLNMTXuYoQt99z3B3kxwxwtQVXxkEJG/S1hA+TQeRvN9C8u0TNL790/w9b1vTSudHt2pbpSoPMuGW0wUt4rCMNOxXfc2SdSmtX8l1Iwpq6yw7xnlyrYy7fiDZM7AYDfi+Vj5d2gtwfCO4rPRa82BrpSNBxpX70Ip7okoFzrA4dtgn5Q1OX64H9LYgGGrmZHOmuCrSuz4ZtzGJ77EYVL51Sr8a7PeHtx8i+ZtiueYuy4DPvsaW8azdJMtqdKwT47nZNJJDcNozrUCr/RiL7yagBcbGsS5wRdukd2jHrF6JCxoWrNkIbijL0f8x8w8NSXwNQzo+yc0oUsbgohoWGWPs5KwJIYe31hRArPUt0S2qS9NWbXG4y2WNxu89D+5oz6gt/P2xBtkvO2mD17d8BHamCsS/sVUvceZuIJ0osEDMMLOXeQ+GfsSLv3uIEqLGYodO/z/47L588kNQNA4oU8+kMKpc3W7lFI/rLTaGXlFxmbp+aKZGkoSqP0rXhgKhvt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(86362001)(2906002)(33656002)(36756003)(40460700003)(40480700001)(47076005)(2616005)(36860700001)(6512007)(186003)(336012)(6506007)(26005)(53546011)(82740400003)(356005)(81166007)(6486002)(54906003)(83380400001)(478600001)(70206006)(4326008)(8676002)(316002)(41300700001)(6862004)(8936002)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 10:22:05.2341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83450ee3-983d-42ac-29a3-08db8778d5a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8042

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
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
> ---
> xen/arch/arm/tee/ffa.c | 131 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 131 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index ffabb5ed0a80..d5748b9ce88c 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -166,7 +166,18 @@
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> +/*
> + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> + * struct ending with _1_1 are defined in FF-A-1.1-REL0.

Nit: For coherency, second line should be "Structs" instead of "struct"

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
> @@ -510,6 +528,100 @@ static uint32_t handle_rxtx_unmap(void)
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
> +     */

You should add something to say that the INFO_GET_COUNT does
not use the rxtx buffer to explain why you do the call directly in this cas=
e.

Reading the code as is, on might wonder why this case is different.

How about:
FFA_PARTITION_INFO_GET_COUNT is only using registers and not
the rxtx buffer so do the partition_info_get directly.

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
> @@ -566,6 +678,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t count;
>     int e;
>=20
>     if ( !ctx )
> @@ -595,6 +708,24 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
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

Cheers
Bertrand


