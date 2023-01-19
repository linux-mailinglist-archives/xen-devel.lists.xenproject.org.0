Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79A673B96
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481170.745897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVoA-0000Q4-9w; Thu, 19 Jan 2023 14:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481170.745897; Thu, 19 Jan 2023 14:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVoA-0000Nn-6z; Thu, 19 Jan 2023 14:22:26 +0000
Received: by outflank-mailman (input) for mailman id 481170;
 Thu, 19 Jan 2023 14:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOG/=5Q=zf.com=youssef.elmesdadi@srs-se1.protection.inumbo.net>)
 id 1pIVo9-0000Nh-Cy
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:22:25 +0000
Received: from de-smtp-delivery-114.mimecast.com
 (de-smtp-delivery-114.mimecast.com [194.104.109.114])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b078e00a-9804-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 15:22:23 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-47-ZPPMhxetNn-J4aa-lOw4Hw-1; Thu, 19 Jan 2023 15:22:18 +0100
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::22) by PA4PR08MB6078.eurprd08.prod.outlook.com
 (2603:10a6:102:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 14:22:17 +0000
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7]) by AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7%2]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 14:22:17 +0000
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
X-Inumbo-ID: b078e00a-9804-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zf.com; s=mczfcom20220728;
	t=1674138142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8g8fHayFHYCmZiqeudSU8mkWjRVhTPW/eEm5DSLUHk=;
	b=jlqjzg7mzNOuWSsw+JKWhv1+hlK8VBW3gXLFBp3sObq52l88VJnZQrMG/+8tT6Y0318xBj
	AgW81fc0G744heQAO+wZHk/Q+/HMhr25QOqTuVVXk6j6J/1Y3NTGFJQkWhUpgHX5CTX1O2
	kg6JHCTe+tixFxah9kkMV6k6kum/USI=
X-MC-Unique: ZPPMhxetNn-J4aa-lOw4Hw-1
From: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Subject: AW: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Topic: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Index: Adkk/qg7kRGuW6KDReaFxxX6SSJ/1gA5Tq8AAFmZfbAAzbzrAABjz8vw
Date: Thu, 19 Jan 2023 14:22:17 +0000
Message-ID: <AM5PR0802MB25785FDEB43A8137D644BC7E9DC49@AM5PR0802MB2578.eurprd08.prod.outlook.com>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
 <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
