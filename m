Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKiILsmZcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:18:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9954375
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209484.1521472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viULV-0006cw-66; Wed, 21 Jan 2026 09:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209484.1521472; Wed, 21 Jan 2026 09:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viULV-0006Zp-1i; Wed, 21 Jan 2026 09:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1209484;
 Wed, 21 Jan 2026 09:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8igF=72=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1viULT-0006Zj-QF
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 09:17:48 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b784f89-f6aa-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 10:17:45 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:17:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:17:42 +0000
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
X-Inumbo-ID: 0b784f89-f6aa-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVNyafOquDZ6r3wqR6eAq2ZgQxslIcyzeGrOKBifFjn9LnEyMgLnaDjTbAiS5M+Q5gFLqb7P8gVuHlvgdh89SbeqLFum0h3hLWbXpPcZDW1OWUYAPnaBCCPvi2OYMVCATJpfU6GJJQqlqpWMwT2cNeSh5Gb/tlFKdtzAtw8teHjQjV8kUihwpVkZYmSukvVx2pkMH551hDwn9ImIhK3JDGgCCbwXI2VrhccEF+Kb5NnXy6x7+Pcm8qG95St0OI7lV/srS1QPMLGyo7zje3Y1LjHc+mth1+uHIEGpDhPFowmOi4G5FHc9QU6Lk+UhsJMFf9EarzCkPPj8cU7BfRUz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uocHU4LzLMLoUS9x6jLgMdGbCEpafNB+1BukWes3N9A=;
 b=bnwmZP/jr2OCb98+CaK/I/ICv24ezDEeHQNORfrGEz84w9HrBRY+rYG1LlZLSOk4kMl73QQVFWQWxemH2w3phT9NnHRcaCYPnPZINrrc6W1j0NKtRBvWMItj1irODWsZ/FaXsKYrzfiyncSUIuVfjy5ypyu4td1WHN7dWzB3atsArlLYiNt6htz9m/Nt+pXG0Bcsb7nCV/W818h7SLwyC/ZNkmJmwaBvXLuSRoaNDSm/TBoh0j5L35m/a+57Sbkeq8NHTD7kDBfF9IeWLs8a4FelYutMRkWVf449lq5KOx4M8RwXgsox4LNER9JREbcD5M2FecpxJMyccZUk/onK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uocHU4LzLMLoUS9x6jLgMdGbCEpafNB+1BukWes3N9A=;
 b=HkARCpIrwgP5lKXSPLyQuyt7S0dVtdmtHQO8S8jRToNb6ELiWNTkyB93Ox6XzZMRDMFlYcbf+wZMg1BvOaYdBskonqgf5XrrPSJFOPkWEg2TrY/hN0EBBuCPTQec4JwgKS7n1TSKEhHm6Pd5nOa0GuGN9/DY/g0enY+sxNr6A34=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RESEND PATCH v12 2/3] vpci/msi: Implement cleanup function for
 MSI
Thread-Topic: [RESEND PATCH v12 2/3] vpci/msi: Implement cleanup function for
 MSI
Thread-Index: AQHcaBtBN3StFxVxMUK3Tlwpczk4lLVcl12AgACLCwA=
Date: Wed, 21 Jan 2026 09:17:41 +0000
Message-ID:
 <BL1PR12MB5849D591CE1864E567EE656CE796A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
 <20251208081815.3105930-3-Jiqian.Chen@amd.com> <aXCUq0R8eONzga5c@Mac.lan>
