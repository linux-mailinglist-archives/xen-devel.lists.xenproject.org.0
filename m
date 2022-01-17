Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FF490738
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258125.444176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QLe-0002RH-PL; Mon, 17 Jan 2022 11:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258125.444176; Mon, 17 Jan 2022 11:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QLe-0002PI-Lk; Mon, 17 Jan 2022 11:38:54 +0000
Received: by outflank-mailman (input) for mailman id 258125;
 Mon, 17 Jan 2022 11:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSOx=SB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9QLd-0002PC-T7
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:38:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe06::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b31e9d3-778a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 12:38:52 +0100 (CET)
Received: from DB7PR05CA0066.eurprd05.prod.outlook.com (2603:10a6:10:2e::43)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 17 Jan
 2022 11:38:50 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::da) by DB7PR05CA0066.outlook.office365.com
 (2603:10a6:10:2e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 11:38:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 11:38:50 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Mon, 17 Jan 2022 11:38:50 +0000
Received: from b91ac24b819d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B880CCCC-E5D7-43ED-A275-65EB9CF718C4.1; 
 Mon, 17 Jan 2022 11:38:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b91ac24b819d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Jan 2022 11:38:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 11:38:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:38:33 +0000
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
X-Inumbo-ID: 0b31e9d3-778a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVobulXZF0s4vQ1oewlAvhCdEuRHV3M3/IVuxIgXPYs=;
 b=095rtqXvD8AmPyIEFmy4lNgyUwC98VjTaQGW/GsHqnL4srO18R1zZ6M/L2jets95gGk5PWSJtCtK4yGZ98qAIudiwgJiDe+Djgytf88YQpOKC2yIs8QKL/bLRk00MJbMPs4mjY/2vnARiERfSZ8earMdHgZS220Xc0YyBFdYwpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36b5b364f9ed7382
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tlnaeub+wyeCwU514TpXihlqQSSibHq7vGTD76004s5r0KclHgtdAResdKPntUB/Jzz+jkRlL031jgX8AOjMVIf2YyYH1bywoWQD6r6t16qq82W0EMJJ7F5hQGHBdUigtPhqXJAMu47MmEqz6B7t6xZP6K1DQEAngXt2WJoXVAAZIN20VlZrJZfvEEyGjzXrOPP2sPkZ1JTKX/a/dZhNEY+bvSLmLQvTy3ZOj7VZZ/6XBDBSieLjKzSTUzIrE5FiPX9HqyS6X9ZEoF771ySqr/g8bfRd6bOZuYt9bsklOnUy8AXkLhhAunukQwbNU89KABS/vrwpDOd13fSixJ5Yow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVobulXZF0s4vQ1oewlAvhCdEuRHV3M3/IVuxIgXPYs=;
 b=Q4XNcWPImm0nKl9bt/NOSA2WjD7HLUGDBu2Ib+H9+RMqOv8m1oN2M2W4j7tzxfuHe/Ms6bHr02n0SvO31medNDC8j6yUK8mYcq7cr1I1Jk9vxBxQ4se/0OLohBV+4Aa6PnKW+1dNQzy7Y16nUetBzknbAXq0k9AjZRWgwxWxXcENVujx6cbBkUVBVFAht+6JtYzJWKKj0BD/DQhZh18njGVYZSrPl2DrjT/WjWNQNJgB5aetx9LWPXhnAiTP46asuAs9NBw6vHi5J/eOKFRMa3Q4RoRPayMnZOJAN7zNziuqPPvy/gYzGEmE3NukPHqja48fwdvmHxq7mBwIlV4OuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVobulXZF0s4vQ1oewlAvhCdEuRHV3M3/IVuxIgXPYs=;
 b=095rtqXvD8AmPyIEFmy4lNgyUwC98VjTaQGW/GsHqnL4srO18R1zZ6M/L2jets95gGk5PWSJtCtK4yGZ98qAIudiwgJiDe+Djgytf88YQpOKC2yIs8QKL/bLRk00MJbMPs4mjY/2vnARiERfSZ8earMdHgZS220Xc0YyBFdYwpk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dongjiu Geng <gengdongjiu1@gmail.com>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Topic: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Index: AQHYC20k2h7y374id02KJynAohV9hqxm6mCAgAAk64CAAAdegA==
Date: Mon, 17 Jan 2022 11:38:33 +0000
Message-ID: <ADF7B9AE-9E44-475A-A678-C6F81F1C9049@arm.com>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <94945C70-A608-47E9-890E-8CA6882D7379@arm.com>
 <CABSBigTdLbV4b8uB-MyoBuU2uFe2xc8ML4WizsHD80A3nygtCg@mail.gmail.com>
In-Reply-To:
 <CABSBigTdLbV4b8uB-MyoBuU2uFe2xc8ML4WizsHD80A3nygtCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 84e028f0-5dc6-410f-e7f5-08d9d9adee66
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DB5EUR03FT004:EE_|AS8PR08MB6712:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6712160DFBF418ABC4CB4FC69D579@AS8PR08MB6712.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tCgEm/jd4xZSYWRMC19vkCfU+HQYmx1U5CAZDS1qXrROeElNHngOMg+v8q1vIYzvYIxYX3rTTI0AKO58GbFRcMNIhtyhl4UusNYKpi6YW7qOdOLEkZHmk8vs7HRpW7Y5dnS5UZq+eEPwHFkyLNHaoiZqDBfhV+nO5NhG0s6cgWpaczmISN7JtCXlHPF0K5u7LQmiVqek0mVjIVz9VO3uROu45lS+6O2I43JhtD/38wpRLywIIKZizf/B8RmEx4pouuB1BfNksSQzwxTN2+dv06pPoLfnSdbkcOj/eI/nVatMEXV9WQtjUlLKZGBTlAbHgKytXFNaVt8Dm23yI3MH5Fh9FIzSKN3pfSBIUZP99ffoBqLthy0A6B5ZM0V0hSdg6gmYs1Aqb3Fcfkn+3t8rPm6xWyP3h7YGe/l5phyNbDUwqRSAZIyg5U83ICXWAkskSOw2uXPGPvx9hk7i5hrgpY+q7fb5mp1WwbENhKS0IFJ2wlE2CAIuC7amApke2cHTUXhFuOZB0AM5hdvNJSkX/Z3OsZnFVH+Onl0x/XXO08Rm7CvpDWm9f/o9afGmpQ5KDOCnyFRztyEiyLkXYgKhE6DWVCuu49WcVEJ7Zcqpj/nGMsdGufKYnEJHdhfUHTWC77NYpp6pHeOiMMATvBMLQNLkKuALx0jG5Ne8GVt74g+j/26wgUzf76N4bucYjxSKFflaKHK8dOMvlo9S/7GI2vbqCQHfI2L0x4HLmvpAI0ZE2Cn4YzlJDPb7hC/h/JCB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(508600001)(6512007)(26005)(6486002)(6916009)(2906002)(83380400001)(8676002)(36756003)(33656002)(91956017)(54906003)(66946007)(66476007)(71200400001)(66556008)(64756008)(38070700005)(186003)(4326008)(66446008)(316002)(86362001)(122000001)(38100700002)(53546011)(5660300002)(6506007)(8936002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B37A2E0C77AFB43A22B072BAAFA3212@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4530
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cdc20dcb-2362-463a-0e48-08d9d9ade477
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+VmYxy7IHyHP8Mhd0lhtqXnCoBQ6EK2uxB2YN8uLnF01lAqzoRt+qbtBbgCO0kEiGZ4CUrKd6J/yddlPUGiTxVTbEmxTScH9e/scGdWL2b2HlOWh+0QiOOJwJvORGuW/HG8705IBQMMNQR7FUnqOzAipMJgj+R1Nm44awfD81inx/EFw7+ZH5TOoVR2qv+gpQqOeOG+ZkAzoL2dgm6To2jo1yJKN19RvarRaGUlc1YXL7MSqDxos+pCjziAIeio/NVlxPGY6L0QtigPigASZuUYy99nvNMvGDUdxIwdkaWtVJJdc6eiFsm4G1YxDmElMsIcVminGm4+otcCEBzdzsHVtSbJ6r380yy+kbIJ8mA6bkY5DS4Gw/tiRejlpJGGRHAQrc+FOxw+Ctp5erIHiTYlSw99KyFClVUZ95IZcCkPXLC5MwXJ/BZZlI7lhVXSTFLI1qElFe6Lnmg78aDfI3KlsNWPaF/jNaKnMZtcA/flnNckVK8rx1J25jWyoQaYAXdLSsaCAIOgo9t/1wD7metFuSOwVZ67bFD8CWNxLCDTzNZSQ+eIkyYAWMTaDULDR1SGOO8CnVJwppnvpVS5AEObnHY7Ob4EBnyyjDkBQ0DwiXPdv2mF6xR+em2utMR83QIZI0cn7OjiF+XYJLil+uxG8/syTXtGXi0YVJXn9DPfF5d8r88GMe7KZfrtdMnUM12LNsAgsA2yswJE+KQSoXJfYZ5ah96fvymMw+BC5GfXnyC9L6XposdGDUQdok7cK/m3VtwFPjXUl/AMLfNUGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(356005)(6862004)(36860700001)(6512007)(86362001)(26005)(8936002)(508600001)(6506007)(53546011)(40460700001)(33656002)(316002)(36756003)(47076005)(83380400001)(336012)(54906003)(4326008)(81166007)(6486002)(186003)(8676002)(70586007)(5660300002)(2906002)(70206006)(82310400004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:38:50.1770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e028f0-5dc6-410f-e7f5-08d9d9adee66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

SGksDQoNCj4gT24gMTcgSmFuIDIwMjIsIGF0IDExOjEyLCBEb25naml1IEdlbmcgPGdlbmdkb25n
aml1MUBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPiDkuo4yMDIy5bm0MeaciDE35pel5ZGo5LiAIDE3OjAw5YaZ6YGT77ya
DQo+PiANCj4+IEhpLA0KPj4gDQo+Pj4gT24gMTcgSmFuIDIwMjIsIGF0IDA2OjQwLCBEb25naml1
IEdlbmcgPGdlbmdkb25naml1MUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEl0IHR1cm5z
IG91dCB0aGF0IFFFTVUgaGFzIGJlZW4gc3VwcG9ydGluZyBHSUN2MiB2aXJ0dWFsaXphdGlvbiBz
aW5jZQ0KPj4+IHYzLjEuMC4gU28gcmVtb3ZlIHRoZSBkZXBlbmRlbmNpZXMgb24gR0lDdjMuIElm
IHdlIHdhbnQgdG8gdXNlIEdJQ3YzLA0KPj4+IHdlIGNhbiBzZWxlY3QgdGhlIFFFTVVfTEVHQUNZ
IGNvbmZpZ3VyYXRpb24uDQo+PiANCj4+IEkgYW0gYml0IHB1enpsZWQgYnkgdGhpcyBjaGFuZ2Ug
aW50cm9kdWNpbmcgYSBsZWdhY3kgb3B0aW9uIGFjdHVhbGx5IHNlbGVjdGluZyB0aGUgbmV3ZXN0
IEdJQyBpbnRlcmZhY2UuDQo+PiANCj4+IENhbuKAmXQgd2UgZG8gdGhlIG9wcG9zaXRlIGFuZCBp
bnRyb2R1Y2UgYSBRRU1VX0dJQ1YyIGluc3RlYWQgPw0KPj4gDQo+PiBBbHNvIHdoeSBkbyB3ZSBu
ZWVkIHRvIHJlbW92ZSBnaWMtdjMgc3VwcG9ydCA/IFRoZSBjb2RlIHNob3VsZCBhY3R1YWxseSBz
ZWxlY3Qgd2hpY2ggZ2ljIHRvIHVzZSBkZXBlbmRpbmcgb24gdGhlIGRldmljZSB0cmVlLg0KPiAN
Cj4gUUVNVSBwbGF0ZnJvbSBvbmx5IHNlbGVjdCBHSUN2MywgIHNvIEkgcmVtb3ZlIHRoaXMgbGlt
aXRhdGlvbiwgIGxldA0KPiB1c2VyIG9yIGRldmVsb3BlciBzZWxlY3RzIGdpYyB2ZXJzaW9uIGlz
IGJldHRlci4NCg0KVGhpcyBpcyB3aGVyZSBJIGFtIGxvc3QsIHRoZSBjb2RlIGlzIGFjdHVhbGx5
IGFsd2F5cyBjb21waWxpbmcgZ2ljLXYyIHN1cHBvcnQgaW4gdW5sZXNzIG5ldyB2Z2ljIGlzIHNl
bGVjdGVkIChzZWUgYXJjaC9hcm0vTWFrZWZpbGUpLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
DQo+PiANCj4+IFJlZ2FyZHMNCj4+IEJlcnRyYW5kDQo+PiANCj4+PiANCj4+PiBTaWduZWQtb2Zm
LWJ5OiBEb25naml1IEdlbmcgPGdlbmdkb25naml1MUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4g
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIHwgMTAgKysrKysrKysrLQ0KPj4+IDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+PiANCj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIGIveGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy9LY29uZmlnDQo+Pj4gaW5kZXggYzkzYTZiMjc1Ni4uNDFlODJhNDJlZSAxMDA2NDQN
Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4+PiBAQCAtMTMsNyArMTMsMTUgQEAgY29uZmln
IEFMTF9QTEFUDQo+Pj4gICAgICBhdXRvbWF0aWNhbGx5IHNlbGVjdCBhbnkgb2YgdGhlIHJlbGF0
ZWQgZHJpdmVycy4NCj4+PiANCj4+PiBjb25maWcgUUVNVQ0KPj4+IC0gICAgIGJvb2wgIlFFTVUg
YWFyY2ggdmlydCBtYWNoaW5lIHN1cHBvcnQiDQo+Pj4gKyAgICAgYm9vbCAiUUVNVSBhYXJjaCB2
aXJ0IG1hY2hpbmUgc3VwcG9ydCA+PSB2My4xLjAiDQo+Pj4gKyAgICAgZGVwZW5kcyBvbiBBUk1f
NjQNCj4+PiArICAgICBzZWxlY3QgSEFTX1BMMDExDQo+Pj4gKyAgICAgLS0taGVscC0tLQ0KPj4+
ICsgICAgIEVuYWJsZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMgZm9yIFFFTVUgYWFyY2g2NCB2
aXJ0IGVtdWxhdGVkDQo+Pj4gKyAgICAgbWFjaGluZS4NCj4+PiArDQo+Pj4gK2NvbmZpZyBRRU1V
X0xFR0FDWQ0KPj4+ICsgICAgIGJvb2wgIlFFTVUgYWFyY2ggdmlydCBtYWNoaW5lIHN1cHBvcnQg
PCB2My4xLjAiDQo+Pj4gICAgICBkZXBlbmRzIG9uIEFSTV82NA0KPj4+ICAgICAgc2VsZWN0IEdJ
Q1YzDQo+Pj4gICAgICBzZWxlY3QgSEFTX1BMMDExDQo+Pj4gLS0NCj4+PiAyLjI1LjENCg0K

