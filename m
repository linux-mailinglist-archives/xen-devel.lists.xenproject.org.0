Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5976B75BF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509230.784599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgAu-0000Io-67; Mon, 13 Mar 2023 11:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509230.784599; Mon, 13 Mar 2023 11:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgAu-0000Fw-30; Mon, 13 Mar 2023 11:17:08 +0000
Received: by outflank-mailman (input) for mailman id 509230;
 Mon, 13 Mar 2023 11:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++h+=7F=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pbgAr-0000Fo-Ua
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:17:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 954bec23-c190-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 12:17:04 +0100 (CET)
Received: from DBBPR09CA0042.eurprd09.prod.outlook.com (2603:10a6:10:d4::30)
 by AS8PR08MB9887.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:17:02 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::28) by DBBPR09CA0042.outlook.office365.com
 (2603:10a6:10:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 11:17:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.10 via Frontend Transport; Mon, 13 Mar 2023 11:17:02 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Mon, 13 Mar 2023 11:17:02 +0000
Received: from b02135f31935.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91952E7E-3B3F-4E0C-BD57-E84E318393F2.1; 
 Mon, 13 Mar 2023 11:16:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b02135f31935.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Mar 2023 11:16:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5431.eurprd08.prod.outlook.com (2603:10a6:20b:10c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:16:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:16:47 +0000
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
X-Inumbo-ID: 954bec23-c190-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXGO5LtLEFJ0BnNEuxxu8xn4i5xN0ewJgLyoXXTF3lk=;
 b=b8PSvfoGugf07H0hJBAFWDmCmR7UIEDrWMJgsJHNcBQ8VX0NG81lishgmQwnolqrNK8W+wWNz80Rb2yXFrEVzc4vcVsvl65Hd03saBaIAh9ycZTgxDwFGMydpXdCJ36cZPjlbA+L5zPpxCzEUCe0FkdpCw21MfTqRELWeQOrmWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3f8ce84ae766d45
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbE3jdN33ixsjONiBVZiql7H7PaCWpofE5jklsspqxWGNlVh3EANh1aGEGdfbXRmKT96lYRrJO0tPR9RRQSYSK/FVi0EPzCqC1uQWexkksl5YFbKm5UZF2XzOa3TjxjeJinZcFWRiPyxAVG6i/HZ8Wb1p9c6781fB7LDVzWjJ6+x9hnLiEZLKrHHH/RtyTvrUWqZi/T9gxqZZl8+AtAd8B0lVeu0Q5M6yjJiKVHWpdMzQPPsr2PJIuI6YEK8T0casKYNnLhYabXiXPUAHfOjPamJX1LoV+qB4kxYuosttT2wfG9kEXa9SPxtVOWq/9WfTdzJb7+GTNbC/qn3nGnRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXGO5LtLEFJ0BnNEuxxu8xn4i5xN0ewJgLyoXXTF3lk=;
 b=g0QJ0nCryjZLEWbncqxYRp8IK3MbDmbU4iVqZHo2RF+INa071GImt1yq0BO7caO78E3rES69wjEYQt43tBuDeVjCKoKpFz2EQOYul906oiaP2ELuho6zGi8PSvUaSvX4sSjM3qT6TuXmVQSeRj3cXjM/MMUL4HyBqXnXELWh68+4L+uWEy5yA4eH/5eimhy56kucil63w/F+bY1duoDgJzh9dZ+AciyV2zk8dxzsMhEM/kylOqljbI1/hZNNu9/IyZ3jgikmvn9oA3/jxQx7aBC2+AgMbgQbc3+k+I8mS9NVscTwpfwTgeC6r4rbOAY2Yke6teVyuc2x+uob5leFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXGO5LtLEFJ0BnNEuxxu8xn4i5xN0ewJgLyoXXTF3lk=;
 b=b8PSvfoGugf07H0hJBAFWDmCmR7UIEDrWMJgsJHNcBQ8VX0NG81lishgmQwnolqrNK8W+wWNz80Rb2yXFrEVzc4vcVsvl65Hd03saBaIAh9ycZTgxDwFGMydpXdCJ36cZPjlbA+L5zPpxCzEUCe0FkdpCw21MfTqRELWeQOrmWM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 19/20] xen/arm: ffa: add support to reclaim shared
 memory
Thread-Topic: [XEN PATCH v7 19/20] xen/arm: ffa: add support to reclaim shared
 memory
Thread-Index: AQHZRtMg5h4PCXGu8UaP4SH7Bu6xrK74rOYA
Date: Mon, 13 Mar 2023 11:16:47 +0000
Message-ID: <A1EC648D-422E-468F-B9C0-E54673958C93@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <6dda7c17462221fac26f45a8663370952e37040d.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <6dda7c17462221fac26f45a8663370952e37040d.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM7PR08MB5431:EE_|DBAEUR03FT065:EE_|AS8PR08MB9887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb9cda9-67bf-48e7-8883-08db23b47859
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S2TFXamRSoaBq/Z08eyHf0GofVDnX7ry6lZ0ZrGLJtYCX6TleU1jCaWHGy/SZB+IyDdsVKTrQJuh2h1ZOe1pIfMOXo4fNAKE1ELO19nnQ2i0/sdQkEKNSZno6lw3U+Z3Csox1K2LEoBiDYI/IWn7aBjPB3E11Mrvdvy8lyPH1HjOhNDfvMO6QgGPTi7BTq29jnr4Q0TKYG4R/Enq9qy8RCBf0mis9GY13UQHzNLU6l4uZZasAxxXvyINz/pabuHLQlrC9Pm/FWfWv1Knuswkhhe2ZJ95fTITEdNcuPij39GY4X//Vi5Sa5XeoXrr9Ivyvo9ZLSyQ7GPi02isn/rR7uyU7TgLOmVsVRr6KpqCmkXxquSRMKHIik1PUG5hReTRx/2mfGJDq8i7UwhtFDkSvcEEJgoPwdWtMni60jL61TgM/wbqu+TczApOw0EyYBI19mdvIshv1HenmV2MAYCXkBbaY/OfnyFYcKjNU2Zc64z0slTNOPNHh5EpCfIcQj77wo2Mmyx7/eSGvAdaMatTBs+zoZnJrHWdVvuPevFrCqkLo/T/ycqHZ7cpgjOpOkWhUK40x5zV87DicIM3T8/7a2mNbT/KY53w8SRJf+A7Rlq1FAJCsqlk2ikqc8MlyEiFObD7DXT47WtJ4Ndhkm9/OL2h1wOTpc97kuTNaepZGXni//R0qdwtPMn9+W/r3mkAetAUWu2SdjCBvox3xQcoogOV8xD/7+tCZrAl21q8/1s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(2616005)(186003)(6512007)(53546011)(6506007)(83380400001)(8936002)(38070700005)(38100700002)(33656002)(5660300002)(6486002)(64756008)(66556008)(66476007)(91956017)(8676002)(4326008)(76116006)(71200400001)(6916009)(66946007)(41300700001)(66446008)(2906002)(122000001)(478600001)(316002)(54906003)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78D7B178D696A04393DD4A8BEDB791C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5431
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31ada8d0-73e9-40e6-75ee-08db23b46f64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k51FjHn67r4B60NiuSWPa/Ds7LXh+xLTZwIp87p6w0qLDwnWRIG2pyix8UUKkEpTFcCaMOeYUBbw6fyMrzkkw2zvMby0luMA4cRCMOVmCJ4PO7hG1YzD+vaSlFtvIOfSVLwIYOJYY8WkR1HW7gJvs05RhYr/jdg3OCzIWggdLbLPec9GYq+rsZDc8WV9FaJjxvJQRzkNJ4Uj9iED0B+G4BEn5CjyATU/r2DTo8Is5wOG0Uvr7JTyya+rjXK58Un85yqyj8ZWQnd3wvMqX+6/dg+vacmQQBNEfhXPriV89PV1K8cr5FKpF7SNKXXuBgv0SwScIMejUL/N9ZHXrYSV00UFQaZchkJ+VeeNSxmCZ3DHM5y0mCYMtbPjr4lTfQymR1a7DK6zpPOxX3hCx4PYrVX9Jxa12UY5vvXG/gHIXL9HoV7REq7MG2TJDl+YXplF3TUmfZI54HFHRmoF4aV2cA2tQqZ8i3hcpTimvqkrltH2xStd5VE59v1G+cqixEWnv23DkNINPPBJBs2zkQtRQ/4dWg0QYZka+PF+6mRo11aJpUm6agmp3WhTu+cpC5z1NdPITpWqkUM9Fc5DFp8vejya0s4pq+pGJYAakpf2Af2LQci1eF4Th/41Qm21IUMKs9fWav4AhafBc1HEQNwk+g2vqo3GamwTSGaKm+Ts8zgHEqIkjv5GaoBQbO6/P2Flvc4vyni7Tozchemg5u3oig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(53546011)(41300700001)(8676002)(47076005)(4326008)(70586007)(6862004)(5660300002)(70206006)(83380400001)(26005)(186003)(6486002)(8936002)(6512007)(6506007)(54906003)(336012)(2616005)(478600001)(316002)(356005)(36756003)(33656002)(40480700001)(86362001)(82310400005)(82740400003)(36860700001)(81166007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:17:02.3119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb9cda9-67bf-48e7-8883-08db23b47859
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9887

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support to reclaim memory previously shared with FFA_MEM_SHARE.
>=20
> Adds a check that the SP supports the needed FF-A feature
> FFA_MEM_RECLAIM.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just one thing: we need to discuss what you do with the feature check becau=
se
i would expect to return unsupported if a feature is not supported but inst=
ead here
we make it mandatory for all features we have to be supported to have FFA w=
orking.
I am not convince that this was the aim of this and we might need to distin=
guish between
features we do need to do something and features which would just make some
functionalities not available.

I will try to check how other implementations are handling this.

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 53 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index cdc286caf62c..3557edc455d0 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -512,6 +512,12 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint3=
2_t frag_len,
>     }
> }
>=20
> +static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> +                               uint32_t flags)
> +{
> +    return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags,=
 0);
