Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHIPEUpejGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA1123937
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227223.1533583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kU-0003Uj-Ok; Wed, 11 Feb 2026 10:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227223.1533583; Wed, 11 Feb 2026 10:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kU-0003SS-KE; Wed, 11 Feb 2026 10:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1227223;
 Wed, 11 Feb 2026 10:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kS-0003Ph-OS
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:08 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02038575-0737-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 11:47:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:47:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:47:04 +0000
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
X-Inumbo-ID: 02038575-0737-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NywdI0C5+006Uh03nJwN3KS+aPxwxcYZPDqwNh1qPyUNTIB6diSZfkGkcijwRUOHrZjDDj4LTKewbZqZ++RUOR4lZNKPpCsb1ZEeIMygH3y73bxVL4xR5O+q/T6VR6KwA4N9C0f7dBloSIheKWjCURgxa+m5iLyRAPKhYcL4MQPlIgqwmWAUEOlXIq5CqaH3nsSj7jdjMXyviJGI6FTr+GM9AVtJwcm4gOnS5yjsvhWV9MBoAH1UMOwXT0aBo8/JLirixGUfiif+JtjUuqYrE5NKeRgjumTDRbtTgFIJqursjtWTphSfoXkvkEv0h+nniUntv1I1NuJXsewExtvGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl0n5YtzEuDOR9roRgv/CaNdsWXGPUlwSYblNz8/sOQ=;
 b=IgZKCb8oMsGXmHnlsJcSSEoWAZyvWv58fX15xLl25zm+t2L9p/ZOUB0rb9GqpbHoP9seNGyzZhYAdL4POZEjY0y3vZmG84Ytf2/G06z90W/JE5OKtQed7vVLjzTDTt++KceRg8z5YS4A/KB11Rgtaqzfsm3hDbU6eXaxV6/+f13UqNzDFwDO+pP3iyqFSMk5OSt5KDffRKNLBiGXsVKascU8KFuQsHw2XmIiPZPnWO7ZqoOcXRUYMAGndhtRStWbSDrlM5iTuLwm1lr9tC99uf4DRaJxHX7lTC/gaLhitzW4hxGruyEmWZ6lp4ARi5PavwNOykEbgx4XcoYDR9YzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl0n5YtzEuDOR9roRgv/CaNdsWXGPUlwSYblNz8/sOQ=;
 b=cgMn904VDUT4vkeZFE1iyhQeFUn1ZDhs1xXPcbmHpny9ecHoLPhV4Vzv2QtrP7bVcpYjeiGMtithzzAU6D1NIS2v1ZGwx1ZhjI8WWPGWKcA2tb7ALgBUeuNlhYOS9q9XQbsFxK/7pUt7v2+Jb4V7FmT+WcsxOcQycRUMZo+xMM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] cirrus-ci: add x86 and arm64 macOS hypervisor builds
