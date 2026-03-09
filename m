Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHGCIkXbrmm/JQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:37:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D734923AA4A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249535.1547011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbjE-000182-LP; Mon, 09 Mar 2026 14:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249535.1547011; Mon, 09 Mar 2026 14:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbjE-00015N-Ig; Mon, 09 Mar 2026 14:37:04 +0000
Received: by outflank-mailman (input) for mailman id 1249535;
 Mon, 09 Mar 2026 14:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNRQ=BJ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vzbjC-00015G-UI
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 14:37:03 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd13596-1bc5-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 15:37:00 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by SJ0PR03MB5408.namprd03.prod.outlook.com (2603:10b6:a03:279::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:36:56 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 14:36:56 +0000
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
X-Inumbo-ID: 6dd13596-1bc5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7biId/RZDq2zRT2MEMUxGAbRn1zhiREYSmSZQfSQbK5VtB2s0LUeNXPKxMBgesm53hLs2ZWT4PYhV/SrgEhYJTgYfCKTTGppLY0XMq4Ipt/hEyEpShWktDJjO7YLO+5+16+AnUWJy2JbhtLLH7ZhsO0YWGuGmA5tpDJAwXbqqGVJHQ5R3YYOGgAS2PCyytc7rRmN50BiIMYz3nejjc28rJjDaZObIC4QGIj/a0e4ECLA8y1yXWOK8P58yiDX/DUGFbP9W+2uyySUsfR4gWQ2LwoS4N259pIN4nmxJdIhbVOnVADAcSdoF7QNsaJ2wd7GyKqCdv7+FRJYPPuWf8tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMn9meAwVwU60QdOvQPVGX3C2BUIMnIRG9tYAyWqk3Y=;
 b=Cbutw7C/zwXUyfD8hgKat7VXiJ7CRV0mU8GgTU68SmzwFoL78cuJTs0rWuPJFFGfdcHY5UsnQ36aQzNespF1UDTkns6d68zTHU6FMW+O8waNYzQ/+sXvvmSS/KgcNA6Wc5vcP9mHlPXdmit/0CdHjxYzFa1BzuUOf6CNhTB6XW2Qo01rJ3HdJg2qMMgoZ1gG2OWUiR4Sy1UQGCcKIwUvl1NDCEUEeMLIuqBCv/K3MLqL65OKnxUATeOoP3Z0k60WjglujnYIQIF4RpBDms7e7DUEqWfHuXW+DPuG831qgS/iy5c/TQ3rkkZEFYJIBPoLyrnsrYlRAqWHiLpS2nT/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMn9meAwVwU60QdOvQPVGX3C2BUIMnIRG9tYAyWqk3Y=;
 b=gnIyPzcab0Of8ra0nZwtiOUJxSxfp3HQfMX3td6dyUI/8tHAFGbHolfz+SBvH6xHdmqNC5eiHkeEpsYn0th/nS8fHiRw+lXRpR8wQI0H54LwZOPqOmtW3nfCzIDUlZRwfknlg+VMBqLiszWAQQVmMfSy4JSHTUKhcUkrYfFFL2s=
From: Edwin Torok <edwin.torok@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v4] tools/tests/x86_emulator: avoid duplicate symbol error
 with clang: use -O0
