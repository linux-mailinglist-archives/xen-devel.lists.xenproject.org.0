Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD5EA4DE91
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901095.1309068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRrB-0000pg-16; Tue, 04 Mar 2025 12:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901095.1309068; Tue, 04 Mar 2025 12:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRrA-0000oC-UI; Tue, 04 Mar 2025 12:58:44 +0000
Received: by outflank-mailman (input) for mailman id 901095;
 Tue, 04 Mar 2025 12:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpRr9-0000o4-Ga
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:58:43 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63b891a3-f8f8-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 13:58:38 +0100 (CET)
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by AS8PR08MB8371.eurprd08.prod.outlook.com (2603:10a6:20b:56a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 12:58:34 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::9d) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Tue,
 4 Mar 2025 12:58:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 12:58:33 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Tue, 04 Mar 2025 12:58:33 +0000
Received: from L37fad27877bd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE4E3E08-6A15-4A25-B4A4-5883E4339A67.1; 
 Tue, 04 Mar 2025 12:58:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L37fad27877bd.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 12:58:27 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAWPR08MB9567.eurprd08.prod.outlook.com (2603:10a6:102:2f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 12:58:23 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 12:58:23 +0000
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
X-Inumbo-ID: 63b891a3-f8f8-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t27PSIwFl+RKxQKhV2FdKXQ3CGvbb3Qtm/94DCM1O41MOc1dkCzfWY6Nd77+jPUtOqzd2as3Z1a5ldw+GoQiHkuA7dTwEdgSy2pflBD63vxUNNDc9NfeP5vzpU+QK5XfpuEsJWZcdNrZxafgw57056gAvNdQI42CqEzoalJtTRD8piyGQlbTps96imAHr29mChdTJxHCHQb0HpR/8nVO0MDgPA7qgIcSBZMSSrUs7tjnXvd7W4rune2a2Pnpynzt6xrtau+uE2njlUh0agT5JLASkjLca3m3gkxCCI5P30qin18QkLls+gedlq82EVkcJyMn1v4rkz3gGTPtArdc4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqEvBJDUGUlXx2RJpHp9BIIwlsPGgfGUTBKSkHPuT6s=;
 b=QfXDu2v/X2CWL6w5BHOyMaZBh9ETJWF6HG5gtdPYX+DVsW1uNroCt9QojULPksG5pfAWJGanQ+yqN4od43Bz7mMzsKZSfUF0DzMdRGCWcg3ycZpjAWMJccKp5s2jP2FmBLg/H1wrPK3opro9V6wzyA/u1VbDRG8CcBPeoI2MmS4NqShn8hRwVppgb0V3wYhUDVddEs8qEyJm6ckFF3XjEm5e2Ttpo2tzD8OQIatwlOPRVsB6dBN4Uv/p1VgaBCyJxGIrx+nFu7d3ZOLK68wlvRURgFzEHPnYjRAOHXExvoZXhh7YQUjId6wEt99MhifY9JGh6/AkWEPxMu/3bnwFZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqEvBJDUGUlXx2RJpHp9BIIwlsPGgfGUTBKSkHPuT6s=;
 b=p5SbaOkg2Pl+vA5FBSeKVQsSowpiyrnL6fX5FOZetupnZKs51yFCa+doB8CdlsPnGqT6wvCBNURlgds8JYjWlfxmR60EAPQFk9+DsXmwKiE4F3b2QHKdguHOEoX9HLI6zEB11doDyny0QajmSSB8nZlovWwGVt7n5X0q1n18sWU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0eea179eac52ad79
X-TessianGatewayMetadata: 3MwOVgH3oHqxJTdAa1O1FPiBRq13rO+mHDnzTVOK5xizsCS3IkKiRxE2eO16nng7SHMbAqMoX9kA4GyxJwZ1l8J8i0BUmsh1b+Xlv2tuOAJrm9T3iDpLPIFV7HjAND3OuNwXs0lTMOAlcr1bjMCkm4F7I99SPGkiE2TVEbEJBTY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBJV3rF7EUMPIkRskgHK12fvUuR3AupjaYdfde/p/2Be/l/FDt6pFaCcqdHh9Sr2r9FcpnmcE6w+HuKpYW0Dff/45m7qSycBwexzfk1rAlcX3ihDZeIbLLxBMivkJyJZbjoZjkwMVfxj5439bP1wZdcr7imEuYCMxjoNocBvoSfiT06/8VcDau2TvfRQyABZwfibSRs3uM8MvR0NFTTTiuICcwBgxNe9b8eui7aypaaEcN82I8Ui8aFmsHLhgy65mkJZwHIsLNFqczOffqJ4j8vPulhwIhzVJRt0n8MLkrbfms7Bv0Zglr+o+qFmkl5x3HVRX3HXPaXmcVrR07Q7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqEvBJDUGUlXx2RJpHp9BIIwlsPGgfGUTBKSkHPuT6s=;
 b=AGKj+dlxLzUIxCXWHDzPEiZ8/9oH/WXdckNQaBKtxOAuNEa/K70+BP/dOse4uO4MiFJ/abMDmBgjM/+jkDh4wymJlm2OtxDYebS/9XgMRxgvtZkYQeeFDKuLn7lm+K2UyTau8JJt0DeEsGxZ7++lmEWyWMCMJ08l7TZtDSYHTaAVv+7xbRsXHKYKVJxc9ZFQQY7xGeSlelslN8gqN/gcEUA6V6CxraWifH04xOfQU+wG1tEtYhNWyfs4yYayDQzjnW4A+AnfOtKKK/ZalIwfpNjcK8M0a91S3wFuPad33M29VQ0Jkph1EprHVGMPuXql7ss4jjDPsXex6xFTt6vBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqEvBJDUGUlXx2RJpHp9BIIwlsPGgfGUTBKSkHPuT6s=;
 b=p5SbaOkg2Pl+vA5FBSeKVQsSowpiyrnL6fX5FOZetupnZKs51yFCa+doB8CdlsPnGqT6wvCBNURlgds8JYjWlfxmR60EAPQFk9+DsXmwKiE4F3b2QHKdguHOEoX9HLI6zEB11doDyny0QajmSSB8nZlovWwGVt7n5X0q1n18sWU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 8/9] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Topic: [PATCH 8/9] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Index: AQHbifxzeiZNW349gkqcjA4hxzMiyrNi6ZsAgAAMgAA=
