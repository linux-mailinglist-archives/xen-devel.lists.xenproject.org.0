Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKn1OY1hE2qh/QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:37:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110A5C42DA
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318885.1586813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFZZ-0006DZ-7j; Sun, 24 May 2026 20:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318885.1586813; Sun, 24 May 2026 20:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFZZ-0006C8-4f; Sun, 24 May 2026 20:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1318885;
 Sun, 24 May 2026 20:37:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wRFZX-0006C2-Pl
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 20:37:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRFZX-002icK-5x
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 22:37:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a13614f-2eae-0a2a0a5409dd-0a2a450c96d0-20
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:37:19 +0200
Received: from [52.101.229.112]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a13617c-62f1-0a2a450c0019-3465e570df67-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:37:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS3P286MB2325.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 20:37:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 20:37:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl2VRAS++AK2N9p0S2W2sNnFYtcrcxM6gWfg0mcOWxSha5JkT6Crb8gPWUsYisA88RKPcQo1cYECPgSneYnVUWx2mW3/0q4dGppVyHVtok02KVr1cxrOgkK+zz8IaDXqEtrL/lHLiybaZcc6NwjYjUUHe9nF0yuWtTzB5h5vVlD645crJuHLHpWGXoHfc2WsdTW2hRLwPhcupfikGIwFB7alIfp+6b1VXT64FJU8/CbgAZhRBzYd+qsfZcfuCCM1Kltk2KKI1bQybvzaTjYJJWaejLggI1X5+8Qaa8JIUeQvy5huXUlJ+Kvof5I1ALPOp2mtndsIUyZYONaVkVGK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuLWY8E/UoAVMi1CTfubagCsoMAjzmZBXHgxmR2lN2M=;
 b=QIZxCe5xXskVKblfFTkAz7rndZXpXUQ2vKTWi4WQEDg6csnvnGHXJc27wPgzYZSCBLPOf9SzaXEjxw23Qoj4/hB5dqKALcNI+Eg+HvPnazzhzYY7D75ldAdilryWscJR4hj/TI+8BfITbEVV577OQC+TNBS8OKWRB9DSvdBX3eMNAxCyg51Z5OzBqAuey5ZHiBYfPZ46iHm+G7eYHJqopNyzYDqa6eJZavNJHrg6dcpMiMmdJKVSFxPWK1QyAY/kuZrPT4gG5xA7JMm5GasmRk2UCj/9CN8Y6MoVyuHS5ChlSZMu+Yi8OZYINcRMTzecvVjYF8jOPQYnZ+ZTk1zybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuLWY8E/UoAVMi1CTfubagCsoMAjzmZBXHgxmR2lN2M=;
 b=sf7fv4F8gb80WVmgiNPDF0Sw9/rX24i7d0jSp63gnW00GSLYqbjjAVPj6ZoiLFCA6aRr2V9SiWPIUFJAfGxYsOdPq0bIylwNukH28Skt5OkCKIaQLDMiKeViTdhWWe/GJUKbJ3Gn3Yj+XCzPbyAIxTsJW0VvP7mMsL86lp3v6OQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"anthony.perard@vates.tech" <anthony.perard@vates.tech>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "julien@xen.org"
	<julien@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"dfaggioli@suse.com" <dfaggioli@suse.com>, "gwd@xenproject.org"
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 08/21] xen/sched: Link CPU topology to scheduler and
 display via xl info
Thread-Topic: [PATCH 08/21] xen/sched: Link CPU topology to scheduler and
 display via xl info
Thread-Index: AQHc6xClRaEaMKd2V0q5p1f04gDybbYdTMKAgABWeWA=
Date: Sun, 24 May 2026 20:37:15 +0000
Message-ID:
 <OS9P286MB72224573F9FC2D8E34AFE8FB820D2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260524000209.292370-1-taka@valinux.co.jp>
 <20260524000209.292370-9-taka@valinux.co.jp>
 <b9ccc68d-011f-478f-9911-94c746b2a930@suse.com>
