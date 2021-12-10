Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0B46FE27
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243698.421627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcYz-0005X1-57; Fri, 10 Dec 2021 09:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243698.421627; Fri, 10 Dec 2021 09:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcYz-0005Ug-10; Fri, 10 Dec 2021 09:51:37 +0000
Received: by outflank-mailman (input) for mailman id 243698;
 Fri, 10 Dec 2021 09:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrZX=Q3=epam.com=prvs=297895717b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mvcYw-0005R3-7Y
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:51:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03fb2cf-599e-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 10:51:31 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BA9O1So025627;
 Fri, 10 Dec 2021 09:51:21 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cv47ur2pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Dec 2021 09:51:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3471.eurprd03.prod.outlook.com (2603:10a6:803:1d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 09:51:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 09:51:18 +0000
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
X-Inumbo-ID: c03fb2cf-599e-11ec-9d12-4777fae47e2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDnDdxqN4cR9DMsyY3feAV/2btdfq5UWvzuoCWDNLOThfy8oSpyk316bxWnpiBpYyPcUjtj9r1WPOWC1mFuAW6EGBbHxyPKxSL2CRhXigjzqIGJwIc7+jPVgULYojJ6VJydLTfXwtJ5/VVOzBL6Ldm2f8+UKj97b0VdsMrj2CAnbaWwPfdIMAO2CQCruNyKp5Ri4SQ2jamjj2I7DXaRB5Aor0YSdcCkt+bkdnK9kHi5+v6tZY4PU/f91Nwoz73EUW3SI/vV85FRC8JuoK2wRdlpbOf44Iq3XTSYJv5m/riR4yxt+KORysW0442RgLbLXwr3bnf9FsF/WYvsfuDhWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YtyXVaVmQsTw/9U7GMIY9aU7kDAx9AnDBuOHanfe3E=;
 b=WM8NAzmDDiWjP6gPh0XjIaxnZNbRIvyAIR5lSZrAwrVuXrmdP+UcZVkgxOITRipzCfek/CHmThK63dTxvTD4h439uDwAGRJJk01mUJSETVlR8LcTMjvq51wfD1yiuAIIsGYPH0nEF/zicgnsLRax9nmXXkp7Oq1Qmj+Re04MQWBlSnoMt/MJr0/0NHb4oJyeXOt/7t7CebmXNnV4y3K+7MUdUKdyV2jtlS08TxpWZZvHMOXWP2DWLhRVVp7c3R+BVR/udfKohGxUeEIIepKczWOE859KEjF8kC6FzFYyaAJ9Ixvg4EaSFzLJ5cZzz3qJ1EChsMqE07Ak1T2Ma7m6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YtyXVaVmQsTw/9U7GMIY9aU7kDAx9AnDBuOHanfe3E=;
 b=Udh74XjkUYAkUnj9WPg+uTrwuM/gBqbkZuxK0BcBv9NRKR7KjHuXP81rXblHN/eK8mQjsBzEaTp+FbqobiWHdG3WQYqnejC6kHfMlKerCT0UztnPwSGsRrVasCdJFmWSVIOvtLpxsrSq3VYTNkcbvlyKAQE8vl86bI/GjhefFKabQynyoYxFCeSqPJM1yqEtBCkAIxFGOqsDFWJ4MlP9d/bLrQBnpuRpPMOOBR5jR3RrAdRpnmQaQk7lRJbTYoyWj75OS/Kmr93dhRlAl92Z+r6D1AAnP3JWzNGqqwJT5t85kTkj9BuhYAutoHBpG2EhYG/d6dvsAvaeNwnMhfMrfw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] mm: introduce INVALID_{G,M}FN_RAW
Thread-Topic: [PATCH v2 1/2] mm: introduce INVALID_{G,M}FN_RAW
Thread-Index: AQHX7at6tuMQwcb1JUe4VSclhAZuZg==
Date: Fri, 10 Dec 2021 09:51:18 +0000
Message-ID: <fc16b259-7c5b-6aca-bb2d-a8d44e9d3c64@epam.com>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
 <6d2d29ca-0495-5029-afc8-7248f462db06@suse.com>