In-Reply-To: <aXCUq0R8eONzga5c@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9542.003)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8133:EE_
x-ms-office365-filtering-correlation-id: bd8ff779-9c05-4460-1398-08de58cdee17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDJzcVM0VTlkYTlYcnU2V0ZXQ1pGZnB5WkJMRlIyZmgrSTNTZGpCamQ2UUdk?=
 =?utf-8?B?SWVrTTBxeTZOc1lyVTBCWEFMVjUyUFZwWXFhdlZCRXRFVFYrWXBPS3FLL0Y3?=
 =?utf-8?B?b3N2dGRTL0c0bGpKdFZkN010MkcycXRMRnlZUmYwcDcyUUNLdk1MYzJKRlFM?=
 =?utf-8?B?dVpmMlJ2SjZOdGZMdzhhTzFkR1IrRnR4MWlxendSalIxTUF2OVlyVzlBeXE1?=
 =?utf-8?B?NCsrSWQvWFdJbWRnYWxiRVptU2lndFV1UFNxTThBdGVTQ2pibHNSYXhycWdK?=
 =?utf-8?B?VUJyU2piYUtxa1RIS1NhODBPWFcvSUhIK3JkN0lkdGx3UVU5YTV1dmxmamVa?=
 =?utf-8?B?Ym85UDNOSTZ5a2h2RXNNN3Fhem9qaGtJc2QrQURaUDMwWE16WGdtbUhTSFNU?=
 =?utf-8?B?cTJvZGl0RzlocGt0bU9mdmpuUHlaZFRPa0F5QzR0TERQN0k2NnFubWVxVlYv?=
 =?utf-8?B?c01qQlZMZGRMREdsV3JjZnFJek9SVFhIMENJYmUzNzFVM3FuNTFkVzU4d3pR?=
 =?utf-8?B?QWI0RUpDUEsySmg5blg5NEV1OE9idkZPd2dHbVNtQ0RGVmZFYXdoQkJIY0lt?=
 =?utf-8?B?dmZ5QjVXeGtudXBJWTR0akZkSTVvZksrVXNpWExqcTJTZWlHUzlmTm1yMUFL?=
 =?utf-8?B?MkExRkFub3ZENmNuSTRvcDZ2MFFSVWxzQjhRTW1IWDZzcTd6QzJ0Y2R5QU92?=
 =?utf-8?B?OVRuZEhNaXdDSHJOL1V4TC9ZS2h4MjdiQzEwcjNnMVFXWVZVRUI2M2l3SXR5?=
 =?utf-8?B?R3AzUmJsMW1zZW1lZHhmaXkxUHJITENxcFkxN05oV0RtdmVZNklrOTJlZm5l?=
 =?utf-8?B?MDdoZjhSTHAxMDlYTllNNzFTaFV1d1lJSzd4UXQzb0VOcVZpcWhoS0NhRkZo?=
 =?utf-8?B?MDhLYTZNeWxqSEl1cXlSZXlWS2UvQysxVkRTcENWSXZXT2RVWVZjRVJ0TzlD?=
 =?utf-8?B?aTZ0T0xNU1JMcmhWajJHRnR3Mi8wcjBCOUxKVkRCaTY5Zm9BRXh2STh1SUY1?=
 =?utf-8?B?SS9LLzZWaUxQM3BPSGFsUUxKcjhaWVZ6US9CQ2VLZVhnNGdaOWZYQThMUk9L?=
 =?utf-8?B?YzNxSHlCdEdKUWR4T1lHUzFVTHlaVG45aDZ5VWJ0OHN1WGhmcWxjTTZuRGZH?=
 =?utf-8?B?ZXhudEkyekRkWkw3L1pWY0Jxbk9LV3o1MXR0RUxNM1dlYXp5TEhVK2U3ME5i?=
 =?utf-8?B?eVlMaklIenJFcDd4YTA5WE9mbWwyeW5adGhOaGdMTTZqWW5uMXIvZitiZU5z?=
 =?utf-8?B?aWxKZ1JudVV2ekFPOEJpOEl0aEc5WHFpdll2UXpZTGcvWjNKZysvTzRrOFd2?=
 =?utf-8?B?aVdNZ3VsaGR6b010U1VuRDlXTWJLSjYxM3p0UUFOOEhDdE1zYklrOFgxYUdl?=
 =?utf-8?B?OU1MOHJrR2V2YmZYKzI0T3k1OHQ2dGw5eGRGbTQxQ3RjMzZmUHhWNW9VSnpZ?=
 =?utf-8?B?U2FQRktWM0s1Ym5tazdobTg0a3ZFVmZMcW5MQWJCUFBzTklvMkt3Y1JySFFC?=
 =?utf-8?B?T3RDU2pTbUh2Y1kzbE1XbGNia2YwejdaS0xrc0VVaUFseVBNck5sN3dqd3l4?=
 =?utf-8?B?eHBENmdQWUx2dHU5QW9nN0hpWXJuNEtIc3hlelRDY3BEZVVqVWk0b0lPS0g2?=
 =?utf-8?B?Z1dnMGdyK05udjBuY1JhZ1Q1bTVLUEhBOU5vV1dWMjUrMzBQanJ3bkpZbGJS?=
 =?utf-8?B?NHFvMy96Vm0wZjhwU1JtZmh3c0NpY2hoaFRoSVZMNVY4a0c3OTE0SjZQbmEw?=
 =?utf-8?B?NWZ5dkp1NVVVcmltL1ZBREdTRDJQQ0hsVUQralVaOGVzZVlqY3ZCWkZreWsr?=
 =?utf-8?B?ZTUyc21INkZSM1M4RDUzSFZteW1VV1hhRlBaVEw2YTJyL2lVV0N0bUtIQjZH?=
 =?utf-8?B?eEcrNm5oOGJnRFRCN2syME5zRFBEcHRWVGw3aVdSamNQV3JEWWE1c0lpK0Ni?=
 =?utf-8?B?aFNoU2tuY1IvY1hMYTVINjY5cVlmU3RWcFM1R09ISGRqR2xrOVFKTXBFRGZE?=
 =?utf-8?B?QTRQYU1rd3RKdlhhSXk3Unl6YlJrVnhCZ3J6Z1hydWJRcmZuYnFsOXI5bWRR?=
 =?utf-8?B?TGlhSGw4eVdTYzFPNzNHbWoySHFNTXdxdUlmakUyLzUzdkQ2cnJKK1dPZkhi?=
 =?utf-8?B?bG5kQ1FsdkIyenZiUGpobVdFNXp4c2FoV1NSQzdyZTVWT1gwUTVSQmpCeVhD?=
 =?utf-8?Q?6x2BDH6E7TevVDx4gXGD1y0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGpObFozR3FvVU9RcDVpdVlFRGxvVllHVldMM0VKNHphM1VxWW84Ny81M0sx?=
 =?utf-8?B?N3hiMFZCM3FpT0x0N0FCa0ZLbisrUkwxZFdPLzJpTnM3RHVodFlpeEhPME0w?=
 =?utf-8?B?K1BSMTl6Z0hBTy8zeEZnSW9JZ0JkRE10T2RxQXI5UEt1STN4a2N0eVFaVWxH?=
 =?utf-8?B?Y3ZSc2JFUVFnR1laa2V4d2hiSUZMcHdQMHdKbm9HcFBPeklhVFVrZk45bzBC?=
 =?utf-8?B?VEd0dytnak5OVENYa3NMUDJMbndPcHo5TFJYd2ZpZkNEOXl5MzVBSmlPb09h?=
 =?utf-8?B?ZzUydklhU2dEb1BUZDhLU0dqZ3hOVGtUK1VqdGVVdDZIUldzT3dhN3lGOFJr?=
 =?utf-8?B?SWVjdTd6bzJNdkZyS3VZSURjNkNLcmVsTFNLUGh1bFF6Qk1RLzJ3Y3p1VG9j?=
 =?utf-8?B?c0o2OXg1NW1CeDBkZmhvclo1VnNFS3dYRFJvcG1SZ0Y2RFRmZHZBeXdIZDdX?=
 =?utf-8?B?MFVEVVFaTUw1NFVpSzdzQzM1TEx4YTF3WEV5c0orZjJwcGJQV1k4L25mYWJ2?=
 =?utf-8?B?MWlWb0luMTR2ODNRNG81d1JWMXdtcEU2dnBYZDN4TmN6dHBHK2lpakdhdTdh?=
 =?utf-8?B?QzVsWTZ3aWJidHBTSmpoVGtDejdmUWtTN3UwVFdic290Y1cwTGgyRHZ5T3dR?=
 =?utf-8?B?emFHd1NoVnB3clh6YzlzMFhUeWp2R2pheTJLeEhpYVpMNHRScFByaTFVcDFK?=
 =?utf-8?B?d000VXNpWTlUQnR0QUNSNEVEV2w2emFVeEFTcHJUSGM2N3o5RXFDTm9DS3E1?=
 =?utf-8?B?MDdjYS9iYzNpaE1pZXc0KzVJNy85UitvWTEyamV2K21KRGlCQUlOWUVhTXNz?=
 =?utf-8?B?R1NkVlJtMW5ZL2s0bGxTd0ZjR1kzeWJIUnlCbDFzZkFOOTE4MURWSzF3c0Rw?=
 =?utf-8?B?ek0vNGYvMzdOSzVMOCsxUGRvRVQ0Vlhwb0VKUkoyQ0E1bEUvSk5wOE16bGVr?=
 =?utf-8?B?L3NaL3d1dVFETThCWFFOWjRneHgycGp1cGZta0ptbGlRc3JVbC9xc1dBS0hk?=
 =?utf-8?B?cmNJZ0lubmpoQnFwY215L0d0RHcyTm8zM1U2SlM3MDJONzNvZkZsYWwwZ283?=
 =?utf-8?B?Y3V6cEZKdTA1Vm5pK2RYUW0wbW9HZjNxWGMzVE5SU3BEMWFIOEtBUmVNOHBP?=
 =?utf-8?B?MUUyYXhsUDAzK0djMzU1bzRqcjRneWlYTThRSEU0bWVaNFpISTgwL0psbEtO?=
 =?utf-8?B?WnU1VGNzZCtvZEw5RkxHQkx0N2JkVjVOMFd0NW0vMG9uNzhlSnNCN3lXMWc4?=
 =?utf-8?B?NGpOeTFqMFBjRXFzdzdLcHR5WVAxN1R2V3plRXQxR2dWS3grNjE4YWY3WkNK?=
 =?utf-8?B?TTRlWWhyMzRQMnhmbmwwK0YxMG5tSnFkd1Y2VldwdDNMWlVLbm02L0ZtaXpn?=
 =?utf-8?B?bDZSNG9jTGsrNVdvdUdnRythR3FhL3pFYzV4a0EyYjVIbnpvWTk3RzZ2NTF4?=
 =?utf-8?B?dTBodlFhY1VWRjVSZ21kYzdEdXZvRXFIUDRScHhDMXJsNXFMeHIwWk1QTkNI?=
 =?utf-8?B?d1RHU2R1ZlZvTWx6NDlFRUEyKzI2STJZdFdtTXhIemxBaFlaZ0JjTjFVL3A2?=
 =?utf-8?B?d2wyWnptRjBUL1UrZEJoREtjeUZvOU5YLzhPTGlsQXFuTmhwRTQwbHdpUFZB?=
 =?utf-8?B?UVNFS3VJNFZMTVdTMVJmc2VGUVNrVElTdXFEOHMvZWFGVUUxRXM3NFRYcVNO?=
 =?utf-8?B?NFNIeVE2U3dORmh3VEhnZHlZVTRBczhvMXY2ZURXQWJocG8zYXZ3MTNEeEx2?=
 =?utf-8?B?eDI1VkZPbWFXYitrdERpMUlDOXBVblVxWUkrbWI0L256YVhKQk1oVG1DaHhW?=
 =?utf-8?B?NnFEMytYbEZQZ2M5bTVUSzNTRmYxTFF1T3NXd0R2anR3YTBVSWJBQmVFQlp4?=
 =?utf-8?B?OG1Bd296Q2tOZ010OWpEb0FRWjZwTVg0aGkyV0s4YW5iMEFLR0pXcnVTM00w?=
 =?utf-8?B?bzhnZmxldW5nSzhIK1dYejllbGNYcVd1UkF4dDVHOXJuakJkVG9ZUmZmOFNV?=
 =?utf-8?B?cjQxcmIyOEhHYWpUNnQzL0pWMTN1RDVFNHM3RW1QYmI4U0FvSTJ1S0VZZTJv?=
 =?utf-8?B?dXNKN1Y4U0xmWW5odVZqbUl5aERwTDZxVXRTK0NqV0lDeVNGbFpBNDNZUk1F?=
 =?utf-8?B?N09scG1nRUlPNWVLUWtwZXhheEYyRmdiOGlISzBYUmdxUmN4Vm01eXRVN1I5?=
 =?utf-8?B?dFJFVS9DNDhlZGcycERKaG93bXY0MlhDcEI3QjBVYXRRUmNwQ083RHFrczRr?=
 =?utf-8?B?R1BiZWdQcjZBL2JUL2FtMVFuRGVKNEVHemoyZUhaVlNlS2dQKzJ2MTdzOHBD?=
 =?utf-8?Q?KDT0e+NdvFkjoFPw6I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEF85555222F42499A1A87B0550C22EB@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8ff779-9c05-4460-1398-08de58cdee17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 09:17:41.8752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7p+ZspWyQDjSFlFpetSpxi0grM9bwn0SUbGAnlLikSDxz3ak3yMeor8GxsEJp5FMXxc4ZA77ngcPRRRdRNF6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:Jiqian.Chen@amd.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,citrix.com:email];
	FORGED_SENDER(0.00)[Jiqian.Chen@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jiqian.Chen@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EBA9954375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8xLzIxIDE2OjU2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIERl
YyAwOCwgMjAyNSBhdCAwNDoxODoxNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gTVNJIGluaXRpYWxpemF0aW9uIGZhaWxzLCB2UENJIGhpZGVzIHRoZSBjYXBhYmlsaXR5LCBi
dXQNCj4+IHJlbW92aW5nIGhhbmRsZXJzIGFuZCBkYXRhcyB3b24ndCBiZSBwZXJmb3JtZWQgdW50
aWwgdGhlIGRldmljZSBpcw0KPj4gZGVhc3NpZ25lZC4gU28sIGltcGxlbWVudCBNU0kgY2xlYW51
cCBob29rIHRoYXQgd2lsbCBiZSBjYWxsZWQgdG8NCj4+IGNsZWFudXAgTVNJIHJlbGF0ZWQgaGFu
ZGxlcnMgYW5kIGZyZWUgaXQncyBhc3NvY2lhdGVkIGRhdGEgd2hlbg0KPj4gaW5pdGlhbGl6YXRp
b24gZmFpbHMuDQo+Pg0KPj4gU2luY2UgY2xlYW51cCBmdW5jdGlvbiBvZiBNU0kgaXMgaW1wbGVt
ZW50ZWQsIGRlbGV0ZSB0aGUgb3Blbi1jb2RlDQo+PiBpbiB2cGNpX2RlYXNzaWduX2RldmljZSgp
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29t
Pg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4+IC0tLQ0KPj4gdjExLT52MTIgY2hhbmdlczoNCj4+ICogSW4gY2xlYW51cF9tc2koKSwg
bW92ZSAiaWYgKCAhaGlkZSApIiBhYm92ZSB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKQ0KPj4gICBz
aW5jZSBkZWFzc2lnbiBkZXZpY2Ugd2lsbCBkbyByZW1vdmluZyByZWdpc3RlcnMgaXRzZWxmLg0K
Pj4gKiBSZWFkIGFkZHJlc3M2NCBhbmQgbWFzayBpbmZvIGZyb20gaGFyZHdhcmUgc2luY2UgdGhl
eSBhcmUgbm90IHJlbGlhYmxlDQo+PiAgIHdoZW4gaW5pdF9tc2kgZmFpbHMuDQo+Pg0KPj4gdjEw
LT52MTEgY2hhbmdlczoNCj4+ICogQWRkIGhpZGUgcGFyYXRlbWVyIHRvIGNsZWFudXBfbXNpKCku
DQo+PiAqIENoZWNrIGhpZGUsIGlmIGZhbHNlIHJldHVybiBkaXJlY3RseSBpbnN0ZWFkIG9mIGxl
dHRpbmcgY3RybCBSTy4NCj4+ICogRGVsZXRlIHhmcmVlKHBkZXYtPnZwY2ktPm1zaSk7IGluIHZw
Y2lfZGVhc3NpZ25fZGV2aWNlKCkuDQo+PiAqIFJlbW92ZSBSb2dlcidzIFJldmlld2VkLWJ5IHNp
bmNlIHBhdGNoIGNoYW5nZS4NCj4+DQo+PiB2OS0+djEwIGNoYW5nZXM6DQo+PiBOby4NCj4+DQo+
PiB2OC0+djkgY2hhbmdlczoNCj4+ICogQWRkIFJvZ2VyJ3MgUmV2aWV3ZWQtYnkuDQo+Pg0KPj4g
djctPnY4IGNoYW5nZXM6DQo+PiAqIEFkZCBhIGNvbW1lbnQgdG8gZGVzY3JpYmUgd2h5ICItMiIg
aW4gY2xlYW51cF9tc2koKS4NCj4+ICogR2l2ZW4gdGhlIGNvZGUgaW4gdnBjaV9yZW1vdmVfcmVn
aXN0ZXJzKCkgYW4gZXJyb3IgaW4gdGhlIHJlbW92YWwgb2YNCj4+ICAgcmVnaXN0ZXJzIHdvdWxk
IGxpa2VseSBpbXBseSBtZW1vcnkgY29ycnVwdGlvbiwgYXQgd2hpY2ggcG9pbnQgaXQncw0KPj4g
ICBiZXN0IHRvIGZ1bGx5IGRpc2FibGUgdGhlIGRldmljZS4gU28sIFJvbGxiYWNrIHRoZSBsYXN0
IHR3byBtb2RpZmljYXRpb25zIG9mIHY3Lg0KPj4NCj4+IHY2LT52NyBjaGFuZ2VzOg0KPj4gKiBD
aGFuZ2UgdGhlIHBvaW50ZXIgcGFyYW1ldGVyIG9mIGNsZWFudXBfbXNpKCkgdG8gYmUgY29uc3Qu
DQo+PiAqIFdoZW4gdnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgaW4gY2xlYW51cF9tc2koKSBmYWls
cywgbm90IHRvIHJldHVybg0KPj4gICBkaXJlY3RseSwgaW5zdGVhZCB0cnkgdG8gZnJlZSBtc2kg
YW5kIHJlLWFkZCBjdHJsIGhhbmRsZXIuDQo+PiAqIFBhc3MgcGRldi0+dnBjaSBpbnRvIHZwY2lf
YWRkX3JlZ2lzdGVyKCkgaW5zdGVhZCBvZiBwZGV2LT52cGNpLT5tc2kgaW4NCj4+ICAgaW5pdF9t
c2koKSBzaW5jZSB3ZSBuZWVkIHRoYXQgZXZlcnkgaGFuZGxlciByZWFsaXplIHRoYXQgbXNpIGlz
IE5VTEwNCj4+ICAgd2hlbiBtc2kgaXMgZnJlZSBidXQgaGFuZGxlcnMgYXJlIHN0aWxsIGluIHRo
ZXJlLg0KPj4NCj4+IHY1LT52NiBjaGFuZ2VzOg0KPj4gTm8uDQo+Pg0KPj4gdjQtPnY1IGNoYW5n
ZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0aW9uICJzdGF0aWMgdm9pZCBjbGVhbnVwX21zaSIgdG8g
InN0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2kiDQo+PiAgIHNpbmNlIGNsZWFudXAgaG9v
ayBpcyBjaGFuZ2VkIHRvIGJlIGludC4NCj4+ICogQWRkIGEgcmVhZC1vbmx5IHJlZ2lzdGVyIGZv
ciBNU0kgQ29udHJvbCBSZWdpc3RlciBpbiB0aGUgZW5kIG9mIGNsZWFudXBfbXNpLg0KPj4NCj4+
IHYzLT52NCBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgZnVuY3Rpb24gbmFtZSBmcm9tIGZpbmlfbXNp
KCkgdG8gY2xlYW51cF9tc2koKS4NCj4+ICogUmVtb3ZlIHVubmVjZXNzYXJ5IGNvbW1lbnQuDQo+
PiAqIENoYW5nZSB0byB1c2UgWEZSRUUgdG8gZnJlZSB2cGNpLT5tc2kuDQo+Pg0KPj4gdjItPnYz
IGNoYW5nZXM6DQo+PiAqIFJlbW92ZSBhbGwgZmFpbCBwYXRoLCBhbmQgdXNlIGZpbmlfbXNpKCkg
aG9vayBpbnN0ZWFkLg0KPj4gKiBDaGFuZ2UgdGhlIG1ldGhvZCB0byBjYWxjdWxhdGluZyB0aGUg
c2l6ZSBvZiBtc2kgcmVnaXN0ZXJzLg0KPj4NCj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4gKiBBZGRl
ZCBhIG5ldyBmdW5jdGlvbiBmaW5pX21zaSB0byBmcmVlIGFsbCBNU0kgcmVzb3VyY2VzIGluc3Rl
YWQgb2YgdXNpbmcgYW4gYXJyYXkNCj4+ICAgdG8gcmVjb3JkIHJlZ2lzdGVyZWQgcmVnaXN0ZXJz
Lg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlhbiBDaGVuLg0KPj4gLS0tDQo+PiAgeGVu
L2RyaXZlcnMvdnBjaS9tc2kuYyAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIHwgIDEgLQ0KPj4gIDIgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9tc2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMN
Cj4+IGluZGV4IGMzZWJhNGUxNDg3MC4uMTgxZWM5MDJkZmZiIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4g
QEAgLTE5Myw2ICsxOTMsNTkgQEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgbWFza193cml0ZSgNCj4+
ICAgICAgbXNpLT5tYXNrID0gdmFsOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgaW50IGNmX2No
ZWNrIGNsZWFudXBfbXNpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sIGhpZGUpDQo+
PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVuc2lnbmVkIGludCBlbmQ7DQo+IA0KPiBO
aXQ6IEkgdGhpbmsgeW91IGNvdWxkIG5hcnJvdyB0aGUgc2NvcGUgb2YgZW5kIGFuZCBkZWZpbmUg
aXQgaW5zaWRlDQo+IHRoZSBpZiAoIHZwY2ktPm1zaSApIHsgLi4uIH0gYmxvY2s/DQpXaWxsIGNo
YW5nZS4NCg0KPiANCj4+ICsgICAgc3RydWN0IHZwY2kgKnZwY2kgPSBwZGV2LT52cGNpOw0KPj4g
KyAgICBjb25zdCB1bnNpZ25lZCBpbnQgbXNpX3BvcyA9IHBkZXYtPm1zaV9wb3M7DQo+PiArICAg
IGNvbnN0IHVuc2lnbmVkIGludCBjdHJsID0gbXNpX2NvbnRyb2xfcmVnKG1zaV9wb3MpOw0KPj4g
Kw0KPj4gKyAgICBpZiAoICFoaWRlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgWEZSRUUodnBj
aS0+bXNpKTsNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAg
IGlmICggdnBjaS0+bXNpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgY29udHJv
bCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBjdHJsKTsNCj4+ICsgICAgICAgIGJvb2wg
YWRkcmVzczY0ID0gaXNfNjRiaXRfYWRkcmVzcyhjb250cm9sKTsNCj4+ICsNCj4+ICsgICAgICAg
IGlmICggaXNfbWFza19iaXRfc3VwcG9ydChjb250cm9sKSApDQo+PiArICAgICAgICAgICAgZW5k
ID0gbXNpX3BlbmRpbmdfYml0c19yZWcobXNpX3BvcywgYWRkcmVzczY0KTsNCj4+ICsgICAgICAg
IGVsc2UNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICogIi0yIiBoZXJlIGlz
IHRvIGN1dCB0aGUgcmVzZXJ2ZWQgMiBieXRlcyBvZiBNZXNzYWdlIERhdGEgd2hlbg0KPj4gKyAg
ICAgICAgICAgICogdGhlcmUgaXMgbm8gbWFza2luZyBzdXBwb3J0Lg0KPj4gKyAgICAgICAgICAg
ICovDQo+PiArICAgICAgICAgICAgZW5kID0gbXNpX21hc2tfYml0c19yZWcobXNpX3BvcywgYWRk
cmVzczY0KSAtIDI7DQo+PiArDQo+PiArICAgICAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lzdGVy
cyh2cGNpLCBjdHJsLCBlbmQgLSBjdHJsKTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAg
ICAgICAgew0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBmYWls
IHRvIHJlbW92ZSBNU0kgaGFuZGxlcnMgcmM9JWRcbiIsDQo+PiArICAgICAgICAgICAgICAgIHBk
ZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIHJjKTsNCj4+ICsgICAgICAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsNCj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICB9DQo+
PiArDQo+PiArICAgICAgICBYRlJFRSh2cGNpLT5tc2kpOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIC8qDQo+PiArICAgICAqIFRoZSBkcml2ZXIgbWF5IG5vdCB0cmF2ZXJzZSB0aGUgY2FwYWJp
bGl0eSBsaXN0IGFuZCB0aGluayBkZXZpY2UNCj4+ICsgICAgICogc3VwcG9ydHMgTVNJIGJ5IGRl
ZmF1bHQuIFNvIGhlcmUgbGV0IHRoZSBjb250cm9sIHJlZ2lzdGVyIG9mIE1TSQ0KPj4gKyAgICAg
KiBiZSBSZWFkLU9ubHkgaXMgdG8gZW5zdXJlIE1TSSBkaXNhYmxlZC4NCj4+ICsgICAgICovDQo+
PiArICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIodnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEws
IGN0cmwsIDIsIE5VTEwpOw0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICIlcGQgJXBwOiBmYWlsIHRvIGFkZCBNU0kgY3RybCBoYW5kbGVyIHJjPSVkXG4i
LA0KPj4gKyAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIHJjKTsNCj4g
DQo+IFN0cmljdGx5IHNwZWFraW5nIChhbHNvIGluIHRoZSBwcmV2aW91cyBwYXRjaCksIHdlIG9u
bHkgbmVlZCB0byBkbw0KRXh0ZW5kZWQgY2FwYWJpbGl0aWVzIGFyZSBub3QgZXhwb3NlIGZvciBk
b21VcyBjdXJyZW50bHksIGFuZCBhbGwgdGhlIHBsYWNlcyBjYWxsIGNsZWFudXBfcmViYXIgYWxy
ZWFkeSBjaGVjayAiIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pIiwgc28gcmViYXIg
bWF5IG5vdCBuZWVkIHRoaXMgPw0KbXNpeC5jIG5lZWRzIHRoaXMgdG9vLCBJIHRoaW5rLg0KDQo+
IHRoaXMgaGlkaW5nIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluLiAgRm9yIGRvbVVzIGFjY2VzcyB0
byB0aGUgY29udHJvbA0KPiByZWdpc3RlciB3b3VsZCBiZSBpZ25vcmVkIGJ5IGRlZmF1bHQuDQo+
IA0KPiBXb3VsZCB5b3UgYmUgT0sgdG8gYWRkIGFuOg0KPiANCj4gaWYgKCAhaXNfaGFyZHdhcmVf
ZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPiAgICAgcmV0dXJuIDA7DQo+IA0KPiBBaGVhZCBvZiB0
aGUgY2FsbCB0byBhZGQgdGhlIHZwY2lfaHdfcmVhZDE2IHRyYXAgcmVnaXN0ZXI/DQpPSywgd2ls
bCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0KDQo=

