Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F04AC293
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267106.460816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5gA-0004mQ-Gu; Mon, 07 Feb 2022 15:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267106.460816; Mon, 07 Feb 2022 15:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5gA-0004k7-Dm; Mon, 07 Feb 2022 15:11:46 +0000
Received: by outflank-mailman (input) for mailman id 267106;
 Mon, 07 Feb 2022 15:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH5g9-0004jx-0l
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:11:45 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4157305e-8828-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 16:11:43 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEgac023710;
 Mon, 7 Feb 2022 15:11:39 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350ur8gg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:11:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:11:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:11:33 +0000
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
X-Inumbo-ID: 4157305e-8828-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb2s6utuF4l/Fk0QuN5hc79ijeRTNg4F5aRo+/Mwg0enPWxVMzUWI68eoaLwK7Cbf1CCz6BIBC7Ew6G79amMmb/IiBjbrCDsEr4dMsNOx3o81JGOmrbrEsLzfRENdVKxZyDiA0Cy/H+xk6J0Z/Oi5Fx+GB0ad9lXSU8UfkXg1LV2YfhCn2Sza3+0w7T8nCFYHVVOJ7W87zNFhiN3PlKf11lmkL8Hk4r0b7ZH7JTzm2HWCUmLFi5/ytIZZg4mG0nTEMF5QRsXwP9JBx7A+MOlAibU0/hmHHGuJYC5Uw9bGnqdESAB/FfKhmNc0rUaqlwp3f6lkt1ZrM+5+NoZ6JNu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dibTvYft0ltfhGCH+vWFW/7Xw2VZD5kAewZOlI9fu60=;
 b=nr+2eqZ0/SpfGsXvK9yg3ei3ldERx13zj5tvXaz25vCGRd3L+4zVKHOCmf/v/WShoPJogXzzyBdWKrfBfCZPRn04HWi+eupgRNcYkwN6pRUPk8W6KppLRcEWBW+Vo54D+Zt2k4nRJjUfunCEzHcB3dL//ctvwROtewAeRi+FCeZOQRikw/BPpUvLSHvX2RwbgGW9UJcmGFxvX3sejrHBJxVVl0UzyUkkM6n0V5kIkCQcCXYoleJBSVkHbJyJzblRNuCLg3vdveJdn0UvDcO0ykHtwmHqxa1o148a+J8SZHMUVqdcdzX9gzZARWC0+/c/zQPY2tCrBWYX9/rLL4pHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dibTvYft0ltfhGCH+vWFW/7Xw2VZD5kAewZOlI9fu60=;
 b=S6JUbE9FCtoR8K0S6tUE4lHEGLxaKgQ9EQKbdAhv8NXStEIpcggqYoobhp2gCK3g1r/I1w20Z05l2sZE/t+li53fM5DRzXKOrCWmskodIwS+9+0TvmteIWP1RyPOi3yrVSpRjhQLISQm0WZ2t/QIYQ+q3SU651HbLggRKzzuWMqJNCCoz1cYurtweiPvxKoNG+4RqHLRfZvbL+CDOWP9ZUyvRsDAeQhAq44Bu52AEWMF1wwS5oO8HPYf4KCwK0jdcsLQV77UcFcKhRoMQmMdBI/gm8bxQww3xQUwI75kBxDdrkpOxbJHoIbmSDPXbsmXnHgKCbm1k8ksapSv9tg3JA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYA=
