Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FD9D58C9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 05:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841721.1257215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEKu1-0004Ob-ME; Fri, 22 Nov 2024 04:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841721.1257215; Fri, 22 Nov 2024 04:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEKu1-0004MU-JZ; Fri, 22 Nov 2024 04:04:17 +0000
Received: by outflank-mailman (input) for mailman id 841721;
 Fri, 22 Nov 2024 04:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qp79=SR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tEKtz-0004MO-Pc
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 04:04:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d333c57e-a886-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 05:04:10 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 04:04:06 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 04:04:05 +0000
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
X-Inumbo-ID: d333c57e-a886-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjA0IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQzMzNjNTdlLWE4ODYtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjQ4MjUwLjYyNDgwNCwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J91b0C8zbNf3BhGHob60HFDVqZQ+gt1cqZWnprsIZZehdK1UrFQVEP0731hCFzXWgoa2flT0qT5KHgpHKKDpywe+wVqxBMLIU+ws71d/ijmCAnQlp01qTt5I13+wljLyXhwBT2UePmFhTSMWWpXzlSZazXtOk75Bmp/W61pkjpaQzk6sq6ReDGq1zPp/lNQfI55tO8BwYGlshx3/gPvXNFoI7zaxpF1MTdc5LN0kJdTk4rtM68DmOC40+iGU4AuDX+o707Ihly3JddG40aOPYNZvL3sw13ZNXklGjWP63pnpj0N+7C0iRWrZTEjSbp5g+eKmfRe53g3kgBr+56vV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDIcTKJ/go7ZVc4NvHftzsocvz89//26lnWjQuq+xx8=;
 b=XylZoXc0o0S5lgLPfMzhftdujqoL/s3KlGDReif7KDU2Gq8dvZ/dHemo03dmypV3K3nUbbHL4yD6uHeouyaJ8zm1ZIU1Ex764N90HkmcMMsOnXiw76B9rJ/idkpJ+JrpIuzrkJ8mbgrKXu9XZ2yFDGLvt3yoTghVK45sWDIN1+LjP06BhmcboHNLJnaNSsCUpFPuMKS5jMdOBb2VGlf9OpnM27AZnmXaK7suKNCUDH1NzTiMUzi8HtXBfyZWQkl1VhfepUWeKSEINIqEHbDjLjHwru2SI2nKGhdzhiBobDm9KujYG97fU5irG93HUWt1JEu2iIMnJ1/XD4cxDfbBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDIcTKJ/go7ZVc4NvHftzsocvz89//26lnWjQuq+xx8=;
 b=yxYX5n4vm045lzikVSREXF/8zRATxD8wq7mvb9njOVkUfX9DTBr7vAegqtGEYZH/pbfhj7JZX9Shdsa6jrS6jItFok+wUcWNPl7BT69NY4R/kavt03FFdukC5mah41t0UtzqtR3vG8S7O+CmONulVKE2LsCV0XUpjLI2q8RvsTo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index:
 AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwD//4ZQAIABzRcAgAAfLACAAB0/gIABIxcAgAAMOoCABNwTAIABfwWAgAFxTQD//+JeAIABss4A///tiAAANs/tAA==
Date: Fri, 22 Nov 2024 04:04:05 +0000
Message-ID:
 <BL1PR12MB5849786A66C48A85202F40C5E7232@BL1PR12MB5849.namprd12.prod.outlook.com>
