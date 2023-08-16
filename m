Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE377DD7E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584234.914723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD1K-0000Yz-CT; Wed, 16 Aug 2023 09:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584234.914723; Wed, 16 Aug 2023 09:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD1K-0000We-8w; Wed, 16 Aug 2023 09:40:54 +0000
Received: by outflank-mailman (input) for mailman id 584234;
 Wed, 16 Aug 2023 09:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWD1I-0000WY-Oy
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:40:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcf136dc-3c18-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:40:52 +0200 (CEST)
Received: from AS9PR06CA0704.eurprd06.prod.outlook.com (2603:10a6:20b:49f::14)
 by AM9PR08MB6740.eurprd08.prod.outlook.com (2603:10a6:20b:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:40:40 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::95) by AS9PR06CA0704.outlook.office365.com
 (2603:10a6:20b:49f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 09:40:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:40:39 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 16 Aug 2023 09:40:39 +0000
Received: from b8f675348c29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB34E375-6D3A-44CE-8AE7-FDAAFF1BB2AB.1; 
 Wed, 16 Aug 2023 09:40:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8f675348c29.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:40:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7995.eurprd08.prod.outlook.com (2603:10a6:10:3e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:40:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:40:29 +0000
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
X-Inumbo-ID: fcf136dc-3c18-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJjPQZ/kdxPeAestgRDsL/B1D5bOcRzwwJCMpHGrxCk=;
 b=WluaGG3xYOR/8Ys5BO8NT7FaHb95uGeIBl5np+AdrLIYdIK3mzcl2wnyR09qJXC2FYDOeQ6r7y1QbP6KgTuFV+cJBvPVeDBj1cRwOU1hJr7kFRqJh9OUt/Dkrd6VDptiYrJdcqRrmoiuWZb1ePinCwuTWP7L712OrUx0tH2QwPs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c70050ea396b8d8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLWSjzHlFBB5viPk5hdbffg7OXP7h6hthtKEd1TaWk9RjvLIqoCEOzmjeJ4eSf+kV5RkWW0GEkh/+jys1ZwHV0A3My9bfpqANH7CLqMYfwntRPhjWt1YStBJ/m+890CLoVvqZaxUEXplXhtWj+cKJUwmlhqrMuZ4LxVhcBRs+eEW5isp/xj6cQZxUPLg1NVenT0F1UGY2RvOjuYP8wZwOJgq77afiTyT97lfMcMUtGZ/OQWmGG01HxSDr/OokmSE/BcnMD+cjEdRC/+09IHEtXjCVDxziOHxCeSqoED5J6g7OQdsZD8bD1yybMpvdoou9aDRny3bnbKAheU5nCQAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJjPQZ/kdxPeAestgRDsL/B1D5bOcRzwwJCMpHGrxCk=;
 b=a/TR07fgqA8HnIpvdunaPHc05jh0dvAGzln7KTGfAqTrASS1RDdsU75f7M9ArNG8Oq8C5a28iGSjttULSbzkB6kbTteK8AfwSXE6WASrJyZeGZF/R7GsLjmW0M4XQ9FLkvBeL4CIMlCNqTpbOsiadljDLRM89nVu4Iueyn22iaqMSSMOtGcUCM1Cn420yDey2e6fysAeoJ8biBHhX6SoWBERIrxzdMdDEOVzM1YTzUqv3HPxybeZ3UJgZieHFCrUtOBBmI0tfcuwToV4O2T3axJeUIhDSCaE5lBlBoo1a8PEi4Wtwn5x3eC7vWwT5xp+ROkI86flyywgumqBpQqEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJjPQZ/kdxPeAestgRDsL/B1D5bOcRzwwJCMpHGrxCk=;
 b=WluaGG3xYOR/8Ys5BO8NT7FaHb95uGeIBl5np+AdrLIYdIK3mzcl2wnyR09qJXC2FYDOeQ6r7y1QbP6KgTuFV+cJBvPVeDBj1cRwOU1hJr7kFRqJh9OUt/Dkrd6VDptiYrJdcqRrmoiuWZb1ePinCwuTWP7L712OrUx0tH2QwPs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v11 03/14] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v11 03/14] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZw6jAfJC6fhyqoUCRDBGcOE/+m6/sxAWA
