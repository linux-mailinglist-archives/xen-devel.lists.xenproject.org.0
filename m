Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL4GHDwYzGnIPgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 20:53:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3983703F4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 20:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269247.1558332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eDA-0002l0-MD; Tue, 31 Mar 2026 18:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269247.1558332; Tue, 31 Mar 2026 18:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eDA-0002ix-JU; Tue, 31 Mar 2026 18:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1269247;
 Tue, 31 Mar 2026 18:53:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7eD9-0002ir-BI
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 18:53:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eD7-0040jO-R7
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 20:53:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cc1803-5cb7-0a2a0a5109dd-0a2a4503e284-20
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 20:53:09 +0200
Received: from [52.101.85.52]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cc1813-1947-0a2a45030019-34655534d2bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 20:53:09 +0200
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by IA3PR03MB8021.namprd03.prod.outlook.com (2603:10b6:208:502::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 18:53:04 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 18:53:04 +0000
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
 b=m6Vqjyw6gOJR27TKqO6rctn7eW0gBawwkj7BJG72q9gVBNJgD8NhPhBjsj6A71oTX9hNZl5NVdiwAhkalF9BZrXvwUwVUsQAoORzRsZqstaeNdgmOPxk3+eFMiXX4Pgyzal7ppYsDbgkXzxSgYN5PV7VcsY+EXb4InYA6N/PTKB+I2gFT5zHiu8wfNeYugmPjna6eI0RDVIx+jHcJZf5o9kB0rnHvTcXne4dvrQihQ1OGSEVMn+GpNODZ/ZKvZW3kUczDA0IcbOR6cTuwiuEBmwQpp5u3KDKMNrk30TlspX6HTalkQQxL+1VD5s/CV6uFTRokwC7HsJ+dhxJAMiBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJrwMEkRQFsBCNOtHa4+e+DOo8IJiDMWUuPBfNAAYXU=;
 b=So1zlMR6g05dF4qmoU74sRYbeK8ltvCJR7BbmkANMk5U4K+46WN9tBgZAi+7Lfkg8BKyCKmn2M9lmyCPu2CtVk4C5EZkGPO7g0y6JKogXH7EQtarN0kZNMA08G/R74BG+oHPKvV6q7K7PNuyrxXWEGkEgGb0om0Bhf+olJHTVgieinjmNv95QtxjJ8qdzs64mNJo/IvKk4Im6UjZvg/zNnZwLehyyK9j9Bidq2FVxnfpDRHnTswhv1uihNgdqPs7sQSk9aXjAQvvJFsuyMRk5Xkn5kEShusVRsJhg5teaF9XQOJBwTr3qgFJbOZchwhWvnY8WD2cCTCZO2efRtlhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJrwMEkRQFsBCNOtHa4+e+DOo8IJiDMWUuPBfNAAYXU=;
 b=Zfrg+eICJgl4P6dFIf8lGhLzT3lbDBJsV+3mCfq4wKvwZNsUcjbkJxa4mxLwRW3oIYphBUXam33MUpxtHirzm8ISuPlSYnUglSgm1cdNymFvt1KbzgrnvmQ0+hNGBb5V/HaARnBnvC77ESulTnNddJxgTwC9G5IL932WNVYr0SE=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/5] README: update minimum make to 4.1
Thread-Topic: [PATCH v1 1/5] README: update minimum make to 4.1
Thread-Index: AQHcwGC/br3u5UUhvkGzDiCK7sswX7XIKoSAgAAhq4CAAAKTAIAAr6YA
Date: Tue, 31 Mar 2026 18:53:04 +0000
Message-ID: <4F96EDC1-F3B7-45ED-82EA-C28ABD3F1A01@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <4bbe4e23abcd5b1b32204d391bdd593205b89201.1774886602.git.edwin.torok@citrix.com>
 <16b415a9-b74f-4afe-a14f-e9d2df704eb9@suse.com>
 <9F272BD1-F382-4337-ADFE-CCA4E390A8AC@citrix.com>
 <0b831a75-c205-427e-a35f-fa37a6bd0e35@suse.com>
