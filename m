Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA82E7673
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 07:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60075.105345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuUsk-0001pa-IN; Wed, 30 Dec 2020 06:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60075.105345; Wed, 30 Dec 2020 06:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuUsk-0001pE-ED; Wed, 30 Dec 2020 06:22:50 +0000
Received: by outflank-mailman (input) for mailman id 60075;
 Wed, 30 Dec 2020 06:22:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=441D=GC=epam.com=prvs=1633713edb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kuUsi-0001p9-Jz
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 06:22:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a011cbf-99a8-4f79-9e69-afb7224a6be4;
 Wed, 30 Dec 2020 06:22:47 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BU6C5fT032760; Wed, 30 Dec 2020 06:22:45 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 35nw3sy7b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Dec 2020 06:22:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3714.eurprd03.prod.outlook.com (2603:10a6:208:44::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Wed, 30 Dec
 2020 06:22:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::410a:a547:9838:afb8]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::410a:a547:9838:afb8%6]) with mapi id 15.20.3721.019; Wed, 30 Dec 2020
 06:22:39 +0000
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
X-Inumbo-ID: 5a011cbf-99a8-4f79-9e69-afb7224a6be4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmnJbqzhGuKJDIS8D/iIpjFBHeHBaG8bRQ0WvYJeVotEUjdwxUp+KFz02YAYGb9XhobQAveN8bLnyAGSsH6IKV8ZW5zjz8qCTmBs0fBg8FwN8YS2wXQ7XWBowhblIME7BPL6DUqpEQ/qZG0BrYirl6XE65lDTThm2PSU9G/+N0pB3XrmQFgxKTIkCIXXCg/yy8jkKa5wPN/mWWxP5Ah27UvEGjwUgd7GeZT8di2IO4VHnNCBkq14M8fWfKyUl39yzrGz87oaB2p+02t0P26mNtlUfIzkbuxc7ZgvY8Tw5xLqjY7eG8KgPc80slmpEO5Zd82DGUZtEKTn97Jss8+7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtncH/NWaXJza/0vJIxwluyv1n4lNwH6YV33qkkIlsE=;
 b=MPdUWRcjBBFANze5hCAmvFaUzulnSOz+IzJiB8SiaA47wk1VJsrl0gDgESu0FUEmOUN7lN4KOnim3lVw4Eh4ZYwi1q2ATt2OqJElqcirjju8ckf5w77N9HJNyzBtxrvymkqL/ZLtws/KEdN4/0fFcRyizr4qrsMsK29taP1AyMli//6cUS6lYkyTAFaBQWyxma7Cltym6ngBXLqnvfFCFyYahHy5C098fQBQTGvV0/dzwWZmbQEkBZvb7ek208J9TxIuvjPaQP6A+RXRzoFu0b7lWUH/+Zh0+ZjZtSqN6GqDJwGIxXfE+EyJimTe9rEZ+fHaykLSiTh+09nafdZehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtncH/NWaXJza/0vJIxwluyv1n4lNwH6YV33qkkIlsE=;
 b=DrL9eXC1ojBvA8fwsnk7Q+yJHrcP0Tw2/2tEO3YIGxZ7BnLW/Rf+5xeOrA7B06Yc3udLDxZ2N+nGpBxNnxrGyddcuvjblTYQ5SqKk9x2y9Zld1+9BcFSfAp2rouqz+cJ3IElNLllcpVRnUuVhiQRzDOQEoT78ygjd1MswyWuwPpsO5hKyQyVU0xHLecCo4FMm5tID4cQYg9HZsUrpUM6PHxUqEhjyiIHunv/ttY189SXV5sExwZ7F/v1ZjaGjIrDoQ2BdOLD2VLQfSkjLBk5FfQzEttA6y7/i5m3opjjXPF6AB2tBGwskc2c1ivPt1dH7Ku8OdGdBLT4PR4yfw/fgA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: tosher 1 <akm2tosher@yahoo.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Xen-devel
	<xen-devel@lists.xenproject.org>,
        Paul Durrant <xadimgnik@gmail.com>
Subject: Re: PVH mode PCI passthrough status
Thread-Topic: PVH mode PCI passthrough status
Thread-Index: AQHW3nQr/op/89E1c0G2q24tiQpaZw==
Date: Wed, 30 Dec 2020 06:22:38 +0000
Message-ID: <44a39b4d-8255-420f-005f-73bef4b765e3@epam.com>
References: <943136031.5051796.1609179068383.ref@mail.yahoo.com>
 <943136031.5051796.1609179068383@mail.yahoo.com>
 <20201229081943.ifaiwrqyj5ojwufn@Air-de-Roger>
 <88957249.5342211.1609261310806@mail.yahoo.com>
 <20201229183229.okhtyskjylm2bhx4@Air-de-Roger>
In-Reply-To: <20201229183229.okhtyskjylm2bhx4@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yahoo.com; dkim=none (message not signed)
 header.d=none;yahoo.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 138e99a0-c7c8-4a63-2eaf-08d8ac8b4e92
