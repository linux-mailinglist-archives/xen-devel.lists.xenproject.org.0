Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1444C6936
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280398.478335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdkA-0006qA-9X; Mon, 28 Feb 2022 10:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280398.478335; Mon, 28 Feb 2022 10:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdkA-0006oF-4V; Mon, 28 Feb 2022 10:59:06 +0000
Received: by outflank-mailman (input) for mailman id 280398;
 Mon, 28 Feb 2022 10:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+aRg=TL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nOdk8-0006o9-O4
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:59:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c055f55-9885-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 11:58:55 +0100 (CET)
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by AM5PR0801MB1746.eurprd08.prod.outlook.com (2603:10a6:203:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 10:58:59 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::f7) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Mon, 28 Feb 2022 10:58:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Mon, 28 Feb 2022 10:58:59 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Mon, 28 Feb 2022 10:58:59 +0000
Received: from 934c4f137e48.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18F71A42-F5AA-4357-BEBE-7B441BA11F73.1; 
 Mon, 28 Feb 2022 10:58:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 934c4f137e48.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Feb 2022 10:58:48 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM0PR08MB3154.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 10:58:46 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5017.026; Mon, 28 Feb
 2022 10:58:46 +0000
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
X-Inumbo-ID: 6c055f55-9885-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoUexgLwkNBY6TJrBqOMyZkSaJA5m1dC2NBxKn56Wg4=;
 b=AXHBXyQY3gkHXcywVJbpOb97tUA/Gcca/ssapNpmHRz5KEEzUyTiM2y8WYZEmk/M4pB1jM1GgWwxiSKYp25agWBaui0GPNyEjBvgQF4tRLDADh+103on/ue+5p83DrdSN41NodVqe0yoxbruBm+G5eNDpl0EsCRMgX9pJYQ/fvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d1ec8e5968c1f85
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOXHCZhSCDBfXL3xVcjkcl7vicYWM1lJgUwlfSjRvssyoMndc1uKwbzcLMcvSs0Hn5YUKHq3rBXNidDoFZe/9OTg/qFZFlOM44kvr8H2j/Iw630bbmn0SQ316IKrfDNpuyso1rDs1mAj4zmShGSm5Y28p5ZTYu00y/5yvobxeT0oqkJQ2mY5VWD23D08SENlIW+zAMXHJi4vE3V9xDeUJIXiS0qTQfkmPjtkF9ErbbooBWxAsl7SrzxLicm/t4ee9gnd7suS4n+JlQ1z1XGUt8/9Kuoy8YhcRGSKT+zEzVREiS9OMmt/k1KbO7JlCK9j0L5UIDuiW011+/PZRfx4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoUexgLwkNBY6TJrBqOMyZkSaJA5m1dC2NBxKn56Wg4=;
 b=M+0v4YcP44eiXkkdekYnsycjt+M1RIRklpvaGMLaTDY8l++Di1nmR/nwJZfPKX2uM8tq4l/4tT1rwvBzJ/tdYfSVBoUvx9npNXIw/F+elP0Zmpl35YizmJ3PxKMdN7G8hx3qlCjAryzFvfyhQUtZM+03+DxtQIl/j/Z7rPSPqrUqEt/6Kjq/ZjtsDZAhzaFJ1AoueQ1wINqarMahakyY5mMt8AfLfbMMsLfOgxOeGtJfK1gKEfZl+jtaEI1swuSucszK9lK7vlRPDHAN5DyCN+R4haOjnAn9N6EE4dNRRm91V6UnddIj8u1m3JXxKsV/7DOMNvW63/OfG5sIgpi6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoUexgLwkNBY6TJrBqOMyZkSaJA5m1dC2NBxKn56Wg4=;
 b=AXHBXyQY3gkHXcywVJbpOb97tUA/Gcca/ssapNpmHRz5KEEzUyTiM2y8WYZEmk/M4pB1jM1GgWwxiSKYp25agWBaui0GPNyEjBvgQF4tRLDADh+103on/ue+5p83DrdSN41NodVqe0yoxbruBm+G5eNDpl0EsCRMgX9pJYQ/fvE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: vpci: remove PCI I/O ranges property value
