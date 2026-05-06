Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBxQFmcB+2kbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:52:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1064D8213
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301327.1575619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXzg-0005Ed-UW; Wed, 06 May 2026 08:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301327.1575619; Wed, 06 May 2026 08:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXzg-0005CU-R2; Wed, 06 May 2026 08:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1301327;
 Wed, 06 May 2026 08:52:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wKXzf-0005CO-6V
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:52:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXze-00FIgM-D1
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:52:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69fb0149-bab6-0a2a0a5309dd-0a2a4506b8aa-28
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:52:34 +0200
Received: from [52.101.65.105]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69fb0151-7371-0a2a45060019-34654169345e-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:52:34 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV2PR03MB9524.eurprd03.prod.outlook.com
 (2603:10a6:150:da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:52:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:29 +0000
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
 b=BafhuG5vEHpO3EimdSMGzo3bPUI8e0wBYHzZ/Mo2IjW3CiEZtFtcBY+dVmOZi/k4Tb6f65fA0wPApMbi0K76/NAO4YgS6r122Ogimvh9ibo94ZL9r857tW/iIoUltH8sUG4C5hmObWrlNldoI41o9pBBoogqOlUDkxIczxZbtXjap24rc/n7zgLmQRjQFRo8ZG6gAR6d7WsUGAolGOolFOS3iGYFqxu4S/Vx+wP3Tv+B4LlhWo+eq0ILv6xFVOwkWVclGDbrzb6vr76fXD9q/WE4XjdWv8ezGja7C8Q9UoiS0CcVP/5P289DxDu8bmDF6SIXKuyCEu0zu9qLeczhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOFc6pYpQASlrrVU8saUhLQD1bqJYfiCqzt8u7cCUQg=;
 b=TgMj3uZ4Eboi2y73ssfgnpKNF3KQKuSXi9o4SAkaEHgZQJ07c7JPZluyMKPcdc5rb7LXE/DPOUocQhHAXjh1zEm3XZ4BKnkTT2RmqcaLRljA4kX/BptGLJy3OwAr0aARU6vbCyseNb4wxHH1SAh6VejAWD+q/Zwhh/glyKp+6B/9m+xjaRhNKZnyrQlvPKjN7UMTRCUUV7FBkeSgO+aoxkXTENNbyRP3CYzNu4btrhGYxUq9V1W5Ip3cW+iL9qFRIypvzU7A3qQCVkei9L4/x+1FNoeiH900iAlNyCX803PG3axUD/FzFdRSp1V5u/GUwXKnvZE6jXUIP/7TOoONuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOFc6pYpQASlrrVU8saUhLQD1bqJYfiCqzt8u7cCUQg=;
 b=amzPrlVBxlr04cnMiuQhpnqYuAJKneO6mtDUJNqiltELD9gSSzi0W3W2xBonxz+z8JDXmzxh1aLlM31DBanLhnHf+d22e2YO7lboi+YT5KY1af+3H7FVLX4Dxq1QN4m55gZbMRQGkRb0BVI+Eb4yIcq4RltPPYuxoN8iB24WoNIxVh9rcmogiqk7ITJh3eMcPkD49Rj9dFGA/VrKWfJo9Su4DMCESDBGefCAmrh9RZqiDiJVx8u/ErPZDTMSbwv8W9TW0jcmsmggOfJML4ewhsGFJcUPMPnB1e/AUEZbV+HtXYyIbEKGmrOekeq0Q+NnIFT18XHheDcI5mJx/m6eOA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index:
 AQHcwDy3LJnr4T20vUWAas874pXmi7XHAiYAgBlL+wCAAQu/AIAAGf4AgBTWBoCACqD3AA==
Date: Wed, 6 May 2026 08:52:29 +0000
Message-ID: <d1c7d83c-debe-46bf-9bec-614c0a343a8f@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
 <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
 <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
 <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
 <1777473230.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@vates.tech>
In-Reply-To:
 <1777473230.8631fc262581453bbf619ec5b2062170.19dd9a915bc000f373@vates.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV2PR03MB9524:EE_
x-ms-office365-filtering-correlation-id: aecd0491-251d-4692-c8fd-08deab4cce05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 HHGV8DMc05UjFdBn6lMrTRGLsNvwk4Fz6LFWAUNklzm7M3dsF2JQX3nyO445oq8NzmMo/xu6hY6jjeT0q7AJq1zi+P5v+TOaPLTejgVXrAc4na8wvfXsJUjYDF+Ik1ogYuqS3f+WRS8ZULlo0JPyspfglgaiPLqZwxzuX+H6ghYc85fFzdYXi0KJRIQwFS6M/CzVLnY0G3q4H4IWwbGWOnW4002pi5ZbjdBHQLXizBoM/oUrXO0TOYvfpC/wXx6os7mTzupbvqA+PBtW1HFZO241nZNuHnQIE5y77Jgm9HGaS8l0X7TObavI4letRxTuXyTVyVqoyOi5YFJWwditB0qDGjpe67BQsUg1YcWoHGTKcA6B7xm9tzFS80fFSJtOkMJ/HNEjL4/bZm6ZF8cFachJrUQ0DZH1XuzJDp4Tuil1a0yl0vDQHET5PyB8kSaHcRNcJc6jm40tsGO7RhSGeNDsvWE1qWLCWoULFi7smw4/CImi+PsvXSoTGZzHrbh7jBAkVki9vDgMWpTCYQLYyOCQJpTb9osF/DvVO0PjWCmaImWd14f/Ycui6++S9NdYq0dwAAuyTTSYfQxnJpd0HHt4eGlEq3TAozendyihiIp307Ee6VD0xUprXbsZp+knCXcnTwf/CsFl2b58Uzn+CY3YM2W+DJ5CNCoawcBcGUwH+OyuH/MLab7GNPp2GK3OzDQlpvDO+s4ZrbURj9JcONWE39g6ymrF5hjoEyZ/eztgJNC07jcvHe5+6Gg3fVZo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cithU04wZWxKbnV1aERmL2d1a3dXRXFNMno0VXlpWlFRNkNzQ09DYzEzaSt1?=
 =?utf-8?B?bWxPRjRrZmJwSnJpVWdkWlNIYjFmb1ZadGlaU2hEWUdJc0lSSTNIWXNuaG0x?=
 =?utf-8?B?L2t2L1ljL2pkdWFMbmRYNXBiSmg5bEM4aldxVCtjSXhXQ0xzcERXOUFZTm5w?=
 =?utf-8?B?eW1neWkvQnhhZERMbUNGMGU1N2E2NXJNUzdiZFgvQ0JoVHVwRXBpNTc4djBE?=
 =?utf-8?B?bHJZM010eUdoSC9mdkUvZllGTkVTWHNHdUgycDgzTGlxMlpYb2FuZkNaWmtw?=
 =?utf-8?B?dXF0U3Rab05nYVNjdE1MWUloRFRDM1JzZHZXTVNUMEtIQ2t1SVRtdHNGaUNB?=
 =?utf-8?B?TjRMdnkrblhGREdqV0VmSUpybjhFNlRRSUZ4NnZVRExhQ1VCZHFZNEdWUGZV?=
 =?utf-8?B?YUtqRGFVb0hzdTJsdy8vVGpwTCt6NlNocXA3WGpLdXdVNmdiUG55cWJQQVVI?=
 =?utf-8?B?ZWJRdmFKTEloaitTeWdoRjlnYU9sN3BMNHRYbkN5SkxjeUNpQ1FPYlo4dzFt?=
 =?utf-8?B?TkRSNHNVb0J1WjFMdEVMOGZSeWVDWVZTdlNUVkdYRkNwaXg0RkltaVpxdFV0?=
 =?utf-8?B?TWwvQjJ3SWh2OW1EUmNjczdBNG9HYlBXN3IrYmJRZjNIMXFPZktncG1OaVFk?=
 =?utf-8?B?c2hzOVo4cEhqckRNTFBnZi83NTBPUjFyeGtSYVZjbE1GQXdQVjNuTUhTWDA5?=
 =?utf-8?B?NDZMOFB3aHZvdE82U3MyaWU5K0Q5ajg2YUtpZjVGTWFLMWJDL3JBY3E4Z3ZD?=
 =?utf-8?B?V0hmWVhMaUFvYytkL1NOZ09ucjFzaUY0ekM0d0U3MlFzc1N3TWhFUkN6Nk1C?=
 =?utf-8?B?K1lRM2VhQVY2blpJcE5MVEdpNlFLK1NOMHpKdXY3QXZBTm1xNGpjeForZU5L?=
 =?utf-8?B?L0RKTExRNWxhMHVuSDFibHFUQ3JObFVudUx4NWNyUXU1NjRDd0t6Y1BHYjkx?=
 =?utf-8?B?M1p5OTl5NWxDTUdaQ1hpM3YzZ0JubGZMbDFxNmUwcFJUN1praDlsUDdUWXh4?=
 =?utf-8?B?UW53cnp1YnZ3MjNsSnFBK1I0ck90Q0QvS1lKc3BNWTRzZnlaZUVvaEdiZUtk?=
 =?utf-8?B?bElVVEk4T092b2RHRVRjaVFKSS9TTjMva1pMQkFLZU5pSUJlbCttY1UyTFVn?=
 =?utf-8?B?ekJrM0R0aElsL1VDeDROcGpGUFhtczJ4dmh1dVNmNDNWQndXRXgyVlNqQ1cr?=
 =?utf-8?B?ajZVMHdRZjRBRE1sLzhtMkZ2S0g4NnVqRHBKVVlxSzJMVjdidURDYU5IT2ls?=
 =?utf-8?B?S0JMS3EwTXYvdkVtNHFUNlR0bWRtMzF1S1lRMmM2OU5FRXN4WThjc1IvOTJK?=
 =?utf-8?B?S3BVQ3VNTzFoNFdtNitqYVhXNE16UWZIV043Vzl3YmdhalN5SUczTWV0Qmxm?=
 =?utf-8?B?VFM4VkpaZHlNUDR0MnE3RGFCYWkyaERIazZ0U3I3RUlJQzJEdUg1TTFZYzg2?=
 =?utf-8?B?TjJZWFVNZ1UzSjhiOFNIcjBiWitoL3ZzbjlMazRKZThyU3B5V0xITXh3MDdL?=
 =?utf-8?B?U0FiN01PdEZQdzFMSzY4aVo3MTQ2ZlBPVmovaWs3eDVIdFhtTlpwaURUMXEw?=
 =?utf-8?B?K2s2ZzZSR0VVTXJSeDBEd3NjQ2EzM2YyWUl3aCtTTURSQVVOZExsTjlVYlE4?=
 =?utf-8?B?S00vN2tGUmJNaTU0dEw1K3FTaU5GY09GOWZ4TUZOckExL1FpTzJPZnlObDFz?=
 =?utf-8?B?VWNYODJtNW5TTHl6d1BOeVBoRmhGRDdVTUU0WDdlUEdqSXZxVU5zQVN6cVZ1?=
 =?utf-8?B?c3ZsOVJzdlI3M254NlROd1JEUE5yMVRmcmlDVWxWK2wxZU9EckYzUVZHc3kx?=
 =?utf-8?B?bjVOMzhMMEZPRmNJejJTYURXN21TWDZhWWJsUmNXNGNOR2Nja3k5ZDR1eW13?=
 =?utf-8?B?U1J5YmYzUnJycVUvVnd4U3hZaHFZVExNOWRnbUovWFFjQnkrbUFaQlpoUkx1?=
 =?utf-8?B?YWc1bmJmWDZjcUg0MmJEOGRJcTI0U0h6emx1a25iT1FsRmE4WEVlSldUaVdu?=
 =?utf-8?B?VFlPdmxFTlR0OU10RHJTUi93aFlTK1BRaVJ3SXJBa3NFWjRGRzdXcWh3aENh?=
 =?utf-8?B?WWtrUGU3bVBVT0JUUGJQT2NsTDk3R1lvMFAvVE9lbEpiVGdHelcvL1dTTVZa?=
 =?utf-8?B?akRsS3FEUG93cW12ZFFIeXNiVWZYaG0wUlhudVZWWlQ0eVBoMVNkNGlyNUw3?=
 =?utf-8?B?MmZUZDErdmxOUE5IaUFvcEkzSDNIeDJlNzI5dzVrdWV0bURzSFBnR2xpNE1J?=
 =?utf-8?B?c0R3NGp4bnh6T1JDcmUxZWprNUhTa0YrQ0J5dThUSUhWaUR1MFdUMUVWVXhn?=
 =?utf-8?B?ZitvUlYxS3ZIdHhKNWp5UFVXSUdsdEF4TFFqdW9PbXh4bXBKSmM3S3dDM0Yv?=
 =?utf-8?Q?K4cMPuVfz8qc6AfQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC34F5E07653664194A0EE4F2EB11702@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecd0491-251d-4692-c8fd-08deab4cce05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 08:52:29.5242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOch7prn/fLFdeGQMo2Z4xGi1lJEzG2Bkn4yxYO4NXiSQXWV6XVCM8Ky+h7tar1fkyAVCGKgAYZglRORFeoEgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9524
X-purgate-ID: tlsNG-16d1c6/1778057554-52F73D75-49AB3489/0/0
X-purgate-type: clean
X-purgate-size: 3474
X-Rspamd-Queue-Id: AE1064D8213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gNC8yOS8yNiAxNzozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFRodSwgQXByIDE2
LCAyMDI2IGF0IDA4OjIyOjMyQU0gKzAwMDAsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gT24g
NC8xNi8yNiAwOTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTUuMDQuMjAyNiAxNjo1
MSwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+Pj4+IE9uIDMvMzAvMjYgMTU6MzIsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4gVGhpcyBsb29rcyB3cm9uZyB0byBtZS4gVGhlcmUgYXJlIHg4Ni1z
cGVjaWZpY3MgaW4gdGhhdCBmaWxlLCB3aGljaCBzaG91bGRuJ3QNCj4+Pj4+IGJlIGJ1aWx0IG9u
IEFybS4gQW5kIHRoZSBuYW1lIG9mIHRoZSBmaWxlIGFsc28gZG9lc24ndCBpbmRpY2F0ZSBhbnkg
cmVsYXRpb24NCj4+Pj4+IHRvIENQVSBtYW5hZ2VtZW50Lg0KPj4+Pg0KPj4+PiB4ZW4taHB0b29s
IHJlcXVpcmVzIHhnX29mZmxpbmVfcGFnZSBhcyBpdCBoYXMgYm90aCBDUFUgYW5kIG1lbW9yeQ0K
Pj4+PiBob3RwbHVnIGNvbW1hbmRzLiBXaXRob3V0IGJ1aWxkaW5nIHhnX29mZmxpbmVfcGFnZSBp
dCBmYWlscyB3aXRoDQo+Pj4+DQo+Pj4+IHhlbi1ocHRvb2w6IHN5bWJvbCBsb29rdXAgZXJyb3I6
IHhlbi1ocHRvb2w6IHVuZGVmaW5lZCBzeW1ib2w6DQo+Pj4+IHhjX21hcmtfcGFnZV9vZmZsaW5l
LCB2ZXJzaW9uIGxpYnhlbmd1ZXN0XzQuMjIuMA0KPj4+Pg0KPj4+PiB3aGVuIHRyeWluZyB0byBk
byBtZW1vcnkgb3BzLg0KPj4+Pg0KPj4+PiBJcyBpdCBhbiBhY2NlcHRhYmxlIGJlaGF2aW9yPw0K
Pj4+DQo+Pj4gSSBkb24ndCB0aGluayBzbywgbm8uIFRoZSB0b29sIHdvdWxkbid0LCBhaXVpLCBs
b2FkIGF0IGFsbCB0aGVuIGlmIGJ1aWx0IHdpdGgNCj4+PiAiYmluZG5vdyIgZW5hYmxlZC4NCj4+
Pg0KPj4+PiBJZiBzbyBJIGd1ZXNzIHdlIGNhbiBidWlsZCB4Z19vZmZsaW5lIHBhZ2Ugb25seSBv
biB4ODYuDQo+Pj4NCj4+PiBXZSBzdGlsbCBuZWVkIHRvLCBpbW8uIEJ1dCB0aGUgdG9vbCBzdGls
bCBuZWVkcyB0byBiZSB1c2FibGUgbm8gbWF0dGVyIGhvdw0KPj4+IHNwZWNpZmljYWxseSBpdCBp
cyBidWlsdC4gSXQgc2hvdWxkIGF2b2lkIHJlZmVyZW5jaW5nIHhnX29mZmxpbmVfcGFnZS5jDQo+
Pj4gZnVuY3Rpb25zIHdoZW4gYnVpbHQgZm9yIG5vbi14ODYuDQo+Pg0KPj4gQXMgSSB1bmRlcnN0
YW5kLCB0aGUgdXNhZ2Ugb2YgYXJjaC1zcGVjaWZpYyBjb21waWxlIHRpbWUgY2hlY2tzIGlzDQo+
PiBoZWF2aWx5IGRpc2NvdXJhZ2VkIGluIHRvb2xzLiBTbyBJIGRvbuKAmXQgdGhpbmsgaXQgd291
bGQgYmUgYXBwcm92ZWQgYnkNCj4+IHRvb2xzIG1haW50YWluZXJzLiBEbyB3ZSByZWFsbHkgbmVl
ZCB0byBvbWl0IHRoaXMgZmlsZSBpZiBtZW1vcnkgb3BzIGFyZQ0KPj4gYWxyZWFkeSBnZXR0aW5n
IGJsb2NrZWQgYnkgWGVuIG9uIEFybSBhbnl3YXk/DQo+IA0KPiBTbyB5b3UgYXJlIHRyeWluZyB0
byBtb2RpZnkgYSBsaWJyYXJ5IGFuZCBpbnRyb2R1Y2VkIHVudGVzdGVkDQo+IGZ1bmN0aW9uYWxp
dHkganVzdCB0byBiZSBhYmxlIHRvIGJ1aWxkIGEgZGlmZmVyZW50IHRvb2w/IEkgZG9uJ3QgdGhp
bmsNCj4gdGhhdCBhIGdvb2QgaWRlYSBlc3BlY2lhbGx5IGluIHRoaXMgY2FzZSB3aGVyZSBpdCdz
IG1vcmUgdGhhbiBqdXN0IGdsdWUNCj4gY29kZSBiZXR3ZWVuIGEgYmluYXJ5IGFuZCB4ZW4uDQo+
IA0KPiBXZSBjb3VsZCBjaGFuZ2UgdGhlIGxpYnJhcnkgdG8gcHJvdmlkZSB0aGUgbWlzc2luZyBz
eW1ib2xzLCBidXQgaXQgaXMNCj4gcHJvYmFibHkgYmVzdCB0byBrZWVwIGl0IHRoYXQgd2F5IGZv
ciBub3cuDQo+IA0KPiBTbywgaG93IGFib3V0IGNoYW5naW5nIGB4ZW4taHB0b29sYCB0byBoYXZl
IHJlZHVjZWQgZnVuY3Rpb25hbGl0eSBvbg0KPiBvdGhlciBwbGF0Zm9ybSwgYW5kIGtlZXAgdGhl
ICdtZW0tKicgY29tbWFuZCBvbiB4ODYgb25seT8gWW91IGNvdWxkIG1vdmUNCj4gdGhlIGZ1bmN0
aW9uIHRoYXQgaW1wbGVtZW50IHRoZSAnbWVtLSonIGNvbW1hbmQgaW50byBhIHNlcGFyYXRlIGZp
bGUsDQo+IHRoYXQgY29tcGlsZSBvbmx5IG9uIHg4NiAob3IgbW9yZSBzcGVjaWZpY2FsbHkgd2hl
biBDT05GSUdfTUlHUkFURSBpcw0KPiBzZXQpIGFuZCBqdXN0IGhhdmUgYSAiI2lmIGRlZmluZWQo
X19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykiIGluDQo+IHRoZSBgbWFpbl9vcHRpb25z
YCBhcnJheS4NCj4gDQo+IFRoZXkgYXJlIGNvbXBpbGUtdGltZSBhcmNoLXNwZWNpZmljIGNoZWNr
IGV2ZXJ5d2hlcmUgaW4gdG9vbHMuIEFyY2gNCj4gc3BlY2lmaWMgYXJlIG9mdGVuIGltcGxlbWVu
dGVkIGluIHNlcGFyYXRlZCBzb3VyY2UgZmlsZSwgdGhpcyBtZWFuIHdlDQo+IGNhbiBsaW1pdCB0
aGUgI2lmZGVmcyB0byBhIG1pbmltdW0gYW5kIGtlZXAgdGhlIGNvZGUgcmVhZGFibGUuDQo+IA0K
PiBUaGFua3MsDQo+IA0KPiANCg0KU2hvdWxkIEkgYWxzbyBkbyB0aGUgc2FtZSB0aGluZyBmb3Ig
U01UIG9wZXJhdGlvbnM/DQoNCi0tIA0KTXlreXRh

