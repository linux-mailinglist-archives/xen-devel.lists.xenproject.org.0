Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7041AA9C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197796.351041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8UD-00027H-QX; Tue, 28 Sep 2021 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197796.351041; Tue, 28 Sep 2021 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8UD-00025M-Mj; Tue, 28 Sep 2021 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 197796;
 Tue, 28 Sep 2021 08:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV8UC-00025G-6F
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:29:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27edd01c-2036-11ec-bc73-12813bfff9fa;
 Tue, 28 Sep 2021 08:29:11 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S7hJfG007295; 
 Tue, 28 Sep 2021 08:29:09 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbxwg863j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:29:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6898.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:29:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 08:29:05 +0000
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
X-Inumbo-ID: 27edd01c-2036-11ec-bc73-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRg/z8mAXplu6nyxXNu0OQEg+HGlD11OubK6cigq7XSGSW3BsSXfmOrxBw74gtiNPD1zE0x8CTlkTIt4ZxrBvpo0AXo50YHEdvjtQvUJNRwcnsgDWnUtmndhtzKP0eobHd4Ks390Mr/QFxEp3mSZ5WBRXFPdU3VtLT+s4pPEdR0KgRQD44CdvYm1e+V2oMNCcWPHiWAqgsC3FsH8zOtqiJgBdNdeZ2FP9OdbLvecqt7z3iEKqZejOA76LFwtAB7Uz6Fb6oezZUIM3LV0ULLahLMmF21PignvGv50gwjozlrvcN7+acHAbJfXXciVW/dwNqLYpMVJfU1wQJPncymACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=44pgsq5FKu1KQgzRii0te2V/GLkUjvWitiQ8jmFKhXs=;
 b=VjDkCJbj0Gh6TowXPyYvfip5wky7BtR3f+DNsR2QO3IdkzTLVNYl1RLU8Eo2C6xeew5sepKy+PnYDgFYdkF+URQNfKhpWulP9VC9aUrWAgwaUOStkakHgzCuCAhSbJB8kgE8IUKbuFaS80heFZJHLtnh6YrnmMR61Prg/PosvM30Xyas/+7KsGudvCvVnAO9Dtd+UIlT9ITuUHycJCJokKVLbRzvZ40v2j9y7HFbKXLNHO9COckYpGmm9VEQsM6o4/l8u/8logJLlXz1A4O53+5oIdwxcu7831Qd43scE0qjX0hRzpUtjy/pEnK1pATGUc30OpIhvBKtqKTgJSXzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44pgsq5FKu1KQgzRii0te2V/GLkUjvWitiQ8jmFKhXs=;
 b=B+0dkLwTrSEioR+XdZRVDEWBHtUlF6ftiZVTtfDOIMe6Fy+rSupjPloqgyAmZKAyO/x8BkJRLSvCG91Vtpk1T2x4uzx6qjidMPhp751jgMUNd2HIEvvjU4AkNA1/kOOdHm7LwPMPyI0XERcTuwREViNhz6DPjKDHGCGZpDjRncnb7X8f8M3KCPTP7dI5Q/DMDPthzHw89aDEwKqmfG1rOD7jVDoh+ZXuo4es1iJhC8x+LBhfHc+7cVu7U7gcqttnC1zf0VUkZLbwerv2fbx4jTpJE7vQ51v1SEzj1+iN+OImQZNsWLHYsmg7jU499ez5GismW+2Nqn7/Fq2MrA2Qwg==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: 
 AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrICAAAldgIAABLUAgAAG9wCAAAEGAIAABhwAgAFsAgCAAATGgIAAAMUA
Date: Tue, 28 Sep 2021 08:29:04 +0000
Message-ID: <13b9cc76-c7e0-be7e-61d3-fc42a41dcc58@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
 <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
 <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
 <31dc3429-b1f4-85ab-968d-c9054b77ac4f@suse.com>
