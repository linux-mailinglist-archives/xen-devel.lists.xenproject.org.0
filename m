Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44E9D322E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 03:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840904.1256439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDaUM-0005II-6m; Wed, 20 Nov 2024 02:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840904.1256439; Wed, 20 Nov 2024 02:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDaUM-0005F7-2m; Wed, 20 Nov 2024 02:30:42 +0000
Received: by outflank-mailman (input) for mailman id 840904;
 Wed, 20 Nov 2024 02:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jnlo=SP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tDaUK-0005F0-10
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 02:30:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2413::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c68bcd1-a6e7-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 03:30:37 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 02:30:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 02:30:33 +0000
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
X-Inumbo-ID: 6c68bcd1-a6e7-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjJjIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZjNjhiY2QxLWE2ZTctMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDY5ODM3LjAxMjA1OSwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6Y6GO7HzzK96TdXmVy5v/H0j+d0Gvexg3Skx8d4l90gPJWGGeqfDERFdHZwhQjegX1FTuswht7dqOFDuzAUO2xsiogy/KYuNc9Pu/9JZSULYWL95J5+Tborjeoz3XsULiQ8SIlvsy8mA9LRQtOHH4uwB1ukfV8ixzziblUQ1ILEXllck+sR7x6GpuaZTE0sDwxvtkJMbDOysOUiHU1zyyO4XmfoldUkdj8ZmTRu3VqdNoyKAL+Eu3/pdVUyPPfLYhrNwFNdhRlwmDiCwK6djk/FJ5Fd5oUCwviI8etI4mm/bmdVazJwEcMkjTHrWHVH9Iu2y4welMCW0mDbUo09Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jPBUrTd06Wur0MXGVdCn8qfBtXDMUIBvpmPwnvCJAo=;
 b=lWo3+7E9cyC7/lwkJD3RVx95GZ3sLtMSBeilMptHpTWnx4t/MZ1BURDbMYosu2HkpAG1PWxhqnEAUq88fnzsoxhX7INtFs+SwGQnZu3AhjQsQgW/k/+V7HjrQrLONMNzek4aOCYXwyczW6ma0L4l4xc3uXJ7Mfvrd/lBmhEhocZ25jkXYP8QupQQtniCDRsWZsZWyfFzCOPVvBOIC2pf8sm1FqutemSUx0YYLX1N5iVSuAv96aCuj8DWvWhTTxrfJ58wvDwO/1JmcTLzmiRM12FD5gtuEDGxmFyoF79wbiaX507fuGZIHYyPM6jXzmYFPqjyX27q5OnxWVDfsp7CMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jPBUrTd06Wur0MXGVdCn8qfBtXDMUIBvpmPwnvCJAo=;
 b=CK9sZwNtAkhTJVUEX5nWtDRjGnQcBdPKwOcpVDriQeCiTX8hxlKjlZR2jLUUfLpPdRYJw422s0WjqX+Mx3D9PHYkmiFcJLxi2xoKdPi+/q5WPiqwwLf6FzCdRWYjQ5uH7E5OwaJrL+FeLmalqJNIsl8BoWgz0hT3lFFRBYO5V24=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index: AQHbNaIlMxf8mJcywkeNRFmHEai1qbK+mCKAgAFqAAA=
Date: Wed, 20 Nov 2024 02:30:33 +0000
Message-ID:
 <BL1PR12MB58495B6D78F5D63180552BACE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzyJu9mrwJhDJClE@macbook>
