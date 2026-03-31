Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLx7O8YqzGkmQgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 22:12:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE41371101
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 22:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269333.1558404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7fRj-00019x-3u; Tue, 31 Mar 2026 20:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269333.1558404; Tue, 31 Mar 2026 20:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7fRj-00017h-0z; Tue, 31 Mar 2026 20:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1269333;
 Tue, 31 Mar 2026 20:12:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7fRh-00017b-OR
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 20:12:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7fRg-001u4c-8N
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 22:12:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cc2a9d-5cb7-0a2a0a5109dd-0a2a4506bfd4-8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 22:12:16 +0200
Received: from [52.101.57.67]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cc2a9e-3034-0a2a45060019-346539430df3-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 22:12:15 +0200
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by PH0PR03MB5685.namprd03.prod.outlook.com (2603:10b6:510:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 20:12:12 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 20:12:11 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlBdf6CNzmvwRdTGQCeWHZzru8eembiEpZ62nk47+08NBTJZTdrxo+UlT40gQoA+laFMrMQiVCuzhYHdgOidwQaeIJHHYkwbYoy7TycjeJwXFt9n8H1HRX1g9kGOn44GKaUtzQdRgYzP7l1rzi0YnsJVYxGEZeZ5TJaR6EM88rW4tox5Ywn/wAXV/qcpLcE6MnKJXYfcLaIcrpi+TcvLDVdzNNSz6s1o6mz5BhWCsHJPIuWDuiPEImyJ6e8riN2TFAuDzGRrZXM0A6EvGIeCvDKuXqrFwFEKx2Fzh63eflcg0Nz6MkmLE+56SNcuDzbZT/MPCsIeYMMvsKFD8QE4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoBFa4jcjgIIIH5H4QOsTEIyRuS4rpi1OQxkU4cFtjw=;
 b=RkYND0Kpe4tDhoO//IQwbMsD+M1HdUfuXM3JiZXzBu8qWlgXUET+hH1iY2bPl5NLtqZGSrxMjETDejNiFAAZ74othFtS0METSAnsE5D4VtUOOgBrLEyqhB1Y5tppEREHygGi/50LNfzmlvt3rSwNxSvm2t+FQeEgxKFBswMevwQcVZe9Dzw2rBPkEAbpb4srw6mkNnp7o9PQHYpsAh+a3hwI2EDje8ptMcH5XQEVT/gL713llKfjBVrLR/U1TqRDfFbJfGnEd5wYwDT3XJeCYI8HX39F0RP5+Kfri9LunMqyC5uGG5e8pJEAUozmSoo6v+uHiHkuLHtOX+vXDxydgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoBFa4jcjgIIIH5H4QOsTEIyRuS4rpi1OQxkU4cFtjw=;
 b=l/F7UAuy5QUIHJav2n1XKGtp0VvsZOtPztJjkxzW+2J65Cfq5ANxhzKZDrvkgyGeNA3Uc/TmcxZiI1AgRr514WE0ZB5RhUDH2akuiVxBSk3nxXlnOcKiELRRg6vhA+g7WnRvJgpJ84I6/WlEul/XXiKqQOQyp8yzCBGKd1Jo4+o=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Denis Mukhin <dmukhin@ford.com>, Marcus
 Granado <marcus.granado@citrix.com>
Subject: Re: [PATCH 0/7] Factor out common build rules and helpers in
 tools/tests
Thread-Topic: [PATCH 0/7] Factor out common build rules and helpers in
 tools/tests
Thread-Index: AQHcpK0ssUh7hdj8f0mNZT6LyhFCMLWQGOWAgAbDtQCAMm9PAA==
Date: Tue, 31 Mar 2026 20:12:11 +0000
Message-ID: <9FD57CC6-EE9F-467C-9572-5547985C13F4@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <dba3fb3f-b5c9-460c-85fc-761f58e140fc@suse.com>
 <EFC38170-BA34-49E2-8628-219EF6EC3301@citrix.com>
In-Reply-To: <EFC38170-BA34-49E2-8628-219EF6EC3301@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|PH0PR03MB5685:EE_
x-ms-office365-filtering-correlation-id: 9ae84792-376f-47f4-112b-08de8f61cb2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|13003099007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 LtRLbTHPI4vtMZOT/x2xRq/c2QJsw8zds5zaHCQablVcl6kBfqry6pKOin0Xvim3lD1Ct1uY8zSiWoj23aDAkixrT6Lmt8f/QpoVWqCRu6qPyNJJYe2ctp2C8RDjVmpf11XI+qyPVWoVRfD2VM8qf/bJG52kLaMZd4HWlVp3Fmqzqa7HvVA5mrJS1els0uTzIE4hA3AZ6k4lsV3e2BkCdAch5y6cxLPeqO9XGpzz6j4K+GWLchln5BAMIXRgf9jjUspzD0Uv+CJ/jx7W0tCbf5ujtILZhYGXUbS8e1SY1oPgoo8ylKkRJyfrYjbd44PYB6NcM7d6sSlNaJnXDme14Noqycs4no7DIiZya0ajYfE80v2f5php8Tp74y5cD3EzNSFTaUjR4tNkh0goqiVuuxAi6bdzVpkK3hq7h0Kt7QmoYDFBsqYcY1DRdYN7NNnWpu52uQKBn0L8wXKIvIJJUUolvZTQ4ibWiVcekMgQp1wyO/1/1l54u9Zg+gfjOtgx05NfAkPwJ47aQXIN1jz80C3/dnqcv/H2qYL3HqzPd3ivxM+rPdFRNWrb2w/xf1C2mT8cPWrd6QNRL5hE5omWno0vzF//qO9N/d/vRDYegDSghkJIY5vdIBrFuYp0bxwyUM4jiPezatD2Rhzwb6h2mTltW6w2XH8i/B3iLLsw41qJjhDSRKQXmYGY9IhXXgYUDz1OnUxyUjLEUUvSWCsOk0Jjtq3Ez2KyRKeEiINcW6ttXCJIVAt98c4y8rbPPFdfoAMyDYkkkctPGDb7+L7XQXPJu91iJKYaRajeGtr4HWTwMlEdC3jwAMxribKkCrik
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OG9SWnYrT2dBYVFLcHUyZFdOR253T0x6Q1ZxbXJQMUpCdi8yWC8rLzRYNGtm?=
 =?utf-8?B?dGhPZ3Z0cS95anhxWVF4L2NiWVZ3UWdsMkpKb0ZETndnUzZjV0NVWjZIREVQ?=
 =?utf-8?B?VjFSTllpNTNsdTZGUGVhcitDWFloODhLRWtqdnJBanFRbU5TQlp0eVBWYVY4?=
 =?utf-8?B?U205cldNVnFFMmRYMDFsSzVKbjZiREpwWVVjV1BNMzRGZW5DK3ppZThPSGcx?=
 =?utf-8?B?VEgyMDBER21Ya0JyanBuTUQ4ZFAyYTdGRVVET3VmSGpjb2QwMm8reklLc3V4?=
 =?utf-8?B?MU9WellNb0VwRDh6cGZhYnBZM1g0SmZtelFkWUxsR3JaS1FyUFJqc3lBN3Ba?=
 =?utf-8?B?RHcrVC9WVEtScHBpR0toUzR5YWZkUWhYRGFpSjd4YzJmOWNhcTRzRjVrbE1Z?=
 =?utf-8?B?MUg1enkvSEpacUc4ODZCemdyZUkwU1ZhNlQycHFSSENZUjlVSGFOMWpDSldS?=
 =?utf-8?B?WDNrUXQvcm1QU3prRlZJQXNYYWRqQ3NqUnhqTHgzNmoyTW95cFZHWHpRWUh1?=
 =?utf-8?B?SVhjcms2Ynk2VitiQVVJTzhpRUI0YWlKTzN4cWpiQlZMS08zMFltZ0VQdmRl?=
 =?utf-8?B?V3lieHRwaW5HbldTTFZiNkZ3T0k2WmJHd3NiN0VlZ0VhUjdyT0NKR3NLbGU4?=
 =?utf-8?B?ckErVlN2a1dVUVk3U1NOL0IvVnZHTUJTSXEvVVlIdGlTdTRJZll1SzRxN0hi?=
 =?utf-8?B?NWpvcVY3OWRiNUxxRFF6MVc3Y1BPNFRpbG9BeDNVOG5lMGJTdWtJWjFpbUNx?=
 =?utf-8?B?OGhCVHZzK0hTd0YwTnRXaEpzdVJVWDFiRDhHaEdUbzBhQkE2emp6dTB6aGcz?=
 =?utf-8?B?MVRpazdkdHdLaVdncWkzS25TRXlnN0lkdmhIclpQbEtTK01zSW4zSENYSnRX?=
 =?utf-8?B?UTU4Ui9rR3B4VDBZUGFoK1R6OEp4eXpmMnllS3pIM0oxUHdHV0RwVC9tTUNE?=
 =?utf-8?B?TkhwS2hHYXJGaXdyaWVpNzdWTERlRUM5ZUNSS0xhWmFMc3NHSXdOWTBJQ2hM?=
 =?utf-8?B?b0NldUxuVUV3RU1pby9CNGZabWJhZmRBR3JIWHFDUU41M0ZuSmpBdG1Nb2Fl?=
 =?utf-8?B?M0tsTkJsR2lwRFM0a0tjSlNRZUJES0JxV0x0OGVsN01mWG5mQXZYeW55cGhx?=
 =?utf-8?B?M3VTRzR4UitvNSt1dGltYlZsd1NaR3dPMUdZWWwxMU8rQXFIY0NVT3RDbTZk?=
 =?utf-8?B?dUw4UGI1c21rb0xSY2xJeFBJcEVQMEtGTkVPMWlKRnRLTmtaUWV6eWRFaEc1?=
 =?utf-8?B?MURBMWdjbVBQNk9wd3Y0N1BDbnp6dXNhRUo2YjlnSURzMEdlNjIzQXViejh6?=
 =?utf-8?B?bEI1Sm9VQkJxZ0xWY2NDZGcvc2UwNTBibE80QmFMVzdjZ2VmS1pZVmV6UWs2?=
 =?utf-8?B?cThBY09haHFuaks1ZU5hbC8ydXhpRER0aU5Ga2lQYzBueHlNV1BCam1KMzEz?=
 =?utf-8?B?TFk4Rm0yQ0NtdndaV3Y4SVAzY1R2V0RjQkVrY25vdXFvK09VL0c1R2dUMGlt?=
 =?utf-8?B?aEpoZGxoc05vYklEZFNPUGk3eDUzV2w2YXdUaVdLYXVnWElOOHFFWTFvVWMw?=
 =?utf-8?B?eVg0Q0xOZzdnWkw4c0JKNVhVSDVvU2RiQ3hIc08zODJQc0krLzloOTdmSFBN?=
 =?utf-8?B?N094ODNRWHFVTnNsdkx0cWV4WVMwaCt2M3VNSithclJTamYrSFI5Y0x3OWNa?=
 =?utf-8?B?VTh3bkVLZWdoQ2xOdlRrbVFMS2p6d3FpWkIvcVowajhWSVkwWkJ4Z2dqN0M0?=
 =?utf-8?B?ZXdsUkwwOStraXhaSlp4WGJ5MTdCeEJNWmNsUnBkTHh3dC9hWG05NkdkaU9R?=
 =?utf-8?B?eCtQN0hJM2hQT3owOCtVNm9QOXZDU0YwRU0xR2VqVmNzWEg0Y1BMZ3VYaHVP?=
 =?utf-8?B?UGY3cG1Nb2VWNEJheEJJZFlESVJsRlE5cHRlYjBpMkQvSHA4SndZUEQwMGo4?=
 =?utf-8?B?UUdwRHQ3b2VCSll0OVFROE42d3NpOUlocTVLb2JjWE1weG1MZEVXNTErQmk0?=
 =?utf-8?B?WU1CcjNHMVpuQnd6VE5lSVQ5V3pyeTlpUm5xbTBwL0xDU29ZOGRnVGlTYlRj?=
 =?utf-8?B?U0VqMGc2WjNieXMvc1ZCdExia1ZzbGkwVVRxamNvWXk4MWNGaTJqWlJOaTdi?=
 =?utf-8?B?NnJWaDhqM05LWTFkVWt1L290OFR6TkdVMFhKVWZ4NHlqZlgzQnpWSGIvMko5?=
 =?utf-8?B?UlBPbzQzMUVFblRNbGZTMmlVOU1zQlB0eHlXdFpjWkswOUdvVmxZeUtITFhn?=
 =?utf-8?B?N2ZtOXZkQmFaK1JyRHA5RnB5WmNyemlqZk44azJ0Sm1adGxPbmFuL1hnUmxW?=
 =?utf-8?B?amRJT25oR2pBSnM1T1dKTUwrT1FIYk12WHNjNmx0dHVCRVZOZ2VmVDFTZklp?=
 =?utf-8?Q?6Qfp3PgqbFQeUp7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7741137DF47ECB4C8CDFEC6CE69F15CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae84792-376f-47f4-112b-08de8f61cb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 20:12:11.5095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atxNEbhT82PfKavN+NQvOhwjDRJks6vZEGzHzf2r4QCdrd30WCULeGfaVOSAk9jsFleYzQW7dVUySjO3+Dq7QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5685
X-purgate-ID: tlsNG-16d1c6/1774987936-B3E9E1C2-0FD70B3B/0/0
X-purgate-type: clean
X-purgate-size: 4492
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:marcus.granado@citrix.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,xen.org:url,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BE41371101
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMjcgRmViIDIwMjYsIGF0IDE4OjAwLCBFZHdpbiBUb3JvayA8ZWR3aW4udG9yb2tA
Y2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4+IE9uIDIzIEZlYiAyMDI2LCBhdCAxMDo0Miwg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+IA0KPj4gT24gMjMuMDIu
MjAyNiAxMToxNCwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+PiBUaGVyZSBhcmUgYSBsb3Qgb2Yg
ZHVwbGljYXRlIHJ1bGVzIGFuZCBjb2RlIGluIHRvb2xzL3Rlc3RzLg0KPj4+IFRvIHNpbXBsaWZ5
IHdyaXRpbmcgbmV3IHRlc3RzIG1vdmUgY29tbW9uIGJ1aWxkIHJ1bGVzIGludG8gYQ0KPj4+IGB0
b29scy90ZXN0cy9SdWxlcy5ta2AsIGFuZCBoZWxwZXIgbWFjcm9zL2Z1bmN0aW9ucyBpbnRvIGBj
b21tb24ve3Rlc3RzLGd1ZXN0c30ue2MsaH1gLg0KPj4+IA0KPj4+IOKApi4NCj4+IA0KPj4gSnVz
dCBmeWkgdGhhdCB0aGVyZSBpcyBhbHNvDQo+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyNi0wMi9tc2cwMDc1MS5odG1sLg0KPj4gQ2FuIHRoZSB0d28g
b2YgeW91IG1heWJlIHdvcmsgdG9nZXRoZXIgdG8gaGF2ZSBhIHNpbmdsZSByZXN1bHRpbmcgYXBw
cm9hY2g/DQo+PiANCj4+IEphbg0KPiANCj4gVGhlcmUgaXMgZGVmaW5pdGVseSBhIGxvdCBpbiBj
b21tb24gYmV0d2VlbiB0aGUgdHdvIHNlcmllcywgYW5kIEnigJltIHRhbGtpbmcgd2l0aCBEZW5p
cy4NCj4gVGhlIE1ha2VmaWxlIGNsZWFudXBzIHRoYXQgYm90aCBvZiB1cyBoYXZlIGRvbmUgY2Fu
IHByb2JhYmx5IGdvIGluIGZpcnN0IGFzIHBhcnQgb2YgYSBzaGFyZWQgc2VyaWVzLA0KPiBJ4oCZ
bGwgdHJ5IHRvIHNldHVwIGEgY29tYmluZWQgYnJhbmNoIHRvIHNlZSBob3cgdGhhdOKAmWQgbG9v
ayBsaWtlLg0KPiANCg0KDQpJIGhhdmUgYSBjb21iaW5lZCBicmFuY2ggaGVyZToNCmh0dHBzOi8v
Z2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZWR3aW50b3Jvay94ZW4vLS9jb21wYXJlL3N0
YWdpbmcuLi5wcml2YXRlJTJGZWR2aW50JTJGbWlncmF0aW9uLXRlc3RzNT9mcm9tX3Byb2plY3Rf
aWQ9MjMzNjU3Mg0KDQpUT0RPOg0KKiByZWJhc2UgdGhlIHZQQ0kgTWFrZWZpbGUgcGF0Y2ggb24g
dG9wIG9mIHRoaXMgDQoqIHRoZXJlIGlzIHJldmlldyBmZWVkYmFjayBmb3IgdGhlIHByZXZpb3Vz
IHNlcmllcyBvbiB0aGUgbGlzdA0KDQpUb2RheSBpcyBteSBsYXN0IGFjdHVhbCB3b3JraW5nIGRh
eSBhdCBDaXRyaXgsIGFuZCBsaWtlbHkgbmV4dCB3ZWVrIG9ud2FyZCB0aGlzIGVtYWlsIGFkZHJl
c3Mgd2lsbCBzdG9wIHdvcmtpbmcgdG9vLg0KSSBpbnRlbmRlZCB0byBmaW5pc2ggbXkgcGVuZGlu
ZyBwYXRjaCBzZXJpZXMsIHVuZm9ydHVuYXRlbHkgSSByYW4gb3V0IG9mIHRpbWUgKEkgbWFuYWdl
ZCB0byBnZXQgdGhlIH43MCsgWEFQSStYZW4gYnJhbmNoZXMgZG93biB0byB+MTgsIGJ1dCBjeWNs
aW5nIHRocm91Z2ggZWFjaCBzZXJpZXMgdG9vayBtb3JlIHRpbWUgdGhhbiBhdmFpbGFibGUpLg0K
SSBob3BlIHRoYXQgc29tZW9uZSBlbHNlIChlLmcuIGZyb20gWGVuU2VydmVyKSB3aWxsIGJlIGFi
bGUgdG8gcGljayB1cCB3aGVyZSBJIGxlZnQgb2ZmIGFuZCBjb21wbGV0ZSB0aGVzZS4NCg0KSSBp
bnRlbmRlZCB0byBzZW5kIG91dCB0aGUgcmVzdCBvZiB0aGUgYnJhbmNoZXMgSSBoYXZlIGFzIHBh
dGNoZXMsIGJ1dCBnaXQgc2VuZC1lbWFpbCBvciB0aGUgaW50ZXJuYWwgU01UUCBzZXJ2ZXIgc3Rv
cHBlZCB3b3JraW5nLg0KDQpIZXJlIGFyZSBzb21lIGdpdCByZXBvc2l0b3JpZXMgaW5zdGVhZDoN
CiogdGhpcyBzZXJpZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZWR3
aW50b3Jvay94ZW4vLS9jb21wYXJlL3N0YWdpbmcuLi5wcml2YXRlJTJGZWR2aW50JTJGbWlncmF0
aW9uLXRlc3RzNT9mcm9tX3Byb2plY3RfaWQ9MjMzNjU3Mg0KDQoqIHRoZSBtaWdyYXRpb24gZm9y
ZWlnbiBjb3B5IG9wdGltaXphdGlvbnMgYXMgYSBQcm9vZiBvZiBDb25jZXB0ICh+Mi41eCBmYXN0
ZXIgbG9jYWxob3N0IG1pZ3JhdGlvbnMpLiBEb27igJl0IHVzZSB0aGVzZSBhcyBpcywgc2hvdWxk
IGJlIGRvbmUgcHJvcGVybHkgYnkgaW50cm9kdWNpbmcgYSBzZXBhcmF0ZSBmb3JlaWduIGNvcHkg
b3BlcmF0aW9uLCBpbnN0ZWFkIG9mIHBpZ2d5LWJhY2tpbmcgb24gdG9wIG9mIGdyYW50LWNvcHkg
YXMgSeKAmXZlIGRvbmUgaGVyZSAocGlnZ3ktYmFja2luZyB3YXMgdXNlZnVsIGZvciBtZWFzdXJp
bmcgdGhlIHBlcmZvcm1hbmNlIG9wdGltaXNhdGlvbiBwb3RlbnRpYWwsIHNpbmNlIGEgbG90IG9m
IHRoZSBnbHVlIGNvZGUgYmV0d2VlbiBoeXBlcnZpc29yIGFuZCB1c2VyIHNwYWNlIHdhcyBhbHJl
YWR5IHRoZXJlKTogaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9lZHdpbnRv
cm9rL3hlbi8tL2NvbXBhcmUvc3RhZ2luZy4uLnByaXZhdGUlMkZlZHZpbnQlMkZ0ZXN0czI/ZnJv
bV9wcm9qZWN0X2lkPTIzMzY1NzINCg0KKiBjb21iaW5lZCBYZW5TZXJ2ZXIgcGF0Y2ggcXVldWUg
KyBQTVUgc3RhY2t0cmFjZSAoZmxhbWUgZ3JhcGgpICsgbWlncmF0aW9uIGZvcmVpZ24gY29weSBv
cHRpbWl6YXRpb25zIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZWR3aW50
b3Jvay94ZW4vLS9jb21wYXJlL3N0YWdpbmcuLi5ndWlsdCUyRnBhdGNoZXM/ZnJvbV9wcm9qZWN0
X2lkPTIzMzY1NzINCiogZm9yZWlnbiBjb3B5IFByb29mIG9mIENvbmNlcHQgZm9yIHRoZSBrZXJu
ZWwgKHRoaXMgaXMgYSBrZXJuZWwgdHJlZSBpbiBhIFhlbiBnaXQgcmVwbyk6ICBodHRwczovL2dp
dGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2Vkd2ludG9yb2sveGVuLy0vY29tbWl0L2VhMTMx
NTVkY2U4ZjJmMWNmZDFhMmM1NGEzZjgxNThiZThiZWVkNjINCg0KSeKAmW0gbm90IGxlYXZpbmcg
dGhlIFhlbiBlY29zeXN0ZW0gZW50aXJlbHksIGluIG15IG5ldyByb2xlIEnigJlsbCBiZSB3b3Jr
aW5nIG9uIHRoZSBVbmlrcmFmdCBhbmQgTWlyYWdlT1Mgc3VicHJvamVjdHMsIGluc3RlYWQgb2Yg
dGhlIFhBUEkgc3VicHJvamVjdCBvZiBYZW4NCihpdOKAmWxsIGxpa2VseSBtZWFuIGEgbG90IGxl
c3MgaW50ZXJhY3Rpb24gd2l0aCB0aGUgaHlwZXJ2aXNvciBpdHNlbGYpDQoNClRoYW5rIHlvdSBh
bGwgZm9yIGFsbCB5b3VyIHBhdGllbmNlIGFuZCBhZHZpY2Ugd2hlbiByZXZpZXdpbmcgcGF0Y2hl
cyENCg0KDQpCZXN0IHJlZ2FyZHMsDQrigJRFZHdpbg==

