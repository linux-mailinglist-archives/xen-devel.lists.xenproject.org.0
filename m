Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5616BAD42
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 11:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510011.786913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcO8n-0007n9-8g; Wed, 15 Mar 2023 10:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510011.786913; Wed, 15 Mar 2023 10:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcO8n-0007kl-5q; Wed, 15 Mar 2023 10:13:53 +0000
Received: by outflank-mailman (input) for mailman id 510011;
 Wed, 15 Mar 2023 10:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KrYV=7H=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pcO8l-0007kd-QQ
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 10:13:51 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a4766b-c31a-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 11:13:49 +0100 (CET)
Received: from AM5PR0602CA0015.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::25) by GV2PR08MB8271.eurprd08.prod.outlook.com
 (2603:10a6:150:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 10:13:43 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::18) by AM5PR0602CA0015.outlook.office365.com
 (2603:10a6:203:a3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Wed, 15 Mar 2023 10:13:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 10:13:42 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Wed, 15 Mar 2023 10:13:42 +0000
Received: from 4764c5a28733.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A78E429-E4F6-42FA-A634-F6FC4754B8C8.1; 
 Wed, 15 Mar 2023 10:13:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4764c5a28733.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 10:13:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 10:13:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 10:13:28 +0000
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
X-Inumbo-ID: 13a4766b-c31a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRpgMmHtfGo21spIdbQY9oJWniVK1OXwObo8bi2zSJ4=;
 b=i+dW9Pqtd5nPKKDY8Wpo99WtXqRH1zyqhkWvcfYLFa44DHoebgfTKbz1CwGLarzxP2gbIsMoEA5MQyJj4240D6SXXwseI9ajIzASXpaNgEw5pKjPpZOBBK7rXnLCyxYMOhjIb7uX31opbroOOZl2T7TBIVx+y0RaWoJ/OaocG8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84cea6ca90f92f50
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yn5mU3FHFw2VI+tIG/49ut1gRsfwfhK173FdzV48AcmyiNiS5Tp5R2Fc5+QvVCywBbd3vpvZKFM98bwm7QF9eh3tdsrsixnoKBISgBSL6Xq4hGLYnJCoJwDj76M7LJ6pUbGMfFWT6Xcs36sTuYmnrzLPtzgogMlHZGnAkUl/aPjP2qwndAlUwb2m5YWVuf6v4kAS/miPzhtJNnj6+LSpedtmkHi/3Al8KQw4ubRZScM6C34DL00Z6akK3NIEk6UIrFnDraZGwXbjx1hRqykb4illkKc6e+jpZhpfP1JT+eBhL2CdKXtiu4tAYg1YU/w+oB7lcJzTJ7MNgrIuWnzbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRpgMmHtfGo21spIdbQY9oJWniVK1OXwObo8bi2zSJ4=;
 b=AaaH9Zdgn5aJKkJDptjLJlSXelAkF+IX9mkqMjr5lMG+iGRgY0oLu2RRSL6WBxHbRDy8q6DH7+M+4W2/0UaLecCeznBTyXbIOham4BTJEgxsUaJrOjy/U9I3KAwcye0dHO+xLOzWFIvv+j/9JMzX/ebA8w3HJSUAjuH1Ddy+1FkeOZjlEJgTQB5xvYRfQb1/PcD/abZpl+LgZ3dYX1rr14ggDxVRfG/JRCSO+Q0cmhPYHsX7URDFeYrJ/nmCzyjIjfwotbseQXUO3Dcc/TGvsp+qGRE4WzybwxYSsP49IvxTMGIj3CfbZA4LxXhxcAE9HN+tPP3dEi9b+C0RXpcQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRpgMmHtfGo21spIdbQY9oJWniVK1OXwObo8bi2zSJ4=;
 b=i+dW9Pqtd5nPKKDY8Wpo99WtXqRH1zyqhkWvcfYLFa44DHoebgfTKbz1CwGLarzxP2gbIsMoEA5MQyJj4240D6SXXwseI9ajIzASXpaNgEw5pKjPpZOBBK7rXnLCyxYMOhjIb7uX31opbroOOZl2T7TBIVx+y0RaWoJ/OaocG8c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 20/20] xen/arm: ffa: support sharing large memory
 ranges
