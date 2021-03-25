Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFE34896C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 07:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101260.193537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJro-00080g-Ra; Thu, 25 Mar 2021 06:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101260.193537; Thu, 25 Mar 2021 06:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJro-00080G-Nb; Thu, 25 Mar 2021 06:53:16 +0000
Received: by outflank-mailman (input) for mailman id 101260;
 Thu, 25 Mar 2021 06:53:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Cl2=IX=epam.com=prvs=3718c8f974=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lPJrm-00080B-6s
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 06:53:14 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3296b4f-8222-4b08-80c6-9d35bb353428;
 Thu, 25 Mar 2021 06:53:12 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P6j4bK029653; Thu, 25 Mar 2021 06:53:09 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 37gmer05nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 06:53:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6785.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 06:53:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 06:53:04 +0000
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
X-Inumbo-ID: d3296b4f-8222-4b08-80c6-9d35bb353428
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUif+lGE7MgVxmFq5paAgMrulLL6LFi7HHb1rtgVe7PatN6XK6QXXLBR7wa6efOW/rm86qDj4cvqEWTTpQ3awuhMbo6ebP8bPKpNMGNkwbZg3ObUnqmQ+dPBNtfUNYUg1Dqi3TkOKpvi7qQKVr38CuIKazMEFC5bNz4mgvj3F8MSHDsz+5/jNkRot1Z7yg3MigeulTtylKOvaybI27UDqWbTpW2EYZ9fNWMr3EEKmuz0pyDFw1wWZYS4Six1pJ4qdyWpx0VaroEZTtP5OJKmZYuygPajYrWTT+wmhC5cFjWqqTAo89bL3Br03xQl4Dt/+4m998gNDMEWrzfcFp+IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKtV3r8l/vkioNUg8/tCnsC1YcYskCNNnCuhba3PDrs=;
 b=mUxC6AXEMzmZCABS28nmMCW9oZ4if9md1T0zBYlZ6pBCVv5XCnrcFs8+huUFfc7BdM+6L4vlUv+yetBhOFbepNjLDMq2BlZC/7kTyHsS93wK47QoRYOgj1u6n7XCX86qRuRSuKrRKq1o18HrTe0DX7J8WwxTC4AHX/jDFd0z0VuM6d/O/sazjkkfSm3R3St9coOyUjp1SHz6bFkTVRE3ETE54bzGHqcgsv69e636MRjGi+6DgiP8VtsyYh8qOOvEPSWOO3tPaq/IPV2JXRcPwoBD3Gdk/C07OIFDzSEyOpIT6ZaFoSNhsClYNNXUj99MUEyn57Q5A3Cptw1pqSNYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKtV3r8l/vkioNUg8/tCnsC1YcYskCNNnCuhba3PDrs=;
 b=ZOSiWLxesUaJIk5Ah7+bfDHDvvuug3DnsyeeLkjlwKPo4d5cTPxTU2IbLY5mRehLlmRERsb0iHBqhAhDpVCutnUgxs+IvGefDk33fJmREq8/3PFux44YbnUw0KlU34sv5Bp6t4kvSYVemXTJclSQ3yOYYJfmo4LS7i+nYLY3Q7u8qIsejdAYPFR0qbeeA9bRRjcQwIPHwAGYSW1JC2tzoV2dWba9FfpG6yIZkY5A6Era7x5GwWZ4HAMl48fFRcxeKEbAJN7IrUt8t7QqsWOj90+clrfkEvrYg9fuRmaUKGFll+LzUK2dm2u3WWZmN6anLHNQfTBtamLK05spyXufJw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
        Daniel
 Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "kael_w@yeah.net" <kael_w@yeah.net>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Topic: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Index: AQHXIT8BvTrvCJoLoEahz8MTVepQQaqURIKA
