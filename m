Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB46A9954
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 15:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506040.779059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY6GY-0000jp-Rx; Fri, 03 Mar 2023 14:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506040.779059; Fri, 03 Mar 2023 14:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY6GY-0000hL-P3; Fri, 03 Mar 2023 14:20:10 +0000
Received: by outflank-mailman (input) for mailman id 506040;
 Fri, 03 Mar 2023 14:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY6GX-0000hF-4H
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 14:20:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e71e721-b9ce-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 15:20:06 +0100 (CET)
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by AS2PR08MB9593.eurprd08.prod.outlook.com
 (2603:10a6:20b:60b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Fri, 3 Mar
 2023 14:20:03 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::54) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 14:20:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 14:20:03 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Fri, 03 Mar 2023 14:20:03 +0000
Received: from fd5389dd0473.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 869A489C-9B68-496C-B7C8-060E43B4676D.1; 
 Fri, 03 Mar 2023 14:19:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd5389dd0473.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 14:19:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8979.eurprd08.prod.outlook.com (2603:10a6:10:467::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Fri, 3 Mar
 2023 14:19:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 14:19:49 +0000
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
X-Inumbo-ID: 7e71e721-b9ce-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/nfgQNE5RWrj8gL81hvAMn6diiT/LRPKm+I969EdfU=;
 b=NltBNjkikSvCpRjsY/iKsYX4XTCbdRr+/KeMLiQA6OCvKZ0NL06gIjo/B8XEAgNwCHPyiNwkeL/PMKFUgVX0DzXl+JikpflivyhjyRkN+ekaRkts3R2Hb/G1O47RS+VMZhL08kgLS2nU8yYWhJemQZpVP80TXQuuFrLIgH4Jt0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6ff7a58ae96db2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V13RQ9oBlXQTbS5QOZZFweUTCRXwoPjXC00t0nVNSwmE5WPr3RAeDJ25wdQ2bm7jmol38fjvA6vdBCH78F+w655kpL1YZje00P3AfMj1EAfbnCm3fhPbi9k7whsF8pSBLfzgpCvlCon634z8WMOkicrhvSb18eXmirGp+vCVmZck9tStv5rU59zV+qxQQz/oOMkA6lG3Lavtl7s82yd9ONFi+GPYMLKP+De/SPg++f0tGlo1IdEbSGijagrvD1WS/C74jtLKwQqx+4wgWBkB0BScII2gdK0SOfykqHDbc+qufj8B4Ea4Yij6Bsf67uvbjSFpkcs7ThsG061LBG676w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/nfgQNE5RWrj8gL81hvAMn6diiT/LRPKm+I969EdfU=;
 b=I1zsHZbwBH481l68OBGmUHCXq6927IkWH1IUEq89gC56WEMUptY99RCdPfA4fIXu6aUMU4rR/HjC19+to5+Pa7puAE4T0yT/u9q2nqg8GGPgT2y2/2BDXgsDQgOqtp+wsLrE1Q2QEFb57n5xVOdbOs1EheWSEfOV2q8IkXDd22LfBTGTpo+J8OpE42U1R35d4JwLt5UKv2gH8Yaq7cO+2i584IIs8Ej5KqQYQzSFoALx9p/VLqX3G18n4PBZWNxq+p/aSagpkzfs3E64nFzFePrXB3o7gNtr0i8IeUT1hvbAQaWkccbwxn9kMcwsnKcJfW6iDKi7GVaq7WIaYzHHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/nfgQNE5RWrj8gL81hvAMn6diiT/LRPKm+I969EdfU=;
 b=NltBNjkikSvCpRjsY/iKsYX4XTCbdRr+/KeMLiQA6OCvKZ0NL06gIjo/B8XEAgNwCHPyiNwkeL/PMKFUgVX0DzXl+JikpflivyhjyRkN+ekaRkts3R2Hb/G1O47RS+VMZhL08kgLS2nU8yYWhJemQZpVP80TXQuuFrLIgH4Jt0E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 17/20] xen/arm: ffa: add ABI structs for sharing
 memory
Thread-Topic: [XEN PATCH v7 17/20] xen/arm: ffa: add ABI structs for sharing
 memory
