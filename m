Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0E3FD9F8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176380.320963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQ0w-0003LA-HO; Wed, 01 Sep 2021 13:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176380.320963; Wed, 01 Sep 2021 13:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQ0w-0003Ii-DR; Wed, 01 Sep 2021 13:10:50 +0000
Received: by outflank-mailman (input) for mailman id 176380;
 Wed, 01 Sep 2021 13:10:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3+8=NX=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mLQ0v-0003Ic-N5
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 13:10:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da6234c4-7ba4-4d9a-871e-c0fb449e7526;
 Wed, 01 Sep 2021 13:10:44 +0000 (UTC)
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by AM6PR08MB4262.eurprd08.prod.outlook.com (2603:10a6:20b:b4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 13:10:43 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::9b) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 1 Sep 2021 13:10:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 1 Sep 2021 13:10:42 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Wed, 01 Sep 2021 13:10:42 +0000
Received: from 4568ce9c777a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4AAC822-4C85-48D1-BCF6-987B4E5F6BD3.1; 
 Wed, 01 Sep 2021 13:10:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4568ce9c777a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Sep 2021 13:10:35 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6080.eurprd08.prod.outlook.com (2603:10a6:102:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 13:10:34 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 13:10:34 +0000
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
X-Inumbo-ID: da6234c4-7ba4-4d9a-871e-c0fb449e7526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwJnAE7Gxld7BbtZEYeSNKlissKtld1AdmcWjzKLjfU=;
 b=4HYkgxs7k5oT0SuUzKVcOVLnZSFL4ddFc/UiJbnriMkAK7uRzJV5G6V6h0rg+BIOSzH2L264a5QnHlPhhfSrD83A8Q4tyODGj9fts4bC5TAE19fi296CZ3SWS9PmDm3Owt2u+WQiPJ/kikLfvIOPbnLOjXKoPzFOl+Guonuz8lE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1b80aaeefa67559
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ox+UeuvfD6mMTfI1bDlPDOFzHXCrGqVSTRjP+7fOOWey9O/jR8C1h8KgnkP71zABZULuNFO90v5RRKxbFrIMwxzvBXnqfEruA0UGgakvkCO20HIJJKX5Tl3e2tVK3DuZJZHqbMKf49JdPp4cpBGseTzdP4BH9iLVvP+Hc1GdX7OSGRJqIMtxcLCMjYqn6EPXlh8RJM+GUNwdwZV7BIF6wPK8DWlWmD2LRSSKW+hIg+DKcDEn5ojZvLyVY/TSwOREzqGt54Baoqq9gHqf1MDgPrtTldKqz7BFAiRLat3tMQMOGkJxxCFIgICo7NFIn84+Ql/PksuULkmDPlY1beSlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwJnAE7Gxld7BbtZEYeSNKlissKtld1AdmcWjzKLjfU=;
 b=I5JGzPpq/q6Ln+qwQ1lnz7T9YYjrJV0UADUCbIerrXuWccKa8lvgKCt8gZkDyeRrHayO3TD69v5T4mKeLsXRz5ABUaNyZJn2FJWrGANJ0cHnDZXCGAmPvN9QZVe58NU/hjMlrg7o3tFUatSGe/2IaAuLQPmGMpUhskA31ULOKSAl5PscCHrlcbGFqrHKOs6QyVDRGph3FFaY0Vyuxs4335MQ3XXwn2CzGIRhutZv8eaUkuZnxqmaF3gCDCf3e8w3WHHkSOnVg1tTkJQZgsU6GajdVNNedKJ1GQmTKRCOP4kNFSIBR6au0VSnS/2M4YM5evQf4jUBGqrS2L2V+FJr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwJnAE7Gxld7BbtZEYeSNKlissKtld1AdmcWjzKLjfU=;
 b=4HYkgxs7k5oT0SuUzKVcOVLnZSFL4ddFc/UiJbnriMkAK7uRzJV5G6V6h0rg+BIOSzH2L264a5QnHlPhhfSrD83A8Q4tyODGj9fts4bC5TAE19fi296CZ3SWS9PmDm3Owt2u+WQiPJ/kikLfvIOPbnLOjXKoPzFOl+Guonuz8lE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Topic: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Index: AQHXny72/ET98Hho/USYtlrYv98fUauPIugAgAAENgA=
Date: Wed, 1 Sep 2021 13:10:33 +0000
Message-ID: <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
In-Reply-To: <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9672f376-092a-468a-7bb7-08d96d49e72b
x-ms-traffictypediagnostic: PA4PR08MB6080:|AM6PR08MB4262:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4262E6E956BFFDCD7B0064749DCD9@AM6PR08MB4262.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tynD5neOP/ZjryYfOQbXwLD3c2WawOOVSrQPmDAW4Gf609g1WBTrQ8J4of/1cCJGYFJyggnDqtZrZ03vpogd0vSejekcNrZD5uTioq3jhs1TWVT42NY0wAZ+YYQoR8lR6oZxAe+lUDVR7zSNg13RTdQguIpYQ8ojA/0cjPtQUtR3dRXyk+Ust5L3d+315r444aGmQZyiTmUaYsE10zEfXNVsw4aKvalJUaRegfSs2dEkjqM/uvrtaUgX+fXcSRSSNVbWLFroyXFmaYKGcxouSr1OZjqX+KDJdPnVM6s6EViKVy7IHo9aHtFaLjh1iQarJWHRyIENn6t52jkfINEgHmwJOOqxXFxduqiRYHOcD461t3nUBd3IKpPoo3v6/5QcFVd/t3dlAAjOI1vrDkkFAPMLjc1UBaZOpm1nZyhTcN3GgeyBuCqExf/B0hNB+c3Dc9U4aCVelslYAxtUSH/qYdsT82Lnbute+HD7ZQdAHlGK4JMx8H5oTkBnml8p4bJQt2QOTwR2QW7Znsh0fd5xiz5si3w0xyAmBWUgJO7OCggUsF5QRGuupTYroXl+wyQqfiRSrpwSCxA2V17/cqxHTi7+kE2/KMDN1M/n04zOdwifBNLiDv93vjy/A2PL6hOtPEfPxHeSnJLTHhMfJ9NgTeZftdgwVBv2jdNLDPVzzF5kIjyVjrDyxjDoBHVf5By39+cLofGVIJ8wuJSU/t8lPmk81kdEZOx7tgSYYbibeTRGVJ658qg0JbwP7g7wxHh0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(478600001)(36756003)(4326008)(6486002)(8676002)(71200400001)(38070700005)(6506007)(38100700002)(53546011)(8936002)(54906003)(66946007)(6512007)(122000001)(186003)(66446008)(64756008)(66556008)(66476007)(6916009)(91956017)(76116006)(86362001)(2906002)(2616005)(316002)(26005)(83380400001)(33656002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkVpQ3p0dW9hTlBaUE5iaEVFQkd0bEpRdnh4VVNVN1R1RG54WUxrWldmMVhX?=
 =?utf-8?B?UW1oYjJBYy9OdXcwRjg1eGVkQ1RiNjRkcG1wbitIQjJOTkdOM1E5R2pyOXpQ?=
 =?utf-8?B?TU95ajRyY29CdVY2cVV6SC9lQTdheTdDa2VMQndXRjN5d0JoeWRnbG13TUlr?=
 =?utf-8?B?SktuK2pwck14UTFhZ01yeWJHcDZ5eWdXdHNWMHdWcC92TktzaTgyOU1TdlVr?=
 =?utf-8?B?UngwWDJsN1YrQlVLc1RYdWVKQlNscGQyem9OOWxDWTRyZFg5Rk5BWjVBQXBh?=
 =?utf-8?B?Y2lFT2xaQTFHR1ppOC9KSWlaY2ZzMXVuSWZ5U0g2dW9heFN5ekRaWkx5b29p?=
 =?utf-8?B?c01YRGliWkdsWEFSUHhTakdDZEVVVExraW9jbkZKeGxsOVZjdjQ1Tk9Rb3oy?=
 =?utf-8?B?UzlOVGduY1ZhVWFVVVZtdExZYWRrQzdWSktFUHo5S3pzenQ2czN1bnFCdk4w?=
 =?utf-8?B?Q3YxWFYvcDBLSmRWZGpKTlJ4UHpJT2R3eVg5WTRhK25odUVUcFo2eUNBQTZQ?=
 =?utf-8?B?WDNlZllhcjNOZG0xL0NSM04xd3RXbGFwWGdJYnZITisza3Y5VWVBaU5CVTUr?=
 =?utf-8?B?Rjk4ZkhhQjArZTF2dDRGNldOS0pzNUs0S3djU1A0b0cxZm1ZQnBUM0J0U0Zn?=
 =?utf-8?B?WG0wMUkvdFNON1JXQTA5b1ltMjRWaFZiNitTUVFLSXhWcDNoT1BJZTl4dWp4?=
 =?utf-8?B?Qm5lZ3VnVjh2SVlQZnVBOHJZZzhnMEQzVExzS1RkNHdlSUhRY1VKMFhBV2VJ?=
 =?utf-8?B?by8rd3UxLzRLblVVTm9mbms2WkZRSW1kQ1FQWGdxZUxQdVVybkpCVGh3M2VU?=
 =?utf-8?B?OWk1c0RuTnBlMWFDL1drOEx6d2IybklpT3QyWngzT09DYWEvaEFyR2lQNm9q?=
 =?utf-8?B?aDN3ZnYvSzBtaDdiOVdZaU1zb3lQbXJZc094anVFVW4rTmVNVnpuU25ZRUQx?=
 =?utf-8?B?RkRPNjlGNlp0eDVTdVhROXV4ZzU5ZVRYL3VpZ09KUmpjcnRGZ2hLTWRIOXIw?=
 =?utf-8?B?V3NESkwrWXhPakc0TnZHbkJFOFI2eXlaMUgyc3hkVHYrUjNFa3A3VXAzUEk3?=
 =?utf-8?B?TGNmZGg0RFBMMURHdERGaVZaL24wZm5zWHozQll3WU8vOFl2b1UzYzVqYkVx?=
 =?utf-8?B?VGpPWlZnbUF5TVJFR2R3azl2SkFJd2dzdFE3SXJLUnNxRlFKckhHLzFKSlVQ?=
 =?utf-8?B?ZFBTditPMSs5QmdmaUtHc1hLMzQ5WEdXbU85aU9hMkhFRWh6S0FZTHhnOVpS?=
 =?utf-8?B?QWhWdWtsMWVrVmVsc0phd1UxTjhIc1JtY3l2R1NHNXVQOXhCeDRpbm9aY3J1?=
 =?utf-8?B?TFFZUU02dkdlY3F5WitJWWVGb1NGelFMZEF4b0w3NWp3NlJwcDExQXQrV0Ji?=
 =?utf-8?B?aDByVWlKL24rYWpvWTBwQUFnNFNTbklsbHFzdHZtTGRNd01xVzZnRi9lK2dK?=
 =?utf-8?B?dHZRaVI4K1dSWEhjdXozNzBLRnFaTWVheHdLZk12b05XUllTazR5b3ZlcGNX?=
 =?utf-8?B?a1doWFpWbitWVXRhWjFsQVN1Y011OU04Sm1FdVJrWVJObll4OGV4MDhnMVpP?=
 =?utf-8?B?MGs1WFN0b3lwNFZwd20wRFVJdnM5R2tsOENyOEtmZFplci91RU1BTGNDYXBD?=
 =?utf-8?B?NnZaTzYwandzYXN1ekVnSis5d3lBLzB1Vmkyd3Q2ZjZJL29QU2c1TDBvaHJz?=
 =?utf-8?B?TWJkWmRFNDlIWEZvc1BiNmV1S2J4NUxuTU5yRlQ0eHBKL01YV0Q2TElaNlFM?=
 =?utf-8?Q?GsUvCscjYDEr+A1Qg6OhZyxxXXTYfCGSFrZCZpB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DB9E7BA48157D4A8E6F07C397D7B3B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3a685c1-8879-4f51-b411-08d96d49e1f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PhFURO3WDi0vQjxjCtBiNW/wvfU5f8JUBDOTlkwzEvr8ZyoQXDjtJ0OD7mLVsLMt/MQ/nUzw+UpohGvEkujjgRfeCNxampQauPYB7uohqa6dWlJD1sRs+qn6s0PAbCKtC3fSTislQCSd3MatDSEH3uYKdRY5aqCHx3UO1hQsvbH6mF/I6NiohU8Mz8b6nUPda7qk1y6uSqlZloQacpVl+mplu2jQd/z6GakMQNzqurEFeqXR2q0POe+Qpev3Wv/T3CnrUBP2Ti2x7+9LQDSZ2SnjBzNRC6gBwt6lU4+2ct0zcSsE3WLP1cWQhyVA59AbnCLWKaFupsLToCB8yHXXMH1S884vgaphm+yJEom2e+/lExWeH8sAjwIXWrXTxHhsOzqVVxfnr9M13iUAgmuylz7T1JIO71Iunc68UdqAIpRnRkmtJwcZuWRhsH3K5aRjP7c4R6+HKv1v7EIMeYAjFfo8INfHSFbyMKP0mRAlUpC1elcx+cIA3XqCDydhbi5NeCcRvXY3iibVZevCR4X041rq3i3HV1B4ecT8Kx1zu6voq8eWkhgT7d5wJYz6XY36P96z88vjMKeCOQZkivY4+qK0jFocvXJ+oL315ivFoe04ft0QUMa3m2nYeMPYJo8OgUXoJC/PIfJwA/bZIQ+kflAgBUURRBWRs50mlMUxnEvVyjsDc6au5lE6sIrc6klaMiP0m58xWWYcSYuq1M0PcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(6862004)(336012)(36860700001)(356005)(478600001)(6512007)(316002)(86362001)(8936002)(54906003)(4326008)(5660300002)(53546011)(36756003)(186003)(2616005)(8676002)(107886003)(70586007)(81166007)(26005)(70206006)(82310400003)(47076005)(82740400003)(83380400001)(6486002)(2906002)(6506007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:10:42.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672f376-092a-468a-7bb7-08d96d49e72b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4262

SGkgSnVsaWVuLA0KDQo+IE9uIDEgU2VwIDIwMjEsIGF0IDEzOjU1LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMDEvMDkvMjAyMSAxMzo0
MywgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4gSW50cm9kdWNlIG5ldyBYZW4gY29tbWFuZCBsaW5l
IHBhcmFtZXRlciBjYWxsZWQgInBtdV9hY2Nlc3MiLg0KPj4gVGhlIGRlZmF1bHQgdmFsdWUgaXMg
InRyYXAiOiBYZW4gdHJhcHMgUE1VIGFjY2Vzc2VzLg0KPj4gSW4gY2FzZSBvZiBzZXR0aW5nIHBt
dV9hY2Nlc3MgdG8gIm5hdGl2ZSIsIFhlbiBkb2VzIG5vdCB0cmFwDQo+PiBQTVUgYWNjZXNzZXMg
YWxsb3dpbmcgYWxsIHRoZSBndWVzdHMgdG8gYWNjZXNzIFBNVSByZWdpc3RlcnMuDQo+PiBIb3dl
dmVyLCBndWVzdHMgY2Fubm90IG1ha2UgdXNlIG9mIFBNVSBvdmVyZmxvdyBpbnRlcnJ1cHRzIGFz
DQo+PiBQTVUgdXNlcyBQUEkgd2hpY2ggWGVuIGNhbm5vdCByb3V0ZSB0byBndWVzdHMuDQo+PiBU
aGlzIG9wdGlvbiBpcyBvbmx5IGludGVuZGVkIGZvciBkZXZlbG9wbWVudCBhbmQgdGVzdGluZyBw
dXJwb3Nlcy4NCj4+IERvIG5vdCB1c2UgdGhpcyBpbiBwcm9kdWN0aW9uIHN5c3RlbS4NCj4gSSBh
bSBhZnJhaWQgeW91ciBvcHRpb24gaXMgbm90IHNhZmUgZXZlbiBpbiBkZXZlbG9wbWVudCBzeXN0
ZW0gYXMgYSB2Q1BVIG1heSBtb3ZlIGJldHdlZW4gcENQVXMuDQo+IA0KPiBIb3dldmVyLCBldmVu
IGlmIHdlIHJlc3RyaWN0ZWQgdGhlIHVzZSB0byBwaW5uZWQgdkNQVSAqYW5kKiBkZWRpY2F0ZWQg
cENQVSwgSSBhbSBub3QgY29udmluY2VkIHRoYXQgZXhwb3NpbmcgYW4gaGFsZiBiYWNrZWQgUE1V
ICh0aGUgb3ZlcmZsb3cgaW50ZXJydXB0IHdvdWxkIG5vdCB3b3JrKSB0byB0aGUgZ3Vlc3QgaXMg
dGhlIHJpZ2h0IHNvbHV0aW9uLiBUaGlzIGxpa2VseSBtZWFucyB0aGUgZ3Vlc3QgT1Mgd291bGQg
bmVlZCB0byBiZSBtb2RpZmllZCBhbmQgdGhlcmVmb3JlIHRoZSB1c2FnZSBvZiB0aGlzIG9wdGlv
biBpcyBmYWlybHkgbGltaXRlZC4NCj4gDQo+IFNvIEkgdGhpbmsgdGhlIGZpcnN0IHN0ZXBzIGFy
ZToNCj4gIDEpIE1ha2UgdGhlIFBQSSB3b3JrLiBUaGVyZSB3YXMgc29tZSBhdHRlbXB0IGluIHRo
ZSBwYXN0IGZvciBpdCBvbiB4ZW4tZGV2ZWwuIFlvdSBjb3VsZCBoYXZlIGEgbG9vay4NCj4gIDIp
IFByb3ZpZGUgUE1VIGJpbmRpbmdzDQo+IA0KPiBXaXRoIHRoYXQgaW4gcGxhY2UsIHdlIGNhbiBk
aXNjdXNzIGhvdyB0byBleHBvc2UgdGhlIFBNVSBldmVuIGlmIGl0IGlzIHVuc2FmZSBpbiBzb21l
IGNvbmRpdGlvbnMuDQoNCldpdGggdGhvc2UgbGltaXRhdGlvbnMsIHVzaW5nIHRoZSBQTVUgdG8g
bW9uaXRvciB0aGUgc3lzdGVtIHBlcmZvcm1hbmNlcyBvciBvbiBzb21lIHNwZWNpZmljIHVzZSBj
YXNlcyBpcyBzdGlsbCByZWFsbHkgdXNlZnVsLg0KV2UgYXJlIHVzaW5nIHRoYXQgdG8gZG8gc29t
ZSBiZW5jaG1hcmtzIG9mIFhlbiBvciBvZiBzb21lIGFwcGxpY2F0aW9ucyB0byBjb21wYXJlIHRo
ZSBiZWhhdmlvdXIgdG8gYSBuYXRpdmUgc3lzdGVtIG9yDQphbmFseXNlIHRoZSBwZXJmb3JtYW5j
ZXMgb2YgWGVuIGl0c2VsZiAoaHlwZXJjYWxscyxjb250ZXh0IHN3aXRjaCDigKZldGMpDQoNClRo
ZSBzdGVwcyB5b3UgYXJlIG1lbnRpb25pbmcgZG8gbWFrZSBzZW5zZSBidXQgdXNpbmcgdGhlIFBN
VSB3aXRob3V0IHRob3NlIGtub3dpbmcgdGhlIGxpbWl0YXRpb25zIGlzIGFsc28gdmVyeSB1c2Vm
dWwuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFs
IE9yemVsIDxtaWNoYWwub3J6ZWxAYXJtLmNvbT4gPiAtLS0NCj4+ICBkb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MgfCAxOCArKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL2Fy
bS90cmFwcy5jICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0NCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4+IGluZGV4IGIxNzU2NDVmZGUuLjAzNjM3
YTlmNmQgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MN
Cj4+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPj4gQEAgLTE4MTMs
NiArMTgxMywyNCBAQCBwYWdpbmcgY29udHJvbHMgYWNjZXNzIHRvIHVzZXJtb2RlIGFkZHJlc3Nl
cy4NCj4+ICAjIyMgcGxlX3dpbmRvdyAoSW50ZWwpDQo+PiAgPiBgPSA8aW50ZWdlcj5gDQo+PiAg
KyMjIyBwbXVfYWNjZXNzIChhcm0pDQo+PiArPiBgPSB0cmFwIHwgbmF0aXZlYA0KPj4gKw0KPj4g
Kz4gRGVmYXVsdDogYHRyYXBgDQo+PiArDQo+PiArQ29udHJvbHMgZm9yIGFjY2Vzc2luZyBQZXJm
b3JtYW5jZSBNb25pdG9yIFVuaXQgKFBNVSkuDQo+PiArDQo+PiArQnkgZGVmYXVsdCBYZW4gdHJh
cHMgUGVyZm9ybWFuY2UgTW9uaXRvciBhY2Nlc3Nlcy4NCj4+ICtXaGVuIHNldHRpbmcgcG11X2Fj
Y2VzcyB0byBgbmF0aXZlYCwgWGVuIGRvZXMgbm90IHRyYXAgUE1VIGFjY2Vzc2VzIGFsbG93aW5n
DQo+PiArdGhlIGd1ZXN0cyB0byBhY2Nlc3MgUE1VIHJlZ2lzdGVycy4gVGhpcyBvcHRpb24gaXMg
aW50ZW5kZWQgdG8gYWlkIG1vbml0b3JpbmcNCj4+ICthbmQgbWVhc3VyaW5nIHRoZSBwZXJmb3Jt
YW5jZS4gU2V0dGluZyBwbXVfYWNjZXNzIHRvIGBuYXRpdmVgIGFsbG93cw0KPj4gK2FsbCB0aGUg
Z3Vlc3RzIHRvIGFjY2VzcyBQTVUsIGhvd2V2ZXIsIHRoZXJlIGlzIG5vIG1lY2hhbmlzbSBmb3Ig
Zm9yd2FyZGluZw0KPj4gK1BNVSBvdmVyZmxvdyBpbnRlcnJ1cHQgcmVxdWVzdHMuDQo+PiArDQo+
PiArKldhcm5pbmcqDQo+PiArVGhpcyBvcHRpb24gaXMgb25seSBpbnRlbmRlZCBmb3IgZGV2ZWxv
cG1lbnQgYW5kIHRlc3RpbmcgcHVycG9zZXMuDQo+PiArRG8gbm90IHVzZSB0aGlzIGluIHByb2R1
Y3Rpb24gc3lzdGVtLg0KPj4gKw0KPj4gICMjIyBwc3IgKEludGVsKQ0KPj4gID4gYD0gTGlzdCBv
ZiAoIGNtdDo8Ym9vbGVhbj4gfCBybWlkX21heDo8aW50ZWdlcj4gfCBjYXQ6PGJvb2xlYW4+IHwg
Y29zX21heDo8aW50ZWdlcj4gfCBjZHA6PGJvb2xlYW4+IClgDQo+PiAgZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+IGluZGV4IDIxOWFi
M2MzZmIuLmQzMGU3OGI0ZDYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+IEBAIC0zNCw2ICszNCw3IEBADQo+PiAg
I2luY2x1ZGUgPHhlbi9zeW1ib2xzLmg+DQo+PiAgI2luY2x1ZGUgPHhlbi92ZXJzaW9uLmg+DQo+
PiAgI2luY2x1ZGUgPHhlbi92aXJ0dWFsX3JlZ2lvbi5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vd2Fy
bmluZy5oPg0KPj4gICAgI2luY2x1ZGUgPHB1YmxpYy9zY2hlZC5oPg0KPj4gICNpbmNsdWRlIDxw
dWJsaWMveGVuLmg+DQo+PiBAQCAtNzcsMTIgKzc4LDE5IEBAIHN0YXRpYyBpbnQgZGVidWdfc3Rh
Y2tfbGluZXMgPSA0MDsNCj4+ICAjZGVmaW5lIHN0YWNrX3dvcmRzX3Blcl9saW5lIDQNCj4+ICAj
ZW5kaWYNCj4+ICArc3RhdGljIGNvbnN0IGNoYXIgX19pbml0Y29uc3Qgd2FybmluZ19wbXVfYWNj
ZXNzW10gPQ0KPj4gKyAgICAiV0FSTklORzogUE1VIEFDQ0VTU0VTIEFSRSBOT1cgRU5BQkxFRFxu
Ig0KPj4gKyAgICAiVGhpcyBvcHRpb24gaXMgaW50ZW5kZWQgdG8gYWlkIG1vbml0b3JpbmcgYW5k
IG1lYXN1cmluZ1xuIg0KPj4gKyAgICAidGhlIHBlcmZvcm1hbmNlIGJ5IGFsbG93aW5nIHRoZSBn
dWVzdHMgdG8gYWNjZXNzIFBNVSByZWdpc3RlcnMuXG4iDQo+PiArICAgICJJdCBoYXMgaW1wbGlj
YXRpb25zIG9uIHRoZSBzZWN1cml0eSBvZiB0aGUgc3lzdGVtLlxuIg0KPj4gKyAgICAiUGxlYXNl
ICpETyBOT1QqIHVzZSB0aGlzIGluIHByb2R1Y3Rpb24uXG4iOw0KPj4gKw0KPj4gIGludGVnZXJf
cGFyYW0oImRlYnVnX3N0YWNrX2xpbmVzIiwgZGVidWdfc3RhY2tfbGluZXMpOw0KPj4gICAgc3Rh
dGljIGVudW0gew0KPj4gIAlUUkFQLA0KPj4gIAlOQVRJVkUsDQo+PiAtfSB2d2ZpOw0KPj4gK30g
dndmaSwgcG11X2FjY2VzczsNCj4+ICAgIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3Z3ZmkoY29u
c3QgY2hhciAqcykNCj4+ICB7DQo+PiBAQCAtOTUsNiArMTAzLDI5IEBAIHN0YXRpYyBpbnQgX19p
bml0IHBhcnNlX3Z3ZmkoY29uc3QgY2hhciAqcykNCj4+ICB9DQo+PiAgY3VzdG9tX3BhcmFtKCJ2
d2ZpIiwgcGFyc2VfdndmaSk7DQo+PiAgK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX3BtdV9hY2Nl
c3MoY29uc3QgY2hhciAqcykNCj4+ICt7DQo+PiArICAgIGlmICggIXN0cmNtcChzLCAibmF0aXZl
IikgKQ0KPj4gKyAgICAgICAgcG11X2FjY2VzcyA9IE5BVElWRTsNCj4+ICsgICAgZWxzZQ0KPj4g
KyAgICAgICAgcG11X2FjY2VzcyA9IFRSQVA7DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4g
K30NCj4+ICtjdXN0b21fcGFyYW0oInBtdV9hY2Nlc3MiLCBwYXJzZV9wbXVfYWNjZXNzKTsNCj4+
ICsNCj4+ICtzdGF0aWMgaW50IF9faW5pdCB1cGRhdGVfcG11X2FjY2Vzcyh2b2lkKQ0KPj4gK3sN
Cj4+ICsgICAgaWYgKCBwbXVfYWNjZXNzID09IE5BVElWRSApDQo+PiArICAgIHsNCj4+ICsgICAg
ICAgIFdSSVRFX1NZU1JFRyhSRUFEX1NZU1JFRyhNRENSX0VMMikgJn4gKEhEQ1JfVFBNfEhEQ1Jf
VFBNQ1IpLCBNRENSX0VMMik7DQo+PiArICAgICAgICB3YXJuaW5nX2FkZCh3YXJuaW5nX3BtdV9h
Y2Nlc3MpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICtf
X2luaXRjYWxsKHVwZGF0ZV9wbXVfYWNjZXNzKTsNCj4+ICsNCj4+ICByZWdpc3Rlcl90IGdldF9k
ZWZhdWx0X2hjcl9mbGFncyh2b2lkKQ0KPj4gIHsNCj4+ICAgICAgcmV0dXJuICAoSENSX1BUV3xI
Q1JfQlNVX0lOTkVSfEhDUl9BTU98SENSX0lNT3xIQ1JfRk1PfEhDUl9WTXwNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

