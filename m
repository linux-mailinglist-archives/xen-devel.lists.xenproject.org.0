Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574D3230BB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89061.167501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEcQ0-00045M-8g; Tue, 23 Feb 2021 18:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89061.167501; Tue, 23 Feb 2021 18:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEcQ0-00044x-5N; Tue, 23 Feb 2021 18:28:20 +0000
Received: by outflank-mailman (input) for mailman id 89061;
 Tue, 23 Feb 2021 18:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2t=HZ=epam.com=prvs=2688306719=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lEcPy-00044s-A0
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:28:18 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7607a04c-8cca-4efc-8de6-fdeb4f9a10fb;
 Tue, 23 Feb 2021 18:28:17 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11NIPTqI003841; Tue, 23 Feb 2021 18:28:16 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 36w1dahe8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 18:28:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6770.eurprd03.prod.outlook.com (2603:10a6:20b:283::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 18:28:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55%8]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 18:28:13 +0000
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
X-Inumbo-ID: 7607a04c-8cca-4efc-8de6-fdeb4f9a10fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e01GgD9JiBHAfiY38eTuBe+lADk+5BHvRCLuDdyxGutesVuV3mAhTcXTK+bmk/TVKkjQ2w4kxGtXihOY7vHWrvunKSIgUdEoq/lROQ5ZbKzW6t+IhODK6oOIDlvbGy4dK74wQEgXY21o6if1C2YojvbuuJE0Rm/6ZNFQe4Gpoc6khD4ccKTAUlbkoesGZvsQO8Wx6Uz4usIVL4qSuJ+DK2KqN5ea9wycGegLbkHyMDbb1PlhpgYGHWs/7XvofvhShpY6EDQaGgSWnEBJCsS/nckcVrY2/iUjzOVP6fSgz8ebq39qtYgHiVouNQOWhFpqvQg8JsJ2HfahzSxohq4P0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd2K5q7SKiHvqYeyLcJ9WLE9Sw2vdyG4fRh7sv0bBgo=;
 b=irBPftfn/j/RzMSb3lNuxf6mE34DzEE+U2sxMJTYJJEmK+RCQiQ3Ap514OVhQsxTm+7dbBWbTIbwwYWrL7z3UtwWOJ4SYPdq7K7CPgo+51nDxwPwKbJ67ntBJ7hAuTeFWaq0lJqQ2F+EInorfN/YeVJGXzArOmB2U1uxrO8BzT2D+E1W5n4AHQPYUN3p+w0WCqfWvOpQVBtM4kJ6l9GF3glBdjpcN66tZKSHi16Fr7j+jZtBHndOxwED487pV5dncs8RrL2/Ml7Lq5sXMdZQhjHYgWCvMjpLfa1Sq5eb6HKjb7DKaKbN+vXix7u3b5qiHwIjfDSMfe/jSu/uZymuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd2K5q7SKiHvqYeyLcJ9WLE9Sw2vdyG4fRh7sv0bBgo=;
 b=AjCH5cM8oazod6exaG1RuhbOifik0/swMkT33zAPSysCP3Jj3lYxjOKvDtyyx6LHIwW9Xb83a7UWDrZ/WGpbx6pU7xgHC9t4xsZeYkhN3DXGVgG8cvTt0uk48/+te+ztNU2ctnL2ycpAIhF6nYs6kj8UfeaD1qqDOCe3bnH+mY/xWl1bsDH+vtEZNS+ABoblR/GLdfNfJEhzUYSbB0R8w/acdnqA2n5EELVAJGJPwWFWOr99DlUg/YjJn5y+kp1+FRghhoDhHMrDDEIns0hjU9TTdON+Wi/DWnq0KbYZrHlt8O9Xm4i6BH7CjZJeyeS2v3Ng9CPFeaCmrVuOnKp01Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
        Boris
 Ostrovsky <boris.ostrovsky@oracle.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen-front-pgdir-shbuf: don't record wrong grant handle
 upon error
