Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B947D1C1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 13:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250812.431958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00oz-0000lL-Ug; Wed, 22 Dec 2021 12:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250812.431958; Wed, 22 Dec 2021 12:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00oz-0000jB-Qe; Wed, 22 Dec 2021 12:34:17 +0000
Received: by outflank-mailman (input) for mailman id 250812;
 Wed, 22 Dec 2021 12:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRTG=RH=epam.com=prvs=29901831a2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1n00ox-0000gJ-N4
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 12:34:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77fa5aa9-6323-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 13:34:14 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMBuIW1029535;
 Wed, 22 Dec 2021 12:34:08 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d42cg8df7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 12:34:08 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB8084.eurprd03.prod.outlook.com (2603:10a6:102:223::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 22 Dec
 2021 12:34:05 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%6]) with mapi id 15.20.4823.018; Wed, 22 Dec 2021
 12:34:05 +0000
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
X-Inumbo-ID: 77fa5aa9-6323-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgzNASCzHrXbmWru/kzmePPg628VpEbTOyH0ue4DRPcGR5XdWc61ju6hI8DvcyGA/OWLwjiTR3rau0IRxY81l3WGSdJ8ibKdCTIgc/AWHJrfKaceXjBfdym7Su97J41KL6hLd9u0UFiuJ9+XuPMYr1sLzOVGLO/tIDgSvS26GDRAj25/q6yXd6xm1XpngrlB7K6gsg+sTkGmB7SWpVGCGzXaFf5bpJ78I0xD6DuIwxOjjMrPnPXYjhcRciyGlJtM/KFQ/uGGTm8fxt8ThYo/me8jLClnpWLll8bzymuu1vDoT26yn6UrkEd9Ad9GkY+d5DLUj6rOmZ25RSqEkbNzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWaDTH8bnvmgvfKbi45wbovi24gKodr03kYy2JAS34=;
 b=lV3kB38u0WLMDzszGpLr2KQhOvdURg0pYiUkyRsuxFdCvAXUbEDFc/0oaPgY8ie6rR2+jJ1HXARuoEUzYW7wCqqDMQOAc8/iLJszqTfj3waSlIXMHyb6WSAXMRIMnWDov53VuqxobzJnS5FAJwzVyf866RgHiLcF6K05QmfBscUzf2ZMtF7kn8Kk0xddhsSGUCujREEVn/CRjiLCtNdF4E32KEeN/HNg8cLivruhw85X17x1DRJhwl6nGVJmyLZqAT0imX5wHUuKh8EBPT9tJl/iIMQHzum++/dGOfauBYzoh1C7VsXRmY+XaRSf5a6b8W2Rm/mYfg8J+Y3EjW5MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWaDTH8bnvmgvfKbi45wbovi24gKodr03kYy2JAS34=;
 b=o5jm+pT/QQXiufSH/kr7wOF5UBE9xqQdfMwX3/Z20NaEGBVL5TwYxUi69QVC3fUWN+ch+oo7o959RQ90/68aqI4hepTlCiT9aSCZFMKWSXyNoalsk3xdT/TbJ/On6Ru9XSPaLz+CiOaiRbHBYTVMMjCujYyy/GgCs5ByLjrtePlDTHYAZCIZUsj+K1b4ZDDhMwzMaLbGB3aHysU2SakM/iaC5p5doULW2Y1C//DWBOihpxdcfFfcB/+O91nkoSPJhwiFkBRDov3hYz1yKl879fa9JPgiWQkEZhe1IFO4I+tGOHdnJj5ySxowh1VwKOsPzSVafz6jb/wusl4j8xo/wg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: 
 AQHX8M3LNgat3drmYUW4ty+W1/SkP6w0P2iAgAJeh4CABnNRgIAAc5MAgADFCgCAAB3ugIAABU0AgAAFZQA=
Date: Wed, 22 Dec 2021 12:34:05 +0000
Message-ID: <87ee64x1hf.fsf@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
 <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com>
 <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org>
