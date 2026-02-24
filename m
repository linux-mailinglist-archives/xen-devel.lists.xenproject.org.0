Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJNIGqh5nWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:12:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C91852AE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239729.1541147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupPA-0004jA-N5; Tue, 24 Feb 2026 10:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239729.1541147; Tue, 24 Feb 2026 10:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupPA-0004hh-K4; Tue, 24 Feb 2026 10:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1239729;
 Tue, 24 Feb 2026 10:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lmg=A4=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vupP9-0004hT-H3
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:12:35 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535c8124-1169-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 11:12:30 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by DM6PR03MB5323.namprd03.prod.outlook.com (2603:10b6:5:24b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 10:12:27 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:12:27 +0000
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
X-Inumbo-ID: 535c8124-1169-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4axRFjmGhW8bGeLanuIIAvA2a+l2mXAHtk+7pYYVJGLthgvLGCbA2Oh2CfnFAMqCFZ35Blt2Xo/SYXuq2MRefljMB6LD5J9QFr/wxQ/qiR4v7KCatHJFwMnFjX1EpF6BDMi9oCfXT5a/oyQMyTC3+SM6DiCiivLYblBUvUDVhYyx2hbyB3Dv72QoKzLTfbznJ8+zrez0aa/x2yWOwTaccx7jAWOq+QzqEDeVVXAP/fI7G7944MutJClOoxAghDCjX2GHAKpYYXCh6Oe/pjomy2R3G4mOFHFKN4VMCmaHfASerSDjgtsdiZ6qc56XpXeOjqAft7w+dzutC47bO/4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LgKHM+p6kcqzv46VIenPq+SJJPnA9x2y5hyHac4Cl8=;
 b=vVCz0SUR+Yhb/3o7GCpZgeVKomp9x2Zt64g8FMkr6/ARE7TLM9ExwgE/JWjp0oGJqZDA/kwXPaExIWMM9ghNpkyWk1wLb0GLxgTSHYx0CAYT7gBBCRw3+HJuYOYxAiVCja+GdVQiXDbziK1p6IIPzmPyG4LXk//qM3u7rnCPC8D05y1JzmY8zSJgS0cOdF+lXT1N66MLPJOeSt5nBLdyiyLXcOQK7njrb3ODjW8yn2vrMQ3GZG5l730+zYkMWsdRoo15/1tslkYGNQb4AXoq8osVioY1E7c3HNjkjgipwcZlEXiLDBgB3KLCZZ21nLw6J/DlbNRI5/hZswj5mk7g7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LgKHM+p6kcqzv46VIenPq+SJJPnA9x2y5hyHac4Cl8=;
 b=GH49lbo2O71oqNDzGyWBkiWVYj27qEeTvNDtmH11rdFXeM10jZ3xa/IWtwUCklM4PlSxS1rIi/hXrcdq+NS/hvKKBbZhhhl0dRvIWYujIdtkYWnTMtZuGbsyMeiPSlRdtue9i5pcaSw8BKTXf+3cz9OoHzDem7j+3mUewxyJd2o=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] tools/tests/x86_emulator: fix 'shifting a negative
 signed value is undefined'
Thread-Topic: [PATCH 1/4] tools/tests/x86_emulator: fix 'shifting a negative
 signed value is undefined'
Thread-Index: AQHcpKvhICvggy+CX02UgLA2L8U/0bWQbKoAgAE2GYA=
Date: Tue, 24 Feb 2026 10:12:27 +0000
Message-ID: <6BE49BEE-F813-4586-9F51-3D39106E85CD@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <c908071f1c5293e6f87c67a982adb377b0912ccb.1771840208.git.edwin.torok@citrix.com>
 <c2363613-23d5-484d-a244-bf2f53aa3099@suse.com>
