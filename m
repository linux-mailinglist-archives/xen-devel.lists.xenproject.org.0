Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1EFA4DEE6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 14:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901120.1309105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpS3r-0004PK-LV; Tue, 04 Mar 2025 13:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901120.1309105; Tue, 04 Mar 2025 13:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpS3r-0004Mm-Ga; Tue, 04 Mar 2025 13:11:51 +0000
Received: by outflank-mailman (input) for mailman id 901120;
 Tue, 04 Mar 2025 13:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpS3p-0004JK-P2
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 13:11:49 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b19247c-f8fa-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 14:11:49 +0100 (CET)
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by DU4PR08MB10981.eurprd08.prod.outlook.com (2603:10a6:10:577::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 13:11:44 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::b9) by DUZP191CA0028.outlook.office365.com
 (2603:10a6:10:4f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Tue,
 4 Mar 2025 13:11:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 13:11:42 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Tue, 04 Mar 2025 13:11:41 +0000
Received: from La6b10d3da8cb.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 174E3900-529F-4A3C-996B-562352914641.1; 
 Tue, 04 Mar 2025 13:11:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La6b10d3da8cb.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 13:11:35 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 13:11:30 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 13:11:30 +0000
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
X-Inumbo-ID: 3b19247c-f8fa-11ef-9ab4-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uB+PUzOvUA2BFvE4GCOPCL/rwkd5WwQhTk1Uj+xG1Bg7YztcdB56c01T+k1lZvz3MvvkoFJvgArTUKzF1OYYdLgvb42aL0FwI+yBOOXa+eJ8JNjNsVH7/oWZVUjlfhsItyMBKH+cJJ5HgJAsm74SqFjzJk6Kvhc9MYnJev7wf8XxXICBC0vNiR5benFsjT4WTs7tFT1g8TGTQk15wgMVXsI4+bChZCJ47rEkxYKvJmFKz8fXLkNnoz2qOub9pF/lwprvBM7jvOraOgb6VbrM0vFDu9ItohVtzUL2Gri+THFOtJSY+L2NOZB361qXHpmwFpDJNS6G6Se6qScnvMJASw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsr8SSgV+VEW5gRX1P9iJ6PA0fowcH+M9lL6vcqRa2k=;
 b=P3UFLWDxmEDB8dexC6b5eMn2bZ2fObQ+O23VW25pB9rKVMQ+tO0DpYoGMCWszxhMiDThbxrFMFc1tTuSSMBeaGssSO0kWrAoQJyM6oeHV69Biycp0ZysGf+EnA4fVj5zzKTWHc0vRXrwxZaANtbpY9Q1BCGhJzmhPkb1N9W9owcco74VnDeHUVPLOa6wVnp8NM7CeXwY/Cz4Koy4mFetfJRficb1X8/bogGlO8YFj2OI/YtACnT0H8qSwihfXcQLzOA0wLgd7HHi7quVsENVYHSyfanrVFVpXlCg1AGdXLeROF3VkAUewJeLSGn9MktBNBbNI8C38ywM0nl/z1mmGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsr8SSgV+VEW5gRX1P9iJ6PA0fowcH+M9lL6vcqRa2k=;
 b=rUE5gqMVX/OYe5oya/ao4WL2ayxNC6CqPxA1TVi4qsaIpnM+WHRzRohUqKJf4eTgkyweAT4aaklE5XAmn3amjm6BhInu0nyrtQC8j89xc7vmtA3ffqC/armpTSa+TwCyq9K2npfVSpsKSoch36b2hfERGgD7pE8fV1Q3o7kxPY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5330d8210777b09
X-TessianGatewayMetadata: tjIqcPMclWUJlEDeE0L4MdESdG08Xe+DGR1kFqUos2OOKodaBbbabencLDwP+4VhCnVRTWBdENBtycx6/mIRKas8LmzYVFotJCV3TXzMCShcjn0kH+yg4eyKcxsPKGOy2yCne9t80xgh9qNAlpVZ8hHxh5etRSbidluUd4ZYihY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5Q6DNCMaw7n6liqDQV/NMhhmYL51Ov9Q6BEJgVSIHC9UWQ7qNTCQ0uTxlIkY/TpftR2sjot72qHetnSw+5H92LJEk9gB3xKhNJWwvzJqVNSskACCVAUjzwOZSzN2TytP0Xw6wmjQb4lPJB/GbbokiKMsAF6pkNDp7fZC47BuxzoxU0ZrARdE/23laVnPbmW1A0w8f7mS5oNRvJbz39/aOeaQR395mpsOac4l07p8RtrJBwMcGu62Ljbgo59yc1o9mJDUwalURA3Gg+DFkL5wpNswoq5g5191N4TLibKeZd2udov7GNSXrQCAN1sW18VEmZxdOr4MuSilU55hJqLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsr8SSgV+VEW5gRX1P9iJ6PA0fowcH+M9lL6vcqRa2k=;
 b=wmZb7k9eXGFDGlcqdZwzpxhKRUpitv3uZFzBAy/MgmhW9dF2rGf3pFuN0tXks4lWIvaSMJqMf0Vs08Ks2ooenJQtHUwXY4LZj69ML5ZW3/Kxolc2Iw79cSc5uopGVG9fQLEzX4hSEnMJULkANsvsh5pHvm+d8eoQ+0RC54UmRYsBgY19NPAqaaHOo2sqDwra/GT65hYvgwLUf7jVtrPbd3aA8UqKUEaud/257WOgNaw2ee11UXwgPAFJwLfWL9BGQPsKNXSejDbTEH7P1HqDknvTyYpk588/HBrO5lcqWUDZkQzVGUkpU3Oj1/aUqNfRM0JecmReF7hQ2CwYFJOnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsr8SSgV+VEW5gRX1P9iJ6PA0fowcH+M9lL6vcqRa2k=;
 b=rUE5gqMVX/OYe5oya/ao4WL2ayxNC6CqPxA1TVi4qsaIpnM+WHRzRohUqKJf4eTgkyweAT4aaklE5XAmn3amjm6BhInu0nyrtQC8j89xc7vmtA3ffqC/armpTSa+TwCyq9K2npfVSpsKSoch36b2hfERGgD7pE8fV1Q3o7kxPY8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 3/9] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH 3/9] arm/mpu: Introduce MPU memory region map structure
