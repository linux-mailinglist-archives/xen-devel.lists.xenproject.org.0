Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD8412FDA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191527.341594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaiP-0002Ab-0U; Tue, 21 Sep 2021 08:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191527.341594; Tue, 21 Sep 2021 08:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaiO-00028m-T6; Tue, 21 Sep 2021 08:01:20 +0000
Received: by outflank-mailman (input) for mailman id 191527;
 Tue, 21 Sep 2021 08:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSaiM-00028g-Vf
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:01:19 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea441e09-4fc8-4b75-b2d2-11a2ac37f763;
 Tue, 21 Sep 2021 08:01:17 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L7m7F7022464; 
 Tue, 21 Sep 2021 08:01:15 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b7a6q08af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 08:01:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6804.eurprd03.prod.outlook.com (2603:10a6:20b:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 08:01:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 08:01:12 +0000
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
X-Inumbo-ID: ea441e09-4fc8-4b75-b2d2-11a2ac37f763
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdsH4ntrXTgOyGHih38Urc3wL2maM7tWk2OAVh1mX68+Jn80QxejYUY5zEfZW0ALvUBav8jeMwvVpPTRIanbcKKBhdu8KTHA9rCNFnq1C0n5JTBc/pI614ipbdjDwtP9jSRfl6t7+Hswp2essx8Z2TzX5w17rRk6+GuURqM9DQvT66We3XV755XsmE0DtJcVA4tDffhNarDdAuhdqHUfXaJU3Em0S2sG1V01dlHGJB0PdkQdRqDcd1r/eFp+BcWaV5Wo68r1d7ax6mhkcPQLwPOJClolL/LLfq4QG/Hxs+Hs+9xjHYqOpQe50iui7VyhTSSS75xpYWE9f0vbF7b55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+1KW62GY8Rsqb5LPfbTjUKgcC8I5lfkLxv4NyEB7Brs=;
 b=mTxdulUMU2OYhE9UHRTbhvfkRmvb5EruUA9Hu3/VAgnpOrp2LGbjvVKwWY5d1RNsAtornhhFRRfm093ej3V5oON8xWK73Fmu0rV10IZvFIvjCeLJgkcUAtsyqFI8TD3/j02IsU6qBVkBnes6eHDMIf4mrRK9jnc+oJxOKcqo9TXSkYuvQg9SIsVMET8H/8hxtgomFftj4AacqlenKNNTNpsTe15yaqqkSt2XttcPwceQgjmU1kfr/qK0wwAy0rARr9RWPqoWw/RdeVpYqmlLCdZLxVAqnRY2ins8mb1ejcTFauCfY2GL0C84++eai1wOOCI1tRrIUhHR1dp/+3N9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1KW62GY8Rsqb5LPfbTjUKgcC8I5lfkLxv4NyEB7Brs=;
 b=JGj3hajcJkXcXeVzx10gvAn0aD8m0AlB/L5yR+pQ4W6zIb2RdpINu+Pa62vdx63d3SE9p5rR0juVw9Ce2gI0q13fbmDK4F/6Oe2PdwOrrT1B/6n/6PGN3YToRQOg+XHj8/sgFEbVJssXAZmrHDkhRRhx/NUaBCMrLC3wcWfNwufnPOs0SCpe46s01ueJGwjfIdXcWgXuqH4rq1C8f87CxNp6VQzbfkwuMO+eUjrAPo6SLO19gUMXvzDVSy8SFPwNggnueTQSFxMRKLoBfNWRkAEsdQNJFtyG/1LWHmnMp581xNTiB+Fqea4ivAnwBjFOZXDF+R4ENdt4RfKG9YElhA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuuJC4AgAAB+IA=
Date: Tue, 21 Sep 2021 08:01:11 +0000
Message-ID: <94dcf710-276c-a3cc-48de-1c5caaf495f5@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <809c7a0c-cc8b-ce6f-bab4-97029e538053@suse.com>
In-Reply-To: <809c7a0c-cc8b-ce6f-bab4-97029e538053@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ffb9bd7-0d5b-4642-3fed-08d97cd5fa68
x-ms-traffictypediagnostic: AM9PR03MB6804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB6804BA1CBEB637BBED3EC8DCE7A19@AM9PR03MB6804.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IlEqLOcIdayGopolSkpP2tnPXacjlrtevh89Cxh4XUXg4wrM7PaMtR0CWFiFLo66uboAuvo6mpJpUZSAq8GTXUlai8FZ2SJBmVCIrLq8x8nh/9A8E+c+aERKt+2fR2W0VYMMO6QGHGZaX+tpe6rje7bLwSf65+ckaMd0Rybr5O9TLcYTkmr51A6E9xuFroNtVo/4tw+JnVEZ5xGDwDT63hlTeToyX0xE4dNAlJJY4hmdhDGM2pIq5HrftHvJvUvR7uSaPA8PDEmGqaxd9uOF6RNqpDX2EdRJz2M3YrnxeymHBaCEjsr1ZFjwdgefhBqu/hNr1MAevBHn27vHEbUN19MvXdko0U07KY8P6U664GABxrVxzq4gPXpm+xpDKDbCHRUozQheSjsm89vEoJLYk+wY0Qisu9SKdve/YtCcj7x+FN1K3FZUptgYZj3QEvLYvvWP7I5qjQ9F+o/lm1VBb19ki40TgkmKDomQr8Rt6QHajCl7lhmag8JmpLYSbpVCpabT1o3suFnUyrD4YxvnennkRaDnRiwSHl7p5A2kv9ReAPFIy3hOeZBIpfffpN9eAWTfCcpNd5VkYJ1kHtmWAS7x5onifQ8QIoMDahXRW1mcm9DS23MNEXgFMYDUaSKsxisUMFod7suE40bOuBWUdOn8NDKrq+ezuQ/yK7/Rsg5PYx9NJbhJ8ROvG36O749D8o9/3O8ISZKr+NKvkEn+r1EiSQ1Ip5PzxQzoiQw0CBqI6LQglbU4hddJW46nARHE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(31686004)(66946007)(8936002)(186003)(6486002)(5660300002)(31696002)(54906003)(508600001)(2616005)(36756003)(38070700005)(66446008)(107886003)(66556008)(76116006)(66476007)(86362001)(71200400001)(4326008)(38100700002)(6506007)(53546011)(316002)(55236004)(26005)(8676002)(110136005)(122000001)(2906002)(6512007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aW5KMWtkbmRGRE11M1JGLzRJaXBCU1NtTTI4TkRNU2VOODBPVHliRDREcmpL?=
 =?utf-8?B?SDNEbjFFdWJmSlpFMG5tZ0VodGVQNkdKbnQxYUg0YmxrZDZKNEZaUzRNenAz?=
 =?utf-8?B?VmZiY3NYOUN0bXEvMkNlbUVjbTRRZ010ekMvUXhUMjViSFBCMDUvbHA2WkRy?=
 =?utf-8?B?YXhCd0hrNEQyaE55TEczZ0d0RlRPT1UwaHIrWUFBUzFwOXBZamw0MVZRdlpF?=
 =?utf-8?B?VWVkMXBjdE0zMjRHWm5QZUhidFVuc1JMK3Q3VTR4SmIwZGNpMGg2MHRpcE5T?=
 =?utf-8?B?YmJ3UlF1Uk5USnF0Ykx3NU5yVGdGV1RBa3VpTm1kTHJhWjZidEZLb2g3V2Fv?=
 =?utf-8?B?QUtYQ1BnMzNqMlNKN0dCWVB4a2lQYTZNc0orN09YZFk1ekQrbTk4K2ZoYVBH?=
 =?utf-8?B?Tlo4QXZGOW5DTm9vRE9zd1hrTHJ4ZFRnZVJGRmVLSEhEZ0hIam1BMlE0Wkpk?=
 =?utf-8?B?c0wyK1VvMVhkaDBBKy8rTzVSV3BZNy9iRjBCRjBHdkJMdEJNYVVwbTVPdzl3?=
 =?utf-8?B?b3Mrbmc2UHU3YnZ5SDlLMzhqRVU1K1ZqYU5Sdk5zMXd4dEFVdGFkRm5SekFu?=
 =?utf-8?B?Y2Nia0VmN3Rpc29wMmo0OEdsQTRRUDBzKzl2azBMaVpzVHBVa2ZBUjZYb01Q?=
 =?utf-8?B?OXJWMU02aCtvSXd1RGRqQWVwVEY4eS8yUHoyTXM5R20zckwwM2hKL0JON3B3?=
 =?utf-8?B?K1l1N3VsUmVQTTkwcmxPZ0xROTFvZlY4RVlqc3dqQStUSzBxL3Z1WnNqbWFY?=
 =?utf-8?B?UHE5TnhYbHhsdklUOXYvRU5hTFBWTHQrZ3o0Zm5ybnBINXA4cENpS2p0aXVS?=
 =?utf-8?B?ejBsSXZkQUgzMHlvRGhtN2RUQllVd294S3hQdGNwMnhmRm1rWFFSeW4zRzl6?=
 =?utf-8?B?dTJVV2tUaVd2M1lQMnZPblh5Mmx0VE96ajB0ZmhHak15NkgxcU00ZjZzQjhh?=
 =?utf-8?B?dWVqczVETHpPNnlpb2JjK0VKOW8zdTdZWWxVS1BtdU9jRzJCMXo3bjNGdzZX?=
 =?utf-8?B?enZLanp6aWZSUFhNWmM3d3A1Z0poenpUQTkveXRLZGtneVJFc1AreTRMTnFx?=
 =?utf-8?B?N0svSVprMVNyUnFYUHRhTlFyS2h4MjVFMGp5aXY4dmFUdlRlOUZmeUhKVHhU?=
 =?utf-8?B?V1l0SmdFNTlsYlFGcXE4WnFJc3N2aHRhd0ZoRkVPUWxGVGRoWm5DRElwQVA3?=
 =?utf-8?B?MElDelJFUE93V3FrVG9HOC9YWElaWld6cTRLSlFHeUROdE95Nmlqa3VMdUxJ?=
 =?utf-8?B?a3JpRFdGTXVEcDhUbG9rUXNuVjUvOWhpVEVzbEl1ZjNYUVhQMUNGdVFNSVFK?=
 =?utf-8?B?WitIU3g2WXlxNWRUUGZ5NHd6ZWtuSmZKdnBFZDN4MWhLcHRVMFgza1FjclJ1?=
 =?utf-8?B?L1pEUWdkZCtUVXB2dXBRMVVYOE9Ha3J5Ty9IUnZabGNIeUpGeGhnOTFzT1N4?=
 =?utf-8?B?UTBjcmdPUmgzdGVFdHFDdnlHT0FNZHBIQkZMV3lPZEw5eEF1RTJSVkoxT2Js?=
 =?utf-8?B?L2o2WTl5bHlvZmNOM3k3Wm9YU1Q2TkZHcVMvZ2lOODh2YWpNMFRoUFM0RUFP?=
 =?utf-8?B?aFlQOWFwRWpVVktzRzZHSHhxR29pbW93WWs5SmRnamlYSnNGd2c3eWU1Nkpw?=
 =?utf-8?B?ZkVIcE1BVnFzWnBBNjYxeFFvUzhDT3BWcmpabFZLcUVDZTBFeWZCT1k4alFJ?=
 =?utf-8?B?T0NMeXk2RWhpbVV0Qm5DQ0hDWE1pRFQyeERXc0dvQlN5enpGQjBtODJWK213?=
 =?utf-8?B?V255MUg3a2JYYzBOdHV1WXlUWXlKREE4eUxlc1UrZVlibVpwT2oxZXZyd01k?=
 =?utf-8?B?eEFCS293RG8zYld6UEF1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A7EFAA29137E04B938BD4B4FD35004E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffb9bd7-0d5b-4642-3fed-08d97cd5fa68
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 08:01:11.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZMEZVbOi1QxZUYozaR2iTQC25gIJTs7Oi88BfhPOdZ/vvZQrGp1KDYFLnlXKHxyH2KYo3yq7JTcMwG5Bu8AMIGEBgP7Tjp4vZlr3ENY2VurtFhgsgLjoXzifUGIdP1K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6804
X-Proofpoint-GUID: G-CGN8am5RrJXAGXQfIEeLbBpdha0Hj0
X-Proofpoint-ORIG-GUID: G-CGN8am5RrJXAGXQfIEeLbBpdha0Hj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=833
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210052

DQpPbiAyMS4wOS4yMSAxMDo1NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMTcuMDkuMjEg
MTU6MDEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IFhlbi1wY2liYWNrIGRyaXZlciB3YXMgZGVzaWduZWQgdG8gYmUgYnVpbHQgZm9yIHg4NiBvbmx5
LiBCdXQgaXQNCj4+IGNhbiBhbHNvIGJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcywgZS5n
LiBBcm0uDQo+PiBSZS1zdHJ1Y3R1cmUgdGhlIGRyaXZlciBpbiBhIHdheSB0aGF0IGl0IGNhbiBi
ZSBidWlsdCBmb3Igb3RoZXINCj4+IHBsYXRmb3JtcyBhcyB3ZWxsLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuYXN0YXNpaWEgTHVraWFuZW5rbyA8YW5hc3Rh
c2lpYV9sdWtpYW5lbmtvQGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0KPj4gVGVzdGVkIG9uIEFybSBh
bmQgeDg2Lg0KPj4gLS0tDQo+PiDCoCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGNpLmjCoMKg
wqDCoCB8IDI0IC0tLS0tLS0tLS0NCj4+IMKgIGFyY2gveDg2L3BjaS94ZW4uY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNzQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+IMKgIGRyaXZlcnMveGVuL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDIgKy0NCj4+IMKgIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jwqDCoCB8wqAg
MSArDQo+PiDCoCBkcml2ZXJzL3hlbi9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIGRyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgfMKgIDMgKy0NCj4+IMKgIGRyaXZlcnMveGVuL3hl
bi1wY2liYWNrL3hlbmJ1cy5jwqDCoCB8wqAgMiArLQ0KPj4gwqAgaW5jbHVkZS94ZW4vcGNpLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzQgKysrKysrKysrKysrKysNCj4+
IMKgIDggZmlsZXMgY2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKyksIDEwMCBkZWxldGlvbnMoLSkN
Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3hlbi9wY2kuaA0KPj4NCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGNpLmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS94ZW4vcGNpLmgNCj4+IGluZGV4IDM1MDZkOGM1OThjMS4uOWZmN2I0OWJjYTA4IDEwMDY0
NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3BjaS5oDQo+PiArKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGNpLmgNCj4+IEBAIC0xNCwzMCArMTQsNiBAQCBzdGF0aWMg
aW5saW5lIGludCBwY2lfeGVuX2h2bV9pbml0KHZvaWQpDQo+PiDCoMKgwqDCoMKgIHJldHVybiAt
MTsNCj4+IMKgIH0NCj4+IMKgICNlbmRpZg0KPj4gLSNpZiBkZWZpbmVkKENPTkZJR19YRU5fRE9N
MCkNCj4+IC1pbnQgX19pbml0IHBjaV94ZW5faW5pdGlhbF9kb21haW4odm9pZCk7DQo+DQo+IFdo
eSBhcmUgeW91IHJlbW92aW5nIHRoaXMgcHJvdG90eXBlPyBJdCBpcyBYODYgc3BlY2lmaWMuDQpJ
bmRlZWQgaXQgaXMuIFdpbGwgbm90IHJlbW92ZSBpdCBmb3JtIHg4NiBjb2RlDQo+DQo+PiAtaW50
IHhlbl9maW5kX2RldmljZV9kb21haW5fb3duZXIoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiAt
aW50IHhlbl9yZWdpc3Rlcl9kZXZpY2VfZG9tYWluX293bmVyKHN0cnVjdCBwY2lfZGV2ICpkZXYs
IHVpbnQxNl90IGRvbWFpbik7DQo+PiAtaW50IHhlbl91bnJlZ2lzdGVyX2RldmljZV9kb21haW5f
b3duZXIoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiAtI2Vsc2UNCj4+IC1zdGF0aWMgaW5saW5l
IGludCBfX2luaXQgcGNpX3hlbl9pbml0aWFsX2RvbWFpbih2b2lkKQ0KPj4gLXsNCj4+IC3CoMKg
wqAgcmV0dXJuIC0xOw0KPj4gLX0NCj4+IC1zdGF0aWMgaW5saW5lIGludCB4ZW5fZmluZF9kZXZp
Y2VfZG9tYWluX293bmVyKHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+PiAtew0KPj4gLcKgwqDCoCBy
ZXR1cm4gLTE7DQo+PiAtfQ0KPj4gLXN0YXRpYyBpbmxpbmUgaW50IHhlbl9yZWdpc3Rlcl9kZXZp
Y2VfZG9tYWluX293bmVyKHN0cnVjdCBwY2lfZGV2ICpkZXYsDQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCBkb21haW4pDQo+
PiAtew0KPj4gLcKgwqDCoCByZXR1cm4gLTE7DQo+PiAtfQ0KPj4gLXN0YXRpYyBpbmxpbmUgaW50
IHhlbl91bnJlZ2lzdGVyX2RldmljZV9kb21haW5fb3duZXIoc3RydWN0IHBjaV9kZXYgKmRldikN
Cj4+IC17DQo+PiAtwqDCoMKgIHJldHVybiAtMTsNCj4+IC19DQo+PiAtI2VuZGlmDQo+PiDCoCDC
oCAjaWYgZGVmaW5lZChDT05GSUdfUENJX01TSSkNCj4+IMKgICNpZiBkZWZpbmVkKENPTkZJR19Q
Q0lfWEVOKQ0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3BjaS94ZW4uYyBiL2FyY2gveDg2L3Bj
aS94ZW4uYw0KPj4gaW5kZXggM2Q0MWEwOWMyYzE0Li40YTQ1YjBiZjlhZTQgMTAwNjQ0DQo+PiAt
LS0gYS9hcmNoL3g4Ni9wY2kveGVuLmMNCj4+ICsrKyBiL2FyY2gveDg2L3BjaS94ZW4uYw0KPj4g
QEAgLTIzLDYgKzIzLDcgQEANCj4+IMKgIMKgICNpbmNsdWRlIDx4ZW4vZmVhdHVyZXMuaD4NCj4+
IMKgICNpbmNsdWRlIDx4ZW4vZXZlbnRzLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+
IMKgICNpbmNsdWRlIDxhc20veGVuL3BjaS5oPg0KPj4gwqAgI2luY2x1ZGUgPGFzbS94ZW4vY3B1
aWQuaD4NCj4+IMKgICNpbmNsdWRlIDxhc20vYXBpYy5oPg0KPj4gQEAgLTU4Myw3NyArNTg0LDQg
QEAgaW50IF9faW5pdCBwY2lfeGVuX2luaXRpYWxfZG9tYWluKHZvaWQpDQo+PiDCoMKgwqDCoMKg
IH0NCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+PiAtDQo+PiAtc3RydWN0IHhl
bl9kZXZpY2VfZG9tYWluX293bmVyIHsNCj4+IC3CoMKgwqAgZG9taWRfdCBkb21haW47DQo+PiAt
wqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpkZXY7DQo+PiAtwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQg
bGlzdDsNCj4+IC19Ow0KPj4gLQ0KPj4gLXN0YXRpYyBERUZJTkVfU1BJTkxPQ0soZGV2X2RvbWFp
bl9saXN0X3NwaW5sb2NrKTsNCj4+IC1zdGF0aWMgc3RydWN0IGxpc3RfaGVhZCBkZXZfZG9tYWlu
X2xpc3QgPSBMSVNUX0hFQURfSU5JVChkZXZfZG9tYWluX2xpc3QpOw0KPj4gLQ0KPj4gLXN0YXRp
YyBzdHJ1Y3QgeGVuX2RldmljZV9kb21haW5fb3duZXIgKmZpbmRfZGV2aWNlKHN0cnVjdCBwY2lf
ZGV2ICpkZXYpDQo+PiAtew0KPj4gLcKgwqDCoCBzdHJ1Y3QgeGVuX2RldmljZV9kb21haW5fb3du
ZXIgKm93bmVyOw0KPj4gLQ0KPj4gLcKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KG93bmVyLCAm
ZGV2X2RvbWFpbl9saXN0LCBsaXN0KSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKG93bmVyLT5k
ZXYgPT0gZGV2KQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIG93bmVyOw0KPj4g
LcKgwqDCoCB9DQo+PiAtwqDCoMKgIHJldHVybiBOVUxMOw0KPj4gLX0NCj4+IC0NCj4+IC1pbnQg
eGVuX2ZpbmRfZGV2aWNlX2RvbWFpbl9vd25lcihzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4gLXsN
Cj4+IC3CoMKgwqAgc3RydWN0IHhlbl9kZXZpY2VfZG9tYWluX293bmVyICpvd25lcjsNCj4+IC3C
oMKgwqAgaW50IGRvbWFpbiA9IC1FTk9ERVY7DQo+PiAtDQo+PiAtwqDCoMKgIHNwaW5fbG9jaygm
ZGV2X2RvbWFpbl9saXN0X3NwaW5sb2NrKTsNCj4+IC3CoMKgwqAgb3duZXIgPSBmaW5kX2Rldmlj
ZShkZXYpOw0KPj4gLcKgwqDCoCBpZiAob3duZXIpDQo+PiAtwqDCoMKgwqDCoMKgwqAgZG9tYWlu
ID0gb3duZXItPmRvbWFpbjsNCj4+IC3CoMKgwqAgc3Bpbl91bmxvY2soJmRldl9kb21haW5fbGlz
dF9zcGlubG9jayk7DQo+PiAtwqDCoMKgIHJldHVybiBkb21haW47DQo+PiAtfQ0KPj4gLUVYUE9S
VF9TWU1CT0xfR1BMKHhlbl9maW5kX2RldmljZV9kb21haW5fb3duZXIpOw0KPj4gLQ0KPj4gLWlu
dCB4ZW5fcmVnaXN0ZXJfZGV2aWNlX2RvbWFpbl9vd25lcihzdHJ1Y3QgcGNpX2RldiAqZGV2LCB1
aW50MTZfdCBkb21haW4pDQo+PiAtew0KPj4gLcKgwqDCoCBzdHJ1Y3QgeGVuX2RldmljZV9kb21h
aW5fb3duZXIgKm93bmVyOw0KPj4gLQ0KPj4gLcKgwqDCoCBvd25lciA9IGt6YWxsb2Moc2l6ZW9m
KHN0cnVjdCB4ZW5fZGV2aWNlX2RvbWFpbl9vd25lciksIEdGUF9LRVJORUwpOw0KPj4gLcKgwqDC
oCBpZiAoIW93bmVyKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4gLQ0K
Pj4gLcKgwqDCoCBzcGluX2xvY2soJmRldl9kb21haW5fbGlzdF9zcGlubG9jayk7DQo+PiAtwqDC
oMKgIGlmIChmaW5kX2RldmljZShkZXYpKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxv
Y2soJmRldl9kb21haW5fbGlzdF9zcGlubG9jayk7DQo+PiAtwqDCoMKgwqDCoMKgwqAga2ZyZWUo
b3duZXIpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUVYSVNUOw0KPj4gLcKgwqDCoCB9
DQo+PiAtwqDCoMKgIG93bmVyLT5kb21haW4gPSBkb21haW47DQo+PiAtwqDCoMKgIG93bmVyLT5k
ZXYgPSBkZXY7DQo+PiAtwqDCoMKgIGxpc3RfYWRkX3RhaWwoJm93bmVyLT5saXN0LCAmZGV2X2Rv
bWFpbl9saXN0KTsNCj4+IC3CoMKgwqAgc3Bpbl91bmxvY2soJmRldl9kb21haW5fbGlzdF9zcGlu
bG9jayk7DQo+PiAtwqDCoMKgIHJldHVybiAwOw0KPj4gLX0NCj4+IC1FWFBPUlRfU1lNQk9MX0dQ
TCh4ZW5fcmVnaXN0ZXJfZGV2aWNlX2RvbWFpbl9vd25lcik7DQo+PiAtDQo+PiAtaW50IHhlbl91
bnJlZ2lzdGVyX2RldmljZV9kb21haW5fb3duZXIoc3RydWN0IHBjaV9kZXYgKmRldikNCj4+IC17
DQo+PiAtwqDCoMKgIHN0cnVjdCB4ZW5fZGV2aWNlX2RvbWFpbl9vd25lciAqb3duZXI7DQo+PiAt
DQo+PiAtwqDCoMKgIHNwaW5fbG9jaygmZGV2X2RvbWFpbl9saXN0X3NwaW5sb2NrKTsNCj4+IC3C
oMKgwqAgb3duZXIgPSBmaW5kX2RldmljZShkZXYpOw0KPj4gLcKgwqDCoCBpZiAoIW93bmVyKSB7
DQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJmRldl9kb21haW5fbGlzdF9zcGlubG9j
ayk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+PiAtwqDCoMKgIH0NCj4+
IC3CoMKgwqAgbGlzdF9kZWwoJm93bmVyLT5saXN0KTsNCj4+IC3CoMKgwqAgc3Bpbl91bmxvY2so
JmRldl9kb21haW5fbGlzdF9zcGlubG9jayk7DQo+PiAtwqDCoMKgIGtmcmVlKG93bmVyKTsNCj4+
IC3CoMKgwqAgcmV0dXJuIDA7DQo+PiAtfQ0KPj4gLUVYUE9SVF9TWU1CT0xfR1BMKHhlbl91bnJl
Z2lzdGVyX2RldmljZV9kb21haW5fb3duZXIpOw0KPj4gwqAgI2VuZGlmDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMveGVuL0tjb25maWcNCj4+IGluZGV4IGEz
N2ViNTJmYjQwMS4uMDU3ZGRmNjFlZjYxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy94ZW4vS2Nv
bmZpZw0KPj4gKysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZw0KPj4gQEAgLTE4Miw3ICsxODIsNyBA
QCBjb25maWcgU1dJT1RMQl9YRU4NCj4+IMKgIMKgIGNvbmZpZyBYRU5fUENJREVWX0JBQ0tFTkQN
Cj4+IMKgwqDCoMKgwqAgdHJpc3RhdGUgIlhlbiBQQ0ktZGV2aWNlIGJhY2tlbmQgZHJpdmVyIg0K
Pj4gLcKgwqDCoCBkZXBlbmRzIG9uIFBDSSAmJiBYODYgJiYgWEVODQo+PiArwqDCoMKgIGRlcGVu
ZHMgb24gUENJICYmIFhFTg0KPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFhFTl9CQUNLRU5EDQo+
PiDCoMKgwqDCoMKgIGRlZmF1bHQgbQ0KPj4gwqDCoMKgwqDCoCBoZWxwDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYw0KPj4gaW5kZXggYTc4NzA0YWUzNjE4Li4zNTQ5M2ZmMGQxNDYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPj4gKysrIGIvZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMNCj4+IEBAIC02NSw2ICs2NSw3IEBADQo+PiDC
oCAjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS92Y3B1Lmg+DQo+PiDCoCAjaW5jbHVkZSA8eGVuL3hl
bmJ1cy5oPg0KPj4gwqAgI2luY2x1ZGUgPGFzbS9od19pcnEuaD4NCj4+ICsjaW5jbHVkZSA8eGVu
L3BjaS5oPg0KPg0KPiBUaGlzIHdvdWxkbid0IGJlIG5lZWRlZCBpZiB5b3UnZCBsZXQgdGhlIHBj
aV94ZW5faW5pdGlhbF9kb21haW4oKQ0KPiBwcm90b3R5cGUgd2hlcmUgaXQgaGFzIGJlZW4uDQpT
dXJlLCB3aWxsIGxlYXZlIGl0IHdoZXJlIGl0IHdhcw0KPg0KPg0KPiBKdWVyZ2Vu