Thread-Topic: [XEN PATCH v7 20/20] xen/arm: ffa: support sharing large memory
 ranges
Thread-Index: AQHZRtMi7cJr1K8N4EOHc07/hf6cda77v+AA
Date: Wed, 15 Mar 2023 10:13:28 +0000
Message-ID: <D9FBF922-1941-401B-9794-45641A02FC19@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5a48b7c7a56b83138932850eb7f94f90604168e4.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <5a48b7c7a56b83138932850eb7f94f90604168e4.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8277:EE_|AM7EUR03FT059:EE_|GV2PR08MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aed4b9-cbfd-4bd1-db1a-08db253df43e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +z65Mzw8bQXHF2IEQamya73RzRlfq+VO2rFNlnNm/dnQANUnWxnaLqjbHOSaIQkuWjbOjNM0S9U6WrYSu5nA8G6q4sJTnFllh4wjmifktLk7qY6OHRaSEg99pl9vAedO+tG8kTpDYc83i/JBc1xrvYqEGAsp6A2x2J4rq4MFilucY7/PGTFXH5cp2Eim1OSMjJRjwpkQq6kTQNnBO24kecpbJE1/1yr9F7WbBJI3yJxJ3JI7BXrBoryguBy0iHpQJWHUCsTL7Id8I116DLJw9302HGh37ek1l9d8dA9wN3Hr3s3kz20kp/eBAzQ4pxR4g32VieO0T5HxI4b9+6RMAKkvGo642I9xBj/QtLEobDS4yCv6x9OLVx4iYm31nGwRjK1TuMbH9kh9k/UKQvKfRkKarbW70Jw5ZH+kv2MU4ZkfEgwsUm/f9aF5bQIdJ7Y4vHgNAeiYTtPk+npwlalhlcjjoASwGrk/RttJotIWTk8sYhH1l5NIiMFG3syDyjhZbUdOPstWB9pd1szWAE/h8aWF9bLrIGDH/b8D1Rc/eMjPG8fKVekX0plHGELi8/EKt3QwwqfOKg1GbbFJ5qurBWzPkg1wI+9avZGPtodu96Fo/qx3jxLahJAl0tt5aip7BC2nJxY6AqXzeTM3j8elrSRP+YX5eNPF8PPjz0Y/LYEFgbZgNU8x6YlYGetdFTxYgbOsDhdOC7rz4CZJJwTynCmz7AjUuRKE7uQBSBnoB8g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(36756003)(33656002)(316002)(6916009)(4326008)(6512007)(6506007)(41300700001)(8936002)(186003)(5660300002)(53546011)(2616005)(86362001)(54906003)(71200400001)(478600001)(64756008)(38100700002)(66446008)(6486002)(66946007)(66476007)(122000001)(91956017)(38070700005)(76116006)(2906002)(30864003)(66556008)(8676002)(83380400001)(66899018)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <284E3F0E9E37EC499CCCFDB24497E7F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf46a530-df0f-4429-e550-08db253dec25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeZet7Z7rfCeLpmdmvKcQ8RdvOTBgIt+GXQP1D6uKe0GenO5TSCPxPOtKu+ub86f+adimKFHgzD9xiM0quMO4HodFxG0RWmaXUtWtW3RXpo5nE3uhEeUufMANIQS6B9WnXpoQ9N6J6UkHRIzGGBXygkdSSv8uIJgA64ppN+MtHEwfihnygs1sYIDH4bwoXQd7S2ojrW7UUnIZXdDE6YKEy5jLY0BsHdU+BWEMQ03TMRoyWj1F73IRWcy0rNa/8A/vbfCJX3vrHvTJqbGrTLWy4yAYRwXavE+1ITSrkkqCscLUVTdMYe0+ptwVth8wds3YUbxqW5HsPQJK5pCjQPGh0N5Q0vDYpp03cFig/E8fd1UlxO/E9yBo/Uc2Tfxr2M+Bo5eAQy45TaQuMyDAfVMmm6nKI6VSK35IKKLCwKFCdfd4Lw/XsqMZ1RXYOgw/q7cihfiA4fcy7Vaj5VSpZVma2d1+PBMOcrfz6aD4XXcMFPISbAV9Ly+k67+Hmhl9ZUJ5EnhUNi8RbKevlQfBslOVOJxeg81Q09W66jakNc4n6/4vgmmSpyIZbr5ayhFxK1um2FPWwaBrRf/yMkPYv8S/O1zjWsMulzxlSYb3c3zIIFpQmifL7afvaMamS3pDJlCO+NPTTkh0BlMU10JfBfUP67g3vbaJSF6joS1SE9sXSoHhKFdv9ZaefatVq/enxaOJbxr6hcIp+Fk9431HNyAwg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(40470700004)(36840700001)(46966006)(6486002)(2906002)(66899018)(53546011)(6506007)(186003)(6512007)(26005)(82740400003)(2616005)(36756003)(83380400001)(82310400005)(30864003)(478600001)(5660300002)(40460700003)(86362001)(54906003)(316002)(356005)(8936002)(6862004)(36860700001)(81166007)(33656002)(4326008)(70206006)(47076005)(70586007)(336012)(8676002)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:13:42.3268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aed4b9-cbfd-4bd1-db1a-08db253df43e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8271

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for sharing large memory ranges transmitted in fragments
> using FFA_MEM_FRAG_TX.
>=20
> The implementation is the bare minimum to be able to communicate with
> OP-TEE running as an SPMC at S-EL1.
>=20
> Adds a check that the SP supports the needed FF-A feature
> FFA_MEM_FRAG_TX.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 254 ++++++++++++++++++++++++++++++++++++++---
> 1 file changed, 240 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3557edc455d0..72c0249d8cad 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -326,6 +326,7 @@ struct ffa_ctx {
>     uint32_t guest_vers;
>     bool tx_is_mine;
>     bool interrupted;
> +    struct list_head frag_list;
>     struct list_head shm_list;
>     unsigned int shm_count;
>     spinlock_t lock;
> @@ -340,6 +341,18 @@ struct ffa_shm_mem {
>     struct page_info *pages[];
> };

We start to have a lot of fields here.
It might be useful to have some quick documentation
in comment here as some names are a bit generic.
For example "frag_list" does not say much.

>=20
> +struct mem_frag_state {
> +    struct list_head list;
> +    struct ffa_shm_mem *shm;
> +    uint32_t range_count;
> +    unsigned int current_page_idx;
> +    unsigned int frag_offset;
> +    unsigned int range_offset;
> +    const uint8_t *buf;
> +    unsigned int buf_size;
> +    struct ffa_address_range range;
> +};

same here, at a first glance it is not quite clear why
a fragment needs that much info. Some seem to only
be needed during the transaction but do not need to be saved.

> +
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> @@ -512,6 +525,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint3=
2_t frag_len,
>     }
> }
>=20
> +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> +                               uint16_t sender_id)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_FRAG_TX,
> +        .a1 =3D handle & UINT32_MAX,
> +        .a2 =3D handle >> 32,
> +        .a3 =3D frag_len,
> +        .a4 =3D (uint32_t)sender_id << 16,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
>                                uint32_t flags)
> {
> @@ -586,6 +629,14 @@ static void set_regs_success(struct cpu_user_regs *r=
egs, uint32_t w2,
>     set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> }
>=20
> +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle=
_lo,
> +                             uint32_t handle_hi, uint32_t frag_offset,
> +                             uint16_t sender_id)
> +{
> +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> +             (uint32_t)sender_id << 16, 0, 0, 0);
> +}
> +
> static void handle_version(struct cpu_user_regs *regs)
> {
>     struct domain *d =3D current->domain;
> @@ -955,6 +1006,8 @@ static int share_shm(struct ffa_shm_mem *shm)
>     paddr_t last_pa;
>     unsigned int n;
>     paddr_t pa;
> +    bool first;
> +    int ret;
>=20
>     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
>     if ( !shm->page_count )
> @@ -994,13 +1047,23 @@ static int share_shm(struct ffa_shm_mem *shm)
>=20
>     tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
>                                 region_descr->address_range_count);
> -    if ( tot_len > max_frag_len )
> -        return FFA_RET_NOT_SUPPORTED;
>=20
> +    /*
> +     * Sharing memory with secure world may have to be done with multipl=
e
> +     * calls depending on how many address ranges will be needed. If we'=
re
> +     * sharing physically contiguous memory we will only need one range =
but
> +     * we will also need to deal with the worst case where all physical
> +     * pages are non-contiguous. For the first batch of address ranges w=
e
> +     * call ffa_mem_share() and for all that follows ffa_mem_frag_tx().
> +     *
> +     * We use frag_len to keep track of how far into the transmit buffer=
 we
> +     * have gone.
> +     */
>     addr_range =3D region_descr->address_range_array;
>     frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,=
 1);
