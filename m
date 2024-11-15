Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD39CDE98
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837490.1253418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvin-0004qW-In; Fri, 15 Nov 2024 12:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837490.1253418; Fri, 15 Nov 2024 12:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvin-0004nr-Fa; Fri, 15 Nov 2024 12:46:45 +0000
Received: by outflank-mailman (input) for mailman id 837490;
 Fri, 15 Nov 2024 12:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBvil-0004n9-9B
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:46:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a83392c4-a34f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:46:39 +0100 (CET)
Received: from DU2PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:10:232::33)
 by PA4PR08MB6301.eurprd08.prod.outlook.com (2603:10a6:102:e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 12:46:36 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::38) by DU2PR04CA0088.outlook.office365.com
 (2603:10a6:10:232::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Fri, 15 Nov 2024 12:46:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Fri, 15 Nov 2024 12:46:36 +0000
Received: ("Tessian outbound 23e15691b630:v490");
 Fri, 15 Nov 2024 12:46:35 +0000
Received: from Lc1dca79506a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DCB87CBF-A514-482F-82A0-9D23CFBCA6D1.1; 
 Fri, 15 Nov 2024 12:46:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc1dca79506a4.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 Nov 2024 12:46:28 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAXPR08MB6622.eurprd08.prod.outlook.com (2603:10a6:102:153::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 12:46:21 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 12:46:21 +0000
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
X-Inumbo-ID: a83392c4-a34f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjAyIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImE4MzM5MmM0LWEzNGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc0Nzk5LjIyMDE1LCJzZW5kZXIiOiJsdWNhLmZhbmNlbGx1QGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GRo1CVTH70UIjVtjFEt+BQOSy4fADwouxe/g4b1EsdX7++Xx2Q61LBiXbT7M7HP9Ycxo8B85KWiesATgKniHBtQs1ZJHysuiH1ArOIW5hlhLM1UPfDd4NssYBWbqiPo4/ZTIWta9rKZj0T/qeRYTltvCjOig2sGg8Y6CEbiP73ho46P8p0w3/ZRrhfgMezbv6bNQvy8SjAzDlAYu7i8w2A21AGrnNV/abbIVNa/S1TiiphR5uP2GDwS1LnHehoOFeVZ/QXiyfxFWuNgCI9peO1KWOYf6MSsFLlYmGnYL4CFH00WykFsC2pvcRx3UhrA5U/k4tKzgqc6Jjx8Iz6waWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHcp3ebpDCGLC0aTsVGaETd4FV5ouZV7DsxSl2Vbkw0=;
 b=wEc+ZZE9nGOUCKKU3YcmxexXLkZzXFXvY6WW3FQle6lgfafOwsRTLOiiB1z/8qTEyARjo8aq4VRuJOnhGm1I16G8UjHH0lTWUnX9+7Yuo2vQfMmOYK7K8ki7gPMeGT1xmjT1QvvQ8QflR6X+DJLSDydslL6BEJzmtsnMPZyH/QfB/QFKnTB4w2bzM9Winhs8DBVjWydU+lXCZv6LKeh+2nZtiYFRbiSveczI+T5rcpwMOOhLWaS1rgyIMG55AUfu4FBy/3fYnEJUm2GjTHlM9joQRBaTeSGHAjErN+QHH0lRj8NI0MglvB9U1P0M0uFvJ80rpxltYwufDyO/fjdB8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHcp3ebpDCGLC0aTsVGaETd4FV5ouZV7DsxSl2Vbkw0=;
 b=VuNXUjDmZaCWSrsaLo+fq7qEwzeC6G+1AosX3hzH1rpG+/jRW0BzWKULjW0mJxCbPSXyD3otluWFk3v4j7RtikT43Y2Oc7H6khxvnGhH3pGGaC4+poehPX8B9/t42TM8qokXD4oQZzw/VVxbn8fXyei+UgwRYrq2GPHObLRZFWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28fed0477cc82a30
X-TessianGatewayMetadata: cZyjFHjOdKbI5Mz9/HrI84tvQstJ5iWqMWNZgbbnfNHDSlg8/IQXxrp+FJS0GdaV57MgyMf1kVXvFIotoCQMxt0J5OnL1o0SdR4btVh9+NmsBCY2Fx9U+kY/eD5sVwh5F0WtwsprvH4/jPYKkga2pIIkAytOwr5zvvd+cKcdbNg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0QhG+MsN7nCr8lwVkJ/PyLzCC4yjAJhdLXe8jABHGvG5mnqvLtlSwyZA6WYUSKlZArAkKO42mI5LZLIos5/xnSHVTB2q7k/mygvC04roP9abE6xDTvpzgMLQPS0/Fku3r3fDC4FvyjRaLuvdeiSikpqr8MD2HxC22844yeeZv1dCXwhWIrMxWhMqJHt7Y87H3XCJtR1Db24gjSQAgBfA8I9cS+qx8+EnuojpkOgm9B9NQ+waqM47LrWj+KC4RE+znKz9w9eEQq1cjm079PsyGoPUwlmbvrFxi8De6rTAHN5DPXRoCH8CdUaJRM2AbQmP4Au8w2lRW7Q+izJvNItuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHcp3ebpDCGLC0aTsVGaETd4FV5ouZV7DsxSl2Vbkw0=;
 b=AubpPVr9XiOSbRjkyVCXEthOSJWYmGeQIhNXe0QflXdPAltH29p7398kgYVxpweS+Na7noh57KbXuMNUmlmVCYEO8JCl92DU4W6Md8JFSncdG6kLnvMFmcGpIwRsK75XJx4ZvjODU7i8PDwz36pmm1FMmfdvSc6lL5bEQejf90b8obpx9jeaf6r7d2tE9h+UMsiz5aZcvijUeby8GGPa62n0DcJjRmTXVe8EGvzj+M/VXSrKVgJSkhx+VWbUayhW1cqHIvNwxr9vNWsczug8Hw9Z+A8RaRzcGtSmI2Ct8c+zS+UU1GVw8VbgMRzAZ91Ef6cJMQhatexYHNZddCsR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHcp3ebpDCGLC0aTsVGaETd4FV5ouZV7DsxSl2Vbkw0=;
 b=VuNXUjDmZaCWSrsaLo+fq7qEwzeC6G+1AosX3hzH1rpG+/jRW0BzWKULjW0mJxCbPSXyD3otluWFk3v4j7RtikT43Y2Oc7H6khxvnGhH3pGGaC4+poehPX8B9/t42TM8qokXD4oQZzw/VVxbn8fXyei+UgwRYrq2GPHObLRZFWI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbN0xEMVIvN3HbzEuhbXugN/BCZLK4L/YAgAAaC4A=
Date: Fri, 15 Nov 2024 12:46:21 +0000
Message-ID: <CEB38FF8-ACFD-4AE1-B571-1A9219575EE6@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <3a57e277-5fd2-4400-86b9-29479b3dfda1@suse.com>
In-Reply-To: <3a57e277-5fd2-4400-86b9-29479b3dfda1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAXPR08MB6622:EE_|DU2PEPF00028CFC:EE_|PA4PR08MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: e350c43e-4dd3-47e3-01b4-08dd05738a8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YWxQOHE4eG9iT2hWSld2MjVGUktzWE1hUzdSeEJEc25IRlZnb0ZmdG1LVkhu?=
 =?utf-8?B?OW9OOU5zR3kwVnR0NVp5VjBxWHBuYTlPN2FDMlVEd2tCQkZoOFJEZXR0Z2xG?=
 =?utf-8?B?amZyQ24wUCtXeXFhb3RuWGlibGhBMTVjVnRnd3ZZQkkzWHZ3dk5ZOTl4bFNt?=
 =?utf-8?B?Z2xLVFBqTks3Yy8zWHkvcUlEVUx5cnVzNzZCZ0t6dWFzS0xheFoyTlJTQUpS?=
 =?utf-8?B?aFB3UHBBdnhOK1h4SHBhdkxzYTMwYTRGb0dodDhRNHhqeVRVQU9zQUo0SHVL?=
 =?utf-8?B?dVp4UVkxU0NaS3BZQmh0QUZwdUR1SG00WkFkZXUrV0NRTStMbWgvZzQ0eDdN?=
 =?utf-8?B?Ym1Nb3R2dXpEL0t6Qm9Dd3R2YTZnQVFUWk9XTlZNZk9FYmVpSkdoenl5R2Ju?=
 =?utf-8?B?cjg5VHFDNWxFQldhSFlOakl3Y3lzYUl6cDMxb3V2QmVERG5VNVpkN3ExY0tS?=
 =?utf-8?B?WXE1TGJzOG9PMkhiU1YxL01IQjJLa0NPOTZjOTA2TllIdTg0NWJnWThFb05G?=
 =?utf-8?B?S1M4WnBUS0lHb2FsRlFnUzYzeDYwWVZqUFRHY0NaenIwSG9XVEZsRTFOME9q?=
 =?utf-8?B?ZDNnYUQ1QlR3RlNPend3eUdjRWxLMHBtb0U4eFpWNHNJZXIrSTVUellTM0dO?=
 =?utf-8?B?dGNxQWRrSktmem1WSkVFTmJORGMxWTBtU1RLSERBZ0h6OHlmaXNiVW9zOGlX?=
 =?utf-8?B?dUNpNFdDdmVNUC9vYmcyT3U3MGo3elRxRCtHck1LM0Q3bVErU2hCQjAvWXJa?=
 =?utf-8?B?ZkhxR09QMW5mWkxoNUppQjloWFVoVkg0d1Y2OVFPY1dlZnBMN0VaVkxJdXZR?=
 =?utf-8?B?cDF2dE5HRU5zU05ndlUvQzNHMEVZTVRGQnBneEdoamdaMTE5aGt0M0djcTZQ?=
 =?utf-8?B?U3ZNT0hBb2RSSUNNUXRKY3dFQzVPR2VBWmFSVFB1Q1RWbkFhT3dIQm9Gb2xv?=
 =?utf-8?B?RDk3akUyRXFqNmNiNWt5dG92SFFGMWprMzY4MExMMG5uaWNxNlFTODZuTlhV?=
 =?utf-8?B?dkhOZUtBWVNzVFZXdWVCeVQvR2ZlZVhTdWxoRnlRRmJyVDl5Ni81Y1ZCUlZH?=
 =?utf-8?B?VUFTNzVHaDcrL05PREtPQlArRmg5NDZXTytoOWR0ZzRHSDVIdndmd0U0UDhv?=
 =?utf-8?B?V0Y3UXpVZzU4amdxWWJVMUk3b3BqQmt3cCs3bnBSRERScFdwUVdKVjRBNnBO?=
 =?utf-8?B?V3FRR2dFR0Ywa2pxMjR5U2lRaVY4YkpKMXNMRTFCbFF1WEI3R3Z3TWZCOHpv?=
 =?utf-8?B?Z2hyWDRUTjVtcmNUUUcwaHZnUzFzamduQTk1My9wa055dW52NEJrTGowOE05?=
 =?utf-8?B?N2VET2RoSWhveE9mK25hSXZFeWxyM0dUYnQ0Q1Z6aFB0NFhpamZiSW9DV1BD?=
 =?utf-8?B?QXVSREpzMlZ0bTE1L1dXYThjaE9zNHplSk4vY0tualdqMGJSdEJqMjNtd1BJ?=
 =?utf-8?B?WGdCbXk0aUJTNW9mNUtsV1lweFVUdW9EV3BiMzM3QUZLb1lDYVhucGJTM210?=
 =?utf-8?B?OGVRWXlFQWx1RmE3enNoamtncUlzaFVTT0pReEdqSk9JMElORVhseVVUem1z?=
 =?utf-8?B?UkRSd0JGTHpQdTAxS0FkRVZNU2MwQ2Z3VU5mR20wUk1IZFVSaHJDdFFkZ1di?=
 =?utf-8?B?WStJR3hHYjFvOFRrN0R4SmsrR2xPOXZMQS9vaTZLT0FJa2htU2ZoaU95V0VN?=
 =?utf-8?B?ZnBWcEpyYWd5alhmTU1IK2JtK2tvNEcyTWZRdDJ5azFTcFkrT2NVQ0hYNmdK?=
 =?utf-8?B?dFpIbkpaay9sblU0Q1NweW5vSGhFd2cyM0JSU2k0eXpHUW1qdHRUcFdtNjFG?=
 =?utf-8?Q?taZ/WqpbKTGLXa9EWR7lnz4vJQd2gP1w+3zqQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <47B787F710FA9145BDC3B9CB381B9982@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c6f30a6-6441-4b57-acb7-08dd057381fe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnQrRHN6NG5LQWc3RHZrM09yVzBEcXpDY0ZhRlp4QmtwVVdGeVppWGpOOWti?=
 =?utf-8?B?YlFReEc0QTlQWnYyRCtYS3lDclBSZjhoenFRSi9PR21XaDk3V3dheVp1cXY5?=
 =?utf-8?B?K0k1bVRsOHgwN1BSdnpibVQ5WEoxdFBJNzJTWDdheFBBNUM5NWdEOGF6QmZi?=
 =?utf-8?B?bmFJaGhsWklqMWVsU2YxMTYwR0Fic3RLd2NOSldZNUh3UFVYR29qaGhPKzNC?=
 =?utf-8?B?NmtFNFN3Wm55dVptVys4QUhQZ2JvZUM3SThQYVJ5b3RWN2dUdVcxU3M5aklJ?=
 =?utf-8?B?Um5ZNzVYYWN5UHBwaFdpb2U2R2p6aGRIS1huOXErS2tieWk0VDBCMXE1T2xB?=
 =?utf-8?B?RzRmRVBZcjk4Nlh3ZHI1UStBWllGRHF6ODd0KzRFaG1XcFA2c0duRWRHczNo?=
 =?utf-8?B?dE1rVlVsTStDUjR0MUt5b3Nqc0ZvV2p1V01RMkl0bjlRcC9ZQUljQ1lLSEVt?=
 =?utf-8?B?VmJJZUNXR2lyMFVRSlVUL2Y2VWxnWXJGdHluelZrVGdqUi9nS0pFTGZwelJN?=
 =?utf-8?B?aThqMEtzcFFhNS9sb3B1M293MTVmN2wwcGxZOXZYWHk0bGFlRXhwSWFYM3lj?=
 =?utf-8?B?endxZUtpSThUU1UrYnpxRnp6N0JsaWl4eUhTRmgxTk1zV3NkNkgzVGxoaS85?=
 =?utf-8?B?Q21BSFZPZE51YlhWTUNKSEprem4rUFBjVGJiV0FDOWNRaW1tSWs0ak1FWmJz?=
 =?utf-8?B?VElxRW5rRlNQWWZqWkZ5emlSWjJ2UnJXUXlIVzRWUVpTOUlLMnMwNTNpbGNK?=
 =?utf-8?B?a0xnZGNDUENXRHV1U2pCLzN4SHR3Y1hvUVEwVDFqdGwzWjB3QnpWMVZqeUcw?=
 =?utf-8?B?RXdmTkpTdmRBWW0rYy9zczNzQlFXWURSNG05OGJFamZ5K1hKZUZjeGpQd01n?=
 =?utf-8?B?eEljN2NDQW1oTmYyajRJTGR0WjBBaUZUVkFXT01nQ0hTQnl1aE91N3lCcDYv?=
 =?utf-8?B?UXhxam1wNzNHZ1FCeHk3OTNGSlpGRVpTYjF6TTZTSHVUZmMxK094em42ODJm?=
 =?utf-8?B?QStPS01JWlZGYlZ0TzRUaG9URU1tT1VGZTJTS0w1NFA0SVo1QlZ4VHZwZ2lV?=
 =?utf-8?B?eHhGZENwYWJnOCtCRmUyc1VQSkNKMUg1MWdqVUNkcGJ6RFFjYzY4VFBBbnAx?=
 =?utf-8?B?NWtua2hKM0I3SGNaOTJYS1kyQ3dnVzdKc3pqcWloZ3BaaklmS2hkZjVGMTdV?=
 =?utf-8?B?MnNneFVaRjE3TTlyQTlPbWVNSkNObXU0T0EzaXNIaGJ2REFTSzJXbEJaL0lC?=
 =?utf-8?B?dXdmRHV4K2x6WEVHd2F4Q2N6QUkwOEJRamY1Y1BKY3dVUkRCMEZyN1c3SnJj?=
 =?utf-8?B?WmVRRHd6eFFmejNYNWtMeENIc3FSRzM4UWpaYmxlZ00vWUV5MTUwanVpR2wx?=
 =?utf-8?B?dEhlWDJCMHkraXp3TGM3TTh4Z01LbG5BZXVSYTdncXVHbHgvRG5ZSEdkNE5J?=
 =?utf-8?B?U01HakRDbUpjTm5BcG1IR1dyeVUzQTc2VmlJYjgzRUhoUXlYaUVweU82R2c3?=
 =?utf-8?B?bFZlV2lTWGZLVUdWQ3VVbEw0RWFCYkNERzhncDN3NHRFTG5UNGRTc1NqcWM0?=
 =?utf-8?B?ZU9rSXJPWlczTGZGQ3hKVlZnYm14Sjd0WFlNWlJHaGFPVjdnemQ4Sk9XSC9H?=
 =?utf-8?B?M08wN3pIK2hXbWRXTWVyRGlCRk16eHdrVTlpRjdiMTBMV0ViQ2o3cm1leStQ?=
 =?utf-8?B?ZDFldHZ3RnRibm5JOHpKcklwMU85R1QzM0Mrei9ZdU90MmZBT1NDNFovS0lQ?=
 =?utf-8?B?NDN0T2JMTXNBaG1mKy9IRmhzL1NWbmVwc0piR2VwNXZVNWd5WkJQS1U4SUhS?=
 =?utf-8?B?VEYzaGZIZ3NDazVpbTUyZFlyd21YQ05kTWh5WGFaaWxtanZsTmhuek9JOXIw?=
 =?utf-8?B?TlBQK04ycTVkZzV6WnhqTWRkY0o3QlI3VFlDcGVXWWZ0V3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:46:36.0222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e350c43e-4dd3-47e3-01b4-08dd05738a8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6301

DQoNCj4gT24gMTUgTm92IDIwMjQsIGF0IDExOjEyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUuMTEuMjAyNCAxMTo1MCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL3hlbi9jb21tb24vdm1hcC5jDQo+PiArKysgYi94ZW4vY29tbW9uL3Zt
YXAuYw0KPj4gQEAgLTQyNiwzICs0MjYsMTAgQEAgdm9pZCAqX3h2cmVhbGxvYyh2b2lkICp2YSwg
c2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbikNCj4+IA0KPj4gICAgIHJldHVybiBwdHI7
DQo+PiB9DQo+PiArDQo+PiArdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqdmEpDQo+PiArew0K
Pj4gKyAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZykodm9pZCBfX2ZvcmNl
ICopdmE7DQo+PiArDQo+PiArICAgIHZ1bm1hcCgodm9pZCAqKShhZGRyICYgUEFHRV9NQVNLKSk7
DQo+PiArfQ0KPiANCj4gV2h5IGlzIHRoaXMgYmVpbmcgbW92ZWQgaGVyZSwgYW5kIGNvbnZlcnRl
ZCBmcm9tIGlubGluZSB0byBvdXQtb2YtbGluZT8NCj4gV2hhdCB0aGUgZGVzY3JpcHRpb24gc2F5
cyBpcyBpbnN1ZmZpY2llbnQgaW1vLCBhcyBldmVuIGlmIHlvdSBtZWFuIHRvDQo+IG9ubHkgc3Vw
cG9ydCB2bWFwX2NvbnRpZygpIGFuZCBpb3JlbWFwKCkgb24gTVBVIHN5c3RlbXMsIHlvdSdsbCBz
dGlsbA0KPiBuZWVkIGJvdGggdnVubWFwKCkgYW5kIGlvdW5tYXAoKS4NCj4gDQo+IFBsdXMsIGlm
IGl0IHJlYWxseSBuZWVkcyBjb252ZXJ0aW5nLCBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBsaXZl
IGF0IHRoZQ0KPiB2ZXJ5IGVuZCBvZiB0aGUgZmlsZSwgcGFzdCBfeHZtYWxsb2MoKSBhbmQgZnJp
ZW5kcy4gQmV0dGVyIHN1aXRhYmxlIHBsYWNlcw0KPiBtYXkgdGhlbiBiZSBuZXh0IHRvIHZ1bm1h
cCgpIGl0c2VsZiwgb3IgYmV0d2VlbiB2ZnJlZSgpIGFuZCB4dmZyZWUoKS4NCg0KSeKAmWxsIHRy
eSB0byBrZWVwIGl0IGFzIGl0IHdhcyBvcmlnaW5hbGx5LCBJIGdhdmUgYSBicmllZiBsb29rIGlu
dG8gdGhlIFI4MiBicmFuY2ggYW5kIGl0IHNob3VsZCBiZSBmaW5lLg0KSeKAmW0gcGxhbm5pbmcg
dG8gZGVmaW5lIHZtYXBfY29uZmlnKCksIHZ1bm1hcCgpLCBpb3JlbWFwKCksIGlvdW5tYXAoKSBp
biBhIHZtYXAtbXB1LmMgdW5kZXIgYXJjaC9hcm0vbXB1DQoNCj4gDQo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vdm1hcC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oDQo+PiBAQCAt
NSw3ICs1LDcgQEANCj4+ICAqIHB1cnBvc2UgYXJlYSAoVk1BUF9ERUZBVUxUKSBhbmQgYSBsaXZl
cGF0Y2gtc3BlY2lmaWMgYXJlYSAoVk1BUF9YRU4pLiBUaGUNCj4+ICAqIGxhdHRlciBpcyB1c2Vk
IHdoZW4gbG9hZGluZyBsaXZlcGF0Y2hlcyBhbmQgdGhlIGZvcm1lciBmb3IgZXZlcnl0aGluZyBl
bHNlLg0KPj4gICovDQo+PiAtI2lmICFkZWZpbmVkKF9fWEVOX1ZNQVBfSF9fKSAmJiBkZWZpbmVk
KFZNQVBfVklSVF9TVEFSVCkNCj4+ICsjaWYgIWRlZmluZWQoX19YRU5fVk1BUF9IX18pDQo+PiAj
ZGVmaW5lIF9fWEVOX1ZNQVBfSF9fDQo+IA0KPiBXaXRoIHRoaXMgYWRqdXN0bWVudCwgd2hlcmUg
YXJlIHRoZSBmdW5jdGlvbnMgZGVmaW5lZCB0aGF0IHlvdSAidW5oaWRlIg0KPiB0aGUgZGVjbGFy
YXRpb25zIG9mLCBpbiB0aGUgTVBVIGNhc2U/IEFzIHlvdSBzYXkgaW4gdGhlIGRlc2NyaXB0aW9u
LA0KPiB2bWFwLmMgd29uJ3QgYmUgYnVpbHQgaW4gdGhhdCBjYXNlLg0KDQpTdXJlLCBJ4oCZbGwg
d3JhcCB3aGF0IGNhbuKAmXQgYmUgdXNlZCBpbiBNUFUgY2FzZSB3aXRoIEhBU19WTUFQLCBJIHdv
dWxkIGxpa2UgdG8ga2VlcCBvdXQ6DQoNCnZvaWQgKnZtYXBfY29udGlnKG1mbl90IG1mbiwgdW5z
aWduZWQgaW50IG5yKTsNCg0Kdm9pZCB2dW5tYXAoY29uc3Qgdm9pZCAqdmEpOw0KDQp2b2lkIF9f
aW9tZW0gKmlvcmVtYXAocGFkZHJfdCBwYSwgc2l6ZV90IGxlbik7DQoNCnN0YXRpYyBpbmxpbmUg
dm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqdmEpDQoNCnN0YXRpYyBpbmxpbmUgdm9pZCB2bV9p
bml0KHZvaWQpDQoNCkluIG9yZGVyIHRvIGRvbuKAmXQgcHV0IHRvbyBtYW55ICNpZmRlZiwgYXJl
IHlvdSBvayBpZiBJIG1vdmUgdGhlIGRlY2xhcmF0aW9ucyBpbiBvcmRlciB0byBoYXZlIHRoZXNl
IGNsb3NlIHRvIGVhY2ggb3RoZXIuIGxpa2UgYmVsb3c6DQoNCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vdm1hcC5oIGIveGVuL2luY2x1ZGUveGVuL3ZtYXAuaA0KaW5kZXggYzFkZDdhYzIy
ZjMwLi45NDBiNzY1NWVkOGYgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oDQor
KysgYi94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oDQpAQCAtMTEsNiArMTEsOCBAQA0KICNpbmNsdWRl
IDx4ZW4vbW0tZnJhbWUuaD4NCiAjaW5jbHVkZSA8eGVuL3BhZ2Utc2l6ZS5oPg0KIA0KKyNpZmRl
ZiBDT05GSUdfSEFTX1ZNQVANCisNCiAvKiBJZGVudGlmaWVycyBmb3IgdGhlIGxpbmVhciByYW5n
ZXMgdHJhY2tlZCBieSB2bWFwICovDQogZW51bSB2bWFwX3JlZ2lvbiB7DQogICAgIC8qDQpAQCAt
NjgsMjUgKzcwLDYgQEAgdm9pZCAqX192bWFwKGNvbnN0IG1mbl90ICptZm4sIHVuc2lnbmVkIGlu
dCBncmFudWxhcml0eSwgdW5zaWduZWQgaW50IG5yLA0KICAqLw0KIHZvaWQgKnZtYXAoY29uc3Qg
bWZuX3QgKm1mbiwgdW5zaWduZWQgaW50IG5yKTsNCiANCi0vKg0KLSAqIE1hcHMgcGh5c2ljYWxs
eSBjb250aWd1b3VzIHBhZ2VzIG9udG8gdGhlIFZNQVBfREVGQVVMVCB2bWFwIHJlZ2lvbg0KLSAq
DQotICogQHBhcmFtIG1mbiBCYXNlIG1mbiBvZiB0aGUgcGh5c2ljYWwgcmVnaW9uDQotICogQHBh
cmFtIG5yICBOdW1iZXIgb2YgbWZucyBpbiB0aGUgcGh5c2ljYWwgcmVnaW9uDQotICogQHJldHVy
biBQb2ludGVyIHRvIHRoZSBtYXBwZWQgYXJlYSBvbiBzdWNjZXNzOyBOVUxMIG90aGVyd2lzZS4N
Ci0gKi8NCi12b2lkICp2bWFwX2NvbnRpZyhtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBucik7DQot
DQotLyoNCi0gKiBVbm1hcHMgYSByYW5nZSBvZiB2aXJ0dWFsbHkgY29udGlndW91cyBtZW1vcnkg
ZnJvbSBvbmUgb2YgdGhlIHZtYXAgcmVnaW9ucw0KLSAqDQotICogVGhlIHN5c3RlbSByZW1lbWJl
cnMgaW50ZXJuYWxseSBob3cgd2lkZSB0aGUgbWFwcGluZyBpcyBhbmQgdW5tYXBzIGl0IGFsbC4N
Ci0gKiBJdCBhbHNvIGNhbiBkZXRlcm1pbmUgdGhlIHZtYXAgcmVnaW9uIHR5cGUgZnJvbSB0aGUg
YHZhYC4NCi0gKg0KLSAqIEBwYXJhbSB2YSBWaXJ0dWFsIGJhc2UgYWRkcmVzcyBvZiB0aGUgcmFu
Z2UgdG8gdW5tYXANCi0gKi8NCi12b2lkIHZ1bm1hcChjb25zdCB2b2lkICp2YSk7DQotDQogLyoN
CiAgKiBBbGxvY2F0ZSBgc2l6ZWAgb2N0ZXRzIG9mIHBvc3NpYmx5IG5vbi1jb250aWd1b3VzIHBo
eXNpY2FsIG1lbW9yeSBhbmQgbWFwDQogICogdGhlbSBjb250aWd1b3VzbHkgaW4gdGhlIFZNQVBf
REVGQVVMVCB2bWFwIHJlZ2lvbg0KQEAgLTExMiw2ICs5NSwzMyBAQCB2b2lkICp2emFsbG9jKHNp
emVfdCBzaXplKTsNCiAgKi8NCiB2b2lkIHZmcmVlKHZvaWQgKnZhKTsNCiANCisvKiBSZXR1cm4g
dGhlIG51bWJlciBvZiBwYWdlcyBpbiB0aGUgbWFwcGluZyBzdGFydGluZyBhdCBhZGRyZXNzICd2
YScgKi8NCit1bnNpZ25lZCBpbnQgdm1hcF9zaXplKGNvbnN0IHZvaWQgKnZhKTsNCisNCisvKiBQ
b2ludGVyIHRvIDEgb2N0ZXQgcGFzdCB0aGUgZW5kIG9mIHRoZSBWTUFQX0RFRkFVTFQgdmlydHVh
bCBhcmVhICovDQordm9pZCAqYXJjaF92bWFwX3ZpcnRfZW5kKHZvaWQpOw0KKw0KKyNlbHNlIC8q
ICFDT05GSUdfSEFTX1ZNQVAgKi8NCisNCisvKg0KKyAqIE1hcHMgcGh5c2ljYWxseSBjb250aWd1
b3VzIHBhZ2VzIG9udG8gdGhlIFZNQVBfREVGQVVMVCB2bWFwIHJlZ2lvbg0KKyAqDQorICogQHBh
cmFtIG1mbiBCYXNlIG1mbiBvZiB0aGUgcGh5c2ljYWwgcmVnaW9uDQorICogQHBhcmFtIG5yICBO
dW1iZXIgb2YgbWZucyBpbiB0aGUgcGh5c2ljYWwgcmVnaW9uDQorICogQHJldHVybiBQb2ludGVy
IHRvIHRoZSBtYXBwZWQgYXJlYSBvbiBzdWNjZXNzOyBOVUxMIG90aGVyd2lzZS4NCisgKi8NCit2
b2lkICp2bWFwX2NvbnRpZyhtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBucik7DQorDQorLyoNCisg
KiBVbm1hcHMgYSByYW5nZSBvZiB2aXJ0dWFsbHkgY29udGlndW91cyBtZW1vcnkgZnJvbSBvbmUg
b2YgdGhlIHZtYXAgcmVnaW9ucw0KKyAqDQorICogVGhlIHN5c3RlbSByZW1lbWJlcnMgaW50ZXJu
YWxseSBob3cgd2lkZSB0aGUgbWFwcGluZyBpcyBhbmQgdW5tYXBzIGl0IGFsbC4NCisgKiBJdCBh
bHNvIGNhbiBkZXRlcm1pbmUgdGhlIHZtYXAgcmVnaW9uIHR5cGUgZnJvbSB0aGUgYHZhYC4NCisg
Kg0KKyAqIEBwYXJhbSB2YSBWaXJ0dWFsIGJhc2UgYWRkcmVzcyBvZiB0aGUgcmFuZ2UgdG8gdW5t
YXANCisgKi8NCit2b2lkIHZ1bm1hcChjb25zdCB2b2lkICp2YSk7DQorDQogLyoNCiAgKiBBbmFs
b2dvdXMgdG8gdm1hcF9jb250aWcoKSwgYnV0IGZvciBJTyBtZW1vcnkNCiAgKg0KQEAgLTEyNCw5
ICsxMzQsNiBAQCB2b2lkIHZmcmVlKHZvaWQgKnZhKTsNCiAgKi8NCiB2b2lkIF9faW9tZW0gKmlv
cmVtYXAocGFkZHJfdCBwYSwgc2l6ZV90IGxlbik7DQogDQotLyogUmV0dXJuIHRoZSBudW1iZXIg
b2YgcGFnZXMgaW4gdGhlIG1hcHBpbmcgc3RhcnRpbmcgYXQgYWRkcmVzcyAndmEnICovDQotdW5z
aWduZWQgaW50IHZtYXBfc2l6ZShjb25zdCB2b2lkICp2YSk7DQotDQogLyogQW5hbG9nb3VzIHRv
IHZ1bm1hcCgpLCBidXQgZm9yIElPIG1lbW9yeSBtYXBwZWQgdmlhIGlvcmVtYXAoKSAqLw0KIHN0
YXRpYyBpbmxpbmUgdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqdmEpDQogew0KQEAgLTEzNSw5
ICsxNDIsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW91bm1hcCh2b2lkIF9faW9tZW0gKnZhKQ0K
ICAgICB2dW5tYXAoKHZvaWQgKikoYWRkciAmIFBBR0VfTUFTSykpOw0KIH0NCiANCi0vKiBQb2lu
dGVyIHRvIDEgb2N0ZXQgcGFzdCB0aGUgZW5kIG9mIHRoZSBWTUFQX0RFRkFVTFQgdmlydHVhbCBh
cmVhICovDQotdm9pZCAqYXJjaF92bWFwX3ZpcnRfZW5kKHZvaWQpOw0KLQ0KIC8qIEluaXRpYWxp
c2VzIHRoZSBWTUFQX0RFRkFVTFQgdmlydHVhbCByYW5nZSAqLw0KIHN0YXRpYyBpbmxpbmUgdm9p
ZCB2bV9pbml0KHZvaWQpDQogew0KQEAgLTE0Niw0ICsxNTAsNiBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdm1faW5pdCh2b2lkKQ0KICNlbmRpZg0KIH0NCiANCisjZW5kaWYgLyogQ09ORklHX0hBU19W
TUFQICovDQorDQogI2VuZGlmIC8qIF9fWEVOX1ZNQVBfSF9fICovDQoNCg0KPiANCj4gQWxzbyBi
b3RoIGhlcmUgYW5kIC4uLg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi94dm1hbGxvYy5o
DQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2MuaA0KPj4gQEAgLTQwLDIwICs0MCw0
NiBAQA0KPj4gICAgICgodHlwZW9mKHB0cikpX3h2cmVhbGxvYyhwdHIsIG9mZnNldG9mKHR5cGVv
ZigqKHB0cikpLCBmaWVsZFtucl0pLCBcDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fYWxpZ25vZl9fKHR5cGVvZigqKHB0cikpKSkpDQo+PiANCj4+ICsjaWYgZGVmaW5lZChDT05G
SUdfSEFTX1ZNQVApDQo+IA0KPiAuLi4gaGVyZTogUGxlYXNlIHVzZSB0aGUgc2hvcnRlciAjaWZk
ZWYgd2hlbiBwb3NzaWJsZS4NCg0Kc3VyZSBJIHdpbGwNCg0KPiANCj4gSmFuDQoNCg==

