Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2253248F
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336368.560672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPPt-0005G2-Ch; Tue, 24 May 2022 07:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336368.560672; Tue, 24 May 2022 07:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPPt-0005Di-8Y; Tue, 24 May 2022 07:57:21 +0000
Received: by outflank-mailman (input) for mailman id 336368;
 Tue, 24 May 2022 07:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1r1=WA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ntPPs-0005Dc-3A
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:57:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21f9bd4d-db37-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 09:57:19 +0200 (CEST)
Received: from DB8PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:100::22)
 by VI1PR08MB5502.eurprd08.prod.outlook.com (2603:10a6:803:12f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 07:57:16 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::ec) by DB8PR06CA0009.outlook.office365.com
 (2603:10a6:10:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 24 May 2022 07:57:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 07:57:16 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 24 May 2022 07:57:16 +0000
Received: from b4f563890f9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5B12D5E-CD91-4A21-8CD6-055CC1D98ADF.1; 
 Tue, 24 May 2022 07:57:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4f563890f9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 07:57:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3454.eurprd08.prod.outlook.com (2603:10a6:803:88::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 07:57:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 07:57:07 +0000
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
X-Inumbo-ID: 21f9bd4d-db37-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rv8IqnQFB4cQPQZByAlCIMpXbMWBaECc5VVPRoNfdggsqdcz1ay5JrZfu9EkkxW7xE9TRDyljI/zrLh2bosq2kd4lCJhEZgHsBVYMTqUb7VgPpysGQWx/xuzJCawfiovNk9iw6kkllHpxs0jhQB3lr7KSnIUw161YemdqqRK9dHfdhskrGpuBDWwMADnRjfbZK2n+oUWU0M5QO+kkfw8LWlB53UaO6WAnn2X9fz/E4V+6PB5pa0H1ei7PHcvltvcJsWXXYiEpJ6rySyVrXhsqAsZPGbZ6rSS+NRGdeLl+ZHwHUedzFg8yX3reAndP0tHIrenLr29qxVbliJ98BKgtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0qOPSP/92e9WvU4SB1dIpIgF+8Pln2gu2b2iLIzsRc=;
 b=Sdw/LTMWWS1L6TTowA934KiwFuXApBlTwdi3crfI9BhpJYe6ks8qVJRaRpMPlXmGk59TPODlUmtrAM4zIPCxIBb7Kqu9F++p7822YTyOAL5ObsRvQm1jKRwR/jLVZa4/VXlJsz7DsomoHkbQXEGLKx4Cq7MGA2QInX8mfc3F8kmhQwAcFp4y4IXmOqAL8LPuUZPeHOQiPjO4sykiJvmkIY6Nz17ihrVpFhCZs+3GW3AYFeBJ5SAAKdfi4uTPKaIM9vR2XLXpSVFNib8+ymOLIAhwF3ZUozIITfMcevwPfIlpLZwN/squmzcacMHa91teJBQE39DJUHBu8SpQWxmoWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0qOPSP/92e9WvU4SB1dIpIgF+8Pln2gu2b2iLIzsRc=;
 b=TlTS3vpRDiYXbBJo6fBs1xAbg4Xb+CwjzXKRRTcZXpIX0i+bgzcjxFjMZZkzjVaAvjrLqrIGx/wLDreEV6LVsCeJvLYIh5omdFXDywfFe88PGSKxBCE5zO/DMMWRZHOmFK7GQbXvuNVY1jJ9ibdaVF6liq0OArj1FaSKGWcKXk4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 927ff6147aa514fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkM5yv0S+1TT25tp/ADlXE1unjN611043EgnSM0KhABBsjB4bLn8RFHdlz+D12L/iR4IJfjYLKTUfyKw1fDoNHH1Bte8LmEgvOiH552iSo+5JS3z36D/Zpv1/cBFgtwQbpgPZ7Z5xBQHVCrf55vbscUI4DOgXT+ScAdeEVpH1L3ej1Z+9fOgQFW08BeNt1w3KX7wxGjiqn3ltas5pa1ycAS0BVDVvK1h8vRsk4JEHz5oet0pHD0ETxx3pXX9DK5KwbvYWgPuFy72IjZSPOGMDpdpPVhStui53IXalGYbKAyau0nh/c9BwHZ3eZc0Nb6VdsO3sQSTiebH2E8Z4yXXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0qOPSP/92e9WvU4SB1dIpIgF+8Pln2gu2b2iLIzsRc=;
 b=Tr0CMC2AUSd3/MLMD+bBETXQeDX1igQRLMgFrLzCTPgsuqI+RBMwhxngsVbQOh1kbuoo03l1u2TxV7s1fGuyuFdZI5lbvOirFAZdHJOB39YFSpEoEau04by8D0WdBcyU/XQBF3KMo8NcAdgyH7HV5hOaUzch01Iyk4ntFfM8Pqf1JBJkBq04JlZVzEPVEUG9vy0Kva/lFvWBiDgqKLvsA22rQMo5U2ACuQiasLZs8qC3YnO9xdizd6jusjja9swyaAx7UG++k7Hq0A6yNeusWSr6pvBGBqyR6g8NGbNkF12wz/2em+p+bgjm90B/uIb329xn4Rtvq0naaslXG24Rkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0qOPSP/92e9WvU4SB1dIpIgF+8Pln2gu2b2iLIzsRc=;
 b=TlTS3vpRDiYXbBJo6fBs1xAbg4Xb+CwjzXKRRTcZXpIX0i+bgzcjxFjMZZkzjVaAvjrLqrIGx/wLDreEV6LVsCeJvLYIh5omdFXDywfFe88PGSKxBCE5zO/DMMWRZHOmFK7GQbXvuNVY1jJ9ibdaVF6liq0OArj1FaSKGWcKXk4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 13/16] xen/arm32: setup: Move out the code to populate the
 boot allocator
Thread-Topic: [PATCH 13/16] xen/arm32: setup: Move out the code to populate
 the boot allocator
Thread-Index: AQHYbEM1B6bUo5tusEemzGRhWNTewq0trzOA
Date: Tue, 24 May 2022 07:57:07 +0000
Message-ID: <30311664-70B5-49BE-B893-9BBF38B5A48E@arm.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-14-julien@xen.org>
In-Reply-To: <20220520120937.28925-14-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fb34ba86-c391-470a-b8bf-08da3d5b052b
x-ms-traffictypediagnostic:
	VI1PR08MB3454:EE_|DBAEUR03FT039:EE_|VI1PR08MB5502:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB550273AE7DFA1E3467C09DF69DD79@VI1PR08MB5502.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9A9WiKTNXT5dQj/kkmUzVvnWOs3sywSOKXXtpH6/ceHtIdFfB/+C4BGQbaF452BVVsZXRGa8G1HqigWNBsJSVMsLLdLzYFSlyYxhrhiMosCzVJ+7TGcTdOwOzXhfuj36HEt2Tx2Ico9gj+gbMd3kQIoWHu52Vv5zLPJF9+ysINU1baAZoDMVep2pLvwqy26kcrDuM+nlb28Rzez3M//DxiOXOydOozFdJIMRzeZvapoQSEuMmjc0PV4Rdbe1OA4yFLnL88A3lcynjeIEyB0Xc7SzPpfNaeLkZNvBHMH00bzhjtYRGqTLp8wFbsO3QT61me6MS2/dzzPJyTbhOIuMvqdoO3FrzoGLTr88JAL/vDlifvl8N8iGnexboZS0IMU1viFQEcR5f24fqXsP8RkTMlvspwIcahtx0QjtmjGoDdyv1WIKM5Jy5hevG5uRN6hi+KNHV9o1fSM8w+Ay/fvxARHymxRUGjQKLO/CijBNLo5su8j19GhKYaQd7n3l4MguHSFjFCRRiC4pev3Ct3yC9kW2MGxjpjUjkMmCYp2qarrQle9NGIBchAudMycZ4Jtd+ArMb6hV8q3A9FpwcE18MRrlJOfCK2bGTSmzwa0odsWsv+IjaCNh/RSrP2r++HSpq+Ev9grnf0g12+0S9euQHkInIxveCx4XL3RHT9tz3EFRIxAdrob6M8Ov+LqxB0tv2bvPL1ctlo0al9h+o58hZHbYKICGcmcJv7TqGAXgPdc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2616005)(38100700002)(186003)(83380400001)(6506007)(53546011)(5660300002)(6512007)(86362001)(2906002)(26005)(508600001)(33656002)(6486002)(54906003)(6916009)(8676002)(316002)(64756008)(66556008)(66446008)(66476007)(91956017)(76116006)(66946007)(122000001)(36756003)(38070700005)(71200400001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <446603C0117B38459A1C1A37C81A46B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3454
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d571ae9-90d0-44f8-c939-08da3d5b0012
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3mGNHXvDMO6O4K/I5ImwwLFzlpNrMl6ODEloEm5lqvKfMWfYH4IFkWcbh0Wkzv0NEnbvP0/H3BVguSYh6ks6TiuD4YPoCvEBJsbaN4U1pjOUZ6qsZsY+MDQVuOHzgz4S3Fm0DvgXwFcJHi21RkIf4mf5//kGKYSE0H5qc7BUEflLMQM8rjDveprjRhq4onjnbvbrPZVSc5aI1JqX+dlSXm/Wsoi1C2yRr4E6hMyUyckW9AO/O0iy7O/dgp11At57Yixu25gjm5Iz/uhoj73JWQYP4tuPwpKDNhoiJznyImyvLxGy17HnxgOg1kRG61fYREn9r8DXZlq+S5tBGL0z6TRUzjzIzDAmioNPhYbM/wgP9RagGp1kWINc3Qi+E74VXb7pKH8+0TXD6+EiwJbOj8HpmeOtVsU8S6pZTQbiFs4DXunnilLH77umra2ApLbH/YFWfu8SRFKXGBAVqLLrKT8Ovu6+b3BMK/HS+x/KlSSN2fURWGzsY7Ppdlupep5/CxNbiDV11HeDEROKZmhv4DfdX1eCvGluvihPkASSRg6yVkSmsj5wEMPS+yzCIe2/6pEaLtK2juAvjCl17iKjg/CxPhraxtH8FJb0yIx3SksPrbhDK2pGjL27v1BhJftIEqolqwoI3tN5nzz0yXSrblq8ZWj4ORc+ykeoCfWzS/DzjwoihNK3ICnRCKmvdOu2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(2616005)(107886003)(40460700003)(83380400001)(81166007)(6506007)(53546011)(33656002)(2906002)(6512007)(5660300002)(82310400005)(8936002)(36756003)(54906003)(6862004)(70206006)(4326008)(70586007)(8676002)(356005)(86362001)(186003)(508600001)(47076005)(6486002)(316002)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:57:16.4259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb34ba86-c391-470a-b8bf-08da3d5b052b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5502

Hi Julien,

> On 20 May 2022, at 13:09, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In a follow-up patch, we will want to populate the boot allocator
> separately for arm64. The code will end up to be very similar to the one
> on arm32. So move out the code in a new helper populate_boot_allocator().
>=20
> For now the code is still protected by CONFIG_ARM_32 to avoid any build
> failure on arm64.
>=20
> Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) wit=
h
> xenheap_mfn_end as they are equivalent.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
>    Changes in v4:
>        - Patch added
> ---
> xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
> 1 file changed, 51 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed48a..3d5a2283d4ef 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
> }
>=20
> #ifdef CONFIG_ARM_32
> +/*
> + * Populate the boot allocator. All the RAM but the following regions
> + * will be added:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + *  - Xenheap
> + */
> +static void __init populate_boot_allocator(void)
> +{
> +    unsigned int i;
> +    const struct meminfo *banks =3D &bootinfo.mem;
> +
> +    for ( i =3D 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank =3D &banks->bank[i];
> +        paddr_t bank_end =3D bank->start + bank->size;
> +        paddr_t s, e;
> +
> +        s =3D bank->start;
> +        while ( s < bank_end )
> +        {
> +            paddr_t n =3D bank_end;
> +
> +            e =3D next_module(s, &n);
> +
> +            if ( e =3D=3D ~(paddr_t)0 )
> +                e =3D n =3D bank_end;
> +
> +            /*
> +             * Module in a RAM bank other than the one which we are
> +             * not dealing with here.
> +             */
> +            if ( e > bank_end )
> +                e =3D bank_end;
> +
> +            /* Avoid the xenheap */
> +            if ( s < mfn_to_maddr(xenheap_mfn_end) &&
> +                 mfn_to_maddr(xenheap_mfn_start) < e )
> +            {
> +                e =3D mfn_to_maddr(xenheap_mfn_start);
> +                n =3D mfn_to_maddr(xenheap_mfn_end);
> +            }
> +
> +            fw_unreserved_regions(s, e, init_boot_pages, 0);
> +            s =3D n;
> +        }
> +    }
> +}
> +
> static void __init setup_mm(void)
> {
> -    paddr_t ram_start, ram_end, ram_size;
> -    paddr_t s, e;
> +    paddr_t ram_start, ram_end, ram_size, e;
>     unsigned long ram_pages;
>     unsigned long heap_pages, xenheap_pages, domheap_pages;
>     int i;
> @@ -718,43 +766,7 @@ static void __init setup_mm(void)
>     setup_xenheap_mappings((e >> PAGE_SHIFT) - xenheap_pages, xenheap_pag=
es);
>=20
>     /* Add non-xenheap memory */
> -    for ( i =3D 0; i < bootinfo.mem.nr_banks; i++ )
> -    {
> -        paddr_t bank_start =3D bootinfo.mem.bank[i].start;
> -        paddr_t bank_end =3D bank_start + bootinfo.mem.bank[i].size;
> -
> -        s =3D bank_start;
> -        while ( s < bank_end )
> -        {
> -            paddr_t n =3D bank_end;
> -
> -            e =3D next_module(s, &n);
> -
> -            if ( e =3D=3D ~(paddr_t)0 )
> -            {
> -                e =3D n =3D ram_end;
> -            }
> -
> -            /*
> -             * Module in a RAM bank other than the one which we are
> -             * not dealing with here.
> -             */
> -            if ( e > bank_end )
> -                e =3D bank_end;
> -
> -            /* Avoid the xenheap */
> -            if ( s < mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pag=
es))
> -                 && mfn_to_maddr(xenheap_mfn_start) < e )
> -            {
> -                e =3D mfn_to_maddr(xenheap_mfn_start);
> -                n =3D mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pa=
ges));
> -            }
> -
> -            fw_unreserved_regions(s, e, init_boot_pages, 0);
> -
> -            s =3D n;
> -        }
> -    }
> +    populate_boot_allocator();
>=20
>     /* Frame table covers all of RAM region, including holes */
>     setup_frametable_mappings(ram_start, ram_end);
> --=20
> 2.32.0
>=20