In-Reply-To: <6d2d29ca-0495-5029-afc8-7248f462db06@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe04911-6d13-423a-0e08-08d9bbc29d2e
x-ms-traffictypediagnostic: VI1PR0302MB3471:EE_
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3471B014711C5EFCD161574DE7719@VI1PR0302MB3471.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IO29z9hrL/1O3VhA2Efis5QxCMt1RcIczgeeAbGKuJQBkATt9nCH47OMCfzdA5hAEiDqSK68La5DCQ6OaW3YSc/K9TZGja28RHouVSXO6BN6kywEzoYaywEYu9wwWBr1JifUvlIe297mPRA07WWHnmFDhmlAMlqVM/034saFRtsRO5qK6dqpff4L2DMvqEuc49g8Y+gM/J4aFMHkSkxkLPAeK5ZP/PaHlzjM9AyIBKtoQOww31JYMr+S77OMBmT+x+gj+T4Qs92FpaSem/F4VX6wHpbjeWyRulZW8rN9dxLVZLfcCVgfACLd1dUgu2gDH7dfU1vwwHmmawrBC7+KgategCWZU0nmlJ+VX3S0w1DKJZSeQkhGMkn8hBNiXy8zAlywX9j/gHTPA7frFO5MFouBYkUHtLPErPKSKG4G1+32QhTZxLbx8dPClKWxGfXIH4oDAWhi71Goue4XvxNRg4ylm7XeVkZ6CDv3jFC80+aQfM5PkkRPyMTXmWJ50N2tUFJwIHNru38d8yh9HKkCyQaXeviekZ6OptHQloQIJwSEeYV48hod79Yxih1LqN/LcOexXMX++fCqrC5Zj7G2unE0X8XJ5wS8qo1uLqAZ8Pw9A1noTjqxHEUWvSra3JrtjT9Ol4sBi0T3w2HoqrfHWA713syg6aJ4s+XmKxOVzbXw+/ET0u3ARtUd4assegFF2iCZZIJ75BNwPnlNUNqtsqMhNaMK2nuLr94XfJLZJx+5iWj3ZVVY234THGQp10fbcTp68WV2o5frHSCJIZrqaIhmJVf5BFMz1nNrAJF7gt6OhBeUQ/heoK+ulDRiH4s/IEO2JwvNFDnyOvJ96FR8JQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(966005)(6506007)(53546011)(55236004)(71200400001)(38070700005)(508600001)(26005)(8936002)(5660300002)(2616005)(91956017)(76116006)(66946007)(66476007)(64756008)(8676002)(66556008)(186003)(4326008)(86362001)(31686004)(36756003)(38100700002)(54906003)(2906002)(110136005)(316002)(6486002)(6512007)(122000001)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ejN6cFBXVGN2THd5MXFCR2VzMWN1aDA3QmVVT1hzbnRCV0xmTVZxK3kycWll?=
 =?utf-8?B?OXdvZ1JYcjJOSlMvZGQyVE1kMFI5cUlIbllnWFp0K3Y4SDYvaDRVbkxSOVlm?=
 =?utf-8?B?YjlNYk9YYkZYcE9ENjhRWVVvSFh2Y0k1NkhzcWhEMDlVMHNhRitvRXROaG9y?=
 =?utf-8?B?Ky81LzdsOEpXUkZTeStuSnBaOGhrVm9MWkZwcmdoYURXSnBYVVhJVXduT2N3?=
 =?utf-8?B?bEZROGdGVjVvTmRONnJOcVJ2ZDdwbFkxZHpFeDcwR2hNSFJvVTVzdDF1eFlQ?=
 =?utf-8?B?dnlUY05SQXRwU3k1NG54ckVxUlBJQ3B2dXZUWUhCK055YmQ5WkVaWlYzdVEr?=
 =?utf-8?B?V2pEeHc5aTJ2WDd0ZGsrVFJ3QUd0MGYza3lOKzhNVW1UeXE1UU50R0s0QXdO?=
 =?utf-8?B?dnkrakJ1cjZWbkp0Zjk2aWdDSlBjdUpFYVlIbWhWbCtsUGdya0JDS0NaY2E0?=
 =?utf-8?B?RXRCTWFtajhUMzdrcmY0QkY1RDJVZlJwNVljdStIb1pzbjZHT2wyOGFydCtY?=
 =?utf-8?B?RGF3SStTZ3I4THdGK1NyZU15OGpxcWc2clRyeGlRUXNsV0FuN3E0Mm1Ja0FG?=
 =?utf-8?B?NGdkSlJsRjBUK2h0ejVlVm5BZmlrQjBBL3dCbzBpSzBQdXViZ0VwTjNlaFBn?=
 =?utf-8?B?VmVjdnN2R2pPbm9GWUtpWFRJSDc0RXRKUUdJVkxVQUp3NmlxZENaN29laTRv?=
 =?utf-8?B?YVNaNHM4ZmN5UFBqMjVUWmdPSGNUK0dUUlZIaUl3T21qbUZRVFRLTTZ3RVJV?=
 =?utf-8?B?SFhPRnR0c0dvQjBWbHhoSWJKTlhvLzZGbHRYbENOUnFTVllkQU1xSGtyaVNQ?=
 =?utf-8?B?QnlUOUhwQ0l6Tys2cEFaSVdtVWUyeUg4UmI1T2lCN0RMdExqRytvR3JDdXp5?=
 =?utf-8?B?MjAzcXVvaGxHUTZIdmhJb1RtSUNZYzZGVFl4QnNTUDl1SXBxTHRJMktHeFRZ?=
 =?utf-8?B?UFlyZ3lLdXJTOUY5VElNU0M3ZTArc1BIT29Tbk1uWVZCTWVSWU5ZMEdCR0hL?=
 =?utf-8?B?azVUbEJKRVlqdStTaWxBb2pFUU84eWlaTERuMUFWc1IxblI0c0dibXYvcVVY?=
 =?utf-8?B?ek1PakdnZlNKTU0rNERrUGdrdVNKeUNESVZUY0s3SHQ2aDRUek56bU4rS1Bs?=
 =?utf-8?B?S1JTY1NPNDI1TUQyVnhKcTEzbE5nRGlZUVRkS3F4anoxMlBpRTQ4elBEYVFM?=
 =?utf-8?B?NkdWbmJkMldQREU0SUQ2bGF1UEJmaUtyd05SZmFGSjVJWHJ4bDlEN0luVmZx?=
 =?utf-8?B?QlhRa2hPMXVHdGtheGFUenBBeDAxZ0ZwajE2aVRYeG12c2w1Ymo1WE5QVUtC?=
 =?utf-8?B?T1hJYnVyN0xaSmFqdmFCZUNSU3NJOXV0cXFJbHpJTlpZcHJYWmdla3QyRlVh?=
 =?utf-8?B?NXJXOFcydkZSRElud09laG9KbTZ5MzNOTWJxNElPKzZmc0h5WHlMRGIxOEVN?=
 =?utf-8?B?eTJHTjFnQTFjekJFckpZUjJ2SWV0S3duZXYzWDI2aVRtWjE1ODRRT1ROZDdH?=
 =?utf-8?B?OFRHcE5EYkRLNUhQdFFpcjMxY1RRUXVwWThKMTBvT2U3aURRUUNzbjNOMHFJ?=
 =?utf-8?B?SWZOcVAxUkw0T2lDeU03cndQMlB6VXBCZzlpWURHdDJvNjE4cGpXZk85aXlr?=
 =?utf-8?B?SHBWRDh2cHBPNnYwUmh5VHB6NStidHVKYkZ0cUVEUEhnZ2R3czlzYWI3SktN?=
 =?utf-8?B?Slo1VmFJQXRyMitTcUNjTW5MVnA5Q2NjQXV2ajF4dEswTEZSOXhRbTEwSkpV?=
 =?utf-8?B?Qyt5VlY2KzhVcFVWTERhZzErbnJyZHlnYjdDQWNBeGNhaWx4QWE3cWRNRTdo?=
 =?utf-8?B?dWtla0NaN0ZhRm5KUU93ZEd1aXNaYzd1YjFEajdKaHZaMHh6S3BreFdnbmdC?=
 =?utf-8?B?bWxXMGVQMHNaRUVOMnp0QnlmWFBvcHBpZzBvU3dRMUFDR1FGMXJ6Wk1IcEpm?=
 =?utf-8?B?VUh5bDNyQ25UVm1rNEtWZ0hhVWNoUmZ0UHc5NG1DZ0lmNkNQRGxBazlQZDhD?=
 =?utf-8?B?OTRpRmEvVW5TTzdOS1ZxL29kSXRCY09FWlFRRGFNZi9EcklaRVRkajNaaXA5?=
 =?utf-8?B?dUZBeEtqaFlTdmpZVEoyWVYrczZuQTZYcTV5STZaUnIvL29Va3BTK2lUTFpE?=
 =?utf-8?B?L2FaT3B2M2hNeE51ellOc24xOVgzd3FVN0oxNkZDUWpHRDhsOEk2cVpuTk85?=
 =?utf-8?B?SmFLQ2poR2JwZjJxdndieW5Vb0FYSU0xQkRSc21VQ21lSTdMRnRlSGtzM0Jq?=
 =?utf-8?B?d2hjMnN5YWFvZy94VzZzeVRTdVlDNTdwaFQ3VVZMQ2VRSkVBL2l0VktGcWtr?=
 =?utf-8?B?cHFDbWEwVFdlRXNqZWpLUitRbHkyaFFJWENtWU9sb2pEN0RMQncxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C1F01DEC2632F4CA641A9CF87E6871F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe04911-6d13-423a-0e08-08d9bbc29d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 09:51:18.3789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JshD0NZZo8veglFPR2shNeTtWVZYEuLBKsSBdpTwBCMx0a3Do2P9TnOPWHW7UjncR2kkbba/s8UD7xd5Jub1EF7PiMCs1ymKzq31VtniCmJ+FRT6c9kCmvpwcn3XpuI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3471
