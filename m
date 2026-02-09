Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKxyBJvgiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:26:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B5610FAA6
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225362.1531851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRHi-0002IA-43; Mon, 09 Feb 2026 13:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225362.1531851; Mon, 09 Feb 2026 13:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRHi-0002GV-0A; Mon, 09 Feb 2026 13:26:38 +0000
Received: by outflank-mailman (input) for mailman id 1225362;
 Mon, 09 Feb 2026 13:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpRHg-0002GP-O3
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:26:36 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3896fb1-05ba-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 14:26:34 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 13:26:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:26:31 +0000
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
X-Inumbo-ID: f3896fb1-05ba-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKB11lN4OiET8Vy+nj3EZEVZb6qrxxwT2fiXuMRnc6GauI8dPfAZjs34mAlG6XfJb+cT/f2gMXu6VdEyXpzYbRHItlSBMPOgYY9NPI8lWAOQXHPWf46FPVuMizd0SVMcRr8UHNtep7CLkEfBUIC2TmhUsECfgpSNmqCESYsge/XZtXwzV8eoRTuUI6GVbBVMY5+O75ByMgvhzshJyWHSd3jC6EKvLPgzmc3jMquwm/eLJUMDq3mWKeuo5et047lvQonHlDVleIT0qHf+Sqsi+MdK0STpk6RXZCDhujErRskVXAdIP/snkMyoeo0+XhB+eeEsKO66ep6n+z7CCTAPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ+KuiHeqfT93+KL8i1L77n9FESaV5R8qfn6LlR5y2o=;
 b=ixOPp46JX01nZFHP4WS9/6iWKOeHIwUS2H4s9XIBAhTXhIlXu4aK6fRVfQordGeMmv77QAh/qJFhKGtBndpRNCxIzgstExtOBqNWY9RgkTFEMMHfaquXtmGXTJU4k8I6RY5/6+mtW8rcbzD8kJdpZ3/D1yADURgoYchjASWMa6w3nRMhhuF6m/q6x8jyxNvz3xW7L4lAoOHHAjGIFwIimOzUIGmGc+/7RUQI//McZ/AY6H7zjaslMKgh1BR8pLBkR2E29w9URP+v6tFVOxmAPuAEg1JTNmCjQVqDc89p4hjP/W47irrJ3pqhXtL4i0P0a4m3urBBU+Imo51HPp9cAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ+KuiHeqfT93+KL8i1L77n9FESaV5R8qfn6LlR5y2o=;
 b=dewIAsmZoUxXbCg6uvU99q837zKOgWUA76Kp092zwqeONNDfxFyhoyciXVNADqJqERbKNhfdlxBJy2r8vtQoj8zTscfF3Ur1YZ4/Cu97jYa2tTPx2CSuPY1C7HSHS3cdPVDtOGH9O4wq93TFpqLXIUqUkGZ6Au/9ZlwoKW4YCus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 14:26:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Message-ID: <aYngg_ym18d0G-fX@Mac.lan>
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: MA3P292CA0061.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e453b2-42b9-4034-4ff4-08de67ded633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmxBcXBOejQxdHJQb0VOUjd4Y1kyL3NiVFB2V2hUcTZIV3F0ak45TzdQZWVh?=
 =?utf-8?B?WHdzWTI1YmNhUXErYU1nNXNiWjZIRGxsUlFyeGZ6a0E3MDFRS1JzLzhqMHYv?=
 =?utf-8?B?RWpYaUNuc1g4VUFJTjQwMFZPdlErWThhYndSL2hFVDJVVGg5WDh0T3picThM?=
 =?utf-8?B?RUJBZVZYMmFDWDNwekRGT2UwNUZyaS9Gd3pKTVpYaG55TUZCNlU4SkxPdjdh?=
 =?utf-8?B?UnM2YitKd0VjYzNSa0V0cmdPSlk4UGp4MHhkUzdmQmFYNCtsdmZEUTEra3hp?=
 =?utf-8?B?M0IyYWVaT29WR1RuM2s5U0hHYXpJVmRTWVhZSzFPVFZ5SmhMYlpXTG1ZMVNv?=
 =?utf-8?B?bVhMVjVWSm5jU28zSzlkdG5UQlZnM1ZTNndGbk40bFByOXMxSUUreWs5V0Uv?=
 =?utf-8?B?dFphOHNKOTJLc3g1clNBVHMrM1l0MG5CV2FUWU1zWjY2R21jMGVaSFl1RGY1?=
 =?utf-8?B?ckR1U2VVM2JpeDladHJVckd2dVNVZlNkalNxQmt6SUphQWVpQk56T3JWaFMr?=
 =?utf-8?B?Vm5sQU9Sekp0bWhqaE41dW9XYmNyUHdVMFE5NjVFMnM0Tm1oWDJtYjhZZDdH?=
 =?utf-8?B?YzE1aEU1bHAwL09ZVmV1R1hmeVNTeFZLNDBxVnRMZkxTZW5aSGd5Z0w0S0xv?=
 =?utf-8?B?Z0xtQ1JvTU11Sis2Mm5vcjF5anlKQ1FuVWpwV2dTUDYvU2FKcjZ5L2xMdWdL?=
 =?utf-8?B?NHloVHIwaWowdzZvZDZoeXdHNTR0NmV3VmFqMCtBVmhnVTczTGREYUxMeTU1?=
 =?utf-8?B?cTZqOEdlVEM2dlZIVHhCOXBtK3dJNG03Qzh3WTRBVk1QQUMzdmo4eVRlVnU1?=
 =?utf-8?B?ektFZE5URC9aTnAyaU56OXlDZWhrY3ZqTnJSenFSTkZHWjZmUFhNZXZSY0sx?=
 =?utf-8?B?bFgxUER1K0kyZmMrejFSUCtaZlFZcWtjSmNTZVBZWEd2QkJpNkdZclAxb29n?=
 =?utf-8?B?YUVoUllobjhtRFJXMmpXczgxbVpaMG9KeUViZzdFdUVhTU9hUkpNODBiYUhh?=
 =?utf-8?B?WFVtQzEzbm1RQXJTQW0yNHllQkl0UkoxTDFURXloSnFRRUIwSTQwb01Vbktx?=
 =?utf-8?B?bDU0S00yVFNLLzRSWUQ3cXRTZEtqcnU1K3pxYkI3ZXhlVUJUQTBSZjd2ODJQ?=
 =?utf-8?B?OUJLcTZQTmpTVzJEV1JmUTNkaEw2N2JydHFBd2Y4cUljWkVXTm5CZjg1MlJ2?=
 =?utf-8?B?NDM4R0h6U0ZVZUUyVHpBaFpLS1BRSU84dmFhcTZmQXFXQ0djZVc0RlFGcm84?=
 =?utf-8?B?QWlmTy9TRVVPdXdqM0RUWHhHdzhtS3hBNWhNVkFuWkd5S3hVN1g1SHNxbHpB?=
 =?utf-8?B?OTlXeG1hcTFoQmNsaDRSR1RQd3A2N1lBN3hUb2JVd3NUcWdwSGd5dlFKZFlu?=
 =?utf-8?B?cXVIYWZHU1hlaWVKL0hXaGZ5QWppem05T1lqaHNRaW1zeXNxTjNUVlhWOFBm?=
 =?utf-8?B?UDR0UDNFN1VUSXBwZlVVWE9sU3orei9jOE9XL1lQc1cwMTYxQmhsUmJMdGd2?=
 =?utf-8?B?ZzBSdnFPZ2luMmFKWjZ1ZEFNZWdWZ2ZLTk85ei9HdnN0c2VlSXVKckN3elFz?=
 =?utf-8?B?aTZQdVA3Y01RUUNPSEZVakF5REdhNDY3ZzdqMVFHWjR1SFNpeUkzeGYwN3R0?=
 =?utf-8?B?WThUOXZIZlB4MTJtTmRXTXZEeWl4c0pCR0V1Wm9oaGR6YzBiZi8vdGZQUXVE?=
 =?utf-8?B?M3RWT2t4SndIRlAzUitoUm1OTUZNRjMrd3RyS3crbGFtRXFGLzRQR2dUUzBz?=
 =?utf-8?B?Yjh1MmI1V0VpTEJZdy82U28yQ1hCOS8xWUlEV3d5OEVVS0xrNFcrd2ZGNEFl?=
 =?utf-8?B?KzQzbVdlTWY5S3NZYlRBUmRMRlcxL2w4TjQwV0NIOTJ0cUp2ZzFybkt6NmNN?=
 =?utf-8?B?bmdOY1I1SzY1U3BPdXFPSEVOcTBkUy9rQzh0TU14LzJERGtkejhCbmdmU2cx?=
 =?utf-8?B?TGJFSXF3NTltdVZFblE4SlBYNkpiNUttMWVjSXAzemdXK053QXI2K1hJMXhw?=
 =?utf-8?B?UkNnRHR4YW5URFBVVHp5MmVQYS9qZVZiQmFRSmRQb1YraTdJaVZleWl1QTNo?=
 =?utf-8?B?ZVhMTjdPcTA5cTJaanhxU21FeXBEUjhVaUltUTJ1YXFnekc0TlZ5YTUyMVd5?=
 =?utf-8?Q?KPow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNrczJtU05VN2JtS3hsa1J2U3ZGWGFxaGhFbzFqODhiYk1FdURpSm15SXhD?=
 =?utf-8?B?YU8xSGtOVnBhUWNtTG1FelBIdm1IRm5jWTFXblR3cDUvKzNBb3ZNcWltTERj?=
 =?utf-8?B?cG8rbnlGMHdpNmxGZXF6czZrWmdHVXNHcE0yK0ZQT0ZzNVhwT0sreWdvaGho?=
 =?utf-8?B?eUREc1hEbXNQWXUrYklBa3Rad0ZOaVEwb1lObVZtRGh2NERTUTdFQjRZbVpW?=
 =?utf-8?B?NmZQK0k0KzlRYVJrSVlHRjZHREhXRGovREQzbDArUVV1K2RFNEN1UEdMTnhE?=
 =?utf-8?B?elF4dzNSL0M3UkpzMmROamZsaW1VQmk4bEFXS1IrNWM0NkVZT3lMKy9Zck5o?=
 =?utf-8?B?eXdROVNlL05zTW5mcys0RFQ2ZkZBbGNEc0xoL0swd1MxWEI3N0VlemZKbS9n?=
 =?utf-8?B?ZUNLa0xPZlI1NmtsZTZia205UG5RRWx1amIvSmtOSkJpbjF5WEtPb0xQN0ZH?=
 =?utf-8?B?SVhiZ0gvVnA0ZnpRTXdtQWZ2ZlhNYUdieGdkTWIwdWZYdmtObmYyZWpxRjd6?=
 =?utf-8?B?VkozRjh6ZURra1p6TC9aSFdGSWxNR0FmTDFGU2g2dzRvV3F6Ui9vc3JzUzYr?=
 =?utf-8?B?NnRRd2VjM2hJcjBQRVk3ME9LcFpLOVlGQjhjdk8vcmRoaFNHM0ZYK1g4YUor?=
 =?utf-8?B?WXRLNG5KaFlBVHBadXJDdzdMdVEvR3poKzFRTHU0OThWZGNlT2ZIUnJORW9L?=
 =?utf-8?B?aEpxTWpiSGtoNlZTNmFVOENDSEhwSGhjVUE2VHhsYVAvWGRnYzFqTU1TOUtX?=
 =?utf-8?B?SzA0S1BDUXVXUlBFU2xFNUo1SWRZcXhySGtGZ2tZdFFtdXUydXNhT2txUG0y?=
 =?utf-8?B?Tk5OQTVZL21xRmpjLzZqNWlxYjBkeUxlU1M4OXhDL0tWSmwrdWkrUU90R0pE?=
 =?utf-8?B?ZXNPMEpBMVJrS254VC85a28zZU9qbmw3dXhYVjlDNk9zS2JHb21jY1Z6VHR1?=
 =?utf-8?B?WVB6QVd0QzZ4cmszMkRFeU5MQXFxTTE5SzgrNk1PRUZ2QXh2alFiaXlUcTFo?=
 =?utf-8?B?UG95NE1BMWJDL0VzU2RxTmthbXlzTnNzVmh2a2RZZFRCSHNnTGZxL1cxU2Mv?=
 =?utf-8?B?VmRWMmxEM2g5djcxcDViZTZMM0x5bnB6WGI3NUZ4K0o3ZkRjcGF0UjZjdDU4?=
 =?utf-8?B?cndLRCt4S2srbThHZGd4T2VRRUgrVFZkZlZNdUJYRExXOUxKU2Y2dUUzT3Rr?=
 =?utf-8?B?UC9jKzVWV3gzcGptQ0lncU1FbnZnSWRsMWoxMjE5Q2hxQklvOHNHVUh0cldG?=
 =?utf-8?B?RURQNGZQZ1VNei9pY0xDd1c0V1ZpYlJjUWlsOVRTV3c4SHV3L1h5a0VYcTFR?=
 =?utf-8?B?OXU3dnhTbm1BV1Vna0ducm1RS1UyVW94RnFjZDBNcllMdS8rMkxNNjgvQjZm?=
 =?utf-8?B?eFlqUFVOZWNUMm1JTXN1SVQ3TXVMU3hGSkxWTFUxYzdONWVMREhNNXhUZmxr?=
 =?utf-8?B?YWJWdlA1VXBIblNPaEE1WHJ6dnBkTTdRNnVlZE5tWlNVbkpFQkgrdjlIUHZk?=
 =?utf-8?B?MHMxMmR3UUdjTmtRalBpN09xandRRTJ6MVVmQW8wQzNPVnQ2SmJxODBVNVNB?=
 =?utf-8?B?QldmUlNDN0h1S2pRZjVVR04yYUUzcUFreXk1ek5OSE84dk82Ly9vNTh2dnYy?=
 =?utf-8?B?MVEyempCOWFyWXZjcmtoVFNJZW9FN3prSHVHQ3RFV3AzWWJoS2dxbjZJREhG?=
 =?utf-8?B?ZVlCU3dsWEJpV1lCQXVMWGZZcERpdnNmUERtQVlkdlpMMmNBVS92eWJ0ZDI4?=
 =?utf-8?B?YmVFV0hjWmcvU1hNdU9SSHd2bWV5dU1VeTdFVDMyRk5lTEwzMTZ6cEcySE1H?=
 =?utf-8?B?bnpEdy8yL0tNWk5JOXBvRCtMS05NT1g0NHRBWElKNmM2WlJNazZQbTRQMHd3?=
 =?utf-8?B?amZBUEJwQjV5MW9ISWh0VmNqQkgwdUZ5UU9zeVlTbjg5TUZOdUJEc0taUGRz?=
 =?utf-8?B?RXNFQ1dVOWpRRDllVGN5VEJZVXJtMFJMd21HMlkvZXJ2dlAraHVIK2V5cE1a?=
 =?utf-8?B?bWQ0ZTVKNC9iSXNLZmxPeWRMQ1ZPeGQrZjBkcSsyaEE1eWdTeFg0cVFlL3Fw?=
 =?utf-8?B?eWRlRTRIcHBJN3lNVlNtVTZrWG90c29HRXhPTkw1dWg2RVExOElnODhLa3ZW?=
 =?utf-8?B?bThIa1UvVEVZVEJtWkNjNlBhSnBhb3cydTJIVzdLTWZINi8weTE0dkNnYzNG?=
 =?utf-8?B?QSswQnZmVVA0YVBGWmZsV2F4QWxyQi9QQ09QUDg5L1MwZ1U2MWRzeUhwSkU0?=
 =?utf-8?B?Mm9aUjcxdk52THNVaW5TUmd2a3FHaVZYMCsrdnhOQlBZcmxtS3JXMWl3UkJ1?=
 =?utf-8?B?My83NU5EYUJsQ3B2cC9vZnhVYWQyU2xzM21pVkZoRllGRS9BaGhMQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e453b2-42b9-4034-4ff4-08de67ded633
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:26:30.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rxUdDQUsbeLFvJC9OJUBlA3UC7RF8kI6t4JRqlbdr3+EYGsA1TReOapoNfK6fXKjrYc7489jmVkhUBl+MJedg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 55B5610FAA6
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:46:44AM +0100, Bertrand Marquis wrote:
> Xen does not provide a Darwin build configuration useable on Mac OS.
> It is possible to build Xen Hypervisor (tools are not supported) with a
> toolchain able to produce ELF binaries (GCC or others).
> 
> Add config/Darwin.mk to include StdGNU.mk and force
> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> the cross-compile path so compiling on Mac OS is always handled as a
> cross compilation case.
> 
> Only compiling the hypervisor has been tested !
> 
> An example of how to build the hypervisor for arm64 on Mac OS
> (tools cannot be build for now) using a compiler from brew:
> - brew install aarch64-elf-gcc aarch64-elf-binutils
> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang

This needs 'xen' target passed.

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

