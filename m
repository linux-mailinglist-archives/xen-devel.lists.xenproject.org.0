Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278994067DE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 09:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184113.332675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOb9I-0005Sz-0O; Fri, 10 Sep 2021 07:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184113.332675; Fri, 10 Sep 2021 07:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOb9H-0005R8-T4; Fri, 10 Sep 2021 07:40:35 +0000
Received: by outflank-mailman (input) for mailman id 184113;
 Fri, 10 Sep 2021 07:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOb9F-0005R2-Tx
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 07:40:34 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21ee7c53-5c56-4cf9-863e-e542214ebefc;
 Fri, 10 Sep 2021 07:40:33 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18A7VOF2029743;
 Fri, 10 Sep 2021 07:40:30 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b02mt0471-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 07:40:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4146.eurprd03.prod.outlook.com (2603:10a6:208:ca::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 10 Sep
 2021 07:40:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 07:40:27 +0000
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
X-Inumbo-ID: 21ee7c53-5c56-4cf9-863e-e542214ebefc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/lVCsqv6YgaZw0wXPEwzH0mLy+4B1WE85GXraAJhF076UKI/fnGiU3FAFHs2JMjJQpi6BgRULVxF4GYJaBV69ixYGphcUTb7kHGvd5xzN2tc5ZSWXioCNAwC9DJDCCE7RMpY4o8EFVd9U1xgMu07VK0NrJqwdoqIBesPK1jRUjO9tutacdj5JAaadT8xpPqZU8hmE+7gUtHhZBHHu3+HbBfk88gJtWn7VVFFAPr9+2NHsB3jX0KoFSGyfXNaqDrNpCsqyo1ox+GWp5rkcy3ryJxCkupK+mc28kXWFyFaVSQeHV2eAJizOuoDtsyfZEuFnYvHfQcTFR0cjfKHkqS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ti+No49gbaz412CJo1DZu2r1siXmL2rdhSlZTtMKmyM=;
 b=fPDF2SqPqdvAPqGdSmEKtegC1f+z76rlXfkZW00cuR/XMSR8Og8rO+JWMMSnMlrMy2eB4tuGlg1UHr4HkCadF30o/jX7ElSJFcrQbeqcXkVDsb8Q/8aS0EOVim0A0nJxCWLHoWsuZ1e0LecbribiToWvesVvwbu6bpihAjlottpp+66ZGIk0LZKBPm8mqvSajddk/zqtCT4+fz5xHKzQshpfIzY9gn6Ux/5NQPyzMyGDaIp8S9sLAXjlVRoJQRuNkBC7AiHvdWM7F4hdLjOwJ4NDR8Jzpiut7rCOxWRiSFVKl7uZWDxhk7L3lwHzfPe62wT1MRHJ1hoiIlnOt0+HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti+No49gbaz412CJo1DZu2r1siXmL2rdhSlZTtMKmyM=;
 b=O/Gv4oXHYWg4WAtPyWdBVPZ1AQWr2D3Go0DM762prqrVqMgBJN+qitSczMGH5XUp7Ajwdc7ARRsMF7bFyYcro0S6kTJGUnzAouiw6eN+USltA75UvG2BlkhfoxwTXIiNNZDvNtRXZNYvXc7iyYNkU6ig/VtTVWLlT3+L45oCpN/v9/gEZdJgdyPTtViVtqn8OqnkdvG/aA8E2tIPRHG8HjhabNeYs+532jcr9u+OqnTG3KjclSkYQB9Eo+69mkck6JJpCJACgYSeyNoln/L5Ezk/ruRa4UChujznPUUCmVj1D+NO+Jn+653r9IpPEeUgk8UIjWjhUtBFfTcY9IBixQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 01/11] xen/arm: Add new device type for PCI
Thread-Topic: [PATCH 01/11] xen/arm: Add new device type for PCI
Thread-Index: AQHXoJ5vVHmVQfsS80C08bAadrkmc6ub/FYAgADwqgA=
Date: Fri, 10 Sep 2021 07:40:26 +0000
Message-ID: <4c43fdd4-c10c-c1da-440b-34eef43d0716@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-2-andr2000@gmail.com>
 <5a32422f-0782-342d-911b-116af2c85859@xen.org>
