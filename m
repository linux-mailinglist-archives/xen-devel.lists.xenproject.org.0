Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465667591C2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565695.884067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3cO-0007fN-D3; Wed, 19 Jul 2023 09:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565695.884067; Wed, 19 Jul 2023 09:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3cO-0007cd-AD; Wed, 19 Jul 2023 09:37:12 +0000
Received: by outflank-mailman (input) for mailman id 565695;
 Wed, 19 Jul 2023 09:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vNg=DF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qM3cM-0007cX-TP
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:37:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4618007-2617-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:37:09 +0200 (CEST)
Received: from DB9PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::35) by GVXPR08MB7896.eurprd08.prod.outlook.com
 (2603:10a6:150:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 09:37:03 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::98) by DB9PR01CA0030.outlook.office365.com
 (2603:10a6:10:1d8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24 via Frontend
 Transport; Wed, 19 Jul 2023 09:37:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Wed, 19 Jul 2023 09:37:03 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Wed, 19 Jul 2023 09:37:02 +0000
Received: from 15017465e4b6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81F5C6EE-87CB-404C-B5F7-B4ADE3DD70C4.1; 
 Wed, 19 Jul 2023 09:36:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15017465e4b6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jul 2023 09:36:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB3PR08MB8796.eurprd08.prod.outlook.com (2603:10a6:10:433::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 09:36:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 09:36:53 +0000
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
X-Inumbo-ID: d4618007-2617-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhW0PBE0uD7Alal5p0BDuqkb9edI/TMdvIjX65g+pxw=;
 b=RHO3IMI1Acqd+OMMlyQojaNuJvQHnz/Ozbmw+6o6gvxsHWPXe9314HwqZB/XRN3H4Ge2Em03XekFuXKizJ2OwogoUGD0BkVNEBHvnNz3qIWSEPT38UThaWJymfaRpv3c/xiKufRnBrGQTvlmX5284P1tj6uwf2x4U8u71ERDIWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67eb52b194590e72
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqbbqQAOHXlvijXF1Sv4AGUzd+LTZHRnHRD41e+aZl+kOwoGimLC9suXZnAkKh1KYTZ213ZTAxui/MlpOhJyMVsCTzaSgG5vOWybFJruqfwmDlW5/KnJlFu8wJQmtZvzZNdOlJxS+D3D2E25f+mKkM3WHGnp2qz0seCpvaiBrFFLjapfdKRTeOvb/TkCoIpTevEmC3ZMYadPG6izcsyOg922n9t3+N08dZUlWz/pgOugBAFEVM15SXdA8Z/3quEzVs9RGaJ+QSarUzMlnThfjWRqzxBZGKMYAFqG2RAkjtfjp2YKmX8JueEyJjh/NhibAKDybVQU/2VhtDjTw3pmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhW0PBE0uD7Alal5p0BDuqkb9edI/TMdvIjX65g+pxw=;
 b=AhMEH799i+QmBemupTYLP4kBhHJPnQrbZzcuYmp8P3eratmKaAQiStk1+kARPCAoV4rdFv2iToj4NhW3F7JefJXwvzJ4fTIg4C902FAF6EFdS12B1gDk+bVBbR6nMHF9iw2FQnQ8Xw+gbcg51CTxeLKd08mjz1YsObynCRNqhAPXHH+X4GnHndP+tc1aIUpzloCSXPZcptAFEjVw4DnYqdVUs5DZlYsfKLHaQbwBD8lJfpLIgQLjsy6r6wgbr/mezf7RRlniwMDz7ukll8iGqQS5a7xcXhLI7S0ydu2w5PPzjyDk5AHqshlz0+hMSV3DbbRUquIosnkR7HoHBE0Aag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhW0PBE0uD7Alal5p0BDuqkb9edI/TMdvIjX65g+pxw=;
 b=RHO3IMI1Acqd+OMMlyQojaNuJvQHnz/Ozbmw+6o6gvxsHWPXe9314HwqZB/XRN3H4Ge2Em03XekFuXKizJ2OwogoUGD0BkVNEBHvnNz3qIWSEPT38UThaWJymfaRpv3c/xiKufRnBrGQTvlmX5284P1tj6uwf2x4U8u71ERDIWg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>
Subject: Re: [XEN PATCH v10 20/24] xen/arm: ffa: support sharing large memory
 ranges
Thread-Topic: [XEN PATCH v10 20/24] xen/arm: ffa: support sharing large memory
 ranges
Thread-Index: Adm6JI1IKCrkxlGedEeTT9m/ij46OQ==
Date: Wed, 19 Jul 2023 09:36:53 +0000
Message-ID: <8304EFA9-FA48-4823-B7B0-11311351592B@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-21-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-21-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB3PR08MB8796:EE_|DBAEUR03FT051:EE_|GVXPR08MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a44bbd-476f-435e-770e-08db883bb55b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kZjcykhmOUsO87b6QgRjjdN15Mnb9F0LBleC+Bc7G5Jx/hOQQUFCbNdwYimj8XgaAhqccuTNqwOLZsPF3VukxUPS1BHNZHfLDZI6NNNM/VPvmakS5km+sZXDnj6Y2TSD7nva9DiFk0PHQkN+7LsWtdXRSpyPr2hosl6zPA0koEFvMJTsGB89KpvS4HEg3Z8GaY7VHCKRJ8lZjpoaPpS0jky2gsfV/JV7dzqJitdaVU8enZLS+39tAqUdk+2/CdRE0g+rTu6cJhi2uKwOY+4e7c4q9rSXQoD90/gr3MpVnYpvShS9rHJNcD+YehQehdDDaEK9IcQqkRSBbGo3wYNuAGVx9AFUiO/hDWHodsXnAUmCJ3Z7Kce/BaujFqz2OywWWH7PsnlfEDU+9zGMoQvco55KqeOVcOnVghzDuzE7STDbBJKZhPHVIzemzuACORcxI2TFDMKH6/OSwdf9bdXlpiKwwj2/N3tzQWKF/lx2Z/882fqCuJRZMOX10ZgKXc/ENFhvbwbYTpHCve24/3oU9pYcLy8eEFw1JGWceClUlmhJOGli59Qp4+rfWV93X4PqqTaEV3NqMwx0KPq9PTLVadrdFfr8U0d5XqnY4DONu3j3o7QJZappi+o21LLBwdr8XfUku+62xCCVH+U/bZgvkQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(86362001)(478600001)(83380400001)(38100700002)(186003)(41300700001)(71200400001)(33656002)(30864003)(54906003)(316002)(53546011)(8676002)(8936002)(6916009)(2906002)(4326008)(122000001)(6512007)(66556008)(64756008)(66946007)(6486002)(66476007)(66446008)(6506007)(91956017)(38070700005)(2616005)(76116006)(36756003)(5660300002)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06FA2F8E5D1B664D9BB6C20254DF5130@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88ef9e3f-37e3-45a1-7ec6-08db883bafc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dDTWQdOEtu+wScvTkUMFmYRlX1Xg+9U1ERgCkOzsiKpAFkC0bBsyNjA+iMX3/wSCsBMNGezW1WhHY9lrjILC6I2o1gSxMDGVmr6AAK/7Z1TUpaGz6YTGUqCI/WZlRPJnL7fQI/zFtjbU52K1pzkwMMrCyTsSt+mVXh0XISPMHHML3nbBZHbSwFTAw9AwEHykthiGI4NIoy2FzN6egEH/+V9GLwqmfH55fq+OWqayBGtDO4mJtklme619FhKLoszGVBSEJjBcnc2K3pj0b6J7CVTD4JHNXcPYnojn8eN/xIVTDNfUhadAuGCFZTExi9e45VPaevME/emaj9JowNwp1UeLlGr60fZFnMu4/o/7eJl6UiuPV4D/qC2zzZExpbwA2SXBbYCLbvSQ0V2JzYoKNVC/+GGlnoAvDIrzqQIlusjq70dWQ1B070MTV9I3f5G/7vZVctRBPIIB4alzLsAndZthDOLPvU6BZbsRtE8hiVlHbJfB1d2Iwf0Utf+neweafp29SFs4ceXDLnMCqX1wJ8E1PPmZh1Mn3udyrQayP/gbmWTM0aN4dWEXyUFcMzYv+VKqOPXQwXVXHfX/aNn/HrKsGm+wOB9XtllXr3sQJgjbH5jwGwk5JdtU/Sn6sPOh4fcqf3bL0BjvfTwaYzUMAZHbIDm+JmwsPx8D/W8n+ckBUQJDq0tCQFGqn4AUuk0XUUQPb4nWlXGA8DDCq5HzY7BIK457zarW8pJajDJN4gOD1sw4zGN8lg4Eabdjq/xz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(86362001)(30864003)(36756003)(2906002)(33656002)(66899021)(40460700003)(40480700001)(2616005)(36860700001)(186003)(6512007)(336012)(83380400001)(47076005)(6506007)(26005)(53546011)(82740400003)(81166007)(6486002)(356005)(70206006)(54906003)(70586007)(478600001)(316002)(5660300002)(4326008)(41300700001)(6862004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:37:03.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a44bbd-476f-435e-770e-08db883bb55b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7896

Hi Jens,

> On 17 Jul 2023, at 09:21, Jens Wiklander <jens.wiklander@linaro.org> wrot=
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
> xen/arch/arm/tee/ffa.c | 253 ++++++++++++++++++++++++++++++++++++++---
> 1 file changed, 240 insertions(+), 13 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index c623c51168b9..ac23b9edc74c 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -359,6 +359,8 @@ struct ffa_ctx {
>      */
>     uint16_t create_signal_count;
>     bool rx_is_free;
> +    /* Currently used fragment states, struct mem_frag_state */
> +    struct list_head frag_list;
>     /* Used shared memory objects, struct ffa_shm_mem */
>     struct list_head shm_list;
>     /* Number of allocated shared memory object */
> @@ -375,6 +377,18 @@ struct ffa_shm_mem {
>     struct page_info *pages[];
> };
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

Please add some comments inside this structure as
from reading the code it is not quite clear what is done.

> +
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> @@ -538,6 +552,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint3=
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
> @@ -627,6 +671,14 @@ static void set_regs_success(struct cpu_user_regs *r=
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
> @@ -999,6 +1051,8 @@ static int share_shm(struct ffa_shm_mem *shm)
>     paddr_t last_pa;
>     unsigned int n;
>     paddr_t pa;
> +    bool first;
> +    int ret;
>=20
>     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
>     ASSERT(shm->page_count);
> @@ -1034,13 +1088,23 @@ static int share_shm(struct ffa_shm_mem *shm)
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
> @@ -1050,12 +1114,34 @@ static int share_shm(struct ffa_shm_mem *shm)
>             continue;
>         }
>=20
> -        frag_len +=3D sizeof(*addr_range);
> -        addr_range++;
> +        if ( frag_len =3D=3D max_frag_len )

This test seem a bit dangerous as there is nothing ensuring that frag_len w=
ill end
up aligned to a page.

I would suggest here to do frag_len + sizeof(*addr_range) > max_frag_len to=
 check
if we can fit or not an extra address range in the area.


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
> @@ -1132,8 +1218,53 @@ static int read_mem_transaction(uint32_t ffa_vers,=
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

The magic here after requires some explanation, could you add more details =
in
the comment ?

> +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_=
offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset +=3D l;
> +    o +=3D l;
> +    if ( s->range_offset !=3D sizeof(s->range) )
> +        goto out;

Shouldn't we test this before doing the memcpy ?
Is this an error case ?
What is the expected frag_offset value here ?


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

Overall the processing in this function is not quite clear so we either nee=
d
to add comments to explain it more or find a better way to implement to mak=
e
it a bit clearer.

The implementation for fragmented memory sharing requests here is very
complex and I am not quite feeling confident that it does not contains bugs=
.

As this is not something required to have optee support, I would suggest to
discard this part for now in the support.

What do you think ?

Cheers
Bertrand

> +
> static void handle_mem_share(struct cpu_user_regs *regs)
> {
> +    static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
>     uint32_t tot_len =3D get_user_reg(regs, 1);
>     uint32_t frag_len =3D get_user_reg(regs, 2);
>     uint64_t addr =3D get_user_reg(regs, 3);
> @@ -1168,13 +1299,6 @@ static void handle_mem_share(struct cpu_user_regs =
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
> @@ -1240,6 +1364,36 @@ static void handle_mem_share(struct cpu_user_regs =
*regs)
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
> +        s->buf_size =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
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
> @@ -1278,7 +1432,75 @@ out_unlock:
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
> +        goto out_free_s;
> +    }
> +
> +    ret =3D add_mem_share_frag(s, 0, frag_len);
> +    if ( ret < 0 )
> +        goto out_free_s;
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    spin_lock(&ffa_tx_buffer_lock);
> +    ret =3D share_shm(s->shm);
> +    spin_unlock(&ffa_tx_buffer_lock);
> +    if ( ret < 0 )
> +        goto out_free_s;
> +    list_add_tail(&s->shm->list, &ctx->shm_list);
> +out_free_s:
> +    if ( ret < 0 )
> +        free_ffa_shm_mem(ctx, s->shm);
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
> @@ -1391,6 +1613,9 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
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
> @@ -1432,6 +1657,7 @@ static int ffa_domain_init(struct domain *d)
>     }
>     ctx->create_signal_count =3D n;
>=20
> +    INIT_LIST_HEAD(&ctx->frag_list);
>     INIT_LIST_HEAD(&ctx->shm_list);
>=20
>     return 0;
> @@ -1625,6 +1851,7 @@ static bool ffa_probe(void)
>          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> +         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
>          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
> --=20
> 2.34.1
>=20


