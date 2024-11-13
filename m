Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33959C6C3D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835241.1251090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAB3-00016X-4h; Wed, 13 Nov 2024 10:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835241.1251090; Wed, 13 Nov 2024 10:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAB3-00013q-1E; Wed, 13 Nov 2024 10:00:45 +0000
Received: by outflank-mailman (input) for mailman id 835241;
 Wed, 13 Nov 2024 10:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMWt=SI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tBAB0-00013j-KM
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:00:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2176467e-a1a6-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:00:38 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Wed, 13 Nov
 2024 10:00:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:00:33 +0000
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
X-Inumbo-ID: 2176467e-a1a6-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjIzIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIxNzY0NjdlLWExYTYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkyMDM4LjMxNzAxLCJzZW5kZXIiOiJqaXFpYW4uY2hlbkBhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7mbphoorEFe6PMGyRHLPatrekP5jFhgRf3Dr02QPhsV4AvQXpAJADz+aE/SRx9QhZ24dxzPmG49VpVoKsNDNjdr4JTgTVDWvEDfPFHwTQsXbQ7fcS5InAvoRPLv1G8p6v7oo5D+rwkuHFKrp9qUsn9jF0Jjh/GE1I43ZnKL+FowrHNo/GBvVWEddxPUJoJ2zzSk3b0gUEzl59zftmONXaAeDmDnY3z7ep7f70cj7lnmreyy3KNFb9y/SfUTJehMeCxkc5TuhToAJyjFbOXdfYiEu0wdt92hj1NuTS1lxHEi+KkxhbJow8/GqVCetYVORynAFN+tQ+rV+oV62EEy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=269Nh1SaZ7Hi3b97J6t00X4i0g2AaAf4pK9M7MzUBJ4=;
 b=DzdtXmIXn3taE3JaGWSgEkyffsrjLXDjattfIyqv8JzfafaqF6iH1W5TjXWlkem4/ciQAAMrL4HqpvCsNEOu9l7HcuWJVBwVCDnLJRg6j0eorBuDaBIIci/U68FMfHnn/PtSZsBYC2RZJULnXucQIxdZtS4egFlDpVsIYtOYkDKkNKweiFdppRTNFoajTY3GlX/YwAQRY3TcXy1qTlXE6oJ6/eYrzi7PCLFLDYYw/Nb0sajEPfwnOfNhFEzmP1XXLl5EQlXxWoPQSNDXB9r0qmKsrVi4qGbW2oVk7wHS0uHxoP/rYcnVnarRIWytUydhUkONC1eXjpe60Ng9KWlbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=269Nh1SaZ7Hi3b97J6t00X4i0g2AaAf4pK9M7MzUBJ4=;
 b=ACJG6vHOkHIrbNovF94H40KvR0apXB57LqieIdWd8lU1saaufHNC9lw5eGrf/DIMh5YZE86ClNrjBcQb9icbdJCe5xaOEIdZFXkhIlgDWznoVKsNP3ZYDlv38i18fFUhWAWNSuzzpK01YaWpeoi4GwbqLnuOpmQHaDOBVsBiQLk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index: AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwA=
