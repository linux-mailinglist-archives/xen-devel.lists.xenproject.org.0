Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fg6CgbEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2D2FE8E9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259632.1552978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o6t-0007Jv-L2; Mon, 23 Mar 2026 22:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259632.1552978; Mon, 23 Mar 2026 22:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o6t-0007I3-GE; Mon, 23 Mar 2026 22:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1259632;
 Mon, 23 Mar 2026 22:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o6r-0007HT-WC
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o6q-004fpR-7L
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:50:56 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c38f-bab6-0a2a0a5309dd-0a2a4507beb0-32
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:50:56 +0100
Received: from [52.101.65.87]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3cf-fd74-0a2a45070019-3465415728ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:50:56 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:50:49 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:50:48 +0000
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
 b=oCZxKZYO66XzVeDxDjHw9v0+tYtkylXUZbhcimRrpxtAvA+Wjj8NMSEhrVWSK4/4z80qOoIfP5PgpFt0ugwQzuxtbGPn+qInWrz3jBW9LsHoojw8Pge3CCiWfFK8zCwv6Ub1vsNgeSuK6llDoRaEU20qdd6kJGHrN94dI6EkJbpw1XFgGxtSZeC7DRWUXDu0B2rsvEfi+nQCkFGg+jXxev4cRVQ7hbFB98h4YSRh1A+uRMFLpSgRny9mPDewXNBQ822Jt0NhJBVUdBQklHPrIz6CKNSBoqGMOvc5MRHOr6jy92BBck/YKP2hPJE4vpBuiN5Lkld6UcTRITAbkcTETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BaDjkEJBdsJBWbQfCmcrIPOlFcyKVXPKr779ZYQiYs=;
 b=P0L2V3CnDacWpT3RIcNwHn1eLODrzHTD0gc4nadm02t+NB3r8Wf6VG/JdQiORJwNuAPzSRyunzwb0Hsp0huGBcN7VCJO6BlQult0vCyu1FF8FkKWeb12n2qAwxn/B7229Ncn8jdsHiRRadYagw5BWHmbVwyNuV+H+ywkpkSY2iYfvDvUOFnYzBjCNGeDEZ5yFDNQuSPLDIg6iE/wapdsj7IB8pXnnI3r5IaXljANeson8z6Nk12aSWBAlxoQ2+Dp+ncAu6gwfipUtwMN2K4Zvl65EX1wejmNQ0q83PYrtikyUt+xI1FrQOUpMTsWd/w1wfrNy2nhY4+Hp5TBPnZjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BaDjkEJBdsJBWbQfCmcrIPOlFcyKVXPKr779ZYQiYs=;
 b=EVlwi0IVIjqSUZVdh7vwZq9O/tAeModDTK0oJWf35RasOJGf81i1H962qn3T8eApAs73bqRO/BLrd7tRLoz+YnqyeFnZNE5codkfxcfZnRF4E1leMSM9WE0tq4/CIYfYTF1ll7MbnVEnPd0ggxswPhdJkIRv/HVtN9+EWxEUVj8pngIK4bCKcX7Vn65dU3AjdsEFfh9S8D5nXrPHTflBjY/i8L1M8WQXQUiKI8PnfeGcjXhS6Flc8m1Am2HGeYj8X/HAscQ4aIpGGg2h8Fj8qNs+Dq9mh4L49lA1muZZUSnTjp0dvZtKAqLjFxmYtaIU6paixICGFwIHubLHBMNgEA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Nick
 Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 00/23] Add SMMUv3 Stage 1 Support for Xen guests