Date: Tue, 4 Mar 2025 12:58:22 +0000
Message-ID: <44C4A35D-D751-4CE6-9E55-DBCAF6E1C613@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-9-luca.fancellu@arm.com>
 <3a2051df-7669-4d0c-a974-699e3026f98a@amd.com>
In-Reply-To: <3a2051df-7669-4d0c-a974-699e3026f98a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAWPR08MB9567:EE_|DB1PEPF00039233:EE_|AS8PR08MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: db287ed8-fdec-4419-a161-08dd5b1c455d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZGcyb3NYaGpqOEk5WG13L3Ewa2NTQVdQYStaNUhPcVVsbEJrNm4ybkxUc0hl?=
 =?utf-8?B?b3hXRFlTbkZ2c1VFZVB5NWRYRlpYdG0zYllLWFJnQmpZQUh2WVV5OHhVYVVp?=
 =?utf-8?B?K3RFaDd2TGJ5V0xldzdKbXk0Ty8vbVpWTVd2MzErbDJEaWszRHFobzFQWi9R?=
 =?utf-8?B?UnhHVTZXTHptbHFOTThENmQ4V0kwOUV4S0VZQjQ0cDBsVTRtQnNXV1plc2Fs?=
 =?utf-8?B?RGJQWmVjZmUwOUp0T3pnRTdQMXFSYmJzUGM5Qy9wVUlEQ2VpQ0x3c1lwalBw?=
 =?utf-8?B?T2dwUjcvRG5SWFNhWEVNWTRFcTdESTNpSjlvdlhDSEJneXVDRUI5RHkwekd1?=
 =?utf-8?B?SXp1Y1Q5NjNQS0pPOEc5UHpmc1YyQU9SMGtRcGNGQW1iRXBCM2g0dzNCYmhJ?=
 =?utf-8?B?SG1rOVBoZFdDN0FIZS9laU1GZy9GdkRDdE1ycWxxR1BkdjNoaW1SMndkZEpw?=
 =?utf-8?B?OEt0L3Z1Y2lnb0tZMWtyTGYxYXJEaDJlTWV6VWF6eEFYTGRkUXFCZ3pFL0ph?=
 =?utf-8?B?ZWwreSs3LzFDaUxxdFVGUm40NGxGNzB3ZnMyMUYzU0ZHR1gwRnNoSjFBdXRF?=
 =?utf-8?B?bnpLd2M3UVc4NU1CYXU5ZnBvMnFKaDI1cFdiN01EcnhQNWpDN0NSQ0VpYjFD?=
 =?utf-8?B?K2tVOFhvNHMwQ3UrRnV3a1lHSmE2b3Z5Rmt1Z1ppZU93WWdDd1RyTDhTdDhl?=
 =?utf-8?B?bysxMUNsd0g3ZlFyd1RUckQ2eklBNHpBM1lMam1vV08xbFpHM21SRTFqRFZD?=
 =?utf-8?B?VnhsempPdkFaaTk0akJIZm5tTXcvT0ptUWdjeEZtcmxSM3FYOCtocXo0MHdk?=
 =?utf-8?B?Z1BWTWZVK3lyQmJwRjhERzlIa1FKOEtJZUtIL05GTXIzNk0zbFdFM1EvdFpI?=
 =?utf-8?B?M09qcHllTEZYWlhWeW9YeFlYd1lYMEFrUXkvaGYraGQzODFRUzdnVklIMnor?=
 =?utf-8?B?cXZraTlJQ28yVSt5V05TVEdPcngwK0hhNVAyRGNpblZHdHBKaDZ1WGlaM3hn?=
 =?utf-8?B?aktpNlduYUNBTTZXNXI3a3BmRHhmRk5Zd2ZvY2NNSnFpMjMzaHJhUkJ0Z1c1?=
 =?utf-8?B?blFTS2YyZlBJalNPMEsrL3JCbnoyWnZjcnl3SFVmUGhjdE1LOVFwUXd4UUZq?=
 =?utf-8?B?NC9MS1VJQXJTcjFDcTdscXZBVGZOV2tZWFlDK3l2ZW1BZUhhclNYRlBwRG5U?=
 =?utf-8?B?TG5EU1EwU0d1TW5RcUFoU2QwMCtLSGN0M3VqT3NVTTd4RE92MHc5dTBzNEND?=
 =?utf-8?B?QzNLVE1IaEt2NEpMUzBmMU5ab2twbGcxaFdFenk2YUpxMDRhSGtOdjE4Q0ZF?=
 =?utf-8?B?RXl4dmNmQ1cxc2tWcVliUjljVmlwVzExOU82WVJFajZMUWVsRmVLTEdsSnZJ?=
 =?utf-8?B?NS94K3prcU4wNVc3dVpmRFdab1lVb0VEWHduUnFjay9aT2lrZWFheVVjZUUr?=
 =?utf-8?B?TGgwOW1qOWRrV3FQaHNWTk5lVjJUK09lNHpCYjBCb3dCYmhMSkQzR0FRaDBF?=
 =?utf-8?B?YkFuVG5rTWR6cjNBT1ZCc3FFZ2ZZQ2ZLc1BxaFBmNGk1bHQvcStpTitRSDFU?=
 =?utf-8?B?ZWVZYnZWTVRPcGhOQnB3c2RTUHBaY213am1wT0xWZEJnVG85bVlkY2d2MUhC?=
 =?utf-8?B?bkVzWXR3eURDWFNtemh0Z2VHWUZ5bURONHFpQ3RqRVFlSUowZkJqKzhrR3Qv?=
 =?utf-8?B?SmVHVUxwR2lrZU0rWlZqQTNuWXNXTm4xUStVWDBzNUdjbEN4dnM1Nm1pbzBX?=
 =?utf-8?B?Vi9ueE4yT1FLaUQ4R21UTUFTZTdzc1M0em1uMkZWL2xsdEJ4bTVaaUpmWWRE?=
 =?utf-8?B?aDJnTlpSd1IwVTIreHhQakgxZG1uaUF5SHh5NnJsT09kcDRObVdzT2krNyts?=
 =?utf-8?B?aFIzeVhod2ZhalIxK0RJNUNiZjdsS3RGVHlmcDNDamk2dHZRWWtWYmYwb085?=
 =?utf-8?Q?IO8HCF+GRMm0CWhHKSHjV+A6QnEJdAPW?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E8E8A4C7F841E4586B7671008EC2C2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9567
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a8e19d6-3b1a-469d-7a3d-08dd5b1c3efe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEd0RkN6emREWkhsQXc2QVQ1QkRSZElpTm5oSEZOTzZSSlZkNk5aM3prWmk4?=
 =?utf-8?B?aHROQnFHa3c1ZXNUWStqU3Vnb0NpZmRyR01NSFNlaGRFcmF2VmJmaWRNNERn?=
 =?utf-8?B?OGxxenpabU5YTXZhZ1R5SWRYZ3JHaGlXdlJ1S2dhK0kybmpOU1RFbzh1dWxw?=
 =?utf-8?B?bnZVWXFsbE5KMUxwTUlJc253cVhkelp4KzZ3cXJIN1ZudElQV2xXUXYzOGZX?=
 =?utf-8?B?WHhXQUJyb21CZVJpRjRrMFZaOVRvM21DMlM5bWNXYVk0VVd4NUlyVHhHaE1C?=
 =?utf-8?B?amgza3BxUEZpK2JrOUo4eWdBTXFRQUlVU2pjK0RZZ3c5VEFsZ2xkaGlWajVy?=
 =?utf-8?B?MDBvMWRCcW0zSG1sWjN5V3kvUDFGOWZZeVVBcWppYkdoendoNVk4N1dMV09G?=
 =?utf-8?B?aTdEd0hDRzN6MEc3R0U0VDRtZXVsenBEbVoxVjhuRjBzUU1ibFI4elphY3Ry?=
 =?utf-8?B?RG9KNlZkVlB6UVRGREtVOE5sMTQwR0dIcVpFTVZ3ZWRkL3JWYmRSTHhUdXJh?=
 =?utf-8?B?dytJVmUzTWZjQTAwaVlaTzNqRUI4L1paazhNZkI2aExNcStjNUZ3bjZ0aE1w?=
 =?utf-8?B?NGFKSTRCeWh1WE5aWkIwcDE3TWhhdG4xS0ZiZEtsZWhCVkZLdnkrUlBtK2k1?=
 =?utf-8?B?SUFTcHhoUUVyL0N5b0VzMGtjZjVjVEI4WlNZTjRVNGQ2aTJmTm5jWXUyMWNG?=
 =?utf-8?B?Y1lxb2NyZEcwMzZOK1UrVWxxajlZWW83T3g0K3FPK1V5eEE4emZua2RkQ3Js?=
 =?utf-8?B?OHJiV1BSWGFkb0FlOTloRnNPQjVERXQvWEpPOVhlbFlzMEdIQWFpK1owemNH?=
 =?utf-8?B?WlpzditqSk9PL2FMOFdxTkdqN1M5VU9DRStMYnRSVUZDNkJ3UmFrY1pDU2VY?=
 =?utf-8?B?M243cEdpMklIejRVMW5wb0JkaHpDSUNicW9tMUhHTkR0UEdCZlcyQmt2Zlpu?=
 =?utf-8?B?cEE0c3pIdkcvVkFmQ253aGZBeFB2TU1uMThFMzJiSmFOa1lEYytJeWlHUDRT?=
 =?utf-8?B?VVpyNHMxUGRlL2FFMkt6NWJNWjkyN1ByZ0hKRFl6dmFsaFY5SFhBV0pzMGtH?=
 =?utf-8?B?cXdibmlPQ0VlTTZQT0orSVluYWNKVU0zejhkWGJqMXBwcTBjTWtUWGtNaDR6?=
 =?utf-8?B?akxKZGxQOHFHZmcySGFNUXpBYzhrejkveHplTmhvblZyZ3VpZ3VyS0hnelVo?=
 =?utf-8?B?eEFuMHNaVnhWc0RJa1lIUmFGWnBHaVdOcTRucmEzWFR3N1BEUy9pWVJZNmhD?=
 =?utf-8?B?T2pWMllBck5ncWdXYUhCZE91RmFUUzBLZXRTUXFzbFdIaUorTUEwYWVtVG05?=
 =?utf-8?B?V2R3WDdkUFhTeitkeERzeXB3MVp5WThtQ0N5MFZSSHBhODNvaFdYbG1VcFZU?=
 =?utf-8?B?MVIxUGdZQTE2RUp4cmVETzkrOXQxaVdTcE9JenNTZ1R2dEx4eThLQjczNjRS?=
 =?utf-8?B?UkhqV2JkZ2NGQit5NEI0aXJhRnRMMnhYR2FxdjltRUpDeXYvRlFqQzVKVVBD?=
 =?utf-8?B?YXdiQnYrS2xsMVpHQ0lKb1V5ZDVIdmJGdHdSRWNWenZuMDNoYUtoUGxKalFN?=
 =?utf-8?B?R0dpQ2F5WFhCcml2YTlKMWZlMkFKeUZPSGVMVlBFV3NDQVhiK2l5NkZjVWlr?=
 =?utf-8?B?ZGtlSDU2blRqeVlGSlNiRlJEL0lIZEpDZkZHWVlSZHdJY0VTNTlNT2p6bXNW?=
 =?utf-8?B?QUZVSHE2cTk4RmQxLzl5UlhoTkF2K2tOczh4WnNPTTFaaldxcDVsU1htV1lO?=
 =?utf-8?B?L0IvdjBwRVBaZCtQek5ISjQrcndKeEdiZFY5SHN3eWdlOHk4aDFTOGRGWjBx?=
 =?utf-8?B?aWYvSExmbjFtRjhrNFQxVDZyUDk2TGFtOWRWVkcxUTZDdlh6VTJNdEJwVncw?=
 =?utf-8?B?blJmUWdrYkhjSllLbUlzd3l0c0hPWXNOM1liNUdiZ0IxYzZoalhLZk9MNC9N?=
 =?utf-8?B?Y0tCYlFoZXRSeEVMZ3B6VHhrRStNU01reHlLR1NOcHBYazIxY3BKZHN5QVhx?=
 =?utf-8?Q?ABf6TFKphVLtwewNfJ/3QpFH6Etfw0=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:58:33.5735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db287ed8-fdec-4419-a161-08dd5b1c455d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8371