In-Reply-To: <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6f3df96-ebb9-4464-8f10-08d9c5475782
x-ms-traffictypediagnostic: PAXPR03MB8084:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB808426F72D9C9C631AD4B839E67D9@PAXPR03MB8084.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xz4YFB5c1PNcV88B8hCDjfvB6UC9V4bMOaWP5dCh+YpQRWSnsG2jww74jNXKIEbsupYB5xlG+PTQ75qMiIBKdb6N/VL8LI4dcfz5Z08w7bYJAzobN0fUShi6idQOyn+kGxMc7O0tJM4fdC8FiM2T+OlfTBXzeFXF7+igOZ3ZH1ltlQdhu3dWdmQBD4zyalI+qcFlAEeznBy3A/kB4jrjXs2mTOo7WRT1+FkQsZoBBHaTv3ihTzZxKNhqcuwJ73ybpKkn/UPG0Id/dP0cM3p99YSw2K9yvhoLzeW8mnaVMyxroirgm5DWbQHH/DdsWo+oVSg+H5Kp5LmDZa2lZ3kNQa/PFQQ5BjMsK1pN6N+e39MqEZBnlBMKhy8J43x5g6A5IDLtO0iuKfzx9GiZ48w1AzVVTDGSo5NksbLLtb2ZZgGNKRA7N7DqHA/H/M5qeK1U+DODmL3NIbY06Q+3K1fdBAUnjD1n34P4jsPrW7VP/VHsVWiGxy+FyAhfpDWFgMI5OnRG1OwXcGw2yaGksXOqbeYAju0A3HP6ISEIJmGdXsHyvO8ZLspHVwgjVaOC0c4YYBC+CR7XHWf0ykBChvYhU2TbeyN8V4Fjrj7rUytplPiz62yg1eeHLLkB9mca+O42UowRAFkj33+ZxsXD95FCLzaVYCLM3xjHS3Ho8HfClGzbd1Al9LXAMNRuni53KeBsqb0bns34S0+jHlsNXdBJLw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(36756003)(53546011)(86362001)(122000001)(6512007)(54906003)(66476007)(38070700005)(8936002)(55236004)(71200400001)(83380400001)(64756008)(6916009)(66446008)(91956017)(7416002)(6486002)(2616005)(2906002)(8676002)(5660300002)(66946007)(38100700002)(26005)(4326008)(76116006)(6506007)(66556008)(186003)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dUdxSUliNkhrRHBXVk1JVFFxV2pZRjJCZGhDamVVWnFOeXg1WnFrNERzNmEx?=
 =?utf-8?B?NWZMYkVWUTZhbllLQmhkdENJREl0UTJ2d1hoT09nckFUMUVnYllzcXdISndu?=
 =?utf-8?B?eXF2eElDMWZhZmYwbmtKNGpaV1haVUg4QzZ4dFlBUFBBMVp5NmxLUUNHWkRW?=
 =?utf-8?B?YXlCVDhNMWgyUFkzOTd4OHA2Z1YyWHUxRXZIeUxVdFVTdkV2NFp1TjgrMkJn?=
 =?utf-8?B?NjF0d3hKMGlwNGFuLzVlTW9wbVlIcnBzSW0yK0p3OFNXM0R0V1ozNkw0L0d4?=
 =?utf-8?B?NGxNeFgvcFFZRDBWUWJvL05vUXg3SjRlMDVub0lMRkM0VE9aTGZnTUlmZVp4?=
 =?utf-8?B?RUJwQzR6V2xsNnBaWFBmd2ROcTNuUW5Vb0pkeTlEd200SEtFZTN6czJNNi90?=
 =?utf-8?B?RHVlNG1FU21jTzJGc0U0YW54TDZQR0g2amVWZzByelpGUlg2a1V5STZEbFFl?=
 =?utf-8?B?UVNVZmxjT2YyWmxiMHBMUVhhQ3d1UkdFa1l2QlBrWmtvTjlWUXhIc2w2Z1lx?=
 =?utf-8?B?dHBTOHlYcnB6OGdGOThFakJCa0dVeFdEdzB0bE00dlRFZ2lsbmNaNG02aWl5?=
 =?utf-8?B?K1ZqRTBNaXE3dzUzUlBrMXhLb0YraFN3QkJHT3NBL1lKcXVkelU4eVlwaHRi?=
 =?utf-8?B?bjRCUVR5emxsR3p2eWlGYmh4bGt1dWdSeHY2NC9sRFJoYytGWGswbXBvakgv?=
 =?utf-8?B?RE9xeUpycDFpOEtHeGc3Z1VhTE1FYkt3Z0w4bUQyK0xUNUJyNjZRbGVlaWNj?=
 =?utf-8?B?RnlKRVRhS25DYUh0SjlHU2lUQTNCN254RTR2K0hrNXpLS2sxL3pQcHV0MTFO?=
 =?utf-8?B?V1R3b1dTSzcxa1BpOUZ6Uzh6czVCZWQ1em9RZTlqYmkrN2VBa0x0L1BFczRi?=
 =?utf-8?B?bi9XOGdPK1RwUjlqR0owUzNlVlBBQTZMREdudGNvdVh2WFhQeng2UFBrRlZE?=
 =?utf-8?B?VXlNY0RTRkJsQTFhblkwaEw1VHMyY0tzV2ZoY3dLZnJEUElEdURuV2hHR2hH?=
 =?utf-8?B?aW4xNlBET2JtV2IzWngzc1dPcGIwSzVJMmk2eVJsN3FYc0IzcjllMm4vVWln?=
 =?utf-8?B?ZFhTbWFHdTBuVEN5SDN1YVJ4a281anFxUlBFUDllSStpQWpQNWFvQk5YejZ2?=
 =?utf-8?B?aHBGY1NEWTlKRkRQeUhTdTJ3L2ZiQmxDY0NTaE1XdExnZXdDZlFYMjRob3VH?=
 =?utf-8?B?SkJzbkNJZVkweGpNampJS2pGak8wTlcvZnZ4MENtV0Q4UmJEWnhGMjRjNzBV?=
 =?utf-8?B?QzZOdHpNZ2hsd0hrYUJYRkJHSTVsV3dKL2ljTHZheHdzNXpYTGp3SHdKaXJq?=
 =?utf-8?B?Zk50a3JoZUMrcUxsN0JkdkNmN3VhaExuYi9rekRNK0pzdC8xSmhzRXdSWnlQ?=
 =?utf-8?B?akk2ZXpSZEZkQi9SSExDSVJSckdxNjJ5K1FtWXh0NXhpbmlrKzJzUkJ3NTEx?=
 =?utf-8?B?cEd0cStSeXBYUjlXd2I5MmFiZ1dDVTV0dm50WG1iMHhPeU5jd1pMNk1QVDZn?=
 =?utf-8?B?MXIxNGUvcHRSRldMK1BPWWh0SmRSUXB5cVptbEdWaFFkamJQTFFaMTNGVWZ0?=
 =?utf-8?B?MUUzbytSMk5TMVZUUERldVpKRHc5Sm90aU5TMzlBdUtFeW1ZVnBrL01ydVJj?=
 =?utf-8?B?b0lONDk2Myt6d25rZVRnKzU5eWxkL1dkeTB1WHpVdkttUG5jRWNQeTNWaWJP?=
 =?utf-8?B?Nmcwb2Mxc1J4RGNrQnZyZjdMd3ZwSHpIV3Vuc0orSFBidDU3QUI0VVhnNGo4?=
 =?utf-8?B?dTZnalpZWExhelhnQ2xGM2dmTC9BR2VQME0zZTR6R0VhcXVSMWxQMHovZ2pr?=
 =?utf-8?B?cSswcU9ZMlFIdllNeG5HWEc3cUY2Z01rcVFHNHZTNFZLWmZEOXgyS0hSV015?=
 =?utf-8?B?VjNpRnQxOWZTbUxUS1dnb0hPSStwOVNkR0tVMHpJOEQwdjFlOWx1RnFIMEZB?=
 =?utf-8?B?aVhIY0lnd0N2L2ROV3lFejllRGJCQyt0Q2ZZOU10d3prY2NOblVtV0JZQUUz?=
 =?utf-8?B?SEcwaG9TT3NXbURpZWROSkxaMWZaOFBMaG8vZ1dGLzBoTTUvcHQyRVZQdzVS?=
 =?utf-8?B?aWhMeHphMnRKR1NoUTFGd0oyK0txYWJJVnp6VzFMYnE3bjZOdjR2dERqb1pK?=
 =?utf-8?B?Ry94ZWx3bHFXWmJ2YkhwN1pXWTdCSkdOSFkxOUxMckc0TmdqQmExaldnS1dF?=
 =?utf-8?B?QThQQzljaUJQRFhMMkV4Q2IvNFVLaUxuR2dsYXZUTWV4LzlNRTdFaVVlNUtr?=
 =?utf-8?Q?QBarmzT6GOF91PzuI/yypUbGR6wFRStLpdA8QKTp/0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFAE31BD0D06524DA7F6444D7067D5F6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f3df96-ebb9-4464-8f10-08d9c5475782
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 12:34:05.0534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIQgo3PIfRHAjkKGnrtwnE01ZuVFNN7SXWX8x+hMWDIm+T4BXZRDw4QljcyvT9z/VaWSatc9gOLRqRcnXK2wBLKC4ss8bUoPCezjyKQv9PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8084
X-Proofpoint-GUID: Ewf2bCWAX41LAf-EeUVxg4OTQ5E8MF3j
X-Proofpoint-ORIG-GUID: Ewf2bCWAX41LAf-EeUVxg4OTQ5E8MF3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_05,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112220070