Thread-Topic: [PATCH] xen-front-pgdir-shbuf: don't record wrong grant handle
 upon error
Thread-Index: AQHXCgCim25QM03ANUywDJtpwJ6UVqpmD0iA
Date: Tue, 23 Feb 2021 18:28:13 +0000
Message-ID: <75c64c79-7458-19ca-1346-4c0e090cf0f7@epam.com>
References: <82414b0f-1b63-5509-7c1d-5bcc8239a3de@suse.com>
In-Reply-To: <82414b0f-1b63-5509-7c1d-5bcc8239a3de@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af7594ee-f3d7-4c51-84d3-08d8d828c802
x-ms-traffictypediagnostic: AM9PR03MB6770:
x-microsoft-antispam-prvs: 
 <AM9PR03MB6770322F938C3E585A75E684E7809@AM9PR03MB6770.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 48gUV7jOsnfGHqJPLR8jjdmCWQc9VBwbMDAKX2zTHMbc+dBHXeOFyOswDIG4SFto6/QcvblS9kOicNQwoqLIC+9QnbmCxGlBpQRMijSDlVrYXOUt2xNG2PR9VrlLRlk1Jw2uaRmYM8rZ3QsqaHxfz8DtfKZHtvnwMx2Km/prKQ0wTUWY7iA1mwxexqe2Fma/PdBQWXdwDQmy4E1R23ARowwexBdT/Ov0TS/nH+7cJhxs79ew3vg6VvIsBbOY1r0eNDjzKt3O2SE2PW7k9a9QJZu/sERMbcUFwA4fY1JQUBide3Qz0DJtRZWzoItrppOcZqEKUU3DEdU7H5V8XMauYIPbbbdR7rvhv2EBSFWyF8wDXDqYLm6wqYAMlshzyEKC3rXrabK/namuFS1NupPgJpd5yQSWFKgdJKwa4l6cdeMNZis2Lt5f7uZpXB0VoaZrnZh19aJ0q5APnafbs8p8cnnpV16m4fwrMswobcTVfq9m413p+WxrDPZ1VPmgR/Hx90+wH6sG0idM1kPlouX2+gh5FfZOSlQmHBY+vZZ4EC6s7Q8QsEuY1a2AWla5t1riR3F68ZWDUI77weLlYXHvow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(366004)(396003)(376002)(76116006)(8936002)(66476007)(6512007)(66556008)(83380400001)(8676002)(66446008)(64756008)(66946007)(86362001)(6506007)(31696002)(110136005)(2616005)(316002)(4326008)(478600001)(6486002)(53546011)(71200400001)(36756003)(2906002)(5660300002)(186003)(31686004)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?NzZqSE5OcEJiQ0VDL0prVlpPTys5bGhkaHR2aXJiMERHOEhVcytvVEExWWYw?=
 =?utf-8?B?K3pxOWtuZ25tam5vakwxTHdOWTNEbW4xWG1IT0R4MGJ2blEyQlJjLzRhMEhQ?=
 =?utf-8?B?dlZRdmdoVXluRkhZV08xQnRzclZWYkdSc2liUFBCY3RpZHRmN2VIenFYeGZs?=
 =?utf-8?B?RUl5cVdseEtNVWVwTEpNQkZIeklUeEtQeXFPdDcyallCdVRzZFZUUkZGVFVt?=
 =?utf-8?B?ZDcvVmpnR05uU0ZTbU94T2w2a3NYUTF1QlMzTkIxRFNyMFBnVWl3ZHlldm5B?=
 =?utf-8?B?TUdWb0dhdEdGMWphTTZMbVF4QjRuUkxvOWIwNUVXNUdMRFJhNmFkYnFxR3c2?=
 =?utf-8?B?WlAvbEdNTDBDMEcwa290Z2ozaFdMT2R6QnQ1dEFkYnRUSnFKaXVxM0Z3NVdz?=
 =?utf-8?B?Z09KUVFFNUlWOG8vcWNMekZtbStBeGJ3T1ltZHRReUhiU0R6aVNDYlloZnY3?=
 =?utf-8?B?bFJaN2QzUHltUStlbWlNSVFCbzR1ZW5aT0ZWNy85ZEx6YU1JaFEzSDg5Zm0x?=
 =?utf-8?B?OUN5Q1k3SjZxbDhIUlMxekxzZzkxUlJyQ3hIVENiWEs4cmFwcFZKbWtLRWs0?=
 =?utf-8?B?dk1FK1MrRUJmSEVtMHBsMGZDazA2RXFWdWRVWmREd2FEZys1aSsrU09IMlBr?=
 =?utf-8?B?ODdENXhGczAvbTFzcDMxSGU1YkhMNWJUMHp3SE00cU9FVEFkTHVsbGxGeTB5?=
 =?utf-8?B?K05kdlpFN2VjbHU5WWxsTjU1UlhNdDVtVWd0MjRRQjVJNFQ1ZzNPNXgxU0Qr?=
 =?utf-8?B?U3h6aTc2RW9abzF6dkJQU1JHVW0xT1lybEhXTEM0cm1tVWhXVkIyVVdMTUVI?=
 =?utf-8?B?MXV4R0tCaTZsTlVxQXdWT1FkWTdIZ0o5NXlzemFqMUJjY3BNOGJpZFU5eG5Y?=
 =?utf-8?B?dGU0OXVjeGFrSEd1cW1IS3dFY2tLaS90S2o2dVZoaE1IcEJLT3BjZDdleVJO?=
 =?utf-8?B?WTRIb2w3RkRNVjh4OFFoeFFKWFR0S2dlQVNra0tmUVEwSEdteFNGcXo4Z0x3?=
 =?utf-8?B?S25vSDRnblFYY29LRTA1S09iRTFJZzdyaDFCYXdnSmVsV2UxRWR0VVZoZ0Z0?=
 =?utf-8?B?Uy8rZ050VW5IK1RVV0VGUW1nOWhONE9CVmNCNXpHMS9LcUdEeUxETUpmUjVi?=
 =?utf-8?B?SVhxUVFEZjhoK1FOM0FiRERrdGFGR0FrdktxY3pIakdPc3B1b25Pd251dmVs?=
 =?utf-8?B?Z1FsTGFJMFpQai93ZUVoQzZ5KzhWU1djZWNnQThwcjJvRHVJejY3emRMZ2NO?=
 =?utf-8?B?ajVtRFBFVzI3ZkRuOWFFcVV3Nnl0Y1k0NTZVaHp3c00vYktTbkNITUZNd2wx?=
 =?utf-8?B?dVRZTGEvdVZuMTk4QlV6eVhnY3RrcW9xS0huRk96U24xdSswN2FkNnlocFh3?=
 =?utf-8?B?c1Y5c1JaMFFJejljVlhNZG1nVDVZUjV2WGxYMTV4WERnei9aYzNIQm5HL0NI?=
 =?utf-8?B?ZFJmK0Rvc21ld1MwNExxMG5PSkF5SUhpRXBtQmJUdEVSMUozZlppNXRrY2lC?=
 =?utf-8?B?THpwZll5OHcyQjFsY1BkdUtUZFpFU3FBL25CTVBkbjRpY1V2L2JFY0lMQk5F?=
 =?utf-8?B?NjcrTXVQNURqeTFHakpLM1VjeVhJOGlSeng2ZEdGc2g1MG1EMmR0MzR5U0ZW?=
 =?utf-8?B?VjYrdnl6L0QrRlprNFJ5TXpuUCs3ZXVIV05BVnlxR0lvY3NEb2Vpa3ZXbXJ1?=
 =?utf-8?B?N1FwL2JHWTN2ZmFvS3g1Ui8rT3lRZG16bGlCSStSNTRwWmdTREFLR2YxYzlJ?=
 =?utf-8?Q?2HsIQlwVPDoHPZyOXZkCwwBfXsS5TeYOon939SM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A99F573C88B1C488C092203746DC84A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7594ee-f3d7-4c51-84d3-08d8d828c802
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 18:28:13.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGPd/sjA1UJurCwnLniwA4rq0g2WrsSKtFEN4POOVVPbhS/csZAl0qXq3BcrS0VARNMT5qa7bBGWyfiSn4Gmr6lgBfeZTbnt6rFDPf3DGDPGu/b0O3X1iDV4DQ7JOhqp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6770
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230154

