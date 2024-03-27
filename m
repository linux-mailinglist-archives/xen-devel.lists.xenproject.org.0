Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782188E2BD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698524.1090281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTP2-0007wV-Pe; Wed, 27 Mar 2024 13:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698524.1090281; Wed, 27 Mar 2024 13:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTP2-0007u9-MT; Wed, 27 Mar 2024 13:33:16 +0000
Received: by outflank-mailman (input) for mailman id 698524;
 Wed, 27 Mar 2024 13:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTP0-0007u3-Vw
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:33:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9bf39e-ec3e-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:33:12 +0100 (CET)
Received: from DBBPR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:c0::31)
 by GVXPR08MB7750.eurprd08.prod.outlook.com (2603:10a6:150:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 13:33:02 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:c0:cafe::25) by DBBPR09CA0019.outlook.office365.com
 (2603:10a6:10:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 13:33:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:33:00 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Wed, 27 Mar 2024 13:33:00 +0000
Received: from a3f27a37e57e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1086D728-43FA-40B9-A9A3-BC28DAC86611.1; 
 Wed, 27 Mar 2024 13:32:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3f27a37e57e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:32:54 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB10365.eurprd08.prod.outlook.com (2603:10a6:10:40b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 13:32:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:32:52 +0000
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
X-Inumbo-ID: 8e9bf39e-ec3e-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ageVVESP/MbywS6tCK4s0UNXPd9NZPBTkkcemh/9j631Rkw4W31K0Kvq+3avXlnKKykT/sjnxFQq8BjadSrCiug3TAlBOiR5WvSYyEl6z5OC9Lgxr5kCTqZuX2d68ojY3t54TDJgOK0lU+aMceE1dlhWffBqTP7ZuuQ2RYuLL44iB4RKb8F5KMh2EhguQwMzn+LpBa4vfDrJVh/aRUvxjZUxLDs/1oL3Hkr2rO4NZMsGK/3nLpYpWOtXz4Wx1g9MZ64PmvDL7KjyW7SyIV12ZvVK0jpOJPa6fEXHbTpNOO9B3MqNhbJy/2jG/p0maesqNcoz1CWNgvvW6NKCXKWocQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWr9Ek+dp+cK4B/SkVhBoOst871GlXjdexVPP3QCl6A=;
 b=jd1g8igvaA9Xc9HydJIV1tR+HVS/Exdn+6v+r/M86xHoCtJejqFzdQXybFrNkztB0Ds+sawTGlAN4sVWFvchOldHMPRilv9oNHUH2CZohUC5GGOqJL7DT+PKFx5AYacoe9z9SsGPnhTUIlOanOmjV+1KTEvze2QSUjvrjPgnOJkDBVChoftgoFtiIcEgeZkv+Y8CaHRvbSiNzJMzuvlVMNuiYj99bDr+M7xSox4De2C1/nCaFzK0ocqbxJyMEvl1XyEm2HGQWO5vXMqjUteMS/0DS4oFotzJxnxUGP2P8m9uiMTwdv/8bKHST4JTodwlPfH9Ovt7yKLFkNyM/rfQtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWr9Ek+dp+cK4B/SkVhBoOst871GlXjdexVPP3QCl6A=;
 b=SUrUADUtGoc6E97Y9t9uXOFE2fnCb666xdUIbg8hPFHHOU7O6MVKjnlKPAfdRtqyJmKi7zIrxurNwDtYZSa2lL2wAz057wL8TmZS22Kzs8854A3IIUS9qdWHfzhaDgiwJwEhBhBzX3ALxg1dJiBlC/6Q4uE7K0wWIbF0uRR2AOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 563211b93ee5cd55
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRhS6XK2xoWGo8IVDrZAm/rARzsfXJi0BVCm+Wbv5Q62xSzR+m7zc27SGD/qd/ikG+5rSKFw6zXOZhDyj9s6ac/n942H+yDTjZfzMEvaQEiPyGpWraLVEf5cjbwj/pO0GCky6I2BgMMMH20OUdcBQvpgQ6i4u49SPZ+BuB2R+b24kDdb/MsEdeYOKXvcS9IeMgmZwOAD+50kKLPuU6Xnye1bl3Lsx5CFnpKgtF2rC6aUHWpCFAMDgP22YSQ+MuUkxB8aYnuS4Ol/6oV1DFwlkfUwVVIP8Umo7He6qpuNk74ihQTyWarjJb29fSsot0zxhdB7GD9a1+rY+r/1xGd2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWr9Ek+dp+cK4B/SkVhBoOst871GlXjdexVPP3QCl6A=;
 b=KIPko24upQv9K2nMfTQxVPLKSuKY+3wQfiK+t+XAblAuc9H4P2djwIvw0ckfem0tQ9Spf9qfFQa3xG9QZeTaw37Owt7QnauXshNs7FVADP+UWip9Cv7mu6qqig7gOkjqGPSKcevU6QGksr81OhSGTpoNxglG/K5e8XOdNrOVdk1fk7YduD4cG6fJGrgIa6tslnB68KytJ/fnU5YVHG3ixbX52tW7S6YM/asqZ+LqzH40yM5SrZTUO03zhMdku2DLlb9z4V0UiAhQttE4CKwr4EPWv5HdayflUOdDUfPyN7159xML/U1F8skYA5IVp/kO9iuYu1h7di0NFQoq3oSsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWr9Ek+dp+cK4B/SkVhBoOst871GlXjdexVPP3QCl6A=;
 b=SUrUADUtGoc6E97Y9t9uXOFE2fnCb666xdUIbg8hPFHHOU7O6MVKjnlKPAfdRtqyJmKi7zIrxurNwDtYZSa2lL2wAz057wL8TmZS22Kzs8854A3IIUS9qdWHfzhaDgiwJwEhBhBzX3ALxg1dJiBlC/6Q4uE7K0wWIbF0uRR2AOU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 2/6] xen/arm: ffa: move common things to ffa_private.h
Thread-Topic: [XEN PATCH 2/6] xen/arm: ffa: move common things to
 ffa_private.h
Thread-Index: AQHafphSE/5Uz86UYk6OOyk0wCz8a7FLmUwA
Date: Wed, 27 Mar 2024 13:32:52 +0000
Message-ID: <0F379C91-B3A8-4864-B8DD-9E08E8D92FFD@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
 <20240325093904.3466092-3-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-3-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB10365:EE_|DU6PEPF0000B621:EE_|GVXPR08MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ce3869-69a9-45ac-6b60-08dc4e626bd8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ynrNCJ0fNL/F5Gwo/W2Dgs2ME6nIBFl7hAL+HR+q6f5I7vimnwIZPcc5wuTe7g4fCQtCQCjTMskVFtdQFnKVMBwXTd2rdA7vhsxOM+vOXHQ2LdLgP314o1yOauEIvy0GIwSLC8nOWB33kiSeHE6mkWP33WijHIDboLEHApC16GXd2mxuP5ns6UL6KMRa7SpZsfQ+SDU19y7S4uPP3q/GEG+dpSngDe4p0BO700IkyLCiQISxgNEGDm2DgPo9Jq8JQiE3CMBvxw3f54zJyD+xLLThKAC2nJaXMYS1qAXMZ9IJNjMYYKeI/GB8R3In93eTcPGzC4gXZOsTTy+NoFJqSRAlUwVwKPI/moxXwM7Ty+7e8G7Nm22CDY16Sv45W0RGu/kv0kJLo9FjvuleVBiWx4p6DeViY1EVp8PA8mQcGl0rIZUgBip3NeJf1t1giZyzpXMq6+y4aDbS42rlTKwzd6/ozFHrBpUv43w9+PHdOKrbDZ2q/3vmgVlG1fNkWU0Bz1xnJbF07pP7Wi9u0YeNVvy7WA/q1/oMFea7ZrxQopvIhu/Ax30FT638x3sGbYbiQNDfQPI6TKWTzI+O5vSa6QebsJapFrBu4j+XSI8yNpcoTL+ab8HwpMD+KXfM+sVXIFvbXsipfGgvRZfFXaDBFFIhSrmnturii9boOwfd/G8hK13OcUdZ1O3Pe47//px5IoTJRaBoaWdp5BB0OnVP9A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94227E48D5A72A42A29DD99A9A45BC0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a58a8dec-c87a-4b31-4aff-08dc4e626715
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uGnIgP0PVHA94R4kDx+g6OZH6ui4x0/5/fQIRWXbvtUfxPATjQrwP9GXxSXBXYvUGQlgD/4sfk29MLbXXRJmdib5fRfnfyqI6XBx+uDAua0Gx8VG1htVVxbNndqBKA4yMHT6+3f16+eCblvNedP4I9hvmx70WuRSlWjREyohyqqNiTOAW/13gUY8DMkW5YAFd3Ugf/RIkHVj7DeaS7Wg+bIgePZTrszAi9wLb7TMwi9yOm3BpSzJjA80BEdQ3i8mtAR+vH4IO/7kczeyBzhRswK8GFWeO6tBEWClWek9mRe1+7pe8MDIeh2LuPEo00qKxQ+ebKpiT/KjckcSqR8zrNVYr8ZMuWdAJksYq5cBQ9bI3MR8Yva4h5ITYs+cYbyBdsiyDntkR4v0Vq+VZxSfZ8v5yV6Q5BQwKzazyJhZf3PAowMAp77erGTtINQ7NUpfe1Y5t2zxMUWEF7TLm+PzZhA62RwnqZTW9iDkQ/DS7D6e5nwYqYEGKjBkvCgStiCgwi9sDOBAEPMvjXeI6opK28bWSbzAPQ4WgLPbCLqyRXcFRyq8tvPD8EpyNFqDPd9MIXzV5Cb5c1MpcxzMgT+2qMrOS+EUqjuW5Q4LJbDQvkTj3NidVCa5KfLS6VD4+WLAaPiZnweDu0lZzuqcINTlnWNiqm6s1kOKp7tB05fozStUh81kmREFsiLT9xdUKYh/uGsxdrHjYoYo5sIRJP4h4PQlxNxNZj+MY9EXpouY9ZWKWbxPdjISu1jbljYedhOG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:33:00.2874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ce3869-69a9-45ac-6b60-08dc4e626bd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7750

Hi Jens,

> On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Prepare to separate ffa.c into modules by moving common things into the
> new internal header file ffa_private.h.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c         | 298 +-----------------------------
> xen/arch/arm/tee/ffa_private.h | 318 +++++++++++++++++++++++++++++++++
> 2 files changed, 319 insertions(+), 297 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_private.h
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0344a0f17e72..259851f20bdb 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -63,204 +63,7 @@
> #include <asm/tee/ffa.h>
> #include <asm/tee/tee.h>
>=20
> -/* Error codes */
> -#define FFA_RET_OK                      0
> -#define FFA_RET_NOT_SUPPORTED           -1
> -#define FFA_RET_INVALID_PARAMETERS      -2
> -#define FFA_RET_NO_MEMORY               -3
> -#define FFA_RET_BUSY                    -4
> -#define FFA_RET_INTERRUPTED             -5
> -#define FFA_RET_DENIED                  -6
> -#define FFA_RET_RETRY                   -7
> -#define FFA_RET_ABORTED                 -8
> -
> -/* FFA_VERSION helpers */
> -#define FFA_VERSION_MAJOR_SHIFT         16U
> -#define FFA_VERSION_MAJOR_MASK          0x7FFFU
> -#define FFA_VERSION_MINOR_SHIFT         0U
> -#define FFA_VERSION_MINOR_MASK          0xFFFFU
> -#define MAKE_FFA_VERSION(major, minor)  \
> -        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT)=
 | \
