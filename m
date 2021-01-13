Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6B2F45AB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 09:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66360.117811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzb9x-0004P4-4p; Wed, 13 Jan 2021 08:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66360.117811; Wed, 13 Jan 2021 08:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzb9x-0004Of-1u; Wed, 13 Jan 2021 08:05:41 +0000
Received: by outflank-mailman (input) for mailman id 66360;
 Wed, 13 Jan 2021 08:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UfAT=GQ=epam.com=prvs=1647e6584a=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kzb9w-0004Oa-4V
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 08:05:40 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f2fd02d-83dd-4d97-8be5-aa9f69993814;
 Wed, 13 Jan 2021 08:05:36 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D80NTg013677; Wed, 13 Jan 2021 08:05:35 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 35y5er9fuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 08:05:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6770.eurprd03.prod.outlook.com (2603:10a6:20b:283::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 08:05:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::410a:a547:9838:afb8]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::410a:a547:9838:afb8%6]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 08:05:31 +0000
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
X-Inumbo-ID: 4f2fd02d-83dd-4d97-8be5-aa9f69993814
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bj8kDJOMqvBMIQtxqXlqSg7yGR3nDVlYfyireDRimf/FVGSzblFQQHYCe0v1aSSZ7tnwJxEaJVcWqh4XjOqOaVsqT/4ctSz2toU4cBTOddCGUSno+NgRPVSUwrfGVhCmW1PI+Djoqkof8jU3mPqiWSGnOBuTiXKhLgBXqpRZbmKDCEobKjwBvb33tHHLgW4J2+pSEzx+xkP4GgSEQvC2dTgV6TlGxZfGJGOMrdALf1wkS6D74iKxKYJ1osRE3/9ZOyx1ZcNQqpcMLdMmkc/Y5xtpK29cezhfKw3lPZxss7GUSEavBp34OaDgHN9zBvkdA8PQB+ds0z+XoJ5zZq2JvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhecnKv4fCGRqRyzYTZdWu2o+8OCJf5ZVcCQf+LetBE=;
 b=e5erF2My/LsamYBZI84Z8T6RY2oafMqiiq0CGmhbRKXtnAY2TPXlbqFVUv48SlV7k45myGNAZHkUVhaBKfQC1oiILouaWYDlzYSrgln0yLEP9aGNOfB6NWmrPWuEI64VjoSGo9gyahCkqFzi6k43qbXnDICvV/uWKUDX+8ZMjpCnVpwlnap52YPPYwxkRhkx8hpqJg2sGgYvwb+It5KbmMhZZOOWZSQ33Wb/Jy0+Af8BTT70h8DGQs/th/3/LTdlgCDWtNXPVmqdKnmkRWf8AfNouXDlftIFPNpCWGU17LR6hi4PDIBs1T/1hHl4CYn8ZQ9XQgblAWuOIyIM4/JF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhecnKv4fCGRqRyzYTZdWu2o+8OCJf5ZVcCQf+LetBE=;
 b=1u0ieUBMoJZlV1wYkTO6Drp52fBR0Ih8XSIM5ZsDLYPWRFhKJCYXqI1sdeP9SFurRyPSA1GYqojcnWKvQsbbb4RBZdu1AB1JrT+p7PmqW4Gs6Rbj0EDVb/zZXYQiXuML7MZmku/TSBFdxIRPN0yVewx4nrAdBfRBfZUtIa5n5IJUyh4flU3KchVg/RS8qL6eXoWgFWZPw0fz/x/eZPSehgQ7nSM9Z9abhkCMyGRqKyK1UlYBS0PYXihoa2+Aw6M1SNONvgAy2nfj0Q/Rof2pKcJPnIHUsC8FH3tYdlU7qZ2IS2afUyQWU+t9Q9yHSIRQB+zHGz8Jea4wM7+XkgR2uQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Paul Durrant <pdurrant@amazon.com>
