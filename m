Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7A6A5DA9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503581.775871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3An-0004r6-2z; Tue, 28 Feb 2023 16:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503581.775871; Tue, 28 Feb 2023 16:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3Am-0004p9-W9; Tue, 28 Feb 2023 16:49:52 +0000
Received: by outflank-mailman (input) for mailman id 503581;
 Tue, 28 Feb 2023 16:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nVN0=6Y=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pX3Al-0004p1-PV
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:49:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea8c6e78-b787-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 17:49:50 +0100 (CET)
Received: from AS9PR06CA0178.eurprd06.prod.outlook.com (2603:10a6:20b:45c::10)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 16:49:20 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::ac) by AS9PR06CA0178.outlook.office365.com
 (2603:10a6:20b:45c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Tue, 28 Feb 2023 16:49:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.12 via Frontend Transport; Tue, 28 Feb 2023 16:49:19 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Tue, 28 Feb 2023 16:49:19 +0000
Received: from 5fb067a7ef68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6319A176-F549-4FE4-A27D-799A6F26BEB1.1; 
 Tue, 28 Feb 2023 16:49:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fb067a7ef68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Feb 2023 16:49:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS1PR08MB7588.eurprd08.prod.outlook.com (2603:10a6:20b:474::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 16:48:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:48:55 +0000
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
X-Inumbo-ID: ea8c6e78-b787-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/NC5urKF4GTsjw31+ZGs/Y9+76iPzb6eBC0Bz3PnOM=;
 b=EU8q/nnX0lHQQ4j0cdbirkp8LOm8XExRt76ILC/yZXEy1dvbnVlNlDCVUhb1n3RQNlPWR+HOFcQRhD2Z4BWpcc90J2WF89bAjK05ZYQLKQfWNCq8BjxZNjPOl3Khi0+fKRIE7kQ+4D7EVq/dDIt3j3nm0VHtXK87SVoE99ZkT6A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81fba1af3e5acb44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSiV17bQgwZzil3nRq5hmRfWaUyLPXWru0bxfRKj1DOfig2uEeCw8TAdNKaeBIk8+0BsikB6+kzopzuietP1BL7HvwfhvIFlvP1YmEB7Yr8nHxyGz+w4uSFvF7gDbGrzxFOKrTayC4XjBxndw8Aq2HR3N6ubDQnI2+9Fa80eAHgwSCKPM5VokPAUZGaGh4byyt3jbpg9HFhcIGLQFdnxkjQol6qZc1ZdCQzI8BKN5m88CkB5eX8MSBft37084Ly4Ez82D3VSoa6M7HvKP4OOXh39xGBnfcyc3rvKlmgjzRU7oLS3fNGr1dMrh5E4qWkH+9Wk8igvzjm8b2q/ytYlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/NC5urKF4GTsjw31+ZGs/Y9+76iPzb6eBC0Bz3PnOM=;
 b=ZMPzA5eEEP5SEtgyspV5x2ODTeezWTAm6Cn44yDnwCGk2tt7q+xWl9MHB7jeBukfyyw2GFlPP9hCQtNsfjzN+T7ZdAyaCndhKlIOKsgdn2c8U0b4IR4e5Un2U/iB4XI+PUPBeDuUgYI9luxDs0HJiRUxiQjbEBlcNSsx5lNUzeZ31z6Z1AKlBzXYpTXbeYDx9bEkg0qJ92MT/qs3Kw4EPgA7kYlf+kPYYz2RL57+fShJb4S2HXYPncT6VuOOtbnsGbXFjNVpj0R9cE3nAT/djmELZ5V+F7EIrWF7AYP3mw2DOyb7gqasIb5bk/ipHZQ5n9v8SM+xvUOfceT0BtHlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/NC5urKF4GTsjw31+ZGs/Y9+76iPzb6eBC0Bz3PnOM=;
 b=EU8q/nnX0lHQQ4j0cdbirkp8LOm8XExRt76ILC/yZXEy1dvbnVlNlDCVUhb1n3RQNlPWR+HOFcQRhD2Z4BWpcc90J2WF89bAjK05ZYQLKQfWNCq8BjxZNjPOl3Khi0+fKRIE7kQ+4D7EVq/dDIt3j3nm0VHtXK87SVoE99ZkT6A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZRtMbJTLQExtpBE6ThIQepjPcla7km2EA
Date: Tue, 28 Feb 2023 16:48:52 +0000
Message-ID: <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS1PR08MB7588:EE_|AM7EUR03FT005:EE_|AS8PR08MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd045d3-74a4-4415-1b48-08db19abbc86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lhnESxdzxHd/STIV+VF1H9qflEwE49eQSp1IpFkBzf057bwQlDMtE3Vf32pXHDgQ84zVWJ7JJ8p6N8ThUugCoL/5ntFvQH4T5pDPZ7PYEo0Qm83sjxnoU/hum406+8zVEE0cMsPWOVKDd3OPlYodjxv0adJP9cLYDpb0KvmlwTBz79EQ7jk56Zv1ug0cYhKoq/FYUxhlAjA0Z1phzuhdz1sFh/MaN1KM0D30CWVIUX6VRa/HEFTWm3ZQVXI6AI44sQ3IVyUKgwZ8XJtSFwXGaM95XQOXEz7G1SkHWR7sRdYdhZSDiN0E0HMd+waDrTOPQKtk+Ip1g+RqkdnOrQhWcyqJqQlOI+7fyCLLu5k2u0Ade+sQ31Ve8HPrn0YRR/5jK+Q+RXsYQaQe9AZvBE9KkCAv4Iqy50n5gM4rcXXNwJmY5txudcvcMJLFz5TBdUQi+d9vhdyyVYUaG25MWDR9d/fDj3dllbeTEb/Xcs41/YPcXCf9mERZMjobIHSnFLLmXbw+dZ4ZMJil7nEOMAHmz+7DBc2In3mTo+IwgjMQRPIGA6xPHs+Irfxh+h+nDAyWFwA246WM6mv+W7W5FgyBz0+Djs297sipVP+kfR0144slHswAhl55brairLmIMSkI8O0NB+QEsC6V3GjWQfl30UcM0tronNnSM1AU6GBFE4TeZfCeFxpzNJBvmVyBF2gquHjcCkJ6h72Ko66UWyXP+tt4h3uqBVIxVSAq5dsQODg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199018)(8936002)(36756003)(5660300002)(2906002)(41300700001)(6916009)(4326008)(2616005)(66556008)(76116006)(66446008)(66476007)(64756008)(8676002)(66946007)(86362001)(54906003)(316002)(91956017)(33656002)(6486002)(478600001)(6506007)(186003)(26005)(71200400001)(6666004)(6512007)(53546011)(38070700005)(83380400001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43D7C54B24131546B6316473AFF84135@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df473e13-8595-42d6-8b68-08db19abac90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AfBAOEPKqHDVHXBbm1a5s9nqCWk/KD/JwJK92L09UcRj1mxJ7G0rO6y8YTZEa5NfWCQe065ySiUDwhDC6ESO0d19IGjgwI1d6u4fMkOcEqDwYcP0tljAL6A5Gkhdo+I6Dko8nOuNw6rMi+jjHcUYcWF904J/1wrtjZz9lwBtQVdswFsiJO4rDEOWDiBDpAZ8CJIjSevBYANmDwy1mWMCj4VAippdzmYv67p26ii6XxsMtz2wBR5dqVp35arYMqaaAKJlsOpm78R+SaEcw3jAryTFTAERDaRJhJUjkyPtQCXG9n4PpB6ak0QU5jmC2G4x2uAnbdDG1kEX3+D1/W04qaOwd8MKqAppfo4VZy75ASO6JMkqhj1mymTcNNvppiHac3+lnCnfPv1Gu91e1ofE11zrR4N3HF25Bvxhamo4v7GuXLMLO0ZGXUQj35qSKuGaBKdIANkFeWoGd1kEMa6EZFXTBsziWkp6SIVM+z6KKTAM/eBAjmaS+ZHxPS2d87wMdjNvlunhoZVigQA8t98pysPGou/WiSnQuWgk/j2SKRRy1PXIu9BbtdvUs4gqXxqaXuDhiUxSes+8AUVVnZ98eOP2sc/muzQR3zvCaKHVImLvlkzThDvt5KwO5w7WGpse1FPohtZMm006Dd+lRxXwyXeU3MptG1AjVKT8m8gyytGEHvi3rPFvdQ4h/4FNPb93LYrYa1qX6A+4AhiiHygBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(6512007)(186003)(26005)(53546011)(6506007)(336012)(2616005)(47076005)(2906002)(478600001)(82310400005)(83380400001)(54906003)(6666004)(36860700001)(316002)(82740400003)(81166007)(4326008)(70206006)(70586007)(36756003)(8676002)(356005)(41300700001)(40480700001)(40460700003)(86362001)(8936002)(6862004)(6486002)(5660300002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:49:19.5283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd045d3-74a4-4415-1b48-08db19abbc86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> The FF-A specification defines framework messages sent as direct
> requests when certain events occurs. For instance when a VM (guest) is
> created or destroyed. Only SPs which have subscribed to these events
> will receive them. An SP can subscribe to these messages in its
> partition properties.
>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
>=20
> The partition properties of each SP is retrieved with
> FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> caller (us), so once we're done with the buffer it must be released
> using FFA_RX_RELEASE before another call can be made.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 190 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 07dd5c36d54b..f1b014b6c7f4 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -140,6 +140,14 @@
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> +/* Partition information descriptor */
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> struct ffa_ctx {
>     uint32_t guest_vers;
>     bool interrupted;
> @@ -148,6 +156,12 @@ struct ffa_ctx {
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> +static uint16_t *subscr_vm_created __read_mostly;
> +static unsigned int subscr_vm_created_count __read_mostly;

In the spec the number is returned in w2 so you should utse uint32_t here.

> +static uint16_t *subscr_vm_destroyed __read_mostly;
> +static unsigned int subscr_vm_destroyed_count __read_mostly;

Same here

> +
> /*
>  * Our rx/tx buffers shared with the SPMC.
>  *
> @@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, regi=
ster_t rx_addr,
>     return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
> }
>=20
> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> +                                      uint32_t w4, uint32_t w5,
> +                                      uint32_t *count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_PARTITION_INFO_GET,
> +        .a1 =3D w1,
> +        .a2 =3D w2,
> +        .a3 =3D w3,
> +        .a4 =3D w4,
> +        .a5 =3D w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    uint32_t ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    ret =3D get_ffa_ret_code(&resp);
> +    if ( !ret )
> +        *count =3D resp.a2;
> +
> +    return ret;
> +}
> +
> +static int32_t ffa_rx_release(void)
> +{
> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)

This function is actually only useable to send framework created/destroyed
messages so the function name should be adapted to be less generic.

ffa_send_vm_events ?

unless you want to modify it later to send more framework messages ?

> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    int32_t res;
> +
> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> +    else
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 =3D sp_id,
> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 =3D vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp )
> +        {
> +            /*
> +             * This is an invalid response, likely due to some error in =
the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res =3D resp.a3;
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );

We might end up in an infinite loop here or increase interrupt response tim=
e.
In the general case we could return that code directly to the VM but here w=
e
are in the VM creation/destroy path so we cannot do that.

Maybe in debug mode at least we should have a retry counter here for now
with a print ?

> +
> +    return res;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> +    unsigned int n;
> +    unsigned int m;
> +    unsigned int c_pos;
> +    int32_t res;
>=20
>      /*
>       * We can't use that last possible domain ID or get_vm_id() would ca=
use
> @@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
>     if ( !ctx )
>         return -ENOMEM;
>=20
> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d=
),
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> +                   get_vm_id(d), subscr_vm_created[n], res);

in this function, get_vm_id(d) will not change so i would suggest to store =
it in a local variable
instead of calling get_vm_id each time.

> +            c_pos =3D n;
> +            goto err;
> +        }
> +    }
> +
>     d->arch.tee =3D ctx;
>=20
>     return 0;
> +
> +err:
> +    /* Undo any already sent vm created messaged */
> +    for ( n =3D 0; n < c_pos; n++ )
> +        for ( m =3D 0; m < subscr_vm_destroyed_count; m++ )
> +            if ( subscr_vm_destroyed[m] =3D=3D subscr_vm_created[n] )
> +                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                       FFA_MSG_SEND_VM_DESTROYED);
> +
> +    return -ENOMEM;

The VM creation is not failing due to missing memory here.
We need to find a better error code.
Maybe ENOTCONN ?
I am open to ideas here :-)

> }
>=20
> /* This function is supposed to undo what ffa_domain_init() has done */
> static int ffa_relinquish_resources(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int n;
> +    int32_t res;
>=20
>     if ( !ctx )
>         return 0;
>=20
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
> +    }
> +
>     XFREE(d->arch.tee);
>=20
>     return 0;
> }
>=20
> +static bool init_subscribers(void)
> +{
> +    struct ffa_partition_info_1_1 *fpi;
> +    bool ret =3D false;
> +    uint32_t count;
> +    int e;
> +    uint32_t n;
> +    uint32_t c_pos;
> +    uint32_t d_pos;
> +
> +    if ( ffa_version < FFA_VERSION_1_1 )
> +        return true;

Correct me if i am wrong but on 1.0 version we cannot retrieve the count bu=
t
we could do the slow path and do a first loop on info_get until we get an e=
rror ?

> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> +        goto out;
> +    }
> +
> +    fpi =3D ffa_rx;
> +    subscr_vm_created_count =3D 0;
> +    subscr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subscr_vm_created_count++;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subscr_vm_destroyed_count++;
> +    }
> +
> +    if ( subscr_vm_created_count )
> +        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_created_=
count);
> +    if ( subscr_vm_destroyed_count )
> +        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> +                                            subscr_vm_destroyed_count);
> +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> +        subscr_vm_created_count =3D 0;
> +        subscr_vm_destroyed_count =3D 0;
> +        XFREE(subscr_vm_created);
> +        XFREE(subscr_vm_destroyed);
> +        goto out;
> +    }
> +
> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created[c_pos++] =3D fpi[n].id;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +    }
> +
> +    ret =3D true;
> +out:
> +    ffa_rx_release();
> +
> +    return ret;
> +}
> +
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> @@ -447,7 +628,8 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>            major_vers, minor_vers);
>=20
> -    if (
> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
> #ifdef CONFIG_ARM_64
>          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> #endif
> @@ -475,6 +657,9 @@ static bool ffa_probe(void)
>     ffa_page_count =3D 1;
>     ffa_version =3D vers;
>=20
> +    if ( !init_subscribers() )
> +        goto err_free_ffa_tx;
> +
>     return true;
>=20
> err_free_ffa_tx:
> @@ -485,6 +670,10 @@ err_free_ffa_rx:
>     ffa_rx =3D NULL;
>     ffa_page_count =3D 0;
>     ffa_version =3D 0;
> +    XFREE(subscr_vm_created);
> +    subscr_vm_created_count =3D 0;
> +    XFREE(subscr_vm_destroyed);
> +    subscr_vm_destroyed_count =3D 0;
>=20
>     return false;
> }
> --=20
> 2.34.1
>=20

Cheers
Bertrand



