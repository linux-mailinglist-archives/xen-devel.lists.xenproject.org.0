Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0189ECA6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702948.1098653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruSiO-0007Ng-J3; Wed, 10 Apr 2024 07:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702948.1098653; Wed, 10 Apr 2024 07:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruSiO-0007LQ-ED; Wed, 10 Apr 2024 07:49:52 +0000
Received: by outflank-mailman (input) for mailman id 702948;
 Wed, 10 Apr 2024 07:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh3E=LP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ruSiM-0007LK-QK
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:49:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a47ea4-f70e-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:49:50 +0200 (CEST)
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by DB9PR08MB8698.eurprd08.prod.outlook.com
 (2603:10a6:10:3d2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:49:43 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::5a) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:49:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 07:49:42 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300");
 Wed, 10 Apr 2024 07:49:42 +0000
Received: from f5c9fbaaeeba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A78C6EB-C0D4-4445-BB6A-5AA92AFD5B63.1; 
 Wed, 10 Apr 2024 07:49:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5c9fbaaeeba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 07:49:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5680.eurprd08.prod.outlook.com (2603:10a6:800:1a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:49:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:49:33 +0000
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
X-Inumbo-ID: e8a47ea4-f70e-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qat8slgllG2WZl3STz/Ep/5JuUV9oZH/ztAMSeh9i2/cli2YVZYbhVu1sp5q4S35EQmXsTZ3htGn9O4di5x+ZmWmynBD8d6S9JYkRZ51Swkuqm6TPFR80uvO5tX24RfcWMQ0L9taZK+G/cI9GoBLsp1hhAhUYvG1dgpkDyrk0v2Nuu0eAAwFzBnN/xMvxbr7Zgc0mROKjvdhKkc/9/IU3/wRvNoqFwZjCWz3ksBFHphI0OxwvQ9pnlUgziJIqiWYOHxZwEliigeMmTqHh4XwcRrLH7cZcuPw2HAs2ffa9IwGgs52LzCvRFD3niYAui8oomOKn23+SIi2YvsNou7Dbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlXzSNJI2IUXkEgK5R6+JWwSAC75UXKrxfYJpPelcpw=;
 b=lCAvllOCkfBIxpapjUSLUs6mogQKrg1LCVahBmRELLgrGHtC1+0Y6t0GAyaQqOCJ7F2mLW/gWbWxgL+ar9S/vT6TpRdp2CIKOrK7iw/q4QcwHF2pJW8PnYZyYfm+s3R2fEazGmNL8A2J3SGyf1Mx3AgpSoZTsT//8QZz6P7kJFMxe8oGyp5vurgtBiNc5skiMqFdxYxoqolG1UyiR1uljmnPWmso4L/ohfyvhoGbpB31zpdRV0xPoSfhOXg7Ym5t+beu853rU5egqF/YGprgYgYyThw+PgFkUFfD47EXXqiRS7BWb1HqkLwz9co3LApToeasoOiuMb0LgkUwMFWPfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlXzSNJI2IUXkEgK5R6+JWwSAC75UXKrxfYJpPelcpw=;
 b=24R8T36b7SSn3vQJYQqzmVs0fOHL87VnFppcJIxsOFlVUB4ZgXE0spDA37PxDvymS2vU4NLetf1jMr2CroDOu7NN55MCjKcN4LQam6L/Rd+KPQ2ySu7NcfgmvWpjl2g/hPY8Flji2muMuwhZgTjxOjCJtI1H670CsRfohqGVVa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de6f831f5d0e2a7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9jCFKO6OogDSGjim+UfI+ogKeCQzDpJ5NMxyIx/xLJAC9fc5ZjsCLAdvxdNfvF5YM8jgqDiezbeEwM8L4lTkt320t6pGNTnZgBvjk5r3EESDAz8mOkGtnNGX0nwKtdhTrPD495TpZAXzyBiVDVYBdCySca+oih5U6ILf4Mk1A+JDFV+TgIS4T0g135u+OHj2RbDZgDei4q2R+TNYuyAGE8hvJi8IGlkIIbs/t5ZjMrSBZPH5/q7PIoEN7hBV3DOZUIElSWRTZLY1Ll4NVdjpPEjo/8VRa0E31WDXTrO3FcQleLiFogjZRc3ushjAOErs03RwFKH5xuNYGTDZOgvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlXzSNJI2IUXkEgK5R6+JWwSAC75UXKrxfYJpPelcpw=;
 b=g8U0n8icrey+1StK13Dv8F74K0bvwqwKEBB3A/cU+S/Gg+KNa5nuUG9yuZy31uXI+lHhZUcfNB/FH6ZJWrggNMzB1bS/bEuuR478lZUfLVyHFLXDub1vYBMaVBCRqSPtb9T3nw9bUkVRyEphlWPRTqsoUyRO1dCkxd6komYQCyiwPDumYQvPgznhGRvCzoS/iOTRrxh49ujGk6eoKbST8uitUba/Jh1BHnyPGqGC5/Y+F5MTM1r/BEl9ZzFu+C5O5VCs03TMJ1nT1tSP56jw3PnoFOKBriJAwBQHWOY/P2SMKKuar6nmu+LhkGUIUJwHNGIpdjgGysezRIKp8wPvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlXzSNJI2IUXkEgK5R6+JWwSAC75UXKrxfYJpPelcpw=;
 b=24R8T36b7SSn3vQJYQqzmVs0fOHL87VnFppcJIxsOFlVUB4ZgXE0spDA37PxDvymS2vU4NLetf1jMr2CroDOu7NN55MCjKcN4LQam6L/Rd+KPQ2ySu7NcfgmvWpjl2g/hPY8Flji2muMuwhZgTjxOjCJtI1H670CsRfohqGVVa0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
Thread-Index: AQHaipO/QuGF8TXkikCEHPNBW62gObFhIgsA
Date: Wed, 10 Apr 2024 07:49:33 +0000
Message-ID: <C9733F1F-E308-46D3-AC84-D4651B4D6723@arm.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-6-jens.wiklander@linaro.org>
In-Reply-To: <20240409153630.2026584-6-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5680:EE_|DB1PEPF0003922D:EE_|DB9PR08MB8698:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iYf5Vq7pTl7DlcG9onQXx3TXbjfkXRyx/mjgdU8MURqmKmWvLIxSNTS0fl2MRdyG5OY1veLXzytUTTmQMd6ceN8EAV9XXwn47+uvIACUNWxTYuO91ZBHZx1/eZ3WDDAXWKHdo+Op3C0L2rgGJfp9yJlzmCzFW5r05eRo4Tr603FTz1cixwoDYUUdfKeKhcaOG5/2OlH1GT/Qg1qs84WzZIWK6KyvyOZVUiKASFQtwRRpJXtp2DZh+i/3FW/q22EU33lAxEViKVzqcQfstz3EM1oJroppBSpUYYZAF6N2iqfIh3t0hVACZkorej0pIpBldYXG24aidGbiuvSfo0r5MVjKfujzw3sI6H0VM51AnjXpnPGVn+WXJtbNH3wxCZzV9lw9H2+mW3Hg8QQIlJgRcLT+OUUnrna7TKmgZzY8/hRAgZnOJ5S3bCJ7YW6h+xWvDVRF4qkLLFZkxUC/1GFLpxlIt8lwOwCpnO1yA2ciSbD2lBUhp3wDjPDdfRpiC3EZkQCqZ12jxnBavXG4DGdUTLYS1x/yr5riEX8O/xuhf1a4h7slpUJU6yhcrwdqpY//BF9f5n/tvRTRs3YarW19ahS1DxuDdpXVzLEM7C9n4cF9gi+N1pNAQLuzKrX4wNAdi4/tHvMUiaRmiykHrDdlIYhWMR4FA/0Ugo7EX108hlg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93A1979807AABE468F2271767D0EA0BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5680
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b3313fc-85a0-4f79-d032-08dc5932c873
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QLMzh2Qh3eH2/D1OSUQ0q4z7LCNuLzlF92Yn8Agm4l1rh3x2rdX7S9emUU682zd3Z2wm75hV3NXx1rO5vf0dz9Kkay9lBvNaD5faSlZ/nEqyCbgMWpG1qNb5u7kDfAGdNyldChbKC39FJJcdBg4GAf1DlSg9u9YFxFtFcUxliiHMh2db8uOnaGUK9sUpvBkx+zwHldo6L/4H8c4QlEgB8UO8sf6kJDUJt5+HHmTLqH/JMiEWuQMo3dZnPJkT6q1pz7FOBCwKi6drvCqO2AB7HGGsDMnCVKfzEywKGGtBvbwChu6ea7vj99u+J1sXtUyOjv3Y3nSlCRDva26bL04cOjm5hmTq/b+URb4J3vckPVCeP4vXASGUHGWi0lOG8+CPf96nHrJaVkRI5AWly12f+Kd2s2CtKFIJQvRVK05xzmDn0GqzJKKJZP/5gcjE88KRCmJm2Yqasi2mbxcPjmSzZ5pMD5e1zOo3VDhaa7LJzKlpE/DLRfxoIZeWaHAHlojjZEdFFm8+ISGU81YNw311VoMc8EeXTSztq2awRmH3+g1IGI/qhNiBfdSIJcbhIAx0/BCHEmsau41jpVC1CvGOmIcrj6LKvajucjGdA1q12+6EeRYwZUqjJIMMwZQ2ushfFYRu71MFJFldFOMkGKLcpYYtwV/HQ8P5pDZ06jv11B2UjsPNg2ThRPoPABhlmoSGCpLAzK4OJxUpd11/4q/6Fdy7G7hwXkLJHpaciXULTUGc4OR8tXZ9RTsYhV0LE+uA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:49:42.6037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3313fc-85a0-4f79-d032-08dc5932c873
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8698

Hi Jens,

> On 9 Apr 2024, at 17:36, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Add support for FF-A notifications, currently limited to an SP (Secure
> Partition) sending an asynchronous notification to a guest.
>=20
> Guests and Xen itself are made aware of pending notifications with an
> interrupt. The interrupt handler retrieves the notifications using the
> FF-A ABI and deliver them to their destinations.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/Makefile      |   1 +
> xen/arch/arm/tee/ffa.c         |  58 ++++++
> xen/arch/arm/tee/ffa_notif.c   | 319 +++++++++++++++++++++++++++++++++
> xen/arch/arm/tee/ffa_private.h |  71 ++++++++
> 4 files changed, 449 insertions(+)
> create mode 100644 xen/arch/arm/tee/ffa_notif.c
>=20
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index f0112a2f922d..7c0f46f7f446 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5209612963e1..ce9757bfeed1 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,6 +39,9 @@
>  *   - at most 32 shared memory regions per guest
>  * o FFA_MSG_SEND_DIRECT_REQ:
>  *   - only supported from a VM to an SP
> + * o FFA_NOTIFICATION_*:
> + *   - only supports global notifications, that is, per vCPU notificatio=
ns
> + *     are not supported
>  *
>  * There are some large locked sections with ffa_tx_buffer_lock and
>  * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> @@ -194,6 +197,8 @@ out:
>=20
> static void handle_features(struct cpu_user_regs *regs)
> {
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     uint32_t a1 =3D get_user_reg(regs, 1);
>     unsigned int n;
>=20
> @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>         BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>         ffa_set_regs_success(regs, 0, 0);
>         break;
> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);

This should return the RECV_INTR, not the PEND one.

> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +
> +    case FFA_NOTIFICATION_BIND:
> +    case FFA_NOTIFICATION_UNBIND:
> +    case FFA_NOTIFICATION_GET:
> +    case FFA_NOTIFICATION_SET:
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>     default:
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         break;
> @@ -305,6 +334,30 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>                                                      get_user_reg(regs, 1=
)),
>                                    get_user_reg(regs, 3));
>         break;
> +    case FFA_NOTIFICATION_BIND:
> +        e =3D ffa_handle_notification_bind(get_user_reg(regs, 1),
> +                                         get_user_reg(regs, 2),
> +                                         get_user_reg(regs, 3),
> +                                         get_user_reg(regs, 4));

