Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNHEHdUC8mlYmgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 15:08:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017644947EB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 15:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297383.1573441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4di-0003f8-4H; Wed, 29 Apr 2026 13:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297383.1573441; Wed, 29 Apr 2026 13:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4di-0003c7-1X; Wed, 29 Apr 2026 13:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1297383;
 Wed, 29 Apr 2026 13:07:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wI4dg-0003ak-K2
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 13:07:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI4df-00Ck7W-Fy
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 15:07:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f2028f-2eae-0a2a0a5409dd-0a2a450ca188-34
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 15:07:39 +0200
Received: from [52.101.70.116]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f2029a-62f1-0a2a450c0019-3465467430a4-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 15:07:38 +0200
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by DU0PR03MB9541.eurprd03.prod.outlook.com (2603:10a6:10:41d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 13:07:33 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 13:07:33 +0000
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
 b=S198Y/Vlo+ZJ8H2pwWPoiw4+POCSFmRmEWhUWZ9pCcUc2Fflh4+628/0GiV7Eb1EWvTLU/UJZyTpl78amvhYDfsQuyzAPUsiGM0dydfG/VHl7o8R2KDFQBLISle6DpOlxV2vF6RMxha7C8DQ5D3TnhQkdTCzKjhgJgF+OMZ1qorGG5StseXCzL6sUduvrISm9IfF3bPZ03tqru7uFnKBDYynAA+toaD+6Q2x1I+/ntBrIkuxLJojFzRuiwsxUMqfFUnJvsuDbsHPRjouAlKSpxPvJdk3+mY4OsAP/KFEmsOJvyQWKsgX3QEs7BH5OKK4hANm+EjWrsPRM5AMvVsomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Urg5CnjzZTSUreJYqhKTDnY+Nhbqw/GjLE4oB+NKBs=;
 b=uxPi+/grsIwL3ormanQl1Xr8VRyIoq5zbHhdSsM4MAndcMnaNPEXxClJMEIFWGyYVuH/e5/pIunqJdaS6N+vtf+OEZlAh5W4noB9IB081hi06MyI9vRS2DvOGangBFSZ1fhIcb2kR5fV/sqmvKGF14TKQVqeErJYUTFAFHQisO122YEih1kkZUsP2BYriLmBJIdonLs6gtFuexHVbh1V2250N6nFXlvwR9IIDpqBh3e3LOOqpftnBx18VzBfUHIS39UMJpy6Vrw6GbEXIncy/u0FwApJSL3TEU7azg1cVd/ZfBy3qJu6LmhJc41UmBXGzwPWry4HYI2zBW26ROLThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Urg5CnjzZTSUreJYqhKTDnY+Nhbqw/GjLE4oB+NKBs=;
 b=sQv+bPIBfzTtsgKEqpNdqbOKMvqDATMwcCr4OXEN+9mgDjlRY3HrZLvYCT06Y4eQEjQCcDbp7VQ6Com1me18QjNOqEMLnEt7kJpSYHNplucWw67rBjESwTROgyyClD3dSjFzD06yGQyOQXFkEC8pK0NuWUY5zPe66hwkRnXRLv7RIyf/wiPnAhxgF5JhNs4zRWJ/v8ByGFalPvfx4+Ir0PzoBJ7b4hg+WBsC52XzYb8bq95kUUWffGjHkTQlMGPUsqyw9l5hvT0dZQ3mzI1inLY7KcPFW7stAQxgfIYevxf81AXjoxMTK3ccqlkPIY/4y5e2kXBOPL4am5VyHtdMxg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
Thread-Topic: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
Thread-Index: AQHc1zuKSCUJ+s/V9k2YkPF8TK6+GrX1yyWAgAA4qwA=
Date: Wed, 29 Apr 2026 13:07:32 +0000
Message-ID: <e0adb2c7-a57f-4887-96ab-b844fe252982@epam.com>
References:
 <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
 <83b1e26a-cd17-4f64-ae82-dbf56f95b4ad@citrix.com>
In-Reply-To: <83b1e26a-cd17-4f64-ae82-dbf56f95b4ad@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|DU0PR03MB9541:EE_
x-ms-office365-filtering-correlation-id: 458df68c-70c7-47d0-03b1-08dea5f046af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 IeXq+K76WYIdX+MSH1/i3sV+m3Q+nDfJLfgbpT4O6uyZbMGkOkkbhgoeINbN2k7DrVOUKhJJYMxfsNpszzyeT9R76+lfwwgShMu4fZ2V8a67ZzdhJR2y+ge3Rufj6gaMwh7a+DR5kWDzLLMKVzNYa+dX87cOE5KNKLWyn9/y6eQaihA3Yq2eh1GYgszt1A/fbxc1eoyy9Pl5Hnb3oKMtYyVeNEGXaG0RQzxYL8DobWILZhQXqsanTx+0Ff6o7Lgov1AhJx+By6+MqFYPHr0F0jG8+FD6D0xd9F1gm9sDV32252RLj+/xgNQZMUEu1e3uqTcjPxRuLpf/n3rzLj3TWf+5v8Zv8+riuAj5nqBKAu74hk6zqBHJGB0RNs4jrS28/aqGcE2qc3BtzcIDAk1CRO7mMCrCH8jVCH0wbl/ZQSCUaIL6rWFTWP4M+MJlWtWSpqA70udJDkvSGRKvD4Dxyh0ycv706SRWXqRRf9GwIv4x8TUcnvopzz2roTPCTdL/tZKcVNB30gu5iFft3uGsEyoccx8Uw7M149XJEPpv7V34pkISj9Oksagt9Hv/VPcu1RxqxtdPN4JlE9cHe2lzJsksqp6H6j/VYgojNJ/58+WDQhfDdiBKbz8xEDLBsOR0KjT2mMpkRdatr+xKhP9oetyJwpPrBbxdB5UqmabMm9bEifDR9B3nHdGwLHDGhD8kxoolr53ucKy94hoXArBR6bYJjfdLk+ATHZeXu7a4erB8PPgaK/xk7AohYPJRngtc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUpQNDhYK3d5WDhNK3VhcEVSZGNmQUx6ZXJUY0ZoRm12TTZwajlxOHZ0WFdU?=
 =?utf-8?B?bWE3ZG82L1V1V0xleUdkOFMvMEp3S1g0ajFCaUVYVVNEbGFFS01lM2hLM1I4?=
 =?utf-8?B?SEk3amx6VXM4Rnl1eTZkdDhUQlY2a2VCWGVQT2pUU2hNaVEvK0Qxcno4K1pr?=
 =?utf-8?B?WEUzaU92VUJHOG5wSHFkT3U0bFVEVTAzcTBET0x1c1ZnK21kanBFOW5abjV5?=
 =?utf-8?B?ejFxalZSVGRQdW5YcEtVWkIyUmhEK25ieEkzaXV1VXVIaS9QaWEyQVcrQ2xl?=
 =?utf-8?B?aFRLcjRXS2RjakJEZEt0RVc3R0E1K0xEY0xjcU5CMWpQeHFHZ0UwdHY4eFNo?=
 =?utf-8?B?WDBUTjdGTE50QmRlcWMwU3dxY2JZMDhGM2pQZVNJSG1UalZsbUh1RFgwbzZR?=
 =?utf-8?B?eTd6MjZSR251dDFoRThSNFIxVmsvY1VZTXE5WWplbWVaempZLy9PdUxRUm5D?=
 =?utf-8?B?TVl5elhpUE1SOHpSbmQwY05XYktRazZVN3pYY0YzTEtZdmg3OU03WUR2N2x2?=
 =?utf-8?B?VmpLbmFiY1VHdFVpZk9sOXZoSklmb3pheUozQVE0SFcwYmxGN2NYeXpZejhP?=
 =?utf-8?B?dDloaXFjVU1xVTR5akw3RE1mM0NDbFhBZjdBNFM0VWljdnVmcUpkeUdBa2Zv?=
 =?utf-8?B?ZmZadkJ1SFBqWi9OMWUxNTZmOHFCZm5yUFZXN1VhY3FkQnNkd1hJZHhzMSt0?=
 =?utf-8?B?MXdMTjB3VU9WTmVmZHl5YW9pb1MxY21wT2xYcys2bXVqVk5kRUdtNmRYazFB?=
 =?utf-8?B?YnR1eXVWNUMyRmhpSmREWGNrQUVFeHpLSjBLZEp2dkxBTGdJd3M2eXdjRmRR?=
 =?utf-8?B?bzdPbEpsVXBaSVlXemh2VVhLcjhDeStUWmxjTURjY0krMFFnNVZGbjJYQUQz?=
 =?utf-8?B?MzVqdHphMFpNRmJ6azZZaTdhTDJyQytzS2xVN2tQQmtXTVYwWXJRSlFLVGN1?=
 =?utf-8?B?ZklIcGZSRklqWVMwcUdjdXdXUGYvaE5xZ2dOQTNreW5vemp1T1ZqUm5WUVJK?=
 =?utf-8?B?S0lBWWYwT3RkdWZsOUliUE9XeC9yZnJpT1IydEJ3R2d3aCtUSVdES2l2WkRK?=
 =?utf-8?B?M0pkSmUxZXBQd1A4d01oay9ZdU1GWEhEUGIwWm9jRWFCOFNiTTl1Vm1xVWdO?=
 =?utf-8?B?MUFuUHBPcW42RHFhTHhSRkN0ZHc1SVZhalpUSU4yNzRoY05QenlmTjR0b05D?=
 =?utf-8?B?MVFWVkcyMVRvYUhKK0NMcXdUVkhRdlkwQi9CSlE1VnhUNmkzenUxRnNiOGF6?=
 =?utf-8?B?NTRyU3Z3V2xqUGVvWit5Y05zL1AzeFdRZUtwTDBWTk1YbFhuK25CWGdkTDFS?=
 =?utf-8?B?VGllRllpOVl6TkhLRnlXdi9MekRQOTBmNmhTRDgrSDVkbWVGVWluOEhnZGQ3?=
 =?utf-8?B?R1F2c2xwMXdsODFBeWhTeG1NZFZJZy8vWndDM0duTnVBV3FvRHhRV0llMFlo?=
 =?utf-8?B?NmE4d0tOcXVzeTNvTHJ3c0pJbHRXbFE0R2NwMHRFai9TYllXdWw3V1BVbktL?=
 =?utf-8?B?Ti9sRlY2UTB3eXkrK0tadUt5ZTh4akxpMkJrS2F3aXpySXNlaFBXaHlOWndE?=
 =?utf-8?B?QVg5cnVoU041d241SXpFZ2Rvdm1DYlcwSEdmLytSakdycjJqZG9kY0RlSVkv?=
 =?utf-8?B?UE9Jd1E5bVAzRjBhdXMwSjdSNzh2Z3o0VGduK0I5aGloL0t4RkZZZDFONllC?=
 =?utf-8?B?a2oxS2dmVlQ1QjBUNnR1cnRvc25ZUWtJVHhQcXpHZVltZVZNcVFrV0ZUZStL?=
 =?utf-8?B?VmFuRTQ2V1Rla2M1d1o2N2QwNVY1RGwyaW0waDBYY2JabjMySTZMVjdhN0dq?=
 =?utf-8?B?REljLzVSQjB0WUtjT201NFhVR1ZHVWFGeWk2L0F4OGNvbzUzMGxjbXpxMDhr?=
 =?utf-8?B?UkVYTHlLZUZUQzd3UlJQZ1loS0h5c09QbVBpc2pWN1FnZUtWZnhQTkVudTh2?=
 =?utf-8?B?TVkwbHFYNHpkNXRqRDBPcXhiNzVlYVNFMm5hMUQrK2ppM21keElkc0hpYXJ1?=
 =?utf-8?B?WDNYT2l5Y0V6NWRZVjJET2sybElWWTJLczBKYy96QUhYb0FkUkRObUkyRk1G?=
 =?utf-8?B?M2wxQzZ0bmJkU2VZaXVpdXI5Qld4bFZOS012cVFNcEQrWENlZ3Q4TGk3Z0ww?=
 =?utf-8?B?cWFuS0REaEFXZ3d6OWd0cUtWTFVhalJvMjNzR2xZWUszZGc2SmI4YnJFdlow?=
 =?utf-8?B?UHQ3K3kxRDAzQXUyMUZPWGFZYzd5NUtmaUlFaUZkVGJKQ2U1WHZrb3JRSm5s?=
 =?utf-8?B?YnZncW5ob0NscE9jMU1FMlIwMlN5RGtNenlmZis1UFZ0c2hmK2xrYk9nMy9u?=
 =?utf-8?B?ZkR1ZitvTy92c2RkU0RjVFZaNThIMTIwRGYycTdaOTZUd2ZOL21udmgxVjls?=
 =?utf-8?Q?t7TRNLzL0n9uhOeU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2133965B5BD546419DC50AA5FAB16D13@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458df68c-70c7-47d0-03b1-08dea5f046af
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 13:07:32.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ej+yM6bIqo9QasfsLSZanpWc7d0/ppQ7OIlIIF7Y+Y4F7BJFIbsWtLPGMRQ0ko8nVBkX9a+DauiumbrvO8+Uah/5jU9JXI3l7UsLaCZakmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9541
X-purgate-ID: tlsNG-d25034/1777468058-F7D7BCF5-AE68CF08/0/0
X-purgate-type: clean
X-purgate-size: 3346
X-Rspamd-Queue-Id: 017644947EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

DQoNCk9uIDQvMjkvMjYgMTI6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI4LzA0LzIw
MjYgNzoxOSBwbSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gVGhlIHN0YXRlbWVudCAn
cmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7JyBvbiB0aGUgZmluYWwgbGluZSBvZiB0aGUNCj4+IGZ1
bmN0aW9uICdoeXBmc19nZXRfZW50cnlfcmVsKCknIGlzIHVucmVhY2hhYmxlIGJlY2F1c2UgdGhl
IGxvZ2ljIHdpdGhpbg0KPj4gdGhlIGluZmluaXRlIGxvb3AgJ2ZvciAoOzspJyBwcm92aWRlcyBh
bGwgcG9zc2libGUgZXhpdCBwYXRocyBmb3IgdGhlDQo+PiBmdW5jdGlvbi4gU28gdGhlcmUgaXMg
bm8gZXhlY3V0aW9uIHBhdGggdG8gZXhpdCB0aGUgbG9vcCBhbmQgcmVhY2ggdGhlDQo+PiBmaW5h
bCB0aGF0IHN0YXRlbWVudC4NCj4+DQo+PiBUaGlzIHVucmVhY2hhYmxlIGNvZGUgdmlvbGF0ZXMg
TUlTUkEgQyBSdWxlIDIuMSB3aGljaCBzdGF0ZXM6ICJBIHByb2plY3QNCj4+IHNoYWxsIG5vdCBj
b250YWluIHVucmVhY2hhYmxlIGNvZGUiLg0KPj4NCj4+IFRvIGZpeCB0aGF0IGFuZCBwb3RlbnRp
YWwgY29tcGlsZXJzICJjb250cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12b2lkDQo+PiBmdW5jdGlv
biIgd2FybmluZywgbWFyayB0aGUgY29kZSBwYXRoIGFzIHVucmVhY2hhYmxlIHVzaW5nIG1hY3Jv
DQo+PiAnQVNTRVJUX1VOUkVBQ0hBQkxFKCknLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERteXRy
byBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+PiAtLS0NCj4+IENo
YW5nZXMgaW4gdjI6DQo+PiAtIGFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKSBiZWZvcmUgdGhlIGZp
bmFsIHJldHVybiBzdGF0ZW1lbnQgaW5zdGVhZCBvZiByZW1vdmluZyBpdA0KPj4gVGVzdCBDSSBw
aXBlbGluZToNCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBy
a3A0ay94ZW4vLS9waXBlbGluZXMvMjQ4NTY2MTkxMA0KPj4gTGluayB0byB2MToNCj4+IGh0dHBz
Oi8vcGF0Y2hldy5vcmcvWGVuLzM0MTgxMWNlZDI5NDNmYjc5ZDAyMzVjMjc3ODFjNTY0YzdiZGFm
MDIuMTc3NTc0OTE0Ni5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0uY29tLw0KPj4gLS0t
DQo+PiAgIHhlbi9jb21tb24vaHlwZnMuYyB8IDEgKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9oeXBmcy5jIGIveGVu
L2NvbW1vbi9oeXBmcy5jDQo+PiBpbmRleCBjZGY0ZWUwMTcxLi4wMmZiMjM0NTY4IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2NvbW1vbi9oeXBmcy5jDQo+PiArKysgYi94ZW4vY29tbW9uL2h5cGZzLmMN
Cj4+IEBAIC0zNDgsNiArMzQ4LDcgQEAgc3RhdGljIHN0cnVjdCBoeXBmc19lbnRyeSAqaHlwZnNf
Z2V0X2VudHJ5X3JlbChzdHJ1Y3QgaHlwZnNfZW50cnlfZGlyICpkaXIsDQo+PiAgICAgICAgICAg
ZGlyID0gY29udGFpbmVyX29mKGVudHJ5LCBzdHJ1Y3QgaHlwZnNfZW50cnlfZGlyLCBlKTsNCj4+
ICAgICAgIH0NCj4+DQo+PiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gICAgICAgcmV0
dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+PiAgIH0NCj4+DQo+DQo+IE5vLiAgVGhpcyBpcyBhYnN1
cmQuDQo+DQo+IE5vdCB0byBtZW50aW9uIHRoYXQgeW91IGFyZSAqZGVmaW5pdGVseSogbm90IGZp
eGluZyB0aGUgc3RhdGVkIE1JU1JBIHJ1bGUuDQo+DQo+IH5BbmRyZXcNCg0KSGVsbG8gQW5kcmV3
Lg0KDQpMb29rcyBsaWtlIHRoZXJlIGlzIGEgY29uZmxpY3QgYmV0d2VlbiBjb21waWxlciBhbmQg
RWNsYWlyLg0KDQpBIGNvbXBpbGVyIGlzIHNtYXJ0IGVub3VnaCAoc2hvdWxkIGJlIGF0IGxlYXN0
KSB0byB1bmRlcnN0YW5kIHRoYXQNCiJyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsiIGlzIHVucmVh
Y2hhYmxlIGluIHRoaXMgY2FzZSwgYW5kIHJlbW92ZSBpdA0KZHVyaW5nIERDRSwgYW5kIGF0IHRo
ZSBzYW1lIHRpbWUgdG8gaWdub3JlICpwb3RlbnRpYWwqIHdhcm5pbmcsIHRoYXQNCm5vbi12b2lk
IGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSByZXR1cm4gc3RhdGVtZW50IGF0IHRoZSBlbmQuDQoNClRo
ZSBFQ0xBSVIgc2NhbnMgY29kZSBhZnRlciBwcmVwcm9jZXNzaW5nLCBzbyAicmV0dXJuIEVSUl9Q
VFIoLUVOT0VOVCk7Ig0KaXMgc3RpbGwgdGhlcmUgLS0+IHZpb2xhdGlvbi4NCg0KV2l0aCAiQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7IiB3ZSBqdXN0IG1ha2UgRWNsYWlyIGhhcHB5Lg0KDQpJbiB0aGUg
cGF0Y2ggdjEgdGhlIHJldHVybiBzdGF0ZW1lbnQgd2FzIHJlbW92ZWQuIERvIHlvdSB0aGluayBp
dCBpcyBPSz8NCk1ha2luZyBhc3N1bXB0aW9uIHRoYXQgd2Ugd2lsbCBuZXZlciBnZXQgY29tcGls
ZXIgZXJyb3INClstV2Vycm9yPXJldHVybi10eXBlXS4uLg0KDQpEbXl0cm8uDQoNCg==

