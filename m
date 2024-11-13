Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1F9C7468
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835757.1251616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBERj-00081x-FH; Wed, 13 Nov 2024 14:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835757.1251616; Wed, 13 Nov 2024 14:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBERj-0007zI-BN; Wed, 13 Nov 2024 14:34:15 +0000
Received: by outflank-mailman (input) for mailman id 835757;
 Wed, 13 Nov 2024 14:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKyd=SI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBERi-0007zC-53
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:34:14 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20616.outbound.protection.outlook.com
 [2a01:111:f403:260c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b95f65-a1cc-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 15:34:07 +0100 (CET)
Received: from DU7P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::26)
 by AS4PR08MB7856.eurprd08.prod.outlook.com (2603:10a6:20b:51f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 14:34:04 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::b1) by DU7P251CA0002.outlook.office365.com
 (2603:10a6:10:551::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 14:34:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Wed, 13 Nov 2024 14:34:03 +0000
Received: ("Tessian outbound e21d07e234f4:v490");
 Wed, 13 Nov 2024 14:34:03 +0000
Received: from L1ecb04b1ffcb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90A0B982-C2E3-4579-B024-6EDA73FDB8A1.1; 
 Wed, 13 Nov 2024 14:33:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1ecb04b1ffcb.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 Nov 2024 14:33:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB7541.eurprd08.prod.outlook.com (2603:10a6:10:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 14:33:53 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:33:52 +0000
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
X-Inumbo-ID: 56b95f65-a1cc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwYzo6NjE2IiwiaGVsbyI6IkVVUjAzLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU2Yjk1ZjY1LWExY2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA4NDQ3LjYxOTY5Mywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uezLU80t3/9tNXR6q7nyNCue99w4bBTM728eT/+iw6Kh/6ADhmmQ3TmJ3WJL5uAb6rULi+Qi75t6hs5YT9IGXMu79XMBbhtL7ZScHPUa6zXRRf/1rBLQOL3G2bcWOcW66HN7Rj0CvUIWwnNdVzzbaKzj39sFHNf6lgsX+fZCE4SaBcRHyiSINxoi/j/fkQc3lY6PseGUqkhMZGRsAreIKt+x75QRhqFu8T0ZboRIZmRz26u06kmqD7xkt70LFCgr5dJA0l/e03236GS1hXXUUS2SEFWqHH50DYDKev8sydNwiGUdkBZQCvXL6s8OBZDNkbWjff5FPzIL8QfsJP9fhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p59MGlsfjfPY47MfXr6614MlMjhJ6jAXW3whboewMcc=;
 b=J+Tefuox3oNmrphR3Q+T5wvzwhcHyTN4upjWVbjDnTf/QLRKyGoWGaBT67PfgWbBE9r9JxOv33uuZ0WKHkBJOIQrpcRNV1XUdMRW00PtTmT3995if82N6QzzU4LOKa8c0CBG5Jx/soJFU8hjlgIDNKGFPTLA9nmgqXYWwKOEyn11LXfferuZFUQeNaZcUJF6JF+D15JiAnGWXB+hOqGbcNpfaTwrtpeQY0wR9In3C/cKScwRJPfx7G9ufUpl7qIH9kVDn5mVKgQifQ2sUhCnPcbD2D5ltonQy4IcWnSBqk5NaYwHbquEeDTWs4/4SZL3kflwwZdvZYnVXfJYCfAdEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p59MGlsfjfPY47MfXr6614MlMjhJ6jAXW3whboewMcc=;
 b=E2lEJ4lCw7e2aLPYzsJXlj9SbTCEV0YEo9WGVeVYysA0r6YlkF2CsQ/MHFSNCU5yFxQF9qX1k8Vfevu4M5ri4Labzj+KcivCP/8Pz9AjljZgOBfmWjJxwaXs4g/fxrM8QBGQ8BcoC4BDnzlSkXW1sfSfG4BrsYZR21GlaKMLH4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5f38b5904aab99d
X-TessianGatewayMetadata: C/34q7OwCzkZ6JxpkQ8Scj/yvt4BKPTKQfNZuUf5Kd8GDcOUYmv33vhAEEEhCZ18tuMTZek6ZO9H7WQAi9b1cgBJLF/1jE6Cu5KSTaOUoAHQ0MWSfwWTMhd7oYTRiEUu6EEO9SIpKzXXx5oDumhTTj60OPjVqR8/KVXHVf3q+OM=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6TOAI0oZNCZAD67WKpMoP45FsUx8CMIAar6/OxUTAVTsPLSIDKYgEXS/xLxPafdajs9VAekO3ZkEJa7c3hc3aGE1jefR6rg3x3N/PpRzI5/+YW1IAmFVZvemFKrQedRwrDyicJWdy2NlPeiyye1Nc2NnOcIFCRNl1OW+WweGVlr73HNVno1fBkqFrzOGTZmq72Ohys72ExUZ4zKNV4WtlALdN92sfZ9+2NHyjKQiL8nhyvyJ3nmEJBzwXn8w2kk6TMvYT8DPYTwl0R6yD9evdiPb2C4WkQf6a1juK38nNt3/DLPR2BIT8aW0ZfSFn8m7tcBAriIHZDGgTn2dNFhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p59MGlsfjfPY47MfXr6614MlMjhJ6jAXW3whboewMcc=;
 b=xM6u50rlP2v3VcJtCyVgqs24fcUXzjpU4J9CDhvsMI3tzCa3rwAY1ehRRDKY9PqaYz3d1kIwITkSZvypaeRcLdOYXLSQGk82vx8I+RGI50qsgZXmIL6RCMs7FH/KNpYT3wzXst80G10K4aMkjlrlbi93B3Gk3ZfHQKG4sJjzS/S3IrSoBx78PVVEil+A3RfMCJu4OVWpkNh4OacKzwA19MO/T4ys98C7FALmqi7bTSXDqJ/mgyKNO//EKlSufEK1OanJ2gmiQSQxH9Qck7Te1e2EBFo6ZjawQztFOywxWH/46uMtlqY0a3PLt7Pv4sUyHBftT2Na+1JqikoioUFDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p59MGlsfjfPY47MfXr6614MlMjhJ6jAXW3whboewMcc=;
 b=E2lEJ4lCw7e2aLPYzsJXlj9SbTCEV0YEo9WGVeVYysA0r6YlkF2CsQ/MHFSNCU5yFxQF9qX1k8Vfevu4M5ri4Labzj+KcivCP/8Pz9AjljZgOBfmWjJxwaXs4g/fxrM8QBGQ8BcoC4BDnzlSkXW1sfSfG4BrsYZR21GlaKMLH4o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Topic: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Index: AQHbNdR4b2V2aTQ740yGxnKF6IdbXLK1RlIA
Date: Wed, 13 Nov 2024 14:33:52 +0000
Message-ID: <FA425FB4-7B3D-4FF0-9C94-2E5D8ECA1502@arm.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <f0928350-0031-4f74-a61a-778e68a9f67b@xen.org>
In-Reply-To: <f0928350-0031-4f74-a61a-778e68a9f67b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB7541:EE_|DB5PEPF00014B8C:EE_|AS4PR08MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfdb526-601d-4a9c-ba79-08dd03f038eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N0VSRERUcjlldmVDOGFiWDRVK3FXNDFOSXRaSm9leC9BRUpLRlZiZHM5dDEz?=
 =?utf-8?B?OE92eHhSMnJzditpOTFtc1FRaEEyeVBPNWxIWDFuVC9rMVQ4NXQ0b2pNSFZ6?=
 =?utf-8?B?czNYd29QOGxzVGYwWHhBUVc3NUlWRk5qRHh5TC9pSk52Uk5DQjRWZGR1bVZE?=
 =?utf-8?B?cHhDNCsrem0xSWpROUJTL29RMkpTMXd0eEhVcXdadFJrL0pLOVR6NVZnNC8x?=
 =?utf-8?B?SkRhYTVHQkxRZmxBVlkxRWU1QWh3Qmd2ZWRMNTcxSUZUcWN5Zmo5UlFhcnV5?=
 =?utf-8?B?NVJnZ085dE5CZ21kVGFjMjh0M05sbXlUZ0hhU3BBWUppSmk2R296WXovN25o?=
 =?utf-8?B?RjRQM0pSMGc1QTBjMGRtWDAweVR0VktyUjF0NHJaNWoxS29aOFVYbGZ4Wmty?=
 =?utf-8?B?MllySGN5Sk5ybi9QMlJhZi94Zm8ycEc3UkZ1YmpLSWVJUWRMS2taYUg2cEoz?=
 =?utf-8?B?VlZHd1J3c3pwTS9ibldwSmJvOEJZVGhnKzNJbGJHQXZpa0RaUmkyOW8yQnlZ?=
 =?utf-8?B?b0ZaNDEwM2x3ek9odkFWTTE5NnRjOXZGRjgzNzdYVElUMUExRXBDYmNuODEx?=
 =?utf-8?B?UkpLaEoyc3pCejFjR3hINTZodXdjMk5ZRlJhTGtNZ1B6dnY4d0RoOWR1c1Iv?=
 =?utf-8?B?UXd1R2g0a3pncTd3K1hQdS9abUxBK0xwd29OU3JZTnRFbmVjTzRtTWl3eGhO?=
 =?utf-8?B?V1ZOR0lEWFk5emt2dU9NdjdTcytMSEU1U25LSXk1SlV0R0pyTjFDTjhFQ0V4?=
 =?utf-8?B?aFlVa0plamFmUE1Zb1NycCtmaWVTTGR5bmIxaStmdDFGTEVMbWtmbWFRRUhY?=
 =?utf-8?B?RnFZUXE3SVo3Z1kwMCtyS0xZN2hRU3JlRWU5UDZ4Rkp0a1F2MHlrcEpWb1Az?=
 =?utf-8?B?NCtIeEg1VEtmUkhRSWdQMkRPS25vbWlqdkJIbkRHMlRnMWowd2FUZzlHY2lJ?=
 =?utf-8?B?bmd5V3hybGhHV1JSdldEeFVDZXY1K1JyVEN1TG5yRTFjdlVvL2hxcU10K0tu?=
 =?utf-8?B?OVhqLzZQSEF2MU85V21MZ1ErejRQeEUxREh3MUFIMk9ONyt1d0FjQmZZZGo2?=
 =?utf-8?B?c3RrL0Rta3g0bHQ1YktzeThMYjhvcDlJbTJTQmdFOWZSMGp0dG1jL05YaHVr?=
 =?utf-8?B?RDR4WEsybE95VW1ZUGFTM2hTU29ycXJGbmE5bWJKT3hUVVNPNG9FZ2xqSTRF?=
 =?utf-8?B?UUVJdW53cFdIUGFqTGQydFM0SllFT2IzYStDYlFSbmk0OXhqNVJwejhFK2gv?=
 =?utf-8?B?UjNkVEVpOXJBTStxL2pPbGN1dkdIR0xFdENGVU9LcUN0cHJVZUxqWEV3eFBz?=
 =?utf-8?B?UjNEQW9CaklLR3RxWVhCa1A2Z3FhbURVMGxaQjNRcGlic3NmQnUwd1RubVBx?=
 =?utf-8?B?aUtaRyt3bnpSdnRCVEhIKzBhZThuOGNPS213K2k5dXUzNElwYVZlbWhrbnky?=
 =?utf-8?B?RW10d0lkWUZPaTZWdmhMSjhIZlVvVC9Va0FQSmhERTQvSXh1dUpuWjRKekhp?=
 =?utf-8?B?bVkxUXp4N3VjRGxzS1BlQ3Jtd3JaNHNwdmVvVVJ3a3NUSFp5NC9lV2Q1aENQ?=
 =?utf-8?B?aUJmUGlYREFtN1RYSUtoY0I1K0FDM0dkN0xFcm1ETkxiaTFFZnZOV21uUDdN?=
 =?utf-8?B?dVpKOFgxWmozQjJybnVNVVd3V2VnVGJHVVRFeUUxR0ZSSzIvOWsydXdEMCtr?=
 =?utf-8?B?NlQ2NTFvVzZkaDJ0b1RyckVsUm9EZGR1dlY3dDZPVVhXdUoyWEZjTVZNdGxk?=
 =?utf-8?B?cnNzbHBYNkF0RGJnMlBqbm1KcXUxc0Rkckd0K2JhY1VmUUJOYWVMeHJjWjFj?=
 =?utf-8?Q?TiVK0aqgcCMkJrADItAY96FKilx2Z3m15aaFg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA11FB70E105224D9BB7AE465AC92124@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7541
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8cc5f78-51de-4aed-e1f9-08dd03f03266
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qlo2bE54R2dJNkZrZGJlV1gyUFcrTnNlbGFiazdFWnFpaktJd082S1JKakw3?=
 =?utf-8?B?TDliRDJ1Q3lBRnhkQ1JqQVBFWHVLcWtCK1U3S3BVWHcwZk04NHBDdXFsZlln?=
 =?utf-8?B?eC9yN0JiOU90ZGNrMGllRVdrQ29aMkxRZUhsNmhlR2Y3NnVIaERPNmRQNVVH?=
 =?utf-8?B?TjNuRXZQTGdhS1FqL0x4cjVqc3FnbnNtbTU3cnQ4TGV2OE5RT0daSm0yVzU4?=
 =?utf-8?B?VldsNzM5UDdBWmJ6WkFuNDltbzYwZ2NHQmduMzd3VkN5cmYydDJ2NVBlZXFm?=
 =?utf-8?B?cEpBemZhclIzZmRoVkVFbDFHR3lCV1E0MDRUc250S1RFUFZaY2hYejBGY25u?=
 =?utf-8?B?WklHaXZpMzJBYTJRVFM4OFo5bFlTd3BDR05IaWxpZ0JNT3o4a0dCMXlMdW1n?=
 =?utf-8?B?RTRieTBueU9MZkVkeDhya1VMWlpJVHB4U3k3b3VKdmxtZFhwZzFpTG9SWXYw?=
 =?utf-8?B?UE5pSjVqWlFTa3lsNDRTcU1NaW50R3JWMU54c3NUeExobGN1U2pWRERIUWZF?=
 =?utf-8?B?R2g1VW1wVEpOTi8vRi92VWx5SDFKV3V2THhhVVU4TUtvYzBnMVFPMXpBTHNF?=
 =?utf-8?B?WlVBN2RudU5UcE1EcDYvVXhDSzBOZU5RRDJqRzV3SXJSQU5zT1hodnhtT1RL?=
 =?utf-8?B?dmNWOFlXTkt2c3p5M25Ea2N4UVVLbEdYOWhzbHdJMTEyL0FCSkVsR1hRMmI2?=
 =?utf-8?B?dGF3a1liRkExMW8vMHJrUnNnNlRGLy9uVTFWQzJEdzJuSzY2ZkVMVFZmMFFo?=
 =?utf-8?B?ZHNjcVMveHp2emdiKzI0OVdlZUNrdDFaK0lnbDF0bk9jV3F2WXhCUmF3MTlW?=
 =?utf-8?B?ZUdOaE85Vzkyc0V2TFA0R0pILzdxSWtwTEpOWlRObkd2QmVOU0F4VHlVNW1F?=
 =?utf-8?B?UDV3ME1KRERaSU5SNE9pOEh4L2FjYmZ2dlhCUWNlalMyRUxPbGNONW82ZG1T?=
 =?utf-8?B?YVFrSkh2eTB4K1ZWeVdDaSt6S2xvRGdpaVMvUVUwemV4ZUxkdmZNQVIzdHhh?=
 =?utf-8?B?d1N3VkNEbnp5VTdjeHhac2RXa25qVHlLYUtNb3BVSmxLVkRrYVNsWW0wNk5S?=
 =?utf-8?B?dUw3bTF3R0ZtREFLcGt5dlFURE9kaEpaVk5LWjVpeXlwc1RsTkU1TDQ4M0Mr?=
 =?utf-8?B?NVBtN3hVUkdrU0E4RU5JbDFuTml1QUswaSs4ZlJuQjBNVkl2VDFrbnptQ1k0?=
 =?utf-8?B?WGdRbDhnWTJFWHA4R3ZzL0RTcmZteVhhVWQ0VjBITVR5VXJtQ1doRndOVEsx?=
 =?utf-8?B?SEh5QXRaNmRydWVFRGNuNmIxaDdSdHNqMDJQOFF3RXkyUDJOS0p4RktWRWdk?=
 =?utf-8?B?R3hVRjBHR0pOVDQ2V3RJYTNDV2JUL2IzQjBBUExiT3lscnNCWnJxMTNKWGx6?=
 =?utf-8?B?M3hwc0dvT3RYU3BDemhSR3IySVV2U1Q2UGJldE1WNkh2WFRjRmZDcFl3cE5K?=
 =?utf-8?B?NDNYZ0ZsOGZDVkdZZy92K3FxS0g3dklabWF2c0FlK3hTZ1J5eHFWVlZKcTZZ?=
 =?utf-8?B?b2NtZXNiUkY1QzZZd1lxZ1hBSVBuMXB1RUl1dk1vL04xN0dzaXgrU3lBdis5?=
 =?utf-8?B?cTlFWHFPWk9KUFh0UER2Sk5LOHFHcGZwK1ZxYVdCZURSb2pwV1hhb1pnWEM4?=
 =?utf-8?B?dzdyM0hhV0tySERwZFlKTTNyZWJSQTVPU1JFdENHNHdqNWg1MFNRSzREQ25Y?=
 =?utf-8?B?UmIxN01sSStEU2F6dCtLQ0xuWE8vbkFjVzRnZTNYbFByL1hDVHZCYUh0V1JU?=
 =?utf-8?B?TzlqN2xXeE9TYVZKZ3BPQW5WMHA2V3dlb3Uzb1FvMDJWRjZUMVFRTnFEdUQy?=
 =?utf-8?B?ZHA5N3RpZUR1Mk51bmNUWUtoZVJ5RDRXYnFsRjRMMS9XMWdrUURsODY1R0dS?=
 =?utf-8?B?MVFPZ3BPZllDTG9jZlFSdnFHYTlxRk1KODNjUzNMcUJtUGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:34:03.8016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfdb526-601d-4a9c-ba79-08dd03f038eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7856

SGkgSnVsaWVuLA0KDQo+IE9uIDEzIE5vdiAyMDI0LCBhdCAxNDowMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMDYvMTEvMjAy
NCAxMzo0MSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IFRoZXJlIGFyZSBzb21lIGNhc2VzIHdo
ZXJlIHRoZSBkZXZpY2UgdHJlZSBleHBvc2VzIGEgbWVtb3J5IHJhbmdlDQo+PiBpbiBib3RoIC9t
ZW1yZXNlcnZlLyBhbmQgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUsIGluIHRoaXMgY2FzZSB0aGUNCj4+
IGN1cnJlbnQgY29kZSB3aWxsIHN0b3AgWGVuIHRvIGJvb3Qgc2luY2UgaXQgd2lsbCBmaW5kIHRo
YXQgdGhlDQo+PiBsYXR0ZXIgcmFuZ2UgaXMgY2xhc2hpbmcgd2l0aCB0aGUgYWxyZWFkeSByZWNv
cmRlZCAvbWVtcmVzZXJ2ZS8NCj4+IHJhbmdlcy4NCj4+IEZ1cnRoZXJtb3JlLCB1LWJvb3QgbGlz
dHMgYm9vdCBtb2R1bGVzIHJhbmdlcywgc3VjaCBhcyByYW1kaXNrLA0KPj4gaW4gdGhlIC9tZW1y
ZXNlcnZlLyBwYXJ0IGFuZCBldmVuIGluIHRoaXMgY2FzZSB0aGlzIHdpbGwgcHJldmVudA0KPj4g
WGVuIHRvIGJvb3Qgc2luY2UgaXQgd2lsbCBzZWUgdGhhdCB0aGUgbW9kdWxlIG1lbW9yeSByYW5n
ZSB0aGF0DQo+PiBpdCBpcyBnb2luZyB0byBhZGQgaW4gJ2FkZF9ib290X21vZHVsZScgY2xhc2hl
cyB3aXRoIGEgL21lbXJlc2VydmUvDQo+PiByYW5nZS4NCj4+IFdoZW4gWGVuIHBvcHVsYXRlIHRo
ZSBkYXRhIHN0cnVjdHVyZSB0aGF0IHRyYWNrcyB0aGUgbWVtb3J5IHJhbmdlcywNCj4+IGl0IGFs
c28gYWRkcyBhIG1lbW9yeSB0eXBlIGRlc2NyaWJlZCBpbiAnZW51bSBtZW1iYW5rX3R5cGUnLCBz
bw0KPj4gaW4gb3JkZXIgdG8gZml4IHRoaXMgYmVoYXZpb3IsIGFsbG93IHRoZSAnY2hlY2tfcmVz
ZXJ2ZWRfcmVnaW9uc19vdmVybGFwJw0KPj4gZnVuY3Rpb24gdG8gY2hlY2sgZm9yIGV4YWN0IG1l
bW9yeSByYW5nZSBtYXRjaCBnaXZlbiBhIHNwZWNpZmljIG1lbW9yeQ0KPj4gdHlwZTsgYWxsb3dp
bmcgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgcmFuZ2VzIGFuZCBib290IG1vZHVsZXMgdG8gaGF2ZSBh
bg0KPj4gZXhhY3QgbWF0Y2ggd2l0aCByYW5nZXMgZnJvbSAvbWVtcmVzZXJ2ZS8uDQo+PiBXaGls
ZSB0aGVyZSwgc2V0IGEgdHlwZSBmb3IgdGhlIG1lbW9yeSByZWNvcmRlZCBkdXJpbmcgQUNQSSBi
b290Lg0KPiANCj4gSSBhbSBhIGJpdCBjb25mdXNlZCB3aGljaCB5b3UgbWVudGlvbiBvbmx5IEFD
UEkgYm9vdC4gSXNuJ3QgdGhlIHBhdGggYWxzbyB1c2VkIHdoZW4gYm9vdGluZyB1c2luZyBEZXZp
Y2UtVHJlZT8NCg0KcmlnaHQsIG1heWJlIHRoaXMgc2hvdWxkIGJlOg0KDQrigJxXaGlsZSB0aGVy
ZSwgc2V0IGEgdHlwZSBmb3IgdGhlIG1lbW9yeSByZWNvcmRlZCB1c2luZyBtZW1pbmZvX2FkZF9i
YW5rKCkgZnJvbSBlZnQtYm9vdC5oLiINCg0KPj4gDQo+PiAgc3RhdGljIGJvb2wgX19pbml0IG1l
bWluZm9fb3ZlcmxhcF9jaGVjayhjb25zdCBzdHJ1Y3QgbWVtYmFua3MgKm1lbSwNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcmVnaW9uX3N0YXJ0
LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBy
ZWdpb25fc2l6ZSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhZGRyX3QgcmVnaW9uX3NpemUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbnVtIG1lbWJhbmtfdHlwZSBhbGxvd19tYXRjaF90eXBlKQ0KPiANCj4gTG9v
a2luZyBhdCB0aGUgY2FsbGVycywgeW91IG9ubHkgc2VlbSB0byBwYXNzIE1FTUJBTktfRkRUX1JF
U1ZNRU0gb3IgTUVNQkFOS19OT05FLiBTbyBJIHdvbmRlciB3aGV0aGVyIGl0IGFjdHVhbGx5IG1h
a2Ugc2Vuc2UgdG8gaW50cm9kdWNlIE1FTUJBTktfTk9ORS4gV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIGhhdmUgYSBib29sZWFuIGluZGljYXRpbmcgd2hldGhlciB3ZSBhcmUgbG9va2luZyBmb3Ig
RkRUX1JFU1ZNRU0/DQoNCkkgd2FudGVkIHRvIGdpdmUgYSBtb3JlIGdlbmVyaWMgYXBwcm9hY2gs
IGJ1dCB5b3UgYXJlIHJpZ2h0LCB3ZSBjb3VsZCBoYXZlIGEgYm9vbGVhbiBsaWtlIGFsbG93X21h
dGNoX21lbXJlc2VydmUuDQoNCg0KPiANCj4+ICB7DQo+PiAgICAgIHBhZGRyX3QgYmFua19zdGFy
dCA9IElOVkFMSURfUEFERFIsIGJhbmtfZW5kID0gMDsNCj4+ICAgICAgcGFkZHJfdCByZWdpb25f
ZW5kID0gcmVnaW9uX3N0YXJ0ICsgcmVnaW9uX3NpemU7DQo+PiBAQCAtMTEzLDEyICsxMTQsMTYg
QEAgc3RhdGljIGJvb2wgX19pbml0IG1lbWluZm9fb3ZlcmxhcF9jaGVjayhjb25zdCBzdHJ1Y3Qg
bWVtYmFua3MgKm1lbSwNCj4+ICAgICAgICAgIGlmICggSU5WQUxJRF9QQUREUiA9PSBiYW5rX3N0
YXJ0IHx8IHJlZ2lvbl9lbmQgPD0gYmFua19zdGFydCB8fA0KPj4gICAgICAgICAgICAgICByZWdp
b25fc3RhcnQgPj0gYmFua19lbmQgKQ0KPj4gICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gLSAg
ICAgICAgZWxzZQ0KPj4gLSAgICAgICAgew0KPj4gLSAgICAgICAgICAgIHByaW50aygiUmVnaW9u
OiBbJSMiUFJJcGFkZHIiLCAlIyJQUklwYWRkciIpIG92ZXJsYXBwaW5nIHdpdGggYmFua1sldV06
IFslIyJQUklwYWRkciIsICUjIlBSSXBhZGRyIilcbiIsDQo+PiAtICAgICAgICAgICAgICAgICAg
IHJlZ2lvbl9zdGFydCwgcmVnaW9uX2VuZCwgaSwgYmFua19zdGFydCwgYmFua19lbmQpOw0KPj4g
LSAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gLSAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAg
ICAgaWYgKCAoYWxsb3dfbWF0Y2hfdHlwZSAhPSBNRU1CQU5LX05PTkUpICYmDQo+PiArICAgICAg
ICAgICAgIChyZWdpb25fc3RhcnQgPT0gYmFua19zdGFydCkgJiYgKHJlZ2lvbl9lbmQgPT0gYmFu
a19lbmQpICYmDQo+IA0KPiBXaHkgaXMgdGhpcyBvbmx5IGFuIGV4YWN0IG1hdGNoPw0KDQpBcHBh
cmVudGx5IHdoYXQgd2UgYXJlIGZpeGluZyBpcyBvbmx5IGEgY2FzZSB3aGVyZSBtZW1yZXNlcnZl
IHJlZ2lvbnMgbWF0Y2hlcyBleGFjdGx5IG1vZHVsZXMgb3IgcmVzZXJ2ZWRfbWVtIG5vZGVzLg0K
DQo+IA0KPj4gKyAgICAgICAgICAgICAoYWxsb3dfbWF0Y2hfdHlwZSA9PSBtZW0tPmJhbmtbaV0u
dHlwZSkgKQ0KPj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKw0KPj4gKyAgICAgICAgcHJp
bnRrKCJSZWdpb246IFslIyJQUklwYWRkciIsICUjIlBSSXBhZGRyIikgb3ZlcmxhcHBpbmcgd2l0
aCBiYW5rWyV1XTogWyUjIlBSSXBhZGRyIiwgJSMiUFJJcGFkZHIiKVxuIiwNCj4+ICsgICAgICAg
ICAgICAgICAgcmVnaW9uX3N0YXJ0LCByZWdpb25fZW5kLCBpLCBiYW5rX3N0YXJ0LCBiYW5rX2Vu
ZCk7DQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICsNCj4+ICAgICAgfQ0KPj4gICAgICAg
IHJldHVybiBmYWxzZTsNCj4+IEBAIC0xNjksOSArMTc0LDE0IEBAIHZvaWQgX19pbml0IGZ3X3Vu
cmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBhZGRyX3QgZSwNCj4+ICAgKiB3aXRoIHRoZSBl
eGlzdGluZyByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBkZWZpbmVkIGluIGJvb3RpbmZvLg0KPj4g
ICAqIFJldHVybiB0cnVlIGlmIHRoZSBpbnB1dCBwaHlzaWNhbCBhZGRyZXNzIHJhbmdlIGlzIG92
ZXJsYXBwaW5nIHdpdGggYW55DQo+PiAgICogZXhpc3RpbmcgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lv
bnMsIG90aGVyd2lzZSBmYWxzZS4NCj4+ICsgKiBUaGUgJ2FsbG93X21hdGNoX3R5cGUnIHBhcmFt
ZXRlciBjYW4gYmUgdXNlZCB0byBhbGxvdyBleGFjdCBtYXRjaCBvZiBhDQo+PiArICogcmVnaW9u
IHdpdGggYW5vdGhlciBtZW1vcnkgcmVnaW9uIGFscmVhZHkgcmVjb3JkZWQsIGJ1dCBpdCBuZWVk
cyB0byBiZSB1c2VkDQo+PiArICogb25seSBvbiBtZW1vcnkgcmVnaW9ucyB0aGF0IGFsbG93cyBh
IHR5cGUgKHJlc2VydmVkX21lbSwgYWNwaSkuIEZvciBhbGwgdGhlDQo+PiArICogb3RoZXIgY2Fz
ZXMsIHBhc3NpbmcgJ01FTUJBTktfTk9ORScgd2lsbCBkaXNhYmxlIHRoZSBleGFjdCBtYXRjaC4N
Cj4+ICAgKi8NCj4+ICBib29sIF9faW5pdCBjaGVja19yZXNlcnZlZF9yZWdpb25zX292ZXJsYXAo
cGFkZHJfdCByZWdpb25fc3RhcnQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZGRyX3QgcmVnaW9uX3NpemUpDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcmVnaW9uX3NpemUsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbWVtYmFua190eXBlIGFs
bG93X21hdGNoX3R5cGUpDQo+PiAgew0KPj4gICAgICBjb25zdCBzdHJ1Y3QgbWVtYmFua3MgKm1l
bV9iYW5rc1tdID0gew0KPj4gICAgICAgICAgYm9vdGluZm9fZ2V0X3Jlc2VydmVkX21lbSgpLA0K
Pj4gQEAgLTE5MCw4ICsyMDAsMjEgQEAgYm9vbCBfX2luaXQgY2hlY2tfcmVzZXJ2ZWRfcmVnaW9u
c19vdmVybGFwKHBhZGRyX3QgcmVnaW9uX3N0YXJ0LA0KPj4gICAgICAgKiBzaGFyZWQgbWVtb3J5
IGJhbmtzICh3aGVuIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGZlYXR1cmUgaXMgZW5hYmxlZCkNCj4+
ICAgICAgICovDQo+PiAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShtZW1fYmFua3Mp
OyBpKysgKQ0KPj4gLSAgICAgICAgaWYgKCBtZW1pbmZvX292ZXJsYXBfY2hlY2sobWVtX2Jhbmtz
W2ldLCByZWdpb25fc3RhcnQsIHJlZ2lvbl9zaXplKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGVudW0gbWVtYmFua190eXBlIHR5cGUgPSBhbGxvd19tYXRjaF90eXBlOw0KPj4gKw0KPj4gKyNp
ZmRlZiBDT05GSUdfU1RBVElDX1NITQ0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIFN0
YXRpYyBzaGFyZWQgbWVtb3J5IGJhbmtzIGRvbid0IGhhdmUgYSB0eXBlLCBzbyBmb3IgdGhlbSBk
aXNhYmxlDQo+PiArICAgICAgICAgKiB0aGUgZXhhY3QgbWF0Y2ggY2hlY2suDQo+PiArICAgICAg
ICAgKi8NCj4gDQo+IFRoaXMgZmVlbHMgYSBiaXQgb2YgYSBoYWNrLiBXaHkgY2FuJ3Qgd2UgaGFk
IGEgZGVmYXVsdCB0eXBlIGxpa2UgeW91IGRpZCBpbiBtZW1pbmZvX2FkZF9iYW5rKCk/DQoNClRo
aXMgaXMgdGhlIHN0cnVjdHVyZToNCg0Kc3RydWN0IG1lbWJhbmsgew0KICAgIHBhZGRyX3Qgc3Rh
cnQ7DQogICAgcGFkZHJfdCBzaXplOw0KICAgIHVuaW9uIHsNCiAgICAgICAgZW51bSBtZW1iYW5r
X3R5cGUgdHlwZTsNCiNpZmRlZiBDT05GSUdfU1RBVElDX1NITQ0KICAgICAgICBzdHJ1Y3Qgc2ht
ZW1fbWVtYmFua19leHRyYSAqc2htZW1fZXh0cmE7DQojZW5kaWYNCiAgICB9Ow0KfTsNCg0Kd2Ug
ZGlkIHRoYXQgaW4gb3JkZXIgdG8gc2F2ZSBzcGFjZSB3aGVuIHN0YXRpYyBzaGFyZWQgbWVtb3J5
IGlzIG5vdCBlbmFibGVkLCBzbyB3ZSBjYW7igJl0IGhhdmUgdGhlDQp0eXBlIGZvciB0aGVzZSBi
YW5rcyBiZWNhdXNlIHdlIGFyZSBhbHJlYWR5IHdyaXRpbmcgc2htZW1fZXh0cmEuDQoNCldlIGNv
dWxkIHJlbW92ZSB0aGUgdW5pb24gYnV0IGluIHRoYXQgY2FzZSB3ZSB3b3VsZCB3YXN0ZSBzcGFj
ZSB3aGVuIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGlzDQplbmFibGVkLg0KDQpDaGVlcnMsDQpMdWNh
DQoNCg==