In-Reply-To: <b9ccc68d-011f-478f-9911-94c746b2a930@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS3P286MB2325:EE_
x-ms-office365-filtering-correlation-id: 8883ec78-cffb-4bd5-6391-08deb9d43dc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 nj1HCce51Yk3UnUnvpkQ8GfWldog+nL4ko8hrlSK7uj4tl5Yf8O6sp+2SMgHs7Z0UCo1piK8PKT6C7W8GMIOZbHpjIfgs5Wg59DUH6wb0fWMam1iT+5M4n27bzMlPrTAS7cdLf4fKDkLes+OePiEDfE9XO83gzW6/Ca4mGjY0Q/XxaxrtkJfCjn4hHKsDEPfdC3ZjDfG5vPLKc7v3NZyz3oo+zwAfRZH9hJXLF8tAmn+J9PgsnMu4oHfuJKn+mNdGXd5TIh2wNNr9DmfOLSFCHBvASHp/Q7vEXL4CSNyL6n+OWZxF2oL4QLLkF6V0/yTLfUC+GeIdVbqICFLiyQCqTxBmLvqRZtGw4BpWlCT91pJjRs7dnvEflkCUPWO9rLq7cuOBVkFQN0nYL4sdTT5r1ZVdRpE+/+5MV6PRgLYYspnMKFPrUxofbLkTwtt0ZcNMixTmVeaMoSoDAPCcBH0pQOaKXVh2m7pBDOgZAqot2tQafeTobFz7SYz2AOCoO7PZIHgDDbfsaRfAXm+CJwHKyEn6YVwZSf0Ux56iEYKa9FQm3mY7vDloMCCofL89VPcSNGjEcMH63CRmpPE1lf3oCfYBeVxS74UERzQE2q+I7xbUXYT+mbkrk+X9PVt2moGPJxgKiVP8qTUuWCJf+A/UT/Lw5BlPiXSFAKuxCSlqU6QLeLoRx2oq4fbtQqXqy4ykdVJY1w9ArnEZTvVZ7NTJ+h4rnV5sofvQ5zQIRTjYUV1N1BOjMzL4AORC2GIY7Nm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVJkMUUzSkk2ZkdnbHBaUDdRTzd1RVVDd2Uzdi8yOFlKZTFhUmVEWlZUaHMv?=
 =?utf-8?B?azRQSGkxM2RHUGxqNkk3dXBNZUxmNUF0cUhxMURka2FoNnBZSDRPclFuZGs3?=
 =?utf-8?B?eDUxRE5vZ1B0NXFRUFhGSldzbFdIZGpDa2ZNdTJHZy8yaitGZ2c2MGJKcytN?=
 =?utf-8?B?b0M1YmlSN1N2T2FhSlBoMm5UMzNOeFVkT0pwZmhYbExOKzUyQ3V5V1FFTUxw?=
 =?utf-8?B?alJDa004QVM0dVF1L1FObDBTd3VHcWlBSGdUTlgrUkdBQVFPU3kwZXUwNDBY?=
 =?utf-8?B?aE1BYm5SeEExUU1FWTM3L0dXTU1qL0xnRmdONGYwdWtiK0wzWUtwalpBakFj?=
 =?utf-8?B?RzhoT1owdEZwekZ2V0F5VzFjdVY1UUluUW9kZmh6OC9QaVBiR01DQS9QcDVi?=
 =?utf-8?B?RVRSOWtnYm9mRGJGVUpVWUFkMXNqTGtPQnNoYVdsZCtERkdiNnp1Uys4MHhp?=
 =?utf-8?B?bGZBdUpsUW1BRHFUSGYrU0ZDTzNMd0k3SThhUkcxV053YzdTREhBcGNwNEVm?=
 =?utf-8?B?N3U3bjE4SStoUlN3ODNTN3pCWlYrQ3NObHBoSGsxU2lNMmhxa1VvMnVIemEx?=
 =?utf-8?B?SGF5VmZRZ20wSkNlY3NBUE53bzd6Qzk4V1lpRGpYOEsvUm1IVXliMGRaK0xy?=
 =?utf-8?B?dG1FMlRQWHlQdWplVmtWa2QzNEcwVk80S1hUNVY1dUV2NTlxRWlyRkNicjNo?=
 =?utf-8?B?MGpGRWQzZ2M2a1lsYXVjTnd3NTFWbmJmd2FURkZPdm45a1IzZTYrNHN2cEhi?=
 =?utf-8?B?SktaaG45d2l6RWhsakY0L2pPbklZSE9IK3A3b2ZlMU82djBnckc4dmZrVzBx?=
 =?utf-8?B?WHpmNGU5cVhVWE8vWTNDRGJ5ekMvWDRybWVObUh0WldDa3VyNENySEw2cVVH?=
 =?utf-8?B?N05vYzRDTzh4ZHZKcDZQeTF5dlBMUVdpZzcyNXhNdnBVaTQ4cTNxeHVsZUt0?=
 =?utf-8?B?WUFzeVc3TWVDb1VTdE1QY0w5YUlVaE9PL0FoZjI5QVB2UkNNbnRUU3diNVJa?=
 =?utf-8?B?T0lKRWs0MkhUdkhTNWpHU1BlbHgwRlJTaWZXZmpOdWNYTWYyek9hMFZPVjl5?=
 =?utf-8?B?TWRQcitmdU5tQnUrZ1paOXJZZnk3WXc4V1NLdmJ1TE5NcWpwdEFHbWJoVEdZ?=
 =?utf-8?B?ai9XV3ZlVnRZU2dyaXBnQi80RkVETmoxSlpBZUN6ckZ3WWZ1RkxCUEVNam12?=
 =?utf-8?B?YVRhRUhMYzRCYUVkVzJETXJnQUttUDhmS2xrU2lnUUxMTVdRd2RDSHZqclNB?=
 =?utf-8?B?N1N6KzBSZDl0VVVOU2J3V0dyZi9TZ2Z4cTkwdGNtQzg1SmozQjd4eGhJVHhK?=
 =?utf-8?B?cTBLZ0YrUTBUd2krRTArWjFwaWdQa2lYNjhXMUtwazBrV3pybGxjMG5Hd3Fy?=
 =?utf-8?B?VGI4N2tmTGtEYWo0T1VvQkZiRTlSeG9TZndTeWhUOVMvR0VvZDhxM1UrVm1l?=
 =?utf-8?B?TFc5K1F6YTNQM3VqWjZkenpSRnNIaW81WGswNFd2Q1hqdzRKa2llT244WnpU?=
 =?utf-8?B?RE84M1BXVC9ETkQyaS8vbEswWGxZQ0F5OGIyVDlidDNWMk83WFFEajJXYUN2?=
 =?utf-8?B?cmR2aGEyR1J6UXpuNGxmNXkyaU5qNEFhWTE4ZEF3QTlLRnA3RVU0NGR4MVBh?=
 =?utf-8?B?ek9ieFJpc2ZGdGp6MERJSXp1ZnY4RGtnSmZ1dU0wZmZ6VXJ0NnJhWUsxWUpw?=
 =?utf-8?B?eGdmZ2dwVllSNFdLUHBQb2NuNmZIRUtJcDN4L09pdXpSR3FZUWllVW5lRE0x?=
 =?utf-8?B?V2EzRllaVXVyVXc1YXdVeG4zaWRyblhKZnRxbkl1TGNKMXZsSDh2VWZxUS9n?=
 =?utf-8?B?ODlNdXAxNElEL3lLUFVPaWIxbDF0NGpscmtyaGtNa2piRDNtcWlYUHh2Vng0?=
 =?utf-8?B?bHNDYjhmZlQ5Z090RTF3djBBbmI3V2tvRDdPaXZ3Y0VIdkFqNitnWE5welY2?=
 =?utf-8?B?N0FQNW9UdmJ5Wi9IVTc4L1dKVTlCVkdQTHZ6VVgrYWZTRmNtTFdvbm5wbG1a?=
 =?utf-8?B?dlJkamdYWTVPa0F1RUg5bElKcithOE5VVHVnLytnV3R1WjJxSCtrNTIwNEFx?=
 =?utf-8?B?MzEySnFxK1cvT2dnRVNadm9vbGNub0xTckNtaTJXTVFETmJ5d1lWd3BQMzlQ?=
 =?utf-8?B?SEhmM3FYQlhVQVpoblY2VlZPdm8xODd3VkJ0VUlPZTE3a2hZL1Brcm9IQVp2?=
 =?utf-8?B?K1loNVlWZlBhcEE5TG9scHRkaXYrYmFJamx4c3g1RDVQbXovRHFlbFg0SkQr?=
 =?utf-8?B?MHZYSTZyK2dZNGNST3VmdXNBeGw4cVpNSHA0TnJvRlFCbmJiSi81dW9DakYx?=
 =?utf-8?Q?nw32HDq+suI3WgsRr8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883ec78-cffb-4bd5-6391-08deb9d43dc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2026 20:37:15.3174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kWoAZqe6tO8ZYZSCfLNtqnpcAKMOssz2sfPXlWQeuRFNLwAKD4o4Dt1oZ/akQiqaUurl9J0dCa/WxCcYPnP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2325
