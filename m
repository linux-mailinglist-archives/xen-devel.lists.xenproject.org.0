Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHRmB0eqrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA82379A1
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249279.1546788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTa-0004sW-Mb; Mon, 09 Mar 2026 11:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249279.1546788; Mon, 09 Mar 2026 11:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTa-0004nX-Go; Mon, 09 Mar 2026 11:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1249279;
 Mon, 09 Mar 2026 11:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTY-0003iR-Ty
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:41 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 533635de-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:30 +0000
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
X-Inumbo-ID: 533635de-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNvNmbgqDJK2L+vIoJyA85Uf7OEmPgIqHSQjq71ibsxBxaJV/uNZzMWDWczahzoMxf9+/T54BiUq4qYALg1OgRHUlT5tR90ligM7ibKaWvxouoX5ij49BkTi9ALDbmVTOCvbEcwBSmxU1UojQ+o0Nl6ukA0/NQ4qFI193HWJqeFSzKzhR3bBa5g3DLh8x5Sd0NN+NmRZsm6m+qF4wKuoI93E8clFIsJTqffgZodd8cCi7QSauJ1fqqsU/JKE84HeKtDwhCN0QWPhyN5uoqQ+9SKL+FrkNMboqZSPI7AJ698qX2CXTC05ZHhiTy4Rv6ogswmhPPmP8vwh4RYD32geyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as8HXwLx1Zl9o2iQtPqGLoGRGBXmJbz5GSTKA8wbpEg=;
 b=txDinyKu++Xk3mujU58GFWCEgby8z98yN6d8TAyvbNE1DluG9ZTNoCltTH2DWv+PHcQ62LestJKNB3qdLvlMdqCptsomW54Vco0clgt3JnPZDXxU0GrgaIHSLL4NhEnm9Bzergq1d9FnAcdATILM0kEtMSXqvGVNyg4jJN3bZcXTA4IU1mf/msVWm4qoacZm5Y4b+mITmJdK+V587V7OVvkAyZUDepSQVTO/1VCzsrPrMKvUncMdtjRwuEfX3uZTKUad8LzONANuANdxd2NbATIpNbRJUzXTVCQfbj/qI6pbt6nRj38uGhbYiQeLdP6nHVF3p43zUs3AefCHwicTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as8HXwLx1Zl9o2iQtPqGLoGRGBXmJbz5GSTKA8wbpEg=;
 b=YM3ClKHI1XPlEwOAyXw2zRDGkOJ5KRE+ltfnNHslT062QWDp80yk4fMtSlAsRda2PQhWrGil+5WERPFJpMLyvWEkGRnSPmsS6SXitl9mFnXovLTfyXLl5ySoynbqniR/lKqiag6MEBoVf4hULpBp79oEekvveEG4yzEuNfaADUiYf0H8K+KNKZgMiZRlnty+Z1lCZK21CKaqNjzMOIvM99CS/pe02V9AKn6LD+fnx1Jr+a261VGN03Rm3vUtwfgN8Batt4oScq31YtVHa8EdDRjPsW8pJYqTMm5yTCmuQjwbeS6gnmPZuvQ59jqpej+UPFwRQcs3WHpsZlx8qmFodQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu pending
 actions
