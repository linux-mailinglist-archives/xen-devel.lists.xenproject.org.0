Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE7141D66D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199665.353865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsT6-0001BI-8L; Thu, 30 Sep 2021 09:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199665.353865; Thu, 30 Sep 2021 09:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsT6-00019o-49; Thu, 30 Sep 2021 09:35:08 +0000
Received: by outflank-mailman (input) for mailman id 199665;
 Thu, 30 Sep 2021 09:35:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVsT4-00019i-Ak
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:35:06 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b058db1d-21d1-11ec-bd40-12813bfff9fa;
 Thu, 30 Sep 2021 09:35:04 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U9WguI028296; 
 Thu, 30 Sep 2021 09:35:03 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bdapw80bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:35:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6882.eurprd03.prod.outlook.com (2603:10a6:20b:283::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 09:34:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 09:34:59 +0000
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
X-Inumbo-ID: b058db1d-21d1-11ec-bd40-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRF48iGRfLfIE37uKTLuuB+CBRAeTE3q9hogMule+3vrPjWjZTmxgmN6NusdEJpxD8NZPnAae87EWInbZBh7WbvSNV5HT9FwaFwGotx9k9A/GEqImVOmJ2DyAWkM426QJY90CqC95LC5RbuzkNGO7hTUDLFqEJiQrRwbWVoa2IZlw6JQI2c5lexHYXjqq3UNxj3iiLbl3/cy3pdOz/IwHYZZ5q99v6pLBjqrgDhy5pEBJDJXEvH8RLq7VLR/On3SpqVc3G1l8AhbS16BK6tQ60Juck1nNVC/Kgy0NABEywm/PrOGhi0hjNGDwMQXELi+5Ab5yXB2INX3wJJU4iOOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n1XZHUwlSAfHhhLMFO4ZKfkLQSJEd/109NwVnP/VIWw=;
 b=Mb+DRDqXLla3NCEu+FE++bQlfEFLzcdh52M4EXpX8uwR2tAr56umrWrmSrquiSHHy5bV4pOVo4LlyRCcR3MnKsLs0Rzb+MxlGCqLigQypVU4IrPyE3H3SERDLAQ8Zib5uAJq23Be9h9vDEBDreXxAWqU8qqve3ow8FItQ7WHLDm1xZ3MjxlPlsVZMAXa2TWJpcWMM1SPlOtLHr6iz0fVc9zJWpLZZizmssHmX8/ujuzVvkqILM7eKld5VK0YS5WHlbez2qFkpivWd/skGll3HfMNj0XD+QC0ub9tgOU1mmMZI90xiQfhxAj0GWtTeOLClguHnOSz4Op+bnWGNnTFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1XZHUwlSAfHhhLMFO4ZKfkLQSJEd/109NwVnP/VIWw=;
 b=5hCjIkUHT1fUR0LYngCQiNmD8Px7aQ70eoi18ahIUjedunJuR3ESHLTrSgLBumwIubLtzMdYocaWjPHg3ACbOtDqF8InjaztU9xTL3ZOMjvqLvNAcXWj6+1xnGSTe4qi9pOGXwAc+EMpN5+Yl6ONXAm4OBTmtpmZuWNOQ0PT3WBoKrHVYGuXHmEfRgJBsK9ysLa6SDkFmi2i94hNrEkNyEh7jaRMQpkIRo3RSN/MqNfq5Kv875dBlRyjtIELJZVpw3xXOzRyQYOQAhU/DEHEdmFFEonK4Ww465qJfKpHvS8J0N4s9CgRE8bGt+AOauRwftcS8okz5sqxu/awAuIZ4Q==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXtdAlOCu2AnkIOUC4Prsocox3squ8RSWAgAAMGAA=
Date: Thu, 30 Sep 2021 09:34:59 +0000
Message-ID: <603e2cdf-748f-f18b-99f4-44ddf3c0b9c1@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <ef2c008f-7682-1549-8d27-712b04fbd84f@suse.com>
In-Reply-To: <ef2c008f-7682-1549-8d27-712b04fbd84f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f9dac90-6452-404a-a080-08d983f59286
x-ms-traffictypediagnostic: AM9PR03MB6882:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB68824DD13F4A43C296CD0E6CE7AA9@AM9PR03MB6882.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9+A3/EfctKrFxT6hnk2m61n7r827erPDGKWa19h151u4atxsYhM6bnBcnDAPO2LtsfGsr8xGtfxGODrjnSvkM2tjOZCJPGinrDSUa4FQTOl2DLLuONqpPM5Ij88qwxJhpXyi31H3yUUP/HD050D1H452mdCPXjgnwMGt5CNdxZX0bZsKUF2szdtEU/4bPLj9Lrgb6jPuQ21sNUDXN4Re994dp6RgzDNl7AwVQoPDLG3eEMrXXlOZDXOLceHyLy1ulkOOf9nIw3LHNZw+6SvT6AErsExJPViUHbOckBI0JHRNt5/HDT4K0UQwQlvUJqD3OHMppgApJQHWyGk4AvYF3z0EkDZjnN5rRUBBUfyCL1vBhgYmhuVfgrm+X7Ar1B0/YWYT1MfkVGxV3b7fgBsrLF5ToBeQE5/owTjZOziQ9rvGY/MA7Px1KHgBgIUh4Nvm8vTL5/+1DXBt2Pso2DckbhHnR1no4S+dIqXfAW9mPPRS5WaufmjLupenPJ+5LgCu5sA6tBQnRNXWnwDXdQu8k6+l/u3oAcMSn6HHSRLQBKexEQdsM7cqtHj/I4KGhTIxqB/Bk65Hf/X06nJwW1KQgYl+aDqUPgrgv2vT9UTFr3JGsgptJ/GT/2N+sd8oI0NCMGPcHysVJji/XiY0RfBpW4VOPBoG4XH8Ssd7nGvPxbSNoM9SYNecSc1BQINNUmw8TWIYjpZ9Tr26+6fPz00ZGcu1LkIdLX0QWxLPfM+XVprrp0l5tVHceRzMF2EBKX/W
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(8676002)(26005)(53546011)(4326008)(186003)(2906002)(6916009)(83380400001)(5660300002)(86362001)(55236004)(31696002)(71200400001)(8936002)(38070700005)(91956017)(66946007)(76116006)(66446008)(2616005)(64756008)(31686004)(38100700002)(6512007)(122000001)(66476007)(66556008)(508600001)(6486002)(54906003)(316002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alNEdkNBTS9BR0ZmdHVNTkdQak93S0JVMTBReUJWSzkvRERzUUtYUmFiYjl1?=
 =?utf-8?B?ZmZFRU1Zb0t4anoxckVKL2xWaWh6SGdJeFM2cWR6clEyd0daeENvcmtFeDY4?=
 =?utf-8?B?bTBjc2lBbWw0QTlNN0h3UUhUNStSRENmNVVZVG9GbENXOVg5S2Q1Njl1MzVz?=
 =?utf-8?B?TEdlMEYyOUZmeWo0SnNTWUc3QTJrN2Q2Rnh1MDlSTjdhdHh4SUU5clhVNkRY?=
 =?utf-8?B?NytwWHoyTlF1STFUeFNjM3BVTnhzK1FyY3YyVEpvR1BVdlZnVWVsWXhoVkFK?=
 =?utf-8?B?ZEdDVTlzdk9TUlJlUzA4YVlWRnN4UjI3Z2FaaENTaC9Tb25CS0ZqS0c3QzJt?=
 =?utf-8?B?NU5vdFFmbFAxcDNxdkFNVnd1MVFLcHplRGFRZHJ6K0wrT1BEOXpoOVlrMzFW?=
 =?utf-8?B?Ui85UTdSUFNWU2FjbkxvNDBjU2JjTzFyNjVsQUEvZVRzV3kxWXBCVmdFWWxZ?=
 =?utf-8?B?ZWVtd1VxQWZxOGJucnpLTkU5c1gzVjFIMXJ5aDhYOWlBbm1iRzA1ZFlDVUFn?=
 =?utf-8?B?K25CNHRnNHFGMFcxdHByYnZzcGwrcm5qMmk1Kys1eHVGR2RwWVhIUkVKWEJx?=
 =?utf-8?B?eDkyWWovaDFaWHpCM1dzMmhDeDZZcEhnYXNIMWswOXdjVzBrcEpTTW9hR2xt?=
 =?utf-8?B?QTZ6b3VVeFR2MWlzcmRURUExaVF0WnVZZm92ZTBHUkhLUUhJTmR5NFA5VjVt?=
 =?utf-8?B?N2JmVmkyVTNwV2xkTVFQNVFmVHlPbkdPVEZsQ0NGVjFkSm1lMTNlQlk1K2Mv?=
 =?utf-8?B?eEpQWmVoMDRCeVBaYzZ4b3gvM2dBTGU2MCs5WTB3TjRudmlQeHZJY3liV1M1?=
 =?utf-8?B?ZFVKb3oySGcxQnNzM1YwMUlpbml2cVk5VlpHMllNck5RbW1naEdNKzNIc0tu?=
 =?utf-8?B?YVJ5YjlSQ3R3eS9sWmRKc1UwOTBjUFA5aGY5Uzc0Z3FrZllDd1d2bEJYa216?=
 =?utf-8?B?NlpzTUZiZ1Y5YldQTkliZ1IvbFhGK1paSEhOM085NGU5RXFOSWFlSkpZMG4y?=
 =?utf-8?B?RVQvSTdRR0FFSThYZnhIdC9WR3JldXZaV00xRU9qNERoa2J6bk5HaXFrdnlF?=
 =?utf-8?B?ejdldDVzVWVNczNIMCtCMkhvN3c4b00zVnU4UE1VT3VzTklUdzc2NjZuYmFw?=
 =?utf-8?B?YjhDN3FoQU05VTNmT3FKcFY1MThwb3JjK25CN0dWWWMxZGdZa1pkclc5b1dG?=
 =?utf-8?B?U1M4SklRZlFGYlNiOHA2Si9uTGpqL1l4RFBsZmxSbTFPSUwycVNkemVoNklQ?=
 =?utf-8?B?T01mODVkMlF1dW9hUXRhK3pWRTJIbkFTUmtHRzNnVTFLMnZFZmk0enc0TlRZ?=
 =?utf-8?B?TmptUWkzTTVtQTRubWFySWNYZExpTFdoVjg4WnBxdkg5RXNSMkc4UlZiZGlh?=
 =?utf-8?B?dmNGbkMzeXF5ZlhHMFRJNFhzSzVkUmpNc0lQalIyMjdlQUxndVk5NXZlKzEz?=
 =?utf-8?B?dWNWRk8yWjhtbXlaQktBeXQzTTQ3U3hySE5YU1B5SVkrR2J6bm95anUzSXdG?=
 =?utf-8?B?RnNZeFVnLzVibklnWFNEWStkVUN5blZGSFpVWXNYMlJZR3RRSTFOVFBDZW1s?=
 =?utf-8?B?QVdvRUZMcjhFRXZJT3dEVFlXT1lpZkt5TWlhTGZDajdnbzRhZkFJbzNBVzZa?=
 =?utf-8?B?Vlp6UjZMSXZKbFBCRGx0VUkyVGltcGtDaUszRzZrTTRuUUVtS2orVHVxNTdl?=
 =?utf-8?B?U1JIYTFsdnY5MDZiT0FWa3hiREdHbllXdlN3K3VwS3p3RFpCb2xMZS85eWt1?=
 =?utf-8?B?WVgyY1FiN1YwZVA1KzlRdWdrZVdjRXJkc0FlMktpV3UrWDJEQnBhbmRhU1Mv?=
 =?utf-8?B?SnBUK0s2amZFbXREb3N1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F13D52DA31080458DE3B6B4F58CA9D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9dac90-6452-404a-a080-08d983f59286
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:34:59.6684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmZJWMRHIR2y7M9DbCUWJ0nSb6WVJa6sEGiaalrM36tVDSlC/+B45rjDvZD0+pTeLNZTxg9jiKPT4JV/jNqvEk7kEz9LTHdp4ojo7JfTbsFWqAHzaUM8cssqe3OZNKe2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6882
X-Proofpoint-ORIG-GUID: GMY5DWjaduFxNQMjyJQSUvyukfhPDbHF
X-Proofpoint-GUID: GMY5DWjaduFxNQMjyJQSUvyukfhPDbHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300058

DQoNCk9uIDMwLjA5LjIxIDExOjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAwOTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gQXNzaWduIFNCREYgdG8gdGhlIFBDSSBkZXZpY2VzIGJlaW5nIHBhc3NlZCB0aHJvdWdoIHdp
dGggYnVzIDAuDQo+IFRoaXMgcmVhZHMgYSBsaXR0bGUgb2RkOiBJZiBidXMgaXMgYWxyZWFkeSBr
bm93biAoYW5kIEkgdGhpbmsgeW91IGltcGx5DQo+IHNlZ21lbnQgdG8gYWxzbyBiZSBrbm93biks
IGl0J3Mgb25seSBERiB3aGljaCBnZXQgYXNzaWduZWQuDQpCdXQgYXQgdGhlIGVuZCBvZiB0aGUg
ZGF5IHdlIHNldCBhbGwgdGhlIHBhcnRzIG9mIHRoYXQgU0JERi4NCk90aGVyd2lzZSBJIHNob3Vs
ZCB3cml0ZSAiQXNzaWduIERGIGFzIHdlIGtub3cgdGhhdCBidXMgYW5kIHNlZ21lbnQNCmFyZSAw
Ig0KPg0KPj4gVGhlIHJlc3VsdGluZyB0b3BvbG9neSBpcyB3aGVyZSBQQ0llIGRldmljZXMgcmVz
aWRlIG9uIHRoZSBidXMgMCBvZiB0aGUNCj4+IHJvb3QgY29tcGxleCBpdHNlbGYgKGVtYmVkZGVk
IGVuZHBvaW50cykuDQo+PiBUaGlzIGltcGxlbWVudGF0aW9uIGlzIGxpbWl0ZWQgdG8gMzIgZGV2
aWNlcyB3aGljaCBhcmUgYWxsb3dlZCBvbg0KPj4gYSBzaW5nbGUgUENJIGJ1cy4NCj4gT3IgdXAg
dG8gMjU2IHdoZW4gdGhlcmUgYXJlIG11bHRpLWZ1bmN0aW9uIG9uZXMuIEltbyB5b3UgYXQgbGVh
c3Qgd2FudA0KPiB0byBzcGVsbCBvdXQgaG93IHRoYXQgY2FzZSBpcyBpbnRlbmRlZCB0byBiZSBo
YW5kbGVkIChldmVuIGlmIG1heWJlDQo+IHRoZSBjb2RlIGRvZXNuJ3QgY292ZXIgdGhhdCBjYXNl
IHlldCwgaW4gd2hpY2ggY2FzZSBhIHJlc3BlY3RpdmUgY29kZQ0KPiBjb21tZW50IHdvdWxkIGFs
c28gd2FudCBsZWF2aW5nKS4NCldlIGFyZSBub3Qgc3VwcG9ydGluZyBtdWx0aS1mdW5jdGlvbiB5
ZXQsIHNvIEknbGwgYWRkIGEgY29tbWVudC4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4g
QEAgLTgzMSw2ICs4MzEsNjYgQEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1
cywgdTggZGV2Zm4pDQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0KPj4gKyNp
ZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPiBNYXkgSSBhc2sgd2h5IHRoZSBj
b2RlIGVuY2xvc2VkIGJ5IHRoaXMgY29uZGl0aW9uYWwgaGFzIGJlZW4gcHV0IGhlcmUNCj4gcmF0
aGVyIHRoYW4gdW5kZXIgZHJpdmVycy92cGNpLz8NCkluZGVlZCB0aGlzIGNhbiBiZSBtb3ZlZCB0
byB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYy4NCkknbGwgbW92ZSBhbmQgdXBkYXRlIGZ1bmN0aW9u
IG5hbWVzIGFjY29yZGluZ2x5Lg0KPg0KPj4gK3N0YXRpYyBzdHJ1Y3QgdnBjaV9kZXYgKnBjaV9m
aW5kX3ZpcnR1YWxfZGV2aWNlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9kZXYgKnZkZXY7DQo+PiArDQo+
PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCB2ZGV2LCAmZC0+dmRldl9saXN0LCBsaXN0ICkN
Cj4+ICsgICAgICAgIGlmICggdmRldi0+cGRldiA9PSBwZGV2ICkNCj4+ICsgICAgICAgICAgICBy
ZXR1cm4gdmRldjsNCj4+ICsgICAgcmV0dXJuIE5VTEw7DQo+PiArfQ0KPiBObyBsb2NraW5nIGhl
cmUgb3IgLi4uDQo+DQo+PiAraW50IHBjaV9hZGRfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
dnBjaV9kZXYgKnZkZXY7DQo+PiArDQo+PiArICAgIEFTU0VSVCghcGNpX2ZpbmRfdmlydHVhbF9k
ZXZpY2UoZCwgcGRldikpOw0KPiAuLi4gaW4gdGhpcyBmaXJzdCBjYWxsZXIgdGhhdCBJJ3ZlIG1h
bmFnZWQgdG8gc3BvdD8gU2VlIGFsc28gYmVsb3cgYXMNCj4gdG8gdXAgdGhlIGNhbGwgdHJlZSB0
aGUgcGNpZGV2cy1sb2NrIGJlaW5nIGhlbGQgKHdoaWNoIGF0IHRoZSB2ZXJ5DQo+IGxlYXN0IHlv
dSB3b3VsZCB0aGVuIHdhbnQgdG8gQVNTRVJUKCkgZm9yIGhlcmUpLg0KSSB3aWxsIG1vdmUgdGhl
IGNvZGUgdG8gdnBjaSBhbmQgbWFrZSBzdXJlIHByb3BlciBsb2NraW5nIHRoZXJlDQo+DQo+PiAr
ICAgIC8qIEVhY2ggUENJIGJ1cyBzdXBwb3J0cyAzMiBkZXZpY2VzL3Nsb3RzIGF0IG1heC4gKi8N
Cj4+ICsgICAgaWYgKCBkLT52cGNpX2Rldl9uZXh0ID4gMzEgKQ0KPj4gKyAgICAgICAgcmV0dXJu
IC1FTk9TUEM7DQo+IFBsZWFzZSBhdm9pZCBvcGVuLWNvZGluZyBsaXRlcmFscyB3aGVuIHRoZXkg
Y2FuIGJlIHN1aXRhYmx5IGV4cHJlc3NlZC4NCkkgZmFpbGVkIHRvIGZpbmQgYSBzdWl0YWJsZSBj
b25zdGFudCBmb3IgdGhhdC4gQ291bGQgeW91IHBsZWFzZSBwb2ludA0KbWUgdG8gdGhlIG9uZSBJ
IGNhbiB1c2UgaGVyZT8NCj4NCj4+ICsgICAgdmRldiA9IHh6YWxsb2Moc3RydWN0IHZwY2lfZGV2
KTsNCj4+ICsgICAgaWYgKCAhdmRldiApDQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+
ICsNCj4+ICsgICAgLyogV2UgZW11bGF0ZSBhIHNpbmdsZSBob3N0IGJyaWRnZSBmb3IgdGhlIGd1
ZXN0LCBzbyBzZWdtZW50IGlzIGFsd2F5cyAwLiAqLw0KPj4gKyAgICB2ZGV2LT5zZWcgPSAwOw0K
Pj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBUaGUgYnVzIG51bWJlciBpcyBzZXQgdG8gMCwg
c28gdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVuDQo+PiArICAgICAqIGFzIGVtYmVkZGVkIGVuZHBv
aW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleC4NCj4+ICsgICAgICovDQo+PiArICAgIHZkZXYt
PmJ1cyA9IDA7DQo+IFN0cmljdGx5IHNwZWFraW5nIGJvdGggb2YgdGhlc2UgYXNzaWdubWVudHMg
YXJlIHJlZHVuZGFudCB3aXRoIHlvdQ0KPiB1c2luZyB4emFsbG9jKCkuIEknZCBwcmVmZXIgaWYg
dGhlcmUgd2FzIGp1c3QgYSBjb21tZW50LCBhcyB0aGUgY29tcGlsZXINCj4gaGFzIG5vIHdheSBy
ZWNvZ25pemluZyB0aGlzIGluIG9yZGVyIHRvIGVsaW1pbmF0ZSB0aGVzZSBzdG9yZXMuDQpZZXMs
IEkganVzdCBwdXQgdGhlIGFzc2lnbm1lbnRzIHRvIGJlIGV4cGxpY2l0bHkgc2VlbiBoZXJlIGFz
IGJlaW5nIDAuDQpJIHdpbGwgcmVtb3ZlIHRob3NlIGFuZCBwdXQgYSBjb21tZW50Lg0KPg0KPj4g
KyAgICB2ZGV2LT5kZXZmbiA9IFBDSV9ERVZGTihkLT52cGNpX2Rldl9uZXh0KyssIDApOw0KPj4g
Kw0KPj4gKyAgICB2ZGV2LT5wZGV2ID0gcGRldjsNCj4+ICsgICAgdmRldi0+ZG9tYWluID0gZDsN
Cj4+ICsNCj4+ICsgICAgcGNpZGV2c19sb2NrKCk7DQo+PiArICAgIGxpc3RfYWRkX3RhaWwoJnZk
ZXYtPmxpc3QsICZkLT52ZGV2X2xpc3QpOw0KPj4gKyAgICBwY2lkZXZzX3VubG9jaygpOw0KPiBJ
IGRvbid0IHN1cHBvcnQgYSBnbG9iYWwgbG9jayBnZXR0aW5nIChhYil1c2VkIGZvciBwZXItZG9t
YWluIGxpc3QNCj4gbWFuYWdlbWVudC4NCj4NCj4gQXBhcnQgZnJvbSB0aGF0IEkgZG9uJ3QgdW5k
ZXJzdGFuZCB3aHkgeW91IGFjcXVpcmUgdGhlIGxvY2sgaGVyZS4gRG9lcw0KPiB0aGF0IG1lYW4g
dGhlIGZ1bmN0aW9ucyBmdXJ0aGVyIHdlcmUgdHJ1bHkgbGVmdCB3aXRob3V0IGFueSBsb2NraW5n
LA0KPiBieSB5b3Ugbm90IGhhdmluZyBub3RpY2VkIHRoYXQgdGhpcyBsb2NrIGlzIGFscmVhZHkg
YmVpbmcgaGVsZCBieSB0aGUNCj4gc29sZSBjYWxsZXI/DQpJJ2xsIHJlLXdvcmsgbG9ja2luZyB3
aXRoIHJlc3BlY3QgdG8gdGhlIG5ldyBsb2NhdGlvbiBmb3IgdGhpcywgZS5nLiB2cGNpDQo+DQo+
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+IEBAIC05MSwyMCArOTEsMzIgQEAgaW50IF9faHdkb21faW5pdCB2cGNpX2Fk
ZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgLyogTm90aWZ5IHZQQ0kgdGhh
dCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+PiAgIGludCB2cGNpX2Fzc2lnbl9k
ZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRldikNCj4+ICAg
ew0KPj4gKyAgICBpbnQgcmM7DQo+PiArDQo+PiAgICAgICAvKiBJdCBvbmx5IG1ha2VzIHNlbnNl
IHRvIGFzc2lnbiBmb3IgaHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0KPj4gICAgICAgaWYgKCBp
c19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0dXJu
IDA7DQo+PiAgIA0KPj4gLSAgICByZXR1cm4gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRldik7
DQo+PiArICAgIHJjID0gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRldik7DQo+PiArICAgIGlm
ICggcmMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gcGNp
X2FkZF92aXJ0dWFsX2RldmljZShkLCBkZXYpOw0KPj4gICB9DQo+IEkndmUgcGVla2VkIGF0IHRo
ZSBlYXJsaWVyIHBhdGNoLCBhbmQgYm90aCB0aGVyZSBhbmQgaGVyZSBJJ20gc3RydWdnbGluZyB0
bw0KPiBzZWUgaG93IHVuZG9pbmcgcGFydGlhbGx5IGNvbXBsZXRlZCBzdGVwcyBvciBmdWxseSBj
b21wbGV0ZWQgZWFybGllciBzdGVwcw0KPiBpcyBpbnRlbmRlZCB0byB3b3JrLiBJJ20gbm90IGNv
bnZpbmNlZCBpdCBpcyBsZWdpdGltYXRlIHRvIGxlYXZlIGhhbmRsZXJzDQo+IGluIHBsYWNlIHVu
dGlsIHRoZSB0b29sIHN0YWNrIG1hbmFnZXMgdG8gcm9sbCBiYWNrIHRoZSBmYWlsZWQgZGV2aWNl
DQo+IGFzc2lnbm1lbnQuDQpJJ2xsIHNlZSB3aGF0IGFuZCBob3cgd2UgY2FuIHJvbGwgYmFjayBp
biBjYXNlIG9mIGVycm9yDQo+DQo+PiAgIC8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGRl
LWFzc2lnbmVkIGZyb20gZ3Vlc3QuICovDQo+PiAgIGludCB2cGNpX2RlYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4gICB7DQo+PiAr
ICAgIGludCByYzsNCj4+ICsNCj4+ICAgICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gZGUt
YXNzaWduIGZyb20gaHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0KPj4gICAgICAgaWYgKCBpc19z
eXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0dXJuIDA7
DQo+PiAgIA0KPj4gKyAgICByYyA9IHBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2UoZCwgZGV2KTsN
Cj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICByZXR1cm4gcmM7DQo+PiArDQo+PiAgICAg
ICByZXR1cm4gdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzKGQsIGRldik7DQo+PiAgIH0NCj4gU28g
d2hhdCdzIHRoZSB1bHRpbWF0ZSBlZmZlY3Qgb2YgYSBwYXJ0aWFsbHkgZGUtYXNzaWduZWQgZGV2
aWNlLCB3aGVyZQ0KPiBvbmUgb2YgdGhlIGxhdGVyIHN0ZXBzIGZhaWxlZD8gSW4gYSBudW1iZXIg
b2YgcGxhY2VzIHdlIGRvIGJlc3QtZWZmb3J0DQo+IGZ1bGwgY2xlYW51cCwgYnkgcmVjb3JkaW5n
IGVycm9ycyBidXQgbmV2ZXJ0aGVsZXNzIGNvbnRpbnVpbmcgd2l0aA0KPiBzdWJzZXF1ZW50IGNs
ZWFudXAgc3RlcHMuIEkgd29uZGVyIHdoZXRoZXIgdGhhdCdzIGEgbW9kZWwgdG8gdXNlIGhlcmUN
Cj4gYXMgd2VsbC4NCj4NCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+PiBAQCAtMTM3LDYgKzEzNywyNCBAQCBzdHJ1Y3QgcGNp
X2RldiB7DQo+PiAgICAgICBzdHJ1Y3QgdnBjaSAqdnBjaTsNCj4+ICAgfTsNCj4+ICAgDQo+PiAr
I2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArc3RydWN0IHZwY2lfZGV2
IHsNCj4+ICsgICAgc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KPj4gKyAgICAvKiBQaHlzaWNhbCBQ
Q0kgZGV2aWNlIHRoaXMgdmlydHVhbCBkZXZpY2UgaXMgY29ubmVjdGVkIHRvLiAqLw0KPj4gKyAg
ICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+ICsgICAgLyogVmlydHVhbCBTQkRGIG9m
IHRoZSBkZXZpY2UuICovDQo+PiArICAgIHVuaW9uIHsNCj4+ICsgICAgICAgIHN0cnVjdCB7DQo+
PiArICAgICAgICAgICAgdWludDhfdCBkZXZmbjsNCj4+ICsgICAgICAgICAgICB1aW50OF90IGJ1
czsNCj4+ICsgICAgICAgICAgICB1aW50MTZfdCBzZWc7DQo+PiArICAgICAgICB9Ow0KPj4gKyAg
ICAgICAgcGNpX3NiZGZfdCBzYmRmOw0KPiBDb3VsZCB5b3UgZXhwbGFpbiB0byBtZSB3aHkgcGNp
X3NiZGZfdCAoYSB0eXBlZGVmIG9mIGEgdW5pb24pIGlzbid0DQo+IHByb3ZpZGluZyBhbGwgeW91
IG5lZWQ/IEJ5IHB1dHRpbmcgaXQgaW4gYSB1bmlvbiB3aXRoIGEgY3VzdG9tDQo+IHN0cnVjdCB5
b3Ugc2V0IHlvdXJzZWxmIHVwIGZvciB0aGluZ3MgZ29pbmcgb3V0IG9mIHN5bmMgaWYgYW55b25l
DQo+IGNob3NlIHRvIGFsdGVyIHBjaV9zYmRmX3QncyBsYXlvdXQuDQpTdXJlLCBwY2lfc2JkZl90
IHNob3VsZCBiZSBlbm91Z2gNCj4NCj4+IEBAIC0xNjcsNiArMTg1LDEwIEBAIGNvbnN0IHVuc2ln
bmVkIGxvbmcgKnBjaV9nZXRfcm9fbWFwKHUxNiBzZWcpOw0KPj4gICBpbnQgcGNpX2FkZF9kZXZp
Y2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+ICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBwY2lfZGV2X2luZm8gKiwgbm9kZWlkX3Qgbm9kZSk7DQo+PiAgIGludCBwY2lf
cmVtb3ZlX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuKTsNCj4+ICsjaWZkZWYgQ09O
RklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICtpbnQgcGNpX2FkZF92aXJ0dWFsX2Rldmlj
ZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiAraW50
IHBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYpOw0KPj4gKyNlbmRpZg0KPiBMaWtlIGZvciB0aGVpciBkZWZpbml0aW9u
cyBJIHF1ZXN0aW9uIHRoZSBwbGFjZW1lbnQgb2YgdGhlc2UNCj4gZGVjbGFyYXRpb25zLg0KV2ls
bCBtb3ZlIHRvIHZwY2kuaA0KPg0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+PiBAQCAtNDQ0LDYgKzQ0NCwxNCBAQCBz
dHJ1Y3QgZG9tYWluDQo+PiAgIA0KPj4gICAjaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+ICAgICAg
IHN0cnVjdCBsaXN0X2hlYWQgcGRldl9saXN0Ow0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lf
R1VFU1RfU1VQUE9SVA0KPj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIHZkZXZfbGlzdDsNCj4+ICsg
ICAgLyoNCj4+ICsgICAgICogQ3VycmVudCBkZXZpY2UgbnVtYmVyIHVzZWQgYnkgdGhlIHZpcnR1
YWwgUENJIGJ1cyB0b3BvbG9neQ0KPj4gKyAgICAgKiB0byBhc3NpZ24gYSB1bmlxdWUgU0JERiB0
byBhIHBhc3NlZCB0aHJvdWdoIHZpcnR1YWwgUENJIGRldmljZS4NCj4+ICsgICAgICovDQo+PiAr
ICAgIGludCB2cGNpX2Rldl9uZXh0Ow0KPiBJbiBob3cgZmFyIGNhbiB0aGUgbnVtYmVyIHN0b3Jl
ZCBoZXJlIGJlIG5lZ2F0aXZlPyBJZiBpdCBjYW4ndCBiZSwNCj4gcGxlYXNlIHVzZSB1bnNpZ25l
ZCBpbnQuDQpXaWxsIHVzZSB1bnNpZ25lZA0KPg0KPiBBcyB0byB0aGUgY29tbWVudCAtICJjdXJy
ZW50IiBpcyBhbWJpZ3VvdXM6IElzIGl0IHRoZSBudW1iZXIgdGhhdA0KPiB3YXMgdXNlZCBsYXN0
LCBvciB0aGUgbmV4dCBvbmUgdG8gYmUgdXNlZD8NCkkgd2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQg
dG8gcmVtb3ZlIGFtYmlndWl0eQ0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

