Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A2475B4E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247423.426641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVnz-0001O1-2J; Wed, 15 Dec 2021 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247423.426641; Wed, 15 Dec 2021 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVny-0001M4-VT; Wed, 15 Dec 2021 15:02:54 +0000
Received: by outflank-mailman (input) for mailman id 247423;
 Wed, 15 Dec 2021 15:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxVnx-0001Ly-Tz
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 15:02:54 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1245338c-5db8-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 16:02:52 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFEx3eA010556;
 Wed, 15 Dec 2021 15:02:46 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cyhbj0bvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:02:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4018.eurprd03.prod.outlook.com (2603:10a6:208:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:02:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 15:02:42 +0000
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
X-Inumbo-ID: 1245338c-5db8-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huC+wacYECfl2ihOhXzzFP+2wSytbAZm6LeJQ6+zWKWwPQIdElY8MDnFgQDnl815KFApp/I+FI73wgTvh3hxCfmTYlFbkK8v6XLk7fPhsOlMIyaYhRLit4OmsTg3NNrKOChS8V/uvJYyp8RRYYZEpBJA0c3A55YQg7IPeietPSUk6MNOE7Kx6eCgQg68Mjblhm0FiYV/+ejugRBB3M8HGA6LDS32hjZboNXaN1tUJ3QyIv3bWZeB2lH9biEfXBMU333zIbD+0l2j074NBks1xwj4adxieoU7SrVSWc6l/FYvPrDuEueY9JP7ogYaYBdVO+F0+kWWgMqm4Iin/7QMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkAx75UpxvNRIddmGK02LVHtukL3hLbTd/rLb61GpFE=;
 b=GVS2pbtsTKLMgxxGfR4cerfFikA1JpRoaex2SqCZGnGU4BIgu651fun2eWmRlrZexdjKByn2V9XYZDw1WEQkhoLMZVaLFWAL9RZ+rjBgOqhMYRAbnTyru+1mqwy2BZchC5Y68pJhdGjvhyu8Z/6xT6SqLVP0stocoW+AUqUeAFS/IKL8MWn8mMwuk48PNcvz/EuyX0+imc6rfuBUGbtNA3Og0u5wmGd1Y6WX4mMq7MrvlvelSjvt6xX/FVl82epJkXWPQlyanRbpygUiKblcM4tKf5XlfNiA4oz+Zd5bQ+75D62KTv2ek7fqzADb+HwkD6UKfyzjfRecy1WzIXW2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkAx75UpxvNRIddmGK02LVHtukL3hLbTd/rLb61GpFE=;
 b=QfccvUDiuS88kAuRoL+ePaeSCEYxiwg06waiYbpdKHXHQGLkoweQVy95kEhMHnsLPIw+xpulDZKxvtw3UgV+50oi2WEIqmO5ghCSCw8C0QRk2trUr4ASZbZh66SlUBe4qr1TzuvFkH7d4LoEUiuG2usrLg9k5bSzM6X6l+Eo3Ngiw4evj1J8S8ExDyyc/BEBG3pDx6d5R4ksP8ynDK5HA5JniTXpxsHQchDzAfTLmNdps/1BoC/kGc2VmlTGBdfRlZ55HI0YXZmn4/A9N4umNFjMSSJq2kAhdrCoM57KXTUCjvJhBBAL+k3fro0NAYLq/XmKuyGBEsqF8WgdQAc7ZA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>, "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Wei Liu <wl@xen.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX4ewD/fiBagJockWfLYQGw/ZN1KwzkeKAgAAC9ICAAAQugIAAKYkAgAADOQA=
Date: Wed, 15 Dec 2021 15:02:42 +0000
Message-ID: <66b7b1ba-2dae-8861-4dad-01bb9d1cda1c@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
 <79466492-fd58-1be0-c47e-13fc1e17479d@suse.com>
 <1103f95b-3345-f28f-1eed-7f26328d67fa@epam.com>
 <YboA3j4GDLMxKP0A@Air-de-Roger>
In-Reply-To: <YboA3j4GDLMxKP0A@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b0e0948-1a85-420d-5e0f-08d9bfdbf1ff
x-ms-traffictypediagnostic: AM0PR03MB4018:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4018A1B26329C97352C44639E7769@AM0PR03MB4018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k7yvescKho90d18z4yWtX9+4xhi2ssGZ7Omfix21O/qxN0341wvofqHnkz35oR4hyBnzl5KOey+we1Pb9TGdOP0YUUZbrWq5CGq6FrSfkw25qfGJqjgKx2FP7HLkybLYhFw3ARZr8qihJrwVwb2PVoEFJmDEeJD3CAUx/UK19ZHwjTatNo2cwu8r891TReJGVE2i4d837ZfpNNKJJYsekRFKBWZZuueSWUr1INL95ywUIAs+y+57anCFWw/Q466ls7SJp8Ft7x+yPXm1rcewqqmZp4o0mD0NkZrpuB7sjVswhGH4Ggm2JLDm4D+gwqEEzYwHaGOONsaxlttLmb4qomVWjvE1phSdvBBcrhjUVHjtmTiF2KLaOByqI7tf7Q1yR2rSLCULWPgpvnU+0RKaeIFZXS1wWPntCEe07yci+AkI8JiIWtj2wgFi755tTxTX8Oap46vlLNouhT40DIyx6lQ2eTS7sgxvHyocTN3VMe6L2XkoDDHh1q5IKbEtkGg70hPzfeTGOOW3uo3HcHvweQFcyZrhaB6Vt4EiH3jv8b6OSZhF+nXEBuUlUlGs7Nws5dxk0vzcWiBWcOYgU6AkAbCr44ddB7GkKpAvllWNMvPGyhWRwKJKIoIhEuinwsihHxddabvpO+wS8feTItxVBAQQLOWDfkXAmEPYsg6Z6m+4AscugaJ7CQ6b5zOU8MXjSxZsERze1qFYW7vEosFUTS4C2Bb7aJmnJllNRW+cTkIRDP3SL6+hncvU0CU6FnOZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(83380400001)(7416002)(122000001)(38100700002)(36756003)(8676002)(508600001)(8936002)(2616005)(38070700005)(5660300002)(6512007)(66556008)(66476007)(66946007)(2906002)(6506007)(55236004)(6916009)(66446008)(76116006)(316002)(54906003)(64756008)(91956017)(4326008)(26005)(186003)(107886003)(6486002)(86362001)(31696002)(71200400001)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UmlNaE9od2tCc1Q4eXlSNCs0TlhHLzdKclY4bnF3a1YrRWZXM29jS0MrMytE?=
 =?utf-8?B?RlVkOWd5VkFDc2hsUnh0enhiTVN1dUpMcG5KaW41eTYvWGZ5MXFYZXFpOUdQ?=
 =?utf-8?B?dUNLcDRCTnFJNXZSQm1ySi93R2hHYjJEVDZUVG5uS2ppaFZjKzNEOVpGVmEx?=
 =?utf-8?B?UkRuZGMwR3FUUWcveG5YNWRIR1lFTUNsWm1rSDQ4UEtNSTd1Q2NSb3JweFFP?=
 =?utf-8?B?bVZxQWdwR2lQTFlaZnZsSmhQazhqQTB3MEFMdUZ4SFZjbU9VMmFCRTdLRU5C?=
 =?utf-8?B?blZEaFV5S2s1dlBVZXNYaEJ3bHZjUFdWMzZsY1ZMcWpFWmNzeXUrdXBkNzk2?=
 =?utf-8?B?Y3E2OFBQci9DT0N6aWlzUVd6U29CZEVmUTJndExjU0dxMWY0VmFQeDBidURp?=
 =?utf-8?B?N09sUm92N2UzbU5RLzZOMGtyUFBzTlM3ckoxMEhQcmZ6bGhBYzNzZWkrY0Ra?=
 =?utf-8?B?bGJTZm5vL3A3QUk0T2JBRVV3QTFEMy9sTU9HWEhLTWlKbFJrd3piRjJaTHR1?=
 =?utf-8?B?RXkwSjg5aGVBV0FVRCttQTkwVU9oSUgrQXJDOEcyWG9GUkVXSlY3M2Y5ZTcx?=
 =?utf-8?B?UkZJUi96QzhjUERkRXhhM2JlWEJTSUlUQ05CSkFTQVpuM1E4dHNCTnM0Qms1?=
 =?utf-8?B?WG9RcjNZLzhYVkp0Rk1xR2o2TUozRXYxU1pzTENCZVgrbmswWkhsRFZOR0hi?=
 =?utf-8?B?NUE3TjNrZ0RTSjNFQ3hpWHlnalVwRGo0d3NNcFlxYWl5SFZDR0Zvd3BTRklM?=
 =?utf-8?B?dEMvWmF4cmpEVWlvY3NDeHl3U0NJc054QWFkSU51bHRyS3kyc1BiWDhrcUVp?=
 =?utf-8?B?TU9YMWNmM0RQRG1kOUlyK1FBTmZzclRucTZpSFVhWm83KzNCUVhpMFowemhL?=
 =?utf-8?B?cUU2cGF6eUpiVUxiNU1HQW9rYlhrcFhncW53bWhuR2luMTd2L3I3K1U2enNY?=
 =?utf-8?B?TkZieENaSW5FQ2JYU0dJVStwVnlaWW1YU3ZyVDVlN25LZ2tkSlVIenB6VjM0?=
 =?utf-8?B?MGViR284SnBHYWZPOHNmRm5CSzNzb2diMlJFeitzS0swUGY5N0JwWno3ektX?=
 =?utf-8?B?SzJTbm1jUElLL2M1V0VnOFhieDdTTGVFdTVDcUlzR0hkektLMDV1MDZFanQ1?=
 =?utf-8?B?SndhM3hyRGFNeDBnbk1MOXJHU3NsRzVPVUlrcTJEYWJ2MzFhcGlvWHk3YVBZ?=
 =?utf-8?B?eFVwR1M2OC9JaFUvM3pMcVdGRVZoMlFGY2dhRVVMTjFzSTJiTC9wWlRPRWpv?=
 =?utf-8?B?UHZZMTVNczVLbE8wL1Ywa09CcU5VYUk3NmFRb2xwcnlBYVV0d2xpaDdJa2tI?=
 =?utf-8?B?R3pKTDFQRFlQMEhtZzZ0V2dQbkt2MlFXVDA3MmlHUnZBbjBlQVFaREN4d3Ro?=
 =?utf-8?B?RG56UzQ2Nis0MmtNeFFCMnVTWThVVCs1eDQ5b0E0N3p6RGwrRFVoY3U1c1lN?=
 =?utf-8?B?bkh4bUxHc0xhYmhramIzNklVZ2hNM0M1SEdwZ2dPUU14dTlrdERKK3FTbno3?=
 =?utf-8?B?VzFrQWloYkZIandjU3ZuSXdzQUtEeXFYdzlEY0F1RFEzY3NFOGFIcGpndlBX?=
 =?utf-8?B?UWw2QlVnaG5CN25MbGdzWDVBOWNFTGdUaW5KSkE2QkltcWF6a2t5R0JyelFD?=
 =?utf-8?B?cjRPemZyVjZnNmJqOHZmZm1xbXFnd0Fjbk5lUE92L1JVOFB0OUR5RUU2UUR0?=
 =?utf-8?B?OXZ0SFltZFd4MDJ3TEZTM3poMGN4UkNrNWRVQzJpMlF5NU1ScVdFTC9JVWNh?=
 =?utf-8?B?enRneWsrMmZhditIdXhNVzB3KzF4eE82c1ZaRXpYYkp4L1pkdGdEblkvTXEy?=
 =?utf-8?B?WXc0MW9aZ2E2UUVJUnUzaEpGVWsrSFQ3Z0hBbC94QzJiZDNBdEh0aU0rdExm?=
 =?utf-8?B?MzkveU1LRjF3TDlRNnlVRE56dlU0RHFzNnNKNEdBNlhUdDcrNTcyOExuNWE4?=
 =?utf-8?B?cmt3ZFNwQ1I1c0FRWVhLY2U4VDZ5ZnhFalIvM0dqbWpJaWhXVWs3emJGQnJX?=
 =?utf-8?B?eGhSdDhwSmFxektaZjhaMVRHNU1OZWVxbFpINHBBTjNqb0pjcXNIY00rcTNN?=
 =?utf-8?B?S1B3SzRENUlrK0FpMWkxR05VVVhaM3M4UXphbnJZZ0hHaE9jSEwwVEV2b1VG?=
 =?utf-8?B?MkEvNWF2ekpBU0l0T3JuRmxXNEloaWY0dEQyVWoveGxza2pPOWp5UURyaTRE?=
 =?utf-8?B?cjlwN0xMUWp5ZXNzWUtTaUVkTWtlZUNKbFltakJvMU5RbERhNGJSMWpnWG8x?=
 =?utf-8?B?dHRYMW5vVDYxMlBaeEViaW5mVVZHTSt5bUtQWURHaDlVdStPR2J6VmFJYzRJ?=
 =?utf-8?B?UFlCNHZiNTAyRWIwUzNGRTJoM2MyTGM1SUNaRnIyYlorL3VTRlpaZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11D2607201EE5D41B8238D9AF3D26DB5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0e0948-1a85-420d-5e0f-08d9bfdbf1ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 15:02:42.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YI4xO3aOwAh08zeOO87dpduibtvtxnbM2oUXkap5fteEif52zQD+budobixJiJ6y3b9/yF6dtlWYe/Y61Zdx8uQvxNMaoC/wGaRt8rUzPzqfpcvTSedM9kuuRG2YphX9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4018
X-Proofpoint-GUID: JZy_NNUKkRk8OMxcVISZxChzOyrDKgh_
X-Proofpoint-ORIG-GUID: JZy_NNUKkRk8OMxcVISZxChzOyrDKgh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_09,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=606 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150085

SGksIFJvZ2VyIQ0KDQpPbiAxNS4xMi4yMSAxNjo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTI6MjI6MzJQTSArMDAwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgSmFuIQ0KPj4NCj4+IE9uIDE1LjEyLjIxIDE0OjA3
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNS4xMi4yMDIxIDEyOjU2LCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRGVhciByZXN0IG1haW50YWluZXJzIQ0KPj4+Pg0K
Pj4+PiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHNlcmllcyB3aGljaCBzZWVtcyB0byBn
ZXQgc3R1Y2s/DQo+Pj4gSSBkb24ndCBzZWVtIHRvIGhhdmUgYW55IHJlY29yZCBvZiB5b3UgaGF2
aW5nIHBpbmdlZCBSb2dlciBhcyB0aGUgdlBDSQ0KPj4+IG1haW50YWluZXIuDQo+PiBObywgSSBk
aWRuJ3QuIFJvZ2VyIGlzIG9uIENDLCBzbyBoZSBtaWdodCBzaGVkIHNvbWUgbGlnaHQgb24gd2hl
biBpdCBtaWdodA0KPj4gaGFwcGVuLCBzbyB3ZSwgdGhvc2Ugd2hvIHdvcmsgb24gUENJIHBhc3N0
aHJvdWdoIG9uIEFybSwNCj4+IGNhbiBhbHNvIHBsYW4gdGhlIHJlbGV2YW50IHVwY29taW5nIChy
ZSl3b3JrOiB3ZSBzdGlsbCBtaXNzIE1TSS9NU0ktWCBhbmQNCj4+IElPTU1VIHNlcmllcyB3aGlj
aCBkbyBkZXBlbmQgb24gdGhpcyBvbmUNCj4gSGVsbG8sDQo+DQo+IEknbSBxdWl0ZSBvdmVybG9h
ZGVkIHdpdGggcGF0Y2ggcmV2aWV3IGFuZCBvdGhlciBzdHVmZiwgc2luY2UgSSd2ZQ0KPiB0YWtl
biBvdmVyIHRoZSBDb21tdW5pdHkgTWFuYWdlciByb2xlIHdoaWxlIEdlb3JnZSBpcyBhd2F5Lg0K
Pg0KPiBUaGVyZSBhcmUgc2VyaWVzIG9uIHRoZSBtYWlsaW5nIGxpc3QgdGhhdCBoYXZlIGJlZW4g
cGVuZGluZyBmb3Igd2F5DQo+IGxvbmdlciwgYW5kIHdoaWxlIEkgdW5kZXJzdGFuZCB0aGF0IHRo
aXMgaXMgb2Ygbm8gaGVscCBvciByZWxpZWYgZm9yDQo+IHlvdSBpdCB3b3VsZG4ndCBiZSBmYWly
IGZvciBtZSB0byByZXZpZXcgdGhpcyBwaWVjZSBmb3Igd29yayBiZWZvcmUNCj4gb3RoZXIgc2Vy
aWVzIHRoYXQgaGF2ZSBiZWVuIHBlbmRpbmcgZm9yIGxvbmdlciwgYXMgb3RoZXIgc3VibWl0dGVy
cw0KPiBhbHNvIGRlc2VydmUgcmV2aWV3Lg0KVGhpcyBpcyBmYWlyDQo+DQo+IFNvcnJ5LCBidXQg
SSB0aGluayBpdCdzIHVubGlrZWx5IEkgd2lsbCBnZXQgdG8gaXQgdW50aWwgYWZ0ZXIgbmV3DQo+
IHllYXIuDQpUaGFuayB5b3UgaW4gYWR2YW5jZSwNCk9sZWtzYW5kcg0KPg0KPiBUaGFua3MsIFJv
Z2VyLg0K

