Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D49B5E87
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827949.1242721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64pN-0007Wk-UG; Wed, 30 Oct 2024 09:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827949.1242721; Wed, 30 Oct 2024 09:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64pN-0007Ut-Rc; Wed, 30 Oct 2024 09:17:21 +0000
Received: by outflank-mailman (input) for mailman id 827949;
 Wed, 30 Oct 2024 09:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZK+=R2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t64pM-0007Un-3t
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:17:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061d.outbound.protection.outlook.com
 [2a01:111:f403:260d::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c19e1494-969f-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 10:17:16 +0100 (CET)
Received: from DU2PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:3b::24)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 09:17:11 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::a3) by DU2PR04CA0019.outlook.office365.com
 (2603:10a6:10:3b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Wed, 30 Oct 2024 09:17:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 09:17:11 +0000
Received: ("Tessian outbound 373849c2df5a:v490");
 Wed, 30 Oct 2024 09:17:10 +0000
Received: from Lbc7d2da46996.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0762602-75EA-49EE-B317-026554E6F14D.1; 
 Wed, 30 Oct 2024 09:17:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbc7d2da46996.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 09:17:00 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VE1PR08MB5661.eurprd08.prod.outlook.com (2603:10a6:800:1b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 09:16:57 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 09:16:57 +0000
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
X-Inumbo-ID: c19e1494-969f-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwZDo6NjFkIiwiaGVsbyI6IkVVUjAzLURCQS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMxOWUxNDk0LTk2OWYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjc5ODM2Ljc5MzA4OSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wZM8DFpMqyehzUt9/DMFitHu+o2g4jyziu2N7AcfHzIH0+TDU2MS177i1dIZUTgTPGFsxyP5C+D+0jY2tMKMbXiQSEtzENrLw2+1z0sv6bR55ZXiFgA5wCQFnrAHprZvnDGnlnFz/iyd6qGV0+UaNKFIlbj+8aV3LsnzgNyaGweuZ8j1+7NHgFOTripIIbWtPzvtIFmSpHBxbCSjURFrC6hRKQ8Pk+75IZ6UjbdQnoGCwiBTH0Re+ECaDtf4aCaNX9tW1YQ1Hd45mjFbtEbyqoZ7pyLKoDPKf9Tdsuy/DFdSkc7/WN07/m5ZnR9uqhSLsc0QajX9hf8t8/x1mBMmMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7bUOrtY76Iolpt9WJajCbUXNXJEVthI08g2e8pk478=;
 b=ZDXjJV/cM8Msft72s+uZVAfNhtcYW+T/eNxMxTsXmSZXZaG5UlZwyGAd/o0nqZNunnHDY1wJtiLt3hL8pE47yLG6H5wh9/kjEjlDgYY+1hWK6lQDdlhCo/zJ9a2fTgalRDx5dn8jJ/e0dd+lk5Q8WxblCIErVIOEZyKTagYP1L5rVGGhXK3JRttMmXyXln2SjNAVI6mlGKxEvY9M/rb3829GfiN/+4Fnulsil7WPthbUemYQsGcdclGUtv5eKur4L9hRLNwtTKsRL/vhuOuXlqfTBAPZPUnRwEA4a2ZityCKHKb0A13g961+4auIZjQr+zQuB3M+KSN+siIRwGGiTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7bUOrtY76Iolpt9WJajCbUXNXJEVthI08g2e8pk478=;
 b=dAwEbpwgQXVu/rhmMrmxn23XMYeXbSqiB9ATlSYZm91nbpr23C0dPs5fMGrY3iFzfDawM1S/eo0FvBSVL74ip2Hxjq2gjep3x6JDvsawzNhiNC87IH4nbwPjdDucDtzfuga1oqtf0iY0313zL54Wq7ot4KB1dUOlrmB0vMJaRpA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13bdb9c6a7b1a2af
X-TessianGatewayMetadata: /wndmWs4ADyJY7QQ3NZHDPi0W4bp5kW4aDeR5anSp9PmW1kCo/5p7qDdxTyX785NpZzUa1UdHEKwsR12zwRUGRdDB7QojDjzhGuJyCQP0rKS+2XWmJfRL3isISAj6g3sTkR+kZjnqPvzMdFZNeG++Lazqck+seeTkFn8qP6gUY8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3YfWKBS1odu4fwHPmYOvgc1wo7GAd0cL3HCgb7iii8x8L8JaQabuQ++7QzvwEXY4ocOYRSDVOAnhE5swsuvfaBRINsMUie/SN1ba3rxNbXSW12Q2d7aaXivx8Qfps3lWPN1f1Dx9m6S7IysaGa8Qyi1drHZPGefMEUqQFydFevbnLLkslowHBVzxpKsLteA+2fiU3lMrM6vdvGCSctXthPAshZRPZ7AvjJJHNwpGs/iCsjIo67yI64AXV0YLxjcc4ju1QwnC7BNQdpGluMx3K0Gyd1/37jKDhvcgOhp/DpBc9vUXYCmwe8AZS1Xx038bOToOzoyxJcpi5rmARDQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7bUOrtY76Iolpt9WJajCbUXNXJEVthI08g2e8pk478=;
 b=MCzwwLuUyinZkgrhxPiWn3L77Ya9/zMrnyAxxW2BX5yhFVdMVRq4rTEzq9A/GvqnENrxqbeD5ThVUpy/haVm7YTiLZbv9rgzLfnkDgRqkIwLtJ2j0INLF8vqPGP92eTmV0yPUIe8YJe2EqsxaCD1vm5kRFOMjBsm7QJCDRcVLApqvnd703db6XL5pvejEMPICLokuqaC2xWTw8k2z1FqY7t1R3bWBU3r6+VCG6ibZwiwgIV7M7fCRRTf37zHRbQkScRH6vrWEZQcubLe6qTdsvSc7MRhDEQJ2s+YhxUxM3NE6i5aJ15T0CtVNgKtQhZcZ7u4E/hgK9HBk6TA3sIKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7bUOrtY76Iolpt9WJajCbUXNXJEVthI08g2e8pk478=;
 b=dAwEbpwgQXVu/rhmMrmxn23XMYeXbSqiB9ATlSYZm91nbpr23C0dPs5fMGrY3iFzfDawM1S/eo0FvBSVL74ip2Hxjq2gjep3x6JDvsawzNhiNC87IH4nbwPjdDucDtzfuga1oqtf0iY0313zL54Wq7ot4KB1dUOlrmB0vMJaRpA=
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
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKfBnMA
Date: Wed, 30 Oct 2024 09:16:57 +0000
Message-ID: <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
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
	DBAPR08MB5798:EE_|VE1PR08MB5661:EE_|DU2PEPF00028D12:EE_|DB8PR08MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2e5ee5-3815-4ea4-a9d9-08dcf8c3a2c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R2Q0eW5nSzA0ZlF2WTF4OXNTbnc4NEJ2amwydkNVdFZJckhiQjg3cWVMdGRa?=
 =?utf-8?B?QURtRy9TcHp4TGgrTTQ5cXdkM2xCVjdwclRqVmQwVFljTElBb1AyalBLOC9V?=
 =?utf-8?B?L0szdUtwSlFtNURVY05zb1hQRUo4aGpXS0tlZjZCMU9Jckd2YUxPbEpxSFNl?=
 =?utf-8?B?Q2huSTA5ZzVpbW9POFBDQ1ZkV0RPWkpValJBTzljVE84S1JNLzFqSzJYZHMz?=
 =?utf-8?B?ZVp3RXhMWG5hMHpYSjFKbmR0R2NHd0dhbUZGcVU2MEROUDVTNXlvUWJQUFlH?=
 =?utf-8?B?RnRVUjh6a2ZpYUhqQ3RKWEpyQUE2NFR2ZlNraHY0S3R1N2pHSWNobUhzNlB4?=
 =?utf-8?B?emJUdGcrQWRlUXNFQWMwcHBnZ0VwcDhoMndKczZrSkxPUEpDSUFNM0dBMS9Y?=
 =?utf-8?B?TjlZZU9ReUF1NGI4R1pQZjVXbXdyK24wUzlRalgwSkFodDcrSSsyaGpLY0Vm?=
 =?utf-8?B?S3ZTTkNGYncvOFFER082YU9ML0J4UWNTYWhRdEI3L2Nkdm9kd3dMY3JNVVN1?=
 =?utf-8?B?RHhYdTFjdjFZMkIrblhVbnZlOGdUSjdld09sT3BsWUUrSjRrNDM4dUdZSVAy?=
 =?utf-8?B?b1hFOUFwdXdTdjdlVmgrZnlVV3JaRmJhQ3ozZFp5anY3MVVybDRmK3lTb3g0?=
 =?utf-8?B?dTcwOXhWOG93RFBzZDVidmJxTkVnRjlqWUZJYnA1eUVqVms4c0x0RjNoaHU0?=
 =?utf-8?B?enFCRHpOSkZWdlJKNFlnNHI5dWNKSlhjVE9zSlllU3d6dUgvVTlac2F2aDk1?=
 =?utf-8?B?NVJHNCtGbE5NanA1UUNnOHFjN0ttNUIzeC9WZ3ZIOWkrTlZHbnZ3Vk0zbkM2?=
 =?utf-8?B?UEQrMjNjNFFZZ0NZM0lRamM3blNDaGE3ME85akhQRm9BNDRBMDJOcDZtSHVY?=
 =?utf-8?B?OHZpcXhNQWJHQ2xWb0FQd1NZRXhyREh3V08rNEgrQTBwUEJlbmdMRmZ3WUY0?=
 =?utf-8?B?aWcxZGFYM0doNk8wU3RZTjljNU40Y2JhOUtBa2JKcTVFczQyL0YwZFMxaFRR?=
 =?utf-8?B?ZUo5d3Nzbnh0enVjR0pxcTVHUTgyVlFyKzUrSnVRcUlWS0Z6TnZHY3oyclN5?=
 =?utf-8?B?ZjBZVEJXNEtOUmdpTFVVWEVNT3JMcGdUcklYN05wdFhxWXJTbW9lRDVHM29m?=
 =?utf-8?B?OEF6ZDVNSkFHeW03RlBjMVh6T3gzQUJ4UU9remloc1hEQ1pxMUJ1L2RMeU00?=
 =?utf-8?B?NngvREt4ckcxUmtRc1pMdTIvUng5bGFtZXhpTzhzMngzTU5UY0UyVENOdng0?=
 =?utf-8?B?VU5NRW5JNGtWU3RRU1lZWkZWWXJrVHlCVUpoWTdiUWdHWFI0NmhON21IWG5R?=
 =?utf-8?B?YnRHZFU3cTcyU3h3bEdsRlErZ0pZRXh4U1UyRzRsVG8raVZib3IrTzBiNDNJ?=
 =?utf-8?B?ZGZmd3crN3lvRGc0a0w4MnQ2T3A4V1dXZ2NVQTY1b2k3U3ZqMmIyR2dSTWRB?=
 =?utf-8?B?ZGhpQ3JWN25HZW9Ma0lPWERBRGlINVBMQ3JObTJqS0RiV0lkeERCQjlWUEhn?=
 =?utf-8?B?K2lkcnhVVzBNRXhSUFdlTHY3cFBBanZVR1h1Tmo5b3kzcENFdnVESHlDeVRM?=
 =?utf-8?B?T0E5NnJHb0I4OGRmRFhnQzFEaFg1bHc2ODBHS1dpck9kclV2SHZnSWpvNXJW?=
 =?utf-8?B?SWhhWHYzejVsOStxdWhDbFp6azF3bFFTL0VDNjBzN1BuWjlJYzV1UUMreFFY?=
 =?utf-8?B?a09GaWo2ZGc4MDJVbGhTZE9ETEZhVVBxdDZpaExYL0QzNTNWSEQ4aExpWFlM?=
 =?utf-8?B?L2prYzVBbmVUMHNJdlk1aXlkNzRRQkx3UVJDTUhXUnlqS3Q4c2FCaXdqQlBU?=
 =?utf-8?B?Y3BhWHpSTXNTaUNaWGV5TWpLb2hFTWVWd2tFWHgzSjBZNDZhNzlDZGxzRlUv?=
 =?utf-8?Q?sgSOwEDysdYf8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CECABBA2A3AE13438C6A75B5714D960F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5661
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3832a6c-2e63-4ac9-528d-08dcf8c39a55
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnVib3MzNlNmKy9JTVVkMEliNmJnZVV1VitWMFBQQm5HZityZFZrbG9zdG1K?=
 =?utf-8?B?MTA1SFBrL2I1QnFValZBZFFnY1FoVGJKUVJVSXhDTjQ4K0Z2SlJ2bk4wbjlT?=
 =?utf-8?B?b3V3VlNJVEY1RjdjWVcybEFtU3J1MGtuYkVPU0NWN3lFdjczei9MWk84ZzZk?=
 =?utf-8?B?RzFVN1RBeUJFK0hjUWI2MVloSDlEbTdYRi93VjVKNFVLSVU4UURHS3BkM204?=
 =?utf-8?B?VERVaUsxN2M2eW1iV1o2R1N5Q1VudXRVZHl3L29sVmw2Y3B6M0Q2ZkdpVFpH?=
 =?utf-8?B?dVZRNGV6aFVNQXFqT21ZTjF5L3lKSzlOOWZ1cXZVQ0ZyQXhodjlNSU04SGpv?=
 =?utf-8?B?QW01NTEvcGllUWhnekFrUmV2b1Fma1BFZ2Z4a3lnZmpIUWpsN0lqZFRMMU5S?=
 =?utf-8?B?TDZVNXpBUXIvMEVyWkVPaWlTZ1ViaWpwWVhMQkFkK1Z1RlEzUktObzdFRlNH?=
 =?utf-8?B?MWlHNXo2ZGlzZ3B5Rm9EeVdLN2h5c0M5RTBUY25ORnpGNlVQLzVMN0REZm5H?=
 =?utf-8?B?MTVQK0FBU2diTW1vUEtPTmRjWk1vQnZ3LzZ4TnJKMDlWVmM2N2M1RmVLZDlh?=
 =?utf-8?B?OEhTZlZ0Y1pYWmNWUUJpTWRibVhjcmtUNGxZczZiR1lHVzdiMDZ5cTVXWU9M?=
 =?utf-8?B?cytDNjlvY0hBRXhER0tXcnVrWVVNTEtBYWszWXhXWSsrWitMR1c1eVJsVXlQ?=
 =?utf-8?B?WldBWEVYUDlTSjdUeWZzYUwwcDRNQmtwdGpycjdQK0sranovZS9Za3B2bGZI?=
 =?utf-8?B?U0VDZmkzb2FoRXNncE5nZDIzQ0l5SWhBaU1YdjExMFVNdnJRUTBJWGZsWG9B?=
 =?utf-8?B?N1pJK09tWGxmUFd4cWdRM3cxUUJudk1nTGxraFZWUk40SVZYd2x6V3UyRnps?=
 =?utf-8?B?U2FYM3Z3QzR0SzM1ejN3TFdsRTdOUkpaeFhjZ3lDL3I1SWtNdzgxK3ErY1hP?=
 =?utf-8?B?a1hDNURLMklRS2oyMEpMNkNqcWpFNk5DU2ZyeUVkTVRhdU1iQzRIcFZkbXhC?=
 =?utf-8?B?SytGbnRBQmZPOXRCZmFrdkJycWx6c0VjRXBTSWVTdVFnWExYempVMGZ5Y2pG?=
 =?utf-8?B?UjlwdWVINFZsMzR3TW5pdTJybndYL0F5WWhzakZRU2FQVys4QWdPNDVRenU2?=
 =?utf-8?B?NmNHRlloSHhxenFZa0pGck80dVdKTVAxbkpaQi9kL1RpbHEzMWRrTXFoRVBo?=
 =?utf-8?B?WXdXVk9nQXpseEkyZ1BIaEloVEJwd3g5TXIwb0I3TnFuYnUzUC80Nzd5TFo4?=
 =?utf-8?B?MUh0eXBUVnZCZXAzWnpQM2Z2dnBkckVFdWFzbVNPSWpnYkRmNDhPS1pSZEpw?=
 =?utf-8?B?dHFWL1FGdVBkcFk2eWE4UExUeWVydngzUm1SYmQ5SDdQbTlvd3JqTXJCRlZM?=
 =?utf-8?B?Q2FkOE94MkVSaHRJbktoOU1OQ0c4cGNjOXFwWUdkVmNwdEtTb2NTL0tMcXdr?=
 =?utf-8?B?bWV4WWRQUFp2aVR5UTRKQis1Y2pXMmRqQ2d3bHN0N3JNSEowZUp6N3Q1KzBu?=
 =?utf-8?B?ZmNhTzJOdjBhUDhmTzJzc05MZ0R2WkZNcTFjSUpNUi9pRFdRK09WTU0yMkVu?=
 =?utf-8?B?dXFpVXRHQWJKcVhjOXlqT1oxbzBod2MxUEQwRTliTEU0VzYreVpUSTRQM1NL?=
 =?utf-8?B?TldTMU9qTXFILy9yMWtJU1M4YU40cHdvY3dteU9sRFdSeEZjcHlMMDZOQmRG?=
 =?utf-8?B?czRqY2tIaGpCUkJESXQwOTV4d2l2alJkcitjazZ4STFySzF4NFJiZ3NtbXV0?=
 =?utf-8?B?UWtJOWUybUxqRUdXaXdvTjBPT3ExZGp4aDhtUnhIZ3JEUUZudHoveTh6cDZj?=
 =?utf-8?B?SlFMOVd2b1IraXVhT2pkMVhmRHU4T0lnaW5zcjhnek4zYXZDUTUrN0NDMGkz?=
 =?utf-8?B?b2Mxc2VXSWFBZkRwajFQdlpzenBWUWZFakFodFRhTnowQXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:17:11.1172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2e5ee5-3815-4ea4-a9d9-08dcf8c3a2c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371

SGkgQXlhbiwNCg0KV2hpbGUgSSByZWJhc2VkIHRoZSBicmFuY2ggb24gdG9wIG9mIHlvdXIgcGF0
Y2hlcywgSSBzYXcgeW914oCZdmUgY2hhbmdlZCB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMNCm1hcHBl
ZCBhdCBib290IHRpbWUsIGNhbiBJIGFzayB3aHk/IA0KDQpDb21wYXJlZCB0byBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjMwNjI2MDMzNDQz
LjI5NDMyNzAtMjUtUGVubnkuWmhlbmdAYXJtLmNvbS86DQoNCj4gK0ZVTkMoZW5hYmxlX2Jvb3Rf
Y3B1X21tKQ0KPiArDQo+ICsgICAgLyogR2V0IHRoZSBudW1iZXIgb2YgcmVnaW9ucyBzcGVjaWZp
ZWQgaW4gTVBVSVJfRUwyICovDQo+ICsgICAgbXJzICAgeDUsIE1QVUlSX0VMMg0KPiArDQo+ICsg
ICAgLyogeDA6IHJlZ2lvbiBzZWwgKi8NCj4gKyAgICBtb3YgICB4MCwgeHpyDQo+ICsgICAgLyog
WGVuIHRleHQgc2VjdGlvbi4gKi8NCj4gKyAgICBsZHIgICB4MSwgPV9zdGV4dA0KPiArICAgIGxk
ciAgIHgyLCA9X2V0ZXh0DQo+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHgwLCB4MSwgeDIsIHgz
LCB4NCwgeDUsIGF0dHJfcHJiYXI9UkVHSU9OX1RFWFRfUFJCQVINCj4gKw0KPiArICAgIC8qIFhl
biByZWFkLW9ubHkgZGF0YSBzZWN0aW9uLiAqLw0KPiArICAgIGxkciAgIHgxLCA9X3Nyb2RhdGEN
Cj4gKyAgICBsZHIgICB4MiwgPV9lcm9kYXRhDQo+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHgw
LCB4MSwgeDIsIHgzLCB4NCwgeDUsIGF0dHJfcHJiYXI9UkVHSU9OX1JPX1BSQkFSDQo+ICsNCj4g
KyAgICAvKiBYZW4gcmVhZC1vbmx5IGFmdGVyIGluaXQgYW5kIGRhdGEgc2VjdGlvbi4gKFJXIGRh
dGEpICovDQo+ICsgICAgbGRyICAgeDEsID1fX3JvX2FmdGVyX2luaXRfc3RhcnQNCj4gKyAgICBs
ZHIgICB4MiwgPV9faW5pdF9iZWdpbg0KPiArICAgIHByZXBhcmVfeGVuX3JlZ2lvbiB4MCwgeDEs
IHgyLCB4MywgeDQsIHg1DQoNCiAgICAgICAgIF7igJQgdGhpcywgZm9yIGV4YW1wbGUsIHdpbGwg
YmxvY2sgWGVuIHRvIGNhbGwgaW5pdF9kb25lKHZvaWQpIGxhdGVyLCBJIHVuZGVyc3RhbmQgdGhp
cyBpcyBlYXJseWJvb3QsDQogICAgICAgICAgICAgICBidXQgSSBndWVzcyB3ZSBkb27igJl0IHdh
bnQgdG8gbWFrZSBzdWJzZXF1ZW50IGNoYW5nZXMgdG8gdGhpcyBwYXJ0IHdoZW4gaW50cm9kdWNp
bmcgdGhlDQogICAgICAgICAgICAgICBwYXRjaGVzIHRvIHN1cHBvcnQgc3RhcnRfeGVuKCkNCg0K
PiArDQo+ICsgICAgLyogWGVuIGNvZGUgc2VjdGlvbi4gKi8NCj4gKyAgICBsZHIgICB4MSwgPV9f
aW5pdF9iZWdpbg0KPiArICAgIGxkciAgIHgyLCA9X19pbml0X2RhdGFfYmVnaW4NCj4gKyAgICBw
cmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMsIHg0LCB4NSwgYXR0cl9wcmJhcj1SRUdJ
T05fVEVYVF9QUkJBUg0KPiArDQo+ICsgICAgLyogWGVuIGRhdGEgYW5kIEJTUyBzZWN0aW9uLiAq
Lw0KPiArICAgIGxkciAgIHgxLCA9X19pbml0X2RhdGFfYmVnaW4NCj4gKyAgICBsZHIgICB4Miwg
PV9fYnNzX2VuZA0KPiArICAgIHByZXBhcmVfeGVuX3JlZ2lvbiB4MCwgeDEsIHgyLCB4MywgeDQs
IHg1DQo+ICsNCj4gKyAgICByZXQNCj4gKw0KPiArRU5EKGVuYWJsZV9ib290X2NwdV9tbSkNCg0K
SSBzdWdnZXN0IHRvIGtlZXAgZXhhY3RseSB0aGUgcmVnaW9ucyBhcyBhcmUgaW4gUGVubnnigJlz
IHBhdGNoLg0KDQpDaGVlcnMsDQpMdWNh

