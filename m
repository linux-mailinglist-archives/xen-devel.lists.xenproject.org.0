Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCA37F3D2
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 10:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126748.238174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6K3-00062v-Bs; Thu, 13 May 2021 08:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126748.238174; Thu, 13 May 2021 08:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6K3-0005zy-7q; Thu, 13 May 2021 08:03:55 +0000
Received: by outflank-mailman (input) for mailman id 126748;
 Thu, 13 May 2021 08:03:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyFE=KI=epam.com=prvs=57677d64fc=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1lh6K1-0005zo-NM
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 08:03:53 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7504ab8b-3664-4574-a2ce-6ac0f036d1f9;
 Thu, 13 May 2021 08:03:52 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14D80gYu027760
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 08:03:51 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0a-0039f301.pphosted.com with ESMTP id 38gyq1g37q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 08:03:51 +0000
Received: from AM4PR0301MB2273.eurprd03.prod.outlook.com (2603:10a6:200:4d::6)
 by AM0PR03MB4627.eurprd03.prod.outlook.com (2603:10a6:208:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 13 May
 2021 08:03:48 +0000
Received: from AM4PR0301MB2273.eurprd03.prod.outlook.com
 ([fe80::e190:2560:abbf:5e7d]) by AM4PR0301MB2273.eurprd03.prod.outlook.com
 ([fe80::e190:2560:abbf:5e7d%8]) with mapi id 15.20.4108.035; Thu, 13 May 2021
 08:03:48 +0000
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
X-Inumbo-ID: 7504ab8b-3664-4574-a2ce-6ac0f036d1f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/WTi4fFWpQh59ZFYgTepDFNuQ16QaS0y5wVHlqkaSwkwJyVSodO7/tP3jFDGWkSShem7Z37wMGQyuWc5W19hNk2p1IyGu2W6RJnx926A7SRLct2equ+rYtTiPtKYFbfzLaYaLc0wljc7tEVtISmjL9Jyz8icmAdNH5yoYdxFWM3Yt4qQFziD1bgU8H3xAC4872BqnyBGcpZ8SLlB2HYlj/0ZCZZv1cR8cc4W2vmTij89mRatJQlIpzHSme+ii4z7CXUo6GmTzvx0hvdYceUT04MsVoCqPym3jLBKK6mNyWBSLQcNR44+Aijw+zoGCHndwQZAI2G87N13LQVy29gRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn1kRZLF+oerDgG2OBkAVIy0hqMaV/Q8Jdpx4vgoEN0=;
 b=InC7CIxpV8wSxQdaOiz6j2BSlrEvgxJLDvfCJtInhOVvZZtCefKs4w8DJJ4WHhNKVrIVAbMbhhn7V1qGs26OMm23GL8yPg9ZPYf0OvjX/HTIYdqw70ddpInXrxHT8RcSw8/putEaow2dS/eJWeY4PDnuddLGMgddV5T/yIXkJyPWktZfL6G3EqzYKcnPuyDm5bvpI9gY2FUnlsQnjFu8Tw1EUcXh3N3LYIwjPevNDTeFmS4knZTwLE0Sox2T3+4nkdj4uBe5WUuDGyUId8HjJHwjnknYoM/ertqVwT24P5hVhq0l9J4aW1ncMjwioWSy+lIe/Vgy/YuEI1hAEHgoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn1kRZLF+oerDgG2OBkAVIy0hqMaV/Q8Jdpx4vgoEN0=;
 b=fl5vkOsyOlBChgdmohZIn6BmfV7G9fK4kfUxl4bqXAjC5Yclw8zzoa3nk7xpBcjO4pfwaObiAHy+7xm7gK6JylXO0twR5gXjbPHlercvNJ9GWHOK5cHdf8G9f4/pr9bM49PGlR66kMN87cti4I1dKtBB1fw9jvvw23+mPcYyBMS5B88WbAuohRgwNlhcFSiRhokY7+NoN8AxW/ITcIZAb28yVwuOWXjeeqVAh2BM1eAIRcipvufibUgWxEYlNW0NbVimbNk7BXv3EbBA8n9oyQiuzazXWHLV+l4kzfYoFUIHVmLZA9MvqyCKfyZHLX2lWwLxD+E2YoHCFRAzDVO7UQ==
From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Hand over of the Xen shared info page
Thread-Topic: Hand over of the Xen shared info page
Thread-Index: AQHXR86B8dxtD5lx60CgXee9ciHSoQ==
Date: Thu, 13 May 2021 08:03:48 +0000
Message-ID: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed98ad37-8038-4d13-cea5-08d915e5a39b
x-ms-traffictypediagnostic: AM0PR03MB4627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB46276D329F8BDE1F6808950DF2519@AM0PR03MB4627.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JIyx+E6IcLY4wQoApH8HKkDLKgfIBxXMnqOeGsvDy2J0NTW526Yb7E64G+JVvWEiwmyv6qTPR003KBu+xQLrfuuW1v2fPm+ZW41ojhSKIXM0dtymv/TFLLODyrtvUeiIThJ8OqdT+2CfG1UawZrsyYcuWaQYjBsjBHx5+vpaftB/fOgZsY7Kj4yE41pEyz5kMri1OTrVpYsNReF2XXRxg5Fw6Lqxk3X2r/IIAc+DGJ+c5NAA3jvGGWyBcnHPlZCsDOKhBivGGF4HuSGNP5PMO/YwXG1cIvhoOlaxhHUUVUxgMwhIMUO7bpO/G7P9yyENpXPZpjzl4dT+0JykpKLkSCC3k5kbzNBQrX6lmRd1UdA2qWn9qYnJN00MK47y1APEdkeE144v0uPFJU7B3vHNAdMI5MN0rzTZdEkL1dT2MEqEFmLEMthzWz1WOlVgS5Wqeo8QMHqP0RZoI9LSU7agHSa9Dwdidg58Uu3fr09z06rJGsM8Y6u3OtWs2Oqf+8YXOpjdaLVtQC3RWMiXRgjDM2pyyygCSWjbINyrLegy7lI7Is6MK41GYgIBiIsTMjDwyyXALIFw7F1j25rZrkringWXRoaWITmNVkkaK3yocsrytJY+j+gdFfyCUny4pDr9M9zgEd+ANG9QmVY/sOrc024hqbnwMxSJTl7XRD8prKMYhKp4/YABxdiMZ4+hc0oEL7LyW2jgU6FFc+kMImSb6A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0301MB2273.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(478600001)(6506007)(55236004)(6512007)(91956017)(38100700002)(36756003)(54906003)(966005)(6916009)(186003)(6486002)(5660300002)(66946007)(76116006)(316002)(83380400001)(122000001)(8936002)(26005)(64756008)(2616005)(66476007)(66556008)(66446008)(8676002)(4326008)(2906002)(71200400001)(107886003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?WGxWYjNuMVVLTXcxWXdYcEptaERpdUExamNvc2VvQ0F3dFY3TWlzOXptMnN1?=
 =?utf-8?B?Vk01RXRON3VrNFByL2lSQnRSa1cvUWRhKzg1ekcrSGcyU1h3eVdtUlVIRyt0?=
 =?utf-8?B?YmZjd1duTDYrTk5iRnVCZ1hhZmZqWGJmbjNOeDVXR04rSnBVU3ErNDQyMFFx?=
 =?utf-8?B?UUphbHJSamN1UThxR3lTTko5Rk9OUEtmT3RHRTNKbUVlQlArNS9vOFdROHdQ?=
 =?utf-8?B?TVVlSjROSmtRT0R0eHZlN05OQzdtQXI3N2RncmN1TVZWTUdwQVhsekxycUJj?=
 =?utf-8?B?cWxrazNHak1tWHNoT0RmWUEvZ01iek5IdkNLSDJOT0ZUL2FmRW5pMEhsTWpt?=
 =?utf-8?B?STRzdFJCbldLUkN2YThWVjF3RWtETWx5Tk5Md1l2NjFobmt3RFJmZlRTY2VQ?=
 =?utf-8?B?ZGhaSnduMGNTcFFmb0dvcTFOUDZvZG04cVJzREUvU2EzQ2ZhU0dBUkpzQmJQ?=
 =?utf-8?B?YW9ubzRPS3ZNY2pRN01hcERydDRHaWV2czhQc3A0SWJMcTdnem8zSDIrVGw5?=
 =?utf-8?B?b214WGkwa2piR0gxY1dqcExBNjZLNlpnM0U4cGpEUzgrdXp5eUJ4UXVHNXJE?=
 =?utf-8?B?TVZ0VGJTN1prV2JxQWJldnkrc2QvWHRkeGxDVDUwa3JIamVsZFRhNE9zNlU1?=
 =?utf-8?B?NzU4Qk5pbFpNbDlPdy9RR1JOcjhjOHNuMVBKZFM3RnU2cm5jaStkRVlpU1Aw?=
 =?utf-8?B?VXNPK1BKYmVLc3NJbzVzTVFRcWQ2eGhhVHhDbFdTVzJXRkhGdnh4bW1Gc1N2?=
 =?utf-8?B?Mno5NEpWNXVkcEg4eGFIN2N3akRtb2NLU25XTWcvb1ovUjBrWkZOUzZocms3?=
 =?utf-8?B?TU9pRzRBRlp3YkFwM2RxWjdhYkQ5cnRWSHZKMXFBM0xGYXFqUUg4SEpsNkVK?=
 =?utf-8?B?d0pHS2h1UjJtV2hvUXFOaGdVTy9OQjBUNkE4aFBQTmNnMWNUKzBTMml3Ynpk?=
 =?utf-8?B?b01YY2pMNEVjbTRIaGVLUmdNZjBQR3F0eVdBRzg1R1I2TThnVUxVNHJmVFZz?=
 =?utf-8?B?RER1TTFsaVdoWEJhRU9UNURpb3UxaHBjMjVlbk0yNm0wRmEyR0ZENGYzbEhr?=
 =?utf-8?B?S2tlMHQxVitMZkt2MFVFTmkwYXVRL0t0b21JS3dCOGRCa1h2ZEYxbVVtbVhQ?=
 =?utf-8?B?dlE3UUI4ZFZ4QUdwaTJra2t5ZjZBdGthK1orbnhTMVNxSHAxNlpxdDdHbnZN?=
 =?utf-8?B?OFY1dytPbUlPWTh0endidEdjdFNIQlVrTVAxeGZTSkFLVXorNkkwMEJZemhG?=
 =?utf-8?B?WmhrUTlhV3lLbnA5RzEwYXptY2JzZnhZWVhIRkxsZzFPaHZybUY3bXJIZG1V?=
 =?utf-8?B?YkxvZm4ybUhGWUNYUjVOREZzaFlYOTR6UG9MSG1yZHhoaG92aXVjdTd0WmYw?=
 =?utf-8?B?LzRnNmhNYkNzN3VJcFdPc3Zvd2N6Y21uVWVCVFRCK2dEbDd6ckJMbGQwMTBv?=
 =?utf-8?B?b3B2blBBdUNXTlFwY1FDNGNXV2ZqZVNUMmNBTVlqNTIvYThTb013Ylg5TnhN?=
 =?utf-8?B?ZlhqU1JCY25Da0kyNUFZSHRnYzRDM0hUVEw1M0hhNUN6THVCNWpDUE5qVzFU?=
 =?utf-8?B?U0MzUnFwS0J4YkV1MExQcjcxaUpucEFMTVFrUUVSUHFNTFhGYUpkQ0dnNkdR?=
 =?utf-8?B?LzBhZkwzdC94cmlNRXQwb0VwZG5RbWw3QjVPTERYYmVVaXJqS1gvdlhUUXFY?=
 =?utf-8?B?dGtvZnJFSnozTXBoSkEzZVcrWEt6T2F4eVZxbjVCdkpLc2hQNUNxRHV6Q0Zy?=
 =?utf-8?Q?Ny/dk83VcWsXY4HGOA2zqNxdfORXky9VAnj8MxA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F03E6A57D6D5874CBE20BEF995ACB0C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0301MB2273.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98ad37-8038-4d13-cea5-08d915e5a39b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 08:03:48.5257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddKcJRSQXTpM3fanSELOH1zn24MvhjUYTPkSwwKcRI2PKR3mKW1E97epmy17lahUq5TUsnvgDyiafioID4vanxSHUavSv4yLn2mjPPEy2tA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4627
X-Proofpoint-GUID: gzYmAKQhReD9Wr8dJ6Suw7_klCdmPtD2
X-Proofpoint-ORIG-GUID: gzYmAKQhReD9Wr8dJ6Suw7_klCdmPtD2
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 mlxlogscore=191 spamscore=1
 bulkscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 suspectscore=0 phishscore=0 mlxscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130060

SGkgYWxsLA0KDQpUaGUgcHJvYmxlbSBkZXNjcmliZWQgYmVsb3cgY29uY2VybnMgY2FzZXMgd2hl
biBhIHNoYXJlZCBpbmZvIHBhZ2UNCm5lZWRzIHRvIGJlIGhhbmRlZCBvdmVyIGZyb20gb25lIGVu
dGl0eSBpbiB0aGUgc3lzdGVtIHRvIGFub3RoZXIsIGZvcg0KZXhhbXBsZSwgdGhlcmUgaXMgYSBi
b290bG9hZGVyIG9yIGFueSBvdGhlciBjb2RlIHRoYXQgbWF5IHJ1biBiZWZvcmUNCnRoZSBndWVz
dCBPUycga2VybmVsLg0KTm9ybWFsbHksIHRvIG1hcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBndWVz
dHMgYWxsb2NhdGUgYSBtZW1vcnkgcGFnZQ0KZnJvbSB0aGVpciBSQU0gYW5kIG1hcCB0aGUgc2hh
cmVkIGluZm8gb24gdG9wIG9mIGl0LiBTcGVjaWZpY2FsbHkgd2UNCnVzZSBYRU5NQVBTUEFDRV9z
aGFyZWRfaW5mbyBtZW1vcnkgc3BhY2UgaW4gIFhFTk1FTV9hZGRfdG9fcGh5c21hcA0KaHlwZXJj
YWxsLiAgQXMgdGhlIGluZm8gcGFnZSBleGlzdHMgdGhyb3VnaG91dCB0aGUgZ3Vlc3QgZXhpc3Rl
bmNlIHRoaXMNCmRvZXNuJ3QgaHVydCB0aGUgZ3Vlc3QsIGJ1dCB3aGVuIHRoZSBwYWdlIGdldHMg
b3V0IG9mIGFjY291bnRpbmcsIGUuZy4NCmFmdGVyIGJvb3Rsb2FkZXIganVtcHMgdG8gTGludXgg
YW5kIHRoZSBwYWdlIGlzIG5vdCBoYW5kZWQgb3ZlciB0byBpdCwNCnRoZSBtYXBwZWQgcGFnZSBi
ZWNvbWVzIGEgcHJvYmxlbS4NCkNvbnNpZGVyIHRoZSBjYXNlIHdpdGggVS1ib290IGJvb3Rsb2Fk
ZXIgd2hpY2ggYWxyZWFkeSBoYXMgWGVuIHN1cHBvcnQuDQpUaGUgVS1ib2904oCZcyBYZW4gZ3Vl
c3QgaW1wbGVtZW50YXRpb24gYWxsb2NhdGVzIGEgc2hhcmVkIGluZm8gcGFnZQ0KYmV0d2VlbiBY
ZW4gYW5kIHRoZSBndWVzdCBkb21haW4gYW5kIFUtYm9vdCB1c2VzIGRvbWFpbidzIFJBTSBhZGRy
ZXNzDQpzcGFjZSB0byBjcmVhdGUgYW5kIG1hcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBieSB1c2lu
Zw0KWEVOTUVNX2FkZF90b19waHlzbWFwIGh5cGVyY2FsbCBbMV0uDQoNCkFmdGVyIFUtYm9vdCB0
cmFuc2ZlcnMgY29udHJvbCB0byB0aGUgb3BlcmF0aW5nIHN5c3RlbSAoTGludXgsIEFuZHJvaWQs
DQpldGMpLCB0aGUgc2hhcmVkIGluZm8gcGFnZSBpcyBzdGlsbCBtYXBwZWQgaW4gZG9tYWlu4oCZ
cyBhZGRyZXNzIHNwYWNlLA0KZS5nLiBpdHMgUkFNLiBTbywgYWZ0ZXIgd2UgbGVhdmUgVS1ib290
LCB0aGlzIHBhZ2UgYmVjb21lcyBqdXN0IGFuDQpvcmRpbmFyeSBtZW1vcnkgcGFnZSBmcm9tIExp
bnV4IFBPViB3aGlsZSBpdCBpcyBzdGlsbCBhIHNoYXJlZCBpbmZvDQpwYWdlIGZyb20gWGVuIFBP
Vi4gVGhpcyBjYW4gbGVhZCB0byB1bmRlZmluZWQgYmVoYXZpb3IsIGVycm9ycyBldGMgYXMNClhl
biBjYW4gd3JpdGUgc29tZXRoaW5nIHRvIHRoZSBzaGFyZWQgaW5mbyBwYWdlIGFuZCB3aGVuIExp
bnV4IHRyaWVzIHRvDQp1c2UgaXQgLSBkYXRhIGNvcnJ1cHRpb24gbWF5IGhhcHBlbi4NClRoaXMg
aGFwcGVucyBiZWNhdXNlIHRoZXJlIGlzIG5vIHVubWFwIGZ1bmN0aW9uIGluIFhlbiBBUEkgdG8g
cmVtb3ZlIGFuDQpleGlzdGluZyBzaGFyZWQgaW5mbyBwYWdlIG1hcHBpbmcuIFdlIGNvdWxkIHVz
ZSBvbmx5IGh5cGVyY2FsbA0KWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAgd2hpY2ggZXZlbnR1
YWxseSB3aWxsIGNyZWF0ZSBhIGhvbGUgaW4gdGhlDQpkb21haW4ncyBSQU0gYWRkcmVzcyBzcGFj
ZSB3aGljaCBtYXkgYWxzbyBsZWFkIHRvIGd1ZXN04oCZcyBjcmFzaCB3aGlsZQ0KYWNjZXNzaW5n
IHRoYXQgbWVtb3J5Lg0KDQpXZSBub3RpY2VkIHRoaXMgcHJvYmxlbSBhbmQgdGhlIHdvcmthcm91
bmQgd2FzIGltcGxlbWVudGVkIHVzaW5nIHRoZQ0Kc3BlY2lhbCBHVUVTVF9NQUdJQyBtZW1vcnkg
cmVnaW9uIFsyXS4NCg0KTm93IHdlIHdhbnQgdG8gbWFrZSBhIHByb3BlciBzb2x1dGlvbiBiYXNl
ZCBvbiBHVUVTVF9NQUdJQ19CQVNFLCB3aGljaA0KZG9lcyBub3QgYmVsb25nIHRvIHRoZSBndWVz
dOKAmXMgUkFNIGFkZHJlc3Mgc3BhY2UgWzNdLiBVc2luZyB0aGUgZXhhbXBsZQ0Kb2YgaG93IG9m
ZnNldHMgZm9yIHRoZSBjb25zb2xlIGFuZCB4ZW5zdG9yZSBhcmUgaW1wbGVtZW50ZWQsIHdlIGNh
biBhZGQNCmEgbmV3IHNoYXJlZF9pbmZvIG9mZnNldCBhbmQgaW5jcmVhc2UgdGhlIG51bWJlciBv
ZiBtYWdpYyBwYWdlcyBbNF0gYW5kDQppbXBsZW1lbnQgcmVsYXRlZCBmdW5jdGlvbmFsaXR5LCBz
byB0aGVyZSBpcyBhIHNpbWlsYXIgQVBJIHRvIHF1ZXJ5DQp0aGF0IG1hZ2ljIHBhZ2UgbG9jYXRp
b24gYXMgaXQgaXMgZG9uZSBmb3IgY29uc29sZSBQRk4gYW5kIG90aGVycy4NClRoaXMgYXBwcm9h
Y2ggd291bGQgYWxsb3cgdGhlIHVzZSBvZiB0aGUgWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAN
Cmh5cGVyY2FsbCB3aXRob3V0IGNyZWF0aW5nIGdhcHMgaW4gdGhlIFJBTSBhZGRyZXNzIHNwYWNl
IGZvciBYZW4gZ3Vlc3QNCk9TIFs1XS4NCg0KWzFdIC0gDQpodHRwczovL2dpdGh1Yi5jb20vdS1i
b290L3UtYm9vdC9ibG9iL21hc3Rlci9kcml2ZXJzL3hlbi9oeXBlcnZpc29yLmMjTDE0MQ0KWzJd
IC0gDQpodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy91LWJvb3QvY29tbWl0L2Y3NTliMTUx
MTE2YWYyMDRhNWFiMDJhY2U4MmMwOTMwMGNkNjIzM2ENClszXSAtIA0KaHR0cHM6Ly9naXRodWIu
Y29tL3hlbi1wcm9qZWN0L3hlbi9ibG9iL21hc3Rlci94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaCNMNDMyDQpbNF0gLSANCmh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tcHJvamVjdC94ZW4vYmxv
Yi8yNTg0OWM4YjE2ZjJhNWI3ZmNkMGE4MjNlODBhNWYxYjU5MDI5MWY5L3Rvb2xzL2xpYnMvZ3Vl
c3QveGdfZG9tX2FybS5jI0wyOQ0KWzVdIC0gDQpodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29w
cy91LWJvb3QvYmxvYi9hbmRyb2lkLW1hc3Rlci9kcml2ZXJzL3hlbi9oeXBlcnZpc29yLmMjTDE2
Mg0KDQpSZWdhcmRzLA0KQW5hc3Rhc2lpYSBMdWtpYW5lbmtvDQo=

