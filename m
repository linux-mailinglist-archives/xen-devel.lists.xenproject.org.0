Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC7667046
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475982.737931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvEF-0004j7-9n; Thu, 12 Jan 2023 10:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475982.737931; Thu, 12 Jan 2023 10:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvEF-0004hC-6Z; Thu, 12 Jan 2023 10:54:39 +0000
Received: by outflank-mailman (input) for mailman id 475982;
 Thu, 12 Jan 2023 10:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+83i=5J=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pFvED-0004h4-KG
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:54:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fbd96b7-9267-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 11:54:34 +0100 (CET)
Received: from FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20)
 by DBBPR08MB6249.eurprd08.prod.outlook.com (2603:10a6:10:203::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 10:54:32 +0000
Received: from VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::61) by FR3P281CA0034.outlook.office365.com
 (2603:10a6:d10:1c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Thu, 12 Jan 2023 10:54:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT013.mail.protection.outlook.com (100.127.145.11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 10:54:31 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Thu, 12 Jan 2023 10:54:31 +0000
Received: from a69b6cc4c072.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE37EF1C-B400-4D5C-8F7C-709C394F5BA7.1; 
 Thu, 12 Jan 2023 10:54:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a69b6cc4c072.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 10:54:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9491.eurprd08.prod.outlook.com (2603:10a6:10:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 10:54:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 10:54:18 +0000
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
X-Inumbo-ID: 7fbd96b7-9267-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Usn1RNUaOnGhr71Cg3aFmCJpGX2mSsNaj4aK0MYhhM=;
 b=CGV/wc0m3GApAlBhpspll+ZM+rze3bFj4wGke56+VfjL2ZMiBpjE90S0jXqwubp5znssNQw8ugfo8upN3zJXx2RZttNqO2ycPgdC1rhjWP1hX4sQONIhvWKI+bosc3EuiT/yWayY8RwuR0ixtLB/p93ghYxPtLMhueiQVK5pPp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf1a4a8dfa4e666b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyGaUG1/heBiTTP3HK3taZjLDpBpg8juZarHogzcyv2zAI0zvboxaPDg0QQFwm7eZkPlHB0RRTZ23DOqSov3QhLSbQR412Y3NXcNWNex+/+AfZhaEAXQBH0Mdp11ZOQzA8ZuVYQ/6vtkR0DOT1qQoUZecLQk4PXwGMPXAp6rEjc4zmcAjwfStpPIaJ3YD5H1/mcmBauB63hoTXypIfxPrzd/Iy244OVEXyuEcsIX7219Rw9K8WojnRwsSv/uh7HGfsUTKoQrdKAivazSvcl+hZ8MMuAL+ukQL8lmjggFtpWC6V25oEBNCRTZGWzKhfsTGPV0xWat5h/UVgrgXinW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Usn1RNUaOnGhr71Cg3aFmCJpGX2mSsNaj4aK0MYhhM=;
 b=EahDhZJnn8YqfF5TReKFJ6byGsf6jDHP/Ex/zhLmHg+7Xdrr241nZ25r48SJr2/pyH8BG1BGN11Yi/IO/HwCwfzQxDHaY05OBk0cfhPnFfm9Jdwa08cTDhhNgzkic3/GxFR4xo3IIs2PcQEKd/om6/JbxN+Ufwyl5otDfG54sDX7gIRDvgugI5jgaFOet/aGpmf6Ex2WkGxzCHcxNC7JwQX1VGGOLp/u6f6EQv4sCxXUpmySC3+Z6vHb5/SftzHzi+T9liXm03I5UWofqaC9QNaGnKl5kDmTsTUhJxKBiPTlBn9JxYY9ZtwueqUhMNLVx97Ho1oqo0y8Ib8Z6DZFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Usn1RNUaOnGhr71Cg3aFmCJpGX2mSsNaj4aK0MYhhM=;
 b=CGV/wc0m3GApAlBhpspll+ZM+rze3bFj4wGke56+VfjL2ZMiBpjE90S0jXqwubp5znssNQw8ugfo8upN3zJXx2RZttNqO2ycPgdC1rhjWP1hX4sQONIhvWKI+bosc3EuiT/yWayY8RwuR0ixtLB/p93ghYxPtLMhueiQVK5pPp4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Thread-Topic: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Thread-Index: AQHZJcqDGP094PnLfE+ehr42WQkWI66ZeH+AgAEkTQA=
Date: Thu, 12 Jan 2023 10:54:16 +0000
Message-ID: <9168CB2A-A1F1-43E0-9DAD-BB31AD3979E0@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-3-luca.fancellu@arm.com>
 <91b5c7db-ec9b-efa6-f5cf-dc5e8b176db6@xen.org>
In-Reply-To: <91b5c7db-ec9b-efa6-f5cf-dc5e8b176db6@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9491:EE_|VI1EUR03FT013:EE_|DBBPR08MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: c375eaf4-f9b3-44c5-6f08-08daf48b6274
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iJ4KfzT0vmwP+dJ3H0HDZ37pYReY3hGwxT5qv/E169o5PzBzl6LTiVYCS6ckRxa+iLn5/SFePvjRkp+4LJeHuR8z33v/3Uc0a4aOzDHd+Q84Umv6joeF1mEny3HiElVRiV4UwrbZLCQUXoKDpC6ye4iajlqoM+gngeEFgcVHQB7Q4bWZOKTd6kn/CdU3PBt09tZ67WRrkeV1/I4cYsNJJQbsLXh0v7lQ7xtnd8ejsNJ/+e7pPV7pA6Hpd288o1nnENprS0083/z/KA7JgFAmfKQhxZxQrhISb4orkVOlLV/Gm+dbGox/ZM9QDmQHPLZr2WWuowHBCUQJE74AfwpWMi75fOuxihvCHnNA4Czxg8rP9VZWQlAvHyF1kYHlCpsINx+SnRIVIMWnToCan0jHbmJBP5NndLhDlhLSUnDCHKDvXiXyW2oDNgyAejOmGZmzU6zH10AjFph6BL5yHCaWstcQzh9wxq5ZZqJCOHyaFDI6LZb56j8LcZplm1vlktBnbhLyhl1BerbLoTwY71W/yifTDCivSFV3Rj2zQWRtJXhYhQOdDR0JjEwITqMX1ilYVE0t9woESbpcvvA+AY8Mv1vUEmQ//G/gEmnJhNEpvtIanqNcN1gf4oKtiio9uG5kGBLJNtvsk7NPL0/uPoKfmdPuFo/w1a7ObOxCJNbNA3me0JUo97m602RlOQC9ZXq9Cawi+NYMrgsYWnBMkhJ20LE550rPwxTrI8rwM9RArVc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(71200400001)(6486002)(2616005)(478600001)(38070700005)(83380400001)(316002)(186003)(6916009)(53546011)(6506007)(54906003)(26005)(6512007)(66476007)(86362001)(66556008)(64756008)(66446008)(41300700001)(8936002)(4326008)(91956017)(76116006)(66946007)(5660300002)(8676002)(2906002)(38100700002)(122000001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D9760FB910CB84997646CDE4B8EA403@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9491
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39757535-3d5c-48fa-2b8c-08daf48b5975
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3QyOy5Fd1ynDajFZbylxhAqDtGxEGi4P1Z1j1jY4WqpTKxhLLTMTxgUFqPyYeOOcREOz9pw+DgyrBw/8DpJZtyN99DnRo5l110DmN5jXKXEsgIMsq8JrPpHDoy9g7bZjApFYSYmAhXLzEVXt0Kf5xtW5eNIj0zQkPl7EZYm7o/6Vi5yLpNXmnuWF23Vw86gy20P9DPJseUfXtfZyBdC2pSJ+yNqASIs78qLnEY36x+6N1TAyvQ+2fl4PLcWE0bgr5seZXnbVGzTmDQGQCO5FuLVXGWIazmqZDfFcyFrKZAN9e38qPBZ0BwIxEWJk8ZVURkbQ/zQxK4XBuvq8ZQdzBUjO9XzVFtHXKyTAHKCOM/7xMXo8nMOWHwhzMaVYIOCbbTW+O5nOJ9JNi3LQiNsqNhYCsXbHXGZ8x1utiYx2y93gYHSkRLkmzQioaNaxRtb0FnysUsvmV8VVkTJZ2/24rPwpf1HuUbuKVW1pEi0YiM93qPlzHb+qxPNHqmaSQ+veh2lSgIapg67u8RO/biZ/khpeYP+ajaqUE9pVfT+j/LHfi+1XRckoDCXnX3ysMc/quSKnXqx74HRL0QqsFHgp4JpBdlAZRJvhfuW/xHWul85ts3rpGtLLcc4wm+q/A97w4w9nob5mTavY4VaKYiJ+r9pEAWb+4OVEnc48nH6/2sn7+Yj65A+rS2Ie+EQQF+Y7tZmzBRJafw8Mg2Ga0ZNslA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(8676002)(478600001)(70206006)(70586007)(336012)(2906002)(41300700001)(82310400005)(82740400003)(36756003)(4326008)(5660300002)(36860700001)(40460700003)(81166007)(83380400001)(6862004)(8936002)(6486002)(356005)(6512007)(26005)(6506007)(53546011)(33656002)(2616005)(54906003)(316002)(40480700001)(47076005)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 10:54:31.4213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c375eaf4-f9b3-44c5-6f08-08daf48b6274
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6249

DQoNCj4gT24gMTEgSmFuIDIwMjMsIGF0IDE3OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMS8wMS8yMDIzIDE0OjM4LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gQWRkIHN2ZV92bF9iaXRzIGZpZWxkIHRvIGFyY2hfZG9t
YWluIGFuZCB4ZW5fYXJjaF9kb21haW5jb25maWcNCj4+IHN0cnVjdHVyZSwgdG8gYWxsb3cgdGhl
IGRvbWFpbiB0byBoYXZlIGFuIGluZm9ybWF0aW9uIGFib3V0IHRoZQ0KPj4gU1ZFIGZlYXR1cmUg
YW5kIHRoZSBudW1iZXIgb2YgU1ZFIHJlZ2lzdGVyIGJpdHMgdGhhdCBhcmUgYWxsb3dlZA0KPj4g
Zm9yIHRoaXMgZG9tYWluLg0KPj4gVGhlIGZpZWxkIGlzIHVzZWQgYWxzbyB0byBhbGxvdyBvciBm
b3JiaWQgYSBkb21haW4gdG8gdXNlIFNWRSwNCj4+IGJlY2F1c2UgYSB2YWx1ZSBlcXVhbCB0byB6
ZXJvIG1lYW5zIHRoZSBndWVzdCBpcyBub3QgYWxsb3dlZCB0bw0KPj4gdXNlIHRoZSBmZWF0dXJl
Lg0KPj4gV2hlbiB0aGUgZ3Vlc3QgaXMgYWxsb3dlZCB0byB1c2UgU1ZFLCB0aGUgemNyX2VsMiBy
ZWdpc3RlciBpcw0KPj4gdXBkYXRlZCBvbiBjb250ZXh0IHN3aXRjaCB0byByZXN0aWN0IHRoZSBk
b21haW4gb24gdGhlIGFsbG93ZWQNCj4+IG51bWJlciBvZiBiaXRzIGNob3NlbiwgdGhpcyB2YWx1
ZSBpcyB0aGUgbWluaW11bSBhbW9uZyB0aGUgY2hvc2VuDQo+PiB2YWx1ZSBhbmQgdGhlIHBsYXRm
b3JtIHN1cHBvcnRlZCB2YWx1ZS4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9hcm02NC9zdmUu
YyAgICAgICAgICAgICB8ICA5ICsrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAg
ICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmggfCAxMiArKysrKysrKw0KPj4gIHhlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCAgICB8ICA2ICsrKysNCj4+ICB4ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0uaCAgICAgICAgfCAgMiArKw0KPj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgICB8ICAyICstDQo+PiAgNiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0
L3N2ZS5jIGIveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+PiBpbmRleCAzMjYzODkyNzgyOTIu
LmI3Njk1ODM0ZjRiYSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+PiBAQCAtNiw2ICs2LDcgQEANCj4+
ICAgKi8NCj4+ICAgICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4NCj4+ICsjaW5jbHVkZSA8YXNtL2Nw
dWZlYXR1cmUuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4gICNpbmNsdWRl
IDxhc20vYXJtNjQvc3lzcmVncy5oPg0KPj4gIEBAIC0zNiwzICszNywxMSBAQCByZWdpc3Rlcl90
IHZsX3RvX3pjcih1aW50MTZfdCB2bCkNCj4+ICB7DQo+PiAgICAgIHJldHVybiAoKHZsIC8gU1ZF
X1ZMX01VTFRJUExFX1ZBTCkgLSAxVSkgJiBaQ1JfRUx4X0xFTl9NQVNLOw0KPj4gIH0NCj4+ICsN
Cj4+ICsvKiBHZXQgdGhlIHN5c3RlbSBzYW5pdGl6ZWQgdmFsdWUgZm9yIFZMIGluIGJpdHMgKi8N
Cj4+ICt1aW50MTZfdCBnZXRfc3lzX3ZsX2xlbih2b2lkKQ0KPj4gK3sNCj4+ICsgICAgLyogWkNS
X0VMeCBsZW4gZmllbGQgaXMgKChsZW4rMSkgKiAxMjgpID0gdmVjdG9yIGJpdHMgbGVuZ3RoICov
DQo+PiArICAgIHJldHVybiAoKHN5c3RlbV9jcHVpbmZvLnpjcjY0LmJpdHNbMF0gJiBaQ1JfRUx4
X0xFTl9NQVNLKSArIDFVKSAqDQo+PiArICAgICAgICAgICAgU1ZFX1ZMX01VTFRJUExFX1ZBTDsN
Cj4+ICt9DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gv
YXJtL2RvbWFpbi5jDQo+PiBpbmRleCA4ZWEzODQzZWE4ZTguLjI3ZjM4NzI5MzAyYiAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jDQo+PiBAQCAtMTMsNiArMTMsNyBAQA0KPj4gICNpbmNsdWRlIDx4ZW4vd2FpdC5oPg0K
Pj4gICAgI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPg0KPj4gKyNpbmNsdWRlIDxhc20vYXJt
NjQvc3ZlLmg+DQo+PiAgI2luY2x1ZGUgPGFzbS9jcHVlcnJhdGEuaD4NCj4+ICAjaW5jbHVkZSA8
YXNtL2NwdWZlYXR1cmUuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCj4+IEBAIC0x
ODMsNiArMTg0LDExIEBAIHN0YXRpYyB2b2lkIGN0eHRfc3dpdGNoX3RvKHN0cnVjdCB2Y3B1ICpu
KQ0KPj4gICAgICAgIFdSSVRFX1NZU1JFRyhuLT5hcmNoLmNwdHJfZWwyLCBDUFRSX0VMMik7DQo+
PiAgKyNpZmRlZiBDT05GSUdfQVJNNjRfU1ZFDQo+PiArICAgIGlmICggaXNfc3ZlX2RvbWFpbihu
LT5kb21haW4pICkNCj4+ICsgICAgICAgIFdSSVRFX1NZU1JFRyhuLT5hcmNoLnpjcl9lbDIsIFpD
Ul9FTDIpOw0KPj4gKyNlbmRpZg0KPiANCj4gSSB3b3VsZCBhY3R1YWxseSBleHBlY3QgdGhhdCBp
c19zdmVfZG9tYWluKCkgcmV0dXJucyBmYWxzZSB3aGVuIHRoZSBTVkUgaXMgbm90IGVuYWJsZWQu
IFNvIGNhbiB3ZSBzaW1wbHkgcmVtb3ZlIHRoZSAjaWZkZWY/DQoNCkkgd2FzIHRyaWNrZWQgYnkg
aXQgdG9vLCB0aGUgYXJtMzIgYnVpbGQgd2lsbCBmYWlsIGJlY2F1c2UgaXQgZG9lc27igJl0IGtu
b3cgWkNSX0VMMg0KDQo+IA0KPj4gKw0KPj4gICAgICAvKiBWRlAgKi8NCj4+ICAgICAgdmZwX3Jl
c3RvcmVfc3RhdGUobik7DQo+PiAgQEAgLTU1MSw2ICs1NTcsMTEgQEAgaW50IGFyY2hfdmNwdV9j
cmVhdGUoc3RydWN0IHZjcHUgKnYpDQo+PiAgICAgIHYtPmFyY2gudm1waWRyID0gTVBJRFJfU01Q
IHwgdmNwdWlkX3RvX3ZhZmZpbml0eSh2LT52Y3B1X2lkKTsNCj4+ICAgICAgICB2LT5hcmNoLmNw
dHJfZWwyID0gZ2V0X2RlZmF1bHRfY3B0cl9mbGFncygpOw0KPj4gKyAgICBpZiAoIGlzX3N2ZV9k
b21haW4odi0+ZG9tYWluKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHYtPmFyY2guY3B0cl9l
bDIgJj0gfkhDUFRSX0NQKDgpOw0KPj4gKyAgICAgICAgdi0+YXJjaC56Y3JfZWwyID0gdmxfdG9f
emNyKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmxfYml0cyk7DQo+PiArICAgIH0NCj4+ICAgICAgICB2
LT5hcmNoLmhjcl9lbDIgPSBnZXRfZGVmYXVsdF9oY3JfZmxhZ3MoKTsNCj4+ICBAQCAtNTk1LDYg
KzYwNiw3IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21j
dGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+PiAgICAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7
DQo+PiAgICAgIHVuc2lnbmVkIGludCBmbGFnc19yZXF1aXJlZCA9IChYRU5fRE9NQ1RMX0NERl9o
dm0gfCBYRU5fRE9NQ1RMX0NERl9oYXApOw0KPj4gICAgICB1bnNpZ25lZCBpbnQgZmxhZ3Nfb3B0
aW9uYWwgPSAoWEVOX0RPTUNUTF9DREZfaW9tbXUgfCBYRU5fRE9NQ1RMX0NERl92cG11KTsNCj4+
ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gY29uZmlnLT5hcmNoLnN2ZV92bF9iaXRz
Ow0KPj4gICAgICAgIGlmICggKGNvbmZpZy0+ZmxhZ3MgJiB+ZmxhZ3Nfb3B0aW9uYWwpICE9IGZs
YWdzX3JlcXVpcmVkICkNCj4+ICAgICAgew0KPj4gQEAgLTYwMyw2ICs2MTUsMzYgQEAgaW50IGFy
Y2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4g
KmNvbmZpZykNCj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICAgICB9DQo+PiAgKyAg
ICAvKiBDaGVjayBmZWF0dXJlIGZsYWdzICovDQo+PiArICAgIGlmICggc3ZlX3ZsX2JpdHMgPiAw
ICkgew0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHpjcl9tYXhfYml0czsNCj4+ICsNCj4+ICsg
ICAgICAgIGlmICggIWNwdV9oYXNfc3ZlICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAg
ICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiU1ZFIGlzIHVuc3VwcG9ydGVkIG9uIHRoaXMgbWFjaGlu
ZS5cbiIpOw0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICAgICAgfQ0K
Pj4gKyAgICAgICAgZWxzZSBpZiAoICFpc192bF92YWxpZChzdmVfdmxfYml0cykgKQ0KPj4gKyAg
ICAgICAgew0KPj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJVbnN1cHBvcnRl
ZCBTVkUgdmVjdG9yIGxlbmd0aCAoJXUpXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgc3Zl
X3ZsX2JpdHMpOw0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICAgICAg
fQ0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIGdldF9zeXNfdmxfbGVuKCkgaXMgdGhl
IGNvbW1vbiBzYWZlIHZhbHVlIGFtb25nIGFsbCBjcHVzLCBzbyBpZiB0aGUNCj4+ICsgICAgICAg
ICAqIHZhbHVlIHNwZWNpZmllZCBieSB0aGUgdXNlciBpcyBhYm92ZSB0aGF0IHZhbHVlLCB1c2Ug
dGhlIHNhZmUgdmFsdWUNCj4+ICsgICAgICAgICAqIGluc3RlYWQuDQo+PiArICAgICAgICAgKi8N
Cj4+ICsgICAgICAgIHpjcl9tYXhfYml0cyA9IGdldF9zeXNfdmxfbGVuKCk7DQo+PiArICAgICAg
ICBpZiAoIHN2ZV92bF9iaXRzID4gemNyX21heF9iaXRzICkNCj4+ICsgICAgICAgIHsNCj4+ICsg
ICAgICAgICAgICBjb25maWctPmFyY2guc3ZlX3ZsX2JpdHMgPSB6Y3JfbWF4X2JpdHM7DQo+PiAr
ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICJTVkUgdmVjdG9yIGxlbmd0aCBsb3dlcmVkIHRvICV1LCBzYWZlIHZhbHVlIGFtb25nIENQVXNc
biIsDQo+PiArICAgICAgICAgICAgICAgICAgICB6Y3JfbWF4X2JpdHMpOw0KPj4gKyAgICAgICAg
fQ0KPiANCj4gSSBkb24ndCB0aGluayBYZW4gc2hvdWxkICJkb3duZ3JhZGUiIHRoZSB2YWx1ZS4g
SW5zdGVhZCwgdGhpcyBzaG91bGQgYmUgdGhlIGRlY2lzaW9uIGZyb20gdGhlIHRvb2xzLiBTbyB3
ZSB3YW50IHRvIGZpbmQgYSBkaWZmZXJlbnQgd2F5IHRvIHJlcHJvZHVjZSB0aGUgdmFsdWUgKEFu
ZHJldyBtYXkgaGF2ZSBzb21lIGlkZWFzIGhlcmUgYXMgaGUgd2FzIGxvb2tpbmcgYXQgaXQpLg0K
DQpDYW4geW91IGV4cGxhaW4gdGhpcyBpbiBtb3JlIGRldGFpbHM/IEJ5IHRoZSB0b29scyB5b3Ug
bWVhbiB4bD8gVGhpcyB3b3VsZCBiZSBvayBmb3IgRG9tVXMsIGJ1dCBob3cgdG8gZG8gaXQgZm9y
IERvbTA/DQpJ4oCZbGwgd2FpdCBzdWdnZXN0aW9ucyBhbHNvIGZyb20gQW5kcmV3Lg0KDQo+IA0K
Pj4gKyAgICB9DQo+PiArDQo+PiAgICAgIC8qIFRoZSBQMk0gdGFibGUgbXVzdCBhbHdheXMgYmUg
c2hhcmVkIGJldHdlZW4gdGhlIENQVSBhbmQgdGhlIElPTU1VICovDQo+PiAgICAgIGlmICggY29u
ZmlnLT5pb21tdV9vcHRzICYgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0ICkNCj4+ICAgICAg
ew0KPj4gQEAgLTc0NSw2ICs3ODcsOSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBk
b21haW4gKmQsDQo+PiAgICAgIGlmICggKHJjID0gZG9tYWluX3ZwY2lfaW5pdChkKSkgIT0gMCAp
DQo+PiAgICAgICAgICBnb3RvIGZhaWw7DQo+PiAgKyAgICAvKiBDb3B5IHN2ZV92bF9iaXRzIHRv
IHRoZSBkb21haW4gY29uZmlndXJhdGlvbiAqLw0KPj4gKyAgICBkLT5hcmNoLnN2ZV92bF9iaXRz
ID0gY29uZmlnLT5hcmNoLnN2ZV92bF9iaXRzOw0KPj4gKw0KPj4gICAgICByZXR1cm4gMDsNCj4+
ICAgIGZhaWw6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0
L3N2ZS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3N2ZS5oDQo+PiBpbmRleCBi
ZDU2ZTJmMjQyMzAuLmY0YTY2MGU0MDJjYSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9hcm02NC9zdmUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2FybTY0L3N2ZS5oDQo+PiBAQCAtMTMsMTAgKzEzLDE3IEBADQo+PiAgLyogVmVjdG9yIGxlbmd0
aCBtdXN0IGJlIG11bHRpcGxlIG9mIDEyOCAqLw0KPj4gICNkZWZpbmUgU1ZFX1ZMX01VTFRJUExF
X1ZBTCAoMTI4VSkNCj4+ICArc3RhdGljIGlubGluZSBib29sIGlzX3ZsX3ZhbGlkKHVpbnQxNl90
IHZsKQ0KPj4gK3sNCj4+ICsgICAgLyogU1ZFIHZlY3RvciBsZW5ndGggaXMgbXVsdGlwbGUgb2Yg
MTI4IGFuZCBtYXhpbXVtIDIwNDggKi8NCj4+ICsgICAgcmV0dXJuICgodmwgJSBTVkVfVkxfTVVM
VElQTEVfVkFMKSA9PSAwKSAmJiAodmwgPD0gU1ZFX1ZMX01BWF9CSVRTKTsNCj4+ICt9DQo+PiAr
DQo+PiAgI2lmZGVmIENPTkZJR19BUk02NF9TVkUNCj4+ICAgIHJlZ2lzdGVyX3QgY29tcHV0ZV9t
YXhfemNyKHZvaWQpOw0KPj4gIHJlZ2lzdGVyX3QgdmxfdG9femNyKHVpbnQxNl90IHZsKTsNCj4+
ICt1aW50MTZfdCBnZXRfc3lzX3ZsX2xlbih2b2lkKTsNCj4+ICAgICNlbHNlIC8qICFDT05GSUdf
QVJNNjRfU1ZFICovDQo+PiAgQEAgLTMwLDYgKzM3LDExIEBAIHN0YXRpYyBpbmxpbmUgcmVnaXN0
ZXJfdCB2bF90b196Y3IodWludDE2X3QgdmwpDQo+PiAgICAgIHJldHVybiAwOw0KPj4gIH0NCj4+
ICArc3RhdGljIGlubGluZSB1aW50MTZfdCBnZXRfc3lzX3ZsX2xlbih2b2lkKQ0KPj4gK3sNCj4+
ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gICNlbmRpZg0KPj4gICAgI2VuZGlmIC8q
IF9BUk1fQVJNNjRfU1ZFX0ggKi8NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vZG9tYWluLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+IGlu
ZGV4IDQyZWI1ZGYzMjBhNy4uZTQ3OTRhOWZkMmFiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG9tYWluLmgNCj4+IEBAIC0zMSw2ICszMSw4IEBAIGVudW0gZG9tYWluX3R5cGUgew0KPj4g
ICAgI2RlZmluZSBpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAoKGQpLT5jZGYgJiBDREZfZGly
ZWN0bWFwKQ0KPj4gICsjZGVmaW5lIGlzX3N2ZV9kb21haW4oZCkgKChkKS0+YXJjaC5zdmVfdmxf
Yml0cyA+IDApDQo+PiArDQo+PiAgLyoNCj4+ICAgKiBJcyB0aGUgZG9tYWluIHVzaW5nIHRoZSBo
b3N0IG1lbW9yeSBsYXlvdXQ/DQo+PiAgICoNCj4+IEBAIC0xMTQsNiArMTE2LDkgQEAgc3RydWN0
IGFyY2hfZG9tYWluDQo+PiAgICAgIHZvaWQgKnRlZTsNCj4+ICAjZW5kaWYNCj4+ICArICAgIC8q
IG1heCBTVkUgdmVjdG9yIGxlbmd0aCBpbiBiaXRzICovDQo+PiArICAgIHVpbnQxNl90IHN2ZV92
bF9iaXRzOw0KPj4gKw0KPj4gIH0gIF9fY2FjaGVsaW5lX2FsaWduZWQ7DQo+PiAgICBzdHJ1Y3Qg
YXJjaF92Y3B1DQo+PiBAQCAtMTkwLDYgKzE5NSw3IEBAIHN0cnVjdCBhcmNoX3ZjcHUNCj4+ICAg
ICAgcmVnaXN0ZXJfdCB0cGlkcnJvX2VsMDsNCj4+ICAgICAgICAvKiBIWVAgY29uZmlndXJhdGlv
biAqLw0KPj4gKyAgICByZWdpc3Rlcl90IHpjcl9lbDI7DQo+PiAgICAgIHJlZ2lzdGVyX3QgY3B0
cl9lbDI7DQo+PiAgICAgIHJlZ2lzdGVyX3QgaGNyX2VsMjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBt
ZGNyX2VsMjsNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+PiBpbmRleCAxNTI4Y2VkNTA5N2EuLmUx
OGEwNzUxMDVmMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5o
DQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPj4gQEAgLTMwNCw2ICsz
MDQsOCBAQCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsNCj4+ICAgICAgdWludDE2X3Qg
dGVlX3R5cGU7DQo+PiAgICAgIC8qIElOICovDQo+PiAgICAgIHVpbnQzMl90IG5yX3NwaXM7DQo+
PiArICAgIC8qIElOICovDQo+PiArICAgIHVpbnQxNl90IHN2ZV92bF9iaXRzOw0KPiANCj4gUGxl
YXNlIHNwZWxsIG91dCB0aGUgcGFkZGluZyBjbGVhcmx5IChldmVuIHRob3VnaCBJIGtub3cgdGhl
cmUgaXMgb25lIGluIHRoaXMgc3RydWN0dXJlIHRoYXQgaXMgbm90IG1lbnRpb25lZCkuDQoNCk9r
IEkgd2lsbA0KDQo+IA0KPj4gICAgICAvKg0KPj4gICAgICAgKiBPVVQNCj4+ICAgICAgICogQmFz
ZWQgb24gdGhlIHByb3BlcnR5IGNsb2NrLWZyZXF1ZW5jeSBpbiB0aGUgRFQgdGltZXIgbm9kZS4N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvZG9tY3RsLmgNCj4+IGluZGV4IDUxYmUyOGMzZGU3Yy4uNjE2ZDdhMWMwNzBkIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+PiArKysgYi94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+IEBAIC0yMSw3ICsyMSw3IEBADQo+PiAgI2luY2x1
ZGUgImh2bS9zYXZlLmgiDQo+PiAgI2luY2x1ZGUgIm1lbW9yeS5oIg0KPj4gIC0jZGVmaW5lIFhF
Tl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxNQ0KPj4gKyNkZWZpbmUgWEVOX0RP
TUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDE2DQo+PiAgICAvKg0KPj4gICAqIE5CLiB4
ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJhdGlv
bi4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQo=

