Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62F429458
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206325.361877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxyU-0004jo-Bz; Mon, 11 Oct 2021 16:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206325.361877; Mon, 11 Oct 2021 16:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxyU-0004gn-8B; Mon, 11 Oct 2021 16:16:26 +0000
Received: by outflank-mailman (input) for mailman id 206325;
 Mon, 11 Oct 2021 16:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRsb=O7=epam.com=prvs=0918241709=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mZxyT-0004gh-1D
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:16:25 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93cd3c5a-2aae-11ec-80eb-12813bfff9fa;
 Mon, 11 Oct 2021 16:16:23 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BFEWfe009402; 
 Mon, 11 Oct 2021 16:16:21 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bmqr3096c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 16:16:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 16:16:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 16:16:17 +0000
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
X-Inumbo-ID: 93cd3c5a-2aae-11ec-80eb-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chtDU1NmVTmeZRjR6urNcfsvOl47MdCCvKj/+mG7MfJYU5yihrOHWUTtza7ipmeZHZSWtyMBOHTatNmzYVEjTkAz18z/4HOytnuWjVCZl6ZqE3z0OOjTrJXd3/nx62iIYxZOAT6/I+/PdlM7O2TsLj2dud6fHR+ET5kF2Fq6sWFpkAysXx9dnT4fFiNUAOqztRwVIU/XtxwPle7KiaQdk3cRle14xycOqAoiPOHeb8wTCZzPI9n2NT4HYbBNmguOewi5EhdYL/bBfPY0yv2Okz1mQsVoJDyBOCo2duW9lB9oQ76LZ07ac08eQIYCfS582y/37XphALRWICoOOsQAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opmmnLgmNord4MESRcZ/0c2q1Ou/q6r/Dq9d/JpNBeQ=;
 b=SgAyH6OSmtArETsaSnILxLM4MKRmC+3uAN899MoDoLzBMvA+F6laNHu1yvhUUXejWfCcSPEDsJvmpOwmMe8FG0s9jg1gL8xOWyDnjDIvAAzuHJcEBim0YhK53T22YGzRopVWUbW4gCCEYIw6+h1OKP6jWcLxgoWrBLh3RvDyIaVasYKT2diTJSMhHuBo/9zRMPp2hdf6sSJtzVGpg4Ida6QoSB111aJPFz6G6RzOf+g30lhqaeBb/V0Pa0nLDSUFxTYXgQesO2kH9yF08w1lfZWUNHlMEzFEWnqBvyTj3Daq20HeVUmhPkGXqaL8x5shqzRgnunZFWluputrnVXNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opmmnLgmNord4MESRcZ/0c2q1Ou/q6r/Dq9d/JpNBeQ=;
 b=19R6LheuD5DyeLO7ja7wQxbMkbpVlNas7+u4SstkImrbRaSS3TgDYYMXKtE/V+KjtS3DJv7J+fwwE8tYwA5JQjUSAAIqBEclDQy89/BW/TX4964EmRpEfHJEHWIiyuirVxnbgHUL0Uwh7Ts2ot9iKO7mTDiOlzFLqz2J+0goWWPc8S4v/80dhUQTAEUb8zv2WZUJd8Rw6RaP8MnKwBIiwi+HDsguAQF7lcpk2pm1rBbm+1Xn0M5qN5md99Xpb2+neQ/fUXCbpv40Y4yRpmQm4k5LVqgoRPGzIzUIAsiEpCcbxP/MHAu9cajCajlFIwBGbPOrur2vaL8zBaXf/l6+VA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>, Ian Jackson <iwj@xenproject.org>,
        Juergen Gross
	<jgross@suse.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Thread-Topic: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types
 of domains
