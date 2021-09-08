Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E59403AC4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182039.329448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxi0-0003K3-0a; Wed, 08 Sep 2021 13:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182039.329448; Wed, 08 Sep 2021 13:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxhz-0003H6-TM; Wed, 08 Sep 2021 13:33:47 +0000
Received: by outflank-mailman (input) for mailman id 182039;
 Wed, 08 Sep 2021 13:33:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iEI=N6=epam.com=prvs=98850bb71f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNxhx-0003Gu-C0
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:33:45 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62e394a0-10a9-11ec-b153-12813bfff9fa;
 Wed, 08 Sep 2021 13:33:44 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188DSOk0002191; 
 Wed, 8 Sep 2021 13:33:40 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3axwvm02ac-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 13:33:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 8 Sep
 2021 13:33:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.015; Wed, 8 Sep 2021
 13:33:34 +0000
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
X-Inumbo-ID: 62e394a0-10a9-11ec-b153-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOydCZ5mxGwjF7xuFQOdCSAPA4edjgKUmOsFvvtN0mC/olA/H6/UCkEDN/4CRR7lIA7P7TYKU8rEdQf+RRf8F0e1FWbms7RXq1DfBm92X7wWF6GjEKjJRLwgr+5j6pGGEhTVZsMnInDW4tRMLvH84AZbK1pxISSIb7QOF42QJoO4NAfgQhriTL2xEpAF1wt3aRS1oxN9Dy0vLcvjD0NvY0dW5NvOMxPxhljplDVvUFOHB/rAeSA8WxOgrEypVAFGsxp/ljjz+rgOyKnOGaAQCf2fHcZZCJrHF7gSqkdMBMnweY0kM5XfNwf+JlVN0kaem/ZIHxUmH7sBMUEWd8bpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=L3ub5nCEgz8/BPoFSGoHx/RyAVnfVYyGxyt7KNEG+Ik=;
 b=X/yzr41xWXDQ2IEDS1MJRR75MFFCiIm2FX2pBRrKzuEeLC1i3NPbmHid6KqcupZvlCsf3eEj2/F51i0DVYlN4mVcEO1DqNAv7L6vv5s6xlH4f2kyhWTthYN5kCPbdzM1bBYDlAhk9ZdkcmaBj5t69U/THg3i+mtdq6z4qtHZyorWeh2ukfGq3mncZ1q3vGTICbZMdeWljnjJF6FbFf4ucoxMul8TkYTYMacJs20TCZYpj/kfGinAaqjKvNG4gvYECmpvXSnKDEyvt8yNT/jtRwOF8h+yb1fb45X7UZvIgXvdFvi4mCOkmij2EqWMZeNKD9QRL5c3x5OLEWNB68wwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3ub5nCEgz8/BPoFSGoHx/RyAVnfVYyGxyt7KNEG+Ik=;
 b=p/EfBf2BQh6qUxGgmB5jJd3O1a2WAwzsLwlzzyg5gSCi3co3hqw4l8bZTZg8JLRQXF1JAUU2exGrQd3kDx+6tLw2EMqeGTmJwi9Zu8nJiXmn4BQUInj0oGwWox6WuO4vHszQ7R2P7GxQbLrG5eztwXZlL85TXsht5+Ol2fO8as7gIWXxzPgOiV4y1leddDSmHgpE3RPOeUehq67v9hrWZRszEQQTpSHhZeX+VZIJTDoWDIZ0Y8bN7wrkXvqmDMW5JVoZGISZ3ilnGIvToDvAd8KAzw6A/7P9YNBlp29f2XIAoPJqgadyp0IO6fedkbC9vWtWUg8B48YKPgNWXjZUyg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Topic: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Index: 
 AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLICAADFtgIAAE0qAgAEIooCAAAS6AIAABV4AgAA6yAA=
Date: Wed, 8 Sep 2021 13:33:34 +0000
Message-ID: <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
 <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