Thread-Index: AQHbifxvvv/yUnZzCEOp3WVvr92oW7Ni02GAgAAmZQA=
Date: Tue, 4 Mar 2025 13:11:30 +0000
Message-ID: <E86C11CF-50E5-496F-B22D-0E350C1055D1@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-4-luca.fancellu@arm.com>
 <51104e92-efe6-4477-9435-cae2dee33be7@amd.com>
In-Reply-To: <51104e92-efe6-4477-9435-cae2dee33be7@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU4PR08MB11174:EE_|DB1PEPF0003922D:EE_|DU4PR08MB10981:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdd661d-3f6b-4e9f-14dd-08dd5b1e1b5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CH7UXl4i65yGNHletYOZjWl3CCvoZWA+8DRGkIZV4V4F/52uQgmVcZ7SEfHy?=
 =?us-ascii?Q?Gjy0bct1G6IB1AsjyyuiZPDJ9X+DjdM/CitqfmK+Y2+1QdA+sGpTljb1PafW?=
 =?us-ascii?Q?4yPIC+JpA41d4qMShtkTpkxf/xqYvtI+osqkg4mM/v1L/J2XWoN7n7ZunKRw?=
 =?us-ascii?Q?EjcASWLRW6Yk5qzZz8DFkht+wtWCoi2uxHPqv8UADwGN25fuO+oIN2Nc95pR?=
 =?us-ascii?Q?y52NyL4wDtM9qA7J8ECIEpdXNIOI8cct8bEIgtnpx+oXeYj/QD+tqaEco4OG?=
 =?us-ascii?Q?uLOaJuGZD6MHfh98Ibk3R1D1/U8nVRKWeFwkm8oQiej+0KbvbJQhLm9Cg4vv?=
 =?us-ascii?Q?qv/aT2pk0ZCYpkIth4Nth6VL0cKbTNzUY6lEK5HSkHjirESoqAd9Mhq3g0oC?=
 =?us-ascii?Q?kgfrndw1F3mYQeB7n6SoGo57ihTS3ZRs5Mv57sqDvAe1vp3u5zwmY1g6JLLH?=
 =?us-ascii?Q?KSS2H0lSVJYS/5JsKLV5t3BefF2f+UNHvezI7YZ3T7bPRloseH3AqWX9Zkj7?=
 =?us-ascii?Q?Rr600m+7yyekbIP0NTUFmqruIZLP3+yaBXBq2p+EqPoreAjmcEdGkUROHUi8?=
 =?us-ascii?Q?luPiMmD651XbBBHeWDZwyy9Vs8UrUNHREwAgpzU9ASlrSrZRadolWqxm2B//?=
 =?us-ascii?Q?+lrC1x7Ww9w+P0y5TG+kr1wnSLhmPTeb4nIUakNokk3ZoLT+m+kQOT1YQRgn?=
 =?us-ascii?Q?0LiVQJ+rLp7bBEPC+4jjNeZwNQkXqoJmZ2ceFcVBOiPDxRVPJaO2TQMZRsTq?=
 =?us-ascii?Q?fgjcR88q0WYBia1PDih8O/1ac+GShlotUsJztq8KZk8k7wnuQu8g/sW0Bw5R?=
 =?us-ascii?Q?NQCfjEdW5Ih31VTYhREoLWCrF22RVopZ9TZ3O7GVP40B1Siljm/E7KpC8gs3?=
 =?us-ascii?Q?MJ8la8PoSuWlbpw632oRjAAyP1ajpaXrmjCGjPNpikmN8JbEpvZf7zvJ3htb?=
 =?us-ascii?Q?jVjbMCTWCmSI9+hKYQoM76YGBsl62D+wqdLNwZFE5jP8YBAuyPUT25Gefeel?=
 =?us-ascii?Q?YSJKymFwW64Z6HwScdcg7c5HwVfzHnjJK2siX0ZaLqavJJ5tma1Qm4UTpLFo?=
 =?us-ascii?Q?JW0LsJShWRObPRkq66K9QsmcX8W+N3MNC5K34Cs0anLd/peeeE5FrPuTeCTo?=
 =?us-ascii?Q?fIZliKglf3zhlLNVkXMDb1zPQnXc3O7ZTMKWsviBydg7n5F69bVSPthRz8lP?=
 =?us-ascii?Q?TMtf3YBHip7y2OX1EfLofrQDJ40cfEpziFeZ4xfUutEqJrz8VZIoZUJaC2Tr?=
 =?us-ascii?Q?WR9RxL11JpVU2Y/pcy5isHZBbytwJV9x8h88HAZWGCEqH2afAQepHDdzknMx?=
 =?us-ascii?Q?D+xDd39ObAI2wpoBtGtchq1HhkIldg54e0nTNEzOt/vmmQa5MgMO9xCYoCqp?=
 =?us-ascii?Q?OVl5l3n3BzFo52aCAsxMUHJjVww8lGfiisg4bsW6YF+sDfu/fLp6vuVgiemM?=
 =?us-ascii?Q?BYDTxbY8BPvaLKzRF5jOdHM02uolhQcf?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <003BB5A87AFD5A479C000EF054F13896@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96335b27-94ff-4537-04ee-08dd5b1e147d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bZnhNVTLkULvIIeVHXghex8KTS9A3uFa2XG0vgeTjvnKQBrf7bnZwI8+LgvT?=
 =?us-ascii?Q?4g8EzCPmkSyVUX7+G9ccdbt4nnqQkGyyCkq8/1KSVBRxJdrAxHsUhI0wSQyU?=
 =?us-ascii?Q?etl4F0f5vX2jyKDHd7he8NKfnjENj6rVW3gd4CunSfrX4/PpR3X+AcjMPVjF?=
 =?us-ascii?Q?hfoSJuBzZ3uAGVHdZl/Nh+or8ODnuPXexo4VHhRwhtj7qOrifPiySxPqAr5C?=
 =?us-ascii?Q?G+cNAUtF14bL2dGhEPEjfNVqms7/kusewb9mO0PSUzbYBnv3+Ci8numbx0bC?=
 =?us-ascii?Q?fDYwiaIWzQwQOr2vu+vCKL9HNxJRQKbFZegw14kLNdJB/4guo9NOF2TM/dIN?=
 =?us-ascii?Q?0xRY20iVjkU/qDQ3oKHrx3DCkHrdY26QiGHKr13BluciJMCUsSH0/L5NghYy?=
 =?us-ascii?Q?mZ7UX9uo16g80Mss9p7t5VscHjhS9lYL+4HgaTbnwAbiPE+rG/Rj02fsODwm?=
 =?us-ascii?Q?s8LEG3bRb3plIf6Fm5IoFFVRjcYchJtoyFrWAXKLYFCyBUGL8+UFH4BDLMXB?=
 =?us-ascii?Q?mU8qc9DY+1dq+oZqF+L4bCGg12mh2DbbiqaJu/ysSt/okXLyEVk6QG6vKitS?=
 =?us-ascii?Q?HxKmgu7ypyzB8c2F5qy0vC655NBZUnb6GygURQ5mqP//BBZDah1sloN4oYjm?=
 =?us-ascii?Q?Zj4o50hFyOuwX7p1KZKxxE31xP6Lh9//JMU0GQ2W/Crs8bI9qyOCLSz1DAea?=
 =?us-ascii?Q?NLmJDSQvbpPvvXVI8WxyKFqrmjvmeLTttRoZBkAHk9Cm2JLxfuNI6vPUx8vs?=
 =?us-ascii?Q?9KCfpb/L7JGA+glUjbyQpAY72ZjmT/hw5jh/Db2X8uyKXRM+GdbDuTKbiVaU?=
 =?us-ascii?Q?5P9LMun5Ns32l57OFX4Ph2tZh2Wd7XMIs2Yw/J0bJ2QCdyv6ZVvFtVaFfzBy?=
 =?us-ascii?Q?bFnY+zkmw7iPKULCoOkN6hVPFCld9feaDZRtuzaRYYC16hmXsIpNp4NJFi6s?=
 =?us-ascii?Q?AoiKoSGH82zq0O5nWhOoHKPXeFGlA3GVr4RwFzupR/QIL+DW1YSzIcSX0uui?=
 =?us-ascii?Q?CJIIoJroDCy/L41yK5tedHvRfIaZunPl+qOM62eslEO26nwZE2GPddHKqVte?=
 =?us-ascii?Q?xU9XtkHyyzePoh/RNsCEmjK5Sw1UGppLLR2P1H/371YfIkAwoMwVuqqAYpes?=
 =?us-ascii?Q?BU22FyeQSfbuptY1w4VAT+wYeV3HJQ1jV+BwW5CtXj750cvqrujIixlVVhnq?=
 =?us-ascii?Q?1EMgaxe9D6jnWCbUkstXH4Ouf7/mUHcJ5Bu1uovpx0yDxQEAOuQP7iLMzr3c?=
 =?us-ascii?Q?IxhWs9sk+oM1pGjHBJobo+d6zTkKGsHhn73W8MOr/qariCXEzdl/ry9zLPUa?=
 =?us-ascii?Q?PSnDl7WoSIVLGmv70fpcY+Uo76PyHfGU54XXspMBnVLXyBOMskxqnTmZ2IoM?=
 =?us-ascii?Q?cfSeAnxaqs7Bdo9eoQuakgeTIvOJYiJHugN2sCbGbJSi0pUBGD8B6EAfNOUN?=
 =?us-ascii?Q?Zt9xbcmPwgGgNP/3R0VLS9acpv9p5O/0v1gnUs23RCxw3AT1NJlgZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:11:42.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdd661d-3f6b-4e9f-14dd-08dd5b1e1b5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10981