Subject: Re: [PATCH v7 0/7] xl / libxl: named PCI pass-through devices
Thread-Topic: [PATCH v7 0/7] xl / libxl: named PCI pass-through devices
Thread-Index: AQHW6YLchVQ1ehvDkU6hSSsZCdqJ5g==
Date: Wed, 13 Jan 2021 08:05:30 +0000
Message-ID: <28193c3e-9bea-134c-878b-e04a93d793cd@epam.com>
References: <20210105174642.2754-1-paul@xen.org>
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7c9d587-eaef-467f-c017-08d8b799ff24
x-ms-traffictypediagnostic: AM9PR03MB6770:
x-microsoft-antispam-prvs: 
 <AM9PR03MB67709999D517292353B37EA2E7A90@AM9PR03MB6770.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 61YiUza+SZKxUt+ZBp1PFn5Pd1kb+110JhjtJrm8ER3FC9Y11QcndbQHAMPZKladnEUN2IBu6Xp5uZFK0yNM9rCRIRCBZD6epnKSCdjUGKsNUhi3CqYGgh0C4s+8EkBNEpFKLJR7KavlPcEm2l5P7wdK9VUevMSFJkDvCCnZdzuJFVxRn8ypJBwdcmPNtd44J8oA0ulexHAvKWJGFIuiQEmjU3Jewjf/UTgKsfYmbD5gMFylsOgRdUGy7zBHKdUc2X4mYtEBM6SmFaSG3/+Tm/NBQVLOIoisBZbwtJgsfItMVAHpbwylP+zQCrGOXzO0gYTNO7/ogTYKHIUxKiryq8IBA0GGvtmO3les3BDCh7zSxuJukkSk5qGQ+VKiwIC54IzKu7E7czLTJMIrFRvXcwk2aTojX4wdgouf07YmmoE8/053Jf9+mV98eOQUsSD5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(186003)(6506007)(53546011)(86362001)(4326008)(66556008)(76116006)(8936002)(26005)(66476007)(36756003)(2906002)(66946007)(66446008)(6486002)(83380400001)(8676002)(31696002)(6916009)(71200400001)(316002)(6512007)(5660300002)(31686004)(478600001)(54906003)(2616005)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aUFFYzBVK0NtQW5LdFI1L09wdmxoUUpBWUtCSUozcEowMUdFRzJEZkNMRGJW?=
 =?utf-8?B?VU9aaFMrRDZkTVNQZ1RuU1B5L1RFTjhLRUpKc3ZRSlNFWlQ5MEpOVk9LWSt2?=
 =?utf-8?B?OGtEVEtFeklQWmdWVXJ0a0hXT0RaU0ZNcmVtT1k5all1Z0Vrei9nUEpEMW03?=
 =?utf-8?B?T0ltR2NGSU95Q3owaXg0Yi91ZUl6cnVYZVRRL0tISWNoRWQxYStIeGQwdGdE?=
 =?utf-8?B?RXQrcEFmS3N1Z0JoNlZ6bTZXekxsTy95M2tGeXl3T3ZsT3lUbzdBejJSYlZG?=
 =?utf-8?B?ajF3Y0JneFFQYTVxZzBKdFdNSTd4QXRUMGROZkNNays0Yjk4cUliRVZmb2ph?=
 =?utf-8?B?VExjN1NzRW5rc0RiMWhsUzhkK2JramoxcmxEejJxMzZWVWdCZnV2ZTFxSGhk?=
 =?utf-8?B?azdDb1dVWkpKY0dDbUdYREdWd1NtTzk1aklyNzBqSXpWcTdtRGd5di9IMzNq?=
 =?utf-8?B?TU5sRmpqOHJQZ1JqSDdzTmNHempaakt3NHErK1JSbk03eExLMU9qUDhnNWo1?=
 =?utf-8?B?L25XanR3RHVHRzVoSE5JSGRKbW03KzJORUljY1ptZ3BUY2hjaE8zRForaTBY?=
 =?utf-8?B?b1dTZ0J3bmYwaHgwQ2l5UGNOYk9UU2t6WGVuWjA4NlB4UVpyVTNhZlNzUGVQ?=
 =?utf-8?B?VmhLcVA2Mzg2RDgwTDBKTGZWVjMvSytsZGdINURKRHFLaW9oTHRGcjVVZ3dF?=
 =?utf-8?B?ZzJsdU41MitCd2ExZXhPL2NDckdQSkxoOW9nRC9kY29qQUozdUlEdHhDS3FC?=
 =?utf-8?B?Q0Y1YUtIOTRVa2QvUlJzSlRycFRKcEVZb0dSWDE0SzJQQUxJMVczR01FaEZW?=
 =?utf-8?B?cndTZ0hZYW5aMkZWVURnK080WXRkUFl2SXVuaGNhcjFsVGZsZ2hwM0l6V2NB?=
 =?utf-8?B?ajhxZ3dsTmVOK3NwZ2xyN1M0U09zWldJUmNMeWJEMjNnN2xxeUpxZDd6bTcw?=
 =?utf-8?B?bTdXeW82QjFadjNlcjZ5Q3FqdFUvbTFBTUhkU2EyZ2lsK3pIV25JWUNwY0Vw?=
 =?utf-8?B?azI5dkZnYU9jY2cvUXZVZSthRmVMS1N2dXQxR1ZCb0cyVDgvVHZlRkMzYmJx?=
 =?utf-8?B?Y2xQRFVqbTNJMC9sTUI2dnpxQXY1eFpwT1J0NldnNVI4WjNweTBLRURWemIr?=
 =?utf-8?B?di9Uc09DdGN1MVR1TEprS3lxY1dGdEtWbFpHbFYwM1ZqUVd0aFAzZUpDNFpV?=
 =?utf-8?B?QUVUQ1paak5DRGxyaDQ5MEtsU1BncG1MNXcrT0F4VHlNb21SM3BaTCs0WDdp?=
 =?utf-8?B?cERQM0grVU9qZEFsU01WMDNmRmdoR0swWmFpaHhhdVBTWHFaOS9QM0oxRUZa?=
 =?utf-8?Q?ZUkqMk0aaGQ0zV8bTQUwIlqaz8YZ4cwuvX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE7CBE7CA96B4D4CBA63880D5248FCF6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c9d587-eaef-467f-c017-08d8b799ff24
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 08:05:31.0487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FBiCMdCfvg36rtZrqrCwHEjxXMtjypZQ5g8qa6DJC7b/OhhiDyIcxIS0etZYeOKfLNeZPBk9bVdrjeR9y1JreymSjYqJRDum8Wxj3s5J7Cg4bgPibbOmYufWCBOO63bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6770
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130046

