Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45F4190FF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196520.349409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmAX-0001OL-HU; Mon, 27 Sep 2021 08:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196520.349409; Mon, 27 Sep 2021 08:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmAX-0001LT-DL; Mon, 27 Sep 2021 08:39:25 +0000
Received: by outflank-mailman (input) for mailman id 196520;
 Mon, 27 Sep 2021 08:39:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUmAW-0001KO-D0
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:39:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a264c70-1f6e-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 08:39:23 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R7wurf019347; 
 Mon, 27 Sep 2021 08:39:20 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bba1n06c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 08:39:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5794.eurprd03.prod.outlook.com (2603:10a6:208:157::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Mon, 27 Sep
 2021 08:39:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:39:17 +0000
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
X-Inumbo-ID: 6a264c70-1f6e-11ec-bc43-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYLMIC8fIB43CNcb7j9RRgSXPUdRliVyrM6hyWSxqKR+21nF7NZA6IbzS1KJoHsuvkk+Sey2OuH5Uw0BVhyPILB31Y6H1dk7pIjKnofZHIEsHsWSC2WLA3K+AL3bPYLLDRiLfrc9bjn+VIaDyEOUcdOXxCtifuh6TifDoCgTpKeoC8CJduzRky8vUi0DmEKFrhs4R5hYiiVvLRj9AzD08WszZaxBXNAnRw8N0JMcND9YhPXwFxzjE2mKCRPQkN4CAk+L8I0fo3vmLiit2t43sXrzj4qXqB4XTuxEdKOKbV6jMLjM4YXda6rlSLycocecLxsHO7qUGVBMHCqbBZFkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q2aDLSpXQzKyLXfEm9nl2qdd4wWIywY4rPfbjIgqjlY=;
 b=bH6nj78xW+ki0GtcHpmEzibT0kf9RjLg+o/3wV9zVmt/cSf7JWultHzdXf0g6Q8JyncHdZOMbYmLQIYkYsrkrYsMUh52eTI1zwFTbW5O2FujWyeHZsCb2eF0btYzLHKYaBqlIHhHTnyk7T1yIAAjV7KxxxEbcrKumbyxPKwr41HEl3QUS4XoGD84f6Wv09fQE0nsB9L0M7f/r2wA3+xE9Jh/DLhWFK0f3Ju55NS/sgV5IpLXvu0/4bBE9sq5sanUijx9qUppftkXX2b07Be0WZ3NehboVHbXJ+suwNroujTsiIUvsXM1lM+183SGYFpsgrL6FcaKDaWT5C2UezIamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2aDLSpXQzKyLXfEm9nl2qdd4wWIywY4rPfbjIgqjlY=;
 b=r6wwJfOTrMFSgdsoy0UydrLf58q1H24+bgEWcqlM8p5Tu86NDuQyTU2QnC1k7TGPpPBNXaxpKN+0V0YD5Der2owF07VIF8Vl8fqXg3QVLy7tx1wui23R/d2uU4h7sYKULVp7SPi+QWgWYYKIHi918cgzkqLXou1PYxhweRi97J0d9YU/4+rfmSExTLEpF6hBMwBw2NpQRZfZyuKgNoGQYFD7bvNm9UCFC0fNhSDIU9sCrVxFl+s90+XHjZ6DZVxWgm2vLl6oTcIUeo+HwUfBtqqMutwQqcakcFIdoqMmN/vErB5/15ZKDPl4Im0y0IIBKIofNtkUN9sCXPhwVzQYBw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        Oleksandr
 Andrushchenko <andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 11/11] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Topic: [PATCH v2 11/11] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Index: AQHXsHo2LHAX3buXA02kyLB7DlUL6au3jCIAgAAJOQA=
Date: Mon, 27 Sep 2021 08:39:17 +0000
Message-ID: <c2a9d992-082f-534a-a649-746cebc8b1d2@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-12-andr2000@gmail.com>
 <7bb451e0-9a99-e2b4-a2be-0377de38c0be@suse.com>
