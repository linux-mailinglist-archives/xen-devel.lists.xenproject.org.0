Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F327B77DD81
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584239.914733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD2J-00015p-LM; Wed, 16 Aug 2023 09:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584239.914733; Wed, 16 Aug 2023 09:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD2J-00013N-I7; Wed, 16 Aug 2023 09:41:55 +0000
Received: by outflank-mailman (input) for mailman id 584239;
 Wed, 16 Aug 2023 09:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWD2I-00010t-6F
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:41:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21d61a83-3c19-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:41:53 +0200 (CEST)
Received: from AM6P194CA0082.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::23)
 by DBBPR08MB5977.eurprd08.prod.outlook.com (2603:10a6:10:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:41:24 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::72) by AM6P194CA0082.outlook.office365.com
 (2603:10a6:209:8f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 09:41:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:41:23 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Wed, 16 Aug 2023 09:41:23 +0000
Received: from 64db4f4af024.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85B87396-7163-4491-981C-805A6B0B80D2.1; 
 Wed, 16 Aug 2023 09:41:17 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64db4f4af024.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:41:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7995.eurprd08.prod.outlook.com (2603:10a6:10:3e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:41:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:41:15 +0000
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
X-Inumbo-ID: 21d61a83-3c19-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j0g0IowZ4J7KUXx1r6AOoJh+hcDKpXkfMXO2xK+c4c=;
 b=7CLIEo0HLaZ4HNiixHdG8R3hdjGz6kCAfefFTEDQsxHdve9XSoCi7EYSMaf8y2XxPgmGucriPV3AIZUkOATrf+ZM2LBglSlZiIj00RCcy6NXUw0ere6BChAI7SFNGVRkm3Ig/h1sxLYMl2v//+pxdnG8w1zFUGTCEOzYKMIvVpg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54b6cd1f0e32f34d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+5E30K+o4jC0AY8NvCYYBTUY3iOTpy3JYsW00nglEJ0diGMOdqFBB6JZEyQH3AfYsEB8+sX/AgsS27o0L+WUcnO9S2SKpnfO0fwCTuL2s6NG6qKNksSRP08SgoB+xz6zP2i5HeaEgNHLWEq2sr239gVCkQZ+QduVp1fYPLFUq8nhnsL1b07hZIQ1NzNykbtTOnVuS/Es4MuxGft7JOnZlqWJm5oxMFsF6wF2Xeazspk9HLJNxJ2mXH0bBck2Gjbtuj0lNn+IwfkqNLvwYL116M7VY6VuBimeBGe+OmprTerLRe+zi29AyTaoS2ur1Aw3nNhDnBYmD3lRL+uN6ZRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j0g0IowZ4J7KUXx1r6AOoJh+hcDKpXkfMXO2xK+c4c=;
 b=arOZeB2lnjcseBU0j4+2pb4tqC5V7QXZKps2QXcJBnCIQWlNzJsV1agLjXnVLFJLAHng9B1e/brA4VhfmyQ9VPHUlC7vh7aIpZZzJBy832CRIfbHke2FkeZEMiXDuPv4e6FtAtd8ZXz2KUSxpLylAnK/9Xs9V47bXnjENFysiMjiX8t/EdNKsSxLLqsrpLPm2QMvcEf9YXb+tAEPs96QWSGDX+hJwp4x20Nv02tlDspzrax5zQzXYy5zL/VoETeDQWgd/QWT7DIGLvWtcY05wRiDQso4fCgiQ/fRMwAyDAC89T2KmeWro8zjYFhnl8m2UxSWISr/DdJdP5dP8eE9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j0g0IowZ4J7KUXx1r6AOoJh+hcDKpXkfMXO2xK+c4c=;
 b=7CLIEo0HLaZ4HNiixHdG8R3hdjGz6kCAfefFTEDQsxHdve9XSoCi7EYSMaf8y2XxPgmGucriPV3AIZUkOATrf+ZM2LBglSlZiIj00RCcy6NXUw0ere6BChAI7SFNGVRkm3Ig/h1sxLYMl2v//+pxdnG8w1zFUGTCEOzYKMIvVpg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v11 04/14] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Topic: [XEN PATCH v11 04/14] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Index: AQHZw6jBvWO4bv1JEESRRODWI5Tu8K/sxDoA
Date: Wed, 16 Aug 2023 09:41:15 +0000
Message-ID: <CA631EB2-3087-4627-8A4B-FE056C5FC63B@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-5-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-5-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7995:EE_|AM7EUR03FT012:EE_|DBBPR08MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: caad3190-e0a9-41bc-f65a-08db9e3cf454
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MxCg921k1IwpnH6UmoYy86BijzB0XhS+4qPf1085Igr4GactDbBs0NQlF3h0hYJmusxt9BRzlInIVOKVnTQ10WF0mdL32ylX8+5H7yghPwjDPM7IKf1xCU7PV0RhSyKXZBCoSqjaDhGYpoPhT3DJwzseaoBuXOE2U3heWvMHsKBzg3AIQaSmoIwUtsI6SeTqP47UbIwqDujis7onWnyEgRuW0arxfdgd9R4Lcp+j1bQd54NEuSy9uF6uFK8TyiiWTmthCVNHO3vS5zxkRt8peAbKcWFWaCxU4zedcJV9CCZWSbzHEuJ3VnDF68FZ9x/1teKyN2A0lnRmLMgl/QBc2mKg2cDSU0mkSx7276gkyIEIZXnybJPftCth1JPhhxdaIP6DkWhH6veqjxIkrkz+I1BuOXhFrF3JcHYYk3cUQfc1SQPzgsQuJm+JgHqpXbNdz4Co/j0RRw8lY6NUdUc1fqBz2MjSwYAtrfBH9nCOyIMTutNtBsfnmotdtZFGJ1MlM1CDQIUVLVQHFrRAZaYVPbUpDSwwqLsIZISDvBAIKfRQsPf5zR/0bHw2dkClEpWAo/bdCTWAQMSG0slB/TW1nmQH6csD4S7s5h9uzMxdnv4CFSwQrpjrnwyWCXQITzmNeyW873+zhBrBZwXJMkLWgg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(36756003)(2616005)(6486002)(6506007)(71200400001)(33656002)(6512007)(53546011)(5660300002)(41300700001)(122000001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(4326008)(8676002)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F14DA121BC5C694D8C33FAA4F44ABC43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb49783b-3bba-4109-5838-08db9e3cef4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4vk5DCyOe7QsOq+CPAlt//9oz2w6WjfgdS0GDpW3cD69NXkU3AriljnNSTZupsprxly0DY2t9pbNWN8BZwOoZqkeialF5JjoMWP6S3q+WPJhhEmeEMsfteF2ocQDv3QeFpdKG49R44akLjGwdTFBS6E2YSpQfhcdST1zdxr+nXdiUjSMHdNmYG8s94vMbl9jsFUKBLiJlwsKi86CQLJc98xOAjLojYraBAM0xIEpGy3JTiJ0Jj+m5t2t25ng8sMJ1lZPIFIUwc4WD5+FC4NUMoMryEDj/LQ7mltTe/imcAnRjNeZbQAjXdt2+nrjVE5akyeevf+KRacWaodo0Eb+hZF0t1ZnehEUQ/2FklBraZ3gWEezl8YD7epe/4RUa3rJ7agobyhMNqPz5Go9CTCeSReHgQ1nmPcmoc+i1lHJNVFrFJYXy+ckSNRU6zPf3IaOTH93GBkJ4wHS6T+oxymBdj4IIPvJdo+rIR67v7uAHe9/SpJHc0xMbUFhp5T3UlOunoAh/rPaeFCKqL7GgDSDLHwIQQg20ttlerqgJ/rCUXZ5cswgdhCPHljDeluEjyN5WvbUVMvE540aDkHM+UI3ePbsa5UBcOdX3WmjXBi6lgNp8JlBZ3eC+Rmc/Jsip23GKKntQaVZGQP7381oSgHAtMGg/E33dPkhx4Wr0Jwt6k23XOMtktsyKbncWyNpW6rl5aVaMXJfqzEGBy2li/lhYc3nB2CFXXczTbHdAFgz4rZ5p1g1GIP+wQwNfpKw0a9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(54906003)(70586007)(70206006)(6512007)(6486002)(6506007)(2906002)(478600001)(336012)(26005)(5660300002)(2616005)(83380400001)(41300700001)(316002)(47076005)(53546011)(36860700001)(8936002)(4326008)(82740400003)(6862004)(8676002)(81166007)(356005)(40460700003)(33656002)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:41:23.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caad3190-e0a9-41bc-f65a-08db9e3cf454
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5977

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support in the mediator to map and unmap the RX and TX buffers
> provided by the guest using the two FF-A functions FFA_RXTX_MAP and
> FFA_RXTX_UNMAP.
>=20
> These buffer are later used to transmit data that cannot be passed in
> registers only.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - Fixing a typo in a comment and adding a couple of newlines as requested
> ---
> xen/arch/arm/tee/ffa.c | 140 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 140 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5af3e5eedc88..6c76c9885774 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -74,6 +74,12 @@
>  */
> #define FFA_RXTX_PAGE_COUNT             1
>=20
> +/*
> + * Limit the number of pages RX/TX buffers guests can map.
> + * TODO support a larger number.
> + */
> +#define FFA_MAX_RXTX_PAGE_COUNT         1
> +
> /*
>  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>  * BIT(31): Framework or partition message
> @@ -169,6 +175,12 @@ struct ffa_partition_info_1_1 {
> };
>=20
> struct ffa_ctx {
> +    void *rx;
> +    const void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> +    unsigned int page_count;
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
>     /*
> @@ -176,6 +188,7 @@ struct ffa_ctx {
>      * ffa_domain_teardown() to know which SPs need to be signalled.
>      */
>     uint16_t create_signal_count;
> +    bool rx_is_free;
> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> @@ -371,6 +384,11 @@ static void set_regs(struct cpu_user_regs *regs, reg=
ister_t v0, register_t v1,
>         set_user_reg(regs, 7, v7);
> }
>=20
> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_co=
de)
> +{
> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
>                              uint32_t w3)
> {
> @@ -392,6 +410,108 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        /*
> +         * Calls using the 32-bit calling convention must ignore the upp=
er
> +         * 32 bits in the argument registers.
> +         */
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }
> +
> +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> +    {
> +        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
> +               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +
> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_rx_pg;
> +
> +    tx =3D __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx =3D __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx =3D rx;
> +    ctx->tx =3D tx;
> +    ctx->rx_pg =3D rx_pg;
> +    ctx->tx_pg =3D tx_pg;
> +    ctx->page_count =3D page_count;
> +    ctx->rx_is_free =3D true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +
> +    return ret;
> +}
> +
> +static void rxtx_unmap(struct ffa_ctx *ctx)
> +{
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->rx_is_free =3D false;
> +}
> +
> +static uint32_t handle_rxtx_unmap(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx->rx )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    rxtx_unmap(ctx);
> +
> +    return FFA_RET_OK;
> +}
> +
> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> {
>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -448,6 +568,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    int e;
>=20
>     if ( !ctx )
>         return false;
> @@ -460,6 +581,22 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_RXTX_MAP_32:
> +    case FFA_RXTX_MAP_64:
> +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(r=
egs, 2),
> +                            get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_RXTX_UNMAP:
> +        e =3D handle_rxtx_unmap();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
>     case FFA_MSG_SEND_DIRECT_REQ_64:
>         handle_msg_send_direct_req(regs, fid);
> @@ -554,6 +691,9 @@ static int ffa_domain_teardown(struct domain *d)
>                    get_vm_id(d), subscr_vm_destroyed[n], res);
>     }
>=20
> +    if ( ctx->rx )
> +        rxtx_unmap(ctx);
> +
>     XFREE(d->arch.tee);
>=20
>     return 0;
> --=20
> 2.34.1
>=20


