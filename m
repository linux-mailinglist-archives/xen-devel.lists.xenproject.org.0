Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52952CA21C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41888.75389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4RQ-0004AP-2U; Tue, 01 Dec 2020 12:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41888.75389; Tue, 01 Dec 2020 12:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4RP-0004A0-Uf; Tue, 01 Dec 2020 12:07:31 +0000
Received: by outflank-mailman (input) for mailman id 41888;
 Tue, 01 Dec 2020 12:07:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Rbw=FF=epam.com=prvs=0604308a42=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kk4RO-00049v-LF
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:07:30 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd296bd9-8f51-42d0-b785-31e35b458043;
 Tue, 01 Dec 2020 12:07:29 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1C6ERn018201; Tue, 1 Dec 2020 12:07:24 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 353ejmyqjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 12:07:24 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3520.eurprd03.prod.outlook.com (2603:10a6:803:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 12:07:13 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 12:07:13 +0000
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
X-Inumbo-ID: cd296bd9-8f51-42d0-b785-31e35b458043
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz4kDwEKeEu6pQ3AacVRJjSxWH2zYzbjEwpWvGdNkEkex22SmPrulL/jxmFbEfmv+k3z6howfm8FdJlF2LR2ogAyvuafy1NPFMjYJamRbIGJY+l15BLx6R2MBEBKhIg9aFjsyX+rjJeBfRpgZk6355RvSZWEmT5GjqgeIJslEbMZlFQDjyPRTEykFosajjKF5Xs/kDHfyDk+g1opW7Bq31IH0zmAIqTfV8cKEKszlmbigYA4h1ywWlFc/zww9KKy7+BDl6SugRfSmlTBzqTJL0GmYpjYwQnfIvVR9+xl9h8TPSyKl9/PR7xurFnK4K9e9sbvuiqLcUHhNf0xbUuXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qocu+7lHskqhuFd/LzqK8s14GfpI/b9CwmrpPIzJKeA=;
 b=oA+V8iiNU/k6+W4JToS6p+gQHUPgLPVGmWw8ZvtYUyb4q+1CEQFRlKdcfgwV6AswfVto0JvqEI0NtRN0sGVu+N4GF8qickGCt1Aifm62rI6+X82O4GugYCQwKocfkw+aH4kSzvXG0XU7dU5kUucG9sU6GErwzftcyxD4EmqY5yuZERfMVyESqg0hZ/WBH76X64VQw57cvs3qFuJahA81i//2yAUmlGF8Hi9WGqCxApNnmbJ6RoMZCwRjfpT7Kb0rcTxPnqnodiU56WxocxbFhN1GjqfGhlfYGCJ2pLjDrQLkw8afVt0ZKxSkbA+2DSU6xt5ZpeW+Ukb6fT55FDqAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qocu+7lHskqhuFd/LzqK8s14GfpI/b9CwmrpPIzJKeA=;
 b=kQdgggOH13ryIIQqZ3JVew4mdEQCk/J43pm4E5mubrefQNdGh0WqEaM8VKlGiP1yRT+5tCrMdbPYP+2TvOZOOhUenL/+U5sXy/nu8MWFGIaprTkO7cv0ymzCFhKEkFz32Q3BIoHy31c5UL4Zl19ofVzEGtf3Ov6YO9b5DUSwUF5sC46a+lypUDyOU+SoTBaXlaxGuRcEsTvBw7KJNUcn8NeLMCNtBWxks9VRErRZQHqq6VXgqNPW2RU1a6CrbiXsNbDM/4JWUt43taTqYKkiauMHptOGwDHy9PqqIB2mHfYs+G4xQJ9wA1deOItJq5QD/Aezve28XK/QuvAi6TWv8Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWxyRSFk5jpSQ9QE+NXR5AM1rL5qnhIUQAgAD/vgCAAAW1AA==
Date: Tue, 1 Dec 2020 12:07:13 +0000
Message-ID: <87sg8p687j.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
In-Reply-To: <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 869ceb0f-e3b6-4a48-a902-08d895f1a364
x-ms-traffictypediagnostic: VI1PR03MB3520:
x-microsoft-antispam-prvs: 
 <VI1PR03MB3520FD2AFEEA30999514C97AE6F40@VI1PR03MB3520.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K0N7b8pLXeFl5lN8KG+NohhIinX4/rqqN1VujeRP3A7hgqXbLSUgkd1KUIWmv8DlVBmmvzMh/01zIvw7v0m+SXB+cJO5sKXhJRrqsxlt/mxtdIqne+5h2Cz/Rc9oyRHVrZdzelZdvguLnYG55VR2ec07FSvDM3zHkmw2p7FvzqAn3VMtF+TVQ6SwkX4dmgYBHqt2qdJNKlBK+8nupORe9ypvovEz78MrZVFP1zrwybH9HS4p8aRAYYIziIqs0xdozzArs9GyeI9QbI2g8W9tsBEy6PuX6cIgA/7J0dP7G3HxDgG4hsULZNXWVz22yxTT+ktKXJX10d0MfkzHzhtisg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(316002)(6486002)(478600001)(54906003)(2616005)(5660300002)(4326008)(8676002)(55236004)(6916009)(91956017)(53546011)(186003)(26005)(66446008)(66556008)(66946007)(6506007)(64756008)(66476007)(83380400001)(71200400001)(86362001)(36756003)(2906002)(76116006)(8936002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?WlhzUld1bjdJTVpOL0VWRnZWbkdqemMwdXYxZlljb1dNU3RYcHFQbkJsVmNH?=
 =?utf-8?B?SXd0ckMvQnM2R1dpMGNXN3BYZGhMNHNQa3pzeFlwQXVXMURDTW1iTWZiZDZj?=
 =?utf-8?B?cE5jTytycW1sQVRMWURLYmJXRy9uTEZjVHJTNWhQbTFiODFYUWhhNmZ0cDFE?=
 =?utf-8?B?S2pEMWcwMFFkS3V6RnZ2QVlheDBQU3g5VTB4TUhOOHY3UFdPNUlrQjFodW9N?=
 =?utf-8?B?MlhYYnRKa2tCckJEMlRURFdZOE1uYWJ1aXdNeGxmRDFtR2plU05MbGtCR1Q4?=
 =?utf-8?B?dlB5ZXdqL05TMk5JRlE4eUJOQ2dvQ1pTSjZtZlR1NXZkT1p0NWtnSHR0VndF?=
 =?utf-8?B?MWE0eGZFTVBLaUt2a2ZCOEhOTXJtdGVXMHFaWExuK29rTmFEek1BWGt5d0k5?=
 =?utf-8?B?MzI0RmtNSm01ZWVhTVVzSklKRDJYU0ppN21LTUk4Yk9CMmxCMS9rOGNFRkFZ?=
 =?utf-8?B?V2hmdmhwTHFqYW1IT1lRbWpnU1RTM3NZd0M2OWoxRWltZ2RwZklVbkFvbDN4?=
 =?utf-8?B?VThqS0NKWDZhUVFhOWtKTkkrYnBYUHdSbW1YbkZUMWsyQ0QyNnpraTFKd3Jz?=
 =?utf-8?B?VmJsTUx0L0JZKzJ0eFlnOVYzd1YyV29tV1hacUY4Q1RjR2t3R3JXV2NRUENY?=
 =?utf-8?B?TUduekxrN0JzbWxnWjcwMnQvdmVNRk1GYmVJR2oycDhscVFTVzQwZVNYZXRU?=
 =?utf-8?B?Ky9QT0VNaXQ4M0V6cUpWZThrY1Y5R1FLY2dZaGRPQXg2b2M0b0Rza0VGSmov?=
 =?utf-8?B?K1ZxYXVrZmRERWI4blg1ZC8xUjRQT3F1YnFtLzdPRmwxNGxSdlo3U0dPbzNr?=
 =?utf-8?B?aXRpeDdCZTNlR1ZvdTVaaGt6UDNKMUNWM0swcEJRV1dCc1YxZnprdG9kZWNR?=
 =?utf-8?B?M1ZLSkl4WU9mQkQzT1lQL3U5MEtoM25Eb09Fd1pERElqRGxia2dMelprckQ4?=
 =?utf-8?B?dEk5WjdlSmdrVkc3cm4xRlViSS9iTkRHK20xakpCUlhCN0ZkM3RsZk5VdWxm?=
 =?utf-8?B?SE1JNW4yS0dvRnhDSGVWcDNIZTlZWnpkc0RrRDNKQTl0eHpUUVl1VzBOYngv?=
 =?utf-8?B?dGFLWkJLKzkzbklFRkFSTm5EWEtxUHZ2Unp0dElDVE5aRnlsb3RGb2lPVVRw?=
 =?utf-8?B?V2g1Z2hrb2VxL3hRandRWGJGUEJwRDIvMXZLdUlJeVFjVGVOUk01UDhjajdz?=
 =?utf-8?B?VG9FRW9nRkVRRGRmRTZyUk90TTBzVy8vMXNBaHlTSGtZb2tWR0E2VEhkek1l?=
 =?utf-8?B?c3l3MG5iek1jRGVDYjIrc1NmcjNYbXFEYmpGV01PWmlUQ3AybGJ2alFTdlJt?=
 =?utf-8?Q?5Pz8g8+IPG1bUC6Oeo/Fl9j9KEg0VAqcFg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF347B1C31249F4DB12B42DF48EDAC5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869ceb0f-e3b6-4a48-a902-08d895f1a364
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 12:07:13.2869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcFIZjuDybx2bj+5Uvm1tPBGQBHTD1/2eSrurYaf8xmLbrzLbpGTQ8lXvzhruPs/Ou5gRChRK5mC5fPjJdrB6CGwDD8j2ISfEkwoOjPgilA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3520
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_04:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=791 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012010079

DQpIaSwNCg0KQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQoNCj4gSGksDQo+DQo+PiBPbiAzMCBO
b3YgMjAyMCwgYXQgMjA6MzEsIFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQo+
PiANCj4+PiBBZGQgc3VwcG9ydCBmb3IgZW11bGF0aW9uIG9mIGNwMTUgYmFzZWQgSUQgcmVnaXN0
ZXJzIChvbiBhcm0zMiBvciB3aGVuDQo+Pj4gcnVubmluZyBhIDMyYml0IGd1ZXN0IG9uIGFybTY0
KS4NCj4+PiBUaGUgaGFuZGxlcnMgYXJlIHJldHVybmluZyB0aGUgdmFsdWVzIHN0b3JlZCBpbiB0
aGUgZ3Vlc3RfY3B1aW5mbw0KPj4+IHN0cnVjdHVyZS4NCj4+PiBJbiB0aGUgY3VycmVudCBzdGF0
dXMgdGhlIE1WRlIgcmVnaXN0ZXJzIGFyZSBubyBzdXBwb3J0ZWQuDQo+PiANCj4+IEl0IGlzIHVu
Y2xlYXIgd2hhdCB3aWxsIGhhcHBlbiB3aXRoIHJlZ2lzdGVycyB0aGF0IGFyZSBub3QgY292ZXJl
ZCBieQ0KPj4gZ3Vlc3RfY3B1aW5mbyBzdHJ1Y3R1cmUuIEFjY29yZGluZyB0byBBUk0gQVJNLCBp
dCBpcyBpbXBsZW1lbnRhdGlvbg0KPj4gZGVmaW5lZCBpZiBzdWNoIGFjY2Vzc2VzIHdpbGwgYmUg
dHJhcHBlZC4gT24gb3RoZXIgaGFuZCwgdGhlcmUgYXJlIG1hbnkNCj4+IHJlZ2lzdGVycyB3aGlj
aCBhcmUgUkFaLiBTbywgZ29vZCBiZWhhdmluZyBndWVzdCBjYW4gdHJ5IHRvIHJlYWQgb25lIG9m
DQo+PiB0aGF0IHJlZ2lzdGVycyBhbmQgaXQgd2lsbCBnZXQgdW5kZWZpbmVkIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiwgaW5zdGVhZA0KPj4gb2YganVzdCByZWFkaW5nIGFsbCB6ZXJvZXMuDQo+DQo+
IFRoaXMgaXMgdHJ1ZSBpbiB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2ggYnV0IHRoaXMgaXMgc29s
dmVkIGJ5IHRoZSBuZXh0IHBhdGNoDQo+IHdoaWNoIGlzIGFkZGluZyBwcm9wZXIgaGFuZGxpbmcg
b2YgdGhvc2UgcmVnaXN0ZXJzIChhZGQgQ1AxMCBleGNlcHRpb24NCj4gc3VwcG9ydCksIGF0IGxl
YXN0IGZvciBNVkZSIG9uZXMuDQo+DQo+IEZyb20gQVJNIEFSTSBwb2ludCBvZiB2aWV3LCBJIGRp
ZCBoYW5kbGUgYWxsIHJlZ2lzdGVycyBsaXN0ZWQgSSB0aGluay4NCj4gSWYgeW91IHRoaW5rIHNv
bWUgYXJlIG1pc3NpbmcgcGxlYXNlIHBvaW50IG1lIHRvIHRoZW0gYXMgTyBkbyBub3QNCj4gY29t
cGxldGVseSB1bmRlcnN0YW5kIHdoYXQgYXJlIHRoZSDigJxyZWdpc3RlcnMgbm90IGNvdmVyZWTi
gJ0gdW5sZXNzDQo+IHlvdSBtZWFuIHRoZSBNVkZSIG9uZXMuDQoNCldlbGwsIEkgbWF5IGJlIHdy
b25nIGZvciBhYXJjaDMyIGNhc2UsIGJ1dCBmb3IgYWFyY2g2NCwgdGhlcmUgYXJlIG51bWJlcg0K
b2YgcmVzZXJ2ZWQgcmVnaXN0ZXJzIGluIElEcyByYW5nZS4gVGhvc2UgcmVnaXN0ZXJzIHNob3Vs
ZCByZWFkIGFzDQp6ZXJvLiBZb3UgY2FuIGZpbmQgdGhlbSBpbiB0aGUgc2VjdGlvbiAiQzUuMS42
IG9wMD09MGIxMSwgTW92ZXMgdG8gYW5kDQpmcm9tIG5vbi1kZWJ1ZyBTeXN0ZW0gcmVnaXN0ZXJz
IGFuZCBTcGVjaWFsLXB1cnBvc2UgcmVnaXN0ZXJzIiBvZiBBUk0NCkRESSAwNDg3Qi5hLiBDaGVj
ayBvdXQgIlRhYmxlIEM1LTYgU3lzdGVtIGluc3RydWN0aW9uIGVuY29kaW5ncyBmb3INCm5vbi1E
ZWJ1ZyBTeXN0ZW0gcmVnaXN0ZXIgYWNjZXNzZXMiLg0KDQoNCj4+IA0KPj4+IFNpZ25lZC1vZmYt
Ynk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+PiAtLS0N
Cj4+PiBDaGFuZ2VzIGluIFYyOiByZWJhc2UNCj4+PiAtLS0NCj4+PiB4ZW4vYXJjaC9hcm0vdmNw
cmVnLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+IDEgZmls
ZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92Y3ByZWcuYyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+IGluZGV4IGNkYzkx
Y2RmNWIuLmQwYzY0MDZmMzQgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZjcHJlZy5j
DQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZjcHJlZy5jDQo+Pj4gQEAgLTE1NSw2ICsxNTUsMTQg
QEAgVFZNX1JFRzMyKENPTlRFWFRJRFIsIENPTlRFWFRJRFJfRUwxKQ0KPj4+ICAgICAgICAgYnJl
YWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KPj4+ICAgICB9DQo+Pj4gDQo+Pj4gKy8qIE1hY3JvIHRvIGdlbmVyYXRlIGVhc2lseSBjYXNl
IGZvciBJRCBjby1wcm9jZXNzb3IgZW11bGF0aW9uICovDQo+Pj4gKyNkZWZpbmUgR0VORVJBVEVf
VElEM19JTkZPKHJlZyxmaWVsZCxvZmZzZXQpICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+
ICsgICAgY2FzZSBIU1JfQ1BSRUczMihyZWcpOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4+PiArICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4gKyAgICAgICAgcmV0dXJuIGhh
bmRsZV9yb19yZWFkX3ZhbChyZWdzLCByZWdpZHgsIGNwMzIucmVhZCwgaHNyLCAgICAgXA0KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIDEsIGd1ZXN0X2NwdWluZm8uZmllbGQuYml0c1tv
ZmZzZXRdKTsgICAgIFwNCj4+PiArICAgIH0NCj4+PiArDQo+Pj4gdm9pZCBkb19jcDE1XzMyKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBjb25zdCB1bmlvbiBoc3IgaHNyKQ0KPj4+IHsNCj4+
PiAgICAgY29uc3Qgc3RydWN0IGhzcl9jcDMyIGNwMzIgPSBoc3IuY3AzMjsNCj4+PiBAQCAtMjg2
LDYgKzI5NCwzMyBAQCB2b2lkIGRvX2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Ms
IGNvbnN0IHVuaW9uIGhzciBoc3IpDQo+Pj4gICAgICAgICAgKi8NCj4+PiAgICAgICAgIHJldHVy
biBoYW5kbGVfcmF6X3dpKHJlZ3MsIHJlZ2lkeCwgY3AzMi5yZWFkLCBoc3IsIDEpOw0KPj4+IA0K
Pj4+ICsgICAgLyoNCj4+PiArICAgICAqIEhDUl9FTDIuVElEMw0KPj4+ICsgICAgICoNCj4+PiAr
ICAgICAqIFRoaXMgaXMgdHJhcHBpbmcgbW9zdCBJZGVudGlmaWNhdGlvbiByZWdpc3RlcnMgdXNl
ZCBieSBhIGd1ZXN0DQo+Pj4gKyAgICAgKiB0byBpZGVudGlmeSB0aGUgcHJvY2Vzc29yIGZlYXR1
cmVzDQo+Pj4gKyAgICAgKi8NCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIwLCBw
ZnIzMiwgMCkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIxLCBwZnIzMiwgMSkN
Cj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIyLCBwZnIzMiwgMikNCj4+PiArICAg
IEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9ERlIwLCBkYmczMiwgMCkNCj4+PiArICAgIEdFTkVSQVRF
X1RJRDNfSU5GTyhJRF9ERlIxLCBkYmczMiwgMSkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5G
TyhJRF9BRlIwLCBhdXgzMiwgMCkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZS
MCwgbW0zMiwgMCkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMSwgbW0zMiwg
MSkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMiwgbW0zMiwgMikNCj4+PiAr
ICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMywgbW0zMiwgMykNCj4+PiArICAgIEdFTkVS
QVRFX1RJRDNfSU5GTyhJRF9NTUZSNCwgbW0zMiwgNCkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNf
SU5GTyhJRF9NTUZSNSwgbW0zMiwgNSkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9J
U0FSMCwgaXNhMzIsIDApDQo+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjEsIGlz
YTMyLCAxKQ0KPj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIyLCBpc2EzMiwgMikN
Cj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9JU0FSMywgaXNhMzIsIDMpDQo+Pj4gKyAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjQsIGlzYTMyLCA0KQ0KPj4+ICsgICAgR0VORVJB
VEVfVElEM19JTkZPKElEX0lTQVI1LCBpc2EzMiwgNSkNCj4+PiArICAgIEdFTkVSQVRFX1RJRDNf
SU5GTyhJRF9JU0FSNiwgaXNhMzIsIDYpDQo+Pj4gKyAgICAvKiBNVkZSIHJlZ2lzdGVycyBhcmUg
aW4gY3AxMCBubyBjcDE1ICovDQo+Pj4gKw0KPj4+ICAgICAvKg0KPj4+ICAgICAgKiBIQ1JfRUwy
LlRJRENQDQo+Pj4gICAgICAqDQo+PiANCj4+IA0KPj4gLS0gDQo+PiBWb2xvZHlteXIgQmFiY2h1
ayBhdCBFUEFNDQoNCg0KLS0gDQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFN

