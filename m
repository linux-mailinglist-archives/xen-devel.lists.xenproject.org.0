Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839296E8B96
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 09:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523909.814315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppOwt-00045X-Au; Thu, 20 Apr 2023 07:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523909.814315; Thu, 20 Apr 2023 07:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppOwt-00042s-7D; Thu, 20 Apr 2023 07:43:23 +0000
Received: by outflank-mailman (input) for mailman id 523909;
 Thu, 20 Apr 2023 07:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VJI=AL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ppOwr-00042m-6N
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 07:43:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03402b5e-df4f-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 09:43:17 +0200 (CEST)
Received: from AS9PR06CA0182.eurprd06.prod.outlook.com (2603:10a6:20b:45d::16)
 by DU2PR08MB10087.eurprd08.prod.outlook.com (2603:10a6:10:491::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 07:43:12 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::d7) by AS9PR06CA0182.outlook.office365.com
 (2603:10a6:20b:45d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 07:43:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 07:43:11 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 20 Apr 2023 07:43:11 +0000
Received: from 566a26e9f737.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D472B863-D985-416A-AB30-7ABD77FB96E2.1; 
 Thu, 20 Apr 2023 07:43:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 566a26e9f737.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 07:43:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 07:43:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 07:43:03 +0000
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
X-Inumbo-ID: 03402b5e-df4f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ejMdyeZuH+ZWQ3q+pm85H2YppzItml6TjaAJ/NV8I8=;
 b=YhLvKhZok2tCe1RsQRfuNIAw7gtSh+93L14XuOdGoUFA11S+Nu8boBjBwIXcJOdwClms4icQsnlffiTrunpS+O5/J1C1KtKH2KTHc1Dgz7xeL1LPVhg4qQWby8Wyxp/bB7YQc1vLu2bzEGF86y8zkhJp+Hksw3q0bRwIduiHVQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3222906a3534b6ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYu4zkGMFBb1Jzc+PAzQF2QgK0Woxn9EYRRcgPskQ28YvI6xzYxuXCxaTpBhmA7O1MaMHdoVJgJd9WAqUerv2QH3xq8kpduZBfVX0ERqNMwbz9CghtiCEGhj4VBDCcNx6PwF2NWYKwVKWObGTZr9+lhmbzcANDl/NFYWH6P3yyUQLIdSeQjCCCTf/enED8hxFfPtV0cQubg5hiXWQCMB4Ep6wYEoXfSQ/+0xjYYwk8Bsi6P5ky8DNd8z5EYxrZLfLZhHoTe627cBwowvoNSyAtZNi6694jfduhc0s6+pHjtwH1KxSBbzE3i5M2Y0QTvTyy/UjdBiLJ7Y7xLOAKzWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ejMdyeZuH+ZWQ3q+pm85H2YppzItml6TjaAJ/NV8I8=;
 b=MqYirsW6kfXNdVBQJDoXB3zQIIyd7ZXkLqDhWaMH2MXTEqrZRbqJj0EFjVGFs/sLYvAkzGcJGYkGDP9ZmbF+KPpDtYl8y84ctdxL4zPnrUveAwD37nYsH7xD431Y/WlOgBa8Gi03DtK2ZJT5aWLamQFH0i240jMVzDeZDNpXwP9GZuE+tdgwT4ZZVDS+QJLmSq0zjqiGVDB7nw/nBOLMoLQYd9tH2uqaJHjiE0fuHG+aDpEXXT+a09WJsVPwuAl1LTTCvOdBBMq87qkSuBhltQaL0zx4UlClwb8Ahf6ZaIDOYnU89XFvRWEZ9PJ/v/m5gHz245YSLa8eZ5NGtqLIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ejMdyeZuH+ZWQ3q+pm85H2YppzItml6TjaAJ/NV8I8=;
 b=YhLvKhZok2tCe1RsQRfuNIAw7gtSh+93L14XuOdGoUFA11S+Nu8boBjBwIXcJOdwClms4icQsnlffiTrunpS+O5/J1C1KtKH2KTHc1Dgz7xeL1LPVhg4qQWby8Wyxp/bB7YQc1vLu2bzEGF86y8zkhJp+Hksw3q0bRwIduiHVQY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQ26+FC1T02dEGoq+zimN/6Ra8xC6+AgAE104CAAAEsgIABmneA
Date: Thu, 20 Apr 2023 07:43:03 +0000
Message-ID: <5AE27C3A-3857-4044-9010-F452C7CF7E6F@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
 <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
 <2B510623-0438-4D01-A916-14A8DE8D0A8C@arm.com>
In-Reply-To: <2B510623-0438-4D01-A916-14A8DE8D0A8C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6511:EE_|AM7EUR03FT025:EE_|DU2PR08MB10087:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b162689-1aaa-4c8e-7fb8-08db4172e459
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TgETE3Z0sHA/tN0GIBvxi5GpLWHKkdU858IEDJAT9cmV29JyR2Gu0M+Pnj/EUlYXxQgB8g+wSnw7BbVl7S5iNOJr7yuAYQ851rwQYciY6Jv+OTPZ+PCADYn2aXQlLipM2eJ6nnveOfuCWdCAdHVGNBUuLY5hl+P6upw3D+byEalbi5umFlA4rItNY/3skM20ZEQ2bLz3zFdtmU5FWUn63D/Z0SgD0jVxa5cUUcSaJAVZPohXJKVVbG9d+hUVk04hkZ0Uq+wdsmpuo4N63UFV64cugvAvp0/NJD1fSfXG8Ue67geVn1KriKeQEd3XJycOxj3ppk616Yzi5bFJjH5aZEObjlaz/rC1LhIqGx8ooqKHm+g8JwDw2ksYXgxmcpNBBaJbM/F1O9UvLCi+E/l3ERvpr9j/Cj6nfd1qnrOF0ev5vTVGdQeAjDbWSg6jIYZKO0MPVpF7LJcN6sdjDIqwnXv1ABx/TzwpE1fk0c79SiXbh5yL6owE8xWgkBj2hrUF6i3yB3kDv8dHeqbNTAj8tbBy+82MgVmssAUKEW+EgoiS3CZrNNImRB1+XdZRKUHRLfFQkCX8TAo7o2hkF0Nu9Mga8eR86wrPzBB2qn135V7vpBsQmBdqNhgSdseJjoaTpiGZS0b6I1gyHzGxI3ZPTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(4326008)(5660300002)(86362001)(2616005)(83380400001)(186003)(26005)(6506007)(6512007)(122000001)(38100700002)(71200400001)(38070700005)(6862004)(8936002)(8676002)(33656002)(478600001)(54906003)(37006003)(6486002)(6636002)(41300700001)(316002)(91956017)(76116006)(36756003)(66446008)(66476007)(66556008)(66946007)(64756008)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <061D7AB672F1134F98F0389DB33CCF72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb73254e-8300-4da1-e26d-08db4172df82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DANnII+A8dEB9AcBH6Lb+i78cYSPHMdIKh9AVOnqS1gtnl6xBLWc9++KmHSRqh3mm/yuP2H49AoSAr4jdxwaYBrNXdtH6AsLf6x8blhe4FwDlJX5H90J1z9i7vO3wMfmf18ifGPlOtZZK/h4xQoqOXxHmNeB6sVzk7kfupbeSR5HAwGx8fQ92LzpvrcitElJycnQOsa6wCyg8yjN6sspe/d/i3r+Hn+tr0LDp/GTjlbWif94zh0hW5jWc6k/Be0Rbrn7MdRS/4xpFq6uN5UJdssuBll9TEvyE2P3I/pxKOGtHM5bIwNlP7SL9giENBhpIZkF/rQo51kiiCBHaF6dt6+SHc/u3K7pug2v07rbGZtohG/REVT452v7M1r/hm8kxVIJ3OFnS4vaZDwFLAKPOs7gXke7W3wi/tUSwllmRO+NkxJkqouwJlxuJU7/lF0XtK/wvBg540s0Qnn9vQSwepsVCXsUYbWGlnRuL+z9pyd42xOFiNQeupusnrpZ6MDgKoTT1ZXx7SZ8FFf3s6rag5M3/T+/30/dF0udAYNPNCjGSwJzNKfxbeFMrCwJPnXYdt1c4ruT6fvSYy3vzNBm96bGW339BRM0GR4t/tjNaMmTSxgR4PxwjP8iMz1D4JggcXMAxdkoWLeh4ABEGZZtnhLqrgOJa2JsLTtEdUhUKPcvvJ70FJFF8MkMByaU395PpYpnW+/EUzAqJrWa4Gk6Ew==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(5660300002)(82310400005)(336012)(2616005)(47076005)(83380400001)(86362001)(356005)(107886003)(81166007)(6512007)(82740400003)(26005)(6506007)(186003)(36860700001)(8936002)(8676002)(6862004)(478600001)(6636002)(33656002)(41300700001)(6486002)(40480700001)(54906003)(37006003)(316002)(36756003)(70586007)(4326008)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 07:43:11.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b162689-1aaa-4c8e-7fb8-08db4172e459
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10087

DQo+Pj4+ICt2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+PiArew0KPj4+
PiArICAgIHVuc2lnbmVkIGludCBzdmVfdmxfYml0cyA9IHN2ZV9kZWNvZGVfdmwodi0+ZG9tYWlu
LT5hcmNoLnN2ZV92bCk7DQo+Pj4+ICsgICAgdWludDY0X3QgKnN2ZV9jdHhfenJlZ19lbmQgPSB2
LT5hcmNoLnZmcC5zdmVfY29udGV4dCArDQo+Pj4+ICsgICAgICAgICAgICAoc3ZlX3pyZWdfY3R4
X3NpemUoc3ZlX3ZsX2JpdHMpIC8gc2l6ZW9mKHVpbnQ2NF90KSk7DQo+Pj4gDQo+Pj4gWW91IGRv
IHF1aXRlIHNvbWUgY29tcHV0YXRpb24gaGVyZSBmb3Igc29tZXRoaW5nIHdoaWNoIGRvZXMgbm90
IGNoYW5nZQ0KPj4+IGR1cmluZyB0aGUgbGlmZSBvZiB0aGUgVk0uDQo+Pj4gQ291bGQgd2Ugc2F2
ZSB0aGUgY29udGV4dF9lbmQgaW4gdGhlIHZjcHUgaW5zdGVhZCBhbmQganVzdCBkbyB0aGlzDQo+
Pj4gY29tcHV0YXRpb24gb24gaW5pdCBhbmQgZnJlZSBvbmx5ID8NCj4+IA0KPj4gWWVzIHN1cmUs
IHdvdWxkIHlvdSBiZSBvayB0byBoYXZlIGl0IGluIHN0cnVjdCB2ZnBfc3RhdGU/DQo+IA0KPiBZ
ZXMgZGVmaW5pdGVseSBpIHdvdWxkIHN0b3JlIGl0IGluc3RlYWQgb2YgdGhlIGN1cnJlbnQgc3Zl
X2NvbnRleHQuDQo+IA0KDQpIaSBCZXJ0cmFuZCwgDQoNClRoZXNlIGFyZSB0aGUgY2hhbmdlcyBJ
4oCZbSBkb2luZyB0byB0aGlzIHBhdGNoIHRvIGFkZHJlc3MgeW91ciBjb21tZW50LCBhcmUgeW91
IG9rIHdpdGggdGhlbT8NCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYyBi
L3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KaW5kZXggZjBlYWIxOGRjMzg0Li4xZmVmNDY2YmEw
YWEgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCisrKyBiL3hlbi9hcmNo
L2FybS9hcm02NC9zdmUuYw0KQEAgLTkxLDM1ICs5MSwzNSBAQCBpbnQgc3ZlX2NvbnRleHRfaW5p
dChzdHJ1Y3QgdmNwdSAqdikNCiAgICAgaWYgKCAhY3R4ICkNCiAgICAgICAgIHJldHVybiAtRU5P
TUVNOw0KIA0KLSAgICB2LT5hcmNoLnZmcC5zdmVfY29udGV4dCA9IGN0eDsNCisgICAgLyogUG9p
bnQgdG8gdGhlIGVuZCBvZiBaMC1aMzEgbWVtb3J5LCBqdXN0IGJlZm9yZSBGRlIgbWVtb3J5ICov
DQorICAgIHYtPmFyY2gudmZwLnN2ZV96cmVnX2N0eF9lbmQgPSBjdHggKw0KKyAgICAgICAgKHN2
ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSAvIHNpemVvZih1aW50NjRfdCkpOw0KIA0KICAg
ICByZXR1cm4gMDsNCiB9DQogDQogdm9pZCBzdmVfY29udGV4dF9mcmVlKHN0cnVjdCB2Y3B1ICp2
KQ0KIHsNCi0gICAgWEZSRUUodi0+YXJjaC52ZnAuc3ZlX2NvbnRleHQpOw0KKyAgICB1bnNpZ25l
ZCBpbnQgc3ZlX3ZsX2JpdHMgPSBzdmVfZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwp
Ow0KKw0KKyAgICAvKiBQb2ludCBiYWNrIHRvIHRoZSBiZWdpbm5pbmcgb2YgWjAtWjMxICsgRkZS
IG1lbW9yeSAqLw0KKyAgICB2LT5hcmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kID0gdi0+YXJjaC52
ZnAuc3ZlX3pyZWdfY3R4X2VuZCAtDQorICAgICAgICAoc3ZlX3pyZWdfY3R4X3NpemUoc3ZlX3Zs
X2JpdHMpIC8gc2l6ZW9mKHVpbnQ2NF90KSk7DQorDQorICAgIFhGUkVFKHYtPmFyY2gudmZwLnN2
ZV96cmVnX2N0eF9lbmQpOw0KIH0NCiANCiB2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1
ICp2KQ0KIHsNCi0gICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bCh2
LT5kb21haW4tPmFyY2guc3ZlX3ZsKTsNCi0gICAgdWludDY0X3QgKnN2ZV9jdHhfenJlZ19lbmQg
PSB2LT5hcmNoLnZmcC5zdmVfY29udGV4dCArDQotICAgICAgICAgICAgKHN2ZV96cmVnX2N0eF9z
aXplKHN2ZV92bF9iaXRzKSAvIHNpemVvZih1aW50NjRfdCkpOw0KLQ0KICAgICB2LT5hcmNoLnpj
cl9lbDEgPSBSRUFEX1NZU1JFRyhaQ1JfRUwxKTsNCiANCi0gICAgc3ZlX3NhdmVfY3R4KHN2ZV9j
dHhfenJlZ19lbmQsIHYtPmFyY2gudmZwLmZwcmVncywgMSk7DQorICAgIHN2ZV9zYXZlX2N0eCh2
LT5hcmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kLCB2LT5hcmNoLnZmcC5mcHJlZ3MsIDEpOw0KIH0N
CiANCiB2b2lkIHN2ZV9yZXN0b3JlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KIHsNCi0gICAgdW5z
aWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bCh2LT5kb21haW4tPmFyY2guc3Zl
X3ZsKTsNCi0gICAgdWludDY0X3QgKnN2ZV9jdHhfenJlZ19lbmQgPSB2LT5hcmNoLnZmcC5zdmVf
Y29udGV4dCArDQotICAgICAgICAgICAgKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSAv
IHNpemVvZih1aW50NjRfdCkpOw0KLQ0KICAgICBXUklURV9TWVNSRUcodi0+YXJjaC56Y3JfZWwx
LCBaQ1JfRUwxKTsNCiAgICAgV1JJVEVfU1lTUkVHKHYtPmFyY2guemNyX2VsMiwgWkNSX0VMMik7
DQogDQotICAgIHN2ZV9sb2FkX2N0eChzdmVfY3R4X3pyZWdfZW5kLCB2LT5hcmNoLnZmcC5mcHJl
Z3MsIDEpOw0KKyAgICBzdmVfbG9hZF9jdHgodi0+YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZCwg
di0+YXJjaC52ZnAuZnByZWdzLCAxKTsNCiB9DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2FybTY0L3ZmcC5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3Zm
cC5oDQppbmRleCA4YWY3MTRjYjhlY2MuLjRhYTM3MWU4NWQyNiAxMDA2NDQNCi0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC92ZnAuaA0KKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2FybTY0L3ZmcC5oDQpAQCAtMTMsMTAgKzEzLDEyIEBAIHN0cnVjdCB2ZnBfc3RhdGUN
CiAgICAgICovDQogICAgIHVpbnQ2NF90IGZwcmVnc1s2NF0gX192ZnBfYWxpZ25lZDsNCiAgICAg
LyoNCi0gICAgICogV2hlbiBTVkUgaXMgZW5hYmxlZCBmb3IgdGhlIGd1ZXN0LCBzdmVfY29udGV4
dCBjb250YWlucyBtZW1vcnkgdG8NCi0gICAgICogc2F2ZS9yZXN0b3JlIFowLVozMSByZWdpc3Rl
cnMgYW5kIEZGUi4NCisgICAgICogV2hlbiBTVkUgaXMgZW5hYmxlZCBmb3IgdGhlIGd1ZXN0LCBz
dmVfenJlZ19jdHhfZW5kIHBvaW50cyB0byBtZW1vcnkNCisgICAgICogd2hlcmUgWjAtWjMxIHJl
Z2lzdGVycyBhbmQgRkZSIGNhbiBiZSBzYXZlZC9yZXN0b3JlZCwgaXQgcG9pbnRzIGF0IHRoZQ0K
KyAgICAgKiBlbmQgb2YgdGhlIFowLVozMSBzcGFjZSBhbmQgYXQgdGhlIGJlZ2lubmluZyBvZiB0
aGUgRkZSIHNwYWNlLCBpdCdzIGRvbmUNCisgICAgICogbGlrZSB0aGF0IHRvIGVhc2UgdGhlIHNh
dmUvcmVzdG9yZSBhc3NlbWJseSBvcGVyYXRpb25zLg0KICAgICAgKi8NCi0gICAgdWludDY0X3Qg
KnN2ZV9jb250ZXh0Ow0KKyAgICB1aW50NjRfdCAqc3ZlX3pyZWdfY3R4X2VuZDsNCiAgICAgcmVn
aXN0ZXJfdCBmcGNyOw0KICAgICByZWdpc3Rlcl90IGZwZXhjMzJfZWwyOw0KICAgICByZWdpc3Rl
cl90IGZwc3I7DQoNCg0K