X-Proofpoint-ORIG-GUID: -CrPGnd5cgVB5BESqgHIiT4f5CAd7ML-
X-Proofpoint-GUID: -CrPGnd5cgVB5BESqgHIiT4f5CAd7ML-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_03,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=938 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100053

SGksIEphbiENCg0KT24gMTAuMTIuMjEgMTE6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGlz
IGFsbG93cyBwcm9wZXJseSB0eWluZyB0b2dldGhlciBJTlZBTElEX3tHLE19Rk4gYW5kDQo+IElO
VkFMSURfe0csTX1GTl9JTklUSUFMSVpFUiBhcyB3ZWxsIGFzIHVzaW5nIHRoZSBhY3R1YWwgdmFs
dWVzIGluDQo+IGNvbXBpbGUgdGltZSBjb25zdGFudCBleHByZXNzaW9ucyAob3IgZXZlbiBwcmVw
cm9jZXNzb3IgZGlyY3RpdmVzKS4NCnMvZGlyY3RpdmVzL2RpcmVjdGl2ZXMNCj4NCj4gU2luY2Ug
SU5WQUxJRF9QRk4gaXMgdW51c2VkLCBhbmQgd2l0aCB4ODYnZXMgcGFnaW5nX21hcmtfcGZuX2Rp
cnR5KCkNCj4gYmVpbmcgdGhlIG9ubHkgdXNlciBvZiBwZm5fdCBpdCBhbHNvIGRvZXNuJ3Qgc2Vl
bSBsaWtlbHkgdGhhdCBuZXcgdXNlcw0KPiB3b3VsZCBhcHBlYXIsIHJlbW92ZSB0aGF0IG9uZSBh
dCB0aGlzIHNhbWUgb2NjYXNpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCldpdGggdGhlIGFib3ZlIG5pdCBmaXhlZDoNClJldmlld2VkLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+DQo+IC0tLQ0KPiB2MjogTmV3Lg0KPg0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0tZnJh
bWUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0tZnJhbWUuaA0KPiBAQCAtNiwxMiArNiwx
MyBAQA0KPiAgIA0KPiAgIFRZUEVfU0FGRSh1bnNpZ25lZCBsb25nLCBtZm4pOw0KPiAgICNkZWZp
bmUgUFJJX21mbiAgICAgICAgICAiMDVseCINCj4gLSNkZWZpbmUgSU5WQUxJRF9NRk4gICAgICBf
bWZuKH4wVUwpDQo+ICsjZGVmaW5lIElOVkFMSURfTUZOX1JBVyAgKH4wVUwpDQo+ICsjZGVmaW5l
IElOVkFMSURfTUZOICAgICAgX21mbihJTlZBTElEX01GTl9SQVcpDQo+ICAgLyoNCj4gICAgKiBU
byBiZSB1c2VkIGZvciBnbG9iYWwgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24uIFRoaXMgd29ya2Fy
b3VuZCBhIGJ1Zw0KPiAgICAqIGluIEdDQyA8IDUuMC4NCj4gICAgKi8NCj4gLSNkZWZpbmUgSU5W
QUxJRF9NRk5fSU5JVElBTElaRVIgeyB+MFVMIH0NCj4gKyNkZWZpbmUgSU5WQUxJRF9NRk5fSU5J
VElBTElaRVIgeyBJTlZBTElEX01GTl9SQVcgfQ0KPiAgIA0KPiAgICNpZm5kZWYgbWZuX3QNCj4g
ICAjZGVmaW5lIG1mbl90IC8qIEdyZXAgZm9kZGVyOiBtZm5fdCwgX21mbigpIGFuZCBtZm5feCgp
IGFyZSBkZWZpbmVkIGFib3ZlICovDQo+IEBAIC00NCwxMiArNDUsMTMgQEAgc3RhdGljIGlubGlu
ZSBib29sX3QgbWZuX2VxKG1mbl90IHgsIG1mbg0KPiAgIA0KPiAgIFRZUEVfU0FGRSh1bnNpZ25l
ZCBsb25nLCBnZm4pOw0KPiAgICNkZWZpbmUgUFJJX2dmbiAgICAgICAgICAiMDVseCINCj4gLSNk
ZWZpbmUgSU5WQUxJRF9HRk4gICAgICBfZ2ZuKH4wVUwpDQo+ICsjZGVmaW5lIElOVkFMSURfR0ZO
X1JBVyAgKH4wVUwpDQo+ICsjZGVmaW5lIElOVkFMSURfR0ZOICAgICAgX2dmbihJTlZBTElEX0dG
Tl9SQVcpDQo+ICAgLyoNCj4gICAgKiBUbyBiZSB1c2VkIGZvciBnbG9iYWwgdmFyaWFibGUgaW5p
dGlhbGl6YXRpb24uIFRoaXMgd29ya2Fyb3VuZCBhIGJ1Zw0KPiAgICAqIGluIEdDQyA8IDUuMCBo
dHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD02NDg1Ng0KPiAgICAq
Lw0KPiAtI2RlZmluZSBJTlZBTElEX0dGTl9JTklUSUFMSVpFUiB7IH4wVUwgfQ0KPiArI2RlZmlu
ZSBJTlZBTElEX0dGTl9JTklUSUFMSVpFUiB7IElOVkFMSURfR0ZOX1JBVyB9DQo+ICAgDQo+ICAg
I2lmbmRlZiBnZm5fdA0KPiAgICNkZWZpbmUgZ2ZuX3QgLyogR3JlcCBmb2RkZXI6IGdmbl90LCBf
Z2ZuKCkgYW5kIGdmbl94KCkgYXJlIGRlZmluZWQgYWJvdmUgKi8NCj4gQEAgLTgyLDcgKzg0LDYg
QEAgc3RhdGljIGlubGluZSBib29sX3QgZ2ZuX2VxKGdmbl90IHgsIGdmbg0KPiAgIA0KPiAgIFRZ
UEVfU0FGRSh1bnNpZ25lZCBsb25nLCBwZm4pOw0KPiAgICNkZWZpbmUgUFJJX3BmbiAgICAgICAg
ICAiMDVseCINCj4gLSNkZWZpbmUgSU5WQUxJRF9QRk4gICAgICAofjBVTCkNCj4gICANCj4gICAj
aWZuZGVmIHBmbl90DQo+ICAgI2RlZmluZSBwZm5fdCAvKiBHcmVwIGZvZGRlcjogcGZuX3QsIF9w
Zm4oKSBhbmQgcGZuX3goKSBhcmUgZGVmaW5lZCBhYm92ZSAqLw0KPg0KPg0K

