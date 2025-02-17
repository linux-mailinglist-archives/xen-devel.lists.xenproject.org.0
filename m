Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D0A38285
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890323.1299317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzlt-00075U-3D; Mon, 17 Feb 2025 11:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890323.1299317; Mon, 17 Feb 2025 11:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzlt-000740-0K; Mon, 17 Feb 2025 11:58:45 +0000
Received: by outflank-mailman (input) for mailman id 890323;
 Mon, 17 Feb 2025 11:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tjzlq-0006tb-KV
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:58:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2607::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86bd36e5-ed26-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 12:58:40 +0100 (CET)
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 11:58:36 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::6a) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 11:58:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 11:58:34 +0000
Received: ("Tessian outbound 31e949b9df6b:v567");
 Mon, 17 Feb 2025 11:58:34 +0000
Received: from L1e8d3c30a300.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B5AD520-EFA7-4E01-851C-227F71A405D9.1; 
 Mon, 17 Feb 2025 11:58:28 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1e8d3c30a300.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Feb 2025 11:58:28 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB7766.eurprd08.prod.outlook.com (2603:10a6:20b:526::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 11:58:26 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:58:25 +0000
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
X-Inumbo-ID: 86bd36e5-ed26-11ef-9896-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JHoWCG9hSUVTOFsAOKLeuaCKdiBerDOj2auHJerxBdO++IDdrb1LL/zo+GYEv6fAr3kiluySaRtKWipo2hBUXM7SV8rQrejrgfqdR4TnUE9Wrep2UR46aYWvpJ1DtwGGBqEJcP/W0pSsONQd/TmN0jSY6hTYYbuavBFbmxl4cbJfIsitjTgHe7RdA6ObS0nn7a8xH2xKz1ffAAFFlso+ctKUOlcArookEKUyZgnHtWIqN0TPTFJ2PgcEb1aB+2L3G0fRekozC5mw8iqbVvC1AgGVUx1Z4u2R95Xswpo9hQw+Z2LWa/d/DH3VylK8pB0G77xWWlJMgUM7k9pU+UjBEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VLkayqryXspWB2DY5RRr2K7ksuZSoD93Qfpl1P4Hl8=;
 b=THJad4eVgSyCY5I1oNE8d8O0c/9qpnk6oBftUEgQyG7YfUkq3+iZmVay0xvY9bYibyhnw0HeJ2jpihkQ/k0mzFBGgp1N5wovKTVMdf+e4L5BDnsCHdVWB6OWrD3hDziKzAnUvUf4k6LN6QDJcT3IPP/l9cbm3AQ8mehKtJrgNk91grEQ+1DSwlzxS6cd/vrd7VoJQpAtLbwL0fKx2+9n5cBOvFGwMepGXb8lc9hskEaGmfUupihL20Kv7jZA3Zlie4WT8KQ/QaGiwRi/R8Sij3RtOvsA0GVZSHsPXNvTzoHoaP1Ny29+DZY5csbsHZ3y4NmmBBP58gEmu5FMhtRqaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VLkayqryXspWB2DY5RRr2K7ksuZSoD93Qfpl1P4Hl8=;
 b=jCHq9nEJmfj4/5QeIWz8u+urlk/dEq1O4DUXtMd5HTU/d90KTHp+z68rMJQ5CvNPu/aimPu3xFftGAQc1iPBtrShBdlqe9+P8ibu8YHtgGz0PIanOL+3KZusvGpRxW1bpmlSz90IilGi4Da2HmYtUFUWiGfbXDjnKW0UhWEJDtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f58e889432dfd54d
X-TessianGatewayMetadata: gkGq7Clj6865eie+VcXA9vE1Rigvsf9/D6llpcGhYuW5SZw0JkV223HKNmtMhWRIpRj01MUfJ4RbI4ZrOqNDf0elz+Ou8ab0sDp/OpCqOticNR4dxAZyflnOp4qR2ZQBG75cQMEbG9cx8J84wFNJpYolziVno2hKXPYPNuOi2jI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjsSRLx5XMz+DKHC0deaQjr2F2eCUWaqNHX095kH3I0I7pGioIG40Clr3sOz2YhnV1yXLFYFGbF3X3DiVBbURiEYg228LUeWf08YIeLfnmUsHrKfefTE0phlCdXF9uHnGQ8KIirpHm6pEdxjf7fO7w5Jpo4hxFWmipP/fR4qsdNR7Yun8JsKfrtWnGb5r9tuxFolu4awPJCndb2lgKSN4cQisJ3k4exqaKEr6DRaksl9jCfnl8dfjS53SI+lbG+UGTfMyH0IWPiTN5S7+BU+tDI3HdHZZqdKB8AAdWhTx3V/s3TDfrfEAsZEzIbuz+m4BXHMNyAzUzKwTlzCBq5yrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VLkayqryXspWB2DY5RRr2K7ksuZSoD93Qfpl1P4Hl8=;
 b=mE4B+ugl3Zy4kdB55WLkdVilwjhpr5gl/Xp21AWwvPoxpXlwUUwK1N1i5FDzpIAxO3KV6lMk/HmBaq13MDvFRJBOfN2dzMN/ACnToD2BjpYV0ymOCpZ++WYVzEwGZneWzA2DEIVxZ3NIAi8xD3g8XKnEOiLkHauZYQOyoyAwKvRQQsSOSPNuJ4gsjGeq4kaLV5CQEXDVkUcrv+71s+XpqDvcs7LE14wN3IFbMYg5/RGwv6ba196WDacxInNi5T2lfW7QIJIhnjHKX17Y7sHccSHrn/ze2WO9FTjgOLzweb7i959aQ1P2tqLNVJVnA7SSz8Hwb6M/2c6rejbe0K0+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VLkayqryXspWB2DY5RRr2K7ksuZSoD93Qfpl1P4Hl8=;
 b=jCHq9nEJmfj4/5QeIWz8u+urlk/dEq1O4DUXtMd5HTU/d90KTHp+z68rMJQ5CvNPu/aimPu3xFftGAQc1iPBtrShBdlqe9+P8ibu8YHtgGz0PIanOL+3KZusvGpRxW1bpmlSz90IilGi4Da2HmYtUFUWiGfbXDjnKW0UhWEJDtc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbgSah9ICbo4twrEWuXsaPYY+0drNLUUYAgAAR4YCAAADngA==
Date: Mon, 17 Feb 2025 11:58:25 +0000
Message-ID: <F221C5F6-ACD8-490B-83F1-4B1033D11F94@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-2-luca.fancellu@arm.com>
 <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
 <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
In-Reply-To: <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB7766:EE_|DB5PEPF00014B8D:EE_|DB3PR08MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6cd021-6b5b-4189-d49b-08dd4f4a67fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OXpGT0Q1LzUzbGljZTlubER2VTJTRDRHVkxzdDJxMHFpT0dZMnE3aWZ5dTVD?=
 =?utf-8?B?UGw4a3h6TXlpODlGSXVTSmxQeU5tTUhBNGNYN2I4bDFJUUFNbFBrWlJYMnlF?=
 =?utf-8?B?ZFc3cUNUN2hCd3dwd3c5VG01cUtpTjZlZzllY2VoanJlZFdIQmMvanRtT1dE?=
 =?utf-8?B?bDFseWxTa2EwZGpZazl6ODBuMWpJUllrckV5N1RoK2EzekViRnFUU091V1Yz?=
 =?utf-8?B?U0wyY3ZncXZ5ZjRrMDdSOHhSZ2oxNnIvUnUraVovMWhTUjF6REdlTDZOZ0Fz?=
 =?utf-8?B?VXdJU3VaTFlEV3FZZFIwVVMrK0FKS3lpbUcxU0E0aEhZSjhQdnJtVTVMMHZY?=
 =?utf-8?B?V1BDQnZYS1lRTXI2TExyeVpDZk5LMUp5dmFhQ3dHNVV1WFVrMG5ENGNJbVZu?=
 =?utf-8?B?ajZpUG81QjI1YU9LRmVhZzRrRHZIOUR6bFpMaXJBdmlBWkQ4UGw1MnBhR0J6?=
 =?utf-8?B?RHFvZWl4YTFCZ0hBQVFRUVJGelNLdGpycTFpOFpyRi9ML0tiYkJLc3JkdkJi?=
 =?utf-8?B?ZEVmaFRKOHpqRFo4ayt5Rko2bUtmWmZOWWRqY3RVUWdjWENUVXh6MmllWnhG?=
 =?utf-8?B?amxnZ3dkcVVKTFZPYUVMNDdaNGJYdkhxRGppSXBBaVNVMnBrVko1aHY5ZkhG?=
 =?utf-8?B?TGp0UXkvdkkzL2h3YS9vZVBmbE9kNDhhbTBTWldjWUhjc05QUWxrNmV4ZFFQ?=
 =?utf-8?B?OVRwY1A3SWVNSWZ5M1JlTGtQUnhQV0xjNVI0dGhudUV0WlVtR1NoaTB1bXk1?=
 =?utf-8?B?U3J4ZDZTcm9taXZFQ21reWwxdGVxSStYOTF5NGVsL1lUQUpUcTlzR0dmMDdq?=
 =?utf-8?B?TDVDc0I2WjhVMG0zQmVMek1zdE1rRnFlZTZXRWhvMVE0RjJXeGc2Y2Y5bU1X?=
 =?utf-8?B?cVlxdnJ1aTVhdWN5bXQ0S1VIdG1oMWR0VGMxZExUQTVRUER2aW5Ia0ZhSytG?=
 =?utf-8?B?ejM0WkdDMDFtcndmc1R3eDFkK0MremgxSXQ5Q1M2N2xOODdiOEtCTWxLbzRE?=
 =?utf-8?B?ek40MTVBaEh3eDA3dTVWUlJ3Vm5aV1BXR0J2Tjk3cGcvN00wR0o1VmY5bzAx?=
 =?utf-8?B?VjQyK3dMM3g5Q3JPRWVBaTRBS0IxcThxREM1Mks0M3BHVTFOOXNOamZKMnZZ?=
 =?utf-8?B?VytHREVVb3duTytnZU5teS9PV1ZrelhTUk5MTE1zYTJXMDZJSHdHT0prbHJo?=
 =?utf-8?B?QW1Zajg1NmZJa0tFSWdlekwwZGRMTlZaRVZQUU56M2h6T3hrL2lQd01RdHV0?=
 =?utf-8?B?K1BlNGd5TVRKSWxWYmQxM3pnU3J2WXlLbVZsL2piTGVQMmlMejVYT1RRS0ZF?=
 =?utf-8?B?K09Bck1RRndCUDRJc0MvTlpnaUpld2FhQVFZM3oyNFN4SElwNHlTMjlRRlNa?=
 =?utf-8?B?L2RrMlEwMXFjYTluSFlBUEhCUy9DWEFHYmptSXdqWGg4SW96N29DWDZzYWFm?=
 =?utf-8?B?TGE4Ni9sZEl1L0owQkoyL2Q2WGFsbVp0ZDRXajVKL0lqQlNXZWgwTjZKZDNE?=
 =?utf-8?B?TUhSN0d4MGt3WjI1S3Z0bDFWSkR4bk5wM2lidmc4SS9UZTFqQy9pMFBIUElG?=
 =?utf-8?B?L3ZQd0kwMUt4cXkxeEZqcXV6R0ZwbEtZQ2xxK2Z3bzR6SDRQZUhjQjR0NCt0?=
 =?utf-8?B?bWpQcVByenc5dGJDYjhtb0VuaTI5TjFrNDlHOFU0b1JzcDhvT0JXL090TjVT?=
 =?utf-8?B?RlpRV2JTRytBSFQ4ZHVJV25ROEhDb2hsRGE1MldJeVVFcTJLU3hLdTBGYXdj?=
 =?utf-8?B?M1dIS3ZxY1lSOWpvNCtWeUhTUTQxK1F5OWNYMHZ5cyt1SjlrN0JMeHpEb3J4?=
 =?utf-8?B?YXhVd0Q5U3J1RTZYakpkUWpydmVhOG5ZT2gzemZMczZCOEoyRUJNelM4Vjhy?=
 =?utf-8?B?R3VqTzJDQTJFdXpNS1Nhb2FpT0JqVXl5VU9naHM0aGNnZUs1dTM0UVRYRU1Z?=
 =?utf-8?Q?zrAN6FsXPRuJ60icGr5AqP29edE2AqZs?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05D52A60AF8E864F8FA7BEAB6AF8925E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7766
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f7e8a18-a75a-443b-559e-08dd4f4a62ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTJhZXNwUmY2ckhFTEhBR2Yzbmt4Z2tsQlRWY2M5ZEJRVUZzQm9VZWhPNFVE?=
 =?utf-8?B?eWtDQUI1YTc0eVVBaXV3SWE5eW1KcUFmQk9sYkt2T0hNanA0dCt3S2k5U25r?=
 =?utf-8?B?VDFXVzZLVmhiTW1Ubmd3OWVoeFVkVyt4UmVIMTU5OGJrNFczajF1Rm9zQzUw?=
 =?utf-8?B?eldPUG1SWWxEVlhaVTJmR1VEQ1FzcEFvaTRDSHV1M3RNR0pPd01iOGh1OXBk?=
 =?utf-8?B?cTRsZkd1cTFjbGFhb09nRnl1aERDSmJVK25hOGhwS3RRVGpFNlV4b1FlTElj?=
 =?utf-8?B?ckwxeEFacGhDMHVLUDBOVHFHWXMyWjdEMXhuU2xIanZtSjNKUm02M1RqZzBy?=
 =?utf-8?B?NU4zeFU2U1NhOFdwYWYwWG5VdmdDK2h4M2hlckhoSVRhSGkvTzI3dmNaWHBI?=
 =?utf-8?B?a1dtbmNmRWNKYXZUeVRSaUE5eUZ3aGtHM2U1ak1BZmNyR3JaanpaUnR3ZCts?=
 =?utf-8?B?Z2NzbTFWNHU2dE43cEpqN0l3ZEJaaDM4WEJjQ3JMdGFiS2MrazdBUFZoK1o1?=
 =?utf-8?B?c2xVeUdERE94cGs3cndzT21BRHNvQm1zUkF3TUN4K1FIcnUzci94WWs5Z1Va?=
 =?utf-8?B?S1R2K2d0Y0hFUDU3NzA2eHJvbytEM2YvOUpCbFlzdmJRVFpOekprWnJ6OCsr?=
 =?utf-8?B?NEEvOUJDOGR5UStYa0UwTmd1NktCSEtCT3Q3NER3VENjOUV2VzMycDlMVUJL?=
 =?utf-8?B?V21aZmtwTjNkd3JqUzBIbExFRkduWDAzWnV0b3IxZ3Iyd1hTWG50U3gzZHl6?=
 =?utf-8?B?NTJRZ1NjdElPSnFGbG0yOGllYlA1dXNpb2RQam5vRHNxelhacHZqRVNqdVVS?=
 =?utf-8?B?VmpvOWZaSVFnOUdIRWIrZmFBbzZoMUdVUDVHb0J6Z0VCVUxHSHRPUjlhcGxI?=
 =?utf-8?B?YVdhcWNNdEFYZUdqbDdhdEdnbndGRWQzQUQ0VjNmRUErYmFwaHBtMkdOdnMr?=
 =?utf-8?B?Q2tNdVdyMitJZHYzZGtVbGRuTHdHZTMrYjMrT3A2eUdEc2t0bFIvTHAydkpa?=
 =?utf-8?B?Rlc5WEI2WnZTaXdYQ2FITGRYdjA2cFZRVm1pRTltcDluREJFU0hOY0Eva3RT?=
 =?utf-8?B?UVY4YTJ5SzBuWmtRZDg1S0FzbmFYbndod3VGNkpFRnQwWEpudXA0SGFETGVy?=
 =?utf-8?B?ZCtUQm9hMUZGM2p1c3JOMDkvbER0TFhHaFE1NTZXUVFvYVZ2Qm16TjBQTHAr?=
 =?utf-8?B?QTJJcHJIdjZoaDZGN09sRDVFTE5KY1F3TnVVQkRlLzN4RzJkZUJwK1hsRWF1?=
 =?utf-8?B?eUdBWDVSdU1oeFZscStpeTZSYldiZWk0Y0VDbXhKRXlFV0NScFJ2cE96QVNk?=
 =?utf-8?B?eHF1dTlPQVBMNitndytoSFNPR05UT0p3S1BFVGU1dnZ5dzdGZE16UThLUmlS?=
 =?utf-8?B?RjF2UzdCcG5LSWc4V3BxYWxLYnExSEErYVh3RW43OE5SZlFia2c0UnJTUjlR?=
 =?utf-8?B?RWxsMHJ6bzJWRXg3WnZQVFNJQS8vRk8rUlZxTVVnYzRZS0FjTVlCaEJnY2c3?=
 =?utf-8?B?cmJmSjRFdFRRQzRWbUpFQXJsWmd1ZFJQNTBaQzVvd0xsNnhsTkl2VjJqb3Zk?=
 =?utf-8?B?YUhLN2tTRyt6MTArVDEwVWNNd1AxVCtVbjZxbm11UXB2a0NGcUx5ZCtjNW0v?=
 =?utf-8?B?bDFHQXFsQXEyU25yU2dsaW0vYXdtdFhUMU93TkRFcXlhN3U5YUl3M1dSeC9t?=
 =?utf-8?B?dUpoTDB3ditoNHdodGFSU2FnUDZRN2tYaWxjcExpT1loODhvYjJLVGhmTmxt?=
 =?utf-8?B?R1ZQVkM2a0VYVE9ZdFE4VFp6Tmp1d2VNMEpBOERRaE1TeVZSOENqdjNqaUtU?=
 =?utf-8?B?SjBOWGVINVF6VUR6bFllaUhxTC8vRHlmRUJNMDZUSS9HMUR1TEZxRlo5VjEz?=
 =?utf-8?B?dFdUbXQ3dFpPQmFzZmVvdHVSbUZqTXZTaTJEMHdxVnhlMmQ3WDNWYldQSWM0?=
 =?utf-8?B?M09Yd1NCQ09jeGMyNDg5OU1MLzF5dzlWRWZwbmtJMTJNSzZxaU11aGdLME8x?=
 =?utf-8?Q?P5KVxhYWGhhPU3E7lzNJiuMv0FIdF8=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:58:34.7119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6cd021-6b5b-4189-d49b-08dd4f4a67fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937

DQo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCBvcHRzKQ0KPj4+ICt7DQo+Pj4gKyAgICByZXR1cm4gMDsNCj4+IA0K
Pj4gU2hvdWxkbid0IHRoaXMgZmFpbCB3aGVuIGlzX2lvbW11X2VuYWJsZWQoZCkgaXMgdHJ1ZT8g
KFRoZSB1c2Ugb2YgdGhlDQo+PiBwcmVkaWNhdGUgaGVyZSBhcyB3ZWxsIGFzIGluIHRoZSByZWFs
IGZ1bmN0aW9uIGlzIHNsaWdodGx5IHN0cmFuZ2UsIGJ1dA0KPj4gdGhhdCdzIHRoZSB3YXkgaXQg
aXMuKQ0KPiANCj4gUmlnaHQsIHByb2JhYmx5IHlvdSBrbm93IGJldHRlciB0aGlzIGNvZGUgdGhh
biBtZSwgSSBzdGFydGVkIGZyb20gdGhlIGFzc3VtcHRpb24NCj4gdGhhdCB3aGVuICFIQVNfUEFT
U1RIUk9VR0gsICdpb21tdV9lbmFibGVkJyBpcyBmYWxzZS4NCj4gDQo+IGlzX2lvbW11X2VuYWJs
ZWQoZCkgY2hlY2tzIGlmIHRoZSBkb21haW4gc3RydWN0dXJlIOKAmG9wdGlvbnPigJkgZmllbGQg
aGFzDQo+IFhFTl9ET01DVExfQ0RGX2lvbW11LCB0aGlzIGZsYWcgaXMgc2V0IG9uIGRvbWFpbiBj
cmVhdGlvbiB3aGVuIOKAmGlvbW11X2VuYWJsZWQnDQo+IGlzIHRydWUgb24gYXJtIGFuZCB4ODYu
DQo+IA0KPiBTbyB3aGVuICFIQVNfUEFTU1RIUk9VR0ggY2FuIHdlIGFzc3VtZSBpc19pb21tdV9l
bmFibGVkKGQpIGdpdmUgZmFsc2U/DQo+IE9yIHNoYWxsIHdlIHJldHVybiBmb3IgZXhhbXBsZSB0
aGUgdmFsdWUgb2YgaXNfaW9tbXVfZW5hYmxlZChkKT8NCg0KU29ycnksIGp1c3QgYSBjbGFyaWZp
Y2F0aW9uIGhlcmUsIEkgZG9u4oCZdCBtZWFuIHJldHVybiB0aGUgdmFsdWUgb2YgaXNfaW9tbXVf
ZW5hYmxlZCBzdHJhaWdodCBhd2F5LA0KYnV0IHVzZSB0aGlzIHRvIGNvbXB1dGUgdGhlIHJldHVy
biB2YWx1ZSBvZiB0aGUgc3R1Yi4NCg0KQ2hlZXJzLA0KTHVjYQ==

