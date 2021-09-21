Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD62412F2C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191393.341397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1L-0002RI-8R; Tue, 21 Sep 2021 07:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191393.341397; Tue, 21 Sep 2021 07:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa1L-0002Oj-5C; Tue, 21 Sep 2021 07:16:51 +0000
Received: by outflank-mailman (input) for mailman id 191393;
 Tue, 21 Sep 2021 07:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSa1J-0002OT-N6
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:16:49 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c4ff113-124b-4573-b0d8-089ff8e54235;
 Tue, 21 Sep 2021 07:16:47 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L64cJ7007778; 
 Tue, 21 Sep 2021 07:16:46 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b77eyrfd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 07:16:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6321.eurprd03.prod.outlook.com (2603:10a6:20b:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 07:16:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:16:41 +0000
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
X-Inumbo-ID: 2c4ff113-124b-4573-b0d8-089ff8e54235
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPy5yLK9udKP0Ah6JcDVi5Nv1x6cReUO6MVvOp4hg95h9dO0RBLXzR88pKwwhdjEUoMN1F3pEbYsdUUymLDjSdsm4qvra5ioauK8KunUkUwnWGzfXaNV9uJ2M3Syd/vLKE+4uswzr4LPUx7r3z+onjpF3A9hIPsszwZoSYPGC95j0eKq4fWMRlVRvQyNftfdWEoGZhY+RxBu5X69ibfYpeqdanpdrsxSo2swXWqE1DieSEg7Gc/MCiHr4uu3U/QXwDrfZErNc93qixB+Hxmns+EVrIs1X9U3xrivBIRhzVh1cGL9qQMo0dr6WYUbyIJQUY/S+O2aIThc6AJsVu6J+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PUnqXD6qhjjrblu8XRToW/AWwzlkv5LiSH5e4snrsKU=;
 b=HLboA4E5LssDb7n8V9P52WjCslN1Wi3RefLYpSsYqggvRE7KFTuCsQxpdD7B1jJIKI07qx2R+KUlaGk+IPfRO2vKQhgOXBLJ+IUi7/Ccv0WRKG5HOXep8wOkSEtzwbZxf/u/vegksP6iyAU9XS1ADfYjIPwS0JvVtszNxkSmIqTlm+wr1owbkq+9T+tNwxrjRWyBpp/awFGzpK+gTqfcu09twq17U1VTbJaVK+7gfoALH0xFYo9L26dNwct2NZ+oqJGN4KZ1tU2TBmCaRrLj6Px6ZncSz87hjdTDKtGZ/BYMlWK9PjnMn6MjQ83N01iH8zLe1+G/cHd2fsUIqYQz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUnqXD6qhjjrblu8XRToW/AWwzlkv5LiSH5e4snrsKU=;
 b=GZkgwTk55s0xTMXb8wM/hcP0hXx+H9/F9kKtkCAuAS+N6Z5dA0FHAuf/9iEEEUVwbYQtgSq+pk1D6zzya1CCFP3Qk4t0JFXW3q3si5P2GZaornEVCgsCGdHWWj72fUT5fAoPdZp355ZqszImp38FmEo1cTWso1Zi7U9zEXXtxBMvOXEmvaTMtSiteWZ9CHcC7sZtiOBWdYE8fWAgrYG2OBnxQXPsXjm8rn6YO9nBgiFnc83EUYyV+GWxo2m3KSW/1Du2Tcie99bBsXiCbysTNKOhTKoG3HvxTEijG8G/HlQueKC8CN1oQQXqStryYPTSBR/iB4pwthnElx91lJFiKw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAGXhAIAACLuAgAAEUwCAAAi6AIAAAxMAgAADDgCAAAJlAIAAAheA
Date: Tue, 21 Sep 2021 07:16:41 +0000
Message-ID: <48a2ef20-02ad-99e4-a8f5-fa144692aadc@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
 <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
 <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
 <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com>
In-Reply-To: <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04de41f2-a368-4374-3b65-08d97ccfc2dd
x-ms-traffictypediagnostic: AM0PR03MB6321:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB632171C6FE23B2EB27636BE3E7A19@AM0PR03MB6321.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CAKMH36E06jnyNYZK2xQ8UTdXATTtHAGsoQEUNkNnQAqmBSMITgcH8bYnZjzyWmkiV4XrDuhaYKdiPXtI2xMaxaMkNs/AIpuv61iry9BbTBqPfUbhGNqkm1J0rqnKd1k5IWcdQQDpi7gmrIDQ0mbbRsqNaSvbCRBkq19nDMSnST/PCTm2AvYOxfxT04X7agqlVYiQJD6x8nBkSlYrMzHVdxzQL/fSitPG1FVsY9VQU0lu9H6v1z2aw/9vvsXL7HA3f6bWSKqIM8DNHCsjvTK1jr8Ow/3CAhl5d4mRYiWyPiOiOJyHKVN3n9UZP4z9eNCsbiG+HNTuPbm07LnsU1ufyERl72zSk/OenY1sZ0IalforUL6DDDbsfWCImi1sPgvOdIR7xRiEZkQ5M+amdXUk+qvNry7Pfdr/wXdl5No1dTUSs3r9QTvjWWOaTCYAQJgPgb2m9LvdAwoeF3UVf/aO3X2mmLQGL2gXjWYBMNS3lqETjND+a14e690/qZxr/7v11dFf0ENxh2EEjI237Ws5yqvUt1+Q4pjtqyQo+lQc5iRXvQY2qVWak1sI+GPGMy0FpN5TpIvAf3+n4ArxZ3MQLNN4P+0jH9rFr3cb5eW0VK/XJV3POEkqefMxZBhM4hGfMoUZSVY0++HOlde6/sObCkX38/dSwip+UHdqfa1LoFQrniGXJcmXzs8s4df7lRQRzc/c8HFwwkPp08fzh0chSQDJQwZcF6M2TYP2p3XyxUr3biBRTEsX3FmsmU7jWDp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(66946007)(66556008)(38100700002)(66476007)(66446008)(83380400001)(6486002)(6512007)(8676002)(71200400001)(122000001)(508600001)(86362001)(2906002)(36756003)(186003)(54906003)(53546011)(8936002)(31686004)(4326008)(2616005)(91956017)(76116006)(64756008)(110136005)(5660300002)(55236004)(6506007)(26005)(316002)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bSs3SFlBYmZabEk4bTM3R1gwMHYwanJtMXVuUFgyVmd2VVRBdHRUVzQzZDdr?=
 =?utf-8?B?VTJMZGVnMXNsbzBGcEdaKzVaMzlXd0NHSG45aXBqU0l3OVUxbzBlbE00SzZo?=
 =?utf-8?B?alNNQ0Z6TitnWU5DbTJFckg2c2ZOaGtHcFFOb21ycnBQNmRDSis2MTdOUFRT?=
 =?utf-8?B?emRTRk9pYm43TlQvd2t2OVFkUVBqZitCMkR0aklpUm04V0Q2KzF3L3drTk5P?=
 =?utf-8?B?Mk04aVowMThyQWtxYmtlUkh4TlZrd3NzV2RaUnh5c0QwWXlqMW5OOHRUa2xa?=
 =?utf-8?B?dmxHZW5pZFY0ZGlTcjhvUGkyc0ZLRVVSTEhDam5wVjRnTEVjRVdHOEx2N2tW?=
 =?utf-8?B?TnBoVkwzd3RJY21hMnpqRm5vbm9SdkhPYjJ3blNQVXZ3NnFPUTRtbVFPMVJS?=
 =?utf-8?B?UGZwbkZ1UlREY3JNN05mWkV2c3JVUFBBYS9ldkluVXFtVGZma2p6N0U2Z096?=
 =?utf-8?B?WHo1ZjZIeW1ycGd0bmZFRVFQRHNERytMWVhaS21oMEpmdkFIQXdXOEIrYy9z?=
 =?utf-8?B?SGtEcng5YWdiU1NFWVVCWlREcUIyb2RaM1B3NWgxNlN5ckJkWTM1ZEdzS2dL?=
 =?utf-8?B?N09Dclh1QnNSMGxCelF3dG9xaTJaWjFwN1ErMGxubU9pZlRCVGZ3ZTJWVHds?=
 =?utf-8?B?cnFoQjB3MXFuU1pZUTVHMXJCWW42TXhCTFk2bDBIUmE2TzdkZllyRXQ0elZG?=
 =?utf-8?B?KzFwcDV3LzZ0K0t6cVV3dExPeW5qQlA2MTYweFJ0T2g0MnBkbzdJVG9uUGt3?=
 =?utf-8?B?TE91eDBvU2ZXekhldE1BT1hINlZIYUFRZ0NQdFJxTWJBUi9CMTFaSWJYK0dm?=
 =?utf-8?B?Ym1nSHMzaUMyeFFIclZ0RFdJejVkU2k4QkEwcm9JN0NLWXI4SmdKeUVjWWl0?=
 =?utf-8?B?N3h0endJME9iQ0ErVk5RSUkrRTdKUUdvWjM4SkY2Umx1Wksrb0xJYzV1aGlF?=
 =?utf-8?B?bGdsdDVlL2Z1MlVObDVkdDlIanM3RTEybm9XUGVoZGZyc2YrMXd2VkhLMFY5?=
 =?utf-8?B?NW5BTTk0SmI2ZXpVQUZNem1iK1hDY3FGUG5tQVQ5MFgwblc4YndXcFFBZ05y?=
 =?utf-8?B?UU5wcERGNzlTeUc2aVU2cm41WVVzU1cxU093SGZ2cU1aNkxYdzBIZ1NiOUl3?=
 =?utf-8?B?dnhhS3MxL3FlNlYvK2FvZUVLK21DVGxXM2tRdVBScFJYZUExeGpRWWtFaWdI?=
 =?utf-8?B?U3ZLZUhxOUl4UTY5ZEdLSDFiMW12am1qWjlNNTdwaEs1czArbkkvYzhkVDVs?=
 =?utf-8?B?ZXgrcFFZQXJLSTRaZ21TdG5JbmQzbkJab1lUcHBjNllHcVM0WHk4OS9nQUJn?=
 =?utf-8?B?WndJdlIyMnljbUJSeHlxZ1JnSys0aXc0SnJTK2lETHk0dmR3T0FMVmdrVTky?=
 =?utf-8?B?ZU1nQmJZRXU2MWFPNE9CU0hveUkxV1RjNHBYazQ2WU9xSE9VRHVlRXJtZlRv?=
 =?utf-8?B?Yy9YSDMwS0xPUFdVOEgvZWFtNktsc1B2VXUzczJCbmFFdEtIRTNHSXlkZTNm?=
 =?utf-8?B?bE1JQVBqVjNZUSs4ZnUvMDRJL2VOUjE0SDBxOStXNHQ3ak4wTjI5WE1ZbHBO?=
 =?utf-8?B?Z3FMdmtDQXljVlgrU3VSd05ibU1TR0duQVZtTE9tdDExNExZaTVIbHVacTRR?=
 =?utf-8?B?MGYvM2Via3BOYmVyd2t2MHNLdzB2eFp2bmxETzlzMTA5R2x4cjVlSzBzdXBP?=
 =?utf-8?B?ZnllTzIrKyt3QjdxZ29QM2VaSE9JSVpLc25VUTNPY1F6Ym1hU0c1bmdJaDFU?=
 =?utf-8?B?TkkzZGxaRHcrUENJWXY5TWtBYlFjN1Nyems4dHY2QUd0TmllaENnalEwNTlT?=
 =?utf-8?B?RmhrUmlYU0ZUVHNoZmQxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41BD324A72B6EB48B60386E84C772D28@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04de41f2-a368-4374-3b65-08d97ccfc2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 07:16:41.7993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CzGRwJ+j3PqjQ7D6GQx5LmeNMHfAEBHCyOZ8EHEsMX/I9lLGx28gPL/eLVrBcQvOrq4XJoP8g2rjQr6gwH3+LS8uZvnFlMgCEp0+2PApqjc5Jdp86smXWqXhj7rAea/g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6321
X-Proofpoint-GUID: OckrIBv2PsVNcHx-9a35sc30Yf2SddhB
X-Proofpoint-ORIG-GUID: OckrIBv2PsVNcHx-9a35sc30Yf2SddhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210047

DQpPbiAyMS4wOS4yMSAxMDowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjEuMDkuMjEg
MDk6MDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDIxLjA5LjIx
IDA5OjQ5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDIxLjA5LjIxIDA4OjM4LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMjEuMDkuMjEgMDk6MDcs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+PiBPbiAyMS4wOS4yMSAwNzo1MSwgT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4NCj4+Pj4+PiBPbiAyMS4wOS4yMSAwODoyMCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4+Pj4gT24gMjEuMDkuMjEgMDE6MTYsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4+IE9uIE1vbiwgMjAgU2VwIDIwMjEsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDIwLjA5LjIxIDE0OjMwLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4+PiBPbiAyMC4wOS4yMSAwNzoyMywgT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBIZWxsbywgU3RlZmFubyENCj4+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBPbiAxOC4wOS4yMSAwMDo0NSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4+Pj4+IFdoeSBkbyB5b3Ugd2FudCB0byBlbmFibGUgcGNpYmFjayBvbiBBUk0/IElzIGl0IG9u
bHkgdG8gImRpc2FibGUiIGEgUENJDQo+Pj4+Pj4+Pj4+Pj4gZGV2aWNlIGluIERvbTAgc28gdGhh
dCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVkIHRvIGEgRG9tVT8NCj4+Pj4+Pj4+Pj4+IE5vdCBv
bmx5IHRoYXQNCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IEkgYW0gYXNraW5nIGJlY2F1c2Ug
YWN0dWFsbHkgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGVuYWJsZSB0aGUgUFYgUENJDQo+Pj4+
Pj4+Pj4+Pj4gYmFja2VuZCBmZWF0dXJlIG9mIHBjaWJhY2sgb24gQVJNLCByaWdodD8gVGhhdCB3
b3VsZCBjbGFzaCB3aXRoIHRoZSBQQ0kNCj4+Pj4+Pj4+Pj4+PiBhc3NpZ25tZW50IHdvcmsgeW91
IGhhdmUgYmVlbiBkb2luZyBpbiBYZW4uIFRoZXkgY291bGRuJ3QgYm90aCB3b3JrIGF0DQo+Pj4+
Pj4+Pj4+Pj4gdGhlIHNhbWUgdGltZS4NCj4+Pj4+Pj4+Pj4+IENvcnJlY3QsIGl0IGlzIG5vdCB1
c2VkDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBJZiB3ZSBvbmx5IG5lZWQgcGNpYmFjayB0
byAicGFyayIgYSBkZXZpY2UgaW4gRG9tMCwgd291bGRuJ3QgaXQgYmUNCj4+Pj4+Pj4+Pj4+PiBw
b3NzaWJsZSBhbmQgYmV0dGVyIHRvIHVzZSBwY2ktc3R1YiBpbnN0ZWFkPw0KPj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4+IE5vdCBvbmx5IHRoYXQsIHNvIHBjaS1zdHViIGlzIG5vdCBlbm91Z2gNCj4+
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBUaGUgZnVuY3Rpb25hbGl0eSB3aGljaCBpcyBpbXBsZW1l
bnRlZCBieSB0aGUgcGNpYmFjayBhbmQgdGhlIHRvb2xzdGFjaw0KPj4+Pj4+Pj4+Pj4gYW5kIHdo
aWNoIGlzIHJlbGV2YW50L21pc3NpbmcvbmVlZGVkIGZvciBBUk06DQo+Pj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+Pj4gMS4gcGNpYmFjayBpcyB1c2VkIGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUg
UENJIGRldmljZXMsIGUuZy4geGwNCj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgwqDCoCBwY2ktYXNz
aWduYWJsZS17YWRkfHJlbW92ZXxsaXN0fSBtYW5pcHVsYXRlcyB0aGF0IGxpc3QuIFNvLCB3aGVu
ZXZlciB0aGUNCj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgwqDCoCB0b29sc3RhY2sgbmVlZHMgdG8g
a25vdyB3aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2ggaXQgcmVhZHMNCj4+
Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgwqDCoCB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVu
dHJpZXMgb2YgdGhlIHBjaWJhY2suDQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gMi4gcGNpYmFj
ayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVuYm91bmQgUENJIGRldmljZXMsIGUuZy4gd2hlbiBwYXNz
aW5nIHRocm91Z2gNCj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgwqDCoCBhIFBDSSBkZXZpY2UgaXQg
bmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSByZWxldmFudCBkZXZpY2UgZHJpdmVyIGFuZCBi
b3VuZA0KPj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCDCoMKgIHRvIHBjaWJhY2sgKHN0cmljdGx5IHNw
ZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZCB0aGF0IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8NCj4+
Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgwqDCoCBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1
c2VkIGFzIGEgZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBDSQ0KPj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoCDCoMKgIGRldmljZXMsIHNvIHdlIGNhbiByZS1iaW5kIHRoZSBkZXZpY2VzIGJh
Y2sgdG8gdGhlaXIgb3JpZ2luYWwgZHJpdmVycyB3aGVuDQo+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKg
IMKgwqAgZ3Vlc3QgZG9tYWluIHNodXRzIGRvd24pDQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4g
My4gRGV2aWNlIHJlc2V0DQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gV2UgaGF2ZSBwcmV2aW91
c2x5IGRpc2N1c3NlZCBvbiB4ZW4tZGV2ZWwgTUwgcG9zc2libGUgc29sdXRpb25zIHRvIHRoYXQg
YXMgZnJvbSB0aGUNCj4+Pj4+Pj4+Pj4+IGFib3ZlIHdlIHNlZSB0aGF0IHBjaWJhY2sgZnVuY3Rp
b25hbGl0eSBpcyBnb2luZyB0byBiZSBvbmx5IHBhcnRpYWxseSB1c2VkIG9uIEFybS4NCj4+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBQbGVhc2Ugc2VlIFsxXSBhbmQgWzJdOg0KPj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4+IDEuIEl0IGlzIG5vdCBhY2NlcHRhYmxlIHRvIG1hbmFnZSB0aGUgYXNzaWdu
YWJsZSBsaXN0IGluIFhlbiBpdHNlbGYNCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiAyLiBwY2li
YWNrIGNhbiBiZSBzcGxpdCBpbnRvIHR3byBwYXJ0czogUENJIGFzc2lnbmFibGUvYmluZC9yZXNl
dCBoYW5kbGluZyBhbmQNCj4+Pj4+Pj4+Pj4+IHRoZSByZXN0IGxpa2UgdlBDSSBldGMuDQo+Pj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gMy4gcGNpZnJvbnQgaXMgbm90IHVzZWQgb24gQXJtDQo+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IEl0IGlzIG5laXRoZXIgaW4geDg2IFBWSC9IVk0gZ3Vlc3RzLg0K
Pj4+Pj4+Pj4+IERpZG4ndCBrbm93IHRoYXQsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcNCj4+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IFNvLCBsaW1pdGVkIHVzZSBvZiB0aGUgcGNpYmFjayBpcyBvbmUg
b2YgdGhlIGJyaWNrcyB1c2VkIHRvIGVuYWJsZSBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4+Pj4+Pj4+
IG9uIEFybS4gSXQgd2FzIGVub3VnaCB0byBqdXN0IHJlLXN0cnVjdHVyZSB0aGUgZHJpdmVyIGFu
ZCBoYXZlIGl0IHJ1biBvbiBBcm0gdG8gYWNoaWV2ZQ0KPj4+Pj4+Pj4+Pj4gYWxsIHRoZSBnb2Fs
cyBhYm92ZS4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBJZiB3ZSBzdGlsbCB0aGluayBpdCBp
cyBkZXNpcmFibGUgdG8gYnJlYWsgdGhlIHBjaWJhY2sgZHJpdmVyIGludG8gImNvbW1vbiIgYW5k
ICJwY2lmcm9udCBzcGVjaWZpYyINCj4+Pj4+Pj4+Pj4+IHBhcnRzIHRoZW4gaXQgY2FuIGJlIGRv
bmUsIHlldCB0aGUgcGF0Y2ggaXMgZ29pbmcgdG8gYmUgdGhlIHZlcnkgZmlyc3QgYnJpY2sgaW4g
dGhhdCBidWlsZGluZy4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gRG9pbmcgdGhpcyBzcGxpdCBz
aG91bGQgYmUgZG9uZSwgYXMgdGhlIHBjaWZyb250IHNwZWNpZmljIHBhcnQgY291bGQgYmUNCj4+
Pj4+Pj4+Pj4gb21pdHRlZCBvbiB4ODYsIHRvbywgaW4gY2FzZSBubyBQViBndWVzdHMgdXNpbmcg
UENJIHBhc3N0aHJvdWdoIGhhdmUgdG8NCj4+Pj4+Pj4+Pj4gYmUgc3VwcG9ydGVkLg0KPj4+Pj4+
Pj4+IEFncmVlLCB0aGF0IHRoZSBmaW5hbCBzb2x1dGlvbiBzaG91bGQgaGF2ZSB0aGUgZHJpdmVy
IHNwbGl0DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBTbywgSSB0aGluayB0aGlzIHBhdGNoIGlz
IHN0aWxsIGdvaW5nIHRvIGJlIG5lZWRlZCBiZXNpZGVzIHdoaWNoIGRpcmVjdGlvbiB3ZSB0YWtl
Lg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBTb21lIGtpbmQgb2YgdGhpcyBwYXRjaCwgeWVzLiBJ
dCBtaWdodCBsb29rIGRpZmZlcmVudCBpbiBjYXNlIHRoZSBzcGxpdA0KPj4+Pj4+Pj4+PiBpcyBk
b25lIGZpcnN0Lg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBJIGRvbid0IG1pbmQgZG9pbmcgaXQg
aW4gZWl0aGVyIHNlcXVlbmNlLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFdpdGggdGhpcyBwYXRj
aCB3ZSBoYXZlIEFybSBvbiB0aGUgc2FtZSBwYWdlIGFzIHRoZSBhYm92ZSBtZW50aW9uZWQgeDg2
IGd1ZXN0cywNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IGUuZy4gdGhlIGRyaXZlciBoYXMgdW51c2Vk
IGNvZGUsIGJ1dCB5ZXQgYWxsb3dzIEFybSB0byBmdW5jdGlvbiBub3cuDQo+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+PiBBdCB0aGlzIHN0YWdlIG9mIFBDSSBwYXNzdGhyb3VnaCBvbiBBcm0gaXQgaXMgeWV0
IGVub3VnaC4gTG9uZyB0ZXJtLCB3aGVuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiB0aGUgZHJpdmVy
IGdldHMgc3BsaXQsIEFybSB3aWxsIGJlbmVmaXQgZnJvbSB0aGF0IHNwbGl0IHRvbywgYnV0IHVu
Zm9ydHVuYXRlbHkgSSBkbyBub3QNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IGhhdmUgZW5vdWdoIGJh
bmR3aWR0aCBmb3IgdGhhdCBwaWVjZSBvZiB3b3JrIGF0IHRoZSBtb21lbnQuDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gVGhhdCdzIGZhaXIgYW5kIEkgZG9uJ3Qgd2FudCB0byBzY29wZS1jcmVlcCB0aGlz
IHNpbXBsZSBwYXRjaCBhc2tpbmcgZm9yDQo+Pj4+Pj4+PiBhbiBlbm9ybW91cyByZXdvcmsuIEF0
IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgZW5hYmxlIHRoZQ0KPj4+Pj4+
Pj4gd2hvbGUgb2YgcGNpYmFjayBvbiBBUk0gYmVjYXVzZSBpdCB3b3VsZCBiZSBlcnJvbmVvdXMg
YW5kIGNvbmZ1c2luZy4NCj4+Pj4+Pg0KPj4+Pj4+IEFzIHRoZSBmaXJzdCBzdGFnZSBiZWZvcmUg
dGhlIGRyaXZlciBpcyBzcGxpdCBvciBpZmRlZidzIHVzZWQgLSBjYW4gd2UgdGFrZSB0aGUgcGF0
Y2gNCj4+Pj4+PiBhcyBpcyBub3c/IEluIGVpdGhlciB3YXkgd2UgY2hvc2UgdGhpcyBuZWVkcyB0
byBiZSBkb25lLCBlLmcuIGVuYWJsZSBjb21waWxpbmcNCj4+Pj4+PiBmb3Igb3RoZXIgYXJjaGl0
ZWN0dXJlcyBhbmQgY29tbW9uIGNvZGUgbW92ZS4NCj4+Pj4+DQo+Pj4+PiBGaW5lIHdpdGggbWUg
aW4gcHJpbmNpcGxlLiBJIG5lZWQgdG8gdGFrZSBhIG1vcmUgdGhvcm91Z2ggbG9vaw0KPj4+Pj4g
YXQgdGhlIHBhdGNoLCB0aG91Z2guDQo+Pj4+IE9mIGNvdXJzZQ0KPj4+Pj4NCj4+Pj4+Pg0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IEkgYW0gd29uZGVyIGlmIHRoZXJlIGlzIGEgc2ltcGxlOg0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+IGlmICgheGVuX3B2X2RvbWFpbigpKQ0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoYXQgd2UgY291bGQgYWRkIGluIGEgY291
cGxlIG9mIHBsYWNlcyBpbiBwY2liYWNrIHRvIHN0b3AgaXQgZnJvbQ0KPj4+Pj4+Pj4gaW5pdGlh
bGl6aW5nIHRoZSBwYXJ0cyB3ZSBkb24ndCBjYXJlIGFib3V0LiBTb21ldGhpbmcgYWxvbmcgdGhl
c2UgbGluZXMNCj4+Pj4+Pj4+ICh1bnRlc3RlZCBhbmQgcHJvYmFibHkgaW5jb21wbGV0ZSkuDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gV2hhdCBkbyB5b3UgZ3V5cyB0aGluaz8NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gVWggbm8sIG5vdCBpbiB0aGlzIHdheSwgcGxlYXNlLiBUaGlzIHdpbGwga2lsbCBwY2kgcGFz
c3Rocm91Z2ggb24geDg2DQo+Pj4+Pj4+IHdpdGggZG9tMCBydW5uaW5nIGFzIFBWSC4gSSBkb24n
dCB0aGluayB0aGlzIGlzIHdvcmtpbmcgcmlnaHQgbm93LCBidXQNCj4+Pj4+Pj4gYWRkaW5nIG1v
cmUgY29kZSBtYWtpbmcgaXQgZXZlbiBoYXJkZXIgdG8gd29yayBzaG91bGQgYmUgYXZvaWRlZC4N
Cj4+Pj4+Pj4NCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94
ZW5idXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jDQo+Pj4+Pj4+PiBpbmRl
eCBkYTM0Y2U4NWRjODguLjk5MWJhMGE5YjM1OSAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL2RyaXZl
cnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jDQo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4+Pj4+Pj4gQEAgLTE1LDYgKzE1LDcgQEANCj4+Pj4+Pj4+
IMKgwqDCoMKgICNpbmNsdWRlIDx4ZW4veGVuYnVzLmg+DQo+Pj4+Pj4+PiDCoMKgwqDCoCAjaW5j
bHVkZSA8eGVuL2V2ZW50cy5oPg0KPj4+Pj4+Pj4gwqDCoMKgwqAgI2luY2x1ZGUgPHhlbi9wY2ku
aD4NCj4+Pj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3hlbi5oPg0KPj4+Pj4+Pj4gwqDCoMKgwqAgI2lu
Y2x1ZGUgInBjaWJhY2suaCINCj4+Pj4+Pj4+IMKgwqDCoMKgIMKgICNkZWZpbmUgSU5WQUxJRF9F
VlRDSE5fSVJRwqAgKC0xKQ0KPj4+Pj4+Pj4gQEAgLTY4NSw4ICs2ODYsMTIgQEAgc3RhdGljIGlu
dCB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsDQo+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVj
dCB4ZW5idXNfZGV2aWNlX2lkICppZCkNCj4+Pj4+Pj4+IMKgwqDCoMKgIHsNCj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqAgaW50IGVyciA9IDA7DQo+Pj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCB4ZW5f
cGNpYmtfZGV2aWNlICpwZGV2ID0gYWxsb2NfcGRldihkZXYpOw0KPj4+Pj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRldjsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICvCoMKg
wqAgaWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IDA7DQo+Pj4+Pj4+PiDCoMKgwqDCoCArwqDCoMKgIHBkZXYgPSBhbGxvY19wZGV2KGRldik7DQo+
Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgaHVuayBpc24ndCBuZWVkZWQsIGFzIHdpdGggYmFpbGluZyBv
dXQgb2YgeGVuX3BjaWJrX3hlbmJ1c19yZWdpc3Rlcg0KPj4+Pj4+PiBlYXJseSB3aWxsIHJlc3Vs
dCBpbiB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlIG5ldmVyIGJlaW5nIGNhbGxlZC4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBkZXYgPT0gTlVMTCkgew0KPj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1FTk9NRU07DQo+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgeGVuYnVzX2Rldl9mYXRhbChkZXYsIGVyciwNCj4+Pj4+Pj4+IEBA
IC03NDMsNiArNzQ4LDkgQEAgY29uc3Qgc3RydWN0IHhlbl9wY2lia19iYWNrZW5kICpfX3JlYWRf
bW9zdGx5IHhlbl9wY2lia19iYWNrZW5kOw0KPj4+Pj4+Pj4gwqDCoMKgwqAgwqAgaW50IF9faW5p
dCB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyKHZvaWQpDQo+Pj4+Pj4+PiDCoMKgwqDCoCB7DQo+
Pj4+Pj4+PiArwqDCoMKgIGlmICgheGVuX3B2X2RvbWFpbigpKQ0KPj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAwOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pg0KPj4+Pj4+PiBVc2UgI2lmZGVm
IENPTkZJR19YODYgaW5zdGVhZC4NCj4+Pj4+Pg0KPj4+Pj4+IFRoZSB0aXRsZSBvZiB0aGlzIHBh
dGNoIHNheXMgdGhhdCB3ZSB3YW50IHRvIGFsbG93IHRoaXMgZHJpdmVyIGZvciBvdGhlciBhcmNo
cw0KPj4+Pj4+IGFuZCBub3cgd2Ugd2FudCB0byBpbnRyb2R1Y2UgIiNpZmRlZiBDT05GSUdfWDg2
IiB3aGljaCBkb2Vzbid0IHNvdW5kDQo+Pj4+Pj4gcmlnaHQgd2l0aCB0aGF0IHJlc3BlY3QuIElu
c3RlYWQsIHdlIG1heSB3YW50IGhhdmluZyBzb21ldGhpbmcgbGlrZSBhDQo+Pj4+Pj4gZGVkaWNh
dGVkIGdhdGUgZm9yIHRoaXMsIGUuZy4gIiNpZmRlZiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5E
X1NVUFBfUFYiDQo+Pj4+Pj4gb3Igc29tZXRoaW5nIHdoaWNoIGlzIGFyY2hpdGVjdHVyZSBhZ25v
c3RpYy4NCj4+Pj4+DQo+Pj4+PiBTb21ldGhpbmcgbGlrZSB0aGF0LCB5ZXMuIEJ1dCBJJ2QgcmF0
aGVyIHVzZSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EDQo+Pj4+PiBhY3RpbmcgYXMgdGhpcyBn
YXRlIGFuZCBpbnRyb2R1Y2UgQ09ORklHX1hFTl9QQ0lfU1RVQiBmb3IgdGhlIHN0dWINCj4+Pj4+
IGZ1bmN0aW9uYWxpdHkgbmVlZGVkIG9uIEFybS4gWEVOX1BDSURFVl9CQUNLRU5EIHdvdWxkIGRl
cGVuZCBvbiBYODYgYW5kDQo+Pj4+PiBzZWxlY3QgWEVOX1BDSV9TVFVCLCB3aGlsZSBvbiBBcm0g
WEVOX1BDSV9TVFVCIGNvdWxkIGJlIGNvbmZpZ3VyZWQgaWYNCj4+Pj4+IHdhbnRlZC4gVGhlIHNw
bGl0dGluZyBvZiB0aGUgZHJpdmVyIGNhbiBzdGlsbCBiZSBkb25lIGxhdGVyLg0KPj4+Pg0KPj4+
PiBIbSwgcGNpYmFjayBpcyBub3cgY29tcGlsZWQgd2hlbiBDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EIGlzIGVuYWJsZWQNCj4+Pj4gYW5kIHdlIHdhbnQgdG8gc2tpcCBzb21lIHBhcnRzIG9mIGl0
cyBjb2RlIHdoZW4gQ09ORklHX1hFTl9QQ0lfU1RVQiBpcyBzZXQuDQo+Pj4+IFNvLCBJIGltYWdp
bmUgdGhhdCBmb3IgeDg2IHdlIGp1c3QgZW5hYmxlIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQg
YW5kIHRoZQ0KPj4+PiBkcml2ZXIgY29tcGlsZXMgaW4gaXRzIGN1cnJlbnQgc3RhdGUuIEZvciBB
cm0gd2UgZW5hYmxlIGJvdGggQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORA0KPj4+PiBhbmQgQ09O
RklHX1hFTl9QQ0lfU1RVQiwgc28gcGFydCBvZiB0aGUgZHJpdmVyIGlzIG5vdCBjb21waWxlZC4N
Cj4+Pg0KPj4+IE5vLCBJJ2QgcmF0aGVyIHN3aXRjaCB0byBjb21waWxpbmcgeGVuLXBjaWJhY2sg
d2hlbiBDT05GSUdfWEVOX1BDSV9TVFVCDQo+Pj4gaXMgc2V0IGFuZCBjb21waWxlIG9ubHkgcGFy
dHMgb2YgaXQgd2hlbiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGlzDQo+Pj4gbm90IHNldCAo
dGhpcyB3aWxsIGJlIHRoZSBjYXNlIG9uIEFybSkuDQo+Pg0KPj4gQnV0IHRoaXMgd2lsbCByZXF1
aXJlIHRoYXQgdGhlIGV4aXN0aW5nIGtlcm5lbCBjb25maWd1cmF0aW9ucyBvdXQgdGhlcmUgaGF2
ZSB0byBhZGRpdGlvbmFsbHkgZGVmaW5lIENPTkZJR19YRU5fUENJX1NUVUIgdG8gZ2V0IHdoYXQg
dGhleSBoYWQgYmVmb3JlIHdpdGggc2ltcGx5IGVuYWJsaW5nIENPTkZJR19YRU5fUENJREVWX0JB
Q0tFTkQuIE15IHBvaW50IHdhcyB0aGF0IGl0IGlzIHByb2JhYmx5IGRlc2lyYWJsZSBub3QgdG8g
YnJlYWsNCj4+IHRoZSB0aGluZ3Mgd2hpbGUgZG9pbmcgdGhlIHNwbGl0L3JlLXdvcmsuDQo+DQo+
IEJ5IGxldHRpbmcgWEVOX1BDSURFVl9CQUNLRU5EIHNlbGVjdCBYRU5fUENJX1NUVUIgdGhpcyB3
b24ndCBoYXBwZW4uDQpJbmRlZWQNCj4NCj4+IEkgYWxzbyB0aG91Z2h0IHRoYXQgImNvbXBpbGUg
b25seSBwYXJ0cyBvZiBpdCB3aGVuIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQgaXMgbm90IHNl
dCINCj4+IG1heSBoYXZlIG1vcmUgY29kZSBnYXRlZCByYXRoZXIgdGhhbiB3aXRoIGdhdGluZyB1
bndhbnRlZCBjb2RlIHdpdGggQ09ORklHX1hFTl9QQ0lfU1RVQi4NCj4+IEkgYW0gbm90IHF1aXRl
IHN1cmUgYWJvdXQgdGhpcyB0aG91Z2guDQo+DQo+IFRoaXMgd291bGQgYmUgYSB2ZXJ5IHdlaXJk
IHNlbWFudGljcyBvZiBYRU5fUENJX1NUVUIsIGFzIHRoZSBzdHViIHBhcnQNCj4gaXMgbmVlZGVk
IG9uIFg4NiBhbmQgb24gQXJtLg0KPg0KPiBHYXRpbmcgY291bGQgZXZlbiBiZSBkb25lIHdpdGgg
U3RlZmFubydzIHBhdGNoIGp1c3QgYnkgcmVwbGFjaW5nIGhpcw0KPiAiIXhlbl9wdl9kb21haW4o
KSIgdGVzdHMgd2l0aCAiIUlTX0VOQUJMRUQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCkiLg0K
DQpNYWtlcyBzZW5zZS4NCg0KQW5vdGhlciBxdWVzdGlvbiBpZiB3ZSBkbyBub3Qgd2FudCB0aGUg
Y29kZSB0byBiZSBjb21waWxlZCBvciBub3QgZXhlY3V0ZWQ/DQoNCklmIHRoZSBsYXRlciB0aGVu
IHdlIGNhbiBkZWZpbmUgc29tZXRoaW5nIGxpa2U6DQoNCmJvb2wgbmVlZF9wdl9wYXJ0KHZvaWQp
DQoNCnsNCg0KIMKgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EKTsNCg0KfQ0KDQphbmQgdGhlbiBqdXN0IHVzZSBuZWVkX3B2X3BhcnQoKSBmb3IgdGhlIGNo
ZWNrcyB3aGVyZSBpdCBpcyBuZWVkZWQuDQoNClRoaXMgYWxsb3dzIGF2b2lkaW5nIG11bHRpcGxl
IGlmZGVmJ3MgdGhyb3VnaCB0aGUgY29kZQ0KDQo+DQo+DQo+IEp1ZXJnZW4=