Date: Wed, 13 Nov 2024 10:00:33 +0000
Message-ID:
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
In-Reply-To: <ZzRxqO3_GEgs7W1I@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8158.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV8PR12MB9408:EE_
x-ms-office365-filtering-correlation-id: ac6d911f-80a7-472a-1142-08dd03ca0385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGxFa2NROTFBVzNLd3JLNEgzZzlPRW5DZVlMaWU5NzdxNlJKcnNmOENTUk1G?=
 =?utf-8?B?M1JPSncxdUhXLzdYa2NQVEJQWk95RUVGYVVQdWVYaVUwSXJwc29OSmF0VTRh?=
 =?utf-8?B?enpEdjFUN1Rlck1tV3pzeko5cmE5Z3dTL3VQdWFMb2QwQ0hDUStWNjJTUDNZ?=
 =?utf-8?B?bVpsc09PVlQ1NE5pQTh5RGtNRVRia3dtRzQzUzVSVHFlZmNva3pnMnYxQ1Rv?=
 =?utf-8?B?VzhibkpTd2JocU1OWTROSHlpdlNVMWlEbUFUY094TExxQ3JTZjRTd0dyaEo0?=
 =?utf-8?B?Y0liZFU0ejVrUnpBNGhsR1dtTnJVZEZGdVVkaW90aFY5eGx0bHVJL0lKaHNo?=
 =?utf-8?B?WW9zbDlmT3JGaksxZjU2c2pFMmVpU241K1ZPMFlvWkdXUXBJRmpCZ09wMVhy?=
 =?utf-8?B?ckFqNDY1Rlg5R3FZcTc5emZpTWRFbUdZMTl3OHVkSnRqc0JoWS92V0dDTXZj?=
 =?utf-8?B?SEFTR1hVNU9qNCtxZ25PcEQ0TkMyT2x3emF2bVRtSVBKd2k2NmVXeUtoRnJK?=
 =?utf-8?B?VkViTjllR0JCTlR1QnRnOFJ4NGRRanl0TTNpU1o3clZncnZ4L0tTbWVwQUpl?=
 =?utf-8?B?WG5DbHRHUThGZkZFQmszMEVWOGx2eHd6ejFYR0ZTQThZRGpBTHp1TjBFSFJ0?=
 =?utf-8?B?bjlUY3l6MGpESTdmSHJkQkE4c21LQXVEZG9iUWs1a1duaHJESlFXNHUwNHZQ?=
 =?utf-8?B?OHllamJYSUlGWk5QRVpCWHZld3pOZTgxSHRXdnA4d25uRURPYkp1cDZobnVG?=
 =?utf-8?B?WDI1d2U3N0wrcnZxVU1jc2xpTGVIQjFWK1d3MSttUXB0R1ZScUdxN3RGaG9a?=
 =?utf-8?B?Uk5PRXE1Q1p2Y0Irc1pDeXR4dlkrZm8zNW9HcktDcHBDUGNqaEJ2dnZpVWw0?=
 =?utf-8?B?Sy9Yd1FFK1QrdlMweldReEM4dzhCcjhqbjhTTStWVnBERDRybmpsOUtTcjVt?=
 =?utf-8?B?dVJxNE0zYUJQbjlFOUZZbHI4aGxXamNWNXlYUGJoMWJ4WExLY3pRNGswSEpZ?=
 =?utf-8?B?ZEo1dXViNlQxVGFLaTdjcFo1eE9pSStQNDdVVHJqL3BraFVSQ0pSbDBOeXBx?=
 =?utf-8?B?NXAybUUwK2VDdk5wcmlXVGpPUHpSdC8vQzMvc2xGTFFJRkl0SU5uL29HQlRF?=
 =?utf-8?B?Qjl1bkhZRS9FSXlmTVExYmYwSkRsQU84MGdpWWRQYlZJbEIvZklNZUVCcDVF?=
 =?utf-8?B?bkh4VVRIRHZFUCt2elNuRlprUFVJZy9oZG1pZzZSeEVxZjRXVUpvRVZ5WWYz?=
 =?utf-8?B?dW9vWlVYU05MQnBtRXRlZUl2NlUwT3Q4TUJFSGtyalVLeXZ6UHRSdDUrZVJN?=
 =?utf-8?B?RUxkYlo2NmdNN1VjSU4vc1hFUzRXZGZkNVBqU0RZelM4dzhDY2lWWnNjc2N5?=
 =?utf-8?B?eVkzQlJDUVNWMUd1bStFOHNIeVBLQmpob3BVOGxMVmdhMmJoQW5aSnVUbGFL?=
 =?utf-8?B?SzN4R0VoYzVhZlgyUm83UXFpUTVrL2xrUFdPeU0yU09iSExjWlpzTDVDVjZC?=
 =?utf-8?B?b0F4WmNrYmIzTVcrZkZKUjdVRFFweHFVUHZMSFI1anhmaTh2aXR2UUZUN0VG?=
 =?utf-8?B?RXArbjY1QWpOYXl0ckJXOW5EdUJFaDgzTkd3ZWgveWpHeENERFdRc3NKbkZ3?=
 =?utf-8?B?dXluVFF3S2dhTFhGMDdyNnF0Y25FdHE3aExQWXFOUDRoOG5YandweUxBZHBx?=
 =?utf-8?B?aUEwREFUT1pNeC9icENhbnpmZjUvb0V2NU4rMHpURHdKUDRFczBjNTFMeWpX?=
 =?utf-8?B?czVOU2I1a05nSzRxaERlR3V3M2NLalAyZktlYk12WmZnVm9HbTd0QlZDZkhO?=
 =?utf-8?Q?m9B+XZGpyJAMxTQQUmtPk/8dYpQbRo0UWnBmM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RCtHeXpSYU1pL1YvdURTK3pkWnZEWU9yMGVDZVFaQXU3S1JrdXZwdEY4blFB?=
 =?utf-8?B?UWszazJPbFd4WlRaYnloUDFPVjRHZEoxWUN0eHJXY21vWGhoS3RzUFE1d3hT?=
 =?utf-8?B?MjBpbVNVdHVwUElGSUcraXhrRVVqRExrZ2RRMHlRVndIdDlFejlCcHFqcVpn?=
 =?utf-8?B?MmNaeHdEMFhHdUpvZXhYUlhTNXdNK1VvUEIxZjgwcUlVUmlBU3V1czFJUGJj?=
 =?utf-8?B?SU5iUTZJVnpoZHNkZ0dSMGZMTGlvU0FxSi9uWkZ6ZDdNbDgxS1grT0Q4T1Q2?=
 =?utf-8?B?VDRZY056QUZTaG1ETzJiS0prWDBVK0NVOGwveFFXOCtUa2N3NFYyTWhWR21V?=
 =?utf-8?B?dm1TTmh1R2N5amY5c3J4MGxPQy9sWmdjdHlvQXpBcmVPaURSTXE3SlZ2ekZS?=
 =?utf-8?B?ZUZKSnFmMkFXOThieVhhSElUczdON1Z6OHh0ZGJSSUtqZ3MrOTZ4S2ZpUWx0?=
 =?utf-8?B?dXM3S1JzcHdJem9LQUNEVVFPRTdqcndValgxUVBTc1JuOHJmNG0wM2JCdlBa?=
 =?utf-8?B?SlhpTjhqcXU3OTJFTEo2M2RlOVpWNDRNd2JOWk4ybkFscWtqWS8yeGZwZGp2?=
 =?utf-8?B?QjlxVHc3WFJWV29jaXVHYWZybnh0b1RCbmNFdFRtZjZwaWRVZlREYzFPVDRv?=
 =?utf-8?B?N2l1ZDJUcG01Rm1uUkFHeTBVUUNSTmo5dFZOT3lYUjBZMitNR0QyT0RzNzhI?=
 =?utf-8?B?MUh2ODQ2cTlWSWVzRTVCSTd6TTlQYjhxc0NwWVNsZUdYTnRFQlQzWVBwZHpJ?=
 =?utf-8?B?UXUzZFNOM2l0L1ZzWm4reXlVMC9iRTNqNTFQaCt2ZHRza09lRDBZRFp3OWpB?=
 =?utf-8?B?ekQvSDVROWl0dHFOaE5DeHBwYURzYnppQ2lSemx0SUpxQWsyalJGV3BoanVU?=
 =?utf-8?B?dnB5cWhoSnNzbDBGOHg3c1ljaFRwUndscXJHWlIwWkRQdTdIWlpXV2N2Nm9Z?=
 =?utf-8?B?enZtMFh5aXVHTy9WTFBXa0ZwOWFlQnR0R2lNaXdPYkRHVjZsbGRXSnVpbzJu?=
 =?utf-8?B?RHhuM2hDRUNScURBQzFsRlRkMXFpLzg5T1VSWmpWMDR2ZmRjdEdjN1JQVGJ5?=
 =?utf-8?B?NnNRUDBHcTI4eUFSbloyd2hSejU5UWdSUzA1OENtbXVhV2I0cCtWRkY5clVt?=
 =?utf-8?B?WlF3SVRqWHRqYkc0VW9BRjk2L0ZveHJldmt1S2tBWTBuZkFkVkNrWGRiWUZR?=
 =?utf-8?B?aTRKKytjT2p5ZjBhblFQa1BCTFZCelVaSXRhTlY5bnRaamtDVDdkN2FnWWZX?=
 =?utf-8?B?MzNqMmExOVAwcnJhb2dPR2gzekxQeHlPQlplbHFUK0J1STg5anA2L2V3cXdy?=
 =?utf-8?B?UHBBZU1PSXYxN2lPZURZSElRV1kzL0FDTE01Rm5RVlQ2RmxYUjZKRFlXd0pF?=
 =?utf-8?B?c2tzMUR1a3N6eXdNOXZKeXlCSTVPTVdlU2dlWE44MHJQeG5rSFBxZTU3cmFN?=
 =?utf-8?B?TEg3T3NWbkc4aFdUVXNuSlVkOTJvT1lxRTRxeEp1alpDcXdrZVVLNFVQUUEy?=
 =?utf-8?B?c0RBUUlJQnlxTzloMStTQzFjeDZ1anliL3Jsc252dEdmV0lRNUlhRHFUUTB1?=
 =?utf-8?B?NzZETFpBWUw5UXRuUDhuamlwa09BQmNrakNzK2w4dk9WdkJycW1XZm1Na24w?=
 =?utf-8?B?S3VOQU85ZWJXYlM3Q20wYURCS1lySUJ1MmVaazJSSWl3S1ljVnpGMGQ2NE9T?=
 =?utf-8?B?RVhIOS9jTkg0aDJTM1owb2ZqcXdvQ2hlb1A5cUROeVNsZ1BxVldWeU9ObkVX?=
 =?utf-8?B?OE5PSzE1Q3VSajVCS3B1RU5taXFLQU5uLzQ1VjJVcWZzdGhUdkx2TStxVnA1?=
 =?utf-8?B?em9jMUtEQTRqY1VmUnlDTm9rKytwcnFydHVFZW9oeEx0ZURzdGU1OVRwaWl2?=
 =?utf-8?B?OE43emQ3UDRRSjN2dHhXcnRiVWpMU1JqR3NmT0JsSkFiL0J2VkJySkd0citF?=
 =?utf-8?B?UXI3K3M0ckhmZDV0cWlnYmo0dkcxYmhsUnNvdkJwamZ0S3diQjg1TFcrTDlu?=
 =?utf-8?B?cHlTaEVyNTFSUUpyODlySDc3UVg1ZXRDVmpRRDJEcjROczRkYXJhSnRvaGJu?=
 =?utf-8?B?L0lyVXg1aWZwcHlzajRrTm0ra3d5cDFlanZlZS81UkJpWlhnYytBWUR3M2pX?=
 =?utf-8?Q?4aI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54A4D84A0FC45A46BB300BFF649C3B9D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6d911f-80a7-472a-1142-08dd03ca0385
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 10:00:33.3789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChWx8aHOTggqDzA/tIYHYsXCYoMyDFH1KqXkenJjRxG3yKTgIGoqX0jKtbMyPARFaqAtxOBrGYcOS2eQ/vpCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408

