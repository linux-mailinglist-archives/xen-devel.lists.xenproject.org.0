Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6D43471C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213713.372017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md78u-00064i-75; Wed, 20 Oct 2021 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213713.372017; Wed, 20 Oct 2021 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md78u-000624-3l; Wed, 20 Oct 2021 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 213713;
 Wed, 20 Oct 2021 08:40:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1md78r-00061C-Rs
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:40:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e49cd45-e735-4e29-8cad-5f9e27a8bd98;
 Wed, 20 Oct 2021 08:40:07 +0000 (UTC)
Received: from AM6PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:f0::22)
 by PAXPR08MB7351.eurprd08.prod.outlook.com (2603:10a6:102:229::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 08:40:05 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::7a) by AM6PR04CA0045.outlook.office365.com
 (2603:10a6:20b:f0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 08:40:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 08:40:04 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 20 Oct 2021 08:40:04 +0000
Received: from 5f2c7dd90d11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34486A6E-EA68-45D9-A60B-DDB5C15139F8.1; 
 Wed, 20 Oct 2021 08:39:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f2c7dd90d11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 08:39:57 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 08:39:48 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:39:48 +0000
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
X-Inumbo-ID: 0e49cd45-e735-4e29-8cad-5f9e27a8bd98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxiaJzyAJ9vIPns1RUcpKVHrvDsiW+WXq7E3XhjE48E=;
 b=2dmySWhfZ+B87FwEY3jgs3kl7DCzFhBk9BPU+0PHc4sXJj+1oUFzXH0ppBUzNhgvM1wyHQBVlEHxA8hmc4PFIVsFDe/rpRornG4FR4U+6HxGMiJSd2NFVz21oqv8Nv5bU/EdfHUG2vUX6mMER60Ztv8TrYqzG69D8NlaaNrSkQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cf4241cf3efe19f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GScaeZS1eVfMtgrHaiXyBV5KkvQKWTjhC6bDcAJMADzxbrgg7cHDbq9/UrNOTTtelPaRYRqIGXAy89zv46UjULHoHlww1I2i0EZAvqQERFIkiijy6XeUNpY5YDD7gORBdKhknafBw1m+35L4dpvWeVXTpPc4o8gUcDu73HzmeiBEDHHvN2nd9mjo7YsrXhXRqo7rODnhrZIDduDe0XfjOS6krbV/cnUNygGEqg/I1KLu5N7wxwkYt8bjws8Wjyot+miURt+Zq5CPgOPKjkA+Lv1+57ECcE32e3nxShsMnBA6I2Tf0UZIVW0YT/vE3YNR3IrOAjaSWVD5POwKngUB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxiaJzyAJ9vIPns1RUcpKVHrvDsiW+WXq7E3XhjE48E=;
 b=k/slRj7dmjzFmld/Y/stXAhv5tOGHPTze0yLhZrl6YHetsE6C8DeLq5u1QmyF1FBK/Tvak46HQnx0Z5mbBWydBhDWg8F8llUqVHBwlFBQqaI05kkDBsRdb7HiKyhcjkCI2yR7qSP6UEFFqFlSuBPWnZnxwp1LP2Kd+5S5ovWsyI5KbneIFSyw+1Pgq7srMihYAXcsMY8Z3Ew+lgjo7DUMOETUkXioJXOOjY5dnS0UXwU7s3q2m3UOBHhz+KeuYEqyN66MHssL4pofgWxfzGCJ2cyrauJEIANe1Mi2c3AlnkkQ5cPN9GW7Spq6UzS95u4OQaRocP/cajeb58clB5TVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxiaJzyAJ9vIPns1RUcpKVHrvDsiW+WXq7E3XhjE48E=;
 b=2dmySWhfZ+B87FwEY3jgs3kl7DCzFhBk9BPU+0PHc4sXJj+1oUFzXH0ppBUzNhgvM1wyHQBVlEHxA8hmc4PFIVsFDe/rpRornG4FR4U+6HxGMiJSd2NFVz21oqv8Nv5bU/EdfHUG2vUX6mMER60Ztv8TrYqzG69D8NlaaNrSkQk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
Thread-Topic: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Thread-Index: AQHXxQOsddT9Ttg6SUi4XsLpyj6SjavbjrUAgAAB9oCAAAFiAA==
Date: Wed, 20 Oct 2021 08:39:48 +0000
Message-ID: <2FAC788E-1736-450C-B9B5-BDE93E32260E@arm.com>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
 <e8f35e24-8dbe-db2c-02fd-f2290648a25a@suse.com>
In-Reply-To: <e8f35e24-8dbe-db2c-02fd-f2290648a25a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4456010-3d2c-4a68-a977-08d993a536d6
x-ms-traffictypediagnostic: DBBPR08MB5963:|PAXPR08MB7351:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB73514FAE2567D32AC748C6F59DBE9@PAXPR08MB7351.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KUd/0fEmGxzMG+sfsuhgzzimoAV638hU73wooP7Q2akxhKmibhAF/PG3jGLl1VTD8A8ZDvvvsMS/e+vylvQiJQBiNORnEEHsgmZnsBaktuKlaz2e2rKegkw/0K9pZr5i4X7j9+IC3mqwO81D6zDxBofJkrMMP/IWHu42BxMbKaq0LlG+MRM1B6VX3f6AsMWRsafH4Ee0IY6WwehWMcY8gzbvwRiR2SI44PlHpmRjzcFzl5dNq21RamB+9JIAbUs05hx+tM7r+fyGUWOfQAP+4U5b24L2tWZVn3u7/aQ+Ecq67JGGboldHSlLqoSjfDm5yBw7jk5LGhWwufaPFEBOcRr+ZXkxmb5xYPwKRMQrt/m+xR6J/e1qwIAie494EtvBHxChE4W+rLZbRkSKO6j4ROR+Qxd0feRZgXeWiR8WUyO9GyrUIPLTkjRAjM7yrTZ6PqXNWjkAnP7wXsA2+wYUIaEjTmNDSxEIAbmHkQgFnDPZG5h3HkwFzGjRRnNEy3Pa/nI8vmzF5erdq0kE4J/+n0hRMAo4TJPcO1quhJXbR3JDD7uMnc9Ik6UrnIPU/LStJclz6E/+hvtIK0HiBnAMhBqz+X2mUAa6tPzJZG9cXvb43PVFSPShWRFuP+eMZW7jPx1hMleSgEmvGyr+1OaiFB1lCtCdwOaGtMW71Eei3UumXso0JDqlP97KJFpUQFFmwJTwslq5E0lZXQ1haaGidZZvnNjEWr0luhhmGkIo4t2D7FTkMddc69LIIzbgr+fZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(54906003)(122000001)(6512007)(83380400001)(8676002)(8936002)(66556008)(316002)(2616005)(6486002)(33656002)(5660300002)(64756008)(66446008)(66476007)(76116006)(91956017)(38100700002)(66946007)(36756003)(6916009)(4326008)(26005)(508600001)(2906002)(186003)(6506007)(53546011)(7416002)(86362001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB8E0D7F6CA92C4895202CF572F35DDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccac6cc5-b0f1-4734-c1fb-08d993a52d52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/C8Qjt14wz+1Y7PgA2/GlbahwTYWWYJAS0tmMjRJMR5+DKwgxHo/NpPTOJNZ2F4H0LFzuQIYh9kg4VA8vjA6wpPtEzcaRipZKuZGhFzf+BIxG+hLJXEcd9Z3og5GgHzDS6DYUMUDT3iHZm9RDc15h2JkIuYRFia/0Z0/FcM8LOWPdpcbBTbHDe+rNEE/PxbbDJoyd6zCiNn+lr49+5B7DVP+q4kMxEH0DzHFmcMOCkuWeAlXK5A+ApUlJ6cCJF99ku7aFk7WmCW5UYIwAhiSMdmyzBm7HJYRDqrzY+LRqDARwH4VJC6XSeJ5MD46jaTO1mM96DsGGaRkDCJLfw6ZgMuVsVdW27IPEWi8SbSA3NVQPFNcQKxo+Z9NZnOsglSYCtYrWLxrwwJBf5bAGheufiFiaH1C2YkXv55IUs3GO10R4m/yuAZbf2pK6nVBUJJbW1V3NpeZRgSaCbw5mmAXZInWMKoMCKMkqw2+1WvqC6fdVWLZQrgBBY2Z22ZRcgzHJFfoTxp8cid7YTVhvwAn81uYpkOEb++aplnagG0Aja2swf+G7v1z0UfZyqViwd95S9u1+nWz4zTY7NcsA0D4Alnlf2g0sVj5ade6yx09KkTDEXHF6EAAJgrjXXeV9+OucljS76uLqRqLegFhJroMr4xz9p5RynL+VhwHFyPJ4q9alOC0vRsRJjrwSJxkgBkTOEZ3JjvJ/2LbybW6BldqAQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(54906003)(83380400001)(36756003)(6486002)(36860700001)(6512007)(4326008)(2616005)(186003)(26005)(6506007)(82310400003)(336012)(33656002)(81166007)(8936002)(53546011)(8676002)(70586007)(70206006)(2906002)(47076005)(508600001)(5660300002)(356005)(6862004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:40:04.7980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4456010-3d2c-4a68-a977-08d993a536d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7351

SGksDQoNCj4gT24gMjAgT2N0IDIwMjEsIGF0IDA5OjM0LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAuMTAuMjAyMSAxMDoyNywgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+IE9uIFR1ZSwgT2N0IDE5LCAyMDIxIGF0IDA1OjA4OjI4UE0gKzAxMDAs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gWGVuIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGRp
c2NvdmVyIGF0IGJvb3QgdGltZSBhbGwgZGV2aWNlcyBvciBzb21lIGRldmljZXMNCj4+PiBtaWdo
dCBhcHBlYXIgYWZ0ZXIgc3BlY2lmaWMgYWN0aW9ucyBmcm9tIGRvbTAuDQo+Pj4gSW4gdGhpcyBj
YXNlIGRvbTAgY2FuIHVzZSB0aGUgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkIHRvIHNpZ25hbCBz
b21lDQo+Pj4gUENJIGRldmljZXMgdG8gWGVuLg0KPj4+IEFzIHRob3NlIGRldmljZXMgd2hlcmUg
bm90IGtub3duIGZyb20gWGVuIGJlZm9yZSwgdGhlIHZwY2kgaGFuZGxlcnMgbXVzdA0KPj4+IGJl
IHByb3Blcmx5IGluc3RhbGxlZCBkdXJpbmcgcGNpX2RldmljZV9hZGQgZm9yIHg4NiBQVkggRG9t
MCwgaW4gdGhlDQo+Pj4gc2FtZSB3YXkgYXMgd2hhdCBpcyBkb25lIGN1cnJlbnRseSBvbiBhcm0g
KHdoZXJlIFhlbiBkb2VzIG5vdCBkZXRlY3QgUENJDQo+Pj4gZGV2aWNlcyBidXQgcmVsaWVzIG9u
IERvbTAgdG8gZGVjbGFyZSB0aGVtIGFsbCB0aGUgdGltZSkuDQo+Pj4gDQo+Pj4gU28gdGhpcyBw
YXRjaCBpcyByZW1vdmluZyB0aGUgaWZkZWYgcHJvdGVjdGluZyB0aGUgY2FsbCB0bw0KPj4+IHZw
Y2lfYWRkX2hhbmRsZXJzIGFuZCB0aGUgY29tbWVudCB3aGljaCB3YXMgYXJtIHNwZWNpZmljLg0K
Pj4+IA0KPj4+IHZwY2lfYWRkX2hhbmRsZXJzIGlzIGNhbGxlZCBvbiBkdXJpbmcgcGNpX2Rldmlj
ZV9hZGQgd2hpY2ggY2FuIGJlIGNhbGxlZA0KPj4+IGF0IHJ1bnRpbWUgdGhyb3VnaCBoeXBlcmNh
bGwgcGh5c2Rldl9vcC4NCj4+PiBSZW1vdmUgX19od2RvbV9pbml0IGFzIHRoZSBjYWxsIGlzIG5v
dCBsaW1pdGVkIGFueW1vcmUgdG8gaGFyZHdhcmUNCj4+PiBkb21haW4gaW5pdCBhbmQgZml4IGxp
bmtlciBzY3JpcHQgdG8gb25seSBrZWVwIHZwY2lfYXJyYXkgaW4gcm9kYXRhDQo+Pj4gc2VjdGlv
bi4NCj4+PiANCj4+PiBBZGQgbWlzc2luZyB2cGNpIGhhbmRsZXJzIGNsZWFudXAgZHVyaW5nIHBj
aV9kZXZpY2VfcmVtb3ZlIGFuZCBpbiBjYXNlDQo+Pj4gb2YgZXJyb3Igd2l0aCBpb21tdSBkdXJp
bmcgcGNpX2RldmljZV9hZGQuDQo+Pj4gDQo+Pj4gQWRkIGVtcHR5IHN0YXRpYyBpbmxpbmUgZm9y
IHZwY2lfcmVtb3ZlX2RldmljZSB3aGVuIENPTkZJR19WUENJIGlzIG5vdA0KPj4+IGRlZmluZWQu
DQo+Pj4gDQo+Pj4gRml4ZXM6IGQ1OTE2OGRjMDUgKCJ4ZW4vYXJtOiBFbmFibGUgdGhlIGV4aXN0
aW5nIHg4NiB2aXJ0dWFsIFBDSSBzdXBwb3J0DQo+Pj4gZm9yIEFSTSIpDQo+Pj4gU3VnZ2VzdGVk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
QmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+IC0tLQ0KPj4+
IENoYW5nZXMgaW4gdjINCj4+PiAtIGFkZCBjb21tZW50IHN1Z2dlc3RlZCBieSBKYW4gb24gdG9w
IG9mIHZwY2lfYWRkX2hhbmRsZXJzIGNhbGwNCj4+PiAtIG1lcmdlIHRoZSAzIHBhdGNoZXMgb2Yg
dGhlIHNlcmllIGluIG9uZSBwYXRjaCBhbmQgcmVuYW1lZCBpdA0KPj4+IC0gZml4IHg4NiBhbmQg
YXJtIGxpbmtlciBzY3JpcHQgdG8gb25seSBrZWVwIHZwY2lfYXJyYXkgaW4gcm9kYXRhIGFuZA0K
Pj4+IG9ubHkgd2hlbiBDT05GSUdfVlBDSSBpcyBzZXQuDQo+Pj4gLS0tDQo+Pj4geGVuL2FyY2gv
YXJtL3hlbi5sZHMuUyAgICAgICAgfCA5ICstLS0tLS0tLQ0KPj4+IHhlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMgICAgICAgIHwgOSArLS0tLS0tLS0NCj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYyB8IDggKysrKy0tLS0NCj4+PiB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAgICB8IDIg
Ky0NCj4+PiB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8IDIgKysNCj4+PiA1IGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5T
DQo+Pj4gaW5kZXggYjc3M2Y5MWYxYy4uMDgwMTY5NDhhYiAxMDA2NDQNCj4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0veGVuLmxkcy5TDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPj4+
IEBAIC02MCw3ICs2MCw3IEBAIFNFQ1RJT05TDQo+Pj4gICAgICAgICooLnByb2MuaW5mbykNCj4+
PiAgICAgICAgX19wcm9jX2luZm9fZW5kID0gLjsNCj4+PiANCj4+PiAtI2lmIGRlZmluZWQoQ09O
RklHX0hBU19WUENJKSAmJiBkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4+ICsjaWZkZWYg
Q09ORklHX0hBU19WUENJDQo+Pj4gICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsNCj4+
PiAgICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsNCj4+PiAgICAgICAgKihTT1JUKC5kYXRh
LnZwY2kuKikpDQo+Pj4gQEAgLTE4OSwxMyArMTg5LDYgQEAgU0VDVElPTlMNCj4+PiAgICAgICAg
KiguaW5pdF9hcnJheSkNCj4+PiAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQ0KPj4+ICAg
ICAgICBfX2N0b3JzX2VuZCA9IC47DQo+Pj4gLQ0KPj4+IC0jaWYgZGVmaW5lZChDT05GSUdfSEFT
X1ZQQ0kpICYmICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4+IC0gICAgICAgLiA9IEFM
SUdOKFBPSU5URVJfQUxJR04pOw0KPj4+IC0gICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsN
Cj4+PiAtICAgICAgICooU09SVCguZGF0YS52cGNpLiopKQ0KPj4+IC0gICAgICAgX19lbmRfdnBj
aV9hcnJheSA9IC47DQo+Pj4gLSNlbmRpZg0KPj4+ICAgfSA6dGV4dA0KPj4+ICAgX19pbml0X2Vu
ZF9lZmkgPSAuOw0KPj4+ICAgLiA9IEFMSUdOKFNUQUNLX1NJWkUpOw0KPj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+IGlu
ZGV4IDExYjFkYTIxNTQuLjg3ZTM0NGQ0ZGQgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L3hlbi5sZHMuUw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+PiBAQCAtMTM0
LDcgKzEzNCw3IEBAIFNFQ1RJT05TDQo+Pj4gICAgICAgICooLmV4X3RhYmxlLnByZSkNCj4+PiAg
ICAgICAgX19zdG9wX19fcHJlX2V4X3RhYmxlID0gLjsNCj4+PiANCj4+PiAtI2lmIGRlZmluZWQo
Q09ORklHX0hBU19WUENJKSAmJiBkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4+ICsjaWZk
ZWYgQ09ORklHX0hBU19WUENJDQo+Pj4gICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsN
Cj4+PiAgICAgICAgX19zdGFydF92cGNpX2FycmF5ID0gLjsNCj4+PiAgICAgICAgKihTT1JUKC5k
YXRhLnZwY2kuKikpDQo+Pj4gQEAgLTI0NywxMyArMjQ3LDYgQEAgU0VDVElPTlMNCj4+PiAgICAg
ICAgKiguaW5pdF9hcnJheSkNCj4+PiAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQ0KPj4+
ICAgICAgICBfX2N0b3JzX2VuZCA9IC47DQo+Pj4gLQ0KPj4+IC0jaWYgZGVmaW5lZChDT05GSUdf
SEFTX1ZQQ0kpICYmICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4+IC0gICAgICAgLiA9
IEFMSUdOKFBPSU5URVJfQUxJR04pOw0KPj4+IC0gICAgICAgX19zdGFydF92cGNpX2FycmF5ID0g
LjsNCj4+PiAtICAgICAgICooU09SVCguZGF0YS52cGNpLiopKQ0KPj4+IC0gICAgICAgX19lbmRf
dnBjaV9hcnJheSA9IC47DQo+Pj4gLSNlbmRpZg0KPj4+ICAgfSBQSERSKHRleHQpDQo+Pj4gDQo+
Pj4gICAuID0gQUxJR04oU0VDVElPTl9BTElHTik7DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+
PiBpbmRleCAzNWUwMTkwNzk2Li44OTI4YTFjMDdkIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMNCj4+PiBAQCAtNzU2LDEwICs3NTYsOSBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNl
ZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+PiAgICAgaWYgKCAhcGRldi0+ZG9tYWluICkNCj4+PiAg
ICAgew0KPj4+ICAgICAgICAgcGRldi0+ZG9tYWluID0gaGFyZHdhcmVfZG9tYWluOw0KPj4+IC0j
aWZkZWYgQ09ORklHX0FSTQ0KPj4+ICAgICAgICAgLyoNCj4+PiAtICAgICAgICAgKiBPbiBBUk0g
UENJIGRldmljZXMgZGlzY292ZXJ5IHdpbGwgYmUgZG9uZSBieSBEb20wLiBBZGQgdnBjaSBoYW5k
bGVyDQo+Pj4gLSAgICAgICAgICogd2hlbiBEb20wIGluZm9ybSBYRU4gdG8gYWRkIHRoZSBQQ0kg
ZGV2aWNlcyBpbiBYRU4uDQo+Pj4gKyAgICAgICAgICogRm9yIGRldmljZXMgbm90IGRpc2NvdmVy
ZWQgYnkgWGVuIGR1cmluZyBib290LCBhZGQgdlBDSSBoYW5kbGVycw0KPj4+ICsgICAgICAgICAq
IHdoZW4gRG9tMCBmaXJzdCBpbmZvcm1zIFhlbiBhYm91dCBzdWNoIGRldmljZXMuDQo+Pj4gICAg
ICAgICAgKi8NCj4+PiAgICAgICAgIHJldCA9IHZwY2lfYWRkX2hhbmRsZXJzKHBkZXYpOw0KPj4+
ICAgICAgICAgaWYgKCByZXQgKQ0KPj4gDQo+PiBTb3JyeSB0byBiZSBhIHBhaW4sIGJ1dCBJIHRo
aW5rIHRoaXMgcGxhY2VtZW50IG9mIHRoZSBjYWxsIHRvDQo+PiB2cGNpX2FkZF9oYW5kbGVycyBp
cyBib2d1cyBhbmQgc2hvdWxkIGluc3RlYWQgYmUgZG9uZSBzdHJpY3RseSBhZnRlcg0KPj4gdGhl
IGRldmljZSBoYXMgYmVlbiBhZGRlZCB0byB0aGUgaGFyZHdhcmVfZG9tYWluLT5wZGV2X2xpc3Qg
bGlzdC4NCj4+IA0KPj4gT3RoZXJ3aXNlIHRoZSBsb29wIG92ZXIgZG9tYWluLT5wZGV2X2xpc3Qg
KGZvcl9lYWNoX3BkZXYpIGluDQo+PiBtb2RpZnlfYmFycyB3b24ndCBiZSBhYmxlIHRvIGZpbmQg
dGhlIGRldmljZSBhbmQgaGl0IHRoZSBhc3NlcnQgYmVsb3cNCj4+IGl0LiBUaGF0IGNhbiBoYXBw
ZW4gaW4gdnBjaV9hZGRfaGFuZGxlcnMgYXMgaXQgd2lsbCBjYWxsIGluaXRfYmFycw0KPj4gd2hp
Y2ggaW4gdHVybiB3aWxsIGNhbGwgaW50byBtb2RpZnlfYmFycyBpZiBtZW1vcnkgZGVjb2Rpbmcg
aXMgZW5hYmxlZA0KPj4gZm9yIHRoZSBkZXZpY2UuDQo+IA0KPiBPaCwgZ29vZCBwb2ludC4gQW5k
IEkgc2hvdWxkIGhhdmUgdGhvdWdodCBvZiB0aGlzIG15c2VsZiwgZ2l2ZW4gdGhhdA0KPiBJIGRp
ZCBoaXQgdGhhdCBBU1NFUlQoKSByZWNlbnRseSB3aXRoIGEgaGlkZGVuIGRldmljZS4gRlRBT0Qg
SSB0aGluaw0KPiB0aGlzIG1lYW5zIHRoYXQgdGhlIGxpc3QgYWRkaXRpb24gd2lsbCBuZWVkIHRv
IG1vdmUgdXAgKGFuZCB0aGVuDQo+IHdvdWxkIG5lZWQgdW5kb2luZyBvbiB0aGUgZXJyb3IgcGF0
aChzKSkuDQoNCkFncmVlLCBJIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBjYWxsaW5nIGlv
bW11X2FkZF9kZXZpY2UgaXMgbm90DQppbXBhY3RlZCBieSB0aGlzLiBJdCBpcyBwcm9iYWJseSBu
b3QgYnV0IGEgY29uZmlybWF0aW9uIHdvdWxkIGJlIGdvb2QuDQoNCkp1c3QgdG8gY29uZmlybSwg
dGhpcyBzcGVjaWZpYyBjaGFuZ2Ugd291bGQgbG9vayBsaWtlIHRoYXQ6DQpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYw0KaW5kZXggODkyOGExYzA3ZC4uMGQ4YWIyZTcxNiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KQEAgLTc1Niw2ICs3NTYsOCBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbiwNCiAgICAgaWYgKCAhcGRldi0+ZG9tYWluICkNCiAgICAgew0KICAgICAgICAg
cGRldi0+ZG9tYWluID0gaGFyZHdhcmVfZG9tYWluOw0KKyAgICAgICAgbGlzdF9hZGQoJnBkZXYt
PmRvbWFpbl9saXN0LCAmaGFyZHdhcmVfZG9tYWluLT5wZGV2X2xpc3QpOw0KKw0KICAgICAgICAg
LyoNCiAgICAgICAgICAqIEZvciBkZXZpY2VzIG5vdCBkaXNjb3ZlcmVkIGJ5IFhlbiBkdXJpbmcg
Ym9vdCwgYWRkIHZQQ0kgaGFuZGxlcnMNCiAgICAgICAgICAqIHdoZW4gRG9tMCBmaXJzdCBpbmZv
cm1zIFhlbiBhYm91dCBzdWNoIGRldmljZXMuDQpAQCAtNzY0LDYgKzc2Niw3IEBAIGludCBwY2lf
YWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLA0KICAgICAgICAgaWYgKCByZXQg
KQ0KICAgICAgICAgew0KICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJTZXR1cCBvZiB2
UENJIGZhaWxlZDogJWRcbiIsIHJldCk7DQorICAgICAgICAgICAgbGlzdF9kZWwoJnBkZXYtPmRv
bWFpbl9saXN0KTsNCiAgICAgICAgICAgICBwZGV2LT5kb21haW4gPSBOVUxMOw0KICAgICAgICAg
ICAgIGdvdG8gb3V0Ow0KICAgICAgICAgfQ0KQEAgLTc3MSwxMSArNzc0LDEwIEBAIGludCBwY2lf
YWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLA0KICAgICAgICAgaWYgKCByZXQg
KQ0KICAgICAgICAgew0KICAgICAgICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZShwZGV2KTsNCisg
ICAgICAgICAgICBsaXN0X2RlbCgmcGRldi0+ZG9tYWluX2xpc3QpOw0KICAgICAgICAgICAgIHBk
ZXYtPmRvbWFpbiA9IE5VTEw7DQogICAgICAgICAgICAgZ290byBvdXQ7DQogICAgICAgICB9DQot
DQotICAgICAgICBsaXN0X2FkZCgmcGRldi0+ZG9tYWluX2xpc3QsICZoYXJkd2FyZV9kb21haW4t
PnBkZXZfbGlzdCk7DQogICAgIH0NCiAgICAgZWxzZQ0KDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K
PiANCj4gSmFuDQo+IA0KPiANCg0K

