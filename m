Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE4605C55
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426414.674821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSoz-0004bH-RE; Thu, 20 Oct 2022 10:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426414.674821; Thu, 20 Oct 2022 10:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSoz-0004Y4-OO; Thu, 20 Oct 2022 10:30:41 +0000
Received: by outflank-mailman (input) for mailman id 426414;
 Thu, 20 Oct 2022 10:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZuZ=2V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olSoy-0004Xx-IH
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:30:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3189e4-5062-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:30:38 +0200 (CEST)
Received: from FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::14)
 by VE1PR08MB5791.eurprd08.prod.outlook.com (2603:10a6:800:1b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 10:30:35 +0000
Received: from VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::37) by FR3P281CA0098.outlook.office365.com
 (2603:10a6:d10:a1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.18 via Frontend
 Transport; Thu, 20 Oct 2022 10:30:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT049.mail.protection.outlook.com (100.127.144.168) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 10:30:35 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 20 Oct 2022 10:30:35 +0000
Received: from 714cb6995abe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA9A0759-BA3A-4355-BA1E-A982F4D8BAAD.1; 
 Thu, 20 Oct 2022 10:30:28 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 714cb6995abe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 10:30:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8503.eurprd08.prod.outlook.com (2603:10a6:20b:55e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 10:30:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 10:30:26 +0000
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
X-Inumbo-ID: 3d3189e4-5062-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AcJncRH65v/IGTlX++36QlX6UqaAyveRO7Gu+z24rZOVJossCrl+ZSHbv9+dYvWSei9qCGQ9h9eg90/+nS26Ypb7GpV9tyxJ6ThbGi0ECmngj6d/UNbPyHJRTVgPAZWxQ4xcNixW8y333zhF1R0oSbOtHBBCWGrd1UTBlPnHfn7Di8eqI7vtKH4aEKk61zOGEJx6OF3kWY7ZmkC3S/yZ/l6hxd22c/xzkRHNZPHlPZPTb6G3ZiLNHoN9HdUlWc1ub4bB20ht355J4/2+AqrF9x3cczRGX1PL7H/uVEPJJEMajrV8Y9gz3Lg9uOC1GFjEVfswVX3siHKtZ5aCr8mYlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAQUSMRrd56ccAEu1NXYxB5fkpyk6gidnrJ7pjL4vWE=;
 b=farYdwI1x6FTsAW48Kk0KDhGoAOiS5RYt1BS29sRbpxJVm0YbppZ9f+9FBJfsWLAlleO/mxD8bXbgQipY2pwMLRp+psAV6g4w1WmEv+e5013gZoSX6XDRqD55e1H2YI5FqqLt9ouikPg7NaMXkfUMrE+cPq5zCfjqw96IoY39vMZv1uKXlm9iKh/0jVV+dR5qCyZ4NHb35IOjPM4YLqQ9Qvi2K+QSgk075vGwj6JYAkG2tNiebnz8DAm+t3it5QZmzzt1cQQLhAW5cI/UF6+VBDpLKT2D308EAnzeZztVqkxHl8mdnb1hZdrU6CnXnomcsgl5bbwG0PB9VvK2ASmEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAQUSMRrd56ccAEu1NXYxB5fkpyk6gidnrJ7pjL4vWE=;
 b=4PbwA/k3+WxsLLIK7Jq4XfKraysydBslxwwdE6nR9jjlHwgFZ4YsTlUDca47TPsStrILpx4XsKgRCQKq8VRyG5OyuGd3ANz3YPtwMReCaC6nMRcEmYghnYwEbvNOSXHL8t16pdH2Hmon6UZ5SRKGJeN+3DAcESg03/BVjvnkG0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRMb3p4+jXlOUr8kMpDV+9Mj91nWHkj1TDiU/aHlIeyj6kjbwVdbPyY+DtLKw3uXwSzgMlu3MMjcqYInwJzBgeRu7XGqd/3s0BMS+1VHRnbIcS6Da/kK/38SCNIIs9gMZLQdgQrUismFmtxCxuegsCc8QaStAn2mlCAFxR1RmjFchGTnbZfadzml+gUbZbBTgBCfIiL8DbUfAPdzM24K0ODVtEC/b0b8/bzeZWJaRWwXrWkiAmxiNoiWecpOiVtzuIJuEqzRHwbn9lN4ruGSfAFwnubY76cx/Mfv54z9zZCnEZM2NQiqPFKXnkQy11hZysa7V6ZYPduAXbN/PLz4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAQUSMRrd56ccAEu1NXYxB5fkpyk6gidnrJ7pjL4vWE=;
 b=QkNVrXDvbfDnTutZ8lJQU6If9z0t1gpFZW/8TysTtf5POkYEY+IbUTsgxYTe27PT7rrvJ/YR7dArmdsWiybu/NXQtJWKFX/3kLs4qQUSp51V9hRpSmGd0KfQVkP+DH34Dmh2qsbjxWz3FKUcUY8atDnxNEHotC32uWNMtGdgniQNceKgXjXqGMQHwBT5NxEMJSkWZpQSCYXNgMYI2X26BcQ1GSqiEMKqsvkXfsA3PqzYcdAzESpBhvDb71QMTSuCfkHLELIYuucwx0IHu12fbpIJQg979qV/MFyPdcnYI61NeRIKV0l+w1K9p4VgUwT8k+Gfv+xcvCHWwsxkuNczKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAQUSMRrd56ccAEu1NXYxB5fkpyk6gidnrJ7pjL4vWE=;
 b=4PbwA/k3+WxsLLIK7Jq4XfKraysydBslxwwdE6nR9jjlHwgFZ4YsTlUDca47TPsStrILpx4XsKgRCQKq8VRyG5OyuGd3ANz3YPtwMReCaC6nMRcEmYghnYwEbvNOSXHL8t16pdH2Hmon6UZ5SRKGJeN+3DAcESg03/BVjvnkG0k=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Subject: RE: [PATCH for-4.17?] test/vpci: enable by default
Thread-Topic: [PATCH for-4.17?] test/vpci: enable by default
Thread-Index: AQHY5G6LBoyhiXjFqUqNYD0Wl8lAwK4XFLTw
Date: Thu, 20 Oct 2022 10:30:26 +0000
Message-ID:
 <AS8PR08MB79919E26BAD0DD1B74C564EF922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221020102706.29267-1-roger.pau@citrix.com>
In-Reply-To: <20221020102706.29267-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F11A06ADD107AC48BE85EBBED7D5B118.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8503:EE_|VI1EUR03FT049:EE_|VE1PR08MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4c9764-53d1-4c4c-6884-08dab2861fd5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XzwEhmfIFBqa455yxAtxz7OjtJx+YTDFWWVq/Xx0C3bCisWfERTxAeoTAVJ68QJ9UiqyInvcKVwu1hCgRZGPlAmc+y56jkkPmJVhbyisnxoFazZKK39aKUSfcVeKMDAWXUvtpD5iLHuXupnWHvIJ059d0zP/6ilFTBluUkpi7n1WRnQNib27xAbBZNceLKYN1pNQyHoXuYAzYV6xuJ0AFD+hypi/Ku68R8L5aW3N9KnSiqwrpWTO011nAFT9Asge1Pc7QWeifMHFr3oyqeg+xwcdhoVfCWs2IDsbcXWcmyLHl3tXoFTW38Nl/u6bWszaQYMRdKL0DVw5YzURw0Kr1eUm91+GJiXja+kTxzIS+MRCi8YaCm9VlroCAyX3wkC0m9A9yvW2vQb0EFEXr1o1/7YVc3z6rjASJTko7csoNPWYL+C/e0hb7KKJF/8H2P++55I9wKt0o1mBn94Qig/i7dQm4LmrI6QSYiwYsiXvvOc+tkKjDdGULvj2SWvG74n5e+mdvopDRFTGUvhBWVb2oD9gjyVG359ss5qtvansVMeCmMSoZ6ONKBIPn42OWHWY4GlYWIycPGFSyO0rptsHAD//KW/rV1hzG1Fc89jC4gT4SSgbHhqXGsx6AX0Ky7dPE7bMpYjVxpgZKSFR4Qj+4UA3zhecq6KLZwCtH7VKuc6nueoo+lzcng4+hf3qXAXWwdqvm+uEevfu7S0MEi1Iq/kw0erkmLT/7fKKCFFJBtqaoolvhqAvTWVDM6r9GVugpjz4BGSFORHQTdTfSmZQnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199015)(38070700005)(38100700002)(122000001)(86362001)(33656002)(2906002)(71200400001)(478600001)(55016003)(41300700001)(316002)(66556008)(4326008)(8676002)(64756008)(66446008)(66476007)(8936002)(5660300002)(76116006)(52536014)(54906003)(110136005)(66946007)(83380400001)(9686003)(26005)(7696005)(6506007)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8503
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad3aa9c8-d928-43df-98f5-08dab2861aa4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m3/jOysTribsTIzt9yKSTpGfJ292wOlRit9cw4rlhh+MeZyptYsYhn/Xni6g7mDR2ImA8rTuXqbWhja7psFO/O5/wc2okKSs8Zwr1y29sz2eGVdN/hLMh3wWZ40H+voeEeNKo3liFrzE2qACTldeL5UVWdyNE3u8AKW0NylUXADQx/kffdWztOsaPLjzOexhae3DTUwJJSsnja9OpGZ5E9pMX9R/SibqJuH7C5Py/R/XICCmEp2/al8pFufQkgpi3cg3R+HOgFuxCW64/iErb/Jv6knLV8fMKazhqrQhYn91poJDU2lPalg9Np5uGf+mkyCk0NMKjuX08NhalXTRXJgp0tY1Q6KM3uJt5P4W7LLG53TG5SeOZcriEen9eFulkhEanUeA7di26HqT6L0v0vnn+B0h+a4iS3/I+h/1Y4aanvyKMqG2P0bunJClIJxj2o3YpC7R8LWcAQyaTrrFsVMVIdV6strealLpoH/u9qfugCf08xpyw0wo/MXl5HIdlDyoGOAjiYDBdjgh+VXZbcr+XdcgEBCA/IBuu/fsf1RLtvyNGHGoo41nJ5nXTJSrbAL2ZTIg4uWYZlEvBJ6vhVuTx2JNs+qdKxDCXj58fhejNoNQL4cHajipO1ke8LFwUMQ7yVzhptPFAaQnj/H7Gz1k/2c9EIIP+K5ht6avHmH0N5rTJYAG8pCv/rH2BgmBeRU+LtYtv/Ls2U/7G3eRDes2U52NC0U/ujW5Z6FRkbcTI1auqSmnXiKv9JbT05G7LHe0QuwZB9Ubr3ln1G0UnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(186003)(47076005)(336012)(83380400001)(86362001)(33656002)(40460700003)(26005)(9686003)(4326008)(8676002)(41300700001)(8936002)(81166007)(356005)(40480700001)(55016003)(316002)(110136005)(36860700001)(54906003)(82740400003)(82310400005)(70206006)(7696005)(52536014)(5660300002)(70586007)(6506007)(107886003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:30:35.4694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4c9764-53d1-4c4c-6884-08dab2861fd5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5791

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3P10gdGVzdC92cGNpOiBlbmFibGUgYnkgZGVmYXVsdA0KPiANCj4gQ09ORklHX0hBU19QQ0kg
aXMgbm90IGRlZmluZWQgZm9yIHRoZSB0b29scyBidWlsZCwgYW5kIGFzIGEgcmVzdWx0IHRoZQ0K
PiB2cGNpIGhhcm5lc3Mgd291bGQgbmV2ZXIgZ2V0IGJ1aWxkLiAgRml4IHRoaXMgYnkgYnVpbGRp
bmcgaXQNCj4gdW5jb25kaXRpb25hbGx5LCB0aGVyZSdzIG5vdGhpbmcgYXJjaCBzcGVjaWZpYyBp
biBpdC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gLS0tDQo+IFdoaWxlIG5vdCBzdHJpY3RseSBhIGJ1Z2ZpeCwgSSB0aGlu
ayBpdCdzIHdvcnRoIGFkZGluZyB0aGlzIGNoYW5nZSB0byB0aGUNCj4gcmVsZWFzZSBpbiBvcmRl
ciB0byBhbHdheXMgYnVpbGQgdGhlIHZwY2kgdGVzdCBoYXJkbmVzcyBhbmQgcHJldmVudCBpdA0K
PiBmcm9tIGJpdHJvdHRpbmcuDQoNCkdvb2QgcG9pbnQuDQoNCk5vIHByb2JsZW0gZnJvbSBteSBz
aWRlLCBidXQgSSB0aGluayB5b3UgbmVlZCBhbHNvIEFudGhvbnkncyBvcGluaW9uDQphcyBoZSBp
cyB0aGUgdG9vbHN0YWNrIG1haW50YWluZXIuIElmIGhlIGFsc28gbGlrZXMgdGhpcyBpZGVhLCBm
ZWVsIGZyZWUgdG8NCmFkZCBteToNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVu
cnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IC0tLQ0KPiAgdG9v
bHMvdGVzdHMvTWFrZWZpbGUgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0cy9NYWtlZmls
ZSBiL3Rvb2xzL3Rlc3RzL01ha2VmaWxlDQo+IGluZGV4IDMzZTMyNzMwYzQuLmQ5OTE0NmQ1NmEg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3Rlc3RzL01ha2VmaWxlDQo+ICsrKyBiL3Rvb2xzL3Rlc3Rz
L01ha2VmaWxlDQo+IEBAIC0xMCw3ICsxMCw3IEBAIFNVQkRJUlMtJChDT05GSUdfWDg2KSArPSB4
ODZfZW11bGF0b3INCj4gIGVuZGlmDQo+ICBTVUJESVJTLXkgKz0geGVuc3RvcmUNCj4gIFNVQkRJ
UlMteSArPSBkZXByaXYNCj4gLVNVQkRJUlMtJChDT05GSUdfSEFTX1BDSSkgKz0gdnBjaQ0KPiAr
U1VCRElSUy15ICs9IHZwY2kNCj4gDQo+ICAuUEhPTlk6IGFsbCBjbGVhbiBpbnN0YWxsIGRpc3Rj
bGVhbiB1bmluc3RhbGwNCj4gIGFsbCBjbGVhbiBkaXN0Y2xlYW4gaW5zdGFsbCB1bmluc3RhbGw6
ICU6IHN1YmRpcnMtJQ0KPiAtLQ0KPiAyLjM3LjMNCg0K

