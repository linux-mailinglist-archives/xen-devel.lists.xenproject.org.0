Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CqGGEBI1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:21:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA723BBEA8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275942.1561597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARu9-0004Bh-JP; Wed, 08 Apr 2026 12:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275942.1561597; Wed, 08 Apr 2026 12:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARu9-00049U-GV; Wed, 08 Apr 2026 12:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1275942;
 Wed, 08 Apr 2026 12:21:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wARu8-00049O-00
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:21:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARu7-007lZR-C7
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:21:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d64832-e002-0a2a0a5209dd-0a2a450be216-6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:21:07 +0200
Received: from [52.101.84.101]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d64832-bca8-0a2a450b0019-34655465c2f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:21:07 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB7691.eurprd03.prod.outlook.com
 (2603:10a6:10:2c7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 8 Apr
 2026 12:21:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 12:21:04 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otrIIgmav8Z+OnqSmKw0+XsOrCFgfeJ2bmAUq3cQhvP+Wvi5ypzAGrfwG7bAnvWEkf18pOR/L8bqftVBZdmMdXhmy7089X4bPhjIZAECZKrUMNtkXm+BPTgKUCVZKUqTh52EPkwHN0j5xlCyAn0bQ14LEHJ/LkZciqPedqxfABUvVPFqo8P3+xuNxBvD/O9gcbslRyP0F7ZoZ5u+BPTG+4Qg397O+B9rkXZksyWSIGOVzq+PgpmQ92SaAHPklZWCu6bhQXQ6pAOo5VP6NRLg/o5odtrz/5RwlB+ZTNUjF4yey3B3fuctB6jBQmLKpPpkM+Treusl7inw2Oq8ihoy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ycUemd65Zi6yMgxClzlDFk4gfLidocGUJuNo4LCHZY=;
 b=QKKQ2jozvKvtg0qLweLLE8dxOWB8cOrDc+Y3Iv/j334jj0sI8UKKNxUcHWUT7H9yMAIVOhhSc1AiMdtEewByMB5ZPFI74wvBUdkGX5zYMS9S8ymm7hEYRjtgako70r8VTXlV2E7MOTMaI1odNOlPb4zAUDxMo29YoMKv/5aWuuzBqdqkQnk/MQTcFYLbwK/3L2r0/ArXClIolu41ovG0/osBtEwZ9oGm6pBvbKzA7/hafG2zWsThNz/zeqqNhObKMx7Af8vXIqlYHy0pjZglqK0bIwCSTMigqqWwPbNwFbmBef9n/182dETnuPcgS8wQuS9fQjA31JlIwLZVnOPh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ycUemd65Zi6yMgxClzlDFk4gfLidocGUJuNo4LCHZY=;
 b=cGAGSKnNu6Ps44uK+qEck/6WD8IX9APr9sI3aper29eoDfd4SzKNhbMERmz429gXmeFQso4wCKiGDvyXUj5OzjDttZbZtrMqs/Q+b2i0EydmJeAOHXHmCnsXJqILISTG01y7+KxG97GGeo74c9HlCroNszZRDdFKe/riMm4PWzQU6t0brCaYUMf7pP5BN4BKP1tm+AnN9EIbBwQJf+SrPcm17YTpmxFCkRFX7rzcPwYiIlY8B9iwx71bV86/IARF94EJmn/bBUB4lPWJYJHEuiSl2JC/0oxPicXChL7OnrsDYKKpzFaez6o+TWk6PLP0CuD8vctNczP6+QHjlLriDg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHcwDy29LsBHsG5wEG6AuodBSMA4bXG/lkAgA4lgoA=
Date: Wed, 8 Apr 2026 12:21:04 +0000
Message-ID: <00a42bdd-8d9b-4828-b789-8d6163c0314c@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
 <e37330f7-96ca-41a9-81b1-14d7f3947dd6@suse.com>
In-Reply-To: <e37330f7-96ca-41a9-81b1-14d7f3947dd6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB7691:EE_
x-ms-office365-filtering-correlation-id: b14affa4-959f-417b-d08f-08de95694df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 AO8hzjFc6HePs6O2qxXnNLHMh3X/mvvCwnBFqJElrSamNhc1eZOiKDiRgcNGkFBBoKTlicEuozkTBs7p4MhiUHe9ltEA8OLRsViTYQM9ZytTXjO2mZYQb/HT11zgIt8d4G2oCzWCPjPMTS96+RxH6JobYkv4UZ+Pr3LJD75OGiL7GfjjLiid0zBCu7hzgnqsQrk2D3t51xzox4ByYVs06VClHXSOpwsra0y6YcP73YU1d3FqF4UtXBZLW94nl81dyFbt3gubWwUnjV9g/J8FGlUYlrYytC+5InRxA8xGTADWoiRAFSltCz0z1CU8LD+v4/pEEMWWhG63For8cOBdDxnDeqrTrZObNNng5KBC6pzVqlESEayJx5ju0KjdKiTtuOY04YWXrk6XUsGsyXHEnN4u1QX4QZRhoNCCWLRAfq6nNVVjRznovoeTmhBRLJq1Wax3KneVPNpzu4402zYtO2DYSeh9H/gAraxXwAIVDzusfdbKU7KzGCNZMTxF/aGsYT+pqGc0xGr6B6ZRGbCP5itR9qDT2UwZEGiB+YriK060hm0kLUDkFj3e89pxTBg3SFNpWdYR+UXiGY+PHfoL8zhUV8H9yd0f7UpWWyKSVcWibeo93oh2FbaornX9yUGiVTh5o39X/lh8eAlhDY55bLCijoiowmmzxdF3qPUqZvyNVYR9lv0bQoLqmcpekicls/Za5EUrdrjpSzJj2CuXAwOJ5TYHjnF0lnjBeOCFsi5EipsPIeyjTRqSXoBp7z/bemfNWL+OkO8IdA5rAufIwDr8Yd6beyzMsfA3iqXUVfc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0k3MkpERDBLcDBiM1VVVkZHRTR6eTFuQVRMN29QV0VBaEhFTFBHeFFuNlBG?=
 =?utf-8?B?K0pPaTREMmhRdnVXbkxQeVZ4eVhQTFdFYzVhNTFmaWJOTGUxZHovd0ZyYXVa?=
 =?utf-8?B?Z1Y5N3NyM1VBcThMTUcyV0IxZUcwSlN1a29Sdkd3LzhWRzFLSmkyQXQ3dSta?=
 =?utf-8?B?MFV4SzI5UWx5MXY2R1NMQVBaOFNLK0NUb3l5ZDJ4RzhCMzYrakdDTmtCUzQ4?=
 =?utf-8?B?a0dNQm1QTWJLU2ZWY0hLVEdqQkJNaFU2SVNSVTM4dVgwandEUVpld1pNWm94?=
 =?utf-8?B?OUovRlRIdnpiT3ZycGNKdFdFTi9wa25mMlgrbjRqdkZmNW85d0E2SlVxeVIv?=
 =?utf-8?B?QktTT3NUQ1EwSzhaazJNUURjc2ZFNnljaE5zcVJUZXZaVFlKNnFjdzYrZmpP?=
 =?utf-8?B?YXU1SEhZdEVGTW8rbFdYUmJ2MkVkV0l1QXJGUys0elVtVjNiRTJhZjNPVXNn?=
 =?utf-8?B?a3VxcHMvRUxTSStwZWNkWUQyUjZhYkwvV0ZTc3g5VTlTVFRMTzVSdCt5enlq?=
 =?utf-8?B?RU01dHd2Sjk3eDJDVDVSd3FNdGFjank2Z0s2L0xBd0l0Z0srOFNtZGZmN3VE?=
 =?utf-8?B?ZkNlWVhPQW1PRW9VVTVTWTJUUGN2S0tmemgyQkhONXkrSFBZaUNjNDNSRXpT?=
 =?utf-8?B?NnZ2aU1kZ0Z1MUtiS2hMN28yMUwzR1EyajJZOTM1T2VHK2loRzJ6VE1RMmp0?=
 =?utf-8?B?N0tMME1Eb0FwVUZHM003Q1JHMk5UbW5EWjZBUUpYLzZmT2svZHJiMHZHcVV4?=
 =?utf-8?B?N2NEbnlpL0hrZEI4QXZuT2tXU0MvbHBNRmh4SVhwUUV2eE96a3R6L0F6S092?=
 =?utf-8?B?UVpJWm5rNDMzMENOZ1llT1M4bXBWL2pENWxKU3NDcTJlOFo1SUZrVW9LSnNL?=
 =?utf-8?B?UkdEbVVTb1FhWVZlNnZiZis0aG45MTg3MkR5NXdOKzU3Z1lJbk1CRVVFTU5k?=
 =?utf-8?B?UlhqamVnWEdNS1NEYjZFWUpacGNQRkZRUVZOcnM1RGMwWDE5S2V2ZWpwY3Rs?=
 =?utf-8?B?VjlVbUJmR2VybVB3cjFURmhmUUVtdFNaMmVQam85aEtpSEZoM2dSeEFab3o4?=
 =?utf-8?B?RzgrQndqTFhER0MzYTVITUZQT1Q3RE4zN2RHSzdzZUxEbkNSMFl3M3Fsd0xz?=
 =?utf-8?B?T1M2R3hqNDc4ZFJkUVRMMCtGZjhsUEkwL1hneitvUlh3T01oSW0rd1pwdVRS?=
 =?utf-8?B?R0pzYlpwVjRCV0xVRE5wbEpLUlF5WHoyN05pRXVGSnBPMHo5ZXA3K0dDc29V?=
 =?utf-8?B?d1RIMDVEYkxoc1BjaXNTYlNYUytqYUJxQ2xKYi92UUhFYXhHL3FQb2d1VG9B?=
 =?utf-8?B?eGREZGpyRmhjdGdqUDY3ME9wd0IwZ1hqOS8rK1BTd0NSK0p0c0dzajNUZ1Mx?=
 =?utf-8?B?dkJNTU1DUEhtMUl6NXhrN0l6dDg1by92OEVoOHpMUUhHYnkyeU5rdmc2c0VS?=
 =?utf-8?B?QktaejNNZmVsOXZwdGliQUorZDNEaUVya1lXbXRueEJ2dWlzSmo0b1p0bGJE?=
 =?utf-8?B?UTIxSDNQTko3VGRWZGpmTW9QaHpjT2U5SXhiVEVYTjEwTFI2T0VUUWxHR0lD?=
 =?utf-8?B?VXhmdzlEbXQzNFJtaUMvdmx0RGw3QWtrRm9lYnhCRkxvUVlOdU1GeUtqUnh1?=
 =?utf-8?B?NS9uTG9BK0EwbFhSL2JFR2VBQy82NDlMSlh0NWxTbEUzNkhCZ05xckUxSjNZ?=
 =?utf-8?B?VVdqeTRKVmZwcTZkUEQ5dml2VnRVM1NaeHZrMld5amJEVDU4dW9Cc2xkTmdl?=
 =?utf-8?B?YjU1TVhscklBaDJlUHhsQmFKOFdsTko4czhMbHV3L0ZQOEpFdStjOWZ0WnRV?=
 =?utf-8?B?NEhKOG41TVJBZGtWbFVTMFRINzRRK3M3K1ZZd0NnRHdRMEM3WHUva1J4L1ZF?=
 =?utf-8?B?bjlWZ1RLVHpZSGJONVg0TkxKN1JNWFpaWTU4YnRFVE9oekwwZmR6R3FoeGxv?=
 =?utf-8?B?cXBvajhCZldSTGgrYjhIUTFOWFA2MzRaZWVMZEtPa3J4c2owZmoya2lGUkk2?=
 =?utf-8?B?MVNoY3VCd1RiTjRyOVJ3U016dzJNVm1yaFBCZ2FuOThkWDhmOGtmNlZYM3Jo?=
 =?utf-8?B?aHh0OGNDVzRpUEFFNzVtZUVTWWExbUtRS1h1bXNKQXRtNW50RVVLR3lZMWM4?=
 =?utf-8?B?d1dDU2x6d0xYeUlid2t6VW1NMkE5dDNkaDQyZXJETU9RSUJvdXhpdUR2cjVi?=
 =?utf-8?B?ME9iazA4eWdEUStQVllYeEhNYXJwbG1FT0ZRUDk4LzZGcjlJSW9JUGdEMEw3?=
 =?utf-8?B?S2dpYkR1ZWowcHFIdWFCTmNBMksxdTZuTlROS1BqN1dteGNZeHl3dTZBU0JY?=
 =?utf-8?B?aXRHRHBndnV2K0tpR1YraFBTUGxyKzQ0Q1dYQ01OODdUWDhiRUlPQllsYlBu?=
 =?utf-8?Q?XAyZljcCGCbZK/MA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2011F7FF645A5B419B72B0067B288B90@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14affa4-959f-417b-d08f-08de95694df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 12:21:04.5290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEYCtGFM0is1cuq2Lip8x3vnqx4CT6ZhJsYL7TrXqrryWnjhMAacTB4FtMpb+1v6Ad2/yG3xDJgKZxzD8b59cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7691
X-purgate-ID: tlsNG-42698a/1775650867-F4FC82A1-77D53ED9/0/0
X-purgate-type: clean
X-purgate-size: 2300
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BFA723BBEA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8zMC8yNiAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDMwLjAzLjIwMjYgMTM6
NTksIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gRm9yIHRoZSBwdXJwb3NlcyBvZiBjZXJ0aWZp
Y2F0aW9uLCB3ZSB3YW50IGFzIGxpdHRsZSBjb2RlIGFzIHBvc3NpYmxlIHRvDQo+PiBiZSB1bmNv
bmRpdGlvbmFsbHkgY29tcGlsZWQgaW4uIE1ha2UgQ1BVIGhvdHBsdWcgYW5kIFNNVCBvcGVyYXRp
b25zDQo+PiBjb25maWd1cmFibGUgdG8gZWFzZSB0aGUgcHJvY2Vzcy4gVGhpcyB3aWxsIGFsc28g
aGVscCB3aXRoIGludHJvZHVjaW5nDQo+PiBDUFUgaG90cGx1ZyBvbiBBcm0sIHdoZXJlIGl0IG5l
ZWRzIHRvIGJlIGNvbmZpZ3VyYWJsZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90
dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+IA0KPiBMb29rcyBsYXJnZWx5IG9rYXkg
ZnJvbSBhIHRlY2huaWNhbCBwb3Y7IG9uZSBuaXQgYW5kIG9uZSAocmVwZWF0ZWQpIHJlbWFyaw0K
PiBiZWxvdy4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMNCj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9zeXNjdGwuYw0KPj4gQEAgLTUzLDYgKzUzLDExIEBAIHN0YXRpYyBsb25nIGNm
X2NoZWNrIHNtdF91cF9kb3duX2hlbHBlcih2b2lkICpkYXRhKQ0KPj4gICAgICAgdW5zaWduZWQg
aW50IGNwdSwgc2libGluZ19tYXNrID0gYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIC0g
MTsNCj4+ICAgICAgIGludCByZXQgPSAwOw0KPj4gICANCj4+ICsgICAgaWYgKCAhSVNfRU5BQkxF
RChDT05GSUdfQ1BVX0hPVFBMVUcpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7DQo+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiArICAgIH0N
Cj4+ICAgICAgIG9wdF9zbXQgPSB1cDsNCj4gDQo+IEFub3RoZXIgYmxhbmsgbGluZSBhYm92ZSB0
aGlzIG9uZSBwZXJoYXBzPw0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPj4gKysr
IGIveGVuL2NvbW1vbi9LY29uZmlnDQo+PiBAQCAtNjM3LDYgKzYzNywxNCBAQCBjb25maWcgU1lT
VEVNX1NVU1BFTkQNCj4+ICAgDQo+PiAgIAkgIElmIHVuc3VyZSwgc2F5IE4uDQo+PiAgIA0KPj4g
K2NvbmZpZyBDUFVfSE9UUExVRw0KPj4gKwlib29sICJDUFUgb25saW5lL29mZmxpbmUgc3VwcG9y
dCINCj4+ICsJZGVwZW5kcyBvbiBYODYNCj4+ICsJZGVmYXVsdCB5DQo+PiArCWhlbHANCj4+ICsJ
ICBFbmFibGUgc3VwcG9ydCBmb3IgYnJpbmdpbmcgQ1BVcyBvbmxpbmUgYW5kIG9mZmxpbmUgYXQg
cnVudGltZS4gT24NCj4+ICsJICBYODYgdGhpcyBpcyByZXF1aXJlZCBmb3IgZGlzYWJsaW5nIFNN
VC4NCj4gDQo+IFRoZSBuYW1lIG9mIHRoaXMgb3B0aW9uIG1heSBuZWVkIGlucHV0IGZyb20gb3Ro
ZXJzOyBJJ20gbm90IHF1aXRlIGNvbnZpbmNlZA0KPiB0aGF0IHRoaXMgaXMgYSBnb29kIG5hbWUs
IGFzIHRoZXJlJ3Mgbm8gdHJ1ZSAiaG90LXBsdWdnaW5nIiBpbnZvbHZlZCBoZXJlLg0KPiBJT1cg
SSBmZWFyIHRoZSBwcmVzZW50IG5hbWUgaXMgbWlzbGVhZGluZy4NCj4gDQo+IEphbg0KDQpNeSBm
aXJzdCBpZGVhIHdhcyAiQ09ORklHX1JVTlRJTUVfQ1BVX0NPTlRST0wiIEkgY2FuIHN3aXRjaCBi
YWNrIHRvIGl0Lg0KDQotLSANCk15a3l0YQ==