Thread-Topic: [PATCH v2 00/23] Add SMMUv3 Stage 1 Support for Xen guests
Thread-Index: AQHcuxd9vHfNeHP4OkWsLi6ZZBW26Q==
Date: Mon, 23 Mar 2026 22:50:48 +0000
Message-ID: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: 72412da0-1802-4931-ff83-08de892ea081
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 EdV9cjyb+WxUciM2UBadbPQqoUnp7a5wGCfKhldG3pfJnVnEe+aWpS1L7uKO16HirgleUMSQLkWjzsgRvhB/OjzE9tFKm5k36NeXUD4YYNUUydC/jF9iL/ptSBaa9MW7LEj6hKQqk4raFZQ45py2db6Dy5YabpIBt2KcgiYZGRUKGbWsItOXOk1Z9nX38OthkBP+qD0d/lV6VEU0u2YQhZ4HpE9+xd55QJRhCCJhe675tgZCdqWxDimRlzxvKudU28l7SE/ckkqFrV0VXbzvw//w89NjH+zGF4meRZGMHVc7IPFNTyt9y4bBN/kcavbUAQpnMFjj81LtGnL9i8/LUr0cZFpw74vcNtyXo2PD9gZryzMed4YSTTRsebvOJns4ff89bMZuhWjpxHpBxIGv0Gyf+L+IuE4c8tK5rYbLbr7bmG6FgRTZYdgKxYbu14XRoX+EOZaqGkwEorV62wOd/qJIPZfkO9++0Gbci6A4b7RpcX+mw8M/j6mdQLnQ76JpbsxOHLq/OiNlj60KotXYSoJ65YKmtAjx75GvjThGBQVtta2HVqe+tseAZTB8OlqkS7QMBGoyfopalK6YEMmDc3x/GnBgA1zS1lCpH+ALqeQpOFN1oE8lXD0Ee0yh+zhmisr4oe02An5k9URCPxFW4KQWF255GZdwN0Jzf8unpb5mbTirrv8Kxy9rWC14CobTgZHL04l9UVdFrBCI5g74EE2PntTPupxNob3FVOBJDPxshXrqwrEkZ3YMHbUmFbBo3007Xdtj29aJ7C9wd8Logni70PyShRNY5drX9DSAhf0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blhmK2tPa2ZBdU8yS0g3aHIyVGRsWjhNcmNQR2ljcjFkWUJ4akNKWTNFNVM5?=
 =?utf-8?B?ZVZ4RmxsRFBQblpCR0p6bmpSZVJYS2hXQ3VreXAvRE9qeUp2MHFRb1RDQ0ww?=
 =?utf-8?B?bzlnVmVsSVdyOUZuS0M2RUJySVNqREFkUGNRYnNlM0lyeW9wY1ZLK2NFTzls?=
 =?utf-8?B?VnBwYlpGbXlHa256Y25DeXpzcmZ6MEZyK2RrOUkzL2FEbys2dXUrZ2oxRHVR?=
 =?utf-8?B?MngvbktraVJqS2ljRUFibWkwQ2QxQmhUM0o3eHkxcXlkZ0phaG1wUHVtR3hI?=
 =?utf-8?B?QTZQV094ZDYrWGxqZndrWjIwbmNTSFVFMXE0MFl2aXZNZW81WUkwNS9pUEx5?=
 =?utf-8?B?Rys1dkNIam43bHd2SUxQb0RCOSszUFEwYXlRNHg1ayt2U3N0WFBHUlNPbU1z?=
 =?utf-8?B?WjJLTVYwVllhdnAxZGlhRVJKM3MxUUxDVm5GMmU0Tzh6NDV4UE03V3BEQU9B?=
 =?utf-8?B?WDNCQVdmc3NOVnVQdzZoTGFWQ095ck1qd0R3N3ZldWpHM0wwcXNWVVNqZjd1?=
 =?utf-8?B?clNXdzhRcytHb3B4bmVDdUxTbHhnZjV6OWg0MGhOWHI2ZWtqbllJMTJRTDgw?=
 =?utf-8?B?WnZvSFppVEE1K0laWkdRcCsvWTRtRHJjVGt3YnhJRnhwbDRuVzQ2RVlxdzBR?=
 =?utf-8?B?V2YwT1hCT0xoRnZvNFYyZTZrMzQ1SHFXRkF2RXM0WDFXTm9xb3VWNHFjMERu?=
 =?utf-8?B?amZReWNtUWZYK2krdS95dUthSjl4YzJVcmVSSStBbTVQVzRieVJ5SVBsQlBT?=
 =?utf-8?B?L291MkI3N3RVbllwa1VJa3g3R3AzMlNLN1YxWGJRQnhiWnpNYkx3bWZCSDFq?=
 =?utf-8?B?TUdGaUFzNUljRWtaK0dtZnMrNGFVaFhFN2s5eFFnRHgxU0dKWlVsRkxzc0Ew?=
 =?utf-8?B?OGZVLzA4clUvUlVWckhjSFpHdHN4YjR5dVQxS2NoMUF4TGNzcUU5UncxSzN1?=
 =?utf-8?B?TzZoYTludkxDV2VzblZEWVBGOHZGVmxoSnZWeTRoMWxhUFowcWlFanJZZ011?=
 =?utf-8?B?RklMR1JUUTdCalNsd05ES3gzdGZzTk4vcjRvc0xweSthTG1oQWtpK3BIMFVZ?=
 =?utf-8?B?bWpXQ21acGk3bGsyOFdyamZrOUpjd3BqcC9qdDRiNkgxTWtZT0E0Nk15VjYz?=
 =?utf-8?B?c2VISHMyRlZzcW9ZS2RaOG5KY092MWlTR3NoSWhTMVl1RDRnMHpYNURuVUZN?=
 =?utf-8?B?bGpVdU5KeFF1aFpDNmN1K0xmKzN2TWV6ZTNTVU5TVUZjOEoyeE5Kb09ER0xw?=
 =?utf-8?B?dWMxcTE3aTdRZXlNd0l0WU1ncXgremdsb2FBMGpsVEV0dEFqSGNLZ21XZnpY?=
 =?utf-8?B?U3h3ajZQbDBwbDFLSU5aWWRrODNGT21Hd2ozZHpMRDZzL0JQZGl2MGhaRlJ4?=
 =?utf-8?B?SEZkejQ4Nk4vSTV6MEFKUWxjRjRyNWVvbjh5ZjJVOURnTk5POUIwRUlaYjUv?=
 =?utf-8?B?eFN5VlBFbU5yRUNKRXZRQ2llc2VzUEcyc1R5MUJLOWxYOTN1QnVjQVNhalRZ?=
 =?utf-8?B?YzRoV0xtVXhiNmowL3BDMVh2Z0VzbTY2YVgzYktkbUFpanRhQzk4clRQTUlZ?=
 =?utf-8?B?NSt0Z1ZuS1RoZjJyM21XelZxYmxiWU5HWk12K0VmdDVZU0JQSFJyclFRRGJB?=
 =?utf-8?B?NDVlNWFJWmcydVRQNWhRN0s3dkJFTTdjb2V3VUVXR3RhZW4xNWVWUkRZdllp?=
 =?utf-8?B?UVpNMG8xZDM5cURTRmJUMVRhY083dlZlbi9Reml4SHgvYW5YbWk5alVVbm5O?=
 =?utf-8?B?N3o4SktWZDhGalF0VlhESlRJZzNSTzZlSm0rSWhmZmJ5RFUweWdGZUsrS3U5?=
 =?utf-8?B?OVlLbkhUWk1WYzBvOUI0dExjdHVNT1hkSUZrdHhiV3hER1VzekVaVnJmUUFF?=
 =?utf-8?B?SVJHcmlIRGdBU0tvMlNmSTNPdTF3djlKTnUvck1oNUcxM2x0R25nVG9FUVVa?=
 =?utf-8?B?ZTJXVDNFY3RaR0NOYUlOTWlGN0k0UmZaOVRmZEVrWGU2M3ErejE1SDZlbTlV?=
 =?utf-8?B?aHQ5NE1aVDFXSUhBWVR6dWFxczVxTWRrMXdjRzFvVFlsUnQ2ak5CK0I0TnBy?=
 =?utf-8?B?UGdvdllmbE5JZ25KTkFkbTNFZVgzYWN2Y3F1azlLNldkTWRhWWkvVnpUcFk0?=
 =?utf-8?B?bUFZbXljd1RNMjBmNjJLb1Zwd1FvY0grd291bmVhV3dXeWg4OXJZY0ZEUnhL?=
 =?utf-8?B?YmdYRi9kS0RCNW1YVVc0c0NZV296N2VJeU5vS3dieE5TSUVCbmsyRnJsUHVm?=
 =?utf-8?B?b1JYaTV5R0tjbWp6NUI0UUY4RUYvZE9Vb1M3QWdjRTVXN1F6S2ZYTnVBc3Iz?=
 =?utf-8?B?dmwrNXhteUV3SStQcVlPaTUwWkhiK1pDS3V3VWp5YVM0KzNSM2hDZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A33F9DF41C8C647BD88C6C5F0E42327@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72412da0-1802-4931-ff83-08de892ea081
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:50:48.7086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iT9Y6zKaiRjZ8AZQJSdwzOAn118BA9OFM/aK2QE0NnsKcNJng4OsoVBFRohjug1+r+p0wsySWkXL4qduyAHVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-ef75cf/1774306256-4F0A8303-23401515/0/0
X-purgate-type: clean
X-purgate-size: 7666
X-Spamd-Result: default: False [-0.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A2A2D2FE8E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBwYXRjaCBzZXJpZXMgcHJvdmlkZXMgZW11bGF0ZWQgU01NVXYzIHN1cHBvcnQgaW4gWGVu
LCBlbmFibGluZyBzdGFnZS0xDQp0cmFuc2xhdGlvbiBmb3IgdGhlIGd1ZXN0IE9TLg0KDQpTdGFn
ZSAxIHRyYW5zbGF0aW9uIHN1cHBvcnQgaXMgcmVxdWlyZWQgdG8gcHJvdmlkZSBpc29sYXRpb24g
YmV0d2VlbiBkaWZmZXJlbnQNCmRldmljZXMgd2l0aGluIE9TLiBYZW4gYWxyZWFkeSBzdXBwb3J0
cyBTdGFnZSAyIHRyYW5zbGF0aW9uIGJ1dCB0aGVyZSBpcyBubw0Kc3VwcG9ydCBmb3IgU3RhZ2Ug
MSB0cmFuc2xhdGlvbi4gVGhlIGdvYWwgb2YgdGhpcyB3b3JrIGlzIHRvIHN1cHBvcnQgU3RhZ2Ug
MQ0KdHJhbnNsYXRpb24gZm9yIFhlbiBndWVzdHMuDQoNClRoaXMgcGF0Y2ggc2VyaWVzIHJlcHJl
c2VudHMgYSBjb250aW51YXRpb24gb2Ygd29yayBmcm9tIFJhaHVsIFNpbmdoOg0KaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9jb3Zlci9jb3Zlci4xNjY5ODg4
NTIyLmdpdC5yYWh1bC5zaW5naEBhcm0uY29tLw0KT3JpZ2luYWwgcGF0Y2ggc2VyaWVzIGlzIGFs
aWduZWQgd2l0aCB0aGUgbmV3ZXN0IFhlbiBzdHJ1Y3R1cmUsIHdpdGggdGhlIGFkZGl0aW9uDQpv
ZiB0cmFuc2xhdGlvbiBsYXllciB3aGljaCBwcm92aWRlcyAxOk4gdklPTU1VLT5wSU9NTVUgbWFw
cGluZywgaW4gb3JkZXIgdG8NCnN1cHBvcnQgcGFzc3Rocm91Z2ggb2YgdGhlIGRldmljZXMgYXR0
YWNoZWQgdG8gZGlmZmVyZW50IHBoeXNpY2FsIElPTU1Vcy4NCg0KV2UgY2Fubm90IHRydXN0IHRo
ZSBndWVzdCBPUyB0byBjb250cm9sIHRoZSBTTU1VdjMgaGFyZHdhcmUgZGlyZWN0bHkgYXMNCmNv
bXByb21pc2VkIGd1ZXN0IE9TIGNhbiBjb3JydXB0IHRoZSBTTU1VdjMgY29uZmlndXJhdGlvbiBh
bmQgbWFrZSB0aGUgc3lzdGVtDQp2dWxuZXJhYmxlLiBUaGUgZ3Vlc3QgZ2V0cyB0aGUgb3duZXJz
aGlwIG9mIHRoZSBzdGFnZSAxIHBhZ2UgdGFibGVzIGFuZCBhbHNvDQpvd25zIHN0YWdlIDEgY29u
ZmlndXJhdGlvbiBzdHJ1Y3R1cmVzLiBUaGUgWGVuIGhhbmRsZXMgdGhlIHJvb3QgY29uZmlndXJh
dGlvbg0Kc3RydWN0dXJlIChmb3Igc2VjdXJpdHkgcmVhc29ucyksIGluY2x1ZGluZyB0aGUgc3Rh
Z2UgMiBjb25maWd1cmF0aW9uLg0KDQpYRU4gd2lsbCBlbXVsYXRlIHRoZSBTTU1VdjMgaGFyZHdh
cmUgYW5kIGV4cG9zZSB0aGUgdmlydHVhbCBTTU1VdjMgdG8gdGhlDQpndWVzdC4gR3Vlc3QgY2Fu
IHVzZSB0aGUgbmF0aXZlIFNNTVV2MyBkcml2ZXIgdG8gY29uZmlndXJlIHRoZSBzdGFnZSAxDQp0
cmFuc2xhdGlvbi4gV2hlbiB0aGUgZ3Vlc3QgY29uZmlndXJlcyB0aGUgU01NVXYzIGZvciBTdGFn
ZSAxLCBYRU4gd2lsbCB0cmFwDQp0aGUgYWNjZXNzIGFuZCBjb25maWd1cmUgaGFyZHdhcmUuDQoN
ClNNTVV2MyBEcml2ZXIoR3Vlc3QgT1MpIC0+IENvbmZpZ3VyZSB0aGUgU3RhZ2UtMSB0cmFuc2xh
dGlvbiAtPg0KWEVOIHRyYXAgYWNjZXNzIC0+IFhFTiBTTU1VdjMgZHJpdmVyIGNvbmZpZ3VyZSB0
aGUgSFcuDQoNClRoZSBmaW5hbCBwYXRjaCBzZXJpZXMgY29tbWl0IHByb3ZpZGVzIGEgZGVzaWdu
IGRvY3VtZW50IGZvciB0aGUgZW11bGF0ZWQNCklPTU1VIChhcm0tdmlvbW11LnJzdCksIHdoaWNo
IHdhcyBwcmV2aW91c2x5IGRpc2N1c3NlZCB3aXRoIHRoZSBtYWludGFpbmVycy4NCkRldGFpbHMg
cmVnYXJkaW5nIGltcGxlbWVudGF0aW9uLCBmdXR1cmUgd29yayBhbmQgc2VjdXJpdHkgcmlza3Mg
YXJlIG91dGxpbmVkDQppbiB0aGlzIGRvY3VtZW50Lg0KDQotLS0NCkNoYW5nZXMgaW4gdjI6DQog
LSBVcGRhdGVkIGRlc2lnbiBhbmQgaW1wbGVtZW50YXRpb24gd2l0aCB2SU9NTVUtPnBJT01NVSBt
YXBwaW5nIGxheWVyDQogLSBBZGRyZXNzZWQgc2VjdXJpdHkgcmlza3MgaW4gdGhlIGRlc2lnbiwg
cHJvdmlkZWQgaW5pdGlhbCBwZXJmb3JtYW5jZQ0KICAgbWVhc3VyZW1lbnRzDQogLSBBZGRyZXNz
ZWQgY29tbWVudHMgZnJvbSBwcmV2aW91cyB2ZXJzaW9uDQogLSBUZXN0ZWQgb24gUmVuZXNhcyBS
LUNhciBwbGF0Zm9ybSwgaW5pdGlhbCBwZXJmb3JtYW5jZSBtZWFzdXJlbWVudHMgZm9yDQogICBz
dGFnZS0xIHZzIHN0YWdlLTEtbGVzcyBndWVzdHMNCi0tLQ0KDQpKZWFuLVBoaWxpcHBlIEJydWNr
ZXIgKDEpOg0KICB4ZW4vYXJtOiBzbW11djM6IE1haW50YWluIGEgU0lELT5kZXZpY2Ugc3RydWN0
dXJlDQoNCk1pbGFuIERqb2tpYyAoMyk6DQogIHhlbi9hcm06IHZJT01NVSB2U0lELT5wU0lEIG1h
cHBpbmcgbGF5ZXINCiAgbGlieGwvYXJtOiBJbnRyb2R1Y2UgZG9tY3RsIGNvbW1hbmQgZm9yIElP
TU1VIHZTSUQvdlJJRCBtYXBwaW5nDQogIGRvYy9hcm06IHZJT01NVSBkZXNpZ24gZG9jdW1lbnQN
Cg0KUmFodWwgU2luZ2ggKDE5KToNCiAgeGVuL2FybTogc21tdXYzOiBBZGQgc3VwcG9ydCBmb3Ig
c3RhZ2UtMSBhbmQgbmVzdGVkIHN0YWdlIHRyYW5zbGF0aW9uDQogIHhlbi9hcm06IHNtbXV2Mzog
QWxsb2MgaW9fZG9tYWluIGZvciBlYWNoIGRldmljZQ0KICB4ZW4vYXJtOiB2SU9NTVU6IGFkZCBn
ZW5lcmljIHZJT01NVSBmcmFtZXdvcmsNCiAgeGVuL2FybTogdnNtbXV2MzogQWRkIGR1bW15IHN1
cHBvcnQgZm9yIHZpcnR1YWwgU01NVXYzIGZvciBndWVzdHMNCiAgeGVuL2RvbWN0bDogQWRkIFhF
Tl9ET01DVExfQ09ORklHX1ZJT01NVV8qIGFuZCB2aW9tbXUgY29uZmlnIHBhcmFtDQogIHhlbi9h
cm06IHZJT01NVTogQWRkIGNtZGxpbmUgYm9vdCBvcHRpb24gInZpb21tdSA9IDxzdHJpbmc+Ig0K
ICB4ZW4vYXJtOiB2c21tdXYzOiBBZGQgc3VwcG9ydCBmb3IgcmVnaXN0ZXJzIGVtdWxhdGlvbg0K
ICB4ZW4vYXJtOiB2c21tdXYzOiBBZGQgc3VwcG9ydCBmb3IgY21kcXVldWUgaGFuZGxpbmcNCiAg
eGVuL2FybTogdnNtbXV2MzogQWRkIHN1cHBvcnQgZm9yIGNvbW1hbmQgQ01EX0NGR0lfU1RFDQog
IHhlbi9hcm06IHZzbW11djM6IEF0dGFjaCBTdGFnZS0xIGNvbmZpZ3VyYXRpb24gdG8gU01NVXYz
IGhhcmR3YXJlDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCBzdXBwb3J0IGZvciBldmVudCBxdWV1
ZSBhbmQgZ2xvYmFsIGVycm9yDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCAiaW9tbXVzIiBwcm9w
ZXJ0eSBub2RlIGZvciBkb20wIGRldmljZXMNCiAgeGVuL2FybTogdklPTU1VOiBJT01NVSBkZXZp
Y2UgdHJlZSBub2RlIGZvciBkb20wDQogIHhlbi9hcm06IHZzbW11djM6IEVtdWxhdGVkIFNNTVV2
MyBkZXZpY2UgdHJlZSBub2RlIGZvciBkb20wbGVzcw0KICBhcm0vbGlieGw6IHZzbW11djM6IEVt
dWxhdGVkIFNNTVV2MyBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhsDQogIHhlbi9hcm06IHZzbW11
djM6IEFsbG9jIHZpcnEgZm9yIHZpcnR1YWwgU01NVXYzDQogIHhlbi9hcm06IHZzbW11djM6IEFk
ZCBzdXBwb3J0IHRvIHNlbmQgc3RhZ2UtMSBldmVudCB0byBndWVzdA0KICBsaWJ4bC9hcm06IHZJ
T01NVTogTW9kaWZ5IHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlIGZvciBpb21tdXMNCiAgeGVuL2Fy
bTogdklPTU1VOiBNb2RpZnkgdGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgZm9yIGRvbTBsZXNzDQoN
CiBkb2NzL2Rlc2lnbnMvYXJtLXZpb21tdS5yc3QgICAgICAgICAgICAgfCAzOTAgKysrKysrKysr
Kw0KIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAgICAgICAgICB8ICAxMyArDQogZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jICAgICAgIHwgICA5ICsNCiB0b29scy9nb2xh
bmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gICAgfCAgIDIgKw0KIHRvb2xzL2dvbGFuZy94ZW5s
aWdodC90eXBlcy5nZW4uZ28gICAgICB8ICAgMSArDQogdG9vbHMvaW5jbHVkZS9saWJ4bC5oICAg
ICAgICAgICAgICAgICAgIHwgICA1ICsNCiB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAg
ICAgICAgICAgfCAgMTIgKw0KIHRvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYyAgICAgICAgICAg
ICB8ICAyMyArDQogdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYyAgICAgICAgICAgIHwgMjMw
ICsrKysrLQ0KIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsICAgICAgICB8ICAgNiAr
DQogdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCiB4ZW4v
YXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyAgICAgICAgICAgfCAgNzIgKysNCiB4ZW4vYXJjaC9h
cm0vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgfCAgMjYgKw0KIHhlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyAgICAgICAgICAgICB8IDEwMyArKy0NCiB4ZW4vYXJjaC9hcm0vZG9tY3RsLmMg
ICAgICAgICAgICAgICAgICAgfCAgMzEgKw0KIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21h
aW4uaCAgICAgICB8ICAgNCArDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvbW11LmggICAg
ICAgIHwgICA3ICsNCiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmlvbW11LmggICAgICAgfCAx
MTMgKysrDQogeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIHwgIDU1ICst
DQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAgICAgICAgIHwgIDEzICsNCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgICAgfCAgIDIgKw0KIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgICB8IDM2OSArKysrKysrKy0NCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5oICAgfCAgNDkgKy0NCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vdmlvbW11LmMgICAgfCAgOTYgKysrDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3ZzbW11LXYzLmMgIHwgOTU4ICsrKysrKysrKysrKysrKysrKysrKysrKw0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5oICB8ICAzMiArDQogeGVuL2luY2x1ZGUv
cHVibGljL2FyY2gtYXJtLmggICAgICAgICAgIHwgIDE0ICstDQogeGVuL2luY2x1ZGUvcHVibGlj
L2RldmljZV90cmVlX2RlZnMuaCAgIHwgICAxICsNCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmggICAgICAgICAgICAgfCAgMTggKw0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAg
ICAgICAgICB8ICAxMyArLQ0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgICAg
ICB8ICAgNCArDQogeGVuL3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgICAgIHwgICAy
ICsNCiAzMiBmaWxlcyBjaGFuZ2VkLCAyNjI3IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygt
KQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMvYXJtLXZpb21tdS5yc3QNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92aW9tbXUuYw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuaA0K
DQotLSANCjIuNDMuMA0K