Thread-Index: AQHZRtMeHT5ldak5gkyWq0YjrVZrQ67pKLkA
Date: Fri, 3 Mar 2023 14:19:49 +0000
Message-ID: <171822A4-1150-4A35-94AD-52879B1B7EF0@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <50da283fe4a91820a818d13db4ce50fd8414580a.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <50da283fe4a91820a818d13db4ce50fd8414580a.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8979:EE_|DBAEUR03FT039:EE_|AS2PR08MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 027539c6-cfe3-4e41-8387-08db1bf26189
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fyr4lIMHxR3OMceae0Do9Cekoj0c+7LiLqpGj49F/4pdKwtOCZMKxZrhTmPUJtTjoexTWxW25/H4xypScSUFQAE8zovtg7C3rkHpwahEde70SJnl5KmhtNtGuxcaX7EtW8RKIfN2NJabbvC/RQA4l5CP2co9wNis3x7qD1kVyaFkwo7aAIo2PUFld9U2ZCUDj8rYy7L7pwj7QzqwQQgTbq4TL8hs/TxZUy0syi84sCVroPjvu7dLgp22EwsUeq+rpQpAaou4uWdvJbi09fa5RFLzQpKMWzXZ5HsbY+kS9RTCjPfIRxTY2vdZZ1KEG3ocJXucTeq/SyDe22+M7XWdw4wvR2x/pROrv3YPM3hs38x+ENvK7S0z5G+J0d1TVg7MVijW00+DqFxW5YWCUUCTvghJHU/L1r2AcUukrjxzbL9Lkuc13xZRBZP4r0lO/HqXyaZ3vyXM7RLqr/04Vh7FUrWUqMYgulnPnbRQplygFBy1YjtTctIiUBKnjCjIYPObgWutXdK/4cCCfo9EMo+1hq71hSUl6sO+oFQOCPEYbH2UUOeV+LGl6hcWtP8KP+0/w0jRVDgUEoEPPDmaCSPz8aVg9tx146Dzj+da44bS3I5uIuqomezNDS7hhw2QvTkX7wsrIP5NCait65gcmpZxM2S/XhuAyAPCHGYE1A6RynBulSj/DgwF7X+pTDfqVtKM084oL7Hppfc1HPAZqLzIdhbnIJ0AyLORBnxU03Uhhjc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199018)(6512007)(91956017)(66446008)(83380400001)(4326008)(8676002)(6916009)(66556008)(66476007)(64756008)(66946007)(86362001)(2616005)(38100700002)(122000001)(186003)(26005)(38070700005)(36756003)(54906003)(316002)(53546011)(76116006)(33656002)(71200400001)(6506007)(478600001)(6486002)(5660300002)(2906002)(41300700001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FE472E37426E4419699A9BAA3C01647@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8979
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5330dc3e-1a0b-4d74-6636-08db1bf258f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XzqHLXJFQYpxgNG7lPOF5F0e4rClXCfvKU/l0sCjirRCYBDQwWWyvT4NUyfOn3FTn7zcfdSPJ3Nj1hO1OXNlYQJG4Dtcmc8eEZSVMF9iQjzWdk6+PBsTRNjoBNloK2wCwr/95KLPRDqFvmH+Py0z/02yAoLW1NDcb/ZqA6hak+KyF8+FqO5ruPBD/RAspUJw9XZHaJoAo21Np9PjB2Y7QV4kFsiOOCEGZcfmSwE95SrGqfMuR8w6SIPr7sG21mysdST+YdMvXuS2VcVet6nlwC3Rvc1C54oYTLN1bvzZrpqJ1TUapEJV6ZsVZM4yyFjk2oXW++zsynpu6F4bvR5+ON35ZwT8VKDX5t3ATjEXYWZqsiV8fSMaEftn9hWZWNQPic931BsW7yufGUH96PSjzumKVZGrBo76eGeW4yhfXykoG6Pg0yxJ0eqqextHBdpUQzgMELvFC4Q1Sc+CGwHavNUKvJLDZWKY+QXzCVjdEFfAzvCBlFbJvLbVA+f267xptVhc/d1HqzYsP0vizD2iLi5wTGAJRDXeo09sCYD8OtDr0kvuI9X4tN6UVsXC5WiVakvhYiSoiHU8Bqcbv0D5rSmywk6p2w3d7pfrIN8ILO2v8BKusu4DLJAorF3inGBTnEI3lu4zvgeELpG/PYKPmSr1nkQQf7vStXZm/YoQxgJuVGpi54mSJQUexAmWQMgZbihU3wWnbEpma6d8UjN/CA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(336012)(47076005)(26005)(186003)(2616005)(6486002)(478600001)(316002)(83380400001)(54906003)(6506007)(6512007)(53546011)(70586007)(70206006)(4326008)(8676002)(6862004)(8936002)(41300700001)(36756003)(40460700003)(36860700001)(5660300002)(81166007)(2906002)(82310400005)(33656002)(356005)(86362001)(82740400003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:20:03.5494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027539c6-cfe3-4e41-8387-08db1bf26189
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9593

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds the ABI structs used by function FFA_MEM_SHARE and friends for
> sharing memory.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

All the structures are coherent with the spec.

Just one small question after but independent if you choose or not to chang=
e the names:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 74 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 74 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index bfd378f7fcd7..94c90b252454 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -197,6 +197,11 @@
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> +/*
> + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> + * struct ending with _1_1 are defined in FF-A-1.1-REL0.
> + */
> +
> /* Partition information descriptor */
> struct ffa_partition_info_1_0 {
>     uint16_t id;
> @@ -211,6 +216,75 @@ struct ffa_partition_info_1_1 {
>     uint8_t uuid[16];
> };
>=20
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
> +/* Memory access permissions descriptor */
> +struct ffa_mem_access_perm {
> +    uint16_t endpoint_id;
> +    uint8_t perm;
> +    uint8_t flags;
> +};
> +
> +/* Endpoint memory access descriptor */
> +struct ffa_mem_access {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint64_t reserved;
> +};
> +
> +/* Lend, donate or share memory transaction descriptor */
> +struct ffa_mem_transaction_1_0 {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t reserved0;
> +    uint32_t flags;
> +    uint64_t global_handle;

Why global ? spec is just saying handle.

> +    uint64_t tag;
> +    uint32_t reserved1;
> +    uint32_t mem_access_count;
> +    struct ffa_mem_access mem_access_array[];
> +};
> +
> +struct ffa_mem_transaction_1_1 {
> +    uint16_t sender_id;
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint64_t global_handle;

Same here

> +    uint64_t tag;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_count;
> +    uint32_t mem_access_offs;
> +    uint8_t reserved[12];
> +};
> +
> +/* Endpoint RX/TX descriptor */
> +struct ffa_endpoint_rxtx_descriptor_1_0 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_range_count;
> +    uint32_t tx_range_count;
> +};
> +
> +struct ffa_endpoint_rxtx_descriptor_1_1 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_region_offs;
> +    uint32_t tx_region_offs;
> +};
> +
> struct ffa_ctx {
>     void *rx;
>     const void *tx;
> --=20
> 2.34.1
>=20