I would suggest to pass regs and handle the get_user_regs in the function.

> +        break;
> +    case FFA_NOTIFICATION_UNBIND:
> +        e =3D ffa_handle_notification_unbind(get_user_reg(regs, 1),
> +                                           get_user_reg(regs, 3),
> +                                           get_user_reg(regs, 4));

same here

> +        break;
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        ffa_handle_notification_info_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_GET:
> +        ffa_handle_notification_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_SET:
> +        e =3D ffa_handle_notification_set(get_user_reg(regs, 1),
> +                                        get_user_reg(regs, 2),
> +                                        get_user_reg(regs, 3),
> +                                        get_user_reg(regs, 4));

same here

> +        break;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -348,6 +401,9 @@ static int ffa_domain_init(struct domain *d)
>     if ( !ffa_partinfo_domain_init(d) )
>         return -EIO;
>=20
> +    if ( !ffa_notif_domain_init(d) )
> +        return -ENOMEM;

Having this function deciding on the return code is a bit weird.
I would suggest to have ffa_notif_domain_init returning an int
and deciding on the error code and this one just returning the
error if !=3D0.

If possible the same principle should be applied for the partinfo.

> +
>     return 0;
> }
>=20
> @@ -423,6 +479,7 @@ static int ffa_domain_teardown(struct domain *d)
>         return 0;
>=20
>     ffa_rxtx_domain_destroy(d);
> +    ffa_notif_domain_destroy(d);
>=20
>     ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
> @@ -502,6 +559,7 @@ static bool ffa_probe(void)
>     if ( !ffa_partinfo_init() )
>         goto err_rxtx_destroy;
>=20
> +    ffa_notif_init();
>     INIT_LIST_HEAD(&ffa_teardown_head);
>     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0)=
;
>=20
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> new file mode 100644
> index 000000000000..0173ee515362
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -0,0 +1,319 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +static bool __ro_after_init notif_enabled;
> +
> +int ffa_handle_notification_bind(uint32_t src_dst, uint32_t flags,
> +                                 uint32_t bitmap_lo, uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;

s/0xffff/0xFFFFU/

> +
> +    if ( flags )    /* Only global notifications are supported */
> +        return FFA_RET_DENIED;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> +                           bitmap_lo);
> +}
> +
> +int ffa_handle_notification_unbind(uint32_t src_dst, uint32_t bitmap_lo,
> +                                   uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;

s/0xffff/0xFFFFU/

> +
> +    /*
> +     * We only support notifications from SP so no need to check the
> +     * destination endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> +                            bitmap_lo);
> +}
> +
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool pending_global;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    spin_lock(&ctx->notif.lock);
> +    pending_global =3D ctx->notif.secure_pending;
> +    ctx->notif.secure_pending =3D false;
> +    spin_unlock(&ctx->notif.lock);
> +
> +    if ( pending_global )
> +    {
> +        /* A pending global notification for the guest */
> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm=
_id(d),
> +                     0, 0, 0, 0);
> +    }
> +    else
> +    {
> +        /* Report an error if there where no pending global notification=
 */
> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> +    }
> +}
> +
> +void ffa_handle_notification_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t recv =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t w2 =3D 0;
> +    uint32_t w3 =3D 0;
> +    uint32_t w4 =3D 0;
> +    uint32_t w5 =3D 0;
> +    uint32_t w6 =3D 0;
> +    uint32_t w7 =3D 0;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    if ( (recv & 0xffff) !=3D ffa_get_vm_id(d) )
s/0xffff/0xFFFFU/

> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
> +    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    {
> +        struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_NOTIFICATION_GET,
> +            .a1 =3D recv,
> +            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +        int32_t e;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        e =3D ffa_get_ret_code(&resp);
> +        if ( e )
> +        {
> +            ffa_set_regs_error(regs, e);
> +            return;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
> +        {
> +            w2 =3D resp.a2;
> +            w3 =3D resp.a3;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
> +            w6 =3D resp.a6;
> +    }
> +
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> +}
> +
> +int ffa_handle_notification_set(uint32_t src_dst, uint32_t flags,
> +                                uint32_t bitmap_lo, uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;

This needs some checking as i would have used the lowest bits here
for the source and not the highest. The spec is using the same description
for all ABIs so I am wondering if you are not using the destination instead=
 of
the source here.

> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> +                           bitmap_hi);
> +}
> +

The following function would deserve some explanation in a comment
to clear up a bit what is done here and why.

> +static uint16_t get_id_from_resp(struct arm_smccc_1_2_regs *resp,
> +                                 unsigned int n)
> +{
> +    unsigned int ids_per_reg;
> +    unsigned int reg_idx;
> +    unsigned int reg_shift;
> +
> +    if ( smccc_is_conv_64(resp->a0) )
> +        ids_per_reg =3D 4;
> +    else
> +        ids_per_reg =3D 2;
> +
> +    reg_idx =3D n / ids_per_reg + 3;
> +    reg_shift =3D ( n % ids_per_reg ) * 16;
> +
> +    switch ( reg_idx )
> +    {
> +    case 3:
> +        return resp->a3 >> reg_shift;
> +    case 4:
> +        return resp->a4 >> reg_shift;
> +    case 5:
> +        return resp->a5 >> reg_shift;
> +    case 6:
> +        return resp->a6 >> reg_shift;
> +    case 7:
> +        return resp->a7 >> reg_shift;
> +    default:
> +        ASSERT(0); /* "Can't happen" */
> +        return 0;
> +    }
> +}
> +
> +static void notif_irq_handler(int irq, void *data)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int id_pos;
> +    unsigned int list_count;
> +    uint64_t ids_count;
> +    unsigned int n;
> +    int32_t res;
> +
> +    do {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        res =3D ffa_get_ret_code(&resp);
> +        if ( res )
> +        {
> +            if ( res !=3D FFA_RET_NO_DATA )
> +                printk(XENLOG_ERR "ffa: notification info get failed: er=
ror %d\n",
> +                       res);
> +            return;
> +        }
> +
> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) =
&
> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> +
> +        id_pos =3D 0;
> +        for ( n =3D 0; n < list_count; n++ )
> +        {
> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            struct domain *d;
> +
> +            d =3D ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_pos=
));
> +
> +            if ( d )
> +            {
> +                struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +                spin_lock(&ctx->notif.lock);
> +                ctx->notif.secure_pending =3D true;
> +                spin_unlock(&ctx->notif.lock);
> +
> +                /*
> +                 * Since we're only delivering global notification, alwa=
ys
> +                 * deliver to the first vCPU. It doesn't matter which we
> +                 * chose, as long as it's available.
> +                 */
> +                vgic_inject_irq(d, d->vcpu[0], FFA_NOTIF_PEND_INTR_ID, t=
rue);
> +
> +                put_domain(d);
> +            }
> +
> +            id_pos +=3D count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}
> +
> +static int32_t ffa_notification_bitmap_create(uint16_t vm_id,
> +                                              uint32_t vcpu_count)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_CREATE, vm_id, vcpu_c=
ount,
> +                           0, 0);
> +}
> +
> +static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0,=
 0);
