Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22544B0997
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269693.463775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5pN-00067P-3c; Thu, 10 Feb 2022 09:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269693.463775; Thu, 10 Feb 2022 09:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5pM-00064w-VR; Thu, 10 Feb 2022 09:33:24 +0000
Received: by outflank-mailman (input) for mailman id 269693;
 Thu, 10 Feb 2022 09:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06a2=SZ=epam.com=prvs=40400e4a88=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nI5pL-00064l-Aw
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:33:23 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ba1909d-8a54-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 10:33:21 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21A9Wppa027255;
 Thu, 10 Feb 2022 09:33:17 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e505wg02y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 09:33:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2737.eurprd03.prod.outlook.com (2603:10a6:200:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 09:33:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 09:33:11 +0000
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
X-Inumbo-ID: 7ba1909d-8a54-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDYhr0/lwaCl8L4bf0Fy0/OfZ38GhUgRCm4SjOkn9CCjfUW44KC8JwoFZvhrh+Rr0i97OkctQbblHtIOKxmuoJVjoj30MdKtNbMfjjFQQmn+/kJXegnU8AAQEVKcSPTPYEuuXJ3SrY2vRF8iRn06O2DAt/83Qhaq5uhue2or5mE3fBuPXi6HdgxY0W4+gcMctotVnGAFlbbSGX5h8ZrAf/McxsJXn5I/Jp4OVtPJFe+H+hg2sLjpE2ZwO2cR8xp9bu5b/exANHAHWEoqP+df0LN2NRknPFtCrTCgxKhMhd49TuIDuZ7VEzMqbJgfItfn0qmucNE7pDb3Ht1C/wNJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AWZklPvT+Oqt/1kAYGCWPTsjapzXc4sYaWKVMNRhbk=;
 b=IXVpobNoyUiELRWjXiefDHo1vcTH39lpumucYATfwEU0lbeVIerdBC9pxZCG+Z/AGDYy5tp38J3OQcONLmIAahJkxtfzyPF3FEsMNHr7ZI0cMAJpnjpYY7vR92JGDKYgI1q9UL4KKF4/1aap5gRqJUHElc4DkDa+dW6MfZYAYuMXD/F2gf8nvvYJBqaMHQehbefkmU51MoXpcQc5VXcKGmgrezTIIOZYFgZfaIQIuBm8bbRPiIY/675mQCX8vDcmnlwPKPN2A0F4tmLwMtrCxB/CjGfXgcc/ePL9O8jbT07opyVOHkTOilnpCc6aixotkV5jjsE1UNSVpvyXkqKMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AWZklPvT+Oqt/1kAYGCWPTsjapzXc4sYaWKVMNRhbk=;
 b=Bea0z9a1RvlMaIs9Z1izgeBqPf3C448UOYhnYoxTdN9CYEEShp2RZa/6mjc6LS7xMBHE05qDAGF3dcKDUO1BP9UKPGaHvML8PAZsiVGxgKsuKb7xTQlYKbPqhvyzyzZnuq2ePtxY1V1Wa1XfaOnvS/pNiYMG2lDXP7vHh5Drwq0H54yfE9lLUGvEG1rX0nYM7IvNzBP8L4cqDedQCVI6nEdeen7FuLaFSwHxXL6qqwoYz/FEDA79jg4Ux1tx5WoNLamGcWyUi5usmL1KzK6Bz+fl4SE8GFSvnI4KXimbRqKh2pE7kt/aJQhLFOq8q0ITkdpWF+9ThOclWt4jv/nwZw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAIAABAgAgAADmACAAAHqgIAABl2AgAACJ4CAAAczgIAC8ScAgAAQ9ACAAAMVAA==
Date: Thu, 10 Feb 2022 09:33:11 +0000
Message-ID: <78229417-c648-4cd6-90a4-8701cc5243e1@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
 <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
 <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
 <cf584e13-f257-9355-50fa-c35e8fc8cf5e@suse.com>
 <a0015951-6eff-38a8-a9f0-bdbc8bd51940@epam.com>
 <51865693-1b5e-7ab5-f942-d244029c260b@epam.com>
 <874bdf01-3131-8ded-3c09-7a9d71d87e19@suse.com>
In-Reply-To: <874bdf01-3131-8ded-3c09-7a9d71d87e19@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0378eec-5755-4d98-43df-08d9ec785aeb
x-ms-traffictypediagnostic: AM4PR0302MB2737:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB27376F557993B2E2B1D04D47E72F9@AM4PR0302MB2737.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3GnhveVSzCtswdEFMHcsx0ad/mElI+LGHaWRj/gg1n77PfSrqWD0vJjEvZjjYwmOAXNxLef+8jAU7mtQXH8YoRIAgFuTMDHnkaYEEfzQfzKWtJOE6CAJ6ZjjDxAJqZQQnsd0iUeUijJ0wGwEI1wg411QA4yAA+2ZGjRZ5cRx7FH+1TWsCO9+Wq4Ac9R+SIxDmeaWNTMDl8T8BqiQIvnUh0wHd7Ps23TAlszpHFN4kc90ZXg68vEeDQtwVcTv8Eb6x8Pv6Bmt+Oz2O839dxQoN1/cWjqa48JD3S01ARBBFYWir5JZduxAxPIMncd164b+2bMGcIzdjnidfOs1WSSAOkr1PMa4cdr7sC39s45/TIUQwNJyfxCk2WAk7SvVCSCxO2f5/gpCdQp2lbZ+wj5JIUEnwlQ+KYDkSjb5u2eJAobPhiKaZyk9UyZy2YLgoFdSEqFIE/EK/0ul/N9gpDmrMlVlSroWNX18veU81tXBFCZnnfP9kgRh1qt30Z+A20ZqSLrcizFtRcl3f/A1mMKmH66yzyUt7lCUuL6WyX2bhWwWvkUMJ1+Z39ICYgBAGt83EzTqABNNmTM6dWmAqArTFDjZKShPhEovawRFAwRuS5Ornh5lvcitYajEU6m7nrdSnvxBylSYseGh+QRfGPFv31J0yBgpoYfWzx7mWzoLgMvScaZcCCicV5UH5f0GXxWgNw6Zy3LfG0RM6U75/VoDzQz7kBeWVWZPy1XqWxNYTWKDSupa6idT+lWG01S0qTi4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(8676002)(8936002)(66946007)(91956017)(6916009)(66446008)(316002)(54906003)(4326008)(122000001)(76116006)(66556008)(5660300002)(31696002)(38100700002)(38070700005)(66476007)(7416002)(6512007)(2906002)(6506007)(6486002)(186003)(107886003)(26005)(83380400001)(71200400001)(508600001)(2616005)(36756003)(53546011)(86362001)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SjdhMDg4amRWeVZIM202djE2M2pGOVdiRG8yaEFzTzR0cGp6QlRROWpsRWZH?=
 =?utf-8?B?MjFUT1IwSFpycHhQa2RRYXBNeHFidTlTTWJDU29RSkljS1JhZmhjRWowQ0Zr?=
 =?utf-8?B?WUt6Z285WC8wMjhRUHpjMHF3N3NRQW1VR3lOUVlVa1hEcnpwb1JTTVZtbkVS?=
 =?utf-8?B?VVNYR1hoUE1pVVZ4Ulpza3Fib2dQbmlpR3E0VU4yUU5Cc3hTeXRUV3BtT3Iw?=
 =?utf-8?B?WHQzZ2xjcmNVMnNZdExGRXg5c3A5djV4S1JuYkNFK3lDMzFLZ0l3T3RtY2pa?=
 =?utf-8?B?NXUvdDV2UnFiSzlZa2JVQ0tFWlpJeGY0SHZmZFVmYmpOV1h0MnZIRnl0WHpj?=
 =?utf-8?B?Q3IrMzI1cDI2S2dEWGZFKytUWklsaVB4bmJLT3RCaWRGV21XdzFqdGg2V3Bj?=
 =?utf-8?B?M2UvTVpUdkFObmtqOWFCM3JRU3g2WnFqb1pYVnFDbVZhY05wQ3FnRGsveG1O?=
 =?utf-8?B?Y3k3UGZnTUVKTHBXd0pmYTR4OHM4N3o1cm5obHp5d0JWT1lUZUNVS3l2SmY1?=
 =?utf-8?B?SFNxNHhOdG5NVEJudnRCQ0RiNE1nNDNsS00xd2wyQ1ZYa2J2T3FMN09tWG84?=
 =?utf-8?B?U0V6U0tvY3hrNHFsN3ZqZGNOeEF6QTVmc1ZKQUpSMU1qNFUvN0ZsZ3VDRmI0?=
 =?utf-8?B?K3J3bjcxbEF1c2pPTFR6S29ra0lqMTV2VDM4MGMvQUNlWTJEVHE0akgwLzV4?=
 =?utf-8?B?MGs3UWdqZFJGL3RPd3ErbjcydW02MUZLek90NVdySUZjSzRrV3ZLZGxMUHYv?=
 =?utf-8?B?WkJnZUVXd3JsekZCRDJrTDdzWVRkWGs5TngwRzFsdWJoUXlRZjU5Q0p6QnJ2?=
 =?utf-8?B?MmtrVDlJdFMrZUhJSlFYNFlETFFwTFJTaUdqU0M1UlRVSjlhMm1uaFlTY1FB?=
 =?utf-8?B?cDZhYzRUUGs2RFA5cFJuUjk2MGltUmw4OGM0bnZ6VGlobWFCZ2liV1dSSm83?=
 =?utf-8?B?S0daR3hEOXQ5ZWF4U2hLb290YTlmWkJLVjJEOCtHT2oxVThpMUhQbC9YRk5a?=
 =?utf-8?B?MFNTcDFzNGc1VHFPaENTdjBkR1d5bU5YNStndHJXVllNd1pQVVQ5Q1FJa29W?=
 =?utf-8?B?QnZyUmlGMVRNc1FjejBQOFdNU3BDWStTc0g2MFpIbm9ucDFRNzBsNXM3MTNm?=
 =?utf-8?B?SVhDSGZmWVVPQy95VVQwckVVc2Z3cUNEWmpRVEZid1FoUkJYblhIT3c0bDg1?=
 =?utf-8?B?YUpaV3U4S2oxK2lobmtoOHA3bzB4QXZuYU1paVNkempzMURlT1ExL0NyYlg1?=
 =?utf-8?B?YytyTHdkdG9UNkR0TVZrUnhCNFY1bmpVbVpTdmZPWHEwejdPbTNHZjZGYUdx?=
 =?utf-8?B?TGJMZ1VJazFobHcyVVFSbCtxMENwMndiYUcydkdDYmdjZGVkOTRNeHBDa3Fa?=
 =?utf-8?B?eWY0QzNkK2FUQjFXK284ZEg0ZTY5UWwvelBmT0ZrWnRpaURCR3JKcFB2NGxU?=
 =?utf-8?B?UldhRTRaRFRoSzA1L1Ywb2lnTTZPR3VNTXNUT283VUxubnRTdDRTZGRoelpP?=
 =?utf-8?B?dXBDenZhbzhkOW9IUXdwQXVtU1A2R2UvNUxPQ2xyN0dlcTFMcnRsb0VFQmhE?=
 =?utf-8?B?NVFKOGsxSnlKdG50UkRIMXV6R2lwVERzZ2VmQlpnRkFuZU00ZmhRWGZaWm1m?=
 =?utf-8?B?V2FveVlXRWpaSkJmejUzWEd3ZDI5S1FKdmMwMW5kY0llUWt6R3FZdm5va1lP?=
 =?utf-8?B?aGs2Qi82d3A3elBNUFBvVUt5UmhrM2t0b2Z4aS9uWiswdXRZZDRjaHdmb3Jy?=
 =?utf-8?B?endmNi92UCs1cG1QSXNjK2dTbE9Ya1Z1SUZ0cXB5Q2s2UmtjMklMTTU0alcz?=
 =?utf-8?B?cGlKUUFDZzFBdFlaMitDWEZZY1pQT0hhZGY4UVJjNlpTMnpVU2RxK0VPUito?=
 =?utf-8?B?VHdtbVdpV0ZQOGZQMG42cmxOTUdyQTYzSUNZWG5naHFsZnYySWI2b2pHT3RC?=
 =?utf-8?B?MWVXNlYrSzZsUlpjU3YweU5FT094b2lKb2s5TnY1Ykh3S3VERHo3RVZZM1lO?=
 =?utf-8?B?WWxMbC9ienNNeVBaZDZCcGR1bm5aWHN6UGpKam4vcExLaC93bVZleHRKMmhT?=
 =?utf-8?B?Z1FZTk1TZzVPL1JNWHVrcGpuQWllM1RtN1ZYUXZCb3NwajkvR0R3aUFOR1dZ?=
 =?utf-8?B?WUFjTGZ4Vi9XbVJ5WHlScEc0ZE1lTnp6N3FNM0pncWlnSVVFK1cwUjVXTU5C?=
 =?utf-8?B?RFpzYUtxelI5b2dMeTU4UDB5U1UwTURrRjAzTi91eE5vTlFjK2dXMWFic25q?=
 =?utf-8?B?WS9GclF0d0ZEaTJKZ25qMG1vTldhQ2hxdUVLOXo2SmRqMzQyQnZOODRGV2lL?=
 =?utf-8?B?TTJEaEQvWE45Q2VER1hITSt6Umh4L1E1aTFOK3NwdDY2RVErMDF3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CC59EFA266A844FAC1CE62461F8AC0A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0378eec-5755-4d98-43df-08d9ec785aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 09:33:11.4140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRIUkLIKE8fevgs2lTxQZyBfg2ut6zu09M/pW30v4HaKZ41/7QkMWxtkgcUHyT3KUDGJM/zXsRRX3SGMM9IR9yPE4eUPD75nngV8P6YASyfAzbUTcWPBOvyLOkmlVpkP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2737
X-Proofpoint-ORIG-GUID: kgpaNgPqu_PisF6EgsWoC9Mk0Jw7eRGO
X-Proofpoint-GUID: kgpaNgPqu_PisF6EgsWoC9Mk0Jw7eRGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100051

DQoNCk9uIDEwLjAyLjIyIDExOjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDIuMjAy
MiAwOToyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDguMDIu
MjIgMTM6MjUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDA4LjAyLjIy
IDEzOjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDguMDIuMjAyMiAxMTo1MiwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBUaGlzIHNtZWxscyBsaWtlIHdlIGZp
cnN0IG5lZWQgdG8gZml4IHRoZSBleGlzdGluZyBjb2RlLCBzbw0KPj4+Pj4gcGRldi0+ZG9tYWlu
IGlzIG5vdCBhc3NpZ25lZCBieSBzcGVjaWZpYyBJT01NVSBpbXBsZW1lbnRhdGlvbnMsDQo+Pj4+
PiBidXQgaW5zdGVhZCBjb250cm9sbGVkIGJ5IHRoZSBjb2RlIHdoaWNoIHJlbGllcyBvbiB0aGF0
LCBhc3NpZ25fZGV2aWNlLg0KPj4+PiBGZWVsIGZyZWUgdG8gY29tZSB1cCB3aXRoIHByb3Bvc2Fs
cyBob3cgdG8gY2xlYW5seSBkbyBzby4gTW92aW5nIHRoZQ0KPj4+PiBhc3NpZ25tZW50IHRvIHBk
ZXYtPmRvbWFpbiBtYXkgZXZlbiBiZSBwb3NzaWJsZSBub3csIGJ1dCBpZiB5b3UgZ28NCj4+Pj4g
YmFjayB5b3UgbWF5IGZpbmQgdGhhdCB0aGUgY29kZSB3YXMgcXVpdGUgZGlmZmVyZW50IGVhcmxp
ZXIgb24uDQo+Pj4gSSBkbyB1bmRlcnN0YW5kIHRoYXQgYXMgdGhlIGNvZGUgZXZvbHZlcyBuZXcg
dXNlIGNhc2VzIGJyaW5nDQo+Pj4gbmV3IGlzc3Vlcy4NCj4+Pj4+IEkgY2FuIGhhdmUgc29tZXRo
aW5nIGxpa2U6DQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+IGluZGV4IDg4
ODM2YWFiNmJhZi4uY2M3NzkwNzA5YTUwIDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+Pj4+PiBAQCAtMTQ3NSw2ICsxNDc1LDcgQEAgc3RhdGljIGludCBkZXZpY2VfYXNzaWdu
ZWQodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4+ICAgICDCoHN0YXRpYyBpbnQgYXNz
aWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1
MzIgZmxhZykNCj4+Pj4+ICAgICDCoHsNCj4+Pj4+ICAgICDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qg
ZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRv
bWFpbiAqb2xkX293bmVyOw0KPj4+Pj4gICAgIMKgwqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
Ow0KPj4+Pj4gICAgIMKgwqDCoMKgIGludCByYyA9IDA7DQo+Pj4+Pg0KPj4+Pj4gQEAgLTE0OTAs
NiArMTQ5MSw5IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1
MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+Pj4+ICAgICDCoMKgwqDCoCBB
U1NFUlQocGRldiAmJiAocGRldi0+ZG9tYWluID09IGhhcmR3YXJlX2RvbWFpbiB8fA0KPj4+Pj4g
ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGRldi0+ZG9tYWlu
ID09IGRvbV9pbykpOw0KPj4+Pj4NCj4+Pj4+ICvCoMKgwqAgLyogV2UgbmVlZCB0byByZXN0b3Jl
IHRoZSBvbGQgb3duZXIgaW4gY2FzZSBvZiBhbiBlcnJvci4gKi8NCj4+Pj4+ICvCoMKgwqAgb2xk
X293bmVyID0gcGRldi0+ZG9tYWluOw0KPj4+Pj4gKw0KPj4+Pj4gICAgIMKgwqDCoMKgIHZwY2lf
ZGVhc3NpZ25fZGV2aWNlKHBkZXYtPmRvbWFpbiwgcGRldik7DQo+Pj4+Pg0KPj4+Pj4gICAgIMKg
wqDCoMKgIHJjID0gcGRldl9tc2l4X2Fzc2lnbihkLCBwZGV2KTsNCj4+Pj4+IEBAIC0xNTE1LDgg
KzE1MTksMTIgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUx
NiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4+Pj4NCj4+Pj4+ICAgICDCoCBk
b25lOg0KPj4+Pj4gICAgIMKgwqDCoMKgIGlmICggcmMgKQ0KPj4+Pj4gK8KgwqDCoCB7DQo+Pj4+
PiAgICAgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoWEVOTE9HX0dfV0FSTklORyAiJXBkOiBhc3Np
Z24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGQsICZQQ0lfU0JERjMoc2VnLCBidXMsIGRldmZuKSwgcmMpOw0KPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIFdlIGZhaWxlZCB0byBhc3NpZ24sIHNvIHJlc3RvcmUgdGhlIHByZXZp
b3VzIG93bmVyLiAqLw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBkZXYtPmRvbWFpbiA9IG9sZF9v
d25lcjsNCj4+Pj4+ICvCoMKgwqAgfQ0KPj4+Pj4gICAgIMKgwqDCoMKgIC8qIFRoZSBkZXZpY2Ug
aXMgYXNzaWduZWQgdG8gZG9tX2lvIHNvIG1hcmsgaXQgYXMgcXVhcmFudGluZWQgKi8NCj4+Pj4+
ICAgICDCoMKgwqDCoCBlbHNlIGlmICggZCA9PSBkb21faW8gKQ0KPj4+Pj4gICAgIMKgwqDCoMKg
wqDCoMKgwqAgcGRldi0+cXVhcmFudGluZSA9IHRydWU7DQo+Pj4+Pg0KPj4+Pj4gQnV0IEkgZG8g
bm90IHRoaW5rIHRoaXMgYmVsb25ncyB0byB0aGlzIHBhdGNoDQo+Pj4+IEluZGVlZC4gUGx1cyBJ
J20gc3VyZSB5b3UgdW5kZXJzdGFuZCB0aGF0IGl0J3Mgbm90IHRoYXQgc2ltcGxlLiBBc3NpZ25p
bmcNCj4+Pj4gdG8gcGRldi0+ZG9tYWluIGlzIG9ubHkgdGhlIGxhc3Qgc3RlcCBvZiBhc3NpZ25t
ZW50LiBSZXN0b3JpbmcgdGhlIG9yaWdpbmFsDQo+Pj4+IG93bmVyIHdvdWxkIGVudGFpbCBwdXR0
aW5nIGluIHBsYWNlIHRoZSBvcmlnaW5hbCBJT01NVSB0YWJsZSBlbnRyaWVzIGFzDQo+Pj4+IHdl
bGwsIHdoaWNoIGluIHR1cm4gY2FuIGZhaWwuIEhlbmNlIHdoeSB5b3UnbGwgZmluZCBhIG51bWJl
ciBvZiB1c2VzIG9mDQo+Pj4+IGRvbWFpbl9jcmFzaCgpIGluIHBsYWNlcyB3aGVyZSByb2xsaW5n
IGJhY2sgaXMgZmFyIGZyb20gZWFzeS4NCj4+PiBTbywgd2h5IGRvbid0IHdlIGp1c3QgcmVseSBv
biB0aGUgdG9vbHN0YWNrIHRvIGRvIHRoZSByb2xsIGJhY2sgdGhlbj8NCj4+PiBUaGlzIHdheSB3
ZSB3b24ndCBhZGQgbmV3IGRvbWFpbl9jcmFzaCgpIGNhbGxzLg0KPj4+IEkgZG8gdW5kZXJzdGFu
ZCB0aG91Z2ggdGhhdCB3ZSBtYXkgbGl2ZSBYZW4gaW4gYSB3cm9uZyBzdGF0ZSB0aG91Z2guDQo+
Pj4gU28sIGRvIHlvdSB0aGluayBpdCBpcyBwb3NzaWJsZSBpZiB3ZSBqdXN0IGNhbGwgZGVhc3Np
Z25fZGV2aWNlIGZyb20NCj4+PiBhc3NpZ25fZGV2aWNlIG9uIHRoZSBlcnJvciBwYXRoPyBUaGlz
IGlzIGp1c3QgbGlrZSBJIGRvIGluIHZwY2lfYXNzaWduX2RldmljZToNCj4+PiBJIGNhbGwgdnBj
aV9kZWFzc2lnbl9kZXZpY2UgaWYgdGhlIGZvcm1lciBmYWlscy4NCj4+IFdpdGggdGhlIGZvbGxv
d2luZyBhZGRpdGlvbjoNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gaW5kZXggYzRhZTIy
YWVlZmNkLi5kNmMwMDQ0OTE5M2MgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IEBA
IC0xNTExLDYgKzE1MTEsMTIgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21h
aW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4gICDCoMKgwqDC
oCB9DQo+Pg0KPj4gICDCoMKgwqDCoCByYyA9IHZwY2lfYXNzaWduX2RldmljZShwZGV2KTsNCj4+
ICvCoMKgwqAgaWYgKCByYyApDQo+PiArwqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgICogSWdub3JlIHRoZSByZXR1cm4gY29kZSBhcyB3ZSB3YW50IHRvIHByZXNlcnZlIHRo
ZSBvbmUgZnJvbSB0aGUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZmFpbGVkIGFzc2lnbiBvcGVy
YXRpb24uDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRlYXNz
aWduX2RldmljZShkLCBzZWcsIGJ1cywgZGV2Zm4pOw0KVGhpcyBuZWVkcyBkZXZmbiB0byBiZSBw
cmVzZXJ2ZWQgYXMgaXQgY2FuIGJlIG1vZGlmaWVkIGJ5IHRoZSBsb29wIGFib3ZlOg0KIMKgwqDC
oCBmb3IgKCA7IHBkZXYtPnBoYW50b21fc3RyaWRlOyByYyA9IDAgKQ0KIMKgwqDCoCB7DQogwqDC
oMKgwqDCoMKgwqAgZGV2Zm4gKz0gcGRldi0+cGhhbnRvbV9zdHJpZGU7DQoNCj4+DQo+PiAgIMKg
IGRvbmU6DQo+PiAgIMKgwqDCoMKgIGlmICggcmMgKQ0KPj4NCj4+IEkgc2VlIHRoZSBmb2xsb3dp
bmcgbG9ncyAoUFYgRG9tMCk6DQo+Pg0KPj4gKFhFTikgYXNzaWduX2RldmljZSBzZWcgMCBidXMg
MyBkZXZmbiAwDQo+PiAoWEVOKSBbVlQtRF1kW0lPXTpQQ0llOiB1bm1hcCAwMDAwOjAzOjAwLjAN
Cj4+IChYRU4pIFtWVC1EXWQ0OlBDSWU6IG1hcCAwMDAwOjAzOjAwLjANCj4+IChYRU4pIGFzc2ln
bl9kZXZpY2UgdnBjaV9hc3NpZ24gcmMgLTIyIGZyb20gZFtJT10gdG8gZDQNCj4+IChYRU4pIGRl
YXNzaWduX2RldmljZSBjdXJyZW50IGQ0IHRvIGRbSU9dDQo+PiAoWEVOKSBbVlQtRF1kNDpQQ0ll
OiB1bm1hcCAwMDAwOjAzOjAwLjANCj4+IChYRU4pIFtWVC1EXWRbSU9dOlBDSWU6IG1hcCAwMDAw
OjAzOjAwLjANCj4+IChYRU4pIGRlYXNzaWduX2RldmljZSByZXQgMA0KPj4gKFhFTikgZDQ6IGFz
c2lnbiAoMDAwMDowMzowMC4wKSBmYWlsZWQgKC0yMikNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxf
cGNpLmM6MTQ5ODpwY2lfYWRkX2RtX2RvbmU6IERvbWFpbiA0OnhjX2Fzc2lnbl9kZXZpY2UgZmFp
bGVkOiBJbnZhbGlkIGFyZ3VtZW50DQo+PiBsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE3ODE6
ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDQ6bGlieGxfX2RldmljZV9wY2lfYWRkIGZhaWxl
ZCBmb3IgUENJIGRldmljZSAwOjM6MC4wIChyYyAtMykNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxf
Y3JlYXRlLmM6MTg5NTpkb21jcmVhdGVfYXR0YWNoX2RldmljZXM6IERvbWFpbiA0OnVuYWJsZSB0
byBhZGQgcGNpIGRldmljZXMNCj4+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTE4Mzps
aWJ4bF9fZGVzdHJveV9kb21pZDogRG9tYWluIDQ6Tm9uLWV4aXN0YW50IGRvbWFpbg0KPj4gbGli
eGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTM3OmRvbWFpbl9kZXN0cm95X2NhbGxiYWNrOiBE
b21haW4gNDpVbmFibGUgdG8gZGVzdHJveSBndWVzdA0KPj4gbGlieGw6IGVycm9yOiBsaWJ4bF9k
b21haW4uYzoxMDY0OmRvbWFpbl9kZXN0cm95X2NiOiBEb21haW4gNDpEZXN0cnVjdGlvbiBvZiBk
b21haW4gZmFpbGVkDQo+Pg0KPj4gU28sIGl0IHNlZW1zIHRvIHByb3Blcmx5IHNvbHZlIHRoZSBp
c3N1ZSB3aXRoIHBkZXYtPmRvbWFpbiBsZWZ0DQo+PiBzZXQgdG8gdGhlIGRvbWFpbiB3ZSBjb3Vs
ZG4ndCBjcmVhdGUuDQo+Pg0KPj4gQEphbiwgd2lsbCB0aGlzIGFkZHJlc3MgeW91ciBjb25jZXJu
Pw0KPiBQYXJ0bHk6IEZvciBvbmUgSSdkIGhhdmUgdG8gdGhpbmsgdGhyb3VnaCB3aGF0IGZ1cnRo
ZXIgaW1wbGljYXRpb25zIHRoZXJlDQo+IGFyZSBmcm9tIGdvaW5nIHRoaXMgcm91dGUuIEFuZCB0
aGVuIGNvbXBsZXRlbHkgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZQ0KPiBpcyB1bmxpa2VseSB0
byBiZSBjb3JyZWN0OiBZb3UgY2VydGFpbmx5IHdhbnQgdG8gcmV0YWluIHRoZSBvcmlnaW5hbA0K
PiBlcnJvciBjb2RlIGZvciByZXR1cm5pbmcgdG8gdGhlIGNhbGxlciwgYnV0IHlvdSBjYW4ndCBs
ZWF2ZSB0aGUgZXJyb3INCj4gdW5oYW5kbGVkLiBUaGF0J3MgbGlrZWx5IGFub3RoZXIgY2FzZSB3
aGVyZSB0aGUgImJlc3QiIGNob2ljZSBpcyB0byBjcmFzaA0KPiB0aGUgZ3Vlc3QuDQpPaywgdGhl
biBJJ2xsIGNyYXNoIHRoZSBkb21haW4uLi4NCj4NCj4gSmFuDQo+DQo+DQpUaGFuayB5b3UsDQpP
bGVrc2FuZHI=

