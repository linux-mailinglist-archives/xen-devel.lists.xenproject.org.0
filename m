Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE187586829
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 13:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378692.612032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITfs-0003wu-Qb; Mon, 01 Aug 2022 11:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378692.612032; Mon, 01 Aug 2022 11:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITfs-0003tQ-MV; Mon, 01 Aug 2022 11:33:28 +0000
Received: by outflank-mailman (input) for mailman id 378692;
 Mon, 01 Aug 2022 11:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xi4=YF=epam.com=prvs=0212f62cb2=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oITfr-0003tK-Cr
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 11:33:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfdcc1df-118d-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 13:33:23 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271BWghx013544;
 Mon, 1 Aug 2022 11:33:20 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hmsu3w5cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 11:33:19 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DB6PR0301MB2471.eurprd03.prod.outlook.com (2603:10a6:4:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 11:33:16 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5482.012; Mon, 1 Aug 2022
 11:33:16 +0000
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
X-Inumbo-ID: bfdcc1df-118d-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt2jFCEVuM2OYc9mLEVwkk7oKMgTMy4pXWbnJHH+njs8zWcPQAXdVPnJdygSKkAWeklndp/KawWOGaOU13crbJMaueUgfVZhWlXq8vBHlhaF2NYnwHyAQpfW6MVrv8d8yJ1t+ylqAQ627607UsmPOSU7uZ/ep2zwK4g7tastGYfM4QsR5aibbsf1Be+fXrsCZCVZhJU5piahH2dzyrQ8I8WoTeQQlqBQH3UUBx4e1vsh080P5cXQPnD1nkJsd04wtw2fNI3C0tJXOvJNtbTol9pxWn/pdtU6gieHI+tUzp6tJjgT1JwrEsUUyYAZ0otyD9ccFjEL3ulMH9tFYrXlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9GM8/PaGLbiCn+7mZuAkeKzw+BCrOyqvnJ+aj7hOkI=;
 b=V9M1woD4kODB3Egh+j+ROWFC5aIV/sivE78a5MHZJrr5zRexbkocVeh1WBH/lJkjTlnf9h1RlGS+vkkgpGhBJbOnKtfDF0N6d3nj2bjOqUcLxUmgGb8lqM9M4JEtBmVMyiJaxWdUJ+iAQz6x+TSVUnwdYtE2XoVdGAfSX9NMF6McebUi937dvkDOQmXdYcn5ZhMGXr2Xa78eroudkatl8u+B0Ha9GAAMfmnGXKC15HXHoe+J/qQoC7+8ut1MZ9KAjzpaJnl9B4iHUbMXDXpyOSQpcDd6EluA8bRXs1LFx8XVv+9n5OgzqlQGWyJVVoqwLWkda1ThBe/tggcqRPSZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9GM8/PaGLbiCn+7mZuAkeKzw+BCrOyqvnJ+aj7hOkI=;
 b=NwAVkgLRgqxRjYYEDql6ynRp7hPbr9P3stdVcPRTtbkA4x8XjWR5ISib48EXMcn0b01/Xviam7r42q2mgb6O1IiVhOTCFoV8ca4Qeux0FWY6pdlG4trSGiXklAd67e08JtM1JZOdhHVG5yl+qkNJrWC1Vx+FmAJHupBP952fUUuGxLnHomQUr/9U05usPBzNMldRJNk3ihD3G7dy+Hn3iSTJEb0VGzuVOZud9IX0tB6B5Ouf1qM9ckvDb0iolNpD6ZR27QSF8XpTBggZlvN0X1RO9bCrmncWHDNjumPVk33C2PPAtKdYqj6U78821LtTjOh+fcez7elKtiJ1wvFoyg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: =?utf-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
        Julien Grall
	<julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>,
        Oleksandr Tyshchenko
	<olekstysh@gmail.com>,
        "libvir-list@redhat.com" <libvir-list@redhat.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Thread-Topic: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Thread-Index: AQHYo2LxAJfFyrYZl0yAxDOX72EKfq2ZuUUAgAAHp4CAABWkAIAAF6SA
Date: Mon, 1 Aug 2022 11:33:16 +0000
Message-ID: <428c044a-48f3-7a4f-fe33-1a154c4dac14@epam.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
 <8947085c-bcc4-e599-0636-3a7f1f7b9ac6@redhat.com>
In-Reply-To: <8947085c-bcc4-e599-0636-3a7f1f7b9ac6@redhat.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42d81da2-fc45-4f12-453f-08da73b1a04c
x-ms-traffictypediagnostic: DB6PR0301MB2471:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ul9+2f7phXCh56jXEx37VQ4ZTxhABGfat7hJiWl69WwXPzQle6EVqTxma82biFJASzbWHgh9lIY1M80TH7r3KzDBdJ1FQaA8a5z9aoQfnxWwLSvceCtfQPyddhRTButAaWx4g1q2ZEVRms2rsg+J4HCVnmP4b6ljyRscXcG3TRhKFdJcMMLIW2NkuFn4i38wHKGAHIUKTezLE+AA/Qzo6PFZt7DV0iPZHvNrKTj8qiTTRCZH5CPGTe6WWP2Ov2fDyp43OSiUG9E/Iz/LEognCWm34Wy3XPJVHulXs3jjgXTqWrDOSxhI4bmW9Uvf/h7p5D4QzK6W/TEZQbqJ/42hosnI11Sz0eGJjg7vn8rrba5w+cZ+wqUfdIW9euZQLtljbHd6GYUrMrtuk0GoNVEJb/6A/6Z1mAOQ09UwZAn/YQ//SWmSq5tTW71AFYf8ARAkLWMxJFxaXm3n6870ytuokZMgFE34xbbyB3ul/KDUNUxhQx6nnrU3ltgTjU00eaMFgp+zxrxt4Uvqa6fU07vT3VOZz88BPqQL201f3FLSLf/2YLTHoiTzki4Y9ecJTDVhm+eBZSQBO0KHwG1lpucmHtX34lo8CNG04GQ+Qs5+GCG6OvjjD0OlExkgSoM9q3QhIhNeIIpCHUtIUwsVsUJpoSLcadB/tO0/cIzmrc6UC2m6uHbZ5n+TnfUX4eHEU+h4y04M2CxCB5e/ALwQ1gIyhz6N+t2JVpjTzAPsFzaGtDXVucP6jnMZzmqgzkbYbKnDbHOr6JqiQiijisw24mY116EmacCb6ArLR3UZiT4xbKhgX9Jqx1SnUWkG8Tl9RbRfvHmQEIFahZWTQWuhkcDUkLUEWFuZIYKnGJlbRkhGGs4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(91956017)(41300700001)(6506007)(186003)(53546011)(55236004)(66574015)(6512007)(83380400001)(26005)(2616005)(38100700002)(38070700005)(122000001)(8936002)(5660300002)(2906002)(36756003)(478600001)(86362001)(31696002)(6486002)(966005)(71200400001)(8676002)(31686004)(64756008)(66476007)(66556008)(66946007)(66446008)(4326008)(76116006)(316002)(110136005)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Uk5aQ1prckNyb3hoUkYvUjQwNEYvNkZLY0tiRkRORktlWlpkK3ZscGVqWGsr?=
 =?utf-8?B?bVl0U1pJVG8xMmc1RjUvUzBlb0wxSVZOa3FsWmdqU2JpUU5sRVljclZqK2xh?=
 =?utf-8?B?aVlvQ215cUFzakQ3QlhnZ1RDQ2Y0bS9zNFdaV1grTWVqUEp3WWNCa3lpZkRX?=
 =?utf-8?B?ZlpoK2YreWs5YjFSRHZreER1dnAvcDNHWG5OWktubUNjYncwSnVHUUJTUmJq?=
 =?utf-8?B?Mldvc09BSzU0OXVjQTgzOXdSTFcyM0ptVklKQ3crUXhSUnR0VTdXdGllTlkz?=
 =?utf-8?B?Z09Wd3FjMVpmMi9iUEZxbDBrYUgycDBTbEI0SzllV3JGWENJc1laa2JiRFIx?=
 =?utf-8?B?SjBBWFIvVFRiM0ZZemFEVTd1RTdndnIxSkxqM2ZzRGl3bjNZaitHOU5EaHlM?=
 =?utf-8?B?NE1zNkxiMjY2YjlzWURvcm9CQ281WmFRbnJEdDJWTEgzQlJmN0JFb1JQSUxB?=
 =?utf-8?B?UExnUzFnR3JDbkorcXZZSjZmL005ZHlCQjZYNlZ4SDZGL01xbElyQllXSjdS?=
 =?utf-8?B?WmNKellkVHNBK2NKSzA0WjBRRTg1M0RUV1lQMGRJZGNqQUU4Tkxyb2VZYWd0?=
 =?utf-8?B?Y2Q4TzFlV0FUbkgwbWdKN1hDUkJ6eUdLSzR4UE00YW1sUEoydVVhRE9nRGlt?=
 =?utf-8?B?YkRITEdndVVpR1c3YnlvajlOOUN5RXBvbi8zWmRyZU1GK0NBVHc0bnc3Nkhx?=
 =?utf-8?B?Wnkzbm9ISUtiR0Z6VjBwUUoxWitrcG8rKzVEYVdobWxnTU43Wi9NRjBVV3R5?=
 =?utf-8?B?S0hYOGdwNFU0THBhMHpoUWZxVUpiSWpicFV1QWlQWncwNTRsSDNtcDBPSnZo?=
 =?utf-8?B?Q0dDOWNxNEcxNkJBcUxBYU5pb0FXaVBuQ3NpNGRSTHFTUTVJL251aXVtQ09T?=
 =?utf-8?B?VWVVemd2TytWT0ZRc3JoaDhhSTRTcitUMnZCYmZlejFjTUxsWStxZjJsWXhX?=
 =?utf-8?B?LzA1bk82cVdpMDFWanR6cFVyOWNNVmtReVFjeDdYU2ROYks2RFZJd0puN0JS?=
 =?utf-8?B?YVpsenIzOGRQMVpBbXpuN3lBTmNMYlFtQmJkbExFTVY4ZE9JMDZVUGZxM2NP?=
 =?utf-8?B?VTJoS0haaXdIaG5UU1h0ZUQvZXVjUkRLaTc2aS9KY3ZMZkpKUTZBRkMrWWZ0?=
 =?utf-8?B?OFBwOW8rS25aMXYySEd3eHE4c2c2blRNb1hLdktINmJNT1JETmQ3d3FmRnRO?=
 =?utf-8?B?QUdBWFUzL3pvTzhQOXdGMmlyUjhRblJCazhnaE8yMUo3RHNnbGdzdTVyZlVU?=
 =?utf-8?B?R2NKUjJzZkdKU1ZqbDhuUVdyVk5SeStUQTR3RTJYSTVMMW12bXZER09xWGw2?=
 =?utf-8?B?WGlPYk9INCsxVWdtNTlnUTU5M1VhMnJ3ZzVObHZOZEkycHVIUks3bXVHWlIr?=
 =?utf-8?B?YTU0UVgxUDNDSVJ2Mm1xYkYyY0RYWmI1cmNIUitURDRvUFBBTlhCeFFTQjZE?=
 =?utf-8?B?U1N6blVpUGdGaDM1TnBmMndqd1ZoZUlQcUZPa2pqVXRUNlp0R0k4MU1vMFhW?=
 =?utf-8?B?aldwaXdRZzZPSU5mbW1ZZjVzS3VzWGFwQVkxZHFBKzRhRFZIVWNoMDdydE9n?=
 =?utf-8?B?OEQwQ1c2T21RYWdLK0NNMDQxcDA5R3NYcjVOeEk2LzU5ZncyY1dzY1lid0xk?=
 =?utf-8?B?TS9IZXQza20zbHgzVWtiQUMweDJRS2RneHZNZW03NzJoNGE3cUJrUVpWQ2hR?=
 =?utf-8?B?NWdaN2ZSY2hEZzdFSU9GNXF0K2xNR25RZ29lYTIzNXlDeXdOdDJITTRGeDhR?=
 =?utf-8?B?L3lHQ1Z0YWRjN2srT2ZhQjdvMUpoKzdMMHpiVGNLUTV5akdrbnBwc0YrNDVE?=
 =?utf-8?B?VW9zeDZOcXBWWGhYZk1KdGpsNTl2MDNLZ1VnYnhqSTdaeCtVQ2lqL3QxMEs1?=
 =?utf-8?B?aUZSaHhHRGR2bktKN1YwS0lyQTIwM0dZZ1FXYXRjZmgycW5yUC9qTVJnY1dK?=
 =?utf-8?B?UlBzRkQvVUpldnExcGx3eFptMGVENlVkRFhTeVlNTkdLc3UwWTgySU8wcE5R?=
 =?utf-8?B?ZjRFeUZDc25BUFY1Ni9WdGdFM3piNGhZbUdsMGY1b3dJMlZqNDN4RnR0V0R6?=
 =?utf-8?B?S2hIM3l1V2JJd0ZuMjdSSHhFWTM4dGVtVjBKbXNVaUZmY2tzZnJtVExuWnF3?=
 =?utf-8?B?M0YvclNFelpkNGJyME1XQVQrTzRoRzlvSDZ0emt6YjdZVFJzQUpNN2c0cUF4?=
 =?utf-8?Q?pgPyOZNUfxBCtsUy2hlDj3Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <689893587FE97743A71CA0369746F8DE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d81da2-fc45-4f12-453f-08da73b1a04c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 11:33:16.1792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RR1+fCM/w7JRsCjuJnuouAN5n/0BbvTziE2yUg5V4LUFellaAdPp/YDUA8beIi2E5sPwQdRUqr9uN1FxTpAye6xeLhPbvOyurV0z5nEUqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2471
X-Proofpoint-ORIG-GUID: qfSMtR7-gfWo1YYNuiIC_PmJB-ZM7pc2
X-Proofpoint-GUID: qfSMtR7-gfWo1YYNuiIC_PmJB-ZM7pc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010057

DQpPbiAwMS4wOC4yMiAxMzowOCwgTWljaGFsIFByw612b3puw61rIHdyb3RlOg0KDQoNCkhlbGxv
IE1pY2hhbCwgSnVsaWVuDQoNCj4gT24gOC8xLzIyIDEwOjUxLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+PiBIaSBNaWNoYWwsDQo+Pg0KPj4gT24gMDEvMDgvMjAyMiAwOToyMywgTWljaGFsIFByw612
b3puw61rIHdyb3RlOg0KPj4+IE9uIDcvMjkvMjIgMTc6NTAsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IFhlbiB0b29sc3RhY2sgaGFzIGdhaW5lZCBiYXNp
YyBWaXJ0aW8gc3VwcG9ydCByZWNlbnRseSB3aGljaCBiZWNpZGVzDQo+Pj4+IGFkZGluZyB2YXJp
b3VzIHZpcnRpbyByZWxhdGVkIHN0dWZmIGludHJvZHVjZXMgbmV3IGRpc2sgYmFja2VuZCB0eXBl
DQo+Pj4+IExJQlhMX0RJU0tfQkFDS0VORF9TVEFOREFMT05FIFsxXS4NCj4+Pj4NCj4+Pj4gVW5m
b3J0dW5hdGVseSwgdGhpcyBjYXVzZWQgYSByZWdyZXNzaW9uIGluIGxpYnZpcnQgYnVpbGQgd2l0
aCBYZW4NCj4+Pj4gc3VwcG9ydA0KPj4+PiBlbmFibGVkLCByZXBvcnRlZCBieSB0aGUgb3NzdGVz
dCB0b2RheSBbMl06DQo+Pj4+DQo+Pj4+IENDwqDCoMKgwqDCoMKgIGxpYnhsL2xpYnZpcnRfZHJp
dmVyX2xpYnhsX2ltcGxfbGEteGVuX3hsLmxvDQo+Pj4+IC4uLy4uL3NyYy9saWJ4bC94ZW5feGwu
YzogSW4gZnVuY3Rpb24gJ3hlblBhcnNlWExEaXNrJzoNCj4+Pj4gLi4vLi4vc3JjL2xpYnhsL3hl
bl94bC5jOjc3OToxNzogZXJyb3I6IGVudW1lcmF0aW9uIHZhbHVlDQo+Pj4+ICdMSUJYTF9ESVNL
X0JBQ0tFTkRfU1RBTkRBTE9ORScNCj4+Pj4gIMKgwqDCoCBub3QgaGFuZGxlZCBpbiBzd2l0Y2gg
Wy1XZXJyb3I9c3dpdGNoLWVudW1dDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN3aXRjaCAobGlieGxkaXNrLT5iYWNrZW5kKSB7DQo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fg0KPj4+PiBjYzE6IGFsbCB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycw0KPj4+Pg0KPj4+PiBUaGUgaW50ZXJlc3RpbmcgZmFjdCBpcyB0
aGF0IHN3aXRjaCBhbHJlYWR5IGhhcyBhIGRlZmF1bHQgYnJhbmNoDQo+Pj4+ICh3aGljaCBvdWdo
dA0KPj4+PiB0byBjb3ZlciBzdWNoIG5ldyBhZGRpdGlvbiksIGJ1dCB0aGUgZXJyb3IgaXMgdHJp
Z2dlcmVkIGFzIC1Xc3dpdGNoLWVudW0NCj4+Pj4gZ2l2ZXMgYSB3YXJuaW5nIGFib3V0IGFuIG9t
aXR0ZWQgZW51bWVyYXRpb24gY29kZSBldmVuIGlmIHRoZXJlIGlzIGENCj4+Pj4gZGVmYXVsdA0K
Pj4+PiBsYWJlbC4NCj4+PiBUaGlzIGlzIGV4cGVjdGVkIGFuZCBpbiBmYWN0IHdvcmtpbmcgY29y
cmVjdGx5LiBXZSB3YW50IGNvbXBpbGVyIHRvIHdhcm4NCj4+PiB1cyBhYm91dCBlbnVtIG1lbWJl
cnMgdGhhdCBhcmUgbm90IGhhbmRsZWQgaW4gYSBzd2l0Y2goKSBzdGF0ZW1lbnQuDQo+PiBGb3Ig
dXMgdGhpcyBpcyB0cmVhdGVkIGFzIGFuIGVycm9yLiBJcyBpdCBpbnRlbmRlZD8NCj4gLVdlcnJv
ciBzaG91bGRuJ3QgYmUgZW5hYmxlZCB3aGVuIGJ1aWxkaW5nIGEgcGFja2FnZSwgZXhhY3RseSBm
b3IgdGhpcw0KPiByZWFzb24uIEhlYWRlciBmaWxlcyBjaGFuZ2UgYW5kIHdlIG1pZ2h0IGdldCBh
IHdhcm5pbmcgb3IgdHdvIHdoZW4NCj4gYnVpbGRpbmcgYSBSUE0uIEhvd2V2ZXIsIHdlIGRlZmlu
aXRlbHkgd2FudCB0byB0cmVhdCB3YXJuaW5ncyBhcyBlcnJvcnMNCj4gd2hlbiBkZXZlbG9waW5n
IGxpYnZpcnQsIGkuZS4gYnVpbGRpbmcgbGlidmlydCBmcm9tIGEgZ2l0IHJlcG8uIFRoYXQncw0K
PiB3aHkgd2UgZ2V0IC1XZXJyb3IgZW5hYmxlZCBpbiBvdXIgQ0kgdG9vLg0KPg0KPj4gSWYgaXQg
aXMsIHRoZW4gSSB0aGluayB0aGlzIHdpbGwgYmUgYSBwcm9ibGVtIGZvciBYZW4gYmVjYXVzZSBp
dCBtZWFucw0KPj4gd2Ugd2lsbCBhbHdheXMgbmVlZCB0byBmaXggbGlidmlydCBiZWZvcmUgYWNj
ZXB0aW5nIGEgcGF0Y2ggaW4gWGVuIChzZWUNCj4+IG1vcmUgYmVsb3cpLg0KPiBTbyB3ZSBoYXZl
IGEgY2hpY2tlbiBlZ2cgcHJvYmxlbS4gWGVuIG5lZWRzIGxpYnZpcnQgdG8gY29tcGlsZSB3aXRo
b3V0DQo+IGFueSB3YXJuaW5nIHRvIG1lcmdlIGEgcGF0Y2ggYW5kIGxpYnZpcnQgd2FudHMgaHlw
ZXJ2aXNvcnMgdG8gaGF2ZSB0aGUNCj4gcGF0Y2ggbWVyZ2VkIGZpcnN0LiBXZWxsLCBJIHRoaW5r
IGluIHRoaXMgY2FzZSB3ZSBjYW4gbWFrZSBhbg0KPiAiZXhjZXB0aW9uIi4gT3VyIGRlbWFuZCBj
b21lcyBmcm9tIHF1aXRlIGEgZmV3IGNhc2VzIHdoZXJlIHdlIGJ1cm5lZA0KPiBvdXJzZWx2ZXMg
YnkgbWVyZ2luZyBvdXIgcG9ydGlvbiBvZiBhIGZlYXR1cmUgYmVmb3JlIGl0IHdhcyBtZXJnZWQg
aW50bw0KPiBRRU1VLiBBbmQgYWNjb3JkaW5nIHRvIE11cnBoeSdzIGxhdywgUUVNVSBpbnRlcmZh
Y2Ugd2FzIGNoYW5nZWQNCj4gcmVuZGVyaW5nIG91ciBwYXRjaGVzIChub3cgY29tbWl0cykgdXNl
bGVzcy4gQnV0IEkgYmVsaWV2ZSB0aGlzIGlzIG5vdA0KPiB0aGUgY2FzZSB3aXRoIHhlbiBzdGFn
aW5nLCBpcyBpdD8NCg0KSSBhbHNvIGJlbGlldmUgc28uDQoNCg0KPg0KPiBCVFc6IGV2ZXJ5IG90
aGVyIHBhY2thZ2UgdGhhdCBkb2VzIHN3aXRjaCgpIG92ZXIgbGlieGxfZGlza19iYWNrZW5kIGVu
dW0NCj4gd2lsbCBuZWVkIHRoaXMgZml4Lg0KPg0KPj4+ICDCoFRoZQ0KPj4+ICdkZWZhdWx0JyBj
YXNlIGV4aXN0cyBpbiBzb21lIHBsYWNlcyBiZWNhdXNlIHdlIHN1c3BlY3QgdGhlIHZhbHVlIG1p
Z2h0DQo+Pj4gbm90IGhhdmUgYmVlbiB2YWxpZGF0ZWQgYmVmb3JlLiBGb3IgaW5zdGFuY2U6DQo+
Pj4NCj4+PiBsaWJ4bF9kaXNrX2JhY2tlbmQgeCA9IGF0b2koYXJndlsxXSk7IC8qIG9yIHBhcnNl
IHNvbWV0aGluZyBmcm9tIFhNTCAqLw0KPj4+DQo+Pj4gc3dpdGNoKHgpIHsNCj4+PiBjYXNlIExJ
QlhMX0RJU0tfQkFDS0VORF9VTktOT1dOOg0KPj4+IGNhc2UgTElCWExfRElTS19CQUNLRU5EX1BI
WToNCj4+PiBjYXNlIExJQlhMX0RJU0tfQkFDS0VORF9UQVA6DQo+Pj4gY2FzZSBMSUJYTF9ESVNL
X0JBQ0tFTkRfUURJU0s6DQo+Pj4gIMKgwqAgLy8gTmVpdGhlciBvZiB0aGVzZSBtaWdodCBiZSBl
eGVjdHV0ZWQgLi4NCj4+PiBkZWZhdWx0Og0KPj4+ICDCoMKgIC8vIC4uIGluIHdoaWNoIGNhc2Ug
dGhpcyB3aWxsLg0KPj4+IH0NCj4+Pg0KPj4+DQo+Pj4gQnV0IHdlIGFyZSBub3QgdmVyeSBjb25z
aXN0ZW50IGluIHB1dHRpbmcgJ2RlZmF1bHQnIGNhc2UsIHNhZGx5Lg0KPj4+DQo+Pj4+IEFsc28g
dGhlcmUgaXMgYSBzaW1pbGFyIGlzc3VlIGluIGxpYnhsVXBkYXRlRGlza0RlZigpIHdoaWNoIEkg
aGF2ZQ0KPj4+PiByZXByb2R1Y2VkDQo+Pj4+IGFmdGVyIGZpeGluZyB0aGUgZmlyc3Qgb25lLCBi
dXQgaXQgdGhhdCBjYXNlIHRoZSBjb3JyZXNwb25kaW5nIHN3aXRjaA0KPj4+PiBkb2Vzbid0DQo+
Pj4+IGhhdmUgYSBkZWZhdWx0IGJyYW5jaC4NCj4+Pj4NCj4+Pj4gRml4IGJvdGggaXNzdWVzIGJ5
IGluc2VydGluZyByZXF1aXJlZCBlbnVtZXJhdGlvbiBpdGVtIHRvIG1ha2UgdGhlDQo+Pj4+IGNv
bXBpbGVyDQo+Pj4+IGhhcHB5IGFuZCBhZGRpbmcgaWZkZWYgZ3VhcmQgdG8gYmUgYWJsZSB0byBi
dWlsZCBhZ2FpbnN0IG9sZCBYZW4NCj4+Pj4gbGlicmFyaWVzDQo+Pj4+IGFzIHdlbGwgKHdpdGhv
dXQgTElCWExfSEFWRV9ERVZJQ0VfRElTS19TUEVDSUZJQ0FUSU9OKS4gQWxzbyBhZGQgYQ0KPj4+
PiBkZWZhdWx0DQo+Pj4+IGJyYW5jaCB0byBzd2l0Y2ggaW4gbGlieGxVcGRhdGVEaXNrRGVmKCku
DQo+Pj4+DQo+Pj4+IFBsZWFzZSBub3RlLCB0aGF0IGN1cnJlbnQgcGF0Y2ggZG9lc24ndCBpbXBs
ZW1lbnQgdGhlIHByb3BlciBoYW5kbGluZyBvZg0KPj4+PiBMSUJYTF9ESVNLX0JBQ0tFTkRfU1RB
TkRBTE9ORSBhbmQgZnJpZW5kcywgaXQgaXMganVzdCBpbnRlbmRlZCB0byBmaXgNCj4+Pj4gdGhl
IHJlZ3Jlc3Npb24gaW1tZWRpYXRlbHkgdG8gdW5ibG9jayB0aGUgb3NzdGVzdC7CoCBBbHNvIGl0
IHdvcnRoDQo+Pj4+IG1lbnRpb25pbmcNCj4+Pj4gdGhhdCBjdXJyZW50IHBhdGNoIHdvbid0IHNv
bHZlIHRoZSBwb3NzaWJsZSBhZGRpdGlvbnMgaW4gdGhlIGZ1dHVyZS4NCj4+Pj4NCj4+Pj4gWzFd
DQo+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvMjAyMjA3MTYxNjM3NDUuMjg3MTItMS1vbGVrc3R5c2hAZ21haWwuY29tL19f
OyEhR0ZfMjlkYmNRSVVCUEEhMkd0T0dWbkxlZlVsWnFrRDRCQWw5bFZ5ODJBdnJfelBmenRzc0lK
MHFJQk84bThHVG5TUzJuMlU2TXBTMEkyTWhCeGFFMEVBOS1HcWJubEItYlE5U2R4VGJBJCBbbG9y
ZVsuXWtlcm5lbFsuXW9yZ10NCj4+Pj4NCj4+Pj4gWzJdDQo+Pj4+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvRTFvSEVRTy0wMDA4
R0EtVW9Ab3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9fXzshIUdGXzI5ZGJjUUlVQlBB
ITJHdE9HVm5MZWZVbFpxa0Q0QkFsOWxWeTgyQXZyX3pQZnp0c3NJSjBxSUJPOG04R1RuU1MybjJV
Nk1wUzBJMk1oQnhhRTBFQTktR3FibmxCLWJUSlFZMHZzdyQgW2xvcmVbLl1rZXJuZWxbLl1vcmdd
DQo+Pj4+DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxv
bGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENjOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4+PiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+DQo+Pj4+IENjOiBNaWNoYWwgUHJpdm96bmlrIDxtcHJpdm96bkBy
ZWRoYXQuY29tPg0KPj4+Pg0KPj4+PiBQbGVhc2Ugbm90ZSwgdGhlIHBhdGNoIGlzIHRlc3RlZCBv
bjoNCj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1saWJ2aXJ0LmdpdDthPXNob3J0bG9nO2g9cmVmcypoZWFkcyp4ZW4tdGVz
dGVkLW1hc3Rlcl9fO0x5OCEhR0ZfMjlkYmNRSVVCUEEhMkd0T0dWbkxlZlVsWnFrRDRCQWw5bFZ5
ODJBdnJfelBmenRzc0lKMHFJQk84bThHVG5TUzJuMlU2TXBTMEkyTWhCeGFFMEVBOS1HcWJubEIt
YlRlVWtmMjRnJCBbeGVuYml0c1suXXhlblsuXW9yZ10NCj4+Pj4NCj4+Pj4gYnV0IHNob3VsZCB3
b3JrIG9uIHRoZSBtYXN0ZXIgYXMgd2VsbCAoYXMgdGhlIHNhbWUgY29kZSBpcyBwcmVzZW50DQo+
Pj4+IGhlcmUpLg0KPj4+PiAtLS0NCj4+Pj4gIMKgIHNyYy9saWJ4bC9saWJ4bF9jb25mLmMgfCA0
ICsrKysNCj4+Pj4gIMKgIHNyYy9saWJ4bC94ZW5feGwuY8KgwqDCoMKgIHwgMyArKysNCj4+Pj4g
IMKgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+Pj4gQWgsIEkgY291bGRuJ3Qg
ZmluZCB0aGUgY29tbWl0IGluIG1hc3RlciwgYW5kIGl0J3Mgc2ltcGx5IGJlY2F1c2UgaXQncw0K
Pj4+IG5vdCB0aGVyZSB5ZXQuIEl0J3MgaW4gc3RhZ2luZzoNCj4+Pg0KPj4+IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdp
dDthPWNvbW1pdDtmPXRvb2xzKmxpYnMqbGlnaHQqbGlieGxfdHlwZXMuaWRsO2g9NjZkZDFjNjJi
MmEzYzcwN2JkNWM1NTc1MGQxMGE4MjIzZmJkNTc3Zl9fO0x5OHYhIUdGXzI5ZGJjUUlVQlBBITJH
dE9HVm5MZWZVbFpxa0Q0QkFsOWxWeTgyQXZyX3pQZnp0c3NJSjBxSUJPOG04R1RuU1MybjJVNk1w
UzBJMk1oQnhhRTBFQTktR3FibmxCLWJSLW1MM3VHUSQgW3hlbmJpdHNbLl14ZW5bLl1vcmddDQo+
Pj4NCj4+Pg0KPj4+IFRoZSBwYXRjaCBsb29rcyBjb3JyZWN0LiBEbyB5b3UgaGF2ZSBhbnkgZXN0
aW1hdGUgd2hlbiBpdCBjYW4gYmUgbWVyZ2VkDQo+Pj4gaW50byBtYXN0ZXI/IEknbSBub3Qgc3Vy
ZSB3aGF0IG91ciwgbGlidmlydCwgcnVsZXMgYWJvdXQgeGVuIHN0YWdpbmcNCj4+PiBhcmUsIGJ1
dCBmb3IgcWVtdSB3ZSByZXF1aXJlIG1hc3RlciAoZXZlbiB1bnJlbGVhc2VkIHlldCkuDQo+PiBU
aGUgcGF0Y2hlcyB1c3VhbGx5IGxhbmQgaW4gbWFzdGVyIGFmdGVyIG91ciB0ZXN0IHN1aXRlIGhh
cyBjb21wbGV0ZWQuDQo+PiBPbmUgb2YgdGhlIHRlc3QgaXMgdG8gY29uZmlybSB0aGF0IGxpYnZp
cnQgaXMgc3RpbGwgd29ya2luZy4gVGhlcmVmb3JlLA0KPj4gdGhlIFhlbiBwYXRjaCB3aWxsIG5v
dCBiZSBwYXJ0IG9mIG1hc3RlciB1bnRpbCB0aGUgcGF0Y2ggaW4gbGlidmlydCBpcw0KPj4gYWRk
ZWQuDQo+IEkgdW5kZXJzdGFuZCB0aGF0IGJ1dCB3aGF0IGNhbiB3ZSBkbyBoZXJlIGlzIHRvIGRp
c2FibGUgLVdlcnJvciBzbyB0aGF0DQo+IHRoZSBjb21taXQgY2FuIGxhbmQgaW4gbWFzdGVyLiBB
bmQgdGhlbiBtZXJnZSB0aGlzIGxpYnZpcnQgZml4LiBEb2VzDQo+IHRoYXQgd29yayBmb3IgeW91
Pw0KDQpNaWNoYWwsDQp0aGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIGF0dGVtcHRzIHRvIGZp
bmQgYSBjb21wcm9taXNlLiBBcyBJIA0KdW5kZXJzdGFuZCB0aGUgdGhpbmdzIGFyZSBiaXQgbW9y
ZSBjb21wbGljYXRlZCwgd2hhdCB0aGV5IGxvb2sgbGlrZSBhdCANCnRoZSBmaXJzdCBnbGFuY2Ug
KEp1bGllbiwgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZykuIEkgdGhpbmssIHRoZSAN
CnByb3Bvc2VkIHNvbHV0aW9uIHBlcmZlY3RseSB3b3JrZWQgZm9yIHVzIGlmIE9zc3Rlc3Qgd291
bGQgdXNlIGFjdHVhbCANCmxpYnZpcnQncyBtYXN0ZXIgdG8gdGVzdCBhZ2FpbnN0LiBCdXQgT3Nz
dGVzdCBzdGlsbCB1c2VzIG9sZCBtYXN0ZXIgDQpsb2NhdGVkIGF0IChiZWNhdXNlIGl0IGhhc24n
dCBiZWVuIGFkYXB0ZWQgeWV0IHRvIG5ldyBidWlsZCBzeXN0ZW0gdXNpbmcgDQpNZXNvbik6DQoN
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1saWJ2aXJ0LmdpdDthPXNob3J0bG9n
O2g9cmVmcy9oZWFkcy94ZW4tdGVzdGVkLW1hc3Rlcg0KDQpTbywgSSBhbSBhZnJhaWQsIGFueSBh
Y3Rpb25zIGluIGxpYnZpcnQncyBtYXN0ZXIgd29uJ3QgaW1tZWRpYXRlbHkgc29sdmUgDQp0aGUg
Y3VycmVudCBzaXR1YXRpb24gYXQgdGhlIG91ciBzaWRlLiBCZXNpZGVzIGdldHRpbmcgdGhlIGN1
cnJlbnQgKG9yIA0KYWx0ZXJuYXRpdmUpIHBhdGNoIG1lcmdlZCBpbnRvIHRoZSBsaWJ2aXJ0IHdl
IHdpbGwgbmVlZCB0byBmaXggT3NzdGVzdCANCih1cGRhdGUgdGhlIGxpYnZpcnQgYnVpbGQgc2Ny
aXB0KS4NCg0KVGhlIGRpc2N1c3Npb24gaG93IHRvIHJlc29sdmUgdGhlIGN1cnJlbnQgc2l0dWF0
aW9uIGlzIGluIHByb2dyZXNzIG5vdyBbMl06DQoNClsxXSANCmh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0O2Y9dG9vbHMvbGlicy9saWdodC9saWJ4bF90
eXBlcy5pZGw7aD02NmRkMWM2MmIyYTNjNzA3YmQ1YzU1NzUwZDEwYTgyMjNmYmQ1NzdmDQpbMl0g
DQpodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvZGIzOTY3MGMtN2UzNi0yY2Y1LWE4
N2ItOTJkMTBkM2FhYzE4QHhlbi5vcmcvDQoNCg0KPg0KPiBNaWNoYWwNCj4NCi0tIA0KUmVnYXJk
cywNCg0KT2xla3NhbmRyIFR5c2hjaGVua28NCg==