In-Reply-To: <7bb451e0-9a99-e2b4-a2be-0377de38c0be@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4611c79-d4f6-4c6e-dc9f-08d981924b22
x-ms-traffictypediagnostic: AM0PR03MB5794:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5794354BD3D37E5F1FC6F5B8E7A79@AM0PR03MB5794.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jnj2SZ2gfH90A08M4rVr224oYhvl8tqnzWfL4HVYnBCDaMtjv+8sZIgIcVE2imo0v34PqYu56p/WnZn4sLjAJQTyOKG8B8/5bfr/lv1pK9BT3tZhA+uiMBnMs83WCaZsHxbRj4JkzBNfskHt7kEo4cs4cv/0NFEfCzScneqBhrw01cIBtWLHQZ1WxAUYHSjmSPcIV/l41XZZK0nu3M6XvcrCmEfNfPOqXzrh1wVfaNsAcBFC4X4n6Mx27kalrFDo+r9qNZbTWdquLMiaTLlkWiQZ8jRsGatGvACQY3QfxC4OrA4PN+C9gUJQilEqaYErgfIJaER8w2UTZ+Xh6caJXJwJgORM78ZW1npY3quLo2OK74NkUOv8fRSziamYlld9Pjuu3TSttZU75SbhbKhgqKJaqw197JXeAL02M1v2Teo9zJnnNUnPan5/GuLiyXWB7zkAZhXOl38sEcBGNX9IItbIso8jugzpHe73v9WYFDskMEIjM4CA68Swq+nrys1YcuyDQQXO5lu2Mtvd44j5oDye+QXMV1v5RZlUyQwlVDzUhClANr91OGicNXyJb9fVwKzE+czRmJcNSawx7qVi1VHP5Qn7WSpXEb4aL1KXdIe8ok6ctY59fZe8Zuarhwq11pIFarb29Nqw19HUxVRIXf9g8go6ZaXAZehG5KLlFD22fLO+7Eo++DGO1/C90zZ2dc+jnB0se/eMm0YmWs5p0O3+KMsrAxmINKoLRnLS3f8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(38070700005)(66556008)(6486002)(31686004)(2616005)(186003)(2906002)(71200400001)(66946007)(8676002)(316002)(36756003)(64756008)(26005)(6916009)(86362001)(66476007)(5660300002)(38100700002)(83380400001)(6512007)(6506007)(122000001)(54906003)(4326008)(8936002)(91956017)(55236004)(53546011)(508600001)(31696002)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OHFwS3ZZYmhUTHRqYVREQlRxSEpGYXdFdXVxR2d0aWpIaCtHUDdRRnhNT3or?=
 =?utf-8?B?K3VEbHZsZVFXUDRuWlZiOEp2b2lQTWRCbGVuWHZESHFkRm1aQWQ0NnRFVnJU?=
 =?utf-8?B?dXRUcFNMRFFCbG9LdXJkYkJ2ZEVTd2JTWGVibEJJbWZ6UmpteU9CUXd5bktU?=
 =?utf-8?B?VWoxY2plYXE1UUJCMndHTnplbkd5eWdEcjNodTdubzVOOEF4WkdqSDQ5akp5?=
 =?utf-8?B?dlg5NHJXOXYwSExkZ1MzQnBaTncxMGNramNHZWJtZWRkQUJ2VmZjSjQzNnhX?=
 =?utf-8?B?dlV4YmpnaUUrSktqa1M0NEoxbjhEUjZWYzRwM0pBWTZRejNEcm9zRVM3aGRF?=
 =?utf-8?B?ZW5TRDk4a0tQWHRUQkxSWUs5NFhEaHk1Z1J2SmlkS001NjhTdDZqMXUrMEJ4?=
 =?utf-8?B?b1VBTmEyUm0rd3BSbG9IUFZGUXpRQWgvY3ltZEwzT09WNW5LZDR6NEZzYldZ?=
 =?utf-8?B?L0szcGRGK0lHV3RnWHZhVm9MTmw0UlVmWmJuVFZuSmh1V0Q3SkFxWmsybjYy?=
 =?utf-8?B?RnoxRU54a0pkU09PU1BBSEdrb3BEOWZ4ZDB5ZWFsQ1dtNWtWMWJMdTZyaXR4?=
 =?utf-8?B?cHp0ZFhienk5Q1lzUjdjTDlKWDlGUllOTVkvZXIxOFRWSEwxQU1lMXJ6NlRC?=
 =?utf-8?B?MGJxQU5DZkRMTUkrRnV3clZBSjdqL09tQTM0MTZIRG5FNlptM0dFSGRBVEwr?=
 =?utf-8?B?SGtnYm52QjNHV21jYjV5bGt6UVdmeHNJYWlic1lwNlFucksxY1ZTeUp6WUVz?=
 =?utf-8?B?RTgxYzd6L0pDbGZ6MlBPeTFSVG9jTEdHTXNXaEdJdmdkODZ4VkVQNmtlaHNM?=
 =?utf-8?B?aWhkRng3bEtTUkJ1Y0V2T0hPcFhuK1JIWkxmL0IyYW85c3YyS1FRa1ZQMi9u?=
 =?utf-8?B?VlpFbDdmdWR3cS9nOTlNc2YvVER0VHI5ZEd5MXl5TjBuK08vNUc2b3E1UlVE?=
 =?utf-8?B?V1liWU5EL1V5UVF0MU04TFlGM0hWQjJrU3BVSHZMRFdxcG9NcHNZV3Y4ei9X?=
 =?utf-8?B?bmp2UGs1SHRMMEF6VVNsVFRMd1N5S1ViQ2Nhc1JWSkhEK095NkNDczZGMlNt?=
 =?utf-8?B?U2VSa2JnMW11Si8zd2JWUGU0UmZhYkErNUUvbU9PS0xtYkRlcXp2eFU2dVFV?=
 =?utf-8?B?RWdGcEo1N0s1ZlhXa09jczdhUHNDS1J1cjRuZ3R4MnRod0xVQmxIWWNxeGEr?=
 =?utf-8?B?WWMzbUtwMFd4UjhBbkhoN3Zqa056cmNQeWthMm12RHdUd2hqOXZUNEFIS3Jn?=
 =?utf-8?B?ZVVTN2VWR2NKZy9JNVBBU3p2K2I5QkMvWjM2U3lDcGE1SUVYQ0JUNHRhTXM0?=
 =?utf-8?B?UjI2Rklnd2t1czh6TE0wT3NjRC9SY2dDZUx2a3FsbGdnT0dEYUtsaWNDK1Ru?=
 =?utf-8?B?QzRWalp4NWxBcUpqQU1CaHhrSVZQMmR0OStzaG5iKzdpYjZEWWdzZzlXNThS?=
 =?utf-8?B?NWNOaFIvN0hPR3krSzN6NWYySSs3WFVCRVVvMHYwb3h1RG14K25vUmRZSHZ3?=
 =?utf-8?B?Ty9JQ21JNTk0N01NTWVLTWp6V2dSZXhxbldHcEZ1cFFhN2g2YkhHdWxxMG8r?=
 =?utf-8?B?b2pnQXNYVDY0N2JWSXN5cFQrQnA5c0lUZEtsMXJhQWRqK1NOdW8yV0JtUHU3?=
 =?utf-8?B?eW4rUzU3WDZmNXA5ZWFnWHNsQks1ZHRNeWFGWHBzNDlTYytFeGxVRldrNFVu?=
 =?utf-8?B?V0NHekZ0Z01BZ09OSmpWZmRsNnIzMVRycGlsOEhDamljSXJBSXU3TTNqOFZY?=
 =?utf-8?B?YVRwaW5LZ2EvWXVRRzg5aG8rYWI1a1NPUnh5aFRwSFZxZ0ZaUTRRODF3Qlh0?=
 =?utf-8?B?dlJweUptcGFPU1B5V0pvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48883AD8706C784E87D39BD652AD1733@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4611c79-d4f6-4c6e-dc9f-08d981924b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 08:39:17.3827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAWqRGhbpd135VCvgdk6rCQwZAi/nODxRfNSTAyY7QAYR+IpxaZKk6FHj79XBsZ23SD5U9VRcsS/QzfV1uhDtFggQ1cL6O9VA9Eb11fdynzjFkFPjn7ip9BRPK9XS89R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5794
