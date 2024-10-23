Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76319AC0F6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 10:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824465.1238582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3WKw-0001uT-DG; Wed, 23 Oct 2024 08:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824465.1238582; Wed, 23 Oct 2024 08:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3WKw-0001rq-AH; Wed, 23 Oct 2024 08:03:22 +0000
Received: by outflank-mailman (input) for mailman id 824465;
 Wed, 23 Oct 2024 08:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KN5j=RT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3WKu-0001rk-Cv
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 08:03:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 433e47a6-9115-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 10:03:18 +0200 (CEST)
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by AS8PR08MB9454.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:03:13 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::cd) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Wed, 23 Oct 2024 08:03:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Wed, 23 Oct 2024 08:03:12 +0000
Received: ("Tessian outbound da7ba6582322:v473");
 Wed, 23 Oct 2024 08:03:11 +0000
Received: from L33bb44f6c52e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9DFF895-948C-4AE3-917E-0082AECFD5BE.1; 
 Wed, 23 Oct 2024 08:03:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L33bb44f6c52e.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Oct 2024 08:03:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9341.eurprd08.prod.outlook.com (2603:10a6:20b:59a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 08:03:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 08:03:02 +0000
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
X-Inumbo-ID: 433e47a6-9115-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g9SNHBlJG6XaHc3B3ftsSWD/57YHmWWD2/4m91+A6LAm+5zuKbBXvH42bsZozPExGnEgfWw71142FSxSGx6SVmoGQft6OqfoB9aT5mYUdR14GfyLoJBfeKJmuPobmeEvmktrJpjWhBtQSJ4tko3hINOFIzrUaBKMROQgH4BEGhO3SJQZMM25eFLrc/aPlDJVU7GI0id7Qp2ImTMiYbR7ExesCDAfgzMuq1lPldQpP44eCJzzoe8I+xIdZdJgLJHz++676exHeoIk6wTtDwOnrUqx4u6ovJ2r4vsGhuUR8oTJ95VeWKRTVs9yltmneerPOhxDVDIZh3R3/ZQ4uRoLpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEpm6YbZpc3RjaWIDZ83ATdNfsjNoI1zdoA2KN9Yzvo=;
 b=yc9zcj0jrWiPIcMGBnT+XeiMyrG2/hnat6mdkfNxc+F0GesqbOkUdw+IxMmsPIblpqRh6d5B31sLKixC3a7uBYw3GHYa3BY+tj0SnFiiW8+5MBqKSgkEszhsgqFPn3X8umfq9W8RF4YPFd61dyzyUMJPlcvdowk8aOxTAn5Qum0zzJK1ykD+FWVLwltQHF9upIPMObhmgW9HMOTt8bkvRV6B3WBBghwu72IBx4XtzSVd4/zVGDFtiJ2QG/ennxAZQ5X6a5mhyp0wcab5Pw5LGp6jqm3RTwjkpJo1SWYhe9ysuDF5Phe9g7JMzJG5kYwn0QJbv1CEFxO5laZcPp0IQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEpm6YbZpc3RjaWIDZ83ATdNfsjNoI1zdoA2KN9Yzvo=;
 b=CtSIZnXgK9INDLE9a7tT8L2Ru7TOjnruwYxptGIaGANXU/9ivtB40MQhQ7PIIsXE5FBtW4u8iMlPVyL6sQHn2mCcUFo4kcqnBS4fGU3j2qi+n+qHV9KDwuv8KctscfTXiPF3SXCOfkkCw4BX7zhLl36ADYPU4IKNI5b90PgYNrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e463957e85ed13e
X-TessianGatewayMetadata: wKvOqtqR2AGrVi70CT5vay8VCBWpzUc82FNsHhYxXMSUKgRpGFyDllbW5vkzcBKz/Lt/CHAQ///U2HeiQ3jh6xdUbn8abCxQydn4KOSmCXcP8kkJUDjNf3kGFS9ziLpz8pldhBd7z3BuuNoF1u9JTCa0SgXlcvdsTltgyk9jcr0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDAFLVSrNBZHRGhpa35SveumG7oyHQjG2Dvrcgvb8bmKG/dypgx/WXqJHKVmczz+0ajiK9eE8+odjbBVTekb0iK/rlhxCVW1lK+7HvzQyW3WceAfl0dvDSUd1d6rKqxRhOPHzQWrdV+IDfh3RIbUaRvAiS8g2gT4crtO+SpheuC0ftNydCdJOENwZUpSJDE5CpD8dbxgMC0ZIsc2sT+2VjYrgiFKOXpSYBwbOkDzlBx+HsOQRtAr1t7Srq8zqS7genLC/lHSpFlhPWBziTBP2lGD3gq8z+pBadA9XoR8E4JOAPTN3qcDu7YSvB0I8jVQ6j67ZAm/QE9IvC1LVwdycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEpm6YbZpc3RjaWIDZ83ATdNfsjNoI1zdoA2KN9Yzvo=;
 b=bWs3cLjR2vLBOVb/57I7uHD6AlPMia0g9CvnQWZHNYCc3PvEdHDQs4qmL6CTgs5dB4KQTcfoElnXrVNh4NOc7tH1Nx7V/oIxJYDEQfcGRj9eZ/PKi2vFzTVGOLzgbUJyQlKIHURDttQbm8MNF40nHnTa9tjQaxIiUCY3quhhG5SPYgYa2L+eciAhwUrjMHWihpsEpN0T+MpYW/jnyxNIx1HXuNHBrcbVyTSIz+3VE1zd0Kz8XWiIRPucHISL9yocqS8RQ3KBVryHQcMZXy6sw+KHgleB7GE7RuwBoY49nd2NVjzLGjs9xa3LwznI0OhFI+UVsNZLndKBLl4iwz2nXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEpm6YbZpc3RjaWIDZ83ATdNfsjNoI1zdoA2KN9Yzvo=;
 b=CtSIZnXgK9INDLE9a7tT8L2Ru7TOjnruwYxptGIaGANXU/9ivtB40MQhQ7PIIsXE5FBtW4u8iMlPVyL6sQHn2mCcUFo4kcqnBS4fGU3j2qi+n+qHV9KDwuv8KctscfTXiPF3SXCOfkkCw4BX7zhLl36ADYPU4IKNI5b90PgYNrA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 01/10] xen/arm: ffa: Rework firmware discovery