Date: Wed, 16 Aug 2023 09:40:29 +0000
Message-ID: <EF204A13-A736-4C20-BF4F-94B609F488F8@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-4-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-4-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7995:EE_|AM7EUR03FT006:EE_|AM9PR08MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 9557bc27-b77b-47b5-71b0-08db9e3cda3e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4a4bUFmwDKAC+3AqK8RvxoqrWC4yHhtttwy1jFdWVxoVSrlWC3iqSeak9Al4g9WxLe12kGDmjhzmS5zDkl4CFfgRKAQPCNit8tZjm9Pm5W30F+KKWQjwr9C8fwWt5r52KwJMQOgIZ4Pn3g2jEZp8rWL7pmdq1b0OtlLTz3wefoBxDySHmiILZWbc7MJALdQ6MyKs5tUx+8RQSfiNXGJM6zzz15UWqfGHaf+aN24O6To1YBQZtrIzI1Tu3i+CROu2xAOXqPWWgBjnqBIDjCkTH+zpq96C6xDtUDt6/Aj7NTCwQHTQTSuapViC7cxFWuDMFwU68IgXh5h0LERtcJW5qB2T5xk17Wsn1XPPiay+KPVNEaWty276hMu1FdOpDswTsWFCkcLEV6TwLnMEU/3jAKrJ5KBjUI+lqJ8gIVHDhYePJJC2t37TqAXpAUWFtwzBLBVvF8a8xfKpwAfXWRmg7dmpqmYx9PJxyI0IrXOD6fG3IPgKgRC+weTHgZZ6vJOTALGHDCVt7xyWoQziK5mTx8D2k7hhFUvtiXFgiAVbjs8/AX3vLm0zUi/6IYvMwTldAOli9zSQanip0BoVTYp5n2CS2P58+J3xVHBWslKSx0ZEnxq1y+6UnTjw+oZ+XhcIoQZiEfSOf+wRep8gYBiLCA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(66899024)(86362001)(478600001)(36756003)(2616005)(6486002)(6506007)(71200400001)(33656002)(6512007)(53546011)(5660300002)(41300700001)(122000001)(6916009)(316002)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(4326008)(8676002)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08773C338A57B34DBC9CFC8BC2C3BBB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1bc484c-7099-4465-4a4a-08db9e3cd3f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dYOXlJvtSakcXaIzXRoQ+S5Ak7yNa9A8F+cmiFC8rlxW5kk2W25h1XyMp36iBe8LfVCcX+tjsajTFhJehdyDXCtYQt2Uu6qlbuF2KYVqZvZnBUxwxOhMUZ6CH4xIXiLiCZGSBRfLtzl6fSK2IeYm+yR9vuLe5s+HpjHNL2Znq5ZND0CMWhS+sMt/GO2pWYYCvohps1A/hXkX2k9SA8lxK1vQf2cyeT3xZBjzGC2zGkIX2a1MCljZ0qcAwpS0oi6xMpLEShy7OGSvNY0nsK7Nj2DBEgTO1k2iS8sTbx4RsSw2lxYoMDZ6McYGPFzRhmeSUAaWClcaw6d8quMRp45eyJK9uR+kgo6rtSBjU+fOfjUL33ZeCCgUrP4UK+pBbnP0C/BQxuhfjan/cM0peyqUsiuLLxi08gfJzJhOwi2qK81qXDL4Hss0vK5WcVl3+TZhKaM3TYsruKsKqZEOe6+nW0X6P7UudLwaM+2nNhUWtnz+VquxHDFgo2IWfoFwX6XJeHk6f23a0Hc47nom5QTa1ICt4HV6RFnCvnK4qOQ0R4Yxe+oemC/khJhscvyS2NRl8waXD0Dsh6X/CzTaUfsSevnXf868Sm51mGczrLxsMAJJ5Ck+wg63sAjYtCQPPnEuUItiiWogmtD1WmFGHZ2ka6H8Fwxg6733G9mkLCWWAcMRL5y6N7sgC2I8ZsSvGzSK0UiCEg72MfB9ex9aqSAaRZIXRCag2PU17sBEg2K9PSpf0SSfCCs1TSiNQFb/wmGI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(83380400001)(66899024)(86362001)(478600001)(40480700001)(336012)(36756003)(2616005)(6486002)(6506007)(33656002)(6512007)(53546011)(26005)(5660300002)(41300700001)(36860700001)(82740400003)(316002)(54906003)(356005)(81166007)(70206006)(70586007)(4326008)(6862004)(8676002)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:40:39.9027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9557bc27-b77b-47b5-71b0-08db9e3cda3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6740

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
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