In-Reply-To: <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 114635a2-f0fd-457a-4269-08d972cd41c7
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB219563194611A0E9508E5A79E7D49@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IoY5qpN4GPz8HayI0DywAkj/2Fv35AyaDFTHxjgVADG5KaMwrEWMTPMz3y13RgH16nG/e/UgSae6nkz1z63S2trDXCj2B1sfErPqVEv2ZsZ9pgvbZcwMlcwWSWIMwi4Zdo8VXptX9UtZuoN18XJNCnHPD4Lcra+aRD63wX73wJ90eUeD+HFdjPANEK33IjJK2/x/Sll6k/+NGOQrfa325sPF8wPOSzQisY4NK+KchCWez15TaPiFtDY+g7Jmsuqv5te1cGUXcxtCLAh1QDWbUyRacfr1U2bb07h5q/C5sL/LrlHuVRL865oAnJasWeHTCL9xvd4OC24vxrMnIHK9SDYHtv+uVyqJPqWK0B7z2Gy+yKRD3Ri5WIdBzpDuKxZL8RdtpC22daDaCzRo6vHHktOFn9MEtZEeVct97YQcFruWQJHUXxckm5L6asdYQ7h749bHFuPfLVlUUrWJaIcq3cix0S6DSUbJ8Owq5mqOVhHIZ5eLpVRDZmE6Oic9gyD80PKCF7hUUk5dAL4ug9W0/S/Hvz0Sv1awemrRsJ1H+QeMsFO3LVQ9mrk0akJd7uuLEamJs53Gx4NlOlEEAePx/QHpR9OI08B1QAR77d++OyKonhoDjLgnkBgNkpJwGoEZz8Y9bA08kw+9pn+tyODG+OwBxR/sDQxjOvUkGbCmK4TI3MwvhgVfmfghcOBleEC/uhZxJXg+URz2rgmNWE2AKPL7Pa3iMb+x4j2Gcjy7Xb4fAyes5a7kEOFcEY5zqryg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(26005)(110136005)(8936002)(122000001)(86362001)(5660300002)(6506007)(83380400001)(76116006)(31686004)(66946007)(6486002)(66556008)(66476007)(64756008)(66446008)(2906002)(71200400001)(316002)(53546011)(38100700002)(478600001)(2616005)(186003)(6512007)(36756003)(4326008)(8676002)(38070700005)(31696002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFhrQlRCOGZLUW1oTHZ4d0pKdHRmazJ1ZkphdlJVUGFEeHRFWjByYU53L0Zp?=
 =?utf-8?B?Ykc1T0xrYXErT3dFZGR1UXF5L1gxcXBycVJKUXVoSERHMmxzbjBJWFpBbUpq?=
 =?utf-8?B?ak1EdUoveXVIRWdVdG9pTzEwaGJIZUU3OGJLRzJFYWFhOUJlcFBXSTV0YVUr?=
 =?utf-8?B?QktDYU5qdUdwM0pDc1E4TldGOTRrK2FvQ2dmTEVzd25HYVlNdGJpSnpZU3FC?=
 =?utf-8?B?Y2RRR3gxMW4xNXVBRVdFZjB6eEZ3aG84QVZwTTN3M1Z6VVNTK0I2RXN2ODJo?=
 =?utf-8?B?WFNhNlNOTnpmQVZsWVdVaVBWMjNzekorbEdDVUdzcm1zR29CbnRNZE5lOXNW?=
 =?utf-8?B?TnhvY3VKTXFjbmNTOTNycXFXaVpPcUFUaldFTDdSOFhsWnhwbjFUZ2MrbTU0?=
 =?utf-8?B?UnhKSk9xSXFFSlYrK1MwbmpHbWRMUTBqZ3h5Z2IvQ3FqaXA2ZWU2UzRBRUdn?=
 =?utf-8?B?QmY5ck9qcDUzWnlNc3gxbnBBbFAvaEIyRC82TkVHVmIxMWQrZkxjVDdkK0tj?=
 =?utf-8?B?NjdvRmxmVmdnN2VLVXBSeXF2Y2dxa1M3OEpyZW0rOXJDa1U1dEFQNmJpYmVZ?=
 =?utf-8?B?dDBQdmdoTVEwNkFhYVVxMW0xekFsSkhtck5qUjhlTVk2M0hSdWMvRzU4WjNO?=
 =?utf-8?B?ZHczd2pRUlhXa2VFOHFWMGIxYlpwMFh4UDdEVVJKTGpwNk82UGYzMk53Wnpi?=
 =?utf-8?B?L2tvdnNGQTZUcURhMXVIem11OVhQVFQwWE1HS3lUYUdVK3l2MDdMTUNYcml6?=
 =?utf-8?B?S2RKTzZVeE10WDVpa25jd1hUL1JlWllSOTZEcTRPb3lDK1JzMTN6bVJWdkpx?=
 =?utf-8?B?RFdrVVphWXRuMkpWeGNaZEZadGU0b0FMOElKbDhSVUwzUDFnNzBBanFUTVYw?=
 =?utf-8?B?QzllZGFCa0tDNFg2cnV5cTlEY1FWa0p4bXNOOVg3TVE0cjBQcEtjVVBnandk?=
 =?utf-8?B?Ym9sdDVVdG5qR0duRlNpSkhyRE9EMXZnQ3gxL1ZNZ2grekVkTnNQb3VRWVBT?=
 =?utf-8?B?NVJTOHh4My9PZW12K2JxekRORkVxK2drQTl3TXZLNkhHOXMxMWJiT3Fic3RI?=
 =?utf-8?B?emJmeVlDU2FLeDlqRmlDdEsxZFhDOElScjJvSzBOWFpoMnNINTYvYm5ZTHYz?=
 =?utf-8?B?VENSUFJYVm5XUHR5RFJuVnQyRDNBU2o2OFRJWExuWVdIcnlTbS93bWhyc1Y2?=
 =?utf-8?B?emUvaC94UW9zaVREQVo1SWNlMnVISm0xeUFIWFQwZmkxWmlpM2tWY3NRdWg5?=
 =?utf-8?B?b2pZa2lNU21oNHNxZzlUc2FtYlFXbmVKYVU0WU1iOWZnaE00RGN2ckRhL2tx?=
 =?utf-8?B?UUVBVjhLZTJ3c3d1UzN4WmxtOVdmTVZIYnpyOXhvbEE1TzFQTFkzYVA5S2J0?=
 =?utf-8?B?bWwveU11VWU5K085WTJJbzRiUXJjeVE4bDlWNEUyYWNFNlFQMDVVdDZveXQ3?=
 =?utf-8?B?UVpjQ3VOcXpKd21uaHBZcVRLYzRZUFBQV2xGT3A1T2JxVWRHT0IwYXJCcFlv?=
 =?utf-8?B?S3JZc2k2RWQ3U0UvL0sybC9Ic0FwYlBORzZmdTBLTU9TYlVkckVQbjR1YlZL?=
 =?utf-8?B?NjlNMUF6N3BiRXJDc0tCY1dER0dqUjVQZjBXNlRJTlJxeGk3Y1F6Ri94bFNP?=
 =?utf-8?B?eEltY1JibjV5YnNjZ1I2RUUwU0lmWXNqcVliRWs1TlJtek4rY3lJU3pxQWZB?=
 =?utf-8?B?VC8yWkxLbGNZdTFURkRtVnl2OEpQYks3Mjlha25Hc3lub0FuOHNEYURTMHdO?=
 =?utf-8?Q?NLQfinxg4NQHGgEee4lsw1pyEktIeEAHeuWhgH6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78697C31968CE74B8F4148B7A11CB667@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114635a2-f0fd-457a-4269-08d972cd41c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 13:33:34.6418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suqtWY7mdh7x0nqSIBCMVKZSW7rH+4gYQDNpGF4OoYyAsfZLqO+nY6A96QxpqKLs7zuFOG8cLpJVSFwsPDq/6kexq9NgK3SbArAiq3FOFLYHsUcNyyi4Mv9VbrQDqWCV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-ORIG-GUID: i6oOndyb55rzE_GPRB9OPj3F8kVmHtCi
X-Proofpoint-GUID: i6oOndyb55rzE_GPRB9OPj3F8kVmHtCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080086

DQpPbiAwOC4wOS4yMSAxMzowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjA5LjIwMjEg
MTE6NDMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDguMDkuMjEgMTI6
MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTk6MzksIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wOS4yMSAxOTozMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDE1OjMzLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNi4wOS4yMSAxNzozMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4g
KysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gQEAgLTQwMCwxMiArNDAw
LDcyIEBAIHN0YXRpYyB2b2lkIGJhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
dW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+ICAgICAgc3RhdGljIHZvaWQgZ3Vlc3RfYmFyX3dy
aXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpk
YXRhKQ0KPj4+Pj4+Pj4gICAgICB7DQo+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFy
ID0gZGF0YTsNCj4+Pj4+Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4+Pj4+Pj4gKw0KPj4+
Pj4+Pj4gKyAgICBpZiAoIGJhci0+dHlwZSA9PSBWUENJX0JBUl9NRU02NF9ISSApDQo+Pj4+Pj4+
PiArICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgIEFTU0VSVChyZWcgPiBQQ0lfQkFTRV9BRERSRVNT
XzApOw0KPj4+Pj4+Pj4gKyAgICAgICAgYmFyLS07DQo+Pj4+Pj4+PiArICAgICAgICBoaSA9IHRy
dWU7DQo+Pj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4+ICsgICAgZWxzZQ0KPj4+Pj4+Pj4gKyAgICAg
ICAgdmFsICY9IFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0s7DQo+Pj4+Pj4+PiArICAgIGJhci0+
Z3Vlc3RfYWRkciAmPSB+KDB4ZmZmZmZmZmZ1bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+Pj4+Pj4+
PiArICAgIGJhci0+Z3Vlc3RfYWRkciB8PSAodWludDY0X3QpdmFsIDw8IChoaSA/IDMyIDogMCk7
DQo+Pj4+Pj4+IFdoYXQgeW91IHN0b3JlIGhlcmUgaXMgbm90IHRoZSBhZGRyZXNzIHRoYXQncyBn
b2luZyB0byBiZSB1c2VkLA0KPj4+Pj4+PiAgICAgIGFzDQo+Pj4+Pj4+IHlvdSBkb24ndCBtYXNr
IG9mZiB0aGUgbG93IGJpdHMgKHRvIGFjY291bnQgZm9yIHRoZSBCQVIncyBzaXplKS4NCj4+Pj4+
Pj4gV2hlbiBhIEJBUiBnZXRzIHdyaXR0ZW4gd2l0aCBhbGwgb25lcywgYWxsIHdyaXRhYmxlIGJp
dHMgZ2V0IHRoZXNlDQo+Pj4+Pj4+IG9uZXMgc3RvcmVkLiBUaGUgYWRkcmVzcyBvZiB0aGUgQkFS
LCBhaXVpLCByZWFsbHkgY2hhbmdlcyB0bw0KPj4+Pj4+PiAodHlwaWNhbGx5KSBjbG9zZSBiZWxv
dyA0R2IgKGluIHRoZSBjYXNlIG9mIGEgMzItYml0IEJBUiksIHdoaWNoDQo+Pj4+Pj4+IGlzIHdo
eSBtZW1vcnkgLyBJL08gZGVjb2Rpbmcgc2hvdWxkIGJlIG9mZiB3aGlsZSBzaXppbmcgQkFScy4N
Cj4+Pj4+Pj4gVGhlcmVmb3JlIHlvdSBzaG91bGRuJ3QgbG9vayBmb3IgdGhlIHNwZWNpZmljICJh
bGwgd3JpdGFibGUgYml0cw0KPj4+Pj4+PiBhcmUgb25lcyIgcGF0dGVybiAob3Igd29yc2UsIGFz
IHlvdSBwcmVzZW50bHkgZG8sIHRoZSAiYWxsIGJpdHMNCj4+Pj4+Pj4gb3V0c2lkZSBvZiB0aGUg
dHlwZSBzcGVjaWZpZXIgYXJlIG9uZXMiIG9uZSkgb24gdGhlIHJlYWQgcGF0aC4NCj4+Pj4+Pj4g
SW5zdGVhZCBtYXNrIHRoZSB2YWx1ZSBhcHByb3ByaWF0ZWx5IGhlcmUsIGFuZCBzaW1wbHkgcmV0
dXJuIGJhY2sNCj4+Pj4+Pj4gdGhlIHN0b3JlZCB2YWx1ZSBmcm9tIHRoZSByZWFkIHBhdGguDQo+
PiBCdXQgaW4gY2FzZSBvZiBCQVIgc2l6aW5nIEkgbmVlZCB0byBhY3R1YWxseSByZXR1cm4gQkFS
IHNpemUuDQo+PiBTbywgdGhlIGNvbXBhcmlzb24gaXMgdGhlIHdheSB0byB0ZWxsIGlmIHRoZSBn
dWVzdCB3YW50cyB0byByZWFkDQo+PiBhY3R1YWwgKGNvbmZpZ3VyZWQpIEJBUiB2YWx1ZSBvciBp
dCB0cmllcyB0byBkZXRlcm1pbmUgQkFSJ3Mgc2l6ZS4NCj4+IFRoaXMgaXMgd2h5IEkgY29tcGFy
ZSBhbmQgdXNlIHRoZSByZXN1bHQgYXMgdGhlIGFuc3dlciB0byB3aGF0IG5lZWRzDQo+PiB0byBi
ZSBzdXBwbGllZCB0byB0aGUgZ3Vlc3QuIFNvLCBpZiBJIGRvbid0IGNvbXBhcmUgd2l0aCAweGZm
ZmZmZmZmIGZvciB0aGUNCj4+IGhpIHBhcnQgYW5kIDB4ZmZmZmZmZjAgZm9yIHRoZSBsb3cgdGhl
biBob3cgZG8gSSBrbm93IHdoZW4gdG8gcmV0dXJuDQo+PiBjb25maWd1cmVkIEJBUiBvciByZXR1
cm4gdGhlIHNpemU/DQo+IFdlbGwsIGJ1dCB0aGF0J3MgdGhlIGNvbW1vbiBtaXN1bmRlcnN0YW5k
aW5nIHRoYXQgSSd2ZSBiZWVuIHRyeWluZw0KPiB0byBwb2ludCBvdXQ6IFRoZXJlJ3Mgbm8gZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZXNlIHR3byBmb3JtcyBvZg0KPiByZWFkcy4gVGhlIEJBUnMgYXJl
IHNpbXBseSByZWdpc3RlcnMgd2l0aCBzb21lIHIvbyBiaXRzLiBUaGVyZSdzDQo+IG5vIGhpZGRl
biAybmQgcmVnaXN0ZXIgcmVjb3JkaW5nIHdoYXQgd2FzIGxhc3Qgd3JpdHRlbi4gV2hlbiB5b3UN
Cj4gd3JpdGUgMHhmZmZmZmZmZiwgYWxsIHlvdSBkbyBpcyBzZXQgYWxsIHdyaXRhYmxlIGJpdHMg
dG8gMS4gV2hlbg0KPiB5b3UgcmVhZCBiYWNrIGZyb20gdGhlIHJlZ2lzdGVyLCB5b3Ugd2lsbCBm
aW5kIGFsbCByL28gYml0cw0KPiB1bmNoYW5nZWQgKHdoaWNoIGluIHBhcnRpY3VsYXIgbWVhbnMg
YWxsIGxvd2VyIGFkZHJlc3MgYml0cyBhcmUNCj4gemVybywgdGh1cyBhbGxvd2luZyB5b3UgdG8g
ZGV0ZXJtaW5lIHRoZSBzaXplKS4NCj4NCj4gV2hlbiB0aGUgc3BlYyBzYXlzIHRvIHdyaXRlIDB4
ZmZmZmZmZmYgZm9yIHNpemluZyBwdXJwb3NlcywgT1Nlcw0KPiBzaG91bGQgZm9sbG93IHRoYXQs
IHllcy4gVGhpcyBkb2Vzbid0IHByZWNsdWRlIHRoZW0gdG8gdXNlIG90aGVyDQo+IGZvcm1zIG9m
IHdyaXRlcyBmb3Igd2hpY2hldmVyIHB1cnBvc2UuIEhlbmNlIHlvdSBkbyBub3Qgd2FudCB0bw0K
PiBzcGVjaWFsIGNhc2Ugc2l6aW5nLCBidXQgaW5zdGVhZCB5b3Ugd2FudCB0byBlbXVsYXRlIGNv
cnJlY3RseQ0KPiBhbGwgZm9ybXMgb2Ygd3JpdGVzLCBpbmNsdWRpbmcgc3Vic2VxdWVudCByZWFk
cyB0byB1bmlmb3JtbHkNCj4gcmV0dXJuIHRoZSBpbnRlbmRlZCAvIGV4cGVjdGVkIHZhbHVlcy4N
Cj4NCj4gSnVzdCB0byBnaXZlIGFuIGV4YW1wbGUgKHBlcmhhcHMgYSBsaXR0bGUgY29udHJpdmVk
KTogVG8gc2l6ZSBhDQo+IDY0LWJpdCBCQVIsIGluIHByaW5jaXBsZSB5b3UnZCBmaXJzdCBuZWVk
IHRvIHdyaXRlIDB4ZmZmZmZmZmYgdG8NCj4gYm90aCBoYWx2ZXMuIEJ1dCB0aGVyZSdzIG5vdGhp
bmcgd3Jvbmcgd2l0aCBkb2luZyB0aGlzIGluIGENCj4gZGlmZmVyZW50IG9yZGVyOiBBY3Qgb24g
dGhlIGxvdyBoYWxmIGFsb25lIGZpcnN0LCBhbmQgdGhlbiBhY3QNCj4gb24gdGhlIGhpZ2ggaGFs
Zi4gVGhlIGFjdGluZyBvbiB0aGUgaGlnaCBoYWxmIGNvdWxkIGV2ZW4gYmUNCj4gc2tpcHBlZCBp
ZiB0aGUgbG93IGhhbGYgc2l6aW5nIHByb2R1Y2VkIGF0IGxlYXN0IGJpdCAzMSBzZXQuIE5vdw0K
PiBpZiB5b3Ugd2VyZSB0byBzcGVjaWFsIGNhc2Ugc2VlaW5nIGZmZmZmZmZmOmZmZmZmZmY/IGFz
IHRoZQ0KPiBsYXN0IHdyaXR0ZW4gcGFpciBvZiB2YWx1ZXMsIHlvdSdkIGJyZWFrIHRoYXQgKGlt
byBsZWdpdGltYXRlKQ0KPiBhbHRlcm5hdGl2ZSBwcm9jZXNzIG9mIHNpemluZy4NCg0KSG93IGFi
b3V0Og0KDQpzdGF0aWMgdm9pZCBndWVzdF9iYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkNCnsNCiDC
oMKgwqAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KIMKgwqDCoCBib29sIGhpID0gZmFs
c2U7DQoNCiDCoMKgwqAgaWYgKCBiYXItPnR5cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KIMKg
wqDCoCB7DQogwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHJlZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7
DQogwqDCoMKgwqDCoMKgwqAgYmFyLS07DQogwqDCoMKgwqDCoMKgwqAgaGkgPSB0cnVlOw0KIMKg
wqDCoCB9DQogwqDCoMKgIGVsc2UNCiDCoMKgwqAgew0KIMKgwqDCoMKgwqDCoMKgIHZhbCAmPSBQ
Q0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KIMKgwqDCoMKgwqDCoMKgIHZhbCB8PSBiYXItPnR5
cGUgPT0gVlBDSV9CQVJfTUVNMzIgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9UWVBFXzMyDQogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV82NDsN
CiDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gYmFyLT5wcmVmZXRjaGFibGUgPyBQQ0lfQkFTRV9BRERS
RVNTX01FTV9QUkVGRVRDSCA6IDA7DQogwqDCoMKgIH0NCg0KIMKgwqDCoCBiYXItPmd1ZXN0X2Fk
ZHIgJj0gfigweGZmZmZmZmZmdWxsIDw8IChoaSA/IDMyIDogMCkpOw0KIMKgwqDCoCBiYXItPmd1
ZXN0X2FkZHIgfD0gKHVpbnQ2NF90KXZhbCA8PCAoaGkgPyAzMiA6IDApOw0KDQogwqDCoMKgIGJh
ci0+Z3Vlc3RfYWRkciAmPSB+KGJhci0+c2l6ZSAtIDEpIHwgflBDSV9CQVNFX0FERFJFU1NfTUVN
X01BU0s7DQp9DQoNCnN0YXRpYyB1aW50MzJfdCBndWVzdF9iYXJfcmVhZChjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqZGF0YSkNCnsNCiDC
oMKgwqAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KDQogwqDCoMKgIGlmICggYmFyLT50
eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gYmFyLT5n
dWVzdF9hZGRyID4+IDMyOw0KDQogwqDCoMKgIHJldHVybiBiYXItPmd1ZXN0X2FkZHI7DQp9DQoN
Ckl0IHNlZW1zIHRvIHNvbHZlIGFsbCB0aGUgcXVlc3Rpb25zIHdlIGhhdmU6IG1vcmUgd29yayBv
biB3cml0ZSBwYXRoLA0KDQpubyBjb21wYXJpc29uIHdpdGggMHhmZmZmZmZmZjogQkFSJ3Mgc2l6
ZSBpcyB1c2VkIHRvIG1hc2sgdW53YW50ZWQgYml0cy4NCg0KQlRXLCBiYXJzW2ldLmd1ZXN0X2Fk
ZHIgPSAwOyBpcyBuZWVkZWQgYXMgdGhpcyBmaWVsZCBjYW4gYmUgcmUtdXNlZC4NCj4NCj4gSmFu
DQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