DQoNCkp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyaXRlczoNCg0KPiBIaSwNCj4NCj4g
T24gMjIvMTIvMjAyMSAxMjoxNywgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cml0ZXM6DQo+Pj4gT24gMjEvMTIvMjAyMSAyMjozOSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBUdWUsIDIxIERlYyAyMDIxLCBBbnRo
b255IFBFUkFSRCB3cm90ZToNCj4+Pj4+IE9uIEZyaSwgRGVjIDE3LCAyMDIxIGF0IDEyOjE1OjI1
UE0gKzAwMDAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4+Pj4+PiBPbiAxNC4xMi4yMSAx
MTozNCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+Pj4+PiBAQCAtMTgxNywxNyArMTg1
OCwyNCBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9fYWRkX2R0ZGV2cyhsaWJ4bF9fZWdjICplZ2MsIGxp
YnhsX19hbyAqYW8sIHVpbnQzMl90IGRvbWlkLA0KPj4+Pj4+Pj4gICAgIHsNCj4+Pj4+Pj4+ICAg
ICAgICAgQU9fR0M7DQo+Pj4+Pj4+PiAgICAgICAgIGxpYnhsX19hb19kZXZpY2UgKmFvZGV2ID0g
bGlieGxfX211bHRpZGV2X3ByZXBhcmUobXVsdGlkZXYpOw0KPj4+Pj4+Pj4gLSAgICBpbnQgaSwg
cmMgPSAwOw0KPj4+Pj4+Pj4gKyAgICBpbnQgaSwgcmMgPSAwLCByY19zY2kgPSAwOw0KPj4+Pj4+
Pj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZF9jb25maWctPm51bV9kdGRldnM7IGkrKykgew0K
Pj4+Pj4+Pj4gICAgICAgICAgICAgY29uc3QgbGlieGxfZGV2aWNlX2R0ZGV2ICpkdGRldiA9ICZk
X2NvbmZpZy0+ZHRkZXZzW2ldOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgTE9HRChERUJVRywgZG9t
aWQsICJBc3NpZ24gZGV2aWNlIFwiJXNcIiB0byBkb21haW4iLCBkdGRldi0+cGF0aCk7DQo+Pj4+
Pj4+PiAgICAgICAgICAgICByYyA9IHhjX2Fzc2lnbl9kdF9kZXZpY2UoQ1RYLT54Y2gsIGRvbWlk
LCBkdGRldi0+cGF0aCk7DQo+Pj4+Pj4+PiAtICAgICAgICBpZiAocmMgPCAwKSB7DQo+Pj4+Pj4+
PiAtICAgICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJ4Y19hc3NpZ25fZHRkZXZpY2UgZmFp
bGVkOiAlZCIsIHJjKTsNCj4+Pj4+Pj4+ICsgICAgICAgIHJjX3NjaSA9IHhjX2RvbWFpbl9hZGRf
c2NpX2RldmljZShDVFgtPnhjaCwgZG9taWQsIGR0ZGV2LT5wYXRoKTsNCj4+Pj4+Pj4+ICsNCj4+
Pj4+Pj4+ICsgICAgICAgIGlmICgocmMgPCAwKSAmJiAocmNfc2NpIDwgMCkpIHsNCj4+Pj4+Pj4+
ICsgICAgICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgInhjX2Fzc2lnbl9kdF9kZXZpY2UgZmFp
bGVkOiAlZDsgIg0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgInhjX2RvbWFpbl9hZGRfc2Np
X2RldmljZSBmYWlsZWQ6ICVkIiwNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIHJjLCByY19z
Y2kpOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+Pj4+Pj4gICAgICAg
ICAgICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICAgaWYgKHJjKQ0KPj4+Pj4+Pj4g
KyAgICAgICAgICAgIHJjID0gcmNfc2NpOw0KPj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJZiBJ
IGdldCB0aGlzIGNvZGUgcmlnaHQsIGl0IHNvdW5kcyBsaWtlIHRoZSBkb20uY2ZnJ3MgZHRkZXYg
cHJvcGVydHkgaXMNCj4+Pj4+Pj4gcmV1c2VkIHRvIGRlc2NyaWJlIHNjaSBkZXZpY2VzIGFzIHdl
bGwsIGJ1dCB0aGUgbGlieGxfX2FkZF9kdGRldnMoKSBkb2VzIG5vdA0KPj4+Pj4+PiAoYW5kIGNh
biBub3QpIGRpZmZlcmVudGlhdGUgdGhlbS4gU28gaXQgaGFzIG5vIG9wdGlvbiBidXQgdG8gc2Vu
ZCB0d28NCj4+Pj4+Pj4gZG9tY3RscyBmb3IgZWFjaCBkZXZpY2UgaW4gZHRkZXZzW10gaG9waW5n
IHRvIGF0IGxlYXN0IG9uZSBkb21jdGwgdG8NCj4+Pj4+Pj4gc3VjY2VlZGVkLiBPciBJIHJlYWxs
eSBtaXNzZWQgc29tZXRoaW5nPw0KPj4+Pj4+Pg0KPj4+Pj4+PiBJdCBmZWVscyB0byBtZSB0aGF0
Og0KPj4+Pj4+PiAgIMKgLSBlaXRoZXIgbmV3IGRvbS5jZmcncyBwcm9wZXJ0eSBjb3VsZCBiZSBp
bnRyb2R1Y2VkIChzY2lkZXY/KSB0byBkZXNjcmliZQ0KPj4+Pj4+PiBzY2kgZGV2aWNlcyB0b2dl
dGhlciB3aXRoIG5ldyBwYXJzaW5nIGxvZ2ljL21hbmFnZW1lbnQgY29kZSwgc28geW91IHdpbGwg
ZW5kDQo+Pj4+Pj4+IHVwIGhhdmluZyBuZXcgbGlieGxfX2FkZF9zY2lkZXZzKCkgdG8gaW52b2tl
IFhFTl9ET01DVExfYWRkX3NjaV9kZXZpY2UsDQo+Pj4+Pj4+IHNvIG5vIG1peGluZyB0aGluZ3Mu
DQo+Pj4+Pj4+ICAgwqAtIG9yIGluZGVlZCBkdGRldiBsb2dpYyBjb3VsZCBiZSAqY29tcGxldGVs
eSogcmV1c2VkIGluY2x1ZGluZyBleHRlbmRpbmcNCj4+Pj4+Pj4gWEVOX0RPTUNUTF9hc3NpZ25f
ZGV2aWNlIHRvIGNvdmVyIHlvdXIgdXNlLWNhc2UsIGFsdGhvdWdoIHNvdW5kcyBnZW5lcmljLCBp
dA0KPj4+Pj4+PiBpcyB1c2VkIHRvIGRlc2NyaWJlIGRldmljZXMgZm9yIHRoZSBwYXNzdGhyb3Vn
aCAodG8gY29uZmlndXJlIGFuIElPTU1VIGZvcg0KPj4+Pj4+PiB0aGUgZGV2aWNlKSwgaW4gdGhh
dCBjYXNlIHlvdSB3b3VsZG4ndCBuZWVkIGFuIGV4dHJhDQo+Pj4+Pj4+IFhFTl9ET01DVExfYWRk
X3NjaV9kZXZpY2UgaW50cm9kdWNlZCBieSBjdXJyZW50IHBhdGNoLg0KPj4+PiBJIHJlYWxpemUg
SSBkaWQgbXkgcmV2aWV3IGJlZm9yZSByZWFkaW5nIE9sZWtzYW5kcidzIGNvbW1lbnRzLiBJDQo+
Pj4+IGZ1bGx5DQo+Pj4+IGFncmVlIHdpdGggaGlzIGZlZWRiYWNrLiBIYXZpbmcgc2VlbiBob3cg
ZGlmZmljdWx0IGlzIGZvciB1c2VycyB0byBzZXR1cA0KPj4+PiBhIGRvbVUgY29uZmlndXJhdGlv
biBjb3JyZWN0bHkgdG9kYXksIEkgd291bGQgYWR2aXNlIHRvIHRyeSB0byByZXVzZSB0aGUNCj4+
Pj4gZXhpc3RpbmcgZHRkZXYgcHJvcGVydHkgaW5zdGVhZCBvZiBhZGRpbmcgeWV0IG9uZSBuZXcg
cHJvcGVydHkgdG8gbWFrZQ0KPj4+PiB0aGUgbGlmZSBvZiBvdXIgdXNlcnMgZWFzaWVyLg0KPj4+
Pg0KPj4+Pg0KPj4+Pj4+PiBQZXJzb25hbGx5IEkgd291bGQgdXNlIHRoZSBmaXJzdCBvcHRpb24g
YXMgSSBhbSBub3Qgc3VyZSB0aGF0IHNlY29uZCBvcHRpb24NCj4+Pj4+Pj4gaXMgY29uY2VwdHVh
bGx5IGNvcnJlY3QgJiYgcG9zc2libGUuIEkgd291bGQgbGVhdmUgdGhpcyBmb3IgdGhlIG1haW50
YWluZXJzDQo+Pj4+Pj4+IHRvIGNsYXJpZnkuDQo+Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBUaGFu
ayB5b3UgZm9yIHRoZSBwb2ludC4gSSBhZ3JlZSB0aGF0IHJldXNpbmcgWEVOX0RPTUNUTF9hc3Np
Z25fZGV2aWNlDQo+Pj4+Pj4gc2VlbXMgbm90IHRvIGJlIGNvbmNlcHR1YWxseSBjb3JyZWN0LiBJ
bnRyb2R1Y2luZyBuZXcgZG9tLmNmZyBwcm9wZXJ0eQ0KPj4+Pj4+IHNlZW1zIHRvIGJlIHRoZSBv
bmx5IHdheSB0byBhdm9pZCBleHRyYSBEb21jdGwgY2FsbHMuDQo+Pj4+Pj4gSSB3aWxsIGhhbmRs
ZSB0aGlzIGluIHYyIGlmIHRoZXJlIHdpbGwgYmUgbm8gY29tcGxhaW5zIGZyb20gTWFpbnRhaW5l
cnMuDQo+Pj4+Pg0KPj4+Pj4gSSBkb24ndCBrbm93IGlmIHRoZXJlIHdpbGwgYmUgYSBjb21wbGFp
bnMgaW4gdjIgb3Igbm90IDotKSwgYnV0IHVzaW5nDQo+Pj4+PiBzb21ldGhpbmcgZGlmZmVyZW50
IGZyb20gZHRkZXYgc291bmQgZ29vZC4NCj4+Pj4+DQo+Pj4+PiBJZiBJIHVuZGVyc3RhbmQgY29y
cmVjdGx5LCBkdGRldiBzZWVtcyB0byBiZSBhYm91dCBwYXNzaW5nIHRocm91Z2ggYW4NCj4+Pj4+
IGV4aXN0aW5nIGRldmljZSB0byBhIGd1ZXN0LCBhbmQgdGhpcyBuZXcgc2NpIGRldmljZSBzZWVt
cyB0byBiZSBhYm91dCBoYXZpbmcgWGVuDQo+Pj4+PiAiZW11bGF0aW5nIiBhbiBzY2kgZGV2aWNl
IHdoaWNoIHRoZSBndWVzdCB3aWxsIHVzZS4gU28gaW50cm9kdWNpbmcNCj4+Pj4+IHNvbWV0aGlu
ZyBuZXcgKHNjaWRldiBvciBvdGhlciBuYW1lKSBzb3VuZHMgZ29vZC4NCj4+Pj4gVXNlcnMgYWxy
ZWFkeSBoYXZlIHRvIHByb3ZpZGUgNCBwcm9wZXJ0aWVzIChkdGRldiwgaW9tZW0sIGlycXMsDQo+
Pj4+IGRldmljZV90cmVlKSB0byBzZXR1cCBkZXZpY2UgYXNzaWdubWVudC4gSSB0aGluayB0aGF0
IG1ha2luZyBpdCA1DQo+Pj4+IHByb3BlcnRpZXMgd291bGQgbm90IGJlIGEgc3RlcCBmb3J3YXJk
IDotKQ0KPj4+DQo+Pj4gSUlSQywgaW4gdGhlIHBhc3QsIHdlIGRpc2N1c3NlZCB0byBmZXRjaCB0
aGUgaW5mb3JtYXRpb24gZGlyZWN0bHkgZnJvbQ0KPj4+IHRoZSBwYXJ0aWFsIGRldmljZS10cmVl
LiBNYXliZSB0aGlzIGRpc2N1c3Npb24gbmVlZHMgdG8gYmUgcmV2aXZlZD8NCj4+Pg0KPj4+IEFs
dGhvdWdoLCB0aGlzIGlzIGEgc2VwYXJhdGUgdG9waWMgZnJvbSB0aGlzIHNlcmllcy4NCj4+Pg0K
Pj4+PiBUbyBtZSBkdGRldiBhbmQgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGFyZSBhcHByb3By
aWF0ZSBiZWNhdXNlDQo+Pj4+IHRoZXkNCj4+Pj4gc2lnbmlmeSBkZXZpY2UgYXNzaWdubWVudCBv
ZiBvbmUgb3IgbW9yZSBkZXZpY2VzLiBXZSBhcmUgbm90IGFkZGluZyBhbnkNCj4+Pj4gYWRkaXRp
b25hbCAibWVhbmluZyIgdG8gdGhlbS4gSXQgaXMganVzdCB0aGF0IHdlJ2xsIGF1dG9tYXRpY2Fs
bHkgZGV0ZWN0DQo+Pj4+IGFuZCBnZW5lcmF0ZSBhbnkgU0NNSSBjb25maWd1cmF0aW9ucyBiYXNl
ZCBvbiB0aGUgbGlzdCBvZiBhc3NpZ25lZA0KPj4+PiBkZXZpY2VzLiBCZWNhdXNlIGlmIFNDTUkg
aXMgZW5hYmxlZCBhbmQgYSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gdGhlDQo+Pj4+IGd1ZXN0LCB0
aGVuIEkgdGhpbmsgd2Ugd2FudCB0byBhZGQgdGhlIGRldmljZSB0byB0aGUgU0NNSSBsaXN0IG9m
DQo+Pj4+IGRldmljZXMgYXV0b21hdGljYWxseS4NCj4+Pg0KPj4+IEkgYW0gT0sgd2l0aCByZS11
c2luZyBkdGRldi9YRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2UgaG93ZXZlciB0aGVyZSBpcw0KPj4+
IGEgcGl0ZmFsbCB3aXRoIHRoYXQgYXBwcm9hY2guDQo+Pj4NCj4+PiBBdCB0aGUgbW9tZW50LCB0
aGV5IGFyZSBvbmx5IHVzZWQgZm9yIGRldmljZSBwcm90ZWN0ZWQgYnkgdGhlDQo+Pj4gSU9NTVUu
IElmIHRoZSBkZXZpY2UgaXMgbm90IHByb3RlY3RlZCBieSB0aGUgSU9NTVUgdGhlbiBpdCB3aWxs
IHJldHVybg0KPj4+IGFuIGVycm9yLg0KPj4gSUlSQyB0aGVyZSB3YXMgYSBjaGFuZ2UsIHRoYXQg
YWxsb3dlZCB0byBhc3NpZ24gZGV2aWNlIHdpdGhvdXQgYQ0KPj4gSU9NTVUuIEF0DQo+PiBsZWFz
dCB3ZSBkaXNjdXNzZWQgdGhpcyBpbnRlcm5hbGx5Lg0KPg0KPiBJIGFtIG5vdCBhd2FyZSBvZiBh
bnkgdXBzdHJlYW0uIERvIHlvdSBoYXZlIGEgcG9pbnRlciBpZiB0aGVyZSBpcyBhbnkNCj4gcHVi
bGljIGRpc2N1c3Npb24/DQoNCk5vLCB0aGlzIGlzIHRoZSBmaXJzdCBwdWJsaWMgZGlzY3Vzc2lv
biBvbiB0aGlzIHRvcGljLg0KDQo+DQo+Pj4NCj4+PiBOb3csIHdpdGggeW91ciBhcHByb2FjaCB3
ZSBtYXkgaGF2ZSBhIGRldmljZSB0aGF0IGlzIG5vdCBwcm90ZWN0ZWQgYnkNCj4+PiB0aGUgSU9N
TVUgYnV0IHJlcXVpcmUgdG8gYSBTQ01JIGNvbmZpZ3VyYXRpb24uDQo+PiBZb3UgbmVlZCB0byBw
cm90ZWN0IG9ubHkgRE1BLWNhcGFibGUgZGV2aWNlcy4NCj4NCj4gWGVuIGRvZXNuJ3Qga25vdyBp
ZiB0aGUgZGV2aWNlIGlzIERNQS1jYXBhYmxlIG9yIG5vdC4gU28uLi4NCj4NCg0KQnV0IGl0IGtu
b3dzIGlmIHRoZXJlIGlzIGEgaW9tbXVzPTw+IG5vZGUgcHJlc2VudCBmb3IgdGhlIGRldmljZS4N
Cg0KPj4gDQo+Pj4gSSBkb24ndCB0aGluayBpdCB3b3VsZCBiZSBzZW5zaWJsZSB0byBqdXN0IHJl
dHVybiAic3VjY2VlZCIgaGVyZQ0KPj4+IGJlY2F1c2UgdGVjaG5pY2FsbHkgeW91IGFyZSBhc2tp
bmcgdG8gYXNzaWduIGEgbm9uLXByb3RlY3RlZA0KPj4+IGRldmljZS4gQnV0IGF0IHRoZSBzYW1l
IHRpbWUsIGl0IHdvdWxkIHByZXZlbnQgYSB1c2VyIHRvIGFzc2lnbiBhDQo+Pj4gbm9uLURNQSBj
YXBhYmxlIGRldmljZS4NCj4+Pg0KPj4+IFNvIGhvdyBkbyB5b3Ugc3VnZ2VzdCB0byBhcHByb2Fj
aCB0aGlzPw0KPj4gV2VsbCwgaW4gbXkgaGVhZCBhc3NpZ25fZGV2aWNlIGlkZWFsbHkgc2hvdWxk
IGRvIHRoZSBmb2xsb3dpbmc6DQo+PiAxLiBBc3NpZ24gSU9NTVUgaWYgaXQgaXMgY29uZmlndXJl
ZCBmb3IgdGhlIGRldmljZQ0KPg0KPiAuLi4gd2l0aCB0aGlzIGFwcHJvYWNoIHlvdSBhcmUgYXQg
dGhlIHJpc2sgdG8gbGV0IHRoZSB1c2VyIHBhc3N0aHJvdWdoDQo+IGEgZGV2aWNlIHRoYXQgY2Fu
bm90IGJlIHByb3RlY3RlZC4NCj4NCj4+IDIuIEFzc2lnbiBTQ01JIGFjY2VzcyByaWdodHMNCj4+
IChOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoIHNlcmllcywgYnV0Li4uKQ0KPj4gMy4gQXNzaWdu
IElSUXMNCj4+IDQuIEFzc2lnbiBJTyBtZW1vcnkgcmFuZ2VzLg0KPj4gUG9pbnRzIDMuIGFuZCA0
LiB3b3VsZCBhbGxvdyB1cyB0byBub3QgcHJvdmlkZSBhZGRpdGlvbmFsIGlycT1bXSBhbmQNCj4+
IGlvbWVtPVtdIGVudHJpZXMgaW4gYSBndWVzdCBjb25maWcuDQo+DQo+IFRoYXQgY291bGQgb25s
eSB3b3JrIGlmIHlvdXIgZ3Vlc3QgaXMgdXNpbmcgdGhlIHNhbWUgbGF5b3V0IGFzIHRoZQ0KPiBo
b3N0Lg0KDQpBZ3JlZWQuIEJ1dCBpbiBteSBleHBlcmllbmNlLCBpbiBtb3N0IGNhc2VzIHRoaXMg
aXMgdGhlIHRydWUuIFdlIHdvcmtlZA0Kd2l0aCBSZW5lc2FzIGFuZCBJTVggaGFyZHdhcmUgYW5k
IGluIGJvdGggY2FzZXMgaW9tZW1zIHdlcmUNCm1hcHBlZCAxOjEuDQoNCj4gT3RoZXJ3aXNlLCB0
aGVyZSBpcyBhIHJpc2sgaXQgd2lsbCBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9mIHRoZQ0KPiBt
ZW1vcnkgbGF5b3V0Lg0KPg0KDQo+IFRvZGF5LCBndWVzdHMgc3RhcnRlZCB2aWEgdGhlIHRvb2xz
dGFjayBpcyBvbmx5IHVzaW5nIGEgdmlydHVhbA0KPiBsYXlvdXQsIHNvIHlvdSB3b3VsZCBmaXJz
dCBuZWVkIHRvIGFkZCBzdXBwb3J0IHRvIHVzZSB0aGUgaG9zdCBtZW1vcnkNCj4gbGF5b3V0Lg0K
DQpJIGNhbid0IHNheSBmb3IgYWxsIHRoZSBwb3NzaWJsZSBjb25maWd1cmF0aW9ucyBpbiB0aGUg
d2lsZCwgYnV0IEknbQ0KYXNzdW1pbmcgdGhhdCBpbiBtb3N0IGNhc2VzIGl0IHdpbGwgYmUgZmlu
ZSB0byB1c2UgMToxIG1hcHBpbmcuIEZvcg0KdGhvc2UgbW9yZSBleG90aWMgY2FzZXMgaXQgd291
bGQgYmUgcG9zc2libGUgdG8gaW1wbGVtZW50IHNvbWUNCmNvbmZpZ3VyYXRpb24gb3B0aW9uIGxp
a2UgaW9tZW1fbWFwPVttZm46Z2ZuXS4NCg0KQXMgU3RlZmFubyBwb2ludGVkLCByaWdodCBub3cg
dXNlciBuZWVkcyB0byBwcm92aWRlIDMgY29uZmlndXJhdGlvbg0Kb3B0aW9ucyB0byBwYXNzIGEg
ZGV2aWNlIHRvIGEgZ3Vlc3Q6IGR0X2RldiwgaXJxLCBpb21lbS4gQnV0IGluIGZhY3QsDQpYZW4g
aXMgYWxyZWFkeSBrbm93aW5nIGFib3V0IGlycSBhbmQgaW9tZW0gZnJvbSBkZXZpY2UgdHJlZS4N
Cg0KDQotLSANClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0=