Thread-Topic: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Index: AQHcr7UNjpbdOXJQP0qdir/zrd85oQ==
Date: Mon, 9 Mar 2026 11:08:26 +0000
Message-ID:
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9695:EE_
x-ms-office365-filtering-correlation-id: 9ba41daa-adda-4cbc-6641-08de7dcc3287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 FgBkkkf5bQYCe5NIp3tiTwRBx5GxGX5OdGalTuAAIPC53cH+NHwLxFtKgRA79kB7vkr2ELmJqixBxsg/yGFosUEd/O0YwjsVUFw9H3pEAE6BeS9HwTe9l2OoUYmgpKgJMLo6AutEH36CO59lcBZJ/KOKNgSZ3vviafFTb1Pg3pDco9I0r4m7QCi1zQ22qbebJj342FvHie2uUFSQ48YMBEo+ROmNGbBsk3TzcCYdkZTu42QFA43pVIoYu+gEQzWAgLFNfZJayXbILBQ5tnH5bkeEiVPL9ZJYzDrE5yg1xDApeCkPBQbQVS7vzKeDcVMnaa3qL60c1wHLVxybZ415z/Ey4Sb/VUO+vAyUltW/Zh3Iq49+GRc5SMU38r3qZGKsb2lDKmcrCjzDybLuBZYKcd0WfDiEKIYGrvG1LGRoM4o/wv8AJi45EECRjp31MAUeL+dqRRStLhIxhhig/aAmLN6zCyc/Dq2CfmrwD59IDr6R2FlJVvve8E1jTUNjPhZ15CbHCi0l2EF+Z73XkRQlnIdnCNxvqmAFkEVqjKm638PITQaLmwpNvJGRpdmPGErWRnVVKdOyB7dqU3L80kJwfAcVj9/ZYAf//Sjj4ipRl/s8WD4eMt4XsM8/Ci7HWHeY1IK14enPg3Xgf49EOojbB8d4Pc+IwDGx3XVkG9FhmJ/iMNtdv7jWQVMcolT/XFoQSf3JGY0aoIph28l6KSy/gVbzZ4/mC2sx6mZfvQtB8nbN6m1VEtDjmyv8RT4tdtfK4LBnyKCKUeGSVUWT7mcbv7phPWvbaDWIFefp88Oz0q0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUxoTEtMcFJnanFUeFpxTjdsb2VoWDhMTktoRXFUZ2w2aFlMdnJvM1VoMEVv?=
 =?utf-8?B?U05MZVZHaVB1ellZWnA4L25aVGplVlpUWGdHQ3ZBbGdGRlQwYU82VlBVWHMr?=
 =?utf-8?B?NnV5Z0xzNWpwU0ZPTlRjYkhURWJqdlJjSDVIRUp0SlJ5MmFUS29FRUNjeVhq?=
 =?utf-8?B?SnhicWVtS2hrdHZEejVLY1NMdW40d3ZBS1ZzWVRqeEJyTk9DNkdNa1dWNno5?=
 =?utf-8?B?TFMyZXg0OVNpYnBvb1NuMGNORVNLZ2QxS3FuWEg5S2NUdlUyS3Ard3JVeEQy?=
 =?utf-8?B?MnBKSnVqTE9VQW9ubHR3WUlsVmRvQmRiOUVUWmRmZEtXZ3BmdkE4RjR2anpz?=
 =?utf-8?B?TTgzM3U5NGszazVrSU9XbXVXWnU4YlYyYkt6dlpHRWR5Zll0YkxhMFBPSVZR?=
 =?utf-8?B?QUlFRU1TU2M3K2I3VEJhSkVhcUpaMlJLczljVStYb0NYa2lsdGtvd013aVJj?=
 =?utf-8?B?K1VZdWlTRVVjRTROVU8rbmEyNkdKdXh4d2syTjYvcDdqWGRwR2pPalNncGJO?=
 =?utf-8?B?bmNZQ0dkVDVpZVhUZllOSUtpN09oY1VFejhvbmc3OThYUTVFTVhtcFBGMVdD?=
 =?utf-8?B?UnRSNGx2Tmw4eUN6RUxmVE5mL3ptTWRocmZYb2VoMEtOVGpzRWNmV3ppYkFY?=
 =?utf-8?B?Zi9RcFZoYmdGdEVRZk9JMTVFRERSbUZMOG5lczB0b3lPaEZDcFRvdkhHS2VZ?=
 =?utf-8?B?K0NNcmZtaEViK0xmTDhmOG1QdFdNcWhHOEF1UzBQbDFpRUZxMXMrMU53SEti?=
 =?utf-8?B?ejBOVkZGU2ovSHBleDFyVXdyeTdZU0FCWldGbC9FREdZNmtjd0hVbDdsbTNi?=
 =?utf-8?B?RmlyOGlMWHZuMXFmeXpZeHg3MkZCN1U0b25xbnM5N2pPMjg1MDN4L2NlSzAy?=
 =?utf-8?B?TkYxUEo3TXRHc3VjNEJCa242K2FuZkV5QnlKVk1TRkpXcHc4bUUrLzhRZ1p6?=
 =?utf-8?B?aENJWEZZVDJ3bEFjeW0wN1d0dXJMRnBaL1NkMC8zb0M2L1RaWlRSa2pyMmMr?=
 =?utf-8?B?dmh4MTFPcEd4ZGRzR3o2cSs3WXQxQ25YRUhMYjJqWXBqQm5jYmJlMWJGMFRs?=
 =?utf-8?B?VEJpT0s0eFNZbldGSU9nSU1YVkJyS3RFMnlKYWh4WkVuazRldnhpNmJIaHJi?=
 =?utf-8?B?TjBudUlleWdBOUh1NlpabXZaU0J6bEZRYnVPelNHREhjaEQzdElNcTNIV3hl?=
 =?utf-8?B?L0NWbHJJc3gvZlNVR0tOeWpOZjVUYnE2elNNdzdXQlZvQTdqb1VxWnp3T2hP?=
 =?utf-8?B?aG1GWVczaS9QQW13ek5NTWE0d3dIdFkvVmhUUkJweXpTS0l2V0haVGFUeHMy?=
 =?utf-8?B?ZEMzaHFhRUhDRzNDS1BnMmJyYUJJK0puQUFYWTJYT2NLdWtnTDVRa2E0Nk5p?=
 =?utf-8?B?bnRmY0FDMUh1M0E4ek9FNytFbkJLMXFDZlZLUE0xTE5hb1MvTUlQdVpRNW85?=
 =?utf-8?B?RDFKcm5NZzFFVUZYMlFWeE9BamxHa00wTEorbzRjSEZ0a25ISnlSYzFjT3h6?=
 =?utf-8?B?OTl4b3NRYXhKSVdEK2NMZzhaQ0tGdXNMYjZKVkFPWGtiQ0luSlZPdUVFb2lI?=
 =?utf-8?B?V1hUcW9qdXdHQk5QR3F4RTkveDVQbStGYzFUK2VWTy9UMmtqMmIrek5acW9M?=
 =?utf-8?B?RnFwQWlTNk1KY05WcHlpRmJMNlJmTkpxSE1DWUxhT0VhbHhxRFFFeGIvMGor?=
 =?utf-8?B?ditYMjNMeVdDRFFDT3U1ekhhZDVZUzNFN1gxbkRrU2UrMTUvVldnZjN1eUZP?=
 =?utf-8?B?TFp2T0RFSmIvZW81MlRhNTU4ZkdRQ1htSFpoVjlBMkcwdXpPR0h4UWs3OVMx?=
 =?utf-8?B?WE9rQnErSC80MmY3T2RrZ0JHM0NrT1BHajVZZzZ5UklRWHhGU1poTzBHRWtL?=
 =?utf-8?B?cjU4NlgvdHo0MlYrZExRdEpuMnBleU10WVIwODhhNnF2SUk3WElXSGJEWjhs?=
 =?utf-8?B?V0RVU1dSTThUamtkcmxzVVVWUGhLeUlUdkYwYXNTb0NUeHVsanA3NkgzVFcr?=
 =?utf-8?B?OEZPV2NralpHL3JmdTh6aHlJQkx1S3JSbjc0WjRvL2ZhRTdGT3JPU2hTVnBI?=
 =?utf-8?B?SHpJekNPcVFzRFNVb3crclJzMFV1ZTc2T3cxWTA2TGhueUZXckRWQTlJZDlV?=
 =?utf-8?B?N21saUJROG5kTGlHNVRlNGFhR3ZmL2czYmhNRW5mdXdya0JwQ2Q3d1ZVQ2Ja?=
 =?utf-8?B?M0V1TzlFOTQxZU4wbE16ak4rUkg5YWp5eVVkN1hDMHN4SXJKRkhHTkdmUGQy?=
 =?utf-8?B?ZkpINWtRL1VQdE05VzFrb29tWjBNOS9LUUdiK2xuYnIyQXFKSkhMaW41dGpG?=
 =?utf-8?B?ZnNyOTlzYjNrcklkUzNoK29GejdNdnVJZ1BGRWdDMUM1bXYydmlTczVYLzJH?=
 =?utf-8?Q?YE9MyvWmuNlzAoG4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32432DDDF70C5D40839E4418016DD16E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba41daa-adda-4cbc-6641-08de7dcc3287
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:26.9721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dURlGtTLDghS1KYqIh8m0pMYhb9AQHdXq/yp2sOUZDoK+L1+rfAUoIe6S36WqqtLzt3CZjd6Xt1BmJnhhxSUrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: A8CA82379A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