Date: Thu, 25 Mar 2021 06:53:03 +0000
Message-ID: <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
References: <20210325061901.851273-1-wanjiabing@vivo.com>
In-Reply-To: <20210325061901.851273-1-wanjiabing@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e1491cf-acd7-41ed-aeec-08d8ef5aa376
x-ms-traffictypediagnostic: AM9PR03MB6785:
x-microsoft-antispam-prvs: 
 <AM9PR03MB67856CCB02D432E390950DADE7629@AM9PR03MB6785.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rxgiAIa8CzarkQnaymFlUFntY77b4em+ARktF7Y8gOICF8Kzp31dR2OeMNjm2BMCfncHlL/syZLH48uKpOyhd3DFpL09HF1iCu/q9FglQMCBtCSuc0D0QLjYlk71aOOXGzZbjQVeA8kjHIm8/nPm1f16z1HZQdX4n5QMKskAcHBFQs8zVf0ZtRbnQmZsccY11Ww9E/aixJWHa4bPPveJu8CO+sVcmXFglVIVbVNFTgvJtZWHKHZ6jWWAFZNQ27Ew5HuPDCihNn6nbx58CPxTMcKfCfoWESHODG6Lv2VNL1oQGaIBT6mVaTzn9KPp/9mtyPr95x5sUd6N99rL89j3fsyQDxJDoNt0yqFywtPw1mi+aQlaL/k4Ga1KTIaYDPZcR3AOE3/cqiKthuJEjWAIgL5sBNirHwzCI9nEiOu+o5hTV+VSbdjQept5odTwOHA83QFM08n244J9mSCLjmeoCFH03IkzzJlQn8voPxqqwTy+drBQtdNST4T0BRQ/omqnQ6AoDlNTd6vo0LZGM/4UwmWnheohdqFLullTf6b8LugLLGaHCGkD2cQMU82OEqCdRYTHjFiqrl1snZC+uVBcfz0vKpxmgen2uledBXZdxPbg5Y9f7Hkj7jLcW3UFJ2iSkAXbwvJBOJT3gJYg9KQoXW4dExSColinaoEX02EPFRAhcl0hrVvbxaET7X5r9t9G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(76116006)(36756003)(31686004)(8676002)(4744005)(86362001)(83380400001)(8936002)(5660300002)(2906002)(110136005)(66946007)(316002)(53546011)(6506007)(71200400001)(6512007)(478600001)(66556008)(66446008)(64756008)(66476007)(4326008)(38100700001)(6486002)(2616005)(31696002)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?N3ovZTJPQjRlUVQ0bTZ2RFN1TG1vOFJiK2g0aUl0YjY4enJyTDdwRkhtcmYw?=
 =?utf-8?B?S0wrR3RwSFZ2QSt0by9NMW5tVTJXS1JkWkZHRXN2bTVUU1habTVTcFY1c0JJ?=
 =?utf-8?B?WEIzejJvSzJrdHlNT04rNGNUSERwNXh5WXgwbGNwREgxQzBmUzNSbWR2RTdJ?=
 =?utf-8?B?QUZHemV2U1ZGSmZEK3pBNU5jYWZ6Wi9QTm9XMytLTG5FYnR2RDZiUm43SDk3?=
 =?utf-8?B?eFlTY0xXZHhJaDFIOUp4ekhXaS82VmVMcXAwQWRGakhHbDdkTE9JaTVpbDN4?=
 =?utf-8?B?SDNhb1ZrNmh1VHdXT0tqNWNyREF6WGFnRW5IY2FJa0N0dVYwNElKT3krOFBw?=
 =?utf-8?B?V0J6Zjh0L1VIMzFNcVMvSnh3WjFmZmp0VGU4ZGgzWnNrOG04UndPZlM0VWhk?=
 =?utf-8?B?TURhVlVHTnR0K1ZIYnVnaTlrV2wzcXpGcFdiYVlNSHQxWEZJRjkxcDN2ajRW?=
 =?utf-8?B?NFlDUDVuUldJNExoanlWMG02T09mdE5lQ1huclhGQUpUYzRvQWNiWjFiSHQ5?=
 =?utf-8?B?SzVkSG9OeWdIM2pqaEZza2c3MnBUcHFEQi9lV0RPNG1ISGdGRzRpQmoxY1do?=
 =?utf-8?B?b2hsUmE1K3Fxam5wUUwxbGZPMGhZMHp5Y1VOWWVOQlliTnQ1S3FuYmpqWW4x?=
 =?utf-8?B?MGM3TG5OTGsvSUkzcTBkTjlIbnBEZDAzelpobWdkKzg2WXBuY1Y3bisvNnlp?=
 =?utf-8?B?RHFEU3ZJdHhOa0xwaGp5TlNTMDVzUi81N1VSdnV1MGdCeGhpUEVsRk03OHRR?=
 =?utf-8?B?STA0QUVlZnNVYmtFTUxJRzRrcFE4RlhSUWE2bFMyR2JPNEdQQ29SS3FlVkpH?=
 =?utf-8?B?aG0za09RSEIrdEYxajR5R3J0NmJRL1JIZnRzM3J0ODUvaHNBb2NlSUdpQ245?=
 =?utf-8?B?QWVzeE9NUXhodHdEZ25kWis3RXlwTWppenJ2YmxNUFZPMjlKV1JaK2cxdjVH?=
 =?utf-8?B?QnNMSGxZQzBXakZHYThSazZqVEEyTjE1UHVYbHFwYlorTnY2UGdyaURJbXQ0?=
 =?utf-8?B?UVlZLzI5bjlTV01PTDBXd2lqUjRZV3FZVDU5MUQrU1kxdzhQN3FrUHRjTFJ3?=
 =?utf-8?B?b08rTHNENXBhMlUvTHp1dEgycEo0YWxUZkVid2dyZnBuTFFlVjhWUkNsello?=
 =?utf-8?B?MWNDM0Y2UVFiNUlNcUxLbVVSRTNZaE9yS2ttcCtsR1EwejJZODNIVlRlODZx?=
 =?utf-8?B?a1c4TUkrUHVpQk15elRxNjFkTERxbmlSeTVwQ1JiVXMzRnZHdGRuc1d3dmlx?=
 =?utf-8?B?K25POVpPYURaenJQTk1sNllpMUxiWW5LMmhHR1ZqRlpiVUpEd08rWHFZQzBM?=
 =?utf-8?B?NUYzQmp6R2NrOHhITVI5VVFLWS95dnE3WmNhRFQ2NEIxVEJIMUExVC9HK3g4?=
 =?utf-8?B?dzRtKytvcERXeEFGeWNobFYzVGZPS245WG1adlpVZmt5NEdyekVTOHpjZnl3?=
 =?utf-8?B?TWFaM0RhU2loeDRLdmpDYjFhbXowU05ZTW1zUWlhUE5WYmhRWjhtL3ZPK1BV?=
 =?utf-8?B?RXhpR1hqclcyMHN2OHZxdXVUKzdNbVlaU0o2ZGNDYjhXbGNmQzVFZU5NRWI4?=
 =?utf-8?B?TzB4UnZic1VYWTFDOHlqWkdaTUxJR2hKUFpvbTEzbGNvWklieTJHTXdUbFJr?=
 =?utf-8?B?RXZDV285VlpZMFVSb3ByM2hIOHFPMXhWTlVNS204VVgzaFhuSU4wVEtBTFBY?=
 =?utf-8?B?bkU1cDA3VDdZREFRbHkvcmJGL2tnQU11NTdIbVF0L1FoWTZJRkpKMVlvWjRl?=
 =?utf-8?Q?HsCdN+t559vlkWvtUknB2GGq4SsH9Wr/vZ2h+CX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A11FD010DBC874AB7B080924E43FBE2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1491cf-acd7-41ed-aeec-08d8ef5aa376
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 06:53:03.9981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+Vg/W/ZFHChemTy7WttszN9OWivgR+VuQcGRoOnHeR8SkbRqKFItHbAFYrUJHlCS++oZCbs97HRjMJJcTj0l/wwf0SqxuNT/3aUATR1iNhHsRrfYZyEwg4MiHkqeLOA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6785
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=956
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250049

