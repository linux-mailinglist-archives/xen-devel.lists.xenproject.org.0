Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E757BB9EA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613651.954324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolOi-0000G8-3c; Fri, 06 Oct 2023 14:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613651.954324; Fri, 06 Oct 2023 14:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolOi-0000EM-0j; Fri, 06 Oct 2023 14:01:44 +0000
Received: by outflank-mailman (input) for mailman id 613651;
 Fri, 06 Oct 2023 14:01:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qolOg-0000EG-L7
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:01:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deb66b6f-6450-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:01:39 +0200 (CEST)
Received: from AM5PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:206:14::31) by AS2PR08MB9413.eurprd08.prod.outlook.com
 (2603:10a6:20b:597::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 14:01:36 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::4) by AM5PR0301CA0018.outlook.office365.com
 (2603:10a6:206:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Fri, 6 Oct 2023 14:01:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 14:01:35 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Fri, 06 Oct 2023 14:01:35 +0000
Received: from fcb68d44f724.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FD1C33E-71A5-4FC5-99EF-8B6618271BCA.1; 
 Fri, 06 Oct 2023 14:01:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcb68d44f724.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 14:01:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 14:01:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:01:26 +0000
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
X-Inumbo-ID: deb66b6f-6450-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXKiWVTs0jgY5PR++bLAGykx6oWZ5y3QR/PCTyCwyqk=;
 b=RowjpUtOLZqLRYWU/x3Vw2q7mceXWm0tCL/bjhKeJ9sK7Xq3n+t42DuvjOYAV3T8Zz5mMGaVnc1BzZB8Vqe9jrBAr2nLj6TIljGnd7ewyJCUFgVjJu8oz0MYPBo+yO6MQUjN2BvD25MgDrfuqLLm7rnAFa7tZw/bHfAwze4EOzQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8caaa4090109cc7c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxPcmWk5g0XXTHjo8QE7x5adUM+8H0GBgFLR52aaadzvjQT/EIMJfVKQfI7X5lftfLmqWc38XaaC78wwNo+eX+lX7daNkMW8gKNPrh/7r9PxKmrlF06XEKCVSYxol9EIK8oqb9fcTyP0bhxXO2rgfRlj/MsEL5rouz/9/Y92gGFw7Q4PzQeAMVlvIqI3Jne/XKwdVOYR9g3mUaQexynnceVpUnzYoxAJJRi1G5Pa3wsnSIgzLdeToKXmZkAqROdanvpUa3qT/3bkQfpGqSkHfewDhqazig5SVIUQGW2GwXYy/T25jMqUC3YP6qxk9bwe3ClayX5Q1Cqgp9p9cYEXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXKiWVTs0jgY5PR++bLAGykx6oWZ5y3QR/PCTyCwyqk=;
 b=bu3F9rvCKfObKYVtqBhRc2LtW6xS6GccukUw1Gt6/9kggtDioBzLLAMCHzJUh9j1bfCQIttK/EWgjsNrVgoGHorev1H8fkLfVstWIOQts84NOh5CCtikuxY1KdAZHPXUDAsaRmBRW+x28oBlOCLdJpYU3tpIX3WslygTYX2wljoM8uU3DiHxdKj3ijXkxGjVgwjAsC5CZhhpLhH7iQyzZ0qxyosYf3x1W0xFsyUPaxwpPyJObn4IvlJhEfb+7PVdiUGy2W6EJm7JHgdxClPUkpZeN/4wdhlL1oR1A7/qUrErtXzCUerbKPCEyu3Cyn02HnfbsDRhw7DXNzxlvM7ndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXKiWVTs0jgY5PR++bLAGykx6oWZ5y3QR/PCTyCwyqk=;
 b=RowjpUtOLZqLRYWU/x3Vw2q7mceXWm0tCL/bjhKeJ9sK7Xq3n+t42DuvjOYAV3T8Zz5mMGaVnc1BzZB8Vqe9jrBAr2nLj6TIljGnd7ewyJCUFgVjJu8oz0MYPBo+yO6MQUjN2BvD25MgDrfuqLLm7rnAFa7tZw/bHfAwze4EOzQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: Re: [PATCH for-4.18] x86/memshr: Fix build in copy_vcpu_settings()
Thread-Topic: [PATCH for-4.18] x86/memshr: Fix build in copy_vcpu_settings()
Thread-Index: AQHZ+F0n5Y2AIoSXPky3KIS2scfL57A8ynIA
Date: Fri, 6 Oct 2023 14:01:26 +0000
Message-ID: <DD6E3A6F-E2DA-47B7-884F-E8805349C93E@arm.com>
References: <20231006135745.1038947-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231006135745.1038947-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6046:EE_|AM7EUR03FT062:EE_|AS2PR08MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 33597cf1-8c8e-4f4a-0f2e-08dbc674c105
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qFRjV03nsG0u1nynDebDJdlOhbYZ5Jak59yzILDeTrAVtbLugVq7hR2q1FIQTSZ2VJ9sCCmP9KI880+sP4rJM4v+jUPH935C+DyFDAGsNZLfVbIRZm7V5WrmjYZwJjTcpYeI3XulfL8K8lIhvMlQB+QqLuWCGx+QhcL3gJbZ8jmcYT01NtgxOB76tG5zqO6IffEpQ5YKAaF7Y/Km8p7fMLP2ZupLFyQUWYxXFj2Zeribu+ISAYfKe5pRy7Phb6JvVMUrtp65U5/mb9p9H6l1MCs49RbMhJuNLBtFJ1NkHcVbhx2dmNW7E7gp8hxbtSSyFvLZ9WMGUFUu00h8tkPDM0vjScjKaRaFfGCiftRZUxbnNrbO4gUzCxP6rp7jjh99vSfcQIJShF1Q1qJVWplfBygYMe9Zk2Kvix4IAq/kwi5zdjH+F4yR/pDrbWA3QXxU3gTzACfVkr/6VkQJRKoVw83Y8xOxOMbSEzBWqMrNPqn33Ny9UdlzBJuDDMjhz9aUisQP9TrIzyQSSv9oWfndED7IjruKQODWve6XiH42nSxfnkikSlzdZB7Lsu6WDTLRRD+4c/SL1ooVaMkMSBYRBC0JVv1hnPT5tNDCBcyUFMhix8dk3SXIg+6PgyvK+v7lYQ/yKp4QfbttCNrd8HwmMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8676002)(8936002)(316002)(6916009)(5660300002)(41300700001)(2616005)(478600001)(26005)(6486002)(122000001)(6512007)(76116006)(83380400001)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(91956017)(2906002)(4744005)(86362001)(33656002)(53546011)(71200400001)(38100700002)(38070700005)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E6B41D70D51DF49AA38424AA0B27B06@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61b9b760-7821-40f7-a114-08dbc674bb55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U0GBGjgxArEXR0WYvSrKfUvaoT2A92rjVzuNFpFSBleIZWn+JYsKGwpX/pBk+t2wDxfmtkkmku4Xj43hJ6EqrhLwNb07vcnFM1xGxnw7836xQEGu1QBhiVluyZPT2586m8GcXypW5K2LwAuLxl8nX/v6CW/4K8jyts7pWuy8wifi2SrchRzrYpmF0EfV83P90gtjsslMB4/0kUMbRmbACIzXgBsZTJqm0mFXJdznq9rEnNosC10iZj59fJswuqzNK8T4NxkIj67DAFbm3MeaYK99TF7ISQXpKs5W0S+v/+frdbnpt3Qb5OnBlXjo0Yfc+hrMkWl4kvv+Ree579fMTORLrqaF6YyvvFXW9v4QK3pVVV3DtiTyGp+CWreCdXXdIlnKjdxEO1x1BOOr56gJXcWRgAPrUaGuUaGGRw7P0digCMpxQm4TqhKC63HzVd2N290kEqqAMT3yhXuviSuDqxvxGtjG8tuyhSauEUoL5nLc+5/SK/SQ+UMstSYLPdBjXwQflaNlDBfO6pnMOB8ip21y7hf4IULDI1NIbLmFh8vsOGW1xUTvmO0SBK2LuoKGZalDBqLp3Dh/JixujbroUmeQfMKL4fiSrQgw6O7HiBLd27XZN+dlJ+Ed48nFckUwUhA+2lLDjZkohqtH4Cr4EA6luYNWu7qx+EV8r00Upqkjgo///QcFeDKb81+jpzvEH+APmK/ZnO13zIrsLiq9Vr83SwBwyOKLMdv4RLMN3aRk87tQd1QGSaXj3nNhokYe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(2616005)(82740400003)(8676002)(26005)(6862004)(5660300002)(8936002)(81166007)(4326008)(86362001)(478600001)(47076005)(356005)(6486002)(70206006)(40480700001)(40460700003)(70586007)(54906003)(36860700001)(53546011)(316002)(107886003)(2906002)(36756003)(6512007)(6506007)(336012)(33656002)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:01:35.9428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33597cf1-8c8e-4f4a-0f2e-08dbc674c105
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9413

