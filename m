Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420767C9163
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616961.959390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRlb-0005cZ-Cy; Fri, 13 Oct 2023 23:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616961.959390; Fri, 13 Oct 2023 23:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRlb-0005aB-9q; Fri, 13 Oct 2023 23:40:27 +0000
Received: by outflank-mailman (input) for mailman id 616961;
 Fri, 13 Oct 2023 23:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5iA=F3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrRlZ-0005Zm-B9
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:40:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e13ad8e6-6a21-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:40:24 +0200 (CEST)
Received: from DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) by PAXPR08MB7669.eurprd08.prod.outlook.com
 (2603:10a6:102:243::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 23:40:17 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:50e:cafe::74) by DU7PR01CA0047.outlook.office365.com
 (2603:10a6:10:50e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Fri, 13 Oct 2023 23:40:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.16 via Frontend Transport; Fri, 13 Oct 2023 23:40:17 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 13 Oct 2023 23:40:17 +0000
Received: from 3636f09bf5ff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1104071-0561-4577-8F97-235E0923396F.1; 
 Fri, 13 Oct 2023 23:40:10 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3636f09bf5ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Oct 2023 23:40:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9869.eurprd08.prod.outlook.com (2603:10a6:20b:596::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Fri, 13 Oct
 2023 23:40:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 23:40:08 +0000
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
X-Inumbo-ID: e13ad8e6-6a21-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeQmVI7g8tA3Doi6Kibv3I+5Bzbp6bxk1WH5UTaHLpU=;
 b=ufWotCNXaos2TFKJ+qZTZGv3nWL3dh7m9v4ufVnTzI7YofvW+XdhC18TZeR2s919d6YCpvc+a476fdz6jJQpIGsaEGyNFEPQOqYvy93iu+lbfhHPVQasdA/v8Z0/1EawiKk9RjEsJCOoVrClD51pgzz5nI0UgCz4wEY8pK5eMVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ccc5d310d5c5b0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVGVR9qEzmhTCGPQu6YcaComUrab/wiWRJGzrzHi5vT/aoQqzH0TvFpvdPQ29DNUwBdLMl92O8U4y9OeIa/lynYh6wuLhD+EdBZ1UwP8bF8w0CjTafgmFCfPTfvRbukiBqVfCuSGhlTDpooLOt3t07CcYv900Z4uT51SFa/nYvPiIWd5kq+GnUnG2xiMJTMAzDaAt7ajCzUEW4+5ExSSdXOMo84TQkWgGaTWbuxxHc0MJ0wIQQIenFoPWy1yUO6h6NjkEPwnNObKTYhfhmqw5uHiPS2jqH6dsQ1bhYxVleAP4P52DwhFTd6K+OWHC96jWdSovp6q19MmX46+rZfcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeQmVI7g8tA3Doi6Kibv3I+5Bzbp6bxk1WH5UTaHLpU=;
 b=F8ePAbp063eWXpsUd/E6sotG42IXpHdAi6tZaEIMgfvR6TplOiGFytc+k/ZJque7Cq+Svtx9gpgZnNmY++xxI81PwKSQJavKMcEkOV+PiP/tkHPvP/BXlOkplycAV1ojYXuZwg/OX2B+DL12n7ekaJWrsUM4tkuDTfQSBdAFkOHIzbHyK0oCf/kRvSsveJR7Xe/0OgsecuZSZFI3pDzdGAsGPcdrx/lWTs1ZvLqUxSFuiVLrqrY5PiPYC2f+xrdKqsoyUk21neGLGPFct6lm8lei3AN37/b/tqUi1uBwywZO6b2qG8Nz9HRMBxTQw5RFfKkTfKleYLDA7MmcxjD7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeQmVI7g8tA3Doi6Kibv3I+5Bzbp6bxk1WH5UTaHLpU=;
 b=ufWotCNXaos2TFKJ+qZTZGv3nWL3dh7m9v4ufVnTzI7YofvW+XdhC18TZeR2s919d6YCpvc+a476fdz6jJQpIGsaEGyNFEPQOqYvy93iu+lbfhHPVQasdA/v8Z0/1EawiKk9RjEsJCOoVrClD51pgzz5nI0UgCz4wEY8pK5eMVY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v7 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Index: AQHZ+kx2mzsa+jXwb0W90nWA0Ca0ALBIADMAgABoWAA=
Date: Fri, 13 Oct 2023 23:40:08 +0000
Message-ID: <B19ED8C4-DEAD-4ED7-A108-07E14D3E185E@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-4-Henry.Wang@arm.com>
 <5673cd8c-8971-4c1f-890e-d993c22a909c@xen.org>
In-Reply-To: <5673cd8c-8971-4c1f-890e-d993c22a909c@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9869:EE_|DBAEUR03FT021:EE_|PAXPR08MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f87cc8-1cac-4d84-9fed-08dbcc45c178
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k4cCNGBAZLfbxXM9g1p9+0Lg/1bs4bn8Jn+loiNdHsvc694QMD1Abwtp6DrjqSVZDUCD0tLpcbo+RrlHzaCo+BH9rgu6Bgle2jbrp5fdNtB6WxvNt8ImPUMGaGoAf28wLE4mNpTQ+9i8/djVMDZpVt/41gIXbDWyZajeYuCDy2tPlUfR0d3uWn4/Ep2HUJqPQcc86DkRWieKGVG6v5nGDdlrQEUpqtF/sjNMOmdLDuQLsHLAjD9VKrboiMz3qQMs+f1zpVyTxQWWw9Eo6usyREBZmVvOOGkUACAzxHdrLhlA5BkiLj0yDHz6UqUCUnmGKWzTcMHZEJS0lURiLZfxgCKO1ROU6peWswESDazXbwkMvlzZy7KsKaXXtWsx+CBWl+ra2EGvcmZM/koEeAlqiZ75K7HXURnIXQ9No+dWmFyWryzBiISoEBVbBNzKQB/F6AMxhGXYEdVMwBezHwQ4nlraevzZJB8SBlUHumTFMYKKJq/i0W/tP2tXjDLdmClts92EV4NJKyWIIbWqvInY4kjL1OFKgGVqnyLTmLcyxL3fn4XqxgsTb+bdVx+tHG3IbgJPnfdBkai33CvI/oAAW+6OS3sAh6YSH6z9gH1X/5zrXnUun2tefKAOEjzzXlz7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2616005)(53546011)(6512007)(6486002)(33656002)(36756003)(38070700005)(38100700002)(86362001)(122000001)(2906002)(66476007)(71200400001)(66556008)(83380400001)(26005)(6506007)(478600001)(966005)(5660300002)(41300700001)(6916009)(8676002)(4326008)(316002)(54906003)(8936002)(91956017)(76116006)(64756008)(66946007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E213775718D6854AB24D2947CCC81344@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9869
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c7692d4-ffe8-4ab7-5e92-08dbcc45bc5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H7ln4kQ4WefHKKgBt5i8PcK1sVnwjXdv07XlG0XAEjCzyeKAVv1mTmi0/VHTVAlvfWTZdXdVlywfw0Y04Jc+L7LCGkbYmDpiBn0hvBOx6wK8gzTiuZpwp9Fqof0ChPKHv34GObdgJASlSS4RU8IWufzl5HZOP3L/55WK1qJOD/BTb9WvAc/LML8YKNbFtNFXA+gp1D9zK84Vf98S8/kf0YSt2SPXZHhYkKYlN0vRMWb6D2qrGinBrmdMXFb9J3VZv/W39GMLt34Cv0JR+XEbLKpo3KLX2Bv1a0gLkwCidysdg04h9E/db5TyP8JnBGPvSSZaLjL4b+Q4NLs5S23moyqHsjIUqGW9G5F552a9Vfxo4kO5qYRMf+0tKhzL8ic7hxkjPb5Xspvzi3D54Vkg+BXzdIlfQasLbFgVkOLUAhVFvyyfhkYFYNK8lmF1RLItirrPTc2kUtEyDlzUqELWW8R8d8i+m4cvGw9I0gXOQ0a3P2EmHwlPOtuDH6NclR1JaE5eisvRvLLtDKnCPejGEC8Hmx8TfSBmFxXgGsXVkgvT4KvnMj6BJEp0PT3Y4SMk7wsHR0PdokOodcUXMJRp0YDOXMLoegQApYFqpGgatL2CWQ9t9hS/Es98AZoNAPKrvliULnHcxSTPSkoONbiOZcFKV8ouICARoI+oJ7sL/YoU8xqbOL5yeKAre+yL5h5YvJSwfQRnl0jM6yGmQ0zJw4WfAtK1UJaVtm2U6fAwg/Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(451199024)(1800799009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(4326008)(6862004)(5660300002)(54906003)(8936002)(316002)(8676002)(70206006)(70586007)(966005)(6486002)(2906002)(478600001)(2616005)(26005)(6512007)(53546011)(6506007)(107886003)(36860700001)(83380400001)(336012)(33656002)(47076005)(82740400003)(40460700003)(356005)(81166007)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 23:40:17.3618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f87cc8-1cac-4d84-9fed-08dbcc45c178
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7669

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNCwgMjAyMywgYXQgMDE6MjYsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAwOS8xMC8y
MDIzIDAyOjAzLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gQ3VycmVudGx5IG1tdV9pbml0X3NlY29u
ZGFyeV9jcHUoKSBvbmx5IGVuZm9yY2VzIHRoZSBwYWdlIHRhYmxlDQo+PiBzaG91bGQgbm90IGNv
bnRhaW4gbWFwcGluZyB0aGF0IGFyZSBib3RoIFdyaXRhYmxlIGFuZCBlWGVjdXRhYmxlcw0KPj4g
YWZ0ZXIgYm9vdC4gVG8gZWFzZSB0aGUgYXJjaC9hcm0vbW0uYyBzcGxpdCB3b3JrLCBmb2xkIHRo
aXMgZnVuY3Rpb24NCj4+IHRvIGhlYWQuUy4NCj4+IEludHJvZHVjZSBhc3NlbWJseSBtYWNybyBw
dF9lbmZvcmNlX3d4biBmb3IgYm90aCBhcm0zMiBhbmQgYXJtNjQuDQo+PiBGb3IgYXJtNjQsIHRo
ZSBtYWNybyBpcyBjYWxsZWQgYXQgdGhlIGVuZCBvZiBlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbSgp
Lg0KPj4gRm9yIGFybTMyLCB0aGUgbWFjcm8gaXMgY2FsbGVkIGJlZm9yZSBzZWNvbmRhcnkgQ1BV
cyBqdW1waW5nIGludG8NCj4+IHRoZSBDIHdvcmxkLg0KPj4gU2lnbmVkLW9mZi1ieTogSGVucnkg
V2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB2NzoNCj4+IC0gTm8gY2hhbmdl
Lg0KPiANCj4gR2l2ZW4gdGhlIGRpc2N1c2lvbiBvbiB2NiwgSSB3YXMgZXhwZWN0aW5nIHNvbWUg
Y2hhbmdlcyBoZXJlIGF0IGxlYXN0IG9uIGFybTY0IHNpZGUuDQoNCk9oIEkgYW0gc28gc29ycnks
IEkgY29tcGxldGVseSBtaXN1bmRlcnN0b29kIHRoZSDigJxsZWF2ZSB0aGUgY29kZSBhcyBpc+KA
nQ0KZGlzY3Vzc2lvbiBhbmQgbm93IEkgcmV2aXNpdCB0aGF0IGRpc2N1c3Npb24gYW5kIG5vdGlj
ZWQgdGhhdCB5b3UgZGlkIHNheSB0aGUNCuKAnGxlYXZlIHRoZSBjb2RlIGFzIGlz4oCdIGlzIGZv
ciBhcm0zMiBvbmx5IF5eJw0KDQpJIHdpbGwgZml4IHRoZSBhcm02NCBzaWRlIGluIHY4IGZvbGxv
d2luZyBbMV0uIA0KDQo+IA0KPiBGb3IgYXJtMzIsIG15IHByb3Bvc2FsIHdvdWxkIG5vdCB5ZXQg
d29yayBiZWNhdXNlIHNhZGx5IHRoZSB0ZW1wb3JhcnkgcGFnZS10YWJsZXMgZm9yIHNlY29uZGFy
eSBicmluZy11cCB3aWxsIGNvbnRhaW4gd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUgbWFwcGluZ3Mu
DQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvNGQ3YTk4NDktODk5MC04
ZGRkLTM1MzEtOTNmNGUyZTI2MmIxQHhlbi5vcmcvDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5