SGksIFdlaSENCg0KSXMgdGhpcyBzZXJpZXMgZ29vZCB0byBnbz8gQ291bGQgeW91IHBsZWFzZSB0
ZWxsIGlmIGl0IGJyZWFrcyBhbnl0aGluZz8NCg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQoNCk9s
ZWtzYW5kcg0KDQpPbiAxLzUvMjEgNzo0NiBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBGcm9t
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+DQo+IFRoZXNlIGFyZSByZS13
b3JrZWQgdmVyc2lvbnMgb2YgdGhlIHJlbWFpbmluZyBwYXRjaGVzIGZyb20gdjYgb2YgdGhlIHNl
cmllcw0KPiB0aGF0IHdlcmUgcmV2ZXJ0ZWQgYnkgY29tbWl0IGFjNmEwYWYzODcwYiAiUmV2ZXJ0
IHBhdGNoZXMgdGhhdCBicmVhayBsaWJ4bA0KPiBBUEkiLg0KPg0KPiBQYXVsIER1cnJhbnQgKDcp
Og0KPiAgICBkb2NzL21hbjogbW9kaWZ5IHhsKDEpIGluIHByZXBhcmF0aW9uIGZvciBuYW1pbmcg
b2YgYXNzaWduYWJsZSBkZXZpY2VzDQo+ICAgIGxpYnhsdTogaW50cm9kdWNlIHhsdV9wY2lfcGFy
c2Vfc3BlY19zdHJpbmcoKQ0KPiAgICBsaWJ4bDogc3RvcCBzZXR0aW5nICd2ZGV2Zm4nIGluIHBj
aV9zdHJ1Y3RfZmlsbCgpDQo+ICAgIGxpYnhsOiBhZGQgJ25hbWUnIGZpZWxkIHRvICdsaWJ4bF9k
ZXZpY2VfcGNpJyBpbiB0aGUgSURMLi4uDQo+ICAgIHhsOiBzdXBwb3J0IG5hbWluZyBvZiBhc3Np
Z25hYmxlIGRldmljZXMNCj4gICAgZG9jcy9tYW46IG1vZGlmeSB4bC1wY2ktY29uZmlndXJhdGlv
big1KSB0byBhZGQgJ25hbWUnIGZpZWxkIHRvDQo+ICAgICAgUENJX1NQRUNfU1RSSU5HDQo+ICAg
IGxpYnhsIC8gbGlieGx1OiBzdXBwb3J0ICd4bCBwY2ktYXR0YWNoL2RldGFjaCcgYnkgbmFtZQ0K
Pg0KPiAgIGRvY3MvbWFuL3hsLXBjaS1jb25maWd1cmF0aW9uLjUucG9kIHwgIDI1ICsrLQ0KPiAg
IGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgICAgICAgICAgIHwgIDE5ICstDQo+ICAgdG9vbHMv
aW5jbHVkZS9saWJ4bC5oICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgIHRvb2xzL2luY2x1ZGUv
bGlieGx1dGlsLmggICAgICAgICAgIHwgICA4ICstDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4
bF9wY2kuYyAgICAgICAgfCAxMzMgKysrKysrKysrKysrLS0NCj4gICB0b29scy9saWJzL2xpZ2h0
L2xpYnhsX3R5cGVzLmlkbCAgICB8ICAxMyArLQ0KPiAgIHRvb2xzL2xpYnMvdXRpbC9saWJ4bHVf
cGNpLmMgICAgICAgIHwgMzUzICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgICAgICAgIHwgIDE2ICstDQo+ICAgdG9v
bHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICB0b29scy94bC94
bF9wY2kuYyAgICAgICAgICAgICAgICAgICB8IDEyMCArKysrKysrKy0tLS0NCj4gICAxMCBmaWxl
cyBjaGFuZ2VkLCA0NTcgaW5zZXJ0aW9ucygrKSwgMjQwIGRlbGV0aW9ucygtKQ0KPg==

