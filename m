Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859924E3B28
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 09:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293333.498288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaD9-0007ro-Q2; Tue, 22 Mar 2022 08:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293333.498288; Tue, 22 Mar 2022 08:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWaD9-0007pV-Li; Tue, 22 Mar 2022 08:49:51 +0000
Received: by outflank-mailman (input) for mailman id 293333;
 Tue, 22 Mar 2022 08:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWaD7-0007pP-D2
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 08:49:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06f00202-a9bd-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 09:49:47 +0100 (CET)
Received: from AM6P194CA0070.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::47)
 by DB8PR08MB3947.eurprd08.prod.outlook.com (2603:10a6:10:ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Tue, 22 Mar
 2022 08:49:45 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::28) by AM6P194CA0070.outlook.office365.com
 (2603:10a6:209:84::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Tue, 22 Mar 2022 08:49:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 08:49:45 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 22 Mar 2022 08:49:45 +0000
Received: from 98253c74e61c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0804D01B-6E20-473E-90DA-1AB4E63FC221.1; 
 Tue, 22 Mar 2022 08:49:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98253c74e61c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 08:49:33 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VI1PR0802MB2368.eurprd08.prod.outlook.com (2603:10a6:800:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 08:49:31 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:49:31 +0000
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
X-Inumbo-ID: 06f00202-a9bd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opT9MFBfZkguLI1U5J1pZKy+328zuV6jlSYWplEZWkI=;
 b=J9xxu6b4oRF4ZrO+d2S+Hnrg8EuTmYJiIlnvT4b2nhqgMDroXBqz5r1GFRkChyAoyb0WZyKdp7N0+CcXeLf5StkznsZSzHibn+BwgZEHRp4iXUN8HVrXl7X5pbqLnBfUJ4Tih25yi5acKtIq7MS1mgU9z52pyL9gzn65x/dmrGA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa2ee0d00989104d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR+XR4wFpyjg2DtYM96z2+Y1o+e/qwxgEHPtp1oJZJmsEUQqNq0nHLP0fD03yQZ/NrvXmEaox90Pu8ewATS+Nns11+tQctRHVQaKOSl86zR1FP6OEHC8bxKMW8SuIp0rN0DbNknkmIWYELjffQv+TytxPWjeLrJKex087eDn7RwjGlCYQaeVMBv1iTOWsF4jrI9zXL514aGi4657Ya9eOT10TUd4KKGX493RYpnV3SvY64v5FahuCX8sXKySyD/zIxrAoCnTZHTjIMc4LElGXFSOp5kmMF3uVk378GLsXIV6jtzGdkkQX5bv1M/7+4HOw8edil/yHO+toU4Bda5GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opT9MFBfZkguLI1U5J1pZKy+328zuV6jlSYWplEZWkI=;
 b=HWP/OSSoOSK08SGICahs8K+Bv1ugCa0S06E0SVM7iEnIMWL3lpzF4oscewO8cqGW0y/GWTbGfNMEoE9vgCl2/bCQZCDRoS/5UeWFFqk4sVB6m6gyfVhjb2VrmX3D1SAS3v0hdSlL7hHlYL68VQZwnKwoZHepwtFMErYR7vFVHrfXKov54Kt/E9EaWbV5PLsJYvDtvJvR51y12+HXCSkcEfpgw35g62LWt9gyXZILpgKhMnmTbXn7NOSGig+wLmIQ6dLaY4dLRUgDg8+wML5qltVYZLZvULX0snyKyG5JoBL12XWxYtg3/kMrNR48/5AHE5QhYs9EELpIaNxocHEwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opT9MFBfZkguLI1U5J1pZKy+328zuV6jlSYWplEZWkI=;
 b=J9xxu6b4oRF4ZrO+d2S+Hnrg8EuTmYJiIlnvT4b2nhqgMDroXBqz5r1GFRkChyAoyb0WZyKdp7N0+CcXeLf5StkznsZSzHibn+BwgZEHRp4iXUN8HVrXl7X5pbqLnBfUJ4Tih25yi5acKtIq7MS1mgU9z52pyL9gzn65x/dmrGA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYOtySiWfuTiIQkkqv44WbBvDftKzKhbaAgACYDQA=
Date: Tue, 22 Mar 2022 08:49:31 +0000
Message-ID: <27898878-F215-4993-805E-BAF04D2D07BC@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2203211541030.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203211541030.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ec7ac948-1751-413f-11b5-08da0be0ea02
x-ms-traffictypediagnostic:
	VI1PR0802MB2368:EE_|AM5EUR03FT056:EE_|DB8PR08MB3947:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB3947A56F686BFF4BA2743F0EE4179@DB8PR08MB3947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oVM4IonF6fokSxV6DZYM3/IFs1FAHKJjTkC/n3U6gHIRiNErZD9Us2HYanglF20NBXNa7LSztNF5bB8lH+Yp0T1yRltI4qSnPlW1uQJp0EXcJWr/5Nxi5MDZXcNUeWsS1rUqtB6ZX1b+NIBOh9MEB5BFnnf2O8LdH7pp16KD7sqYceHiPo3iuu9LaUkDsKFaDhzgaWPW8JzIMIWz8/KeQjua9WTYeBkUTftkN6l62e7NN9eqe5Wlak0GcUbT+bTLAw8+tMO8vksuk8/32F8ztb67YDC9KV4p4Sna5hI4B459dcWZTcMJTB/TeERw5wX1ucYqolmvb6jaPL35115EGlWxc3Qsuevqwg2BH4omJTragSXCfYAZo/Z/GEchUjM6vgqAXMyJrbw/Y/c+9NokAelmHUoufzQ+ge165kxVg2EnR9OejFGqeSzgVJOYjgXe02rvtcNf57KHaJZUTjDHGItgW1582aH0O2wxRiiJY7h7WSpa1sCunfaKp0qFnjNf5WIxQuq5eenbMWRge8BLWOssyn+fIdGNd2MrwrU1Et0gYTnLyKtgPkWw0tiLHPPdD7paKjcCsFrvwTWDHdIDKDEELRXNcHctA/e/yeigni4r469IqtZS2BlCKw5qrBOFtwEHZzj2qZsG8Cg7PfmL6jXrbJWSAJDOLqg8baD+YNrT10ZevvwgawbdaLlnnh4C9D9wllSI8pXpKQBMaCAjQ+sCkbeuYJkx8jrpWjIhYZps9Cj4NXrTkhYyIkzwUEatMIDop0kMNUouF81rwUHqsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(6486002)(7416002)(508600001)(38070700005)(2906002)(38100700002)(86362001)(122000001)(5660300002)(316002)(33656002)(83380400001)(71200400001)(36756003)(2616005)(186003)(26005)(4326008)(66476007)(8676002)(6916009)(6512007)(54906003)(66946007)(66556008)(64756008)(66446008)(6506007)(76116006)(91956017)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F4AEA1565528B4FAC11B14D78D639DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ff8cf6b-72c2-4567-a6a3-08da0be0e1b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8yN1pRh/375ZVgpaNrbzneOCgP6VMHPxV1DcuMlgcR3M8uFL/obze0sB2WFVuW3kvhPRZITk+FxloEMlMxAqVzRaOqoz05BJMH03l7YdbFlDPKwz9rrgguCxnyUwqI2jQ2F/Mgwd9PuAP/1A1LNeNXuXh2kIQ9qI9KTAECaS594zSyfaaLhuI47btVPexlia7bk/vh2g5Deab+5FDQzYcGJE1E47lu8VC0JF8LKA4GG8z9zwIUXO9QEt5FVttjcvi8PjH89z3qsOEdE0rUl/Jj/nsFI/9eF0VgNQS3jivjdW7deHgrp0+kh47rK9y/x8YqJrk4Baf4U3Vudaw4g9fYqEXcd1rvxv19zqQFfmkBEzzFhOyfB/r/tUjZpJr5vXZDbQ5tcfbNtVBm7cZ6ljAGiymlmTwpwIRWaL2Ojai96RWTvGYvE5hLR6k2W7gDYQud54y40YNEFD6ngCTRJ3mxL8QVP1oEdgt+Aps/rLCWYFXM2fXzRFcg3QnyfF1hGH43rorLcNm7RMXYmn7fEnYDrFUP2vPYzcPAMknd6HfK3e2Urlv64AMTUCMK8NlAfRy85tTCOd17Dq8wA0AaW05qhhfBIibNWNGqaWuYPIxGly5Fs9mE5yGRRIJ+aPiWGp4TkjLn5R8JLPoITGzV7rzUWMmblq2vO/sDnTpPTQaf6CrSS6TnekZWo1Ir5O2mN+sff4ytXvPbyIRaqAOxWWkg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(107886003)(82310400004)(316002)(36756003)(40460700003)(54906003)(83380400001)(33656002)(81166007)(6506007)(6512007)(2906002)(356005)(8676002)(70206006)(70586007)(86362001)(6862004)(4326008)(47076005)(2616005)(8936002)(26005)(186003)(336012)(5660300002)(36860700001)(508600001)(6486002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:49:45.1993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7ac948-1751-413f-11b5-08da0be0ea02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3947

DQo+PiArLSBjcHVwb29sLXNjaGVkIChvcHRpb25hbCkNCj4+ICsNCj4+ICsgICAgTXVzdCBiZSBh
IHN0cmluZyBoYXZpbmcgdGhlIG5hbWUgb2YgYSBYZW4gc2NoZWR1bGVyLCBpdCBoYXMgbm8gZWZm
ZWN0IHdoZW4NCj4+ICsgICAgdXNlZCBpbiBjb25qdW5jdGlvbiBvZiBhIGNwdXBvb2wtaWQgZXF1
YWwgdG8gemVybywgaW4gdGhhdCBjYXNlIHRoZQ0KPj4gKyAgICBkZWZhdWx0IFhlbiBzY2hlZHVs
ZXIgaXMgc2VsZWN0ZWQgKHNjaGVkPTwuLi4+IGJvb3QgYXJndW1lbnQpLg0KPj4gKyAgICBDaGVj
ayB0aGUgc2NoZWQ9PC4uLj4gYm9vdCBhcmd1bWVudCBmb3IgYWxsb3dlZCB2YWx1ZXMuDQo+IA0K
PiBJIGFtIGhhcHB5IHdpdGggdGhpcyB2ZXJzaW9uIG9mIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5n
cywgdGhhbmtzIGZvcg0KPiB5b3VyIGVmZm9ydHMgdG8gdXBkYXRlIHRoZW0uIE9ubHkgb25lIGNv
bW1lbnQgbGVmdDogcGxlYXNlIHVwZGF0ZSB0aGUNCj4gZGVzY3JpcHRpb24gbm90IHRvIGluY2x1
ZGUgImNwdXBvb2wtaWQiIGdpdmVuIHRoYXQgdGhlcmUgaXMgbm8NCj4gY3B1cG9vbC1pZCBwcm9w
ZXJ0eSBhbnltb3JlIDotKQ0KPiANCg0KSGkgU3RlZmFubywNCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHJldmlldywNCg0KWWVzIEkgbWlzc2VkIHRoYXQhIEkgd2lsbCBmaXggaW4gdGhlIG5leHQgc2Vy
aWUuDQoNCj4+IA0KPj4gKy8qDQo+PiArICogcG9vbF9jcHVfbWFwOiAgIEluZGV4IGlzIGxvZ2lj
YWwgY3B1IG51bWJlciwgY29udGVudCBpcyBjcHVwb29sIGlkLCAoLTEpIGZvcg0KPj4gKyAqICAg
ICAgICAgICAgICAgICB1bmFzc2lnbmVkLg0KPj4gKyAqIHBvb2xfc2NoZWRfbWFwOiBJbmRleCBp
cyBjcHVwb29sIGlkLCBjb250ZW50IGlzIHNjaGVkdWxlciBpZCwgKC0xKSBmb3INCj4+ICsgKiAg
ICAgICAgICAgICAgICAgdW5hc3NpZ25lZC4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgaW50IF9faW5p
dGRhdGEgcG9vbF9jcHVfbWFwW05SX0NQVVNdICAgPSB7IFswIC4uLiBOUl9DUFVTLTFdID0gLTEg
fTsNCj4+ICtzdGF0aWMgaW50IF9faW5pdGRhdGEgcG9vbF9zY2hlZF9tYXBbTlJfQ1BVU10gPSB7
IFswIC4uLiBOUl9DUFVTLTFdID0gLTEgfTsNCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IF9faW5p
dGRhdGEgbmV4dF9wb29sX2lkOw0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX0RFVklDRV9U
UkVFDQo+IA0KPiBCT09UX1RJTUVfQ1BVUE9PTFMgZGVwZW5kcyBvbiBIQVNfREVWSUNFX1RSRUUs
IHNvIGl0IGlzIG5vdCBwb3NzaWJsZSB0bw0KPiBoYXZlIEJPT1RfVElNRV9DUFVQT09MUyBidXQg
bm90IEhBU19ERVZJQ0VfVFJFRSA/DQoNClllcyB5b3UgYXJlIHJpZ2h0LCB0aGUgaWZkZWYgaXMg
bm90IG5lZWRlZCBhdCB0aGlzIHN0YWdlIHNpbmNlIG9ubHkgYXJjaCB3aXRoIGRldmljZSB0cmVl
IGFyZQ0KdXNpbmcgaXQsIGlmIHg4NiB3b3VsZCBsaWtlIHRvIGltcGxlbWVudCBhIGNvbW1hbmQg
bGluZSB2ZXJzaW9uIHRoZW4gdGhlIGNvZGUgd2lsbCBiZSBpZmRlZi1pbmVkDQpsYXRlci4NCg0K
PiANCj4gDQo+PiArI2RlZmluZSBCVENQVVBPT0xTX0RUX05PREVfTk9fUkVHICAgICAoLTEpDQo+
PiArI2RlZmluZSBCVENQVVBPT0xTX0RUX05PREVfTk9fTE9HX0NQVSAoLTIpDQo+PiArDQo+PiAr
c3RhdGljIGludCBfX2luaXQgZ2V0X2xvZ2ljYWxfY3B1X2Zyb21faHdfaWQodW5zaWduZWQgaW50
IGh3aWQpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgZm9y
ICggaSA9IDA7IGkgPCBucl9jcHVfaWRzOyBpKysgKQ0KPj4gKyAgICAgICAgaWYgKCBjcHVfcGh5
c2ljYWxfaWQoaSkgPT0gaHdpZCApDQo+PiArICAgICAgICAgICAgcmV0dXJuIGk7DQo+PiArDQo+
PiArICAgIHJldHVybiAtMTsNCj4+ICt9DQo+IA0KPiBJIHdvbmRlciBpZiB0aGVyZSBpcyBhIGJl
dHRlciB3YXkgdG8gaW1wbGVtZW50IHRoaXMgZnVuY3Rpb24gYnV0IEkgYW0NCj4gbm90IHN1cmUu
IEFsc28sIGl0IG1pZ2h0IGJlIGJldHRlciB0byBhdm9pZCBwcmVtYXR1cmUgb3B0aW1pemF0aW9u
cy4NCj4gDQo+IFRoYXQgc2FpZCwgd2UgY291bGQgY2hlY2sgZmlyc3QgdGhlIHNpbXBsZSBjYXNl
IHdoZXJlIGh3aWQ9PWkuIExvb2tpbmcNCj4gYXQgdmFyaW91cyBleGlzdGluZyBkZXZpY2UgdHJl
ZSwgaXQgc2VlbXMgdG8gYmUgdGhlIG1vc3QgY29tbW9uIGNhc2UuDQo+IA0KPiBUaGlzIGlzIG5v
dCBhIHJlcXVpcmVtZW50LCBqdXN0IGEgaGFuZC13YXZ5IHN1Z2dlc3Rpb24uIEkgdGhpbmsgdGhl
DQo+IHBhdGNoIGlzIGFsc28gT0sgYXMgaXMuDQo+IA0KDQpOb3Qgc3VyZSB0byB1bmRlcnN0YW5k
IGhlcmUsIGF0IGxlYXN0IG9uIEZWUCAodGhlIGZpcnN0IERUIEkgaGF2ZSBhcm91bmQpLCBod2lk
ICE9IGksDQpPciBtYXliZSBJIGRpZG7igJl0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbg0KDQo+
IA0KPj4gK3ZvaWQgX19pbml0IGJ0Y3B1cG9vbHNfYWxsb2NhdGVfcG9vbHModm9pZCkNCj4+ICt7
DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4gKyAgICBib29sIGFkZF9leHRyYV9jcHVwb29s
ID0gZmFsc2U7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIElmIHRoZXJlIGFyZSBubyBj
cHVwb29scywgdGhlIHZhbHVlIG9mIG5leHRfcG9vbF9pZCBpcyB6ZXJvLCBzbyB0aGUgY29kZQ0K
Pj4gKyAgICAgKiBiZWxvdyB3aWxsIGFzc2lnbiBldmVyeSBjcHUgdG8gY3B1cG9vbDAgYXMgdGhl
IGRlZmF1bHQgYmVoYXZpb3IuDQo+PiArICAgICAqIFdoZW4gdGhlcmUgYXJlIGNwdXBvb2xzLCB0
aGUgY29kZSBiZWxvdyBpcyBhc3NpZ25pbmcgYWxsIHRoZSBub3QNCj4+ICsgICAgICogYXNzaWdu
ZWQgY3B1IHRvIGEgbmV3IHBvb2wgKG5leHRfcG9vbF9pZCB2YWx1ZSBpcyB0aGUgbGFzdCBpZCAr
IDEpLg0KPj4gKyAgICAgKiBJbiB0aGUgc2FtZSBsb29wIHdlIGNoZWNrIGlmIHRoZXJlIGlzIGFu
eSBhc3NpZ25lZCBjcHUgdGhhdCBpcyBub3QNCj4+ICsgICAgICogb25saW5lLg0KPj4gKyAgICAg
Ki8NCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBucl9jcHVfaWRzOyBpKysgKQ0KPj4gKyAgICAg
ICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGksICZjcHVfb25saW5lX21hcCkgKQ0KPiANCj4gTGV0
IG1lIHRha2UgdGhpcyBvcHBvcnR1bml0eSB0byBleHBsYWluIHRoZSB1bmZvcnR1bmF0ZWx5IHVu
d3JpdHRlbg0KPiBjb2Rpbmcgc3R5bGUgdGhlIHdheSBJIHVuZGVyc3RhbmQgaXQuIEkga25vdyB0
aGlzIGlzIHRyaWJhbCBrbm93bGVkZ2UgYXQNCj4gdGhlIG1vbWVudCBhbmQgSSBhcG9sb2dpemUg
Zm9yIHRoYXQuDQo+IA0KPiBJZiBpdCBpcyBhIHNpbmdsZSBsaW5lIHN0YXRlbWVudCwgd2Ugc2tp
cCB0aGUgeyB9LCB3ZSBrZWVwIHRoZW0gaW4gYWxsDQo+IG90aGVyIGNhc2VzLg0KPiANCj4gU286
DQo+IA0KPiAgLyogY29ycmVjdCAqLw0KPiAgaWYgKCB4eHggKSB7DQo+ICAgICAgc29tZXRoaW5n
Ow0KPiAgICAgIHNvbWV0aGluZyBlbHNlOw0KPiAgfQ0KPiANCj4gIC8qIGNvcnJlY3QgKi8NCj4g
IGlmICggeHh4ICkgew0KPiAgICAgIGZvciAoIHl5eSApIHsNCj4gICAgICB9DQo+ICB9DQo+IA0K
PiAgLyogY29ycmVjdCAqLw0KPiAgaWYgKCB4eHggKQ0KPiAgICAgIHNvbWV0aGluZyBzaW5nbGUg
bGluZSBvciAyIGxpbmVzIGxpa2UgYSBwcmludGsgdGhhdCBnbyBiZXlvbmQgODANCj4gICAgICBj
aGFycywgbmV2ZXIgaW4gY2FzZSBvZiBuZXN0ZWQgaWZzDQo+IA0KPiAgLyogbm90IGNvcnJlY3Qg
Ki8NCj4gIGlmICggeHh4ICkNCj4gICAgICBzb21ldGhpbmcNCj4gICAgICBtdWx0aQ0KPiAgICAg
IGxpbmU7DQo+IA0KPiAgLyogbm90IGNvcnJlY3QgKi8NCj4gIGlmICggeHh4ICkNCj4gICAgICBp
ZiAoIHl5eSApDQo+ICAgICAgICAgIHNvbWV0aGluZzsNCj4gDQo+IFNvIGJhc2ljYWxseSB3ZSB3
b3VsZCBrZWVwIHRoZSB7IH0gaGVyZSBidXQgd2Ugd291bGQgc2tpcCB0aGVtIC4uLg0KDQpPayB0
aGlzIGNsYXJpZmllcyBhIGxvdCwgdGhhbmsgeW91LCBJIHdpbGwgY2hlY2sgdGhlIGNvZGUgYW5k
IEkgd2lsbCBmaXggaXQgd2hlcmUgaXTigJlzIG5vdA0KY29tcGxpYW50Lg0KDQo+IA0KPj4gKyNp
ZmRlZiBDT05GSUdfSEFTX0RFVklDRV9UUkVFDQo+PiArdm9pZCBidGNwdXBvb2xzX2R0Yl9wYXJz
ZSh2b2lkKTsNCj4+ICsjZWxzZQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBidGNwdXBvb2xzX2R0
Yl9wYXJzZSh2b2lkKSB7fQ0KPj4gKyNlbmRpZg0KPiANCj4gc2FtZSBjb21tZW50IGFib3V0ICFD
T05GSUdfSEFTX0RFVklDRV9UUkVFDQoNClllcyBJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHNl
cmllLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