Thread-Topic: [PATCH v2] xen/arm: vpci: remove PCI I/O ranges property value
Thread-Index: AQHYIoHYpqU3AM3970ClQynMQHDrAKyku6EAgAQjqoA=
Date: Mon, 28 Feb 2022 10:58:46 +0000
Message-ID: <AA247D7F-A6FA-400A-9D2E-CB1FCA6B9BE5@arm.com>
References:
 <8ea25f00c8641bfd95a4d8444b82ca2ac3ee5ce0.1644939115.git.rahul.singh@arm.com>
 <dbe2395b-c533-c7f1-bec1-70f4399b430a@xen.org>
In-Reply-To: <dbe2395b-c533-c7f1-bec1-70f4399b430a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 87bbb78e-7e4a-48dc-9bbf-08d9faa952dc
x-ms-traffictypediagnostic:
	AM0PR08MB3154:EE_|DB5EUR03FT023:EE_|AM5PR0801MB1746:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB17460FD1BE742BFBF9CEDE07FC019@AM5PR0801MB1746.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OIh9QvutfQSQp8MS6Tqd5YtW7EJUAK0LydKaycYJU1f6KsFbn0HESnNA/EGqip+e3v10dV9iKrRQE4SmXPiK4lu1Z6zrnxfl32Efp3gYPX0O3xRnBssIS6ykqFj8V5iE+YuZlORJtqvjLib7UNqCSUez1wQC29VpRWldyLNIOK6QA4zS7qoDgRbh9Aq7Tz+u2KJ1fH7HjSBVWwE/0zOfWz23jnT7BQY4nHg960OLAQlWW85HmjJ4FZciLLl0rgCz4BGiyyaU/3yXqHkvkGQxDAz2+7aVx/saxm1QCkmciDS2pDU2uwS6DIXtO4KvMuqIX+HkyJ5uOJx9UyACt6oiMhfaMZTyZh23feOSZkcB3jU1YbtzWlyAES4VVXkSh0f3q6V4aI63kMU3QOHvcgNaoJ8IkGsPqD79L5y0M2Hhh1aF0IfM7WI/NbGpeMCTf5RWV6HlXhxJ+7Y+syqAHFqJs1r3e2N2eR2azX+BJmRBuA9alicmOCvhLq2q3UZTwEkCxfL+JZ9zh9eVKqwu55aKloQTRsFzItmyvYTMctJADYc5aLE6uELJrlzS+XUlYmu8GWW8gQ9z285A24jhCuXFCaWD5jBjUszy1oxG/Gde3aFvG9+bUiNQWi370LUIyCo8E7oNT8HFZtTt+abIl3IoOFNQimMxLIg40vYMwWq5sOkJi9DWFbxxdrgIQfeLdgzvW8F8nMvfj5ytZF/advBb60FLZGenhX2/+Q6tkEy4ZM7FPM4a+SU/9Cl5Ab1FioQU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(6916009)(5660300002)(2616005)(6486002)(508600001)(83380400001)(54906003)(53546011)(66476007)(316002)(66946007)(91956017)(76116006)(64756008)(66446008)(8676002)(66556008)(4326008)(86362001)(8936002)(122000001)(71200400001)(36756003)(33656002)(38100700002)(186003)(6506007)(2906002)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F503732964DA9A4F9F58BF525BB6E4CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3154
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c4934ce-f3a0-447e-66bc-08d9faa94aeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DLj9V+39ooOZhaXfbaJadifeLCuxxv/7K96kum+xYFogs/96q7lAwR4IOS3g1nz6QRvAXpfhqClTlPNSoRd0W55LwQwh1QNAW4T37rtnF7qnsow6NcV2b39T3GWZL0Qwg0MfGnVAgCwWTHGEAttQdaPI+hwfjgvtCwLExW0GIt1X1g3EE/yv+vMKtWnNLii7yajl3Q2KkLAA8xDTuGs5XzRLkJcWO7pXNiioGwPBhRbl2OgpVzX0PjV7mHMG9TY1k49fqdjvdm6sQLWeOOI4f5O1PsLPAvvPPrQ68QgcYpuJz1v9Kn7taYfTuJmKsL3v6RK33eE8zfrSDnAMzTFeHJziceKtUOTxd9yQmm2xNlIyxgZkW8QiHvGIEhN7KEI3UMRfDT6SOq5q/leSyvmR20BMINBrjVyzWSgrsLcctZyDCXpWv0ffO9D7j/p+D+CEZAVttm8uejkpG+DqQHMlHBBDu0qZTsPuojpsDebNHPBIs8fGizKYxVMWLFW1OSaez7aF8snNRkzHT9diR0Q3qvmG0O6CAbZ1d2WRJSok66+7Naj7VyJ5Nji8ZHAQkweUNNDZnUBN1UVc8LNdY7OH6HDFe0lK3Ju9Li+8ej3AfRah3BSM2qj7ASmt6lk5UV/kDQ482z9W/9lcl+XvYRdWByyS8S2wUFepQpB9djVkI83kGK1QeySFQmm04Rhd2cH5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(82310400004)(107886003)(316002)(6486002)(508600001)(6506007)(6512007)(356005)(53546011)(54906003)(2616005)(26005)(186003)(336012)(81166007)(33656002)(4326008)(8936002)(47076005)(6862004)(8676002)(5660300002)(40460700003)(2906002)(36860700001)(86362001)(70586007)(70206006)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:58:59.6086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bbb78e-7e4a-48dc-9bbf-08d9faa952dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1746

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgY29kZS4NCg0KPiBPbiAyNSBG
ZWIgMjAyMiwgYXQgNzo0NiBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDE1LzAyLzIwMjIgMTU6MzYsIFJhaHVsIFNpbmdo
IHdyb3RlOg0KPj4gUENJIEkvTyBzcGFjZSBhcmUgbm90IG1hcHBlZCB0byBkb20wIHdoZW4gUENJ
IHBhc3N0aHJvdWdoIGlzIGVuYWJsZWQsDQo+PiBhbHNvIHRoZXJlIGlzIG5vIHZwY2kgdHJhcCBo
YW5kbGVyIHJlZ2lzdGVyIGZvciBJTyBiYXIuDQo+PiBSZW1vdmUgUENJIEkvTyByYW5nZXMgcHJv
cGVydHkgdmFsdWUgZnJvbSBkb20wIGRldmljZSB0cmVlIG5vZGUgc28gdGhhdA0KPj4gZG9tMCBs
aW51eCB3aWxsIG5vdCBhbGxvY2F0ZSBJL08gc3BhY2UgZm9yIFBDSSBkZXZpY2VzIGlmDQo+PiBw
Y2ktcGFzc3Rocm91Z2ggaXMgZW5hYmxlZC4NCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdo
IDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+PiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jICAgfCAyOSArKysrKysrKysrKysrKysNCj4+ICB4ZW4vY29tbW9uL2RldmljZV90cmVl
LmMgICAgICB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgeGVu
L2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggfCAxMCArKysrKw0KPj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTA4IGluc2VydGlvbnMoKykNCj4gDQo+IEZvciBmdXR1cmUgdmVyc2lvbiwgcGxlYXNlIGFk
ZCBhIGNoYW5nZWxvZy4gVGhpcyBoZWxwcyB0byBmaWd1cmUgb3V0IHdoYXQgY2hhbmdlZCBtb3Jl
IGVhc2lseS4NCg0KT2suIEkgd2lsbCBhZGQgdGhlIGNoYW5nZWxvZyBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCA2OTMxYzAyMmEyLi43Y2ZlNjRmZTk3
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC02NDgsNiArNjQ4LDMxIEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5KHN0cnVjdCBkb21haW4gKmQsDQo+
PiAgfQ0KPj4gICNlbmRpZg0KPj4gICsvKg0KPj4gKyAqIFBDSSBJTyBiYXIgYXJlIG5vdCBtYXBw
ZWQgdG8gZG9tMCB3aGVuIFBDSSBwYXNzdGhyb3VnaCBpcyBlbmFibGVkLCBhbHNvDQo+PiArICog
dGhlcmUgaXMgbm8gdHJhcCBoYW5kbGVyIHJlZ2lzdGVyZWQgZm9yIElPIGJhciwgdGhlcmVmb3Jl
IHJlbW92ZSB0aGUgSU8NCj4+ICsgKiByYW5nZSBwcm9wZXJ0eSBmcm9tIHRoZSBkZXZpY2UgdHJl
ZSBub2RlIGZvciBkb20wLg0KPj4gKyAqLw0KPj4gK3N0YXRpYyBpbnQgaGFuZGxlX2xpbnV4X3Bj
aV9pb19yYW5nZXMoc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9k
ZSkNCj4+ICt7DQo+PiArICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIGlmICggIWR0X2RldmljZV90eXBl
X2lzX2VxdWFsKG5vZGUsICJwY2kiKSApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+
ICsgICAgLyoNCj4+ICsgICAgICogVGhlIGN1cnJlbnQgaGV1cmlzdGljIGFzc3VtZXMgdGhhdCBh
IGRldmljZSBpcyBhIGhvc3QgYnJpZGdlDQo+PiArICAgICAqIGlmIHRoZSB0eXBlIGlzICJwY2ki
IGFuZCB0aGVuIHBhcmVudCB0eXBlIGlzIG5vdCAicGNpIi4NCj4+ICsgICAgICovDQo+PiArICAg
IGlmICggbm9kZS0+cGFyZW50ICYmIGR0X2RldmljZV90eXBlX2lzX2VxdWFsKG5vZGUtPnBhcmVu
dCwgInBjaSIpICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPiANCj4gDQo+IFRoZSBsb2dpYyBh
Ym92ZSBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIGluIGhhbmRsZV9saW51eF9wY2lfZG9tYWluKCku
IENhbiB3ZSBjcmVhdGUgYW4gaGVscGVyIHRoYXQgY291bGQgYmUgdXNlZCBieSBib3RoIGZ1bmN0
aW9ucz8gVGhpcyB3b3VsZCBoZWxwIHRvIGtlZXAgdGhlIGxvZ2ljIHN5bmNocm9uaXplZC4NCg0K
T2suIEkgd2lsbCBjcmVhdGUgdGhlIGhlbHBlciBuYW1lIOKAnGR0X25vZGVfY2hlY2tfcGNpX2hv
c3RicmlkZ2UoLi4p4oCdLg0KDQo+IA0KPj4gKw0KPj4gKyAgICByZXR1cm4gZHRfcGNpX3JlbW92
ZV9pb19yYW5nZXMoa2luZm8tPmZkdCwgbm9kZSk7DQo+PiArfQ0KPj4gKw0KPj4gKw0KPj4gIC8q
DQo+PiAgICogV2hlbiBQQ0kgcGFzc3Rocm91Z2ggaXMgYXZhaWxhYmxlIHdlIHdhbnQgdG8ga2Vl
cCB0aGUNCj4+ICAgKiAibGludXgscGNpLWRvbWFpbiIgaW4gc3luYyBmb3IgZXZlcnkgaG9zdCBi
cmlkZ2UuDQo+PiBAQCAtNzIzLDYgKzc0OCwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9w
cm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+
PiAgICAgIGlmICggaW9tbXVfbm9kZSAmJiBkZXZpY2VfZ2V0X2NsYXNzKGlvbW11X25vZGUpICE9
IERFVklDRV9JT01NVSApDQo+PiAgICAgICAgICBpb21tdV9ub2RlID0gTlVMTDsNCj4+ICArICAg
IHJlcyA9IGhhbmRsZV9saW51eF9wY2lfaW9fcmFuZ2VzKGtpbmZvLCBub2RlKTsNCj4+ICsgICAg
aWYgKCByZXMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJlczsNCj4+ICsNCj4+ICAgICAgZHRfZm9y
X2VhY2hfcHJvcGVydHlfbm9kZSAobm9kZSwgcHJvcCkNCj4+ICAgICAgew0KPj4gICAgICAgICAg
Y29uc3Qgdm9pZCAqcHJvcF9kYXRhID0gcHJvcC0+dmFsdWU7DQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9kZXZpY2VfdHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+PiBpbmRl
eCA0YWFlMjgxZTg5Li41NWE4ODNlMGY2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kZXZp
Y2VfdHJlZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMNCj4gDQo+IElmIEkg
YW0gbm90IG1pc3Rha2VuLCB0aGUgZmlsZSBjb21tb24vZGV2aWNlX3RyZWUuYyBpcyBzbyBmYXIg
b25seSBjb250YWluaW5nIGNvZGUgdG8gcGFyc2UgdGhlIGhvc3QgZGV2aWNlLXRyZWUuIEJ1dCBu
b3cuLi4NCj4gDQo+PiBAQCAtMjE5NSw2ICsyMTk1LDc1IEBAIGludCBkdF9nZXRfcGNpX2RvbWFp
bl9ucihzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUpDQo+PiAgICAgIHJldHVybiAodTE2KWRv
bWFpbjsNCj4+ICB9DQo+PiAgK2ludCBkdF9wY2lfcmVtb3ZlX2lvX3Jhbmdlcyh2b2lkICpmZHQs
IGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPiANCj4geW91IGFyZSBpbnRyb2R1
Y2luZyBjb2RlIHRvIHdyaXRlIHRoZSBkb21haW4gZGV2aWNlLXRyZWUuIEkgdW5kZXJzdGFuZCB0
aGlzIGlzIGJlY2F1c2UgZHRfbWF0Y2hfYnVzKCkgaXMgaW50ZXJuYWwuIEhvd2V2ZXIsIEkgd291
bGQgcmF0aGVyIHByZWZlciBpZiB3ZSBleHBvcnQgZHRfbWF0Y2hfYnVzKCkgJiBjbyBhbmQgbW92
ZSB0aGlzIGNvZGUgdG8gdW5kZXIgYXJjaC9hcm0vcGNpLy4gTWF5YmUgd2Ugc2hvdWxkIGludHJv
ZHVjZSBhIGZpbGUgZG9tYWluX2J1aWxkLmMuDQo+IA0KPiBGdXJ0aGVybW9yZSwgdGhlIG5hbWUg
b2YgdGhlIGZ1bmN0aW9uIGRvZXNuJ3QgcmVhbGx5IG1hdGNoIHdoYXQgdGhlIGZ1bmN0aW9uIGRv
ZXMuIEl0IHdpbGwgZ2VuZXJhdGUgInJhbmdlcyIgZm9yIHRoZSBob3N0YnJpZGdlIGFuZCByZW1v
dmUgdGhlIEkvTy4gV2UgbWF5IHdhbnQgdG8gcGVyZm9ybSBvdGhlciBtb2RpZmljYXRpb25zIG9u
IHRoZSByYW5nZS4gU28gSSB3b3VsZCBuYW1lIHRoZSBmdW5jdGlvbiBzb21ldGhpbmcgbGlrZToN
Cj4gDQo+IGRvbWFpbl9idWlsZF9nZW5lcmF0ZV9ob3N0YnJpZGdlX3JhbmdlKCkNCg0KSSB3aWxs
IG1vZGlmeSB0aGUgY29kZSBiYXNlZCBvbiB5b3VyIGNvbW1lbnQgaW4gbmV4dCB2ZXJzaW9uLg0K
DQo+IA0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBhcmVudCA9IE5VTEw7
DQo+PiArICAgIGNvbnN0IHN0cnVjdCBkdF9idXMgKmJ1cywgKnBidXM7DQo+PiArICAgIHVuc2ln
bmVkIGludCBybGVuOw0KPj4gKyAgICBpbnQgbmEsIG5zLCBwbmEsIHBucywgcm9uZTsNCj4+ICsg
ICAgY29uc3QgX19iZTMyICpyYW5nZXM7DQo+PiArICAgIF9fYmUzMiByZWdzWygoR1VFU1RfUk9P
VF9BRERSRVNTX0NFTExTICogMikgKyBHVUVTVF9ST09UX1NJWkVfQ0VMTFMgKyAxKQ0KPiANCj4g
R1VFU1RfUk9PVF8qX0NFTExTIGFyZSBvbmx5IHZhbGlkIGZvciBkb21VLiBJbiB0aGVvcnksIHRo
ZXJlIGFyZSBubyBndWFyYW50ZWUgdGhpcyB3aWxsIGJlIGJpZ2dlciB0aGF0IHdoYXQgdGhlIGhv
c3QgZGV2aWNlLXRyZWUgc3VwcG9ydHMuDQo+IA0KPiBTbyB5b3Ugd2FudCB0byB1c2UgRFRfTUFY
X0FERFJfQ0VMTFMgaGVyZS4NCj4gDQo+PiArICAgICAgICAgICAgICAgKiAyXTsNCj4gTG9va2lu
ZyBhdCB0aGUgY29kZSBiZWxvdy4gSSBjb3VsZG4ndCBmaW5kIGFueSBjaGVjayBndWFyYW50ZWlu
ZyB0aGUgc3RhdGljIGFycmF5IHdpbGwgYmUgYmlnIGVub3VnaCB0byBzdG9yZSB0aGUgcmFuZ2Vz
IHByb3ZpZGVkIGJ5IHRoZSBob3N0IERULg0KDQpMZXQgbWUgZml4IHRoaXMgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IA0KPj4gKyAgICBfX2JlMzIgKmFkZHIgPSAmcmVnc1swXTsNCj4+ICsNCj4+ICsg
ICAgYnVzID0gZHRfbWF0Y2hfYnVzKGRldik7DQo+PiArICAgIGlmICggIWJ1cyApDQo+PiArICAg
ICAgICByZXR1cm4gMDsgLyogZGV2aWNlIGlzIG5vdCBhIGJ1cyAqLw0KPj4gKw0KPj4gKyAgICBw
YXJlbnQgPSBkdF9nZXRfcGFyZW50KGRldik7DQo+PiArICAgIGlmICggIXBhcmVudCApDQo+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsNCj4+ICsgICAgcmFuZ2VzID0gZHRfZ2V0X3By
b3BlcnR5KGRldiwgInJhbmdlcyIsICZybGVuKTsNCj4+ICsgICAgaWYgKCAhcmFuZ2VzICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkRUOiBubyByYW5nZXM7IGNh
bm5vdCBlbnVtZXJhdGUgJXNcbiIsDQo+PiArICAgICAgICAgICAgICAgZGV2LT5mdWxsX25hbWUp
Ow0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICsgICAgaWYgKCAh
cmxlbiApIC8qIE5vdGhpbmcgdG8gZG8gKi8NCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKw0K
Pj4gKyAgICBidXMtPmNvdW50X2NlbGxzKGRldiwgJm5hLCAmbnMpOw0KPj4gKyAgICBpZiAoICFE
VF9DSEVDS19DT1VOVFMobmEsIG5zKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJkdF9wYXJzZTogQmFkIGNlbGwgY291bnQgZm9yIGRldmljZSAlc1xuIiwNCj4+
ICsgICAgICAgICAgICAgICBkZXYtPmZ1bGxfbmFtZSk7DQo+PiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwYnVzID0gZHRfbWF0Y2hfYnVzKHBhcmVu
dCk7DQo+PiArICAgIGlmICggIXBidXMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwcmludGso
WEVOTE9HX0VSUiAiRFQ6ICVzIGlzIG5vdCBhIHZhbGlkIGJ1c1xuIiwgcGFyZW50LT5mdWxsX25h
bWUpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsg
ICAgcGJ1cy0+Y291bnRfY2VsbHMoZGV2LCAmcG5hLCAmcG5zKTsNCj4+ICsgICAgaWYgKCAhRFRf
Q0hFQ0tfQ09VTlRTKHBuYSwgcG5zKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJkdF9wYXJzZTogQmFkIGNlbGwgY291bnQgZm9yIHBhcmVudCAlc1xuIiwNCj4+
ICsgICAgICAgICAgICAgICBkZXYtPmZ1bGxfbmFtZSk7DQo+PiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICAvKiBOb3cgd2FsayB0aHJvdWdoIHRoZSBy
YW5nZXMgKi8NCj4+ICsgICAgcmxlbiAvPSA0Ow0KPj4gKyAgICByb25lID0gbmEgKyBwbmEgKyBu
czsNCj4+ICsgICAgZm9yICggOyBybGVuID49IHJvbmU7IHJsZW4gLT0gcm9uZSwgcmFuZ2VzICs9
IHJvbmUgKQ0KPj4gKyAgICB7DQo+IA0KPiBNb3N0IG9mIHRoZSBjb2RlIGluIHRoaXMgZnVuY3Rp
b24gaXMgdGhlIHNhbWUgYXMgZHRfZm9yX2VhY2hfcmFuZ2UoKS4gQ2FuIHdlIHJlZmFjdG9yIGl0
IHRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24/DQoNCk9rIExldCBtZSB0cnkgdG8gcmVmYWN0b3Ig
dGhlIGNvZGUuDQoNClJlZ2FyZHMsDQpSYWh1bA0KPiANCj4+ICsgICAgICAgIHVuc2lnbmVkIGlu
dCBmbGFncyA9IGJ1cy0+Z2V0X2ZsYWdzKHJhbmdlcyk7DQo+PiArICAgICAgICBpZiAoIGZsYWdz
ICYgSU9SRVNPVVJDRV9JTyApDQo+PiArICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiAr
ICAgICAgICBtZW1jcHkoYWRkciwgcmFuZ2VzLCA0ICogcm9uZSk7DQo+PiArDQo+PiArICAgICAg
ICBhZGRyICs9IHJvbmU7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIGZkdF9wcm9w
ZXJ0eShmZHQsICJyYW5nZXMiLCByZWdzLCBzaXplb2YocmVncykpOw0KPj4gK30NCj4+ICsNCj4+
ICAvKg0KPj4gICAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICAgKiBtb2RlOiBDDQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmggYi94ZW4vaW5jbHVkZS94ZW4vZGV2
aWNlX3RyZWUuaA0KPj4gaW5kZXggZmQ2Y2QwMGI0My4uNTgwMjMxZjg3MiAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vZGV2aWNlX3RyZWUuaA0KPj4gQEAgLTg0OSw2ICs4NDksMTYgQEAgaW50IGR0X2NvdW50X3Bo
YW5kbGVfd2l0aF9hcmdzKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnAsDQo+PiAgICov
DQo+PiAgaW50IGR0X2dldF9wY2lfZG9tYWluX25yKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9k
ZSk7DQo+PiAgKy8qKg0KPj4gKyAqIGR0X3BjaV9yZW1vdmVfaW9fcmFuZ2UgLSBSZW1vdmUgdGhl
IFBDSSBJL08gcmFuZ2UgcHJvcGVydHkgdmFsdWUuDQo+PiArICogQGZkdDogUG9pbnRlciB0byB0
aGUgZmlsZSBkZXNjcmlwdG9yIHRyZWUuDQo+PiArICogQG5vZGU6IERldmljZSB0cmVlIG5vZGUu
DQo+PiArICoNCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgcmVtb3ZlIHRoZSBQQ0kgSU8gcmFu
Z2UgcHJvcGVydHkgZnJvbSB0aGUgUENJIGRldmljZSB0cmVlDQo+PiArICogbm9kZS4NCj4+ICsg
Ki8NCj4+ICtpbnQgZHRfcGNpX3JlbW92ZV9pb19yYW5nZXModm9pZCAqZmR0LCBjb25zdCBzdHJ1
Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUpOw0KPj4gKw0KPj4gIHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqZHRfZmluZF9ub2RlX2J5X3BoYW5kbGUoZHRfcGhhbmRsZSBoYW5kbGUpOw0KPj4gICAgI2lm
ZGVmIENPTkZJR19ERVZJQ0VfVFJFRV9ERUJVRw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+
IEp1bGllbiBHcmFsbA0KDQo=

