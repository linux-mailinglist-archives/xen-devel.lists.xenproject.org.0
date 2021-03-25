Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752C34896D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 07:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101266.193549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJsP-00086i-9r; Thu, 25 Mar 2021 06:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101266.193549; Thu, 25 Mar 2021 06:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJsP-00086J-5a; Thu, 25 Mar 2021 06:53:53 +0000
Received: by outflank-mailman (input) for mailman id 101266;
 Thu, 25 Mar 2021 06:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Cl2=IX=epam.com=prvs=3718c8f974=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lPJsO-00086C-1Q
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 06:53:52 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a6affc3-0871-4474-8693-7129f88bb562;
 Thu, 25 Mar 2021 06:53:50 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P6j63W029988; Thu, 25 Mar 2021 06:53:49 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 by mx0b-0039f301.pphosted.com with ESMTP id 37gmer05qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 06:53:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3283.eurprd03.prod.outlook.com (2603:10a6:208:12::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 06:53:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 06:53:47 +0000
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
X-Inumbo-ID: 9a6affc3-0871-4474-8693-7129f88bb562
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFhhLCKUd+0HydW+yYX4rltHbaXPcYpGnwakRQC3gH5ryXAivi1kr/OVvYDmkFmlWigXPGmBvIexk3CZOI7DSPmz0RLE8+rEo9yRcdcm+dYBAiQdw6BL2U5z1SwpQseSIAGV4QtuzzlWfaWTtWnH6HJ/KXdnc/+OxdbcaWuJQRDwRyTX02CQR0cO+IoTvXd87IclO8LbBUj7HCM7Wb62qZiM28/Sb9xfCrvGsZFffIGldYu47GDBCxfZWKSueUkJCNiXGsDYH6W32srjxbO0kMyBr2rLismgk6lu0B+V1N3slVkco80Dcb91cngAt+hZVZ+AMXgTDwQKkLbblka0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBODP1W7j6ZcILAQc0m1CiDNrOSChCd9P+aXQPHAeeE=;
 b=eJJllhkPnJSqr+bTMKv7Ndh0QRPNqIoAFDfQoZJpZBK+RbX7yRBDIAiUEp6oRZrpwoyIKYJMnkdSmK5DqlVAyov/qiv3O3YT7rnKjHKT/s8aGIxdp0c9amBH2fyIcUPwv2vemn8n9bGTu+bUvRSSSIDAtINzl0aMbfEVJsfQNPNIg3IcZhHiAsYd/i1RT2c/qjLpRh2RD9VkiUlmqWiQSEdFDawJz35pwXd3gu5XBuzpIbKbZbBa06RIZ41oAx9cmgLs9GScmsDy/5detmWRExcAsGkqve2u2ClvCMGOtok7WzaOdIZEjk9zJXDWav9ZIXOSzINgdSvmLm8CYGoo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBODP1W7j6ZcILAQc0m1CiDNrOSChCd9P+aXQPHAeeE=;
 b=ypZQ6SY22FvxcysjRg+Zl65o4EP8YvItnf3KuxMSWh5KKFsP3gl7unkXdeW5p+EE4A6XBYOL00mLcqFbFrqNDu1O8cLW5W6XL/m8DdDdPBbVzxmhOTGYy2duQ6iAX9y+toS+vjGjlNgTsF4xv8Yckl4bifaNUOUSY/FqVJNoofHJFzwoWAc7nqJRpwe7iHzhS+9cCMtjXw72GPHoX34fVXYblKS5xgGJHgYBUs/5paTuLcFpKuMcrTdFHzg+A6gYPQ7KapxdDRfXzvTGii/pOcCBwciacwIAk0iE2QOXZvCPYwQ7ledlJWKxZZzO2I3N/O7rp5MKA1bmOdwqZDWItQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
        "airlied@linux.ie"
	<airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu/xen: Fix a use after free in xen_drm_drv_init
Thread-Topic: [PATCH] gpu/xen: Fix a use after free in xen_drm_drv_init
Thread-Index: AQHXH4ZwjUja6WTelkeHEbGl7WGsSaqUSCcA
Date: Thu, 25 Mar 2021 06:53:46 +0000
Message-ID: <08cde91e-6276-3d59-b784-803327800896@epam.com>
References: <20210323014656.10068-1-lyl2019@mail.ustc.edu.cn>
In-Reply-To: <20210323014656.10068-1-lyl2019@mail.ustc.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mail.ustc.edu.cn; dkim=none (message not signed)
 header.d=none;mail.ustc.edu.cn; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a1f3477-368b-4a25-8140-08d8ef5abd21
x-ms-traffictypediagnostic: AM0PR0302MB3283:
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3283B2E358582D11E3F2CB34E7629@AM0PR0302MB3283.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mq0dlE0JR7G6n9lR6BXiSMJ89YeD+eLWZty+d0uXcjwBMO72+6g0AlopRFxKt62k+BS8xGkM+lkypWvAysZXgnRS/fnQ4YmYqsYWvH0OBY0hBzaoxiC+N8Jb0fgmOhleR2KzRm6XZIA8QtB2QQRyRONCGQKsMCwBEBdaaGhSLmR5Nj/761kguGXPWntw9ouHdHFqHbiCz4SApDHAUoKRNDJ8AB4xXau63Sv2GXOCSsZAG18UCYEHyDMXoaTpgwONLOKvmT0/PfH2c0mE1s8BRG1l0XBINIY2fR65epHJI8SfJnAuG+1RoOhxnc7ohyfaLpCp3s0dofkiJL05hA7tLoengNzbIxxkqiVZ+h4Efk4l0NkuTEly9hSpktFjxETDPnB1F4G4gwHUYESNdB9cOo6m9LDfcP3EZ0hFn7NNIDQR5FQQQkHt9YDM+OQvIpm2w4LeJV9WFBAXRUQ/EJ0Xqdo7xM4GYyHKiuNHBhA92172e/rjTWLroq84tEtPhEguSsuKw/GjiZn9vD9kj9fowwo04/3qH5WZzNe6rwYVVsS6E8+jSdjFjcUrBrBNdSw6OCxG94s5ookHbSO9oXMsvi3vhVxQJTwUVGJr87dwH1KS1FZT9rbBN6Bux4HbPL8jW6W76TewjVld44acizQ7YsXF/3YZ7xIeOSYxtyv47fRrItOxmwz3FDuvtG4n7CGB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(136003)(396003)(376002)(366004)(36756003)(66946007)(54906003)(5660300002)(2616005)(110136005)(66556008)(478600001)(26005)(186003)(66446008)(6486002)(316002)(6506007)(66476007)(53546011)(64756008)(76116006)(2906002)(31686004)(4326008)(86362001)(6512007)(8936002)(38100700001)(71200400001)(8676002)(83380400001)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?V3JhL3Y3Z2hBbTZKUkROWTZDVnUzT1BDNk5LQ1NPZWhGUHJMTE8xM244OHVs?=
 =?utf-8?B?amkwbkJmZFBHc09zak5zbzFEUTE5V1N4UFhaNitBanRrN1JLd2YxVHJHbU10?=
 =?utf-8?B?aVhlbzVSSkpRTkdxdlhaTnZMNldtTVkySkE0cUVPL1V0L3kwVVNCcHgzblNS?=
 =?utf-8?B?aUpvcWR5ekFxSXRXZUtYVjVMVklmOWlGd2dZOWhkMTJlMFNZYlNQaDhMTXpG?=
 =?utf-8?B?eUJmZGRHcmNZV0hycVR5c0xmYlBybHJRU0hGWmZOeVFpN0xiQzV5endPblpL?=
 =?utf-8?B?RjYwakRleDhSTGZReTJUSmZlSWNrZUYwcExTeXEzNllraUU5Vzd6b3EwejRt?=
 =?utf-8?B?cThwd09XditmV3o4ZFJQRW9ZNGxLOTJWVzBUL2E3Z2k3aHAzRVNYMTY3K3ZV?=
 =?utf-8?B?NVhhOWIxT2VTRzA5dXBnT1pLc0ZJYlNhSE1DTDdPVmhWOStJbWhqcVo0S1Jv?=
 =?utf-8?B?RlEyTVN6VmxZc1NIVzcrQ0FOOGprUlRXTU04RWF1TjRaNE1yaWlTSE9hWkRX?=
 =?utf-8?B?NklMNTNnWHByUEFJeU9HTTRQKzNkaWovNWVDSmowcXR2YXBQTUJsRldBSitn?=
 =?utf-8?B?T1pucGl5WVIydXBXOHd4dVA3YVBWOU9EbGlDSUErQTluZ0QvTlA0K0ZXTmJh?=
 =?utf-8?B?ZnZUZHYrbUpsdWVXUHg1V01MMk9XV3lHaGJGMmR1K3VQSG00K0sxYmNZRnlC?=
 =?utf-8?B?WGd4TmVIN3VCbjByQ3NuMEh4aFY2WWxqNUVMZ0J3c0hMNUJwV3pFUHU3bjlK?=
 =?utf-8?B?c3o5NjhzcjFRYy9mTjdVSHdscHRNT0Q5dmtlSGh5SlZ6aExxK3AxVDFrK2FD?=
 =?utf-8?B?UnZ0SEJMc2ZvYXZCc3RoblV4cFVkTG1QTFcxdjZZbXlXWnF3TExiUElKMkpV?=
 =?utf-8?B?ZDJXV2hlaEFHQkpFV0w3ZCtrcmw3dzk2bEpZR2lRZ1hKY25WVU9jOE1sYzNX?=
 =?utf-8?B?U1I4MHRFWDBIL1lxS0VKc0Y3cXBHSnVQTm1NLzdlalJJR1l6T3lkNlQ3eU9O?=
 =?utf-8?B?cVJkVEh4M0Mya3NzdGVoZ1R4NlFjRVRQNFdoQStvVVJ1am1USXQ1UXQzR0JH?=
 =?utf-8?B?Y3NscGUwTjVOanF0Y2JIUzZyNzJSYXczMkZuNHlQeTllMGJycDh4Q0NQKzBl?=
 =?utf-8?B?WnFuQm1PYktHMll3blIyeXpFY2srd0xQeU13L1p5UXVuZ2VZWUcvb1FFMnow?=
 =?utf-8?B?L09QV2lSY1FIb05Hcll4QlV4SFpSQzhqSSthUmVBaUlGcjdUckFTcjdvcWdN?=
 =?utf-8?B?dzdUUFhlNEo0RWxOTGlqRXBhVzhxb1ZwdmxJam5GYVExb2VSSHgzQ00xL0Rr?=
 =?utf-8?B?d3M4K2lZd3NEaWN5anJPOGJ0SHVFdk5ENnNyZ0NJWnNTamx5V3VwRzhxRjJN?=
 =?utf-8?B?YUp3Zi84NHQvWGxIWGUzNkt2OVAyeDBnWmk0Ni81UWc5cE9yU2FyellxdEcv?=
 =?utf-8?B?TjJoeGVpQTRFdXZiV3VzaWhmSENRQXNlSE5od3VvSzg4dU1DRmw0cmtZRURZ?=
 =?utf-8?B?SlZ6d0tMWjF0VEFCVUdrVUlyMGVsOUtneVJTZkttYWIyMGtxRVg1cWlxTG1G?=
 =?utf-8?B?azV5M3ZFY3BEVmpIK2dIZWlaNzBha3graGJQajlyWnAvZUFDYktSaG9pSTh2?=
 =?utf-8?B?d0l6enlleFIzYXFxaWJBZGVOQVA5Vm9ldzJNaUNiWjRjWGVjMCtIbnc3R3cy?=
 =?utf-8?B?Yk9XbHE0RU9IR1h2dmdmM0pJSGFDd2YwQ2h0ZXVlUXQ3RkJ1WW92NVJVdEF4?=
 =?utf-8?Q?6NniNmstmlOfUCIKomVDF9hxHrHHFJCiyTpIkSs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <813B40AC18E2B149A47E4F7F1C59F91E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1f3477-368b-4a25-8140-08d8ef5abd21
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 06:53:46.7649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdHhnweOHhnw7sGQ2ybFAwFvjOHSmg0q2kUxWWQyc4QMHmSEvXWfqJPEW3Yv3ZYPmn9krO9f1Y+gG2deaMuimAP4sp5Led1B93jQ2e7pkY1M6s3G+BbDrjttSF+AETnv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3283
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=883
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250049

SGksDQoNCmdvb2QgY2F0Y2gNCg0KT24gMy8yMy8yMSAzOjQ2IEFNLCBMdiBZdW5sb25nIHdyb3Rl
Og0KPiBJbiBmdW5jdGlvbiBkaXNwbGJhY2tfY2hhbmdlZCwgaGFzIHRoZSBjYWxsIGNoYWluDQo+
IGRpc3BsYmFja19jb25uZWN0KGZyb250X2luZm8pLT54ZW5fZHJtX2Rydl9pbml0KGZyb250X2lu
Zm8pLg0KPiBXZSBjYW4gc2VlIHRoYXQgZHJtX2luZm8gaXMgYXNzaWduZWQgdG8gZnJvbnRfaW5m
by0+ZHJtX2luZm8NCj4gYW5kIGRybV9pbmZvIGlzIGZyZWVkIGluIGZhaWwgYnJhbmNoIGluIHhl
bl9kcm1fZHJ2X2luaXQoKS4NCj4NCj4gTGF0ZXIgZGlzcGxiYWNrX2Rpc2Nvbm5lY3QoZnJvbnRf
aW5mbykgaXMgY2FsbGVkIGFuZCBpdCBjYWxscw0KPiB4ZW5fZHJtX2Rydl9maW5pKGZyb250X2lu
Zm8pIGNhdXNlIGEgdXNlIGFmdGVyIGZyZWUgYnkNCj4gZHJtX2luZm8gPSBmcm9udF9pbmZvLT5k
cm1faW5mbyBzdGF0ZW1lbnQuDQo+DQo+IE15IHBhdGNoIGhhcyBkb25lIHR3byB0aGluZ3MuIEZp
cnN0IGZpeGVzIHRoZSBmYWlsIGxhYmVsIHdoaWNoDQo+IGRybV9pbmZvID0ga3phbGxvYygpIGZh
aWxlZCBhbmQgc3RpbGwgZnJlZSB0aGUgZHJtX2luZm8uDQo+IFNlY29uZCBzZXRzIGZyb250X2lu
Zm8tPmRybV9pbmZvIHRvIE5VTEwgdG8gYXZvaWQgdWFmLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBM
diBZdW5sb25nIDxseWwyMDE5QG1haWwudXN0Yy5lZHUuY24+DQoNClRoYW5rIHlvdSBmb3IgdGhl
IHBhdGNoLA0KDQpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQpXaWxsIGFwcGx5IHRvIGRybS1taXNjLW5leHQt
Zml4ZXMNCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyB8IDYgKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmMNCj4gaW5kZXggMzBkOWFkZjMxYzg0Li45ZjE0ZDk5Yzc2M2MgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+IEBAIC01MjEsNyArNTIxLDcgQEAgc3Rh
dGljIGludCB4ZW5fZHJtX2Rydl9pbml0KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250
X2luZm8pDQo+ICAgCWRybV9kZXYgPSBkcm1fZGV2X2FsbG9jKCZ4ZW5fZHJtX2RyaXZlciwgZGV2
KTsNCj4gICAJaWYgKElTX0VSUihkcm1fZGV2KSkgew0KPiAgIAkJcmV0ID0gUFRSX0VSUihkcm1f
ZGV2KTsNCj4gLQkJZ290byBmYWlsOw0KPiArCQlnb3RvIGZhaWxfZGV2Ow0KPiAgIAl9DQo+ICAg
DQo+ICAgCWRybV9pbmZvLT5kcm1fZGV2ID0gZHJtX2RldjsNCj4gQEAgLTU1MSw4ICs1NTEsMTAg
QEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9pbml0KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8g
KmZyb250X2luZm8pDQo+ICAgCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm1fZGV2KTsNCj4g
ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtX2Rldik7DQo+ICAgCWRybV9kZXZfcHV0KGRy
bV9kZXYpOw0KPiAtZmFpbDoNCj4gK2ZhaWxfZGV2Og0KPiAgIAlrZnJlZShkcm1faW5mbyk7DQo+
ICsJZnJvbnRfaW5mby0+ZHJtX2luZm8gPSBOVUxMOw0KPiArZmFpbDoNCj4gICAJcmV0dXJuIHJl
dDsNCj4gICB9DQo+ICAg