>     last_pa =3D page_to_maddr(shm->pages[0]);
>     init_range(addr_range, last_pa);
> +    first =3D true;
>     for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
>     {
>         pa =3D page_to_maddr(shm->pages[n]);
> @@ -1010,12 +1073,34 @@ static int share_shm(struct ffa_shm_mem *shm)
>             continue;
>         }
>=20
> -        frag_len +=3D sizeof(*addr_range);
> -        addr_range++;
> +        if ( frag_len =3D=3D max_frag_len )
> +        {
> +            if ( first )
> +            {
> +                ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->han=
dle);
> +                first =3D false;
> +            }
> +            else
> +            {
> +                ret =3D ffa_mem_frag_tx(shm->handle, frag_len, shm->send=
er_id);
> +            }
> +            if ( ret <=3D 0 )
> +                return ret;
> +            frag_len =3D sizeof(*addr_range);
> +            addr_range =3D buf;
> +        }
> +        else
> +        {
> +            frag_len +=3D sizeof(*addr_range);
> +            addr_range++;
> +        }
>         init_range(addr_range, pa);
>     }
>=20
> -    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    if ( first )
> +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    else
> +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> }
>=20
> static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_=
t blen,
> @@ -1092,8 +1177,53 @@ static int read_mem_transaction(uint32_t ffa_vers,=
 const void *buf, size_t blen,
>     return 0;
> }
>=20
> +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int off=
s,
> +                              unsigned int frag_len)
> +{
> +    struct domain *d =3D current->domain;
> +    unsigned int o =3D offs;
> +    unsigned int l;
> +    int ret;
> +
> +    if ( frag_len < o )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Fill up the first struct ffa_address_range */
> +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_=
offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset +=3D l;
> +    o +=3D l;
> +    if ( s->range_offset !=3D sizeof(s->range) )
> +        goto out;
> +    s->range_offset =3D 0;
> +
> +    while ( true )
> +    {
> +        ret =3D get_shm_pages(d, s->shm, &s->range, 1, s->current_page_i=
dx,
> +                            &s->current_page_idx);
> +        if ( ret )
> +            return ret;
> +        if ( s->range_count =3D=3D 1 )
> +            return 0;
> +        s->range_count--;
> +        if ( frag_len - o < sizeof(s->range) )
> +            break;
> +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> +        o +=3D sizeof(s->range);
> +    }
> +
> +    /* Collect any remaining bytes for the next struct ffa_address_range=
 */
> +    s->range_offset =3D frag_len - o;
> +    memcpy(&s->range, s->buf + o, frag_len - o);
> +out:
> +    s->frag_offset +=3D frag_len;
> +
> +    return s->frag_offset;
> +}
> +
> static void handle_mem_share(struct cpu_user_regs *regs)
> {
> +    static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
>     uint32_t tot_len =3D get_user_reg(regs, 1);
>     uint32_t frag_len =3D get_user_reg(regs, 2);
>     uint64_t addr =3D get_user_reg(regs, 3);
> @@ -1128,13 +1258,6 @@ static void handle_mem_share(struct cpu_user_regs =
*regs)
>         goto out_set_ret;
>     }
>=20
> -    /* We currently only support a single fragment */
> -    if ( frag_len !=3D tot_len )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_set_ret;
> -    }
> -
>     spin_lock(&ctx->lock);
>=20
>     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> @@ -1195,11 +1318,41 @@ static void handle_mem_share(struct cpu_user_regs=
 *regs)