SGkgQW5kcmV3LA0KDQo+IE9uIE9jdCA2LCAyMDIzLCBhdCAyMTo1NywgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgbGFzdCB1c2VyIG9m
IHRoaXMgdmFyaWFibGUgd2FzIGRyb3BwZWQuDQo+IA0KPiBGaXhlczogMjk1NTE0ZmY3NTUwICgi
Y29tbW9uOiBjb252ZXJ0IHZDUFUgaW5mbyBhcmVhIHJlZ2lzdHJhdGlvbiIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJlbGVh
c2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4NCj4gQ0M6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gDQo+IEkg
ZXhwZWN0IEdpdGxhYiByYW5kY29uZmlnIHRvIGZpbmQgdGhpcyBldmVudHVhbGx5LCBidXQgaXQg
ZG9lcyBkZXBlbmQgb24NCj4gQ09ORklHX01FTV9TSEFSSU5HIGJlaW5nIGFjdGl2ZSB0byBtYW5p
ZmVzdC4NCj4gLS0tDQo+IHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgMSAtDQo+IDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYw0KPiBp
bmRleCA1MjE3Yzc1NWEyOTkuLjk0YjZiNzgyZWYyZSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMNCj4gQEAgLTE3MDYsNyArMTcwNiw2IEBAIHN0YXRpYyBpbnQgY29weV92Y3B1X3NldHRpbmdz
KHN0cnVjdCBkb21haW4gKmNkLCBjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+ICAgICB1
bnNpZ25lZCBpbnQgaTsNCj4gICAgIGludCByZXQgPSAtRUlOVkFMOw0KPiAtICAgIG1mbl90IHZj
cHVfaW5mb19tZm47DQo+IA0KPiAgICAgZm9yICggaSA9IDA7IGkgPCBjZC0+bWF4X3ZjcHVzOyBp
KysgKQ0KPiAgICAgew0KPiAtLSANCj4gMi4zMC4yDQo+IA0KDQo=