Date: Wed, 11 Feb 2026 11:46:37 +0100
Message-ID: <20260211104638.7938-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211104638.7938-1-roger.pau@citrix.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0044.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f10ce63-adf9-4819-2994-08de695ae4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEs4dDhuTVZNUnFlOTBXc2xEaittV3ZLeExCK1JlblFLT2ZWa0FzVmJpckNv?=
 =?utf-8?B?KzBsWDkvOXRYZnJQR2ZTUHZubWlveENvd3pDNUpVc1ZqS0RTRTUzY2txVUhu?=
 =?utf-8?B?eUhJWUxLRHlJenZ1WXBoSDdqejdjb2VpZVZBcHJQRGVoeEFvUHlFcXQ5UEg1?=
 =?utf-8?B?b2FvUDhDam94R3lPdkdnV2pnYXF2NS9XdWtGNmFGbk1GVjBGY3l3R1lhaGpK?=
 =?utf-8?B?Q1AxZ2tKRnFGa004YjluRHdDSXVEd2U4MlZiSW5IVDUyeUJNY01SbERUYTBI?=
 =?utf-8?B?MmRJbGxzcDJTc2h4Vm9uY3NlTnRIWmRpZE11ckJmbnUxR0RaTFkzbXk5TmR4?=
 =?utf-8?B?ZzluYUxudm9ZbGVhWmJPK3psRE9ib1RUVFoyMk1tZ1BRSlNSSnhQK3FTRkQx?=
 =?utf-8?B?aUVkMmpBd1RUODhMTHBJaW4vYll1TW1GelFldzBhNTZoNURocXQ2b1NiWmNF?=
 =?utf-8?B?R01PU0lQd3BEUmZxQitBbTBMem1EK0tRODB4djY5MUNZY2tUV3R1SHQwZG5O?=
 =?utf-8?B?Z1NiVDNRdkhEQUJDeVVYZVZVRXVONE13U1JuY2lTZmJnZm1sOU1RZFluNGpU?=
 =?utf-8?B?L3lyN2w1bkhMaUZKRWp3ZngzWGJFdlM2amlMUnhWQXhwN2VPK3V5RGhzemth?=
 =?utf-8?B?OGp0T1h3a3NyVmtJdXpJbjhNSWlMd2laOVdQZ2ZZLzZFMU1ndm9kdFdrVmVJ?=
 =?utf-8?B?SU5pbFV6OXJrMy9zWkIwR0dweWhCYTRBOUZCOUJMYTNqeTkvSXVzaHFLVXBa?=
 =?utf-8?B?cnhqU09qcEdwZVZzUzZmNlJUc0xBak5VUVBlUDdpUEVmamJITnZwODdDWmZC?=
 =?utf-8?B?REN0aXJ5K09SS0kwOHJmbGNGQWxBcm1tanROVGU0SCtTUmJzWHVTbWVqZUdq?=
 =?utf-8?B?WEZnNUZPZE45Nmtab0dRa0xlcHZrR0UrQ2l6akszaG5Nd0x6ZjFidW52MmVO?=
 =?utf-8?B?dGdGVG52dEtMcWZTaUdwZ3RWeHBlejdNNE9jeDNHQkdGL083Tk1rYUg1ZGh2?=
 =?utf-8?B?TThlUjh4TGh5MXdGYzV2ak9lYlZ5L3dqcHJpNkVOek40dHZjZEp1TUxlSXNu?=
 =?utf-8?B?eWtVYURRU0V3YnR3RUgyejBYeVBSZHhQQm9FOXdmYU0rZlJIeU03Kzc2UVZv?=
 =?utf-8?B?NkpFTEQvWXRCdyt2YWJld1o5a2d2cnBQSytGS1NpZk1iMWVOc2Q4eWJDU2dV?=
 =?utf-8?B?dGZZc3FQUEljRkVnSVhZZmZmb0MwWVBmUTZ5aUhJTzFLLzQ4QUNqY0ZHT0hq?=
 =?utf-8?B?YTFlRkVENGxjcEJxVzVMQ2RrOTNXSjAxUE1tQzRNVkgxa1FLQWlKL0J6bzVX?=
 =?utf-8?B?SDRleEEvM3IvOVk0VU1LQjB4OC9qbkhUWWdVNXNVbFVvMkJGUnZwZU9aUlhw?=
 =?utf-8?B?WEFXcFlwZlk4d0JHeStBVWNITk9EUThVK0FrUXlmbFhnVjc5YTVlaU1VaXlj?=
 =?utf-8?B?b21pRFM4TkRxQVE2YVJ4WFNXaHp0c1ViQ3Vaakp0VzVLUlF4bXlZSHpFb0I2?=
 =?utf-8?B?Wk01Um52a2M0ZklWQkk1VUtaL0pEazNITzUyeXpZZGx6NDdkTlRKN1A4OTdl?=
 =?utf-8?B?TGpkNUYxbWIyNm40WW0zbm1qNWl0bU9HaS9EUU1rWkQzT3RQQ2VnQktQcXN5?=
 =?utf-8?B?UGFoVnRCTzJzQjlPMXRpZlgwT3NrdlluK3RLa3g4bHEycy9pc0N3MGlhUWZv?=
 =?utf-8?B?dXdnS3Nkc1RTWUk3a2tIS0ptQW5sYXJ4WGxVV04vbVBDd25keDR4d3lmVnVB?=
 =?utf-8?B?cnp0clZWRWNCWEIxNEtqd0Y3d2wyc20ybVZOa3BRbDNrTEhjVld6aHZ4S1VG?=
 =?utf-8?B?UmZldm1sMS9FWDJIVWRGS0cvNGU1TGFDSnNIazRzaWQ4MkpubXUvNER1Q05o?=
 =?utf-8?B?Q2VRMk5GcERMYTZoenVSaHgrWEFLb01MMDgwanNXVnpJR094Qmh2Sll1Tk9w?=
 =?utf-8?B?Zm4xYXBPd3RCMnMwTTBGcTJ4ZFFONjBUL1g2ZnVPS0hCT2dTOUJXYkhPaGk2?=
 =?utf-8?B?aVpjQVFYc2J1Z1A0dldoWnRLSWgwKzduT0xOU0IzQnBKZkJkQkZRdXhmS3RN?=
 =?utf-8?Q?EfaiwN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkEyd0cwakdVUnRtT1lYUVBneG9STmdVTEZaMDRlai9xNEFTRmp3akNkOGNn?=
 =?utf-8?B?cUZiOFhBblVMaU1MaXp4YlhJVEswMHpReHkvN2FZV1RuTi90eEhpNnlPL2xv?=
 =?utf-8?B?UWJ0VWl2VTBiZjVlWHc5c09ET1Fjd1h6Z3lXc2o4b1hucE4vdDF5M1FNc0o5?=
 =?utf-8?B?TDI4eTJROGtqMm41dmV3R2Y4aERZSDBnSDRjYnVuU0dkeFJGOTVOWXZNU1NI?=
 =?utf-8?B?MkJvc2ZSeHBYRW1jaHFDUFBQS21DZHVKNnVpc1BHMy9SbGE2QnZETzZ3bWNS?=
 =?utf-8?B?L0hUdkptZHhFV0xHQ3ZINEsxRGRaZFpNY1BBS2RMSlZ4Q3FLVjFuaVNkbksy?=
 =?utf-8?B?YmZ6Zm4rbE54MFNxQ1F2QTl0RkpKa1FXOWY2UFZIbU5YTFlRUmc5aWdTVytD?=
 =?utf-8?B?K1BaZkI4WTU1aG82cUdCNXoxRDQxaGQySlFNVzdSekNaR3F2cGJxUmxGeHYy?=
 =?utf-8?B?U29TSkhkRytGYXpaYW1pVGljZ20xZWJSMlhyQ2VtVFpaL1NLQWFuZWVuREdE?=
 =?utf-8?B?Z05JMmphZXN4aHgvN3FKbklkMnFlVTdSMVRhWFNtdDI3MlMvV2pwQnFiNThr?=
 =?utf-8?B?ZHBJVmpOTnIzd1hndkxVVEw3ckdHR1dDQUJGeHNPM0V0SkQrelczek10Zktu?=
 =?utf-8?B?aFNPRnY3SVZtdGc1cVRXSCtmeGZMcXpic3hMTHdFZHgzM1p3YjZoS25Sc0VR?=
 =?utf-8?B?djBpL0lwYjh1SDllZWlmRmZYdjI5LzhuTHZRVkx3YkhYRkVtMVdVdC9Da0ph?=
 =?utf-8?B?OWM2MHdRTmpEUndpOWZMWi80Vi8wQjIwbzhWK0Y5OGpNSnFqam5jN1JNTSs0?=
 =?utf-8?B?R2g5RUg4ZkNRVi8zeE1JSmpPWUt2WlBlOUNzV2dvTVlpSU5WdmRmUnhQUWJN?=
 =?utf-8?B?V0RvMFgwcEpCLzNEM0RHL1FzSTluVTBSdUZhN3dIbG13eHpTMVEvZGdtT1VB?=
 =?utf-8?B?eFhWTHZ4ZWRJRGlldVg1b0NXQVI3ZjdXODdwd2k3OTRLdVM5NnhreW1HT3VO?=
 =?utf-8?B?UWhzV2lmS3ZUM1JxcmFzZWM3NkNPTzRFVnZPdHY0R3ZGYnVDQXZPaTg3UEJp?=
 =?utf-8?B?VndqMlFYVXM2aTRLUGpWUmlUUnF6ZWRYRG5kOE9sZ21HNUYyeGl4RnV6a0VO?=
 =?utf-8?B?NlFiZGN1VmZGd3dLeDdqVFJQbi9Db2lIQjVjdFlyejBVTnRTcnFMcGc5TVhJ?=
 =?utf-8?B?WUptWC9hZ2Y2OEdFV012OGdqRVhVdkcvak9OVHk0Qld4TDdLYng5WWx2V1N2?=
 =?utf-8?B?cFlERloyREtseEJjUlBEWlliK3JEK2VpZmxhRm5UV3pTYmhEQmNQR25BSVVa?=
 =?utf-8?B?NlRjdytLeHhGS2E0azQ0V1g5SEJvYS9nR1Eza29Hd1YvUEFsL1AvdE5ZeVNm?=
 =?utf-8?B?bnM2R2I2T2dSdFJqNnZOWXorZXNMWVpnV1drZVB5ZUozRHhTaU5kTW8vT2Iz?=
 =?utf-8?B?MWVGWUR3VHVuV2t3aDBQd3hPNkpmUDVMRGtJUHU0WlRtUzZrQnpac3NDRHpV?=
 =?utf-8?B?Z2xKSkJ6Qit6ZlF1ZVBtejdPVzVoeG1OZTJWTmppbm04STkzVmwvZUR2ZnZO?=
 =?utf-8?B?YU5BSXUwZ3pIeUhDalNKT3dMc1BVSzlXQU1ma0NGQ3NuZ3J0bEl3d1dVdGQ1?=
 =?utf-8?B?RHQwTEhmUHFiWHVVS3dWZ0lkTndlTkYrTnlvdm95RzRzOGR6SWwyQmNUL0FW?=
 =?utf-8?B?aTZZd25GT2JubWVFTVdodU9GYU1IakNjZUw4RU9JbG5NcTNPaGZVVzc1SFNl?=
 =?utf-8?B?VTY1VS9TWkIvMEJWTkE1ek1UcmZJZEtjNWtSeTJXcnMyRUFqUTgwKzRzcVBC?=
 =?utf-8?B?a2RQcDBOektDak9pK0x5NFdPaTNocmJiK3AxUlZuZzlkd0FlQy9hc2VjdG9S?=
 =?utf-8?B?UGFQd1VhU1BQbklITGNWb0IwQjhQalE4RXA1T1RTUDBvYlZQTWZRK1hZR2Nw?=
 =?utf-8?B?Wm9lZXNtdzBOYVdwVXlZWDlQS2NBVjNxWGhPVkJuNFl6VmdZTW5PVFZGRmk2?=
 =?utf-8?B?Q0JFNkhZeTZSWGhZWE56M29DaE94TGNnaUxpVllId1V0M1pUQlVTMjNUZWQr?=
 =?utf-8?B?OE9lVG9rQllzUC9hcTQwNWxyWGtiWXZuQ3dNRUFtQmtOY2llZkpkYkxDdDRQ?=
 =?utf-8?B?ZDkrVHlxTFZNanlkSTVQbUhuT2JnM1pyZVhHT0o1WGlIak10dmhIYU9VNjA3?=
 =?utf-8?B?VGpPY0Fmd21Oc3Z0R3RYMzZFUjh0TjNPRVc4RzAyZmgrYW5rak9rZ3c2ajNP?=
 =?utf-8?B?K1ZPa0NRTkRQSytjYk1DVEhDVWRseUpjUzJTTGdYc1grbExkWFhDbWErK05R?=
 =?utf-8?B?ZUJJL2EzY2w1amczL1pFbVU1dktsc3N1RDkrNlBXRGVEVFFaa1Jwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f10ce63-adf9-4819-2994-08de695ae4f2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:47:04.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuM8Mz3GxKlW+7RLN3X4Gm2o7uL2tZenE/IhD81QSGuP9VJCxa0V2ClKVUqKai7XrOTb9OXgesAyNITWrqLBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cirrus-ci.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B1AA1123937