Thread-Index: AQHXvAknnKigXkenfkWfROoBKCqE16vN/T8AgAABUAA=
Date: Mon, 11 Oct 2021 16:16:17 +0000
Message-ID: <64d11e9e-2d33-ef97-ec90-f39b88ace727@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-7-andr2000@gmail.com> <YWRiNlygslYUEr7u@perard>
In-Reply-To: <YWRiNlygslYUEr7u@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0009c663-8e89-4fb0-a295-08d98cd27465
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688145A6E8719AA7BEECF3E6E7B59@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6seTlB/uL2w77vwBSq9g2/nc4gizCe5wPC+taZQcqpUWDHbaWdwC1UusUKEKBeO8vzuuR8avnR0sR7Z+JafYrHJ2rhp+E4enafKHon/WTyxsSZYC0JF+hBLzSsDt6ARFjx0866Xn9T7Rj0O/Q0h1PfoGd+2IQIG4HmaqgrNWbeYD2AFDYbjyWQObp4zGFw4u7gdbxK9p/3bwQBOXPlmdVe7dqIdysDhZ1FdB4usRuYsAxNNqIfuLrvPXNsZ9gqVOq4Ff0XWg3s9dv8Ccp5fLzBMxuyg4BaA7Iu6DLNoo6wanTFjHNuMQxYuhY6jF3rLfrIQhJvn1A+C7jC1Uo0Q1D+YuquDoqtYIEo4ryH/+BYu/WLi6nhuSffYoP5E5zXX96XBsxDD60SLlgvJ8DbADYeU/XftihcY0PNfbx7xFfOzYYGTlgQKAaZXXtiWB1TJGd7MlT3Zk1mhXVPPL9nXH9aCjn0t2thrniqA4ZCkoWgVeRJx2U1MbLZd6i+AzjRqQBUp754s1nuW+xtOvXToEY05VzPX9nfi31/zdUwMRjqq1P3RRQOzJcZsQLqsPLJ8IztHXM8dnKGtijzaWqM5E3gIwFwNiZndkoXhsaAiFQL1D2uUc8rpNKS45srutwKCzgbwEtiTsmkjAjHO43pI14iLWLQvHx6lJZnSXiEhes6QJChrQn1yeulLwQC3XEIvN80zZpO6BJExo8oWUUIzgCBqg6aoXoofYK3LYL/pufJf23j8fUOHAm8RscMJLl3Bj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(76116006)(91956017)(66946007)(55236004)(53546011)(6506007)(31686004)(31696002)(38070700005)(64756008)(66476007)(66556008)(66446008)(36756003)(107886003)(4744005)(6512007)(86362001)(54906003)(2616005)(5660300002)(26005)(186003)(2906002)(6916009)(71200400001)(508600001)(7416002)(4326008)(8676002)(122000001)(38100700002)(316002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Smh5MVpNK1V1Zm9iczdaSXlqWTRhNGt0Z0p6TGVYS3NrRExqa2pSV3dGRDlr?=
 =?utf-8?B?RTIxVEVKYTRPdXZtZmtiWE11Y3d6cU1XcW50TnRYZ0xMRk43NmY3K2tMOHRm?=
 =?utf-8?B?R2RuVGJJUEF6WDdGQ2dtTnFGMStSL1NMUmd2anRqQjZYQm1jaGRkQVBhT2Vp?=
 =?utf-8?B?Zy9MbHpLREpwVkFOaHp0eExRNFRIRmJXNXdtMzVVSGo1WWV0dE5MdUdOb29V?=
 =?utf-8?B?ZStSaFRKZmMyQVJwZWVvT1MzbjlzTFZreUNMbHU2dnNRUEVOdGV5UTdTUmFF?=
 =?utf-8?B?ZFVBY2JKMDBiN1RnUlh1QkREWGVuVmJaUXJ5dTJ3bURvaXBGenFUbTdXNnAx?=
 =?utf-8?B?UUVNUjlqREkxNHdxdHlFL1lkWFVKcjVxWE4vL0NaVFJDYmxQbC9JbEtML01L?=
 =?utf-8?B?dDF6UE50bU9NZkw5VWJYWUVwZ2hOU1RtelZOdytpdjZQSTdqM3ZJamQwZ2d0?=
 =?utf-8?B?VkRJMDZXR2dUcXNBYkJYVWVBb3hzWDJwdUpOTU92dnJSaTlCV2NpNzFGTmJj?=
 =?utf-8?B?TURYeW1oWW1MUnJXNldDdUQzWGhMRXZlSjA5S0dVcXYwRUo0M01URnF3c0Qw?=
 =?utf-8?B?TkprdWhsZndENDc3MzhWc0NuU1B1SzNkYlZObU9lblFCM2tVYUpBQW1QQnFo?=
 =?utf-8?B?VzJoaFVMNm9kV1JVQzYrd1Z1ZHdHd0dTT1B0T3NLRThSRjZNZUdXSU5rUXAx?=
 =?utf-8?B?NTVrMGNzaW0vVTZvWitqTk1rK1FIRFkxa1NOK1ZvYXBZaW56dnorekcvQjc0?=
 =?utf-8?B?b29qaXBPb3ZIMG1DUEVHWTZZdS95aGdRc3B3c0c1djJkbmtIblFBM3EwUW9s?=
 =?utf-8?B?cnVFeTE1VjRndmFBRGh2SW04SG5KZTJ1MFVDYUs1djI0Z29kOHN4UXJQamEr?=
 =?utf-8?B?eGFidjFuYnAzR21ybmxjZEIvVm1NSlBpbFpOWThFM3pHclpDWnQ1dnBubFB3?=
 =?utf-8?B?T1cyY1Iwd0hBSUtPOUswc29GVVQwSVFueVMxNWIvcTBubDBjQWlhS05USDNk?=
 =?utf-8?B?ajhZaVVhekR0STRWdG5GRmpFR0V4OW9qaDVnQXdnbTk1aDNEK05WaXF2WUht?=
 =?utf-8?B?Y2RCK0liaWtkd2FmTlJMVXNRb3FzUzFHMHBCakRrWU5jTll5RmZFdHZZdmFt?=
 =?utf-8?B?dzZUV3pHa0dZUzNlTVB1S2dTR0RpODJLY1BDeldJbXNERlpOOHBHZmlGNVIz?=
 =?utf-8?B?RlVucFlIb296VituQ1hwWHJOMWg5UGtMdHhkMzcyL3ROTzVVRCtvR3ZVMFRX?=
 =?utf-8?B?SlIxRHRYT0hDdWx6NGlzdko4cU11OG1JNXRzajdEa2lYU3IvcC9HcXhXZVkz?=
 =?utf-8?B?dEkxRlhiZ0pYUnMrTDd1aFJ2ZW15L0VEbyt5RmVQMkd2YTZja1orWUZWbHJG?=
 =?utf-8?B?aVc5aFc5MEVGM24vSnhXaHVPZVFUU2s4elkrRmdGNzlUN0lKdXh4WEdIM1l5?=
 =?utf-8?B?V3B2Y0ZSc0N5WnltT2x3VlJGSzl5d1VDdGRTRk9hQnB3cW1yNEtjbWhPZVFW?=
 =?utf-8?B?YWlhT2VYT0VRY1p3SFVQTUhueE5GUFhqTWU0YjVJQmd5OUhSOHJLdER0NENn?=
 =?utf-8?B?d1N5d1VzL3FKbGgyd2d1dzk0L2RCMmx3aDR4UmZHS0swaFdxWG1GOVVPR25X?=
 =?utf-8?B?UXNYR2ZqYkFNMmNuc2Fkd0N0RDV4QVZXbEc4SHZtYzQ1UTd4T0F3UjUrSUlx?=
 =?utf-8?B?SWdaMGlpekFobGUraWJ6SFdCb2M5Y1ZDanVPTGdYSmEyTnNvSmxNNkJkQmps?=
 =?utf-8?B?KytGWGE0MHJUUnlRUU9nSFFaRnEyUEFySFRWalhxcllCa1hjQ2xldDA2UUpp?=
 =?utf-8?B?T3lwMHhNQ3phUGFxWW10Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53597041E98CDB4C8627A2C7DB49ADE6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0009c663-8e89-4fb0-a295-08d98cd27465
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 16:16:17.2190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apABaO7EENzQ/NklDXR4ahC16pXCX2ii5VmI7MuXqSQNjGbiBZB2HIrHxzuPO4AoOQ1HExf7b/RFnjoGTGnNkhY5UujSZfbdiB6Lor5/xdaF1rlVkb3Qh0odqV3wQT/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-ORIG-GUID: 2igyoJ1BuCEjTW1kLkRWxipnt1v7ubIf
X-Proofpoint-GUID: 2igyoJ1BuCEjTW1kLkRWxipnt1v7ubIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxlogscore=847 priorityscore=1501 impostorscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110096

SGksIEFudGhvbnkhDQoNCk9uIDExLjEwLjIxIDE5OjExLCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMDgsIDIwMjEgYXQgMDg6NTU6MzFBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhlIFBDSSBkZXZpY2UgcmVt
b3ZlIHBhdGggbWF5IG5vdyBiZSB1c2VkIGJ5IFBWSCBvbiBBUk0sIHNvIHRoZQ0KPj4gYXNzZXJ0
IGlzIG5vIGxvbmdlciB2YWxpZC4NCj4gSXMgdGhlcmUgbWF5YmUgYSBwYXRjaCBvciBhIGNvbW1p
dCB5b3UgY291bGQgcG9pbnQgdG8gd2hpY2ggc2F5IHRoYXQNCj4gdGhlcmUgY2FuIGJlIFBDSSBw
YXNzdGhyb3VnaCBvbiBQVkg/DQpVbmZvcnR1bmF0ZWx5IG5vLCB0aGlzIGlzIHdoYXQgYWxsIHRo
ZSBQQ0kgc2VyaWVzIG9uIEFybSBhcmUgZm9yDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiBB
Y2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4g
UmV2aWV3ZWQtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gVGVzdGVk
LWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4gSW4gYW55IGNhc2UsDQo+
IEFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NClRo
YW5rIHlvdSwNCk9sZWtzYW5kcg0KPiBUaGFua3MsDQo+DQo=