X-Proofpoint-GUID: Lh0rfd6SdPtnrdcBugNJqPEzLCuXvbBz
X-Proofpoint-ORIG-GUID: Lh0rfd6SdPtnrdcBugNJqPEzLCuXvbBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270058

DQpPbiAyNy4wOS4yMSAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ICsgUGF1bCAocmV0YWlu
aW5nIGZ1bGwgY29udGV4dCBmb3IgdGhpcyByZWFzb24pDQo+DQo+IE9uIDIzLjA5LjIwMjEgMTQ6
NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IHZQ
Q0kgbWF5IG1hcCBhbmQgdW5tYXAgUENJIGRldmljZSBtZW1vcnkgKEJBUnMpIGJlaW5nIHBhc3Nl
ZCB0aHJvdWdoIHdoaWNoDQo+PiBtYXkgdGFrZSBhIGxvdCBvZiB0aW1lLiBGb3IgdGhpcyB0aG9z
ZSBvcGVyYXRpb25zIG1heSBiZSBkZWZlcnJlZCB0byBiZQ0KPj4gcGVyZm9ybWVkIGxhdGVyLCBz
byB0aGF0IHRoZXkgY2FuIGJlIHNhZmVseSBwcmVlbXB0ZWQuDQo+PiBSdW4gdGhlIGNvcnJlc3Bv
bmRpbmcgdlBDSSBjb2RlIHdoaWxlIHN3aXRjaGluZyBhIHZDUFUuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPj4NCj4+IC0tLQ0KPj4gU2luY2UgdjE6DQo+PiAgIC0gTW92ZWQgdGhlIGNoZWNr
IGZvciBwZW5kaW5nIHZwY2kgd29yayBmcm9tIHRoZSBjb21tb24gSU9SRVEgY29kZQ0KPj4gICAg
IHRvIGh2bV9kb19yZXN1bWUgb24geDg2DQo+IFdoaWxlIHBlcmhhcHMgb2J2aW91cyBmb3IgQXJt
IGZvbGtzLCBJJ2QgbGlrZSB0byBzZWUgdGhlIHJlYXNvbiBmb3IgdGhpcw0KPiBzcGVsbGVkIG91
dCBpbiB0aGUgZGVzY3JpcHRpb24uDQoNCkkgd2lsbCBhZGQ6DQoNCklPUkVRIGlzIG5vdCBlbmFi
bGVkIGZvciBBcm0gYnkgZGVmYXVsdCwgc28gcGVuZGluZyB2UENJIHdvcmsgaGFzDQoNCm5vIGNo
YW5jZSB0byBiZSBleGVjdXRlZCBpZiB0aGUgcHJvY2Vzc2luZyBpcyBsZWZ0IGFzIGlzIGluIHRo
ZSBjb21tb24gSU9SRVENCg0KY29kZSBvbmx5LiBGb3IgdGhhdCByZWFzb24gQXJtIHByb2Nlc3Nl
cyB0aGF0IGluIGFyY2ggc3BlY2lmaWMgY29kZSB3aGljaCByZXN1bHRzDQoNCmluIHRoYXQgdGhl
IHByb2Nlc3NpbmcgaGFwcGVucyB0d2ljZSBmb3IgQXJtIHdoZW4gSU9SRVEgaXMgZW5hYmxlZC4N
Cg0KRm9yIHg4NiwgcHJvY2Vzc2luZyBvZiB2UENJIGluIElPUkVRIGNvZGUgYWxzbyBkb2Vzbid0
IHNlZW0gdG8gYmUgdGhlIHJpZ2h0DQoNCnBsYWNlLCBzbyBtb3ZlIHRoYXQgdG8gaHZtX2RvX3Jl
c3VtZS4NCg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9odm0uYw0KPj4gQEAgLTU0OSw2ICs1NDksMTIgQEAgdm9pZCBodm1fZG9f
cmVzdW1lKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICAgICAgaWYgKCAhdmNwdV9pb3JlcV9oYW5kbGVf
Y29tcGxldGlvbih2KSApDQo+PiAgICAgICAgICAgcmV0dXJuOw0KPj4gICANCj4+ICsgICAgaWYg
KCBoYXNfdnBjaSh2LT5kb21haW4pICYmIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHYpICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsNCj4+ICsg
ICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPiBOb3RlIHRoYXQgeW91J3JlIGFsdGVyaW5nIGJl
aGF2aW9yIGhlcmU6IE9yaWdpbmFsbHkgdGhpcyB3YXMgZG9uZSAuLi4NCj4NCj4+IEBAIC0yMTIs
MTkgKzIxMCwxMiBAQCBzdGF0aWMgYm9vbCB3YWl0X2Zvcl9pbyhzdHJ1Y3QgaW9yZXFfdmNwdSAq
c3YsIGlvcmVxX3QgKnApDQo+PiAgIA0KPj4gICBib29sIHZjcHVfaW9yZXFfaGFuZGxlX2NvbXBs
ZXRpb24oc3RydWN0IHZjcHUgKnYpDQo+PiAgIHsNCj4+IC0gICAgc3RydWN0IGRvbWFpbiAqZCA9
IHYtPmRvbWFpbjsNCj4+ICAgICAgIHN0cnVjdCB2Y3B1X2lvICp2aW8gPSAmdi0+aW87DQo+PiAg
ICAgICBzdHJ1Y3QgaW9yZXFfc2VydmVyICpzOw0KPj4gICAgICAgc3RydWN0IGlvcmVxX3ZjcHUg
KnN2Ow0KPj4gICAgICAgZW51bSB2aW9fY29tcGxldGlvbiBjb21wbGV0aW9uOw0KPj4gICAgICAg
Ym9vbCByZXMgPSB0cnVlOw0KPj4gICANCj4+IC0gICAgaWYgKCBoYXNfdnBjaShkKSAmJiB2cGNp
X3Byb2Nlc3NfcGVuZGluZyh2KSApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIHJhaXNlX3NvZnRp
cnEoU0NIRURVTEVfU09GVElSUSk7DQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAtICAg
IH0NCj4gLi4uIGZpcnN0IHRoaW5nLiBBbmQgSSB0aGluayBpdCB3YW50cyAocGVyaGFwcyBldmVu
IG5lZWRzKSB0byByZW1haW4NCj4gdGhhdCB3YXk7DQpXaWxsIG1ha2UgaXQgdGhlIGZpcnN0IG9w
ZXJhdGlvbg0KPiAgIG90aGVyd2lzZSB5b3UnbGwgbmVlZCB0byBleHBsYWluIHdoeSBub3QsIGFu
ZCB3aHkgdGhlIGNoYW5nZQ0KPiBpcyBjb3JyZWN0IC8gc2FmZS4NCj4NCj4gSmFuDQo+DQpUaGFu
ayB5b3UsDQoNCk9sZWtzYW5kcg0K

