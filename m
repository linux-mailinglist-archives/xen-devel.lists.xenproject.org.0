Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1E396ECFB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 09:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791603.1201508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTrq-0002ob-Dc; Fri, 06 Sep 2024 07:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791603.1201508; Fri, 06 Sep 2024 07:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTrq-0002mn-Au; Fri, 06 Sep 2024 07:58:54 +0000
Received: by outflank-mailman (input) for mailman id 791603;
 Fri, 06 Sep 2024 07:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5X4Q=QE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1smTrp-0002mh-1k
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 07:58:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9fd5d24-6c25-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 09:58:50 +0200 (CEST)
Received: from DBBPR09CA0046.eurprd09.prod.outlook.com (2603:10a6:10:d4::34)
 by DB5PR08MB10095.eurprd08.prod.outlook.com (2603:10a6:10:4a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.9; Fri, 6 Sep
 2024 07:58:41 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::99) by DBBPR09CA0046.outlook.office365.com
 (2603:10a6:10:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 07:58:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13 via
 Frontend Transport; Fri, 6 Sep 2024 07:58:40 +0000
Received: ("Tessian outbound 6d35f8653bd9:v437");
 Fri, 06 Sep 2024 07:58:40 +0000
Received: from L77f776a715fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB48E7A8-FF6A-41E3-B56B-9EBD501C1525.1; 
 Fri, 06 Sep 2024 07:56:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L77f776a715fc.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Sep 2024 07:56:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB7644.eurprd08.prod.outlook.com (2603:10a6:102:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.13; Fri, 6 Sep
 2024 07:56:26 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7962.008; Fri, 6 Sep 2024
 07:56:25 +0000
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
X-Inumbo-ID: d9fd5d24-6c25-11ef-99a1-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CBScbCdIz56dF06hWPSHy14BlnLfk9JMnrIqM9h5XdJhQJEJAVEf5V3JDWj7wIw8YqKPbLeJxK8v5Flv88MQRLUlihmwOzBPBwUXr2CXKemBw3lYM+x1KQJ2+iQTVw+DAhRdapSVU6pV1zCYFq7KyW9h6ahP99gTVwGUG+tuotNvrCXBv6eqXuh5C8/EGnmvWeFFW/AklyWgDoj+KzuOFO2Jt0jpweduJ9T4Vg+izpepfQka28z48zZ1Ho9o1u+Xj5favJH/MVYIhHcwO3eRmo5XCu3erKuJdnrln2Nvih8KhbyP+tTlVEcJNnq6NIy7W9S83ElnX2LEsyZDWK8Ikw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeZ5yaZXfYg426jk57qphq6YJrR4aVybGpcO0KSk3Lw=;
 b=XSaEcfWYSFpUvXkShoLqS8jk7AoTllvY1we8jNje9F2UkFaIYjOXWNYpBhsiDrkM6Fcb27bflPQA9PWYIo9mMnqUbgiFSv6aQ7JGoePPa8GHkzz8A+yDSefQrkw1z1aUDmZrLTOfrd4wMinc2oTQ/HG4TWfCfh4wC/xLIjNOxLHr/ea8OUaOBOTlpK/kjEoN9xyebZyB64XU9d94vVBsZrm2fg4ev+V63vHbmjnW92qUr/oKJRVeabZ0NWBoW2zafkN7nmYgUMrVWZVEiHPWqujLtPUSVaqvdbQcQKwlR3dY2Zwe9hQm3U1jhtdAAqBczom4/s88kGVA2no8nlLYXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeZ5yaZXfYg426jk57qphq6YJrR4aVybGpcO0KSk3Lw=;
 b=KWkYt03u6Q/BQU4mosiQDU/PJJIoAFGmip3LdhS+hEdN3k7qexXlKzcGfB3HoxGCmg9E6UQ7hsi6PA/8xDAUUD/GLP5J0vkcT2MNhlKxEiv+kSECVUydXtQywgOqg/JBy4+Ngd2wStFdMnmCLFZWbsyNa8d7Sn3i/AGFSCxskG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ba4ad779f9e3d23
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR6GRfDqQ9MEcEQNtj7I3ZyPT2sXbFHO0mdG9Z2I9bM0T5rLN1uoyhma0jJcWS5SY1VDknRooNt7wa2esh4ldkMyCgO0/vrq5k+jZzOPpPQO4l167Fsx/9TclA4dfVUU9YGj8L2pWVgMn46nrajhKboOsJfQa7LxcZcVZDNnwymyjQOfygokptgugJtVFL2WX148xtolEF4/B0AdIVd+AqpyHMzmWlqg5zr4zBBwhAKFfnoYwX0cgIk64NbUeetbpbj/RLWYNCX/vaFGS5FEMFO2Q7wlw+YexZCrpp8+0uOypRzoWEgN/Ean7EARsuPYvi18ReJlb8leY9hWaFtRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeZ5yaZXfYg426jk57qphq6YJrR4aVybGpcO0KSk3Lw=;
 b=qr0r8yM10Lb74XhhmUdKrHe5fr9BleIpzbduWieIC/5+qTXqlDv5nVQ9IHACh7kqdI1ZfRYyTbPVD3/3pC2J3x6Znwx+qPMMS415xRW+CV3GuW7/MFCnfA5G7jzoGNp36Aib2V/r5u1zfVqVibimAJPF7B0RqSmpJG+Fbd1wmY9QbD23ATNLouANmlXL7ckX0hK2gW4/oHyH7ox2t7s0Y7wnS+d0XbAlQJP2Ex2OQ0EIhue9B0UicvCbCNrh7IP4TGtphSToONQnmLhXZsOe8Yp6aDC+hoRgsKaMT2+OH4bRcehz+7UupdcpMR7TOT9wYtOuXbAx+NWRZPjtxFQntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeZ5yaZXfYg426jk57qphq6YJrR4aVybGpcO0KSk3Lw=;
 b=KWkYt03u6Q/BQU4mosiQDU/PJJIoAFGmip3LdhS+hEdN3k7qexXlKzcGfB3HoxGCmg9E6UQ7hsi6PA/8xDAUUD/GLP5J0vkcT2MNhlKxEiv+kSECVUydXtQywgOqg/JBy4+Ngd2wStFdMnmCLFZWbsyNa8d7Sn3i/AGFSCxskG0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for emulated uart
Thread-Topic: [PATCH] docs: fusa: Add requirements for emulated uart
Thread-Index: AQHa+hgOljoIcfkxNk+dBpcJeXKH1rJKcE6A
Date: Fri, 6 Sep 2024 07:56:25 +0000
Message-ID: <D326B71D-283C-4CEB-9C52-23CE42683284@arm.com>
References: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB7644:EE_|DU6PEPF0000A7DD:EE_|DB5PR08MB10095:EE_
X-MS-Office365-Filtering-Correlation-Id: d31390e0-0b80-4ba8-d35c-08dcce49b8dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?mg9PvAdQdBXOW/YOKkB4UzcNBhGPUm/XOM2MFjK7M+xcwgDeG50ZJdtz7QKw?=
 =?us-ascii?Q?3PsCfnRIYlrc2RKI+VGUGzyoB3lKYTE8nG5Oq+qUUyb7KJXv1XfETv5OC1ux?=
 =?us-ascii?Q?NJlaLub0UdDSY4ALtN3e2QzZgh3iIrl0r8hJRLdjD3FLsEsjPaOwzqwbLB2k?=
 =?us-ascii?Q?BfM2f6M27Spyt7nfb6rpstJPQpm3SM3pIp8AAM/CdYl8kw1k3Ege+IstfFjo?=
 =?us-ascii?Q?fvMqEuDUTKiPmRWVc4RRDJ3HvPRIEqqXlVWtTNH6W636XscLt3YrfbgwN8OL?=
 =?us-ascii?Q?vU72XIBCXZhMJmMKrWTMKedi6NmJeDkXq0ZSCHdt++DIp0zmHylinaSDd6CY?=
 =?us-ascii?Q?fVfFpAdIR6WiDPiE6/kGm153NaKKgVwhjcvs2AaLl7JXlAGtWyXPLqrcysF5?=
 =?us-ascii?Q?SZX6DnX79OXOaWLpP9uvn/W+tJITlfuanrGY/Swrc7xGTc4lV1iDXEg85dns?=
 =?us-ascii?Q?w9Hu0XTuYgsGhVw5CkHpNxaYjbz6tfh2smFXm2TA5zKTSi9BMRBJFaRZJcXY?=
 =?us-ascii?Q?hNvHMyI61RhZQgy3yvlAJqQOS5rk8ApLDJ2qecHAknpyBugdP2tLanX8ja+v?=
 =?us-ascii?Q?ltU11Gk7wHggSD1yZzijCLdSVfth0KzUa9F5MLwmyQLkRp/uKofWVqGSgtG6?=
 =?us-ascii?Q?A8RB4iO9YxWoMvx5wawm51+QL/5FqUQtm4hBcwDjEE5apUSxo7XXgYSCUDyU?=
 =?us-ascii?Q?A44Es5Yy2NuyeZZ/8D3fr0YbofHyqDP5Y0qBb9TqHs+pPA/oNVeJLmGLN0fq?=
 =?us-ascii?Q?2HnYR6C8Zc2GR00VKOvEU0s0TAohVDaYQD3OG5BU11whlW/VWDAFGJXtYwdi?=
 =?us-ascii?Q?Z2HT/C3Vos2JhckURLzenPlv4uQkLKXvz+O7QpTXjwFUDTMEmSoVvCKNyAnL?=
 =?us-ascii?Q?i88bB2lKcJEhFiJh1biV6iJeGIMW2swXcC5v7ejx3adRHJ+FBzXLtKbwJVB9?=
 =?us-ascii?Q?ywq2TmZvr52vYg/RL5SWqf4FBscfYyjT67udXLxIz9soFNKPrLsnYcuUhfYn?=
 =?us-ascii?Q?4cV4CPBLYxsdWgn1e07AiTCvcWbJs+HyVm1khMT3oLro4nsjdJ/5D2dXsa1H?=
 =?us-ascii?Q?5OxG6JIJrrRlsvbMtRO7bofBmQUg79b7aGYeUhOBFHj4Js71qlov9qu09G4o?=
 =?us-ascii?Q?ELI5Kqp20+SH9lQHVy6kzmm68jqqKzJESqfcaF+gkQWQlqmu78MmjuEnx3Fw?=
 =?us-ascii?Q?nYAokDNCCFobHrYQnoBWkV8yUOPd8FQ/3faNveDwkuJKXpWI4BIFzo86J5jf?=
 =?us-ascii?Q?OjFrjjMt0STaXl1CI+P5WnOhiTic2b1j4x4Q6za7UjX5hbaCStdYQKXrkLIX?=
 =?us-ascii?Q?JJfTWGw0OKzAT+l8N5yvPqC8qLmkVeM//Va+Bii+kUg0vZ3XycVxWuVYFML5?=
 =?us-ascii?Q?x84C8Twcv64t7L3uCAnUPLOfcSU6XF1SkOKYf4XpI0xUbvdoxg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68D8E9418D3CA14685CCDEED21D52827@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7644
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad6d9626-93fc-4dac-6865-08dcce496849
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V2+LBUaU3TDRcCSkxp1JTIoC4d63f7OJAExNwXj3cToI4iPSmldNvmmOfiR7?=
 =?us-ascii?Q?IxmkvCurWwugbhEdhCwIb+y+eB6EaLDAtQ04ZJxaUmv3i6EIIB5L8llDqhEv?=
 =?us-ascii?Q?pZD1ZJ0P7oS8kbsbOIgsEbMjB5z+MB4DBhq0LQzbdCGmhbX/FGoc2fa6pD9n?=
 =?us-ascii?Q?WcDK7y+sof6w8tBxxfz/gz84Qn8eaGQ7hWHTWdunEWOjMWRKpVbw96HowcvD?=
 =?us-ascii?Q?KNxf9A4+p0MXMcJjX8mvNrA69HCIpcHmowcTnz142y5GcT8oBrIwOo+BM1q2?=
 =?us-ascii?Q?JczHp+1UI5znoMIRsRqoc6uuS+trlCS2HgS9OgTboYoj5Up9avLALOzIGm9n?=
 =?us-ascii?Q?yg3/F3sxpcyikGmSzLu2pqFq+eLvA89Q31/I78zhsjvT7khYUe05qvT4Hpnh?=
 =?us-ascii?Q?VEAjPrzLDOXggIoOyuoA8Ur8d9y+rpToHlRrcErxXb33zH60ySMzBG7EFaYh?=
 =?us-ascii?Q?Uj/AIh1RU5cEseOvl8K1rxAYrtSN4655ObpSF+Mx8QT/BMRDC4FYrrSwTZxO?=
 =?us-ascii?Q?F0nyndFWsLcyTarN0Pua+LnYWcxKVG6ZVi+HnoBnE22RkWLHOTQFAHQ0enA3?=
 =?us-ascii?Q?gbgkbdG7TaC/BqIXplNVrgftnTmiJ9j5HTylG26jVoWDZUlMqkTtWgtiPqKy?=
 =?us-ascii?Q?0H2cwR+KbjlkX9aLWkyLC8XMZr+dqyOCoHRQpWQTelMasYR7YbApo/NHKfh6?=
 =?us-ascii?Q?tSuLXSof8L41OPbhQHk6woBIef9XRv0Taa/oGtQiL6GP9aiHxJ3JMOkE9dLY?=
 =?us-ascii?Q?KxCJtgkaQ72CQIsjPNRj64r6sKpAHzCBczZsLfCU97tzwuPXOynO4wepqZxa?=
 =?us-ascii?Q?fd3UE1SVVLzPGzcCBvfQ8sYg4n47FC7jKp+h+WIIPHrCHlWeisBwBLLtKRry?=
 =?us-ascii?Q?5Db5xCQdArQ54aibGHVWF6tc2KqcUOxdaVHXm2krD26eayFe2qIuZQGn3y1J?=
 =?us-ascii?Q?WczKT9oX0SMrjWq/PmT9s5i14xgJuS/ZSlJS+p0nP3m0pMZiV01r41CnYkq0?=
 =?us-ascii?Q?LDQ9CfSgbKm8zg+2KbAT3QSwZ9VM8OttVPul/NVJ3gf0c7/6H2IfcWXTPqei?=
 =?us-ascii?Q?/tfF4ge5KBJYAvWp0atrxf5RppApvnGBC1ZzgAdLhyDgjxDnvGw1vOHAMAPV?=
 =?us-ascii?Q?/xtU4rBSKuzEA83SdFU04RV3usKqmKXSwrwOF4vDZPFwGjxdhnQwKozY1mEh?=
 =?us-ascii?Q?ldF2ucQjnAPbKD9gTtj2C8uZvA2C8lvoq2754ug30n5g6Oh2ee7DIxjehlDp?=
 =?us-ascii?Q?NV9dENdVW1rh3Qi1+o0bUWNulSu29f3d4nY2VSrLeEZgz1kGqyR7SyhS18Ca?=
 =?us-ascii?Q?GfWKga1CO88nugV2kCwFUmRuKOrdvjl0dngg06i1U/ZTOtdl/m5JHtkm23O9?=
 =?us-ascii?Q?5k0swKcX52y9uFglpjT5ZSGqc+2CyV+Y0iwFVU2uckZPw4VmB09avgwJlOXr?=
 =?us-ascii?Q?MK6J1XEUopqioi9OSG+CNjmNkap1GHAn?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:58:40.9025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31390e0-0b80-4ba8-d35c-08dcce49b8dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10095

Hi,

> On 29 Aug 2024, at 15:33, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add the requirements for emulated SBSA UART.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
> docs/fusa/reqs/market-reqs/reqs.rst           |  31 +++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  21 ++
> 3 files changed, 276 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/r=
eqs/design-reqs/arm64/sbsa-uart.rst
> new file mode 100644
> index 0000000000..aac3facce6
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> @@ -0,0 +1,224 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +SBSA UART
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following are the requirements related to SBSA UART [1] emulated and
> +exposed by Xen to Arm64 domains.
> +
> +Probe the UART device tree node from a domain
> +---------------------------------------------
> +
> +`XenSwdgn~arm64_uart_probe_dt~1`
> +
> +Description:
> +Xen shall generate a device tree node for the SBSA UART (in accordance t=
o Arm
> +SBSA UART device tree binding [2]) in the domain device tree.
> +
> +Rationale:
> +
> +Comments:
> +Domains can detect the presence of the SBSA UART device tree node.
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Transmit data in software polling mode
> +--------------------------------------
> +
> +`XenSwdgn~arm64_uart_transmit_data_poll_mode~1`
> +
> +Description:
> +Xen shall enable transmission of data in polling mode for domains.

I would use support instead of enable here and remove "for domains" as it i=
s implicit.
This corresponds to the view of features from the guest side of things and =
enable tends
to make the reader think that this relates to something to enable in hardwa=
re.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Transmit data in interrupt driven mode
> +--------------------------------------
> +
> +`XenSwdgn~arm64_uart_transmit_data_interrupt_mode~1`
> +
> +Description:
> +Xen shall enable transmission of data in interrupt driven mode for domai=
ns.

Ditto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive data in software polling mode
> +-------------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_data_polling_mode~1`
> +
> +Description:
> +Xen shall enable reception of data in polling mode for domains.

Ditto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive data in interrupt driven mode
> +-------------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_data_interrupt_mode~1`
> +
> +Description:
> +Xen shall enable reception of data in interrupt driven mode for domains.

Ditto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART data register
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_access_data_register~1`
> +
> +Description:
> +Xen shall expose the UARTDR register to the domains.

I am wondering a bit if exposing is right here. You do not
expose the hardware register, you emulate the register to
provide the functionalities equivalent to the hardware.

Maybe something like:
Xen shall emulate the UARTDR register to the domains to
provide the same features than the real SBSA register.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART receive status register
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_access_receive_status_register~1`
> +
> +Description:
> +Xen shall expose the UARTRSR register to the domains.
DItto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART flag register
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_access_flag_register~1`
> +
> +Description:
> +Xen shall expose the UARTFR register to the domains.
Dittor
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART mask set/clear register
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_access_mask_register~1`
> +
> +Description:
> +Xen shall expose the UARTIMSC register to the domains.
Ditto
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART raw interrupt status register
> +-----------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_raw_interrupt_status_register~1`
> +
> +Description:
> +Xen shall expose the UARTRIS register to the domains.
Ditto
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART masked interrupt status register
> +--------------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_mask_irq_status_register~1`
> +
> +Description:
> +Xen shall expose the UARTMIS register to the domains.
Ditto
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART interrupt clear register
> +------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_irq_clear_register~1`
> +
> +Description:
> +Xen shall expose the UARTICR register to the domains.
Ditto
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive UART TX interrupt
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_receive_tx_irq~1`
> +
> +Description:
> +Xen shall generate UART TX interrupt when the UART transmit interrupt co=
ndition
> +is met.

Correct me if I'm wrong but there is one interrupt generated and then a sta=
tus register
in which you get what was the reason ?
Here I would make it more generic and point to SBSA behaviour and let the d=
etails
to the design reqs.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive UART RX interrupt reception
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_rx_irq~1`
> +
> +Description:
> +Xen shall generate UART RX interrupt when the UART receive interrupt con=
dition
> +is met.

DItto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +[1] Arm Base System Architecture, chapter B
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 9c98c84a9a..b69699e5fb 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -15,6 +15,22 @@ Rationale:
>=20
> Comments:
>=20
> +Needs:
> + - XenProd
> +
> +Run virtualization unaware VMs
> +------------------------------
> +
> +`XenMkt~run_virtualization_unaware_vms~1`
> +
> +Description:
> +Xen shall run VMs which haven't been modified for Xen.

As discussed during Fusa meeting, shall be removed.

> +
> +Rationale:
> +Any kernel/RTOS can run as a VM on top of Xen.
> +
> +Comments:
> +
> Needs:
>  - XenProd
>=20
> @@ -32,3 +48,18 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Provide console to the VMs
> +--------------------------
> +
> +`XenMkt~provide_console_vms~1`
> +
> +Description:
> +Xen shall provide a console to a VM.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index 7aa3eeab6a..e90f275148 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -17,7 +17,28 @@ Comments:
>=20
> Covers:
>  - `XenMkt~run_arm64_vms~1`
> + - `XenMkt~run_virtualization_unaware_vms~1`
>  - `XenMkt~provide_timer_vms~1`
>=20
> Needs:
>  - XenSwdgn
> +
> +Emulated UART
> +-------------
> +
> +`XenProd~emulated_uart~1`
> +
> +Description:
> +Xen shall grant access to "Arm SBSA UART" for the domains.

We do not grant access to the real hardware here, the sentence is misleadin=
g.

Xen shall provide an Arm SBSA UART compliant device to the domains ?
The design is then detailing how this is achieved.

Cheers
Bertrand


> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_vms~1`
> + - `XenMkt~run_virtualization_unaware_vms~1`
> + - `XenMkt~provide_console_vms~1`
> +
> +Needs:
> + - XenSwdgn
> \ No newline at end of file
> --=20
> 2.25.1
>=20


