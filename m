Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A14B8AE7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 14:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274138.469494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKoT-0005lq-39; Wed, 16 Feb 2022 13:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274138.469494; Wed, 16 Feb 2022 13:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKoT-0005iu-07; Wed, 16 Feb 2022 13:57:45 +0000
Received: by outflank-mailman (input) for mailman id 274138;
 Wed, 16 Feb 2022 13:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKKoR-0005io-Aw
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 13:57:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6887f15d-8f30-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 14:57:42 +0100 (CET)
Received: from AS9P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::31)
 by DBBPR08MB6251.eurprd08.prod.outlook.com (2603:10a6:10:208::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 13:57:39 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::37) by AS9P194CA0012.outlook.office365.com
 (2603:10a6:20b:46d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 13:57:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:57:38 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 16 Feb 2022 13:57:38 +0000
Received: from d8283e1ac163.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C36CB0FF-802A-4B9B-BC25-80033BD771E1.1; 
 Wed, 16 Feb 2022 13:57:31 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8283e1ac163.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 13:57:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7294.eurprd08.prod.outlook.com (2603:10a6:102:215::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 13:57:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 13:57:29 +0000
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
X-Inumbo-ID: 6887f15d-8f30-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x99K0ND1sSpv+9jO4RTCV6C3fUnM6g2czl+uqfGJaVQ=;
 b=2tAxhwD/nbRmyh4eHbm4ZvnOlUZ9HvR/dL8Rn//OB04F1Lf5e+jcjW9/cVJlIVMnKr0uVUruPilST6SnhV31Xalel05/YgubhBv2nFbohpjdfWD+A+T6Mfr79CwNXmEJAP+KmNw8Lm+vYFoUHVRxQ8yFSLaWnZdwZBkJy7a9Raw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3795b1430dad8cdf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kycm7BB/GsMQppyRFOd87zF8h1hA6TrQPho24T9O02/c8PJvyK1uad+xaWx4xVWCtYaW/odpios6+hT1/41rd2rsb0yo1xL2xE6ptwiUw3iJxx2DAdM1K4tZ9e5J5A2/DBcGn4RjfdBjy8mnE71QxoaIuKGxVxCxpvKl8zzQcqrrkxWJzQ59YgXWc9KQOta+ctCzUz4iHPigDSqTCB8LMhn798+/mBR6SMFjcsBUpRPR6bMl9K008uY897WT3DBBvQS0q7yhil0j50f30NO5k8GgYrNAVGxMeHdBN/CWkqK9mayxoZhQNQ8Z6vaJkEajqC++ABOcAmCJNlXYNdbHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x99K0ND1sSpv+9jO4RTCV6C3fUnM6g2czl+uqfGJaVQ=;
 b=oIOq6/FGxuAYy1xLTz+b+PScYusCVYXS5QwXB/0b0MrQJEf/FCHXYojlxWQBO/kl4oCR+oqICzB8D9c3kNgiVsDKqmH1tXgBM3jzzcQ7X4Nr9LpXe9odb4xNVQhNqwAHJkcc2aHIH6wnK+9GW1ZWIJvmnLIuVKvqCrk+IRaCx7vswhd6oLHpdVb+G67yQ12VjYiV8k2d9XpDQFnWUUMH1qtqx2zEqYDfFHkL1lno+A2ftB1Upiyyy68f4340iFWLCwvn7P1/AX0DsDVfiolNrrmbxGMZIOi62b09pi/rHEYZtlbcU5Y3FWHMav7h3fVtkfkhXiWOITMIAASKDKdN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x99K0ND1sSpv+9jO4RTCV6C3fUnM6g2czl+uqfGJaVQ=;
 b=2tAxhwD/nbRmyh4eHbm4ZvnOlUZ9HvR/dL8Rn//OB04F1Lf5e+jcjW9/cVJlIVMnKr0uVUruPilST6SnhV31Xalel05/YgubhBv2nFbohpjdfWD+A+T6Mfr79CwNXmEJAP+KmNw8Lm+vYFoUHVRxQ8yFSLaWnZdwZBkJy7a9Raw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index:
 AQHYE4sUwaOwwc8tCU249z99fRIDqqyVNw0AgADQBoCAAAHjAIAAIjuAgAACWYCAAAt3gIAAGi0A
Date: Wed, 16 Feb 2022 13:57:29 +0000
Message-ID: <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
In-Reply-To: <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e046fcd2-3ab9-4d7c-f37d-08d9f1544b0b
x-ms-traffictypediagnostic:
	PAXPR08MB7294:EE_|AM5EUR03FT013:EE_|DBBPR08MB6251:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6251259562CA0A1CA63FA3019D359@DBBPR08MB6251.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 evK9fuRyca2MlKDK0IiiEycS3SF7HeTGAZ4SAtZFiKEARoS3U03zGDL65UuEZMPuXZqwyDqU1VKVZfVGqg8Uuo0N0o6gHpuHQReId6fcszDYCdc2Xin8+p6Z4mA6ulEBJS8zssgQdsBwJiMnVJ9i7mFyn/5eWTZr3Zwfq5bwIcY/oYleGHQR+YcIYhR15H3EqUUk/CiTqcqqBULBG/Hjv9Mjd1RxLlEqpGK5nZ0QU9GKqxjbclRgEB11LzWggOQNZdDeJgB2TkCHlhcUN7c/RHG4ZWqsTuWkMCN3totEEEjg6gkGD+V7disYPtItA53u0yF4BCKrHGjgFqmUQ3DrtZlsngA5EbK1CRq3Xcp9RHcq6/RckDrhsefFR8QpdjcG5nCUMahUq86ffko+kZZBAIWMk+2MvM23LBGyX//hMJTWFfmNEmKaUcPn9aI6/jl9uG4TdO1trIVnrQEMulucGtPxQcafT/rcY+n6N2aO4gSjXAUKV6cAR5Y4J4BuyokH3fLmlZVYEkS/c8MqdcSDhB6CX7w0lVbJuBnTwCBZQE7YoQTI+Lx/3myykV5OtduiH4hmLrU1mtA8iExgryfoyvNY5hu3iiOVj43lcT4mWbcfx309nbubRcgjzldrMjICDwy/DkvMDWQFYS6b1MpWAgPg9ocQJcjzfeCedrGYtvparuSO2Us9+kti3UWKwkYmfrXYtn6dQDFYE5cmb1hBKhCf8Is0DKkkgZVm4Rz+83TrkaDo198W7ThAk0wJ+CCU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8676002)(66556008)(91956017)(122000001)(4326008)(38070700005)(66446008)(6916009)(76116006)(54906003)(36756003)(316002)(66946007)(64756008)(2906002)(33656002)(66476007)(5660300002)(508600001)(6486002)(86362001)(26005)(186003)(53546011)(83380400001)(71200400001)(6506007)(6512007)(8936002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C22CD7552263064198631B890F1E186A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7294
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a2ee8b3-37cc-453e-2e13-08d9f1544571
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xf1aLGkq8UmqUJ3dB6j7twPz+4UnNrlJGJWqGgjigjvLMOxuIkMh1UDufY8xw4UQKksVuT00JEkUPJ+kJtLub9NjBEPbFWjdEQAJIPr/QDd3WCsyG2VdOJ6NAm6qVvPZbHjom/YRzGjYdqAChcbaxCf1P/3Tq5ers1z03hrlwSgUIBoB/JJh9GanGbXmQK5gqs3rjni62Ov+vQVHrnskb2r4tsSMRCTrQHjdOf4oH/Y45nNsZBhGDyKlddbMi9VhIQnkhRU+WxtJMe5HsgqB0Bh6RCwAnZAeYtZgvFOT2iH7oSi1LrcdGk/KKnEzymLtj8xPBtdOUmqXCQJXiDuNeCEm8kV6NQGdv8uw4gY4V9DtvthYF9hA5jCd6EkLTeu8UnrKGwpWLoWP+6eeP1nxL64qm0BVpcz00j6Z7g12AsB7iPsAFKY45I+i1EJaLICBot/cqNg5hzSpQuGOtzmqJx7YZKFyIuEt1HKfEQruCUlkSAD+iU/nE9bM9cUuhWbPTjJ7xpEgaPEXWCFe+a5bM6eDrsrxfBmWpc26cGl94hpB8jS0RnuQ/3zrAt8Ouodoh+UvHEexUmvvrNyQtgOmMpBpo0ykhrMuUioRdGUi23Ljah9xK4fwurTYmsBlAguGw/cOvSyiXFqi/bwobLIek1SXhU213ge/vwQBkLobda07cYKFLo/vS7kDj8aihcuD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(70586007)(2906002)(6862004)(70206006)(336012)(8676002)(356005)(86362001)(81166007)(40460700003)(33656002)(54906003)(508600001)(36756003)(8936002)(82310400004)(53546011)(83380400001)(36860700001)(316002)(5660300002)(186003)(47076005)(6486002)(26005)(4326008)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:57:38.7723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e046fcd2-3ab9-4d7c-f37d-08d9f1544b0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6251

SGksDQoNCj4gT24gMTYgRmViIDIwMjIsIGF0IDEyOjIzLCBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gRmViIDE2LCAyMDIy
LCBhdCAxMTo0MiBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+
IA0KPj4gT24gMTYuMDIuMjAyMiAxMjozNCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+IA0KPj4+
IEkgYW0gb3Bwb3NlZCB0byBvdmVybG9hZGluZyDigJxBU1NFUlTigJ0gZm9yIHRoaXMgbmV3IGtp
bmQgb2YgbWFjcm87IEkgdGhpbmsgaXQgd291bGQgbm90IG9ubHkgYmUgdW5uZWNlc3NhcmlseSBj
b25mdXNpbmcgdG8gcGVvcGxlIG5vdCBmYW1pbGlhciB3aXRoIG91ciBjb2RlYmFzZSwgYnV0IGl0
IHdvdWxkIGJlIHRvbyBlYXN5IGZvciBwZW9wbGUgdG8gZmFpbCB0byBub3RpY2Ugd2hpY2ggbWFj
cm8gd2FzIGJlaW5nIHVzZWQuDQo+Pj4gDQo+Pj4gQVNTRVJUX0FDVElPTihjb25kaXRpb24sIGNv
ZGUpIChvciBldmVuIEFTU0VSVF9PUl9BQ1RJT04oKSkgd291bGQgYmUgYSBiYXJlIG1pbmltdW0g
Zm9yIG1lLg0KPj4+IA0KPj4+IEJ1dCBJIGNhbuKAmXQgaW1hZ2luZSB0aGF0IHRoZXJlIGFyZSBt
b3JlIHRoYW4gYSBoYW5kZnVsIG9mIGFjdGlvbnMgd2UgbWlnaHQgd2FudCB0byB0YWtlLCBzbyBk
ZWZpbmluZyBhIG1hY3JvIGZvciBlYWNoIG9uZSBzaG91bGRu4oCZdCBiZSB0b28gYnVyZGVuc29t
ZS4NCj4+PiANCj4+PiBGdXJ0aGVybW9yZSwgdGhlIHZlcnkgZmxleGliaWxpdHkgc2VlbXMgZGFu
Z2Vyb3VzOyB5b3XigJlyZSBub3Qgc2VlaW5nIHdoYXQgYWN0dWFsIGNvZGUgaXMgZ2VuZXJhdGVk
LCBzbyBpdOKAmXMgdG8gZWFzeSB0byBiZSDigJxjbGV2ZXLigJ0sIGFuZC9vciB3cml0ZSBjb2Rl
IHRoYXQgZW5kcyB1cCBkb2luZyBzb21ldGhpbmcgZGlmZmVyZW50IHRoYW4geW91IGV4cGVjdC4N
Cj4+PiANCj4+PiBBdCB0aGUgbW9tZW50IEkgdGhpbmsgQVNTRVJUX09SX1JFVFVSTihjb25kaXRp
b24sIGNvZGUpLCBwbHVzIG90aGVyIG5ldyBtYWNyb3MgZm9yIHRoZSBvdGhlciBiZWhhdmlvciBp
cyBuZWVkZWQsIHdvdWxkIGJlIGJldHRlci4NCj4+IA0KPj4gSG1tLCB3aGlsZSBJIHNlZSB5b3Vy
IHBvaW50IG9mIHRoaW5ncyBwb3NzaWJseSBsb29raW5nIGNvbmZ1c2luZyBvcg0KPj4gdW5leHBl
Y3RlZCwgc29tZXRoaW5nIGxpa2UgQVNTRVJUX09SX1JFVFVSTigpIChzaG91bGRuJ3QgaXQgYmUN
Cj4+IEFTU0VSVF9BTkRfUkVUVVJOKCk/KSBpcyBpbW8gbGVzcyByZWFkYWJsZS4gSW4gcGFydGlj
dWxhciBJIGRpc2xpa2UNCj4+IHRoZSBsYXJnZXIgYW1vdW50IG9mIHVwcGVyY2FzZSB0ZXh0LiBC
dXQgeWVzLCBJIGNvdWxkIGFjY2VwdCB0aGlzDQo+PiBhcyBhIGNvbXByb21pc2UgYXMgaXQgc3Rp
bGwgc2VlbXMgYmV0dGVyIHRvIG1lIHRoYW4gdGhlIG11bHRpLWxpbmUNCj4+IGNvbnN0cnVjdHMg
d2UgY3VycmVudGx5IHVzZS4NCj4gDQo+IEkgc2VlIHdoYXQgeW914oCZcmUgc2F5aW5nIHdpdGgg
QU5EL09SOyBJIHBlcnNvbmFsbHkgc3RpbGwgcHJlZmVyIE9SIGJ1dCB3b3VsZG7igJl0IGFyZ3Vl
IHRvIGhhcmQgYWdhaW5zdCBBTkQgaWYgb3RoZXJzIHByZWZlcnJlZCBpdC4NCj4gDQo+IEFzIGZh
ciBhcyBJ4oCZbSBjb25jZXJuZWQsIHRoZSBmYWN0IHRoYXQgd2XigJlyZSByZWR1Y2luZyBsaW5l
cyBvZiBjb2RlIGlzbuKAmXQgYSByZWFzb24gdG8gdXNlIHRoaXMgYXQgYWxsLiAgQXMgb3VyIENP
RElOR19TVFlMRSBzYXlzLCBBU1NFUlQoKSBpcyBqdXN0IGEgbG91ZGVyIHByaW50ay4gIFdlIHdv
dWxkIG5ldmVyIGNvbnNpZGVyIHdyaXRpbmcgUFJJTlRLX0FORF9SRVRVUk4oKSwgYW5kIHdlIHdv
dWxkIG5ldmVyIGNvbnNpZGVyIHdyaXRpbmcgYSBtYWNybyBsaWtlIENPTkRSRVQoY29uZGl0aW9u
LCByZXR2YWwpIHRvIHJlcGxhY2UNCj4gDQo+IGlmIChjb25kaXRpb24pDQo+ICAgIHJldHVybiBy
ZXR2YWw7DQo+IA0KPiBUaGUgb25seSBqdXN0aWZpY2F0aW9uIGZvciB0aGlzIGtpbmQgb2YgbWFj
cm8sIGluIG15IG9waW5pb24sIGlzIHRvIGF2b2lkIGR1cGxpY2F0aW9uIGVycm9yczsgaS5lLiBy
ZXBsYWNpbmcgeW91ciBjb2RlIHNlZ21lbnQgd2l0aCB0aGUgZm9sbG93aW5nOg0KPiANCj4gaWYg
KGNvbmRpdGlvbikgew0KPiAgICBBU1NFUlQoIWNvbmRpdGlvbik7DQo+ICAgIHJldHVybiBmb287
DQo+IH0NCj4gDQo+IGlzIHVuZGVzaXJhYmxlIGJlY2F1c2UgdGhlcmXigJlzIHRvbyBtdWNoIHJp
c2sgdGhhdCB0aGUgY29uZGl0aW9ucyB3aWxsIGRyaWZ0IG9yIGJlIGludmVydGVkIGluY29ycmVj
dGx5LiBCdXQgaGF2aW5nIGNvbnRyb2wgc3RhdGVtZW50cyBsaWtlIOKAmHJldHVybuKAmSBhbmQg
4oCYY29udGludWXigJkgaW4gYSBtYWNybyBpcyBhbHNvIHVuZGVzaXJhYmxlIGluIG15IG9waW5p
b247IEnigJltIHBlcnNvbmFsbHkgbm90IHN1cmUgd2hpY2ggSSBmaW5kIG1vc3QgdW5kZXNpcmFi
bGUuDQo+IA0KPiBJIGd1ZXNzIG9uZSBhZHZhbnRhZ2Ugb2Ygc29tZXRoaW5nIGxpa2UgQVNTRVJU
X09SKGNvbmRpdGlvbiwgcmV0dXJuIGZvbyk7IG9yIEFTU0VSVF9PUihjb25kaXRpb24sIGNvbnRp
bnVlKTsgaXMgdGhhdCBzZWFyY2hpbmcgZm9yIOKAnHJldHVybuKAnSBvciDigJxjb250aW51ZeKA
nSB3aWxsIGNvbWUgdXAgZXZlbiBpZiB5b3XigJlyZSBkb2luZyBhIGNhc2Utc2Vuc2l0aXZlIHNl
YXJjaC4gIEJ1dCBJ4oCZbSBzdGlsbCB3YXJ5IG9mIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLg0K
PiANCj4gQmVydHJhbmQgLyBKdWxpZW4sIGFueSBtb3JlIHRob3VnaHRzPw0KDQpJIHRoaW5rIHRo
YXQgaGF2aW5nIG1hY3JvcyB3aGljaCBhcmUgbWFnaWMgbGlrZSB0aGF0IG9uZSB3aGljaCBpbmNs
dWRlcyBhIHBvc3NpYmxlIHJldHVybiBhbmQgdGhlIGZhY3QgdGhhdCB0aGUgbWFjcm8gaXMgdGFr
aW5nIGNvZGUgYXMgYXJndW1lbnQgaXMgbWFraW5nIHRoZSBjb2RlIHJlYWxseSBoYXJkIHRvIHJl
YWQgYW5kIHVuZGVyc3RhbmQgZm9yIHNvbWVvbmUgbm90IGtub3dpbmcgdGhpcy4NCkV2ZW4gdGhl
IGNvZGUgaXMgbG9uZ2VyIHJpZ2h0IG5vdywgaXQgaXMgbW9yZSByZWFkYWJsZSBhbmQgZWFzeSB0
byB1bmRlcnN0YW5kIHdoaWNoIG1lYW5zIGxlc3MgY2hhbmNlIGZvciBlcnJvcnMgc28gSSBkbyBu
b3QgdGhpbmsgdGhlIG1hY3JvIHdpbGwgYXZvaWQgZXJyb3JzIGJ1dCBtaWdodCBpbiBmYWN0IGlu
dHJvZHVjZSBzb21lIGluIHRoZSBmdXR1cmUuDQoNClNvIEkgYW0gdm90aW5nIHRvIGtlZXAgdGhl
IGN1cnJlbnQgbWFjcm8gYXMgaXQgaXMuDQoNCkJlcnRyYW5kDQoNCj4gDQo+IC1HZW9yZ2UNCg0K

