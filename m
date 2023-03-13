Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063946B7183
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509160.784444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdsF-0001SS-Na; Mon, 13 Mar 2023 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509160.784444; Mon, 13 Mar 2023 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdsF-0001Pv-KO; Mon, 13 Mar 2023 08:49:43 +0000
Received: by outflank-mailman (input) for mailman id 509160;
 Mon, 13 Mar 2023 08:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++h+=7F=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pbdsD-0001Pm-T6
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:49:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe607a61-c17b-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:49:41 +0100 (CET)
Received: from AS9PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:20b:46b::14)
 by VE1PR08MB5582.eurprd08.prod.outlook.com (2603:10a6:800:1a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:49:30 +0000
Received: from VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::32) by AS9PR07CA0055.outlook.office365.com
 (2603:10a6:20b:46b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 08:49:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT033.mail.protection.outlook.com (100.127.144.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 08:49:29 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Mon, 13 Mar 2023 08:49:29 +0000
Received: from 125f4fce1cc1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 464801A1-1A0E-41C7-BB70-D837BD31DD11.1; 
 Mon, 13 Mar 2023 08:49:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 125f4fce1cc1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Mar 2023 08:49:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6602.eurprd08.prod.outlook.com (2603:10a6:10:23c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:49:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:49:13 +0000
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
X-Inumbo-ID: fe607a61-c17b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RzleV0qgxboXSZxbMZvRoTcurtiuoi4SeRF+c2QPu8=;
 b=A58sdklqtmRRXGMYvRBm7NuPSJoZIrwNJf0+lCRH+q3Of0hRMW7ZsfKu5lyU+nw9X8+lArCh0Y9+GeTESAMtU1C5u6hjXOUmkpx9pblS3FNQ3FFWp+VN1D7qlyxQFWDqFXQE7Wxwh1VtjyJLk1CvAJw8DYBZyGLjh4AIBdHEQm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9a3c966f2c9db19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j09GtpQ79ArcofIyGQdkX36eux9xRKZk1MB9Z/Uz+OtF/5muRuBaBCLlaKQJOcvXVpgMX2zVQRoxrccXo3dsad+65Rysii8AN5yShQ+WGX8ybMplLJdxDnwh+5TiV2KiEGXf10p9aQUjYGvSRmQkCecYNV50uZNG/MYJW3WPAukBmwt0TLWBeavjAnO2zFF0wo/EWHPRv9BwSjomg7Jz6bnNHCFlpz2mKU8cx7E/034Csrqi4saRVih+mWtmQpAhJo6MxOOo/QYuosOie4ErXJZNJNmPzw+xBAUViub+JlaaMfHS5MfTUlMuZWKhOhTeLcOCYJx6M3xZrXAmbF24/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RzleV0qgxboXSZxbMZvRoTcurtiuoi4SeRF+c2QPu8=;
 b=RFR7sv7SkjbKa0L97vzeA7+O3ak9aqFZmKMJhFKKJ6jZ/n2aovWjECf6msRMucj0s4lpjwY+8h/YEk+vDhLcoNRfRmqlB8MXFqFLiM/QaemrGpuiv5pfkhgao+/JedMXyYzIAQaG9dwj/F9fgcQGlWnALFMZ/w61JXp28wuUZBmZS2y4ijFI+ion1N1Fod2Dy4c8CJDYv0g5SNw9ScDX07b8eCCFEKJMSmANRGQKze2a3hD1LRMbasiktinT8PQJDrUDhr4E4EPfqigSbGQl+ULpp0jYypJ2NFOV9j+CkR473tYXDyb5qbgRx/nraU7pEo3sKRj2iThiJuaL37/e1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RzleV0qgxboXSZxbMZvRoTcurtiuoi4SeRF+c2QPu8=;
 b=A58sdklqtmRRXGMYvRBm7NuPSJoZIrwNJf0+lCRH+q3Of0hRMW7ZsfKu5lyU+nw9X8+lArCh0Y9+GeTESAMtU1C5u6hjXOUmkpx9pblS3FNQ3FFWp+VN1D7qlyxQFWDqFXQE7Wxwh1VtjyJLk1CvAJw8DYBZyGLjh4AIBdHEQm4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 18/20] xen/arm: ffa: support sharing memory
Thread-Topic: [XEN PATCH v7 18/20] xen/arm: ffa: support sharing memory
Thread-Index: AQHZRtMh5yiB/qS3PEuFaSIvG3USOK74g6sA
Date: Mon, 13 Mar 2023 08:49:12 +0000
Message-ID: <CC630914-0816-40F9-B33C-86EC4E3B4BE6@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <fdca8effb1c2c209fd9d15c90360196fa67a845c.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <fdca8effb1c2c209fd9d15c90360196fa67a845c.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6602:EE_|VI1EUR03FT033:EE_|VE1PR08MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9d7f60-a5d0-458b-c354-08db239fdbae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cMPWk+liQdEM8++x+bMVfvgRIoF654ScQguo86ZWRIJhs7SUI5sy0ZK4vFPTqQDOT3edjjMNsqqsOuFN5UcvcTRybjjc+7D/kDhUTb2U5pclCdzgrMLr1CoLpVhZH+2AHsWxsDr3FH/ZwdtblfY1kl69f/XKp+2L+fiQI/U7t/uI7XGH6OfBqnUGr7AKqZ5NRGlwiBdRTZ61gBgC9bILOHu8RtOHA6e5oamkSJ6nTqvWkw3/VvtC3EDBBVFVKWHR4cwIrOM+0eIxeXxBkn2DLtSJXoRqbRF5pPCA5mUY14Rm/OAqahZ8rg7PpF/t+cHiMtJlftAhXmtNm1o3mDyT8xD3pmeukLyV+pXT+pRZij1EmJ51XVQr2Te40g9KtetiNo5ZUJGsxqMxE6qcwEG6TUaem5iaElGndG9NZ7tvZz4G+bYlPUTszDkFTeciREFvzbkqeeuesqiy/VY0/7LYTA04IxcPMTbbE1sg2e29TEL86/jdlAM8ocLkGBk1yT3IlNaQLd6F046cxyRtZKqLMMvGREzyuECnr38zSSiJ0/8L6lgP/eJWjOszNNaNnf+9H5PhmVVyebgvOTDst8EzkgbtpA8ULByPvm3RhgC+hKV9W2wM/0I++PhpzL63n5/0TJUNwRFiPhvcJYGfpHEt/hu540SO4GLSklnlH6AoZbmTu4xYV+tBKGYdH9HOVfARGDTZ0D7dND+3ENsU4lzpZmTk/fANwEjScCUAI2BeSCQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(122000001)(2906002)(83380400001)(36756003)(30864003)(5660300002)(33656002)(76116006)(66446008)(64756008)(66476007)(66946007)(8936002)(41300700001)(6916009)(38070700005)(8676002)(4326008)(91956017)(38100700002)(54906003)(86362001)(316002)(478600001)(66556008)(186003)(53546011)(2616005)(6506007)(71200400001)(6512007)(966005)(6486002)(45980500001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FB2230259E8EF4FB1E4AFC30596AFE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6602
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	caec014e-c138-495f-1a4e-08db239fd18b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dxkG/XjJ66YtaKO4ofCi3vitE0qYEQ58RUcnW50rKznTnAXAXBRehsrRfeasEBzVDz4FoUmnQDVHQFXBZEOoAmFGveHF5Tc3es78wJcJ2SAShJq5vmxDagYbls7DxdPrOnycwiKhIcDZJUDOUX1+deuVKXAb6GB42wbpeDN6HU+jDrkjO4/8z7vhaj1P10odzrqviYbWqS5/gvhJR5fd1JJ//KAh+hGr5DrsskYE6Iwd8QnWgX+OMTJ4tbNl9YReKediHJF2PPxeOuZw3Z37d0jEAaUq1wA7eIda4MIunuxCGfbI8R+CaaL6/qUhVQhEoYD4OFaX3hltIO4rxE2pYnUBglRCwHMEUEXt9P0sLQIuH+8A6rsGZl70rWdaq3SC8EKm93EA8p76Yomau2Cz/VHW5lhzxNR3WBauYnP8SgR6ODx6TopdSfhJeCweEgroCoN0HcJ/R1YjH/Gf/NnuA8r1IGhET1INtOEIJWj39cGbDkLPTNAZ41Cq3NS4E0YF/CsXyFKOD0d1W0bBJjPK8W/kCIaC67+toyRWch7HvVNCK/yZjNXCLPHEnrmZ6/vBOsYn+Oi1W34HXCcEsi7BYTRz1HU88ggqLyZaX6et6e6jhz2N7vwKLLeQUlHyUcQEPm+8vZ1qWHKGNSqMBWModBA1h4DI3YJokDKXuHKfGjQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(46966006)(36756003)(5660300002)(30864003)(54906003)(83380400001)(478600001)(82310400005)(186003)(47076005)(6512007)(966005)(6506007)(26005)(6486002)(53546011)(2616005)(336012)(356005)(33656002)(4326008)(70586007)(70206006)(40480700001)(41300700001)(6862004)(8936002)(86362001)(316002)(8676002)(36860700001)(81166007)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 08:49:29.4086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9d7f60-a5d0-458b-c354-08db239fdbae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for a guest to share memory with an SP using FFA_MEM_SHARE
> and FFA_MEM_RECLAIM. Only small memory regions can be shared using a
> single call to FFA_MEM_SHARE are supported.

This sentence needs a bit of rephrasing and to add more details: what is "s=
mall".

>=20
> A memory region that doesn't need to be shared any longer can be
> reclaimed with FFA_MEM_RECLAIM once the SP doesn't use it any longer.
> This is checked by the SPMC and not in control of the mediator.

This explanation would make more sense in the following patch adding suppor=
t
 for Reclaim.

>=20
> With this commit we have a FF-A version 1.1 [1] mediator able to
> communicate with a Secure Partition in secure world using shared memory.
> The secure world must use FF-A version 1.1, but the guest is free to use
> version 1.0 or version 1.1.

I do not see anything limiting that in the code.
During init we accept 1.0 or 1.1 versions of the secure world.

>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_MEM_SHARE_64 or FFA_MEM_SHARE_32.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 491 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 491 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 94c90b252454..cdc286caf62c 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -270,6 +270,38 @@ struct ffa_mem_transaction_1_1 {
>     uint8_t reserved[12];
> };
>=20
> +/* Calculate offset of struct ffa_mem_access from start of buffer */
> +#define MEM_ACCESS_OFFSET(access_idx) \
> +    ( sizeof(struct ffa_mem_transaction_1_1) + \
> +      ( access_idx ) * sizeof(struct ffa_mem_access) )
> +
> +/* Calculate offset of struct ffa_mem_region from start of buffer */
> +#define REGION_OFFSET(access_count, region_idx) \
> +    ( MEM_ACCESS_OFFSET(access_count) + \
> +      ( region_idx ) * sizeof(struct ffa_mem_region) )
> +
> +/* Calculate offset of struct ffa_address_range from start of buffer */
> +#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
> +    ( REGION_OFFSET(access_count, region_count) + \
> +      ( range_idx ) * sizeof(struct ffa_address_range) )
> +
> +/*
> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> + * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> + * data structures between version 1.0 and 1.1. This is just an internal
> + * interface and can be changed without changing any ABI.
> + */
> +struct ffa_mem_transaction_x {

I would suggest to s/_x/_int/ in the name here

> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +};
> +
> /* Endpoint RX/TX descriptor */
> struct ffa_endpoint_rxtx_descriptor_1_0 {
>     uint16_t sender_id;
> @@ -294,8 +326,20 @@ struct ffa_ctx {
>     uint32_t guest_vers;
>     bool tx_is_mine;
>     bool interrupted;
> +    struct list_head shm_list;
> +    unsigned int shm_count;
>     spinlock_t lock;
> };
> +
> +struct ffa_shm_mem {
> +    struct list_head list;
> +    uint16_t sender_id;
> +    uint16_t ep_id;     /* endpoint, the one lending */
> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    unsigned int page_count;
> +    struct page_info *pages[];
> +};
> +
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> @@ -310,6 +354,8 @@ static unsigned int subscr_vm_destroyed_count __read_=
mostly;
>  *
>  * ffa_page_count is the number of pages used in each of these buffers.
>  *
> + * The TX buffer is protected from concurrent usage with ffa_tx_buffer_l=
ock.
> + *
>  * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lo=
ck.
>  * Note that the SPMC is also tracking the ownership of our RX buffer so
>  * for calls which uses our RX buffer to deliver a result we must call
> @@ -319,6 +365,7 @@ static void *ffa_rx __read_mostly;
> static void *ffa_tx __read_mostly;
> static unsigned int ffa_page_count __read_mostly;
> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> +static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> static bool ffa_get_version(uint32_t *vers)
> {
> @@ -429,6 +476,42 @@ static int32_t ffa_rx_release(void)
>     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> }
>=20
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_SHARE_32,
> +        .a1 =3D tot_len,
> +        .a2 =3D frag_len,
> +        .a3 =3D addr,
> +        .a4 =3D pg_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    if ( IS_ENABLED(CONFIG_ARM_64) )
> +        arg.a0 =3D FFA_MEM_SHARE_64;
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
> +        *handle =3D regpair_to_uint64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle =3D regpair_to_uint64(resp.a2, resp.a1);
> +        return resp.a3;

You are using an int32_t type to cast something that is uint32_t from the s=
pec
and here could in fact be a uint64_t.


> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                       uint8_t msg)
> {
> @@ -757,6 +840,404 @@ out:
>              resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & ma=
sk);
> }
>=20
> +/*
> + * Gets all page and assigns them to the supplied shared memory object. =
If
> + * this function fails then the caller is still expected to call
> + * put_shm_pages() as a cleanup.
> + */
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         const struct ffa_address_range *range,
> +                         uint32_t range_count, unsigned int start_page_i=
dx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx =3D start_page_idx;
> +    gfn_t gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +
> +    for ( n =3D 0; n < range_count; n++ )
> +    {
> +        for ( m =3D 0; m < range[n].page_count; m++ )
> +        {
> +            if ( pg_idx >=3D shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            addr =3D read_atomic(&range[n].address);
> +            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
> +   P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            pg_idx++;

This increment could be done at the end, why here ?

> +            /* Only normal RAM for now */
> +            if ( !p2m_is_ram(t) )
> +                return FFA_RET_DENIED;
> +        }
> +    }
> +
> +    *last_page_idx =3D pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        put_page(shm->pages[n]);
> +        shm->pages[n] =3D NULL;

If an error occured during the generation you might have part
of the pages which are NULL already.

So you should do a if (pages[n] !=3D NULL) here

> +    }
> +}
> +
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> +                                             unsigned int page_count)
> +{
> +    struct ffa_shm_mem *shm;
> +
> +    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT ||
> +         ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> +        return NULL;

Shouldn't you also filter out for page_count =3D 0 ?

> +
> +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( shm )
> +    {
> +        ctx->shm_count++;
> +        shm->page_count =3D page_count;
> +    }
> +
> +    return shm;
> +}
> +
> +static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *sh=
m)
> +{
> +    if ( shm ) {
> +        ASSERT(ctx->shm_count > 0);
> +        ctx->shm_count--;
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +}
> +
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa)
> +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address =3D pa;
> +    addr_range->page_count =3D 1;
> +}
> +
> +/*
> + * This function uses the ffa_tx buffer to transmit the memory transacti=
on
> + * descriptor. The function depends ffa_tx_buffer_lock to be used to gua=
rd
> + * the buffer from concurrent use.
> + */
> +static int share_shm(struct ffa_shm_mem *shm)
> +{
> +    const uint32_t max_frag_len =3D ffa_page_count * FFA_PAGE_SIZE;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_transaction_1_1 *descr;
> +    struct ffa_address_range *addr_range;
> +    struct ffa_mem_region *region_descr;
> +    const unsigned int region_count =3D 1;
> +    void *buf =3D ffa_tx;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    paddr_t pa;
> +
> +    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> +    if ( !shm->page_count )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return FFA_RET_INVALID_PARAMETERS;

page_count =3D 0 should be filtered out before reaching this and this shoul=
d
only be an assert if you want but no unreachable with a return.

> +    }
> +
> +    descr =3D buf;
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id =3D shm->sender_id;
> +    descr->global_handle =3D shm->handle;
> +    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count =3D 1;
> +    descr->mem_access_size =3D sizeof(*mem_access_array);
> +    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> +
> +    mem_access_array =3D buf + descr->mem_access_offs;
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> +    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_access_=
count, 0);
> +
> +    region_descr =3D buf + mem_access_array[0].region_offs;
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count =3D shm->page_count;
> +
> +    region_descr->address_range_count =3D 1;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> +            continue;
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
> +                                region_descr->address_range_count);
> +    if ( tot_len > max_frag_len )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    addr_range =3D region_descr->address_range_array;
> +    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        frag_len +=3D sizeof(*addr_range);
> +        addr_range++;
> +        init_range(addr_range, pa);
> +    }
> +
> +    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size=
_t blen,
> +                                struct ffa_mem_transaction_x *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if ( ffa_vers >=3D FFA_VERSION_1_1 )
> +    {
> +        const struct ffa_mem_transaction_1_1 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D descr->sender_id;
> +        mem_reg_attr =3D descr->mem_reg_attr;
> +        flags =3D descr->flags;
> +        trans->global_handle =3D descr->global_handle;
> +        trans->tag =3D descr->tag;
> +
> +        count =3D descr->mem_access_count;
> +        size =3D descr->mem_access_size;
> +        offs =3D descr->mem_access_offs;
> +    }
> +    else
> +    {
> +        const struct ffa_mem_transaction_1_0 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D descr->sender_id;
> +        mem_reg_attr =3D descr->mem_reg_attr;
> +        flags =3D descr->flags;
> +        trans->global_handle =3D descr->global_handle;
> +        trans->tag =3D descr->tag;
> +
> +        count =3D descr->mem_access_count;
> +        size =3D sizeof(struct ffa_mem_access);
> +        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access_arr=
ay);
> +    }
> +    /*
> +     * Make sure that "descr" which is shared with the guest isn't acces=
sed
> +     * again after this point.
> +     */
> +    barrier();

