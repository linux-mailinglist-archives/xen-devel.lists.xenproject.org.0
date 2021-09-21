Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EAB4134D8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 15:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191744.341836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSg9t-0006xv-4s; Tue, 21 Sep 2021 13:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191744.341836; Tue, 21 Sep 2021 13:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSg9t-0006ti-19; Tue, 21 Sep 2021 13:50:05 +0000
Received: by outflank-mailman (input) for mailman id 191744;
 Tue, 21 Sep 2021 13:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dn89=OL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mSg9q-0006aD-Pf
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 13:50:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df7fecfd-24de-4e70-b1de-029f8c90b680;
 Tue, 21 Sep 2021 13:49:59 +0000 (UTC)
Received: from DB8PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:10:120::36)
 by PR3PR08MB5580.eurprd08.prod.outlook.com (2603:10a6:102:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 13:49:53 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::ef) by DB8PR06CA0062.outlook.office365.com
 (2603:10a6:10:120::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 13:49:53 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 13:49:53 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Tue, 21 Sep 2021 13:49:52 +0000
Received: from 8f451ec1d378.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB1B8A24-2A3F-46E2-8AA4-02F3DC85F179.1; 
 Tue, 21 Sep 2021 13:49:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f451ec1d378.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Sep 2021 13:49:35 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4295.eurprd08.prod.outlook.com (2603:10a6:20b:b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 13:49:33 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 13:49:33 +0000
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
X-Inumbo-ID: df7fecfd-24de-4e70-b1de-029f8c90b680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVfTS6YALUnftVAqcmnV+Dy+a5EXbBUKlepvvAXDTUI=;
 b=Dmu8mntomQ8/4eiu7XvRclh3RMRPMY8kusB7Yu1WgO2X4jsHrBGr1HY0DRiAEfpwsYo+loINeaAny9tuuiJ3xgNUi2zh0ftMQyGXy6umgd+3Q/QPtC+JEDw1ZAQeyXTWzLkXvkaZOH2ZWZ3D+HpJp3Gpu2K8u1QBPTgb/UhyohQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ea10c5f8929f8c6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbCwLZW2D1NzRa2xKebm+udEHp/qX/BESCfnOn5rYSzudfMEfRa3oMg58FN1sgd9vH2qDHjHu/m89rKtBxMvZ3CXvmYsqmg739isPdem+Iv0QTXKVUUbSenHCC32O073m75OoU9lXfP1DCsk8qNXwGly1IHrdO9vf1VYgvR9GRYqD6sFDwsLIzvaeRu+d76Uv4KlFxUvdz2kaX1YobRJfMt3UaSYzNPFDTeXbs129jAQR8rZ7VIjrAWdChce+RI69BIENavT0zBqUYfGcPGCrGOPkBPsUO50cNtM4srZc3FFWXsWaU+KqjwE509JK8YH9Hqb6UCXkzY6rDjBwxGQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TVfTS6YALUnftVAqcmnV+Dy+a5EXbBUKlepvvAXDTUI=;
 b=Z/U972zhqdmcKn7nAEyoGwy2wQTjUjokt3WMBvNxjROOOQWtgP3vy1uK3hZK2qwbQHO5twhS38bCyqrao81HYKfEvD74jKnytRnZkkjWhR9AnCvM+esq61peWJEtj++UXNP4slFf6iip+215ILT4Ruv6Y7LCsZti1WF1Av5qrEbcPsdRBAlHXuZhGNvK9BcZFfJj/Du5LyEp+/AtzFfGkNZiPddJit+m/JrbdoNqwWM7Klaai4O3v/LnOhSDCQVKmxvMshHRfTJUQy8X1B5x9aSrrdCpX81CZIHddvStZdGYoyLlncY+gpIJqT6nJxKvx5aqv3xQ+b9o3OpNwO0x9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVfTS6YALUnftVAqcmnV+Dy+a5EXbBUKlepvvAXDTUI=;
 b=Dmu8mntomQ8/4eiu7XvRclh3RMRPMY8kusB7Yu1WgO2X4jsHrBGr1HY0DRiAEfpwsYo+loINeaAny9tuuiJ3xgNUi2zh0ftMQyGXy6umgd+3Q/QPtC+JEDw1ZAQeyXTWzLkXvkaZOH2ZWZ3D+HpJp3Gpu2K8u1QBPTgb/UhyohQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXlPL13zcSD0YvP0y1H1bgZa9bP6uciyMAgAofYICAAJ30AIAHbKUA
Date: Tue, 21 Sep 2021 13:49:33 +0000
Message-ID: <996263D9-27C3-43FE-A111-4BD2CE75B765@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091720490.10523@sstabellini-ThinkPad-T480s>
 <A90145B0-DD30-4300-8248-73104C782172@arm.com>
 <alpine.DEB.2.21.2109161324200.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109161324200.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f9e95cbe-5a34-4a61-55c4-08d97d06b09a
x-ms-traffictypediagnostic: AM6PR08MB4295:|PR3PR08MB5580:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5580F0FB93CA0CEF7F215A45FCA19@PR3PR08MB5580.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dEH8uvsAuu1FyKCtG3dMbeu2927W0+z7L5Ox9q2ZtuVCL+GnwykQ99S2Y4Hl9L7CBInaEqSpr05xiJVaw2kx/B7aOQvJYG4Lyn8kcJJmVi79sM0XQyRwu985YwQ1k7c9jVrzMeO0Nfr/QmfMU7iGGcg3oN32onXS6BVnF+WsIbchiP63SQb3oDXgGJq3CtBZTjbcC9DsLagyP8VFEzr7CASAKBX8MAz/dn4iobf2ip2AVY07fJSsoToqUBJEmjaNKYqZ4z42CtUIQuBzXQACB9VGwBjhX47Jsh3wc2gj7Cyryj0s9tSgbHqnzXS7PwZHFpCJJZi/l2JMe5cYga5EVtlh7iqDa0NeidC/LyHKpA6O/4JIbXkLpFFVCt6DSfzQcWI5RjstEtaYIsQNV52YAORKZpTH0fQk59m02PUeKIOJTQedtNEzINKcyHJz6XclEh5T9lgu7ajw30BoF8W7maeIMV5US2KW2R8v8ZmFn93sjBIiug6GjPxCiODsWxDPhyYmW3xuHaKFbWjdPiIdE8p3XUwFU8TfHX5aSjCQFTj7LsUpkicq7ZJW4Fmv8Ff32AdqPgLQ6+WhFGPFqzbDh9wuRa0017uJs09nKN+8qELLAPTEulovd/pf9iHXVxHM62mJ5ZIHHt9vbojBnH9jB1atmhUwC54wiP7qLbjipYEdt69nCQtYhdOnJhIglywCucnEf47v0m5qARE+w9bFEMG1g6V1xmqT8AhVKiL+OYVthgfGrkifbcgtOMnPU30Z
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(83380400001)(122000001)(6512007)(8676002)(66556008)(508600001)(186003)(71200400001)(6916009)(38100700002)(4326008)(2906002)(8936002)(36756003)(33656002)(54906003)(5660300002)(66446008)(66946007)(64756008)(66476007)(2616005)(76116006)(26005)(38070700005)(91956017)(6506007)(53546011)(86362001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A9EACC27BFBED47BF630388AB2089E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4295
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	484fc795-f767-4e79-d307-08d97d06a468
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVpGCDXSnvN8VL87O2OxYvPWMU1Rz8OlWUQ08HWxCsMQwJH1uoi4QTNgoiaItBByw/OY7Xsb+uOnPANOnRfjLHYhRV3smnhGA0YMV9lqDis1hyDMzeWsVO44+pfYIBt6OVZULQDeT1xSVfJKzQJjmYJ8jzPG19AxEcWa1aV5o95cbjAYnN4FFB+YDiAPhcFq73VPRX442ABG+4hmu7Vv/9xQOD3H9URIMUl0jS/PJYmkqB6abZsn9avRxojGX4MCKPPqj8tq9K/Iu0CSiDYLCah/6Z2lbiwMw/ba6FBok2/LAG29be8LbaS2HM4LCgGPivsFzi/zH0kPVuZXf7h632CJmWzybRvOLlT39DbztQLdnfKc/OO81mYRy9NOeZ9EmKK2wZSwcKJtTZjKP2EibYumC9jtieYWuEIuXBFRstEvwU4vEZX4P/Aij2nLvBycfShqREkT9J7iTT7tOLmTzX8zhxA5rymdXnbWQtdd2bBpnPmgODTHb7jq7cxmWJE3hfXLEbo+khVSmJMRT8QoJw559EKcBG5CEtWXWbQDPyAhbRO9lrblUtXEsIK8tuRDM3ZVq+Amckbsl/cLc8VxYG3gUvEXD8Zdggz10SzNMrV+rjYVE1eTmTKlw06Gr4bGwveTM8RJQgnmCFCaNadX2h7qE5/Buksm2KsfpmT7Ls9N1Ws2htFtvU/lEN3jPzve4VsV+KesV1t/H+9CbIenAw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(54906003)(508600001)(186003)(36756003)(86362001)(2906002)(6862004)(4326008)(6512007)(26005)(6506007)(53546011)(336012)(107886003)(6486002)(8936002)(82310400003)(70586007)(47076005)(70206006)(36860700001)(316002)(5660300002)(2616005)(8676002)(33656002)(83380400001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 13:49:53.5766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e95cbe-5a34-4a61-55c4-08d97d06b09a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5580

SGkgU3RlZmFubywNCg0KPiBPbiAxNiBTZXAgMjAyMSwgYXQgOToyNiBwbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTYg
U2VwIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgU3RlZmFubywNCj4+IA0KPj4+IE9u
IDEwIFNlcCAyMDIxLCBhdCAxOjI2IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFRodSwgMTkgQXVnIDIwMjEsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+PiBUaGUgZXhpc3RpbmcgVlBDSSBzdXBwb3J0IGF2YWlsYWJsZSBm
b3IgWDg2IGlzIGFkYXB0ZWQgZm9yIEFybS4NCj4+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVk
IHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+Pj4g4oCcUEhZU0RFVk9QX3BjaV9kZXZpY2Vf
YWRk4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25maWcgc3BhY2UNCj4+Pj4gYWNjZXNzIGlz
IGFkZGVkIHRvIHRoZSBYZW4gdG8gZW11bGF0ZSB0aGUgUENJIGRldmljZXMgY29uZmlnIHNwYWNl
Lg0KPj4+IA0KPj4+IFRoaXMgaXMgZG9uZSBqdXN0IGZvciBkZXZpY2UgZGlzY292ZXJ5LCByaWdo
dD8NCj4+PiANCj4+PiBBbHRob3VnaCBpdCBpcyBjdXJyZW50bHkgbm90IGltcGxlbWVudGVkIChh
bmQgSSBhbSBub3QgYXNraW5nIHRvDQo+Pj4gaW1wbGVtZW50IGl0IG5vdywgSSBhbSBvbmx5IHRy
eWluZyB0byB1bmRlcnN0YW5kIHRoZSBhcmNoaXRlY3R1cmUpLCBpdA0KPj4+IHdvdWxkIGJlIHBv
c3NpYmxlIHRvIGRpc2NvdmVyIGFsbCBQQ0kgZGV2aWNlcyBqdXN0IGJ5IHdhbGtpbmcgZG93biB0
aGUNCj4+PiBQQ0kgaGllcmFyY2h5IGJ5IG91cnNlbHZlcyBpbiBYZW4gKG5vIERvbTAgaW50ZXJh
Y3Rpb25zKSBnaXZlbiB0aGF0IHdlDQo+Pj4gaGF2ZSBhbiBFQ0FNIGRyaXZlci4NCj4+PiANCj4+
PiBJIHRha2UgdGhhdCB3b3VsZCBiZSB0aGUgd2F5IHRvIGltcGxlbWVudCBQQ0kgc3VwcG9ydCBm
b3IgRG9tMGxlc3M/DQo+PiANCj4+IEl0IGlzIG5vdCBwb3NzaWJsZSB0byBkaXNjb3ZlciBQQ0kg
ZGV2aWNlcyBpbiBYRU4gaWYgZW51bWVyYXRpb24gaXMgbm90IGRvbmUgYmVmb3JlIFhFTiBib290
Lg0KPj4gSWYgYm9vdCBmaXJtd2FyZSBkaWQgdGhlIGVudW1lcmF0aW9uLCAgWEVOIHdpbGwgZGlz
Y292ZXIgdGhlIFBDSSBkZXZpY2UuDQo+IA0KPiBPSywgYnV0IGlmIHRoZSBib290IGZpcm13YXJl
IGRvZXMgdGhlIGVudW1lcmF0aW9uLCBob3cgd2lsbCBYZW4gZGlzY292ZXINCj4gdGhlIFBDSSBk
ZXZpY2UgZXhhY3RseT8gV2lsbCBYZW4gZGlzY292ZXIgaXQgYmVjYXVzZSB0aGUgUENJIGRldmlj
ZSB3aWxsDQo+IGJlIHByZXNlbnQgaW4gZGV2aWNlIHRyZWUgZXhwbGljaXRseSAod2lsbCBoYXZl
IGl0cyBvd24gZGV2aWNlIHRyZWUNCj4gbm9kZSk/IE9yIHdpbGwgWGVuIGRpc2NvdmVyIGl0IGJ5
IHdhbGtpbmcgdGhlIFBDSSBidXM/DQoNClllcyBYZW4gZGlzY292ZXIgaXQgYnkgd2Fsa2luZyB0
aGUgUENJIGJ1cy4gVGhlcmUgaXMgYWxyZWFkeSBhIGZ1bmN0aW9uIGluIFhFTiBzY2FuX3BjaV9k
ZXZpY2VzKCkgdGhhdCB3ZSBjYW4gdXNlIA0KdG8gZGlzY292ZXIgdGhlIFBDSSBkZXZpY2UgZm9y
IGRvbTBsZXNzIHN5c3RlbS4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

