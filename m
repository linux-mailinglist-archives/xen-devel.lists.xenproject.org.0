Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B572CA402
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42043.75582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5u6-0006RU-LR; Tue, 01 Dec 2020 13:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42043.75582; Tue, 01 Dec 2020 13:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5u6-0006R4-HG; Tue, 01 Dec 2020 13:41:14 +0000
Received: by outflank-mailman (input) for mailman id 42043;
 Tue, 01 Dec 2020 13:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk5u4-0006Qz-Nr
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:41:12 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3087181f-81f4-4539-bf22-67e71639a29d;
 Tue, 01 Dec 2020 13:41:11 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1De9E5007562; Tue, 1 Dec 2020 13:41:10 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0a-0039f301.pphosted.com with ESMTP id 355h93s75v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:41:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2660.eurprd03.prod.outlook.com (2603:10a6:200:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 13:41:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 13:41:07 +0000
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
X-Inumbo-ID: 3087181f-81f4-4539-bf22-67e71639a29d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZw6+RZPlBF3OrNaiyadUKKz6jAUbXJbPkFvILROusE9+hi7vDE0us5WU6XlYKkhzhu4f5amlqyVukjH3lmws2/lnj2hvrAH2W0nwcABbq4YCcw9P/5kiZI3DskJFsz6caNZzRAI3I6a+E08sAL+UKTSzj+IIE3aBqQf5iubNDvHPhtauEQTWGhsR7GXlvDyWC0EwLaykZTK00LCiHSPFBFGUOGvkdIFYPF29zwjELTR9mKCe97lbrSiSjU9gY3LiYpHzpGKFP/S82lPgcXFppMOFgBfG0a0vGw0nxJYwVA3Celzxh/HT9vIQ9G+dr9JOpaMymRQboV0mjazOVcVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x93Uu/FAUTn3WBeXtST/PfNW0jQRGU/1J8BCQm49iiA=;
 b=Pm96EyUkd3m2FYfQxHY15GqKYSwHPzZ+tSmA/SwP7Cgt882Qj+jvLGrRAfohM9GODMNEAZn0PoppehpSsadLg/E0UoOObOScIWO5CUbfhy3tucAailLpIM4p3OcZC5DlTwDI17R2dtIA7mpJt18hKK0d0VKw7FQbv1BdRDtp6YHCPOl7AMP2HeYhDZ+DXKILViKlXIqdEvIsPCMHwfJyZJLSCyJ8JwNj2A3iKrLhR76ztlH7JLmad3+TG4u6eSfWekBACinNUJfdQuTkxwc7z3rrQzPr0GTeBkAl9NyJtF+4j9F5/qbnJ5iA3PRRvH0SB1seCnft4I3w17z1OvYMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x93Uu/FAUTn3WBeXtST/PfNW0jQRGU/1J8BCQm49iiA=;
 b=3FeBjIi51+poHLcq3jed3X0ZYAw/TiKlbiHpEq+JrIIcbosmQkPgNdrxIAKTL2915D4cw8N2l3YfZGfxUHyShMZC/qfe5gLe1VQHmeLaIlYhA+ESENIXa8hN98YDfco10LEfhdZr28IXnr9pjitoZiFDjqLuapmOOzU3DGGInGy5KBJktOv+oppUNJHTJfdvOUjnON9k2oDY16VUmfc41Qfr6RiFgGas8iSY+CxOBnJGZfu4+bL3jkuAfhFb4OYkE1L+sMxUT87CfdPt8z9y6dVp3alZLxwfaRW2gY0BFJm4thORiAAiiIncG5gW7OPqnHmfU7+FtsfENW+I/BmVAw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 06/23] libxl: remove extraneous arguments to
 do_pci_remove() in libxl_pci.c
Thread-Topic: [PATCH v4 06/23] libxl: remove extraneous arguments to
 do_pci_remove() in libxl_pci.c
