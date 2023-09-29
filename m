Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5111C7B2CF4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610192.949505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7nR-0005ZV-Ii; Fri, 29 Sep 2023 07:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610192.949505; Fri, 29 Sep 2023 07:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7nR-0005XI-Fl; Fri, 29 Sep 2023 07:20:21 +0000
Received: by outflank-mailman (input) for mailman id 610192;
 Fri, 29 Sep 2023 07:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qm7nQ-0005XC-5p
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:20:20 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b723ee-5e98-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 09:20:19 +0200 (CEST)
Received: from AS9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::12) by DU2PR08MB10160.eurprd08.prod.outlook.com
 (2603:10a6:10:496::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 07:20:14 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::d1) by AS9PR01CA0007.outlook.office365.com
 (2603:10a6:20b:540::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 07:20:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Fri, 29 Sep 2023 07:20:13 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Fri, 29 Sep 2023 07:20:13 +0000
Received: from 40780ee2711f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B20B8E37-F506-4D7E-8004-FCF10E7D1362.1; 
 Fri, 29 Sep 2023 07:19:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40780ee2711f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 07:19:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8468.eurprd08.prod.outlook.com (2603:10a6:20b:566::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 07:19:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 07:19:33 +0000
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
X-Inumbo-ID: a4b723ee-5e98-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXTzOvv36gkakp5jcYNiOYC1FPCh+BbyaRJzdx4aPWE=;
 b=SMUOjxHEJ/L9vKAE8h45pwQURbTmseYCaTXVB/iffM23HNw5LRoq16saJyJCMFJ5pZoRPt+hvHp6KcjdQYyDYnIF5xqAfdpT4ntEqRleVHwLn7pG7g99EzZttNQbsAauYIo7s6fNaIP3qr37RJFHWk7pBS6o5YUiCyQ0xkCGw1c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 741cba55415988fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6HWF2ULgumtXCUxiMlNJFBTVzqhrG23j3iNXiBimOxMXdXFOdJEh/rgDPf7YpXPyGGvEScwnZ+AT1gNOPNHe6jEcW40vV4wX2JTblD5f5zI1/oaBep5JVkaJPIgSt8Y014eYc4GM+Dh3mgYzi4Y7BYBzBdhFHzZ4Nf1pboFzoYpkgQ5SFWXQK3x3JMIkqAfDGPlbyZZBDlCvGfwHvDMd2CeprO7CxOyREmqotD50FhG1VKOVrS45PHTc4M1v+qzqPim/Bjxe7RrKqQVpVe2Wj1IxBu7kTeLEWriecHkGboOzAzl9vBRx65d/0/qIDT5LZZ8HxWELpzewEHIP8B6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXTzOvv36gkakp5jcYNiOYC1FPCh+BbyaRJzdx4aPWE=;
 b=QnWHQkMPewro2ZRlhyiilEdidhkORIrhEQtndav/Bh6pERBSsxApIzaDMiwpi4yq2wrURGw3hqdoFNTlY/hY8nYqQp+Tww9UG/d/FRXp67pKmTtSgKv3cQd+dby6/rG2hJVNZi7eiRVCQIgS7zk5/u0j99n858yXm0PYVBc2xYpDzP/MniMAyVk1ZUA7uYnMVWAYWMj1Bbfh9CTyJXr3MUh6guLJ4U73k0MR4aKs3uNeTLPKXc8kfJhYCIMluwhBtnVF6Vrp4or+9AWRv02KG3vnk6Rc413qpJLGQB5qcfypXU1qKW9t2x+n8LrdcX/mDz6YO6F8IX7y7jkB6OUinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXTzOvv36gkakp5jcYNiOYC1FPCh+BbyaRJzdx4aPWE=;
 b=SMUOjxHEJ/L9vKAE8h45pwQURbTmseYCaTXVB/iffM23HNw5LRoq16saJyJCMFJ5pZoRPt+hvHp6KcjdQYyDYnIF5xqAfdpT4ntEqRleVHwLn7pG7g99EzZttNQbsAauYIo7s6fNaIP3qr37RJFHWk7pBS6o5YUiCyQ0xkCGw1c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: Misra rule 10.3 violations report script
Thread-Topic: Misra rule 10.3 violations report script
Thread-Index: AQHZ8eai6IW78bNFI0CROv/LSYbjorAwjQwAgADZrQA=
Date: Fri, 29 Sep 2023 07:19:33 +0000
Message-ID: <A6C26881-C239-4F19-AD5C-EF8448743497@arm.com>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com>
 <fff7c46c-78ea-4656-fcca-85667e176104@amd.com>
In-Reply-To: <fff7c46c-78ea-4656-fcca-85667e176104@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8468:EE_|AM7EUR03FT039:EE_|DU2PR08MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d0f2f4-b6ec-4bf4-2702-08dbc0bc85c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wRFmRIePpmtbmD8vopGjiwHucS/WZiBG39UCb6bZecZv0cvh07geh1IXXqBesQVti17AvzAU+vDdVLaLQm+7VvHt3aimWxV5Zzgr0pDMLJ8fC45Zg0AQgRLs51Fkt0voEHTpOlBrlv2nlsSjrfGkiwHcDtHCdny/0sRyRRXaY7Rv4yrTaQ9UuOtQHMTIKsBrhf6gbWeJYAT2glTJR4huHMX4HYugaKQTTmYaPikTG/9f4jxODjppXoDiXrJbvspub+R8QeHDGysRhBN4SiUOS5W0XHeUFmlfXKoI02e+Fs6zj9N/8ZYNYLIyjiwNW6bXvfS240gTEe3FI1jdynwKmkeRBaJuIG9Wy0wQRU5IH1qlTBzggIUacn47sEwca58aXqJhZZDRRUwALPlI1v64N11ILv089U1L6ggmDJogrIwIOOI5xkvk+ni4+tmsbjJN3qou/81IvXpZNPeRUDBTuKOivP49pFDxkrNmadCuMYVWKuTue1QYMdb8StIwTYM88IeKe58XegXwkEVcVu/rLcjMwgdiMwzIEtpANo4lUrLtV4kfUgk98rj75ylMeCReBfKdP6zgj/EVt1B3MvCBvFCOBZNaUiKcR33PbAYidbh/pd47oWy5a4QiIlrsKEIywgIcA5NtCLKzWcxKdy4A/Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(5660300002)(8936002)(4326008)(8676002)(26005)(36756003)(2616005)(41300700001)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(316002)(54906003)(6916009)(91956017)(6506007)(71200400001)(83380400001)(6486002)(478600001)(966005)(33656002)(38100700002)(38070700005)(6512007)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB8011E8E0BF6B46A989DF8F648E94B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8468
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1af3769-cfd5-4236-02be-08dbc0bc6dc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oJR4OPWQrsjA8uEfbHVhwj9jhq/j/3ylVvyzloeafQ1LKrk5U3vkag45fQE7v5dljBDB4uyLToZ+zz3DCpqx+9O4FpyGXFI4zHRME5cWYgXVSvpdG6sCqzHajRPFUcz6sPYtrIwxq1VMMNKq9kW1udNYNjsYcBQXaCJV7n2NziIusd5euPLGHw2EzHdjEJSQNS/UIWLw7TG+na6QkrrIqG4IyrPp0SWmZn34YXm7kjN28zXDRQu1Bj4L/gQepye9OTw3VCCPuCSzUDfmnK3247GPH3Ck+9B9dNKEs46AFYCR/9hsAal8UTV7HKUiG4+hEOZHW6cWBfYlWPMY+HKFAXPvdnQqRIOaagb0zCP1DiCohFhW4wivOlersiX58oDHX1zPTdgqfkm0nBNofC+DNgbeZJn2Au3PBopHpTiyk1ot4GU66gt/g0Us+4tdZatWGbl1QJqcG4KYnfjjc9CoEsJIql66ZKYV9+k2kmVHs/NC7XXh2Ay8EX/3sm92MFgTqj8MP2q2N15vrOCEhjfpJaYfIdIa37V57W+SCGZVIwEQ6XLGv8vknf/7ULAlOfLmPXbevlHtsmesYm03QndKGpOGax3bC8e2DrNltVfTMER/pWJaI6iEQNYt6u1E2xYLQWN3Gjs1g7k3pp+0Cj93kdadjfO20u8kKHN1FJSHCbFlBmTj6NK8Hk/Wz8TBQfwOqQ9XnFrV0q543mkx+rhRSs5YAcX0BlInORjhhFAJI9c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(346002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(40460700003)(966005)(6486002)(41300700001)(40480700001)(6506007)(6512007)(478600001)(70586007)(70206006)(316002)(54906003)(356005)(81166007)(8676002)(2616005)(336012)(82740400003)(26005)(86362001)(8936002)(83380400001)(47076005)(4326008)(33656002)(36860700001)(2906002)(36756003)(5660300002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 07:20:13.3041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d0f2f4-b6ec-4bf4-2702-08dbc0bc85c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10160

DQo+IEhpIEx1Y2EsDQoNCkhpIEF5YW4sDQoNCj4+IA0KPj4gSW4gdGhlIGxhc3QgTUlTUkEgbWVl
dGluZyBTdGVmYW5vIHRvbGQgbWUgYWJvdXQgdGhlIFJ1bGUgMTAuMyBhbmQgdGhhdCB3ZSBoYXZl
IGEgbG90IG9mIHZpb2xhdGlvbnMsDQo+PiBidXQgR0NDIGhhcyBhIHdheSB0byBsaXN0IHRoZW0g
YXMgd3JpdHRlbiBpbiBydWxlcy5yc3QuDQo+PiANCj4+IFNvIHRoZSBpc3N1ZSB3YXMganVzdCB0
aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdmlvbGF0aW9ucywgbW9zdCBvZiB0aGVtIGNvbWluZyBmcm9t
IGhlYWRlcnMgYW5kIHRoZQ0KPj4gRGV2ZWxvcGVyIG1pZ2h0IGZlZWwgYSBiaXQgbG9zdCBzaW5j
ZSB0aGUgbnVtYmVyIGlzIHZlcnkgaGlnaCwgc28gSeKAmXZlIGRldmVsb3BlZCB0aGlzIHNjcmlw
dCB0byB0YWtlDQo+PiB0aGUgR0NDIGJ1aWxkIGxvZyBhbmQgY3JlYXRlIGEgbGlzdCBvZiB1bmlx
dWUgb2NjdXJyZW5jZXMgb2YgdGhlIHZpb2xhdGlvbnMgc29ydGVkIGluIGRlc2NlbmRpbmcNCj4+
IG9yZGVyLCBzbyB0aGF0IHdobyBoYXMgYSBiaXQgb2YgdGltZSBjYW4gdHJ5IHRvIGZpeCBzb21l
IG9mIHRob3NlIGFuZCBtYXliZSBjYW4gc3RhcnQgZnJvbSB0aGUgdG9wDQo+PiBvZiB0aGUgbGlz
dCB0byBmaXggYXMgbWFueSBhcyBwb3NzaWJsZSBvY2N1cnJlbmNlcy4NCj4+IA0KPj4gSSBhdHRh
Y2ggdGhlIHNjcmlwdCBhcyBwYXRjaCBmaWxlLg0KPiANCj4gVGhpcyBpcyBhbiBleGNlbGxlbnQg
c2NyaXB0IHRvIHNlZSB0aGUgdmlvbGF0aW9ucyBpbiBhIG5lYXQgd2F5LiBGb3IgZWcsIEkgc2Vl
IHRoaXMNCj4gDQo+IGFyY2gvYXJtL2RvbWFpbl9idWlsZC5jOjM4ODM6MjggKDEpDQo+IGFyY2gv
YXJtL2RvbWFpbl9idWlsZC5jOjM5MTA6MzYgKDEpDQo+IC4vaW5jbHVkZS94ZW4vcGZuLmg6Njoy
MyAoMSkNCj4gLi9pbmNsdWRlL3hlbi9tYWNyb3MuaDo0OjQwICgxKQ0KPiBhcmNoL2FybS9zZXR1
cC5jOjIyMToxMCAoMSkNCj4gYXJjaC9hcm0vc2V0dXAuYzoyMjc6NTkgKDEpDQo+IA0KPiBJIHRo
aW5rIG9uY2UgaW4gYSB3aGlsZSwgd2UgaGF2ZSBiZWVuIGFwcHJvYWNoZWQgYnkgbmV3YmllcyB3
YW50aW5nIHRvIGNvbnRyaWJ1dGUgdG8gWGVuIHByb2plY3QuDQo+IA0KPiBGb3IgZWcgIkJlZ2lu
bmVyIGxvb2tpbmcgdG8gY29udHJpYnV0ZSB0byBwcm9qZWN0IGluIGFyY2hpdmVkIGxpc3QiDQo+
IA0KPiBTb21ldGltZXMgcGVvcGxlIHJlYWNoIG91dCBpbmRpdmlkdWFsbHkgYXMgd2VsbC4NCj4g
DQo+IERvIHlvdSBoYXZlIHN1Y2ggc2ltaWxhciB0YXNrcyAobGlrZSB0aGlzKSB3aXRoaW4gb3Ig
YmV5b25kIHRoZSBzY29wZSBvZiBNSVNSQSB3aGljaCB3aWxsIHJlcXVpcmUgc29tZSBiYXNpYyBw
cm9ncmFtbWluZyBza2lsbHMgYW5kIGlzIGEgZ3JlYXQgZmlyc3Qgc3RlcCB0byBsZWFybiBhbmQg
Y29udHJpYnV0ZSB0byBYZW4gcHJvamVjdCA/DQo+IA0KPiBUaGlzIGNhbiBiZSB0aGluZ3Mgd2hp
Y2ggc3R1ZGVudHMvZm9sa3MgY2FuIGNvbnRyaWJ1dGUgb24gYW4gYWQtaG9jIGJhc2lzLg0KDQpZ
ZXMgaW5kZWVkLCB0aGVzZSBhcmUgdGhlIGtpbmQgb2YgZml4ZXMgdGhhdCBjb3VsZCBiZSBoYW5k
bGVkIGJ5IGJlZ2lubmVycyBjb250cmlidXRvcnMsDQpnaXZlbiB0aGUgYW1vdW50IG9mIHRoZW0g
d2UgbmVlZCBzb21lIGhlbHAgZm9yIHN1cmUhDQoNCg0KPiANCj4gSSBjYW4gd29yayB3aXRoIEtl
bGx5IHRvIHNlZSBpZiB3ZSBjYW4gcHV0IHRoZW0gaW4gYSB3aWtpIHBhZ2UuDQo+IA0KPiBJIGNv
dWxkIHNlZSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9ncmFt
X1Byb2plY3RzICwgYnV0IGRvbid0IGtub3cgaWYgaXQgaXMgdXAgdG8gZGF0ZS4NCg0KDQpTdXJl
IHdlIGNhbiBzeW5jIHdpdGggS2VsbHkgdG8gc2VlIHdoYXQgd2UgY2FuIGRvIQ0KDQpDaGVlcnMs
DQpMdWNh

