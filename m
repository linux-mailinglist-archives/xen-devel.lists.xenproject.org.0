Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CjpNnrUoGmrnAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 00:17:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433301B0D6D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 00:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242369.1542890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvkaj-0004iQ-8U; Thu, 26 Feb 2026 23:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242369.1542890; Thu, 26 Feb 2026 23:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvkaj-0004gR-5q; Thu, 26 Feb 2026 23:16:21 +0000
Received: by outflank-mailman (input) for mailman id 1242369;
 Thu, 26 Feb 2026 23:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvkah-0004gL-1B
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 23:16:19 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23150f17-1369-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 00:16:12 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by MW4PR03MB6523.namprd03.prod.outlook.com (2603:10b6:303:126::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 26 Feb
 2026 23:16:07 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 23:16:07 +0000
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
X-Inumbo-ID: 23150f17-1369-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g51g9UsoEcjV5UONX2iZOAvDAKQRYWt7WYgDbYZiG+pX/GXUS6rCw40qY7n2pUZki5cKSo+oRgvA0SfBc/8lFrR2NGq7ayPeOrc48RrEhzjPYk8Zkrvh967FKGFMi94DnMtg28jDJE/oSUoN2zEPkYgggeToVT82E6ciF+1qGYyQaQDnWku4/+Zwfc0/P/P9ozCrCSBtdpa/oXWOiNXOxLWGxHSZGs1KZzkgyniQ1fsCD+zzW67FLIz2EWOCeuDmX/CPRD69ucTxpAmMyfQCf+YqmpQ7NNFOU7huUuV+TyfELdbn2WHrKJmHB6vgB9N8aG9/ZAbhX79ksTPJG960Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guVa3+OYmh1pihRKb443wjadAhnEQSn1pbxf4/myDJ4=;
 b=aaW+vJxRSZOCJ8oimcUEpo1ZyNxpI0sOaGf94a9r+5BZSKmWN8rvzvbnTsI4b71mXfo327SFn8Kj9syuevySahtVLy6rjHq1BZhjYNLQIY0EaUMNDdN6QojmPymlFCmqjh8bpqDXeZBF1h0JY5LKr9zqddAsYTvJYkcPjeKeTdqvd7IEOmooYa0Sh4JyD6pM0iT21AlHU8mGNbRS8oz+oro6PZf3ADLKS343AdBBo9DAZtzXOVa31a5f00zKNOFfHrxhdop0rDFvcReIzkz4tkww8BQ2QeNbCfNfJgafxdxf+rMajssQUsaw+EYE49Qzmpy5tzLTimMGDboWE9aUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guVa3+OYmh1pihRKb443wjadAhnEQSn1pbxf4/myDJ4=;
 b=gM8PkCswEaQ01MCjSpkgVwAIht06SeI6YxF1hKXgGB92Wn9Enu+44+uOFj6cNmQA9fYTNGB9cd69hkFwt6bXj+ZEouKJ/+EAdnbmPgp8OimxGIKbgHLicHeG7IKlKb+fTtePaLL7TldXPppGQ+t5eU4Dq22vw2RpATdbP9PfcaM=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: RE: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Topic: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Index: AQHcpy8NKyz6wh/Wrk6CsdW/rK3ShrWVfM8AgAAgIzA=
Date: Thu, 26 Feb 2026 23:16:06 +0000
Message-ID:
 <LV3PR03MB77072E23139DF353E7B8C9D28772A@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
 <656ff614-9165-49ce-8c55-0cfad33d4ed6@vates.tech>
In-Reply-To: <656ff614-9165-49ce-8c55-0cfad33d4ed6@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|MW4PR03MB6523:EE_
x-ms-office365-filtering-correlation-id: 306eb9a0-6b72-409b-19fd-08de758d051f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 swXccXeX6OUfQla8I0uMxELIrC9rCPZOTeLMGuaYPK5kop5n2JhUeMThXOfj5npZNHOyf58nJTgwTRcRkgqMyEOTJ7L2s3WOorfgdifY0NDzVzdeREPJTr1qEixMtCxpPuxXzRXqUs/9dSt4wjZsRRDrr0XeW800aQDb/hoJVHln9rJiyg7U9ZvVfIXSmGvie+a72K/b0ekYZPgkba6Ga3xwoaSe6iPHZasu5AQtrrhZU1eUSZtKgP6tVIAqFdFdU4rIw34Ly7jOgCeVGfYxzbVnhn1/8o6tbI74BFLAvkKQDKV1+2p2gU1TkGiZkimdXEsDxnZ5k2JWk3+vXX6Dx7HmbkzTglIqX/HQq88XsS2KZ6/YCBpHOlWWscfvBbrVSWCMMtC0GleZBrb7WAYzwMCVDEP2TeyR/ltP4ZKi4mp7RCfC6UTwR2uy2p0EjUIP3rGe1iHD90QiNx5BRDrPG3KfTlMe5VMrYNk64BVAHEwutAkCw79+HPL+39bxm7lPY+53n6hY1kPU5JMGqI3aYAl1ZvRxU5RY2VQNb4UUwF6+mo3uaEoTkyC5r/FJnYlb5QXshqHXoX6SCZcphOvLkhhcqRjaXcjGBr3pqus4WeNhoPfXBVPvMHBkHHkl2AHJAefCK/1BQX0Kos9XCHP0FlcZiEJ8PuJqWzvC64oA+Q2GOS2DJYAY8p0oUe05rMQI8/vnXxitvfjZ9iMmL7sIzviHiwYuwZicUn6xASpMFWvkaoscVvCRgs+S2klsIRuG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnNKQktqMmYzYmtOMVhDdVJnZWZnTlRPRmtqWkJjY2J6VEVWSzVmcmgvQmh4?=
 =?utf-8?B?VHVPOFRhcERuNCtGOEsraGRUNGZIVU1LMG9NWEVxQlg0cnlXVUUxOHYrSG50?=
 =?utf-8?B?TEpqQVFRMTJWZG9jTWErYTkwS2tpNGhGdU16c21pZC9xNjBuME15TU8rV1FW?=
 =?utf-8?B?NDBOOTg4eHNpL1NCazJKZWdJVXcwMXhyMURucVBTTTlTQkV6Z3lucXMyK01I?=
 =?utf-8?B?T0tncmY2QitneFZXTVBRdzJnTzkzNHRlSllHdWMrdnRwUGx0ZGR1MlVYaWFK?=
 =?utf-8?B?VDdydGRXTDlQSU9XL1d6eG5PSEoxNmMyVjVLTFBDU3NHbWUydXo0ZlZvR1ZB?=
 =?utf-8?B?SnJRM05QNmhFZFVEdkJhdzR5eHhXTFZTTnpxQXdPN2RvSE5EbW52c3hiQ0VG?=
 =?utf-8?B?WDNNak42ZlhIbmtZVzRWVEhNUitUcm4yaDdjU0lZTVpKelBETmY0aTBrdW04?=
 =?utf-8?B?M0hhRFFZVHlLSFVTNUtmWlNpcFpkb1h0a0pRVnhhMzJxd05YcmxBUnQ2Y2Jw?=
 =?utf-8?B?OHcxeFU0TllROHBRNkVJV1V5WFF6WDVrMGsrWE1Xa1ltdnRtRllkKzdmdlVu?=
 =?utf-8?B?aDM3MzBTd3IxM0VjY1BlQWNyRE9UdXFWdCtNWTJmMUFvQlN2N2YweWRWbnR1?=
 =?utf-8?B?eFlDUDRDRFNSSmxmYWwxM0M0dWgrQXVaRjFXQjFGTnl5bE15Qk5wdHNBckRL?=
 =?utf-8?B?ZDRIeUpIUzg3NjhyTzNIRG1TMm9wRmVSOEZlWHRnaVY2ZlU5ZWtiU1NFUk9W?=
 =?utf-8?B?Y2EvNXh0RG1PY0UrdUJZZlFmQnE4WmZlSHZpWXFxNWo0QVlWQjZhUXJvV282?=
 =?utf-8?B?b1VGWGdkekExTFltUnFiSDJrWFhFclVqWHh3K05SN3dQRm5yR0x4V2VtQUdV?=
 =?utf-8?B?ZFVrL0xJcTE2TmFsU21laXFScnpFWnFzZk1YUjNqamFVcjVUaGROem5VWmJs?=
 =?utf-8?B?MHFqM3p5RGh3VFlYOEk4Vnk3UnlOcXhMZ1haOFJNVnFXVHEvemdiTDlVSVF4?=
 =?utf-8?B?azNwNGJvUFMzT3lTYXYrVlc2ZWtoU2dnclNZOGpPeDkvb051aTVuejZFNGE0?=
 =?utf-8?B?Q01yY3V3dlZDd2hsUElGRHZmT3cwRjkwU0lTMVhkSDdCeXV3T2NBVEQ1UXAr?=
 =?utf-8?B?ait4eE5mN0NYRUlSVU9BeVJjVThEMDFSRnJ5RVZjOG9lVlBGWFNidDlxZ284?=
 =?utf-8?B?NmlJSGdmWGxMR0E1VTZ6ci9hWXMyWTh4bnZ4UlNFVURaYUV6ZEdBcXVRb2Vv?=
 =?utf-8?B?eDlZY3ZBTGRPZlpQY09lYlNRZjgzWm5OczQ5MitNczcwcDQzU2UrZUx3S0Nu?=
 =?utf-8?B?U1NjLzI0UUR1cVhndW5kK2ZRV3AwS243QkNyVlNzY2J4MVhoMTRpd2ZTNzVu?=
 =?utf-8?B?S3JsaTluOFdFUWNuQjVQZkZzKzBIc01EbXNmcUlSUy9Lekd3bzJtN3N5anBo?=
 =?utf-8?B?bUN3dTkrZHZzT0tNTnh0UGM0L3lrVTZ3T1V0NGlKT3V2U29oeVVIcFVCOGc2?=
 =?utf-8?B?dFFCYlJjV2l2UG9qTUFXUWVoVTU1azBrUlR4T2FSOUhPZkQvWmFTeHh4TzNX?=
 =?utf-8?B?c3E0M3ZPMExiSEk0c3J3T1VNc3NLcVJ0VzFtZnEvNUN4N2NJZjFraUk1Qm5v?=
 =?utf-8?B?enVGN1FHYUlvdUZXSXg0dGNsblpkN0RITkV6U3JialZjZEt3UUJhUWw1OThB?=
 =?utf-8?B?cXVUc2RrSTdSNnR2ZUp1N1lPK3RwVTl1aXlEWWJWM05xeDE1VHlKWmRDeEpK?=
 =?utf-8?B?MVRWVDMvZ2NQWjlVNU0vRG9oeTBZZGMyd294d3dhZDd0T21vYVNXS3VoM0dT?=
 =?utf-8?B?cDRPWllKSDBRSHlRVDRRQ01KZ3A4TE91eUtrT1dmWHVWMis2NFoySDV4bkEy?=
 =?utf-8?B?dTRKNWlCR25hOHBSOC9aZTRRejBLb0lKRllhd1p2ZWZKZEpRWnBiY1VmNEZs?=
 =?utf-8?B?THN5L01mNjBYTTJUWVZ4aERiTXJNNjlzKy9iWkx6Y3lwQU1Vb1NnQlNsbnM1?=
 =?utf-8?B?VEZTQUNucXVNa1BWai9BVFAvUjZ0M3NPNzhkMVQ1UnRsSzN2dEZSTHJCSU1t?=
 =?utf-8?B?REVWMnFjVmg2VGVkR3Y3Y21mb2RkaEZvMzBKdWRVREdndlkveG10ZGNRL0JS?=
 =?utf-8?B?WVNHR3lBL0JQVG1URGY4bUV6Z3ZzYkp3WXRVcGZNOFR2ekpSWm16MWhvbFdP?=
 =?utf-8?B?Q0J4UUEvdFBoU1dyWTJTUEgvS25VWlkzR2N5Uk5wUHRxajVBSFMwUnY3Z0N4?=
 =?utf-8?B?SE1ZMGYxWXU5OUJjUnFiSnkxTllHeXpvaHhKcWJtS0F6YURpcmRtVCt0MHFa?=
 =?utf-8?B?MTFEYy9xQTBGb2pweHRjdmFnZTZJZVZuY0VKNnp5Tm5QOGJvbTJVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306eb9a0-6b72-409b-19fd-08de758d051f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 23:16:06.9607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNFpx3x7qq0osrssI5N2gnARu+cnKXJ9xbN+Of7EPHEX6HbJXp5RBHrE8ucT7uNFqIpoY1hrp+VJFB2sbWsydRmig2qcwnoJ3R6yVhlQ6aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6523
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 433301B0D6D
X-Rspamd-Action: no action

T24gMjYvMDIvMjAyNiDDoCAyMjoxOSwgVGVkZHkgQXN0aWUgYSDDqWNyaXQgOg0KPiBMZSAyNi8w
Mi8yMDI2IMOgIDE1OjU0LCBCZXJuaGFyZCBLYWluZGwgYSDDqWNyaXQgOg0KPj4gQWRkIGEgRE9N
Q1RMIGhhbmRsZXIgZm9yIGNsYWltaW5nIG1lbW9yeSB3aXRoIE5VTUEgYXdhcmVuZXNzLiBJdA0K
Pj4gcmVqZWN0cyBjbGFpbXMgd2hlbiBMTEMgY29sb3JpbmcgKGRvZXMgbm90IHN1cHBvcnQgY2xh
aW1zKSBpcyBlbmFibGVkDQo+PiBhbmQgdHJhbnNsYXRlcyB0aGUgcHVibGljIGNvbnN0YW50IHRv
IHRoZSBpbnRlcm5hbCBOVU1BX05PX05PREUuDQo+Pg0KPj4gVGhlIHJlcXVlc3QgaXMgZm9yd2Fy
ZGVkIHRvIGRvbWFpbl9zZXRfb3V0c3RhbmRpbmdfcGFnZXMoKSBmb3IgdGhlDQo+PiBhY3R1YWwg
Y2xhaW0gcHJvY2Vzc2luZy4gVGhlIGhhbmRsZXIgdXNlcyB0aGUgc2FtZSBYU00gaG9vayBhcyB0
aGUNCj4+IGxlZ2FjeSBYRU5NRU1fY2xhaW1fcGFnZXMgaHlwZXJjYWxsLg0KPj4NCj4+IFdoaWxl
IHRoZSB1bmRlcmx5aW5nIGluZnJhc3RydWN0dXJlIGN1cnJlbnRseSBzdXBwb3J0cyBvbmx5IGEg
c2luZ2xlDQo+PiBjbGFpbSwgdGhlIHB1YmxpYyBoeXBlcmNhbGwgaW50ZXJmYWNlIGlzIGRlc2ln
bmVkIHRvIGJlIGV4dGVuc2libGUgZm9yDQo+PiBtdWx0aXBsZSBjbGFpbXMgaW4gdGhlIGZ1dHVy
ZSB3aXRob3V0IGJyZWFraW5nIHRoZSBBUEkuDQo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGUgaWRl
YSBvZiBpbnRyb2R1Y2luZyBhIG5ldyBoeXBlcmNhbGwgZm9yIHRoaXMNCj4gb3BlcmF0aW9uLiBU
aG91Z2ggSSBtYXkgYmUgbWlzc2luZyBzb21lIGNvbnRleHQgYWJvdXQgdGhlIHJlYXNvbnMgb2YN
Cj4gaW50cm9kdWNpbmcgYSBuZXcgaHlwZXJjYWxsLg0KPg0KPiBYRU5NRU1fY2xhaW1fcGFnZXMg
ZG9lc24ndCBoYXZlIGFjdHVhbCBzdXBwb3J0IGZvciBOVU1BLCBidXQgdGhlDQo+IGh5cGVyY2Fs
bCBpbnRlcmZhY2Ugc2VlbXMgdG8gZGVmaW5lIGl0IChlLmcgeW91IGNhbiBwYXNzDQo+IFhFTk1F
TUZfZXhhY3Rfbm9kZShuKSB0byBtZW1fZmxhZ3MpLiBXb3VsZCBpdCBiZSBwcmVmZXJhYmxlIGlu
c3RlYWQgdG8NCj4gbWFrZSBYRU5NRU1fY2xhaW1fcGFnZXMgYXdhcmUgb2YgTlVNQS1yZWxhdGVk
IFhFTk1FTUYgZmxhZ3MgPw0KDQpIZWxsbyBUZWRkeSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJl
dmlldyDigJQgbXVjaCBhcHByZWNpYXRlZC4NCg0KVXBkYXRpbmcgdGhlIGRvX21lbW9yeV9vcChY
RU5NRU1fY2xhaW1fcGFnZXMpIGhhbmRsZXIgdG8gYWNjZXB0IGEgbm9kZQ0KcGFyYW1ldGVyLCBh
cyB5b3Ugc3VnZ2VzdGVkLCBpcyBpbmRlZWQgYSBwcmFjdGljYWwgd2F5IHRvIHJldHJvZml0IHRo
aXMNCmZlYXR1cmUgaW50byBleGlzdGluZyBYZW4gYnVpbGRzLiBUaGF04oCZcyBhbHNvIHRoZSBh
cHByb2FjaCB3ZSB0b29rIGluDQp2MSBvZiB0aGlzIHNlcmllczoNCg0KKiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDMvbXNnMDExMjcu
aHRtbA0KKiBodHRwczovL3BhdGNoZXcub3JnL1hlbi8yMDI1MDMxNDE3MjUwMi41MzQ5OC0xLWFs
ZWphbmRyby52YWxsZWpvQGNsb3VkLmNvbS8NCg0KV2UgYXJlIGN1cnJlbnRseSB1c2luZyB0aGlz
IGFwcHJvYWNoIGFsc28gaW4gdGhlIFhTOSBQdWJsaWMgUHJldmlldzoNCg0KKiBodHRwczovL3d3
dy54ZW5zZXJ2ZXIuY29tL2Rvd25sb2Fkcy94czktcHJldmlldw0KDQpUaGF0IHNhaWQsIGR1cmlu
ZyByZXZpZXcsIFJvZ2VyIFBhdSBNb25uw6kgc3VnZ2VzdGVkIHRoYXQgZm9yIHVwc3RyZWFtDQpp
bmNsdXNpb24sIHdlIHNob3VsZCBpbnRyb2R1Y2UgYSBuZXcgaHlwZXJjYWxsIEFQSSB3aXRoIHN1
cHBvcnQgZm9yDQptdWx0aS1ub2RlIGNsYWltcywgZXZlbiBpZiB0aGUgaW5pdGlhbCBpbmZyYXN0
cnVjdHVyZSBvbmx5IGhhbmRsZXMNCmEgc2luZ2xlIG5vZGUuIFNlZToNCg0KKiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDA0
ODQuaHRtbA0KDQpIZSByYWlzZWQgdGhlIGNvbmNlcm4gdGhhdCB0aGUgY3VycmVudCBpbnRlcmZh
Y2UgZWZmZWN0aXZlbHkgY29uc3RyYWlucw0KZG9tYWlucyB0byBiZSBhbGxvY2F0ZWQgZnJvbSBv
bmUgbm9kZSBhdCBhIHRpbWUsIG9yIHRvIHNlcXVlbmNlIGNsYWltcw0KYWNyb3NzIG5vZGVzLCB3
aGljaCB1bmRlcm1pbmVzIHRoZSBwdXJwb3NlIG9mIGNsYWltcy4NCg0KSW5zdGVhZCwgaGUgcHJv
cG9zZWQgdGhhdCB0aGUgaHlwZXJjYWxsIGludGVyZmFjZSB3b3VsZCBpZGVhbGx5IGFsbG93DQpt
YWtpbmcgbXVsdGktbm9kZSBjbGFpbXMgYXRvbWljYWxseSwgcmF0aGVyIHRoYW4gcmVxdWlyaW5n
IG11bHRpcGxlDQpjYWxscyB3aXRoIHJvbGxiYWNrIGluIGNhc2Ugb2YgZmFpbHVyZS4NCg0KSSBm
YXZvdXIgUm9nZXLigJlzIHBvc2l0aW9uIGFzIHdlbGw6IEkgdGhpbmsgd2Ugc2hvdWxkIGFpbSBm
b3IgYSBjbGVhbg0KYW5kIGV4dGVuc2libGUgaW50ZXJmYWNlIHRoYXQgc3VwcG9ydHMgY2xhaW1z
IGFjcm9zcyBtdWx0aXBsZSBub2Rlcw0KaW4gYSBzaW5nbGUgY2FsbC4gT3RoZXJ3aXNlLCB3ZSBy
aXNrIGhhdmluZyB0byBpbnRyb2R1Y2UgeWV0IGFub3RoZXINCmh5cGVyY2FsbCBsYXRlciB3aGVu
IGEgcmVhbC13b3JsZCBzY2VuYXJpbyByZXF1aXJlcyBtdWx0aS1ub2RlIGNsYWltcy4NCg0KT24g
dGhlIGltcGxlbWVudGF0aW9uIHNpZGUsIGEgcmVsaWFibGUgZmlyc3QtY29tZSwgZmlyc3Qtc2Vy
dmVkIG1lY2hhbmlzbQ0KZm9yIG11bHRpLW5vZGUgY2xhaW1zIHdpbGwgcmVxdWlyZSBzZXJpYWxp
c2F0aW9uIGluIHRoZSBjZW50cmFsIGNsYWltIHBhdGguDQpDdXJyZW50bHksIHRoZSBnbG9iYWwg
aGVhcF9sb2NrIHByb3ZpZGVzIHRoYXQgcHJvdGVjdGlvbiwgYW5kIGl0IHdvdWxkDQpuYXR1cmFs
bHkgY292ZXIgdGhlIGNyZWF0aW9uIG9mIGEgbXVsdGktbm9kZSBjbGFpbSB1bmRlciBhIHNpbmds
ZSBsb2NrLA0KZW5zdXJpbmcgYXRvbWljaXR5IGFuZCBjb25zaXN0ZW50IGJlaGF2aW91ci4NCg0K
VGhhbmtzIGFnYWluIGZvciB0aGUgcmV2aWV3IGFuZCBmZWVkYmFjayENCg0KQmVzdCByZWdhcmRz
IC8gQmllbiBjb3JkaWFsZW1lbnQgLyBTYWx1ZG9zIC8gTGllYmUgR3LDvMOfZSwNCg0KV2l0aCB3
YXJtIGdyZWV0aW5ncyBmcm9tIFZpZW5uYS9BdXN0cmlhLA0KQmVybmhhcmQNCg==

