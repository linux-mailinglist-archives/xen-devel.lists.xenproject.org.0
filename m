Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE741A925
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 08:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197593.350732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV72V-00008r-TP; Tue, 28 Sep 2021 06:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197593.350732; Tue, 28 Sep 2021 06:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV72V-00006e-Q5; Tue, 28 Sep 2021 06:56:31 +0000
Received: by outflank-mailman (input) for mailman id 197593;
 Tue, 28 Sep 2021 06:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV72U-00006Y-Cz
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 06:56:30 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89de428a-c1e2-47fc-b24e-99d3e001c1c3;
 Tue, 28 Sep 2021 06:56:28 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S6nakS012178; 
 Tue, 28 Sep 2021 06:56:26 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbx44g12d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 06:56:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7425.eurprd03.prod.outlook.com (2603:10a6:20b:260::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Tue, 28 Sep
 2021 06:56:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 06:56:22 +0000
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
X-Inumbo-ID: 89de428a-c1e2-47fc-b24e-99d3e001c1c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGU3d31d63MDmf+dx2k+DhE9FU6oXqV1NqO/+sNRrfeys3ifKmTcBEY89cQLJrDpLC7EPxM7kLLPaXajHH6Xgo/Qb9OzXwOiLs/cx3Q4t/LbZupCzG3O1WDG+GwQs/4ctTF50H04XWur3r1/EpLv9DNzlu9yuLc4Ml+S2GsphgwkHWDJFju4EXtbkQnntC+89buKirZDj+E5aLS+xwNZoj/ybWEuUqr6+B28hYzsj4sZ4ik0yC1ho0ea/7g6rFMlcLZYeDT/ZSgG5Bgb//rOyllXoIXURbW9hHgFlQ6s0hM35V3hFZjiEXL/wNM+c2Tyxpsz+8r7GUTIVSw1lGrDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O57wXf8QTGFxw9gGS1emYmTJr7uuT/RTQdm/5MF46Ao=;
 b=AvUSfqouTnUxdz2USoHcmuzyMuYdVhBWlnurtIpY/LwapwXEQM96a51yQPU83fxd3frWcJlXQEky39t9EpkVnXpbD7h7ykaQBjdaVzOyXiXAis8vI4IRb6JF5OUFxny/lGqY7OERVRGN7bCyYHFbzN0EpOAZ8C2mGJV4GNL4aoEmrI6ZGeLKwe7/bQodfk4irxTdJfLhbSYFclFvyQvpFlEpuUUZfm/aJw98Egg8pHsf9I4lcXz0GWhfGvCxRY2DqfgShJMge73zUin6E/sak8plfLgGLhDNV3l3QGcvKwsgiFHZXes35y9h2DFLFO+1s9EJFSc8L4txDyGS4cpwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O57wXf8QTGFxw9gGS1emYmTJr7uuT/RTQdm/5MF46Ao=;
 b=Ex8602ceELHMPW3A0MxveSy3WRqHd0x/hUGKpmVjuiX5htcoCMOpEqYgITU4jWoyi+3fTetmY+54XERoC2zh9/CU6sFmGxAXV2fzvD2e110jiY0hE8YjKJdcS4vsDpzdxEfh15yLxzbgTbFxmB4HZsbzhz6tzoJlGEwMuTx5rnEKvFXoY07a7j0hnmw0rpR2aAy3xrxNuQgrfTzfwR0UTtIvlbzqVNGgDEY+J5uiA3kkVyyTPhlhY7SK4M3TDi5GvKn4Z/VtCRWrSp8iPPiRUYg5WQvl1Se6BHrK+A2MHDFHSIjrDQxkhbdKhprNl3OUNvTi3f+0tpU2ww4U3HEauw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: 
 AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbACAAAVGAIABVeSAgAAoPoCAAAP7gA==
Date: Tue, 28 Sep 2021 06:56:22 +0000
Message-ID: <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
In-Reply-To: <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67fe1168-59ab-4668-061e-08d9824d14f9
x-ms-traffictypediagnostic: AM9PR03MB7425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB74258D702110844B0CA69E3EE7A89@AM9PR03MB7425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T8YSrpALKmHRWdlIWjTHgCujExSPMLt3hyG2fb64HeP7Y3FbuyW0+TGBGxMlZnLZnQ3ydZw8XR5G0aK3aIDtQapLrGUbWiDewVEk9IKm5/I3UCDSE6oPcCiZn+t71KZYO+RItzNZyRgCj+4nDlK5u413XcjWeDmsf+YBSUMNd0K54hsis+mgogEyjim91ZU75qT5t+myxe11aFwDkjs2mMxj73XBSWWUSnQe1/6n3F3cyWP9lsBaBCQfTgSIdIrQXbt7aUWwvU20UOsoCU9mCVfVhLouWcV3tJbKbPqQ4c/V2iAwm7vOiD8vzAa4AhgsHbjJlLqPWBnB9LZPVnDvEgon7l/rAe3k+ei4i730bFZ9m6bErnPGhHOvgBMxoW4nUJIwg4eoDn1WSauBRn2Zog9iwNoiWDflGtyQ4XMaVnr0l9FSj6yDyNJblmVakeQ0P0UMbYjYW/XgcDNrddjCB6xo0fHNO3YDHLi21quwN8amUUNr/PNP1aMjzNNQwIy3TIygOarHjNKKI/r7+HW7qAmuMjCfS7r548AVqBHwcZD2r9Vuuk1hD0uGMOdhDCiq6RRSzPO/GWYV5KXXdyHMj+T6FfWjy7mZhlGOuOG03+73ZYXjZ2G4IEIxvbUHUNsimCgw/zpUaekLhFgSnu5/9AK8+i3/tr0wjSgVLrH2PEpyP/+7FXqxZg89RLsSvQdezAdbMGHJOfLvfFIA+GvNo3U+UGl5eVoXnEW956K9QpsyKopTMOp7C1qYsRa2VLSr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(8676002)(316002)(54906003)(53546011)(6506007)(122000001)(26005)(4326008)(36756003)(83380400001)(2906002)(71200400001)(38100700002)(6486002)(64756008)(5660300002)(186003)(66946007)(55236004)(31686004)(86362001)(31696002)(2616005)(91956017)(76116006)(66476007)(6512007)(66446008)(66556008)(508600001)(38070700005)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TEdndmdYZkdLOEppMGtpaHRXUFFodW5iam5GZUlPWjBESVRXRi8rclpyYnZU?=
 =?utf-8?B?V3FYaXEyTXp5R2FwQkxDNzJRdExpWlRDMk5GRWg2dTMraGlPNHppOFVCTnBy?=
 =?utf-8?B?MENqS0Q5ZVVGZlhRSHB2M3JPYXVUemZwU2RxQUJJL0c5eTRiMXpydDUxWkow?=
 =?utf-8?B?ZkxzL25USHRVTVBoWlJpKzZUVm91WkZpaXdTbGt1NWt3SmZiNkNPT2w1RkI4?=
 =?utf-8?B?Yyt4V082RWwwMGkxUG5pS3grcUpYMHBNbTEwNWxyaE5SQUh0aDg2UmluSVFk?=
 =?utf-8?B?emNlYUJSNERZc0FIanNPSGZzR1piMTBSTnlKYXJEYVh1REZtTSt0NTlCTGZk?=
 =?utf-8?B?SVZZaytmbUZQOGhWTyszclJaMjFWTCtWV1o4dzBPeWpkazUvS0ZreHk1Z2cy?=
 =?utf-8?B?bUpjZXROS3U5VVNxam5obkdReEx6akF2Zkd2OGN0K2wzZER6dnUvU2pFb05L?=
 =?utf-8?B?bW5nempDMjZjbGJJVXFFaU9JUmh3aDVmalFVMEhBVjhuZitCUFJVOVh1d0s5?=
 =?utf-8?B?dFlMSVduMUN6ZHQwNU9ERFIxaGs0LzdSV1JYdHVVelpoU1pra0c2RlgxS2U3?=
 =?utf-8?B?NVArT3lXYnhjQ2sxWFBWdVFoeUw5Z25mazNrUy9mcWd5TW93KzNIWkRPRERX?=
 =?utf-8?B?Q3lyM2N6V2tIeTg5cmo4SzNZV1lrMlgzeTZsa2JVcy96RlVaKzFCNVZVaXhF?=
 =?utf-8?B?VmNmUEh0VlQzS1ErMmdnQWhRcEpzRDFaQ3hoRXJLZGJSbVdEN1QzYTN5dVgz?=
 =?utf-8?B?S2xmSno5SDlyL2tGZTVXNi9zL2pEeWpCNzZoaWhKbnM2UGVsSGx0TnI3OG15?=
 =?utf-8?B?ZmQyRDVab3pLaS81OGJ4Y3pURlJxN3NDbDVkUmV5VmNSaDZNRmc0eFRKaVdJ?=
 =?utf-8?B?UmFhLzZxTGJDRTFTU3BQZk9URWJndnRmNUFRbkRVRHVIMm1iMzhsR2JIQU9D?=
 =?utf-8?B?T2RUd3N6c1p6NGhlSXBvbXhwTHZaYWVYVldJVVJBTEpwN3h2Uzd2a0RaQy95?=
 =?utf-8?B?Z0hzTlRzSFI3NTFXNHJqbTNOd3VWckpPZnNWeWtmQWxtVzFLR1p6RSs5Y3RE?=
 =?utf-8?B?RDUyTis1V2JaSjdIMGs3ajYwWWJycjY2YVA1YTdXdVFUQkNhYWNnSTNoU1dr?=
 =?utf-8?B?MkhhQlZuSEFPWDhGZXhFdTU0NnZBQWhkUUduYXUwd3JnT1ZPTzN5VTJjMHo0?=
 =?utf-8?B?TGlwZ1J5NXJMYkZNQ2MxVWc2YVFpY3JxQzhRbHJmcEVXWEZxWXlTQUpERm55?=
 =?utf-8?B?dFcxeFl2TDlUZWNQRU9sNEZkeVJVZnIxNDRZTHo2eXQ3SWRXbmpzTVlxSThB?=
 =?utf-8?B?S0gydXQ5ek5EN3VZOXNNMEU4N3pxUFAwREIwaE9ibm4xMFFpNUdjSEFZWUtT?=
 =?utf-8?B?Y2N1TGJsazRacjJvVFovM29zZkg1SFhkVzFFMGlpKzB3Wjh2Z3hoSXM4ZXNR?=
 =?utf-8?B?Zm1HdGJEN1BRazhWTGF2ZHYyRlZYM0pVazJlWkpjQmtLTkQ1VE9VNGNkOFBE?=
 =?utf-8?B?d29KMjU4b1JaM0dVbTNTMVlYKzlGTTFEbWFla1crRndIdUNpdURFL3ltOGRo?=
 =?utf-8?B?TEl4K1V2cVRIdHBJV1RZMmducklrU2tmRDhNcjJvSlVBZWF0a0NuanRtaG1s?=
 =?utf-8?B?R0VReiswbU91WWRqQzFtc25BWDI3cW9jR01tbzRyKzI4Vk9TUG9rR2pnL1pI?=
 =?utf-8?B?S2h4QUFKem9ERGxWUUdjbWtmZ2U4RDR4S1JlYjlJS0U2dUJwbUszUm9xcS9O?=
 =?utf-8?B?VHBCbTdzVU4raTJ1dzhGNTdzWm5VcjNPY2picDJVc3RnYVBhcnFZYXZXbU5a?=
 =?utf-8?B?YW1hQlcrSFREZnQ3aVc1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <866A7BCA3C583D409B70368A602F1C68@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fe1168-59ab-4668-061e-08d9824d14f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 06:56:22.4517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJsI9iw6lEfQkLJyDNS/WORz01YWnq/PJowLO4jhFDQfONHXbDPTmoSNaTu8lSN09rmMAMr8ZiSyebp07e58TuNd/mkXNpzqImMbM7o05NKd+9aym30N7DgVez2p2d6e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7425
X-Proofpoint-GUID: 86QRxxebSagseBb6eftrAI1xhtV5f20O
X-Proofpoint-ORIG-GUID: 86QRxxebSagseBb6eftrAI1xhtV5f20O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280039

DQpPbiAyOC4wOS4yMSAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjA5LjIwMjEg
MDY6MTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIE1vbiwgMjcgU2VwIDIwMjEs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjcuMDkuMjEgMDk6MzUsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxMDoyNiwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMDIxIDA4OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiBDdXJyZW50bHkgUENJIGJh
Y2tlbmQgaW1wbGVtZW50cyBtdWx0aXBsZSBmdW5jdGlvbmFsaXRpZXMgYXQgYSB0aW1lLg0KPj4+
Pj4+IFRvIG5hbWUgYSBmZXc6DQo+Pj4+Pj4gMS4gSXQgaXMgdXNlZCBhcyBhIGRhdGFiYXNlIGZv
ciBhc3NpZ25hYmxlIFBDSSBkZXZpY2VzLCBlLmcuIHhsDQo+Pj4+Pj4gICAgICAgcGNpLWFzc2ln
bmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywNCj4+Pj4+
PiB3aGVuZXZlcg0KPj4+Pj4+ICAgICAgIHRoZSB0b29sc3RhY2sgbmVlZHMgdG8ga25vdyB3aGlj
aCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2gNCj4+Pj4+PiAgICAgICBpdCByZWFk
cyB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhlIHBjaWJhY2suDQo+
Pj4+Pj4gMi4gSXQgaXMgdXNlZCB0byBob2xkIHRoZSB1bmJvdW5kIFBDSSBkZXZpY2VzIGxpc3Qs
IGUuZy4gd2hlbiBwYXNzaW5nDQo+Pj4+Pj4gICAgICAgdGhyb3VnaCBhIFBDSSBkZXZpY2UgaXQg
bmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSByZWxldmFudA0KPj4+Pj4+IGRldmljZQ0KPj4+
Pj4+ICAgICAgIGRyaXZlciBhbmQgYm91bmQgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcg
aXQgaXMgbm90IHJlcXVpcmVkDQo+Pj4+Pj4gICAgICAgdGhhdCB0aGUgZGV2aWNlIGlzIGJvdW5k
IHRvIHBjaWJhY2ssIGJ1dCBwY2liYWNrIGlzIGFnYWluIHVzZWQgYXMgYQ0KPj4+Pj4+ICAgICAg
IGRhdGFiYXNlIG9mIHRoZSBwYXNzZWQgdGhyb3VnaCBQQ0kgZGV2aWNlcywgc28gd2UgY2FuIHJl
LWJpbmQgdGhlDQo+Pj4+Pj4gICAgICAgZGV2aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRy
aXZlcnMgd2hlbiBndWVzdCBkb21haW4gc2h1dHMNCj4+Pj4+PiBkb3duKQ0KPj4+Pj4+IDMuIERl
dmljZSByZXNldCBmb3IgdGhlIGRldmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2gNCj4+Pj4+PiA0
LiBQYXJhLXZpcnR1YWxpc2VkIHVzZS1jYXNlcyBzdXBwb3J0DQo+Pj4+Pj4NCj4+Pj4+PiBUaGUg
cGFyYS12aXJ0dWFsaXNlZCBwYXJ0IG9mIHRoZSBkcml2ZXIgaXMgbm90IGFsd2F5cyBuZWVkZWQg
YXMgc29tZQ0KPj4+Pj4+IGFyY2hpdGVjdHVyZXMsIGUuZy4gQXJtIG9yIHg4NiBQVkggRG9tMCwg
YXJlIG5vdCB1c2luZyBiYWNrZW5kLWZyb250ZW5kDQo+Pj4+Pj4gbW9kZWwgZm9yIFBDSSBkZXZp
Y2UgcGFzc3Rocm91Z2guIEZvciBzdWNoIHVzZS1jYXNlcyBtYWtlIHRoZSB2ZXJ5DQo+Pj4+Pj4g
Zmlyc3Qgc3RlcCBpbiBzcGxpdHRpbmcgdGhlIHhlbi1wY2liYWNrIGRyaXZlciBpbnRvIHR3byBw
YXJ0czogWGVuDQo+Pj4+Pj4gUENJIHN0dWIgYW5kIFBDSSBQViBiYWNrZW5kIGRyaXZlcnMuDQo+
Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbw0KPj4+
Pj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IC0t
LQ0KPj4+Pj4+IENoYW5nZXMgc2luY2UgdjM6DQo+Pj4+Pj4gLSBNb3ZlIENPTkZJR19YRU5fUENJ
REVWX1NUVUIgdG8gdGhlIHNlY29uZCBwYXRjaA0KPj4+Pj4gSSdtIGFmcmFpZCB0aGlzIHdhc24n
dCBmdWxseSBkb25lOg0KPj4+Pj4NCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFj
ay9NYWtlZmlsZQ0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxl
DQo+Pj4+Pj4gQEAgLTEsNSArMSw2IEBADQo+Pj4+Pj4gICAgICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjANCj4+Pj4+PiAgICAgb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VO
RCkgKz0geGVuLXBjaWJhY2subw0KPj4+Pj4+ICtvYmotJChDT05GSUdfWEVOX1BDSURFVl9TVFVC
KSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+PiBXaGlsZSBiZW5pZ24gd2hlbiBhZGRlZCBoZXJlLCB0
aGlzIGFkZGl0aW9uIHN0aWxsIGRvZXNuJ3Qgc2VlbSB0bw0KPj4+Pj4gYmVsb25nIGhlcmUuDQo+
Pj4+IE15IGJhZC4gU28sIGl0IHNlZW1zIHdpdGhvdXQgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiB0
aGUgY2hhbmdlIHNlZW1zDQo+Pj4+DQo+Pj4+IHRvIGJlIG5vbi1mdW5jdGlvbmFsLiBXaXRoIENP
TkZJR19YRU5fUENJREVWX1NUVUIgd2UgZmFpbCB0byBidWlsZCBvbiAzMi1iaXQNCj4+Pj4NCj4+
Pj4gYXJjaGl0ZWN0dXJlcy4uLg0KPj4+Pg0KPj4+PiBXaGF0IHdvdWxkIGJlIHRoZSBwcmVmZXJl
bmNlIGhlcmU/IFN0ZWZhbm8gc3VnZ2VzdGVkIHRoYXQgd2Ugc3RpbGwgZGVmaW5lDQo+Pj4+DQo+
Pj4+IENPTkZJR19YRU5fUENJREVWX1NUVUIsIGJ1dCBpbiBkaXNhYmxlZCBzdGF0ZSwgZS5nLiB3
ZSBhZGQgdHJpc3RhdGUgdG8gaXQNCj4+Pj4NCj4+Pj4gaW4gdGhlIHNlY29uZCBwYXRjaA0KPj4+
Pg0KPj4+PiBBbm90aGVyIG9wdGlvbiBpcyBqdXN0IHRvIHNxdWFzaCB0aGUgdHdvIHBhdGNoZXMu
DQo+Pj4gU3F1YXNoaW5nIHdvdWxkIGJlIGZpbmUgZm9yIG1lLg0KPj4gICANCj4+IEl0IGlzIGZp
bmUgZm9yIG1lIHRvIHNxdWFzaCB0aGUgdHdvIHBhdGNoZXMuDQo+Pg0KPj4gQnV0IGluIGFueSBj
YXNlLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbW9kaWZ5IHRoYXQgc3BlY2lmaWMgY2hhbmdl
IHRvOg0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmls
ZSBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+PiBpbmRleCBlMmNiMzc2NDQ0
YTYuLmUyM2M3NThiODVhZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L01ha2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4g
QEAgLTEsNiArMSw1IEBADQo+PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
Cj4+IC1vYmotJChDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vDQo+
PiAtb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfU1RVQikgKz0geGVuLXBjaWJhY2subw0KPj4gK29i
ai0kKENPTkZJR19YRU5fUENJX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4gQnV0IHRoYXQgd291
bGRuJ3QgYWxsb3cgdGhlIGRyaXZlciB0byBiZSBhIG1vZHVsZSBhbnltb3JlLCB3b3VsZCBpdD8N
Cg0KRXhhY3RseS4gSSBmb3Jnb3QgdGhhdCB3aGVuIHBsYXlpbmcgd2l0aCBtb2R1bGUvYnVpbHQt
aW4gSSB3YXMgbm90IGFibGUNCg0KdG8gY29udHJvbCB0aGF0IGFueW1vcmUgYmVjYXVzZSBDT05G
SUdfWEVOX1BDSV9TVFVCIHdpbGwgYWx3YXlzIGJlDQoNCmluICJ5IiBzdGF0ZSwgdGh1cyBldmVu
IGlmIHlvdSBoYXZlIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9bQ0KDQp5b3Ugd29uJ3QgYmUg
YWJsZSB0byBidWlsZCBpdCBhcyBtb2R1bGUuIFNvLCBJIHdpbGwgcHJvYmFibHkgcHV0IGEgY29t
bWVudA0KDQphYm91dCB0aGF0IGluIHRoZSBNYWtlZmlsZSBleHBsYWluaW5nIHRoZSBuZWVkIGZv
cg0KDQpvYmotJChDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vDQpv
YmotJChDT05GSUdfWEVOX1BDSURFVl9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQoNCj4NCj4gSmFu
DQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