Date: Mon, 7 Feb 2022 15:11:33 +0000
Message-ID: <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
In-Reply-To: <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7a36dfa-9280-4598-fef7-08d9ea4c20d6
x-ms-traffictypediagnostic: DB7PR03MB4523:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4523A3DD9DE814469A2F79B8E72C9@DB7PR03MB4523.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 c0zZyHGOLZntVsnFOwxOLOayz8zdBbwXhbqt0bw7GHGNlRvOWEiuS+0DM6PhPlavNKQyNgTMiJ50+RT/mkI1pEcakMurWyQlL9KFUEuQI5puhwxP/gylp9BH42Gsvr4TYaoBBkAL9odB6pagZDwYNuXs7+dTcMvLeod+IMHmvIZSPvOisPCCuwCGU41gX1oX9czycCXeIOuYDZWSMnkv051NQtqjdNjx3dPbPmsNZYxNNGF5BIkwsESKhA8+Js6CYQnSXzouwPrG9g1O/27qjLdnnkTLBREjX1HMgGnV9NBPboKPz/SVgW6h6Cdbn3CwM900BaR8Y645RqWa39sOLL30P7s8QdYzreW6e0m4h/6DTTfOdAzgsxxPn/OCtgUFRhebKuOI0i9O+IkV/5CgR6uo2mC04AIer6XsAxfMFO0OZupjAqLwcGjwv5U3x3ipG0pRrj545+nRTLoqNSiYjMQuUeRf9yZVN5uVvWZCosl+9JsypVCCk880xUYMd1Aw6t/wit910P5OTZiSZNZWlkP6yKWulG9gb3ZmPjNuAuuml/c/DCFLxLooWQUQXIkmQSxm72/efmwi1WcD8AsHGgbbn4DL2jn6Yd7tnpHRtYqNBkryZ6jOhzOxCqBMjHJEVaIy5aW9zYI7tdVbwz6ZQcBObIqK7Ei21xfKb2m6OYFCbd7Oa1O3CM3T1r9BLBQ6ORVabGVis9ssfg3lZxU6RV5wI+3Fz4hiwdEXKSlB3nc9cpUPdZowys8/PxfKk0zrmni8GMs4TZnvyljs9RTcROR37IKy/ojLrO4kY2jDSLWJsG2yf6pE/k+iZb0NC4IdIaSwYBktjpoiX0SKtzwGrQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(53546011)(76116006)(8676002)(38070700005)(71200400001)(8936002)(64756008)(66446008)(4326008)(66946007)(55236004)(66556008)(66476007)(110136005)(54906003)(316002)(122000001)(83380400001)(36756003)(2906002)(6506007)(6486002)(966005)(186003)(26005)(2616005)(107886003)(31686004)(5660300002)(508600001)(6512007)(38100700002)(7416002)(86362001)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cS9ld2E5NldwQUJnK1FmVzNMQm5oYlVlWFV1UWpWY0hPRWVBNnVTQUZySS9i?=
 =?utf-8?B?R2QvZG8wUGh5RHNZL3FpTlE2VHpGSzdOTmdaWmFEaEhWSnR3TUNDbmFvVEVN?=
 =?utf-8?B?RVlJMXRRTk5ZQzR0aDM4WXBkM2h1UVBvT2x4VWlWWW9CRWNTSlBLWk15Z0E3?=
 =?utf-8?B?NEJDeUdJYmNMU044MHFtUkF3N01DU2QwMUNla00ySjBKNjJ3L3V3eUxKR0xZ?=
 =?utf-8?B?OGdvSVQ3UHRFcjhpenI3NFN1WWIwKy95VTNmdkRRWGZkbDkzbU50TERTcEJT?=
 =?utf-8?B?ZG02c1psWnIrN0RhVVprejVNWVJsWkZieENPclhTdUxWakdrS3hvRnFLaXh4?=
 =?utf-8?B?dy9LYWhWQmFDeFVxUlhWSjAwMFNVTDlSVVBoa3pzMytTUEtPZVJEU3FlN1c2?=
 =?utf-8?B?eUtFWVpMUTI3YW1VNnF0ZmZJMW1UNXQrU1F4MUk3QlpPV0VKV3hDL2VmTWUr?=
 =?utf-8?B?eVZ4YmgvUXlTNkxMemVXc25VNHdjYlJRYWVwalhJb094aTZBeHFBRFFkRVdD?=
 =?utf-8?B?amQreXFKUFlNaTNjRVlwTXVzSWM0ZDlVbUFpbGhiNkp5VW5VTWljMlhBekV5?=
 =?utf-8?B?ODRSaGx1VlVxbE0vUUZQZGg4UEJMeUtRaXJocjlneldvSy81Wk5GL3dIZGZ0?=
 =?utf-8?B?WjJvN2xWSExRUXFBQTVSUUtYckZqNmdTQ2VuWmg3ZE5hOUE4c2tkMzA1Nm85?=
 =?utf-8?B?TmEvVkd6TkYyYWVFaXJFdG14bExvUy9CcVNqQXR6cWVCd0M5MXN5UmZPQkJO?=
 =?utf-8?B?UnkzVWV2cDBiK2NqdkRnR2FwbTYrY0kzN3RxQ0l1WXN6TkdHTmxlaitkcC8r?=
 =?utf-8?B?M0JvN2ViOVZDRitYaXNKeWV1aGFzTXh2b2JlT0RDbitSQzhPUEs5VmtIY0Fh?=
 =?utf-8?B?N2p5UnBDK09UenVvdkxqTlRkYUl6RHU4ZkZ6SUU0SFBXRnRIMytJL2R1SVF5?=
 =?utf-8?B?OFRBYVczR3dEcVN2NTZlRmxzeU1GWG94Qld0K0dtUHBDRjZlT2dPSzVNalFw?=
 =?utf-8?B?YnpTUTZCY3Rva21mQzBGMHRob29lMlU3WmlhUnhZRjROb1J4TTRMOUYyTG11?=
 =?utf-8?B?T0UvU20rZ0lOdkQzSnRwbFlwRTRjYUR2ZEVZQUFSZXF3RDF6RHZIcmN0K0Ny?=
 =?utf-8?B?QzVDNnRmbUg1TmpISWd4K3JoRjRCcVBITXVLWHk0OUphb3M5TjZxbE5DbGI3?=
 =?utf-8?B?YlRKTjBWcHNzLzF5THh4QXpqc04vdWYrQkNtcTN4Ymh1SWNScldxa2F1dS9p?=
 =?utf-8?B?OUp1YUFETzN5NElyK0VaUVB5eHJJVVhVN2ZobXVQV1BJMmFoTU5VK3kxcFMx?=
 =?utf-8?B?ZGhuaTRXdGVIN1djZkUrZU5EYkprUmRCNDFnVkJQNFFmdlZ5K0grWUFSVng5?=
 =?utf-8?B?eTNDRHdMR0V4Y1pzMVgyN3k0Qm5rTnMzK2M4OStNanNVTC9sZG82MXZycFov?=
 =?utf-8?B?ZFhXaEVHb052WU1ZdzJCdFk3TFJ2cC9RNEUyQVBQQmdWSDAxMURJeW1GVDZ1?=
 =?utf-8?B?cGFaeC9DV28xK3VpY1Bsa1BoVWNTT2dEbk9vUHdKS2RZa2VXZmVsTGpzcldD?=
 =?utf-8?B?cUUzUGZQb1NmTDQ2M1dzY2FMeGJ4NDdPbmxOY1dyRlkvVkpHMWxiOXNCMy9C?=
 =?utf-8?B?R1BmOTZnKy8zUHhOc1dIUFh1SlgrOUJoMEFtY3dGZTR4Ui9kTldYNEZacXZh?=
 =?utf-8?B?N1lOeHpHWk9XclNOS293cFk0L3BVbExHR1FDdlZKVDIwSVQ4d1BERlFLQk9N?=
 =?utf-8?B?K0RkbndBKzlpQlI3ekhkVzZ1QmtISlRwODdOL0VEQlNZMVdidEpzcGFVQURQ?=
 =?utf-8?B?OE1KU2VNZTVOeEpkeDY4RHhGN20vSmFaSFlDREhVa2pUSTNxRGQvcnZ2dGk4?=
 =?utf-8?B?eEEwU3ZyTUhvd1NHZW4rcVNzaUduZjVrUVhUazVKVzdCekFKYkgyTWlRU1Va?=
 =?utf-8?B?MC92Tm1TVlRUNGFyNTlEcDVKenVvZ0FieU1UNWlvdmtHNFI2NmpmekE2RHEr?=
 =?utf-8?B?UEFBeTVteGU5Z3A2UGI0UjVIellYeUwwclg5VDBCb3RzZGUxVFFpM1JJTE5u?=
 =?utf-8?B?Sngyb29Va2RiNGYyWEdJSGZyV3hjbjVTam93cVBqOUh6V2xydXFZRGxEdXVh?=
 =?utf-8?B?T0I5VytmKy8wQW00RkN3L0Y0LzkyRTZPSlFHMGYxSzNMMkM5RFRySktjbUQy?=
 =?utf-8?B?NDV3c1c3Yk9aWlZaZEY5Wmh6T1FtT1ZzNktPamtxZFppWFlFRVFMRkt0bTA1?=
 =?utf-8?B?dDl6L2FXbENveEFIRHE1VnFUTlErTDlGRkhmTFlvK0U3V0xlaGVTMGJwekIx?=
 =?utf-8?B?VDdNYkVCbStzOUxwNU91RlUxWEpteENaZlJSL2dFcC96VUVydnNCckp3VkdP?=
 =?utf-8?Q?Y33au60hgY82HVPA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1D8E10EE9B02B41BDB8895043A0D63A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a36dfa-9280-4598-fef7-08d9ea4c20d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 15:11:33.7917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRdbDyJ/W9yaphMnMI6h4DTScd3deUZRUv4KGmYVEm56T3ARBLHaJyNCQy2mkOGUTGOxBPkZ36MvEU4pyNZ+x+fSQ+QyFLr76gvt+f+jyzsxpsREed2/Hv8l5EOT8ZDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4523