Hi Ayan,

> On 4 Mar 2025, at 10:53, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 28/02/2025 16:18, Luca Fancellu wrote:
>> CAUTION: This message has originated from an External Source. Please use=
 proper judgment and caution when opening attachments, clicking links, or r=
esponding to this email.
>>=20
>>=20
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>=20
>> Introduce pr_t typedef which is a structure having the prbar
>> and prlar members, each being structured as the registers of
>> the aarch64 armv8-r architecture.
>>=20
>> Introduce the array 'xen_mpumap' that will store a view of
>> the content of the MPU regions.
>>=20
>> Introduce MAX_MPU_REGIONS macro that uses the value of
>> NUM_MPU_REGIONS_MASK just for clarity, because using the
>> latter as number of elements of the xen_mpumap array might
>> be misleading.
>>=20
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/arch/arm/Makefile                |  1 +
>>  xen/arch/arm/include/asm/arm64/mpu.h | 38 ++++++++++++++++++++++++++++
>>  xen/arch/arm/mpu/Makefile            |  1 +
>>  xen/arch/arm/mpu/mm.c                | 23 +++++++++++++++++
>>  4 files changed, 63 insertions(+)
>>  create mode 100644 xen/arch/arm/mpu/Makefile
>>  create mode 100644 xen/arch/arm/mpu/mm.c
>>=20
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 43ab5e8f2550..fb0948f067bd 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -1,6 +1,7 @@
>>  obj-$(CONFIG_ARM_32) +=3D arm32/
>>  obj-$(CONFIG_ARM_64) +=3D arm64/
>>  obj-$(CONFIG_MMU) +=3D mmu/
>> +obj-$(CONFIG_MPU) +=3D mpu/
>>  obj-$(CONFIG_ACPI) +=3D acpi/
>>  obj-$(CONFIG_HAS_PCI) +=3D pci/
>>  ifneq ($(CONFIG_NO_PLAT),y)
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include=
/asm/arm64/mpu.h
>> index f8a029f1a135..38dbf5b2255a 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -13,6 +13,44 @@
>>  #define NUM_MPU_REGIONS_SHIFT   8
>>  #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>> +
>> +#define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>=20
> Not really a comment, but a note. The above needs to be common between ar=
m64 and arm32.
>=20
> I had moved this in
>=20
>=20
>   "[PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
>   file" .
>=20
> Depending on whose patch goes in first, this code needs to be moved in th=
e initial patch so that there is less code movement in the latter patch.
>=20

I will move them when your patch will be merged, if your patch is merged fi=
rst. I will wait for comments on
this one by maintainers so that if I have to do changes I will do at once w=
ithout respinning the series
multiple time.

Cheers,
Luca