I am not really following the comment here. You accessed the content of des=
cr
before and it is in the rxtx buffer so why is this needed ?

> +
> +    /*
> +     * We're doing a rough check to see that no information is lost when
> +     * tranfering the values into a struct ffa_mem_transaction_x below. =
The
> +     * fields in struct ffa_mem_transaction_x are wide enough to hold an=
y
> +     * valid value so being out of range means that something is wrong.
> +     */
> +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_M=
AX ||
> +        count > UINT8_MAX || offs > UINT16_MAX )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if ( size * count + offs > blen )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr =3D mem_reg_attr;
> +    trans->flags =3D flags;
> +    trans->mem_access_size =3D size;
> +    trans->mem_access_count =3D count;
> +    trans->mem_access_offs =3D offs;
> +
> +    return 0;
> +}
> +
> +static void handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len =3D get_user_reg(regs, 1);
> +    uint32_t frag_len =3D get_user_reg(regs, 2);
> +    uint64_t addr =3D get_user_reg(regs, 3);
> +    uint32_t page_count =3D get_user_reg(regs, 4);
> +    const struct ffa_mem_region *region_descr;
> +    const struct ffa_mem_access *mem_access;
> +    struct ffa_mem_transaction_x trans;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm =3D NULL;
> +    unsigned int last_page_idx =3D 0;
> +    register_t handle_hi =3D 0;
> +    register_t handle_lo =3D 0;
> +    int ret =3D FFA_RET_DENIED;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.