In-Reply-To: <0b831a75-c205-427e-a35f-fa37a6bd0e35@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|IA3PR03MB8021:EE_
x-ms-office365-filtering-correlation-id: 15b4a778-3f1c-47d6-d7c0-08de8f56bdc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 7kdl0t2bJ6S9z5m9n/RUgjcpM9+tY+uwQ/bozWAwZ3vgnYxKzIQ9P6HB2kp8KLORRqYsCmaQ4tRUTiuBYv73nsNVuXKpeyS2uLiUKFgJeEeVLmXKkHLwXX5S8QIJYNUuKGAqREI/xQOMBu/clP+8eUpBXFKZHceHP5rrSROG19O76xVbAqg58qLkRSYHM5oEwcYkqcav+ssIgX5fNrzwjwZa+YplifGIoIehDK/1OYEeE7IAY15Nmk0F6Fk3chowGjSOe/lZRtB06PjaJnkKti6fWijUr3OEcRMvMjdxEsvuRPoIXQuznsSvxgDwdyOOHvLOzlSXqONCPyrjrSXcS2h1rF4kLkwLBHgRfg2G1/O2+JsNvl6DF4uw4DCvwBBGwnGxdcfYngIB2XDhngdJUk10ALUX3whKfwX/aYWI80UrhLozButzOf8jnL2syAI3ERW00xaop6Pe68+XnysXdPISQsLxwPrgn8eEApcspSGtlQQEhQPHl+1QwxhW0XoghOL+IYT3qWu3PQ16aK9llxvmMHm5s33UD6GQvfiCC45meR3u2xe/CW2FZrgpQdfNpIp/HzCNGDXe8gmXVccsS1gbjUkan21Dc8t9mwi8K6EG3hUYjJ1w0Xi47V3zMbIbnaI5kxM1RVoQ/JRFpURTIMdX7nvdnwyjz66RHtNU4pU3cxHFVR9iVwZVKO4lmmdF3F25wAj8l2QZJ3w6A57Idn8O5s4ijix9dZB1CAy5wQCF+/Q5ZIQxRxSWdVD1Qf/G
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2p6N0p5Y0x4TzJRajhiVDRKNDl6czdtZ0J5ZmxQMXVsajVHZHFBMlhrRE5Y?=
 =?utf-8?B?RUgvKzAvRVJjTUdubG9RaFlmNXhza3ZvbFJnTUJYK0NIUVM0cmFPYXFRWmRy?=
 =?utf-8?B?Y29GL0RKemQ4ZGZqSXl6MDJCSit3MlhQRXhBTGdDNkFhOTBVNEhWQ0xzNGZv?=
 =?utf-8?B?WGNvWjFJaXVOQXVEOUlidThYRVJ6T3BLcmVrMktGaGRjMGtlc09BelQ2WThv?=
 =?utf-8?B?eU8zbnZPZmxib0d6ckdCQ2RTNU1CaUVma3UxSUg5ZXU4Y3BSckdBNDJGNHJw?=
 =?utf-8?B?UnAvbVpGY2ZTaW1qclJlRnZWb0xyeW1nZWZmUGdxaXI4WHJSMVJ5blRwYkFT?=
 =?utf-8?B?eFBwVFBFbHBTbkFjNjJ6cVhrdmhhWEpJQWFsc2dpZEtpTGpsMmVmcjE4QW9u?=
 =?utf-8?B?TWdkcGc2cS8yOGhzUDlZd2FJWFRNRWFaNjBsQkdWNzNFZ3FibnZ4NGFHRkNM?=
 =?utf-8?B?bU9nNkp2aG5uRkFMWGd5QTdON2NzVkM0ZjFyNmprNXdaWHJFTnlpWGU0dHcw?=
 =?utf-8?B?SlliY3o3bjRtdERQSHJyT1hxVEdqMm9Ec0VuaHRzdEZaNmVISnV5WSs2YnR2?=
 =?utf-8?B?MytZUnRUUnJqTkpvWFl0cGRNSGlEZk9qcGZ3STNCMlJHbHlncCtiV0REeDJq?=
 =?utf-8?B?OEVvWktxUG1GUDZEeFdIaXRwK3dzUnBpOXR0OEF1VE1ybldqcmFUTmhJQ3p3?=
 =?utf-8?B?WWY3Tys1dmVibWxsWWtpN3NYUThiVi9MSDkwNG9CNHJ3WGI5SHRnOVlGNGZq?=
 =?utf-8?B?REZlRS8rZUFIUnVDajRtVFpKTlFxVW5mK2JzU0ZDelUzSE5nc3IrQVpDVFpP?=
 =?utf-8?B?cHRTbm93d1lsSUw4Q3hJaUE0bVUvc2VJQ2l4M1B3cjlDMnFaYkFxV2s0RlNt?=
 =?utf-8?B?dW5NdHo2VHJab3hUZ3VLenQyUTRidFRPOW1JL1JjcE9IbStUcGZ4KzgwVFU0?=
 =?utf-8?B?NFp5Qm1HLzFYVWN1MytGOHpVS3NuS3pRa0xmY0tscE1icjMrWmNRM2pmekVY?=
 =?utf-8?B?eGpIc0cxQ2xaeENLeXIxVGh2alFXNm42VGV6MEwraW5vTUZsSXZlNnVsNDNJ?=
 =?utf-8?B?NWhlMVp1ODE4OGh4RTRIcHZEOERQQWM2cXQ0Nkx4aWhaSDdWQVdxY2tTK2Va?=
 =?utf-8?B?RHVMYzcwM3VDMjJ5czZ3K2llSE04ZitnZ2cyUUwvcVgzbTlDS2JRMEJtNlpK?=
 =?utf-8?B?YUd2bG5YS3VPWlp3RUdHRUFHVjRpaVVwMXdXZzMvWjc2V1N5OGlwb24rVlRV?=
 =?utf-8?B?SDhxWDhvenZYRStKVlZJdWFBMEJmVjUzVjBUWkMwcHN1anhWMzU4Ty9aaWxh?=
 =?utf-8?B?dkJ5clIvanJaWVlvR01tNDJPVXpjblZ2aEFtaTZvZThVNW9aWnd3Zm5WSmtL?=
 =?utf-8?B?SllkVWZMT09CekdmZC9tcjRTVFZQMGp4eXRaZzZ2Uko0aUtqUGF2TVFLZmhv?=
 =?utf-8?B?ZzdkZ3JiQmw0ODBIeGVGVkhkUytuYk5PU1dxdXpDK0ZuckFNaGVyVm5oK1ZO?=
 =?utf-8?B?VGNlUnpWWEhuRmw5Zk1Ea3JQRFZ5L3BESit6T0UzMm9LUTVCc2M3amV2cmtD?=
 =?utf-8?B?bDRUL3FJc2VaV1I0WmFWQmZKZGtRdnZtd0lwaklyekRudzFla0ZQRTl0UHlU?=
 =?utf-8?B?L0VvbXVpeHloRkNmOFIzSEZEVXAxTHZmMnFRaWdJeXZkc0xack05Y1FaN0k1?=
 =?utf-8?B?bTQrNzFuRmNsRTRtK0ZMaW9FcllGVnRPNFFkanRTS3p1NE5WY1hPL01vK1dx?=
 =?utf-8?B?UDdjaDZTME5zdHFYTHpzUm5QenViTll1UGUxcU04VUNmUVpIV1R1dm5YbnZ1?=
 =?utf-8?B?TEJaZjJveVM0OUN0VXJZUC94T3VnTzR4Vk5wT3JLcXBsOEdvaWFFeStncDNj?=
 =?utf-8?B?MVFZWkZaZC9RTnZoWkFhYW5zRFE5YkJiczNBQWY2bkdGcGVWcU5pSTJuZ3FE?=
 =?utf-8?B?TGMxWG5xdkVjdEIwWk9Xdy8vQUxjL1ZKYVF4YzdEcFBHUDVuUzUzeHYzVEFT?=
 =?utf-8?B?bkNLRkJVYkdiSktnNU9jeFI3T2ZOV0FFbkJ2MnA2NE5qQnJZdVRuTDNjLzIx?=
 =?utf-8?B?dUNFNWJmdEo3T0tobEV0NlNDdGRSZFhDZDZkSHEyYVpwTkpWYjlSU0FyQSs2?=
 =?utf-8?B?MmJkQlovSzU3aGRZL3BuRzFwbFc5QzM3VnJob05qY2Jtb2o4cG05SUlvWjRr?=
 =?utf-8?B?TkhmUGpoVUMrVlY2SHB5WnNnalU4L0RrRDBCb1lCWmIzRnRicjlxUXhtQXNl?=
 =?utf-8?B?S3BWQ0hoeUh3Wk1jQlJNd3BsdXlTTHBJWUw0eDgzeUxnRjQ4VG45ZWViczNK?=
 =?utf-8?B?ZEF4YVFpWVFrZVZEV0oxR1g1MElVUmtOK000a2xUWEJTUFk5S0R1TDRWSjBC?=
 =?utf-8?Q?tmz67CYTb4pT8ZXU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6192BAE4624704692E33A4DDDEE8B25@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b4a778-3f1c-47d6-d7c0-08de8f56bdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 18:53:04.6415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4B/RtDyfpbR4fT7mkttPO16Jfy+09M4pav2S5SOgEjw3Tiy61KgMUUaqizPthoz1Llv1QaeY6ADqo8s1VmRduQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8021
