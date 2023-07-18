Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D966C757DF5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565274.883298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkyA-00047o-Qh; Tue, 18 Jul 2023 13:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565274.883298; Tue, 18 Jul 2023 13:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkyA-00045Z-Nm; Tue, 18 Jul 2023 13:42:26 +0000
Received: by outflank-mailman (input) for mailman id 565274;
 Tue, 18 Jul 2023 13:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLky9-00045P-6N
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:42:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb86b775-2570-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:42:21 +0200 (CEST)
Received: from DUZPR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::6) by AM8PR08MB6354.eurprd08.prod.outlook.com
 (2603:10a6:20b:367::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 13:42:12 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::82) by DUZPR01CA0153.outlook.office365.com
 (2603:10a6:10:4bd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 13:42:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Tue, 18 Jul 2023 13:42:12 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Tue, 18 Jul 2023 13:42:12 +0000
Received: from d4d668943873.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE353328-4061-4092-952B-47298B5E631A.1; 
 Tue, 18 Jul 2023 13:42:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4d668943873.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 13:42:00 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by GVXPR08MB7678.eurprd08.prod.outlook.com (2603:10a6:150:3e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 13:41:57 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:41:57 +0000
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
X-Inumbo-ID: eb86b775-2570-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9LnARD1H+0THRDtTWe1Jau08DleXz5nbfWW8rfC+nA=;
 b=C241IYH6qrhvgmLWNTAo9qNd8oZqKuMQuak5405NezPI1FE523aYVYsL4DgkwJVFi9OipsdF9URfrbMYPx2SlWorF80AoI/Qhgxrtl4ybMnnLGzAXVjtP26daJC22Xj5fpAWh67aj62jtpXtO+N6+GiZ2Jv4xBUHVyh3tFZtqII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ea094a56ab8bf2a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI5OfSAUDGy6ch/kOQ8DfTsoJHvUZjHFeFRkWhwDMHwdmRf3Xv0EHtTBqbJ58bSDJD8hTVKd8F1YRI6xCCKeAyQXwy/ji6jOnlsKXuADHqNJFWkEYtAxWvQ0XVVRCkI+/1pxfh0ILeTPXBvprb6p+g5YxptCKfXWKirq72hehwVQnsjO0Gq9jWvLzUIkQOi3wKTIngkPpxGVEzo+3nuYO6I/zeXnO7gFa3DiFBBgCSlVs+WfV6LRQD+m9Whqn4tXNfSXFF1Y+UzmDo+nsHfe9vo6aTNjUAvB82pOGnvDC1OjCbqjXVOpnmFhFcYUjZy22a6fH8CTdJ09ck5hr7RH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9LnARD1H+0THRDtTWe1Jau08DleXz5nbfWW8rfC+nA=;
 b=NgJ1O5cSqL2DxmfqM/g7Y1FyFpVEfph70QFDWQI/+pq1gKpAhE2DfnMeBKIgjod3wEKHyABlKRhwjNK7ECUOJfrblK83FKq+0gcldQ/6Elvl+5LQ1WamDDcQuJvpMXpB1rIOYDzTXbyIQ1t+OmDfiddZBfhxFGQyo8RwBkQMBg3hY9mJvKgVQ77K1HoYAKKqeQ+Og9lPHo0Px6nO6sW76Yo7jXEeIUpBQdTcUrIgU7yKTEGhvuCwbBPf7PGVrvv5h6iaFETPqThYhe9bMpSuKCh9lZ7tmytVRoXKBx12K887DMYTfPDuMkCNyWIKEccNQX2Btt/euKXO9FjmXSkQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9LnARD1H+0THRDtTWe1Jau08DleXz5nbfWW8rfC+nA=;
 b=C241IYH6qrhvgmLWNTAo9qNd8oZqKuMQuak5405NezPI1FE523aYVYsL4DgkwJVFi9OipsdF9URfrbMYPx2SlWorF80AoI/Qhgxrtl4ybMnnLGzAXVjtP26daJC22Xj5fpAWh67aj62jtpXtO+N6+GiZ2Jv4xBUHVyh3tFZtqII=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>
Subject: Re: [XEN PATCH v10 18/24] xen/arm: ffa: support sharing memory
Thread-Topic: [XEN PATCH v10 18/24] xen/arm: ffa: support sharing memory
Thread-Index: AQHZuH9ZQoxae0peFECnLnyQIgA236+/ijEA
Date: Tue, 18 Jul 2023 13:41:57 +0000
Message-ID: <CE12BCC6-85E1-4EAB-BBCE-9DB746187B2D@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-19-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-19-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|GVXPR08MB7678:EE_|DBAEUR03FT008:EE_|AM8PR08MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 52060d9a-08bf-42fb-fdcd-08db8794ca5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l9N0d7g7WCxMXxdP01b/PbKMixGmZQ05zf8P99yABYZX0zWm/Gyn7ijecrVL0P3A5ZD+nVkcCE/yyefhhDYbwM29wkfB5Lo87zqpbyZsKLpl9zcOhlo7MjFDVUK8NXz9wY3j5QvqOZWFRgL9V4EvKP8mm/8hAWzMTkt3arz0bgyyWK2u1XUOYZDERBnglauDhRcze1va33zpV1A/ImnVvtXZyH2tM7KW0+Lc7v5yZghgetwm6BjrLOlKNQsAKQ7yXZl3Vq/P517vEU/1IQGVBSIbwunRN+FKtWT5w/99i4zZkb09m284d6MMnEycxMonlqPm30lhnzQyQYXXjCyWgyEP8wMlSQLmkVZk77K0d+iuaLpUNXD2UkOezqgo62HHwMlh4SLMDr9Oehau9GEqVQA5lJ7pdr11c5575Y5Vi84sX6go74jloaVxT+yEnl2r1kgXvzkHJSSQ+xe8f9cy79+ANUZpL3/myIGvBN8QxXibo1E/7dPxGyixAKauxu/X9mM/beYiUMPngSzNXhuUceS7bZPhyLyfLRBpb3CUUiwJcw3dR3GEG1ysDKf1BUo3sYhG1e9pSgAmd3bYQ4X3Nag3Mha4b4SHqCplV2fcfH5cbrXdVI/IQW8bbVw/5OkSAImq4K4O9a9gRkUDBkznSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(6486002)(54906003)(91956017)(71200400001)(478600001)(2616005)(83380400001)(33656002)(86362001)(38070700005)(30864003)(2906002)(76116006)(186003)(6506007)(53546011)(6512007)(966005)(38100700002)(122000001)(66476007)(64756008)(66556008)(66446008)(41300700001)(66946007)(4326008)(316002)(6916009)(8676002)(5660300002)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48474E768249C74B99079527E1FC9D9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7678
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79c4072e-0613-4900-1776-08db8794c154
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WbkRLTVCeBC9HNV8hAOHLkBv8gunSBcR5bMscBVARfM+F936dgzlEZ6WP/8SzwUJI7sxuF2mdEC4NroNHZH5qWwWQm3Ys+OuhQpIXIwjSGVsArbU9od0PQAIm5wPOLUphnNrrZ5UuGUCu1DnZnB1Xfwdk1ES8I6lqPMOaV+qbYRUSqLAhO6KtmC+7g5ePUiWVXD84SsKNQGgDkMX6JwQNJZ08/rSnSTxpXhvs3AeYkdQjo8XchIKPuuchGCYwTV6LPmHnal723aJEttXh9njFwfMonFSOurnPaM3Du8SncyxjDduy36dld4os02wrRO2bIdJ4Pu9m/DTb3o7vVrqb7XmlYLEr7TBjR+pWPFMGBSZDk7OtNRgicU/SQ/lhkv2A7PbvVbmBP72ZHcJHR8iNhoAN+NWHol4GkyVtWzMkFQWcJo8HGvmhWWSe5FhUujwXekvUWw7kbPuzd4avQlAQ+VkGRhpdOktfjKZ6AidaRx2dd875UEhFmnBzT1ENV8zRuhvRtvs7/8ClZ3SMXU46EAIal1yDbIrEIeMhvH+ud62+rReuwYrAcngkXGMBJeT4yDAEXKe2nujVH6zS0M8680xLGhxJNqrZRFSbAI19Yfdx0M/es4kssiLwt/tfmGOo2pxDN5wyvy//XLhqRVlhfABkUGzjGQtoWZkuY1WArKAuOHyzBy7ZhA8hYlgntMo2yTv9cVAO8bzAFdFTrjqP6YPfO5jurLu5QwA/QLj/gs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(86362001)(6862004)(316002)(8936002)(5660300002)(8676002)(4326008)(70206006)(70586007)(41300700001)(30864003)(2906002)(478600001)(6486002)(966005)(6512007)(26005)(54906003)(53546011)(6506007)(186003)(336012)(36860700001)(83380400001)(2616005)(47076005)(40480700001)(36756003)(33656002)(40460700003)(81166007)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:42:12.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52060d9a-08bf-42fb-fdcd-08db8794ca5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6354

Hi Jens,

> On 17 Jul 2023, at 09:21, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for a guest to share memory with an SP using FFA_MEM_SHARE.
> Only memory regions small enough to be shared with a single call to
> FFA_MEM_SHARE are supported.
>=20
> With this commit we have a FF-A version 1.1 [1] mediator able to
> communicate with a Secure Partition in secure world using shared memory.
> The secure world must use FF-A version 1.1, but the guest is free to use
> version 1.0 or version 1.1.
>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_MEM_SHARE_64 or FFA_MEM_SHARE_32.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 486 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 486 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 03699473cfc5..f3eb84a8e9b7 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -297,6 +297,38 @@ struct ffa_mem_transaction_1_1 {
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
> +struct ffa_mem_transaction_int {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t handle;
> +    uint64_t tag;
> +};
> +
> /* Endpoint RX/TX descriptor */
> struct ffa_endpoint_rxtx_descriptor_1_0 {
>     uint16_t sender_id;
> @@ -327,9 +359,22 @@ struct ffa_ctx {
>      */
>     uint16_t create_signal_count;
>     bool rx_is_free;
> +    /* Used shared memory objects, struct ffa_shm_mem */
> +    struct list_head shm_list;
> +    /* Number of allocated shared memory object */
> +    unsigned int shm_count;
>     spinlock_t lock;
> };
>=20
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
> static uint32_t __ro_after_init ffa_version;
>=20
> @@ -351,6 +396,7 @@ static uint16_t subscr_vm_destroyed_count __read_most=
ly;
> static void *ffa_rx __read_mostly;
> static void *ffa_tx __read_mostly;
> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> +static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> static bool ffa_get_version(uint32_t *vers)
> {
> @@ -457,6 +503,41 @@ static int32_t ffa_rx_release(void)
>     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> }
>=20
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_SHARE_64,
> +        .a1 =3D tot_len,
> +        .a2 =3D frag_len,
> +        .a3 =3D addr,
> +        .a4 =3D pg_count,
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
> +        *handle =3D regpair_to_uint64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle =3D regpair_to_uint64(resp.a2, resp.a1);
> +        if ( resp.a3 > INT32_MAX ) /* Impossible value */
> +            return FFA_RET_ABORTED;
> +        return resp.a3 & INT32_MAX;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                       uint8_t msg)
> {
> @@ -800,6 +881,403 @@ out:
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
> +    uint64_t page_count;
> +
> +    for ( n =3D 0; n < range_count; n++ )
> +    {
> +        page_count =3D read_atomic(&range[n].page_count);
> +        addr =3D read_atomic(&range[n].address);
> +        for ( m =3D 0; m < page_count; m++ )
> +        {
> +            if ( pg_idx >=3D shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
> +   P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            /* Only normal RW RAM for now */
> +            if ( t !=3D p2m_ram_rw )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
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
> +    if ( !shm )
> +        return;
> +
> +    ASSERT(ctx->shm_count > 0);
> +    ctx->shm_count--;
> +    put_shm_pages(shm);
> +    xfree(shm);
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
> +    const uint32_t max_frag_len =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
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
> +    ASSERT(shm->page_count);
> +
> +    descr =3D buf;
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id =3D shm->sender_id;
> +    descr->handle =3D shm->handle;
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
> +                                struct ffa_mem_transaction_int *trans)
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
> +        trans->handle =3D descr->handle;
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
> +        trans->handle =3D descr->handle;
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
> +
> +    /*
> +     * We're doing a rough check to see that no information is lost when
> +     * tranfering the values into a struct ffa_mem_transaction_int below=
.
> +     * The fields in struct ffa_mem_transaction_int are wide enough to h=
old
> +     * any valid value so being out of range means that something is wro=
ng.
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
> +    struct ffa_mem_transaction_int trans;
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
> +    mem_access =3D ctx->tx + trans.mem_access_offs;
> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
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
> +    if ( !page_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
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
> @@ -857,6 +1335,10 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>     case FFA_MSG_SEND_DIRECT_REQ_64:
>         handle_msg_send_direct_req(regs, fid);
>         return true;
> +    case FFA_MEM_SHARE_32:
> +    case FFA_MEM_SHARE_64:
> +        handle_mem_share(regs);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -898,6 +1380,8 @@ static int ffa_domain_init(struct domain *d)
>     }
>     ctx->create_signal_count =3D n;
>=20
> +    INIT_LIST_HEAD(&ctx->shm_list);
> +
>     return 0;
> }
>=20
> @@ -1086,7 +1570,9 @@ static bool ffa_probe(void)
>     if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
>          !check_mandatory_feature(FFA_RX_RELEASE) ||
>          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
>=20
> --=20
> 2.34.1
>=20