In-Reply-To: <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Enabled=true;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SetDate=2023-01-19T14:22:14Z;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Method=Privileged;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Name=Internal sub2 (no
 marking);
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SiteId=eb70b763-b6d7-4486-8555-8831709a784e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ActionId=a60f9e3f-f352-48be-8dc4-b9acf14a6c2a;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR0802MB2578:EE_|PA4PR08MB6078:EE_
x-ms-office365-filtering-correlation-id: 230b89af-b89c-4287-2bb9-08dafa28916a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: EnQqYSrDut/9aglaAZL+th0aCDuw69NIiFXzk7OsimSJgVfE0mpJ2at8gJCwjJAKV2yr77xZUnd8P+vOGzJMG9/8KiMseu2gXodFk5QNXcbCJVNUwn9nstNkJppmP0zRoi0hoXQjX1zfYnJRotFUYv5U6SnywJUGExhF1WYt84S545QCk9WNjqFgMBzCDS0ckqNHY1teiCJVID2ksR8phU4rckUu7+Yi+ZNTTgb+BceinvCnKf439HPlxBFwVEVlWH2zaVkcoPDAEY8QESJBxy998hBmWd+e4jKCGiP7uSE/C2stfvpf1Cjuvb7KfLH5tqTxRme1FZqlYNxvYy4EAVADx3Xbc3rBMCeBIRuoIKLlO5LQXBSKUruPWcjxGB7snczC3A7/6pcFwCkeaql+A7GA0TTWPKr+ZmPatG0pbmrSGjoXdVtoA427iiIXiJYqQS06//BQM8tPmO+QdL0uUBMUEcmjT2ZAx75/K3okXRZEHsAU50yiobvxfkutIFmZ58W+0optWfnRTBkzTaOErokxbv6rxThy7RVpjcXlOHr6vjdGd9XB1nDof5S7neU5FsEAuTBPXgFYjywH9q51xia4T0DL57agvFJ/PfsmA8sTTnwSWrUydBlpj9m2gg6OkVf2inSjp6z1yO62+PRZ/vauvZ0KrF+DK5kSqMMqLEbzmyRSzQSu4NbegBvLTTqAZ30iqGip/IvhFFaqvtOTVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0802MB2578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(33656002)(9686003)(66946007)(186003)(41300700001)(66446008)(52536014)(478600001)(6506007)(66476007)(76116006)(53546011)(64756008)(4326008)(66556008)(8676002)(26005)(55016003)(86362001)(2906002)(83380400001)(66574015)(7696005)(8936002)(122000001)(71200400001)(316002)(82960400001)(110136005)(38100700002)(38070700005)(5660300002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1dac2I1cDhOd0VtcldTZU9UUjB5S2tKYzBPZmtOMTA4aklwb3BSeUhzRmtP?=
 =?utf-8?B?NUVoYTFsUHFZZG9zV1RHZVdEcG9pVWhzbmlkVDVzY0VuTGxGeGplSExDTDgr?=
 =?utf-8?B?RWkrN0tibGJtYnZESFJYZnB6R09CMGJXQ1l2WWhjN2ZCU2hONmRFV2R4aVJi?=
 =?utf-8?B?SVFpa3B1Z1l2d2RmN0lPVVR3TzAwRUVnK3RBMzRGYnhVWDVNZG0wZlhTZ0to?=
 =?utf-8?B?RkdMaDVsRGI3azFHQ1drQ0F6VTVvUmJmNW1RUG4rS0h5SnJiTzlsWmpWcWI0?=
 =?utf-8?B?bFdSUjFEcXVMeW1xZ3VDeDNWR0s1dDluWFlQY3V6dHdDbHA3MG5xWTdPQ3h1?=
 =?utf-8?B?dFlLVWhPV3JzT2FwV3liVGNNWFdyVUJVUmh6SFpQQVlydnBnUzBvczc3MmJQ?=
 =?utf-8?B?OC9TTXNDcHEvcGlwVlBNK3p6a3BnSDVhaWVuemEwZitBNnQrcFNlZmpleXZV?=
 =?utf-8?B?dXQrVmJUZ3dmMTBtV3dIK0NXRHlBQlc5MlIyaWh0Y2lhUnFPR1BNWHFzemg0?=
 =?utf-8?B?eFQrSjFqTzZVQVpudGNDMHBwN01uRG83Nlkzb2FWUjJjVjBpanY0U09BREM1?=
 =?utf-8?B?NFovMVY5NzdsaFRTbWhCK2xveHFPdllrYmtWS01nanBGUDFzNzV3NmdSTDZz?=
 =?utf-8?B?Ty9nWTF6MnV4QnJabFpBMXlSRTJJR2FRdlZWQ1UvZVVGTFgxTndnbVhybXNT?=
 =?utf-8?B?Mjl3NXQvaVNzQnJBTmloL01BRWgyanFiWCtpR2FxWUhmZlBrZmJmNGpFU050?=
 =?utf-8?B?TlVtcE1rSnJZR3dsZW9YUmpKVklVMGVINkdSN1EzWmxEdHJBcGd4RU9VSS9E?=
 =?utf-8?B?S0xvTFlMTlZROVpNR3BwY3EvZXN1akhCenh1eVY2Zld1R2M0SnVDZitWQWY5?=
 =?utf-8?B?WEQ0S0dGTXBLYjl3TzR6UUVZb1lmdnhOSDk2OWhuUXFvT0RJeEFMRDYrS1JZ?=
 =?utf-8?B?ZUpZK1pjakZKQitZMFREaHdkOVhlMWxVZ2hSVGk4T0phMU1wbTdwL2JmamVD?=
 =?utf-8?B?NUNzeDBUcFJrd2k4a2Y3TkpLMEduVTRPVXRwMWdnMXFPdjRLcWl0dlhnMEpG?=
 =?utf-8?B?QTRrVGpnaVBlQnZ5L0pjaG9uODRiZXFEV2ZLa0VtSDV5REE5ZHk3QTRWUTZP?=
 =?utf-8?B?V0Zid2g0YkI1dVBoOFlDa09ZUXBUNGVNWTM0Q0pTbmtyQ2FpOFprU3NtZjJa?=
 =?utf-8?B?WklpaUYyekJINit3eHBLR1k3U1NvRHRpa1RBanMxTTBZY3VwYTNyM0dqeEtu?=
 =?utf-8?B?cm9GNGdkZFlFTGNBT2h6WUhkRXZUOWFvWDhhdDhmR0lhQ0k2UmpFTGtldUto?=
 =?utf-8?B?VGg4RUg3UloxV1BFT1dSUi8rS1FsSElVM0g0YTFqN3AvZ244SXhYNGFxSXp5?=
 =?utf-8?B?TGhpY3lSUmlJTFkxcmpkbzFmZFlCRGtXYldyT21WQVRtTHBNMGVwL2g2cWxN?=
 =?utf-8?B?RlJLUUV5R3JLZVgraFE0UnFTcWg2T2dWQTZlQndPY2wrenpCYmpFcXg2Rmx6?=
 =?utf-8?B?cFhZdE1SQlg5ZHhpMGpUVDNRaHAxYTlQU2o3L1JsR0JIVzMzT3g0ZnhTN0o3?=
 =?utf-8?B?Y3IwWkgvS0tpVndaSFBJZktJRTRiRVQvVk9LSDdnTjdua0d2UXdDcnY4ZGxn?=
 =?utf-8?B?RE1wRTB0V012TmZpOUtpTFJJSGlJdEFyVWxiMWNQcHFmMFNpd3NoT0JEUXg1?=
 =?utf-8?B?Y3k1aXZyWE5ML2s5dFdISHByR2NCd2hoSUZDaCt3M3FnOXZLYktTdFlMc2hN?=
 =?utf-8?B?bnlrbStuSVZ5UXVBcFZ5ZHdLd2NENW5xN1NyVkJpSDMrZGRTNytNd0xBUUdB?=
 =?utf-8?B?aFFYZW90ekdRc2pqNy92cEkyL3ZzMXZVTHZrN3lrZzhBSnlGVm94VXZOMkZt?=
 =?utf-8?B?Y2NSa1B0VGhPZXVQa2MrRTVYQVlrNXFRcFhpN2d2YW4yMHo0NFgyM3g2RkN3?=
 =?utf-8?B?VUsvVGpxY3QvWjR4RXZ5N2t5S2tZVlZxOExrZ3orRGRNVVU3STBLM0gxVUpj?=
 =?utf-8?B?NzNnbVRwTkxmK1Z6Y0tiaVA1NGQ4aVpsN3NNcUNleE4xclh6RzMzb3psVldZ?=
 =?utf-8?B?UzV2VXNkbndPeWtyQmw1UzZJOTl0VkRCMVg2RjRsdHpGUXlBVGRicnVLMnhu?=
 =?utf-8?B?UUdlZnF4elB2WDVuTGRJTytJS2lpSXRUd3hLWXRGY0Yvamwza3Y5b3NvQ3pS?=
 =?utf-8?B?QkE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DZRV67ag8DKHMbHU8T0nmxMuwNczL3aCklK4o9GOKVh3cILgV062S7M+PP6TkeeA4Jl+aMaDMlaL6D+8t/b3U+IR6H8Kt/pXhH/UHyG25ufV0iWuVsdQXdZIAWYIMm/u8rowsBP4xuvVMy6KhSnxqfXN2S87Uag1/tapxpOBQSl+YxYV9rkUdwq+DCngKXhXrZKcdqzMITgUJOBhJQy7IY9DEvxtZsebiJ3+hkHGuPwK+kDqWOi9mvOnWkepCo9b9/mOEIV7WiTsG7KsX4niNzs/mpVFMRqvZfzz8rUYp4yu0A5bxbvW/8HpAtcOVF6L1QftcJuaHLbpP3Jg/oDM/ES1UnndqmaStzFztIWSz6j0/wAMaYCf62PYLhqPA2Q3fl40mgZxK6NE6dLRypHtmLZjzooibgEw7e3s+B3tIwtnC1KIkSPwN+bSyW2RkWDnFQTCEePCZDYqXNDJrQOYRAyw5emnyc0Dl3Lq0OvcDzW4NvVSOkXk4rjTleJsA4aF4bKxb4ctc3uSKmDRH/lBggm4lE4qpfe9y/otA5sSZBJuIvB5fYv4atZafhMaCcqIqYQ4Md0pqR0F+VEu5JjeC+T3OgVpa2McML5PDJ6Z7jMxwFAGHu3Yj1uvLIbh2faC/mg0PsksX3v9h7CIX+mfAKmKzZf7Zn+vNe4XRs0ereMRIVH9VlnUAjEZ1XDi/ee1p5OUUy84P3Sr/u5ObHjQTI00rKeqdgSHhuN01YfBrO+cSTJyMNbC/ChSkUI9x4s+ruKHSL2n2ToCRfaL8fVc7J6aso1lGcHbBWneiKvnI3ZQ5RKRnqmNQkCFRTeWAQKbHLIgvEOsy/IQMStrr5ebZw==
