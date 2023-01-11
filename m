Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE47E665B2A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 13:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475270.736889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFa0O-0006i8-2o; Wed, 11 Jan 2023 12:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475270.736889; Wed, 11 Jan 2023 12:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFa0N-0006fu-W7; Wed, 11 Jan 2023 12:14:55 +0000
Received: by outflank-mailman (input) for mailman id 475270;
 Wed, 11 Jan 2023 12:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gQc=5I=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pFa0M-0006fk-O8
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 12:14:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d5d4fdd-91a9-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 13:14:52 +0100 (CET)
Received: from AS9PR06CA0457.eurprd06.prod.outlook.com (2603:10a6:20b:49a::18)
 by DB4PR08MB7959.eurprd08.prod.outlook.com (2603:10a6:10:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 12:14:41 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::35) by AS9PR06CA0457.outlook.office365.com
 (2603:10a6:20b:49a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 12:14:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 12:14:40 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Wed, 11 Jan 2023 12:14:40 +0000
Received: from 83a73c8f75ae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6480313E-C6CF-4E30-8788-17E969093945.1; 
 Wed, 11 Jan 2023 12:14:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83a73c8f75ae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Jan 2023 12:14:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9354.eurprd08.prod.outlook.com (2603:10a6:102:301::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 12:14:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 12:14:26 +0000
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
X-Inumbo-ID: 8d5d4fdd-91a9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MvJYukd5RpqeKbJG/1RE6/DG6w+HNio7w46iNbYORc=;
 b=kjzIzJc4W1eYrJohHo2l5chO19gp0UVZwTXX0GIiwG6FbzMrcXASEbEiZ/+0qXPR/p4M3W2PhgH4M2uPh+5QqFUTd34rvJSTO+DbbBb/vMBi02e2O7s0RKaqGV14HDVnAKdO/j7Yc3lLoBDeTz+gRrzbw5qlBMz14o7XeqTbMYg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2bd239f0e166dd1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb4an7EHPilKYVUEzdozvgngNC7ureDTzteTt0XtSdgFemxw54FUlZYs1MjUuT3rDBMAaZSlONQirGu2geeB79NPH6W0xChxTTHLm+pXEC4S7Oizo1aLh5iRwrxC7EP9KZgLwUtspkZ2pFPIFx2/+ABO4Gx5qK3zqrBlTvSH0UaPbt4XVn8ivmtINEhQNz+8YIKJvvPWp/ldhT+LRbIbWCfjsGla2bZVU7Q9dVjZaupkUkcG+zsSLmQcOMKZPQCCwMsAfviAFTYYDyI3kl59JF8D0k8nZ7slcxSGYXEhiEoObMNoo0b+Do65pJaNKPoDb7O92NEyXAv8a5j8yV2Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MvJYukd5RpqeKbJG/1RE6/DG6w+HNio7w46iNbYORc=;
 b=WTi5ZtlDZzjX1/HTXU/yDLDyCC6Jez9xh0+7KJ4VoCIjT9AkzzKXg9IguJbTF6Vij+K4a31j1YDTXjV4tKbwTzPhXm+0YesaQL2G2EodQloTf+bvkAxLHD3VN94EidaH/yXMTNRJVJALETgxPosbmaxikD0ZkCXbnhaaK/eTdRBb2Q/124tb+u5HG7dgXJ2Ep2F7hF+/9QPNGUSMFF8noSrCNmHAaRkNEIQZSE14/+81Sl4nWSolAEhGQp7isOK9WaAG5Lzfhn9VStV8HjtRKdHRvczEnx0rfHSJeMo+QlM1ES5clVdrBdjMgl7JxPFeYRlCe5XlR+O5YcceDfNWpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MvJYukd5RpqeKbJG/1RE6/DG6w+HNio7w46iNbYORc=;
 b=kjzIzJc4W1eYrJohHo2l5chO19gp0UVZwTXX0GIiwG6FbzMrcXASEbEiZ/+0qXPR/p4M3W2PhgH4M2uPh+5QqFUTd34rvJSTO+DbbBb/vMBi02e2O7s0RKaqGV14HDVnAKdO/j7Yc3lLoBDeTz+gRrzbw5qlBMz14o7XeqTbMYg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen: Remove the arch specific header init.h
Thread-Topic: [PATCH] xen: Remove the arch specific header init.h
Thread-Index: AQHZJbIaKE9+sa25KkC1qw/e7vlCUK6ZIQwA
Date: Wed, 11 Jan 2023 12:14:25 +0000
Message-ID: <69428FD5-7BFB-43BC-B2D7-F1C352365EB8@arm.com>
References: <20230111114409.7495-1-julien@xen.org>
In-Reply-To: <20230111114409.7495-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9354:EE_|AM7EUR03FT005:EE_|DB4PR08MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9e937a-e57b-45e0-a153-08daf3cd6a9b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9LOBkl0nCdjl4SDOPcoQgwqfEzzAU2tbLDrT5yJwistFtBAq5Wtylo49VybF4soTSZBrE5xjtpCBPvpTQ2ZpHYl4bz+TAPaAlwf0ZD7elg3398GkXhbm6VLjYalsre4K6m53P01Gxw5+yl8xBeMOxhetZZpEnNFgpWCUJzdN/xmVQ81pxOq84IR312li2Hz63xsnPqEeLG3b1WCqWmBlMi0jiseziUtOsjE/EJ+i7Bu3xofjVeCdvQHjGUpaueWvqHED0KfcJMSRcBhpWPJBb0VtIHyGsfLb39a2xPoEsVt89llPp3TgS1HGmtLDxaQdRt9U1QLYDagCeWudgOIem0dyNzEbTCEBl50r4cG4dFSWcUKHD0RLdzc5u6FQQhw5ITgAwedKjTEbtCqNeF4L5Ux9msm+ZPqwr4iPTJlw3rjCRMbZt9zkeRGb7HENeRCoizyD80ElJuOV3IwBRQkW00m9DKaihCtPmisKrrw4/l2kVNyW2DgNZH7zxZqjBEobPDRWyKoRFUoqRf1Pcu9hIlcXgtsOeXyZUhupwHEBTGLAifcfNh2EgvGJu5atkwVUI7kXjsHFQcA+qX7IlpZazPcqLoRq015J5Z3svUWUBrodquPOOUql2UKoOJDf7bwoQsK+ds+8Vxwie9Km1PWMAuqtGe3knXJ5bbz2AQaD0E8Bhw4Aju2TQtYBhL+Ecu3X+q0bw2oY30yr/1yhlCOpaC93ka3fSoRYVN/21sQoVtI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(7416002)(5660300002)(2906002)(8936002)(41300700001)(2616005)(8676002)(64756008)(4326008)(316002)(66476007)(66556008)(91956017)(86362001)(66946007)(6916009)(76116006)(54906003)(66446008)(71200400001)(36756003)(478600001)(6486002)(33656002)(6512007)(53546011)(26005)(6506007)(186003)(122000001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <14F03F888A259C4388E86CA88E34151A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9354
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	398c2b35-f106-4ce2-d2dc-08daf3cd61b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Iks4Gadg3jehNMnx6XqQitH+GXnBfzYzoYNXNM6DqMVP0VIDRRTccpuegQZbgs9mN7yCIn4lge8QZ7iSzSM4t48RWSKKTICfsFjeihq1s90cg+t/yb3uWNV92+q7x6r+ZMXpQd18KAPNol09m4zY9IXPB1UJxZoqo8TK2408lSeflRFx0NAe0Aq+LEr1m6auMPTFN9ZYruAx9ZDQmVB6yobFvvJOYxpLIQ99RskEyO7WODVeQigARfM7WOt8WSB7DH+9dpv3sFvgulsUMFQ76zCrCho/ad7tKKuqTNMyeXocQlZl8qZ58O+Al5xCHKwlm3eY/EBshouOfj7LBBtNjBjp5PGsk3utzHEKOudLiYjJ/82O/BTtg9d1jPRX8JeuHCL3wyOjQXvOhkrXtRVsTHc+/vcO4HoFst+OO6CbXBtUWci8/xsOtr5Nk6Q4B6mqaLLq6hca5hcjNKhDpvyxuieaUx6FW0CfHEOBpGw3z/8cJrfjzlm41LgEKdqHbr9EnX+8lkVm/L/dAaCkXpE4hnbRGPXLvoCsl/hVjCxbMt+SoUuE4nwkSi1HrHhCXSKeoX45eL1jKc76IJ8GmrajzQmohFvrMaSqaQOWDGDEqgnUu2rW3FQhgLL9ej5QUGZYXHdY58JlsgxLcLFQKpnfg7FTUlvKSM+ECSaSh2V+T7GcmsM5uJ88GPTBGhoaC2lIFUB//mYZo0u2QGddlXOLFQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(478600001)(6486002)(6512007)(26005)(40460700003)(36756003)(186003)(356005)(47076005)(81166007)(86362001)(41300700001)(8936002)(6862004)(82310400005)(2906002)(5660300002)(82740400003)(54906003)(316002)(40480700001)(2616005)(70206006)(70586007)(8676002)(33656002)(336012)(6506007)(4326008)(107886003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 12:14:40.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9e937a-e57b-45e0-a153-08daf3cd6a9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7959

DQoNCj4gT24gMTEgSmFuIDIwMjMsIGF0IDExOjQ0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBCb3RoIHg4NiBhbmQgKHNvb24pIFJJU0MtViB2ZXJzaW9uIG9mIGluaXQuaCBhcmUg
ZW1wdHkuIE9uIEFybSwgaXQgY29udGFpbnMNCj4gYSBzdHJ1Y3R1cmUgdGhhdCBzaG91bGQgbm90
IGJlIHVzZWQgYnkgYW55IGNvbW1vbiBjb2RlLg0KPiANCj4gVGhlIHN0cnVjdHVyZSBpbml0X2lu
Zm8gaXMgdXNlZCB0byBzdG9yZSBpbmZvcm1hdGlvbiB0byBzZXR1cCB0aGUgQ1BVDQo+IGN1cnJl
bnRseSBiZWluZyBicm91Z2h0LXVwLiBzZXR1cC5oIHNlZW1zIHRvIGJlIG1vcmUgc3VpdGFibGUg
ZXZlbiB0aG91Z2gNCj4gdGhlIGhlYWRlciBpcyBnZXR0aW5nIHF1aXRlIGNyb3dkZWQuDQo+IA0K
PiBMb29raW5nIHRocm91Z2ggdGhlIGhpc3RvcnksIDxhc20vaW5pdC5oPiB3YXMgaW50cm9kdWNl
ZCBhdCB0aGUgc2FtZQ0KPiB0aW1lIGFzIHRoZSBpYTY0IHBvcnQgYmVjYXVzZSBmb3Igc29tZSBy
ZWFzb25zIG1vc3Qgb2YgdGhlIG1hY3Jvcw0KPiB3aGVyZSBkdXBsaWNhdGVkLiBUaGlzIHdhcyBj
aGFuZ2VkIGluIDcyYzA3ZjQxMzg3OSBhbmQgSSBkb24ndA0KPiBmb3Jlc2VlIGFueSByZWFzb24g
dG8gcmVxdWlyZSBhcmNoIHNwZWNpZmljIGRlZmluaXRpb24gZm9yIGluaXQuaA0KPiBpbiB0aGUg
bmVhciBmdXR1cmUuDQo+IA0KPiBUaGVyZWZvcmUgcmVtb3ZlIGFzbS9pbml0LmggZm9yIGJvdGgg
eDg2IGFuZCBhcm0gKHRoZSBvbmx5IGRlZmluaXRpb24NCj4gaXMgbW92ZWQgaW4gc2V0dXAuaCku
IFdpdGggdGhhdCBSSVNDLVYgd2lsbCBub3QgbmVlZCB0byBpbnRyb2R1Y2UNCj4gYW4gZW1wdHkg
aGVhZGVyLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+
IA0KDQpIaSBKdWxpZW4sDQoNClRoZSBhcm0gcGFydCBsb29rcyBnb29kIHRvIG1lLCBJ4oCZdmUg
YWxzbyBidWlsdCB4ODYsIGFybTMyIGFuZCBhcm02NCBhbmQNCm5vIHByb2JsZW1zIGZvdW5kLg0K
DQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoN
Cg0K

