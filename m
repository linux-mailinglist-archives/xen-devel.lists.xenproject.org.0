Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F680F130
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653188.1019538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4nv-0008Q2-0B; Tue, 12 Dec 2023 15:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653188.1019538; Tue, 12 Dec 2023 15:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4nu-0008ND-Sm; Tue, 12 Dec 2023 15:36:14 +0000
Received: by outflank-mailman (input) for mailman id 653188;
 Tue, 12 Dec 2023 15:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKsX=HX=epam.com=prvs=6710380681=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rD4nt-0008N7-5N
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:36:13 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c344f3d-9904-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 16:36:10 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCFLTgZ003069; Tue, 12 Dec 2023 15:35:55 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uxchra9sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 15:35:55 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7621.eurprd03.prod.outlook.com (2603:10a6:20b:345::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 15:35:51 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 15:35:51 +0000
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
X-Inumbo-ID: 2c344f3d-9904-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOxHIsYXo+eYAPBFegm+siggxyMnNItejznFgP8q/LTccAT/7pl9oBhHpuIu/P9G8hgTloEx71AkwjDUf2DmWXpVdSbhimno1zVzR9FMjEsm2VF/7P+7pDV9UMms4DV6ryRvSzchNQfs3xhMoFydkY80zq9VZvZvEDH2r2R9qJlaVHgjq15o6I52TaEHMSzLmNXq7ELcfhJDXJ2Pvsb9U3c5rXmKZ7TnCE6AXG5HvoSXJVVBWJdWaihMSEnsTknr+MtiAKa/vBCfbErC1gmfq2X5YKiMbZefpsRXKPvz9HoAGeMpeJmvj3Wl1CHUQAiaP1pyRdnKpEUUxCiqn+m9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iciyFLJqabiF1FLw614bm1jE+2WY8RjOzhNlfSxTfiM=;
 b=YBuIs3ltrUrr+1/cRZEg8xGmn7Ysa4sRfaiZ1sUjPZM/eA94RazG49On1rzBy3OkcTy8MuqKut84OYwXzJESwXS1SxneI8CSFPd/1YT89W5Zp61j8uhUqDQz6+c9ENUBsSkFow5aTmd9k+ETIJy0lyKCOdYYR/v8gp/foxpH+0iSC1sSzgS8+RKXEgArR1pAfcaG8YQSJ3iyn6pO9KnhV328Uu/fdTJ70OEg4G92nTBrsvDgM1XNJTXe3/qwfv1gsToLZcqrAkzR9v8f/3CoFNnUjDVjRexSwxlqm9vgSENDuAublvcYDMJu85spw+sWLZGBe+/PWO4mGTAcgrlVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iciyFLJqabiF1FLw614bm1jE+2WY8RjOzhNlfSxTfiM=;
 b=nQR6PAUyCenAJ1OX3xu+09P9jafAwrHbCcrOZpeE71HZ7Uy1x8ECpzEG8JtlSnZK/BNfBxEI8/V96f4UMxWtfNaWjXbDgAqiNYjJTTIXtCU6NkpougVQGH/aOkjXyyw8ZvZdIS188BcWEfEqMrIVq9vuxVZbIl8VZCNetlzveD1bEDXoDsaYC6aAMo7fw9X0SCD6YKsXkG5eyGy48NWKe//91uTmxQZxXXe/40ZBaL5zeV5ED2FnpGXDG2eZtF+yxISl+XApbGKmWI17/AuWctuHony50P2iofGNKig80bo+gqkWNXDEbIQBMweTqHnewIZ74mUlKYgH+a0y1W8fWQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Vikram Garhwal <vikram.garhwal@amd.com>,
        =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
        Michael Young
	<m.a.young@durham.ac.uk>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Thread-Topic: [PATCH] fix qemu build with xen-4.18.0
Thread-Index: AQHaKijL3WADPEA59ECvZnvE/VRP97CluD+AgAAUgoA=
Date: Tue, 12 Dec 2023 15:35:50 +0000
Message-ID: <87wmtj77sl.fsf@epam.com>
References: 
 <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com>
 <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
In-Reply-To: <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7621:EE_
x-ms-office365-filtering-correlation-id: 23e3ce4f-95be-47f0-3da1-08dbfb280557
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z1y/0OspmCIb02sZ+S2vbVjsriYyPgC+n2cEgi8fuL5IxwFGleJ9wncOqWpCGM//aJjugROge52AlOJY9XLt/xK5rJl4Oa06YhHe9J/xUBI0Vr4EwgZkz0fDLbXXhLgg0yajiPlhRrehxA/Fy5roV8+9E2mCUYfMz3KLOMDWxrY0KVgR1IjSJe98WFwE6yHlDraVY36cWg0t6PCURC9a9gRlIot/DTCu0t/MCBHgQsHFhl2nBjAFtwzu7GJl74MxSzCGpFI5k8LWqoJpc50tQ/e1HG2WNdVQDOTd9PVbJqlJypofUsdN1yjwiqQPFgLb0XtoT5hKpEiCJu/E9lbK7Hg+MTtvjf+g0fY5mblmPVuIPpExhQVBmCxi7L+7KjQXYrCAo4F6AkIihhYqyX3O7wYAblpf5d0XiQIq35ewgoZBTuLLv1UBLIX5oCcC1FSR4nmxP0PuxYO401PtmFoE7p7uDTIZjTzaf7XSVoqdW2DAkcJVRMF1wXui6ooqwU1A3mJ7AohxCCNtK/eawM8EukF4p3o3QuY4A6IpOcXJrOMlZHyvjSUYyCqYiEnJyYH1F+IwZh22cvuuR09rpoc7UTR9YA+uVpH55Bgv5oYB21I9fN8IZyGQLRVtR9kxC97H
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38070700009)(66946007)(76116006)(66446008)(66476007)(66556008)(6916009)(64756008)(54906003)(91956017)(36756003)(86362001)(38100700002)(83380400001)(6512007)(6506007)(2616005)(55236004)(6486002)(2906002)(316002)(122000001)(71200400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(41300700001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3JKTy9FMEZsOVFTRUExUTRteEZVSm83b2xBTTdRS2JVaWtmVWxLaFdzaUpW?=
 =?utf-8?B?a2ZINnQvUnkwdzViRUFDOTJCdlpzUDRXWHlsVXRUTmMwVENBRVE0bHJTYjI5?=
 =?utf-8?B?bEhUeW5hUVF0Q1FxdzAwa3ZtaGh0S04ya2lVb2U5ZWZoV1Q2VHJNMU9WK1p3?=
 =?utf-8?B?aGJUU21wL2J5Zktranl6b3Z2MW51L2xvb1gvZFhqckplWnBqS0RTVUVSQnJG?=
 =?utf-8?B?Y0EzSFh1UVZiSHpSRWJqUDBPQnpKWmZpeFVYb3hBeXNvRGxRc1V2MzRvUllW?=
 =?utf-8?B?cDFqZnlZenk4MnVhWVNFV3B1cEg5WWs4eXplQVZjNGdZZ3JIaGdscnZvcStP?=
 =?utf-8?B?R25KNkNJd1ZSQWY2MEQyQSs5cU44VUtlWWZkV2JrcysxSFZhZUxEZHptaTg1?=
 =?utf-8?B?RkJLUHhrMWp6VXN1VmMvY0hlZVZQbllCa1VvazFIeFJUc3RqK1Vmd1ZyVldL?=
 =?utf-8?B?cHR1L29QRnl5NmYxZnYzT0I3RHhLNUZGc052TTVrekpJbHpTQUNicndUem9H?=
 =?utf-8?B?dXo3eUVrRzNXZWxZL2Nvcm1wV2NtYmxTNEloRkhJSVZDUFk1SWcyOWdHbHNl?=
 =?utf-8?B?UlNIWUFRV2xXZ0JBU284M29rUEVHcGs5Q1dvUzFVL0hZVFNpOGdVUElQTnQy?=
 =?utf-8?B?akxLd0tMaGVYemlUekE3UWtpbndxRDF2NXk0blNRU3loT0hnWGRGMmlycUc2?=
 =?utf-8?B?ZzZXS1JQejlJZGdaNFpGZTRIayttalBzamJ0SSs5QkE0akRkZkExbCtPUHlW?=
 =?utf-8?B?WEQvdE1YVitSQTZ2YUxGdVZSUWFRTzU5WjRFQnBzNXdCd1JVZVZ0QnM4SUhT?=
 =?utf-8?B?WFNhZjdhZUJmR2tyYWY3bGJ1UDNrNUlkYkNmaDk0RnFDK3lTVnVrTk1RMncw?=
 =?utf-8?B?dmNJMG1xWHZMQmJUd1NDN1FOOEtQNElMMkJmb0UvU2YxR21lUUh5TXZaRmJZ?=
 =?utf-8?B?ZDhLeUtWUC8xakNEU3N4bFpTUlBjR3NSZEVTRVEzNWp2WEM1cFFOUVFNU29H?=
 =?utf-8?B?YzFuaFRubVFabFFTYmdyM00wSDdObEJrVVlEUnNRRWVOajJPekRjSy9GYmZq?=
 =?utf-8?B?NjhTR1piazViZEJDVXVyY2htWEpxcyswRSt5RllaSGVOYlFIR2piMlBORVBL?=
 =?utf-8?B?ZEt4RmtJM3p3MmVmS0NBVWIxZHg5NEE2MUZXSzZqVklhcWE5WWp6eTlQc2NB?=
 =?utf-8?B?MTZTNGtqeEhycTR3blN5RWpmNG5QU3g0OWxDaTN5MklKWXAvT01sZDZCbzdy?=
 =?utf-8?B?N3VXdVhSZ0ZuY2ZTNUtOK2UzUEhOVGQyV0huUTJQaFJyVmY3WVJFaVpsR05M?=
 =?utf-8?B?WENOUCtVVGZGNG5aZjBpaisyV1hjL3N2eFRrcXFzeWxnYVF1YjVuVndBVHRP?=
 =?utf-8?B?WTNJdFNnUGo2aXdUOFFJc25MT2hkQ20yTWo0ckxkY2pVNXB5NlA0bWhQNDdZ?=
 =?utf-8?B?TWEzampENmNPVHcydHlHS0kwMGZPOGN3R0xTeW9lczg3WHBwZlA2aEJ3bXI1?=
 =?utf-8?B?aW5rNUhjRkZGTTA1Nkl6WnRDUERaRlBSWDNqMFNuNGJuelcxbmdFa1VwbkYv?=
 =?utf-8?B?NFlnUFQvMXk0UWxCaFY3aElwOUtmd1J2R0o2ejVaeHArZ1B2VG1tMkpTSVpT?=
 =?utf-8?B?Q2xDQkpDNkI5aHBqZjhxMXpwekI4L2YzQll1M1U0dVZtZUVCZGtJZmZpc2N4?=
 =?utf-8?B?MDZ6OVhzMkEvUkY2a0tic0pBUUxndW9TbVFkaTJpTnlPTnMzUVZjQjNhdDdJ?=
 =?utf-8?B?cnpVVzdvZFBwY1hKcjlrbDhSNTlVTEJtQzR6OTlPSHFFRFRGYnlrOHp1SGJZ?=
 =?utf-8?B?QnBZRUZzK3l0Y1FkT1ZjU1ZHc3JsRXM5UkhlOSs1UUh1WGpHNHRtd3FJMnlR?=
 =?utf-8?B?L0FweG4yblAybDhLMzVUWU9acVJ5aThjaVhMajkrOGMxNlgvZHFIVEUvVVFI?=
 =?utf-8?B?cGFUU2JudUJyK2VkK2QzMWNpLy8raUUrQWNTVW5JbVl0NnBvQ2ZQUE5BQ0Nk?=
 =?utf-8?B?M0lWVE0wc1BrdkdIM3h6ZTRQdTNmNEpBeXM5SzFrUVhZZE9VbjRsUHJ0SzlX?=
 =?utf-8?B?TlRDY2VGMjhjVGY5Rk5CdUExdjhGWG5Ha2daNnBWVXdvNFNybjVYdVd1Y1VE?=
 =?utf-8?B?U1FLTTFKNWJPNGs0RUR0SjFIY1dSb0hBU2l6U29IMjErUm80VkZranYyN2R0?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE0A9AC252D260428FE10B9BD1A33579@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e3ce4f-95be-47f0-3da1-08dbfb280557
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 15:35:50.9834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSOfox1g+kPX9r7HF9xQVX8eae5vU3psVWvARWsWt7NoOWqoAr/r62Cvi/D4w9Hq0JnIpbPcKFPkFKuW2+aTfKqhKq+FwX07tclZNrbLkHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7621
X-Proofpoint-GUID: 9fAWqwEJVuVnXKjBO1sldjQodDIMzdjb
X-Proofpoint-ORIG-GUID: 9fAWqwEJVuVnXKjBO1sldjQodDIMzdjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=963 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120119

SGkgQW50aG9ueQ0KDQpBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4g
d3JpdGVzOg0KDQo+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAyOjQ5OjI3UE0gLTA4MDAsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIEZyaSwgOCBEZWMgMjAyMywgRGFuaWVsIFAu
IEJlcnJhbmfDqSB3cm90ZToNCj4+ID4gT24gVGh1LCBEZWMgMDcsIDIwMjMgYXQgMTE6MTI6NDhQ
TSArMDAwMCwgTWljaGFlbCBZb3VuZyB3cm90ZToNCj4+ID4gPiBCdWlsZHMgb2YgcWVtdS04LjIu
MHJjMiB3aXRoIHhlbi00LjE4LjAgYXJlIGN1cnJlbnRseSBmYWlsaW5nDQo+PiA+ID4gd2l0aCBl
cnJvcnMgbGlrZQ0KPj4gPiA+IC4uL2h3L2FybS94ZW5fYXJtLmM6NzQ6NTogZXJyb3I6IOKAmEdV
RVNUX1ZJUlRJT19NTUlPX1NQSV9MQVNU4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKQ0KPj4gPiA+ICAgIDc0IHwgICAgKEdVRVNUX1ZJUlRJT19NTUlPX1NQSV9MQVNU
IC0gR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUKQ0KPj4gPiA+ICAgICAgIHwgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiA+ID4gDQo+PiA+ID4gYXMgdGhlcmUgaXMgYW4gaW5j
b3JyZWN0IGNvbXBhcmlzaW9uIGluIGluY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaA0KPj4gPiA+
IHdoaWNoIG1lYW5zIHRoYXQgc2V0dGluZ3MgbGlrZSBHVUVTVF9WSVJUSU9fTU1JT19TUElfTEFT
VA0KPj4gPiA+IGFyZW4ndCBiZWluZyBkZWZpbmVkIGZvciB4ZW4tNC4xOC4wDQo+PiA+IA0KPj4g
PiBUaGUgY29uZGl0aW9ucyBpbiBhcmNoLWFybS5oIGZvciB4ZW4gNC4xOCBzaG93Og0KPj4gPiAN
Cj4+ID4gJCBjcHBpIGFyY2gtYXJtLmggfCBncmVwIC1FICcoIy4qaWYpfE1NSU8nDQo+PiA+ICNp
Zm5kZWYgX19YRU5fUFVCTElDX0FSQ0hfQVJNX0hfXw0KPj4gPiAjIGlmIGRlZmluZWQoX19YRU5f
XykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19fKSB8fCBkZWZpbmVkKF9fR05VQ19fKQ0KPj4gPiAj
IGVuZGlmDQo+PiA+ICMgaWZuZGVmIF9fQVNTRU1CTFlfXw0KPj4gPiAjICBpZiBkZWZpbmVkKF9f
WEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykNCj4+ID4gIyAgIGlmIGRlZmluZWQoX19H
TlVDX18pICYmICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykNCj4+ID4gIyAgIGVuZGlmDQo+PiA+
ICMgIGVuZGlmIC8qIF9fWEVOX18gfHwgX19YRU5fVE9PTFNfXyAqLw0KPj4gPiAjIGVuZGlmDQo+
PiA+ICMgaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pDQo+PiA+
ICMgIGRlZmluZSBQU1JfTU9ERV9CSVQgIDB4MTBVIC8qIFNldCBpZmYgQUFyY2gzMiAqLw0KPj4g
PiAvKiBWaXJ0aW8gTU1JTyBtYXBwaW5ncyAqLw0KPj4gPiAjICBkZWZpbmUgR1VFU1RfVklSVElP
X01NSU9fQkFTRSAgIHhlbl9ta191bGxvbmcoMHgwMjAwMDAwMCkNCj4+ID4gIyAgZGVmaW5lIEdV
RVNUX1ZJUlRJT19NTUlPX1NJWkUgICB4ZW5fbWtfdWxsb25nKDB4MDAxMDAwMDApDQo+PiA+ICMg
IGRlZmluZSBHVUVTVF9WSVJUSU9fTU1JT19TUElfRklSU1QgICAzMw0KPj4gPiAjICBkZWZpbmUg
R1VFU1RfVklSVElPX01NSU9fU1BJX0xBU1QgICAgNDMNCj4+ID4gIyBlbmRpZg0KPj4gPiAjIGlm
bmRlZiBfX0FTU0VNQkxZX18NCj4+ID4gIyBlbmRpZg0KPj4gPiAjZW5kaWYgLyogIF9fWEVOX1BV
QkxJQ19BUkNIX0FSTV9IX18gKi8NCj4+ID4gDQo+PiA+IFNvIHRoZSBNTUlPIGNvbnN0YW50cyBh
cmUgYXZhaWxhYmxlIGlmIF9fWEVOX18gb3IgX19YRU5fVE9PTFNfXw0KPj4gPiBhcmUgZGVmaW5l
ZC4gVGhpcyBpcyBubyBkaWZmZXJlbnQgdG8gdGhlIGNvbmRpdGlvbiB0aGF0IHdhcw0KPj4gPiBw
cmVzZW50IGluIFhlbiA0LjE3Lg0KPj4gPiANCj4+ID4gV2hhdCB5b3UgZGlkbid0IG1lbnRpb24g
d2FzIHRoYXQgdGhlIEZlZG9yYSBidWlsZCBmYWlsdXJlIGlzDQo+PiA+IHNlZW4gb24gYW4geDg2
XzY0IGhvc3QsIHdoZW4gYnVpbGRpbmcgdGhlIGFhcmNoNjQgdGFyZ2V0IFFFTVUsDQo+PiA+IGFu
ZCBJIHRoaW5rIHRoaXMgaXMgdGhlIGtleSBpc3N1ZS4NCj4+IA0KPj4gSGkgRGFuaWVsLCB0aGFu
a3MgZm9yIGxvb2tpbmcgaW50byBpdC4NCj4+IA0KPj4gLSB5b3UgYXJlIGJ1aWxkaW5nIG9uIGEg
eDg2XzY0IGhvc3QNCj4+IC0gdGhlIHRhcmdldCBpcyBhYXJjaDY0DQo+PiAtIHRoZSB0YXJnZXQg
aXMgdGhlIGFhcmNoNjQgWGVuIFBWSCBtYWNoaW5lICh4ZW5fYXJtLmMpDQo+PiANCj4+IEJ1dCBp
cyB0aGUgcmVzdWx0aW5nIFFFTVUgYmluYXJ5IGV4cGVjdGVkIHRvIGJlIGFuIHg4NiBiaW5hcnk/
IE9yIGFyZQ0KPj4geW91IGNyb3NzIGNvbXBpbGluZyBBUk0gYmluYXJpZXMgb24gYSB4ODYgaG9z
dD8NCj4+IA0KPj4gSW4gb3RoZXIgd29yZCwgaXMgdGhlIHJlc3VsdGluZyBRRU1VIGJpbmFyeSBl
eHBlY3RlZCB0byBydW4gb24gQVJNIG9yDQo+PiB4ODY/DQo+PiANCj4+IA0KPj4gPiBBcmUgd2Ug
ZXhwZWN0aW5nIHRvIGJ1aWxkIFhlbiBzdXBwb3J0IGZvciBub24tYXJjaCBuYXRpdmUgUUVNVQ0K
Pj4gPiBzeXN0ZW0gYmluYXJpZXMgb3Igbm90ID8NCj4+IA0KPj4gVGhlIEFSTSB4ZW5wdmggbWFj
aGluZSAoeGVuX2FybS5jKSBpcyBtZWFudCB0byB3b3JrIHdpdGggWGVuIG9uIEFSTSwgbm90DQo+
PiBYZW4gb24geDg2LiAgU28gdGhpcyBpcyBvbmx5IGV4cGVjdGVkIHRvIHdvcmsgaWYgeW91IGFy
ZQ0KPj4gY3Jvc3MtY29tcGlsaW5nLiBCdXQgeW91IGNhbiBjcm9zcy1jb21waWxlIGJvdGggWGVu
IGFuZCBRRU1VLCBhbmQgSSBhbQ0KPj4gcHJldHR5IHN1cmUgdGhhdCBZb2N0byBpcyBhYmxlIHRv
IGJ1aWxkIFhlbiwgWGVuIHVzZXJzcGFjZSB0b29scywgYW5kDQo+PiBRRU1VIGZvciBYZW4vQVJN
IG9uIGFuIHg4NiBob3N0IHRvZGF5Lg0KPj4gDQo+PiANCj4+ID4gVGhlIGNvbnN0YW50cyBhcmUg
ZGVmaW5lZCBpbiBhcmNoLWFybS5oLCB3aGljaCBpcyBvbmx5IGluY2x1ZGVkDQo+PiA+IHVuZGVy
Og0KPj4gPiANCj4+ID4gICAjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82
NF9fKQ0KPj4gPiAgICNpbmNsdWRlICJhcmNoLXg4Ni94ZW4uaCINCj4+ID4gICAjZWxpZiBkZWZp
bmVkKF9fYXJtX18pIHx8IGRlZmluZWQgKF9fYWFyY2g2NF9fKQ0KPj4gPiAgICNpbmNsdWRlICJh
cmNoLWFybS5oIg0KPj4gPiAgICNlbHNlDQo+PiA+ICAgI2Vycm9yICJVbnN1cHBvcnRlZCBhcmNo
aXRlY3R1cmUiDQo+PiA+ICAgI2VuZGlmDQo+PiA+IA0KPj4gPiANCj4+ID4gV2hlbiB3ZSBhcmUg
YnVpbGRpbmcgb24gYW4geDg2XzY0IGhvc3QsIHdlIG5vdCBnb2luZyB0byBnZXQNCj4+ID4gYXJj
aC1hcm0uaCBpbmNsdWRlZCwgZXZlbiBpZiB3ZSdyZSB0cnlpbmcgdG8gYnVpbGQgdGhlIGFhcmNo
NjQNCj4+ID4gc3lzdGVtIGVtdWxhdG9yLg0KPj4gPiANCj4+ID4gSSBkb24ndCBrbm93IGhvdyB0
aGlzIGlzIHN1cHBvc2VkIHRvIHdvcmsgPw0KPj4gDQo+PiBJdCBsb29rcyBsaWtlIGEgaG9zdCB2
cy4gdGFyZ2V0IGFyY2hpdGVjdHVyZSBtaXNtYXRjaDogdGhlICNpZiBkZWZpbmVkDQo+PiAoX19h
YXJjaDY0X18pIGNoZWNrIHNob3VsZCBwYXNzIEkgdGhpbmsuDQo+DQo+DQo+IEJ1aWxkaW5nIHFl
bXUgd2l0aCBzb21ldGhpbmcgbGlrZToNCj4gICAgIC4vY29uZmlndXJlIC0tZW5hYmxlLXhlbiAt
LWNwdT14ODZfNjQNCj4gdXNlZCB0byB3b3JrLiBDYW4gd2UgZml4IHRoYXQ/IEl0IHN0aWxsIHdv
cmtzIHdpdGggdjguMS4wLg0KPiBBdCBsZWFzdCwgaXQgd29ya3Mgb24geDg2LCBJIG5ldmVyIHJl
YWxseSB0cnkgdG8gYnVpbGQgcWVtdSBmb3IgYXJtLg0KPiBOb3RpY2UgdGhhdCB0aGVyZSdzIG5v
ICItLXRhcmdldC1saXN0IiBvbiB0aGUgY29uZmlndXJlIGNvbW1hbmQgbGluZS4NCj4gSSBkb24n
dCBrbm93IGlmIC0tY3B1IGlzIHVzZWZ1bCBoZXJlLg0KPg0KPiBMb29rcyBsaWtlIHRoZSBmaXJz
dCBjb21taXQgd2hlcmUgdGhlIGJ1aWxkIGRvZXNuJ3Qgd29yayBpcw0KPiA3ODk5ZjY1ODliNzgg
KCJ4ZW5fYXJtOiBBZGQgdmlydHVhbCBQQ0llIGhvc3QgYnJpZGdlIHN1cHBvcnQiKS4NCg0KSSBh
bSBjdXJyZW50bHkgdHJ5aW5nIHRvIHVwc3RyZWFtIHRoaXMgcGF0Y2guIEl0IGlzIGluIHRoZSBR
RU1VIG1haWxpbmcNCmxpc3QgYnV0IGl0IHdhcyBuZXZlciBhY2NlcHRlZC4gSXQgaXMgbm90IHJl
dmlld2VkIGluIGZhY3QuIEknbGwgdGFrZSBhDQpsb29rIGF0IGl0LCBidXQgSSBkb24ndCB1bmRl
cnN0YW5kIGhvdyBkaWQgeW91IGdldCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCi0tIA0KV0JSLCBW
b2xvZHlteXI=