References:
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook> <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
In-Reply-To: <Zz8Cwj3KJ1BIBEg_@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8158.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB6822:EE_
x-ms-office365-filtering-correlation-id: 92e1d46c-43b2-4023-38c4-08dd0aaab508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWtpRmlVazBwcDVNd2dTblU5WnR5VXBNalExcEVHOCtIMGZ5bkF5eERvM0Ji?=
 =?utf-8?B?czk4ZlEyL2lLS1V4Ym5FYTdEaVdZM1lwSC9CSW4vTEZZMzV3cUxvcHZPaXRt?=
 =?utf-8?B?VEVMczNRd0taeGVid3U0MTA4Tk1qT0Q0Zmk1QUhRSUx3d3ZnelJNYldlMmNR?=
 =?utf-8?B?bnE2bVRKM1FubHk0bXJnYXJhQWtsaGFoUlNRbDFLRFUvN3kwVkgyVWNKY2x2?=
 =?utf-8?B?Z0ZKRi9HOUlsd25yNml5TElBS1hVSUI2VnhrM1ZObkR0ZGxHYThrbVNISWFv?=
 =?utf-8?B?eWtjVVBkajNzeU54K05seWpOVkdRSUdtNUZTdkJVS1IvMWpzenhvR2VuVllr?=
 =?utf-8?B?b29sbGVHSXBjR2lNSmRyQ3FqVStaNzRidVVTa1AzRFlYMXRQVU9PTGlkVE1C?=
 =?utf-8?B?K2J0akN4M2xDUWIreFNTNG9UNmU4bVhHRnZrcG83SHdKV1FsdkxyQ0J4dEQ4?=
 =?utf-8?B?NUsxc242V0dlaHlWYWVqMk1rZi9kczV3TURwcThsakhVYy9aK1R0eGlTaVRH?=
 =?utf-8?B?Q204T3BHZy9Xa0s0TXY0VGlJaTQwWUpMQ29nbmZiRyswaEVhUVVOcWx5ZVJy?=
 =?utf-8?B?OVZ6dlR6MzgvQTY1cmFPZG1sRStxNzVKVGVoZEJFMU5HRG9zM1Z4L3c3enJn?=
 =?utf-8?B?bnFrUnRUSmdnckpYbWJybWNhWnRMdFJWQmRuOVVLbnd6aFAzdDhyNTVpSW1x?=
 =?utf-8?B?dkh4WUhlbVhNQTFiQVppSTJXci80ZFFkVFZ3YlVCUHk1eWNoY3BYM3hnMEJV?=
 =?utf-8?B?UmRYSXNRbzVrMmVlNWM2cnpjNm02L2gzK3RkdU5OTi9hUGpMK1ArcURsc3M3?=
 =?utf-8?B?b0pCdjkrcG5CTGFuUGVlL1AxWG5tYjJDckhEdjl2RFFaTXgwNWVlRnE2NVFL?=
 =?utf-8?B?aTVmSTREY0djWnVSb1VYUXBYR0V3REpUbDgwL2FiTjhoei9XRjlUMjlxczRs?=
 =?utf-8?B?bjdoYjNLWGNiNzVDcGR0L2laUjJqcmpWY0ZWZjJBMWlkRDJ3YWRua1FlRVB5?=
 =?utf-8?B?Qlg2cnZJYVNDOWxlOWsyUlBHYUo3bUJRK011REkvbGFKMjdrZGdicG52alRB?=
 =?utf-8?B?STFodHRrczJMYlppdkt3dGJPN3A3VW15ZFM4S1N3UjVVUkRvb1ZEK2l6R1lC?=
 =?utf-8?B?cWJRNVdaWHFLU2xZWktQRHR5RmNDdGRwOVJHUVljT3BtQ3JXSUlVKy9lSXVl?=
 =?utf-8?B?dnNYRXhWb2haUndaNVFFNHhKQy9tWGVSQXRVNEdNRmh6b1ZtNTk3UDhqNDV1?=
 =?utf-8?B?bTVnN1Y5aklxclNNMG1PUHhFWUhaNkdYcFVjdFZWT3hRZE0xYlFyc3NBN1hC?=
 =?utf-8?B?L0VkSkNJd2ZQRHNHcVdGU2xqOUVyd1FLVUxEN3ZHK29aL1N3U2xlS0dDdkJ3?=
 =?utf-8?B?Y2RELzdvYlZoRmhCN29HczJCZjVPUkhJRlc3cUp0V3B1ZVAzZ3JKaU1hdDVj?=
 =?utf-8?B?ZWQ3alJwbDQza0paTE5KaEhPUW9NUXRsY0I2d1BZZTROK29wTWtTdGExMzlU?=
 =?utf-8?B?RVFPNnFKNll0dFhoUHBBd2UxZVhRWm1FOUlVeG9BalpqVmFXTjdiVTBOK0JU?=
 =?utf-8?B?ODZTdUxnV1duY0xrUlYxMFJ6VHNqZCsvYXY4RU9URmNLaklEZ1F3TzB6aXZw?=
 =?utf-8?B?TzlSRkZpbGhvcGl3c3RZQ3JvQlFJWU5FdnNiR2d4bkhnRDJ3Z1psT0x1Yk05?=
 =?utf-8?B?aDd0RmhYOVRpUFdHMUlPVmhGZHNHL2lHQWppZUlJZUR3K21SOUJpcGVnc1Fl?=
 =?utf-8?B?RXJhbmtJUUJka3V3REx4bElWUC8rQVZhRFQvUTBFTktJUGZuZWFCWVM4M2Q4?=
 =?utf-8?Q?VnS7XhwMCt+R7uCqy/z0cQMKhJ9RaWDTFOm5s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGFoNXFEdDQ1N2VBSmgyWFpob0ZYdE05Mzk1aE43ejJHQjY1bEYyZUdzQS9O?=
 =?utf-8?B?SE1NTnNFOXVJZGpCZmNhMlczZ0xyWEJ6TmwzczFIQWUyemF5YmNnOVJNWjB6?=
 =?utf-8?B?ZmFONFNlc0JVTzhmaE9kN2VxNzhQcHVXOVRoa3JMamtiRHhDNGJySXhzcE5q?=
 =?utf-8?B?c0VLaG41SHc2N3hNMUhLNEdWVWp4QTBRRnI5ZTYyLytxM0tyTWdkSWhjMC9E?=
 =?utf-8?B?TTZmMmRCWmZwc2lZenQ0QnNDc2lBbDd3bmxreGtxK3VmeExBczN5a2xPaXlw?=
 =?utf-8?B?RjFWODNGQ3dOZGNBN1U1bVRYajRpblY4ZytnQTRKOHhxYzh3THI5UjRsSk5H?=
 =?utf-8?B?NHdMbVlWYkZoanB5SW9iQS9CSHdRVDR6cGdxN2JsUWVlTlVUNW50R3NqTVUz?=
 =?utf-8?B?UGo4QW9JdW5wUnMxS2pteEl0Zm5Gak81a01JZzdDVWFLbHZzbmtHVXBUZHZz?=
 =?utf-8?B?R0dtK1IvaXZROVVIdmVMV3NRTlJWQmhub24wMHNwRUt2NXZGSjlmaWs1MEd4?=
 =?utf-8?B?c2F0TVlXa1lEMUZjU2N4U2dzSzJZSi96WHh3eHhUSU5sQzI3dmxRMFRvdHpz?=
 =?utf-8?B?a09JamhxeDF1cjdUbXJxNitqTXhOc1ZOenU1RHlUU3RuSSs3aGNzVFpPeWh1?=
 =?utf-8?B?NXo1S0N1bmQ0MDNIc0UwZ3N6KzhqZjFtMXJWU2FpRk0wN3JIb0JEYmNTUUt0?=
 =?utf-8?B?dW5BWEthTVhXSFBOL3Y5eE9zSWhvTndiM25YTXd0UkJhRjlwTzVyenNCaTVX?=
 =?utf-8?B?SzNtYmdlVHZtaFZNOEgwSVRBdUp4TEFvV2I5aVFXRGdpcFdKOEJFSTRxcmd3?=
 =?utf-8?B?NktJU0dvWTgrTlN4OGxzTzJYazJWd0VPQjM0Z0dzNFNWRWM3dFZaOWNBQUhk?=
 =?utf-8?B?QXJSSFdnQTBBZDVDYzlMNW1PR25ENklETThNam0yYWx0M0NoNURwNnZ1dGpi?=
 =?utf-8?B?Nm5zN1BTUE9OaXpKZWJmaFJKZ0tLUTV1cHlzRmIxNkNFQk40K1FJbk45bGsx?=
 =?utf-8?B?ZDZwUHJTZVNZV2k5Y1FVaDlXcVd1dGJsMGpRRmYzSCtEUXFMMzNPb09BSWlU?=
 =?utf-8?B?Q05mOEV6am5vMTJ3ZnRCY0wyalcvTnpHa2tnQ1hjbkE4VmFQeDlsZXBZUW9C?=
 =?utf-8?B?SnRtaWhXWXVSL1cvTDFvSU4yWXUvdUROWkdCVys2UHBYRzUxNTRGa0NoWW1o?=
 =?utf-8?B?d3B2MURPcUVWdXE0WEVCZ3hsRjZueFljSU9JdHNmTy9DQk9jUUFZMU5vM0ds?=
 =?utf-8?B?T2ZLdHAyNWxNeDVnQlZQVkgvMXZma1ZJMWFHYlRBenBML3lIcm43eW8xRDFJ?=
 =?utf-8?B?OGF4alVzWVE0dURGYmtiV3ltR3M1dkc4RjRzc0k0UzJJTHJYUDlGK1RiVEhv?=
 =?utf-8?B?cnFieE5KczQvWE50OVNrWENCM044YjQ4V3dweDhIdDlxSGV0MmtkMlBMV3Zt?=
 =?utf-8?B?NTgzZlhJMFRXRTdUejB6UStwU2pWR3pWdUtQd0d4ZVdnUGdDTGNlN1NCKzlR?=
 =?utf-8?B?bzI4MW5aN0s4K1ZBWnI5S1hmZ3pvNGtKK01DQlRoS3JXWjBtOCt5Uzc1RTNp?=
 =?utf-8?B?S2xmT2FROXJhSWNoK0R0OCttcE0rZFllWWxVUUVYM1lvMWw0MGIzZDBPaDBt?=
 =?utf-8?B?a2Jwa3FULzFueEVOaG5PcDRIbDRLU1BTVCtHSHY2MWRSRmlWNTNndE9pMTJV?=
 =?utf-8?B?bW9UQjFxZ2tnMzA4UHRnamtRTmxVQzl2UlAzSFU2ZmtyK3I4TVFweWNRN3N1?=
 =?utf-8?B?cDBkTkcrNkg2VnpOWURETTNua1FwOElVSDIvT25mV1VWT3BpeUtvS2JhV2lR?=
 =?utf-8?B?cWZWdm5VTlVsWThlWVlITEhQS1VzRTNvemNrQ0Z4SjJPdUxxd0VFZ3hjazNO?=
 =?utf-8?B?SlR2UURWMk1MaW5pYWduNGo2WTFaK1JSK3ZRQnVvcmRmbkRGWUEvSXpsZCtm?=
 =?utf-8?B?TDVCQzlyT1BSQlkrMVpIOFV2eHZiRWg0SmZkdDVqaFJOM0xqeWhsUjl4dkNZ?=
 =?utf-8?B?UTJUYUxiWXB5dG5hM2JYVEtMVm9rVW5sN01xNkNqYkp5SDVUa2NzQjI1YzlN?=
 =?utf-8?B?dnpmTGp5amdiSzhsaHUvSWNIV3lNaVVXWnpZcGVhRmJCSi9rSWkzdFJhVEFR?=
 =?utf-8?Q?T5VE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEBF930B7478A646ADFCACDAE38FFCFA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e1d46c-43b2-4023-38c4-08dd0aaab508
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 04:04:05.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1SKjewz0brVe3ClCPZ3b/Qd96fOv2/UIoobgMz41Ze8QlJ38aUAMqy3zlRIrahmdFddyvk7knxF5flYqJ7f4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822