x-ms-traffictypediagnostic: AM0PR03MB3714:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3714AA853F7CEEC474399228E7D70@AM0PR03MB3714.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uI54CrnY+IfNgYk7X0SYKIzanjh6J/+zoxVIGlWiqtdxehPlIW3NxsA53GcsNYyLt19MwLfHwKDYQr0smMHLle/CMfwldjo5ErimVf3yQ/PmRZ7pwLcPz7IeYP38iXqklClQyQM2Aq+wEPBnjNA3rodwjxkEVBIJwUb8FOZVhxpGcUMgNaSC89/La7AnOZ7wElssiHCwSNNvdFkgjgAVuS4kXsaGTlcwQh+hGxLecHcSM5g9AWVpU8HWqOPQwjjjy4bSEjcXOPNqtHYMOJW4v8dh+FliX5bxA/C+c4fvH5VIMUHXlKSCQXz5XTGHo/fFybdiPF+JYOTKEQKGlhVfIcQw10xwPbxt4AiLwyPkHKeQNGKK0iOgyWJtNwdhSt9c10qe6pL2IhMCCJT01XhwHketaqKQbX0WGr0XUdiuDg/cdVcBRwj247Mfj48n1Vmj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(186003)(6486002)(31696002)(316002)(36756003)(76116006)(66446008)(66946007)(66476007)(5660300002)(83380400001)(8936002)(2616005)(64756008)(86362001)(53546011)(4326008)(2906002)(6916009)(71200400001)(31686004)(54906003)(6506007)(8676002)(66556008)(6512007)(478600001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RkQzdXRxcGlXNWxkRzF5TmZxVURzQ25vZzA0Q2N6MmEvRDJ3dUNRRUoyTm05?=
 =?utf-8?B?UXRXenQ1QWh3ZTB5MVltVjlwQk1SU1RQY3FIcUpYV2lrLzJ4MThxbXM4V3ZR?=
 =?utf-8?B?clJYY3dlWTNxemdWOXlPQkdnRVhNOGk5V2d5cXVnOUZtbS9POURXbkRISStI?=
 =?utf-8?B?Z250VmRtbW1qMXpmZFdEcVFWUnkvVGZPbmVxSE9OWFZBUzBTSkdEUVhyZlNp?=
 =?utf-8?B?b3ZzQVJNUkY4OW1FVlNNbzJlQWVKREk3SVdNYkQwallBcmhiRG9jQ2pVWTNo?=
 =?utf-8?B?dEdPU3p6VlJuSyt0WStROEVqbURKU0J5eHRld0U1T01pMzhWR2E0bmN6ZlI3?=
 =?utf-8?B?TTZucllDRkVlZnNEYUdBcFBFcnk5U0JBY2dZcGRUMUdjbVdOY0lhQkQ5MUpt?=
 =?utf-8?B?RkdrbEw2TVdWNlpNK1pYckc0d2FyRStiS3paYTBIMDA3QmZzTTM0eUpqeWhz?=
 =?utf-8?B?dTQzWk41SjlpeWFVTGFiemlVd2dBVFo4TjRIZEh2SmdwTFVBSDFlZFRXdXNn?=
 =?utf-8?B?bWNoeHBZb3duN2FFc3NuNDNUUFpCSXJpdktCeldXVEhtanNTTVRlWStNU0RK?=
 =?utf-8?B?VnM1ZDE1WU16UUdhRWJub05JTXpBbkl6QVp1NnY3Y280eEpiZ2FmdDl4T0Yx?=
 =?utf-8?B?ckdMNlhPWFlCM3lIOEdSaFh0NER3VHhlUjJRUW5zWFZMUHVzY0NyTUdVZkZv?=
 =?utf-8?B?RXErY1Y3YUlGUFFUeXFFYUZuWndGbTU3RThjUGR0QytJaExyeHFzd1h2OXB3?=
 =?utf-8?B?OCttUUFFUlFEWURTUlZSS0phQm12cDlSdGZWWWJLU1VpMHVlYittUnpiWTFD?=
 =?utf-8?B?TGhxc3NCWFpzOGI5VDVtamN5OExXWThVNzNIMjFhL3JTNFdPRWZ6VVNxdUFU?=
 =?utf-8?B?dWZTSXRua0EzZUIvV3NjWDB3OGZwclk3WVh1c0daQk42OWNXdlROZ2JVdzVo?=
 =?utf-8?B?c3RVZHZRSFRRN3FneS9HSnRmakpXUGQycmNoU0J3MGFqUWdwSVAvbWtzNXBw?=
 =?utf-8?B?ck1pUDJQemYrbWp5RFRjMVgvWWF0NnUwdFJSZ3VRNk1uOFJab2tnYnZtSUt4?=
 =?utf-8?B?VTBFdkNlVjRQMU1lRThTTDJNM2dpckpBKzhFUnZ6TDBueWpCemcra0pLSnU5?=
 =?utf-8?B?Tng0R2VZTmhHNEpVaTY4c1B5WFl6VGJid3doV054MHo2T0tZVUF2cEM2bmRQ?=
 =?utf-8?B?aTNxVktxMnhZZ1lMTnJLZHZUc3VCa1docU1LS3l4TnVGOGYvN0lCUFFBK3V2?=
 =?utf-8?B?eUltYWFNZDh6RVVPN3ZyQmpMbklXaE51RVQ4ZU5oSW1kdlZlbnJlclJzZkJ2?=
 =?utf-8?Q?RysBO32/WR3XsvyOgazjnNQBwdMEpo4MtG?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C5EE2909E50F84CB85B6B22A6693472@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138e99a0-c7c8-4a63-2eaf-08d8ac8b4e92
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 06:22:39.0345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtvOJ/R20iOnSleuZOOJU+oz0Ny5OWaG+cc4+9Md/55qWm3g2c2viu6NEsRRTHZkLc6Ac3G9WAKktEjCSDmIq5IozV3KqOcD91/9ysNzauQU9spAXOloXcHoM/H0Rv4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3714
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012300038

SGksIGFsbA0KDQpPbiAxMi8yOS8yMCA4OjMyIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
PiBPbiBUdWUsIERlYyAyOSwgMjAyMCBhdCAwNTowMTo1MFBNICswMDAwLCB0b3NoZXIgMSB3cm90
ZToNCj4+IEhpIFJvZ2VyLA0KPj4NCj4+PiBJIHRoaW5rIHlvdSBtZWFudCBQVkggbW9kZSBpbiB0
aGUgc2VudGVuY2UgYWJvdmUgaW5zdGVhZCBvZiBQVk0/DQo+PiBTb3JyeSwgdGhhdCB3YXMgYSB0
eXBvLiBJIG1lYW50IFBWSC4NCj4+DQo+Pj4gQXJtIGZvbGtzIGFyZSB3b3JraW5nIG9uIHVzaW5n
IHZQQ0kgZm9yIGRvbVVzLCB3aGljaCBjb3VsZCBlYXNpbHkgYmUgcGlja2VkIHVwIGJ5IHg4NiBv
bmNlIHJlYWR5LiBUaGVyZSdzIGFsc28gdGhlIG9wdGlvbiB0byBpbXBvcnQgeGVucHQgWzBdIGZy
b20gUGF1bCBEdXJyYW50IGFuZCB1c2UgaXQgd2l0aCBQVkgsIGJ1dCBpdCB3aWxsIGxpa2VseSBy
ZXF1aXJlIHNvbWUgd29yay4NCj4+IFRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4gRG8geW91IGhh
dmUgYW55IHRpbWVsaW5lIGluIG1pbmQgb24gd2hlbiBzdXBwb3J0IGZvciB4ODYgd2lsbCBiZSBh
dmFpbGFibGU/IEEgcm91Z2ggZXN0aW1hdGUgd291bGQgaGVscCBtZSB3aXRoIHBsYW5uaW5nIHNv
bWV0aGluZy4NCj4gSSdtIGFkZGluZyB0aGUgcmVsZXZhbnQgcGVvcGxlIHdvcmtpbmcgb24gdGhp
cywgT2xla3NhbmRyIGZvciB0aGUgdlBDSQ0KPiBBcm0gd29yayBhbmQgUGF1bCBmb3IgeGVucHQu
DQoNClRoaXMgaXMgaW5kZWVkIFdJUCBhbmQgdGhlIHRoaW5nIGlzIGJlaW5nIGRldmVsb3BlZCBi
eSBtYW55IHBhcnRpZXM6IEFSTSwgRVBBTSwgWGlsaW54Li4uDQoNCkFuZCB1bmZvcnR1bmF0ZWx5
IEkgY2Fubm90IGdpdmUgeW91IGV2ZW4gYSByb3VnaCBlc3RpbWF0ZSB3aGVuIHRoaXMgaXMgZ29p
bmcgdG8gaGFwcGVuDQoNCmFzIHRoZXJlIGFyZSBzbyBtYW55IHRvcGljcyB0byBjb3ZlciBmb3Ig
QVJNIHlldC4gT2YgY291cnNlLCB3ZSB0cnkgdG8gbWFrZSB0aGUgY29kZSBmaXQgeDg2DQoNCmFz
IHdlbGwsIHNvIHdlIHNoYXJlIHRoZSBjb2RlIGJldHdlZW4gdGhlIGFyY2hpdGVjdHVyZXMuLi4N
Cg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KPg0KPiBUaGUgeGVucHQgc3R1ZmYgc2hvdWxk
bid0IGJlIGNvbXBsaWNhdGVkIChQYXVsIGNhbiBjb3JyZWN0IG1lKSwgYXMgaXQNCj4gd291bGQg
bW9zdGx5IGludm9sdmUgaW1wb3J0aW5nIHhlbnB0IGludG8gdGhlIHhlbi5naXQgcmVwb3NpdG9y
eSBhbmQNCj4gdGhlbiB3aXJpbmcgaXQgdXAgZm9yIHRoZSB0b29sc3RhY2sgdG8gdXNlIGl0LCBh
dCBsZWFzdCB0byBnZXQgYW4NCj4gaW5pdGlhbCB2ZXJzaW9uIHdvcmtpbmcuDQo+DQo+IFJvZ2Vy
Lg==