One NIT after which might be fixed on commit.

With that fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> v10->v11:
> - Addressing comments and fixing a few style issues
> - Fixing how is_in_subscr_list() is used, it's supposed to take an
>  sp_id, not a vm_id.
> ---
> xen/arch/arm/tee/ffa.c | 234 ++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 233 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 072198a1326d..5af3e5eedc88 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -160,14 +160,33 @@
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
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
> +    /*
> +     * Number of SPs that we have sent a VM created signal to, used in
> +     * ffa_domain_teardown() to know which SPs need to be signalled.
> +     */
> +    uint16_t create_signal_count;
> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> +static uint16_t *subscr_vm_created __read_mostly;
> +static uint16_t subscr_vm_created_count __read_mostly;
> +static uint16_t *subscr_vm_destroyed __read_mostly;
> +static uint16_t subscr_vm_destroyed_count __read_mostly;
> +
> /*
>  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
>  * number of pages used in each of these buffers.
> @@ -251,6 +270,87 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t=
 rx_addr,
>     return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count,=
 0);
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
> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    unsigned int retry_count =3D 0;
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
> +        if ( ++retry_count > 10 )
> +        {
> +            /*
> +             * TODO
> +             * FFA_RET_INTERRUPTED means that the SPMC has a pending
> +             * non-secure interrupt, we need a way of delivering that
> +             * non-secure interrupt.
> +             * FFA_RET_RETRY is the SP telling us that it's temporarily
> +             * blocked from handling the direct request, we need a gener=
ic
> +             * way to deal with this.
> +             * For now in both cases, give up after a few retries.
> +             */
> +            return res;
> +        }
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );
> +
> +    return res;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -374,6 +474,8 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> +    unsigned int n;
> +    int32_t res;
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> @@ -390,17 +492,68 @@ static int ffa_domain_init(struct domain *d)
>=20
>     d->arch.tee =3D ctx;
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
> +            ctx->create_signal_count =3D n;
> +            return -EIO;
> +        }
> +    }
> +    ctx->create_signal_count =3D subscr_vm_created_count;
> +
>     return 0;
> }
>=20
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t sp_id)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D start; n < end; n++ )
> +    {
> +        if ( subscr[n] =3D=3D sp_id )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> /* This function is supposed to undo what ffa_domain_init() has done */
> static int ffa_domain_teardown(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int n;
> +    int32_t res;
>=20
>     if ( !ctx )
>         return 0;
>=20
> +

NIT: this extra line should be removed.

@Julien: are you ok to fix that one on commit ?

> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_cou=
nt,
> +                               subscr_vm_created_count,
> +                               subscr_vm_destroyed[n]) )
> +            continue;
> +
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
> @@ -411,6 +564,81 @@ static int ffa_relinquish_resources(struct domain *d=
)
>     return 0;
> }
>=20
> +static void uninit_subscribers(void)
> +{
> +        subscr_vm_created_count =3D 0;
> +        subscr_vm_destroyed_count =3D 0;
> +        XFREE(subscr_vm_created);
> +        XFREE(subscr_vm_destroyed);
> +}
> +
> +static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_=
t count)
> +{
> +    uint16_t n;
> +    uint16_t c_pos;
> +    uint16_t d_pos;
> +
> +    subscr_vm_created_count =3D 0;
> +    subscr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created_count++;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
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
> +        uninit_subscribers();
> +        return false;
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
> +    return true;
> +}
> +
> +static bool init_sps(void)
> +{
> +    bool ret =3D false;
> +    uint32_t count;
> +    int e;
> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> +        goto out;
> +    }
> +
> +    if ( count >=3D UINT16_MAX )
> +    {
> +        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
> +        goto out;
> +    }
> +
> +    ret =3D init_subscribers(ffa_rx, count);
> +
> +out:
> +    ffa_rx_release();
> +
> +    return ret;
> +}
> +
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> @@ -462,7 +690,8 @@ static bool ffa_probe(void)
>      * TODO: Rework the code to allow domain to use a subset of the
>      * features supported.
>      */
> -    if (
> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
>          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> @@ -484,6 +713,9 @@ static bool ffa_probe(void)
>     }
>     ffa_version =3D vers;
>=20
> +    if ( !init_sps() )
> +        goto err_free_ffa_tx;
> +
>     return true;
>=20
> err_free_ffa_tx:
> --=20
> 2.34.1
>=20

Cheers
Bertrand