SGVsbG8sIEphbiENCg0KT24gMi8yMy8yMSA2OjI2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
SW4gb3JkZXIgZm9yIHN1YnNlcXVlbnQgdW5tYXBwaW5nIHRvIG5vdCBtaXN0YWtlbmx5IHVubWFw
IGhhbmRsZSAwLA0KPiByZWNvcmQgYSBwZXJjZWl2ZWQgYWx3YXlzLWludmFsaWQgb25lIGluc3Rl
YWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NClJldmlld2Vk
LWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+IC0tLQ0KPiB2MjogVXNlIElOVkFMSURfR1JBTlRfSEFORExFLg0KPg0KPiAtLS0g
YS9kcml2ZXJzL3hlbi94ZW4tZnJvbnQtcGdkaXItc2hidWYuYw0KPiArKysgYi9kcml2ZXJzL3hl
bi94ZW4tZnJvbnQtcGdkaXItc2hidWYuYw0KPiBAQCAtMzA1LDExICszMDUsMTggQEAgc3RhdGlj
IGludCBiYWNrZW5kX21hcChzdHJ1Y3QgeGVuX2Zyb250Xw0KPiAgIA0KPiAgIAkvKiBTYXZlIGhh
bmRsZXMgZXZlbiBpZiBlcnJvciwgc28gd2UgY2FuIHVubWFwLiAqLw0KPiAgIAlmb3IgKGN1cl9w
YWdlID0gMDsgY3VyX3BhZ2UgPCBidWYtPm51bV9wYWdlczsgY3VyX3BhZ2UrKykgew0KPiAtCQli
dWYtPmJhY2tlbmRfbWFwX2hhbmRsZXNbY3VyX3BhZ2VdID0gbWFwX29wc1tjdXJfcGFnZV0uaGFu
ZGxlOw0KPiAtCQlpZiAodW5saWtlbHkobWFwX29wc1tjdXJfcGFnZV0uc3RhdHVzICE9IEdOVFNU
X29rYXkpKQ0KPiArCQlpZiAobGlrZWx5KG1hcF9vcHNbY3VyX3BhZ2VdLnN0YXR1cyA9PSBHTlRT
VF9va2F5KSkgew0KPiArCQkJYnVmLT5iYWNrZW5kX21hcF9oYW5kbGVzW2N1cl9wYWdlXSA9DQo+
ICsJCQkJbWFwX29wc1tjdXJfcGFnZV0uaGFuZGxlOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJYnVm
LT5iYWNrZW5kX21hcF9oYW5kbGVzW2N1cl9wYWdlXSA9DQo+ICsJCQkJSU5WQUxJRF9HUkFOVF9I
QU5ETEU7DQo+ICsJCQlpZiAoIXJldCkNCj4gKwkJCQlyZXQgPSAtRU5YSU87DQo+ICAgCQkJZGV2
X2VycigmYnVmLT54Yl9kZXYtPmRldiwNCj4gICAJCQkJIkZhaWxlZCB0byBtYXAgcGFnZSAlZDog
JWRcbiIsDQo+ICAgCQkJCWN1cl9wYWdlLCBtYXBfb3BzW2N1cl9wYWdlXS5zdGF0dXMpOw0KPiAr
CQl9DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKHJldCkgew==