Thread-Topic: [PATCH v2 01/10] xen/arm: ffa: Rework firmware discovery
Thread-Index: AQHbH6X1lwra/EHVREKaxzeIxsME2LKRdxGAgAKNjIA=
Date: Wed, 23 Oct 2024 08:03:02 +0000
Message-ID: <C0553883-A75B-45F2-AFC7-6630F2DFFFAA@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <457020b684e87ee9ad9488a4ec0d17ade90fdea1.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44FDQPepdzM1q+6QjB+fA4C+0OnC3-+Na6KMD_AVAeQadw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FDQPepdzM1q+6QjB+fA4C+0OnC3-+Na6KMD_AVAeQadw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9341:EE_|DB1PEPF00039231:EE_|AS8PR08MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffd8ef1-9e7a-4e22-4b54-08dcf3392410
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WElYeHlJUHJNdE5tVjFuYjlqVlFLTU5BakwzRXFkTEJGS2liTDhUSzhuUTBG?=
 =?utf-8?B?VmpZRWFQWDRqRVNOTUxmT3hzc2thRjhXdnlRWGs2QVdPYTlnRXpEUm5aekNa?=
 =?utf-8?B?NmxwWWZmTDdHYW5qbVR0WWZmN1hrbC95U2hyYkp2aEtGYnZWb2o4Mk9iSTZn?=
 =?utf-8?B?eHYyRFBUckFEOWdOaTJFY1YwQ3pKK3c3bVhlaUpMTE1Id1JocFMxdkppYVV2?=
 =?utf-8?B?aXRnNlhNb3MyVEpDTTJLNGhSeFBLbjlucm1xOFQ3TEtialB4UElBV1NpMVFy?=
 =?utf-8?B?ZG0vRWMyK3IrMVJvaW5BYUJ0ZjFLODBKUkRTL25UZ3pJNzhjV3NCazdsYk9Z?=
 =?utf-8?B?eEZHQXlyR1lZMGpkZGpGNTJIWHRMRXBoMWFWSi9YaHJkWE5IVGlXeURjK1J0?=
 =?utf-8?B?Yk1XQ01veWIydDNIL3VOczhhV21lZ0Q1Qmt2dC9oZVJCblNaUXU2WkN5KzlG?=
 =?utf-8?B?cWt2d2YxRys3MWJXWk5YUU1qTDlpQ1AzN3Q5RjlVVC9DWTVnY0Y4Y1QxRFpC?=
 =?utf-8?B?ZzJhUkp6aTN5S3p0Mm1Qa1c0ZnltcENSTUdtVmE1RXRoR0ROMFFMZHllakw0?=
 =?utf-8?B?TEVIaFJZVXI0anpoT0FnRUc3Yk5XSTBVLzB1OCt2MkFRNS9VZEluOCt0TjEv?=
 =?utf-8?B?dEpRa2s1a3ByNTl4a0krdGZyT0oyekpoZ1gyc1lTUFk0VmlqMFNNU1FRQ3ln?=
 =?utf-8?B?T0hRT1dRZnlCN0hjOWo0WlFSUGdqaklpN3dRRENrOURKdmI5Nk9sL3U2NXVv?=
 =?utf-8?B?WmZ2MlA1Ti9yb3R3ZjRvWW5UZ3g4T1p4OFVkMFJqSVNaNEkxUG1qeVhlOUpx?=
 =?utf-8?B?MkFuUkh6ZWpkdDhIVHNCd2tCSzFyeUhlOHJ0TFdhWk1OekNQZlkvcEdPd3oy?=
 =?utf-8?B?dER0M2NNS1VWZ3lubHhYUm8vZmc1OUNYaVpkZ25LWjFuL1hmVzNMU2QrTTFG?=
 =?utf-8?B?RnV0ZldOTjF0aUk0MjRydkZ2WGEvMms3YjllZG9WNHBaYmxxWVlQMW1rK3c4?=
 =?utf-8?B?MFgzbWdwampYNnRHOTBoNjZoR0FjOGV0M3R1TTRwa3NCalZiM0paR0lIckN4?=
 =?utf-8?B?V2oyK1NZVDMvNDhjUWpzV2lTRHcvS3Q0eUkvUys0M1dteVBIOFlac0FKcWpi?=
 =?utf-8?B?clcva2ZnRFJKYWZYTkphdXZIT2xnditqR3NxNDFLdENCOWNlUFVtejZaUXly?=
 =?utf-8?B?T1Y2ejViRnAwQTBCSWpJTWdmcHBaUnI4VkNUQU1wa0xqYXByb211aGsxQlJ3?=
 =?utf-8?B?amk0b1AyUGNUZFJwRXJrVkMzRU5nM3VlZXVSYU5KVno0ZkZkaFBTOGdnRnB2?=
 =?utf-8?B?eEJ5bzVESjdMNEJLMjEwRHBmSGpKQTkvVHphQUtKSHZmWWhpNGV1dlI4ZWpV?=
 =?utf-8?B?UDhVbzFkRjBqZ0xIT3VLbU5taGUxc3ordmwrbGlJbDZMaFpMbTUwbEpTd3Fz?=
 =?utf-8?B?K1lyUmVVek5zTHZHeCtYQzlCa0thaGtHVjR2SloxNXdocmZ2ejFLU09QTFhQ?=
 =?utf-8?B?WlluZkxZdi9xaisyMWFjK3o0bGkyTGhickRoQ2kwWSs3TjJZb1dwMW9MeDY0?=
 =?utf-8?B?VER6WmFad0NFMWJYVVoxVFNNanpvK3JSTXhyRkdsNGhQSFpaNW1yK0JmKzdk?=
 =?utf-8?B?bFNNTmFQSUNVK3hqa0MwUWJ6QlZTZlVzQy9rbm5naFNlR0VLRC9WQ0FxS0JR?=
 =?utf-8?B?WEJFVFY4N3doK3BpUGlMZEhCR2g4akxHbHJDa2puRGRDQnl1SUhmSE5tN1E3?=
 =?utf-8?B?Y1p2d0FGRWlKNHRSaXp6T0NKRWxERzBtSXBjYjJkekhOVUVmMHFCL3h6WWdW?=
 =?utf-8?Q?hQF4y/+IRBLlBVuXnouAuI18Hh2+6sis8PFxo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A22E3F24E679947A9B78A8B04855DE7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9341
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0dffac07-ada9-481f-064e-08dcf3391dfd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWNDVDc4MlJ0V1paMHVlVVFtcW1XNCs3WFdYSHA0VXZnakhlYS9RQ2FFbUZh?=
 =?utf-8?B?WmFQaHgrSTZ1UXkxL1pZTFNlMS9sR0Q3Ym9TcW9qK1V1SlhKT0JBUDZBNW1z?=
 =?utf-8?B?SEFrVmtwdzZSbHk5a2M4SDRNNFF4bzVFaVNsNno1eTlwaVFuS3FGa2ovaTNS?=
 =?utf-8?B?ZHVmakNLaDVkaWdld04wOG5nSmprY1E2VWNZb0lqMFlGQmg0Zm9mRTZXNURx?=
 =?utf-8?B?cXI1aWVMVU0xTlplL0lMaGV1aFF1bTB0a0lQcGZWRkdZaVQzYWE3NFlYdWk0?=
 =?utf-8?B?UU9WdG96MDhCamZtbUUxd3M4UGltR2o4eW1FYjd4T2VOcGN3YXJlM0w0MWZY?=
 =?utf-8?B?aHhnRGE0R1M1aTlRUXFQQjhVYmpxZFhuSzduZyswQmYzeVRGeVp2d3gwWEZJ?=
 =?utf-8?B?ZnlsODF1WHpYNHU2eHdGN1B1L3BKZ3JONmMySlFBTnRGOGxTcCtweHFqMC9C?=
 =?utf-8?B?dS9yNU5ZaW5DQ3Avb25hRmtTOUNFMndONE5pZXN5cTNrb1lzMFlXcHBwUHVJ?=
 =?utf-8?B?Zmg1NUVQaENhcVN6V3B4emMzaWxLZmZRSFlpdjJsenhhN2U5Ny9VcWdRR1pS?=
 =?utf-8?B?NVRsamQzT3pkN2lNbDNrNnM5ZTRXZ3lZWjhPR21HRzZrREYwd1RjTUwwV3pJ?=
 =?utf-8?B?d2JPOXM1TlY1V09WbE9sbThZSFB2NGVUeVBNWnFvc0tJU3pxMDBia1lOQVdl?=
 =?utf-8?B?QVA5eU5iNHZzVXpLWS96cGNnbjhpZDdQWTdrY3NsUTdkV3BDRFZKT0QzdHJC?=
 =?utf-8?B?cVloRUlNUTk4K01BNzJMRytESGFmdk0vUGtnSmhENUhhbWVjM2J6a25DdFFI?=
 =?utf-8?B?ajZ1MlRtbzduaG1WY2ExZUJHaTZERkRhWGNOZlN5cnNjbjNTRTlyRjVQbnNz?=
 =?utf-8?B?d2ZhMlZxVWVDZWFEQkVXcDlucnZYempWNDlsUHhBV0lQd1FSVlVsdnpTNnkr?=
 =?utf-8?B?ZHVTUXlRWGJqbWJpK01wb0QvQUpqOXNRSzUyWjZLd29NWkx4aEl6dVlwem1E?=
 =?utf-8?B?RzJWR1ZaeUdWbFlwaE85d0VMWStjQW5JVTNQUHZoUmNXU0ZhM2Q4a1VLTjh6?=
 =?utf-8?B?Tkk5MWMzU0RzTkR3eG15SjZIaDYvRDUrUmtCZmlMRERUamZxL09sNGdsZ1hn?=
 =?utf-8?B?WEg1YTZnSndWZ3p1K0MrMXJsZXg1MTF0Y2xBZjd6N1VudHVWRHMxZG1peWE5?=
 =?utf-8?B?WDYxd1pFc0dheGFaWTRMWjdWdlkzZjFYRnBhalFDQ2NhLzJUQ2NNczdZbHBK?=
 =?utf-8?B?NTE0cTQ4VFg1VHNZNVYzMjRaK0dreG5BUlZJcDV2SGVpNE9xVUdoWEdmSmhI?=
 =?utf-8?B?UlprSGJFUVgrZjhDa1VqOWRDMy9vWWhBZnd0aHNkWmExZzg1ZmNScnViWHJr?=
 =?utf-8?B?b3U1MkNRYWVsQm9JUUdXeUNuNTJZaUErOHBQUGh4VzF4Qy82WHNOWWlVTHli?=
 =?utf-8?B?Nk9ET3dXYnNUS1E3elBMUVBNazRxRnNsWDlObnBSQnV4dlNqRGpCU0NDa0Y4?=
 =?utf-8?B?ajhCdHNGTjdCSFk5ekV5QW9QaTlld3ZWNEkxODFtWXF6YUpabDkrUGxwUE1l?=
 =?utf-8?B?ajdBWEIrMWdVQjBsSDRlTm1OZkMzcGdnYzRzaTlLU0Z2OTROM1pGQWRhRHdz?=
 =?utf-8?B?cXFjbm1LbmtLWUJ0bG1hOEU0Z2lkaXBmVytHQi9EaVhvMkFoWEphRkhpTWZ1?=
 =?utf-8?B?WDlsQnpGdEF3ZjVRNEw3YVZYeVJBMlBaUmZmZW5jaTJhMkFqQ1MrYkpBWmJ0?=
 =?utf-8?B?SUFTYU56cHF2K2x5d0pGNUhsbnFhOFpmK1JheXA1ZWtiR2FYVlpKTDQrSmxS?=
 =?utf-8?B?bFlpSksvNFBVZ2JPdzhYYlJvWmNxalVnWTBzb1VZSWloNU1KTm9aMytRNkwy?=
 =?utf-8?B?a01VRWN5L1VBYkVmbUY5UDk4WjhUdTcrVm0wR3RVbXVPcEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:03:12.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd8ef1-9e7a-4e22-4b54-08dcf3392410
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9454