In-Reply-To: <ZzyJu9mrwJhDJClE@macbook>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9337:EE_
x-ms-office365-filtering-correlation-id: 7bb66072-d3c0-4511-4486-08dd090b4f27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2dXL3pqQksxdHZxTmwzZjR1UG9sMWNVa1ZWdGl4UWpISXRCeUFUT2Y3WUxs?=
 =?utf-8?B?UkRTR0pnNnJaQWovN01xdmFOd3lpYXdhR3BYYVhtaVQ2RXBxRERuL3VDRFdy?=
 =?utf-8?B?ZUUycUdrNEFZWkVKdHNxUVJQREZFenBOcXpvd3FyRVZwUHBLSXhxTzlQS05i?=
 =?utf-8?B?bE5wZ1F6aGg1QnlFbHEwSVdYTHowTk80L2FMVk1VL0lhbzQ2T29mRzMxVjJq?=
 =?utf-8?B?WGtKWXZaOVJBRHgzVmc2NkI1NGVSQTM3d29MdmRudnJzTHFFOHJYcWsrQUJs?=
 =?utf-8?B?eldtQjhnYWNxRkQ0Vy9LRjhiMEp5aSs2V1RyOTJ0MUx4NDd2QndERG9FclhB?=
 =?utf-8?B?amwvM21nOExhNUZVZnIyRVI4bHFQNFZiWnVIUmJwclRXMDVVZEtLcFNYcjM4?=
 =?utf-8?B?LzRxWnhHOUJXUHU5SVJhY3BoZ1R4ek4rUXRydXd3enY0ZW42dktZS0FZYitX?=
 =?utf-8?B?SElETnpWTXBYdVh3RExac09EMVRXTDVMV2wwbnFlN0RhU1duVWlBUGY5U0V4?=
 =?utf-8?B?Y0FLUUs1clFZNDRYVmN0RU5WZGw1dy8wTkFVMElTYmRWdU1VYW4xdzBtbkRI?=
 =?utf-8?B?MndXbjZKV2kxWkFYRUJVeHN6b3l6c1EyZlhBL2d6U2pkbmN3dXprRnppeGZP?=
 =?utf-8?B?L2lRUTRQcFZXeUFMQ2FSV1czOHBjWnRXYVd4eDE3SGJ3VFRJbmROcjF2STh6?=
 =?utf-8?B?cmJSaFlhUXFERHNQK2xUWlZzR3dnSm85Z3M4NkFpOHhlQTBjOTlNQncvR01r?=
 =?utf-8?B?U0Q5MDRzcXgvUDc0VGM5Sk5YYmVqbzlvUWZjc0FtUlpKVllvbW5TSlplQ1d3?=
 =?utf-8?B?VUNvVVp4TWhmeEl3Z1BGSlpteC93ZEg0QmhnN1FZalhRbVRHNnpZRFpLT3V2?=
 =?utf-8?B?RVBKY3NiUmtJWUhkcXBmUGV6c1FOelRSSDZnZU92Y0NoMTZ6bGt2VENqclZX?=
 =?utf-8?B?V3dYTi9KVVVOT2pXNE9tVU1lWncyQ1BkcFNiYngrU3d0Z081eUhwc2VsVi9v?=
 =?utf-8?B?Sm56ZDFMbXYrQjlXNmx2TzlvNVpTaFNuKzU5NUkyUGhwU0NJVTkwcEZxRGRH?=
 =?utf-8?B?ZG5ZaU11bmpXakhDbk1MVHh3NDliTnZKdmFtRmZQOXdaTWx1WCtkUnVlQzFY?=
 =?utf-8?B?TjEyaU43cFlUdENkQnhnUWtEUXFnUEhHbnlvaSt6azJtYVlIZlRsYkp4dkhn?=
 =?utf-8?B?WmhLT2JraGV2dUVCMGZrVTBJTG9qN0lLa3JuOWx1RE5PYnppdk56QXZJeFdu?=
 =?utf-8?B?RUxVRlM3L0M4MHpSWEl1UUVOQjAzVDMrQk50aFc5YkpxVC9sQUozbEFiWGZW?=
 =?utf-8?B?RTV0SHVIclF6dkJDSWc3dHMyTWpUS0c2dDZmT3V4T1pGdUFxdDhqcTQyKzBq?=
 =?utf-8?B?RUJrOWEweDhRMjJmeC9BNlRZc3ppeFBBenRDSFM4VWlsbU1iM3dEd1JORThQ?=
 =?utf-8?B?RlZmbVZxQnczUVhCOG15Sm1adEl6dnFDWTVIQW1wZGEzOGZjYUt1aENKMGdt?=
 =?utf-8?B?ZGQ4UTNsbFZMVVh5UHU2QUFReUQwK0NMSUYwR21jTHMxTmRKVGJlVHRBUk5F?=
 =?utf-8?B?RzkvS2NuTEl2bUI3aEthZmNXRzhkUmowUXhVZk9JTjVnRHIzc0xiMUpVaFJU?=
 =?utf-8?B?amUxQUxNanRKQmdJeTltVXhOR0p2RU5rUC92aWNEMXJkcUN6dDk5ZHZHTEVS?=
 =?utf-8?B?TVRQTm1MbVM2aFhDTWpqVUxwRUVDNGxxOGlKMVljYVdGNDVGeDYzTk1TbW5J?=
 =?utf-8?B?UllkbFVZQmI5WElIMkNDWWgwZzFOb1NwNEUrSzVCZjZ1MmFjYWRuK3VmSXU5?=
 =?utf-8?Q?dXRe6k5qogtVYjoNGb/EjCDl4TuwkO/rxDFgA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3BqQlRDUDdUVFUweG41L1R4enBtMmxxbkZ5WGJUMUxLa2dQdUR6K2VKd1Zq?=
 =?utf-8?B?T3VEOVBYa1lIVlhQc0tEaW9Sb0ZlMmFIbmptNjNZOENZVERvVWg1ZHlVNXpi?=
 =?utf-8?B?a2N6NVp2Qmhja1NLT3ZLVlB5S04reHpuN0V2dzlkSlVBUVdRZCtNT2VyVjRv?=
 =?utf-8?B?Ny9PbVlDZ0JSOXJwak0rTSt5dG8vRmkrdXIvUUI5anFHWGxhQVhyVlNGS1Bo?=
 =?utf-8?B?ME9nT0VvOUpta3JYR1dRdnpyNjVSNlNRbDd0OFAvTUJ1dmNrT09jdC9yNldo?=
 =?utf-8?B?bERuSzRjQmVnVks5MVVSZE55dEpvYmZjNEtXZktUTU5Kb0xscmpabjA0SHdx?=
 =?utf-8?B?dVEwZ0tmdU9ld1F6b214SVRKOUl4djJMWkViRUh3bVN5Q00ySEVFTGl2dTBn?=
 =?utf-8?B?V0JjL0hRRFlNaDZNVWp5eGNqVmlzZmcxRXVHNTVMc1RyUE9XK2I4TEpFRmt1?=
 =?utf-8?B?dWw5UUdyZjQ5UUw5Vk9CYUdMcE9NN1dVVFowL1dXcGc4cWJGQ21NTDBoTkhq?=
 =?utf-8?B?V1NqYWx6NDF3ckx0ZUNia2x5cGxxZ3dJS2FxcU5Jb0NCYXZJb3RZR0hmdURy?=
 =?utf-8?B?Mzg4a2I2NzVMUmsxQm1HbXVYZWE3ZE9ieWlqV2NiV01FcDBjbjYrWFU4MFNT?=
 =?utf-8?B?cG9iVjk2bjFqcWd5OERocFhFa2Rwa0kzSDB0MHpETXAzMnMyYThRbHUvNU9S?=
 =?utf-8?B?QzZMREdQalIwaXAvZnNsRjlDOFZCM0EybGNGYys5N2kxNHQrdTZramFHL3Fp?=
 =?utf-8?B?NTVEWTVka2VWZlR6N2FpR1VMZHlXL3NrajMwUFlsM0VmWEZ0eWR4b1QzVENE?=
 =?utf-8?B?SlpDQjQwSXlBOVJjbEozdmhVNFhCU2pMNXFLWko4eVVqOVlZbUw1aGxWSmpi?=
 =?utf-8?B?VzZOWFpWa1FETjNGWmhrT3h0OUJ0MysyOFhOVnFUTnJhdDdOSUFhby90N2hK?=
 =?utf-8?B?UmNZQmJUQSsvWjZSSnlFWnVrWXdZbCtNODZld2lzcTNob296TC8zdXA4QXFU?=
 =?utf-8?B?bXhvQWZtYmY5aUlRR0JlNHhJbFhyd1F5REJKalBsZGNzeGJKenQwTW8ydlpq?=
 =?utf-8?B?S0N5M25sWENVc1RXZVNQY2NlZ0RLckpoZjhjQjBmU3F2NUpWWkZ0UTBuenB5?=
 =?utf-8?B?dTR3b0VlVStEOWNPUTd6Qk5hRkRHOWRIUENVTDlZbW5kUlR3Q2I2TkVhQXcv?=
 =?utf-8?B?S3JTMThTMTlma0RyTzAwaWR2enIrMHRURzR1TGgvMTlrNW5GS1dMNEd6ZjJp?=
 =?utf-8?B?T3daQS9tVHBOeEpHQjZNOFJsOHpLdk9BQk9OblVTMGk3bW84eFdjcGphVTZD?=
 =?utf-8?B?c3Q1VHBiajRIblY5SzhBWHZaSFJuUWZDZU9aYzlsVDBEWTBiV09iSnY3WC9R?=
 =?utf-8?B?NGp1YkZTODBKYUxqYU1CVlpNRWY3dWtaREszajk5Y1JmM1RqOW8wZHNXK1FX?=
 =?utf-8?B?NnQyTTcybTRuS2FBWDlIMExqTXdwcnZTRWFON1lMZ2RPWDFFL0RBTzBVM3Nq?=
 =?utf-8?B?b1lwdVJ2YSs5aDhvTGc5SDBGU2Zmd01PNmRQSjloWkxZZVM1WGIxQmpWckVN?=
 =?utf-8?B?dlJqUFBUYVBCK01qY1NWbDFHS3JJQ2VTWXJuZXN2MkFoZ0hVVHF6TkVlZFdN?=
 =?utf-8?B?K3ZFbUdKRHpkZmhPRzlNZ2d0RGp1cTlDby9uTzNucTd0UUUvQ2RhUFE0bWVj?=
 =?utf-8?B?Um9DeUU0Ukc1SktGZzM1VkovSE05c2ZWUjJBQ0NRdTRqbkc5aEs3NDdTY0dI?=
 =?utf-8?B?dFpSZGRBZWQxVnkzN2ZBcGIxU3JrRUU4NTR6LzFsYXZmMmxUM2RZSE9MaFVX?=
 =?utf-8?B?d1lRT2xrN1ZtNG5hLzB4M0F3MExycTBsSUNYWWtSdTdCdzJMd0pQSHd2Sk1h?=
 =?utf-8?B?TEptYkt3MWEwaExTMjczVW1XNUFXSlJFYWZuQlluUVF2ang4VVl1OWdOV2pT?=
 =?utf-8?B?MTgraUdtMlFUZmtFL3hWQVRMM081WVJoVGtmZkl0ZjZQUEhSaitybjRwTzMy?=
 =?utf-8?B?YTVma2w4Qk5HbmtZZDNnaXVCdkNWRHRIV1gyOVZqREJlQm5xcWYrRG5OK1Nt?=
 =?utf-8?B?WSt1cFVxVTB4TFlHbUdNWm1wbXk4RHM1SnFlNS9wT09rYXprcDlCd3FFK0Fk?=
 =?utf-8?Q?bF/k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FCE89703588224690079B2246B32DAA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb66072-d3c0-4511-4486-08dd090b4f27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 02:30:33.3723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: amMHdqVMXs6Tj0emqLOCrI/gbR9U2yeFs1py2xa73IoGONIHsOu8yNc18DkPsppSzmWTVAq1NgmDa2F7NjAteg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