VGhpcyBhbGxvd3Mgd2FpdGluZyBhIHNwZWNpZmllZCBudW1iZXIgb2YgY3ljbGVzIG9uIHRoZSB2
Y3B1LiBPbmNlIHRoZQ0Kd2FpdCBoYXMgZmluaXNoZWQgYSBjYWxsYmFjayBpcyBleGVjdXRlZC4N
Cg0KTm90ZSB0aGF0IHRoaXMgaXMgc3RpbGwgbm90IHVzZWQsIGJ1dCBpbnRyb2R1Y2VkIGhlcmUg
aW4gb3JkZXIgdG8NCnNpbXBsaWZ5IHRoZSBjb21wbGV4aXR5IG9mIHRoZSBwYXRjaGVzIHRoYXQg
YWN0dWFsbHkgbWFrZSB1c2Ugb2YgaXQuDQoNClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkg
PG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KLS0tDQp2MS0+djI6DQoqIG5ldyBwYXRjaA0KLS0t
DQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDEyNSArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLQ0KIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgfCAgMTkgKysrKysr
DQogMiBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jDQppbmRleCBjYjY0ZDliOWZjLi4yODQ5NjRmMGQ0IDEwMDY0NA0KLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0K
QEAgLTE3NSw3NiArMTc1LDkyIEBAIHN0YXRpYyB2b2lkIG1vZGlmeV9kZWNvZGluZyhjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3QgY21kLA0KIA0KIGJvb2wgdnBjaV9wcm9jZXNz
X3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpDQogew0KLSAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiA9IHYtPnZwY2kucGRldjsNCi0gICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSBO
VUxMOw0KLSAgICB1bnNpZ25lZCBpbnQgaTsNCi0NCi0gICAgaWYgKCAhcGRldiApDQotICAgICAg
ICByZXR1cm4gZmFsc2U7DQotDQotICAgIHJlYWRfbG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7
DQotDQotICAgIGlmICggIXBkZXYtPnZwY2kgfHwgKHYtPmRvbWFpbiAhPSBwZGV2LT5kb21haW4p
ICkNCisgICAgc3dpdGNoICggdi0+dnBjaS50YXNrICkNCiAgICAgew0KLSAgICAgICAgdi0+dnBj
aS5wZGV2ID0gTlVMTDsNCi0gICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2Nr
KTsNCi0gICAgICAgIHJldHVybiBmYWxzZTsNCi0gICAgfQ0KLQ0KLSAgICBoZWFkZXIgPSAmcGRl
di0+dnBjaS0+aGVhZGVyOw0KLSAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVy
LT5iYXJzKTsgaSsrICkNCisgICAgY2FzZSBNT0RJRllfTUVNT1JZOg0KICAgICB7DQotICAgICAg
ICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXItPmJhcnNbaV07DQotICAgICAgICBzdHJ1
Y3QgcmFuZ2VzZXQgKm1lbSA9IHYtPnZwY2kuYmFyX21lbVtpXTsNCi0gICAgICAgIHN0cnVjdCBt
YXBfZGF0YSBkYXRhID0gew0KLSAgICAgICAgICAgIC5kID0gdi0+ZG9tYWluLA0KLSAgICAgICAg
ICAgIC5tYXAgPSB2LT52cGNpLmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwNCi0gICAgICAgICAg
ICAuYmFyID0gYmFyLA0KLSAgICAgICAgfTsNCi0gICAgICAgIGludCByYzsNCisgICAgICAgIGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdi0+dnBjaS5tZW1vcnkucGRldjsNCisgICAgICAg
IHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gTlVMTDsNCisgICAgICAgIHVuc2lnbmVkIGlu
dCBpOw0KIA0KLSAgICAgICAgaWYgKCByYW5nZXNldF9pc19lbXB0eShtZW0pICkNCi0gICAgICAg
ICAgICBjb250aW51ZTsNCisgICAgICAgIGlmICggIXBkZXYgKQ0KKyAgICAgICAgICAgIGJyZWFr
Ow0KIA0KLSAgICAgICAgcmMgPSByYW5nZXNldF9jb25zdW1lX3JhbmdlcyhtZW0sIG1hcF9yYW5n
ZSwgJmRhdGEpOw0KKyAgICAgICAgcmVhZF9sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCiAN
Ci0gICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCisgICAgICAgIGlmICggIXBkZXYtPnZw
Y2kgfHwgKHYtPmRvbWFpbiAhPSBwZGV2LT5kb21haW4pICkNCiAgICAgICAgIHsNCisgICAgICAg
ICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVMTDsNCiAgICAgICAgICAgICByZWFkX3VubG9j
aygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQotICAgICAgICAgICAgcmV0dXJuIHRydWU7DQorICAg
ICAgICAgICAgYnJlYWs7DQogICAgICAgICB9DQogDQotICAgICAgICBpZiAoIHJjICkNCisgICAg
ICAgIGhlYWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQorICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCiAgICAgICAgIHsNCi0gICAgICAg
ICAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KLSAgICAgICAgICAgIC8qIERpc2Fi
bGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWlsdXJlLiAqLw0KLSAgICAg
ICAgICAgIG1vZGlmeV9kZWNvZGluZyhwZGV2LCB2LT52cGNpLmNtZCAmIH5QQ0lfQ09NTUFORF9N
RU1PUlksDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlKTsNCi0gICAgICAgICAg
ICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQorICAgICAgICAgICAgc3RydWN0IHZw
Y2lfYmFyICpiYXIgPSAmaGVhZGVyLT5iYXJzW2ldOw0KKyAgICAgICAgICAgIHN0cnVjdCByYW5n
ZXNldCAqbWVtID0gdi0+dnBjaS5iYXJfbWVtW2ldOw0KKyAgICAgICAgICAgIHN0cnVjdCBtYXBf
ZGF0YSBkYXRhID0gew0KKyAgICAgICAgICAgICAgICAuZCA9IHYtPmRvbWFpbiwNCisgICAgICAg
ICAgICAgICAgLm1hcCA9IHYtPnZwY2kubWVtb3J5LmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwN
CisgICAgICAgICAgICAgICAgLmJhciA9IGJhciwNCisgICAgICAgICAgICB9Ow0KKyAgICAgICAg
ICAgIGludCByYzsNCisNCisgICAgICAgICAgICBpZiAoIHJhbmdlc2V0X2lzX2VtcHR5KG1lbSkg
KQ0KKyAgICAgICAgICAgICAgICBjb250aW51ZTsNCiANCi0gICAgICAgICAgICAvKiBDbGVhbiBh
bGwgdGhlIHJhbmdlc2V0cyAqLw0KLSAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlf
U0laRShoZWFkZXItPmJhcnMpOyBpKysgKQ0KLSAgICAgICAgICAgICAgICBpZiAoICFyYW5nZXNl
dF9pc19lbXB0eSh2LT52cGNpLmJhcl9tZW1baV0pICkNCi0gICAgICAgICAgICAgICAgICAgICBy
YW5nZXNldF9wdXJnZSh2LT52cGNpLmJhcl9tZW1baV0pOw0KKyAgICAgICAgICAgIHJjID0gcmFu
Z2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKTsNCiANCi0gICAgICAg
ICAgICB2LT52cGNpLnBkZXYgPSBOVUxMOw0KKyAgICAgICAgICAgIGlmICggcmMgPT0gLUVSRVNU
QVJUICkNCisgICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5k
b21haW4tPnBjaV9sb2NrKTsNCisgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQorICAgICAg
ICAgICAgfQ0KIA0KLSAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2Nr
KTsNCisgICAgICAgICAgICBpZiAoIHJjICkNCisgICAgICAgICAgICB7DQorICAgICAgICAgICAg
ICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQorICAgICAgICAgICAgICAgIC8qIERp
c2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWlsdXJlLiAqLw0KKyAg
ICAgICAgICAgICAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5tZW1vcnkuY21kICYg
flBDSV9DT01NQU5EX01FTU9SWSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
bHNlKTsNCisgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0K
Kw0KKyAgICAgICAgICAgICAgICAvKiBDbGVhbiBhbGwgdGhlIHJhbmdlc2V0cyAqLw0KKyAgICAg
ICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsr
ICkNCisgICAgICAgICAgICAgICAgICAgIGlmICggIXJhbmdlc2V0X2lzX2VtcHR5KHYtPnZwY2ku
YmFyX21lbVtpXSkgKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgIHJhbmdlc2V0X3B1cmdlKHYt
PnZwY2kuYmFyX21lbVtpXSk7DQorDQorICAgICAgICAgICAgICAgIHYtPnZwY2kubWVtb3J5LnBk
ZXYgPSBOVUxMOw0KKw0KKyAgICAgICAgICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5w
Y2lfbG9jayk7DQogDQotICAgICAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHYtPmRv
bWFpbikgKQ0KLSAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsNCisgICAg
ICAgICAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHYtPmRvbWFpbikgKQ0KKyAgICAg
ICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKHYtPmRvbWFpbik7DQogDQotICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOw0KKyAgICAgICAgICAgICAgICBicmVhazsNCisgICAgICAgICAgICB9DQog
ICAgICAgICB9DQotICAgIH0NCi0gICAgdi0+dnBjaS5wZGV2ID0gTlVMTDsNCisgICAgICAgIHYt
PnZwY2kubWVtb3J5LnBkZXYgPSBOVUxMOw0KIA0KLSAgICBzcGluX2xvY2soJnBkZXYtPnZwY2kt
PmxvY2spOw0KLSAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5jbWQsIHYtPnZwY2ku
cm9tX29ubHkpOw0KLSAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQorICAgICAg
ICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KKyAgICAgICAgbW9kaWZ5X2RlY29kaW5n
KHBkZXYsIHYtPnZwY2kubWVtb3J5LmNtZCwgdi0+dnBjaS5tZW1vcnkucm9tX29ubHkpOw0KKyAg
ICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KIA0KLSAgICByZWFkX3VubG9j
aygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQorICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWlu
LT5wY2lfbG9jayk7DQorDQorICAgICAgICBicmVhazsNCisgICAgfQ0KKyAgICBjYXNlIFdBSVQ6
DQorICAgICAgICBpZiAoIE5PVygpIDwgdi0+dnBjaS53YWl0LmVuZCApDQorICAgICAgICAgICAg
cmV0dXJuIHRydWU7DQorICAgICAgICB2LT52cGNpLndhaXQuY2FsbGJhY2sodi0+dnBjaS53YWl0
LmRhdGEpOw0KKyAgICAgICAgYnJlYWs7DQorICAgIGNhc2UgTk9ORToNCisgICAgICAgIHJldHVy
biBmYWxzZTsNCisgICAgfQ0KIA0KKyAgICB2LT52cGNpLnRhc2sgPSBOT05FOw0KICAgICByZXR1
cm4gZmFsc2U7DQogfQ0KIA0KQEAgLTI5NSw5ICszMTEsMTAgQEAgc3RhdGljIHZvaWQgZGVmZXJf
bWFwKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29u
bHkpDQogICAgICAqIGlzIG1hcHBlZC4gVGhpcyBjYW4gbGVhZCB0byBwYXJhbGxlbCBtYXBwaW5n
IG9wZXJhdGlvbnMgYmVpbmcNCiAgICAgICogc3RhcnRlZCBmb3IgdGhlIHNhbWUgZGV2aWNlIGlm
IHRoZSBkb21haW4gaXMgbm90IHdlbGwtYmVoYXZlZC4NCiAgICAgICovDQotICAgIGN1cnItPnZw
Y2kucGRldiA9IHBkZXY7DQotICAgIGN1cnItPnZwY2kuY21kID0gY21kOw0KLSAgICBjdXJyLT52
cGNpLnJvbV9vbmx5ID0gcm9tX29ubHk7DQorICAgIGN1cnItPnZwY2kubWVtb3J5LnBkZXYgPSBw
ZGV2Ow0KKyAgICBjdXJyLT52cGNpLm1lbW9yeS5jbWQgPSBjbWQ7DQorICAgIGN1cnItPnZwY2ku
bWVtb3J5LnJvbV9vbmx5ID0gcm9tX29ubHk7DQorICAgIGN1cnItPnZwY2kudGFzayA9IE1PRElG
WV9NRU1PUlk7DQogICAgIC8qDQogICAgICAqIFJhaXNlIGEgc2NoZWR1bGVyIHNvZnRpcnEgaW4g
b3JkZXIgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSByZXN1bWluZw0KICAgICAgKiBleGVjdXRp
b24gd2l0aCBwZW5kaW5nIG1hcHBpbmcgb3BlcmF0aW9ucywgdG8gdHJpZ2dlciB0aGUgaW52b2Nh
dGlvbg0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94
ZW4vdnBjaS5oDQppbmRleCBmYTY1NDU0NWU1Li40N2NkYjU0ZDQyIDEwMDY0NA0KLS0tIGEveGVu
L2luY2x1ZGUveGVuL3ZwY2kuaA0KKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KQEAgLTIx
Miw3ICsyMTIsMjYgQEAgc3RydWN0IHZwY2lfdmNwdSB7DQogICAgIC8qIFBlci12Y3B1IHN0cnVj
dHVyZSB0byBzdG9yZSBzdGF0ZSB3aGlsZSB7dW59bWFwcGluZyBvZiBQQ0kgQkFScy4gKi8NCiAg
ICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQogI2lmZGVmIF9fWEVOX18NCisgICAgZW51
bSB7DQorICAgICAgICBOT05FLA0KKyAgICAgICAgTU9ESUZZX01FTU9SWSwNCisgICAgICAgIFdB
SVQsDQorICAgIH0gdGFzazsNCiAgICAgc3RydWN0IHJhbmdlc2V0ICpiYXJfbWVtW1BDSV9IRUFE
RVJfTk9STUFMX05SX0JBUlMgKyAxXTsNCisgICAgdW5pb24gew0KKyAgICAgICAgc3RydWN0IHsN
CisgICAgICAgICAgICAvKiBTdG9yZSBzdGF0ZSB3aGlsZSB7dW59bWFwcGluZyBvZiBQQ0kgQkFS
cy4gKi8NCisgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCisgICAgICAg
ICAgICB1aW50MTZfdCBjbWQ7DQorICAgICAgICAgICAgYm9vbCByb21fb25seSA6IDE7DQorICAg
ICAgICB9IG1lbW9yeTsNCisgICAgICAgIHN0cnVjdCB7DQorICAgICAgICAgICAgLyogU3RvcmUg
d2FpdCBzdGF0ZS4gKi8NCisgICAgICAgICAgICBzX3RpbWVfdCBlbmQ7DQorICAgICAgICAgICAg
dm9pZCAoKmNhbGxiYWNrKSh2b2lkICopOw0KKyAgICAgICAgICAgIHZvaWQgKmRhdGE7DQorICAg
ICAgICB9IHdhaXQ7DQorICAgIH07DQogI2VuZGlmDQogICAgIHVpbnQxNl90IGNtZDsNCiAgICAg
Ym9vbCByb21fb25seSA6IDE7DQotLSANCjIuNTEuMg0K