Thread-Index: AQHWx+eeThISOtcroUS+RdwYWSyffg==
Date: Tue, 1 Dec 2020 13:41:07 +0000
Message-ID: <9e535c83-b7a8-4e7e-169f-3a769abf86c5@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-7-paul@xen.org>
In-Reply-To: <20201124080159.11912-7-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 207cf934-cbb3-40c9-fe07-08d895fec184
x-ms-traffictypediagnostic: AM4PR0302MB2660:
x-microsoft-antispam-prvs: 
 <AM4PR0302MB266046DF951C2363ED87985EE7F40@AM4PR0302MB2660.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6xaTVmhi99CtLfya9brrO3+hRFW+1AhX0Z4qNWP0Y4LkiWnn4wZ4W3Jo78hEeTRhuBKiO3eOUEANPHohXB9jZfiypXqycB2TeuSWGSKK98WnHSIrDdghTT+Y8buocBar7aB9cspXdy1RZi4Lbem1QXxayDYIy69qZGtB5+TN+aGuYWU+m89A+mjkDgSGWxLWVxq/JyMNwIK8EWVd1UwAdJoT9v6dcAjXb9S8GFTpy6kMJr+zPzrdb/2RGO61R0dN/NvIJbSYeTejHSZG5+kGTPtBvHj6ACZm/meg5gfJAuFEnWEBMYBI08XzqwRQEbG8UyojChOQOPON9N6bIYxnYw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(31686004)(31696002)(8676002)(316002)(36756003)(4326008)(6506007)(53546011)(6486002)(83380400001)(54906003)(6512007)(110136005)(26005)(86362001)(186003)(2616005)(71200400001)(66946007)(66476007)(64756008)(66446008)(76116006)(5660300002)(2906002)(66556008)(478600001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?VlovMGtkVVRlaFVxa09mRmJlVzFhaXFZcGM0N1k5R1ZUdjJPOWNxbTRRLytW?=
 =?utf-8?B?NllFM0NMalhxRVdvSnlGVXBYZ0tUWHFSV0N0UkV3STZkemFocG9ZY0g3dUJ3?=
 =?utf-8?B?RmkrOWF3NU1kOE95TFFoRzRsck9NMVVuS0o1cGJXNHl0YnB0SXZSQXZvdkUy?=
 =?utf-8?B?QzRBTDgyeVJnYmp3UE45UHlQTEJCMWxoV29oWFFXZUh1RitzSmIvaW1PcUcw?=
 =?utf-8?B?WnRVRVBjelpvQVY5Z2w4eXpMWC9POVZMK01QaDlYaXBNOEk1K28yQmh6K3I1?=
 =?utf-8?B?SFN4bnphUDNQTHd0V0gydEVYNWx0bWlMV1d3SGc1S21yTXBpbWdjeGxRWGl0?=
 =?utf-8?B?YnRMSFhyMVdEMTJBNzIrMXNCNHNrRzJQK2NSb0c1VDFBd3F5WDFxK0I0ZlNI?=
 =?utf-8?B?VXVWZlQyMTE4V2VDL3JZdWlnaWl5bGsxZjZuZkJKRTlPWnBDdkZvWWU4TlNq?=
 =?utf-8?B?NE5nSFZDTFp4WWRpVXlMYmtudFVLSG8rMnhFMVRZNkpIalNoa3QzVmxSRWNH?=
 =?utf-8?B?N2dYMVQ2Nyt3VGtIOVRQKzZpYUlkT0d0NVY5YWtGQlpSa0JNY0hLbjdybmRY?=
 =?utf-8?B?UkhCTjBSTUZyQlBYRnV4LzFWc0hCUVp1S0pTK0dFSFIvL1VQaGdUZUt1WXlp?=
 =?utf-8?B?TlV6VWY3RlJ4S2FkN2tFbTdZMW00bVEzUGhPVG1lVzQzTEh0NnN6YTRoMks3?=
 =?utf-8?B?M3p6K0dhNU5JeGlsdW5FWHBLdlZ1eUhXVklaWXV0NlYzVTI4UGgzQ2FnakRC?=
 =?utf-8?B?bDdrdTRhdUsxSHEyL3pTOGtmT21kd1lzV2xuR3VWeEZHRUVUdGZuMHJCYkpo?=
 =?utf-8?B?WFZ6ZXhBRkpINVkvS2xhNlRRb2U1RlIvUlFBTnpyalNmYk5KdUNUQmhIWEZI?=
 =?utf-8?B?Sno1Yk5tQUNCU3hJRCtNMTlTSVJHNVZiN1o5U2YxMTNSMlZqTitXM2lsSkJB?=
 =?utf-8?B?eGt1QURiamozRVVOaFkrNWhpR20va1dQc3dZdmR6T0JITHlWUUgzV3YvN3Zy?=
 =?utf-8?B?YUNVRWhwc3FLeDBEUGFSVldZTUhhejVyRng5ZUd1QWtJa3BtN1BjR0RpRVBj?=
 =?utf-8?B?d0kxL0R1MXF6RmtYb0x0OUh4eFVqRVN1NE5PWm1tUGFZTWs3WkNCRUtLcnNG?=
 =?utf-8?B?SndENE1LRnV1cE9VV3RpSGxRVFpqa1FSQlJkYVJVY1IzcUxCcEZJV3o4R05C?=
 =?utf-8?B?QW5jeFhYRTJ2ckhXZFhGOThaY2UyckpnUXh0M0xJMTA4ejlmcmt2eWpsYjNt?=
 =?utf-8?B?OG5EVFhrK3I3dWlmam9pTk5MVGZxT21WVHkxd0ZJL2JJOUxkQXN1YytBYkcv?=
 =?utf-8?Q?5TnYTvwfFtUEwKUHa7EVmnNK8i1WFoOAsa?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C53D5757A0186449B1BC6EC8CBDC904E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207cf934-cbb3-40c9-fe07-08d895fec184
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 13:41:07.2969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tcZPQOQz1/h/qRILYCMpyYudD8jV/I9V65I5Xr6oKFvaITG4RTWcKAF6lpUcWjh2TvXLpAMn29q4QQ1YiExrPscn145yiTynqzvz2PzbhIEeYSI7azGuTQ30MKwa5y8N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2660
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_05:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010088

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gQm90aCAnZG9t
aWQnIGFuZCAncGNpJyBhcmUgYXZhaWxhYmxlIGluICdwY2lfcmVtb3ZlX3N0YXRlJyBzbyB0aGVy
ZSBpcyBubw0KPiBuZWVkIHRvIGFsc28gcGFzcyB0aGVtIGFzIHNlcGFyYXRlIGFyZ3VtZW50cy4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0K
DQpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQo+IC0tLQ0KPiBD
YzogSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+DQo+IC0tLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgfCA5ICsrKyst
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9vbHMv
bGlicy9saWdodC9saWJ4bF9wY2kuYw0KPiBpbmRleCBkZTYxN2U5NWViLi40MWU0YjJiNTcxIDEw
MDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+ICsrKyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4gQEAgLTE4NzEsMTQgKzE4NzEsMTQgQEAgc3RhdGlj
IHZvaWQgcGNpX3JlbW92ZV9zdHViZG9tX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPiAgIHN0YXRp
YyB2b2lkIHBjaV9yZW1vdmVfZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+ICAgICAgIHBjaV9yZW1v
dmVfc3RhdGUgKnBycywgaW50IHJjKTsNCj4gICANCj4gLXN0YXRpYyB2b2lkIGRvX3BjaV9yZW1v
dmUobGlieGxfX2VnYyAqZWdjLCB1aW50MzJfdCBkb21pZCwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpLCBpbnQgZm9yY2UsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycykNCj4gK3N0YXRpYyB2b2lkIGRv
X3BjaV9yZW1vdmUobGlieGxfX2VnYyAqZWdjLCBwY2lfcmVtb3ZlX3N0YXRlICpwcnMpDQo+ICAg
ew0KPiAgICAgICBTVEFURV9BT19HQyhwcnMtPmFvZGV2LT5hbyk7DQo+ICAgICAgIGxpYnhsX2N0
eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsNCj4gICAgICAgbGlieGxfZGV2aWNlX3BjaSAq
YXNzaWduZWQ7DQo+ICsgICAgdWludDMyX3QgZG9taWQgPSBwcnMtPmRvbWlkOw0KPiAgICAgICBs
aWJ4bF9kb21haW5fdHlwZSB0eXBlID0gbGlieGxfX2RvbWFpbl90eXBlKGdjLCBkb21pZCk7DQo+
ICsgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpID0gcHJzLT5wY2k7DQo+ICAgICAgIGludCByYywg
bnVtOw0KPiAgICAgICB1aW50MzJfdCBkb21haW5pZCA9IGRvbWlkOw0KPiAgIA0KPiBAQCAtMjI3
NSw3ICsyMjc1LDYgQEAgc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9uX25leHQo
bGlieGxfX2VnYyAqZWdjLA0KPiAgICAgICBFR0NfR0M7DQo+ICAgDQo+ICAgICAgIC8qIENvbnZl
bmllbmNlIGFsaWFzZXMgKi8NCj4gLSAgICBsaWJ4bF9kb21pZCBkb21pZCA9IHBycy0+ZG9taWQ7
DQo+ICAgICAgIGxpYnhsX2RldmljZV9wY2kgKmNvbnN0IHBjaSA9IHBycy0+cGNpOw0KPiAgICAg
ICBsaWJ4bF9fYW9fZGV2aWNlICpjb25zdCBhb2RldiA9IHBycy0+YW9kZXY7DQo+ICAgICAgIGNv
bnN0IHVuc2lnbmVkIGludCBwZnVuY19tYXNrID0gcHJzLT5wZnVuY19tYXNrOw0KPiBAQCAtMjI5
Myw3ICsyMjkyLDcgQEAgc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9uX25leHQo
bGlieGxfX2VnYyAqZWdjLA0KPiAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ICAgICAgICAgICAg
ICAgICAgIHBjaS0+dmRldmZuID0gb3JpZ192ZGV2Ow0KPiAgICAgICAgICAgICAgIH0NCj4gLSAg
ICAgICAgICAgIGRvX3BjaV9yZW1vdmUoZWdjLCBkb21pZCwgcGNpLCBwcnMtPmZvcmNlLCBwcnMp
Ow0KPiArICAgICAgICAgICAgZG9fcGNpX3JlbW92ZShlZ2MsIHBycyk7DQo+ICAgICAgICAgICAg
ICAgcmV0dXJuOw0KPiAgICAgICAgICAgfQ0KPiAgICAgICB9

