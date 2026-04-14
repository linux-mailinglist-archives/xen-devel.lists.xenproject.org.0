Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CHgD19f3mn+CQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 17:38:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F83FBFCC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 17:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282025.1564723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCfWN-0001pj-AY; Tue, 14 Apr 2026 15:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282025.1564723; Tue, 14 Apr 2026 15:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCfWN-0001oT-6y; Tue, 14 Apr 2026 15:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1282025;
 Tue, 14 Apr 2026 15:17:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wCfWL-0001oN-Gd
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:17:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCfWK-00GyXU-9N
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 17:17:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de5a8d-e002-0a2a0a5209dd-0a2a4507c124-24
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 17:17:44 +0200
Received: from [52.101.46.23]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de5a96-ba2d-0a2a45070019-34652e17cb91-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 17:17:43 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CH0PR03MB6068.namprd03.prod.outlook.com (2603:10b6:610:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:17:36 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 15:17:36 +0000
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
 b=UJa63nQ03rQ1ZJTYobZsogUzbIpx+EondWqH4Bec3pcCtz4P4SX+I3Kzax8VKiO9ltbMt451MtjvE/zlSHXYF+YojF69tZOSO1eiGrL1tn8PpAxgLHrLYpnHZ/nNjw92L/zWgRdCkZLSvhKUB/DenD71LLtHbe01TwglAv0C66rb/vYCZhfmfARb+JsXnHAsqURW7HYZs/TyEmB1BrszlPMqNS8N5hp4VNMPxsBNu48rBCRWuFu8C1lZ23cF+Ix2rFuc1J0v9UGCV/K9WbVwvf9q//bxGCctGd+cWxkvaLr4YgaB7IozU8THBEZ2rjzM66i7Wod8t3Q8+Bm9LTVWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keQrFtT9dt5ZDdhDEWvYWBjAYAxqqgcuTssWiEsqDlA=;
 b=rJkjXr3G7mVd6a41emhNx26+KWoRoHoKi4AP8xysX9LcPRxcR1WS3tg1n/yZHGskO25OxDz5pEFLtYhDThq2PIWi2FPPR0DnlPp4ukWmuLdF+8XF+DN03gnmfA1kKH+qq+PrzBXOFObWFBW784wmLYXPP8ZlVyDELXwK4fXpB/1dxf6VEw6ufitVP7W2xsn9iwUjiwcB9iZf/zU3Hvq9HpEYje8+4rp7D9fPfGsugxTfjZaZgpQEWWtf3wtLb9eQK4wzuBxFy1zB/84kdSwO5rUs0bneWf11ThHgi818eQRRK+Q26Bo5VT6WY3ifCQ/xOK6dKbeMaLjGMityl4zUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keQrFtT9dt5ZDdhDEWvYWBjAYAxqqgcuTssWiEsqDlA=;
 b=icj9r5onP9krSxqdkoxnUG1CoLloS3f81fSgsjHl5FTFcvla8N1F39CDPG2Smy3azY9CqM1q1A05ucaDw3Zek3Ge2w8y+NJPI9mWVS2HgVfMZNey+fLAdmZ7KAFWlMD6LydUPSjdNqRkhlwmXSLDQat3djwsNGUvRuRlEL/Lhak=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Topic: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Index: AQHcpy8NKyz6wh/Wrk6CsdW/rK3ShrWf2LiAgAAdICA=
Date: Tue, 14 Apr 2026 15:17:36 +0000
Message-ID:
 <LV3PR03MB7707A579E5CBD292B127995C87252@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
 <7d439bb1-7381-4fa4-af79-423e8c7fafb1@suse.com>
In-Reply-To: <7d439bb1-7381-4fa4-af79-423e8c7fafb1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|CH0PR03MB6068:EE_
x-ms-office365-filtering-correlation-id: 77f1c313-5d3a-4652-4d28-08de9a38f58d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 T7qMN6GaovhBvpVEWSNChHSDG1Doiz0eLAtJgMSJEy4ePhr4HSb3+a/jRi/qUBz61MUmV0Reel6R/Pjs9jS5qu0F84NWKpjz6CXi6XYpzW6fDn4zt9e9aLKEjIyGX4v2NnmA5RKWqillc9hHptPdaRHjn8gjHXzMpB69M15dnr/MwQ9H+W4DsIbGSS8GFPVwJvLTFoEk6sAQ1jcoZ7Pkib5tsufJZZHWSqfbdXvT+BbqWHPH2MYbG04tHIHIplfKAZnGBuDbN3JIhlwR9CiK2j2+HquRKKptqk7nnzQqDZ+RRkAF6TADTourwlHzLzDRFR7MHW+NEFNUiiSWaGFtcmYF9aMV53Xmf1TWhOVoWdypeKimlZmw5OiHgqyiDDOod2YHYEGvlFPyN64r6NZ45IxZBqooZtkzh4sAZfMvQP9p7iTC7+ol0L8EknD7vIyjiuRJp9QFPNscbEI8VeBGcSziOYxgMTWF/QBOPzT0k8hZVXJRr7qhsmrr970HfMf0whvkOJTx4zdj/LpKNlWR07U0QfyNhXlFC/XcE6l1hMTnsxOUU3Z97M53iSOATmKbLHrphUHoTZlXVRYYS+//LqdtEQWLJfzxouGOwjyYJqYS7JxpH77mNddPCB7tgNC3dt+gHA1sdPlDM5VE+QfYJ/UoUMJrA3y17Ikwyo6d0P04FjraZRzTqkS8hZSIuLg9zsf4rpJnyPnvsITUBsg2OC2j1ZU8VBbQn1ACyVYpPmiAxEbXj5mZALByrQCBXAtR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czdkcEpkbUhjSnc3K2hianYya1M4cVZvNmhYKyt3S1drdFN0b0ZMUHBJVzg5?=
 =?utf-8?B?S2ZuSEd6MTBHdzRXR2JLSkFyZkZhLzNkN0NmMW1xMVZwZEJIMnlRbVFsVnc1?=
 =?utf-8?B?eUNIOEZDRXBlUVIySUI4dU55MXdUZDRMTGlZbDZUTEY3d0Z5N1JheFpxOTFH?=
 =?utf-8?B?UHJ6SzkwTWZJNEJScGo2MTQ2eWp1bU9zVjVJWDluYXhBbm9KNHgzakxLWTIr?=
 =?utf-8?B?S3RSbmRrMVNHV2xocW84ZU5hSThIT2kyY3F2RGtCaHluQ0hBWk4wYTdVeTVy?=
 =?utf-8?B?dlBPRHFtNXF1dTJpcnhUU1VrMVFwSUlwY0VjbndrVjJ1ekdpUkhyYVJjOVE5?=
 =?utf-8?B?MkJiTDZVV0JMVUY4dVRVYzBjTTNFdlE3UVc3TUx3WldsMlljS29QaHRSWjg0?=
 =?utf-8?B?N09qbkRoczdqREwrSzg2clV0blZielJLSXNZbFlDMlJZUU0xU1I1VHJnTHpi?=
 =?utf-8?B?SzNHVDJBZHlQQWc4NHlEaU9nMGU1WTMyZkZiZDZVUkQyWCtLbGkxajVYMkpz?=
 =?utf-8?B?NGZHRGViNnNIaXVPOXFGMHBZWEF0ZkV2anVaNmpndDJGYVFMNEVmUEF6MWZw?=
 =?utf-8?B?WEttRUwvdVFadDcvWFVLNnFCanZDWEVCTThDM2JyT1VEbVFEdElBT0FRTU84?=
 =?utf-8?B?dUhtcld5RGU5RTczcHA4Y2lrQlpkczIrTUE4MnFlM29xd0pGWFUyYklaZVNB?=
 =?utf-8?B?NkkxZmFvUGF4elp6TXM4YXk2bk9XcHpJZDFGQm5wUU5RY3RFVlpOTkIxc2Vo?=
 =?utf-8?B?d2tpSGdHOXpUWkl3WFlmbmY5UkFEZ3BBL205aWlnUTN4ZzQweG8yVjZ0L3RZ?=
 =?utf-8?B?cXhMaE9LclQyaVQxd0NpQmZ2bm9pLzFoVWlONWpidkZlTTJudHFYRzFJL1BT?=
 =?utf-8?B?bnRINHUwYzgvcnVHMGpiUzV5STAxMWNzaEswQkpLM0RpK25TcVoxOWpvYnZ4?=
 =?utf-8?B?K1ZjQXphTmtZdk5tV2VEaVdWWjg1V2JEWjg0aitoV3owcEM5MytXaWhCMzdY?=
 =?utf-8?B?ZENUdHk3bTVoK3FKZDZTS1V2SHExNFRaU0FFZ1p3aWUzcThJNjk5L01FcUZF?=
 =?utf-8?B?SU1nSlAydDZSVG1ma1RUZG1tWlo5UmFSaUc1N0hDcWxVK0dkdDI5ZlMwU011?=
 =?utf-8?B?UXBaYkY2NUNzMWZSZ2ZTR0JFRkRSa0tEQ3FVNUZ6TUpwS3JQMGhBQnVCaUpU?=
 =?utf-8?B?T3JYcWxVRzVuZER5K3NWVDd2STJkNW5kY2FYbFdJSjJpT3c4aTNCNjhocHlE?=
 =?utf-8?B?WjZ2QzdhaC9nNklLajZnOXNqMkRWS0YydWNmem51S3lwMXpUeFBhMGNhd3dE?=
 =?utf-8?B?aU40Tnl6TUlrbmwrMXZSbVVnMkV3TTd6Mjh2T0VGOGJCcmJzSjI0eUZCYmR1?=
 =?utf-8?B?ZHN3b08xaDBpa0ovY2U3SXlUOU40OXVZRmdCY0VlTmd1ODZpSDR6QTloQU1w?=
 =?utf-8?B?cEN2Wll2MWJzRWs5UEJSN3grYnN5R3ZxUnhnM1ZTWlQwdDFzTmxRZEQ0WUdB?=
 =?utf-8?B?MENUcVNIelJvUlkvNFVrSUgxblYrZDhQOFRhMUdqLzkyeGI4MGgyVEZKTzdu?=
 =?utf-8?B?bEhwK3Q1UEdCQmRJNzlJTTNtZnhDVXBqU3g5QVZsenorbUJES2o2aHcxN1li?=
 =?utf-8?B?TjBoQmlWR0MyYVRVZHlTMnpEVk1RYXg5WVVTZGF5d0d4eHhzaHFrc3BrRmIw?=
 =?utf-8?B?S2xjZVUydWNVZVcyNU5BRnllV09wVlZDZnBVU2FqeEZ2RWdqT3V1R2xldnR3?=
 =?utf-8?B?RVdvRGNQTVZ3eUdBNUlTaHB5bjJIWm1hWEE4ajAvdGNLbUtKM2JtWFc5VWpX?=
 =?utf-8?B?bTc3ODhCSUppUzVUUGZaSktDcVoyb3dsdCsyeHdzc1ZSd3Q4aDhPRHFiWHZi?=
 =?utf-8?B?RkhQQnZPL1BWY1dITld1dnByUnFxQnFtQVV0b1l6NFhQT3l2NDNIVVZ6dnU4?=
 =?utf-8?B?NklpbUlDSjNpeFpwUUlDQlBCeStoLzZxdHJ3K05hUkIzanphaHR5UUhiazNa?=
 =?utf-8?B?bHNhMCtiWWxKZ0t6bUE3Yk0xeFlEU24rZGx3V0xObFdBS0NPRnBNaUVPUWc1?=
 =?utf-8?B?WlBwNlRQb1VUY0psdlcvMWNVNFZMZXF1MlFvT2dPUUNBQkU3TUhCWXZXb2wz?=
 =?utf-8?B?Q2RLaTZSVkZjMkpjSCtuZmx2eVBaVWNSOFBLUXJtOGJza0duNE5iMXMyUnNj?=
 =?utf-8?B?c2drc0xXMmY2aVUzdk82NElKUWR3TnZnamQ3RVlVNURZNk9GNlJ5aE9Ndmsv?=
 =?utf-8?B?aFVLdHREYlJpWCtFanNXQjBzZ014c0hQZkNPZnIwLzlDT0xEUk40S0dvWmtz?=
 =?utf-8?B?YXh6QmRXSlNEK1l1R1NUbzdscWFjeTEySGNzNGRZUjlscXNDazVpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f1c313-5d3a-4652-4d28-08de9a38f58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 15:17:36.1361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: di6JSZXLONVkvFaIa7tlEE5iQoFKZA9v3wy8Gdtm7by+Ckf0FAVjZ4nnCjMSzFbWWUJJQkND7qD+RBCvy6GoY5uQtYi1Ma1fT4Ei8GnoG48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6068
X-purgate-ID: tlsNG-ef75cf/1776179863-8975241E-0B0A186A/0/0
X-purgate-type: clean
X-purgate-size: 9924
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A55F83FBFCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQpJJ20gc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJIGhhZCBtYW55IFRPRE9z
IGFuZCBhIHZhY2F0aW9uIG1lYW53aGlsZSwNCmJ1dCBJJ20gYmFjayB3aXRoIHRoZSBmaXhlcyBm
b3IgdGhlIHJldmlldy4NCg0KSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gLS0tIGEveGVuL2NvbW1v
bi9kb21haW4uYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNClsuLi5dDQo+ID4gK2lu
dCBjbGFpbV9tZW1vcnkoc3RydWN0IGRvbWFpbiAqZCwgWy4uLl0NCj4gDQo+IHN0YXRpYyBpbiBk
b21jdGwuYz8gT3RoZXJ3aXNlIHdpdGggUGVubnkncyB3b3JrIHRvIG1ha2UgZG9tY3RsIG9wdGlv
bmFsIHRoaXMNCj4gd291bGQgYmUgdW5yZWFjaGFibGUgY29kZS4NCg0KVGhhbmtzLCBkb25lOiBN
b3ZlZCBpdCB0byBkb21jdGwuYyB0byBiZSBub3QgY29tcGlsZWQgd2l0aG91dCBNR01UX0hZUEVS
Q0FMTFMgaW4gdjUvdjYuDQoNCj4gPiArICAgIGlmICggdWluZm8tPnBhZCB8fCB1aW5mby0+bnJf
Y2xhaW1zICE9IDEgfHwgZC0+aXNfZHlpbmcgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiANCj4gQXMgYWxyZWFkeSBhbGx1ZGVkIHRvIGluIHJlcGx5IHRvIHBhdGNoIDAzLCBJIGNh
bid0IGhlbHAgdGhlIGltcHJlc3Npb24gdGhhdA0KPiB1c2FnZSBvZiB0aGlzIHN1Yi1vcCB3aXRo
IG11bHRpcGxlIGVudHJpZXMgd291bGQgd2UgcXVpdGUgZGlmZmVyZW50IChpLmUuIGl0DQo+IHdv
dWxkIGJlIG5vdCBvbmx5IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBYZW4gdGhhdCBjaGFuZ2VzKS4g
SSdtIHRoZXJlZm9yZQ0KPiBwcmV0dHkgdW5jZXJ0YWluIHdoZXRoZXIgdGFraW5nIGl0IHdpdGgg
dGhpcyByZXN0cmljdGlvbiBpcyBnb2luZyB0byBtYWtlDQo+IG11Y2ggc2Vuc2UuDQoNCkkgc3Vi
bWl0dGVkIHRoaXMgc3ViLW9wIHRvIHN1cHBvcnQgbXVsdGlwbGUgZW50cmllcyB3aXRoIHY1L3Y2
IG5vdy4NCg0KSW4gdjUvdjYgdGhlc2UgY2hlY2tzIGFyZSB1cGRhdGVkIHRvIHN1cHBvcnQgbXVs
dGlwbGUgY2xhaW1zIGluIHRoZSBjbGFpbSBzZXQuDQpGb3IgY2xhcml0eSwgSSByZW5hbWVkIHRo
ZSAubm9kZSBvZiB0aGUgaW5kaXZpZHVhbCBjbGFpbSBlbnRyaWVzIHRvIC50YXJnZXQ6DQoNClRo
ZSB0YXJnZXQgb2YgYSBjbGFpbSBlbnRyeSBjYW4gYWxzbyBiZSBhIHNlbGVjdG9yIGZvciBhIGds
b2JhbCBjbGFpbQ0Kb3IgYSBsZWdhY3kgY2xhaW0gYW5kIHRoZSBmaWVsZCBoYXZlIG1hbnkgYml0
cyBmb3IgZnV0dXJlIHVzZS4NCg0KVGhpcyB3YXNuJ3QgbmVlZGVkIGJ1dCBJIHRoaW5rIGl0J3Mg
Y2xlYXJlciB0aGF0IHRoZSBjbGFpbSBlbnRyeSBzcGVjaWZpZXMgYQ0KdGFyZ2V0IHdoaWNoIGlz
IHdoZXJlIHRoZSBjbGFpbSBlbnRyeSBpcyBhaW1lZCBhdCwgaXQncyBub3QganVzdCBvbmx5IGEg
bm9kZS4NCg0KPiArICAgIGlmICggY2xhaW0ubm9kZSA9PSBYRU5fRE9NQ1RMX0NMQUlNX01FTU9S
WV9OT19OT0RFICkNCj4gPiArICAgICAgICBjbGFpbS5ub2RlID0gTlVNQV9OT19OT0RFOw0KPiAN
Cj4gV2hhdCBhYm91dCB0aGUgaW5jb21pbmcgY2xhaW0ubm9kZSBiZWluZyBOVU1BX05PX05PREU/
IEltbyB0aGUgcmFuZ2UgY2hlY2tpbmcNCj4gdGhlIHByZXZpb3VzIHBhdGNoIGFkZHMgdG8gZG9t
YWluX3NldF9vdXRzdGFuZGluZ19wYWdlcygpIHdhbnRzIHRvIG1vdmUgaGVyZSwNCj4gYXQgd2hp
Y2ggcG9pbnQgdGhlIGZ1bmN0aW9uJ3MgbmV3IHBhcmFtZXRlciBjb3VsZCBiZSBwcm9wZXJseSBu
b2RlaWRfdC4NCg0Kbm9kZWlkX3QgYW5kIE5VTUFfTk9fTk9ERSBoYXZlIChqdWRnaW5nIGJ5IHRo
ZSBleGlzdGluZyBpbXBsZW1lbnRhdGlvbikgYXJlIG5vdA0KZXhwb3NlZCBpbiB0aGUgcHVibGlj
IEFQSSB0byB0aGUgY29udHJvbCBkb21haW4uDQoNClRoaXMgc2VwYXJhdGlvbiBpcyBwcm9iYWJs
eSBhIGdvb2QgdGhpbmcgYmVjYXVzZSBpdCBhbGxvd3MgdG8gY2hhbmdlIFhlbiBpbnRlcm5hbHMN
Cmxpa2Ugbm9kZWl0X3QgYW5kIE5VTUFfTk9fTk9ERSBpZiBzbyBkZXNpcmVkIHdpdGhvdXQgY2hh
bmdpbmcgdGhlIHB1YmxpYyBBUEkuDQoNCk5VTUFfTk9fTk9ERSBpcyBkZWZpbmVkIGFzIDB4RkYg
YW5kIG5vZGVpZF90IGlzIHU4LiBCdXQgdGhhdCBpcyBqdXN0IGFuDQppbXBsZW1lbnRhdGlvbiBk
ZXRhaWwgb2YgdGhlIEh5cGVydmlzb3IgaXRzZWxmLiBJZiBuZWVkZWQsIHdlIGNvdWxkIGNoYW5n
ZQ0KdGhlIGltcGxlbWVudGF0aW9uIGxpa2UgdGhpcyBzZXJpZXMgY291bGQgZG8sIGlmIHdhbnRl
ZC4NCg0KVGhlIHB1YmxpYyBzdHJ1Y3QgeGVuX3N5c2N0bF9udW1haW5mbyBhbmQgeGVuX3N5c2N0
bF9waHlzaW5mbyBkZWZpbmUgbnVtX25vZGVzLA0KbnJfbm9kZXMgYW5kIG1heF9ub2RlX2lkIGFz
IHVpbnQzMl90LCBmb3IgZXhhbXBsZS4gRm9yIHR5cGUgY29uc2lzdGVuY3ksIEkgb3B0ZWQNCnRv
IGRlZmluZSB0aGlzIHB1YmxpYyBBUEkgYXMgdWludDMyX3QgYXMgd2VsbCBhbmQgbm90IGV4cG9z
ZSBpbnRlcm5hbCB0eXBlcy92YWx1ZXMuDQogDQo+ID4gKyAgICByZXR1cm4gZG9tYWluX3NldF9v
dXRzdGFuZGluZ19wYWdlcyhkLCBjbGFpbS5wYWdlcywgY2xhaW0ubm9kZSk7DQo+ID4gK30NCj4g
DQo+IFRoZXJlJ3Mgbm8gY29weWluZyBiYWNrIG9mIHRoZSByZXN1bHQuIFdoZW4gdGhpcyBpcyBl
eHRlbmRlZCB0byBhbGxvdyBtb3JlDQo+IHRoYW4gb25lIGVudHJ5LCB3aGF0J3MgdGhlIHBsYW4g
dG93YXJkcyBkZWFsaW5nIHdpdGggcGFydGlhbCBzdWNjZXNzPyBOZWVkaW5nDQo+IHRvIHJvbGwg
YmFjayBtYXkgYmUgdW53aWVsZHkuDQoNClJvZ2VyIGRlc2NyaWJlZCB0aGUgY29yZSByZXF1aXJl
bWVudCBJJ20gaW1wbGVtZW50aW5nOg0KDQogID4gSWRlYWxseSwgd2Ugd291bGQgbmVlZCB0byBp
bnRyb2R1Y2UgYSBuZXcgaHlwZXJjYWxsIHRoYXQgYWxsb3dzDQogID4gbWFraW5nIGNsYWltcyBm
cm9tIG11bHRpcGxlIG5vZGVzIGluIGEgc2luZ2xlIGxvY2tlZCByZWdpb24sDQogID4gYXMgdG8g
ZW5zdXJlIHN1Y2Nlc3Mgb3IgZmFpbHVyZSBpbiBhbiBhdG9taWMgd2F5Lg0KDQogICAgICAtLSBS
b2dlciBQYXUgTW9ubsOpDQpSZWY6DQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDA0ODQuaHRtbA0KDQpBcyBhIHJlc3VsdCwg
d2UgZG9uJ3QgbmVlZCB0byBoYW5kbGUgcGFydGlhbCBzdWNjZXNzZXMsIHNvIGl0cyBub3QgbmVl
ZGVkLg0KDQo+ID4gKyNkZWZpbmUgWEVOX0RPTUNUTF9DTEFJTV9bLi4uXSAgICAweEZGRkZGRkZG
ICAvKiBObyBub2RlOiBob3N0IGNsYWltICovDQo+IA0KPiAiaG9zdCBjbGFpbSIgKGluIHRoZSBj
b21tZW50KSBhbHNvIGlzIGFtYmlndW91cy4gUGVyLW5vZGUgY2xhaW1zIGFsc28gYWZmZWN0DQo+
IHRoZSBob3N0LiBNYXliZSAiaG9zdCB3aWRlIiBvciAiZ2xvYmFsIj8NCg0KVGhhbmtzIGZvciB0
aGlzIHN1Z2dlc3Rpb24hIEkgY2hhbmdlZCB0aGUgdGVybSB1c2VkIGV2ZXJ5d2hlcmUgdG8gImds
b2JhbCIgaW4gdjUvNi4NCg0KPiA+ICsvKiBVc2UgWEVOX05PREVfQ0xBSU1fSU5JVCB0byBpbml0
aWFsaXplIGEgbWVtb3J5X2NsYWltX3Qgc3RydWN0dXJlICovDQo+ID4gKyNkZWZpbmUgWEVOX05P
REVfQ0xBSU1fSU5JVChfcGFnZXMsIF9ub2RlKSB7IFwNCj4gPiArICAgIC5wYWdlcyA9IChfcGFn
ZXMpLCAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgIC5ub2RlID0gKF9ub2RlKSwgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPiArICAgIC5wYWQgPSAwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gPiArfQ0KPiANCj4gV2hpbGUgb25seSBhIG1hY3JvLCBpdCdzIHN0aWxsIG5vdCBD
ODksIGFuZCBoZW5jZSBtYXkgd2FudHMgb2ZmZXJpbmcgb25seSBhcw0KPiBhbiBleHRlbnNpb24u
IEFsc28gLnBhZCBkb2Vzbid0IG5lZWQgZXhwbGljaXRseSBzcGVjaWZ5aW5nLCBkb2VzIGl0PyBJ
ZiB5b3UNCj4gcHJvdmlkZSBzdWNoIGEgbWFjcm8sIGlkZW50aWZpZXJzIHVzZWQgYWxzbyBuZWVk
IHRvIHN0cmljdGx5IGNvbmZvcm0gdG8gdGhlDQo+IEMgc3BlYyAoSU9XIGxlYWRpbmcgdW5kZXJz
Y29yZXMgYXJlbid0IHBlcm1pdHRlZCkuDQoNClRoYW5rcywgcmVtb3ZlZCBhcyBub3QgbmVlZGVk
Lg0KDQo+ID4gK0RFRklORV9YRU5fR1VFU1RfSEFORExFKG1lbW9yeV9jbGFpbV90KTsNCj4gDQo+
IFRoaXMgd2FudHMgdG8gbW92ZSB1cCBuZXh0IHRvIHRoZSB0eXBlZGVmLg0KDQpUaGFua3MsIGRv
bmUgaW4gdjUvdjYuDQogDQo+ID4gKyAgICAvKiBJTjogbnVtYmVyIG9mIGNsYWltcyBpbiB0aGUg
Y2xhaW1zIGFycmF5IGhhbmRsZS4gU2VlIHRoZSBjbGFpbXMNCj4gDQo+IElzIHJlcGVhdGluZyB0
aGUgd29yZCAiY2xhaW0iIG5lY2Vzc2FyeSAvIHVzZWZ1bCBoZXJlPw0KDQpUaGFua3MsIGZpeGVk
Lg0KDQo+ID4gICNkZWZpbmUgWEVOX0RPTUNUTF9nZXRfZG9tYWluX3N0YXRlICAgICAgICAgICAg
ICA5MCAvKiBzdGFibGUgaW50ZXJmYWNlICovDQo+ID4gKyNkZWZpbmUgWEVOX0RPTUNUTF9jbGFp
bV9tZW1vcnkgICAgICAgICAgICAgICAgICA5MQ0KPiANCj4gU2VlaW5nIHRoZSBhZGphY2VudCBj
b21tZW50LCBkaWQgeW91IGNvbnNpZGVyIG1ha2luZyB0aGlzIG5ldyBzdWItb3AgYSBzdGFibGUN
Cj4gb25lIGFzIHdlbGw/DQoNClRoYW5rcywgSSBpbnZlc3RpZ2F0ZWQgbWFraW5nIHN1Y2ggY2hh
bmdlLCBidXQgSSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgY2hhbmdlZDoNCg0KSW4gc2hvcnQs
IFhFTl9ET01DVExfZ2V0X2RvbWFpbl9zdGF0ZSB1c2VzIGEgZml4ZWQgaHlwZXJjYWxsIHZlcnNp
b24gb2YgMCBhbmQgaXMNCmZyb3plbiBiZWNhdXNlIGl0IG5lZWRzIHRvIGJlIHVzZWQgYnkgYSBj
YWxsZXIgdGhhdCBtdXN0IHN1cHBvcnQgbXVsdGlwbGUgWGVuDQp2ZXJzaW9ucy4gQ29uc2VxdWVu
dGx5LCBsaWJ4ZW5jdHJsLCB1c2luZyBvbmx5IHRoZSB2ZXJzaW9uIGNvbnRyb2xsZWQgaHlwZXJj
YWxscw0KZG9lcyBub3QgaW1wbGVtZW50IHRoaXMgaHlwZXJjYWxsLg0KDQpUaGF0J3Mgbm90IHRo
ZSBkZXNpZ25lZCB1c2UgY2FzZSBvZiB0aGlzIGh5cGVyY2FsbDoNCg0KVGhlIGRlc2lnbmVkIHVz
ZSBpcyBkb21haW4gYnVpbGRlcnMgcnVubmluZyBpbiBEb20wIHdoaWNoIGFscmVhZHkNCm5lZWQg
dG8gdXNlIHRoZSB1bnN0YWJsZSAodmVyc2lvbmVkKSBpbnRlcmZhY2VzIGZvciBidWlsZGluZyBk
b21haW5zLg0KDQpJIHRoaW5rIHRoYXQgY2FsbGluZyB0aGlzIGh5cGVyY2FsbCB0aHJvdWdoIGxp
YnhlbmN0cmwgbGlrZSB0aGUgb3RoZXINCmh5cGVyY2FsbHMgdGhlIGRvbWFpbiBidWlsZGVycyBz
dWl0IGl0IGJldHRlci4gT3RoZXJ3aXNlLCB0aGUgZG9tYWluIGJ1aWxkZXJzDQp3b3VsZCB1c2Ug
YSBtaXggb2YgdmVyc2lvbi1jb250cm9sbGVkIGFuZCBmcm96ZW4vc3RhYmxlIGh5cGVyY2FsbHMs
IHdoaWNoIGNvdWxkDQpiZSBjb25mdXNpbmcgZm9yIEFQSSB1c2VycyBhbmQgZm9yIGZ1dHVyZSBt
YWludGVuYW5jZS4NCg0KRnJvbSB0aGUgZG9tYWluIGJ1aWxkZXJz4oCZIHZpZXdwb2ludCwgaXQg
aXMgbW9yZSBjb25zaXN0ZW50IHRvIGV4cG9zZQ0KdGhlIGNsYWltcyBoeXBlcmNhbGwgaW4gdGhl
IHNhbWUgd2F5IGFzIHRoZSBvdGhlciBjYWxscyB0aGV5IHVzZS4NCg0KRnJvbSBteSB2aWV3cG9p
bnQsIHN1Y2ggZnJvemVuIGludGVyZmFjZXMgYWxzbyBoYXZlIGRyYXdiYWNrczogQnkgcHJvdmlk
aW5nDQpzdGFibGUgc3lzY2FsbHMsIExpbnV4IG5lZWRzIHRvIG1haW50YWluIHRoZSBvbGQgaW50
ZXJmYWNlIGluZGVmaW5pdGVseSwgd2hpY2gNCmNhbiBiZSBhIG1haW50ZW5hbmNlIGJ1cmRlbiBh
bmQgY2FuIGxpbWl0IHRoZSBhYmlsaXR5IHRvIG1ha2UgaW1wcm92ZW1lbnRzIG9yDQpjaGFuZ2Vz
IHRvIHRoZSBpbnRlcmZhY2UgaW4gdGhlIGZ1dHVyZS4gTGludXggY2FycmllcyBtYW55IHN5c2Nh
bGwgc3VjY2Vzc29yDQpmYW1pbGllcywgZS5nLiwgb2xkc3RhdCwgc3RhdCwgbmV3c3RhdCwgc3Rh
dDY0LCBmc3RhdGF0LCBzdGF0eCwgd2l0aCBzaW1pbGFyDQpleGFtcGxlcyBpbmNsdWRpbmcgb3Bl
bmF0LCBvcGVuYXQyLCBjbG9uZTMsIGR1cDMsIHdhaXRpZCwgbW1hcDIsIGVwb2xsX2NyZWF0ZTEs
DQpwc2VsZWN0NiBhbmQgbWFueSBtb3JlLiBHbGliYyBoaWRlcyB0aGF0IGNvbXBsZXhpdHkgZnJv
bSB1c2VycyBieSBwcm92aWRpbmcgYQ0KY29uc2lzdGVudCBBUEksIGJ1dCBpdCBzdGlsbCBuZWVk
cyB0byBtYWludGFpbiB0aGUgb2xkIHN5c3RlbSBjYWxscyBmb3INCmNvbXBhdGliaWxpdHkuIFhl
bidzIGludGVyZmFjZSBmb3IgRG9tMCBpcyBub3QgYW4gT1Mga2VybmVsIHN5c2NhbGwgaW50ZXJm
YWNlLg0KDQpJbiBjb250cmFzdCwgdGhlIHZlcnNpb25lZCBsaWJ4ZW5jdHJsIGh5cGVyY2FsbHMg
YWxsb3cgZm9yIG1vcmUgZmxleGliaWxpdHkgYW5kDQpldm9sdXRpb24gb2YgdGhlIEFQSSB3aGls
ZSBzdGlsbCBwcm92aWRpbmcgYSBjbGVhciBwYXRoIHRvIGFkb3B0IG5ldyBmZWF0dXJlcy4NCg0K
VGhlIHJlc2VydmVkIGZpZWxkcyBhbmQgcmVzZXJ2ZWQgYml0cyBpbiB0aGUgc3RydWN0dXJlcyBv
ZiB0aGlzIGh5cGVyY2FsbCBhbGxvdw0KZm9yIG1hbnkgZnV0dXJlIGV4dGVuc2lvbnMgd2l0aG91
dCBicmVha2luZyBleGlzdGluZyBjYWxsZXJzLg0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IG9m
IHRoZSB2NCBzZXJpZXMgc28gZmFyLA0KYW5kIEknbSBsb29raW5nIGZvcndhcmQgZm9yIGV2ZXJ5
b25lJ3MgcmV2aWV3cyBvZiB0aGUgdjYgc2VyaWVzOg0KDQpbUEFUQ0ggdjJdIGRvY3M6IERyYWZ0
IERlc2lnbiBEb2N1bWVudCBmb3IgTlVNQS1hd2FyZSBjbGFpbSBzZXRzDQpodHRwczovL2xpc3Rz
Lnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyNi0wNC9tc2cwMDU2OS5odG1sDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmll
cz0xMDgxMDQ3DQoNCltQQVRDSCB2NiAwLzddIHhlbi9tbTogSW50cm9kdWNlIE5VTUEtYXdhcmUg
Y2xhaW0gc2V0cyBmb3IgZG9tYWlucw0KaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMjYtMDQvbXNnMDA1ODcuaHRtbA0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJpZXM9MTA4MTEzOQ0KDQpUaGFua3Ms
IEJlcm5oYXJkDQo=

