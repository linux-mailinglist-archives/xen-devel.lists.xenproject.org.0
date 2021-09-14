Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C140A573
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 06:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186092.334825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ06H-0001IQ-Vr; Tue, 14 Sep 2021 04:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186092.334825; Tue, 14 Sep 2021 04:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ06H-0001Gc-RV; Tue, 14 Sep 2021 04:31:17 +0000
Received: by outflank-mailman (input) for mailman id 186092;
 Tue, 14 Sep 2021 04:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQww=OE=epam.com=prvs=98919bdb76=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQ06G-0001GV-0L
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 04:31:16 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100419b6-4536-427a-b06e-046a7628f688;
 Tue, 14 Sep 2021 04:31:14 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E3wVCK019878; 
 Tue, 14 Sep 2021 04:31:13 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b2m9wr2cw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 04:31:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6066.eurprd03.prod.outlook.com (2603:10a6:208:165::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.19; Tue, 14 Sep
 2021 04:31:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 04:31:09 +0000
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
X-Inumbo-ID: 100419b6-4536-427a-b06e-046a7628f688
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxZDqoB2sGkKvRIj+b9AVjjch8aRiVEbOGOB/OQIU+DZhZFIcC7E1JvzNsn+5/in874B3wNxlqHpAZdpOCeFbSRMDzpeI5Q+tQuChHaphrXY2MkDSMfF/677gsa+eHw+ilSDOyskiDCJaEp9MXTObVxjLM7PlmTP+qjFao2Bt/UN2LUR+86WtnMtlXCA+J6y7oNX9QC6zSlcP1h4um8yfK+/bSGV5fZRXPIDXggejbu2I36uLQK4tqJe9dh3PbyHeAMa9m3jSRZlLhRxS9Geo+Yx7rI6Hm5IesCHHhmUfohJ+2CgbX7k3CoP9TBbYzYoN1tW4y2S0/arEgdKq7XXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zCE771L6j59le/sIGUKACdoWh4xC8lPieOqr9RM7Ng4=;
 b=VarXq4xnCEtCGsb/Dwa9My8eYHKfHqg/yz2ngwF4ZwOU3oNWVxaY8oObrofKfY0TZCYZZrtkmLRTxbm2Twhx/Zf5+i5f2OZ4+YQAH9K+AcZF2RDQHw0ajOJpcLCkgu1C7AjE7Jcv7geckKcllMZGNB+XNSovWDA9KrjdMpTMQgnk86W53lcbRl9GAjOy5FkObSE6BeVtE1pogqig76kAzzAof8FpTU7Kda3aeqF+7ujb+zxzihDqHbELDGe80NqWnMencWHYHmvtCp1JOI555J4/ppJxP8iLDUamyQs//IZ1xSg50tiEUIwWAYCpLskk/ssuSEnh3U5+UkFGWpnD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCE771L6j59le/sIGUKACdoWh4xC8lPieOqr9RM7Ng4=;
 b=zV/A4KeMYV99bHPqAds1FLVEmZLjT1vaAZLEdpQNL4FW+Hw3HSmRdyuEp26RwCmqxL1kjXKIZes2+3jkb+1sRqcDHC2lVhTTU2D5QmU2dicLarDsIT8wNv7KKpinw+OPTCcEj/aiPlBTRBW1iHZ3NE2OH/E48xsPe3Rv9mN2CyjTknao6iYQTPc/P92SkvI0StlVJ3mbMXxnsol33puM6kSZBTa9TSVD/bPI0MFYWlYbnB0GddmaRI6twSJ3R08lr18NpQ7H30nAm22YWkoxaDVTmV149YRnMtDpPAPx+JXcT/b+A4xKTrW1Nu8f/W94GoDZqrPESNZA+v0CGqClwg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <rahul.singh@arm.com>,
        xen-devel
	<xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXlPK8ZsFWc1idT0uR0zIe97lMvKucfJAAgADQqgCABOUWAIAAaPoAgAB9fIA=
Date: Tue, 14 Sep 2021 04:31:09 +0000
Message-ID: <f580b6fa-24b4-f50f-7745-a7d4c1420ac0@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
 <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
 <aa251354-3e5f-e1ae-2647-3a112ad5d12e@epam.com>
 <alpine.DEB.2.21.2109131356090.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109131356090.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa59f49-e77d-40f9-9bb3-08d9773879e5
x-ms-traffictypediagnostic: AM0PR03MB6066:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6066369EC3F910578F52D243E7DA9@AM0PR03MB6066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ls7+mnxLm9Vfw35e+R5SbfjnhToe0/bRrIlAnlQLuk71FkhM+4fhWa8k9zPp2JxVj5Yh4DEtV+c6btAivO6JAiQgPCLPfjiyvWJW6TuKlsUCjBsarQMyvNmEB5Ma6cZY/4wRq2zKpJ5/lVzCYocZs5HV/XFmMff1GtABGOv8FIyDJ51Tni0sbrZXgDaTJa0ko/7cdGYy96NSUl0oQ2mQcGIN4VKtc4DmTdxXAAD554Z8nUAfGwREV9VSeiBdtWLbsRxcq5xu/DlaWAFyT6n9Ywn9VAlGlBnO/93BQlGHwCL5Ml9/bkmksh2kAjGBY/WQdd2/na4cAX2UYLx2XfGsSsOX1jBFcEa8EkfpYxKtCFF7bNWLAkip3U8PlOF/7eHcKL+4BA4sj20PHk6ZQ4qoBWGJ45yGF+oraAxo1hZzX1OYP8MVptYHmx5GQijTMxSe+k32gp+qBn69QpAZDOghoUypcM174bhvvhUm3BtefhkjZjpBRLNVQST4FxN9ua1+XnLf/bixkuhj2VD1/s0ogYAImXN+VL+nn5IuXMzoqGByK/jWYgRBhb4SKU1H78EsbQYLJhJDGqlzbS926hQV9vIBbJG1HVE/JTlBLSi4bhEx6G1Oi2UOaRrtiC0fJpWZuId2BGDpgeb1zWGRpW8l2LPlL9kx1OXdjpLHyb5VUmdVKVem9+lfLxpfy+XZDyo48BEtTdYVUxJLb60PFI63OpG3VbLIShm3m86R4VyMbHk6W6wJEU1ijq22ikbwOjMbvrfEu2Tj5lgwkxnaqJjlg9oQVvRTIHShfSBiH167uc2UbqDLNwXZ/Np78MIq+Gzxqfc3FEmC8L67lmBqP1V55Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(316002)(55236004)(8676002)(122000001)(38100700002)(186003)(6486002)(54906003)(4326008)(8936002)(31686004)(2906002)(31696002)(26005)(86362001)(6916009)(66476007)(83380400001)(5660300002)(478600001)(53546011)(6512007)(966005)(66946007)(66446008)(64756008)(91956017)(76116006)(107886003)(66556008)(36756003)(6506007)(2616005)(38070700005)(71200400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkxYR2Y4TVdETFBESFMwOWNGeGlYa3ZGRHJsbEZCdFhiYW42M3V0SmNIdW9S?=
 =?utf-8?B?eFFsY1FEVExNNlY0MkFiV1RFN0pzWDNaOGxNL2xTdW55VHJnZWNmYkl2QkI5?=
 =?utf-8?B?WGdtRlppNjhoNTkyV1dxaW4wRGsvUXA0ZUpaMloveThsczkyWlRBam9EajFm?=
 =?utf-8?B?Z25NdHdPWGdTQk1sN1dGWW9IMm9WNi9FZGF6ZXFMbkloRGQxTllDRmJNQUtv?=
 =?utf-8?B?MDYyb0Q5b09ldnN6Y1pyRW13SzRCR0JjWGR0bk54UzZ0VW5ueXRja3FZQlh5?=
 =?utf-8?B?S2FiKzBMa1JUSnB2UldyNXJuVjU0YXlRV0krK1ZPWmxxc1VMQzQyUUtGZCtl?=
 =?utf-8?B?SjJ2Rit2TUpaVi80N3Mwc1FTampSczc1Q2xQNkNTZ3hlNDZ1cjQzeFRSVlc1?=
 =?utf-8?B?OXA5dHFXTjBIcVUwcGlGR1c1ZUtqTGFTTFdqaHFIYTF6M1ZxdEozY3F2aTJN?=
 =?utf-8?B?bU1nVUJseWo0clgwcXhENHc1aENOODN1WVA0dHlOcko0TWJRajkxK094QXRT?=
 =?utf-8?B?NHVDamFVNGlCUkFlaXIxeFl3QTg3azFJeHl1M2ZIZ21qNVd0QmRadDEyTVJ5?=
 =?utf-8?B?Q3loeGt4VHNZT1YyTEdjWkEwVlJ1c3ZmK0xXYW5NMERCaTd6T0xQWUUwL3ow?=
 =?utf-8?B?aE5FbDJUNUpTK0RHWE1CUnVWU0FMeS9sSUZUemNmdWdFT1QzT3Zvb0pKakZy?=
 =?utf-8?B?VXluMEdQKzZpSk15Sm41eTZ1SnB3ZWk2R3k3SUJyVm12WjNOa085MHFrNEow?=
 =?utf-8?B?YUhpWFFYTnBmRW5POXdneFp4SS8yZGJXVUsvcXJmUTRKNW9aSERxN2tJYlJD?=
 =?utf-8?B?RWR3Wmh4RXFrL2NmK0xGb3gyTjhDd091MTFPV3F0ZEtNSDQ4SXQ4cWZrMGtM?=
 =?utf-8?B?cVhtMUg5dzJ5Q3BMVyt1M3pYK0JvTENnUW16ZVdsRjlkQmJSQ25ORStOUEpi?=
 =?utf-8?B?NEYvd3U1aUVOaW9iekk4TndSTUtaT1RyN1JoOUpWN3ErQnNkUmg3OWJQcURu?=
 =?utf-8?B?ZGxINXA3TjRPZEFLeG1hOEhlMTRLT3lib3hBQ09wYWppdEFCMjQ3aXVYV0tk?=
 =?utf-8?B?M1E3ekFiY21OL3lIS25mRVI4b3FvYUJVOW9IZXpLaTl5ZUZuZFlodFBobnFY?=
 =?utf-8?B?WENsSEUxaDZ6NkZFS3RXOXc2WDFMMXpUbStCUTVJVnVkYUdhQlpuYkg0eUNx?=
 =?utf-8?B?ODZ6WWJEdzJxYlF6YitVM2lrRjBtSGlQMVJ2cnJ6ZlduVEtTWkg5MXdzbFFS?=
 =?utf-8?B?azZxRVEyZGtCVXZjbHNZRHJhL1dEQ0J0and1MHJkZlJFQjNkbzhBVUJ2aVQz?=
 =?utf-8?B?T2liOEF3OWhJbXd0SlRHSzY0bDAxU3psbUtxUC9DYmhnbm00elp3WllyQWlW?=
 =?utf-8?B?YjNiK0c2ek5adnRhcjZWcTd2dmlZcEhzdTlQK2I1UDNxZ3dGTDRpcm9zV1du?=
 =?utf-8?B?ZWE0d3E0blBtT0lENTlFakt3Zlk3KzRhOWtlTlA1YktkQm14cXdZbGZpZGNi?=
 =?utf-8?B?UWdyTi9jUjJEeXRnUjhmSjdkbnpKSXhTZ0JsdGUyQy8yWnoyYlFRbE8vQTl2?=
 =?utf-8?B?Vlg1SEwrbk94WnZ3YzV5QnpwNFg2SU9BRUR0bDhrVGJ5NlprL3JoU29lNlgr?=
 =?utf-8?B?VTIvRyt0amZHelowbXV4MGR0eWk1dUxTdld1aU0zWkdjcUpQVlByRk1uS1Iy?=
 =?utf-8?B?a2xFTkJtRFNCWDZJNFVMNnBSOVlYeXNoR0dnazEwSEFnVFp0Y0VudjJaT0R4?=
 =?utf-8?B?NU5oVzV2Z0NjakRzbm51T0tDeVdOYTl6RTU2djBtbnF4SFpleUVxZGFhT3Fs?=
 =?utf-8?B?ZExhK1VkamlZNTNNWWJOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70C657702E2DC7469BFC903D6CAC1007@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa59f49-e77d-40f9-9bb3-08d9773879e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 04:31:09.5744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sF/Vg3mdXS12LTzDFM4CcwfRcaOcv297HQpthwGf13vFevOxzxY/mtpwKkYpTD4s6ncosAWTC0KIyjEa7U/5lBL+CGoAoubmq4YYwvOH00BK7390O1A2rjApSrRvF27w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6066
X-Proofpoint-ORIG-GUID: vGQYWfwtRFtvnO_LPbHUiXro1fk8dtSV
X-Proofpoint-GUID: vGQYWfwtRFtvnO_LPbHUiXro1fk8dtSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140025

DQpPbiAxNC4wOS4yMSAwMDowMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBNb24s
IDEzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDEwLjA5
LjIxIDE1OjAxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBIaSBTdGVmYW5vLA0KPj4+DQo+Pj4+
IE9uIDEwIFNlcCAyMDIxLCBhdCAxMjozNCBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gVGh1LCAxOSBBdWcgMjAyMSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pg0KPj4+Pj4gQWRkIHN1cHBv
cnQgZm9yIFhpbGlueCBaeW5xTVAgUENJIGhvc3QgY29udHJvbGxlciB0byBtYXAgdGhlIFBDSSBj
b25maWcNCj4+Pj4+IHNwYWNlIHRvIHRoZSBYRU4gbWVtb3J5Lg0KPj4+Pj4NCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4geGVuL2FyY2gvYXJtL3BjaS9NYWtlZmlsZSAg
ICAgICAgICB8ICAxICsNCj4+Pj4+IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtenlucW1wLmMg
fCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+IDIgZmlsZXMgY2hhbmdl
ZCwgNjAgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2Fy
bS9wY2kvcGNpLWhvc3QtenlucW1wLmMNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BjaS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9wY2kvTWFrZWZpbGUNCj4+Pj4+IGlu
ZGV4IDZmMzJmYmJlNjcuLjFkMDQ1YWRlMDEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vcGNpL01ha2VmaWxlDQo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL01ha2VmaWxlDQo+
Pj4+PiBAQCAtMywzICszLDQgQEAgb2JqLXkgKz0gcGNpLWFjY2Vzcy5vDQo+Pj4+PiBvYmoteSAr
PSBwY2ktaG9zdC1nZW5lcmljLm8NCj4+Pj4+IG9iai15ICs9IHBjaS1ob3N0LWNvbW1vbi5vDQo+
Pj4+PiBvYmoteSArPSBlY2FtLm8NCj4+Pj4+ICtvYmoteSArPSBwY2ktaG9zdC16eW5xbXAubw0K
Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtenlucW1wLmMgYi94
ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LXp5bnFtcC5jDQo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4+Pj4gaW5kZXggMDAwMDAwMDAwMC4uZmUxMDNlMzg1NQ0KPj4+Pj4gLS0tIC9kZXYv
bnVsbA0KPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC16eW5xbXAuYw0KPj4+
Pj4gQEAgLTAsMCArMSw1OSBAQA0KPj4+Pj4gKy8qDQo+Pj4+PiArICogQ29weXJpZ2h0IChDKSAy
MDIwLTIwMjEgRVBBTSBTeXN0ZW1zDQo+Pj4+PiArICoNCj4+Pj4+ICsgKiBCYXNlZCBvbiBMaW51
eCBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1ob3N0LWNvbW1vbi5jDQo+Pj4+PiArICogQmFz
ZWQgb24gTGludXggZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktaG9zdC1nZW5lcmljLmMNCj4+
Pj4+ICsgKiBCYXNlZCBvbiB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWdlbmVyaWMuYw0KPj4+
Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxNCBBUk0gTGltaXRlZCBXaWxsIERlYWNvbiA8d2lsbC5k
ZWFjb25AYXJtLmNvbT4NCj4+Pj4gT25seSBvbmUgQ29weXJpZ2h0IGxpbmUgcGVyIGZpbGUgaXMg
ZW5vdWdoIDotKQ0KPj4+Pg0KPj4+PiBCdXQgYWN0dWFsbHkgYWxsIHRoZSBDb3B5cmlnaHQgbGlu
ZXMgd2l0aCBhIG5hbWUgb3IgYSBjb21wYW55IG5hbWUgYXJlDQo+Pj4+IG5vdCByZWFsbHkgcmVx
dWlyZWQgb3IgdXNlZnVsLCBhcyB0aGUgY29weXJpZ2h0IGlzIG5vdGVkIGluIGZ1bGwgZGV0YWls
cw0KPj4+PiBpbiB0aGUgY29tbWl0IG1lc3NhZ2VzIChhdXRob3IgYW5kIHNpZ25lZC1vZmYtYnkg
bGluZXMpLiBJIHdvdWxkIHJlbW92ZQ0KPj4+PiB0aGVtIGFsbCBmcm9tIHRoZSBuZXcgZmlsZXMg
YWRkZWQgYnkgdGhpcyBzZXJpZXMuDQo+Pj4gT2suIExldCBtZSByZW1vdmUgaW4gbmV4dCB2ZXJz
aW9uLg0KPj4+Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5DQo+Pj4+PiArICogaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMNCj4+Pj4+ICsg
KiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4+Pj4+ICsgKg0K
Pj4+Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLA0KPj4+Pj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+Pj4+PiArICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KPj4+Pj4g
KyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+Pj4+PiAr
ICoNCj4+Pj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPj4+Pj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFt
LiAgSWYgbm90LCBzZWUgPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vd3d3Lmdu
dS5vcmcvbGljZW5zZXMvX187ISFHRl8yOWRiY1FJVUJQQSFsQWRMX0N2c3VNdXVYOWFpNmN3em0z
TllpVDF2d0lJbHhHVTduZXpTcXFfbnFKazQwWnota1Q0NExPc2VtY2doSl8zajJDZmZsUSQgW2du
dVsuXW9yZ10+Lg0KPj4+Pj4gKyAqLw0KPj4+Pj4gKw0KPj4+Pj4gKyNpbmNsdWRlIDxhc20vZGV2
aWNlLmg+DQo+Pj4+PiArI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+Pj4+ICsjaW5jbHVkZSA8YXNt
L3BjaS5oPg0KPj4+Pj4gKw0KPj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21h
dGNoIGdlbl9wY2lfZHRfbWF0Y2hbXSA9IHsNCj4+Pj4+ICsgICAgeyAuY29tcGF0aWJsZSA9ICJ4
bG54LG53bC1wY2llLTIuMTEiLA0KPj4+Pj4gKyAgICAgIC5kYXRhID0gICAgICAgJnBjaV9nZW5l
cmljX2VjYW1fb3BzIH0sDQo+Pj4+PiArICAgIHsgfSwNCj4+Pj4+ICt9Ow0KPj4+Pj4gKw0KPj4+
Pj4gK3N0YXRpYyBpbnQgZ2VuX3BjaV9kdF9pbml0KHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2
LCBjb25zdCB2b2lkICpkYXRhKQ0KPj4+Pj4gK3sNCj4+Pj4+ICsgICAgY29uc3Qgc3RydWN0IGR0
X2RldmljZV9tYXRjaCAqb2ZfaWQ7DQo+Pj4+PiArICAgIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9v
cHMgKm9wczsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgb2ZfaWQgPSBkdF9tYXRjaF9ub2RlKGdlbl9w
Y2lfZHRfbWF0Y2gsIGRldi0+ZGV2Lm9mX25vZGUpOw0KPj4+PiBUaGlzIHNob3VsZCBiZSBzdXBl
cmZsdW91cw0KPj4+IEFjay4gSSB3aWxsIHJlbW92ZSB0aGUgZHRfbWF0Y2hfbm9kZSguLikgaW4g
bmV4dCB2ZXJzaW9uLg0KPj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3ZSBuZWVkIHRoaXMgcGF0
Y2ggYXQgYWxsIGFzIHRoZSBtYWluIHJlYXNvbiBmb3IgaXRzIGV4aXN0ZW5jZQ0KPj4NCj4+IHdh
cyB0aGF0IHdlIGNhbiBydW4gWGlsaW54IFFFTVUgZm9yIFpDVTEwMi4gQnV0LCB0aGUgZmluYWwg
c2V0dXAgaXMgbm90IGdvaW5nDQo+Pg0KPj4gdG8gYmUgZnVuY3Rpb25hbCBhcyBsZWdhY3kgSVJR
cyBhcmUgbm90IHN1cHBvcnRlZCBhbmQgSVRTIGlzIG5vdCBhIHBhcnQgb2YgWnlucU1QLg0KPj4N
Cj4+IFNvLCBRRU1VIGFsbG93cyB0byBkbyBhIGxvdCB3aXRoIFBDSSBwYXNzdGhyb3VnaCwgYnV0
IGF0IHRoZSBlbmQgb2YgdGhlIGRheSBvbmUNCj4+DQo+PiB3b24ndCBoYXZlIGl0IHdvcmtpbmcu
Li4NCj4+DQo+PiBQbGVhc2UgY29uc2lkZXINCj4+DQo+PiBJZiB3ZSBkZWNpZGUgdG8gcmVtb3Zl
IGl0IHRoZW4NCj4+DQo+PiBpbnQgcGNpX2hvc3RfY29tbW9uX3Byb2JlKHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqZGV2LA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3BzICpvcHMsDQo+PiAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBlY2FtX3Jl
Z19pZHgpDQo+Pg0KPj4gZG9lc24ndCBuZWVkIHRoZSBsYXN0IHBhcmFtZXRlci4NCj4gV2l0aCBt
eSBvcGVuIHNvdXJjZSBtYWludGFpbmVyIGhhdCBvbiwgSSBkb24ndCBzZWUgdGhpcyBwYXRjaCBh
cyB2ZXJ5DQo+IGltcG9ydGFudDsgZnJvbSB0aGF0IHBvaW50IG9mIHZpZXcgSSdkIGJlIGhhcHB5
IGZvciBpdCB0byBiZSBkcm9wcGVkLg0KPiBIb3dldmVyLCBpdCB3b3VsZCBiZSBnb29kIHRvIGhh
dmUgYXQgbGVhc3Qgb25lIG5vbi1kZWZhdWx0IGhvc3QgYnJpZGdlDQo+IChkb2Vzbid0IGhhdmUg
dG8gYmUgdGhlIFhpbGlueCBicmlkZ2UpLCBvdGhlcndpc2UgaXQgYmVjb21lcyBkaWZmaWN1bHQN
Cj4gdG8gdW5kZXJzdGFuZCBob3cgdGhlIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1cmUgaW50cm9kdWNl
ZCBieSB0aGlzIHNlcmllcw0KPiBjb3VsZCBiZSB1c2VmdWwuDQo+DQo+IE1vcmVvdmVyLCB5b3Vy
IHJlY2VudCBjb21tZW50IFsxXSBtYWRlIGl0IGV2ZW4gbW9yZSBldmlkZW50IHRoYXQgaXQNCj4g
d291bGQgYmUgZ29vZCB0byBoYXZlIGF0IGxlYXN0IHR3byBkaWZmZXJlbnQgZHJpdmVycyB0byBz
cG90DQo+IGNvbXBhdGliaWxpdHkgaXNzdWVzIGJldHdlZW4gdGhlbSBtb3JlIGVhc2lseS4NCg0K
RG9uJ3QgdGFrZSBtZSB3cm9uZyBoZXJlIDspIEkgc3RpbGwgZG8gdXNlIFhpbGlueCBRRU1VIGZv
ciBtb3N0IG9mDQoNCnRoZSB0ZXN0cywgc28gaXQgaXMgZ29vZCBmb3IgbWUgdG8gaGF2ZSB0aGlz
IHBhdGNoIGluIHRoZSB0cmVlLiBCdXQsDQoNCnRvIGJlIGZhaXIsIFhpbGlueCBRRU1VIHdvbid0
IGdpdmUgeW91IGEgcG9zc2liaWxpdHkgdG8gc2VlIHRoZSBmdWxseQ0KDQpmdW5jdGlvbmFsIHN5
c3RlbS4gVGhpcyBpcyB3aHkgSSBzYXkgdGhlIHBhdGNoIGNhbiBiZSBkcm9wcGVkLg0KDQpJZiB3
ZSBhZGQgc29tZSB3b3JkcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYWJvdXQgdGhpcyBhbmQgaGF2
ZSB0aGUNCg0KcGF0Y2ggaW4gdGhlIHRyZWUgSSdsbCBiZSBtb3JlIHRoYW4gaGFwcHkNCg0KPg0K
PiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbWFyYy5pbmZvLz9sPXhl
bi1kZXZlbCZtPTE2MzE1NDQ3NDAwODU5OF9fOyEhR0ZfMjlkYmNRSVVCUEEhbEFkTF9DdnN1TXV1
WDlhaTZjd3ptM05ZaVQxdndJSWx4R1U3bmV6U3FxX25xSms0MFp6LWtUNDRMT3NlbWNnaEpfMGJL
czZ6cEEkIFttYXJjWy5daW5mb10=

