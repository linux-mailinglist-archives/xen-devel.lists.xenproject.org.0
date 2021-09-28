Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B7341AF87
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198003.351289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCgc-0000T1-Fu; Tue, 28 Sep 2021 12:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198003.351289; Tue, 28 Sep 2021 12:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCgc-0000Qe-Br; Tue, 28 Sep 2021 12:58:18 +0000
Received: by outflank-mailman (input) for mailman id 198003;
 Tue, 28 Sep 2021 12:58:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVCga-0000QV-TC
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:58:17 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be8db59e-205b-11ec-bc8a-12813bfff9fa;
 Tue, 28 Sep 2021 12:58:15 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SCnMRh006226; 
 Tue, 28 Sep 2021 12:58:11 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bc3cv818s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 12:58:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4435.eurprd03.prod.outlook.com (2603:10a6:208:c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Tue, 28 Sep
 2021 12:58:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 12:58:06 +0000
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
X-Inumbo-ID: be8db59e-205b-11ec-bc8a-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3rJ0gcak0RMP+kRZxxofZ4TFcVU/L8lhy19a/H39EuLlBqUoDPWtfduELRxqXFqXFOlQfSGUYTIVlKN19VYgx/980w9mKuuQe9lDzDwMqedPA/lgm5EMN983rkaZeSMDtl3rN1R2SkKsLBR0zIALJbn0aLGF9BAqa6tgmeuBiW5kyi4BHliVQfC5plZ/yGG3ThURMETjR5mKMkV0LJtMDJq3G/rVkWNn+itFYY6s/d5lj8+UB6JN/VeHbLSdSmwAZJ6KxhyYAJSUkZzKIDzXFc+JhV4unKzk3KDY/r36USgZ5FVGvGA7qmQsuvmccIcO7i1ZT2kWho/dkKWTLbLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9jH0gqOOD1UJNMg5HtmMPrxSxjV+7hrmY6Y6Km41ztQ=;
 b=QsLr/yHXokHHYNm/nEqLp9QtrrwFf9lkbBozy4jXc4pmLoT+P1j4KlgBHc6D661Gf/QBAFlMtQpPAERQE1eefk/vNoluj2Hu+ML1oTSh65INYE69sG3mREIs+lOvzHmiw0EOEiTAyqSbxbc4d7hTdNMNL9M0/NRLGn3CfhD9neaQ/bWJIKoUNCDKBtcDkUqgU+Y9fVlJq86Cmuwp1n+05yMEExGa5QmVp91yAid8mg3YO4hxatcOxyxDXpy94PGUuqotkrppmhPmqp/tLe+Cr5Ygh1/wIw4ofjfQM0aDE1ltN8CwJPgdkxx7YRfguQmE28MpdxwWOq5ERF7ItVgG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jH0gqOOD1UJNMg5HtmMPrxSxjV+7hrmY6Y6Km41ztQ=;
 b=UimeZIFE217Jepp4Cgs+oNq3YUGcwz4V64SAkWd+/9UeWr7VEeD/8GDPwWxgBfWxDA7Vil1qXURlpBzGChO/4XSYMCEdhJJ+DaFIzdjmu3hyBF0T2EoL8QNGYkwbEBM5b/1Fj3VnUL939XRzdTtN8M196hGrOdiyE+Qb12xa8xwokzJQA/1xDlgZLkVNrAyDQAcJy94ef8Up+E/XrbQjSmusgekzwouA3ZsiEXFmpNoinJ8m0lJjK4fDYm/XXWi/BlvH/nb6VsB+jf9YRHqE3PKt13qmhwmP/sI3M8jBbqCVviRTz8MsEtpiQ6ERZtQjo6SuoffLJOafsQoNA/JPZA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyA
Date: Tue, 28 Sep 2021 12:58:06 +0000
Message-ID: <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
In-Reply-To: <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 965bed20-4e89-4ba3-6e2b-08d9827f9dce
x-ms-traffictypediagnostic: AM0PR03MB4435:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4435AA1AF6DF7684D96FA527E7A89@AM0PR03MB4435.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EWNyaBp1sNgfiM+Rf5GsslE/LLcqf/wd3SR8pqwmWRjiTHFckV8mX6T7O4gARmTE9Txpuj6RZeKWh6Jg/eykDPb7gNkQtiRP4AmMWI59/hjbNMWUESxj3Ztkdk3WevT7jZgN0kDSlqd1DFnYAA+TGBG+1crEhVBoqzGJ4fnRsTcTh9gKGS7wzQP4y7tsFqIKo54W/Ggbzmm4FCPXYJvIjxaLEU6mOFbbOmwVXEUuonZJXnr2gSq3Yo6bsnSvRkIxnmfhuvm9m2f1EhUabn/o4Yvhg/pku94kzYGcRUR7LCy47c34qNNfm9JWjh5SL8XwwDJIyfEhBP/RxzhDEg9l1D5QSFpHgIwqhDgZilphndcmFafeai4upkYkQIMdGr1/4Q+1exiCUwO6u3JGyaEXr7uFkcWXwaK2+PG0wh8odboEarczbeYIf2MgimPvrOUqTPvLF67Q+qyC5Se+6KSp4BX+n7/D0X0YUJfMkYtF+XaSsfT+PLFWk6TpblqD4EoVB3d3NWWOCMl8WUwUQL9DGG6gJP7qa33QyjaBAeeNAvAwFV3fSZGrh1k/UHLNthEj728Bzrxws4Ph7NgRl1hIqHdSyTlpOZfA3u6nrpuDWvpWl4nud4KMM6QB4UY8VwTa7J2glrMsOq/G7blfcwGweUZuKSJGqJqp94CgLz1UEgeP40P/5wdmw4rBjYwS8PyZcDddi+lmjsW+dAabwlTgPQxoi/rBz5r4AXTSaPzQZJC5jtpP8C2daPxW022P3YR1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(31686004)(83380400001)(86362001)(31696002)(316002)(6506007)(26005)(66446008)(64756008)(66556008)(66476007)(186003)(5660300002)(122000001)(55236004)(2906002)(6512007)(38070700005)(8936002)(71200400001)(76116006)(91956017)(38100700002)(53546011)(110136005)(54906003)(2616005)(4326008)(8676002)(6486002)(36756003)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SnA2TGFvT3BYNTA1aHoxZHJmUUVxRFJGQm0vRmd5N0RGR2ZFampjeW9DZmxp?=
 =?utf-8?B?Ym1VOGppY1hpY2cyYnVKVHlKeE5PYkNxb2JleHdBaGhBd2Vyd0FFeFAxMk9F?=
 =?utf-8?B?bzhrMVJ4THUxNTIzNGxKRHdMVmRyMTVuVGE5bzNNWEdmK1VZcWhNeGdGVzQ1?=
 =?utf-8?B?Z1pUZW9QblJpcGtXMkFENlp6TFMxNHZZUXp0RGM3dWNkRFFnQURrbkpJaVNV?=
 =?utf-8?B?TXhtZEJPdzlzU3htUFRaMXg4R08rQk8zckt0SDVvUmp4VE5oamxFZyt6R003?=
 =?utf-8?B?R28zR2cxaGNnVG50QnNhcm5pZEZsQVBNUDQxMEZYODBjcVluNEVhUGpTTU1F?=
 =?utf-8?B?U2g3U0NOWWFJY2FESWc5d2d6TDhiSy8zZXluaVRHZi9WUWtWdUVqdWlHYWR1?=
 =?utf-8?B?ZjA3Sk05V0g4T1VZYTlZUldvL0xSUUNLSmU4UFB1RUdteVFza1ZaajNyYlUv?=
 =?utf-8?B?YVlMbUVtUTZmUmVIOFZDVXZGRGdWNFcxeDRySVdLNWxWc0ZsYkN3RWdKYlhP?=
 =?utf-8?B?SndRbWh4c3dUVTdCYjNyZHpWcFJBRTUxQ0M4SlpjamUyZlA2VCt3eWQ2dVNF?=
 =?utf-8?B?NmdCYS9obVJLUEJMZDVucXBwWUZIdWNzQXlJRkZiQnpEenlubUhUcjlud0NM?=
 =?utf-8?B?N29MSXQ1VEwwR3c4NHlvTWxoSkY0TCtWbG1TM0JLQm9odndUaEQ3b2QrYjl5?=
 =?utf-8?B?NUtQUkVVZjk3K1lFREdEbjRIM1ZoOWNPSEljM2YyY1ZnUEFMUUwyNXloTlVn?=
 =?utf-8?B?T3FOZlNOTTEvRXVsRkJyeGtOOEJiQis4K0tKNVd0cjBqa014STMxL2craG55?=
 =?utf-8?B?Uk5jeVpLaTUxU3had2w5cVBwT0lVWGNTTDhyM3gwb0c4UzhIUUxDcHJaVGhQ?=
 =?utf-8?B?SjUxalRYaU44d3I1SmVjb0FKOHBMOFVzOFpHd0I4UGpoWk1PMlR3bTV1UzJu?=
 =?utf-8?B?Ym9jUjE4MisyeEZEUjdQQXNyYlBKMlB4ck42RGFjZlVKaFNWeis0eWJpNm02?=
 =?utf-8?B?TlJmVUdzT3JzT2lDUlhKaHp5ZXFyMXl0TlltaFgxRVNhT1BsMVRxWjVoVUU5?=
 =?utf-8?B?Vjdydmt0ZEp5b3hkYlE4bnpZZGcwZTNzV1M5dVNzNkd5aVlIeTZBQ1d0TDB6?=
 =?utf-8?B?OXpHV0pvU0QwVDRYZURqQ2cxbFByZklOSW0xWlc3ZW12MU54anpxYkFUY2dx?=
 =?utf-8?B?eE9CUG1wTVhHVDNxMkltM01DWW5PSEtXL1FoRGdsK3N0eHB1cDdhRDZLRUtF?=
 =?utf-8?B?R210alIxS0FyMGsrNnFHMVgyNnhKQ0wyRVBsaElReXd6UkJ1MGpSZUpGaDhr?=
 =?utf-8?B?MWJ0WTJXS1FEaGtDQmk1V2NnTEhVN0FGeDlMejdIRStPUk1qSjk3bDZjZDJk?=
 =?utf-8?B?SU1SbS83dWJaNFhZMDN2dEN2TGpJUU0xWng5Z2FFTzVvaW9ScEl6MUZSTHFr?=
 =?utf-8?B?c0JyVE9zcm91L0Q3NWxDVU9ZYkVsaU5KYnRhQlVNeXg3VVRaOUtwV2k5V3pW?=
 =?utf-8?B?R3Z2UGZVR2FKTkhiZkc0Mmtxd3FTTkJwOWR0Y0E1SVJUNk1WSVlqbnFLTGhX?=
 =?utf-8?B?S1FmRVpxZE9LU1FDRm1EMU5lbGRqa0pkakVuWklxejdhd1FacHVHWmM1dk1s?=
 =?utf-8?B?RGRRSjlyQ2dEZDhjNndjd2xMdFJETjM3VnQrVzVBSXJmbmM4MkpDRkxEVDFy?=
 =?utf-8?B?SFB6NTJyd0RwSVFqTWlNQlg3Y25BaHhpT0ZmUWtHK2ZCVm9vdG5yTTZualN0?=
 =?utf-8?B?bm9ia2dNUmxGcXRKbzMzVjk1Y2piejlGS3ErZnNaSkpLdFB3dDBNNGZNU1pD?=
 =?utf-8?B?OGhBaUFqaXYxTnI1VUZ1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <739A8BB36D1C8C42BA64F6776339AB2A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965bed20-4e89-4ba3-6e2b-08d9827f9dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 12:58:06.8181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tw6iTRh2lXPi6vrjF37Cc9Hfn6GLTFwUvV02GWPNvhD69MC4p04n4cOH7J8szJHwltGT4QrOPhq8eY5BrNlLdUP0kOlrfhMXNsmUpN3zIItu4pDJTnL7UKUoOMVi1pSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4435
X-Proofpoint-GUID: L2rjqNUkkc5Asi0e61S4kbsaPauqD51o
X-Proofpoint-ORIG-GUID: L2rjqNUkkc5Asi0e61S4kbsaPauqD51o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109280074

DQpPbiAyOC4wOS4yMSAxMToxNywgTWljaGFsIE9yemVsIHdyb3RlOg0KPg0KPiBPbiAyOC4wOS4y
MDIxIDA5OjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDI4LjA5LjIwMjEgMDk6NDgsIE1p
Y2hhbCBPcnplbCB3cm90ZToNCj4+PiBPbiAyMy4wOS4yMDIxIDE0OjU1LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gQEAgLTgz
Myw2ICs4MzMsNjMgQEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTgg
ZGV2Zm4pDQo+Pj4+ICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICAgfQ0KPj4+PiAgIA0KPj4+PiAr
c3RhdGljIHN0cnVjdCB2cGNpX2RldiAqcGNpX2ZpbmRfdmlydHVhbF9kZXZpY2UoY29uc3Qgc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+PiAr
ICAgIHN0cnVjdCB2cGNpX2RldiAqdmRldjsNCj4+Pj4gKw0KPj4+PiArICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkgKCB2ZGV2LCAmZC0+dmRldl9saXN0LCBsaXN0ICkNCj4+Pj4gKyAgICAgICAgaWYg
KCB2ZGV2LT5wZGV2ID09IHBkZXYgKQ0KPj4+PiArICAgICAgICAgICAgcmV0dXJuIHZkZXY7DQo+
Pj4+ICsgICAgcmV0dXJuIE5VTEw7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK2ludCBwY2lfYWRk
X3ZpcnR1YWxfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIHN0cnVjdCB2cGNpX2RldiAqdmRldjsNCj4+Pj4gKw0K
Pj4+PiArICAgIEFTU0VSVCghcGNpX2ZpbmRfdmlydHVhbF9kZXZpY2UoZCwgcGRldikpOw0KPj4+
PiArDQo+Pj4+ICsgICAgLyogRWFjaCBQQ0kgYnVzIHN1cHBvcnRzIDMyIGRldmljZXMvc2xvdHMg
YXQgbWF4LiAqLw0KPj4+PiArICAgIGlmICggZC0+dnBjaV9kZXZfbmV4dCA+IDMxICkNCj4+Pj4g
KyAgICAgICAgcmV0dXJuIC1FTk9TUEM7DQo+Pj4+ICsNCj4+Pj4gKyAgICB2ZGV2ID0geHphbGxv
YyhzdHJ1Y3QgdnBjaV9kZXYpOw0KPj4+PiArICAgIGlmICggIXZkZXYgKQ0KPj4+PiArICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4+Pj4gKw0KPj4+PiArICAgIC8qIFdlIGVtdWxhdGUgYSBzaW5n
bGUgaG9zdCBicmlkZ2UgZm9yIHRoZSBndWVzdCwgc28gc2VnbWVudCBpcyBhbHdheXMgMC4gKi8N
Cj4+Pj4gKyAgICAqKHUxNiopICZ2ZGV2LT5zZWcgPSAwOw0KPj4+IEVtcHR5IGxpbmUgaGVhciB3
b3VsZCBpbXByb3ZlIHJlYWRhYmlsaXR5IGR1ZSB0byB0aGUgYXN0ZXJpc2tzIGJlaW5nIHNvIGNs
b3NlIHRvIGVhY2ggb3RoZXIuDQpXaWxsIGFkZA0KPj4+IEFwYXJ0IGZyb20gdGhhdDoNCj4+PiBS
ZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYXJtLmNvbT4NCj4+Pj4gKyAg
ICAvKg0KPj4+PiArICAgICAqIFRoZSBidXMgbnVtYmVyIGlzIHNldCB0byAwLCBzbyB2aXJ0dWFs
IGRldmljZXMgYXJlIHNlZW4NCj4+Pj4gKyAgICAgKiBhcyBlbWJlZGRlZCBlbmRwb2ludHMgYmVo
aW5kIHRoZSByb290IGNvbXBsZXguDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgKigodTgqKSAm
dmRldi0+YnVzKSA9IDA7DQo+Pj4+ICsgICAgKigodTgqKSAmdmRldi0+ZGV2Zm4pID0gUENJX0RF
VkZOKGQtPnZwY2lfZGV2X25leHQrKywgMCk7DQo+PiBBbGwgb2YgdGhlc2UgY2FzdHMgYXJlIChh
KSBtYWxmb3JtZWQgYW5kIChiKSB1bm5lY2Vzc2FyeSBpbiB0aGUgZmlyc3QNCj4+IHBsYWNlLCBh
ZmFpY3MgYXQgbGVhc3QuDQo+Pg0KPiBBZ3JlZS4NCj4gKigodTgqKSAmdmRldi0+YnVzKSA9IDA7
DQo+IGlzIHRoZSBzYW1lIGFzOg0KPiB2ZGV2LT5idXMgPSAwOw0KDQpPdmVyZW5naW5lZXJpbmcg
YXQgaXRzIGJlc3QgOykNCg0KV2lsbCBmaXggdGhhdA0KDQo+PiBKYW4NCj4+DQpUaGFuayB5b3Us
DQoNCk9sZWtzYW5kcg0K