In-Reply-To: <5a32422f-0782-342d-911b-116af2c85859@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82b43258-3dec-4124-714e-08d9742e41c5
x-ms-traffictypediagnostic: AM0PR03MB4146:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB41467E4BB86435B979F27002E7D69@AM0PR03MB4146.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NN3HaKlWuSmKgiC9KUdPMWNLygf6cLgQS5o0KdFI2UgZJCWkN2NvwX3RZ8VWQYXVYetrpMTwiVV5MjMUNgc1wvOa1MHyWzHrOullvTIX01x2rYhXp71wrAc1H+zoejr3yMidl7175JcipN42hn4cHxXdlvIlRv1Gpr2qk+kw1yr83NpqnRr8+sazFkVIIQ0wBfD7iVDNrjyQBpeGBmnH08lD3OIUFE9dIbOPQ2x1qXMfL1XhvO9EMo99xZ46cHmPkEtiE4PjxHBnERx0z2TXXc+J9R6eO2NWWL4fkJeholhneEUeStKGMyu3YIsZRLDBttvz4LyJrKkfv8neaqG1KvtMR8bRs35+4i3PvZ/FS+xk+kkv5BXt1IaH+O6AUZtDV6XNaOI5SOMW7j6sbIlyhEgTk2gGHka7CuTgQFrXqsx66Y1wx2Ao4n9RWCWc744FqmrVtuYIVXwq0CM9IIRlR0K3CA/m3pr8BO7A1XHy1P4Zb1IOLlxxkjMG/Jyyi6jJ/TpBemn3Z0ISeXtiw4Ct5eB+GSZuwpRVZAIP3Vu04zfsB4xRs3yTBK76kGh5gzcDs57au3WpCdzGo6GjEQrffti2zkxm9aiGY0RzRSHcmCLKu4Ozpgmhszkx/IcjsvClI9YDmFR2u6cVfYNkT5QpGz5Cm1/uzxTP8+0G3Q7chi196Z2D/p3bSYX9Sj60mBNdsR/ipnQc8x5sLb8WZ/tk3iFXfEDoO5wwEqjZQ5B5mpY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(66946007)(38100700002)(76116006)(5660300002)(31686004)(4326008)(91956017)(86362001)(31696002)(53546011)(36756003)(6506007)(4744005)(66446008)(66556008)(55236004)(66476007)(8676002)(64756008)(110136005)(6512007)(2616005)(6486002)(316002)(54906003)(8936002)(71200400001)(122000001)(478600001)(2906002)(26005)(186003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2x0K2J1TXJydmk5WkVJNmlFOUtpVnkvSlpZRXYrM2hncVBiQ28waG5vcStp?=
 =?utf-8?B?RXVKanpBdGhyTDFYQzJkRnVPbllpNkQ3R2NoMHVxWnpvMytQZVZzTmJXdHJq?=
 =?utf-8?B?dzZMZTlIR0pvQ1lXNVN0YWliMGZjRkJlaWlBL3MxcklGZ1pPdGpaak10UCti?=
 =?utf-8?B?ZUxNdVRlb2F0MThqanpiSkpiNTdEUnRaWjR2UVBVRTQxcHF2cHdlb3FWN0tN?=
 =?utf-8?B?R0M4Zk1BR0o2NUtCNkZBc2hTUFB3cm8xNU9FWmlyRDV0TlpJbWpyNEs3TFdO?=
 =?utf-8?B?ekJyWUtzTnZvVzJEaHlKSk8xRmdGb3h4OCtSY3E0TFZuSFhuL1hhWVlhbE9r?=
 =?utf-8?B?ZTd5NVFlV0FRSXE4TXFYT29FRHhoRmI1djRTSE9TSU9UWDNEbEt0d3hrU2lK?=
 =?utf-8?B?VVE4VjVDSTZROGF0OW9SVG5vU2VMNVVONkhoWmhtOU1uNmJhL3o1bllJa1E0?=
 =?utf-8?B?VGgyRGZRTnM5d3FwQUQrOXZTTEtnd0QvL1dxUjFIYWpCd2pHQmNZQ3ZZYy9O?=
 =?utf-8?B?WmQyMjZHeC9YK2k3aGFua3YveDRsN2RUTSt1L0g5VGFWVFA1dkIyeVlpdW9C?=
 =?utf-8?B?SDdqRXd2S1d5VnJSU0JRQjJlYjZuNDc0MlZBWi80YmJCM3B1MFJVb01mM3hH?=
 =?utf-8?B?NGpRUWpnUTJxNXBPaWN2blhPM05nY0lyOG1wNXIrNndtOENNQ2RxR2MzTDd6?=
 =?utf-8?B?MkNnWTlPcFVKa3lWRHJ4OGZEM3dpSnNDcnZTcll1QUc3UlN4eVcyK29jVk9T?=
 =?utf-8?B?ZTVGYjBZM3JOQml2dklBQnZZZE54RzA0YnA2N3Q2QnJibExMeUpSMXNpaUlh?=
 =?utf-8?B?WmxHVTlSK3dFaS9EZVBUcXZuOWk0ZkwvZldXTzZlZFZYVkxkWUt5T3F4c3B0?=
 =?utf-8?B?M1FIcW9DM2FUYUZGMmM0YkY0bXZENEhOa2hzU2VtMmJrRGRLZDVVTVJNUGIy?=
 =?utf-8?B?c3I3TEVub0g1aU5yVXl6ZnYxM243Mm56TVg1cS9qbHpHUTVjcDltc1F2L3Ey?=
 =?utf-8?B?S3ZQUWFNSENYditTbm1ueVpGdW04WW9QRW5VTE1ZRGpURENoUlZNd29ySWVp?=
 =?utf-8?B?ckFYTFY3b3czSDBKclk4aVg4elg1amQya3Z6SGgyOGZhUGlJS3NJcStjQzZy?=
 =?utf-8?B?d2RRMi9EZXc4YVhGVG9sZXlmR0tiMVhiQ21QUjdubnM1R2VTbklJa2NjSjR6?=
 =?utf-8?B?NmcveExUUFltQVRmSUt1eWd2cUlhb0c4WnNwTC8zZmpQbC9RalQxRTNQUkpu?=
 =?utf-8?B?dmFaVUdYcDExRUpGbnpnM0NNcHB4N1BhbGpNT1VNS0NUK2s2UVFBc0pRYVc3?=
 =?utf-8?B?UUJ2bDA1RjVUU0Y1L1FJcVpIbE1rZWJDTWxXbWNaUy9wbTNvUTE0NW5DcTNl?=
 =?utf-8?B?ZStkdzZHcE1WSG8rOVFCbzYzN2VVWEpiaUdWR3ZGSmNHc3dBb21FaDJ6bk1r?=
 =?utf-8?B?ZmhRVld6VE9GNGFzS2NLT1AzeVNtZjRZcmRKdE9PaWlMYkpmRDZBQkJRM2V6?=
 =?utf-8?B?VTZNYXNzQUFwY0tJeWJibHljb0pVZ0J3VlBKUCsvbnJFUnZSNWJzWTE3WUJG?=
 =?utf-8?B?Vmx4R2Z2dFp1VzV3VDZ4UDlpZE9IaXV3T2YxdTY5bVpRd290NWozZjFMTnp5?=
 =?utf-8?B?c3dtR29IL1p6dE4zNDRyRzBtQm1ZbXdQdHJYSlV0ZTVJL2ltN0l3MlhCbHdX?=
 =?utf-8?B?cWlJSzJXM0VWVFhMaTJDc2lObm9NYTN6akk1ODVzcGdocGNZVTVOR2pBcFY3?=
 =?utf-8?B?UFZTQWJYQW4yNlZtSzZnUUc5K1laR05lbSs1TkN1V09uYWFxRVdwTzRZU3d1?=
 =?utf-8?B?b1JPTEpUQnQ2Qkx4R0ZWUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3752BAE6A6743444B8BDCBBA1376BD1A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b43258-3dec-4124-714e-08d9742e41c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 07:40:27.0033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8naP46wYM1b+uZEUNs13EqmSAHP8ICOs1Xc8lNWG5GfwuAqLDF3B1tAnITZ8NddxDgufoeHJXQWAOvkNhSCrzT9of1TXcm4rdW/XT5BrXxH09U1H11wW5Mg96Sel5ST
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4146
X-Proofpoint-GUID: _i_Ym09Ibqe7YmBXMbArAcIVzi_mpocP
X-Proofpoint-ORIG-GUID: _i_Ym09Ibqe7YmBXMbArAcIVzi_mpocP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109100046

SGksIEp1bGllbiENCg0KT24gMDkuMDkuMjEgMjA6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBZGQgbmV3IGRldmljZSB0eXBlIChE
RVZfUENJKSB0byBkaXN0aW5ndWlzaCBQQ0kgZGV2aWNlcyBmcm9tIHBsYXRmb3JtDQo+PiBEVCBk
ZXZpY2VzLCBzbyBzb21lIGRyaXZlcnMsIGxpa2UgSU9NTVUsIGNhbiBoYW5kbGUgUENJIGRldmlj
ZXMNCj4+IGRpZmZlcmVudGx5Lg0KPg0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBm
b2xkIHRoaXMgY2hhbmdlIGluIHRoZSBuZXh0IHBhdGNoIGFzIHRoaXMgaXMgd2hlcmUgeW91IGFk
ZCBhbGwgdGhlIGhlbHBlcnMgZm9yIGNvbnZlcnRpbmcgZGV2IHRvIFBDSS4NCk9rLCBJIHdpbGwN
Cj4NCj4+DQo+PiBXaGlsZSBhdCBpdCBmaXggZGV2X2lzX2R0IG1hY3JvLg0KPg0KPiBJIHdvdWxk
IGtlZXAgdGhpcyBjaGFuZ2Ugc2VwYXJhdGUuIEl0IGFsc28gbmVlZHMgYW4gZXhwbGFuYXRpb24g
b2Ygd2hhdCdzIHRoZSBwcm9ibGVtIGFuZCBtZW50aW9uIGl0IGlzIGEgbGF0ZW50IGJ1ZyBiZWNh
dXNlIG5vLW9uZSB1c2UgaXQgKHNvIHdlIGtub3cgdGhpcyBkb2Vzbid0IHJlcXVpcmUgYSBiYWNr
cG9ydCkuDQpTdXJlLCB3aWxsIGNyZWF0ZSBhIGRlZGljYXRlZCBwYXRjaCBmb3IgdGhhdA0KPg0K
PiBDaGVlcnMsDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

