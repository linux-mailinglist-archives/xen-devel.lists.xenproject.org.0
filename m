Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD030419116
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196549.349441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmIj-0004YH-1g; Mon, 27 Sep 2021 08:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196549.349441; Mon, 27 Sep 2021 08:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmIi-0004VY-Un; Mon, 27 Sep 2021 08:47:52 +0000
Received: by outflank-mailman (input) for mailman id 196549;
 Mon, 27 Sep 2021 08:47:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUmIh-0004VS-Ce
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:47:51 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89f6f099-05d8-4638-a6ee-8d9d986ad72a;
 Mon, 27 Sep 2021 08:47:50 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R70bNX026217; 
 Mon, 27 Sep 2021 08:47:47 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bb96mgehh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 08:47:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 08:47:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:47:45 +0000
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
X-Inumbo-ID: 89f6f099-05d8-4638-a6ee-8d9d986ad72a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn1uJpqLqNhQSmpZywtc/kcWKi/C0ES5AZw85Vj55rltzEICCbW70vh73dGauFTvVrUfLLopOlekmHbUpxEFUZTt/M3+S5WY5iM9CmtOdrS1e2Z/whvLZydTcXlkhHvWqtBYZBvxJAVwrn+Ijk0T0LbTL/p26JdtHj5WdCl8IkBo+4vACQ0oUaDOGIPTMCUIFrepSrfRV+C0eefU/cjefIpQcUzsUoup8cnfF7jy+l4vQrw2jtl+lUUDkLhEYU5/rp9spYbSe/9/lBpc8LKdjWLJuu3X6/Ke8oB9bEZolA03lxV2y4fiUoMzX5ZNkB3IlYthwb/6hRwjmYtZLVirEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zoFPAhxzEd2nryFaPLGz3Dx6D3fkNJesHTJ3hanOgN0=;
 b=Szt6jZING72GHUjCMexYQY4HIR6JIPc5NDy1FSIvjZU+51sGpwqNJx+h2K46vkyQ87478JxnXOj10oib05CU4yJFhqiFgvUapyBF2keqs/gRcu/veMf8ggLa4pGYXOdbMWw2QG6vAVW2o5gRheH5UiUD3kjPJO54R/1zPYK58xN/2Fc30VdoR2m5brAZ6jBbBFwbZcqZ3xQTnhfy4PF9YmDSyyJOA9v8tpgKWWy+Ps2mF4KjfWDV47bg/NJ3hP1V7bhrhorZLOTq58QJIe9DRPc77Uvj8w93e0jR+oiCa9isqm/HwEUC9P43BNLuKyE7j5k29YlT2XFguiqRU2pGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoFPAhxzEd2nryFaPLGz3Dx6D3fkNJesHTJ3hanOgN0=;
 b=lBf6U5tA5zmeYzHN6KFOjdbxuzbiV1x71f31YsIXf562gcVk5Uy4r4lYfqtDqtD/Od66yAlJYuYOHuvHp2bk4iKobVlSzPJV95UcgS0DXErPCCm5PPVH/FfvQp7sghKYakSB8pp7faKYaOj3KDFuWKwz2TiO8mLpbggSb4PaOXVTlGJHJNpFdaRJJRi/DR0IVmTu/ZAvVfdImtLgIXWT/8ZnlTo6piKTh37CE9fu+Q2iFGR72HJn1yxSG+XMZi4/P3WAtVUcZfCr9cF9w90p8LsGGW4vJRZ8C+8JQoctXJ8AJnl9bj4VKIEJgvankmVBV4/0l0ZTGU+dcvdvuOFBnw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v2 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXsHo395a0MNZ4jUyUZjWX7U0qP6uz5McAgAOy8QA=