X-Proofpoint-GUID: 5OD4F47qKZtgWDv_aDOgiSj9Srf6aXKI
X-Proofpoint-ORIG-GUID: 5OD4F47qKZtgWDv_aDOgiSj9Srf6aXKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=730 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070098

DQoNCk9uIDA3LjAyLjIyIDE2OjM1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMDcuMDIuMjIgMTY6MjcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBNb24s
IEZlYiAwNywgMjAyMiBhdCAwMzoxMTowM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
PiBPbiAwNy4wMi4yMDIyIDE0OjUzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+
Pj4gT24gMDcuMDIuMjIgMTQ6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBJIHRo
aW5rIHRoZSBwZXItZG9tYWluIHJ3bG9jayBzZWVtcyBsaWtlIGEgZ29vZCBvcHRpb24uIEkgd291
bGQgZG8NCj4+Pj4+IHRoYXQgYXMgYSBwcmUtcGF0Y2guDQo+Pj4+IEl0IGlzLiBCdXQgaXQgc2Vl
bXMgaXQgd29uJ3Qgc29sdmUgdGhlIHRoaW5nIHdlIHN0YXJ0ZWQgdGhpcyBhZHZlbnR1cmUgZm9y
Og0KPj4+Pg0KPj4+PiBXaXRoIHBlci1kb21haW4gcmVhZCBsb2NrIGFuZCBzdGlsbCBBQkJBIGlu
IG1vZGlmeV9iYXJzIChob3BlIHRoZSBiZWxvdw0KPj4+PiBpcyBjb3JyZWN0bHkgc2VlbiB3aXRo
IGEgbW9ub3NwYWNlIGZvbnQpOg0KPj4+Pg0KPj4+PiBjcHUwOiB2cGNpX3dyaXRlLT4gZC0+Ukxv
Y2sgLT4gcGRldjEtPmxvY2sgLT7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByb21fd3JpdGUgLT4gbW9kaWZ5X2JhcnM6IHRtcCAocGRldjIpIC0+bG9jaw0KPj4+PiBj
cHUxOsKgwqDCoMKgwqDCoMKgIHZwY2lfd3JpdGUtPiBkLT5STG9jayBwZGV2Mi0+bG9jayAtPiBj
bWRfd3JpdGUgLT4gbW9kaWZ5X2JhcnM6IHRtcCAocGRldjEpIC0+bG9jaw0KPj4+Pg0KPj4+PiBU
aGVyZSBpcyBubyBBUEkgdG8gdXBncmFkZSByZWFkIGxvY2sgdG8gd3JpdGUgbG9jayBpbiBtb2Rp
ZnlfYmFycyB3aGljaCBjb3VsZCBoZWxwLA0KPj4+PiBzbyBpbiBib3RoIGNhc2VzIHZwY2lfd3Jp
dGUgc2hvdWxkIHRha2Ugd3JpdGUgbG9jay4NCj4+PiBIbW0sIHllcywgSSB0aGluayB5b3UncmUg
cmlnaHQ6IEl0J3Mgbm90IG1vZGlmeV9iYXJzKCkgaXRzZWxmIHdoaWNoIG5lZWRzDQo+Pj4gdG8g
YWNxdWlyZSB0aGUgd3JpdGUgbG9jaywgYnV0IGl0cyAocGVyaGFwcyBpbmRpcmVjdCkgY2FsbGVy
LiBFZmZlY3RpdmVseQ0KPj4+IHZwY2lfd3JpdGUoKSB3b3VsZCBuZWVkIHRvIHRha2UgdGhlIHdy
aXRlIGxvY2sgaWYgdGhlIHJhbmdlIHdyaXR0ZW4NCj4+PiBvdmVybGFwcyB0aGUgQkFScyBvciB0
aGUgY29tbWFuZCByZWdpc3Rlci4NCj4+IEknbSBjb25mdXNlZC4gSWYgd2UgdXNlIGEgcGVyLWRv
bWFpbiByd2xvY2sgYXBwcm9hY2ggdGhlcmUgd291bGQgYmUgbm8NCj4+IG5lZWQgdG8gbG9jayB0
bXAgYWdhaW4gaW4gbW9kaWZ5X2JhcnMsIGJlY2F1c2Ugd2Ugc2hvdWxkIGhvbGQgdGhlDQo+PiBy
d2xvY2sgaW4gd3JpdGUgbW9kZSwgc28gdGhlcmUncyBubyBBQkJBPw0KPiB0aGlzIGlzIG9ubHkg
cG9zc2libGUgd2l0aCB3aGF0IHlvdSB3cm90ZSBiZWxvdzoNCj4+IFdlIHdpbGwgaGF2ZSBob3dl
dmVyIHRvIGRyb3AgdGhlIHBlciBkb21haW4gcmVhZCBhbmQgdnBjaSBsb2NrcyBhbmQNCj4+IHBp
Y2sgdGhlIHBlci1kb21haW4gbG9jayBpbiB3cml0ZSBtb2RlLg0KPiBJIHRoaW5rIHRoaXMgaXMg
Z29pbmcgdG8gYmUgdW5yZWxpYWJsZS4gV2UgbmVlZCBhIHJlbGlhYmxlIHdheSB0bw0KPiB1cGdy
YWRlIHJlYWQgbG9jayB0byB3cml0ZSBsb2NrLg0KPiBUaGVuLCB3ZSBjYW4gZHJvcCBwZGV2LT52
cGNpX2xvY2sgYXQgYWxsLCBiZWNhdXNlIHdlIGFyZSBhbHdheXMNCj4gcHJvdGVjdGVkIHdpdGgg
ZC0+cndsb2NrIGFuZCB0aG9zZSB3aG8gd2FudCB0byBmcmVlIHBkZXYtPnZwY2kNCj4gd2lsbCB1
c2Ugd3JpdGUgbG9jay4NCj4NCj4gU28sIHBlci1kb21haW4gcndsb2NrIHdpdGggd3JpdGUgdXBn
cmFkZSBpbXBsZW1lbnRlZCBtaW51cyBwZGV2LT52cGNpDQo+IHNob3VsZCBkbyB0aGUgdHJpY2sN
CkxpbnV4IGRvZXNuJ3QgaW1wbGVtZW50IHdyaXRlIHVwZ3JhZGUgYW5kIGl0IHNlZW1zIGZvciBh
IHJlYXNvbiBbMV06DQoiQWxzbywgeW91IGNhbm5vdCDigJx1cGdyYWRl4oCdIGEgcmVhZC1sb2Nr
IHRvIGEgd3JpdGUtbG9jaywgc28gaWYgeW91IGF0IF9hbnlfIHRpbWUNCm5lZWQgdG8gZG8gYW55
IGNoYW5nZXMgKGV2ZW4gaWYgeW91IGRvbuKAmXQgZG8gaXQgZXZlcnkgdGltZSksIHlvdSBoYXZl
IHRvIGdldA0KdGhlIHdyaXRlLWxvY2sgYXQgdGhlIHZlcnkgYmVnaW5uaW5nLiINCg0KU28sIEkg
YW0gbm90IHN1cmUgd2UgY2FuIGhhdmUgdGhlIHNhbWUgZm9yIFhlbi4uLg0KDQpBdCB0aGUgbW9t
ZW50IEkgc2VlIGF0IGxlYXN0IHR3byBwb3NzaWJsZSB3YXlzIHRvIHNvbHZlIHRoZSBpc3N1ZToN
CjEuIE1ha2UgdnBjaV93cml0ZSB1c2Ugd3JpdGUgbG9jaywgdGh1cyBtYWtlIGFsbCB3cml0ZSBh
Y2Nlc3NlcyBzeW5jaHJvbml6ZWQNCmZvciB0aGUgZ2l2ZW4gZG9tYWluLCByZWFkIGFyZSBmdWxs
eSBwYXJhbGxlbA0KDQoyLiBSZS1pbXBsZW1lbnQgcGRldi90bXAgb3ZlcmxhcHBpbmcgZGV0ZWN0
aW9uIHdpdGggc29tZXRoaW5nIHdoaWNoIHdvbid0DQpyZXF1aXJlIHBkZXYtPnZwY2lfbG9jay90
bXAtPnZwY2lfbG9jaw0KDQozLiBEcm9wIHJlYWQgYW5kIGFjcXVpcmUgd3JpdGUgbG9jayBpbiBt
b2RpZnlfYmFycy4uLiBidXQgdGhpcyBpcyBub3QgcmVsaWFibGUNCmFuZCB3aWxsIGhpZGUgYSBm
cmVlKHBkZXYtPnZwY2kpIGJ1Zw0KDQpAUm9nZXIsIEBKYW46IEFueSBvdGhlciBzdWdnZXN0aW9u
cz8NCg0KVGhhbmsgeW91LA0KT2xla3NhbmRyDQoNClsxXSBodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL2xhdGVzdC9sb2NraW5nL3NwaW5sb2Nrcy5odG1sI2xlc3Nvbi0yLXJlYWRlci13
cml0ZXItc3BpbmxvY2tz

