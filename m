Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC30B41D66F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199673.353876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsTs-0001nJ-KW; Thu, 30 Sep 2021 09:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199673.353876; Thu, 30 Sep 2021 09:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsTs-0001lT-HN; Thu, 30 Sep 2021 09:35:56 +0000
Received: by outflank-mailman (input) for mailman id 199673;
 Thu, 30 Sep 2021 09:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVsTr-0001lL-AR
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:35:55 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceb93386-21d1-11ec-bd40-12813bfff9fa;
 Thu, 30 Sep 2021 09:35:54 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U9S86m012929; 
 Thu, 30 Sep 2021 09:35:52 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bdabvr4j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:35:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3716.eurprd03.prod.outlook.com (2603:10a6:208:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 09:35:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 09:35:49 +0000
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
X-Inumbo-ID: ceb93386-21d1-11ec-bd40-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oih6JFIp34hv5EaeL0o3//CggnhNRh9qYvnIbcHckTOVWS/X1ErcZbsNmKhmOTqYRJFiRvWLH15OlPVOgQgay8ZSEDoOWeEyL6DCGIfryxhlDCi4TUfDUgqTkDcVcuRw6/hSzgUOsv7U3Ke9SfLYCiDzMH+/F2wxPzviRLOkFhWdvYMDnaxP1J6ma2cwq3TQNJHXubFAapSxvOPzm0nbTclZxLXEp2aXQ1xCijLuxRc1RvH2jrPeSOhKJBpND5Qo28ddtrQBfLp7wl47A4jk6qdMO2n1o/42nwRbCSxIiZYhmObZE+4tUtc9/Jm6ZhoPjrYFuyJ6ATI3jpjKg7+NWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2uuNPe+aR9cXUgQhOz+22Lww5ecJCpAhQ1R6sKi28MM=;
 b=AJMylZU9Kk5FY/fw8/KPMBdx7fvmBzEFrUbzxU98+PiELg+jof7OfUGLDNW9O2Ry7/9eDg1WWnN/Y/x8ooh+cin/jt7mqpMBwVgx3kMnjAKsw7Wss8B40o2zW9ETh6WmotP9Lainiaj0RLjdBfw9NNIYAdveNYH/FpF6rpUr4EeInUpIimNeXjdjIBk5MvfGk7WvwvetpeLmdON/zg3njDRVq/Ou7GQJztfBIYCpg8+oM7tD5vli7vU4yNXuHfgmJ4UZQ2etUpKL3Hzrqs8M3meYYnghxgUKxFpaLdvKEAdr2OIFXOOHEKtRo7UnDoDjSDyndrNkK8PLt65zi2n/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uuNPe+aR9cXUgQhOz+22Lww5ecJCpAhQ1R6sKi28MM=;
 b=4+tiiNEDP5xGc1kD0U2dI6cwt9nxoWxzzwpC+3crhubGcxMA16ZXllY+cyBRDb6LkDmb3XjFM1jOlUc8NIqyqOOsdwKOhH2MDi+XBllGvSZnc9606UPvRazkorC1hs+rVPOKTNGjzcoyACoW7VlPaV7NBKndV6K8Zoj3e0c4OM8z3k/PphnLw8WPspBMouYl23BlduJPHtVPHy2vnXKr/35nMQqpwl01AlKx8k8JeKgyNpLg+Ne51A9kWWeV3ZOBzdi/BR33eVlZgiGRq3OVcHVTKPBneQjJ9qftcZm4uEG/+JyfdG6TDEuay+Xrg94G36u0hjzVSs5WXcfc8ot+uQ==
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
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXtdAlBwDHpaYUBUq6q0PlsxoTp6u8Ra2AgAALzYA=
Date: Thu, 30 Sep 2021 09:35:49 +0000
Message-ID: <fcbb082c-d8ee-b59c-64b9-129b20308778@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
In-Reply-To: <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15755b13-46fe-4712-1c83-08d983f5b043
x-ms-traffictypediagnostic: AM0PR03MB3716:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3716DD7C469CF2D58685A357E7AA9@AM0PR03MB3716.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ghPjdqnj+BXU5YJ47PgqxjcFj0Y050wvwjZ4QW3ixmDaHpl1KTTkJRBn8FOZpsSd1NhD4QXabSmBDCNemDPhHZ42JkvJ3Z2F7/wcJ1LCMl2tHAXX8im6llaFUeGDFPT6esn4exd0qbA1Hy23FoN7xw07PYRDs8rqvRh8OBlGX+8NL/eLR9Ty5fZKqBcGooMz+kYGy9lhKjl20vpUT1NGQewz5mtwJ1jkPb9appl4hRb0YPfOJUKEi6NK8+r9/QSKhchpU+ZlrSpSoqB0/YYnxZcSPChPCAQKj3ESu6Kpv1zbVJaNDzmRUDeHUVBmAqr2yYvtOcNm8g7N7tOVAatKKBUgzzaijtMu4utUQreXeG/XTJFWi41eGyJgr/50HmQs+L+jP1L/EGUM06D+CCiPM3eHa0m3mrHjfeBd9QTrvycfTweGfwK2KmPzTXOaXJb8CGct4XQP6tC9Fss/uuwy98kPpdMe7bBDuyMDsU9A6jsSaDnlf6NbEIDdMeUh6oDirus2MFrfx/UEVmWb5vlAVNXjGS99Zd51uvfxlxuupUXGTR8iXNGJwmkbSvVkp4FJ8kCD2aD9+mLbU3rVgmlgbQkF4qzYPOgae4qRJ8YRxlJMxhpszCGgXSxqrnCI2/GgtaYxc+DmEBKmCBJjuZsC9umz64FUHTulJt2wlpRXmesUUU+nxfRk9oR1JJuyibZJHemktAMiT+lMC+jEi++Ep5hS/CLnf1Nb6IMbIrPXhcw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6916009)(38100700002)(91956017)(83380400001)(6486002)(76116006)(86362001)(2906002)(5660300002)(6512007)(122000001)(54906003)(66476007)(64756008)(66556008)(66446008)(31696002)(316002)(71200400001)(53546011)(38070700005)(186003)(26005)(8936002)(55236004)(4326008)(6506007)(36756003)(31686004)(2616005)(508600001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bU00YWlMampxU2toTzhsaUZUT0UvMWc0QVVmYmVRelpEVnVGVTJCNDJDMmxS?=
 =?utf-8?B?NGdQNUxtR1U0OXRDVzNGREs0akdHcmQvU3dSMm51bFZsSUFMeEpwOHAza05r?=
 =?utf-8?B?cHc3SXdPa2p6YlQvbTU0VjRhVWI5dzdkR2NTUUJCdjNJWitXb2p4VzVRUk0z?=
 =?utf-8?B?b0Y2UU10Rm01RWVreXVLY1Y4b3ZuSmI0SzlyN25YK2duVUw0SCtudGF4d0FK?=
 =?utf-8?B?V2RyMCtZOHFYNThwaDVWbnZUdWNlY1VLY0hueGxjYzRiN0IxaS9oRFFRMTFj?=
 =?utf-8?B?eHNYSFZlQm5iUnFLZ2Y5UCtrWVlnNENQTzZBem80c1VZUVJETExsTXJld0s4?=
 =?utf-8?B?eVhtUkFCUmxmWWsyMlJ4UlU4VTlrQ2pBbEt1Vk5LbG10ajMzV2dDbWxTN1ht?=
 =?utf-8?B?QmdhZVBSZTVSQXdXTVRPWnd5YnNKK09SWkw3UC9NcThlZ0gwZkJBb0JKdHVO?=
 =?utf-8?B?UkxsSGtvR2dVMGNCWjRvamtPQ1FaemVHUVA1UnAzV2swUjdESFVoVFUrcVNx?=
 =?utf-8?B?TUxkZ1F4OFFqUE9uNFd0SFZ5NzhnSWxWMGRPRzlyUW03K3RIMUlqSWIwV3g1?=
 =?utf-8?B?dGh1SzEwd09XSlFtVHdjSVJLaE1tc3FMMXVWcWltV2lvcHhHelVFeThKM0tn?=
 =?utf-8?B?U0VtS3BNbWZBbGtFZGtqUG1IdmErVEdUM0lKbDdwTStJV0tpVFMwZFdWQlJR?=
 =?utf-8?B?ZDVwOWxiajNVOHhpM2dHc0tNdVd4SFlidTFKRUJTRSt2OGNrSmpyQVhRbndz?=
 =?utf-8?B?bEU0cjh3elNDZlFJbUFqQ0pJa2FOOEJJQnRnWlhXajVPa1VMeVF4WGRFYkJK?=
 =?utf-8?B?Wm1ERGZ0UWRNbGRzMXEvMnNuTlQwVS8rMm53YUZOWC9MdmxBZi9xakhJZCtE?=
 =?utf-8?B?RW1ST2VsUXljMnY5SlNLci9LS1QyRXVmcE9jQmNNc0RxUEdpYnp0VDl4aWZU?=
 =?utf-8?B?QWV3SzU2MWdRSGFtWFVIQ1JsRlFYMitsL2xoSDR3eVY0OWRHc0hhcGtCN2ZC?=
 =?utf-8?B?cnMyTUJhL0pHY1ZZaE1wNDR1MXBuN2NvdEVjNmduNEJnK1VMSERQRjRqRUVo?=
 =?utf-8?B?MlpPNUdDZDAvNXNCUU91L2ZlWExDWWZTY0k5SzRIMDNaZmRkenZ2TDdwbzFP?=
 =?utf-8?B?cFZwWjZGamJ4SVFFRjAvT0hrWFdBRjhJQllHS2VRbFZvdkJzTDFtRGhXN0hX?=
 =?utf-8?B?YVdacTFSemgveEdJcEhWNldIRXJLb3EweCtqRm53dWNZTk5NZnJ2eTExUm5M?=
 =?utf-8?B?QXFkcTNpc3JweGRkWGNLdHpQK1piQWpIUTdFMVgvTk5ucXNYNXFKZHNNT2RP?=
 =?utf-8?B?aW96c1Nsb2IyUkU2NUlobDVMMWVIUVhnQ1ZjTktJaEh6bUdsWVppakI5YXB5?=
 =?utf-8?B?Q3MxZ3YzSkg1QWVRMG1mRk9rVEcxZlozd3pOZmp4RUsxZnEzZ2NYZ2pWbVRL?=
 =?utf-8?B?YlJaQUk4cHAvdDBkNTVwQkVFSVdEaUJTa0lvNEttVkF6RTVhUlZmZHBWWWp5?=
 =?utf-8?B?OVkybFpEMkJwOTdWcHA4dmYyZElTSkNNM2pzek0rUVJhclMxOUJwUUZsZ0tP?=
 =?utf-8?B?bkRpVEZFZFQ1V2pmRG5nUHpUbGZNbUNQSlVSSTIzN3l6d1prZFZ2UUtZWGxS?=
 =?utf-8?B?cy9EbTJmQ1MzY1ZXOGZWWGl0dzg3d2R0RDNHdjVtY1RGMXR1bGI4MVlrNWVn?=
 =?utf-8?B?NWJIenZINWNnaFptYTlIbE9ZZGdCRzFRc0QyM0VmalgxU2lMdy9FTHRXT0N4?=
 =?utf-8?B?dFVWeGV1TlJxcU9Gdll0SjAyc2NvMUVCSGdSS0JpUmRDUENXNVVlbXRJWFZy?=
 =?utf-8?B?aXRIQ1NLRTJLUWZTR3VSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C19BEF0282801546844731074AA0C6A6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15755b13-46fe-4712-1c83-08d983f5b043
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:35:49.6263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: op8GC7cCNZ4d64OWpc8cgT6J3wNHPUpK9bfbnw7gT8Q8Y4h7Z/OIXZpKd7AnfexmuJSQaByi9VVYgA5XfHqo7YMC9RGeyp0ARAcE6zAx5V1IfdTFTcGFmw9gM8B9SsOD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3716
X-Proofpoint-GUID: JkhGZGzoD4hYlJgnDmudyQOimhuiypUU
X-Proofpoint-ORIG-GUID: JkhGZGzoD4hYlJgnDmudyQOimhuiypUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 mlxlogscore=932
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300058

DQoNCk9uIDMwLjA5LjIxIDExOjUzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAwOTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMNCj4+IEBAIC04ODksNiArODg5LDMxIEBAIGludCBwY2lfcmVtb3ZlX3ZpcnR1YWxfZGV2
aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAg
ICAgeGZyZWUodmRldik7DQo+PiAgICAgICByZXR1cm4gMDsNCj4+ICAgfQ0KPj4gKw0KPj4gKy8q
DQo+PiArICogRmluZCB0aGUgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0byB0aGUg
dmlydHVhbCBkZXZpY2UNCj4+ICsgKiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0byB0aGUg
cGh5c2ljYWwgb25lLg0KPj4gKyAqLw0KPj4gK2Jvb2wgcGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2Rl
dmljZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBwY2lfc2JkZl90ICpzYmRmKQ0KPj4gK3sNCj4+
ICsgICAgc3RydWN0IHZwY2lfZGV2ICp2ZGV2Ow0KPiBjb25zdCAoYWZhaWN0KQ0KT2sNCj4NCj4+
ICsgICAgYm9vbCBmb3VuZCA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBwY2lkZXZzX2xvY2soKTsN
Cj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2X2xpc3QsIGxpc3Qg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIHZkZXYtPnNiZGYuc2JkZiA9PSBzYmRmLT5z
YmRmICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAvKiBSZXBsYWNlIHZpcnR1YWwg
U0JERiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+PiArICAgICAgICAgICAgKnNiZGYgPSB2
ZGV2LT5wZGV2LT5zYmRmOw0KPj4gKyAgICAgICAgICAgIGZvdW5kID0gdHJ1ZTsNCj4+ICsgICAg
ICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKyAgICBwY2lkZXZz
X3VubG9jaygpOw0KPiBBcyBwZXIgdGhlIGNvbW1lbnRzIG9uIHRoZSBlYXJsaWVyIHBhdGNoLCBs
b2NraW5nIGFzIHdlbGwgYXMgcGxhY2VtZW50DQo+IG1heSBuZWVkIHJlY29uc2lkZXJpbmcuDQpP
dGhlciB0aGVuIHRoYXQgZG8geW91IGhhdmUgb3RoZXIgY29tbWVudHMgb24gdGhpcz8NCj4NCj4g
SmFuDQo+DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