Thread-Topic: [PATCH v4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Thread-Index: AQHcr7FQiijdIWu12E6i9XJI47BDXrWmPvcAgAAF8wA=
Date: Mon, 9 Mar 2026 14:36:55 +0000
Message-ID: <630D14BE-E962-47EC-A2DD-4E152FA32EFE@citrix.com>
References:
 <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
 <aa7V_nOG0ctnjxH3@macbook.local>
In-Reply-To: <aa7V_nOG0ctnjxH3@macbook.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|SJ0PR03MB5408:EE_
x-ms-office365-filtering-correlation-id: 7d8bc039-6db6-4e6c-6353-08de7de95032
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 EstzD/jhn+QNFAsBQh97VuUMUJicasaGV8JRqg+/WnXaDM3b/9RVOm2BhJCb+/fcvP2BxCUniXfTnNDBoOUtBMyVM4PNRkEY08lbBqyxPPlIVuq5cmhMUanRTI58AM+HzaWkfkx+FCWogBhY3h42WBJgp4Yz8BhYa5b3CPZX9DShqgO8RJQoU1jEKXziNx3gPN/khwO6Pe6GDcRJTIx6VNo5dYMV5JP6J07xkoH8+x/M6/o1WeoGjar7EdAb3Zx+KZWIb9JjjHUAHDZWFytvprvKe5v//0mRRWXniBwBNACIh9pHwi1NeiEkhKL6UG5OczTk4Kv1S6BdVtgb4CxEsSYEJWYBRKG5IOOJ4TneQEloMvQx4GVpk6OyX89q/9VTcrlUhNrmm3QC4p3UBvjrIG/1pZJGU7ZCoUfU9IkFUXAlK3gUZ6GmKdBkXxnJPGAIU6q/521ZEMOcqxnZrqWcOCJNZypPm0KMSiMesynN+6F0fb45yJy7IY1YDd/D9aJ6whqeIZHINMa4J+KU5ZNfC+nmcd90OaNxWvvvHUPaDaZslPq8nCwdxMt41MJYOnx6Rgc6smJYBa2Y8LNCRy5MTRQVi2Dh2Xs7MBrITGQGaVnsUWoXTGSscLJxogam9qSNjfrv2KDeesmt0oURZ8/3jvlkZxVeL3+bi/50unXYvtwOvjaGqV3hF12gJqO+/6fSLEyrWlgSSEA07GuGM+pgeWWmxPlyryAuVMUtbDcP6KtNLlBD8/HDpeOABAURum+U
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG84cnpCaFNCSG5zMjZFV2dkTmZncHFrRXB1NUF6NWpyYWRPWTZLeDNvV3B1?=
 =?utf-8?B?WFdTL1ZlRVprdUpOc01ESU5KYjUzcGwvNHJnN1NQd3ZkQ1dFV3dNOFpoY3pt?=
 =?utf-8?B?N21OTmVaUHBPQ3lJeFMydHRvK0wrTElXTU9BT2lnSUVIY2MyR2N1aXcvNFl1?=
 =?utf-8?B?VXFBeXZGczdwcFJVNVYvQ0FUcXdldDNjZlVzSTZ3YWV5alZRTXJzRVhOUTNJ?=
 =?utf-8?B?WFM5bU5pZVB4cG5veEhxZzJYb0xXVnhFNmRsRzVadktDNVJydkFSSW9Na0pz?=
 =?utf-8?B?TFNvaWVFVFhxaXpRZ0Zqc2U2QTV1WFlmS1ZCeHdYeWhrTWQyQTlTVmt3Ritz?=
 =?utf-8?B?TmhkWlFLTlcvRnlZQlgrRlRxdGVwVXVuYThrdEZyUzNyM1lSUnQyQ1V4V0E4?=
 =?utf-8?B?U2VTM0RXeWExTFUyYXo2UXl3YXNvNVIwRkhjVThFV1JBclkvakhCeVY3WVFq?=
 =?utf-8?B?L1F5TFR3bkIwd3lJdk15ZTJMVzRSbG9zMkhZY29Wb0hrcnpRY3hBeXNCakZI?=
 =?utf-8?B?dkFzQnVuVWlIZWhYV1ZoSDZpZlFLOWxqK24xd2J4TGhIWW5SQWc0d0RFTDRa?=
 =?utf-8?B?bWlWM050RHhlU29zdE9iS0lRZW50V2VkK2JSK3hKY1VsRmpleWRRalo0dHd2?=
 =?utf-8?B?Z2I1ZmR6VE00N2lOcnNwNkxBdWdORUQyaFlZTmtteWdCY1R3Zm4vMWE2bnM2?=
 =?utf-8?B?NkFRRGlOOG1laVQvNnJMczR2bk1qZmw0a050ZVhKbFRXQkw2RFlvRmhxekM3?=
 =?utf-8?B?UVl6SWZZemo2ZHdFeFhlb3Z0QmtReCs4TlVib004bnVWcUlCQUpRN2dMTkNk?=
 =?utf-8?B?Q2kvd3FqSUg0MklpUE5OSVYycU9MaFJ1QVlGM2NsL0ZQajlhZUZ2eG9ad2R2?=
 =?utf-8?B?dHF3Qks0ay9GMkdSU2g0NjJjQnhPQzVsWk5EK2huMU5BeFRuU0JQUGNlR1JS?=
 =?utf-8?B?MGUwNkpuY2h5K3hTSi9SWjVMK0pOVTBvbmlSQ3h6UG43bzlSV0RPZWljSWlZ?=
 =?utf-8?B?akk1T1p2eDZNMmlpWWVRMHFnREprVWs1a09mK0lwZGtDSEZPaGwwQitHWTll?=
 =?utf-8?B?YUd0cmxZL3d4N2pkQzNDZ3NzSTM2clZET1pDeVc0R2JIN1A2aktqY08wb2Qx?=
 =?utf-8?B?NjlENFNVK1RLQ3RkKzZtME9QNEtEbnc5bXVMZmp1ZEhlL1FCREdPZnpFQm1T?=
 =?utf-8?B?WXB0TTBJU1VQc2J4dStDQnppYllNdDFiV1orUzFXVlFQbGpTY1pzZzVNMDRS?=
 =?utf-8?B?UENjWDRuVU42OGF2WWFaZ2JsTzV4U2paeUFiOWtVZ3UyNVJLcVBpQmg5STBi?=
 =?utf-8?B?eGtQMXd0R1IrQ1lMWUw5WnVSaXMyTVpsYkVDWU94NkxpM2hGWkxoc2cxaWJw?=
 =?utf-8?B?K3pjUXFpWDliUk9zeUF2YXBoRXZOQVZtM3Y2aVhnbVg1RVdCY1ExcE12V2E4?=
 =?utf-8?B?eHZTd3o5Yzk4bmVlUG4yUGNTQ0RvZkZPeGtEMjV6OGRaRUNYSGI1ajBNSEhK?=
 =?utf-8?B?bTJTZUoydktHRkFWaENzVHQrVVFpYUFOWkZjK3ErajVjYWFKM2RNNzdxcDdS?=
 =?utf-8?B?dTd5YmtPWFc5K3dqSjdac0t5dldJdFhCYjlqc3g3UTN1NDFmV1FjUmxYNE9D?=
 =?utf-8?B?WXczTExKRTFwaDI5RURaaEp1R1Vic3JjZS9vVWVuZnFkQUVXaTdRWU8vZUFi?=
 =?utf-8?B?c05BSjlhUEhWS2V2d2RFQzhKRjZ0RmFJZkVaVkpIRGFuRitHNFF1dS90bmVu?=
 =?utf-8?B?WkoxcGE0RE5McnZyb2xvVDh3OTdJMnIvNUVpSXpkbUFsTDM4dVBicEszUCth?=
 =?utf-8?B?NThJUjhUSzVoUDUzQ0M3MVk5Yjl4SVJ3QkNwQmViWDk5TE1ycHFBMzhtc0FC?=
 =?utf-8?B?WFFUL3dVTWMydVZTOENwRjRmd1djQ1VKSWEvdjFaRFI3VXhmdWI4ZyttMWhv?=
 =?utf-8?B?RitEMUpsdmVic1NueThGbk1oTTlWVEdYZTZ4TFl2Z1d3RW1kcWtSazliSzNS?=
 =?utf-8?B?Zi84bnF5OTFSTzdCZkpKYlZCNFlNdStRUVlhYU1LbjBPMEJpcTIrbGpnN3Uw?=
 =?utf-8?B?NHc5MFJ6OXFHMDg3U2FJOXRHbGtzcEh0b3E2TkFmNkllM01YWm9HbVBJRUFj?=
 =?utf-8?B?RUFjNFNXcFN2OStGRWpuTC9LaTV2dThnN0dFYUc5YVNzUWVPV214MStFeU5Y?=
 =?utf-8?B?YkZ5UmNIeHlHM2R2UUtvOWIwYy91WHExR2crbUdJS2hXMVZjR0tGeGNtSUZL?=
 =?utf-8?B?TGEra21TWjZlVGt0ekdrWHNQTzFKakdkcjF6VVV2TzVXUitreXFPTitLdlJk?=
 =?utf-8?B?YUZIcnhwbCtQWDJiQURVNEttazBwZzAwM3Rtc3BwemxiWFBxNFdVcThBUUl3?=
 =?utf-8?Q?OtY42NnSf9qCRFM4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49CBA71D35CA6041BF82201DEFF07AE0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8bc039-6db6-4e6c-6353-08de7de95032
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 14:36:55.9016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNBLnklxrPqfcYPks2ipmPtE3nSrJfk+QtPvLIOVfvAY+3eLcnHcpThdsl5+SBdsjjusKiSlHC8oQlmyxEFWtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5408
X-Rspamd-Queue-Id: D734923AA4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gOSBNYXIgMjAyNiwgYXQgMTQ6MTUsIFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBNYXIgMDksIDIwMjYgYXQgMTA6NDE6
MzVBTSArMDAwMCwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+IGNsYW5nIHdvdWxkIGR1cGxpY2F0
ZSB0aGUgbG9vcCBib2R5IGFuZCBlbmQgdXAgd2l0aCBhIGRvdWJsZSBkZWZpbml0aW9uDQo+PiBv
ZiB0aGUgc3ltYm9sOg0KPj4gYGBgDQo+PiAvdG1wL3Rlc3RfeDg2X2VtdWxhdG9yLTBmMzU3Ni5z
OjI3ODIzOiBFcnJvcjogc3ltYm9sIGB2bW92c2hfdG9fbWVtJyBpcyBhbHJlYWR5IGRlZmluZWQN
Cj4+IC90bXAvdGVzdF94ODZfZW11bGF0b3ItMGYzNTc2LnM6Mjc4MjU6IEVycm9yOiBzeW1ib2wg
YC5Mdm1vdnNoX3RvX21lbV9lbmQnIGlzIGFscmVhZHkgZGVmaW5lZA0KPj4gYGBgDQo+PiANCj4+
IFVudGlsIGEgYmV0dGVyIHNvbHV0aW9uIGlzIGZvdW5kOiByZWR1Y2Ugb3B0aW1pemF0aW9ucyBp
biB0aGUgdGVzdCBydW5uZXIuDQo+PiANCj4+IFVzaW5nIC1PcyBtaWdodCBhbHNvIHdvcmssIGJ1
dCB3ZSBjYW4ndCByZWx5IG9uIHRoZSBzaXplIG9wdGltaXphdGlvbg0KPj4gYWx3YXlzIGF2b2lk
aW5nIHRoZSBkdXBsaWNhdGlvbiBvZiBhc20gYmxvY2tzLg0KPj4gVGhpcyBpcyB0ZXN0IGNvZGUs
IG5vdCBwZXJmb3JtYW5jZSBjcml0aWNhbCBjb2RlLCBhbmQgLU8wIGlzIG1vcmUgZnV0dXJlDQo+
PiBwcm9vZi4NCj4+IEhvd2V2ZXIgZm9yIGRlYnVnZ2luZyAtT2cgaXMgcmVjb21tZW5kZWQgb3Zl
ciAtTzAsIGFuZCB0aGlzIHN0aWxsDQo+PiBhdm9pZHMgdGhlIGR1cGxpY2F0ZSBsYWJlbCBwcm9i
bGVtLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHdpbi50b3Jva0Bj
aXRyaXguY29tPg0KPiANCj4gQnVpbGRpbmcgdGhlIHg4NiBlbXVsYXRvciB0ZXN0IGhhcm5lc3Mg
aXMgY3VycmVudGx5IGdhdGVkIG9uOg0KPiANCj4gaWZuZXEgKCQoY2xhbmcpLHkpDQo+IFNVQkRJ
UlMtJChDT05GSUdfWDg2KSArPSB4ODZfZW11bGF0b3INCj4gZW5kaWYNCg0KR29vZCBwb2ludCwg
SSBoYXZlbuKAmXQgc3BvdHRlZCB0aGF0Lg0KQWx0aG91Z2ggSSBkb27igJl0IHRoaW5rIHRoYXQg
ZmxhZyBpcyBzZXQgaWYgeW91IHNldCBDQz1jbGFuZy9IT1NUQ0M9Y2xhbmcgaW5zdGVhZCBvZiB1
c2luZyBjbGFuZz15Lg0KKEkgb25seSBkaXNjb3ZlcmVkIGNsYW5nPXkgYWZ0ZXIgSSBzdGFydGVk
IGZpeGluZyBzb21lIGNsYW5nIGJ1aWxkIGZhaWx1cmVzKS4NCg0KPiANCj4gU28gSSB0aGluayB0
aGVyZSBzaG91bGQgYmUgYSBmdXJ0aGVyIHBhdGNoIChvciBkb25lIGhlcmUpIHRoYXQgcmVtb3Zl
ZA0KPiB0aGlzIGNoZWNrLg0KPiAgQW5kIHRoZW4gd2Ugc2hvdWxkIGFsc28gcnVuIHRoZSB0ZXN0
IGhhcm5lc3MgZnJvbSBvbmUgb2YNCj4gdGhlIExMVk0gRnJlZUJTRCBidWlsZHMgaWRlYWxseS4N
Cg0KDQpSdW5uaW5nIHdpdGggY2xhbmcgd291bGQgY3VycmVudGx5IGZhaWwuDQpTZWUgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzEwQjFCN0Q5LTM1MkYtNDIwMy1BQzMwLTg4RUY2
NzQxMTRGNUBjaXRyaXguY29tLw0KVW50aWwgYSAoYmV0dGVyKSBzb2x1dGlvbiBpcyBmb3VuZCBm
b3IgdGhhdCwgaWYgSSByZW1vdmUgdGhlIGdhdGUgdGhlbiBJIGFzc3VtZSB0aGUgQ0kgd291bGQg
ZmFpbD8NCg0KSSB0aGluayBpdOKAmWQgYmUgdXNlZnVsIHRvIGVuYWJsZSBidWlsZC10ZXN0aW5n
IHdpdGggY2xhbmcgdGhvdWdoLCBzbyBJIGNvdWxkIHJlbW92ZSB0aGUgU1VCRElSUyBnYXRlLA0K
YW5kIGludHJvZHVjZSBhIGdhdGUgb24gdGhlIHRlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZTpy
dW4gcnVsZSBpbnN0ZWFkPw0KDQo+IA0KPiBIYXZlIHlvdSB0ZXN0ZWQgd2l0aCBhIGZ1bGwgTExW
TSBiYXNlZCB0b29sY2hhaW4gKHNvIGFsc28gdXNpbmcgTExWTQ0KPiBsaW5rZXI/KQ0KDQpObywg
dGhlIGNsYW5nIEnigJltIHVzaW5nIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBiaW51dGlscyBs
aW5rZXIgYnkgZGVmYXVsdC4NCg0KQmVzdCByZWdhcmRzLA0K4oCURWR3aW4=

