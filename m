Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6DA5BBFA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907491.1314725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvoD-0005pi-Ig; Tue, 11 Mar 2025 09:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907491.1314725; Tue, 11 Mar 2025 09:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvoD-0005nu-Ez; Tue, 11 Mar 2025 09:21:57 +0000
Received: by outflank-mailman (input) for mailman id 907491;
 Tue, 11 Mar 2025 09:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trvoB-0005a2-SO
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:21:56 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439991be-fe5a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:21:50 +0100 (CET)
Received: from AM0PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:208:3e::24)
 by DB4PR08MB9861.eurprd08.prod.outlook.com (2603:10a6:10:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:21:45 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::28) by AM0PR02CA0011.outlook.office365.com
 (2603:10a6:208:3e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 09:21:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 09:21:44 +0000
Received: ("Tessian outbound 210dfbf52fb0:v585");
 Tue, 11 Mar 2025 09:21:44 +0000
Received: from L241ef48fbeec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 429A100A-778B-4635-B7B3-307C84204E32.1; 
 Tue, 11 Mar 2025 09:21:37 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L241ef48fbeec.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 09:21:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by FRZPR08MB10904.eurprd08.prod.outlook.com (2603:10a6:d10:137::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:21:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:21:36 +0000
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
X-Inumbo-ID: 439991be-fe5a-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QxT32H242i9Wfxr1wveGJmZ4RjNDxo19s+E8jBooYXJkRZ/OLohTN2ROjiIn4W1hlq+i7JHJzR1r6wAVxoysoMZxTTTL8GRLPI2U9CpdEG0DAjKgLv8T47rpjA1EeODilrsZZbcQJ0dqTAuHXoux0nv0SJaN/VZ2Cn0GxHhvrIDArNQJoAJFdhpOddAdQldEVQTlX9bWNrhzfffcb/CpDQj06pW0sR4sBXhG8GfzJqj0lzHT1mteMisy2teVqdMUyAqL8aOeVjbIWFCsvCQjmuS+ypSxRaBtdnqrdEIyWLImUIrVKokTmmMfevJlJdGDRjah7deV/WX1h7YRRj1azg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKPZAcBtiJPiQl5rw8hVDTUtkHylNPFXj8eZ+gcclz0=;
 b=U/U6FZWXunhkmUtgbuEICOjv31OuqKgvW+E8FMwwOO0Fe/NaOa8oOAo/XleQfliDzULBwB1wtPrN2Yh9pJAvuFN0WLr+WQDJIoaGsBJiNiwbxgnp+4q9ZvtgbuspKL/++P7IzDUvZ+tC/IP3lAUi7BngGs06B8r2Rb7PKhtxwhBqnLcXqpE5L5BKPo+7qslDeRjkGAixejD3CxnnXJZVwEulL4rh3zrawT/yA5A8ImRIk4Ee4xe+MF9QyqHuYg/0fiytcqWGAGnCTIyp0PzRTsadapEtdMBJ80lxsYfnn0cNIr8DkWdXEk0MiVb+wT9kV/IPPfu6PdkMMZfzDYVkpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKPZAcBtiJPiQl5rw8hVDTUtkHylNPFXj8eZ+gcclz0=;
 b=KvXxjFCqDAC+rv2qY6kDTV9zrExOFK7pE9KHGXXRWod1IjLf1jhnfVqbh9KY63X4XzSF7+fG3mtJaYSZA045pxReUdvlgeMlvbhV3bJnK/qmhOS3Z2JVpusNu9o1TuRNbe4cQqKvQIFY8GoQVlzj41jWcU3KwYQ7KGN+cVFR7AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e7b558ed5fe4289
X-TessianGatewayMetadata: thqrz4MZ8zVV3B9Pnl6hJPO0tHEuVQz0WJYsZrntEUMUlLEiocD76+JV8BbSDUZ/CFpcgpsucJfj8ggUg1QzSlKpt2RGX+5sSUZaMwjX3lHUJXAAReUOLbqdcTvVpuQfqH0rvGHhiloHJTqfAokATD7DTdMh3bb3NTdVo66TZ+w=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL18dc0rzL9WPTZC266CEMh/xF+1/umNVU+9aZkzMwaQKTxmWYKr4H0gGbvRFLtSNKO5N4tEVzJ2Cmc8T0IiMdHibYq7qQ1jBajurKWVvURg0hvgvz4CCbiMDFZnzfRVnJokD2t3uT4/KQMSixQfdf9D2lIyHUnIZzjP/oEw1kkZxK6YXcS7BIlWMMiSDgovoE/YKDxtuioBQtr+7+kbnysvj8L9FUwjNhzd+HDc0LfSwFXrC7zx3kJHllJHEsM2tX3dW9Dzjww0FMtAPXygqHuFyI99PwSryGJ+ynJj1NeSA14/SFZ/S+krZks+Q3Z85QdFuNKl/DQn4+Bt05pzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKPZAcBtiJPiQl5rw8hVDTUtkHylNPFXj8eZ+gcclz0=;
 b=ZG5662mWGseqR4tLV2kqxnClg6fnm3/dWL/2ehYjOc/3JyUPVUbdGtQjznLSMW5/YfwrxZqnuRwb7ApSDXsMa9CP7zYcFk4JXANMP0w6qgUBiHY9PJF67xd0nFCC8/uFhcCD76ndOeueC0eG1B2I7RTHRPLlwfsz5bivMfSL0epOuAgfEf3G/ijvJk/BeW8xVTVU+YTsXvwyN/TNZiiuEM/7APxNM+eRgFp4YanOJ5avu/lJhMI46iVlVCpLj1OHDltiyM3mkAmjQSfmhzlMrcWI+IfUT4xqTZ7zawnr1kyUnJd0bnATe2jVlHoLFq075++yrQ3v4euqz71b99snig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKPZAcBtiJPiQl5rw8hVDTUtkHylNPFXj8eZ+gcclz0=;
 b=KvXxjFCqDAC+rv2qY6kDTV9zrExOFK7pE9KHGXXRWod1IjLf1jhnfVqbh9KY63X4XzSF7+fG3mtJaYSZA045pxReUdvlgeMlvbhV3bJnK/qmhOS3Z2JVpusNu9o1TuRNbe4cQqKvQIFY8GoQVlzj41jWcU3KwYQ7KGN+cVFR7AA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] tools/arm: Reject configuration with incorrect
 nr_spis value
Thread-Topic: [PATCH 2/2] tools/arm: Reject configuration with incorrect
 nr_spis value
Thread-Index: AQHbkmSbRQWO9wYiMUWUu1bb3L8uxLNtqSKA
Date: Tue, 11 Mar 2025 09:21:36 +0000
Message-ID: <EE47F5C6-8532-4E85-90C1-C82520EA10B5@arm.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-3-michal.orzel@amd.com>
In-Reply-To: <20250311090409.122577-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|FRZPR08MB10904:EE_|AMS0EPF000001A4:EE_|DB4PR08MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: d87c320e-d803-41f0-e5c5-08dd607e2474
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?gfEwk+Qp/NlHm0GkdXw8SSWTTWCohWqkXz4T5Db6CxQNl8T33qJd9fnuv27j?=
 =?us-ascii?Q?oshJ7yB1udfOuvILEuesNqCrhC7YZEzuHa8IYm2iu0BwGwMfssSYSPvRqhvQ?=
 =?us-ascii?Q?gIM3YRruWv3Cw8kHU/8IeDimlpj1Qx0+xrRGKShI6fLjfEFh9FLgH0k4om3y?=
 =?us-ascii?Q?7XUu4CX98H4vEuLwZpqfBFk2iS6AYo3FJYlD2kNCEI7HW1JY9Idci2rqtc7E?=
 =?us-ascii?Q?mBMojPVCGPFJxmFI3hhrb1YOOAB3hLfwVjL7ew9KO4QvGzkHPuJ9EG6JD8gz?=
 =?us-ascii?Q?Dpd91Ecs3wps1Shjrks5gsEiIhH2IV+qZaRCXtRiklVL1UEeGlaJa+a4u8qy?=
 =?us-ascii?Q?3j0MhFoDwLr5N+q0sNEKwEANVXer1T/3H5QbyUfmB5Ih3mhR+GGVT5wgTWJC?=
 =?us-ascii?Q?juSNeO8w7ddk3QcV17Iue+Tu0ITR95DpO6E/Fpy0fqsBWDGydi/3YrbBjksu?=
 =?us-ascii?Q?ZhC1mYP0rCL2ktmQf18PB3gVNBScrIK+sEjidrdH0SEMJ1v4CpIgkoipD7nj?=
 =?us-ascii?Q?iy8rm8mOkWXAU+GvPg2nvQPiQ/ZKoMLRDWT8xYinddkjvXdQsFcabmChxOym?=
 =?us-ascii?Q?7Ry6BdDdBz/Y1rNCri4Nt67fH8/szS4wK4pVrKTdH+zXviV3xghqdngG9eKI?=
 =?us-ascii?Q?oXhmFAZmo+6C6NXwbhcHWvwIzx2lc0e6YFyXXmWM26ew0tTcFh2PRFNKdptK?=
 =?us-ascii?Q?9IDcq5jCwZYxcuMMTC+lHWcyYkSIpOVFjeew7Q3DJLj/+M/JcwCTIFKsO9UB?=
 =?us-ascii?Q?z351LmkfIx2FYNUejw9w3zIPsF4cYgHsJ58wR+yF0akpMngQT12PE5T/sC6e?=
 =?us-ascii?Q?QPITuGIcdbR1RXKvCRqttE4h9BJ0jnsQxx+L8+w2xUgU63EKdbHN9Um0s5o5?=
 =?us-ascii?Q?vrmy66Hg9/gxSKz9iMyoglfItjjU2FjItx+bl3CRbjODPIWz/evykDKqNVh+?=
 =?us-ascii?Q?JhFMi0eZXBnEp9rfhBrqFuf/tVprqCGVhvmMQij7EvDYOudK7Tnxxm0Wrw2H?=
 =?us-ascii?Q?UlfwaODbAYh841JuvwLvQ61HYm+kyZqsKKYZjTHcgNikOx6o1uJOdj6Me6xN?=
 =?us-ascii?Q?sozGKfmbJ+KpLTYNRYBCumpl0sdyI1OjYdlLR8iNi+iJBLYZsWHYrsE3+uOy?=
 =?us-ascii?Q?QQrSAywrqxDt1ZgbE/PXWpQgCdsRJjkmdrjS5R2K/n0pcQcFMZtOlJ2kVccZ?=
 =?us-ascii?Q?HpfQXiFA3NtbUXXLfmBD/sep7jpkLFFWwCTJGVjKXCMyLY9AWwtSnyQLwvhZ?=
 =?us-ascii?Q?+nj1xxhgzqA1PMJL5s5De6UnOSsEGUKBaji6M/+1uyVgbiP5JTO2hlYXtZ1i?=
 =?us-ascii?Q?N5U0bka5dmkXXS531OZhoxYrXJGiZh133ANA6GHewLn+bl962HSj2frxO5li?=
 =?us-ascii?Q?r2Z6nsh7qVUnqk28DIgQ3jmfC8qRmZ+JZ4EbtZukIplq6xrs53K+axxJpEyG?=
 =?us-ascii?Q?lo72uVA8smZREW1+C+ynQsUPeKsyivb8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94EC7C2F9B41EC47B43ABFDE831E1FEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a331103f-a34d-4704-4dc5-08dd607e1f24
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Efg+/M24BrHrElvIWNwlQzMAp0lmAn2GtSe3NbL1BiCxn67IOp6sNV2/Tyat?=
 =?us-ascii?Q?IgqVLaOuRdyNxWN1cqtRyDDi4ljIPMKJtBqj6uKd6aKMRBhWkpmmJk49hDPn?=
 =?us-ascii?Q?8hKChKcpRinFq3aPk+hVZCg4RkwCYZzWTUknLVCnCKUHwMwb50R+RPdy9KJc?=
 =?us-ascii?Q?VKJoCNZTBH3jxzNTy8E6AeO9r424CHZd8s45Fcwr7Eh8IcO5mNWvA/aNhSRn?=
 =?us-ascii?Q?IhQt7S03OsQaiMetkxyP5cvcme+5ZoC3PKNcP6bdgKjbUvg3pYGlJP65yZsy?=
 =?us-ascii?Q?9Bsr4uQwnYQtZiYdAVrfwdvBrWGlpSvJvriMwBoV59cuXKxwTxvWJjLWfecz?=
 =?us-ascii?Q?xhDTp5S2OHvFPX7RBQ74IJS2NlhArDiSW0NUO6P5bh4SM5ButQGO1hOGS51d?=
 =?us-ascii?Q?uj05/wEYcLvo7dt3Zau6u2iXD9D3K2PdyLcf5yJVfXBnW88FuSHL2/QR9MpL?=
 =?us-ascii?Q?L2+inx1XcLe5mK1PK8wLEu8nkRcGteRukVCnA4dbLYIP9XgyUk0wtLIwkiRa?=
 =?us-ascii?Q?JRU42XQDxX+J3kZ2NDe0Hs+Zl4BR7/BWPQzKyIloUZeeVPICJ9AyQ4arzBVr?=
 =?us-ascii?Q?3fcwOIOGxhtUAHpc+qx+t3NqMeEioyYyJc89fxtiJ1ENg53SdiAETgU5sVxU?=
 =?us-ascii?Q?+YbzXC/9lrSOGpSYdJ4sX1rB53rmY9vfCR4kuUkKtgu1R8jFs6W5uaJXh3YU?=
 =?us-ascii?Q?QYKWEISPbnvYVm7ZRhcMAyWwkZLHu6HD9rADxCWM16vhMq+v/Hcfkwzpor8q?=
 =?us-ascii?Q?dNdn0h0m9dZD4Yfbv9sL/AcA7qW0a+zNOaZPAkTzoYwAQlQD5P93nTGGxeGq?=
 =?us-ascii?Q?qcBDYE9pHc76TFG4f/IrR5zOgaZTur5c++PpTdyiPSgZIS6UuuETOQwTsfYe?=
 =?us-ascii?Q?/FchRg32HfVqtHzmzWql0ZY59VlWKWsaG7fqvb9eEMkq+B7OJefiCdo7dYnb?=
 =?us-ascii?Q?HRIiXwpt7rp0uG9vw6xbRvBNsFO2K2tcThQM0IWBep9GOoa9MNRD8bMFDBcu?=
 =?us-ascii?Q?WjAiDqTNq05ooNDGUwAXAgywxaHWUcePgXa6qMLhhw30iHxvsJTfmxnuZMJI?=
 =?us-ascii?Q?6AuVspd/Y1cuKipN22xIMrswr6WcvfgwOTBHh991lVzB7qj/SgQje7MHQ2VL?=
 =?us-ascii?Q?unmkZozJEB5RScu5QklpN+LrZMFCen5Z6rpd+Y9y2TCw2ZNiA4vNfbkdrWj9?=
 =?us-ascii?Q?PcLb1fquoqmSe1Bs4tvN5VGV0uNVhAtlOUYvDxydtYHT1QWkijkEstL1cWn1?=
 =?us-ascii?Q?RuCb6UmFW1MrIzz+w7hg5J8CugijB9QgOnKscompLsd23P3g+ka6OidM4PIT?=
 =?us-ascii?Q?Ba6cK0ZzV9LAHKrz5i+1qXp9bBMYL8az46XEci86EGHkk9PkLRqN3IhONXWb?=
 =?us-ascii?Q?A50im9rCw2MbETFPJ0kbA7H8RRLaQzGIuQUbsDfzt6p6dfCiSZ+p1gvNxgep?=
 =?us-ascii?Q?NDV71TPC38IeQZbkFXjirD2CULNbHxSZ/xIB6qvixwvNoySz+1oW08JxxTDY?=
 =?us-ascii?Q?WHGX12bA91EIp8o=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:21:44.9796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d87c320e-d803-41f0-e5c5-08dd607e2474
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9861

Hi Michal,

> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> If the calculated value for nr_spis by the toolstack is bigger than the
> value provided by the user, we silently ignore the latter. This is not
> consistent with the approach we have in Xen on Arm when we try to reject
> incorrect configuration. Also, the documentation for nr_spis is
> incorrect as it mentions 991 as the number of max SPIs, where it should
> be 960 i.e. (1020 - 32) rounded down to the nearest multiple of 32.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

With a small NIT...

> ---
> docs/man/xl.cfg.5.pod.in     | 13 +++++--------
> tools/libs/light/libxl_arm.c |  6 ++++++
> 2 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8e1422104e50..7339c44efd54 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3083,14 +3083,11 @@ interval of colors (such as "0-4").
> =3Ditem B<nr_spis=3D"NR_SPIS">
>=20
> An optional integer parameter specifying the number of SPIs (Shared
> -Peripheral Interrupts) to allocate for the domain. Max is 991 SPIs. If
> -the value specified by the `nr_spis` parameter is smaller than the
> -number of SPIs calculated by the toolstack based on the devices
> -allocated for the domain, or the `nr_spis` parameter is not specified,
> -the value calculated by the toolstack will be used for the domain.
> -Otherwise, the value specified by the `nr_spis` parameter will be used.
> -The number of SPIs should match the highest interrupt ID that will be
> -assigned to the domain.
> +Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
> +the `nr_spis` parameter is not specified, the value calculated by the to=
olstack
> +will be used for the domain. Otherwise, the value specified by the `nr_s=
pis`
> +parameter will be used. The number of SPIs should match the highest inte=
rrupt
> +ID that will be assigned to the domain.
>=20
> =3Dback
>=20
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 5a9db5e85f6f..ee9154298f2a 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -181,6 +181,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>=20
>     LOG(DEBUG, "Configure the domain");
>=20
> +    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> +        LOG(ERROR, "Provided nr_spis value is too small (required %u)\n"=
,

I would say "minimum required" here.

Cheers
Bertrand

> +            nr_spis);
> +        return ERROR_FAIL;
> +    }
> +
>     config->arch.nr_spis =3D max(nr_spis, d_config->b_info.arch_arm.nr_sp=
is);
>     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>=20
> --=20
> 2.25.1
>=20