> +}
> +
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_FEATURES,
> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int irq;
> +    int ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +        return;
> +
> +    irq =3D resp.a2;
> +    if ( irq >=3D NR_GIC_SGI )
> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
> +    if ( ret )
> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> +               irq, ret);
> +    notif_enabled =3D !ret;
> +}
> +
> +bool ffa_notif_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t res;
> +
> +    if ( !notif_enabled )
> +        return true;
> +
> +    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> +    if ( res )
> +        return false;
> +
> +    ctx->notif.enabled =3D true;
> +
> +    return true;
> +}
> +
> +void ffa_notif_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( ctx->notif.enabled )
> +    {
> +        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ctx->notif.enabled =3D false;
> +    }
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 98236cbf14a3..26c2af164d38 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -25,6 +25,7 @@
> #define FFA_RET_DENIED                  -6
> #define FFA_RET_RETRY                   -7
> #define FFA_RET_ABORTED                 -8
> +#define FFA_RET_NO_DATA                 -9
>=20
> /* FFA_VERSION helpers */
> #define FFA_VERSION_MAJOR_SHIFT         16U
> @@ -60,6 +61,8 @@
>  */
> #define FFA_PAGE_SIZE                   SZ_4K
>=20
> +#define FFA_NOTIF_BITMAP_SIZE           64
> +

