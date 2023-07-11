Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6674EA69
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561683.878193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9e8-0007f6-8f; Tue, 11 Jul 2023 09:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561683.878193; Tue, 11 Jul 2023 09:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9e8-0007dK-3c; Tue, 11 Jul 2023 09:27:00 +0000
Received: by outflank-mailman (input) for mailman id 561683;
 Tue, 11 Jul 2023 09:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pXgh=C5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJ9e7-0007bz-3B
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:26:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1466df2a-1fcd-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:26:57 +0200 (CEST)
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by AS8PR08MB9266.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:26:54 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::83) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Tue, 11 Jul 2023 09:26:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 09:26:54 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Tue, 11 Jul 2023 09:26:54 +0000
Received: from 7a6bdbe08651.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22117FDF-E9C1-4611-9283-0CD70D59C634.1; 
 Tue, 11 Jul 2023 09:26:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a6bdbe08651.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Jul 2023 09:26:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8709.eurprd08.prod.outlook.com (2603:10a6:10:403::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:26:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:26:40 +0000
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
X-Inumbo-ID: 1466df2a-1fcd-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmPrWpP8E0VQmsh7J62o3XXi9X7B1nKDIKnDqgD7U18=;
 b=dRevk73drZWE+9s0HwQaj9XazORuBpqspXpZlb49wUpHzZWkNDBBaF1PSp13HyxixEsGUJJS7Bqd/PxI6/5tNYoqXBg524VRvS/jPlZQODieAQw55VLLpD6Md836X2FcJO1TMEdt6tEGsxsJzCVmoMiozF5k4NAI/KrEmFpaeFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16dd457d6eaf25bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGTjlpARXJkYqYDmy5ny8ldXDz0b0/Wiw/Xf2/anIeZLhQ+w+d1CYJdomf8pCHoTR31cYgzT3RDFeDFOMF7HtwfLLySTFq36PZZdlR0U3q4e+XOY0inCzSW9Bmqj8aGOGrlCoNfuqkNue8Bb/OuGw7mpg1EvSVD3965BcucUVzMKLFue9eHBiGetjcJRcyJSCSJ0qrwEqZJAdIpZlMJouI0o0rxBM3b4aONSv7oBTCjbH3V83VUNYfbqBw0sECcq+PDnITo/3iLf97Y0A3f8Q+Rrny6nw3mCT6t73V50oNNDzqieJuyvQy2W6DYU9Sgxpu/hupi01vAchRw3mA9XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmPrWpP8E0VQmsh7J62o3XXi9X7B1nKDIKnDqgD7U18=;
 b=kMoj3PmMECQ3YUlmnzOuuHxP868G/kUuNy1QLItAcwE7P/+RRF810CYFAEp86fW+QbRg9jTbxw/ryiGZUYtPr+0EAKF6cZT8BwRGpAmlVzA+0zQbb4F2Rs5E+AzCFFgmR0HkOMKlS2NaaVn96WwNwK7dzCRqNKNIL7VDkFjP8KpOSsdepbEczFYBIDjhfxtSL6lJEO4y77hL6T7BW2VeJmqQMXWjPAvPsFMOB8kDaWUN/ox49IfgLceZ2Nwau8fL0Tf8CJ4bnuEVhLhcMMxVe9XY31imsYczBV2eFdRvby4JmA7amZelLmYT+/SllvCNmR+IsPYzQiwslAt+Vi5yzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmPrWpP8E0VQmsh7J62o3XXi9X7B1nKDIKnDqgD7U18=;
 b=dRevk73drZWE+9s0HwQaj9XazORuBpqspXpZlb49wUpHzZWkNDBBaF1PSp13HyxixEsGUJJS7Bqd/PxI6/5tNYoqXBg524VRvS/jPlZQODieAQw55VLLpD6Md836X2FcJO1TMEdt6tEGsxsJzCVmoMiozF5k4NAI/KrEmFpaeFY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add Rule 7.4 and 9.4
Thread-Topic: [PATCH v2] docs/misra: add Rule 7.4 and 9.4
Thread-Index: AQHZs20uf0QgTgVHRk6JBQcFLVos0a+0TLIA
Date: Tue, 11 Jul 2023 09:26:40 +0000
Message-ID: <C67A4472-E79B-4902-879D-29E3E86D6305@arm.com>
References: <20230710202835.2052428-1-sstabellini@kernel.org>
In-Reply-To: <20230710202835.2052428-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8709:EE_|DBAEUR03FT059:EE_|AS8PR08MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: 78640724-054a-4f44-5390-08db81f0f749
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 59tQ7U9QKesImr/avDNA6NBoQk5rM0D2lKkQyQAVuBIJjL6fzoKpPzTBB3D81wD4SK8Sx+oPfajA91zdy4l1oNvml3fG8W2ii4KWQxXu38T/BKvU/htZS0YoF9km3r85TwkFYlQuWDu57D7d+A4idyzE8kvSlQAGTTKH1x/+E+NQUlls+4jnVL9dCiBAM/cd9RRSynBMkY7iEVdm+fUeT7zcQHaTcG4iIC+MeB9WLZWvjd6wZeVIzI5fz8Cgl/4SOdNOvrd2gykUQAIX+4bhLOvDFryg8oYkbYzDRONDFJVxOhoxAY+qmc9Bh9g0NnG18s0vtWkyuPJQRCqwJXGuNBEuVfrSPo1xag5B2uKM/YUxMsnUaWxOE+XvSRjXo47ep/Vg5WNYN2cZerZiDdM0xf/sz/PRQnoDX/ia6NXTOAJgC3/ISLf6dTUZAZKonQhlkUE/LXhQJe/OnvB181AMBPvRUmN8xT67UkCOPwysLdfmMRVedOUjbQVGrhbUKfxOimF4zflVdUQq+5DaT25avAeoCCLBSlm3ISD3Nc53vvRFK1R2A1S5bUFXxAzYFEmc3fxmYfbi5/uoRQWlRqrA6joWkwBWvWHVcHVznp8oaLKbOGjnOK7bn3NhqwEjlZFzDU8sl2Un3o3JjahgsmxhI+RN/BfsYYU13eU50Oo5iFgJONq3ftw8E+RrcWuUJUiy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(186003)(6506007)(26005)(2616005)(53546011)(6512007)(83380400001)(64756008)(66446008)(41300700001)(4326008)(6916009)(478600001)(66556008)(316002)(2906002)(5660300002)(8676002)(66476007)(66946007)(8936002)(6486002)(54906003)(76116006)(91956017)(71200400001)(33656002)(36756003)(122000001)(38100700002)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <24441FEFFC0C87448C9BD4150F23BFD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6483fc7-4b12-4064-9644-08db81f0ef31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eN1Z5ZDLtrtg0HT6vJS2oODINk5AyP0xwvX/vPJd1cNMQx/1BkmZQuMB8UX3PESjq48ruOo/E1RXj3UAS4m87NXmmKbXtsGpVknDMEgWrdbyKG83ZwDmedqXWrK539cB8wVsulFKmocpTgjhS1lypOb7DaTUnmbsOcQ7Ux+hwQ6YveLqHAMuDEEmWDr/WE7tzvl2hAW+CPc4IzwBZ382XNxVIgyhfXFOl3djUym94EUyoFccBGAcA9Z+vp8npZlOATWOOJPaBK3XoVdF5D2AfgKK4pY40DT1A+GJh0TS6hfMGiZVb5zi4gkH9gF3OhZX6KoR7oVySRq7WNCvOMa+Xfm+W0j7CWU6QtHgxnvjx1MTHrhUQbOMh/xlHoMjOGbubyLtFEhrOtO0cGdEF6sM/7fTFfK/CzelWhu2vZOcOdVFbr1gBhp0rA41472j1fLL//MNJVMtnPwjno32kv1gWhBxR95fbLPOC1zpW7uj27hGZoAGdlCRRiWQbm5GZEH5+onGPfYKrNPBGj7UdL768dtaneEdeTUip5Tz6JXhiDHNqPox95/oBiFfVVEizBASLkfLPnlhiDpnwu77rji1CTgg17eHCa9CADKg+6WrQgxYSU1lVSNn79LNmT0HnttWj5n2jJuWrLML8o5H9zs/TvGxqxmQaq1DEWuAw8DP4BNOPxe5yye3bkDa8BhAMaXCSluNNJkzfBIAw1RBEm5UfB3qml8+NLfCLJGH57vjKU5JwzKwZtlDiumG9T0RkZUqb0PSNzxmIW8KFFzyTjFrLw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(53546011)(6506007)(336012)(36860700001)(41300700001)(26005)(6512007)(83380400001)(47076005)(186003)(2616005)(478600001)(81166007)(356005)(82740400003)(54906003)(6486002)(40460700003)(4326008)(40480700001)(70206006)(70586007)(316002)(86362001)(33656002)(82310400005)(8936002)(5660300002)(8676002)(6862004)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:26:54.3500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78640724-054a-4f44-5390-08db81f0f749
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9266

DQoNCj4gT24gMTAgSnVsIDIwMjMsIGF0IDIxOjI4LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+IFJ1bGUgOS40IGlzIG5vbi1jb250
cm92ZXJzaWFsIGFuZCB3ZSBoYXZlIG5vIHZpb2xhdGlvbnMuDQo+IA0KPiBSdWxlIDcuNCBpcyBj
b25zaWRlcmVkIGEgZ29vZCBpZGVhIHdpdGggdGhlIGNhdmVhdCB0aGF0IGFzc2lnbmluZyBhDQo+
IHN0cmluZyBsaXRlcmFsIHRvIGNvbnN0IHZvaWQgaXMgYWxsb3dlZC4gSSBhZGRlZCBhIG5vdGUg
dG8gc3BlY2lmeSBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAt
IGltcHJvdmUgcnVsZSA3LjQgbm90ZQ0KPiAtLS0NCj4gZG9jcy9taXNyYS9ydWxlcy5yc3QgfCAx
NCArKysrKysrKysrKysrKw0KPiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvcnVsZXMucnN0IGIvZG9jcy9taXNyYS9ydWxlcy5y
c3QNCj4gaW5kZXggNjIyZjM1NDEwYy4uNjdlZThjMDI5ZSAxMDA2NDQNCj4gLS0tIGEvZG9jcy9t
aXNyYS9ydWxlcy5yc3QNCj4gKysrIGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4gQEAgLTIwMyw2
ICsyMDMsMTUgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4N
Cj4gICAgICAtIFRoZSBsb3dlcmNhc2UgY2hhcmFjdGVyIGwgc2hhbGwgbm90IGJlIHVzZWQgaW4g
YSBsaXRlcmFsIHN1ZmZpeA0KPiAgICAgIC0NCj4gDQo+ICsgICAqIC0gYFJ1bGUgNy40IDxodHRw
czovL2dpdGxhYi5jb20vTUlTUkEvTUlTUkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8t
L2Jsb2IvbWFzdGVyL1JfMDdfMDQuYz5gXw0KPiArICAgICAtIFJlcXVpcmVkDQo+ICsgICAgIC0g
QSBzdHJpbmcgbGl0ZXJhbCBzaGFsbCBub3QgYmUgYXNzaWduZWQgdG8gYW4gb2JqZWN0IHVubGVz
cyB0aGUNCj4gKyAgICAgICBvYmplY3RzIHR5cGUgaXMgcG9pbnRlciB0byBjb25zdC1xdWFsaWZp
ZWQgY2hhcg0KDQpOSVQ6IFNob3VsZCBpdCBiZSBzL29iamVjdHMvb2JqZWN0LyA/DQoNCj4gKyAg
ICAgLSBBbGwgImNoYXJhY3RlciB0eXBlcyIgYXJlIHBlcm1pdHRlZCwgYXMgbG9uZyBhcyB0aGUg
c3RyaW5nDQo+ICsgICAgICAgZWxlbWVudCB0eXBlIGFuZCB0aGUgY2hhcmFjdGVyIHR5cGUgbWF0
Y2guIChUaGVyZSBzaG91bGQgYmUgbm8NCj4gKyAgICAgICBjYXN0cy4pIEFzc2lnbmluZyBhIHN0
cmluZyBsaXRlcmFsIHRvIGFueSBvYmplY3Qgd2l0aCB0eXBlDQo+ICsgICAgICAgInBvaW50ZXIg
dG8gY29uc3QtcXVhbGlmaWVkIHZvaWQiIGlzIGFsbG93ZWQuDQo+ICsNCj4gICAgKiAtIGBSdWxl
IDguMSA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEyL0V4YW1w
bGUtU3VpdGUvLS9ibG9iL21hc3Rlci9SXzA4XzAxLmM+YF8NCj4gICAgICAtIFJlcXVpcmVkDQo+
ICAgICAgLSBUeXBlcyBzaGFsbCBiZSBleHBsaWNpdGx5IHNwZWNpZmllZA0KPiBAQCAtMjc1LDYg
KzI4NCwxMSBAQCBtYWludGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hhbmdlLg0K
PiAgICAgICAgYnJhY2VzDQo+ICAgICAgLQ0KPiANCj4gKyAgICogLSBgUnVsZSA5LjQgPGh0dHBz
Oi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0v
YmxvYi9tYXN0ZXIvUl8wOV8wNC5jPmBfDQo+ICsgICAgIC0gUmVxdWlyZWQNCj4gKyAgICAgLSBB
biBlbGVtZW50IG9mIGFuIG9iamVjdCBzaGFsbCBub3QgYmUgaW5pdGlhbGl6ZWQgbW9yZSB0aGFu
IG9uY2UNCj4gKyAgICAgLQ0KPiArDQo+ICAgICogLSBgUnVsZSAxMi41IDxodHRwczovL2dpdGxh
Yi5jb20vTUlTUkEvTUlTUkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8tL2Jsb2IvbWFz
dGVyL1JfMTJfMDUuYz5gXw0KPiAgICAgIC0gTWFuZGF0b3J5DQo+ICAgICAgLSBUaGUgc2l6ZW9m
IG9wZXJhdG9yIHNoYWxsIG5vdCBoYXZlIGFuIG9wZXJhbmQgd2hpY2ggaXMgYSBmdW5jdGlvbg0K
PiAtLSANCj4gMi4yNS4xDQo+IA0KPiANCg0KQXBhcnQgZnJvbSB0aGF0LCBJ4oCZdmUgdXNlZCB0
aGUgZmlsZSB3aXRoIG91ciBzY3JpcHQgdG8gaW1wb3J0IHRoZSBydWxlcyBhbmQgaXQgd29ya2Vk
Lg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
DQoNCg0K