Date: Mon, 27 Sep 2021 08:47:44 +0000
Message-ID: <cf5e14a9-7bf0-6bf4-cf6e-3d85e0cdc6bd@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109241713160.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241713160.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 432c899c-1a2a-4650-07be-08d9819379af
x-ms-traffictypediagnostic: AM0PR03MB6324:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB63240AF5C2A1CAA89B0D7F99E7A79@AM0PR03MB6324.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Oz37YsfRqrNDKyYUbbaBe2fZHoHQZQG7ALwRuqGD/QQ6Ygj2Y1zR9yTvOem4Hwd1amQkPoVmZ7GDhIokJpnRKRW0taLDIZT33s0LfucRivPwZ7ZHmpluVCJXuehCYgDdXAuQssTa0fip/wFXBddXv+QjTCYu3JW7lwlk3I+jpVBmrVWRh1wJilF7Qn1AIEbT8XlnKusooW8cMk+zVs6ky+kqD4OhZ7/6jg+r/ZVo0bp0Mdkn//cgqmUbXpcTxw6CJf+ljTjYnmNlYZqUJ3QlrgLsrEVaDsJv9QVUQ7grvO2DAqvOyhK4t7I86ZuUHx7dyGf2AhwDg6mrejwmIcn95CZvv4cpdgXLpJWOZeobZTS2b3fUnd36IeNLgw+NDyaZ3tFPtzToyYQhcsoUU5T2vF5k6ANCXzzfu1FtcgTgZ8rwrnPSDTa6zPto9vHVGBydHxwxcXFqLQ7xJtmuLzgbplauj2QenwVH1Wea8MtI0nzo22D/N8QpyKC5Yu84tib3oL3hrGruLJFwrHqYLAlupy1Yki4oW5I8rwk4Losws6KASUA6BCFfZ9Er6YACZgf+JzCsNO0Eb4gQAFsnDg6VyV9YbLqmWwDD804pEs8YaOE+3zm6kOu55RE43X8RCtTnIti5qLhYBH3KofFK5zFc7tbbmzOvLIUCo4ObqYX3aEwIIAI1CXiquxsku1u5wOnr8ErciLhIiPkb21/MLZCO6g0ic6JYnmdOWx3O1fKrYqrOopvw8zaSC9lyUJgddPBwioKmJt4v5xipz/VCt18TGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(5660300002)(31686004)(66476007)(71200400001)(38070700005)(4326008)(66946007)(55236004)(86362001)(26005)(64756008)(186003)(36756003)(2906002)(8936002)(31696002)(66446008)(107886003)(508600001)(66556008)(6506007)(53546011)(8676002)(122000001)(54906003)(2616005)(316002)(83380400001)(6916009)(91956017)(38100700002)(6486002)(76116006)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eldGYjVtWERVZGJpLytrQWtjOXlFZURLanRIL0kyaWI3ZVlzYU5ZQWtKUzM3?=
 =?utf-8?B?YlhpamNmSTRKam16MmlZeTR0ZElBWlZqOGVhNEx1RHRzMTlyR0F2bEdjNDVt?=
 =?utf-8?B?T1VXaXZBRlR1ZDZTTzlEZHhsMHRIaFJlRG44UDNYcUlkSDhEUFBqZnVEODU3?=
 =?utf-8?B?OEhaSzQ4dlYzMis3NDR3UlNEUXBFUmdxZ2dDeFNDVUdOMTUwN2JSdEJHZjU1?=
 =?utf-8?B?alFma3l1TnRROEFGSSsrNHVlNzVINzJOTEg2U1BwNWFTWkhTSXQ0SmlFbEtJ?=
 =?utf-8?B?YnlYem1EK3ZuZCt3aUJWVjJVUHQ0NHhTcVhMa3hzOUlReGx1YVNhSlNuMC95?=
 =?utf-8?B?S2JaL29rZkx0elpEWDVGRzhlUDR4QWdLRVRtMXd2STVhUktVZmtqV0tvUEdL?=
 =?utf-8?B?OUJWM3BSUTlna1JKaVUyeXB5aWJOZ1IxM3pNQjFRNDlMc05LWWVrNkRYVlhm?=
 =?utf-8?B?S2xBK0R5TTF1TzhCTlFDSXJSeThnVWJsM2VzK1lRZC95NlNmSnA2Ympkc1Jt?=
 =?utf-8?B?Tm5qK1ZUd2x2dTh2aFBqYkw5MnRjSXJkWXZEMXdqVDlBeGpndFNtcVdYaGRi?=
 =?utf-8?B?NmxoWURtZ1VLK1M1TExVZzVmVEZvazdub0tMWGNEOG92NGt4bnZDYmd4RThs?=
 =?utf-8?B?aUQ2eVdXdGFkNFhIS1hCSk4rVWNzUWZjQ2VyQkp0YXRXaWhOSldpWEhQSUYx?=
 =?utf-8?B?cXQvbXQyWDkzOEdTRUJYR0pTbUpkU0FXYnlyOGpRODJETmxVOTNRUFhGS0VH?=
 =?utf-8?B?U3VKOXpWeTZ4YlU1c25rTmhvanZVWlFJbzNOclVxWkpvdzB3SU1TYk80dHlQ?=
 =?utf-8?B?OEtKVGxCUVZDa2RKMHRDNTlhajh6L1FqcnVHTmI0MHNzanQvVmJwanN3WEhJ?=
 =?utf-8?B?T0Z3OUc4dWdhWTRLcUg1ZjFZbXhjYmtDZ0gxNnNmaTRJblgyTzQ1dC8vendk?=
 =?utf-8?B?cVJ6Rkp4R0U2QTJNRE1McXBIbnBjcVlhaytoekhmUU1ZV01LQWg4SCtlTWxN?=
 =?utf-8?B?WFVlRFhtTzAwdk1jWElRSXhNS2gvRHVBem1uK0w0TXgyclY5eWYyK2hPOE56?=
 =?utf-8?B?N1EzQVBISC9ITDZoRnd6NWp0M1lwNXJieW9FTjZnOGZ4aW0xSFNhUkRtQWds?=
 =?utf-8?B?TmNSTk5FeGFhcTZ1Wk5Ebnh1cGEwZThqQm5HK3ZBSXBRcU02aWwzRDZEQ3FM?=
 =?utf-8?B?V3JGZFZ5cDBVei9DTUVZTFVYcUhLd1ArYXhNaGtPWXdXWCsxVVFqdTdlTEts?=
 =?utf-8?B?bkpGb1g3V1c3d3BoOFNIL0NpM1BSbXpMNG13L1gvV2RiekE0eUFzYk8xNHdT?=
 =?utf-8?B?dGZTM0pFOUJTcS9VT1BMS3R3MHhQb3BCM2NFN0xNYzU5YysvQnBJV0xUUFFG?=
 =?utf-8?B?eG8xbjl3TzRVSHVOS1QwZy9CT0tmSVRXc2w4TzFsblBZeWIyQXJUdlpGOUo4?=
 =?utf-8?B?RGpBTXpHS1lZbjN1YjUwcStvWFB0NXcrYUsyYlpacFhpRGk0Q25hRkh0aGJJ?=
 =?utf-8?B?V0RTelRmbm1DMjR4RW9nUVF1Nk9MZDdLUzRFWW5iK1puUUxQOXlvbldmcTM4?=
 =?utf-8?B?b0JjbTEzRTRNM1VGMmxaMVRqRTdDUEhncmVjREJXQkMyTDlneW93Sno1TnVV?=
 =?utf-8?B?eDZ0Yk9MYjF1NE9iZ3FzRldlQlA2enhkWGFZVHorZGd4REhxaEZjQ3Z5dWZR?=
 =?utf-8?B?OVNtNm02VC9kUWRiOGxpQjNaMDZuNVdhbjlRNnNaN21KSVI1WDc5bGk1WmVJ?=
 =?utf-8?B?UThlREc5OStaVTFlcHlCTE1Ba0U5TS9tTDE1WG16U20yL0MrMmo2azFDR0tt?=
 =?utf-8?B?VGlMUmJ1SFlteTYwcCs5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6849F60890C78D47A4DA762E4D6AF751@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432c899c-1a2a-4650-07be-08d9819379af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 08:47:45.0011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zl5TqUegq19Ym3NJkZ5jcy5lLkuUr++GsARzTmkPAzfOIrSdteYuvyId0AvddEsVz5VcHYUyD7zOJsYh2fvAhbg0t3UV/ZiXKYMFCfOnTeXT87R13V7PByChA2qrL+8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324