X-OriginatorOrg: zf.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2578.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230b89af-b89c-4287-2bb9-08dafa28916a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 14:22:17.1167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb70b763-b6d7-4486-8555-8831709a784e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfKX/4bjaO1mNP1uRzb6jf5a+yX8xPsSTVvPoKllBw6Ll0WjiGMjs3NSZHdyfgtgQHrjcQcJGBpGY6qd3TCAkkhP2h2RLrLsKPo/PNrn3I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6078
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zf.com
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiBUaGUgc3VwcG9ydCBmb3IgeGVudHJhY2Ugb24gQXJtIGhhcyBiZWVuIGFkZGVkIGFyb3VuZCBY
ZW4gNC4xMi4gU28gaXQgc2hvdWxkIHdvcmsgZm9yIFhlbiA0LjE0IChldmVuIHRob3VnaCBJIGRv
bid0IHJlY29tbWVuZCB1c2luZyBvbGRlciByZWxlYXNlKS4NCg0KSGVsbG8gSnVsaWFuLCANCkZp
cnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciB0aGUgaGVscC4gSSBjb250YWN0ZWQgTlhQIHN1cHBv
cnQgdG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgaG93IHRvIGdldCB0aGUgbmV3ZXN0IHZl
cnNpb24gb2YgWGVuIHdoaWxlIGJ1aWxkaW5nIG15IEltYWdlLiBNeSBxdWVzdGlvbiBpcywgd2hp
Y2ggWGVuIHZlcnNpb24gZG8geW91IHJlY29tbWVuZD8NCg0KQ2hlZXJzIA0KWW91c3NlZiBFbCBN
ZXNkYWRpIA0KDQotLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQpWb246IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IA0KR2VzZW5kZXQ6IERpZW5zdGFnLCAxNy4gSmFudWFy
IDIwMjMgMTU6MzgNCkFuOiBFbCBNZXNkYWRpIFlvdXNzZWYgRVNLIFVJTEQ3IDx5b3Vzc2VmLmVs
bWVzZGFkaUB6Zi5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCkNjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQpCZXRyZWZmOiBSZTogQVc6
IFhlbmFseXplIG9uIEFSTSAoIE5YUCBTMzJHMyB3aXRoIENvcnRleC1BNTMpDQoNCg0KDQpPbiAx
My8wMS8yMDIzIDEyOjU2LCBFbCBNZXNkYWRpIFlvdXNzZWYgRVNLIFVJTEQ3IHdyb3RlOg0KPiBI
ZWxsbyBKdWxpZW4sDQoNCkhpLA0KDQo+Pj4+IHhlbnRyYWNlIHNob3VsZCB3b3JrIG9uIHVwc3Ry
ZWFtIFhlbi4gV2hhdCBkaWQgeW91IHZlcnNpb24gZGlkIHlvdSB0cnk/DQo+IA0KPiBXaGlsZSBi
dWlsZGluZyBteSBpbWFnZSB1c2luZyB0aGUgQlNQLWxpbnV4IG9mIE5YUCwgdGhlIHZlcnNpb24g
dGhhdCB3YXMgZG93bmxvYWRlZCBpcyBYZW4gNC4xNC4NCg0KRG8geW91IGtub3cgd2hlcmUgdGhl
IHNvdXJjZSBhcmUgZG93bmxvYWRlZCBmcm9tPw0KDQo+IA0KPiANCj4+Pj4gQ2FuIHlvdSBhbHNv
IGNsYXJpZnkgdGhlIGVycm9yIHlvdSBhcmUgc2Vlbj8NCj4gDQo+IFRoZSBlcnJvciBJIHJlY2Vp
dmUgd2hpbGUgdGlwcGluZyB4ZW50cmFjZSBpczogQ29tbWFuZCBub3QgZm91bmQuDQoNCg0KIkNv
bW1hbmQgbm90IGZvdW5kIiBtZWFucyB0aGUgcHJvZ3JhbSBoYXNuJ3QgYmVlbiBpbnN0YWxsZWQu
DQoNCj4gSSBhc3N1bWUgaW4gdGhpcyBYZW4gdmVyc2lvbiwgWGVudHJhY2UgaXMgbm90IGNvbXBh
dGlibGUgd2l0aCBBUk0gDQo+IGFyY2hpdGVjdHVyZQ0KVGhlIHN1cHBvcnQgZm9yIHhlbnRyYWNl
IG9uIEFybSBoYXMgYmVlbiBhZGRlZCBhcm91bmQgWGVuIDQuMTIuIFNvIGl0IHNob3VsZCB3b3Jr
IGZvciBYZW4gNC4xNCAoZXZlbiB0aG91Z2ggSSBkb24ndCByZWNvbW1lbmQgdXNpbmcgb2xkZXIg
cmVsZWFzZSkuDQoNCkkgd291bGQgc3VnZ2VzdCB0byBjaGVjayBob3cgeW91IGFyZSBidWlsZGlu
ZyB0aGUgdG9vbHMgYW5kIHdoaWNoIHBhY2thZ2Ugd2lsbCBiZSBpbnN0YWxsZWQuDQoNCj4gDQo+
IE15IHF1ZXN0aW9uIGlzLCBpcyB0aGVyZSBhbnkgbmV3IHZlcnNpb24gb2YgWGVuIHRoYXQgc3Vw
cG9ydHMgWGVudHJhY2Ugb24gQVJNPyBJZiB5ZXMgaG93IGNvdWxkIEkgaW5zdGFsbCBpdD8gQmVj
YXVzZSBYZW4uNC4xNCB3YXMgaW5zdGFsbGVkIGF1dG9tYXRpY2FsbHkgYnkgdHlwaW5nIHRoaXMg
KCBESVNUUk9fRkVBVFVSRVNfYXBwZW5kICs9ICJ4ZW4iKSBpbiB0aGUgbG9jYWwuY29uZiBmaWxl
IHdoaWxlIGNyZWF0aW5nIG15IGltYWdlLg0KDQpJIGFtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBC
U1AtbGludXggb2YgTlhQIGFzIHRoaXMgaXMgbm90IGEgcHJvamVjdCBtYWludGFpbmVkIGJ5IFhl
biBQcm9qZWN0Lg0KDQpJZiB5b3UgbmVlZCBzdXBwb3J0IGZvciBpdCwgdGhlbiBJIHdvdWxkIHN1
Z2dlc3QgdG8gZGlzY3VzcyB3aXRoIE5YUCBkaXJlY3RseS4NCg0KPiANCj4gT3IgaXMgdGhlcmUg
YW55IHNvdXJjZSBvbiBYZW50cmFjZSB0aGF0IGlzIGNvbXBhdGlibGUgd2l0aCBBUk0gb24gR2l0
SHViLCB0aGF0IEkgY291bGQgZG93bmxvYWQgYW5kIGNvbXBpbGUgbXlzZWxmPw0KRXZlbiBpZiB0
aGUgaHlwZXJ2aXNvciBpcyBYZW4sIHlvdSBzZWVtIHRvIHVzZSBjb2RlIHByb3ZpZGVkIGJ5IGFu
IGV4dGVybmFsIGVudGl0eS4gSSBjYW4ndCBhZHZpc2Ugb24gdGhlIG5leHQgc3RlcHMgd2l0aG91
dCBrbm93aW5nIHRoZSBtb2RpZmljYXRpb24gdGhhdCBOWFAgbWFkZSBpbiB0aGUgaHlwZXJ2aXNv
ci4NCg0KPiANCj4+Pj4gWWVzIGlmIHlvdSBhc3NpZ24gKG9yIHByb3ZpZGUgcGFyYS12aXJ0dWFs
aXplZCBkcml2ZXIpIHRoZSBHUElPL0xFRC9DYW4tSW50ZXJmYWNlIHRvIHRoZSBndWVzdC4NCj4g
DQo+IElzIHRoZXJlIGFueSB0dXRvcmlhbCB0aGF0IGNvdWxkIGhlbHAgbWUgY3JlYXRlIHRob3Nl
IGRyaXZlcnM/IEFuZCBob3cgY29tcGxpY2F0ZWQgaXMgdGhhdCwgdG8gY3JlYXRlIHRoZW0/DQoN
CkkgYW0gbm90IGF3YXJlIG9mIGFueSB0dXRvcmlhbC4gUmVnYXJkaW5nIHRoZSBjb21wbGV4aXR5
LCBpdCBhbGwgZGVwZW5kcyBvbiB3aGF0IGV4YWN0bHkgeW91IHdhbnQgdG8gZG8uDQoNCj4gT3Ig
Y2FuIHRoZXkgYmUgYXNzaWduZWQganVzdCB3aXRoIFBDSS1QYXNzdGhyb3VnaD8NCg0KUENJIHBh
c3N0aHJvdWdoIGlzIG5vdCB5ZXQgc3VwcG9ydGVkIG9uIEFybS4gVGhhdCBzYWlkLCBJIHdhcyBu
b3QgZXhwZWN0aW5nIHRoZSBHUElPL0xFRC9DYW4taW50ZXJmYWNlIHRvIGJlIFBDSSBkZXZpY2Vz
Lg0KDQpJZiB0aGV5IGFyZSBwbGF0Zm9ybSBkZXZpY2VzIChpLmUgbm9uLVBDSSBkZXZpY2VzKSwg
dGhlbiB5b3UgY291bGQgcG90ZW50aWFsbHkgZGlyZWN0bHkgYXNzaWduIHRoZW0gdG8gKm9uZSog
Z3Vlc3QgKHRoaXMgd291bGQgbm90IHdvcmsgaWYgeW91IG5lZWQgdG8gc2hhcmUgdGhlbSkuDQoN
Ckkgd3JvdGUgcG90ZW50aWFsbHkgYmVjYXVzZSBpZiB0aGUgZGV2aWNlIGlzIERNQS1jYXBhYmFi
bGUsIHRoZW4gdGhlIGRldmljZSBtdXN0IGJlIGJlaGluZCBhbiBJT01NVS4NCg0KQ2hlZXJzLA0K
DQotLQ0KSnVsaWVuIEdyYWxsDQoNCg==