SGksDQoNCk9uIDMvMjUvMjEgODoxOSBBTSwgV2FuIEppYWJpbmcgd3JvdGU6DQo+IHN0cnVjdCB4
ZW5fZHJtX2Zyb250X2RybV9pbmZvIGhhcyBiZWVuIGRlY2xhcmVkLg0KPiBSZW1vdmUgdGhlIGR1
cGxpY2F0ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogV2FuIEppYWJpbmcgPHdhbmppYWJpbmdAdml2
by5jb20+DQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLA0KDQpSZXZpZXdlZC1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQpX
aWxsIGFwcGx5IHRvIGRybS1taXNjLW5leHQtZml4ZXMNCg0KVGhhbmsgeW91LA0KDQpPbGVrc2Fu
ZHINCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5o
IHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmggYi9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5oDQo+IGluZGV4IDNhZGFjYmE5YTIzYi4uZTVm
NDMxNDg5OWVlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnRfY29ubi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25u
LmgNCj4gQEAgLTE2LDcgKzE2LDYgQEANCj4gICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsNCj4gICBz
dHJ1Y3QgeGVuX2RybV9mcm9udF9kcm1faW5mbzsNCj4gICANCj4gLXN0cnVjdCB4ZW5fZHJtX2Zy
b250X2RybV9pbmZvOw0KPiAgIA0KPiAgIGludCB4ZW5fZHJtX2Zyb250X2Nvbm5faW5pdChzdHJ1
Y3QgeGVuX2RybV9mcm9udF9kcm1faW5mbyAqZHJtX2luZm8sDQo+ICAgCQkJICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpOw==