X-purgate-ID: tlsNG-33051d/1774983189-7768972C-E1BCBB7C/0/0
X-purgate-type: clean
X-purgate-size: 2288
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
X-Rspamd-Queue-Id: CC3983703F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDA5OjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzEuMDMuMjAyNiAxMDoxNSwgRWR3aW4gVG9yb2sgd3Jv
dGU6DQo+Pj4gT24gMzEgTWFyIDIwMjYsIGF0IDA3OjE0LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDMwLjAzLjIwMjYgMTg6MTcsIEVkd2luIFTDtnLDtmsg
d3JvdGU6DQo+Pj4+IFVzaW5nIC5ERUZBVUxUX0dPQUwgcmVxdWlyZXMgYXQgbGVhc3QgR05VIG1h
a2UgMy44MS4NCj4+Pj4gSXQgd2FzIHN1Z2dlc3RlZCB0byB1cGRhdGUgbWFrZSB0byBtYXRjaCB+
MjAxNSBlcmEgZ2NjL2JpbnV0aWxzLCBoZW5jZQ0KPj4+PiA0LjEuDQo+Pj4+IA0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHdpbi50b3Jva0BjaXRyaXguY29tPg0KPj4+PiBT
dWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL2MwYmE1N2JiLTBkODYtNDIwOS1iMDE5
LWRhZjgzMjhiNTIwNUBzdXNlLmNvbS8NCj4+PiANCj4+PiBVbmxlc3Mgd2UncmUgc3BlY2lmaWNh
bGx5IG1lYW5pbmcgdG8gdXNlIDQuMSBmZWF0dXJlcywgcGVyc29uYWxseSBJJ2QgcHJlZmVyDQo+
Pj4gdGhlIGxvd2VyIDQuMA0KPj4gDQo+PiANCj4+IE9LLg0KPj4gDQo+Pj4gKHdoaWNoIGlzIHdo
YXQgSSBoYXZlIG9uIG15IG1haW4gZGV2IHdvcmtzdGF0aW9uKS4NCj4+IA0KPj4gV2hpY2ggT1Mv
ZGlzdHJpYnV0aW9uIGFyZSB5b3UgdXNpbmc/DQo+IA0KPiBPbiB0aGF0IHBhcnRpY3VsYXIgc3lz
dGVtIGl0J3MgU0xFUzEyIFNQNSAoaW4gTFRTUykuDQo+IA0KPiBKYW4NCg0KTWlnaHQgYmUgZGlm
ZmljdWx0IHRvIGdldCB0aGF0IGV4YWN0IHZlcnNpb24gaW50byB0aGUgQ0kgKGh0dHBzOi8vcmVn
aXN0cnkuc3VzZS5jb20vcmVwb3NpdG9yaWVzL3N1c2UtbHRzcy1zbGUxMi01LXNsZXMxMnNwNSBz
YXlzIGl0IHJlcXVpcmVzIGEgbG9naW4pLCB1bmxlc3Mgc29tZW9uZSB3aXRoIGFjY2VzcyB0byB0
aGF0IHZlcnNpb24gc2V0cyB1cCBhIEdpdGxhYiBydW5uZXIuDQpPbmUgd2F5IHRvIGFwcHJveGlt
YXRlIGl0IG1pZ2h0IGJlIHRvIHVzZSBodHRwczovL2h1Yi5kb2NrZXIuY29tL2xheWVycy9vcGVu
c3VzZS9sZWFwLzQyLjMvaW1hZ2VzL3NoYTI1Ni04NGQ0YmVmMmM0NjU3YjdiZmI0ODIzM2FhODRm
NDBlMjMwM2FmMDYwN2RlMDY1NjJjZjRhZmM0OTZlYzE4YjU5LCB3aGljaCBzaG91bGQgYXBwcm94
aW1hdGUgYW4gb2xkZXIgU0xFUzEyIFNQMy4NCklmIGl0IGJ1aWxkcyBhbmQgcGFzc2VzIHRlc3Rz
IHRoZXJlLCB0aGVuIEkgYXNzdW1lIGl0IHNob3VsZCBhbHNvIGJ1aWxkIG9uIFNMRVMxMiBTUDUg
KGV4Y2VwdCBmb3IgdG9vbGNoYWluIGJ1Z3MpLg0KQXQgbGVhc3QgdGhlIHZlcnNpb24gb2YgbWFr
ZSBzZWVtcyBjbG9zZSBlbm91Z2ggKDQuMC03LjE1KSwgYW5kIHRoYXQgd2F5IGNvbnRyaWJ1dG9y
cyBjYW4gdGVzdCB0aGVtc2VsdmVzIHdoZXRoZXIgdGhlaXIgcGF0Y2hlcyBidWlsZCB3aXRoIHRo
ZSBtaW5pbXVtIHJlcXVpcmVtZW50cyBzcGVjaWZpZWQgaW4gdGhlIFJFQURNRS4NCg0KQmVzdCBy
ZWdhcmRzLA0KLS1FZHdpbg==

