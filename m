Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A89B4F44
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827696.1242364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5p2v-0005iz-RI; Tue, 29 Oct 2024 16:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827696.1242364; Tue, 29 Oct 2024 16:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5p2v-0005hN-O2; Tue, 29 Oct 2024 16:26:17 +0000
Received: by outflank-mailman (input) for mailman id 827696;
 Tue, 29 Oct 2024 16:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7Nu=RZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5p2u-0005hH-42
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:26:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8258212c-9612-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 17:26:11 +0100 (CET)
Received: from DU7P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::32)
 by DU0PR08MB7948.eurprd08.prod.outlook.com (2603:10a6:10:3e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 16:26:01 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::94) by DU7P250CA0005.outlook.office365.com
 (2603:10a6:10:54f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 16:26:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Tue, 29 Oct 2024 16:26:00 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Tue, 29 Oct 2024 16:26:00 +0000
Received: from Le5843151326c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7DFB2A59-0A09-4AB6-9568-C1A2FD62B657.1; 
 Tue, 29 Oct 2024 16:25:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le5843151326c.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Oct 2024 16:25:54 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6460.eurprd08.prod.outlook.com (2603:10a6:10:254::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 16:25:52 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:25:52 +0000
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
X-Inumbo-ID: 8258212c-9612-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwZDo6NjAzIiwiaGVsbyI6IkVVUjAzLURCQS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjgyNTgyMTJjLTk2MTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjE5MTcxLjU0Nzg5MSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M0NopqCqdoMZ7Lsu3MFrwnCr8xxHL0/TUjTrDWRCpTL9H90NYR4KOuoWAz0CiCryWPzi7WLgYaHoSru1TMZby5V+8pIHzNpnAS3scc6ShBq38oWy+3rI6HUNpBQZHWz0DhdOJVyzOIG9i337Ar5YumjmdH9zypmEAA+p/n3x8hZ8w9N2FhX7xvtsTtx1ekrnCh/LQvprFqXgXqWLeQMeeZR38dtwCtXBZbisp2L3Ge3XQ+qn4rf0G0sZHRmFov+HKRh9PTpUVhoD3a9pBx/KX0lx7TfOyVx7RJp/4Y2+9wUa0vI3O0RYQkKzwKy+Dm8vC5uuQtorNm5PVT4uXRc4+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djiuEJdKJF7GuC5T/AKPh6mAed8WLaSEiUcoRTYkkQE=;
 b=FpyrVX5x461PE3lRg1mVxvJEPPkx5gGtMVaw3BcuSZhK+HqG5MQv/OLAJq+U6PUbMe4NAmBpsXi5kI8RKm8BCY53ZQaYNZw4tKo1NsHZVZYfTPxLEOJ3lqrApskTlIenBT3kHbvi8ae9wv/l14YqgcXwW6yZuy64zM1RfBNXT0UdKHVppWYOdgEjFIdZCGaK7jr7oknrO5Y3nfMTTyU93kt2X45oW7AcYPfdFhHpMrwZGqxWs+vB1o2U+qCU/yqjlXyNj5LC62EAU4zpNV9E8wJndG+K6d/rBAAVbKomhASnEoK25CGjmLvmqWeYmhWDYlF17UB3oPH6I6A8XH4KuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djiuEJdKJF7GuC5T/AKPh6mAed8WLaSEiUcoRTYkkQE=;
 b=R0jg0OacQeCgsu3Vqdg9++yEge4n3rz79tLLlJ7uIk2JxqP5rLS5w9Cunk8mUC/5NXRL/sk3frl16OQUKIx6r9Z9EZDQI7jkp6QgmqdtXTyppTUuWYLIFcv9dGVzqXC9+kw57l6tghRCgFbehU930MpX+58oxmedMfedilDgXdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d20d699ab3bee7f2
X-TessianGatewayMetadata: Td+9RiD6RfnQm/jdfQ2EuW/4Z/I+r2+RWiNQthj7CsROgYd6qSjyM6X9+QsPSwj4PujCxrbq82H9+n3iAlagFn5r0aVBhNZd6PWS6ozw5nw71lJRrw1EBq/EzlffsmYP9Fs2oNyLKlqaujvPWAiN+WrhW+VccXCEc6J5Jr+64D0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKU0XKzcGMMCMwIr5Kf4o5W74Yd2YiwdJeijNitSBFY0PuhMm5aTLFpJFdlLVG+0cKxo6HPpOXpas0z+TyPs8y6CvIlAZhQCmT0hy3YzZxNhEUmOd5gz6cM45m9wJK/0rlhaEk29jZ985fuD6qLOw46ihhDqeonhFNm9ZoUiuebd4f6TXjZnzc9FFTY7ihaaqueV4GtTVhswUFErMNQbWeQB6wLYmEDNkvDp9tsxkr0FjgKD/IyJGBf6oR21o+EyDAExBYOk6Ezol2G47ONp9WrFQDzvkB9cM81x7OfwheOU9+y8F4RACL20hhiDglNTqMCKLeKx9cqaiWug95qotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djiuEJdKJF7GuC5T/AKPh6mAed8WLaSEiUcoRTYkkQE=;
 b=DQ6QFwgVbslqqC+ChuB7vNOfepiTTzr/Tx6k6h0AISdF7fHYaB8yJp63OFClGtAttAJ++D0wHrA6q4pargOUEccTk1vpXHhausWWISEZdtiWwoHTkjg4J2jE2hcG18pnoD3DSsm8z+WGYmmOR1w5OYnMT/WWcyGZk40YSXrlhwZdlsW2WqrYYwy/bTD8hBJZ/RP87WtFWDEwQgzl34tKpbM0BqHwayTBGorXfEdzj1kXzu1IedGpByLWfcPqm48XxYm9g9C6sVsGlb7cryJbNut1PiaxNVvmEPSuwhEPGd9fspfX2CDLOLJ28yAaurpb+ju/YOqCDhqPMgy0PInmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djiuEJdKJF7GuC5T/AKPh6mAed8WLaSEiUcoRTYkkQE=;
 b=R0jg0OacQeCgsu3Vqdg9++yEge4n3rz79tLLlJ7uIk2JxqP5rLS5w9Cunk8mUC/5NXRL/sk3frl16OQUKIx6r9Z9EZDQI7jkp6QgmqdtXTyppTUuWYLIFcv9dGVzqXC9+kw57l6tghRCgFbehU930MpX+58oxmedMfedilDgXdA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKd6/KA
Date: Tue, 29 Oct 2024 16:25:51 +0000
Message-ID: <77A311B2-FD1E-4950-925C-65AA5D4C4183@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
In-Reply-To: <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB6460:EE_|DB5PEPF00014B96:EE_|DU0PR08MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1fbc9a-7aec-4a64-cb29-08dcf8366044
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?a2tSUWxoT0tYRmdqOWFFYlpGZ29pNjgrQnFnUitDNHhRV2pzSE9ESGp6eWNy?=
 =?utf-8?B?aDJNc3RSWS9mdlA5SzNoS3lqa3d6cGlGZklTNjQyQUl2MzFveFNQSXMvdmk4?=
 =?utf-8?B?VVdObkJRTE5rcThQM3VyZjZlUVRMWkZCb3RNSEF6TzhqU2NRTG9wMnhaVTdP?=
 =?utf-8?B?RG8vVENDQUtVSXZrN3JQNlg5S0V4K0Z2RWxVbDE4bUVlaFNHR0ttTGp3WW9p?=
 =?utf-8?B?VW56MTBKRENoSkNHRlBGeFhWQklCS3ZvdXJ5aHMwcm13YzkxSWpVSEpxU2Zi?=
 =?utf-8?B?b0F5YkxxZzNLckdYYXpHcW1US1l5dVJpaFhOYmNoK2pvUi9Ra0EvOHlzUy9q?=
 =?utf-8?B?cVAxK2RDeHNaYjRtYUZncHZraWxlT1dzVkFDejM4bi9mdmVTV0lyRHNTZytQ?=
 =?utf-8?B?a0pqd0trMTVRUFNSVEh2NUhTRzh6cDhUdkw0YTBaMVdGNGtFVFpmQ1NKZEJp?=
 =?utf-8?B?ak5pb2djd1pDcmJ4SFJvd29jK3lmdjBZQXFyejlIM3VnWkZYeGNOazFHb2NI?=
 =?utf-8?B?MVFOcXZlankzV2Jsa2h2WjRoRHNFOU1haG4zVjVNOGx4YS9kQmQwNkVwemF2?=
 =?utf-8?B?UE1QQkVpTk5pWDZvcGtaY2dsbW9nQU5BbHd1NTlvZDQ1QVg5ZHJxbVphc2ln?=
 =?utf-8?B?SFUxdVFiemN5K3MzN1N5bmlIbE9INEVnYzZ3OXpndGZYdFhuNVgxeHFGNHR2?=
 =?utf-8?B?Y2pheWVWUk5maU5WMFpqU2ovNjM1ZDk3VkZvK1k1THh2NFhScUVQbmg0T0I3?=
 =?utf-8?B?cEpWL3JVcGZhaTY3b3JJcmRHWml1SnhVUmd6QmtJUzFIa2JRVUlZa2s2a2tw?=
 =?utf-8?B?TDRFbzBvRGluMnhHNUgwaXBsSG94MFMxQlA2QXdkTUFyY1lMdHljc0VLN3pP?=
 =?utf-8?B?WHk1ZW5Vd1FQNWtrWTRaTjU3U0U1YmtjZnRhQU1uSDZmcnhMSTVwc2FnRldB?=
 =?utf-8?B?Ukx5NG5pWVVVUWZpb2FSdUhTT1J3VkxJOEhUejMvejBDME1aTlZycXJyaTZN?=
 =?utf-8?B?bUdHckxBYmx3cnRtVnFUUmp5ZFdscjJWZVlkWEQ4UUlVQWJKMmcyZHFPcXFv?=
 =?utf-8?B?WTE3dEM4OHNjeXh3R2JseXkxSlY3ZjZoYkJ1UlFDR0tHTU45NnQzcGluYUMr?=
 =?utf-8?B?ZVNkcmRYS3dpTTFYNTJhSzdzMU1INzBNRHlWVDBJeEEwakZ3cHdjUlBRMi8v?=
 =?utf-8?B?aHVhSDV0d2NJNE03Yk9VMktrbzZObklYWW13aXVzVm42L0l3cWtsWWcxZUl2?=
 =?utf-8?B?UDBBL3FUakUxNlo5Nk9veHV1NVpjdTBZUE5UODROem03a3Btelh5c2oyc3R5?=
 =?utf-8?B?MS9IRW9jQ3U0UFB0bUpzcTk4akxNaXlueWZxZXZsTjFJYzE1UDlNWFFpZld2?=
 =?utf-8?B?ZE9uQ0Z4czE3N3d6UERQZUMrVlM0cHppNlBHSGxsbTFsdVIzMmE2QkpUZ2lG?=
 =?utf-8?B?dFE4MEFXWEFaUVc1dkJYbDViMHUyZitoeXBka0VOM0g5ckIyNjBBWUF0MVJM?=
 =?utf-8?B?TTh1QlM2RHM3bTJweGkvZ3AxRlgvUElUVlhtT2JNRmtGamJBSzNoc3JIQXRR?=
 =?utf-8?B?OWdNUUdmbWVOMGVTMTU4RXB2ODg0VlZoS2tpNGlQYU1HVURhMnlBbE9CU2xy?=
 =?utf-8?B?SjZocE9DQVdQUlZ0N0NBYjl0V3BYNEpEcXpHOEFmSnpka0NBSi83cXU1Tm5U?=
 =?utf-8?B?aTk3MW40UTd1dXdIYkwxSWZuZS9zdWRtWVJhaGVYdXRacmQ5OURUTmNyOEtG?=
 =?utf-8?B?UU1EaEpnd2lYNElFRS85S1FSUjlrZXBscFBmT1pIdzMvNEw5NGJWTkUwL3Q3?=
 =?utf-8?Q?R69+UEhx94fJS356PMUN3IUmu0Rn3fhBcaVZ0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD6272AF4E115542A68D7CFEEB8B771F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6460
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eceb2b9b-d924-48ad-f349-08dcf8365b1c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWRBZ08wanpQeUJvNjJzVDc0MTQ5WktLVXA4UTc4bnNFMy9DTlhqMjRrZkkz?=
 =?utf-8?B?Vitva3loVHlZODBrMy93MEgvb1ZJSmpZR21rTysrQ0prNUVtY3lXaDNtUVVL?=
 =?utf-8?B?RWtHajJ2MmkzQkozUElPRTJCWVgzYVhVUkZhNkhhN0dUWWl0VkNHRUd2TWd6?=
 =?utf-8?B?MTZpZ1FCek9PK0I2WldUZXBubFhIbjJrNEJyZGV3MlF3UHlhZ0tsT0U0V0U4?=
 =?utf-8?B?WEdnQndCWjZXVlZ0ZUtyeDBSakhtL3huR1hRcElDZVU0ZkZ2NVpmSC9hWWo1?=
 =?utf-8?B?YWNwTzIxbHoxcXlOK1poWTVBQ3VGTlpxY0s1MmR3MU0xL0lTRnJZT3dsU3B0?=
 =?utf-8?B?QnhlZnVQU01WQWxxL1duWStOMDU3bTV4aHF0WUR0eFZFT1Bobi9QVjdSekY0?=
 =?utf-8?B?NWlGOWl5Yi9hZWczRWVHZGV1Q1hDTDdKOHBhT25odHhsK0svQTMrSzdvRFpD?=
 =?utf-8?B?OEhSdDdHUkJwRTZsdkpmSGxMcG5FQUM3TE41MWtUMUpqVzRROFpwTEpyeWZL?=
 =?utf-8?B?L2RFYUpDalMyRmYxRm5WZ0V0Mi9OWU9yQThTS1RYbVpiM3ZaUzdTRS9zVDZt?=
 =?utf-8?B?UnA3Rkw3WW5NYlJrRFk1dlc3RVRzVUQ1ZlV0SU1FTXNmZTNVZ1NQOFUxbm5D?=
 =?utf-8?B?ZzJMUGZDczJOR3ppT3pXZ3pndUZLTmFiR1RrK2l0UWRYS1N3d1pIOSt3NDU5?=
 =?utf-8?B?RTRsMWRmeWhadVB6d3ZoenV5R3JLclBteWhYUE9ad1lFQllZTUZDQmdYdHZv?=
 =?utf-8?B?Zy9sbGU2TklwN1M5L2Q2MHFvalkzRjJJRUltc1dvODhHaG9MdURIRzViaGE0?=
 =?utf-8?B?U0RIVlY4TVhucU4yN3JFclUvdC9tNDRzb0ZZaDNpZDdDb3hqaDY4TEszQ2po?=
 =?utf-8?B?WlRUSDNIMDI0eU5hZEhPK0s4bTNvV2RSLysvSStjQlRvWmcwMEF1L1JwSEt4?=
 =?utf-8?B?WFA4TFMyL2NvZlZKTE1CeGFhNTAramtYSzBURHBPSUd5WE5NRGN1SFRPM21Q?=
 =?utf-8?B?OWFRRms1QjJlK0JCSEtZTzdVQktUT3lwYmVqblpSRXgramZIZDFZRXpwQ2Vs?=
 =?utf-8?B?Szd4MjA0ck5VYVNRTUF5dFhPZWRVTGVnNnVDaXU3TGVsU3FycW9Zc3JFd00v?=
 =?utf-8?B?OHR1bEZHSmw0Q2xJSTYvdVdtTkIvTzluTTNTSVJWTDRqMjNicUVQZ3lGOUFT?=
 =?utf-8?B?ZmFTckNOcjR1QUtjZC9EcVZCQ2o5RVZKaE15cU9CWTdhclUwY0Z6T25QbXQ4?=
 =?utf-8?B?YXpkMG4xdWdmUURoeWR4ZkREUDBGUS9iYjNyaEpCeGJTZzBFN3p3dlovRUgx?=
 =?utf-8?B?Qk52dTdoeUFIditPRUU2clJWc1k4RmRhK2VXZWtvSkhSbmFFcXorbEFCb1Mv?=
 =?utf-8?B?bFU2Z0x6KzFNcmNMQ0dhdXQ1bUVER1IyYXErM080Y0ptMmVtRTNaTDJIRi9z?=
 =?utf-8?B?L2tCV000c2lNVUdBeTBqalYzNmwwWEh0TllFMlpGbTFoRy9tdU9QU3Fxb3Er?=
 =?utf-8?B?R2dhUzkvSEd1dWdTbDMzMDRWQXZQaDdIYUIyN1ZMTVFwektpblF6V1NScmxy?=
 =?utf-8?B?bmJZRDNwT0x1K3BXcVNEZlk0YlBKR0dROXZ4RWJJay80QkVtb3hlWEEyaEpO?=
 =?utf-8?B?Z3Y1RTNoVzBYWmhZSXlvbEQ5enY1SDV5Ym1OVVpZL2QvUnJHdnZsMlNrR011?=
 =?utf-8?B?ZFV2UjF2bitlZzloRjR6cjVuUDFwaVYyUnpSUG0yVUVLaVFyVm54N2hCSysz?=
 =?utf-8?B?d2d2RmlDNzdYMEFqZFhvWHQ0MVVSNHMwUGx5dWx1NWhFR0hoak4zWXl1MXBD?=
 =?utf-8?B?MERHYnBiWHZpaG9ORFRWZWFzWFV1NUN4L1VIb3cyZmxSUmtnL21LdHg0UjJC?=
 =?utf-8?B?L2crdnBSam1YU3FNME0rZXhkZGFYQy95TUxBQWN2dTZpR1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:26:00.6655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1fbc9a-7aec-4a64-cb29-08dcf8366044
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7948

SGkgQXlhbiwNCg0KSSBmb3Jnb3QgYW5vdGhlciB0aGluZzoNCg0KDQo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVh
ZC5TDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjkzNzdhZTc3
OGMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQu
Uw0KPiBAQCAtMCwwICsxLDEyMiBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSAqLw0KPiArLyoNCj4gKyAqIFN0YXJ0LW9mLWRheSBjb2RlIGZvciBhbiBBcm12
OC1SIE1QVSBzeXN0ZW0uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGFzbS9tbS5oPg0KICAg
ICBe4oCUIFRoaXMgZmVlbHMgc3VzcGljaW91cywgdGhpcyBoZWFkZXIgY2Fubm90IGJlIGluY2x1
ZGVkIGJ5IGFuIGFzc2VtYmx5IGZpbGU=

