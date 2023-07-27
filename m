Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA89765723
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571181.894424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2gs-000227-EU; Thu, 27 Jul 2023 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571181.894424; Thu, 27 Jul 2023 15:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2gs-0001zC-Bi; Thu, 27 Jul 2023 15:14:10 +0000
Received: by outflank-mailman (input) for mailman id 571181;
 Thu, 27 Jul 2023 15:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9bz=DN=epam.com=prvs=1572de9637=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qP2gr-0001z2-Bm
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:14:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b053895-2c90-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:14:08 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 36RCwvr6027962;
 Thu, 27 Jul 2023 15:14:03 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3s3n7k9uqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 15:14:03 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PR3PR03MB6634.eurprd03.prod.outlook.com (2603:10a6:102:7d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:14:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:14:00 +0000
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
X-Inumbo-ID: 3b053895-2c90-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae/V+01rN2l4UBH1fLKtTtWlJMk85Ew63NGITrf50vQ9s8Ga73NJ+z1OsbTSfQScHQ/fdXvGvXjcIOMLmebwQ1Tw2TTWWmjS+cu3mGHBZhJMUCdXCEIhErDzUrBEKpzr8Rmc8GzD+CbjWCdqE9Nz25eCnTmMjqIMw5AkGI3QaFodk1CMd8vqfCykowpiPFN98n7Dovek8pFzBB5HfhEEtCaLoLN0VNXNa+ljbufFqELV8Nipos0iip/K0FKBYT+Y6WVIOEWQT9GJD9lgDPLPFGda84cGDVGt2Oi8DRdWP2FG+G2hrPixH1OnHNf2HTqJWxG1t/XF4mD7cGXYsKUpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NO0ttIsggy03SZODljZs47D0HqdhrvpF55GjVMTIcE=;
 b=H4HuxknyLyCWKOqnuCKQWLde1RJ3u0fsQuEfsIZnOcao3ku03RurQZfBsWjfgdGl33sf2Xjw6sCCRDgpBG71xh5uyu2qKhclVcl1UtwGriLaXnxZPhoWt4ZqFMi3MYcJMtSgta98P0kV02OzfkPcu3IJGFqkxfuhd/fgIOVR+gytfQgrW0hi52M+1e+wE4aDJhnUGM5+SxqjuHJTR7ppemnTVi7OjdcqF1A71PobcW9ZC4+nH+6EhI0J+HPyXLNvR6FWF6sOlFTAx6sso928IoQy7vjLv5L9zG9ekvjIuxKD/50QvnaNh+bw2cgJl9y6aVvhhza0saE963eDRu6OzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NO0ttIsggy03SZODljZs47D0HqdhrvpF55GjVMTIcE=;
 b=LuWgpPU9jaJRvncaMLt5J6v/6ORPcXClUf2u9WCu5dgrS0pxFr2F7QS1oYujW9SjF9LUKv/TWBEzhlGltGmFugUOxoD5ii1bEhU5cMUSwbpTMSFGG+TFawttTbNaAkUWMBLheHUJGoFHIGRFjStNzRh3+j6Z5ed5pqgjZFd6MrqYyksE211Hxv2nL/qJQRJeUomIxQeUX/HmhYGIO4O184kek1ODemuE5A+tj7xDDQws8RM+AMXjiZ0bxurZr6WOzefJ0IxUiu3DjwbHaLqStoLhRMxVNdljliMH1p0zHikm6f1fvH7/hSGvc1UwmvDhXfgCiDIYYRQgx5c1Dbyayg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: 
 AQHZuqGrLMJPz1ipBEu4urExXp8yi6/CgxUAgAWEoICAA8vwgIAA+VsAgAB5WACAAC7UgIAAEweAgAA5kgA=
Date: Thu, 27 Jul 2023 15:13:59 +0000
Message-ID: <87jzulbd5e.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
 <999aae1d-fb85-6550-9798-64cf88d7faf3@suse.com> <87r0otbq78.fsf@epam.com>
 <2d5c6adf-321d-5bbc-c5b5-4ea3d255bf42@suse.com>
In-Reply-To: <2d5c6adf-321d-5bbc-c5b5-4ea3d255bf42@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PR3PR03MB6634:EE_
x-ms-office365-filtering-correlation-id: f39e6d63-4588-48c8-7f66-08db8eb41ad6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 al1u/EDSDcBz8VqfGM0RtPyUe9f9Pm+lREs7UMJkp5hLGnMZ/rkWY6q2O5OGmH4GhINRwxNNJd9uvi3vlb5OQec9CZaCG9btuPEBOI1lsx/5O18xvSSlHDjy8RzsqjpB9E8JoLXpFtIm/mJEZOstl2lI6PcJQntMI5t6z0VneW/zeGUcxN7iA40vMNxF2mC9HBW1xiygdaqGhT8ZgUUsI5lwS6EHNy5vS6dGgkM0TZQIXMvWFcEQFN0FylEIGK1t3EMiKIMZi5/sv23OzK3dsofy/QaEFnmJSpoIWnxuQ0v7RtGLfMigRRoNYktmbM3895umd8eILI1Hr//abmZKbi541KUAp3zb3yUgafwsomlwsevQgL7EK3mEJTXvabSWq0JnjplZ7nrhl8HWjOpEXyfuW4Gjcy78hYmewZal6WmHzSC1fSU93xKCfXh8PaFg53YORHDqReI+Freh7r6c8J8+qW11kxhfSJkjx5bx7YnBiWs03tvnHMelmFs+G/wTRdJsOlmNUxELoBz3xVWwyZKpRYRFVDHIwz0FT1g4paDATlvBHdOnD5jvIlsl1ZJLznA+Isa8zX2zygrU5yjDEJzwxKDVEAR+47M5KPwANTVVfNc6dwav2kXGY6lLF4ei
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6916009)(66476007)(71200400001)(66556008)(66446008)(38070700005)(6486002)(6512007)(66946007)(64756008)(76116006)(4326008)(54906003)(38100700002)(122000001)(91956017)(478600001)(36756003)(2906002)(41300700001)(83380400001)(2616005)(5660300002)(8936002)(8676002)(6506007)(26005)(316002)(55236004)(53546011)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnQrdmUydjFwMHM1Z0k3L0lydWl3Y25sRHk1NG5RczlTcnZ2WXpLbkYwRWUz?=
 =?utf-8?B?Y1lDMlF0SzBNOW4vSzJ3Vy9namsya0l1Q3VJakNRaHVhckxNUXVyVFdzaFpC?=
 =?utf-8?B?M0h2eFk2NThvblBGZU9ESTFmaExxSmQ1ZGNPYUo3MUc3Y3hGYTk4WTlRaVZq?=
 =?utf-8?B?N295akt4WE8vOGVIanRMbE5WRXZEaEIzT1g4ZkRsbGhuL0JVNVJlYjJxRTAz?=
 =?utf-8?B?K0VNODFNUVMrQ08rNjJCcGhoYTFTZTRUNUV1c0pCVnJIUVpOZXFoS0ZxcDRJ?=
 =?utf-8?B?bm0ya1ZlMlRTenV4VFVZNEVJdFZ1OEhKa2w2ZGszQUtVdWo4bjRTZ2Jidmwz?=
 =?utf-8?B?c0NYMENaRDNrbkRzYm42eVI5Uk8rbUdUZnMzYzdiNTNabXZxN0tOYkw1TFhN?=
 =?utf-8?B?dTVOdy9hbERjOVByVG9zSVVpZDA1NHE0SEJiUkgrS1ZGNFNaa0JCdWhIQWdn?=
 =?utf-8?B?U3ZTMTRvKzl6bzB3RDFTU0NQQlBvTkJOQmdxMjI2Q0NoOC9LUW5UNXZLc3lH?=
 =?utf-8?B?Yno1ZUxGVmhhUUQxTkg3ZVZKQ1cveU1LQ1hlMWhoOUltRE9RZEQzbEJrbG01?=
 =?utf-8?B?dzVDVVUvb3duNlRSd3dNb3NkU0lOOWN5VTFhbGtBY0ZyWHd1aTQzYXNZU3FD?=
 =?utf-8?B?MnhudmtsbGZrT3VISDVhQXVORmliUjRpNjVnNzhIR0x4R1I0MStoRWpsaDky?=
 =?utf-8?B?MStDemlKZWtZWEd2Sks2bjNoV3ZnMFR4YlFTNHVaWHlmYUVlOUZYNkNwRlJ0?=
 =?utf-8?B?MDYzKzlqbktkempMTEpwc3JESEFXayszaHNxM09QL01PUGRoN21DeDM1L25h?=
 =?utf-8?B?SHh4U0RmY09iSVRMMzlseS9OQUw4UkpYMkRqSkt6U0NoaTRoMWhhT0o0ZkYy?=
 =?utf-8?B?aVlpMUFrY0F5OWFMWUlhVThETzVmWmllZ0pBa2FoN0dBYUdSTVhzN1BQVmNn?=
 =?utf-8?B?NzdweHhnSFR3TlFzTGwwRFNzblBSV1Z2cGZrYzBTSGlzc2xyRlF1M0taMGN0?=
 =?utf-8?B?WTVwMEh4TXJHeGhGNFhqc012ZmVmRVoxSWhrYlBnOVI2RzN0L3Vqazh3US9s?=
 =?utf-8?B?K2VMb05hRUtuMW9PL2h6NnlkdUI5d0ZiUThPdFJ6a1RaSVc5M3JOb05JSnlJ?=
 =?utf-8?B?cjh0ZnZPTnhpM0hBOUw1T2VlcnNKNzRwdGdOVlFzL1RjUUduREFFVWxLTEli?=
 =?utf-8?B?SHJVSkM2V2lib2toM0N5Q2p1eVJnUlc5ejB2cXZIN0I2UGRHZkdVd2hHVktP?=
 =?utf-8?B?SVQyb29TR2NVZ2ZBdTErWWc0dVo1bGt1MmQ4L3JOWGdoOWxiaWVrVjJFb3NJ?=
 =?utf-8?B?anlFTkc1QWJLT29HRVcybnJZdDlzdVhHM2RqaDNlRzl3NS9FRm1yRDN6VGVl?=
 =?utf-8?B?T1dEaHVqQS9ERFJ4Y2Q5azNBcG51STg4UG1udGp4S0MrSGtPMk44Mmtsb293?=
 =?utf-8?B?SmdSbmYyQnVnb0p6eWlqVE04TGMwN2hmTGtjOVR5S3cyTEtvWnY5aG1SRWNG?=
 =?utf-8?B?UERJckl2RlpvaHBkeitnbFNsMEdibjh6ZU5KQXRIRlo0eU9ZTG1VV2hZcUQz?=
 =?utf-8?B?TkVXazQzU01QNGpyRTVlSXhGdU1YTnkvNks2MU4xbDRQYkRhbnRRVThJSTVB?=
 =?utf-8?B?WVRYcVFiMEVnVy9idmlPVjFLZzlNVS9Qby9PS2pyY2FJSE9RU1QzbnY1VERJ?=
 =?utf-8?B?TE43UWRYYlJqZmFDb2hZMEl2Q1JMakYvbGt0Snh2RjBCeG5OV1RpaEpadmdp?=
 =?utf-8?B?YnBNelYvODFYT2lZVVJCL1p6bmtKeUpCTXFYUzdTWk1kNmdieTFsYWxmSE9k?=
 =?utf-8?B?KzBjc1l2ZC9kWis5RHBYRmpKRG92YXVGWU9hcTFaRDBqNHNQbVBCWWwxV0Ja?=
 =?utf-8?B?TDBIb3RBY0xsc1ZqSGhVK1NHK01CTXBvbi8vWFMzbElIbWpnZVJ2MnYwUUpX?=
 =?utf-8?B?eW9RSzFxdXNCVkEvN3NRdEFXMnFkbU1NVzliTzRUOHcycVZxcG5ZMmtyZG5M?=
 =?utf-8?B?UkpQM05UWVdHNkhzMjdoK1FLeVJ4L2N6ZHBlNDFCdTNIdnhZcWJXNE1Dbngz?=
 =?utf-8?B?dGtxZmcxZlJZcUtZQ2lBWnlaNExoQ0RGc0FQWXZhUCtzRnQ5YVVUeXREem05?=
 =?utf-8?B?MDBDTUd5cHg0K3hHU2NNTng1RnIrYVdlNEZHMEVOT243ak9BZy9sbGgwbXNu?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FD331EF44BAEF4E8ADD7CF09571FFC9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e6d63-4588-48c8-7f66-08db8eb41ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 15:13:59.8421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hiNLC9EA8KUYK+G60e9z+uzgpx7pNjd2t4E+AO8ZxqHvt44QAniYnhQXGkASQnKLXK277AZibykUUoiYgb5cRBpVe/FLuIXG9Z3OD9avLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6634
