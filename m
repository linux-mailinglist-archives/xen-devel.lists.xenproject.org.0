Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B32D0D27
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46012.81611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCxg-0007gw-A5; Mon, 07 Dec 2020 09:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46012.81611; Mon, 07 Dec 2020 09:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCxg-0007gX-6x; Mon, 07 Dec 2020 09:37:40 +0000
Received: by outflank-mailman (input) for mailman id 46012;
 Mon, 07 Dec 2020 09:37:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYzf=FL=epam.com=prvs=0610b02f0e=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kmCxe-0007gS-P1
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:37:38 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f98894c-6622-4160-a392-5e4eb229037b;
 Mon, 07 Dec 2020 09:37:38 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B79XZdO005550; Mon, 7 Dec 2020 09:37:32 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 3583g5k1gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 09:37:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2196.eurprd03.prod.outlook.com (2603:10a6:200:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 09:37:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 09:37:29 +0000
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
X-Inumbo-ID: 4f98894c-6622-4160-a392-5e4eb229037b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN38E0pZUJB/PFsHt/oCnfnjh8lfjWFR6xMNHgA2CK63qFtiUSG4ezzxz+6ngm9k/FC8BwnU5FwEAqbpKIA1CqwDMp2eLf7eiAq+SMqpddmYzinfQptU54aftzyZwLrqRp3AKlDSSj8nhQFeWOQS1CFaxBEAXn/kWlTk+oBCIvM/8QitWZTa91jfFvxlx5x+NmzciHSkLOVNFAMOj9UN8884YDfJ2ZNY/cRatm3VzgmuXrHMYk9D5SUx7D+uAZ/Tyh65NfYHG5+ob3oi3yTRWYxyXTXlh+vBUftCOtaDMA/A6sPD5kU28nsjzlvpX7tWkHOUq8xeGUxF6+P5hwT1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTLcE0GIJgeLOO7/j6fHvOiyBigzz/3CQWCEoJOdosw=;
 b=jSb0RwsvYo8ARbnsKzmuZPoWuOzjYeNDrrWQcPPHSjEsbbZC6Qk4XM5SKSTA1oY/HpOZ8hs5Cr7jvbwxM8yvxj7OTqp25yTZ207BVvdkk5DwyNkADQBFVq2gtXU7xhy+EG+Q6F8EOT/Pcw9XzFDzp2NhaajPUqTDh+6MdQrOohIS7g0/kAAu/8KYt1YP4hfOWTKsjaRfs6Woo9XGhGoLtXeq+ViXK744jCwfxzl0BQ7Gqt5jhzQ1/TMi+PlY9S+YxGQ45phs/LL1OvELO+4T886sfI7WYj4t+yrd58kL801XaEKfRliPOPyM3U/N83az3eHW4t1qG+EbwvOAapEjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTLcE0GIJgeLOO7/j6fHvOiyBigzz/3CQWCEoJOdosw=;
 b=RTQ0rXwCfFWrUy3NiZoguApSyUdkjy5o080ym8VNaN7z6nPUMchMLp2EqBEpkwfy3t+LD2AIGQjd5oQChc6R4Gbbh2ojMTzN5zw2F+04Sevc3a0A5SI0Sr3uD0rfasKu9gfXrueVJPkcse8xIuJTCASEFkATp5AqxhGVxMnpcjS2XRGdHsZpujT5qFcbNRqA/sskRagAwhQyd+zl4P6ib7hYx1poG1I+ue+C4JQFYVbcWzhZW+HTWTcTGA8FAtcp28Tglq95YWi6Ty46Q3L+WzWxdT1zNmSr2ONKoxihPJYZ0jCypgr/xqLWBwxMYMOdXyKBZf+vh+GmRirNOJTdng==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAIAAAYQAgAABxICAAAHUgIAg/YsAgARU+oCAAAZpgIAABNqAgAAChwA=
Date: Mon, 7 Dec 2020 09:37:29 +0000
Message-ID: <d04bf141-d263-edfd-2110-f52bcca19411@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
 <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
 <802e20d8-82b6-5755-e6e5-aadb07585a32@epam.com>
 <b631c122-554c-e26e-4fa9-56809dd5569a@suse.com>
 <8913ce50-1b51-36f6-36b6-7e09d9553df9@epam.com>
 <eed78fed-159f-3ee3-5eec-9384e52406bf@suse.com>
In-Reply-To: <eed78fed-159f-3ee3-5eec-9384e52406bf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf97b6e-1dfa-4134-9b00-08d89a93b6ee
x-ms-traffictypediagnostic: AM4PR0301MB2196:
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2196C5D97C115522863FA84EE7CE0@AM4PR0301MB2196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C3UdnmIhAQkB7zacJf4yCjEUkqsiV1fGB4E5lZL0toQ8QydQK/zhz5abUnO0w9AYK8fsIoUXETeWactc2ykPL3kVjWunoUrrqNS6eq2IIhbbbMc6YR3G3gahAgA/3C6gEKp8wczqvCyzKxVew17JqfrLGoNq6+K4QyJYzOGzsC9DXSo/0e/gk+Zq6y15M3Ws/fVT5e93q6o9Nv33G2VKaZF7vKuN+6U+DCuuVo34dX0ykH2AAoPdO407yJsjNAu2QLuD/+CqEoJ9vB4EWOAb2xlMnwsN1EF+BDeXyyotjT2hZDH9gaNEsuMVsK13AgvBC6BcWOooK3NceZmdnJWqOUu93v4hAWJwXddBRzppRH8QEJAarj4HbE4kaCGZuGDA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(7416002)(6486002)(478600001)(2906002)(66556008)(86362001)(31696002)(83380400001)(66946007)(76116006)(71200400001)(31686004)(66476007)(316002)(36756003)(2616005)(53546011)(66446008)(8936002)(26005)(5660300002)(6506007)(186003)(64756008)(54906003)(6916009)(6512007)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?Y3F6U2FScHptMEl5cTF6ZFRiNi9iOW5mazlIeVEvZ1UrYW05aW9HdWp1OVZn?=
 =?utf-8?B?VDROWjBGanJ3aEo1RHZMSkVJTGFVMHNDY3B5bmtnWlZtL0tFOTllVkZYNUF5?=
 =?utf-8?B?aHNMcC94blc4WXRlaC9qRGo3ckpabTl3QlpXRWxkR1hZUkhJUEk4TURPZ0ZY?=
 =?utf-8?B?VFVTZlBOdThLcWpaMHpoUjR5TktyRlQyWjhFVFIwODg2U3Q4eDBMWGo5bEJj?=
 =?utf-8?B?VUhUYzlEQ1F1Yko2bDZJSFRxOG5kREhOYkxvV1loeTU1aFIybEpHNFhlRFds?=
 =?utf-8?B?aWFhRGkybXpSZFB2T1E3QkxCSk56cGtUL0FBYnI5Zlp0bER0MDJ6bHBtREo2?=
 =?utf-8?B?RnBPRzRlZEUwTXY2N1VmQUN0eGFtMmFEcDRKTTAxcmpVY3hlWUpYM2tWTWd2?=
 =?utf-8?B?QjhnRXpPUmdOZ1ptZjNwSXl4b3NFQTFKeVFiaDJLSEVqUkQ3UmtTZ0pzSHp5?=
 =?utf-8?B?M2U1ZWFCYWNYRlBvRXpIQUc4ZzJDSzB1eFU0Y09DZTdZUHkxT2lNRE51UU8w?=
 =?utf-8?B?dHloekxUYy9sTHhmYmhic0hZbWpYMFdWK2x6Q0lKaGRyMXk5dWtIcm1SVUY5?=
 =?utf-8?B?S3A1Y2xTaWZUdzJnQnpVUXJIR0EybjRoMFpIcG5yR0Y5YUFpcTBNRndBa2dS?=
 =?utf-8?B?RG1hSlNmcmNEbFVMemJQWXBmbEE1U24wOXBob2pLUkVrelhpUnNtTVdZRUNP?=
 =?utf-8?B?UnVBTm5KNEFROHE3YmVMYjN3VlptVng3c0UxYmlmckxWNEJhSXNIbjNYK0V6?=
 =?utf-8?B?cUNtRkxNS2kwN1F4eGlUWDJVUzZHc2ptSUZiU0EzYVRqd1dWcHArbFVnT0dy?=
 =?utf-8?B?cFJwazlYaEhlUmM1eDg4bVZLNDRMbFM1dktuMG9ka1ZNTW5KeitUSVhaY3lF?=
 =?utf-8?B?S1JUaVVjS01DbDI4WG5kSkhuc2VOYTdYZXJVYTN3TW1ZZUNBTkRNZXVDVzY1?=
 =?utf-8?B?eWNlQTVmMkdSQU1sTTcwZGhFb1JvYzZrc25LVFJFMTZDVUg4SDVQajNFMUdS?=
 =?utf-8?B?d1VVN0hkOXI2V3BENUN4Qkx1aHo1S1hNeUdNZWxMNVNsanVTTlJLUGp3SWFz?=
 =?utf-8?B?cE4yVjRCcjlvWlNabWhhcFFBS3JzNEVPWXRqU0tpVlpZZVB1QVNQMlJ0ZldS?=
 =?utf-8?B?bkpUcFNVVFBXRENDY0hYRGZmU0JzNEV5MEY2MCt5djdoRkdMOVJITTBIbGNn?=
 =?utf-8?B?VWNKZThJTmhVbTZPK29TVWI3ekxDY0pWOTF0ZlArNGJrNWFQT29qbmg1OEpI?=
 =?utf-8?B?SHJYWnEvbWN4NHBYTTA1a1FrZlRBSzE3c0FObjRESVJnRUJkMGREK1BlYWxL?=
 =?utf-8?Q?7m7r7dsRNvvrug+2xICpDHG/9fzPYmSbJC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <21A53457A0BF0E4BB7A504009473532F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf97b6e-1dfa-4134-9b00-08d89a93b6ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 09:37:29.2089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1d44YgmRpt8y3q/w3zVPosX91bsHwmoT1M+FX/u34RWcYEIaayM3N0RXUBf2eOrJlqFJa11xHSZblOribKKcZ11J9ytiLGU2ok3pz/+fXjgzwedbX1RzJxOAczR4vVr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2196
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-07_08:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070060

DQpPbiAxMi83LzIwIDExOjI4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMTIuMjAy
MCAxMDoxMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMi83LzIwIDEw
OjQ4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNC4xMi4yMDIwIDE1OjM4LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEvMTMvMjAgNDo1MSBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxMy4xMS4yMDIwIDE1OjQ0LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxMS8xMy8yMCA0OjM4IFBNLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4gT24gMTMuMTEuMjAyMCAxNTozMiwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAxMS8xMy8yMCA0OjIzIFBNLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+Pj4+PiAgICAgICBFYXJsaWVyIG9uIEkgZGlkbid0IHNheSB5b3Ugc2hvdWxk
IGdldCB0aGlzIHRvIHdvcmssIG9ubHkNCj4+Pj4+Pj4+PiB0aGF0IEkgdGhpbmsgdGhlIGdlbmVy
YWwgbG9naWMgYXJvdW5kIHdoYXQgeW91IGFkZCBzaG91bGRuJ3QgbWFrZQ0KPj4+Pj4+Pj4+IHRo
aW5ncyBtb3JlIGFyY2ggc3BlY2lmaWMgdGhhbiB0aGV5IHJlYWxseSBzaG91bGQgYmUuIFRoYXQg
c2FpZCwNCj4+Pj4+Pj4+PiBzb21ldGhpbmcgc2ltaWxhciB0byB0aGUgYWJvdmUgc2hvdWxkIHN0
aWxsIGJlIGRvYWJsZSBvbiB4ODYsDQo+Pj4+Pj4+Pj4gdXRpbGl6aW5nIHN0cnVjdCBwY2lfc2Vn
J3MgYnVzMmJyaWRnZVtdLiBUaGVyZSBvdWdodCB0byBiZQ0KPj4+Pj4+Pj4+IERFVl9UWVBFX1BD
SV9IT1NUX0JSSURHRSBlbnRyaWVzIHRoZXJlLCBhbGJlaXQgYSBudW1iZXIgb2YgdGhlbQ0KPj4+
Pj4+Pj4+IChwcm92aWRlZCBieSB0aGUgQ1BVcyB0aGVtc2VsdmVzIHJhdGhlciB0aGFuIHRoZSBj
aGlwc2V0KSBhcmVuJ3QNCj4+Pj4+Pj4+PiByZWFsbHkgaG9zdCBicmlkZ2VzIGZvciB0aGUgcHVy
cG9zZXMgeW91J3JlIGFmdGVyLg0KPj4+Pj4+Pj4gWW91IG1lYW4gSSBjYW4gc3RpbGwgdXNlIERF
Vl9UWVBFX1BDSV9IT1NUX0JSSURHRSBhcyBhIG1hcmtlcg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IHdo
aWxlIHRyeWluZyB0byBkZXRlY3Qgd2hhdCBJIG5lZWQ/DQo+Pj4+Pj4+IEknbSBhZnJhaWQgSSBk
b24ndCB1bmRlcnN0YW5kIHdoYXQgbWFya2VyIHlvdSdyZSB0aGlua2luZyBhYm91dA0KPj4+Pj4+
PiBoZXJlLg0KPj4+Pj4+IEkgbWVhbiB0aGF0IHdoZW4gSSBnbyBvdmVyIGJ1czJicmlkZ2UgZW50
cmllcywgc2hvdWxkIEkgb25seSB3b3JrIHdpdGgNCj4+Pj4+Pg0KPj4+Pj4+IHRob3NlIHdobyBo
YXZlIERFVl9UWVBFX1BDSV9IT1NUX0JSSURHRT8NCj4+Pj4+IFdlbGwsIGlmIHlvdSdyZSBhZnRl
ciBob3N0IGJyaWRnZXMgLSB5ZXMuDQo+Pj4+Pg0KPj4+Pj4gSmFuDQo+Pj4+IFNvLCBJIHN0YXJ0
ZWQgbG9va2luZyBhdCB0aGUgYnVzMmJyaWRnZSBhbmQgaWYgaXQgY2FuIGJlIHVzZWQgZm9yIGJv
dGggeDg2IChhbmQgcG9zc2libGUgQVJNKSBhbmQgSSBoYXZlIGFuDQo+Pj4+DQo+Pj4+IGltcHJl
c3Npb24gdGhhdCB0aGUgb3JpZ2luYWwgcHVycG9zZSBvZiB0aGlzIHdhcyB0byBpZGVudGlmeSB0
aGUgZGV2aWNlcyB3aGljaCB4ODYgSU9NTVUgc2hvdWxkDQo+Pj4+DQo+Pj4+IGNvdmVyOiBlLmcu
IEkgYW0gbG9va2luZyBhdCB0aGUgZmluZF91cHN0cmVhbV9icmlkZ2UgdXNlcnMgYW5kIHRoZXkg
YXJlIHg4NiBJT01NVSBhbmQgVkdBIGRyaXZlci4NCj4+Pj4NCj4+Pj4gSSB0cmllZCB0byBwbGF5
IHdpdGggdGhpcyBvbiBBUk0sIGFuZCBmb3IgdGhlIEhXIHBsYXRmb3JtIEkgaGF2ZSBhbmQgUUVN
VSBJIGdvdCAwIGVudHJpZXMgaW4gYnVzMmJyaWRnZS4uLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGJl
Y2F1c2Ugb2YgaG93IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOmFsbG9jX3BkZXYgaXMg
aW1wbGVtZW50ZWQgKHdoaWNoIGxpdmVzIGluIHRoZQ0KPj4+Pg0KPj4+PiBjb21tb24gY29kZSBC
VFcsIGJ1dCBzZWVtcyB0byBiZSB4ODYgc3BlY2lmaWMpOiBzbywgaXQgc2tpcHMgc2V0dGluZyB1
cCBidXMyYnJpZGdlIGVudHJpZXMgZm9yIHRoZSBicmlkZ2VzIEkgaGF2ZS4NCj4+PiBJJ20gY3Vy
aW91cyB0byBsZWFybiB3aGF0J3MgeDg2LXNwZWNpZmljIGhlcmUuIEkgYWxzbyBjYW4ndCBkZWR1
Y2UNCj4+PiB3aHkgYnVzMmJyaWRnZSBzZXR1cCB3b3VsZCBiZSBza2lwcGVkLg0KPj4gU28sIGZv
ciBleGFtcGxlOg0KPj4NCj4+IGNvbW1pdCAwYWY0Mzg3NTdkNDU1ZjhlYjZiNWE2YWU5YTk5MGFl
MjQ1ZjIzMGZkDQo+PiBBdXRob3I6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRo
aWt1bHBhbml0QGFtZC5jb20+DQo+PiBEYXRlOsKgwqAgRnJpIFNlcCAyNyAxMDoxMTo0OSAyMDEz
ICswMjAwDQo+Pg0KPj4gICDCoMKgwqAgQU1EIElPTU1VOiBmaXggRG9tMCBkZXZpY2Ugc2V0dXAg
ZmFpbHVyZSBmb3IgaG9zdCBicmlkZ2VzDQo+Pg0KPj4gICDCoMKgwqAgVGhlIGhvc3QgYnJpZGdl
IGRldmljZSAoaS5lLiAweDE4IGZvciBBTUQpIGRvZXMgbm90IHJlcXVpcmUgSU9NTVUsIGFuZA0K
Pj4gICDCoMKgwqAgdGhlcmVmb3JlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgSVZSUy4gVGhlIGN1
cnJlbnQgbG9naWMgdHJpZXMgdG8gbWFwDQo+PiAgIMKgwqDCoCBhbGwgUENJIGRldmljZXMgdG8g
YW4gSU9NTVUuIEluIHRoaXMgY2FzZSwgInhsIGRtZXNnIiBzaG93cyB0aGUNCj4+ICAgwqDCoMKg
IGZvbGxvd2luZyBtZXNzYWdlIG9uIEFNRCBzeXRlbS4NCj4+DQo+PiAgIMKgwqDCoCAoWEVOKSBz
ZXR1cCAwMDAwOjAwOjE4LjAgZm9yIGQwIGZhaWxlZCAoLTE5KQ0KPj4gICDCoMKgwqAgKFhFTikg
c2V0dXAgMDAwMDowMDoxOC4xIGZvciBkMCBmYWlsZWQgKC0xOSkNCj4+ICAgwqDCoMKgIChYRU4p
IHNldHVwIDAwMDA6MDA6MTguMiBmb3IgZDAgZmFpbGVkICgtMTkpDQo+PiAgIMKgwqDCoCAoWEVO
KSBzZXR1cCAwMDAwOjAwOjE4LjMgZm9yIGQwIGZhaWxlZCAoLTE5KQ0KPj4gICDCoMKgwqAgKFhF
Tikgc2V0dXAgMDAwMDowMDoxOC40IGZvciBkMCBmYWlsZWQgKC0xOSkNCj4+ICAgwqDCoMKgIChY
RU4pIHNldHVwIDAwMDA6MDA6MTguNSBmb3IgZDAgZmFpbGVkICgtMTkpDQo+Pg0KPj4gICDCoMKg
wqAgVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGRldmljZSB0eXBlIChpLmUuIERFVl9UWVBFX1BDSV9I
T1NUX0JSSURHRSkgd2hpY2gNCj4+ICAgwqDCoMKgIGNvcnJlc3BvbmRzIHRvIFBDSSBjbGFzcyBj
b2RlIDB4MDYgYW5kIHN1Yi1jbGFzcyAweDAwLiBUaGVuLCBpdCB1c2VzDQo+PiAgIMKgwqDCoCB0
aGlzIG5ldyB0eXBlIHRvIGZpbHRlciB3aGVuIHRyeWluZyB0byBtYXAgZGV2aWNlIHRvIElPTU1V
Lg0KPj4NCj4+IE9uZSBvZiBteSB0ZXN0IHN5c3RlbXMgaGFzIERFVl9UWVBFX1BDSV9IT1NUX0JS
SURHRSwgc28gYnVzMmJyZGlnZSBzZXR1cCBpcyBpZ25vcmVkDQo+IElmIHRoZXJlJ3MgZGF0YSB0
byBiZSBzZW5zaWJseSByZWNvcmRlZCBmb3IgaG9zdCBicmlkZ2VzLCBJIGRvbid0DQo+IHNlZSB3
aHkgdGhlIGZ1bmN0aW9uIGNvdWxkbid0IGJlIHVwZGF0ZWQuIEkgZG9uJ3QgdmlldyB0aGlzIGFz
DQo+IHg4Ni1zcGVjaWZpYzsgaXQgbWF5IGp1c3QgYmUgdGhhdCBvbiB4ODYgd2UgaGF2ZSBubyBw
cmVzZW50IHVzZQ0KPiBmb3Igc3VjaCBkYXRhLiBJdCBtYXkgaW4gdHVybiBiZSB0aGUgY2FzZSB0
aGF0IHRoZW4geDg2LXNwZWNpZmljDQo+IGNhbGwgc2l0ZXMgY29uc3VtaW5nIHRoaXMgZGF0YSBu
ZWVkIHVwZGF0aW5nIHRvIG5vdCBiZSBtaXNsZWFkIGJ5DQo+IHRoZSBjaGFuZ2UgaW4gd2hhdCBk
YXRhIGdldHMgcmVjb3JkZWQuIEJ1dCB0aGF0J3Mgc3RpbGwgYWxsIHdpdGhpbg0KPiB0aGUgc2Nv
cGUgb2YgYnJpbmdpbmcgaW50ZW5kZWQtdG8tYmUtYXJjaC1pbmRlcGVuZGVudCBjb2RlIGNsb3Nl
cg0KPiB0byBhY3R1YWxseSBiZWluZyBhcmNoLWluZGVwZW5kZW50Lg0KDQpXZWxsLCB0aGUgcGF0
Y2ggaXRzZWxmIG1hZGUgbWUgdGhpbmsgdGhhdCB0aGlzIGlzIGEgd29ya2Fyb3VuZCBmb3IgeDg2
DQoNCndoaWNoIG1hZGUgREVWX1RZUEVfUENJX0hPU1RfQlJJREdFIGEgc3BlY2lhbCBjYXNlIGFu
ZCBpdCByZWxpZXMgb24gdGhhdC4NCg0KU28sIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9u
ZyBoZXJlLCBidXQgaW4gb3JkZXIgdG8gbWFrZSBpdCByZWFsbHkgZ2VuZXJpYw0KDQpJIHdvdWxk
IG5lZWQgdG8gaW50cm9kdWNlIHNvbWUgc3BlY2lmaWMga25vd2xlZGdlIGZvciB4ODYgYWJvdXQg
c3VjaCBhIGRldmljZQ0KDQphbmQgbWFrZSB0aGUgSU9NTVUgY29kZSByZWx5IG9uIHRoYXQgaW5z
dGVhZCBvZiBidXMyYnJpZGdlLg0KDQo+DQo+IEphbg==

