Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F27757FC7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565325.883398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlpZ-0006JB-Ld; Tue, 18 Jul 2023 14:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565325.883398; Tue, 18 Jul 2023 14:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlpZ-0006HG-Ic; Tue, 18 Jul 2023 14:37:37 +0000
Received: by outflank-mailman (input) for mailman id 565325;
 Tue, 18 Jul 2023 14:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLlpX-0006HA-4K
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:37:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a00797e0-2578-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 16:37:30 +0200 (CEST)
Received: from DB7PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:10:36::29)
 by GV2PR08MB8049.eurprd08.prod.outlook.com (2603:10a6:150:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 14:36:47 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::8a) by DB7PR05CA0016.outlook.office365.com
 (2603:10a6:10:36::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 14:36:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 14:36:46 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Tue, 18 Jul 2023 14:36:46 +0000
Received: from e89285c2b7d9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BAD226E-2D45-4DB0-BDE1-06693F476368.1; 
 Tue, 18 Jul 2023 14:36:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e89285c2b7d9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 14:36:40 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VI1PR08MB10050.eurprd08.prod.outlook.com (2603:10a6:800:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 14:36:36 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 14:36:36 +0000
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
X-Inumbo-ID: a00797e0-2578-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=2HL4B+BPgQIGqQJqA1VugXL/yqoXAS9xnBHkUqgIBX2zfkJZhIDyZnaalQbFmZow+g6nma4j+rZxZW8qr61SqE4WaN1XQrYDG/gW/vhbpXciUeh/Q9oDj/3UuUYxZy8QtDzJbj+UqrdEXaAlp4XeXF6pCm64T9twn0QRb0+UWMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e5fdd48182161e1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLscYympgY+IK3UBdW1OUh/SkZgsPt94xdK4p1QbIBmYglJ5vRFBrnfOcBpJKyjsAiUXEF8OAdsJBp6oF3UamuA9XVgIecMHRAbiEjlvJOASOLH4QELO8tW8hld4uKbnlaO9cbnUB3mEUrddqcuzmKmoBE0GDEyouQcGnY5MBvpYAqgAXn2dN2d7LF8WgFRLBTpLhNDh+tMGHosVxDBTxTEC7EaWP5/FMNghC1gFyCrYGS/GXbaK2/zIXgX2BDH9HmD+1/Ie6MzEfn8ZWd1ocsYsl+TM83jMoz71cG2TnAAVznwRvS3E7Rl+8WYnLp0ges3Ls5t/GT4sUxruipEZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=PL4bnDHobUNP7uN5KhLfn6w0TDiVMSqyvwxzSBxlYtqQ18neEBRdbx6P2ZhmwYv1wWeo4vzz2WStxJBz5uu6fB6BNYXgvLkcRtsC78onVsjEfmWDzOJ+JZHsOwLhI47YqTYi2J+Y2USZh2BhGMYwX/8zrzXpw+Hu2ApG6yLuj4W2FOzpyxunT0g4nqOmePSQaR4MEe5PPlit/VA/b8eY8vCTiRV3FgbbqdykI6GiXAzDCIyrh7GiglgHk0Aycr65jx/MhNR50mYVxaVkRLm1URVcSV4UnaWuGuLUqW/PLRIUtEzZkAwAqRVqtzxYWXdFYMqoWwlM6vOxzVf4XnegiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=2HL4B+BPgQIGqQJqA1VugXL/yqoXAS9xnBHkUqgIBX2zfkJZhIDyZnaalQbFmZow+g6nma4j+rZxZW8qr61SqE4WaN1XQrYDG/gW/vhbpXciUeh/Q9oDj/3UuUYxZy8QtDzJbj+UqrdEXaAlp4XeXF6pCm64T9twn0QRb0+UWMo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v10 16/24] xen/arm: ffa: add defines for sharing
 memory
Thread-Topic: [XEN PATCH v10 16/24] xen/arm: ffa: add defines for sharing
 memory
Thread-Index: AQHZuH9Y/E5eTczWgkKkQ5tsd+GUtq+/mXcA
Date: Tue, 18 Jul 2023 14:36:36 +0000
Message-ID: <A742C42E-5861-42EB-91B9-4D74653C6467@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-17-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-17-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|VI1PR08MB10050:EE_|DBAEUR03FT056:EE_|GV2PR08MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: fe34f200-fcaa-47ec-dc39-08db879c6a2f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3z3JQT6dWGyzd8krBjeJWIgrGRxhJF49zGgDvqQSuMY6m2Ih1v0yBwrEqkz8RHMXUi/u1KTdCkAxYUqsB/eGOdAgaqCHRB4eIoCQtfEtVVvvgwrQCdPFuDWC0+azEb5VQ1n5NUfa+YW+SOVYYK/e/f0YCpdQA8wMax+nqoXAEi9yz/9AHCxlnEdmHkk+eEXSVAjwx/e6NlHMEyEC+S35LgQ/R8V/UNtuG4qR/QRwprYch4DeCjzT5KrUZYr2S3S4mlr6Z/LSTaEBcEdj5uGDVgiUaIbSb2Bf5Ni/zvpb5iKrXRd8Mv/7yRYGdi0aKs5gJLTFtpMUVvcXpeTMkFOImJLG/6LNm8DjY+Ip2eWt9h3F3quNMsmWy9Ais4je4Rp+RHmqf8b5uZGK2L0ERirhi2QOPklGK3K4qICmnJb4ZVohhqPRjVWCt5V37U7qnDxiF5YkdkpBciOvl6kcoJHYvOFviikeOUWmMcTXX1q/4skWmL1TmlMs7lu3ilgnsRlM08s+BcBPN67RqAMDYFxGMQseYuYV7ujHjXnR3TTLqZcMsrkaUb66I9/8ThpaFj5xr+mRz9M83WKFZRIteqAxPLUrlZ2CwrBSqLKBR+sFKqfzOPpDLGd3hBU3MVr2mRcHIhzTyOHNo1XrDlxZpXg/iZIFPp6oFbeDS/nnFTKD/SgBwTQR1hPBSUCb9Nzs9CL9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(71200400001)(478600001)(6486002)(91956017)(54906003)(53546011)(186003)(6506007)(6512007)(966005)(2906002)(76116006)(4326008)(316002)(6916009)(66946007)(66556008)(66446008)(41300700001)(8676002)(36756003)(8936002)(5660300002)(38100700002)(122000001)(64756008)(66476007)(33656002)(86362001)(38070700005)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B2AA2674BD63CD48903D60F5CAFB2CEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10050
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98174eba-a3ea-4c0a-d59b-08db879c63e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ytoIp0aPoZTQe6IIcUDgYkjZ36+Vw/dnvvhzhE+wNVycf9GVPVT7bpOkZ9e9JBjzA8VLhDkWvz+4dQTyo6z7gW/Yqk4l2otEzRUl2rtn+7nKVFh41ruqEBWn3H1mhPMilIYtUCQ8qWio4PcrbpwwcN5WYHgc05eoR4xWlu+0YVBFjdW5m8B2U4oWiY9yrE0c44zmmbIbd4gBr10FQkKT54b2nYA1DJi8MrIVKV2AT/QfZIWBArcHUDJgT8T6d/uYRpahhakfMYHiIjcqse0LgMUsw88xaUtO8eRwtF3CQ7VQ6RRcvuL08JereTKpJ0J7Ffi20IlQz7IIKCrbPrjldAd9vdEO3H4pcJIwW6wmpbKKiDFw48nI5LCwQqEoH327OLCKCKRVvFX6gXYacSMPjj8xhKcX2TLJDHUo0PlR4NuCzMPzJqIWD9UXIv+426q5zxtOL7CQOaTj6hhrcXNxXnDZ4SApFsYvHoIPh5W0kUkCiPuLa97YP5QUtCrQ3UwpwZeNnYhT1N2qD8qmAnniuc1bslSqxbhIgyzaA9tEgZBA8Iq8J1WcM7tCHoiSj9JcMxJ9bzDLyHHxLVRXLzB+9XWE/HJbYjSUsiTNSC+9ieBnrTNGW/Ved1np05SJWaLdcwW8F8weJcwRd16BjMJBeL1vY+stUHtO5rF+cmg0RoGLnsEQp9+Iz9fxGWB4MSC17t267LaKFUzM3jP1vD790rwSTxBm+5aqh1HtXDGimAHT57LsbzLpyT2cICw+o2mAx3ShMjAnqOXx/mGsHFLrng==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(478600001)(6486002)(54906003)(53546011)(186003)(6506007)(6512007)(966005)(26005)(70586007)(2906002)(4326008)(316002)(41300700001)(8676002)(36756003)(8936002)(5660300002)(6862004)(356005)(70206006)(81166007)(336012)(33656002)(86362001)(40460700003)(36860700001)(2616005)(82740400003)(47076005)(83380400001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 14:36:46.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe34f200-fcaa-47ec-dc39-08db879c6a2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8049

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> According to DEN0077A version 1.1 REL0
> - Section 10.9.2 Memory region handle, page 167
> - Table 10.18 at page 175
> - Table 10.15 at page 168
> - Section 10.11.4 Flags usage, page 184-187
> add defines needed for sharing using the function FFA_MEM_SHARE and
> friends.
>=20
> Also add limits for how many shared buffers that a guest can have at
> once and how large a shared buffer can be at most.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 58 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 58 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index d5748b9ce88c..e895e355e620 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -5,6 +5,14 @@
>  * Arm Firmware Framework for ARMv8-A (FF-A) mediator
>  *
>  * Copyright (C) 2023  Linaro Limited
> + *
> + * References:
> + * FF-A-1.0-REL: FF-A specification version 1.0 available at
> + *               https://developer.arm.com/documentation/den0077/a
> + * FF-A-1.1-REL0: FF-A specification version 1.1 available at
> + *                https://developer.arm.com/documentation/den0077/e
> + * TEEC-1.0C: TEE Client API Specification version 1.0c available at
> + *            https://globalplatform.org/specs-library/tee-client-api-sp=
ecification/
>  */
>=20
> #include <xen/bitops.h>
> @@ -80,6 +88,56 @@
>  */
> #define FFA_MAX_RXTX_PAGE_COUNT         1
>=20
> +/*
> + * Limit for shared buffer size. Please note that this define limits
> + * number of pages.
> + *
> + * FF-A doesn't have any direct requirements on GlobalPlatform or vice
> + * versa, but an implementation can very well use FF-A in order to provi=
de
> + * a GlobalPlatform interface on top.
> + *
> + * Global Platform specification for TEE requires that any TEE
> + * implementation should allow to share buffers with size of at least
> + * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
> + * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
> + * Due to overhead which can be hard to predict exactly, double this num=
ber
> + * to give a safe margin.
> + */
> +#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
> +
> +/*
> + * Limits the number of shared buffers that guest can have at once. This
> + * is to prevent case, when guests trick XEN into exhausting its own
> + * memory by allocating many small buffers. This value has been chosen
> + * arbitrarily.
> + */
> +#define FFA_MAX_SHM_COUNT               32
> +
> +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> +
> +/*
> + * Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le
> + * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> + */
> +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> +/*
> + * Memory access permissions: Read-write
> + * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> + */
> +#define FFA_MEM_ACC_RW                  0x2U
> +
> +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> +
> /*
>  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>  * BIT(31): Framework or partition message
> --=20
> 2.34.1
>=20