> +}
> +
> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                       uint8_t msg)
> {
> @@ -1238,6 +1244,43 @@ out_set_ret:
>             set_regs_error(regs, ret);
> }
>=20
> +static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_shm_mem *shm;
> +    register_t handle_hi;
> +    register_t handle_lo;
> +    int ret;
> +
> +    spin_lock(&ctx->lock);
> +    list_for_each_entry(shm, &ctx->shm_list, list)
> +    {
> +        if ( shm->handle =3D=3D handle )
> +            goto found_it;
> +    }
> +    shm =3D NULL;
> +    ret =3D FFA_RET_INVALID_PARAMETERS;
> +    goto out;
> +found_it:
> +
> +    uint64_to_regpair(&handle_hi, &handle_lo, handle);
> +    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    if ( ret )
> +    {
> +        shm =3D NULL;
> +        goto out;
> +    }
> +
> +    list_del(&shm->list);
> +
> +out:
> +    free_ffa_shm_mem(ctx, shm);
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -1305,6 +1348,15 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> #endif
>         handle_mem_share(regs);
>         return true;
> +    case FFA_MEM_RECLAIM:
> +        e =3D handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2)=
,
> +                                                 get_user_reg(regs, 1)),
> +                               get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -1508,6 +1560,7 @@ static bool ffa_probe(void)
> #endif
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> +         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>         return false;
>=20
> --=20
> 2.34.1
>=20


