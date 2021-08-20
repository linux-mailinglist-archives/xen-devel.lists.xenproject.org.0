Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3873F2450
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 03:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169145.308983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGt6W-0004NX-Pv; Fri, 20 Aug 2021 01:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169145.308983; Fri, 20 Aug 2021 01:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGt6W-0004LU-IS; Fri, 20 Aug 2021 01:13:52 +0000
Received: by outflank-mailman (input) for mailman id 169145;
 Fri, 20 Aug 2021 01:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGt6V-0004LM-FS
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 01:13:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfa9e422-0153-11ec-a675-12813bfff9fa;
 Fri, 20 Aug 2021 01:13:49 +0000 (UTC)
Received: from DB6PR07CA0106.eurprd07.prod.outlook.com (2603:10a6:6:2c::20) by
 VI1PR08MB2991.eurprd08.prod.outlook.com (2603:10a6:803:40::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Fri, 20 Aug 2021 01:13:47 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::8b) by DB6PR07CA0106.outlook.office365.com
 (2603:10a6:6:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9 via Frontend
 Transport; Fri, 20 Aug 2021 01:13:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 01:13:47 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 20 Aug 2021 01:13:47 +0000
Received: from 3fb2fce188a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24236D37-A61F-433E-8BA2-368A09BE1FC6.1; 
 Fri, 20 Aug 2021 01:13:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fb2fce188a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 01:13:41 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4885.eurprd08.prod.outlook.com (2603:10a6:10:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 01:13:38 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 01:13:38 +0000
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
X-Inumbo-ID: dfa9e422-0153-11ec-a675-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5ea1UXOvj1O6R847UNjM5VFamQbTT0w5FHa5zY6eSk=;
 b=QDODX/MLCFt/6YsVN+H4BkxTIBwzo9IO01XCXNHijGqL0rDoqXgEgt0gGquCTImmgnyC3eW3B5HMtTcb14vJ+aaAkLpWnODySlrkfsq3NAQWnEKSMVabO1zk455A12Z97myyczIOHFxn5OCGkygf1iKIwJGT4xzZw7r2y9CarM8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ09OlaCVtz/GW0MGKssDJGtbVOMIkkPlIGNfnm7qDUM3+Nmw06FBGo6Qprr5W87Wd6IDbmAQyodP8ZLiUmbfvJuMEyLrZOi+P5j3Mhg4aItwG/bTWH8Ce9piBgQJQ6+wvLrtM9/6TP6fa0qPRObnM12v98PWPc2HoWEM/tABFOFYBnvHchCw9BGbb90sPA9R+LBkJaJu7f8lou1lTnVITk8sU2IhZUQAE72UT7Fd+R4dRxU3EQLCjZoToY8dyt1ZqQgUlLipAuimCiyAV4A2V2URlPI7qJoSjAVlkjXq3W3j0n3SlHlpOpGNSqGwYmezYDJjoS8Uwwv/2J7CtvLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5ea1UXOvj1O6R847UNjM5VFamQbTT0w5FHa5zY6eSk=;
 b=dE6UroqhonEkRL7D1EdmyBW5XuQubIAHg9OWNZu6xBF2INGYdZrasqG8h4FPfINfx4YxuHvtbpls8+upd+3tDCvgzOSc3aMxXQfzYKMOjsAmavFzfjIIAmB3RzTomQzRu9zsQA+27aZrkPu3Um1U7cRdZ2srm8TgbYoI0ucq26OsppSVGzNEvcgYKV9KuTmqxpgMS32woQaPKnJqb0BBokHMOWW9Uh8TlkqDmIG9hXF2R+ftcNBRV/r3nHnSlPTsSxzZEVEUObGZLO4X2iWfC+lE94lHQbR/1QOYiP7thYucnmGRaBnyKcehQ4UPUSPK5uHNl4n8qD2R80DlrmpEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5ea1UXOvj1O6R847UNjM5VFamQbTT0w5FHa5zY6eSk=;
 b=QDODX/MLCFt/6YsVN+H4BkxTIBwzo9IO01XCXNHijGqL0rDoqXgEgt0gGquCTImmgnyC3eW3B5HMtTcb14vJ+aaAkLpWnODySlrkfsq3NAQWnEKSMVabO1zk455A12Z97myyczIOHFxn5OCGkygf1iKIwJGT4xzZw7r2y9CarM8=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 02/40] xen/arm: Print a 64-bit number in hex from
 early uart
Thread-Topic: [XEN RFC PATCH 02/40] xen/arm: Print a 64-bit number in hex from
 early uart
Thread-Index: AQHXjpsdCvhq9I7jC0CjJYd+3OMFqat62GyAgADLXdA=
Date: Fri, 20 Aug 2021 01:13:37 +0000
Message-ID:
 <DB9PR08MB6857F0336F818182F419A1F09EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-3-wei.chen@arm.com>
 <a795ae7c-d280-6c51-2606-4305463697cd@xen.org>
In-Reply-To: <a795ae7c-d280-6c51-2606-4305463697cd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DE16AF143AB7D544A79222A86297C0E8.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8298993c-763b-4810-2129-08d96377c306
x-ms-traffictypediagnostic: DBBPR08MB4885:|VI1PR08MB2991:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB29918FCAA0F5CAA5AC33EEF69EC19@VI1PR08MB2991.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k9N44jwcHzF9PnMuFjWug3+4Zcj4sPvjgpLx4WfstehaY2EWiYwlrfuNHnsfE6Ljz6GpW+8EOVIn5iDlDKWOt6MxziWIs7Uyy4fat7DzawBosp8vpv8Ty/7oDXbOdKn/UHk5YVlyE6BL4qagtYR9/nmniAzyUaqXKrEFLgnrMsj+xGuiPAmE9l0MPtp1SQ6RoutBrIg78kHlTmbRPVzWhfK15aM+IG8r4e/3QFwwznUo3CLQjJ5l4wGoDSvLIO7Oqz8ajHYR5QzB7XtmrOtQURs1o2DUYyitysowSjLEtcT2vp4hHGPWXRLigjQNY+N4FU5GIZrJrZWlAr8IfYXKZqwjM4DEppoP6XaL1qS+G7JxjV2WK1ac5T6UizMCVa/Aj4qrdSPtRW3onPd7KTInxMtDwdQvdY4P1uCQCu5XHLkr7MviDWu2THvR+wuA3r4DWtpEg4sX2ddV01bd7R2P3F25KSqcJfjfhr35pC9ggubsgeZCtHu6YLsEvBpNxiujA8x+L87bUCOLz3BsoKT/0dF7Vn3NS6vwVS6g1lB1ZkVD1MBjmCjoqfXHk87cAEKDabwiM/ymv+2vOe+78a3Ss+chTwE6ainqk61SaSzjEa1SviSGhCNPtPv/mQ3RA4OploYE1QNmyaADzltG9KGlcdFTrk0cA74iQuqQYo41F6qHTnT0zJOCO67DbmV8YeXIIYnwOUqoGJYB07c8GMdv/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(4326008)(38070700005)(110136005)(66446008)(52536014)(8936002)(86362001)(8676002)(38100700002)(122000001)(478600001)(66556008)(316002)(5660300002)(7696005)(71200400001)(64756008)(66946007)(53546011)(6506007)(33656002)(83380400001)(55016002)(2906002)(9686003)(26005)(66476007)(76116006)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnNhNWFPRnNjTjNhNDZ1Mkt6cis0bG9BMHJ0T3JxOGxxRzdJZWJrZkdoRmJz?=
 =?utf-8?B?aC9LZjgyUTVHVXE3UFN6T2FZZGxPR0hRblMvc0ZlQThVM3gvTHdUbWFkZ3VL?=
 =?utf-8?B?d1lEdmZwdHc4RHgvZVdaS014ZXAzcWZOR1UwbjNjdG1pd0Z6bVpTbllyS2Ry?=
 =?utf-8?B?SzYxVW5QOXI5VGZiOXNsU1Bjc1ZwQTBONi9zeDdBSExKd3RCSUFLMmpMZnM1?=
 =?utf-8?B?Tjd3TG0vUzE4b3BRVjRiZzA3emNYWVo4aHdkVFQ1bmFycFlvN04yMGpaNnRE?=
 =?utf-8?B?U2dPZVN2OFFwbUNSNndIUnF2OXdYc2RUMThibnpGNS9JOVpMUmVNdnk0WElS?=
 =?utf-8?B?YlZ4RXd0QlFBUWlZRmVvbndFODIzMFNWTXZrSFFrZkdrMTBxUzJ0NjZsVkNV?=
 =?utf-8?B?RG1UeHZrVmxHR3FFRjljT0RRYWxCTTR2NWwxNjBaMHNpU3ZoZmdzRHFsVk1p?=
 =?utf-8?B?d0llNFp6OUVMMEpBd1pRMFViY2EvU0N1Um12aUxNNGdqZW4wR0t0Q2tZSlNo?=
 =?utf-8?B?N29ZN1hEdlExU0RmWWwrbzlEUkt6cHpQUDFQNkdsWGJhZ3EwbmZyTXJCc29z?=
 =?utf-8?B?WmcwL2M5VEVWa2FxNFZUWXovUUMyVEtnUGcxTVhhMEVZdVk0VFBrbHpzZEM0?=
 =?utf-8?B?R0RvWlp5SWR6VDB3bXNRUkI2WG1lUDlFaWJCOW50aDFTWFNEVks5UEtPcXFu?=
 =?utf-8?B?ZWNjdEM4dEMwMCt4V0xxWlRNcVVQRDdtMFAyOCtFdGZXQ0xiSWZsVHB2bzVM?=
 =?utf-8?B?ZjlBcVNGejdDUGI2eng2ajJZR0lwbXo4OURPN3BLRXdNUGh1Tm5WK2lhSFRq?=
 =?utf-8?B?bUREZTNSQ3NlQ2VzTFZobmVweWZXTm4ySkpTcFB5VUp4YStwVkY3bjJUazZ0?=
 =?utf-8?B?T25HOVBYOE82V3FTbXNxV0JMclFsQ2daZk5WYW1NTUhwd2orQjZpR2llb0pJ?=
 =?utf-8?B?a0NvUm0xa2ExTHR1R3d1QXpCM0w0U3dBTmtwVmpFSjdEL0tsbkV3Yy9zTXEy?=
 =?utf-8?B?TVNnUVowK25OdEsyWWpMMlpZR3RCdkdMRjdwQmpaWkxEUG5FWThGRTBtQTNG?=
 =?utf-8?B?OGNIT3loYmZVWmFiVU91ejF6V2FrUVZ4Y25VYk5wYUo0V0RUUFV3UjBoaktL?=
 =?utf-8?B?WWFFREZZY3QzTWJqZWgrTjJ6aExLaVg4NUNkMVlKQzBwT0QyMUx4dWhNRDU1?=
 =?utf-8?B?amJ4YVNaZVpjNG52TDhzYldUOWpySGpJbjc1Qzk2Rm1wc3BTVm1MREVmRXNm?=
 =?utf-8?B?NlFkeTV4aDV3UWFQZE1CV0h0eVlQTHcwZ21ncDVMMHg1NmJBRE5mZ1p6OThX?=
 =?utf-8?B?U3hxMHJ5d1p0UUlkazEzWE4vWDRtV2JCYUdKMVZKOWNwZ1Z5aU4yS1E5Q1RP?=
 =?utf-8?B?UkJJZ25pT282ek5DVjNDUnVyR0RKTkJGbUtCejZqbkgxbmJpdWJaSldnSU9k?=
 =?utf-8?B?Z2Z1L0RBRGhOTVJRVGNsYzNKQlByN0kzc3grUFZCTnRkaFlKVFlFL2lOVkNr?=
 =?utf-8?B?UkZWMXRBeWRKVjhaQXBKQjRpK1gzRlRieHpISFNaVGNMak92KytpaUVmQzk3?=
 =?utf-8?B?ZmZvWXNiRjBCaGhPY1I0TmJzU0JDMFBqellnanFUWFRpZ3lVODY5NEsvWnpJ?=
 =?utf-8?B?c0VxMk0vcHAvMFhZVDRpeWlGckpyOTdxbDZJRFhhRjhYWFNLaTZTYVQ0ZmpT?=
 =?utf-8?B?MnVNbTlJa1hnRmEyZk5pdWdZWThqZDQ0Vk1Ubm9RYW5KV1VRRDlGNm43cE00?=
 =?utf-8?Q?gPsXij3k/Xz6fVE+3p5EZatTpTXbUWF4a05zXXQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4885
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08e42a5b-cf96-470a-a991-08d96377bd6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5dapcmId+rytEg0FW5zveBncMiVC0ZA7t5Y8PLHzdtZQtjoLl5QLH3bb11QKJCR1Uf5PtG+n3OCsJnrkCt3EDEm757SQ1js0ygvOTNPSdES4Q/PHeAIavxznbzQ3ViJA8xeineiSXOqXbFfdGDxegcrgrCkO33CXxCalelr2xbFwtuZ/vRo/eX+ci1iMwsQVs89ovuS+9BytomUVngU7AQNCPJukjZu54f2D4KPfVcPxegqEmF4w9cBe/fGPUoENImUMpI15AtqS4RJA4zczr4c2+7s+hAPP0B1jsvqsWFyQeCre6SYSB06lK9izsb1pVhl/AcSYqJ7Kcy06E6e8wNQEsecADoolSXMrSapeGkERNeUKB3WX5sJDkUg44RuOqKWYuyopSoWvgYjm6/S0oc6WU6jdXAYIe7aLVFx4GWuhYpXWWox2mOhXC0kqzHBED5925DxvrBQWdSkAV88OIc2IcWdZp1FiWSOinQtDkgFbXJMpISnylUU9pFgUFGkeasm7qAZBS7Mai+3lAifyb3o34I1LD6q2WLx9hBarEh8G5HnoBaVf73nHTSJiGKLJhVp6otwcc5M2bb8SKko62MS2jlVgLtfe3SAWfoPOR8pb7DuQcJiNDOz6laPNNfPYFEvaAnjtLAwSe8zW4NUPOYAQksU7dUnyCd0ty5MwYLYgnVFOdQICLtZ5Y3XC0gc1EZ03nCrOmkNvhzElwpcTUQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(136003)(396003)(376002)(346002)(36840700001)(46966006)(53546011)(55016002)(4326008)(6506007)(52536014)(81166007)(83380400001)(82310400003)(5660300002)(110136005)(70586007)(70206006)(186003)(7696005)(478600001)(26005)(8936002)(336012)(356005)(8676002)(33656002)(9686003)(2906002)(47076005)(86362001)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 01:13:47.3782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8298993c-763b-4810-2129-08d96377c306
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2991

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MDUN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDIvNDBdIHhlbi9hcm06IFByaW50IGEgNjQtYml0IG51
bWJlciBpbiBoZXgNCj4gZnJvbSBlYXJseSB1YXJ0DQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAx
MS8wOC8yMDIxIDExOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBDdXJyZW50IHB1dG4gZnVuY3Rp
b24gdGhhdCBpcyB1c2luZyBmb3IgZWFybHkgcHJpbnQNCj4gPiBvbmx5IGNhbiBwcmludCBsb3cg
MzItYml0IG9mIEFBcmNoNjQgcmVnaXN0ZXIuIFRoaXMNCj4gPiB3aWxsIGxvc2Ugc29tZSBpbXBv
cnRhbnQgbWVzc2FnZXMgd2hpbGUgZGVidWdnaW5nDQo+ID4gd2l0aCBlYXJseSBjb25zb2xlLiBG
b3IgZXhhbXBsZToNCj4gPiAoWEVOKSBCcmluZ2luZyB1cCBDUFU1DQo+ID4gLSBDUFUgMDAwMDAw
MDEwMDAwMDEwMCBib290aW5nIC0NCj4gPiBXaWxsIGJlIHRydW5jYXRlZCB0bw0KPiA+IChYRU4p
IEJyaW5naW5nIHVwIENQVTUNCj4gPiAtIENQVSAwMDAwMDEwMCBib290aW5nIC0NCj4gPg0KPiA+
IEluIHRoaXMgcGF0Y2gsIHdlIGluY3JlYXNlZCB0aGUgcHJpbnQgbG9vcHMgYW5kIHNoaWZ0DQo+
ID4gYml0cyB0byBtYWtlIHB1dG4gcHJpbnQgNjQtYml0IG51bWJlci4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiANCj4gQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+ICAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyB8IDkgKysrKystLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4g
aW5kZXggYWExZjg4Yzc2NC4uYjMyNjM5ZDdkNiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+
IEBAIC04NjIsMTcgKzg2MiwxOCBAQCBwdXRzOg0KPiA+ICAgICAgICAgICByZXQNCj4gPiAgIEVO
RFBST0MocHV0cykNCj4gPg0KPiA+IC0vKiBQcmludCBhIDMyLWJpdCBudW1iZXIgaW4gaGV4LiAg
U3BlY2lmaWMgdG8gdGhlIFBMMDExIFVBUlQuDQo+ID4gKy8qIFByaW50IGEgNjQtYml0IG51bWJl
ciBpbiBoZXguICBTcGVjaWZpYyB0byB0aGUgUEwwMTEgVUFSVC4NCj4gDQo+IEFzIHlvdSBtb2Rp
ZnkgdGhlIGxpbmUsIGNhbiB5b3UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gd3JpdGU6DQo+IA0K
PiAvKg0KPiAgICogUHJpbnQgYSA2NC1iaXQuLi4NCj4gDQo+IEFuZCBhbHNvIGRyb3AgdGhlIHNl
Y29uZCBzZW50ZW5jZSBhcyBpdCB0aGUgY29kZSBoYXMgbm90IGJlZW4gUEwwMTENCj4gc3BlY2lm
aWMgZm9yIHF1aXRlIGEgd2hpbGUgbm93Lg0KPiANCg0KT2ssIEkgd2lsbCBkbyBpdCBpbiBuZXh0
IHZlcnNpb24NCg0KPiA+ICAgICogeDA6IE51bWJlciB0byBwcmludC4NCj4gPiAgICAqIHgyMzog
RWFybHkgVUFSVCBiYXNlIGFkZHJlc3MNCj4gPiAgICAqIENsb2JiZXJzIHgwLXgzICovDQo+ID4g
KyNkZWZpbmUgUFJJTlRfTUFTSyAweGYwMDAwMDAwMDAwMDAwMDANCj4gPiAgIHB1dG46DQo+ID4g
ICAgICAgICAgIGFkciAgIHgxLCBoZXgNCj4gPiAtICAgICAgICBtb3YgICB4MywgIzgNCj4gPiAr
ICAgICAgICBtb3YgICB4MywgIzE2DQo+ID4gICAxOg0KPiA+ICAgICAgICAgICBlYXJseV91YXJ0
X3JlYWR5IHgyMywgMg0KPiA+IC0gICAgICAgIGFuZCAgIHgyLCB4MCwgIzB4ZjAwMDAwMDAgICAg
LyogTWFzayBvZmYgdGhlIHRvcCBueWJibGUgKi8NCj4gPiAtICAgICAgICBsc3IgICB4MiwgeDIs
ICMyOA0KPiA+ICsgICAgICAgIGFuZCAgIHgyLCB4MCwgI1BSSU5UX01BU0sgICAgLyogTWFzayBv
ZmYgdGhlIHRvcCBueWJibGUgKi8NCj4gPiArICAgICAgICBsc3IgICB4MiwgeDIsICM2MA0KPiA+
ICAgICAgICAgICBsZHJiICB3MiwgW3gxLCB4Ml0gICAgICAgICAgIC8qIENvbnZlcnQgdG8gYSBj
aGFyICovDQo+ID4gICAgICAgICAgIGVhcmx5X3VhcnRfdHJhbnNtaXQgeDIzLCB3Mg0KPiA+ICAg
ICAgICAgICBsc2wgICB4MCwgeDAsICM0ICAgICAgICAgICAgIC8qIFJvbGwgaXQgdGhyb3VnaCBv
bmUgbnliYmxlIGF0DQo+IGEgdGltZSAqLw0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0K
PiBKdWxpZW4gR3JhbGwNCg==