In-Reply-To: <31dc3429-b1f4-85ab-968d-c9054b77ac4f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ade56378-29a3-45a1-cfd7-08d9825a087f
x-ms-traffictypediagnostic: AM9PR03MB6898:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB689850D8626FB38BAAF7BA9CE7A89@AM9PR03MB6898.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +mti7etz2V/ZLQC2QpEK0MUlt6TGcWiPPbonxHZeHChUZYtNqQlHBRVsYnjpnepbuUuustHpzKbQi70BUYSa9wRMcV+i4oa03wPshiGS4NSR0IDOZHCA9pRxSnHG5FIPWNVjPy+g5DixHDjrmeQTheajsqRsLJQFlK2XrqSBGQcevLcwNFTEup224kdQHLEE6Gx03u3WnhuKnP8YTeD7bvuCIB2p2oAcG4fjaC9oQYGhnoNCvQwPepDIJKJe/+Gh2mfx1Te9AOaUDQSalANogz4dLetxfHu8Y9tTPeSsOjauk/5whLBaU/d3qwoy7rgcWOL1DOML4RM1HGnPS66UIo41oqVmqQHzlx2lUF24Pw9/a/HXRWJFOF6TpOHWmWFkQDpqHy4DIt58W6pqBwPnk+jnpjhCWvu+00oaGX06RiUEdRYnl+oyjZmmtzbdT1gS+frT0G+CTqoX+qdmWnWkqLJ4PUICwLtNYaSEcLzWxwHzhOmv5juQjyycARO7aD0WrSbRM3fo0kBAGthTqVmzh+Qu3351vpRtQy2l+mGEKT3LFudOD66e+5g2B41dQsSWrk0NCHdxpvc17R4TAE1BuQM+hVEYsETBPzLzbrEE1UMN8Q+p9jjSkJQ1ebYcmQWe17TUA4B4vyFrcLTqqg3fGd2QGNUp82+Ktrt2DBa2yqywzI+OcFDJGAWkTt0tFgkSKIYAnsaqD9Ic66kymd/qWce15tZI/4FtHD3jUWT3EGgGWNvXAhvapZxf1bQSxYxZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(38100700002)(508600001)(36756003)(31696002)(53546011)(38070700005)(6916009)(6506007)(86362001)(6486002)(2616005)(6512007)(66946007)(66556008)(55236004)(66476007)(5660300002)(26005)(64756008)(66446008)(91956017)(2906002)(31686004)(54906003)(71200400001)(186003)(8936002)(107886003)(76116006)(316002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eEg3QXEwZG9WRHBPNE5sTStGWmNyUDBnS0xZNFlYTmNzL1dQMXZqcHBza0RC?=
 =?utf-8?B?Z3V2THRXM012WWtiTmRxTjBKd0xTZ1ZxMHhGWlpZNHh0bnFZOEcrSVgrZzU1?=
 =?utf-8?B?ZDZ3QXdPTkFGYUVvMmYrbGE5YndoZ3VmdmwzZUZKb3UyRnY1UkZFQTVBeUQ0?=
 =?utf-8?B?SkxGUnpIbDlVQzVZeDJZUG82aDhpRm1RSndlMjBwWTY4NkdGb0tYdHcxYWlq?=
 =?utf-8?B?NE03RXo4cU1NTFZSTDhmbFNteHNsNDlyODJPcHl0cEpqQXRmOHVaYWdpQVRq?=
 =?utf-8?B?NnpzZ1JWeXM5L045cHAzWDZQazh1aVFiaTR6b3hDdnI2a1dTUUxOZU9hcTR2?=
 =?utf-8?B?bzl6TlZRblBqeCtMdlJxOXpIZUNxWllmcWpUeEowZmFWdEpDbktHN2g1WDlR?=
 =?utf-8?B?NmdTVmp6MC9SM1dFVUVJK2lMRTNpTHYvZ3RwZnhva3NjeFBrbFhtc0Zkam9M?=
 =?utf-8?B?V2lWT3orQ1l0ZUI2eEtDalNobGk0SmFHcTQ2SlI0WmZXY0s5VGdoT0prRnM5?=
 =?utf-8?B?M243ZTJHNE5Lcm5pWmF0WDdDZmNVSmxvSUxHSEkwdCtrTUJwK0w1N0xpc0p6?=
 =?utf-8?B?d1N6M1ZjcElRd1FTeVhDN0U3ZUtQVHhaWHNibU1kT1BDcitpYWs4cUF1TFZD?=
 =?utf-8?B?TzVQZ1c3TTMrdE5Wcy83clFMeGd4ekxJcWY0dmJ5Zmg2aEFlL0llcXJhMXdz?=
 =?utf-8?B?Y2RYZWpvZGVnbFJjWmgzL25qWXZVOVA1Nit5SWpONnU4dmUrSmpEc3FnNFZo?=
 =?utf-8?B?Y3lWWUg5OGk4WDZHVzdRcHM3WkdxSnlmTStObWNjaDhaQjVZdHo5N0V6a2Z6?=
 =?utf-8?B?TXp6Wkl6QnpBbktmNS9hUENJNnVSL0tWWTdLNkpYSEZ4eCs1OFlOb3Viekgx?=
 =?utf-8?B?empwOFlKd0lmSFY0UnUzem1HbUJHTVZBZSt0bHEzVGdETFY5RmV2aWRKNUdn?=
 =?utf-8?B?UDA3VWtaWndRRGl1ajJ1N1M3eWJCbDhrcGU5Qm55K25KaENKSEUvS2Jia1cw?=
 =?utf-8?B?b3FsS1plTHUrMmZuNG9VVWtJRHM3RWJObmVRMFhZTGhQTTdZSmpONnpETG9E?=
 =?utf-8?B?Qnlua2FLY0FJQ0M0QWpNZzIzS3BIdFd6Y0hEQk02cEsyVlIzSGdxM1VMVDM0?=
 =?utf-8?B?Vll1eHE2dWFidjV0TExobkszZjkwS254alFrNVlWODI2aXlkUmVwR2c0M1k5?=
 =?utf-8?B?V0NNdUdJaEdFY2gybFIvU2lMam9vMXY0cFV1MWNtdjM5bk0zUFRLSXpaVHU2?=
 =?utf-8?B?NXBkNG0rWGVyVnJ4am5MWFowaU9oV0h6SVk5US9Gelh0ck9vT0dZa3FXRDdp?=
 =?utf-8?B?MjQ5RTFxbWRyRnFyeGVYSERiRVFSQWJMRE9YTG4wdVBQejFoRi9xS2ZFTDdF?=
 =?utf-8?B?cUp6dTh1OXA4UmhRQzdqby9BbVU2V094N2djWGw1V2RHejViUkdveEgzTWxN?=
 =?utf-8?B?VGVMelFIdHVVTFZxY01pclI3cWhkeXRFbkJIeDFaODhRQ0EzRTJORG9QWTUy?=
 =?utf-8?B?TDBlbG5BaDBaT2JCT2dOTjBsV2daZWcrMG9ZWHZNTG1zS05ndmN4TkZpUnE2?=
 =?utf-8?B?VE9zUGNpMW51SlNZbG5BUDdNT3E0Qlh4RkFTYWdNcTlualZFRXBjWjVQOS9x?=
 =?utf-8?B?ZjBsak81bkJrQUtGZmRpOFdRZE1jUWRLNnRObExnbjhVSTduc2g0MGdLbEFB?=
 =?utf-8?B?RGFzZDd3Ti9wa1FtR0ZjUnorallxeWZXemxhZ1RrVW5hMGhxQmVBRkhDN25M?=
 =?utf-8?B?SVQvcnA3R3FCK0pMT2tVUGo1aWxEenI3M2FaaGdHeko4dTlOOWJCbmZSSm9M?=
 =?utf-8?B?TDBoNUJRS2NjNHVaaHVxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FC9899DA0CFC744A81EE117ED7CBA31@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade56378-29a3-45a1-cfd7-08d9825a087f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 08:29:04.9991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db+a2QosUF1WeDbrnuRDJb6rVekR+yImi12yR49uOTqp/BkMoUA30rdKSBBqAaWQZ2Z5rYH9Z20qU6zzy7Z9fJEHn0unFVsif3Do21JaWA6imXMrHd1causVtonJdil5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6898
X-Proofpoint-ORIG-GUID: NhgsiyyECtfuhiEPGL2E-KhbO-2T-Ts8
X-Proofpoint-GUID: NhgsiyyECtfuhiEPGL2E-KhbO-2T-Ts8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280049

DQpPbiAyOC4wOS4yMSAxMToyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjA5LjIwMjEg
MTA6MDksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTM6
MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIwMjEgMTI6MDQsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxMzowMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMDIxIDExOjM1LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDI3LjA5LjIwMjEgMTA6NDUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gT24gMjcuMDkuMjEgMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+Pj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+Pj4+
Pj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+Pj4+Pj4+PiBAQCAt
MzI4LDYgKzMyOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3Qg
cGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICoo
KHU4KikgJnBkZXYtPmJ1cykgPSBidXM7DQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAqKCh1OCopICZw
ZGV2LT5kZXZmbikgPSBkZXZmbjsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgIHBkZXYtPmRvbWFpbiA9
IE5VTEw7DQo+Pj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPj4+Pj4+Pj4+PiArICAgIHBj
aV90b19kZXYocGRldiktPnR5cGUgPSBERVZfUENJOw0KPj4+Pj4+Pj4+PiArI2VuZGlmDQo+Pj4+
Pj4+Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5vdCBoYXBweSBhYm91dCBuZXcgQ09ORklH
XzxhcmNoPiBjb25kaXRpb25hbHMNCj4+Pj4+Pj4+PiBoZXJlLiBJJ2QgcHJlZmVyIHRvIHNlZSB0
aGlzIGRvbmUgYnkgYSBuZXcgYXJjaCBoZWxwZXIsIHVubGVzcyB0aGVyZSBhcmUNCj4+Pj4+Pj4+
PiBvYnN0YWNsZXMgSSdtIG92ZXJsb29raW5nLg0KPj4+Pj4+Pj4gRG8geW91IG1lYW4gc29tZXRo
aW5nIGxpa2UgYXJjaF9wY2lfYWxsb2NfcGRldihkZXYpPw0KPj4+Pj4+PiBJJ2QgcmVjb21tZW5k
IGFnYWluc3QgImFsbG9jIiBpbiBpdHMgbmFtZTsgIm5ldyIgaW5zdGVhZCBtYXliZT8NCj4+Pj4+
PiBJIGFtIGZpbmUgd2l0aCBhcmNoX3BjaV9uZXdfcGRldiwgYnV0IGFyY2ggcHJlZml4IHBvaW50
cyB0byB0aGUgZmFjdCB0aGF0DQo+Pj4+Pj4gdGhpcyBpcyBqdXN0IGFuIGFyY2hpdGVjdHVyZSBz
cGVjaWZpYyBwYXJ0IG9mIHRoZSBwZGV2IGFsbG9jYXRpb24gcmF0aGVyIHRoYW4NCj4+Pj4+PiBh
Y3R1YWwgcGRldiBhbGxvY2F0aW9uIGl0c2VsZiwgc28gd2l0aCB0aGlzIHJlc3BlY3QgYXJjaF9w
Y2lfYWxsb2NfcGRldiBzZWVtcw0KPj4+Pj4+IG1vcmUgbmF0dXJhbCB0byBtZS4NCj4+Pj4+IFRo
ZSBidWxrIG9mIHRoZSBmdW5jdGlvbiBpcyBhYm91dCBwb3B1bGF0aW5nIHRoZSBqdXN0IGFsbG9j
YXRlZCBzdHJ1Y3QuDQo+Pj4+PiBUaGVyZSdzIG5vIGFyY2gtc3BlY2lmaWMgcGFydCBvZiB0aGUg
YWxsb2NhdGlvbiAoc28gZmFyLCBsZWF2aW5nIGFzaWRlDQo+Pj4+PiBNU0ktWCksIHlvdSBvbmx5
IHdhbnQgYW5kIGFyY2gtc3BlY2lmaWMgcGFydCBvZiB0aGUgaW5pdGlhbGl6YXRpb24uIEkNCj4+
Pj4+IHdvdWxkIGFncmVlIHdpdGggImFsbG9jIiBpbiB0aGUgbmFtZSBpZiBmdXJ0aGVyIGFsbG9j
YXRpb24gd2FzIHRvDQo+Pj4+PiBoYXBwZW4gdGhlcmUuDQo+Pj4+IEhtLCB0aGVuIGFyY2hfcGNp
X2luaXRfcGRldiBzb3VuZHMgbW9yZSByZWFzb25hYmxlDQo+Pj4gRmluZSB3aXRoIG1lLg0KPj4g
RG8gd2Ugd2FudCB0aGlzIHRvIGJlIHZvaWQgb3IgcmV0dXJuaW5nIGFuIGVycm9yIGNvZGU/IElm
IGVycm9yIGNvZGUgaXMgbmVlZGVkLA0KPj4gdGhlbiB3ZSB3b3VsZCBhbHNvIG5lZWQgYSByb2xs
LWJhY2sgZnVuY3Rpb24sIGUuZy4gYXJjaF9wY2lfZnJlZV9wZGV2IG9yDQo+PiBhcmNoX3BjaV9y
ZWxlYXNlX3BkZXYgb3IgYXJjaF9wY2lfZmluaV9wZGV2IG9yIHNvbWV0aGluZywgc28gaXQgY2Fu
IGJlIHVzZWQgaW4NCj4+IGNhc2Ugb2YgZXJyb3Igb3IgaW4gZnJlZV9wZGV2IGZ1bmN0aW9uLg0K
PiBJJ2Qgc3RhcnQgd2l0aCB2b2lkIGFuZCBtYWtlIGl0IHJldHVybiBhbiBlcnJvciAoYW5kIGRl
YWwgd2l0aCBuZWNlc3NhcnkNCj4gY2xlYW51cCkgb25seSBvbmNlIGEgbmVlZCBhcmlzZXMuDQoN
ClNvdW5kcyByZWFzb25hYmxlLiBGb3IgeDg2IEkgdGhpbmsgd2UgY2FuIGRlYWwgd2l0aDoNCg0K
eGVuL2luY2x1ZGUveGVuL3BjaS5oOg0KDQojaWZkZWYgQ09ORklHX0FSTQ0Kdm9pZCBhcmNoX3Bj
aV9pbml0X3BkZXYoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KI2Vsc2UNCnN0YXRpYyBpbmxpbmUg
dm9pZCBhcmNoX3BjaV9pbml0X3BkZXYoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQp7DQogwqDCoMKg
IHJldHVybiAwOw0KfQ0KI2VuZGlmDQoNCj4NCj4gSmFuDQo+