Is this a limitation coming fomr the spec or from the implementation ?

> +     */
> +    if ( addr )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_set_ret;
> +    }
> +
> +    /* Check that fragment length doesn't exceed total length */
> +    if ( frag_len > tot_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_set_ret;
> +    }
> +
> +    /* We currently only support a single fragment */

It would make sense to add some text at the beginning of the files listing
the current limitations of the implementation.

> +    if ( frag_len !=3D tot_len )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_set_ret;
> +    }
> +
> +    spin_lock(&ctx->lock);
> +
> +    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> +        goto out_unlock;
> +
> +    if ( !ffa_page_count )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */

Also a limitation to list.

> +    if ( trans.mem_access_count !=3D 1 )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id !=3D get_vm_id(d) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> +        goto out_unlock;
> +

Why are you using atomic operations to access rxtx buffer after here ?

> +    mem_access =3D ctx->tx + trans.mem_access_offs;
> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)

Also a limitation to list.

> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs =3D read_atomic(&mem_access->region_offs);
> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr =3D ctx->tx + region_offs;
> +    range_count =3D read_atomic(&region_descr->address_range_count);
> +    page_count =3D read_atomic(&region_descr->total_page_count);
> +
> +    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> +    if ( !shm )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +    shm->sender_id =3D trans.sender_id;
> +    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if ( last_page_idx !=3D shm->page_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    spin_lock(&ffa_tx_buffer_lock);
> +    ret =3D share_shm(shm);
> +    spin_unlock(&ffa_tx_buffer_lock);
> +    if ( ret )
> +        goto out;
> +
> +    list_add_tail(&shm->list, &ctx->shm_list);
> +
> +    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret )
> +        free_ffa_shm_mem(ctx, shm);
> +out_unlock:
> +    spin_unlock(&ctx->lock);
> +
> +out_set_ret:
> +    if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -818,6 +1299,12 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
> #endif
>         handle_msg_send_direct_req(regs, fid);
>         return true;
> +    case FFA_MEM_SHARE_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MEM_SHARE_64:
> +#endif
> +        handle_mem_share(regs);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -857,6 +1344,8 @@ static int ffa_domain_init(struct domain *d)
>         }
>     }
>=20
> +    INIT_LIST_HEAD(&ctx->shm_list);
> +
>     d->arch.tee =3D ctx;
>=20
>     return 0;
> @@ -1012,11 +1501,13 @@ static bool ffa_probe(void)
>          !check_mandatory_feature(FFA_RX_RELEASE) ||
> #ifdef CONFIG_ARM_64
>          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> #endif
> #ifdef CONFIG_ARM_32
>          !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> #endif
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
>=20
> --=20
> 2.34.1


Cheers
Bertrand