X-purgate-ID: tlsNG-d25034/1779655039-DBD7BCF5-3DFE6F27/0/0
X-purgate-type: clean
X-purgate-size: 1056
X-Spamd-Result: default: False [0.91 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,valinux.co.jp:dkim,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.207];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5110A5C42DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sDQoNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY3B1X3RvcG9sb2d5LmgNCj4gPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1X3RvcG9sb2d5LmgNCj4gPiBAQCAtMTQsNiArMTQsOSBA
QCBzdHJ1Y3QgY3B1X3RvcG9sb2d5IHsNCj4gPiAgICAgIGNwdW1hc2tfdCB0aHJlYWRfc2libGlu
ZzsNCj4gPiAgICAgIGNwdW1hc2tfdCBjb3JlX3NpYmxpbmc7DQo+ID4gICAgICBjcHVtYXNrX3Qg
Y2x1c3Rlcl9zaWJsaW5nOw0KPiA+ICsgICAgaW50IHRvX2NvcmU7DQo+ID4gKyAgICBpbnQgdG9f
c29ja2V0Ow0KPiA+ICsgICAgaW50IG51bV9zaWJsaW5nczsNCj4gPiAgfTsNCj4gDQo+IFdoYXQg
c2lnbmlmaWNhbmNlIGRvIHRoZSB0b18gcHJlZml4ZXMgaGF2ZSBoZXJlPyBBbmQgd2hhdCdzIHRo
ZSBtZWFuaW5nIG9mIGFueQ0KPiBvZiB0aGUgZmllbGRzIGhvbGRpbmcgbmVnYXRpdmUgdmFsdWVz
PyAoSWYgdGhleSBjYW4ndCBob2xkIG5lZ2F0aXZlIHZhbHVlcywgdXNlDQo+IHVuc2lnbmVkIGlu
dCBwbGVhc2UuKQ0KDQpUaGVzZSBtZW1iZXJzIGFyZSB1c2VkIHRvIG1hcCBhIGxvZ2ljYWwgQ1BV
IElEIHRvIGEgcGh5c2ljYWwgY29yZSBJRCBhbmQNCmEgcGh5c2ljYWwgc29ja2V0IElELiBJIHdp
bGwgcmVuYW1lIHRoZW0gdG8gcGh5c19jb3JlX2lkIGFuZCBwaHlzX3NvY2tldF9pZA0KcmVzcGVj
dGl2ZWx5LCBhbmQgbWFrZSB0aGVtIHVuc2lnbmVkIGludC4NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IGFkdmljZS4NCkhpcm9rYXp1IFRha2FoYXNoaQ0K