X-Proofpoint-GUID: kl4Yg0vjUL9j4iHKB_WlamiksQpKdjHI
X-Proofpoint-ORIG-GUID: kl4Yg0vjUL9j4iHKB_WlamiksQpKdjHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=869
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270137

DQpKYW4sDQoNCkphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KDQo+IE9u
IDI3LjA3LjIwMjMgMTI6MzEsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gDQo+PiBIaSBK
YW4NCj4+IA0KPj4gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cml0ZXM6DQo+PiAN
Cj4+PiBPbiAyNy4wNy4yMDIzIDAyOjU2LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pj4g
SGkgUm9nZXIsDQo+Pj4+DQo+Pj4+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cml0ZXM6DQo+Pj4+DQo+Pj4+PiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAwMToxNzo1
OEFNICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pj4+Pg0KPj4+Pj4+IEhpIFJv
Z2VyLA0KPj4+Pj4+DQo+Pj4+Pj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyaXRlczoNCj4+Pj4+Pg0KPj4+Pj4+PiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAxMjoz
MjozMUFNICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pj4+Pj4+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+Pj4+Pj4+IEBAIC00OTgsNiArNTM3LDcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qg
c2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsDQo+Pj4+Pj4+PiAgICAg
ICAgICBBU1NFUlQoZGF0YV9vZmZzZXQgPCBzaXplKTsNCj4+Pj4+Pj4+ICAgICAgfQ0KPj4+Pj4+
Pj4gICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+Pj4+PiArICAgIHVu
bG9ja19sb2NrcyhkKTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlcmUncyBvbmUgaXNzdWUgaGVyZSwg
c29tZSBoYW5kbGVycyB3aWxsIGNhbCBwY2lkZXZzX2xvY2soKSwgd2hpY2gNCj4+Pj4+Pj4gd2ls
bCByZXN1bHQgaW4gYSBsb2NrIG92ZXIgaW52ZXJzaW9uLCBhcyBpbiB0aGUgcHJldmlvdXMgcGF0
Y2ggd2UNCj4+Pj4+Pj4gYWdyZWVkIHRoYXQgdGhlIGxvY2tpbmcgb3JkZXIgd2FzIHBjaWRldnNf
bG9jayBmaXJzdCwgZC0+cGNpX2xvY2sNCj4+Pj4+Pj4gYWZ0ZXIuDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IEZvciBleGFtcGxlIHRoZSBNU0kgY29udHJvbF93cml0ZSgpIGhhbmRsZXIgd2lsbCBjYWxsDQo+
Pj4+Pj4+IHZwY2lfbXNpX2FyY2hfZW5hYmxlKCkgd2hpY2ggdGFrZXMgdGhlIHBjaWRldnMgbG9j
ay4gIEkgdGhpbmsgSSB3aWxsDQo+Pj4+Pj4+IGhhdmUgdG8gbG9vayBpbnRvIHVzaW5nIGEgZGVk
aWNhdGVkIGxvY2sgZm9yIE1TSSByZWxhdGVkIGhhbmRsaW5nLCBhcw0KPj4+Pj4+PiB0aGF0J3Mg
dGhlIG9ubHkgcGxhY2Ugd2hlcmUgSSB0aGluayB3ZSBoYXZlIHRoaXMgcGF0dGVybiBvZiB0YWtp
bmcgdGhlDQo+Pj4+Pj4+IHBjaWRldnNfbG9jayBhZnRlciB0aGUgZC0+cGNpX2xvY2suDQo+Pj4+
Pj4NCj4+Pj4+PiBJJ2xsIG1lbnRpb24gdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIElzIHRo
ZXJlIHNvbWV0aGluZyBlbHNlIHRoYXQgSQ0KPj4+Pj4+IHNob3VsZCBkbyByaWdodCBub3c/DQo+
Pj4+Pg0KPj4+Pj4gV2VsbCwgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGNvbW1pdCB0aGlzIGFz
LWlzIHdpdGggYSBrbm93biBsb2NrDQo+Pj4+PiBpbnZlcnNpb24uDQo+Pj4+Pg0KPj4+Pj4gVGhl
IGZ1bmN0aW9ucyB0aGF0IHJlcXVpcmUgdGhlIHBjaWRldnMgbG9jayBhcmU6DQo+Pj4+Pg0KPj4+
Pj4gcHRfaXJxX3tjcmVhdGUsZGVzdHJveX1fYmluZCgpDQo+Pj4+PiB1bm1hcF9kb21haW5fcGly
cSgpDQo+Pj4+Pg0KPj4+Pj4gQUZBSUNUIHRob3NlIGZ1bmN0aW9ucyByZXF1aXJlIHRoZSBsb2Nr
IGluIG9yZGVyIHRvIGFzc2VydCB0aGF0IHRoZQ0KPj4+Pj4gdW5kZXJseWluZyBkZXZpY2UgZG9l
c24ndCBnbyBhd2F5LCBhcyB0aGV5IGRvIGFsc28gdXNlIGQtPmV2ZW50X2xvY2sNCj4+Pj4+IGlu
IG9yZGVyIHRvIGdldCBleGNsdXNpdmUgYWNjZXNzIHRvIHRoZSBkYXRhIGZpZWxkcy4gIFBsZWFz
ZSBkb3VibGUNCj4+Pj4+IGNoZWNrIHRoYXQgSSdtIG5vdCBtaXN0YWtlbi4NCj4+Pj4NCj4+Pj4g
WW91IGFyZSByaWdodCwgYWxsIHRocmVlIGZ1bmN0aW9uIGRvZXMgbm90IGFjY2VzcyBhbnkgb2Yg
UENJIHN0YXRlDQo+Pj4+IGRpcmVjdGx5LiBIb3dldmVyLi4uDQo+Pj4+DQo+Pj4+PiBJZiB0aGF0
J3MgYWNjdXJhdGUgeW91IHdpbGwgaGF2ZSB0byBjaGVjayB0aGUgY2FsbCB0cmVlIHRoYXQgc3Bh
d25zDQo+Pj4+PiBmcm9tIHRob3NlIGZ1bmN0aW9ucyBpbiBvcmRlciB0byBtb2RpZnkgdGhlIGFz
c2VydHMgdG8gY2hlY2sgZm9yDQo+Pj4+PiBlaXRoZXIgdGhlIHBjaWRldnMgb3IgdGhlIHBlci1k
b21haW4gcGNpX2xpc3QgbG9jayBiZWluZyB0YWtlbi4NCj4+Pj4NCj4+Pj4gLi4uIEkgY2hlY2tl
ZCBjYWxscyBmb3IgUFRfSVJRX1RZUEVfTVNJIGNhc2UsIHRoZXJlIGlzIG9ubHkgY2FsbCB0aGF0
DQo+Pj4+IGJvdGhlcnMgbWU6IGh2bV9waV91cGRhdGVfaXJ0ZSgpLCB3aGljaCBjYWxscyBJTy1N
TVUgY29kZSB2aWENCj4+Pj4gdm14X3BpX3VwZGF0ZV9pcnRlKCk6DQo+Pj4+DQo+Pj4+IGFtZF9p
b21tdV9tc2lfbXNnX3VwZGF0ZV9pcmUoKSBvciBtc2lfbXNnX3dyaXRlX3JlbWFwX3J0ZSgpLg0K
Pj4+Pg0KPj4+PiBCb3RoIGZ1bmN0aW9ucyByZWFkIGJhc2ljIHBkZXYgZmllbGRzIGxpa2Ugc2Jm
ZCBvciB0eXBlLiBJIHNlZSBubw0KPj4+PiBwcm9ibGVtIHRoZXJlLCBhcyB2YWx1ZXMgb2YgdGhv
c2UgZmllbGRzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgY2hhbmdlZC4NCj4+Pg0KPj4+IEJ1dCB3
aGV0aGVyIGZpZWxkcyBhcmUgYmFzaWMgb3Igd2lsbCBuZXZlciBjaGFuZ2UgZG9lc24ndCBtYXR0
ZXIgd2hlbg0KPj4+IHRoZSBwZGV2IHN0cnVjdCBpdHNlbGYgc3VkZGVubHkgZGlzYXBwZWFycy4N
Cj4+IA0KPj4gVGhpcyBpcyBub3QgYSBwcm9ibGVtLCBhcyBpdCBpcyBleHBlY3RlZCB0aGF0IGQt
PnBjaV9sb2NrIGlzIGJlaW5nIGhlbGQsDQo+PiBzbyBwZGV2IHN0cnVjdHVyZSB3aWxsIG5vdCBk
aXNhcHBlYXIuIEkgYW0gdHJ5aW5nIHRvIGFuc3dlciBhbm90aGVyDQo+PiBxdWVzdGlvbjogaXMg
ZC0+cGNpX2xvY2sgZW5vdWdoIG9yIHBjaWRldnNfbG9jayBpcyBhbHNvIHNob3VsZCByZXF1aXJl
ZD8NCj4NCj4gVG8gYW5zd2VyIHN1Y2ggcXVlc3Rpb25zLCBtYXkgSSBhc2sgdGhhdCB5b3UgZmly
c3QgZmlybWx5IHdyaXRlIGRvd24NCj4gKGFuZCBzdWJtaXQpIHdoYXQgZWFjaCBvZiB0aGUgbG9j
a3MgZ3VhcmRzPw0KDQpJIGNhbiBkbyB0aGlzIGZvciBhIG5ld2x5IGludHJvZHVjZWQgbG9jay4g
U28gZG9tYWluLT5wY2lfbG9jayBndWFyZHM6DQoNCjEuIGRvbWFpbi0+cGNpZGV2c19saXN0LiBU
aGlzIG1lYW5zIHRoYXQgUENJIGRldmljZXMgY2FuJ3QgYmUgYWRkZWQgdG8NCm9yIHJlbW92ZWQg
ZnJvbSBhIGRvbWFpbiwgd2hlbiB0aGUgbG9jayBpcyB0YWtlbiBpbiByZWFkIG1vZGUuIEFzIGEN
CmJ5cHJvZHVjdCwgYW55IHBkZXYgYXNzaWduZWQgdG8gYSBkb21haW4gY2FuJ3QgYmUgZGVsZXRl
ZCBiZWNhdXNlIHdlDQpuZWVkIHRvIGRlYXNzaWduIGl0IGZpcnN0LiBUbyBtb2RpZnkgZG9tYWlu
LT5wY2lkZXZzX2xpc3Qgd2UgbmVlZCB0bw0KaG9sZCBib3RoIGQtPnBjaV9sb2NrIGluIHdyaXRl
IG1vZGUgYW5kIHBjaWRldnNfbG9jay4NCg0KMi4gUHJlc2VuY2Ugb2YgcGRldi0+dnBjaSBzdHJ1
Y3QgZm9yIGFueSBwZGV2IGFzc2lnbmVkIHRvIGEgZG9tYWluLiBUaGUNCnN0cnVjdHVyZSBpdHNl
bGYgaXMgbG9ja2VkIGJ5IHBkZXYtPnZwY2ktPmxvY2suIEJ1dCB0byBhZGQvcmVtb3ZlDQpwZGV2
LT52cGNpIGl0c2VsZiB3ZSBuZWVkIHRvIGhvbGQgZC0+cGNpX2xvY2sgaW4gdGhlIHdyaXRlIG1v
ZGUuDQoNCkFzIGZvciBwY2lkZXZzX2xvY2ssIEFGQUlLLCB0aGVyZSBpcyBubyBzdHJpY3RseSB3
cml0dGVuIHJ1bGVzLCB3aGF0IGlzDQpleGFjdGx5IGlzIHByb3RlY3RlZCBieSB0aGlzIGxvY2su
DQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