X-Proofpoint-GUID: b7dJLZLjP70zOVmVeLq1G_jKWQ2dKMIz
X-Proofpoint-ORIG-GUID: b7dJLZLjP70zOVmVeLq1G_jKWQ2dKMIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270059

DQpPbiAyNS4wOS4yMSAwMzoxOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDIzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+DQo+PiBJbiBvcmRlciBmb3IgdlBDSSB0byB3b3JrIGl0IG5lZWRzIHRvIG1haW50YWluIGd1
ZXN0IGFuZCBoYXJkd2FyZQ0KPj4gZG9tYWluJ3Mgdmlld3Mgb24gdGhlIGNvbmZpZ3VyYXRpb24g
c3BhY2UuIEZvciBleGFtcGxlLCBCQVJzIGFuZA0KPiAgICAgICAgICAgICAgICAgICBeIG9mDQo+
DQpBY2sNCj4+IENPTU1BTkQgcmVnaXN0ZXJzIHJlcXVpcmUgZW11bGF0aW9uIGZvciBndWVzdHMg
YW5kIHRoZSBndWVzdCB2aWV3DQo+PiBvbiB0aGUgcmVnaXN0ZXJzIG5lZWRzIHRvIGJlIGluIHN5
bmMgd2l0aCB0aGUgcmVhbCBjb250ZW50cyBvZiB0aGUNCj4gICAgXiBvZg0KQWNrDQo+DQo+PiBy
ZWxldmFudCByZWdpc3RlcnMuIEZvciB0aGF0IEVDQU0gYWRkcmVzcyBzcGFjZSBuZWVkcyB0byBh
bHNvIGJlDQo+PiB0cmFwcGVkIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluLCBzbyB3ZSBuZWVkIHRv
IGltcGxlbWVudCBQQ0kgaG9zdA0KPj4gYnJpZGdlIHNwZWNpZmljIGNhbGxiYWNrcyB0byBwcm9w
ZXJseSBzZXR1cCBNTUlPIGhhbmRsZXJzIGZvciB0aG9zZQ0KPj4gcmFuZ2VzIGRlcGVuZGluZyBv
biBwYXJ0aWN1bGFyIGhvc3QgYnJpZGdlIGltcGxlbWVudGF0aW9uLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4gVGhlIHBhdGNoIGxvb2tzIHByZXR0eSBnb29kLCBvbmx5IGEgY291cGxlIG9m
IG1pbm9yIGNvbW1lbnRzIGJlbG93DQo+DQo+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAt
IER5bmFtaWNhbGx5IGNhbGN1bGF0ZSB0aGUgbnVtYmVyIG9mIE1NSU8gaGFuZGxlcnMgcmVxdWly
ZWQgZm9yIHZQQ0kNCj4+ICAgICBhbmQgdXBkYXRlIHRoZSB0b3RhbCBudW1iZXIgYWNjb3JkaW5n
bHkNCj4+ICAgLSBzL2NsYi9jYg0KPj4gICAtIERvIG5vdCBpbnRyb2R1Y2UgYSBuZXcgY2FsbGJh
Y2sgZm9yIE1NSU8gaGFuZGxlciBzZXR1cA0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9kb21h
aW4uYyAgICAgICAgICAgICAgfCAgMiArKw0KPj4gICB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0
LWNvbW1vbi5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB4ZW4vYXJjaC9h
cm0vdnBjaS5jICAgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgIHhlbi9hcmNoL2FybS92cGNpLmggICAgICAgICAgICAgICAgfCAgNiArKysrKysN
Cj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaCAgICAgICAgICB8ICA3ICsrKysrKysNCj4+
ICAgNSBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gaW5kZXgg
ODU0ZThmZWQwMzkzLi5jN2IyNWJjNzA0MzkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gQEAgLTczMyw2ICs3
MzMsOCBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAg
ICBpZiAoIChyYyA9IGRvbWFpbl92Z2ljX3JlZ2lzdGVyKGQsICZjb3VudCkpICE9IDAgKQ0KPj4g
ICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICAgDQo+PiArICAgIGNvdW50ICs9IGRvbWFpbl92cGNp
X2dldF9udW1fbW1pb19oYW5kbGVycyhkKTsNCj4+ICsNCj4+ICAgICAgIGlmICggKHJjID0gZG9t
YWluX2lvX2luaXQoZCwgY291bnQgKyBNQVhfSU9fSEFORExFUikpICE9IDAgKQ0KPj4gICAgICAg
ICAgIGdvdG8gZmFpbDsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC1jb21tb24uYyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4+
IGluZGV4IDE1NjdiNmUyOTU2Yy4uMTU1ZjJhMjc0M2FmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC1jb21tb24uYw0KPj4gQEAgLTMwMCw2ICszMDAsMzQgQEAgc3RydWN0IGR0X2Rldmlj
ZV9ub2RlICpwY2lfZmluZF9ob3N0X2JyaWRnZV9ub2RlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+
ICAgICAgIH0NCj4+ICAgICAgIHJldHVybiBicmlkZ2UtPmR0X25vZGU7DQo+PiAgIH0NCj4+ICsN
Cj4+ICtpbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKHN0cnVjdCBkb21haW4gKmQsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCpjYikoc3RydWN0IGRvbWFpbiAqZCwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGNpX2hv
c3RfYnJpZGdlICpicmlkZ2UpKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRn
ZSAqYnJpZGdlOw0KPj4gKyAgICBpbnQgZXJyOw0KPj4gKw0KPj4gKyAgICBsaXN0X2Zvcl9lYWNo
X2VudHJ5KCBicmlkZ2UsICZwY2lfaG9zdF9icmlkZ2VzLCBub2RlICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgZXJyID0gY2IoZCwgYnJpZGdlKTsNCj4+ICsgICAgICAgIGlmICggZXJyICkNCj4+
ICsgICAgICAgICAgICByZXR1cm4gZXJyOw0KPj4gKyAgICB9DQo+PiArICAgIHJldHVybiAwOw0K
Pj4gK30NCj4+ICsNCj4+ICtpbnQgcGNpX2hvc3RfZ2V0X251bV9icmlkZ2VzKHZvaWQpDQo+PiAr
ew0KPj4gKyAgICBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2U7DQo+PiArICAgIGludCBj
b3VudCA9IDA7DQo+PiArDQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGJyaWRnZSwgJnBj
aV9ob3N0X2JyaWRnZXMsIG5vZGUgKQ0KPj4gKyAgICAgICAgY291bnQrKzsNCj4+ICsNCj4+ICsg
ICAgcmV0dXJuIGNvdW50Ow0KPj4gK30NCj4+ICsNCj4+ICAgLyoNCj4+ICAgICogTG9jYWwgdmFy
aWFibGVzOg0KPj4gICAgKiBtb2RlOiBDDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Zw
Y2kuYyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+IGluZGV4IDc2YzEyYjkyODE0Zi4uMTQ5NDdl
OTc1ZDY5IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL3ZwY2kuYw0KPj4gQEAgLTgwLDE3ICs4MCw1MCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1taW9faGFuZGxlcl9vcHMgdnBjaV9tbWlvX2hhbmRsZXIgPSB7DQo+PiAgICAgICAud3Jp
dGUgPSB2cGNpX21taW9fd3JpdGUsDQo+PiAgIH07DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgdnBj
aV9zZXR1cF9tbWlvX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkNCj4+
ICt7DQo+PiArICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqY2ZnID0gYnJpZGdlLT5jZmc7
DQo+PiArDQo+PiArICAgIHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdnBjaV9tbWlvX2hhbmRs
ZXIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2ZnLT5z
aXplLCBOVUxMKTsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gICBpbnQgZG9t
YWluX3ZwY2lfaW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICB7DQo+PiAgICAgICBpZiAoICFo
YXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgIA0KPj4gKyAgICBpZiAo
IGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+PiArICAgICAgICByZXR1cm4gcGNpX2hvc3RfaXRl
cmF0ZV9icmlkZ2VzKGQsIHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKTsNCj4+ICsNCj4+ICsgICAg
LyogR3Vlc3QgZG9tYWlucyB1c2Ugd2hhdCBpcyBwcm9ncmFtbWVkIGluIHRoZWlyIGRldmljZSB0
cmVlLiAqLw0KPj4gICAgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFu
ZGxlciwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9WUENJX0VDQU1fQkFT
RSwgR1VFU1RfVlBDSV9FQ0FNX1NJWkUsIE5VTEwpOw0KPj4gICANCj4+ICAgICAgIHJldHVybiAw
Ow0KPj4gICB9DQo+PiAgIA0KPj4gK2ludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxl
cnMoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIGludCBjb3VudCA9IDA7DQo+PiAr
DQo+PiArICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ICsgICAgICAgIC8qIEZv
ciBlYWNoIFBDSSBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24gc3BhY2UuICovDQo+PiArICAg
ICAgICBjb3VudCArPSBwY2lfaG9zdF9nZXRfbnVtX2JyaWRnZXMoKTsNCj4gTklUOiB3aHkgKz0g
aW5zdGVhZCBvZiA9ID8NCldpbGwgZml4DQo+DQo+DQo+PiArICAgIGVsc2UNCj4+ICsgICAgICAg
IC8qDQo+PiArICAgICAgICAgKiBWUENJX01TSVhfTUVNX05VTSBoYW5kbGVycyBmb3IgTVNJLVgg
dGFibGVzIHBlciBlYWNoIFBDSSBkZXZpY2UNCj4+ICsgICAgICAgICAqIGJlaW5nIHBhc3NlZCB0
aHJvdWdoLiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgZGV2aWNlcw0KPj4gKyAgICAgICAg
ICogaXMgMzIgYXMgdmlydHVhbCBidXMgdG9wb2xvZ3kgZW11bGF0ZXMgdGhlIGRldmljZXMgYXMg
ZW1iZWRkZWQNCj4+ICsgICAgICAgICAqIGVuZHBvaW50cy4NCj4+ICsgICAgICAgICAqICsxIGZv
ciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24gc3BhY2UuICov
DQo+PiArICAgICAgICBjb3VudCA9IFZQQ0lfTVNJWF9NRU1fTlVNICogMzIgKyAxOw0KPj4gKw0K
Pj4gKyAgICByZXR1cm4gY291bnQ7DQo+PiArfQ0KPj4gKw0KPj4gICAvKg0KPj4gICAgKiBMb2Nh
bCB2YXJpYWJsZXM6DQo+PiAgICAqIG1vZGU6IEMNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vdnBjaS5oIGIveGVuL2FyY2gvYXJtL3ZwY2kuaA0KPj4gaW5kZXggZDhhN2IwZTNlODAyLi4y
N2EyYjA2OWFiZDIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBjaS5oDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdnBjaS5oDQo+PiBAQCAtMTcsMTEgKzE3LDE3IEBADQo+PiAgIA0KPj4g
ICAjaWZkZWYgQ09ORklHX0hBU19WUENJDQo+PiAgIGludCBkb21haW5fdnBjaV9pbml0KHN0cnVj
dCBkb21haW4gKmQpOw0KPj4gK2ludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMo
c3RydWN0IGRvbWFpbiAqZCk7DQo+PiAgICNlbHNlDQo+PiAgIHN0YXRpYyBpbmxpbmUgaW50IGRv
bWFpbl92cGNpX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgew0KPj4gICAgICAgcmV0dXJu
IDA7DQo+PiAgIH0NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBkb21haW5fdnBjaV9nZXRf
bnVtX21taW9faGFuZGxlcnMoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIHJldHVy
biAwOw0KPj4gK30NCj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gICAjZW5kaWYgLyogX19BUkNIX0FS
TV9WUENJX0hfXyAqLw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5oDQo+PiBpbmRleCA1YjEwMDU1NjIyNWUuLjc2MThm
MGI2NzI1YiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgNCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgNCj4+IEBAIC0xNSw2ICsxNSw4IEBADQo+PiAg
ICNpZm5kZWYgX19BUk1fUENJX0hfXw0KPj4gICAjZGVmaW5lIF9fQVJNX1BDSV9IX18NCj4+ICAg
DQo+PiArI2luY2x1ZGUgPGFzbS9tbWlvLmg+DQo+IFRoaXMgc2hvdWxkIGJlIG5vIGxvbmdlciBy
ZXF1aXJlZC4NCkknbGwgY2hlY2sgYW5kIHJlbW92ZQ0KPg0KPg0KPj4gICAjaWZkZWYgQ09ORklH
X0hBU19QQ0kNCj4+ICAgDQo+PiAgICNkZWZpbmUgcGNpX3RvX2RldihwY2lkZXYpICgmKHBjaWRl
diktPmFyY2guZGV2KQ0KPj4gQEAgLTEwOSw2ICsxMTEsMTEgQEAgc3RhdGljIGFsd2F5c19pbmxp
bmUgYm9vbCBpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCh2b2lkKQ0KPj4gICB7DQo+PiAgICAg
ICByZXR1cm4gISFwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZDsNCj4+ICAgfQ0KPj4gKw0KPj4gK2lu
dCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCAoKmNsYikoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2Jy
aWRnZSAqYnJpZGdlKSk7DQo+PiAraW50IHBjaV9ob3N0X2dldF9udW1fYnJpZGdlcyh2b2lkKTsN
Cj4+ICAgI2Vsc2UgICAvKiFDT05GSUdfSEFTX1BDSSovDQo+PiAgIA0KPj4gICAjZGVmaW5lIHBj
aV9wYXNzdGhyb3VnaF9lbmFibGVkIChmYWxzZSkNCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHIN
Cg==