In-Reply-To: <c2363613-23d5-484d-a244-bf2f53aa3099@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|DM6PR03MB5323:EE_
x-ms-office365-filtering-correlation-id: aec0ef7d-cb38-43e6-e971-08de738d363e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NHFrZ09IMXh1RmNKdmNJdSswYmlidVJnemhsS3RFbU5vWHAycmowcGRWVVNv?=
 =?utf-8?B?MUFYOCtGV2lFR2h3bm45VU83VXBHenRmV3EzRlE2TjB5cmM3L1pzdTFxNkFI?=
 =?utf-8?B?WUNoOG8reUFybGVzeFk4dzA2eFltQyt6d2hmSXY4U093VUNIWCtickZNUHNE?=
 =?utf-8?B?NlRPY21wL0tFczMyWEhLSGJ0R3BaQ0EvRDgzT2tFSmx5R3c3SnRPUnZBTzJy?=
 =?utf-8?B?SUE3OWx3YmQzenltM1Bwd3o4MGRCQ1hwUjMxTzV3aDNLWnRKSXJ3R0pTUUVQ?=
 =?utf-8?B?Snp1dmluVU51NnpnQkRnc2lsN3hUQVRBN2hhcjJiRWl2elRBL0F3bUFXU0ht?=
 =?utf-8?B?bW9yeGh6UlVrS1VsRm51ZUlVZ25TVlc1bXJPR3NCRm5BeXdzZ29UWXlTb2o0?=
 =?utf-8?B?WlFpL3ZabTZHYWtGajU1ZkhDZlRHanpULzZjS3Y1VTNQdWxiYTh3UERMOVY4?=
 =?utf-8?B?VVFNRG5kcm0wMnZ6a0t2RmFZNlNJdnZGOXVLQVdoTENiUkZOYmdsTW50eGxW?=
 =?utf-8?B?L3R5MTlZOEpaN2ZJT1RHdlBQWTJaSlpXdDB4bExjdG8wVG83M1VDNm56K2p2?=
 =?utf-8?B?cllTb1ZBeGY2eWxCQzlyV0g2TEFUZ0hnekpBdU01ZExhaDdNQ2UzWkZVdEJH?=
 =?utf-8?B?SW9TZXhPTWsvS0FGZmx5WFQzS0xZcjhjanFVVzQ5MCsybkdla1cxTnZzRTh6?=
 =?utf-8?B?MnU0Uk53bHZuRGdNSlF5Y0JteGZMRVAyWWlxdXU4dXdWa0RTTHh0QjAxSEtU?=
 =?utf-8?B?S2k1NnZwQUNmSldwZUdsWEJUdFdySFBkMUpnQ0dYcnhrdCtJdTFIVkc3Qm9y?=
 =?utf-8?B?aDZORUx0ZHNoMklCZlRPa1ZoRk5CODZyb3c3N0d3dGQwRElKanJnUldSNy9q?=
 =?utf-8?B?a3llcml5d205eHpaOExMd0Q3WThsQWtVK1NxQTg2T0I4cG9TQUE4OXBJbGtK?=
 =?utf-8?B?cTRoNEVlc3lJRjEzOUJ6aEMvRFhnM3ZQTWRxWnZWc0hJTmJFK25nTXpXRWhK?=
 =?utf-8?B?Ti9pbmN0S09EakZxMVk4bDBqZFJYK3hPT0o0QU1EUlZaTkdkdHF5bjlmcXhq?=
 =?utf-8?B?M0RJZFpmZVE3YzlBTzdFSWxUTkNqNDgzQ01CV0lCK0tQNS9TajhIb1FhVzY2?=
 =?utf-8?B?SnAzNUdNZ3VaWTBTRDZFUzUreUpueEhrYTlpd3g4MTRveFNvaTNmOTRsaStW?=
 =?utf-8?B?cG13RWxzVTFiWGtoVWpZbUhrTEtCcjJETExBSmxHcUk2OWJ5eDhJaXA4ZGNk?=
 =?utf-8?B?V0dMVTN1U2FHbEVFNEN4VWVkVzJQWU1RckNMMU5WdEk4dy9lemJwMW5CTUtv?=
 =?utf-8?B?OWF2YjdnNG95ZDAvMXpGeG1YMWNEalBMbWM1cW1ITU51WGgxZFVVNDN6RkNW?=
 =?utf-8?B?eEQwQXhvYlkyQVlXSUIwdFh3cm5WVzdlQzZjQ0dpUU10a2FRc1hFeXI3OE9s?=
 =?utf-8?B?RUNLK1h4TmxSUjFZRjlLZm1vc0pXNnB3c0tZeVZab0QxSFpOc1VVUUJ6UjVt?=
 =?utf-8?B?MzJwVm9YRTZERmFGUVVEbEFMOG9XUGJGd2xESXo2NlV5bnFkK1UxL2RLZVdT?=
 =?utf-8?B?ZDlDSmh4ZXpVWHJHWGhaTk4wUUx5UGNETy82ODJ3Mk82VGVwVGFLY2dzbElx?=
 =?utf-8?B?UTEyNDVBRDFyM3dBL0FzaGNDaFZpdW5Qa3pZaDZhNnQ3ZThlUUtQbFRhckRm?=
 =?utf-8?B?R3NNZ2EzODdYMHk4UVVEVS9yVm4vcmJPSWZzdUtQYnBRbFdlR1IrYXdOTWdq?=
 =?utf-8?B?cjkyZmtUODFHSWVHc0JHSVVxY3ZlbGxoUVI1Y2ZvbW9pbjdOZmQvQ3ViMzFR?=
 =?utf-8?B?SlhtZHAvOEhxbEd1MkUyVlk3amg1N2oyVEVGMVdrNzE5b2pzVlhEMWt5dkxD?=
 =?utf-8?B?eWRuVno3a1VEVUdqZkQwMlJ1SmFsQk9VNmo5bDVnSVQ3SjlicGdLQklWN3RJ?=
 =?utf-8?B?Sm5VdHp6Z2RCWUtQTGYxdk9GeVhuZFNUSVlycTBJQ1Y2R09uWDRwUUZVdkVz?=
 =?utf-8?B?Qys5RDBUMmE0cUFFa1c3WWl0NDVrQkozM2VIT25qNnc0c1c1ejhSZFBILzZw?=
 =?utf-8?B?TVNIL2dHeDg3V01uaGpZRXN3OGdXY3MrMHdtVHV0aFZRcXFEak1BcmZ4MlhO?=
 =?utf-8?B?QkZST01SZHdDWWNYVkhxMW9lMkxpODBKN1RvbDZlL1NSc3EzVTNTNFVJRzRa?=
 =?utf-8?Q?ufQ6K4fzDHRKV4CCC/7hQSE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFoyRnFmRXZFVHo0RElKR21iL3dSOXo5dnNQem9lOEtiN0s1cExyeFhtVDl3?=
 =?utf-8?B?REtpbU8rRVZFQkpqcUc1ZWR0VXVScno5RkpJNTB5d21jVFhablZETElDZnhx?=
 =?utf-8?B?VG0wMEpyL0VoWk9uWXVtSmhuRVpjVEhWOGNOQ0N5ZGEwZzNoZlNIU3RhaEhy?=
 =?utf-8?B?c1JheWFtRjdDRHV2T1p1Uys2VXh4eStZaGwyRTU1aE5FWGpPTnF1NzVwdEhX?=
 =?utf-8?B?emRvNjYwT1R2TmN5blFMeVU3cVNqb3NvcW04Z29mUml6L3BjTHNWVVBVcnBS?=
 =?utf-8?B?T21sR2h0ZmdxYUQvQWNuWkZ0SEhpazY4d3ZtOTRtVkpXTHJZTkw0ZzJUS2hZ?=
 =?utf-8?B?blFveDI2ZzFpVHBvTnJwRDNtWWEwV05Yc1hZV3hOd2RJWWlqT3RmQjRON3Np?=
 =?utf-8?B?QXVzVFlhWGF4M1JhL3IxQkc1TnBiWDFobjRONDg2RE1sOEVxSWpIVUtMY0VY?=
 =?utf-8?B?d2NiYUM2aGIzajBzMCtyRlBNZ1dqNXNRQ3JsRUtORE1UT1lYb28waDlsUGky?=
 =?utf-8?B?a2l5UHY0UFgyYXMrSVNmNThwNU45SWR1d2h0b2pGOWVxSFFsdXV3RXpSekl2?=
 =?utf-8?B?c2ZVdWxtRWJXM3pqZ0FyM3UxRWczNTI5VkJhOUk0WnhXM2E5RWd2ekxyTDdT?=
 =?utf-8?B?TExFWWRxWloyUzVwM2VCayt5Uml6Zjd6elI5aDkrOGZOSHRwWWNRbDI4UUNa?=
 =?utf-8?B?bnBmMXRWbWNocWFhbVpVUFdLZHJWZXVOdXVuS21jRFlnTm5UcEMwU0tiZTF5?=
 =?utf-8?B?bHltNERDNGZ0VUlGZ2E4VitTM0ZoZ2dpUm1kNlc3WHh0S08rNm9wYzFGYkFv?=
 =?utf-8?B?bkE1b3ZSNVpkSXRmb0E3UWNyMXJqRnJCL2JtK25BeDdOZ2tKR2JPNjBpOEF2?=
 =?utf-8?B?SGtuaXpYN1lGRnU5SE53WDZNSjdEd3k2QytET1hGbXpPZ3BCUVhmY2FFb1ZL?=
 =?utf-8?B?YTNjWStJSmpxS0J6NkpvWmI2UDVnWUZLZmJoYVpsOE1mVWxNcEJGZkswOGdK?=
 =?utf-8?B?VzdHVk5lY3E0dEJnSDZaem9qTzVSQVF1SHUvQ3lrc1V6VHg5VjhGWlA2WGNM?=
 =?utf-8?B?R0tFcDVYOFFDakNSd0d1aUNveXBPaFNrNEJBQWhJeXVickRSekIzbkhqWmlG?=
 =?utf-8?B?WGx4Yk85TGM3TUp5bHh0U2p6UmJqRTdXZmVzbmNPSHEwZTY2WUpSelBQZkor?=
 =?utf-8?B?bFdhdUZrb3BUa29hcWRTSmZ0VHBoQlluczVxVHJmVm9IaHc4NDlvdEsxb0I0?=
 =?utf-8?B?a2FHZTRaK3RDK3R2V21xUVVqTWJrTzI5V1ZYa1JTZ2Vka0l3MEF6Z3BUWGhV?=
 =?utf-8?B?YUxFbXNHMWpwOUswU3VCSWdDcHlRd2dSZkRxNHhna3dta0FoU3VUUy9KaU01?=
 =?utf-8?B?TXdEK2Y3VjM3NnJuak5BTnozRnlmYTZNN1JXTDUzU29RbG16cXVMa0p0c0ZV?=
 =?utf-8?B?bzhTa20xb0g4Y0NyVXVlelo3d2tnR2Z4aUluUDV4VU5wWDJpR3RmMW1Qa3ht?=
 =?utf-8?B?RzBucThQYXBsVW8vNXRLekRRaUJkeGxWdlI2SGl3Ty9ZbHI1ZU5iRXBBT08y?=
 =?utf-8?B?RW1NNnhueSt6UmIvbWUybGVmZGx6SkFwNUZqVXJoMmJUMzBkRldxdW9CamxI?=
 =?utf-8?B?eTAzQ2VxckI3WWc4ODlxVzdsWUtqZVhaWG10REdrTjV4V0lROXYzaEVOazhz?=
 =?utf-8?B?aDZnM0tVMHBGWEVUZktWdkpvYVVhQndMSk9yZzRFbzluRldGU0ZLM2JvT2N2?=
 =?utf-8?B?a1o1eU5Dc2pqcmI1alIrZU5vbS9HckdsendiTm5BaHEvR3p5dVVsRjcxQUd3?=
 =?utf-8?B?VEtaaHFWWFE5eFlrNkZnN2JnbERPeVBYMUtXUGlLQnhxdEdPNDYzNk5BUlJP?=
 =?utf-8?B?V2tnbUNwU2Z2TU1ON2QwclcxNVRPV3BMWkdURk94MXRtbldDQlRYTFJ0YytE?=
 =?utf-8?B?dmVSNGRJQlRHclRkbHA3LzhGeUw4N2FBUEg0S2dYdS90MHdKd1p6bFZIVms3?=
 =?utf-8?B?TEJ1UUdSdHd5QVBZMlVzajVJb0dIL0JhTUtEbmhJRjBBVlBHZmxadEw5TXNV?=
 =?utf-8?B?UVE1bGlmRzd1T3A2S05oK3grYWJac1lOOWc0dWk4bkhJSXNNS01tWXNDVjRU?=
 =?utf-8?B?OUthRFNwaHlGQU8vWC91clFKQlNMKzIwL2NQQ1ZmUGROMWhGUzVmRjkzV2V2?=
 =?utf-8?B?eEdqYnl2WVE2azFWSER5WUQ1VDdFUnJXTTdycktDVVBLNDQ3N1dRR05HTjJv?=
 =?utf-8?B?dFF6RGxQYkgzZjJtdWRYcmFsN0Z1WTkvczFNdkp6cXVHWkFRZ3ZrM1I1MWxt?=
 =?utf-8?B?a1pHVlVudTdSOGZoNThyQnRHQUp4SWcycml6MWhsazhmUWppaTBWM0VPVXdj?=
 =?utf-8?Q?1S2v8yisvpfxqCdg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <195020557B05064182996D92B778B85B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec0ef7d-cb38-43e6-e971-08de738d363e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 10:12:27.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecY1t61GP16EudCT82Ko5/mzisDED60fGQ4eJ92cFEtggy8D8V5CCTAcIWc3p9fpwXG9F6C4IGYeKAKTyrK12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.978];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C95C91852AE