T24gMjAyNC8xMS8yMSAxNzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMjEsIDIwMjQgYXQgMDM6MDU6MTRBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
T24gMjAyNC8xMS8yMCAxNzowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQs
IE5vdiAyMCwgMjAyNCBhdCAwMzowMTo1N0FNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+
Pj4+IFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiBvdXIgbWV0aG9kcyBpcyB0aGUgdGltaW5n
IG9mIHVwZGF0aW5nIHRoZSBzaXplLg0KPj4+PiBZb3VycyBpcyBsYXRlciB0aGFuIG1pbmUgYmVj
YXVzZSB5b3UgdXBkYXRlZCB0aGUgc2l6ZSB3aGVuIHRoZSBkcml2ZXIgcmUtZW5hYmxlZCBtZW1v
cnkgZGVjb2RpbmcsIHdoaWxlIEkgdXBkYXRlZCB0aGUgc2l6ZSBpbiB0aW1lIHdoZW4gZHJpdmVy
IHJlc2l6ZSBpdC4NCj4+Pg0KPj4+IEluZGVlZCwgbXkgbGFzdCBndWVzcyBpcyB0aGUgc3RhbGUg
Y2FjaGVkIHNpemUgaXMgc29tZWhvdyB1c2VkIGluIG15DQo+Pj4gYXBwcm9hY2gsIGFuZCB0aGF0
IGxlYWRzIHRvIHRoZSBmYWlsdXJlcy4gIE9uZSBsYXN0IChwb3NzaWJseSBkdW1teT8pDQo+Pj4g
dGhpbmcgdG8gdHJ5IG1pZ2h0IGJlIHRvIHVzZSB5b3VyIHBhdGNoIHRvIGRldGVjdCB3cml0ZXMg
dG8gdGhlIHJlc2l6ZQ0KPj4+IGNvbnRyb2wgcmVnaXN0ZXIsIGJ1dCB1cGRhdGUgdGhlIEJBUiBz
aXplcyBpbiBtb2RpZnlfYmFycygpLCB3aGlsZQ0KPj4+IGtlZXBpbmcgdGhlIHRyYWNlcyBvZiB3
aGVuIHRoZSBvcGVyYXRpb25zIGhhcHBlbi4NCj4+Pg0KPj4gVGhpcyBjYW4gd29yaywgY29tYmlu
ZSBvdXIgbWV0aG9kLCB1c2UgbXkgcGF0Y2ggdG8gZGV0ZWN0IGFuZCB3cml0ZSB0aGUgc2l6ZSBp
bnRvIGhhcmR3YXJlIHJlZ2lzdGVyLCBhbmQgdXNlIHlvdXIgcGF0Y2ggdG8gdXBkYXRlIGJhcltp
XS5zaXplIGluIG1vZGlmeV9iYXJzKCkuDQo+PiBBdHRhY2hlZCB0aGUgY29tYmluZWQgcGF0Y2gg
YW5kIHRoZSB4bCBkbWVzZy4NCj4gDQo+IFRoaXMgaXMgZXZlbiB3ZWlyZGVyLCBzbyB0aGUgYXR0
YWNoZWQgcGF0Y2ggd29ya3MgZmluZT8gDQpZZXMsIGl0IHdvcmtzIGZpbmUuDQpBbmQgSSB3aWxs
IGRvdWJsZSBjaGVjay4NCg0KPiBUaGUgb25seSBkaWZmZXJlbmNlIHdpdGggbXkgcHJvcG9zYWwg
aXMgdGhhdCB5b3UgdHJhcCB0aGUgQ1RSTCByZWdpc3RlcnMsIGJ1dA0KPiB0aGUgc2l6aW5nIGlz
IHN0aWxsIGRvbmUgaW4gbW9kaWZ5X2JhcnMoKS4NCj4gDQo+IFdoYXQgaGFwcGVucyBpZiAoYmFz
ZWQgb24gdGhlIGF0dGFjaGVkIHBhdGNoKSB5b3UgY2hhbmdlDQo+IHJlYmFyX2N0cmxfd3JpdGUo
KSB0bzoNCj4gDQo+IHN0YXRpYyB2b2lkIGNmX2NoZWNrIHJlYmFyX2N0cmxfd3JpdGUoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IHJlZywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCB2YWwsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqZGF0YSkNCj4gew0KPiAgICAgcGNpX2NvbmZfd3JpdGUzMihwZGV2LT5zYmRm
LCByZWcsIHZhbCk7DQo+IH0NCldpbGwgdHJ5Lg0KDQo+IA0KPiBBbmQgaWYgeW91IGRvbid0IHRy
YXAgYW55IFBDSV9SRUJBUl9DVFJMIGF0IGFsbD8NCldoYXQgZG8geW91IG1lYW4/IElmIEkgZG9u
J3QgdHJhcCBhbnkgcmViYXJfY3RybCwgaG93IGNhbiBJIGNhbGwgcmViYXJfY3RybF93cml0ZT8N
Cg0KPiANCj4gSSdtIG1vc3RseSBpbnRlcmVzdGVkIGluIGZpZ3VyaW5nIHB1dCB3aGljaCBwYXJ0
IG9mIHRoZSBjb2RlIGluDQo+IHJlYmFyLmMgbWFrZXMgdGhpcyB3b3JrIChhcyBjb21wYXJlZCB0
byBteSBvcmlnaW5hbCBhcHByb2FjaCkuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJl
c3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