>     if ( !shm )
>     {
>         ret =3D FFA_RET_NO_MEMORY;
> -        goto out_unlock;
> +        goto out;

Why is this changed ?
You still have no shm here so call free_sha_shm does not make sense

>     }
>     shm->sender_id =3D trans.sender_id;
>     shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
>=20
> +    if ( frag_len !=3D tot_len )
> +    {
> +        struct mem_frag_state *s =3D xzalloc(struct mem_frag_state);
> +
> +        if ( !s )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out;
> +        }
> +        s->shm =3D shm;
> +        s->range_count =3D range_count;
> +        s->buf =3D ctx->tx;
> +        s->buf_size =3D ffa_page_count * FFA_PAGE_SIZE;
> +        ret =3D add_mem_share_frag(s, sizeof(*region_descr)  + region_of=
fs,
> +                                 frag_len);
> +        if ( ret <=3D 0 )
> +        {
> +            xfree(s);
> +            if ( ret < 0 )
> +                goto out;
> +        }
> +        else
> +        {
> +            shm->handle =3D next_handle++;
> +            uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +            list_add_tail(&s->list, &ctx->frag_list);
> +        }
> +        goto out_unlock;
> +    }
> +
>     /*
>      * Check that the Composite memory region descriptor fits.
>      */
> @@ -1238,7 +1391,75 @@ out_unlock:
>     spin_unlock(&ctx->lock);
>=20
> out_set_ret:
> -    if ( ret =3D=3D 0)
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.send=
er_id);
> +    else if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static struct mem_frag_state *find_frag_state(struct ffa_ctx *ctx,
> +                                              uint64_t handle)
> +{
> +    struct mem_frag_state *s;
> +
> +    list_for_each_entry(s, &ctx->frag_list, list)
> +        if ( s->shm->handle =3D=3D handle )
> +            return s;
> +
> +    return NULL;
> +}
> +
> +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t frag_len =3D get_user_reg(regs, 3);
> +    uint32_t handle_lo =3D get_user_reg(regs, 1);
> +    uint32_t handle_hi =3D get_user_reg(regs, 2);
> +    uint64_t handle =3D regpair_to_uint64(handle_hi, handle_lo);
> +    struct mem_frag_state *s;
> +    uint16_t sender_id =3D 0;
> +    int ret;
> +
> +    spin_lock(&ctx->lock);
> +    s =3D find_frag_state(ctx, handle);
> +    if ( !s )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +    sender_id =3D s->shm->sender_id;
> +
> +    if ( frag_len > s->buf_size )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D add_mem_share_frag(s, 0, frag_len);
> +    if ( ret =3D=3D 0 )
> +    {
> +        /* Note that share_shm() uses our tx buffer */
> +        spin_lock(&ffa_tx_buffer_lock);
> +        ret =3D share_shm(s->shm);
> +        spin_unlock(&ffa_tx_buffer_lock);
> +        if ( ret =3D=3D 0 )
> +            list_add_tail(&s->shm->list, &ctx->shm_list);
> +        else
> +            free_ffa_shm_mem(ctx, s->shm);
> +    }
> +    else if ( ret < 0 )
> +        free_ffa_shm_mem(ctx, s->shm);


If there is not error the stuff allocated are kept but i do not see
where/when they would be freed or used.
Could you explain why we need to save all those ?

Cheers
Bertrand

> +    list_del(&s->list);
> +    xfree(s);
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id)=
;
> +    else if ( ret =3D=3D 0)
>             set_regs_success(regs, handle_lo, handle_hi);
>     else
>             set_regs_error(regs, ret);
> @@ -1357,6 +1578,9 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>         else
>             set_regs_success(regs, 0, 0);
>         return true;
> +    case FFA_MEM_FRAG_TX:
> +        handle_mem_frag_tx(regs);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -1396,6 +1620,7 @@ static int ffa_domain_init(struct domain *d)
>         }
>     }
>=20
> +    INIT_LIST_HEAD(&ctx->frag_list);
>     INIT_LIST_HEAD(&ctx->shm_list);
>=20
>     d->arch.tee =3D ctx;
> @@ -1560,6 +1785,7 @@ static bool ffa_probe(void)
> #endif
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> +         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
>          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
> --=20
> 2.34.1
>=20