This does not seem to be used.

> /*
>  * The number of pages used for each of the RX and TX buffers shared with
>  * the SPMC.
> @@ -97,6 +100,18 @@
>  */
> #define FFA_MAX_SHM_COUNT               32
>=20
> +/*
> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
> + * unused, but that may change.

I am a bit wondering what your TODO means here.
Do you mean that we should have a way to "allocate a free SGI" ?

> + *
> + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not u=
sed
> + * by a guest as they in a non-virtualized system typically are assigned=
 to
> + * the secure world. Here we're free to use SGI 8-15 since they are virt=
ual
> + * and have nothing to do with the secure world.
> + */
> +#define FFA_NOTIF_PEND_INTR_ID      8
> +#define FFA_SCHEDULE_RECV_INTR_ID   9
> +
> /*
>  * The time we wait until trying to tear down a domain again if it was
>  * blocked initially.
> @@ -175,6 +190,21 @@
>  */
> #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>=20
> +/* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> +#define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> +#define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> +#define FFA_NOTIF_FLAG_BITMAP_SPM       BIT(2, U)
> +#define FFA_NOTIF_FLAG_BITMAP_HYP       BIT(3, U)
> +
> +#define FFA_NOTIF_INFO_GET_MORE_FLAG        BIT(0, U)
> +#define FFA_NOTIF_INFO_GET_ID_LIST_SHIFT    12
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
> +
> +/* Feature IDs used with FFA_FEATURES */
> +#define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
> +#define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
> +
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> @@ -213,6 +243,27 @@
> #define FFA_MEM_FRAG_TX                 0x8400007BU
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
> +#define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
> +#define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
> +#define FFA_NOTIFICATION_BIND           0x8400007FU
> +#define FFA_NOTIFICATION_UNBIND         0x84000080U
> +#define FFA_NOTIFICATION_SET            0x84000081U
> +#define FFA_NOTIFICATION_GET            0x84000082U
> +#define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> +#define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> +
> +struct ffa_ctx_notif {
> +    bool enabled;
> +
> +    /* Used to serialize access to the rest of this struct */
> +    spinlock_t lock;
> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending global notifications.
> +     */
> +    bool secure_pending;
> +};
>=20
> struct ffa_ctx {
>     void *rx;
> @@ -228,6 +279,7 @@ struct ffa_ctx {
>     struct list_head shm_list;
>     /* Number of allocated shared memory object */
>     unsigned int shm_count;
> +    struct ffa_ctx_notif notif;
>     /*
>      * tx_lock is used to serialize access to tx
>      * rx_lock is used to serialize access to rx
> @@ -271,12 +323,31 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register=
_t tx_addr,
> uint32_t ffa_handle_rxtx_unmap(void);
> int32_t ffa_handle_rx_release(void);
>=20
> +void ffa_notif_init(void);
> +bool ffa_notif_domain_init(struct domain *d);
> +void ffa_notif_domain_destroy(struct domain *d);
> +
> +int ffa_handle_notification_bind(uint32_t src_dst, uint32_t flags,
> +                                 uint32_t bitmap_lo, uint32_t bitmap_hi)=
;
> +int ffa_handle_notification_unbind(uint32_t src_dst, uint32_t bitmap_lo,
> +                                   uint32_t bitmap_hi);
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
> +int ffa_handle_notification_set(uint32_t src_dst, uint32_t flags,
> +                                uint32_t bitmap_lo, uint32_t bitmap_hi);
> +
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
>     return d->domain_id + 1;
> }
>=20
> +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
> +{
> +    /* -1 to match ffa_get_vm_id() */
> +    return get_domain_by_id(vm_id - 1);
> +}
> +
> static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0=
,
>                                 register_t v1, register_t v2, register_t =
v3,
>                                 register_t v4, register_t v5, register_t =
v6,
> --=20
> 2.34.1
>=20


