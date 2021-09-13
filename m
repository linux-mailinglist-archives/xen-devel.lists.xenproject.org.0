Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E640865E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185525.334216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhEB-0002SJ-CX; Mon, 13 Sep 2021 08:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185525.334216; Mon, 13 Sep 2021 08:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhEB-0002QW-7m; Mon, 13 Sep 2021 08:22:11 +0000
Received: by outflank-mailman (input) for mailman id 185525;
 Mon, 13 Sep 2021 08:22:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuNF=OD=epam.com=prvs=989052e8b7=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mPhE8-0002QQ-RL
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:22:09 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aee17370-146b-11ec-b3a4-12813bfff9fa;
 Mon, 13 Sep 2021 08:22:07 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D7hNx2029185; 
 Mon, 13 Sep 2021 08:22:04 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b22ce05p1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 08:22:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3469.eurprd03.prod.outlook.com (2603:10a6:803:18::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 13 Sep
 2021 08:22:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:22:00 +0000
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
X-Inumbo-ID: aee17370-146b-11ec-b3a4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhT6MPZedpjhwYBvFwYJQq5W+Bgkjsxs/3JG5++wDLNMs5Qdy6Hd603JPQg2xaNWSh0uCMbx/eqKM/UfBM8HyZaoI6F156AkX/5dopgMY/l5l7/K8CfIzR2WbzY1CSo1oAZGaIs5ZUhXQjyM67LNBkCu04Pri1SOOaB6B/zWKk8RnEtofnn3hCMxHT50cPo5pQaPhgGLXtYe9dgiG8eZFuMbLr9UhqPYN9uiBnnYFNabzOtLFPTND/rQZuVUtmlNMHUkEctQVOb1tYFLl4bzzFkUo3Q0vLG8cX43GS6Nus2Ekk/bp4VdNq67LT0oifcAD61MbdsKj61dItQmr1ZbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hLCrlE47htuFoiiNNJ7KZVlAtSUvVGF9KRKk4rTBB3g=;
 b=Ov9h2kSWr0MEAIG5xZxohoeuJbhaob/gQ+cH+q9aOrBlq5S/OKlJ7SG+kBXbt8T9xit10xSAVHlzCGTij0MdIFj5xQc1mK6Fubwpnye0vlr+UGcnECxAeoxCCAdN9wEs5wEH2qYBwHmLw0WdnValflN2q3hC1NmRlKVqMdWSsDI/fvhDp48EA/nIYidQxu+9v7bcwH0ys/7tihO+27lSfkMh6c/oCYDJLVicF2bVcPWMO2eoCUhIqOV60Ngit+uv5PV57zoKbALUO4Jib5yBnq27PkEFLekEBhFPeLioe4fboLJP9k10ndB5WuZGzWLBlt9ZWR4PvNQB7/1E8H2eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLCrlE47htuFoiiNNJ7KZVlAtSUvVGF9KRKk4rTBB3g=;
 b=IwS/AT8qG/+L+8R8RDC5hvRRVZ77CAVbhZcAMEl2HODsoja11oYda79NOgJDmCOHtHUme6gDZLivtSxZfe5FEYevF9F1kYuNN0y2PrpzQDcWYLqQXdoSAe0Eb+93EviCFBQFrXk/f02ZOI689kUSXN4aSyqVJfGWwpPlTWkEBM2BuQ+strGl9wNqEjBk8+/aXioogtVN3jwovMJXSVvYJF7mCAv1A2cAYymvrS6650a7Ao/OrRldCde1HQanvKmp5hf4lO2Zezlo9V4YqD+OkLrio/1oYNgZkFuYXFJrXUaZDQoFdtMULm3ekSNj1Jbo4fdMue+oOl32oU36dOZCWQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>, Ian Jackson
	<iwj@xenproject.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXoJ50aOdU36kT/0mQrZPJ6sbBAaudrMcAgAQC04A=
Date: Mon, 13 Sep 2021 08:22:00 +0000
Message-ID: <b08e50a0-539e-3405-cc1a-8cab8232e037@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-9-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101159100.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109101159100.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f179484-dcca-4397-5662-08d9768f8f21
x-ms-traffictypediagnostic: VI1PR0302MB3469:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3469DDE5880F42D040CC2523E7D99@VI1PR0302MB3469.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3z3xZAP2g9T63YSjmEqTCMR3QBR7HOlgAlybX/xhQczmuOFhfPqH+NuvODTbV+MIm/2SHmBW1p4JHRKyQhZh7OZ1xwE2NsAQb4bMWhtdZ4sh9SbP2VgzBCnt6xPIQkAIlc1xNasNFiAr5K4HjDTKQUpdRlO0M1Pr8H/+LdOpXZTkwWDwKOOW583Mlg7kziAVf5VYrsz2C1ZviW5lwL223+nVHfSCUb+2hcMRhg6bLe2PYFgSE3l4kclbCuCLGzogwS4Dvbs1p/LhzSfwK0n5vMe2LMpZYcqtXd6q+rpUawjjoUb3A/nL0ONpfaAD6nFsEHjdCVoahjS9JkbnFyNCC/VSXvXF+8Cs13IIkDeg0R8eRf6pwXimgOyHtAu0oeFJhS/TxLjAlgfmDwom6V6Q0mX69bBXOI+d/pm+Mg0ihrIIHrdN2L9AjLA+2GbMCcsNdtOr+6IhnwgK6F/PzFwmu5KGh8/iy1m3wmtUDLXzaacNhdt9wxAkPUO8EbU4GIr/2RoGVzV7UpFvnH1nL/yvaQ5yJgJl+OCl2hhvswUjFE1usaaMj7VhMoiyVgmMxzE3DPDyJAdHKtJgNdFENSm7r9PtDc9BetHu5ezpWkj4n/Uoc3hXjVyOvZ2hTCi11RMCrxzkdbxNx+37xcexFkc6oQQrW/H55G+yVevE0NcnJJH4cvv+3+/oO7zpuM8+XoPyx3uGU8tm7f4zJLs95MvCsNZuRzP8rVf70weiMiiZnELe06Rp96UmaVPNFoggH9EV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(76116006)(186003)(316002)(122000001)(55236004)(478600001)(5660300002)(2616005)(66946007)(38070700005)(53546011)(66446008)(8936002)(31696002)(71200400001)(36756003)(6512007)(86362001)(31686004)(8676002)(91956017)(54906003)(66556008)(66476007)(64756008)(6486002)(4326008)(83380400001)(110136005)(26005)(6506007)(2906002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UElpZTQyRmdPUGtIR1FkUjJjeGhjMGd5UW5aTENZRXNLbm5Zc1BmSm8vbnJj?=
 =?utf-8?B?enJOQlRCcW9ZVlhJMVp4VlJkalhZVEgramU5cHdyLytTRnZvc21IUW1XYlln?=
 =?utf-8?B?MGRyb2JJSXN3d2RMaTVMZnJPbHRLVDk0NXB1Tk9PSVZqWW81NUxKdXgrTGM4?=
 =?utf-8?B?RytWUjBTWTN4Ny9yWHNIUmN5THo4d3ZUZE1FVVY3VTBVNFk4cyszUTlpdVo5?=
 =?utf-8?B?dWpUZHJKSEJzNkRleVpTWjNJRzU3U1FtTjZMTVhUcGJuS1h4K1dpeWpGbVJ6?=
 =?utf-8?B?T3VNODlhS09zUzh1K3ErNXYxTDd5ZGlEdTFCME10VTdnZmljRVR4Q0lXeWcr?=
 =?utf-8?B?ME11Mm5pc09QcjBKbnA4aWtSTTRXNi9CYlZIWkY0eWV0S2VGejY0N2dWMXpy?=
 =?utf-8?B?UE9uOHBmMVVQcUE1WlBqeGF5QzhRYXU0RUt1VUVOZnBTMjlqdUxZbDhxUXpr?=
 =?utf-8?B?SGZYcHc5d0xaSENDZldTeWEyaTVTVDJsUGVUK3lwMFBhY3QybDZ1Q0wzcUNX?=
 =?utf-8?B?K1ZGOW9VamhNRzZEMVo2dTd2SlZLUEpjajhVcG5oSzVTTE5MdzF3d0o4RHdm?=
 =?utf-8?B?UW45NitsTnJ6dXhCOG9KQ2FHSWVzMkJlV0hoWG0yUlNqWUpYd1Y4OEpDcGtI?=
 =?utf-8?B?MFl2YU9jMGFiM0ZQVHpyU1RPMU9UQkZ6QjczMDhJN01QM1QwRkluRkpGT2gy?=
 =?utf-8?B?NHcyREN2dFdGSFl0Uk4wNUNGVEE0VDEzaXgyN01qMVdrcWRmSTVBRytQT1pB?=
 =?utf-8?B?SE1QM3hmSkFsL2N5cGczQk5acFdYc2hvekJtM0tzMm9oTW1xVk5VMW9pYk9O?=
 =?utf-8?B?L2Q2b3pVL1M2T2dGWUVCa3FiVmQ2S2t3bGg3SFdWaDlxTjNrQU1ZVFFZU2RL?=
 =?utf-8?B?ZEpYM3gySVZIZVlPQUdOWFRJU1VzSmVlVTZUb3RaZkM2UVJ3YzJKRzFSVFZW?=
 =?utf-8?B?RVpNb3VQa0Q5KzlvRUFqRXNrOS9XWVM2ZEJwSkNoYlZoSkFqTTNId04wZ1BP?=
 =?utf-8?B?bW1vRzBXcEZKeFFoa2M2WDY3TG9VWFUxU0gvQTFlSkxPUHdKWXc5YkJSUWx3?=
 =?utf-8?B?WGhaSmxCamtFMmxRaTAwcDVmek1QUFF3Q21yTUcyZERXd21UNjR2WFVyYUpw?=
 =?utf-8?B?RFJiVFA1WXhSNEpzTm9pRncrRk1oR0IzSDFLRVBwdStXSGl6S3FrL21zRzBq?=
 =?utf-8?B?dHRWbk4ybGptK2dnckhyODRTMStxc1lDelV3TDNxUjMzMFFaVEdPS29idkZW?=
 =?utf-8?B?TEFyRUR4aEVVMHdPdk5FamNZWEdaeWorSFFnaE5xL2FNKzF5cXlQV2JxYXhh?=
 =?utf-8?B?Y2lDTUJzdmtaWjNYVXU0QzF3MlE2Y1FpWjVBT3o5azMvaWlKKzdjSjY1L2ZT?=
 =?utf-8?B?NURRNHhZY3ZMeXJPb2xXSjRHc005Y1kzZ0VobytFVW1LMk5zV2pDV3FaVVhZ?=
 =?utf-8?B?VWJsNnRzZmNqNWV4OU1vYWxaZnRtcHBmOU0wTTNBeS9XNFdXdG1Vbk9jWEpy?=
 =?utf-8?B?VUZtUEgzNzRaYnJNT29pUzJSeC81bG9PRUNmb2xZVzBiZ2ZrSXBERlY3UXNy?=
 =?utf-8?B?YTFnOXZlOU1kM2JQeDZIdFBFWlN2TktSNmQ3R2VseGtmOXlBeUFJUkJpSG8y?=
 =?utf-8?B?dzN6ZnNySG1QamV5Y2E1M3A0TGhzYWJwMEtyazUzWnQ5U29aV3NkSVg3eWFF?=
 =?utf-8?B?TlZqQ2dkTWs2RTVtbm9nSEdGZXRKM1VJczlueXUvOTBOYXoyQlFXQ2VURTYv?=
 =?utf-8?B?RDgrNWwzQnZnd0cwRFQ3YnE1Ukh0b3pmdlVtOG1ociszR3Nad2VCbzAvRklv?=
 =?utf-8?B?VkE0eXNXS20xdjRCU0dLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC219145F5BF4458629104A001B0B63@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f179484-dcca-4397-5662-08d9768f8f21
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 08:22:00.2188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugwZpzJQIr5SO1TdMDZJ4oXpFc5jXRmVs+iTQzPvvtHMUQMTaZXcAolNJHYLJn/v9Y80tnhpjxqM1Ost7odVh+4VH1PR5/QbaTVKkGWW/d9YxhmwQ9qHOlx7v69HGGNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3469
X-Proofpoint-GUID: Re8M0SN2t1EEjNV5LImhxSo57cjOybio
X-Proofpoint-ORIG-GUID: Re8M0SN2t1EEjNV5LImhxSo57cjOybio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130055

SGksIFN0ZWZhbm8hDQoNCk9uIDEwLjA5LjIxIDIyOjA2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+IE9uIEZyaSwgMyBTZXAgMjAyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+DQo+Pg0KPj4gQXJtJ3MgUENJIHBhc3N0aHJvdWdoIGltcGxlbWVudGF0aW9u
IGRvZXNuJ3Qgc3VwcG9ydCBsZWdhY3kgaW50ZXJydXB0cywNCj4+IGJ1dCBNU0kvTVNJLVguIFRo
aXMgY2FuIGJlIHRoZSBjYXNlIGZvciBvdGhlciBwbGF0Zm9ybXMgdG9vLg0KPj4gRm9yIHRoYXQg
cmVhc29uIGludHJvZHVjZSBhIG5ldyBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUSBhbmQgYWRk
DQo+PiBpdCB0byB0aGUgQ0ZMQUdTIGFuZCBjb21waWxlIHRoZSByZWxldmFudCBjb2RlIGluIHRo
ZSB0b29sc3RhY2sgb25seSBpZg0KPj4gYXBwbGljYWJsZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+DQo+PiBDYzogSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4+IENjOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgdG9vbHMvbGlicy9saWdo
dC9NYWtlZmlsZSAgICB8ICA0ICsrKysNCj4+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2ku
YyB8IDEzICsrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvTWFrZWZpbGUgYi90b29s
cy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiBpbmRleCA3ZDhjNTFkNDkyNDIuLmJkM2Y2YmUyYTE4
MyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvTWFrZWZpbGUNCj4+ICsrKyBiL3Rv
b2xzL2xpYnMvbGlnaHQvTWFrZWZpbGUNCj4+IEBAIC00Niw2ICs0NiwxMCBAQCBDRkxBR1MgKz0g
LVduby1mb3JtYXQtemVyby1sZW5ndGggLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyBcDQo+PiAgIAkt
V25vLWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV2Zvcm1hdC1ub25saXRlcmFsDQo+PiAg
IENGTEFHUyArPSAtSS4NCj4+ICAgDQo+PiAraWZlcSAoJChDT05GSUdfWDg2KSx5KQ0KPj4gK0NG
TEFHUyArPSAtRENPTkZJR19QQ0lfU1VQUF9MRUdBQ1lfSVJRDQo+PiArZW5kaWYNCj4+ICsNCj4+
ICAgU1JDUy0kKENPTkZJR19YODYpICs9IGxpYnhsX2NwdWlkLmMNCj4+ICAgU1JDUy0kKENPTkZJ
R19YODYpICs9IGxpYnhsX3g4Ni5jDQo+PiAgIFNSQ1MtJChDT05GSUdfWDg2KSArPSBsaWJ4bF9w
c3IuYw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBpbmRleCA1OWYzNjg2ZmM4NWUuLmNkNGZlYTQ2
YzNmNyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsr
KyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBAIC0xNDM0LDYgKzE0MzQsNyBA
QCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAg
ICAgIH0NCj4+ICAgICAgIH0NCj4+ICAgICAgIGZjbG9zZShmKTsNCj4+ICsjaWZuZGVmIENPTkZJ
R19QQ0lfU1VQUF9MRUdBQ1lfSVJRDQo+IEFzIEp1ZXJnZW4gcG9pbnRlZCBvdXQgdGhlIGxvZ2lj
IGlzIGludmVydGVkLg0KPg0KPiBJIGFsc28gdGhpbmsgd2UgbmVlZCB0byBjb21lIHVwIHdpdGgg
YSBiZXR0ZXIgd2F5IHRvIGhhbmRsZSB0aGlzICNpZmRlZg0KPiBsb2dpYyBpbiB0aGlzIGZpbGUu
DQo+DQo+IEZvciBpbnN0YW5jZSwgY291bGQgd2UgbGV0IHRoaXMgZnVuY3Rpb24gdHJ5IHRvIG9w
ZW4gc3lzZnNfcGF0aD8gSQ0KPiBpbWFnaW5lIGl0IHdvdWxkIGZhaWwsIHJpZ2h0PyBJZiBzbywg
d2UgY291bGQganVzdCBoYXZlIGFuICNpZmRlZiBpbnNpZGUNCj4gdGhlIGZhaWx1cmUgY2hlY2su
DQo+DQo+IEFsdGVybmF0aXZlbHksIGNvdWxkIHdlIGhhdmUgYSBzbWFsbCAjaWZkZWYgcmlnaHQg
aGVyZSBkb2luZzoNCj4NCj4gI2lmbmRlZiBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0KPiBn
b3RvIG91dF9ub19pcnE7DQo+ICNlbmRpZg0KPg0KPiA/DQo+DQo+DQo+IEV2ZW4gYmV0dGVyLCB3
b3VsZCBiZSB0byBpbnRyb2R1Y2UgYSBzdGF0aWMgaW5saW5lIGFzIGZvbGxvd3M6DQo+DQo+IHN0
YXRpYyBpbmxpbmUgYm9vbCBwY2lfc3VwcF9sZWdhY3lfaXJxKHZvaWQpDQo+IHsNCj4gI2lmbmRl
ZiBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0KPiAgICAgIHJldHVybiBmYWxzZTsNCj4gI2Vs
c2UNCj4gICAgICByZXR1cm4gdHJ1ZTsNCj4gI2VuZGlmDQo+IH0NCj4NCj4gVGhlbiBpbiBsaWJ4
bF9wY2kuYyB5b3UgY2FuIGF2b2lkIGFsbCBpZmRlZnM6DQo+DQo+IGlmICghcGNpX3N1cHBfbGVn
YWN5X2lycSgpKSkNCj4gICAgICBnb3RvIG91dF9ub19pcnE7DQoNClRoaXMgb25lIHNlZW1zIHRv
IGJlIHRoZSBiZXN0IHdpdGggbGVzcyBpZmRlZidlcnkNCg0KSSdsbCByZS13b3JrIHRoZSBjb2Rl
IGFzIGFib3ZlDQoNCj4NCj4NCj4+ICAgICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNf
UENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+ICAg
ICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOw0KPj4gQEAgLTE0NjAsNiArMTQ2MSw3IEBA
IHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgICAg
ICAgfQ0KPj4gICAgICAgfQ0KPj4gICAgICAgZmNsb3NlKGYpOw0KPj4gKyNlbmRpZg0KPj4gICAN
Cj4+ICAgICAgIC8qIERvbid0IHJlc3RyaWN0IHdyaXRlcyB0byB0aGUgUENJIGNvbmZpZyBzcGFj
ZSBmcm9tIHRoaXMgVk0gKi8NCj4+ICAgICAgIGlmIChwY2ktPnBlcm1pc3NpdmUpIHsNCj4+IEBA
IC0xNDcxLDcgKzE0NzMsOSBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2Vn
YyAqZWdjLA0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArI2lmbmRlZiBD
T05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0KPj4gICBvdXRfbm9faXJxOg0KPj4gKyNlbmRpZg0K
Pj4gICAgICAgaWYgKCFpc3N0dWJkb20pIHsNCj4+ICAgICAgICAgICBpZiAocGNpLT5yZG1fcG9s
aWN5ID09IExJQlhMX1JETV9SRVNFUlZFX1BPTElDWV9TVFJJQ1QpIHsNCj4+ICAgICAgICAgICAg
ICAgZmxhZyAmPSB+WEVOX0RPTUNUTF9ERVZfUkRNX1JFTEFYRUQ7DQo+PiBAQCAtMTk1MSw3ICsx
OTU1LDkgQEAgc3RhdGljIHZvaWQgZG9fcGNpX3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsIHBjaV9y
ZW1vdmVfc3RhdGUgKnBycykNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+ICAgICAgICAgICBGSUxFICpm
ID0gZm9wZW4oc3lzZnNfcGF0aCwgInIiKTsNCj4+ICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3Rh
cnQgPSAwLCBlbmQgPSAwLCBmbGFncyA9IDAsIHNpemUgPSAwOw0KPj4gKyNpZm5kZWYgQ09ORklH
X1BDSV9TVVBQX0xFR0FDWV9JUlENCj4+ICAgICAgICAgICBpbnQgaXJxID0gMDsNCj4+ICsjZW5k
aWYNCj4gSSdkIGxldCB0aGlzIGNvbXBpbGUgaWYgcG9zc2libGUuDQo+DQo+DQo+PiAgICAgICAg
ICAgaW50IGk7DQo+PiAgICAgICAgICAgaWYgKGYgPT0gTlVMTCkgew0KPj4gQEAgLTE5ODMsNiAr
MTk4OSw3IEBAIHN0YXRpYyB2b2lkIGRvX3BjaV9yZW1vdmUobGlieGxfX2VnYyAqZWdjLCBwY2lf
cmVtb3ZlX3N0YXRlICpwcnMpDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIGZjbG9zZShm
KTsNCj4+ICAgc2tpcDE6DQo+PiArI2lmbmRlZiBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0K
PiBIZXJlIHdlIGNvdWxkIGRvIGluc3RlYWQ6DQo+DQo+IGlmICghcGNpX3N1cHBfbGVnYWN5X2ly
cSgpKSkNCj4gICAgICBnb3RvIHNraXBfaXJxOw0KPg0KPg0KPj4gICAgICAgICAgIHN5c2ZzX3Bh
dGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWlu
LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpLT5idXMsIHBjaS0+ZGV2
LCBwY2ktPmZ1bmMpOw0KPj4gICAgICAgICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOw0K
Pj4gQEAgLTIwMDEsOCArMjAwOCwxNCBAQCBza2lwMToNCj4+ICAgICAgICAgICAgICAgfQ0KPj4g
ICAgICAgICAgIH0NCj4+ICAgICAgICAgICBmY2xvc2UoZik7DQo+PiArI2Vsc2UNCj4+ICsgICAg
ICAgIC8qIFNpbGVuY2UgZXJyb3I6IGxhYmVsIGF0IGVuZCBvZiBjb21wb3VuZCBzdGF0ZW1lbnQg
Ki8NCj4+ICsgICAgICAgIDsNCj4+ICsjZW5kaWYNCj4+ICAgICAgIH0NCj4+ICsjaWZuZGVmIENP
TkZJR19QQ0lfU1VQUF9MRUdBQ1lfSVJRDQo+PiAgIHNraXBfaXJxOg0KPj4gKyNlbmRpZg0KPj4g
ICAgICAgcmMgPSAwOw0KPj4gICBvdXRfZmFpbDoNCj4+ICAgICAgIHBjaV9yZW1vdmVfZGV0YWNo
ZWQoZWdjLCBwcnMsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICovDQo+PiAtLSANCj4+IDIuMjUuMQ0K
Pj4=

