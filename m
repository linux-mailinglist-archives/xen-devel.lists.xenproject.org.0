Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5089EB73
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702936.1098633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS3S-0008Ph-4v; Wed, 10 Apr 2024 07:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702936.1098633; Wed, 10 Apr 2024 07:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS3S-0008Nw-0x; Wed, 10 Apr 2024 07:07:34 +0000
Received: by outflank-mailman (input) for mailman id 702936;
 Wed, 10 Apr 2024 07:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh3E=LP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ruS3Q-0008Nq-FP
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:07:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff8a5eeb-f708-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:07:31 +0200 (CEST)
Received: from DUZPR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::16) by GV1PR08MB7916.eurprd08.prod.outlook.com
 (2603:10a6:150:8c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:07:27 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::2f) by DUZPR01CA0071.outlook.office365.com
 (2603:10a6:10:3c2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Wed, 10 Apr 2024 07:07:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 07:07:27 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Wed, 10 Apr 2024 07:07:26 +0000
Received: from e6cdd20fb770.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E797C4E6-8C32-4629-A418-F5D57F4A1F9F.1; 
 Wed, 10 Apr 2024 07:07:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6cdd20fb770.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 07:07:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7640.eurprd08.prod.outlook.com (2603:10a6:10:31b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 10 Apr
 2024 07:07:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:07:17 +0000
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
X-Inumbo-ID: ff8a5eeb-f708-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VrV/qPy6ON2VpzqqDZTKV5Hq58yACdG0SD0cKS6/RTV6zBXKEkclnY5yntcFbZue0ghqXIhWHKiPyyIUGgOuAwNHBRVPsx1QtNl0B527V1V5+CsjLSBVvUFlHc3xMIdVw4mv+myBpOlQUkNGWEdCJ0ddRtLzkzkDkJGxN/6WhZCEAlDqZfffXgKd1yXLbaD2HbZFbi/2dHh5r3coY3/GzXgSGlzWvH9ZT3g6fBzvj7IL8M83yC3cXJOJv3iyqUmXS0OlvDxzBCI3n0PnTUZMYTOvfABjPB5B5StkBwHo3/gtrunFrASJAXJaUucf5PlXIb/MNxUg3qCJz5cABslf6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7VzH6NTtehvGbJ/7QpdOn/OZApWx2FdsX+6WHygoSw=;
 b=C0k3JYo+U/A2ErmQr8ibvyXYhlO1nrZYQPF4r7ZZzUqgVekjVpyDHkMBO6tiqDsJZaL4zAGpChc7HDsDvZRiGgyZJfbMghEfAqq92boWO7Dfgtd/QD4tox9SXdwjzMIxcxGChZxFgpvba/7uSu5Cftmva8gzZcRhi3Z2tIOxGvFGmU3EjUQYxgb3bZjtTje8sGOxa5VsGDJ1Un6Rk0+XAv93KwKmmA+AsVWEjAONOb7m3UsGOGE6FwQ7M4Be1db4isyoqgWJWQCZShr9FSDcrCc+khmrJyds8Oz+EL6ETKYbFqbd4f0S+1paa30/HiHs2V+P90MWlhxduqlZsSbL1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7VzH6NTtehvGbJ/7QpdOn/OZApWx2FdsX+6WHygoSw=;
 b=ZNwrH7Sb2sbK0mJvyEVOBptPuPukiifZLECwYzCHtQSqZN1hh6Eoyx4zM5Xy+U9w91Sfwg9hIvSJpu5kNPEctZqDBufdPxfAW1x3TSzgq+qCYCwDQRNkJ8mWiZwDmiNy6mI4X4gIUdmvLIpysf2bIZULjlVd4ZaHcSEhLfcYv3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b55bc86efff5e85c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH58vkr63O065nnb+V4k9/6un7EbuR+OrxhsKRr+2Pgbkjh1HuaUwIGCkkpllw2x/Heho12kIXwFgQrwUBr7j5P4K5rL2QciHnVxJk47Dhjl2Jj2JJ3xfc9qooaSm1icSULKghBCblqKi0mYugwWYC1mocIwaPJPt/8/yBCtK1mkwcRtKE9MxZcGvCZo+ucbuRbyEDaqYHRU948Fyu75FXZz6J5dIiMEOA+Vx0iBD7ZqNIJPC8qylyiZu5ky7JfoYnnswquSfBuHZJkFx8DPD49XPamV023MVXtEwxbkZ9qJvfsoS1BnpfUJSjeZkStl4XljF+UykV/v+plcOSNojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7VzH6NTtehvGbJ/7QpdOn/OZApWx2FdsX+6WHygoSw=;
 b=e9JUByv/HNs73Uj28i05PWw4T1hIaKF8Wyl3PZdfKxIlwPHEJwoa3wk+MC1eqHQK9Btm8Zj6PCWL6rd6fJB1+DKdf2K77BerZx9A9uK25Bnw5fITVZ8NvhSnIEnJZCzcpD9OPQkgD3QvbnfvQ+YhhphQmNdr6EOr+1V5RVJ+sZw33P+o7l4gdGN6j8QqXf+4YaC8O21eq5byjqE9D19xgG7fnIkSVkJjGEAT1v9BRAPuRvOTELdqmavywqe7GHycRAoOZXS2w1FKP2pvNZACESICyggHkXv05r4bffF/6ON6HFANQ6pbriYp+T2EGRcIfFTqtg2+1hBi+HR3z1co7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7VzH6NTtehvGbJ/7QpdOn/OZApWx2FdsX+6WHygoSw=;
 b=ZNwrH7Sb2sbK0mJvyEVOBptPuPukiifZLECwYzCHtQSqZN1hh6Eoyx4zM5Xy+U9w91Sfwg9hIvSJpu5kNPEctZqDBufdPxfAW1x3TSzgq+qCYCwDQRNkJ8mWiZwDmiNy6mI4X4gIUdmvLIpysf2bIZULjlVd4ZaHcSEhLfcYv3o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Thread-Topic: [XEN PATCH v1 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Thread-Index: AQHaipO7JiFTQp6ixkmJ3l2NEqDHxrFhFj2A
Date: Wed, 10 Apr 2024 07:07:17 +0000
Message-ID: <824C6BD9-4687-4F84-9CBE-8E4BCACCC447@arm.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-4-jens.wiklander@linaro.org>
In-Reply-To: <20240409153630.2026584-4-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7640:EE_|DB5PEPF00014B9A:EE_|GV1PR08MB7916:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5wL9OC2gaptkc7YItV6nOcq3f0EZBEUOaeqewJ1ZzoXQ+kBB125goUrl82vPhMZ0nUSe/pMuBW8br738kWtc22Ga1KlnWvs9KBMXSTaN8ZzGhx0kWIo+dnUCu8VYigkL8/R6BREl8X/C8DCqRtW9G8rjEd3xZqnC+2ai/ZPYlxzsSw/SXRFSA6Ren4EGlffqjmiQXugaK4tpm6PV1lyDkyT3iJ30bYwUDhh0sRseSDsnOk91cSRfVgLKdBsFU/5E9PgD3IZts5TwM4D8HE7zifkRChz/5I49uL6tAhdXfoEzFg+YH0rWla660AbOiZX2n37KwxeiQtP1Sqnxgkf1IiEC5eyBurbTxW8oVsIL6CF4IWOVhJxRODrIWNs+ZGiSaHOvAs1Vyu2BniN9wApUEipaq2HAtGFd2tEqFRgrWRiy3WFNQFWZEm38em2LfdyvAEKsxT7H1MIUbfoFzuw+f23eqXhGWjkda5U4rgcEUU7tBHtxTUC9meRv8hXfCtxsCDMeu9rAsyRXH1ejXlSYIWCIMoaADDObm8JId/cS+G65YcVpLxEQNMpXQRePH9oTyJjQdAYtht/D2VlAUx7PJaCY0it9Jnp3H8EIRhQ3l486H8WhBMWiAMfQ0dTk1kW9koPhgoaVvqPaDQ+rN6lpDc0DOGVy1E11rRTNIxgWxOM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <84AB922516548F4791F2C40EA28D2615@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34f63ef6-6e38-4b6f-21fc-08dc592ce139
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NlzqqYSxvYdIZi44hmc0MhGL66smIEcDboOCpZrKp/Q1TAvIYjDe/ydfW/TRIUVYCR1knI7BFkABTg9qK/jKHg0Lnu9ZG75ZVcXqyei1qwXFkFyhDBtIrzcZrUbrDZA7azcR3s5UkuKJk9icyIeMowvPNRKo8FXngTQ5iCvrv0ge+thcPWjcNZYcBM/dWhlqmbj+6W+cF5Tjk3G7iNKq6VGphIDnAbOpOwXpKEdh0k9mjrbxiqSFc2ZscB+y5HLDEEzAekeN4qSSpqDeqBfbwTwIEalureBA3oeIQ7uZQnRNoDeTg5cB49GbgT2EbPaRpWwXwmMwCFs3EeRQ+49zq+YrlHv3OW3yPH6ixL6+cBG3zhE/3yXM51CafUngnGV/wJ0PMCqYi9z8UxBpg+W+stB6GGHn9BtcJdK7sx+F/2k3VXSy8TjxKvmOWwO1CnF2ZeuWhlROKSDG5D/abyIQWq8Q/ktYHo/kPC5bP8h0fQUxYK6YcbWvMuioLqXoxgX5uBqtYPCNfIMB/QyxO5fHsfI3GdQ7Y+ZpYnPzmI0t/IRYKAyHNXShSZH4L8zodd9rYH7h4Q7J2HlP4a0yN7hM00XMyy9+1+ZY9lBZOqndlNd9rGTx3U6G5T28+Ls5bvzbmbehXMutrVrsUQo/PlyBUIy4/vg9+vsrHnyBaMOIh82OU8tev2qZXY9ZeB/xF0204p9vL02TYNS7SesGvLE3hHpvOmCIKSlaT+LA33HmiSGOjINVYpstioJ6z0Z1XgcR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:07:27.1662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f63ef6-6e38-4b6f-21fc-08dc592ce139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7916

Hi Jens,

> On 9 Apr 2024, at 17:36, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Simplify ffa_handle_mem_share() by removing the start_page_idx and
> last_page_idx parameters from get_shm_pages() and check that the number
> of pages matches expectations at the end of get_shm_pages().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa_shm.c | 18 ++++++------------
> 1 file changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 75a5b66aeb4c..370d83ec5cf8 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -159,10 +159,9 @@ static int32_t ffa_mem_reclaim(uint32_t handle_lo, u=
int32_t handle_hi,
>  */
> static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
>                          const struct ffa_address_range *range,
> -                         uint32_t range_count, unsigned int start_page_i=
dx,
> -                         unsigned int *last_page_idx)
> +                         uint32_t range_count)
> {
> -    unsigned int pg_idx =3D start_page_idx;
> +    unsigned int pg_idx =3D 0;
>     gfn_t gfn;
>     unsigned int n;
>     unsigned int m;
> @@ -191,7 +190,9 @@ static int get_shm_pages(struct domain *d, struct ffa=
_shm_mem *shm,
>         }
>     }
>=20
> -    *last_page_idx =3D pg_idx;
> +    /* The ranges must add up */
> +    if ( pg_idx < shm->page_count )
> +            return FFA_RET_INVALID_PARAMETERS;
>=20
>     return FFA_RET_OK;
> }
> @@ -460,7 +461,6 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
>     struct ffa_shm_mem *shm =3D NULL;
> -    unsigned int last_page_idx =3D 0;
>     register_t handle_hi =3D 0;
>     register_t handle_lo =3D 0;
>     int ret =3D FFA_RET_DENIED;
> @@ -570,15 +570,9 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>         goto out;
>     }
>=20
> -    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> -                        0, &last_page_idx);
> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count);
>     if ( ret )
>         goto out;
> -    if ( last_page_idx !=3D shm->page_count )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
>=20
>     /* Note that share_shm() uses our tx buffer */
>     spin_lock(&ffa_tx_buffer_lock);
> --=20
> 2.34.1
>=20


