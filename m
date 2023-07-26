Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE768762837
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 03:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570016.891248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOTU9-00052d-DY; Wed, 26 Jul 2023 01:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570016.891248; Wed, 26 Jul 2023 01:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOTU9-0004zx-8B; Wed, 26 Jul 2023 01:38:41 +0000
Received: by outflank-mailman (input) for mailman id 570016;
 Wed, 26 Jul 2023 01:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot2o=DM=epam.com=prvs=15712f9dd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qOTU7-0004zr-FI
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 01:38:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23684803-2b55-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 03:38:36 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36PFrCOE015982; Wed, 26 Jul 2023 01:38:34 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3s2cyajhyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 01:38:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU2PR03MB7911.eurprd03.prod.outlook.com (2603:10a6:10:2d6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 01:38:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 01:38:30 +0000
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
X-Inumbo-ID: 23684803-2b55-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5zab0OABzXrO8RlA20lUUNuMJTYBHDN7pF0iIa0qeg0h9ar+fJTQLL+iQQHT+P0Te4TP8N+tdl+Qduz5iTQmOLQ2Ms/H+7PoqppKS0lNPHJI4fvKPyhREO3RuBg4L4AfMYkxZKg+mUX/6RX4T1KOR/5BMiO/DbMfUVWGDVk3SoB7NlWjssl8NgEbn8nIuPuxt8dGgjmljQ7bAQ1d+mH4vqHZ9qmcWzC99XJCJ6/EOe8688/fEMf+Ar2PrDmjrEfXuvownc55TIauWviu1WHLb8KGV3qh7RMCDhM90yEoWh4SdrmMPMgQN3cs1/SaZcTQBVk7MAuIwqtNR4ZQRhqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT0Xxc9bBT63t16BhROnt1FKdJVXGEf4DnaTiAMu6lk=;
 b=YVuGaStkGOc921aSMdpgDi3xIawZAeA3IyNDxZ4LVGC90DEsIOev/GHh798N7rpC5DLHLGV3CAImIuKwW2n8iFzWCA9a3uqVxGCEVhlbX3449jOhYG+F5qAuVcBQVhyiSPo9kgAiRg5TrgANAn8+OpU0iAoUQkMFeFIv1NooBujTC3IDuLrFQcaEFLT0Eic2vtaZYS6kceVYKUCODiPGfQzIeDGZh5tdqZyedud5n191AQ3QBW+EM1Fm/WBFHthy4yW2LcXw85+yk5f3cBXmL+/41zeD56WBKjg1HMIzfIlhPbK74dFI9vT/H+UvZkkYWJDIgnaYZJ5WZCWggVjHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT0Xxc9bBT63t16BhROnt1FKdJVXGEf4DnaTiAMu6lk=;
 b=esLFKy1UntXsexI4xP2oLeqeLw0jXCLYVgkjUxFwjjSm5KTBGx1hM8nNYQTOGewLGNg4S5AZgsZrVPC8N6aU+gJlTGuDILni/Vr39BOXJVNfWDCydasaG49OQ2VzsHi9XCVpLfqLN2dmg9Iv5doCG/jArC1nnyUYZao89hz8dGeCZqnR9hJkPeIxqHmwfXyutOxiW+jkOVDXx1CJibAirLFUgIQz7Gq3RovPQIi2Odn/ByQm5t7wGS+QPKBUazqofqXIuHMluetKo5Nl5u20qK5wM5U/QkgdeNftVv9TIUtq6yEre5trfWkNXfvnJFDox0PH6WttAoF8DjmHsao3SA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v8 04/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZuqGrBGIo4QxjlkuKy7Wb3D/bwa/CmGeAgAizHoA=
Date: Wed, 26 Jul 2023 01:38:30 +0000
Message-ID: <875y67cuzu.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-5-volodymyr_babchuk@epam.com>
 <ZLkqWXJtYlsJ4M61@MacBook-Air-de-Roger.local>
In-Reply-To: <ZLkqWXJtYlsJ4M61@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU2PR03MB7911:EE_
x-ms-office365-filtering-correlation-id: 2779397f-896c-47d2-f7b8-08db8d790460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lr1DeucuiOvRBwFsrp4d6fdlymk1BFaalPp6DMKzYida5uyjDS5X++pSVm34t2Gflv2pccEOere25x9Cq/4BMVVGWLlLWJX9hC8rUKqylt+rF0ZjsaeTxntAXMOzrXSuN8EwgDzrFFS1VnysoHuz/ywLHKmIFxVfKTIk1zrmkmhC9bhOcYa1otbo6D2TOOVd3BZ3vgFmpZ7hZFiD/Rz4FAsYKHpfDfr7xomCuZfom+CnrmQ8imju9vnZnOcMKUHUigihw7hk6RKRrzpIXQHWo1+Km7hEG++WM3q8YEXfXUjUi6WZP+WY1vtsCh2lXBf+Ng4fS/gGHQ7IwZulafuWnTE1In55gsu6/Z9ZxO9MKxAXDeuY8r1tzOLalrCVtOyigWrG9/dkTYyZDTb39rfycNZfc0m0dATLnOCLEM9fCWQsIkc3u2DkdZUh6zAaIin8x1P3oAp41W82RWc0pIeonxAE8vtt+aJEu3NV+tWgEJ2QizLo4leJ9xnxwoWjhI9i2jjBkNUIZf2p0PsF0pXDX3VuHeMdXK3XQ7x/bUoOPI2hNNIcFmdHwW3CQe8HDTaO9frIX3Rw1Kp7DfEt7B8R3jb/kd+rwyhK7sxhbV5YPxMWno7tlC52dinS0GWLnwQa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(66946007)(54906003)(6512007)(71200400001)(122000001)(6486002)(38100700002)(478600001)(41300700001)(4326008)(8676002)(5660300002)(66556008)(66446008)(66476007)(64756008)(76116006)(91956017)(316002)(6916009)(8936002)(2616005)(186003)(83380400001)(107886003)(55236004)(26005)(6506007)(86362001)(36756003)(38070700005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1NFNkM0cU9lZnZyUWl3VHNsc2k5dVlZVm5XMUhKODVTdHJkT0NKMlRWZnpm?=
 =?utf-8?B?R1IxK3dPeitXNFNHM3ZzRldaUEU2NkNWVktDejVySzhzekJCUnVoSWhjdHdM?=
 =?utf-8?B?cWpkRWY4VUxmNFFidk9jSHFUd2toQmtmUldGd0xuM2pxVUE1UjVXNng5cmRF?=
 =?utf-8?B?N21VU3lnQVRXS3BadmdzMFBrOXhESm8rZ3Y4VzZGR0tYSDk3R3dGbURLZG4x?=
 =?utf-8?B?WDMwdkxyV0Z5VHVzUFg0VzFxUjBBZVljYWNjMCs1Z2VnOE9RamxXNEk2RjBq?=
 =?utf-8?B?QXdjS0t6RVFEWDZOV2c5c01QT253NmdDQ2laNHFnSkpBWW8yZUh1T3RsK0Vn?=
 =?utf-8?B?REU3eFlYYitENEF1QmxJT1JiOVduY2lnZEUzbXk4cTlVdXRUWGtWY292dlVk?=
 =?utf-8?B?RTdINU14cmVkSFhEU3pyZUdTcVF4cmIxT3FSSUxvb2RkWmxaa1FmT0Jlb1lo?=
 =?utf-8?B?WDhjN01pQVVmTmZjWEFTbCs1cUdzbFBWeWU3ZUxzOTRKbEpJUng4ekRTaGpY?=
 =?utf-8?B?MUx5Qjg3ZFF5NmV5K3loTHBnL3FFOWlhaVBOT29DMXNTOVZISFFZQXVNWVJ2?=
 =?utf-8?B?Wi9tZjVqcm8wU3djWG9XV1dTZjJtSUdiWWhTOWJHc0JJVXJDSThpSmVFZFdI?=
 =?utf-8?B?NnpqQU9talozSTVUdGRVTlZuSXFjQXdwcGVQZVdkNDNYS3BlbXlGT1A0bTZV?=
 =?utf-8?B?SlMycUJkVVJ1WUVsWDF1ZWhyV2ZPNmU1SWo4cEpjMWk5K1RRaEt3NXBtZHBJ?=
 =?utf-8?B?SWY0bG5ndURmRDZPeGx4eEhzd3lySzRjYmIzUUVGc2hsYlVnQ1hPZTFYZEFr?=
 =?utf-8?B?bEJSdzcyUnZGOFAxMk9nenZxc1dBbFc1UFh1RDI5Um4wZkNOaDFjU3k5OWJH?=
 =?utf-8?B?Yzl5WVBVaUZ0ZEhSOFNqdlBDU3NMZy9ZVG12NXl4UTkvT21ITlc0MUFhNlpX?=
 =?utf-8?B?SmdsZ2FNU294eTMzTU1CS0I0T09WYnV6Wk0vQVVjbVlMd3Izci96ODcxTXc5?=
 =?utf-8?B?WENZVGZNRUdJeStodkVEZEw3VzdMdHFPTUxiaGVCbnZueURXSm9BUkdlSDFM?=
 =?utf-8?B?dkE2VXNjZzhxNklUWHBQRG9vRk5WZllGQkNFaFdJN294RWpVWm1tc3phK0Zy?=
 =?utf-8?B?U1lHZjU0QU9Fc1Ivd2RZcnd0YkV6RG9UR1hEdmo3aWQ0dzRPaFNWTVp1MHEx?=
 =?utf-8?B?RXRUbjZBUURNaW92YnV6akdJajdwWjQ2b0pBckhuL2FhQ0QrVzVUSStqSTRk?=
 =?utf-8?B?dnJjV2JxY3BIdXNSblpZT25kemcrN05ESFJuTytoTCtNTGZnQVR1a0gwa1dk?=
 =?utf-8?B?NFJiY25hWW5ZSzVmQmF1V3FCVFB3TmsraUdJNTFsbnhYUVpPNFhZTFhsWk1Q?=
 =?utf-8?B?aEMvOXBDY3Nid2pVMnZSOHBTYmo5U1E5YXdzZFNkS3M4RU5tNlQ1YnJMQnR1?=
 =?utf-8?B?ZlhyYStOUFdyL0V3enY0OFduNTBscnp3S0hDTHd5T1JCUFo1Z1Y4NFo2M29n?=
 =?utf-8?B?NFpLMXJsd1E2ZjNvQU01SlB2b3Bic3ByRFZjY1YvZzNJL250SU9raG5nbVBG?=
 =?utf-8?B?aHJLK2d1TDRmd1h0Q21pbjdDRWkvTmJybmVIbHp3ZEwzK3U3alhuZTlhS0FR?=
 =?utf-8?B?aUt0R0tkdVVZQ1dTYUQ2QVNLL0xyZ1l0UGZwK0E0aUJPVW9jaE93YjNXNitV?=
 =?utf-8?B?dXRENkVzZVBCdlIra0p2RTV3RFoyUDREcnNSQit0M3BrZ2xMa0o1SStrajV5?=
 =?utf-8?B?NEVJdkdrVlNPblRGUFJoY2M3UXJEMkRuRURMQ1NGMDhyajVQVVhINSt2eVE4?=
 =?utf-8?B?Sm9lVmhrZE1Yc3JQRUYwa28yOWRvMGNUUVN0QUxSU0hZTHlxTlRWRnZqVjdJ?=
 =?utf-8?B?QWRraEhYbW9TVDVlbVFUWWdXNmVLNVFXMERmdGJNWkZTZlUyUlJSK1Y4eFp6?=
 =?utf-8?B?d3dqUWRIZ3Z3TFVJQ3pJSjI4YS8wb2FsaVhUcDJMWGx2SHB6ajBTYU1aeVdU?=
 =?utf-8?B?b082OXlmQ1B2cEtGcGxFWHhhSlZkV2htakdoKzNXZFYraE9KUUh2a3pacXc1?=
 =?utf-8?B?QkpDcVhNbHpnV0U3M0NDb3Z4V1BwcC9heGdHSEpkeUM3STRVL3ZNZmpsOWNh?=
 =?utf-8?B?SkZUQVdUZzVIaExZSjVKTE4rS2FtUEMxWTB1bDRXVjI4UkdTSGtBb2ViN2V2?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4BD6D6EBC07C44591668F798CD782FE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2779397f-896c-47d2-f7b8-08db8d790460
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 01:38:30.6590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HL306N/Dffw/lGR3Y0v34a4/g8BcxYmJg1Lk/T1P5yfkIzO/lGNe/FA/oYJQS2zqwJZXMLjO3vgdcw+s5k+cpoxdCLxt8zcFjAS9A/TFRH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7911
X-Proofpoint-ORIG-GUID: 2oMF9KW8dz_sSj4Js_0Kt7ZGMxFS0Rrq
X-Proofpoint-GUID: 2oMF9KW8dz_sSj4Js_0Kt7ZGMxFS0Rrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260013

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAxMjozMjozMUFNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IA0KPj4gV2hlbiBhIFBDSSBkZXZp
Y2UgZ2V0cyBhc3NpZ25lZC9kZS1hc3NpZ25lZCBzb21lIHdvcmsgb24gdlBDSSBzaWRlIG5lZWRz
DQo+PiB0byBiZSBkb25lIGZvciB0aGF0IGRldmljZS4gSW50cm9kdWNlIGEgcGFpciBvZiBob29r
cyBzbyB2UENJIGNhbiBoYW5kbGUNCj4+IHRoYXQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+IC0tLQ0KPj4gU2luY2Ugdjg6DQo+PiAtIHJlbW92ZWQgdnBjaV9kZWFzc2lnbl9kZXZpY2UN
Cj4+IFNpbmNlIHY2Og0KPj4gLSBkbyBub3QgcGFzcyBzdHJ1Y3QgZG9tYWluIHRvIHZwY2lfe2Fz
c2lnbnxkZWFzc2lnbn1fZGV2aWNlIGFzDQo+PiAgIHBkZXYtPmRvbWFpbiBjYW4gYmUgdXNlZA0K
Pj4gLSBkbyBub3QgbGVhdmUgdGhlIGRldmljZSBhc3NpZ25lZCAocGRldi0+ZG9tYWluID09IG5l
dyBkb21haW4pIGluIGNhc2UNCj4+ICAgdnBjaV9hc3NpZ25fZGV2aWNlIGZhaWxzOiB0cnkgdG8g
ZGUtYXNzaWduIGFuZCBpZiB0aGlzIGFsc28gZmFpbHMsIHRoZW4NCj4+ICAgY3Jhc2ggdGhlIGRv
bWFpbg0KPj4gU2luY2UgdjU6DQo+PiAtIGRvIG5vdCBzcGxpdCBjb2RlIGludG8gcnVuX3ZwY2lf
aW5pdA0KPj4gLSBkbyBub3QgY2hlY2sgZm9yIGlzX3N5c3RlbV9kb21haW4gaW4gdnBjaV97ZGV9
YXNzaWduX2RldmljZQ0KPj4gLSBkbyBub3QgdXNlIHZwY2lfcmVtb3ZlX2RldmljZV9oYW5kbGVy
c19sb2NrZWQgYW5kIHJlLWFsbG9jYXRlDQo+PiAgIHBkZXYtPnZwY2kgY29tcGxldGVseQ0KPj4g
LSBtYWtlIHZwY2lfZGVhc3NpZ25fZGV2aWNlIHZvaWQNCj4+IFNpbmNlIHY0Og0KPj4gIC0gZGUt
YXNzaWduIHZQQ0kgZnJvbSB0aGUgcHJldmlvdXMgZG9tYWluIG9uIGRldmljZSBhc3NpZ25tZW50
DQo+PiAgLSBkbyBub3QgcmVtb3ZlIGhhbmRsZXJzIGluIHZwY2lfYXNzaWduX2RldmljZSBhcyB0
aG9zZSBtdXN0IG5vdA0KPj4gICAgZXhpc3QgYXQgdGhhdCBwb2ludA0KPj4gU2luY2UgdjM6DQo+
PiAgLSByZW1vdmUgdG9vbHN0YWNrIHJvbGwtYmFjayBkZXNjcmlwdGlvbiBmcm9tIHRoZSBjb21t
aXQgbWVzc2FnZQ0KPj4gICAgYXMgZXJyb3IgYXJlIHRvIGJlIGhhbmRsZWQgd2l0aCBwcm9wZXIg
Y2xlYW51cCBpbiBYZW4gaXRzZWxmDQo+PiAgLSByZW1vdmUgX19tdXN0X2NoZWNrDQo+PiAgLSBy
ZW1vdmUgcmVkdW5kYW50IHJjIGNoZWNrIHdoaWxlIGFzc2lnbmluZyBkZXZpY2VzDQo+PiAgLSBm
aXggcmVkdW5kYW50IENPTkZJR19IQVNfVlBDSSBjaGVjayBmb3IgQ09ORklHX0hBU19WUENJX0dV
RVNUX1NVUFBPUlQNCj4+ICAtIHVzZSBSRUdJU1RFUl9WUENJX0lOSVQgbWFjaGluZXJ5IHRvIHJ1
biByZXF1aXJlZCBzdGVwcyBvbiBkZXZpY2UNCj4+ICAgIGluaXQvYXNzaWduOiBhZGQgcnVuX3Zw
Y2lfaW5pdCBoZWxwZXINCj4+IFNpbmNlIHYyOg0KPj4gLSBkZWZpbmUgQ09ORklHX0hBU19WUENJ
X0dVRVNUX1NVUFBPUlQgc28gZGVhZCBjb2RlIGlzIG5vdCBjb21waWxlZA0KPj4gICBmb3IgeDg2
DQo+PiBTaW5jZSB2MToNCj4+ICAtIGNvbnN0aWZ5IHN0cnVjdCBwY2lfZGV2IHdoZXJlIHBvc3Np
YmxlDQo+PiAgLSBkbyBub3Qgb3BlbiBjb2RlIGlzX3N5c3RlbV9kb21haW4oKQ0KPj4gIC0gZXh0
ZW5kZWQgdGhlIGNvbW1pdCBtZXNzYWdlDQo+PiAtLS0NCj4+ICB4ZW4vZHJpdmVycy9LY29uZmln
ICAgICAgICAgICB8ICA0ICsrKysNCj4+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8
IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAg
ICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+PiAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAg
ICAgICAgfCAxNSArKysrKysrKysrKysrKysNCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2Vy
dGlvbnMoKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL0tjb25maWcgYi94ZW4v
ZHJpdmVycy9LY29uZmlnDQo+PiBpbmRleCBkYjk0MzkzZjQ3Li43ODA0OTBjZjhlIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvS2NvbmZpZw0KPj4gKysrIGIveGVuL2RyaXZlcnMvS2NvbmZp
Zw0KPj4gQEAgLTE1LDQgKzE1LDggQEAgc291cmNlICJkcml2ZXJzL3ZpZGVvL0tjb25maWciDQo+
PiAgY29uZmlnIEhBU19WUENJDQo+PiAgCWJvb2wNCj4+ICANCj4+ICtjb25maWcgSEFTX1ZQQ0lf
R1VFU1RfU1VQUE9SVA0KPj4gKwlib29sDQo+PiArCWRlcGVuZHMgb24gSEFTX1ZQQ0kNCj4+ICsN
Cj4+ICBlbmRtZW51DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gaW5kZXggNmY4NjkyY2Q5Yy4u
MjY1ZDM1OTcwNCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gQEAgLTg4NSw2ICs4
ODUsMTAgQEAgc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdWlu
dDE2X3Qgc2VnLCB1aW50OF90IGJ1cywNCj4+ICAgICAgaWYgKCByZXQgKQ0KPj4gICAgICAgICAg
Z290byBvdXQ7DQo+PiAgDQo+PiArICAgIHdyaXRlX2xvY2soJnBkZXYtPmRvbWFpbi0+cGNpX2xv
Y2spOw0KPj4gKyAgICB2cGNpX2RlYXNzaWduX2RldmljZShwZGV2KTsNCj4+ICsgICAgd3JpdGVf
dW5sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+ICsNCj4+ICAgICAgaWYgKCBwZGV2
LT5kb21haW4gPT0gaGFyZHdhcmVfZG9tYWluICApDQo+PiAgICAgICAgICBwZGV2LT5xdWFyYW50
aW5lID0gZmFsc2U7DQo+PiAgDQo+PiBAQCAtMTQ4NCw2ICsxNDg4LDEwIEBAIHN0YXRpYyBpbnQg
YXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZu
LCB1MzIgZmxhZykNCj4+ICAgICAgaWYgKCBwZGV2LT5icm9rZW4gJiYgZCAhPSBoYXJkd2FyZV9k
b21haW4gJiYgZCAhPSBkb21faW8gKQ0KPj4gICAgICAgICAgZ290byBkb25lOw0KPj4gIA0KPj4g
KyAgICB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+ICsgICAgdnBjaV9k
ZWFzc2lnbl9kZXZpY2UocGRldik7DQo+PiArICAgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9tYWlu
LT5wY2lfbG9jayk7DQo+PiArDQo+PiAgICAgIHJjID0gcGRldl9tc2l4X2Fzc2lnbihkLCBwZGV2
KTsNCj4+ICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICBnb3RvIGRvbmU7DQo+PiBAQCAtMTUw
OSw2ICsxNTE3LDE5IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+ICAgICAgICAgIHJjID0g
aW9tbXVfY2FsbChoZC0+cGxhdGZvcm1fb3BzLCBhc3NpZ25fZGV2aWNlLCBkLCBkZXZmbiwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfdG9fZGV2KHBkZXYpLCBmbGFnKTsNCj4+ICAg
ICAgfQ0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIGdvdG8gZG9uZTsNCj4+ICsNCj4+
ICsgICAgZGV2Zm4gPSBwZGV2LT5kZXZmbjsNCj4+ICsgICAgd3JpdGVfbG9jaygmcGRldi0+ZG9t
YWluLT5wY2lfbG9jayk7DQo+PiArICAgIHJjID0gdnBjaV9hc3NpZ25fZGV2aWNlKHBkZXYpOw0K
Pj4gKyAgICB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4gKyAgICBp
ZiAoIHJjICYmIGRlYXNzaWduX2RldmljZShkLCBzZWcsIGJ1cywgZGV2Zm4pICkNCj4+ICsgICAg
ew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwZDogJXBwIHdhcyBsZWZ0IHBhcnRp
YWxseSBhc3NpZ25lZFxuIiwNCj4+ICsgICAgICAgICAgICAgICBkLCAmUENJX1NCREYoc2VnLCBi
dXMsIGRldmZuKSk7DQo+DQo+ICZwZGV2LT5zYmRmPyAgVGhlbiB5b3UgY2FuIGdldCBvZiB0aGUg
ZGV2Zm4gdXNhZ2UgYWJvdmUuDQoNClllcywgdGhhbmtzLg0KDQo+PiArICAgICAgICBkb21haW5f
Y3Jhc2goZCk7DQo+DQo+IFRoaXMgc2VlbXMgbGlrZSBhIGJpdCBkaWZmZXJlbnQgZnJvbSB0aGUg
b3RoZXIgZXJyb3IgcGF0aHMgaW4gdGhlDQo+IGZ1bmN0aW9uLCBpc24ndCBpdCBmaW5lIHRvIHJl
dHVybiBhbiBlcnJvciBhbmQgbGV0IHRoZSBjYWxsZXIgaGFuZGxlDQo+IHRoZSBkZWFzc2lnbj8N
Cg0KSSBiZWxpZXZlLCBpbnRlbnRpb24gd2FzIHRvIG5vdCBsZWF2ZSBkZXZpY2UgaW4gYW4gdW5r
bm93biBzdGF0ZTogd2UNCmZhaWxlZCBib3RoIGFzc2lnbl9kZXZpY2UoKSBhbmQgZGVhc3NpZ25f
ZGV2aWNlKCkgY2FsbCwgc28gd2hhdCB0byBkbw0Kbm93PyBCdXQgeWVzLCBJIHRoaW5rIHlvdSBh
cmUgcmlnaHQgYW5kIGl0IGlzIGJldHRlciB0byBsZXQgY2FsbGVyIHRvDQpkZWNpZGUgd2hhdCB0
byBkbyBuZXh0Lg0KDQo+DQo+IEFsc28sIGlmIHdlIHJlYWxseSBuZWVkIHRvIGNhbGwgZGVhc3Np
Z25fZGV2aWNlKCkgd2UgbXVzdCBkbyBzbyBmb3INCj4gYWxsIHBvc3NpYmxlIHBoYW50b20gZGV2
aWNlcywgc2VlIHRoZSBhYm92ZSBsb29wIGFyb3VuZA0KPiBpb21tdV9jYWxsKC4uLiwgYXNzaW5n
X2RldmljZSwgLi4uKTsNCg0KQnV0IGRlYXNzaWduX2RldmljZSgpIGhhcyB0aGUgbG9vcCBmb3Ig
YWxsIHBoYW50b20gZGV2aWNlcyB0aGF0IGFscmVhZHkNCmRvZXMgYWxsIHRoZSB3b3JrLiBVbmxl
c3MgSSBtaXNzIHNvbWV0aGluZywgb2YgY291cnNlLg0KDQo+PiArICAgIH0NCj4+ICANCj4+ICAg
ZG9uZToNCj4+ICAgICAgaWYgKCByYyApDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gaW5kZXggYTZkMmNmODY2MC4u
YTk3NzEwYTgwNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiAr
KysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gQEAgLTEwNyw2ICsxMDcsMjQgQEAgaW50
IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0KPj4gICAgICBy
ZXR1cm4gcmM7DQo+PiAgfQ0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1Rf
U1VQUE9SVA0KPj4gKy8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGd1
ZXN0LiAqLw0KPj4gK2ludCB2cGNpX2Fzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArDQo+PiArICAgIGlmICggIWhhc192cGNpKHBk
ZXYtPmRvbWFpbikgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHJjID0g
dnBjaV9hZGRfaGFuZGxlcnMocGRldik7DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAg
dnBjaV9kZWFzc2lnbl9kZXZpY2UocGRldik7DQo+DQo+IFdoeSBkbyB5b3UgbmVlZCB0aGlzIGhh
bmRsZXIsIHZwY2lfYWRkX2hhbmRsZXJzKCkgd2hlbiBmYWlsaW5nIHdpbGwNCj4gYWxyZWFkeSBj
YWxsIHZwY2lfcmVtb3ZlX2RldmljZSgpLCB3aGljaCBpcyB3aGF0DQo+IHZwY2lfZGVhc3NpZ25f
ZGV2aWNlKCkgZG9lcy4NCj4NCj4+ICsNCj4+ICsgICAgcmV0dXJuIHJjOw0KPj4gK30NCj4+ICsj
ZW5kaWYgLyogQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgKi8NCj4+ICsNCj4+ICAjZW5k
aWYgLyogX19YRU5fXyAqLw0KPj4gIA0KPj4gIHN0YXRpYyBpbnQgdnBjaV9yZWdpc3Rlcl9jbXAo
Y29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIxLA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBpbmRleCAwYjhhMmEz
Yzc0Li40NDI5NjYyM2UxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0K
Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gQEAgLTI2NCw2ICsyNjQsMjEgQEAg
c3RhdGljIGlubGluZSBib29sIF9fbXVzdF9jaGVjayB2cGNpX3Byb2Nlc3NfcGVuZGluZyhzdHJ1
Y3QgdmNwdSAqdikNCj4+ICB9DQo+PiAgI2VuZGlmDQo+PiAgDQo+PiArI2lmZGVmIENPTkZJR19I
QVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMg
YXNzaWduZWQvZGUtYXNzaWduZWQgdG8vZnJvbSBndWVzdC4gKi8NCj4+ICtpbnQgdnBjaV9hc3Np
Z25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICsjZGVmaW5lIHZwY2lfZGVhc3Np
Z25fZGV2aWNlIHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4gKyNlbHNlDQo+PiArc3RhdGljIGlubGlu
ZSBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+
ICsgICAgcmV0dXJuIDA7DQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdnBj
aV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gK307DQo+
PiArI2VuZGlmDQo+DQo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBtdWNoIHBvaW50IGluIGludHJv
ZHVjaW5nIG5ldyBmdW5jdGlvbnMsIHNlZQ0KPiBhYm92ZS4gIEknbSBmaW5lIGlmIHRoZSBjdXJy
ZW50IG9uZXMgd2FudCB0byBiZSByZW5hbWVkIHRvDQo+IHZwY2lfeyxkZX1hc3NpZ25fZGV2aWNl
KCksIGJ1dCBhZGRpbmcgZGVmaW5lcyBsaWtlIHRoZSBhYm92ZSBqdXN0DQo+IG1ha2VzIHRoZSBj
b2RlIGhhcmRlciB0byBmb2xsb3cuDQoNCkdvb2QgaWRlYSwgdGhhbmtzLCBJJ2xsIGp1c3QgcmVu
YW1lIHRoZSBvcmlnaW5hbCBmdW5jdGlvbnMuDQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