> -         ((minor) & FFA_VERSION_MINOR_MASK))
> -
> -#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
> -#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> -/* The minimal FF-A version of the SPMC that can be supported */
> -#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
> -
> -/*
> - * This is the version we want to use in communication with guests and S=
Ps.
> - * During negotiation with a guest or a SP we may need to lower it for
> - * that particular guest or SP.
> - */
> -#define FFA_MY_VERSION_MAJOR    1U
> -#define FFA_MY_VERSION_MINOR    1U
> -#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> -                                                 FFA_MY_VERSION_MINOR)
> -
> -/*
> - * The FF-A specification explicitly works with 4K pages as a measure of
> - * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX pag=
e
> - * count" which is the number of contiguous 4K pages allocated. Xen may =
use
> - * a different page size depending on the configuration to avoid confusi=
on
> - * with PAGE_SIZE use a special define when it's a page size as in the F=
F-A
> - * specification.
> - */
> -#define FFA_PAGE_SIZE                   SZ_4K
> -
> -/*
> - * The number of pages used for each of the RX and TX buffers shared wit=
h
> - * the SPMC.
> - */
> -#define FFA_RXTX_PAGE_COUNT             1
> -
> -/*
> - * Limit the number of pages RX/TX buffers guests can map.
> - * TODO support a larger number.
> - */
> -#define FFA_MAX_RXTX_PAGE_COUNT         1
> -
> -/*
> - * Limit for shared buffer size. Please note that this define limits
> - * number of pages.
> - *
> - * FF-A doesn't have any direct requirements on GlobalPlatform or vice
> - * versa, but an implementation can very well use FF-A in order to provi=
de
> - * a GlobalPlatform interface on top.
> - *
> - * Global Platform specification for TEE requires that any TEE
> - * implementation should allow to share buffers with size of at least
> - * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
> - * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
> - * Due to overhead which can be hard to predict exactly, double this num=
ber
> - * to give a safe margin.
> - */
> -#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
> -
> -/*
> - * Limits the number of shared buffers that guest can have at once. This
> - * is to prevent case, when guests trick XEN into exhausting its own
> - * memory by allocating many small buffers. This value has been chosen
> - * arbitrarily.
> - */
> -#define FFA_MAX_SHM_COUNT               32
> -
> -/*
> - * The time we wait until trying to tear down a domain again if it was
> - * blocked initially.
> - */
> -#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
> -
> -/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> -#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> -#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> -
> -/*
> - * Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le
> - * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> - */
> -#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> -/*
> - * Memory access permissions: Read-write
> - * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> - */
> -#define FFA_MEM_ACC_RW                  0x2U
> -
> -/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> -/* Clear memory before mapping in receiver */
> -#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> -/* Relayer may time slice this operation */
> -#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> -/* Clear memory after receiver relinquishes it */
> -#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> -/* Share memory transaction */
> -#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> -
> -/*
> - * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
> - * BIT(31): Framework or partition message
> - * BIT(7-0): Message type for frameworks messages
> - */
> -#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> -#define FFA_MSG_TYPE_MASK               0xFFU;
> -#define FFA_MSG_PSCI                    0x0U
> -#define FFA_MSG_SEND_VM_CREATED         0x4U
> -#define FFA_MSG_RESP_VM_CREATED         0x5U
> -#define FFA_MSG_SEND_VM_DESTROYED       0x6U
> -#define FFA_MSG_RESP_VM_DESTROYED       0x7U
> -
> -/*
> - * Flags to determine partition properties in FFA_PARTITION_INFO_GET ret=
urn
> - * message:
> - * BIT(0): Supports receipt of direct requests
> - * BIT(1): Can send direct requests
> - * BIT(2): Can send and receive indirect messages
> - * BIT(3): Supports receipt of notifications
> - * BIT(4-5): Partition ID is a PE endpoint ID
> - * BIT(6): Partition must be informed about each VM that is created by
> - *         the Hypervisor
> - * BIT(7): Partition must be informed about each VM that is destroyed by
> - *         the Hypervisor
> - * BIT(8): Partition runs in the AArch64 execution state else AArch32
> - *         execution state
> - */
> -#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> -#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> -#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> -#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> -#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
> -#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> -#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> -#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> -#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> -#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
> -#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
> -#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
> -
> -/*
> - * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
> - * count only.
> - */
> -#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
> -
> -/* Function IDs */
> -#define FFA_ERROR                       0x84000060U
> -#define FFA_SUCCESS_32                  0x84000061U
> -#define FFA_SUCCESS_64                  0xC4000061U
> -#define FFA_INTERRUPT                   0x84000062U
> -#define FFA_VERSION                     0x84000063U
> -#define FFA_FEATURES                    0x84000064U
> -#define FFA_RX_ACQUIRE                  0x84000084U
> -#define FFA_RX_RELEASE                  0x84000065U
> -#define FFA_RXTX_MAP_32                 0x84000066U
> -#define FFA_RXTX_MAP_64                 0xC4000066U
> -#define FFA_RXTX_UNMAP                  0x84000067U
> -#define FFA_PARTITION_INFO_GET          0x84000068U
> -#define FFA_ID_GET                      0x84000069U
> -#define FFA_SPM_ID_GET                  0x84000085U
> -#define FFA_MSG_WAIT                    0x8400006BU
> -#define FFA_MSG_YIELD                   0x8400006CU
> -#define FFA_RUN                         0x8400006DU
> -#define FFA_MSG_SEND2                   0x84000086U
> -#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
> -#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
> -#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> -#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
> -#define FFA_MEM_DONATE_32               0x84000071U
> -#define FFA_MEM_DONATE_64               0xC4000071U
> -#define FFA_MEM_LEND_32                 0x84000072U
> -#define FFA_MEM_LEND_64                 0xC4000072U
> -#define FFA_MEM_SHARE_32                0x84000073U
> -#define FFA_MEM_SHARE_64                0xC4000073U
> -#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
> -#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
> -#define FFA_MEM_RETRIEVE_RESP           0x84000075U
> -#define FFA_MEM_RELINQUISH              0x84000076U
> -#define FFA_MEM_RECLAIM                 0x84000077U
> -#define FFA_MEM_FRAG_RX                 0x8400007AU
> -#define FFA_MEM_FRAG_TX                 0x8400007BU
> -#define FFA_MSG_SEND                    0x8400006EU
> -#define FFA_MSG_POLL                    0x8400006AU
> +#include "ffa_private.h"
>=20
> /*
>  * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> @@ -382,39 +185,6 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
>     uint32_t tx_region_offs;
> };
>=20
> -struct ffa_ctx {
> -    void *rx;
> -    const void *tx;
> -    struct page_info *rx_pg;
> -    struct page_info *tx_pg;
> -    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> -    unsigned int page_count;
> -    /* FF-A version used by the guest */
> -    uint32_t guest_vers;
> -    bool rx_is_free;
> -    /* Used shared memory objects, struct ffa_shm_mem */
> -    struct list_head shm_list;
> -    /* Number of allocated shared memory object */
> -    unsigned int shm_count;
> -    /*
> -     * tx_lock is used to serialize access to tx
> -     * rx_lock is used to serialize access to rx
> -     * lock is used for the rest in this struct
> -     */
> -    spinlock_t tx_lock;
> -    spinlock_t rx_lock;
> -    spinlock_t lock;
> -    /* Used if domain can't be torn down immediately */
> -    struct domain *teardown_d;
> -    struct list_head teardown_list;
> -    s_time_t teardown_expire;
> -    /*
> -     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> -     * notified that this guest is being destroyed.
> -     */
> -    unsigned long vm_destroy_bitmap[];
> -};
> -
> struct ffa_shm_mem {
>     struct list_head list;
>     uint16_t sender_id;
> @@ -473,40 +243,6 @@ static bool ffa_get_version(uint32_t *vers)
>     return true;
> }
>=20
> -static int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
> -{
> -    switch ( resp->a0 )
> -    {
> -    case FFA_ERROR:
> -        if ( resp->a2 )
> -            return resp->a2;
> -        else
> -            return FFA_RET_NOT_SUPPORTED;
> -    case FFA_SUCCESS_32:
> -    case FFA_SUCCESS_64:
> -        return FFA_RET_OK;
> -    default:
> -        return FFA_RET_NOT_SUPPORTED;
> -    }
> -}
> -
> -static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a=
2,
> -                               register_t a3, register_t a4)
> -{
> -    const struct arm_smccc_1_2_regs arg =3D {
> -        .a0 =3D fid,
> -        .a1 =3D a1,
> -        .a2 =3D a2,
> -        .a3 =3D a3,
> -        .a4 =3D a4,
> -    };
> -    struct arm_smccc_1_2_regs resp;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -
> -    return ffa_get_ret_code(&resp);
> -}
> -
> static int32_t ffa_features(uint32_t id)
> {
>     return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> @@ -654,38 +390,6 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id=
, uint16_t vm_id,
>     return res;
> }
>=20
> -static uint16_t ffa_get_vm_id(const struct domain *d)
> -{
> -    /* +1 since 0 is reserved for the hypervisor in FF-A */
> -    return d->domain_id + 1;
> -}
> -
> -static void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
> -                         register_t v1, register_t v2, register_t v3,
> -                         register_t v4, register_t v5, register_t v6,
> -                         register_t v7)
> -{
> -        set_user_reg(regs, 0, v0);
> -        set_user_reg(regs, 1, v1);
> -        set_user_reg(regs, 2, v2);
> -        set_user_reg(regs, 3, v3);
> -        set_user_reg(regs, 4, v4);
> -        set_user_reg(regs, 5, v5);
> -        set_user_reg(regs, 6, v6);
> -        set_user_reg(regs, 7, v7);
> -}
> -
> -static void ffa_set_regs_error(struct cpu_user_regs *regs, uint32_t erro=
r_code)
> -{
> -    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> -}
> -
> -static void ffa_set_regs_success(struct cpu_user_regs *regs, uint32_t w2=
,
> -                             uint32_t w3)
> -{
> -    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> -}
> -
> static void handle_version(struct cpu_user_regs *regs)
> {
>     struct domain *d =3D current->domain;
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> new file mode 100644
> index 000000000000..8352b6b55a9a
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -0,0 +1,318 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#ifndef __FFA_PRIVATE_H__
> +#define __FFA_PRIVATE_H__
> +
> +#include <xen/const.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +#include <xen/mm.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +#include <xen/sched.h>
> +#include <xen/time.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK                      0
> +#define FFA_RET_NOT_SUPPORTED           -1
> +#define FFA_RET_INVALID_PARAMETERS      -2
> +#define FFA_RET_NO_MEMORY               -3
> +#define FFA_RET_BUSY                    -4
> +#define FFA_RET_INTERRUPTED             -5
> +#define FFA_RET_DENIED                  -6
> +#define FFA_RET_RETRY                   -7
> +#define FFA_RET_ABORTED                 -8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR_SHIFT         16U
> +#define FFA_VERSION_MAJOR_MASK          0x7FFFU
> +#define FFA_VERSION_MINOR_SHIFT         0U
> +#define FFA_VERSION_MINOR_MASK          0xFFFFU
> +#define MAKE_FFA_VERSION(major, minor)  \
> +        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT)=
 | \