T24gMjAyNC8xMS8xMyAxNzozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBO
b3YgMTMsIDIwMjQgYXQgMDQ6MDA6MjdQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBT
b21lIGRldmljZXMsIGxpa2UgZGlzY3JldGUgR1BVIG9mIGFtZCwgc3VwcG9ydCByZXNpemFibGUg
YmFyIGNhcGFiaWxpdHksDQo+PiBidXQgdnBjaSBvZiBYZW4gZG9lc24ndCBzdXBwb3J0IHRoaXMg
ZmVhdHVyZSwgc28gdGhleSBmYWlsIHRvIHJlc2l6ZSBiYXJzDQo+PiBhbmQgdGhlbiBjYXVzZSBw
cm9iaW5nIGZhaWx1cmUuDQo+Pg0KPj4gQWNjb3JkaW5nIHRvIFBDSWUgc3BlYywgZWFjaCBiYXIg
dGhhdCBzdXBwb3J0IHJlc2l6aW5nIGhhcyB0d28gcmVnaXN0ZXJzLA0KPj4gUENJX1JFQkFSX0NB
UCBhbmQgUENJX1JFQkFSX0NUUkwsIHNvIGFkZCB0aGVzZSB0d28gcmVnaXN0ZXJzIGFuZCB0aGVp
cg0KPj4gY29ycmVzcG9uZGluZyBoYW5kbGVyIGludG8gdnBjaS4NCj4+DQo+PiBQQ0lfUkVCQVJf
Q0FQIGlzIFJPLCBvbmx5IHByb3ZpZGUgcmVhZGluZy4NCj4+DQo+PiBQQ0lfUkVCQVJfQ1RSTCBv
bmx5IGhhcyBiYXIgc2l6ZSBpcyBSVywgc28gYWRkIHdyaXRlIGZ1bmN0aW9uIHRvIHN1cHBvcnQN
Cj4+IHNldHRpbmcgdGhlIG5ldyBzaXplLg0KPiANCj4gSSB0aGluayB0aGUgbG9naWMgdG8gaGFu
ZGxlIHJlc2l6YWJsZSBCQVIgY291bGQgYmUgbXVjaCBzaW1wbGVyLiAgU29tZQ0KPiB0aW1lIGFn
byBJJ3ZlIG1hZGUgYSBwYXRjaCB0byBhZGQgc3VwcG9ydCBmb3IgaXQsIGJ1dCBkdWUgdG8gbGFj
ayBvZg0KPiBoYXJkd2FyZSBvbiBteSBzaWRlIHRvIHRlc3QgaXQgSSd2ZSBuZXZlciBzdWJtaXR0
ZWQgaXQuDQo+IA0KPiBNeSBhcHByb2FjaCB3b3VsZCBiZSB0byBkZXRlY3QgdGhlIHByZXNlbmNl
IG9mIHRoZQ0KPiBQQ0lfRVhUX0NBUF9JRF9SRUJBUiBjYXBhYmlsaXR5IGluIGluaXRfaGVhZGVy
KCksIGFuZCBpZiB0aGUNCj4gY2FwYWJpbGl0eSBpcyBwcmVzZW50IGZvcmNlIHRoZSBzaXppbmcg
b2YgQkFScyBlYWNoIHRpbWUgdGhleSBhcmUNCj4gbWFwcGVkIGluIG1vZGlmeV9iYXJzKCkuICBJ
IGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gdHJhcCBhY2Nlc3NlcyB0bw0KPiB0aGUgY2FwYWJpbGl0
eSBpdHNlbGYsIGFzIHJlc2l6aW5nIGNhbiBvbmx5IGhhcHBlbiB3aGVuIG1lbW9yeQ0KPiBkZWNv
ZGluZyBpcyBub3QgZW5hYmxlZCBmb3IgdGhlIGRldmljZS4gIEl0J3MgZW5vdWdoIHRvIGZldGNo
IHRoZSBzaXplDQo+IG9mIHRoZSBCQVJzIGFoZWFkIG9mIGVhY2ggZW5hYmxpbmcgb2YgbWVtb3J5
IGRlY29kaW5nLg0KPiANCj4gTm90ZSB0aGF0IG1lbW9yeSBkZWNvZGluZyBpbXBsaWVzIG1hcHBp
bmcgdGhlIEJBUnMgaW50byB0aGUgcDJtLCB3aGljaA0KPiBpcyBhbHJlYWR5IGFuIGV4cGVuc2l2
ZSBvcGVyYXRpb24sIHRoZSBleHRyYSBzaXppbmcgaXMgdW5saWtlbHkgdG8NCj4gbWFrZSBtdWNo
IG9mIGEgZGlmZmVyZW5jZSBwZXJmb3JtYW5jZSB3aXNlLg0KPiANCj4gSSd2ZSBmb3VuZCB0aGUg
Zm9sbG93aW5nIG9uIG15IGdpdCB0cmVlIGFuZCByZWJhc2VkIG9uIHRvcCBvZiBzdGFnaW5nOg0K
T0suDQpEbyB5b3UgbmVlZCBtZSB0byB2YWxpZGF0ZSB5b3VyIHBhdGNoIGluIG15IGVudmlyb25t
ZW50Pw0KQW5kIEkgaGF2ZSBvbmUgcXVlc3Rpb246IHdoZXJlIGRvZXMgeW91ciBwYXRjaCBkbyB3
cml0aW5nIHRoZSByZXNpemluZyBzaXplIGludG8gaGFyZHdhcmU/DQoNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
Yw0KPiBpbmRleCBlZjZjOTY1YzA4MWMuLjA0NWFhNGJkYWRjOCAxMDA2NDQNCj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQo+IEBAIC0zNTYsNiArMzU2LDMwIEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4gIA0KPiAg
ICAgICAgICBBU1NFUlQocmFuZ2VzZXRfaXNfZW1wdHkoYmFyLT5tZW0pKTsNCj4gIA0KPiArICAg
ICAgICBpZiAoIGJhci0+dHlwZSAhPSBWUENJX0JBUl9ST00gJiYgaGVhZGVyLT5iYXJzX3Jlc2l6
YWJsZSAmJg0KPiArICAgICAgICAgICAgIChjbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpICkNCj4g
KyAgICAgICAgew0KPiArICAgICAgICAgICAgdWludDY0X3QgYWRkciwgc2l6ZTsNCj4gKw0KPiAr
ICAgICAgICAgICAgcGNpX3NpemVfbWVtX2JhcihwZGV2LT5zYmRmLCBQQ0lfQkFTRV9BRERSRVNT
XzAgKyBpICogNCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFkZHIsICZzaXpl
LCAwKTsNCj4gKw0KPiArICAgICAgICAgICAgaWYgKCBiYXItPmFkZHIgIT0gYWRkciApDQo+ICsg
ICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUg0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAiJXBwOiBCQVIjJXUgYWRkcmVzcyBtaXNtYXRjaCAlI2x4IHZzICUjbHhcbiIsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBpLCBiYXItPmFkZHIsIGFkZHIpOw0K
PiArDQo+ICsgICAgICAgICAgICBpZiAoIGJhci0+c2l6ZSAhPSBzaXplICkNCj4gKyAgICAgICAg
ICAgIHsNCj4gKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfREVCVUcNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIiVwcDogZGV0ZWN0ZWQgQkFSIyV1IHNpemUgY2hhbmdlICglI2x4
IC0+ICUjbHgpXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgaSwg
YmFyLT5zaXplLCBzaXplKTsNCj4gKyAgICAgICAgICAgICAgICBiYXItPnNpemUgPSBzaXplOw0K
PiArICAgICAgICAgICAgICAgIGVuZCA9IFBGTl9ET1dOKGJhci0+YWRkciArIHNpemUgLSAxKTsN
Cj4gKyAgICAgICAgICAgICAgICBlbmRfZ3Vlc3QgPSBQRk5fRE9XTihiYXItPmd1ZXN0X2FkZHIg
KyBzaXplIC0gMSk7DQo+ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgIH0NCj4gKw0KPiAgICAg
ICAgICAvKg0KPiAgICAgICAgICAgKiBNYWtlIHN1cmUgdGhhdCB0aGUgZ3Vlc3Qgc2V0IGFkZHJl
c3MgaGFzIHRoZSBzYW1lIHBhZ2Ugb2Zmc2V0DQo+ICAgICAgICAgICAqIGFzIHRoZSBwaHlzaWNh
bCBhZGRyZXNzIG9uIHRoZSBob3N0IG9yIG90aGVyd2lzZSB0aGluZ3Mgd29uJ3Qgd29yayBhcw0K
PiBAQCAtODcwLDYgKzg5NCw5IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9oZWFkZXIoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAgICAgaWYgKCBwZGV2LT5pZ25vcmVfYmFycyApDQo+ICAg
ICAgICAgIHJldHVybiAwOw0KPiAgDQo+ICsgICAgaGVhZGVyLT5iYXJzX3Jlc2l6YWJsZSA9IHBj
aV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9FWFRfQ0FQX0lEX1JFQkFSKTsN
Cj4gKw0KPiAgICAgIGNtZCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFO
RCk7DQo+ICANCj4gICAgICAvKg0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaV9y
ZWdzLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3MuaA0KPiBpbmRleCAyNTBiYTEwNmRiZDMu
LmM1NDNhMmI4Njc3OCAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgN
Cj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4gQEAgLTQ1OSw2ICs0NTksNyBA
QA0KPiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9JRF9BUkkJMTQNCj4gICNkZWZpbmUgUENJX0VYVF9D
QVBfSURfQVRTCTE1DQo+ICAjZGVmaW5lIFBDSV9FWFRfQ0FQX0lEX1NSSU9WCTE2DQo+ICsjZGVm
aW5lIFBDSV9FWFRfQ0FQX0lEX1JFQkFSCTIxDQo+ICANCj4gIC8qIEFkdmFuY2VkIEVycm9yIFJl
cG9ydGluZyAqLw0KPiAgI2RlZmluZSBQQ0lfRVJSX1VOQ09SX1NUQVRVUwk0CS8qIFVuY29ycmVj
dGFibGUgRXJyb3IgU3RhdHVzICovDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdnBj
aS5oIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPiBpbmRleCA0MWU3YzNiYzI3OTEuLjQ1ZWJj
MWJiMzM1NiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+IEBAIC0xMjksNiArMTI5LDggQEAgc3RydWN0IHZwY2kg
ew0KPiAgICAgICAgICAgKiB1cG9uIHRvIGtub3cgd2hldGhlciBCQVJzIGFyZSBtYXBwZWQgaW50
byB0aGUgZ3Vlc3QgcDJtLg0KPiAgICAgICAgICAgKi8NCj4gICAgICAgICAgYm9vbCBiYXJzX21h
cHBlZCAgICAgIDogMTsNCj4gKyAgICAgICAgLyogRGV2aWNlIGhhcyB0aGUgUmVzaXphYmxlIEJB
UnMgY2FwYWJpbGl0eS4gKi8NCj4gKyAgICAgICAgYm9vbCBiYXJzX3Jlc2l6YWJsZSAgIDogMTsN
Cj4gICAgICAgICAgLyogRklYTUU6IGN1cnJlbnRseSB0aGVyZSdzIG5vIHN1cHBvcnQgZm9yIFNS
LUlPVi4gKi8NCj4gICAgICB9IGhlYWRlcjsNCj4gIA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

