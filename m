Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451794A710F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 13:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264108.457089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFF5V-0002oJ-20; Wed, 02 Feb 2022 12:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264108.457089; Wed, 02 Feb 2022 12:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFF5U-0002lB-VA; Wed, 02 Feb 2022 12:50:16 +0000
Received: by outflank-mailman (input) for mailman id 264108;
 Wed, 02 Feb 2022 12:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFF5S-0002kz-Lt
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 12:50:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a854a65f-8426-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 13:50:11 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212CJYdf032376;
 Wed, 2 Feb 2022 12:50:07 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dysmcr5y3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 12:50:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4363.eurprd03.prod.outlook.com (2603:10a6:10:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 12:49:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 12:49:36 +0000
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
X-Inumbo-ID: a854a65f-8426-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrTy+1XFG129aH20J/oCa99pd6EbH6lNb95YiJNYXw7FCxWUNl0l1sYxSb5ZZlJ3m8Rbiyk8/Ky/lrj4WOE0o4vv4beRb5XjZVm26Y4K/j/aicsXv8BbAIbzgYVmrehMVj6XiKOvbOFL2HCaKe5qV1/pV6BrRER/MRbBv4UZACPYVDRrwAfhfw/wTZT3y1K6c6HimPRXHWoJ9CTAIpUn0tpB1oOsaSPSblRTEo2CNkCjwIH1nKNbH8kFFFyv92TYy8xTPEndNX/KjXJsLjebiDdj9wLE/0A3vMprlphASte5tjzhLJ/0A7W25n8na5LqrmbfeFf2Bue0woLEB5m4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdwM/IjxZ8Zh3OgHK1J9dw1fGKQCbiTgpygXmiWkaCQ=;
 b=dTehYAOxpOZejyLSzskBjc/tzhbrlpE28Vr22LzRcHiAmhIfv3lONJADe7SN0i2EoE/U+vTDkokUJ3vcp5CCORezAo+E6dn3xWoirG+IpJYaduj2N+4YPeeavyZZG1qd9669aoQrHtLy3ShOV8aMPew7fgdQJ44wkvfsFeEBv9TIZHPBWHVxcM4/wCRGIpbtat7jReEnHpyD/2Z5luGJn9PwxrMzYmi+B04wpIOi9rp7j6a48HDIFyCgQ0mLoDJ1qmFGGWEhjQaHZ+0ZUtIA1AXAyMdz022KqNdxBTPALFXJ7txoI1Ut1rwXN3yJn/2YzAbrushLqfNHjjlm7d88Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdwM/IjxZ8Zh3OgHK1J9dw1fGKQCbiTgpygXmiWkaCQ=;
 b=h/Te4jx4+BGJrlTTnQAxaNXfBaojdI3PxAw783ykvS3C6Thi3orWQn6CBXEGc3Uaj/ysyshSUzi6d0DhFkcTG5y2uyjI9YJX8d4jSRvwCnoE1dL/gNA29HFkcmD7lvWQDGJZfEuji5Qvit6ZmDKo+//2wmUTQkWdc3WX9OfU4B7zxhEOSd8TXxcbQTOEViR/EMsQdz7YKAOXlnAEoyOlC4sUO9/Q9fxsSU1qxkdgHcn5zGFxnzfPwM2gLfZmD/QF+aKAdYf5yTxrmvn0c+D4hOt6WwAfCff60Qs5x3eScG8U1HlnO8iqLsxTeGJAGJJ6NwV1MYe6EOCpmc9rrZXURA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHX4ewK3mPSKCsK30iVfRQpWoVIB6xhEugAgB+P6YA=
Date: Wed, 2 Feb 2022 12:49:36 +0000
Message-ID: <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
In-Reply-To: <YeAD9PH9o65o+M+w@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9e70575-7ce8-4d81-7ce3-08d9e64a77d1
x-ms-traffictypediagnostic: DB7PR03MB4363:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4363E0B86A55A9ECD465848FE7279@DB7PR03MB4363.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lBrrSiW0ahkq3R1qOKhW5vU6OkTwnncuPWGVnJehetBISOtcWogWPnI11kNdQaweebyhn2ZVrX+QLh6NUjkMRnsnYIrOnqb4wRu8iTPO4G4YLrAjwavvFHPgFoFQdNqAJpo3+JJ2ciruD26tcB0vKaxXndM0cfsKdn9Zm+JhzBZGW3WDWNfJKWzLzERZ8Lqtvva0v/6YW1kix0K7KwdaYvRKD+sG3MmsGpFQhdipS1NbAIr24g7+n9E785pjx2THfgpa9D+KwF6MUBOSp4yb19cZvBTEtQCwgpAawUcxOMIg/L/uGMLwanxQRdtVINionQGFx45DZrYJxD69bs8Mdo2/B1SPC1SlUTUEoyP2GaMEnBofZJRxlfonoH1SCTWybrG/FbDvwsMzeNTy4wFcSQO6zcLem2PZlFYHujqkgxhDp1Ci3pbqU/PuQvFlo4z6auBbzmsedPe+OLP32aW2LFaO1MzSw6eulr5S6rSxEP9QYOxatz2NEHTzuaLzUcmwVDEFDdHPy9BGllrlQHvduNVj/9Tiflqc2rWxk5wza6dDotQ0HkZCik3fZ3QIddAZ1o0xDxNs8W1VucBqyK5KRWRox3AFd33Q4ReyASY76mersv94thGbh3waXrrX65kibK2/CL9FFUUxBNirItSSwv/qiFlXEU15FCMzFzMOWwi6E7t87KDbLh0OgyeHTKCbsfDXO6Y1JMuowTzR6FsHfSLVx61e5u1nKAMAyiWVtgI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38070700005)(8676002)(186003)(26005)(4326008)(38100700002)(76116006)(8936002)(5660300002)(66946007)(54906003)(64756008)(66446008)(66476007)(91956017)(316002)(31686004)(6916009)(66556008)(7416002)(36756003)(122000001)(6512007)(53546011)(508600001)(2906002)(107886003)(86362001)(2616005)(71200400001)(31696002)(6486002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RDJyNGFyR29uTEtrYm0ySkxyZnpmMzlTMzVFYkFKUDduMXhHRUJkaHJsUWM0?=
 =?utf-8?B?VGtsQXRMVE5Mc3dhQXNtemtxK2RaYXZHa2syczFkK0w5aHA5cXFGQ2ZWdjgr?=
 =?utf-8?B?K0pnKzNIMndHVFNKMWRCaWtZUzI1Sm8rZHhjS01FcC84dXRHYThuTTQ4Vklk?=
 =?utf-8?B?MXZmTVFrLzYyTmplcU5tSzh0TkNFblNjNDhQQWsxOEhweC8vSHEzdWRFVVND?=
 =?utf-8?B?eHFhRUdDVUVUaklhQnl5TU5LYXByTXBRQXAwNHVWWWRDV0w3SFUzY1lLZ1RB?=
 =?utf-8?B?bGtLVkFlb0VXanduZWUwWlM5NmpmNjlJb3JOcmtJN2kvUVBkNkRYT2JseVdu?=
 =?utf-8?B?R0lVeW84OEJIcVY4Y3VtZmdsNlVCb0x3bmFVZWhaaE5KLzl3RWt6YlgwdnRz?=
 =?utf-8?B?MkdLVTBsZytZV3FmQnp5NnhDaG5mK1dJR0cvR3B0VE8zaFQzdndLNU9YU1RO?=
 =?utf-8?B?QmE4Q2kwQzFiRk1vUVN3eXdKTmgvN0YvMVVCTUcyMFpMRDgyNGJFV1BINk9X?=
 =?utf-8?B?Q1l1V3FNUlN5eXBLZWh3eW96SHgxSW5tak9TMHU3RWxCRlpMbGN5THhKYTdk?=
 =?utf-8?B?N010RGNDck0wK2Y1TG4zNkJxbGhKcXZudEoySTU2WGdYRnkyNzBlbVZmeERi?=
 =?utf-8?B?dUxrTjlyRDZsVXViTmowdXRZQ1VxS0pMOG5aUUVTY2pqZVovUW80VTNhVGQr?=
 =?utf-8?B?SXRiMUQ5MXlGalJPeWU5Qm04L3FkZUEySHEvZzRQRmhHTU40OVJNQUgxeWlu?=
 =?utf-8?B?MWQvNFZmYjN2dTBUVEVKdDhjalAvelpSQWhiVnl0RnlJTmJyeUlkZDdGZ1c0?=
 =?utf-8?B?blVVK0tVMncrSDBQOVRDL2xuQmd1U3R4NEF0bVNneElKbVgvcjJXVzRQWUlm?=
 =?utf-8?B?VTdZMnJRNVFxdUVTSHBONEx0Ulo3cTZjRGZ3cVlMZERwZFh1N0w5eVZHU0Qx?=
 =?utf-8?B?cmI1bFlUcE5CVCtESUZtYnB2MU1wdnp3R2R0RmxxeEJDbWdnVjl3YVdKeitN?=
 =?utf-8?B?eGhIVVpyTmVvSTV2OEdTcGw0Wm9mZWg3dEx1TW1RZ2s4aGZ1TStPZlZkMG5O?=
 =?utf-8?B?YTI5dEZVU3FVWHJWbklMSGNaN3N5b2dPTVZXdDF6a0R6T0g4WnJJeXA3ckhx?=
 =?utf-8?B?Z2xwYmhPMnd3TU9XTWtUM3IwYTFuVHdmQnNnMCtzdW1waWRkTC96SFdjRHdV?=
 =?utf-8?B?VGM1bGFsa1d4cVNoV1YyT0kxM3ZjRWlvQ3R0aHBTRTNqTVZpa1JYZWlRMUV4?=
 =?utf-8?B?YzZ6YVN0TEJ5NlZaWmVsVHFvZ3N4Unp1OFNIcXFqMENCdHpGQXhzcWJNbWxn?=
 =?utf-8?B?NlVqWFF5VzBPc202Z3hIT0x6N3d0b1RGMTE2cEFHWnZ0NGlBbEJNemprUHdu?=
 =?utf-8?B?OUdCUGdUV01udEsxTUg5TXBad1ZwTmQ5RlJ1a29qMG1nT2dFdnJQaWRjRXV1?=
 =?utf-8?B?c0RERlJBVWNIY2o2S2lkb2xKUm1EQmszdGNoRVFTZWhKVkNGUUhWdE5zd1JP?=
 =?utf-8?B?SWR0Y3AwaXNaMlVPTjNzRTRPV3lyK2diUVl2Q2g1Uk1vQ3hQVmozbm1rajVW?=
 =?utf-8?B?TTlPdWxkOGpWMUNxRHFCeHh0OGROU1h2UncycHlEMk80b1VNVnNlSVo4T085?=
 =?utf-8?B?VHM0am1ZVGxycnBZY0szUG5jUkxaRnlMRWpNU28yVytnZzNvdm4xZXBZdnVK?=
 =?utf-8?B?NjczMkgxeUEyMVo5ZEc0ZHJ0eHhhSEVIRXpzSE91anYzTjdPcVI0dFZCVGpa?=
 =?utf-8?B?NFpKRGJwL2ZxbkFzMDlKQngzTnp1MVFMQys0NFp5OWw4a1lnZjQzQk44d3pW?=
 =?utf-8?B?eUlnekdiTEhRTEtra21KdUFWby9lQkR1akQ5UDQyak9zeU94MTJaN2hLOC9w?=
 =?utf-8?B?UFRmNnNEMDJxOHpBaS8rckIvWDVZUXY1MzBlRXIzNEc3RmxkQnlUNzBSczdU?=
 =?utf-8?B?eTNPZUxVRnFOZURvdWsxVUNzTStTL3pQZDFORVgxUVlTTkJyd1U5MWR5S2hj?=
 =?utf-8?B?azVEVHBDbmNnZ0lyVE5NQ094QXlhZGxRby8rM3VRdUc5Z0NoQ1I5WmVtVkpC?=
 =?utf-8?B?U0t0OFB3ZUNsZ2plYkY1OU9Xa0huNGlHUFdpVUFtenkvTTQ5UWdqajA0aEU2?=
 =?utf-8?B?OGxIdHRPU0x1S0FyVHEzd2p4RmhTb0hRalllQnlLWDZ5UWhPTkZDeXlMMkFx?=
 =?utf-8?B?aFVObVpXRXFNRDJMOXdXUCtxVmw0U0k2NVF0aVlOQitESCtMbVZZRE1vOFhZ?=
 =?utf-8?B?anEvdHN3ak5DaWh6SnlDTDNFTUNxcEtIWDNPVVVHZmlVVW1KN3ZoTS8vdGFl?=
 =?utf-8?B?WWtLOHk1WUVRa2FOejl0Mmo5ekFvUVFaekNJeWM5MmVjengwQ0ZqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B351846772D947ABAA61F058C6E719@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e70575-7ce8-4d81-7ce3-08d9e64a77d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 12:49:36.0415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTBYNhbE2Kp+MuI/dFYGFDUq5gpQkin1CvmwYT2zc+g2tzfux8YHxM77aeWdELUfc8czbzjJUb2LgnaQUDZcnfF1wfzeo0AUv2Ky+nqy/bapCeWavjqzbIqEjLXDM5s0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4363
X-Proofpoint-GUID: 967UGXEYKNpeqlTme2SzzMop4NpgsMux
X-Proofpoint-ORIG-GUID: 967UGXEYKNpeqlTme2SzzMop4NpgsMux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020070

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxMjo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDZQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIGJhc2ljIGVtdWxhdGlv
biBzdXBwb3J0IGZvciBndWVzdHMuIEF0IHRoZSBtb21lbnQgb25seSBlbXVsYXRlDQo+PiBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUgYml0LCB0aGUgcmVzdCBpcyBub3QgZW11bGF0ZWQgeWV0IGFu
ZCBsZWZ0DQo+PiBhcyBUT0RPLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4g
U2luY2UgdjM6DQo+PiAtIGdhdGUgbW9yZSBjb2RlIG9uIENPTkZJR19IQVNfTVNJDQo+PiAtIHJl
bW92ZWQgbG9naWMgZm9yIHRoZSBjYXNlIHdoZW4gTVNJL01TSS1YIG5vdCBlbmFibGVkDQo+PiAt
LS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDIxICsrKysrKysrKysrKysrKysr
KystLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IGIwNDk5ZDMyYzVkOC4uMmU0NDA1NTk0NmIw
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTQ5MSw2ICs0OTEsMjIgQEAgc3RhdGljIHZv
aWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVn
LA0KPj4gICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgcmVnLCBjbWQpOw0K
Pj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgY21kLCB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgICAgLyog
VE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBjb21tYW5kIHJl
Z2lzdGVyLiAqLw0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSV9NU0kNCj4+ICsgICAg
aWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPiBZb3UgbmVlZCB0byBjaGVjayBmb3Ig
TVNJLVggYWxzbywgcGRldi0+dnBjaS0+bXNpeC0+ZW5hYmxlZC4NCkluZGVlZCwgdGhhbmsgeW91
DQo+DQo+PiArICAgIHsNCj4+ICsgICAgICAgIC8qIEd1ZXN0IHdhbnRzIHRvIGVuYWJsZSBJTlR4
LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmIE1TSS9NU0ktWCBlbmFibGVkLiAqLw0KPj4gKyAgICAg
ICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4gWW91IHdpbGwgYWxzbyBuZWVk
IHRvIG1ha2Ugc3VyZSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgaXMgc2V0IGluIHRoZQ0KPiBj
b21tYW5kIHJlZ2lzdGVyIHdoZW4gYXR0ZW1wdGluZyB0byBlbmFibGUgTVNJIG9yIE1TSVggY2Fw
YWJpbGl0aWVzLg0KSXNuJ3QgaXQgZW5vdWdoIHRoYXQgd2UganVzdCBjaGVjayBhYm92ZSBpZiBN
U0kvTVNJLVggZW5hYmxlZCB0aGVuIG1ha2UNCnN1cmUgSU5UWCBkaXNhYmxlZD8gSSBhbSBub3Qg
Zm9sbG93aW5nIHlvdSBoZXJlIG9uIHdoYXQgZWxzZSBuZWVkcyB0bw0KYmUgZG9uZS4NCj4NCj4g
VGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