T24gMjAyNC8xMS8xOSAyMDo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBO
b3YgMTMsIDIwMjQgYXQgMDQ6MDA6MjdQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAr
c3RhdGljIHZvaWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCByZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCB2YWwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgICAgdWludDMyX3QgY3RybCwgaW5kZXg7DQo+PiArICAg
IHN0cnVjdCB2cGNpX2JhciAqYmFycyA9IHBkZXYtPnZwY2ktPmhlYWRlci5iYXJzOw0KPj4gKw0K
Pj4gKyAgICBjdHJsID0gcGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlZyk7DQo+PiArICAg
IGlmICggY3RybCA9PSB2YWwgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBj
dHJsICY9IH5QQ0lfUkVCQVJfQ1RSTF9CQVJfU0laRTsNCj4+ICsgICAgaWYgKCBjdHJsICE9ICgg
dmFsICYgflBDSV9SRUJBUl9DVFJMX0JBUl9TSVpFICkgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0K
Pj4gKw0KPj4gKyAgICBpbmRleCA9IGN0cmwgJiBQQ0lfUkVCQVJfQ1RSTF9CQVJfSURYOw0KPj4g
KyAgICBiYXJzW2luZGV4XS5zaXplID0gKDEgPDwgKCh2YWwgJiBQQ0lfUkVCQVJfQ1RSTF9CQVJf
U0laRSkgPj4NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfUkVCQVJfQ1RS
TF9CQVJfU0hJRlQpKSAqDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBQQ0lfUkVCQVJfQ1RS
TF9CQVJfVU5JVDsNCj4gDQo+IE9uZSBmdXJ0aGVyIGNvbW1lbnQ6IHlvdSBhbHNvIG5lZWQgdG8g
cmVzZXQgYWRkciBhbmQgZ3Vlc3RfYWRkciBoZXJlDQo+IChwb3NzaWJseSBieSByZWFkaW5nIHRo
ZW0gZnJvbSB0aGUgQkFSIHJlZ2lzdGVyKSwgYXMgdGhlIHNwZWNpZmljYXRpb24NCj4gc3RhdGVz
IHRoYXQ6DQpIb3cgYWJvdXQganVzdCBzZXQgdGhlbSB0byAwLCBzaW5jZSB0aGUgYWRkciB3aWxs
IGJlIHJlLWFzc2lnbmVkIGJ5IHN5c3RlbSBhbmQgdGhlIGFkZHIgb2YgQkFSIHJlZ2lzdGVyIGlz
IGFsc28gb3V0IG9mIGRhdGUuDQoNCj4gDQo+ICJBZnRlciB3cml0aW5nIHRoZSBCQVIgU2l6ZSBm
aWVsZCwgdGhlIGNvbnRlbnRzIG9mIHRoZSBjb3JyZXNwb25kaW5nDQo+IEJBUiBhcmUgdW5kZWZp
bmVkIg0KPiANCj4gSGVuY2UgdGhlIGNhY2hlZCBhZGRyIGFuZCBndWVzdF9hZGRyIGFyZSBzdGFs
ZSBhZnRlciBhIHdyaXRlIHRvIHRoZQ0KPiBjb250cm9sIHJlZ2lzdGVyLg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

