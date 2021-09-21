Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A9412E15
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 06:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191298.341265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSXkw-00068S-EN; Tue, 21 Sep 2021 04:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191298.341265; Tue, 21 Sep 2021 04:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSXkw-00065b-BH; Tue, 21 Sep 2021 04:51:46 +0000
Received: by outflank-mailman (input) for mailman id 191298;
 Tue, 21 Sep 2021 04:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSXku-00065V-V1
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 04:51:45 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9db99460-1a97-11ec-b89a-12813bfff9fa;
 Tue, 21 Sep 2021 04:51:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L3x58l003773; 
 Tue, 21 Sep 2021 04:51:41 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b77eyr4ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 04:51:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3283.eurprd03.prod.outlook.com (2603:10a6:208:12::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 04:51:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 04:51:37 +0000
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
X-Inumbo-ID: 9db99460-1a97-11ec-b89a-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CltyVyTAc/rm9nlTXsGK5wsHqX2+D7a7Ft8QwiRefObKjXtt3nmm1rAELIK+2vyuhy55HIMDmmkjNZOhXXykpcSuRNCuzHKE4CbnwPibnZe6F4ShTBrihrlEfSUxiMAQp/u5+Dy/FTzsQii6SbHUvAGqEuQrmOjSTq7ykuZDErmKTCmIcCJa8pOtGz2wdVmHeCdnXJK3YSmBhYjYJZAD+t3yX0hFZ4SVIDJmZqRYYfHJvAuzDpOavh8m+iAbMQHSTAGpLy/fSo50U0oyVG/BrssG10uh1qj2ge3oYWBvC5hAJkbSyAbpNlmu0lwTBbdNsXkfPqxYgEYkV+SG9n17tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e2i7coYjAxsTKODWtb7nzDIwyq0Lp0Youc4nyHsfs3U=;
 b=GsYpb3iboNW0XdnTNxT7U9PMPcHeQEHGNmPyCV+yLAWZnO+u3TZOlCEk8XDKIzm3hUk3FL056Z8bCUw0RhUmLsrXVVyEHsjoofSn7S9xuYn52PZuJgKtgLMryq88HTU1YPzQc4mIbt8jIsEcgaD8Y8xs0wo21g2DB0bTIhjKPtp02/xZQ1khdeW8acMyR+WbtHwMtRysT3cRouIgq8PEKozl0X8DBQ/Eb+l9OIvBBO+x5dI0TmiJ2X1Jh8hFlUJwyAIHZagv2jP235rIf37JdcG4fl1mziGn6guqZ+dovZAyLCnVkRNCW07HdOyfdsyEM/T3qlJH2m42eYI//BvOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2i7coYjAxsTKODWtb7nzDIwyq0Lp0Youc4nyHsfs3U=;
 b=IjvMHIzSHmO2TimlFn4b15RFETQnDwExBa0rJjpaFU2SNbwIr8aFZdwE5GpSpepArnrtujPkPH6/JVuB1dIRLDbGrL00eBHRsJcbNgxMdos6bF8MGY/G7Se0QwGQbhfzrgY6fSazz+pE6Kmsi31Kbp0kClWvfbNfuJ5qQneSnMxRGfaqOyCIrFNdsPFkZ5Ya1ZCvhpTL++Y/Hsljlw9BIQ7e5MJiB4u6WG199TIbzypQA0rpXQFJNZrZnLrIQ/eyC9mP4600HAcIvUFIFGPDBlKt+NM744Mgg3+ttLfSt5GlFUViMdGj8LYNwtZez/XBY0HvhYW1yxWMNJeRG5YGtw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia Lukianenko
	<Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAF25gA==
Date: Tue, 21 Sep 2021 04:51:36 +0000
Message-ID: <ddb3a17a-1fd2-7108-20ad-73487a308954@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0149047-d499-4902-a4bc-08d97cbb7e65
x-ms-traffictypediagnostic: AM0PR0302MB3283:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB328374DE12AD380A6041593BE7A19@AM0PR0302MB3283.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2Mfjo5m4dmQL9mrGMODX1qxa4TN74MliVUQoDKZ1gMe2PSWAJ4RGV1h4BgL0Zv899VbiLdAzxSSa1uoHKPmCB9uLmY4U8BS3lCXfVKtRswr5L4YJMtObglHXq39qpOZ0bdBOZzjkgwvzT3UlBJKSi9XtNzq7wZjEqs6EITynToQEuNE6NbNpP5IT3w72Jz+w7zgjDcxsPYSCbwJLSuFsBt8hnqv701i6t5Vif8NJd1Y7i4woD0b8H+4SbVj1OnjbNJyIh0VYp1vDscbaxmEkzj5K/7veV8oH17K0fOm2AGx/072ckFLdCe/pu6J/+zDAC868uLmTECY+p2QcT3Ic+miTyXoO3EXMmWX3qbeQnZRwiqw2moA+9+FGQFZImExgES8zb/qTdQjKHTh6yAgn2+xrRpQtA9F0Qv7K5VNaNB7Oqeou5qCTphCz7MPEIolkds8THKONH6hk3WpW0/rCjNn8PUFaw6DR2e+UwUT8oKialJSycgVKdsRmtGZ3+0HS9SLsr5JTH/B2I2G+Biz7UfIYNKGDCv7HOpE5A8/QakthxUxdKvBAkkr8nMo+OiMaGRW82ttsPuwh1RSKkDxmtRvJpxumtxal0UbRvehsN+HO1Hn7D280S3XBMXk817HNC6m7o2i/LfjeqKiaPjPSNib1QMVtXYtSyGQjqASl3xl8Hcy1w0StMxENH0q7QAeNZGzNajPDztQrch1DoVzApiIGcV/UHIVUZ1PKteEmkid3Xf8Z4A75o+Noi+z7GSX3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(36756003)(2616005)(38100700002)(71200400001)(86362001)(38070700005)(31696002)(66946007)(8676002)(83380400001)(55236004)(122000001)(508600001)(6486002)(6512007)(66476007)(4326008)(31686004)(5660300002)(64756008)(186003)(8936002)(66446008)(66556008)(2906002)(54906003)(26005)(316002)(6916009)(91956017)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDFzbzMrWlFraENOTmV1YnZIT2tlMEJ2L21xdWFwUGl2UG1ZM2pHb2JFbCti?=
 =?utf-8?B?cVRwQVN5T1YyQU1Jb1g5aGpWVjFsbzFDVFYzTjR3UkhqZVpmMytPeUVEdi82?=
 =?utf-8?B?VUplb1ZaUlFjenVBdTJ1Q0g1bW8yZngyOEUrQ0F1ZXdlbTRpdGQ1ZFZnZ0w5?=
 =?utf-8?B?eHQ4bUtZNU1Cemh5bzlwZndLS2JueXNaWkhzaFkvU0Rvc1QzMG9NNDVJM2xi?=
 =?utf-8?B?WTZlQ3JTV25kYisrNUE0djM5SUxuMk5kY2dGdlZvWVMvNDA0RThrOWs2TFRD?=
 =?utf-8?B?WkJlVVU2aE14UXNGSG1LQng1NjdRUWZqWlNHY0FnempJUno1MFEvNEhiblNx?=
 =?utf-8?B?QlVabG9yMVF6bWI0UjZRcVhOK0EzejhnS0RKb2xUYmc3V1Y2NVhzM3E5cndE?=
 =?utf-8?B?WVNOMG41V1pTL0cvWHZXRFdNaG5oRW5LRStleHE2S3lGTU9wRnMwTDZrdlpR?=
 =?utf-8?B?R3ZmQlc2MVZTZG93Z1Q1QXBBcFhtaDliVElNUjNQYVpldWw5NUpuQ1RwVDFp?=
 =?utf-8?B?MlRZaVk4Ty9aZ3F5a3FoR1R4NGY0UE9idXQ4cUlzeFZ2R3FEMEw3aGt1cFJD?=
 =?utf-8?B?THQyRGN4ZkNzbnhMWTRZRlNjS3VDS2N3c0J4dzRLNE5SakVNTWo4NW1EZWo3?=
 =?utf-8?B?N3FkM3JnSVU2L1FVZ20ybVhKMlFRMkIyU1dNRmtBdWVMN2ZKUHEwV285R2U5?=
 =?utf-8?B?SUFRdFhyZ0tPL2t6VlZNVWY2bVRqNmxNQU5Ia3dyRGlDdER2dlNJTGVFUXVt?=
 =?utf-8?B?cS82d2g5a1hmQmV3U0I0VEltNHE4TXpsMTEwOUE2RE1JL2tnYUdzcHRNSmw5?=
 =?utf-8?B?YXNSdHJjUHdLVDBEam96d1ZqVkRyYnJtOFZVbHJrMW1iRHJjQnU4QmUzajlP?=
 =?utf-8?B?YUwrd0NmT1puUEtTRGhCR0NTM2IxVG45YWJnM3FVbDFyODg2LzhiS0RIcDFk?=
 =?utf-8?B?Mnp6bzJmclFxdWlkNWtuMGNwQ3V0Q2J5R0lIRmR4Z1IxRHEwU1FCTitLRFhl?=
 =?utf-8?B?NDRFMlplL1ppMURoamZaNkh4WURJRGxlMk4wdlh1K1hIRkdzQkJvQVRja0tx?=
 =?utf-8?B?SGpjZURscGRmUUtjZ1pTdDhKVnRGUytRTmtiWjU3eUpaalFrRjZKWUlxZ0V6?=
 =?utf-8?B?UGNBMWdaZjJPZ0RtcVhiZHNKYU55a2tzb2dNK3l0ZitwWUlnSEd4WGhzNmJk?=
 =?utf-8?B?T3ozWi9zUjFPM3hva3MwUVN4YUc4RG9yYmZzU0wydE1kUFZ5elZlZEtIN1I1?=
 =?utf-8?B?YzREZXRGdk84MVlkRW5pa0pHNG5CRDBTSE0vWTVNaWJMbEx3NGcwZTRsS3cz?=
 =?utf-8?B?bzVYUlJiQk1xblVoUm9VSnZ3V29TTWxKckl0ZllhT2p0NUJ2K3E4MEloOTdF?=
 =?utf-8?B?M2xBaTV5WUZBNkNGcHMzN3JxY0VkMEl4VXQ2TnhudnZTWjlCYTh3RHJ2dkZ4?=
 =?utf-8?B?aWpNTkU5SjdyaDRkWTlsbHdRUFJ5aCtuZHJxajFYOGtiMXFweU4wMjhmeXZZ?=
 =?utf-8?B?VHhPY24vUWFXNHE3OEYyUEUzYmhnbzhkTStrSllYSVV4eU9Dam1kcjFHc3d6?=
 =?utf-8?B?SWpkZ3pheW5BUExBdFRReWJHZ0xrdlk4RHlJZGNsdXFGaFB4U2owSkQrL2h4?=
 =?utf-8?B?V2VacVBReTh6N2Rid3o0aU00UDlRalROckRHODE5clJFdU9YZklETGFETktT?=
 =?utf-8?B?MThSRWd2QTFFRjJxbDFFdTB2QlFNV29kdC8vOUVjY2dWTU9pb0VUU285Z3o4?=
 =?utf-8?B?RzhmMzB4ZG8wQlEzU1F0dWhJTkMxYVJPN0lRclRadERibG5MMkt0OStjQ2F2?=
 =?utf-8?B?c2Jtcmd5N0piS2p2TGtGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7099075499B774FBB326C4296F2DDFB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0149047-d499-4902-a4bc-08d97cbb7e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 04:51:36.9989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wko66i4g+e5VRgHkowaoZTKrjvBMg8Z4AcY95SS0X4I+nlsMM1gcct6XuqQLTJU0gt0+lcVAh4ySOkXEtgDbLJRjU6o3QjDKN+xWodb/WOze16uKGW7u7DXWY/lguSyp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3283
X-Proofpoint-GUID: QqEUktIZuMdPN-HuPWwSX3ViTU6BYD7D
X-Proofpoint-ORIG-GUID: QqEUktIZuMdPN-HuPWwSX3ViTU6BYD7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210028

SGksIFN0ZWZhbm8hDQoNCk9uIDIxLjA5LjIxIDAyOjE2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+IE9uIE1vbiwgMjAgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4gT24gMjAuMDkuMjEgMTQ6MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjAu
MDkuMjEgMDc6MjMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBIZWxsbywg
U3RlZmFubyENCj4+Pj4NCj4+Pj4gT24gMTguMDkuMjEgMDA6NDUsIFN0ZWZhbm8gU3RhYmVsbGlu
aSB3cm90ZToNCj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+DQo+Pj4+PiBXaHkgZG8geW91IHdh
bnQgdG8gZW5hYmxlIHBjaWJhY2sgb24gQVJNPyBJcyBpdCBvbmx5IHRvICJkaXNhYmxlIiBhIFBD
SQ0KPj4+Pj4gZGV2aWNlIGluIERvbTAgc28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVk
IHRvIGEgRG9tVT8NCj4+Pj4gTm90IG9ubHkgdGhhdA0KPj4+Pj4gSSBhbSBhc2tpbmcgYmVjYXVz
ZSBhY3R1YWxseSBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gZW5hYmxlIHRoZSBQViBQQ0kNCj4+
Pj4+IGJhY2tlbmQgZmVhdHVyZSBvZiBwY2liYWNrIG9uIEFSTSwgcmlnaHQ/IFRoYXQgd291bGQg
Y2xhc2ggd2l0aCB0aGUgUENJDQo+Pj4+PiBhc3NpZ25tZW50IHdvcmsgeW91IGhhdmUgYmVlbiBk
b2luZyBpbiBYZW4uIFRoZXkgY291bGRuJ3QgYm90aCB3b3JrIGF0DQo+Pj4+PiB0aGUgc2FtZSB0
aW1lLg0KPj4+PiBDb3JyZWN0LCBpdCBpcyBub3QgdXNlZA0KPj4+Pj4gSWYgd2Ugb25seSBuZWVk
IHBjaWJhY2sgdG8gInBhcmsiIGEgZGV2aWNlIGluIERvbTAsIHdvdWxkbid0IGl0IGJlDQo+Pj4+
PiBwb3NzaWJsZSBhbmQgYmV0dGVyIHRvIHVzZSBwY2ktc3R1YiBpbnN0ZWFkPw0KPj4+PiBOb3Qg
b25seSB0aGF0LCBzbyBwY2ktc3R1YiBpcyBub3QgZW5vdWdoDQo+Pj4+DQo+Pj4+IFRoZSBmdW5j
dGlvbmFsaXR5IHdoaWNoIGlzIGltcGxlbWVudGVkIGJ5IHRoZSBwY2liYWNrIGFuZCB0aGUgdG9v
bHN0YWNrDQo+Pj4+IGFuZCB3aGljaCBpcyByZWxldmFudC9taXNzaW5nL25lZWRlZCBmb3IgQVJN
Og0KPj4+Pg0KPj4+PiAxLiBwY2liYWNrIGlzIHVzZWQgYXMgYSBkYXRhYmFzZSBmb3IgYXNzaWdu
YWJsZSBQQ0kgZGV2aWNlcywgZS5nLiB4bA0KPj4+PiAgwqAgwqDCoCBwY2ktYXNzaWduYWJsZS17
YWRkfHJlbW92ZXxsaXN0fSBtYW5pcHVsYXRlcyB0aGF0IGxpc3QuIFNvLCB3aGVuZXZlciB0aGUN
Cj4+Pj4gIMKgIMKgwqAgdG9vbHN0YWNrIG5lZWRzIHRvIGtub3cgd2hpY2ggUENJIGRldmljZXMg
Y2FuIGJlIHBhc3NlZCB0aHJvdWdoIGl0IHJlYWRzDQo+Pj4+ICDCoCDCoMKgIHRoYXQgZnJvbSB0
aGUgcmVsZXZhbnQgc3lzZnMgZW50cmllcyBvZiB0aGUgcGNpYmFjay4NCj4+Pj4NCj4+Pj4gMi4g
cGNpYmFjayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVuYm91bmQgUENJIGRldmljZXMsIGUuZy4gd2hl
biBwYXNzaW5nIHRocm91Z2gNCj4+Pj4gIMKgIMKgwqAgYSBQQ0kgZGV2aWNlIGl0IG5lZWRzIHRv
IGJlIHVuYm91bmQgZnJvbSB0aGUgcmVsZXZhbnQgZGV2aWNlIGRyaXZlciBhbmQgYm91bmQNCj4+
Pj4gIMKgIMKgwqAgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcgaXQgaXMgbm90IHJlcXVp
cmVkIHRoYXQgdGhlIGRldmljZSBpcyBib3VuZCB0bw0KPj4+PiAgwqAgwqDCoCBwY2liYWNrLCBi
dXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGEgZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJv
dWdoIFBDSQ0KPj4+PiAgwqAgwqDCoCBkZXZpY2VzLCBzbyB3ZSBjYW4gcmUtYmluZCB0aGUgZGV2
aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRyaXZlcnMgd2hlbg0KPj4+PiAgwqAgwqDCoCBn
dWVzdCBkb21haW4gc2h1dHMgZG93bikNCj4+Pj4NCj4+Pj4gMy4gRGV2aWNlIHJlc2V0DQo+Pj4+
DQo+Pj4+IFdlIGhhdmUgcHJldmlvdXNseSBkaXNjdXNzZWQgb24geGVuLWRldmVsIE1MIHBvc3Np
YmxlIHNvbHV0aW9ucyB0byB0aGF0IGFzIGZyb20gdGhlDQo+Pj4+IGFib3ZlIHdlIHNlZSB0aGF0
IHBjaWJhY2sgZnVuY3Rpb25hbGl0eSBpcyBnb2luZyB0byBiZSBvbmx5IHBhcnRpYWxseSB1c2Vk
IG9uIEFybS4NCj4+Pj4NCj4+Pj4gUGxlYXNlIHNlZSBbMV0gYW5kIFsyXToNCj4+Pj4NCj4+Pj4g
MS4gSXQgaXMgbm90IGFjY2VwdGFibGUgdG8gbWFuYWdlIHRoZSBhc3NpZ25hYmxlIGxpc3QgaW4g
WGVuIGl0c2VsZg0KPj4+Pg0KPj4+PiAyLiBwY2liYWNrIGNhbiBiZSBzcGxpdCBpbnRvIHR3byBw
YXJ0czogUENJIGFzc2lnbmFibGUvYmluZC9yZXNldCBoYW5kbGluZyBhbmQNCj4+Pj4gdGhlIHJl
c3QgbGlrZSB2UENJIGV0Yy4NCj4+Pj4NCj4+Pj4gMy4gcGNpZnJvbnQgaXMgbm90IHVzZWQgb24g
QXJtDQo+Pj4gSXQgaXMgbmVpdGhlciBpbiB4ODYgUFZIL0hWTSBndWVzdHMuDQo+PiBEaWRuJ3Qg
a25vdyB0aGF0LCB0aGFuayB5b3UgZm9yIHBvaW50aW5nDQo+Pj4+IFNvLCBsaW1pdGVkIHVzZSBv
ZiB0aGUgcGNpYmFjayBpcyBvbmUgb2YgdGhlIGJyaWNrcyB1c2VkIHRvIGVuYWJsZSBQQ0kgcGFz
c3Rocm91Z2gNCj4+Pj4gb24gQXJtLiBJdCB3YXMgZW5vdWdoIHRvIGp1c3QgcmUtc3RydWN0dXJl
IHRoZSBkcml2ZXIgYW5kIGhhdmUgaXQgcnVuIG9uIEFybSB0byBhY2hpZXZlDQo+Pj4+IGFsbCB0
aGUgZ29hbHMgYWJvdmUuDQo+Pj4+DQo+Pj4+IElmIHdlIHN0aWxsIHRoaW5rIGl0IGlzIGRlc2ly
YWJsZSB0byBicmVhayB0aGUgcGNpYmFjayBkcml2ZXIgaW50byAiY29tbW9uIiBhbmQgInBjaWZy
b250IHNwZWNpZmljIg0KPj4+PiBwYXJ0cyB0aGVuIGl0IGNhbiBiZSBkb25lLCB5ZXQgdGhlIHBh
dGNoIGlzIGdvaW5nIHRvIGJlIHRoZSB2ZXJ5IGZpcnN0IGJyaWNrIGluIHRoYXQgYnVpbGRpbmcu
DQo+Pj4gRG9pbmcgdGhpcyBzcGxpdCBzaG91bGQgYmUgZG9uZSwgYXMgdGhlIHBjaWZyb250IHNw
ZWNpZmljIHBhcnQgY291bGQgYmUNCj4+PiBvbWl0dGVkIG9uIHg4NiwgdG9vLCBpbiBjYXNlIG5v
IFBWIGd1ZXN0cyB1c2luZyBQQ0kgcGFzc3Rocm91Z2ggaGF2ZSB0bw0KPj4+IGJlIHN1cHBvcnRl
ZC4NCj4+IEFncmVlLCB0aGF0IHRoZSBmaW5hbCBzb2x1dGlvbiBzaG91bGQgaGF2ZSB0aGUgZHJp
dmVyIHNwbGl0DQo+Pj4+IFNvLCBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgc3RpbGwgZ29pbmcgdG8g
YmUgbmVlZGVkIGJlc2lkZXMgd2hpY2ggZGlyZWN0aW9uIHdlIHRha2UuDQo+Pj4gU29tZSBraW5k
IG9mIHRoaXMgcGF0Y2gsIHllcy4gSXQgbWlnaHQgbG9vayBkaWZmZXJlbnQgaW4gY2FzZSB0aGUg
c3BsaXQNCj4+PiBpcyBkb25lIGZpcnN0Lg0KPj4+DQo+Pj4gSSBkb24ndCBtaW5kIGRvaW5nIGl0
IGluIGVpdGhlciBzZXF1ZW5jZS4NCj4+Pg0KPj4gV2l0aCB0aGlzIHBhdGNoIHdlIGhhdmUgQXJt
IG9uIHRoZSBzYW1lIHBhZ2UgYXMgdGhlIGFib3ZlIG1lbnRpb25lZCB4ODYgZ3Vlc3RzLA0KPj4N
Cj4+IGUuZy4gdGhlIGRyaXZlciBoYXMgdW51c2VkIGNvZGUsIGJ1dCB5ZXQgYWxsb3dzIEFybSB0
byBmdW5jdGlvbiBub3cuDQo+Pg0KPj4gQXQgdGhpcyBzdGFnZSBvZiBQQ0kgcGFzc3Rocm91Z2gg
b24gQXJtIGl0IGlzIHlldCBlbm91Z2guIExvbmcgdGVybSwgd2hlbg0KPj4NCj4+IHRoZSBkcml2
ZXIgZ2V0cyBzcGxpdCwgQXJtIHdpbGwgYmVuZWZpdCBmcm9tIHRoYXQgc3BsaXQgdG9vLCBidXQg
dW5mb3J0dW5hdGVseSBJIGRvIG5vdA0KPj4NCj4+IGhhdmUgZW5vdWdoIGJhbmR3aWR0aCBmb3Ig
dGhhdCBwaWVjZSBvZiB3b3JrIGF0IHRoZSBtb21lbnQuDQo+IFRoYXQncyBmYWlyIGFuZCBJIGRv
bid0IHdhbnQgdG8gc2NvcGUtY3JlZXAgdGhpcyBzaW1wbGUgcGF0Y2ggYXNraW5nIGZvcg0KPiBh
biBlbm9ybW91cyByZXdvcmsuIEF0IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB0aGluayB3ZSBzaG91
bGQgZW5hYmxlIHRoZQ0KPiB3aG9sZSBvZiBwY2liYWNrIG9uIEFSTSBiZWNhdXNlIGl0IHdvdWxk
IGJlIGVycm9uZW91cyBhbmQgY29uZnVzaW5nLg0KPg0KPiBJIGFtIHdvbmRlciBpZiB0aGVyZSBp
cyBhIHNpbXBsZToNCj4NCj4gaWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+ICAgICAgcmV0dXJuOw0K
Pg0KPiBUaGF0IHdlIGNvdWxkIGFkZCBpbiBhIGNvdXBsZSBvZiBwbGFjZXMgaW4gcGNpYmFjayB0
byBzdG9wIGl0IGZyb20NCj4gaW5pdGlhbGl6aW5nIHRoZSBwYXJ0cyB3ZSBkb24ndCBjYXJlIGFi
b3V0LiBTb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMNCj4gKHVudGVzdGVkIGFuZCBwcm9iYWJs
eSBpbmNvbXBsZXRlKS4NCj4NCj4gV2hhdCBkbyB5b3UgZ3V5cyB0aGluaz8NCg0KSSB0aGluayB0
aGF0IGl0IG5lZWRzIHRvIGJlIGFuIGFkZGl0aW9uYWwgcGF0Y2ggYW5kIHRoZSBQViBjaGVjayBz
ZWVtcw0KDQpyZWFzb25hYmxlIHRvIG1lLiBXZSBuZWVkIHRvIGNoZWNrIGlmIGdhdGluZyBvbmx5
IHBhcnQgb2YgdGhlIGluaXRpYWxpemF0aW9uDQoNCndpdGggeGVuX3B2X2RvbWFpbiBpcyBqdXN0
IGVub3VnaCwgZS5nLiBpZiB0aGUgcmVzdCBvZiB0aGUgY29kZSBpcyBvayB0aGF0DQoNCnNvbWV0
aGluZyB3YXMgbm90IGluaXRpYWxpemVkIGFuZCB3b24ndCBiZSB0b3VjaGVkIGF0IHJ1bi10aW1l
Lg0KDQpMZXQncyBzZWUgd2hhdCBvdGhlciB0aGluayBhYm91dCB0aGUgYXBwcm9hY2gNCg0KPg0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMgYi9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYw0KPiBpbmRleCBkYTM0Y2U4NWRjODguLjk5MWJh
MGE5YjM1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMN
Cj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMNCj4gQEAgLTE1LDYgKzE1
LDcgQEANCj4gICAjaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPg0KPiAgICNpbmNsdWRlIDx4ZW4vZXZl
bnRzLmg+DQo+ICAgI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4gKyNpbmNsdWRlIDx4ZW4veGVuLmg+
DQo+ICAgI2luY2x1ZGUgInBjaWJhY2suaCINCj4gICANCj4gICAjZGVmaW5lIElOVkFMSURfRVZU
Q0hOX0lSUSAgKC0xKQ0KPiBAQCAtNjg1LDggKzY4NiwxMiBAQCBzdGF0aWMgaW50IHhlbl9wY2li
a194ZW5idXNfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwNCj4gICAJCQkJY29uc3Qg
c3RydWN0IHhlbmJ1c19kZXZpY2VfaWQgKmlkKQ0KPiAgIHsNCj4gICAJaW50IGVyciA9IDA7DQo+
IC0Jc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXYgPSBhbGxvY19wZGV2KGRldik7DQo+ICsJ
c3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXY7DQo+ICsNCj4gKwlpZiAoIXhlbl9wdl9kb21h
aW4oKSkNCj4gKwkJcmV0dXJuIDA7DQo+ICAgDQo+ICsJcGRldiA9IGFsbG9jX3BkZXYoZGV2KTsN
Cj4gICAJaWYgKHBkZXYgPT0gTlVMTCkgew0KPiAgIAkJZXJyID0gLUVOT01FTTsNCj4gICAJCXhl
bmJ1c19kZXZfZmF0YWwoZGV2LCBlcnIsDQo+IEBAIC03NDMsNiArNzQ4LDkgQEAgY29uc3Qgc3Ry
dWN0IHhlbl9wY2lia19iYWNrZW5kICpfX3JlYWRfbW9zdGx5IHhlbl9wY2lia19iYWNrZW5kOw0K
PiAgIA0KPiAgIGludCBfX2luaXQgeGVuX3BjaWJrX3hlbmJ1c19yZWdpc3Rlcih2b2lkKQ0KPiAg
IHsNCj4gKwlpZiAoIXhlbl9wdl9kb21haW4oKSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gICAJ
eGVuX3BjaWJrX2JhY2tlbmQgPSAmeGVuX3BjaWJrX3ZwY2lfYmFja2VuZDsNCj4gICAJaWYgKHBh
c3N0aHJvdWdoKQ0KPiAgIAkJeGVuX3BjaWJrX2JhY2tlbmQgPSAmeGVuX3BjaWJrX3Bhc3N0aHJv
dWdoX2JhY2tlbmQ7DQo+IEBAIC03NTIsNSArNzYwLDcgQEAgaW50IF9faW5pdCB4ZW5fcGNpYmtf
eGVuYnVzX3JlZ2lzdGVyKHZvaWQpDQo+ICAgDQo+ICAgdm9pZCBfX2V4aXQgeGVuX3BjaWJrX3hl
bmJ1c191bnJlZ2lzdGVyKHZvaWQpDQo+ICAgew0KPiArCWlmICgheGVuX3B2X2RvbWFpbigpKQ0K
PiArCQlyZXR1cm47DQo+ICAgCXhlbmJ1c191bnJlZ2lzdGVyX2RyaXZlcigmeGVuX3BjaWJrX2Ry
aXZlcik7DQo+ICAgfQ==