> +         ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> +/* The minimal FF-A version of the SPMC that can be supported */
> +#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
> +
> +/*
> + * This is the version we want to use in communication with guests and S=
Ps.
> + * During negotiation with a guest or a SP we may need to lower it for
> + * that particular guest or SP.
> + */
> +#define FFA_MY_VERSION_MAJOR    1U
> +#define FFA_MY_VERSION_MINOR    1U
> +#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> +                                                 FFA_MY_VERSION_MINOR)
> +
> +/*
> + * The FF-A specification explicitly works with 4K pages as a measure of
> + * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX pag=
e
> + * count" which is the number of contiguous 4K pages allocated. Xen may =
use
> + * a different page size depending on the configuration to avoid confusi=
on
> + * with PAGE_SIZE use a special define when it's a page size as in the F=
F-A
> + * specification.
> + */
> +#define FFA_PAGE_SIZE                   SZ_4K
> +
> +/*
> + * The number of pages used for each of the RX and TX buffers shared wit=
h
> + * the SPMC.
> + */
> +#define FFA_RXTX_PAGE_COUNT             1
> +
> +/*
> + * Limit the number of pages RX/TX buffers guests can map.
> + * TODO support a larger number.
> + */
> +#define FFA_MAX_RXTX_PAGE_COUNT         1
> +
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
> +/*
> + * The time we wait until trying to tear down a domain again if it was
> + * blocked initially.
> + */
> +#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
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
> +/*
> + * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
> + * BIT(31): Framework or partition message
> + * BIT(7-0): Message type for frameworks messages
> + */
> +#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> +#define FFA_MSG_TYPE_MASK               0xFFU;
> +#define FFA_MSG_PSCI                    0x0U
> +#define FFA_MSG_SEND_VM_CREATED         0x4U
> +#define FFA_MSG_RESP_VM_CREATED         0x5U
> +#define FFA_MSG_SEND_VM_DESTROYED       0x6U
> +#define FFA_MSG_RESP_VM_DESTROYED       0x7U
> +
> +/*
> + * Flags to determine partition properties in FFA_PARTITION_INFO_GET ret=
urn
> + * message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + * BIT(6): Partition must be informed about each VM that is created by
> + *         the Hypervisor
> + * BIT(7): Partition must be informed about each VM that is destroyed by
> + *         the Hypervisor
> + * BIT(8): Partition runs in the AArch64 execution state else AArch32
> + *         execution state
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> +#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
> +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
> +
> +/*
> + * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
> + * count only.
> + */
> +#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
> +
> +/* Function IDs */
> +#define FFA_ERROR                       0x84000060U
> +#define FFA_SUCCESS_32                  0x84000061U
> +#define FFA_SUCCESS_64                  0xC4000061U
> +#define FFA_INTERRUPT                   0x84000062U
> +#define FFA_VERSION                     0x84000063U
> +#define FFA_FEATURES                    0x84000064U
> +#define FFA_RX_ACQUIRE                  0x84000084U
> +#define FFA_RX_RELEASE                  0x84000065U
> +#define FFA_RXTX_MAP_32                 0x84000066U
> +#define FFA_RXTX_MAP_64                 0xC4000066U
> +#define FFA_RXTX_UNMAP                  0x84000067U
> +#define FFA_PARTITION_INFO_GET          0x84000068U
> +#define FFA_ID_GET                      0x84000069U
> +#define FFA_SPM_ID_GET                  0x84000085U
> +#define FFA_MSG_WAIT                    0x8400006BU
> +#define FFA_MSG_YIELD                   0x8400006CU
> +#define FFA_RUN                         0x8400006DU
> +#define FFA_MSG_SEND2                   0x84000086U
> +#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
> +#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
> +#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> +#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
> +#define FFA_MEM_DONATE_32               0x84000071U
> +#define FFA_MEM_DONATE_64               0xC4000071U
> +#define FFA_MEM_LEND_32                 0x84000072U
> +#define FFA_MEM_LEND_64                 0xC4000072U
> +#define FFA_MEM_SHARE_32                0x84000073U
> +#define FFA_MEM_SHARE_64                0xC4000073U
> +#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
> +#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
> +#define FFA_MEM_RETRIEVE_RESP           0x84000075U
> +#define FFA_MEM_RELINQUISH              0x84000076U
> +#define FFA_MEM_RECLAIM                 0x84000077U
> +#define FFA_MEM_FRAG_RX                 0x8400007AU
> +#define FFA_MEM_FRAG_TX                 0x8400007BU
> +#define FFA_MSG_SEND                    0x8400006EU
> +#define FFA_MSG_POLL                    0x8400006AU
> +
> +struct ffa_ctx {
> +    void *rx;
> +    const void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> +    unsigned int page_count;
> +    /* FF-A version used by the guest */
> +    uint32_t guest_vers;
> +    bool rx_is_free;
> +    /* Used shared memory objects, struct ffa_shm_mem */
> +    struct list_head shm_list;
> +    /* Number of allocated shared memory object */
> +    unsigned int shm_count;
> +    /*
> +     * tx_lock is used to serialize access to tx
> +     * rx_lock is used to serialize access to rx
> +     * lock is used for the rest in this struct
> +     */
> +    spinlock_t tx_lock;
> +    spinlock_t rx_lock;
> +    spinlock_t lock;
> +    /* Used if domain can't be torn down immediately */
> +    struct domain *teardown_d;
> +    struct list_head teardown_list;
> +    s_time_t teardown_expire;
> +    /*
> +     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> +     * notified that this guest is being destroyed.
> +     */
> +    unsigned long vm_destroy_bitmap[];
> +};
> +
> +static inline uint16_t ffa_get_vm_id(const struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> +static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v=
0,
> +                                register_t v1, register_t v2, register_t=
 v3,
> +                                register_t v4, register_t v5, register_t=
 v6,
> +                                register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
> +                                      uint32_t error_code)
> +{
> +    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> +static inline void ffa_set_regs_success(struct cpu_user_regs *regs,
> +                                        uint32_t w2, uint32_t w3)
> +{
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> +static inline int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *=
resp)
> +{
> +    switch ( resp->a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp->a2 )
> +            return resp->a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +        return FFA_RET_OK;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
> +                                      register_t a2, register_t a3,
> +                                      register_t a4)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D fid,
> +        .a1 =3D a1,
> +        .a2 =3D a2,
> +        .a3 =3D a3,
> +        .a4 =3D a4,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return ffa_get_ret_code(&resp);
> +}
> +
> +#endif /*__FFA_PRIVATE_H__*/
> --=20
> 2.34.1
>=20