SGkgQXlhbiwNCg0KPiBPbiA0IE1hciAyMDI1LCBhdCAxMjoxMywgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDI4LzAy
LzIwMjUgMTY6MTgsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBDQVVUSU9OOiBUaGlzIG1lc3Nh
Z2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZSB1c2UgcHJv
cGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tp
bmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4NCj4+IA0KPj4gDQo+PiBJbXBs
ZW1lbnQgZWFybHlfZmR0X21hcCgpIGZ1bmN0aW9uLCB0aGF0IGlzIHJlc3BvbnNpYmxlIHRvIG1h
cCB0aGUNCj4+IGRldmljZSB0cmVlIGJsb2IgaW4gdGhlIGVhcmx5IHN0YWdlcyBvZiB0aGUgYm9v
dCBwcm9jZXNzLCBzaW5jZSBhdA0KPj4gdGhpcyBzdGFnZSB0aGUgTVBVIEMgZGF0YSBzdHJ1Y3R1
cmUgYXJlIG5vdCB5ZXQgaW5pdGlhbGlzZWQsIGl0IGlzDQo+PiB1c2luZyBsb3cgbGV2ZWwgQVBJ
cyB0byB3cml0ZSBpbnRvIHRoZSBNUFUgcmVnaXN0ZXJzIGF0IGEgZml4ZWQNCj4+IE1QVSByZWdp
b24gbnVtYmVyLg0KPj4gDQo+PiBUaGUgTVBVIG1lbW9yeSBtYW5hZ2VtZW50IGlzIGRlc2lnbmVk
IHRvIHdvcmsgb24gcGFnZXMgb2YgUEFHRV9TSVpFDQo+PiBpbiBvcmRlciB0byByZXVzZSBoZWxw
ZXJzIGFuZCBtYWNyb3MgYWxyZWFkeSBhdmFpbGFibGUgb24gdGhlIFhlbg0KPj4gbWVtb3J5IG1h
bmFnZW1lbnQgc3lzdGVtLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9hcm0vbXB1L01ha2Vm
aWxlIHwgIDEgKw0KPj4gIHhlbi9hcmNoL2FybS9tcHUvc2V0dXAuYyAgfCA3MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGlu
c2VydGlvbnMoKykNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21wdS9zZXR1
cC5jDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlIGIveGVu
L2FyY2gvYXJtL21wdS9NYWtlZmlsZQ0KPj4gaW5kZXggYjE4Y2VjNDgzNjcxLi4wNGRmMGIyZWU3
NjAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlDQo+PiBAQCAtMSArMSwyIEBADQo+PiAgb2JqLXkgKz0g
bW0ubw0KPj4gK29iai15ICs9IHNldHVwLmluaXQubw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9tcHUvc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9tcHUvc2V0dXAuYw0KPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjkwYmFhY2E5ZmQ3DQo+PiAtLS0g
L2Rldi9udWxsDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L3NldHVwLmMNCj4+IEBAIC0wLDAg
KzEsNzIgQEANCj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICov
DQo+PiArLyoNCj4+ICsgKiB4ZW4vYXJjaC9hcm0vbXB1L3NldHVwLmMNCj4+ICsgKg0KPj4gKyAq
IE1QVSBzeXN0ZW0gYm9vdCBjb2RlIGZvciBBcm12OC1SIEFBcmNoNjQuDQo+PiArICoNCj4+ICsg
Ki8NCj4+ICsNCj4+ICsjaW5jbHVkZSA8eGVuL2Jvb3RmZHQuaD4NCj4+ICsjaW5jbHVkZSA8eGVu
L2luaXQuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4NCj4+ICsjaW5jbHVk
ZSA8eGVuL21tLmg+DQo+PiArDQo+PiArLyogTmVlZHMgdG8gYmUga2VwdCBpbiBzeW5jIHdpdGgg
dGhlIHJlZ2lvbnMgcHJvZ3JhbW1lZCBpbiBhcm02NC9tcHUvaGVhZC5TICovDQo+PiArI2RlZmlu
ZSBFQVJMWV9GRFRfTUFQX1JFR0lPTl9OVU1CRVIgNg0KPj4gKw0KPj4gK3ZvaWQgKiBfX2luaXQg
ZWFybHlfZmR0X21hcChwYWRkcl90IGZkdF9wYWRkcikNCj4+ICt7DQo+PiArICAgIC8qIE1hcCBh
dCBsZWFzdCBhIHBhZ2UgY29udGFpbmluZyB0aGUgRFRCIGFkZHJlc3MsIGV4Y2x1c2l2ZSByYW5n
ZSAqLw0KPj4gKyAgICBwYWRkcl90IGJhc2VfcGFkZHIgPSByb3VuZF9wZ2Rvd24oZmR0X3BhZGRy
KTsNCj4+ICsgICAgcGFkZHJfdCBlbmRfcGFkZHIgPSByb3VuZF9wZ3VwKGZkdF9wYWRkciArIHNp
emVvZihzdHJ1Y3QgZmR0X2hlYWRlcikpOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgZmxhZ3MgPSBQ
QUdFX0hZUEVSVklTT1JfUk87DQo+PiArICAgIHZvaWQgKmZkdF92aXJ0ID0gKHZvaWQgKilmZHRf
cGFkZHI7IC8qIHZpcnQgPT0gcGFkZHIgZm9yIE1QVSAqLw0KPj4gKyAgICBwcl90IGZkdF9yZWdp
b247DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIENoZWNrIHdoZXRoZXIgdGhlIHBoeXNp
Y2FsIEZEVCBhZGRyZXNzIGlzIHNldCBhbmQgbWVldHMgdGhlIG1pbmltdW0NCj4+ICsgICAgICog
YWxpZ25tZW50IHJlcXVpcmVtZW50LiBTaW5jZSB3ZSBhcmUgcmVseWluZyBvbiBNSU5fRkRUX0FM
SUdOIHRvIGJlIGF0DQo+PiArICAgICAqIGxlYXN0IDggYnl0ZXMgc28gdGhhdCB3ZSBhbHdheXMg
YWNjZXNzIHRoZSBtYWdpYyBhbmQgc2l6ZSBmaWVsZHMNCj4+ICsgICAgICogb2YgdGhlIEZEVCBo
ZWFkZXIgYWZ0ZXIgbWFwcGluZyB0aGUgZmlyc3QgY2h1bmssIGRvdWJsZSBjaGVjayBpZg0KPj4g
KyAgICAgKiB0aGF0IGlzIGluZGVlZCB0aGUgY2FzZS4NCj4+ICsgICAgICovDQo+PiArICAgIEJV
SUxEX0JVR19PTihNSU5fRkRUX0FMSUdOIDwgOCk7DQo+PiArICAgIGlmICggIWZkdF9wYWRkciB8
fCBmZHRfcGFkZHIgJSBNSU5fRkRUX0FMSUdOICkNCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0K
Pj4gKw0KPj4gKyAgICAvKiBNYXAgdGhlIGRldmljZSB0cmVlIGJsb2IgaGVhZGVyICAqLw0KPj4g
KyAgICBmZHRfcmVnaW9uID0gcHJfb2ZfeGVuYWRkcihiYXNlX3BhZGRyLCBlbmRfcGFkZHIsIFBB
R0VfQUlfTUFTSyhmbGFncykpOw0KPiBJbnN0ZWFkIG9mIHRoaXMgbmV3IG1hY3JvIChQQUdFX0FJ
X01BU0soZmxhZ3MpKSwgY2FuIEkgcmV1c2UgdGhlIGV4aXN0aW5nIG9uZSAoaWUgTVRfTk9STUFM
KSA/DQo+PiArICAgIGZkdF9yZWdpb24ucHJiYXIucmVnLmFwID0gUEFHRV9BUF9NQVNLKGZsYWdz
KTsNCj4gDQo+IE1heSBiZSBzb21ldGhuZyBsaWtlDQo+IA0KPiBzL1BBR0VfQVBfTUFTSyhmbGFn
cykvQVBfUk9fRUwyDQo+IA0KPiBBbmQgZGVmaW5lIHRoaXMgaW4gdGhlIGNvbW1vbiBtcHUuaA0K
PiANCj4gLyogUmVhZC1vbmx5IGF0IEVMMiwgTm8gQWNjZXNzIGF0IEVMMS9FTDAuICovICNkZWZp
bmUgQVBfUk9fRUwyIDB4Mg0KPiANCj4+ICsgICAgZmR0X3JlZ2lvbi5wcmJhci5yZWcueG4gPSBQ
QUdFX1hOX01BU0soZmxhZ3MpOw0KPiBTaW1pbGFyIGNvbW1lbnQgYXMgYmVmb3JlLg0KDQpObyBJ
IGRvbuKAmXQgYWdyZWUgb24gdGhhdCwgSSBiZWxpZXZlIHdlIHdvdWxkIGJldHRlciB1c2UgdGhl
IHNhbWUg4oCcaW50ZXJmYWNlc+KAnSBhcyB0aGUgTU1VIGNvZGUgaW4gb3JkZXIgdG8NCnJldXNl
IG1vc3Qgb2YgdGhlIGNvZGUgYW5kIGJlIGNvbnNpc3RlbnQgb24gb3VyIG1lbW9yeSBtYW5hZ2Vt
ZW50IHN1YnN5c3RlbXMuDQoNClVubGVzcyBhIHRlY2huaWNhbCBsaW1pdGF0aW9uIHByZXZlbnRz
IHRvIHVzZSB0aGVtLCBJIHdvdWxkIGxpa2UgdG8gY29udGludWUgaW4gdGhpcyB3YXkgYXMNCnRo
ZSBzZXJpZSBleHRlbnNpdmVseSB1c2UgdGhlc2UuDQoNCj4+ICsNCj4+ICsgICAgd3JpdGVfcHJv
dGVjdGlvbl9yZWdpb24oJmZkdF9yZWdpb24sIEVBUkxZX0ZEVF9NQVBfUkVHSU9OX05VTUJFUik7
DQo+PiArICAgIGNvbnRleHRfc3luY19tcHUoKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBmZHRfbWFn
aWMoZmR0X3ZpcnQpICE9IEZEVF9NQUdJQyApDQo+PiArICAgICAgICByZXR1cm4gTlVMTDsNCj4+
ICsNCj4+ICsgICAgZW5kX3BhZGRyID0gcm91bmRfcGd1cChmZHRfcGFkZHIgKyBmZHRfdG90YWxz
aXplKGZkdF92aXJ0KSk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIElmIHRoZSBtYXBw
ZWQgcmFuZ2UgaXMgbm90IGVub3VnaCwgbWFwIHRoZSByZXN0IG9mIHRoZSBEVEIsIHByX2dldF9s
aW1pdA0KPj4gKyAgICAgKiByZXR1cm5zIGFuIGluY2x1c2l2ZSBhZGRyZXNzIG9mIHRoZSByYW5n
ZSwgaGVuY2UgdGhlIGluY3JlbWVudC4NCj4gQ2FuIHlvdSBleHBsYWluIHRoaXMgYSBiaXQgbW9y
ZSA/IFdoeSBkbyB3ZSBuZWVkIHRvIGNyZWF0ZSAyIE1QVSByZWdpb25zIGZvciBtYXBwaW5nIERU
Qi4NCg0KRmlyc3Qgb25lIHdpbGwgbWFwIGEgcGFnZSB0aGF0IGNvbXByaXNlcyB0aGUgRFRCIGhl
YWRlciwgc2Vjb25kIG9uZSB3aWxsIG1hcCB0aGUgcmVzdC4NClRoZSBzaXplIG9mIHRoZSBEVEIg
aXMgbm90IGtub3duIGF0IGZpcnN0LCBoZW5jZSB0aGUgdHdvIG9wZXJhdGlvbiwgYW55d2F5IGhl
cmUgSeKAmW0gbm90IG1hcHBpbmcNCjIgcmVnaW9ucywgSeKAmW0gYWRqdXN0aW5nIHRoZSBzYW1l
IHJlZ2lvbiB3aXRoIHRoZSB1cGRhdGVkIHJhbmdlLg0KDQo+PiArICAgICAqLw0KPj4gKyAgICBp
ZiAoIGVuZF9wYWRkciA+IChwcl9nZXRfbGltaXQoJmZkdF9yZWdpb24pICsgMSkgKQ0KPj4gKyAg
ICB7DQo+PiArICAgICAgICBwcl9zZXRfbGltaXQoJmZkdF9yZWdpb24sIGVuZF9wYWRkcik7DQo+
PiArDQo+PiArICAgICAgICB3cml0ZV9wcm90ZWN0aW9uX3JlZ2lvbigmZmR0X3JlZ2lvbiwgRUFS
TFlfRkRUX01BUF9SRUdJT05fTlVNQkVSKTsNCj4+ICsgICAgICAgIGNvbnRleHRfc3luY19tcHUo
KTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gZmR0X3ZpcnQ7DQo+PiArfQ0KPiAt
IEF5YW4NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICsgKiBtb2Rl
OiBDDQo+PiArICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0
DQo+PiArICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+PiArICogRW5kOg0KPj4gKyAqLw0KPj4g
LS0NCj4+IDIuMzQuMQ0KPj4gDQo+PiANCg0K