X-Rspamd-Action: no action

Introduce two new build that run on macOS Cirrus-CI instances.  Those build
the hypervisor using the elf cross-toolchain from Homebrew for both x86 and
arm64.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't added any randconfig jobs, we can consider adding those later on
if the builds are stable.
---
 .cirrus.yml | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7bbb4f1c5c6c..b9608e71cca7 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,3 +1,5 @@
+## FreeBSD Build Jobs
+
 # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
 freebsd_versions: &FREEBSD_VERSIONS
   env:
@@ -122,7 +124,41 @@ task:
     path: xtf/tests/selftest/test-*-selftest
     type: application/octet-stream
 
-# Test jobs
+## macOS Build Jobs
+
+task:
+  name: 'macOS: hypervisor build'
+
+  env:
+    matrix:
+      ARCH: x86_64
+      ARCH: aarch64
+
+  alias: macos-$ARCH
+  macos_instance:
+    image: ghcr.io/cirruslabs/macos-runner:sonoma
+
+  environment:
+    CIRRUS_CLONE_DEPTH: 1
+    CIRRUS_LOG_TIMESTAMP: true
+
+  install_script:
+    - brew install $ARCH-elf-gcc $ARCH-elf-binutils
+
+  build_script:
+    - make -j`sysctl -n hw.ncpu`
+           XEN_TARGET_ARCH=`echo $ARCH | sed -e s/aarch64/arm64/`
+           CROSS_COMPILE=$ARCH-elf- HOSTCC=clang -C xen
+
+  xen_artifacts:
+    path: xen/xen
+    type: application/octet-stream
+
+  debug_artifacts:
+    path: xen/xen-syms
+    type: application/octet-stream
+
+## Test Jobs
 
 task:
   name: 'FreeBSD: XTF selftest'
-- 
2.51.0


