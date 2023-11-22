Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA317F54FB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639319.996525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wyU-00017t-NR; Wed, 22 Nov 2023 23:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639319.996525; Wed, 22 Nov 2023 23:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wyU-00015Y-Kf; Wed, 22 Nov 2023 23:49:42 +0000
Received: by outflank-mailman (input) for mailman id 639319;
 Wed, 22 Nov 2023 23:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5wyT-00015S-Ap
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:49:41 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc50509d-8991-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:49:39 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMNDZur030623; Wed, 22 Nov 2023 23:49:33 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uhkuk17nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 23:49:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU2PR03MB7848.eurprd03.prod.outlook.com (2603:10a6:10:2d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 23:49:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 23:49:28 +0000
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
X-Inumbo-ID: cc50509d-8991-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AciWoT8xpCokaZDAuWHYw6NSKpf5yNt0LXWOAIIJDDIxEugoELn2Eh8k2u4iqJZ1POc8FICPpIrof8wipdmYvBlLFMcbS4sjkqJyUye2VR1yvHf9AaGZa+IeciZAx1HgFzf1H1RED5LdXm4ug5ke5PahkcLv9YLukAxv1n/loQG5EBvlq7ywSOSIZNKWACXMGOjg675JI9VieWqMF2Uy8A52Z0I4n7m6NLYBYiTF/r0W2p9Rsq/PcXojb2+RxgQJiK7+Jg+cY12MraMxH/hPQZ+nulNLOHQQUn/Rez8TPS+N7QW5pEXXy6wOaTQtatnQeyKwyee9KhkhBcVV/DQ9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng9KHCSY27fs4W0E92o00gpr24norQc20LS+wnJZT9Y=;
 b=N5ymO6F3RYrXqkulrLcUnBHb4n9qIA/kqVj6IQAhrRg//bcqSJuPL6Pmzkkf3mcwc+LxpPU3CheuywZAswkGWxum+zAcZ5EUTHRt1cyLYzBofrcmqbY2lUD3gwNhvg/Q5FadiSvsv/zNSmHm1v24TYNcC6qVTkfTiP4WIvRmkM24zSGPPBlDswfzd0CBgqmM5jtFabAKNWma+hmx7ryKVYDSpCBIuj1/9wnvvlS5t4ZI0fAdVDGzOBA1fWBh2RktPwGTlXuF7Z4eaUI4nnVbdzLiuJJIpN7swpPOZnJnVSnBoZ6Ush01LQ3F8mTixt8RVVGAO9fhnb+G0D3H+6dzow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng9KHCSY27fs4W0E92o00gpr24norQc20LS+wnJZT9Y=;
 b=lBiYy7JhJGe8zpCU2vOEjNqRqWnJCcUVD8pzheUIuACnq3lMSbLFpNa/mseEeAQ1RHL13uop9YRAFa9TMqoWvr6sf/C4enlWc9zDr5s1GPEFWEz0uHRP39BpneRzZIREm0SwgMoxOnYyLqQrb+pbq9bEgZ3cwJoey9CguVcPEFJLgDIVm/pbCIqwfwGWEpaxy6/CrYTYfGeLZk8H2w5OCjGJSC7E3Wso68ehvTqoNnUc4xE/6sDBKDKGNUexmECK+m8yqa6cSfEUg27l1G9sTLH5Ty0X9u9hXo/1qI/LqNlSsB5D27Tja7M9fwHhuZHNsxLAvN+N4BSB2Gw8l1vnyg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "Woodhouse, David" <dwmw@amazon.co.uk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "paul@xen.org"
	<paul@xen.org>, "julien@xen.org" <julien@xen.org>,
        "hreitz@redhat.com"
	<hreitz@redhat.com>,
        "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
        "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "qemu-block@nongnu.org"
	<qemu-block@nongnu.org>,
        "kwolf@redhat.com" <kwolf@redhat.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "jasowang@redhat.com"
	<jasowang@redhat.com>
Subject: Re: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Topic: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Index: AQHaHMeI32LlpkxN1EiN6kyRHznaJrCGkpqAgABet4CAABHlAA==
Date: Wed, 22 Nov 2023 23:49:28 +0000
Message-ID: <87jzq9z6uw.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-2-volodymyr_babchuk@epam.com>
 <e1663064-247d-41e3-9a36-16f81303fb94@xen.org>
 <c715df296cef35bd67ede0cfdec8f5cd294f0db2.camel@amazon.co.uk>
In-Reply-To: <c715df296cef35bd67ede0cfdec8f5cd294f0db2.camel@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU2PR03MB7848:EE_
x-ms-office365-filtering-correlation-id: 2736a687-f8e2-4be2-6244-08dbebb5aa89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w+pKhcYw+oO5zGARTv9+QfvM0wr+vQLB6wP1IQYORbJ5Y3NwIu2ZVWjy0CWeQvW4sEEAcgMVuFJt+fkAsYaPod1Zav6XUePSa0wAUhE8C6UtYtAxiO9SNeT7NN/PQ8kt0qROb2PSpTJPX42G9IQW91gvKDMKd1uX76j2wf2dykDDMS0KfiV65hSsYr3uxGYmqaaKssZR7SQULched7hbLiYcIUbYqsqnoJEDZBUdx/lXovsWljEzUd9/F107RI8IShC1lkO0/srQ4bBXi9pG36bGt3pkr4bhS80RNWxFZ2THyDxSWDzCFgVz8p39F4Yt9/mdgI5YMRTVnlmjzr88sVyy2WrtAhiNNrbYr9WvC9KbJx3hwbI+cddHVaM76KlAoVWjgWa7j+oWNf4LNjyTQ76hMzRttCMmVoDWyPKdhxg6izWFjlaNiagimC5mCIAB1FwlIGWcIlKCn0lQMLDqqJYAgE1Ug2Nwd+dUg/7vCYlAxg0WCEHgM+EWkUoxmT405Ig3+I+KArz1LXZINYokxFnCKAiDfBrTz81UnJL67342TgCZWmd+deNkQTdCZZOR8ZadzxeXzy5Hsff6vsObZaS3+KFLIH2RZSIeo0j/5NY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(53546011)(6506007)(2616005)(83380400001)(6512007)(71200400001)(55236004)(6486002)(4326008)(8936002)(5660300002)(8676002)(41300700001)(7416002)(4001150100001)(2906002)(478600001)(966005)(316002)(6916009)(91956017)(54906003)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(86362001)(36756003)(38100700002)(122000001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWd1UHROTWtaZ3ZhQncxV3diaDkzVTUwZTBhQkZ0MXJ6a0s3Y1BaajhtNlN0?=
 =?utf-8?B?NTJyNVhtdzYzUHVXVlM2Nkc2em9oZmJDeksxUFMybElKM1F5WG5Kekg3YU4v?=
 =?utf-8?B?L3hUbmI0Tmk3a3VTb0JoMUdZc2Y2VTNJNjZlVExxSzlRSWlZZUswTy9wcXFR?=
 =?utf-8?B?WktWV0p5WEhKbzN3YzVzYnhoZ1VTZ3BXT2J1WXI4ekZaTVBBaTBMNUZIamNt?=
 =?utf-8?B?Zmx4c3lIYitqN1JFK1owVENqVFljbHRBdXZublpZa005R1ByUWViQUk1NFVm?=
 =?utf-8?B?WUVSSWpGRXliNEcvWkI5NGErSFVyVDdFc3o0L01sazhrZTM5U2hDWUR4SndJ?=
 =?utf-8?B?ZUd4UWNzOHJacGo1VWhxUjNSZ2thb3k0ZGxjTW5jcGtXY1VodDI1enV0SzN4?=
 =?utf-8?B?T2RNdEFuNVN4QVVTazVpenUzS2FQVEprQWNCU2xmb09GODUzVlU0U2N5eURT?=
 =?utf-8?B?SXNYSGxjMW9zNUdjMW1yTTNxaDZkMVp3TmF1VkpCTkhjeDFrTjdWRWtlUGVD?=
 =?utf-8?B?cE4ybVRKMmJpQ00yK2IzblV4Qmo2OTJxV1ZxQldKZ2xjZ05kcFR0RFhNdW1l?=
 =?utf-8?B?UVlzMisrZG96WmduOXkrYU5Ha2FpTWVlSEcvQlRGdlVwRm1nUnFtWDdxdmF2?=
 =?utf-8?B?REFFRVYrcmp5S3FYUEVlbGxwZTRsbWUrZk1wODd0cG5GbElQQXY5ampUQ3ZU?=
 =?utf-8?B?RU5rc09KcXM1bjRyMXZFOGVtMTJxS1E1N3V6SkZkOEpXcTFnTlBhM21WSk9O?=
 =?utf-8?B?Y0hyeWlCalRCcW1MNGN3b05NN0hXVTR6dnhMQkREWWFkS0w1WCtDdDFwMThs?=
 =?utf-8?B?UDZhWDIvemtyRDMzN0F3ZTU5TldkemIzK1NLVGFNell5cjNLRkRGWG9IRS9E?=
 =?utf-8?B?aEJBU1Ayc0F3Q21Zd2MvTmE1ZXU2a3doTm84WkliUWhVRGpMdm1Za0FsWjFn?=
 =?utf-8?B?cHNoQmMwdVB4Z0Y3aUEwdTlwN010cXNuUlNFalA4VHVSNmJaVm5UalYrUVd0?=
 =?utf-8?B?NTdwR0lDTlFwdkhKR3JpallVYWpBK0N1emVGYjI2dzFneGVaZG1EZHYzSXAy?=
 =?utf-8?B?bmluSFZRV1FiKzNUY0tGeEppempTR2N3OUxGOHl3dmRDbHB0U2lxay9Xd2k2?=
 =?utf-8?B?NVA4enlUSXRKZE1yRTMzeG56bEZyTkJYbElyeE9WOTVXeFllMGN2QmF5WWh3?=
 =?utf-8?B?VHNicXhja2EyVXdaK1pjVnY1SW9wdlNxSEFqbHNpU1BheEsxY3ZLL05ITWdC?=
 =?utf-8?B?engrU3dtTUVkZEhhaElRN2JJSU1wRHVoZUJSdXowRVhaUk85Zy9nTENZTExt?=
 =?utf-8?B?V05NS0NiRStrbVk2YTdmd3NmS1RqZ1lubU1uVS9ZNlpoOENUeitMTTRJREto?=
 =?utf-8?B?Y095Ykd5b2NLbXUzZzF1M2FhYTNhT2tuTURSRWllQjNTckxBNENMa0x6TDRG?=
 =?utf-8?B?RU9zOS9RTDlPemVhZ1FpYWNrN1VxUGhsV0RBQXVqVjNTNkR2QVJvMWlLWGRz?=
 =?utf-8?B?TDdRRTdLak1ZMnJWdThxbXo2MFhDRzZUK0pvMEpHTXdlbmhHVkRyRG1QUytE?=
 =?utf-8?B?Rndna2ZGdG84K2c4R1pzTW4zcGJMc3dNOGtEdnY5Tzd5dDZRcTAxQXpMdHpz?=
 =?utf-8?B?U1hXU0NNUktsNGpIZzdZQ1g0NXlaYm9QV0U3Vjk0Z3VlRmdENjRDMlhPT0w1?=
 =?utf-8?B?R1oyZHJEamx2RU0rUzVqbjNBNzdZWWpHQVpWVGpGOCtRcFFReHI1RVE4L3VB?=
 =?utf-8?B?eHFlb1RwY21FTEY0ZXRKVGY1dEU3R0ZIdFVWZy9yN0wwOFFiVGhGNVRxOGt2?=
 =?utf-8?B?QWxrOVVlNDhPM1VWak0zM3FLclR6Z2FPamMweGFDbllCelZXbnd6U295eWU1?=
 =?utf-8?B?QkI5RkMxTDVRMGduSEFVeHJtdjNpd21ZcXVqZXpJVGlRdDJnWTNKOWJ1TGdv?=
 =?utf-8?B?QWpHVlNKUnpyOUE2a0R0cjM1QVdKdVovdUNlOXJ6OUx4K1lDdXN6cVdUNVFF?=
 =?utf-8?B?ZU5pZ1BScXBYZllKN1FEb05nc2lid05pV3ZHa2trT201R25RblhiRE1SQjNX?=
 =?utf-8?B?Q1ljUTBDUStocW9MVFpsRkZ5YXpVeEs2YTBXMXlML2srTW9WaHA1QWxYQ05z?=
 =?utf-8?B?SmtaNHJVdWJXVGNSdHBha01URWUzb3lQUjk2ZlI3NHpYWWlpYjV0d2dwdFQv?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8415FD364EB1BA429276D0140DDCAEFD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2736a687-f8e2-4be2-6244-08dbebb5aa89
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 23:49:28.5510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UWiH1RaCkQZwXecrbRf3666Y98CXY5RFPs97iJWWM3/+oi5HMtRfZA4Xr96t1EabkPgpUAMr2QFfkbH0fSeLTRalkDTcr3EXxQM9VdEupI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7848
X-Proofpoint-ORIG-GUID: xclC1Xd_DizfgvpxjrW2uXfazLfb1o_B
X-Proofpoint-GUID: xclC1Xd_DizfgvpxjrW2uXfazLfb1o_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=278 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220175

DQpIaSBEYXZpZCwNCg0KIldvb2Rob3VzZSwgRGF2aWQiIDxkd213QGFtYXpvbi5jby51az4gd3Jp
dGVzOg0KDQo+IE9uIFdlZCwgMjAyMy0xMS0yMiBhdCAxNzowNSArMDAwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOg0KPj4gT24gMjEvMTEvMjAyMyAyMjoxMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6
DQo+PiA+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+PiA+IA0K
Pj4gPiBUaGlzIGFsbG93cyBhIFhlbkRldmljZSBpbXBsZW1lbnRhdGlvbiB0byBrbm93IHdoZXRo
ZXIgaXQgd2FzIGNyZWF0ZWQNCj4+ID4gYnkgUUVNVSwgb3IgbWVyZWx5IGRpc2NvdmVyZWQgaW4g
WGVuU3RvcmUgYWZ0ZXIgdGhlIHRvb2xzdGFjayBjcmVhdGVkDQo+PiA+IGl0LiBUaGlzIHdpbGwg
YWxsb3cgdXMgdG8gY3JlYXRlIGZyb250ZW5kL2JhY2tlbmQgbm9kZXMgb25seSB3aGVuIHdlDQo+
PiA+IHNob3VsZCwgcmF0aGVyIHRoYW4gdW5jb25kaXRpb25hbGx5IGF0dGVtcHRpbmcgdG8gb3Zl
cndyaXRlIHRoZW0gZnJvbQ0KPj4gPiBhIGRyaXZlciBkb21haW4gd2hpY2ggZG9lc24ndCBoYXZl
IHByaXZpbGVnZXMgdG8gZG8gc28uDQo+PiA+IA0KPj4gPiBBcyBhbiBhZGRlZCBiZW5lZml0LCBp
dCBhbHNvIG1lYW5zIHdlIG5vIGxvbmdlciBoYXZlIHRvIGNhbGwgdGhlDQo+PiA+IHhlbl9iYWNr
ZW5kX3NldF9kZXZpY2UoKSBmdW5jdGlvbiBmcm9tIHRoZSBkZXZpY2UgbW9kZWxzIGltbWVkaWF0
ZWx5DQo+PiA+IGFmdGVyIGNhbGxpbmcgcWRldl9yZWFsaXplX2FuZF91bnJlZigpLiBFdmVuIHRo
b3VnaCB3ZSBjb3VsZCBtYWtlDQo+PiA+IHRoZSBhcmd1bWVudCB0aGF0IGl0J3Mgc2FmZSB0byBk
byBzbywgYW5kIHRoZSBwb2ludGVyIHRvIHRoZSB1bnJlZmZlZA0KPj4gPiBkZXZpY2UgKndpbGwq
IGFjdHVhbGx5IHN0aWxsIGJlIHZhbGlkLCBpdCBzdGlsbCBtYWRlIG15IHNraW4gaXRjaCB0bw0K
Pj4gPiBsb29rIGF0IGl0Lg0KPj4gPiANCj4+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhv
dXNlIDxkd213QGFtYXpvbi5jby51az4NCj4+ID4gLS0tDQo+PiA+IMKgIGh3L2Jsb2NrL3hlbi1i
bG9jay5jwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tDQo+PiA+IMKgIGh3L2NoYXIveGVuX2NvbnNv
bGUuY8KgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4gPiDCoCBody9uZXQveGVuX25pYy5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4gPiDCoCBody94ZW4veGVuLWJ1cy5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrDQo+PiA+IMKgIGluY2x1ZGUvaHcveGVuL3hlbi1i
YWNrZW5kLmggfCAyIC0tDQo+PiA+IMKgIGluY2x1ZGUvaHcveGVuL3hlbi1idXMuaMKgwqDCoMKg
IHwgMiArKw0KPj4gPiDCoCA2IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkNCj4+ID4gDQo+PiANCj4+IEFjdHVhbGx5LCBJIHRoaW5rIHlvdSBzaG91bGQgcHJv
YmFibHkgdXBkYXRlDQo+PiB4ZW5fYmFja2VuZF90cnlfZGV2aWNlX2Rlc3Ryb3koKSBpbiB0aGlz
IHBhdGNoIHRvby4gSXQgY3VycmVudGx5IHVzZXMNCj4+IHhlbl9iYWNrZW5kX2xpc3RfZmluZCgp
IHRvIGNoZWNrIHdoZXRoZXIgdGhlIHNwZWNpZmllZCBYZW5EZXZpY2UgaGFzIGFuDQo+PiBhc3Nv
Y2lhdGVkIFhlbkJhY2tlbmRJbnN0YW5jZS4NCj4NCj4gSSB0aGluayBJIGRpZCB0aGF0IGluDQo+
IGh0dHBzOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvZHdtdzIvcWVtdS5naXQvY29tbWl0ZGlm
Zi85NGYxYjQ3NDQ3OGNlMGVkZQ0KPiBidXQgZGlkbid0IGdldCByb3VuZCB0byBzZW5kaW5nIGl0
IG91dCBhZ2FpbiBiZWNhdXNlIG9mIHRyYXZlbC4NCg0KSSBjYW4ganVzdCBwdWxsIGl0IGZyb20g
dGhpcyBsaW5rLCBpZiB5b3UgZG9uJ3QgbWluZC4NCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