X-Rspamd-Action: no action

DQoNCj4gT24gMjMgRmViIDIwMjYsIGF0IDE1OjQyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDIuMjAyNiAxMTowNCwgRWR3aW4gVMO2csO2ayB3
cm90ZToNCj4+IC0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRv
ci5jDQo+PiArKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3Iu
Yw0KPj4gQEAgLTExNjEsNyArMTE2MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikNCj4+ICAgICBpbnN0clswXSA9IDB4NGQ7IGluc3RyWzFdID0gMHgwZjsgaW5zdHJbMl0gPSAw
eGJiOyBpbnN0clszXSA9IDB4MDM7DQo+PiAgICAgcmVncy5lZmxhZ3MgPSBFRkxBR1NfQUxXQVlT
X1NFVDsNCj4+ICAgICByZWdzLnJpcCAgICA9ICh1bnNpZ25lZCBsb25nKSZpbnN0clswXTsNCj4+
IC0gICAgcmVncy5yOCAgICAgPSAoLTFMIDw8IDQwKSArIDE7DQo+PiArICAgIHJlZ3MucjggICAg
ID0gKH4wVUxMIDw8IDQwKSArIDE7DQo+IA0KPiBXaGlsZSAtMSB2cyB+MCBkb2Vzbid0IG1ha2Ug
YSBiaWcgZGlmZmVyZW5jZSwgSSB0aGluayB3ZSB3YW50IHRvIHN0aWNrIHRvDQo+ICJyZWdpc3Rl
ciBzaXplIiBoZXJlLCBhbmQgaGVuY2UgaGF2ZSBvbmx5IFVMIGFzIHRoZSBzdWZmaXguIFRoZW4g
KGhhcHB5IHRvDQo+IGFkanVzdCB3aGlsZSBjb21taXR0aW5nKToNCj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQoNClRoYXQgaXMgd2hhdCBJIHRyaWVkIGlu
aXRpYWxseSwgYnV0IEkgZ290IGFuIGVycm9yIHRoYXQgdGhlIHNoaWZ0IGV4Y2VlZHMgdGhlIHdp
ZHRoIG9mIHRoZSB0eXBlIGluICgwVUwgPDwgNDApLg0KKEkgdGhpbmsgdGhlIGZhaWx1cmUgd2Fz
IHdpdGggLW0zMiBpbiB0aGUgQ0ksIGJ1dCBjYW7igJl0IGZpbmQgaXQgbm93KQ0KDQpCZXN0IHJl
Z2FyZHMsDQrigJRFZHdpbg==