SGkgSmVucywNCg0KPiBPbiAyMSBPY3QgMjAyNCwgYXQgMTk6MDMsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBSZXdvcmsgZmlybXdh
cmUgZGlzY292ZXJ5IGR1cmluZyBwcm9iZToNCj4+IC0gbW92ZSBwcmludHMgaW50byB0aGUgcHJv
YmUNCj4+IC0gcmVuYW1lIGZmYV92ZXJzaW9uIHRvIGZmYV9md192ZXJzaW9uIGFzIHRoZSB2YXJp
YWJsZSBpZGVudGlmaWVzIHRoZQ0KPj4gIHZlcnNpb24gb2YgdGhlIGZpcm13YXJlIGFuZCBub3Qg
dGhlIG9uZSB3ZSBzdXBwb3J0DQo+PiAtIGFkZCBlcnJvciBwcmludHMgd2hlbiBhbGxvY2F0aW9u
IGZhaWwgZHVyaW5nIHByb2JlDQo+PiANCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+IA0K
Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBGaXggZXJyb3IgbWVzc2FnZSB3
aGVuIHdlIGZhaWwgdG8gcmV0cmlldmUgZmZhX3ZlcnNpb24NCj4+IC0gTW92ZSBiYWNrIHByaW50
aW5nIHRoZSBmaXJtd2FyZSB2ZXJzaW9uIGJlZm9yZSBjaGVja2luZyBzdXBwb3J0ZWQNCj4+ICBm
ZWF0dXJlcw0KPj4gLSBVc2UgV2FybmluZyBpbnN0ZWFkIG9mIEluZm8gdG8gaW5mb3JtIHVzZXIg
dGhhdCBGRi1BIGlzIG5vdCBzdXBwb3J0ZWQNCj4+ICBpbiBmaXJtd2FyZS4NCj4+IC0tLQ0KPj4g
eGVuL2FyY2gvYXJtL3RlZS9mZmEuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLQ0KPj4gMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE3IGRl
bGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmEuYyBi
L3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IGluZGV4IDAyMjA4OTI3OGUxYy4uMWNjNDAyMzEz
NWQ1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gQEAgLTcxLDggKzcxLDggQEANCj4+IA0KPj4gI2luY2x1
ZGUgImZmYV9wcml2YXRlLmgiDQo+PiANCj4+IC0vKiBOZWdvdGlhdGVkIEZGLUEgdmVyc2lvbiB0
byB1c2Ugd2l0aCB0aGUgU1BNQyAqLw0KPj4gLXN0YXRpYyB1aW50MzJfdCBfX3JvX2FmdGVyX2lu
aXQgZmZhX3ZlcnNpb247DQo+PiArLyogTmVnb3RpYXRlZCBGRi1BIHZlcnNpb24gdG8gdXNlIHdp
dGggdGhlIFNQTUMsIDAgaWYgbm90IHRoZXJlIG9yIHN1cHBvcnRlZCAqLw0KPj4gK3N0YXRpYyB1
aW50MzJfdCBfX3JvX2FmdGVyX2luaXQgZmZhX2Z3X3ZlcnNpb247DQo+PiANCj4+IA0KPj4gLyoN
Cj4+IEBAIC0xMDUsMTAgKzEwNSw3IEBAIHN0YXRpYyBib29sIGZmYV9nZXRfdmVyc2lvbih1aW50
MzJfdCAqdmVycykNCj4+IA0KPj4gICAgIGFybV9zbWNjY18xXzJfc21jKCZhcmcsICZyZXNwKTsN
Cj4+ICAgICBpZiAoIHJlc3AuYTAgPT0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEICkNCj4+IC0gICAg
ew0KPj4gLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAiZmZhOiBGRkFfVkVSU0lPTiByZXR1
cm5lZCBub3Qgc3VwcG9ydGVkXG4iKTsNCj4+ICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gLSAg
ICB9DQo+PiANCj4+ICAgICAqdmVycyA9IHJlc3AuYTA7DQo+PiANCj4+IEBAIC0zNzIsNyArMzY5
LDcgQEAgc3RhdGljIGludCBmZmFfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAg
ICBzdHJ1Y3QgZmZhX2N0eCAqY3R4Ow0KPj4gICAgIGludCByZXQ7DQo+PiANCj4+IC0gICAgaWYg
KCAhZmZhX3ZlcnNpb24gKQ0KPj4gKyAgICBpZiAoICFmZmFfZndfdmVyc2lvbiApDQo+PiAgICAg
ICAgIHJldHVybiAtRU5PREVWOw0KPj4gICAgICAvKg0KPj4gICAgICAgKiBXZSBjYW4ndCB1c2Ug
dGhhdCBsYXN0IHBvc3NpYmxlIGRvbWFpbiBJRCBvciBmZmFfZ2V0X3ZtX2lkKCkgd291bGQNCj4+
IEBAIC01MDUsNiArNTAyLDkgQEAgc3RhdGljIGJvb2wgZmZhX3Byb2JlKHZvaWQpDQo+PiAgICAg
ICovDQo+PiAgICAgQlVJTERfQlVHX09OKFBBR0VfU0laRSAhPSBGRkFfUEFHRV9TSVpFKTsNCj4+
IA0KPj4gKyAgICBwcmludGsoWEVOTE9HX0lORk8gIkFSTSBGRi1BIE1lZGlhdG9yIHZlcnNpb24g
JXUuJXVcbiIsDQo+PiArICAgICAgICAgICBGRkFfTVlfVkVSU0lPTl9NQUpPUiwgRkZBX01ZX1ZF
UlNJT05fTUlOT1IpOw0KPj4gKw0KPj4gICAgIC8qDQo+PiAgICAgICogcHNjaV9pbml0X3NtY2Nj
KCkgdXBkYXRlcyB0aGlzIHZhbHVlIHdpdGggd2hhdCdzIHJlcG9ydGVkIGJ5IEVMLTMNCj4+ICAg
ICAgKiBvciBzZWN1cmUgd29ybGQuDQo+PiBAQCAtNTE0LDIyICs1MTQsMjQgQEAgc3RhdGljIGJv
b2wgZmZhX3Byb2JlKHZvaWQpDQo+PiAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+PiAgICAg
ICAgICAgICAgICAiZmZhOiB1bnN1cHBvcnRlZCBTTUNDQyB2ZXJzaW9uICUjeCAobmVlZCBhdCBs
ZWFzdCAlI3gpXG4iLA0KPj4gICAgICAgICAgICAgICAgc21jY2NfdmVyLCBBUk1fU01DQ0NfVkVS
U0lPTl8xXzIpOw0KPj4gLSAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICAgICAgZ290byBl
cnJfbm9fZnc7DQo+PiAgICAgfQ0KPj4gDQo+PiAgICAgaWYgKCAhZmZhX2dldF92ZXJzaW9uKCZ2
ZXJzKSApDQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGdwcmludGsoWEVOTE9HX0VSUiwgIkNhbm5vdCByZXRyaWV2ZSB0aGUgRkZBIHZlcnNpb25cbiIp
Ow0KPj4gKyAgICAgICAgZ290byBlcnJfbm9fZnc7DQo+PiArICAgIH0NCj4+IA0KPj4gICAgIGlm
ICggdmVycyA8IEZGQV9NSU5fU1BNQ19WRVJTSU9OIHx8IHZlcnMgPiBGRkFfTVlfVkVSU0lPTiAp
DQo+PiAgICAgew0KPj4gICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiBJbmNvbXBhdGli
bGUgdmVyc2lvbiAlI3ggZm91bmRcbiIsIHZlcnMpOw0KPj4gLSAgICAgICAgcmV0dXJuIGZhbHNl
Ow0KPj4gKyAgICAgICAgZ290byBlcnJfbm9fZnc7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIG1h
am9yX3ZlcnMgPSAodmVycyA+PiBGRkFfVkVSU0lPTl9NQUpPUl9TSElGVCkgJiBGRkFfVkVSU0lP
Tl9NQUpPUl9NQVNLOw0KPj4gKyAgICBtYWpvcl92ZXJzID0gKHZlcnMgPj4gRkZBX1ZFUlNJT05f
TUFKT1JfU0hJRlQpDQo+PiArICAgICAgICAgICAgICAgICAmIEZGQV9WRVJTSU9OX01BSk9SX01B
U0s7DQo+IA0KPiBTcHVyaW91cyBjaGFuZ2U/DQoNClllcywgSSB3aWxsIGZpeCB0aGF0IGluIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4+ICAgICBtaW5vcl92ZXJzID0gdmVycyAmIEZGQV9WRVJTSU9O
X01JTk9SX01BU0s7DQo+PiAtICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQVJNIEZGLUEgTWVkaWF0
b3IgdmVyc2lvbiAldS4ldVxuIiwNCj4+IC0gICAgICAgICAgIEZGQV9NWV9WRVJTSU9OX01BSk9S
LCBGRkFfTVlfVkVSU0lPTl9NSU5PUik7DQo+IA0KPiBJdCdzIG5vdCBhIGJpZyBkZWFsLCBidXQg
aXNuJ3QgaXQgdXNlZnVsIHRvIGtub3cgd2hpY2ggdmVyc2lvbiB3ZSdyZQ0KPiBhdD8gSWYgaXQn
cyB0b28gbXVjaCB3aXRoIGEgc2VwYXJhdGUgbGluZSwgaG93IGFib3V0IGFkZGluZyAiKG91cg0K
PiB2ZXJzaW9uICV1LnUlKSIgYXQgdGhlIGVuZCBvZiB0aGUgbGluZSBiZWxvdz8NCg0KVGhpcyB3
YXMgbW92ZWQgdXAuDQoNCj4gDQo+PiAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJBUk0gRkYtQSBG
aXJtd2FyZSB2ZXJzaW9uICV1LiV1XG4iLA0KPj4gICAgICAgICAgICBtYWpvcl92ZXJzLCBtaW5v
cl92ZXJzKTsNCj4+IA0KPj4gQEAgLTU0NiwxMiArNTQ4LDE4IEBAIHN0YXRpYyBib29sIGZmYV9w
cm9iZSh2b2lkKQ0KPj4gICAgICAgICAgIWNoZWNrX21hbmRhdG9yeV9mZWF0dXJlKEZGQV9NRU1f
U0hBUkVfMzIpIHx8DQo+PiAgICAgICAgICAhY2hlY2tfbWFuZGF0b3J5X2ZlYXR1cmUoRkZBX01F
TV9SRUNMQUlNKSB8fA0KPj4gICAgICAgICAgIWNoZWNrX21hbmRhdG9yeV9mZWF0dXJlKEZGQV9N
U0dfU0VORF9ESVJFQ1RfUkVRXzMyKSApDQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAr
ICAgIHsNCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJmZmE6IE1hbmRhdG9yeSBmZWF0
dXJlIG5vdCBzdXBwb3J0ZWQgYnkgZndcbiIpOw0KPj4gKyAgICAgICAgZ290byBlcnJfbm9fZnc7
DQo+PiArICAgIH0NCj4+IA0KPj4gLSAgICBpZiAoICFmZmFfcnh0eF9pbml0KCkgKQ0KPj4gLSAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBmZmFfZndfdmVyc2lvbiA9IHZlcnM7DQo+PiAN
Cj4+IC0gICAgZmZhX3ZlcnNpb24gPSB2ZXJzOw0KPj4gKyAgICBpZiAoICFmZmFfcnh0eF9pbml0
KCkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiBFcnJv
ciBkdXJpbmcgUlhUWCBidWZmZXIgaW5pdFxuIik7DQo+IA0KPiBXaXRoIHRoaXMgYWRkZWQsIHdv
dWxkbid0IGl0IG1ha2Ugc2Vuc2UgdG8gcmVtb3ZlIHRoZSBlcnJvciBwcmludCBpbg0KPiBmZmFf
cnh0eF9pbml0KCk/DQoNCkRlZmluaXRlbHksIEkgbWlzc2VkIHRoYXQuDQpXaWxsIGZpeCBpbiB2
My4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCj4gDQo+PiAr
ICAgICAgICBnb3RvIGVycl9ub19mdzsNCj4+ICsgICAgfQ0KPj4gDQo+PiAgICAgaWYgKCAhZmZh
X3BhcnRpbmZvX2luaXQoKSApDQo+PiAgICAgICAgIGdvdG8gZXJyX3J4dHhfZGVzdHJveTsNCj4+
IEBAIC01NjQsNyArNTcyLDkgQEAgc3RhdGljIGJvb2wgZmZhX3Byb2JlKHZvaWQpDQo+PiANCj4+
IGVycl9yeHR4X2Rlc3Ryb3k6DQo+PiAgICAgZmZhX3J4dHhfZGVzdHJveSgpOw0KPj4gLSAgICBm
ZmFfdmVyc2lvbiA9IDA7DQo+PiArZXJyX25vX2Z3Og0KPj4gKyAgICBmZmFfZndfdmVyc2lvbiA9
IDA7DQo+PiArICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiQVJNIEZGLUEgTm8gZmlybXdhcmUg
c3VwcG9ydFxuIik7DQo+PiANCj4+ICAgICByZXR1cm4gZmFsc2U7DQo+PiB9DQo+PiAtLQ0KPj4g
Mi40Ny4wDQoNCg0K

