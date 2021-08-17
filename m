Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4E3EE471
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 04:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167562.305882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFoxj-0007OV-QF; Tue, 17 Aug 2021 02:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167562.305882; Tue, 17 Aug 2021 02:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFoxj-0007MZ-N9; Tue, 17 Aug 2021 02:36:23 +0000
Received: by outflank-mailman (input) for mailman id 167562;
 Tue, 17 Aug 2021 02:36:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5rO=NI=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFoxi-0007MQ-Cs
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 02:36:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c000c6-ff03-11eb-a485-12813bfff9fa;
 Tue, 17 Aug 2021 02:36:20 +0000 (UTC)
Received: from AM6P194CA0064.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::41)
 by HE1PR08MB2891.eurprd08.prod.outlook.com (2603:10a6:7:2b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 17 Aug
 2021 02:36:17 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::1c) by AM6P194CA0064.outlook.office365.com
 (2603:10a6:209:84::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Tue, 17 Aug 2021 02:36:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 02:36:17 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Tue, 17 Aug 2021 02:36:16 +0000
Received: from b7828649fc44.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23659066-E945-4B64-B9EA-74C39AB5D972.1; 
 Tue, 17 Aug 2021 02:36:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7828649fc44.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 02:36:10 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4511.eurprd08.prod.outlook.com (2603:10a6:803:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 02:36:09 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Tue, 17 Aug 2021
 02:36:09 +0000
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
X-Inumbo-ID: e7c000c6-ff03-11eb-a485-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao8tY2uYVPOyB3GRe+jgp5JI2yFOB+llMESktlBYimc=;
 b=qYBmdJIsYJ6j4utDg4O6TCSs423tyuo/VmUExZTKzMpizbc74iUY456c7Tp6Ll3dIwruRty8qbMkarK7T+t9oHNAalgROrWn0Gec8b5xK6VKaEzszm+aG0VwMrty9bPm/KD+aothnZMx85zeMihUJlvwuANeSz0j0zQSs3lu+Do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL3ZYxyq/S0tsI4NZ+kM6Ndc84R6gHHFPoJcZ3WtMbP0f2zWjSG0GpahD10KLwEdZl0fKPugiXNiSBi1pQK5ksPNnHDMNA+ctQwJOpc1g0cVocFwHntAi+54oDkMe5kkW78mrRlhotJs6uds64o9/d5J6Jhx7ZfDgu7a3cSGkyiklkq9ce8diyF68cWqKLRUlhR+mxAvfqC8zYqQA7KTH5ilzf5NdMoqs+KiIRxG19gc8ubZwTwoWK2N7GeXJq5t96bDilwDaXoAekQfk1grx7R3KN7xPtL8CvHBXgYhXu5atds0dNbucCG1DG04xhGIS/dvuhK4l8LtQjzHqGKa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao8tY2uYVPOyB3GRe+jgp5JI2yFOB+llMESktlBYimc=;
 b=fP54ShHFcMxn7/U6lnMuRr1FR0hCetAYZMxeqYQrwr9MEGGfvpcgZuts6+E5W/yYu1otpjbxssYDlyA0KZ0E26ghleK8ARrs8/INh662+zOpsh1nhp6RcbT780wKAgRaaAVw72MuoPKDmMWhEOjP3Wg7jzR9H1H8m/nMHvGBM+IMTyaYvoO/ApWSs6SP4tyNAaBV5N0DW168/xzmlPmnXUFDYkJMdKLjhKQpCRKtPdsDZfALLBT7OV/x7p9S1cg+bOwbfd1UwVbyz3DL99v5IcGTGyEEmkVhcTUIInj2132PihdS7hUJkPCqxgSujo3GgbrB3zSHYEf/YOivkqAE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao8tY2uYVPOyB3GRe+jgp5JI2yFOB+llMESktlBYimc=;
 b=qYBmdJIsYJ6j4utDg4O6TCSs423tyuo/VmUExZTKzMpizbc74iUY456c7Tp6Ll3dIwruRty8qbMkarK7T+t9oHNAalgROrWn0Gec8b5xK6VKaEzszm+aG0VwMrty9bPm/KD+aothnZMx85zeMihUJlvwuANeSz0j0zQSs3lu+Do=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 10/10] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH V4 10/10] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXg5tmckYE8huhnkmylKsegZp2dKtxiU+AgARGWQCAALjdgIAAkPyA
Date: Tue, 17 Aug 2021 02:36:08 +0000
Message-ID:
 <VE1PR08MB521514132EE85568ECB8C34BF7FE9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-11-penny.zheng@arm.com>
 <11d38943-444d-80d1-5fd5-98cbc24e6b7e@xen.org>
 <VE1PR08MB52155AED4031436410203304F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <dbed44c8-13c9-6f2e-1f18-44eb3f74c67f@xen.org>
In-Reply-To: <dbed44c8-13c9-6f2e-1f18-44eb3f74c67f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A8D355EBCA3A1141940E60DE8AD9CFDF.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9f4b97e0-74d3-49e8-9b71-08d96127ca18
x-ms-traffictypediagnostic: VI1PR08MB4511:|HE1PR08MB2891:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2891BBFD1A10CCBA46B16C0DF7FE9@HE1PR08MB2891.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v3Wgt1VmjPxKy0jB7v67MTL0KbbZinI6Pb/LlviG25ApFt7/6ozzBLWafxOd8vw6gKRPObgORqOJUFx4O+vb50qX37NceSTndo/bq6Skt8rXDY1ekXsOodFqgbtC+lRggad/6vYNzsV2qdxFCVsWoLNUKqQvE7ZKHskFkKtD4iTnXT9H0R3D/M7KQx+PpbaWIjeTFE4htm1+HKJc49Y6nNbHoglRgdBpdam20//nFW+MbTtuC7QeNLluz14p8TMx34+zEZhHfQOFDfrsxilMUa9eZKj6lBD67PKz9wWyK6QnEyEtWfkGoufqlO362orw90wQC+O93P9jnPiffYTNqUmofQRgub1YNOtAkze13D1doVjx1DRTxCArNQfoqy/KDHxdzC0mGUW18xS4Q0jztB5RK9rDoW8vddzRFdGpVvbmTP45Q2ZG55hseGxwXIKmiDlE7ZdZgmDPJtjLSVcI9M5SYt/7NG9PcCK6FLdqRkpT9rrx7S1GsG9u0bWWDIC2cGbkZi14zGowluceEVRTL2keWBoq6TexzUPhCrgPO9Z49BQ79Kuw4vXBWlJP8UqEwJDAuEC8euQERN5QB0pUMNV9QZVCqtslR8ZpSBpXuYKiVRq4n6LRUpkvq+Jb7YWnV13lOrsgBWkwMgS6qNJAZ8YkU4C3OkqMXUAO0ZPznheJkudABCbyJjMnnPPsmztlLNweDDMW0kHg3Eq5Tq0qFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(7696005)(66556008)(110136005)(5660300002)(8676002)(64756008)(186003)(4326008)(9686003)(122000001)(86362001)(33656002)(8936002)(38100700002)(26005)(66476007)(2906002)(66446008)(38070700005)(54906003)(76116006)(55016002)(316002)(478600001)(71200400001)(6506007)(52536014)(53546011)(66946007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzZUK1hNVkpnb2YrSzRTQVl3V29ZSjlXYzZhdEdVTGhiVDZtekc0ZnhlODAr?=
 =?utf-8?B?OXlSbmcyUE8wMWRCQXBaUlBSbHBCaVJKNlFxeWVBQ0piQVM3RWFHRGF6WDd3?=
 =?utf-8?B?b0hSa2JNdGhWelovZkpjOEJudTA5bStXcnAycTluK0xqYk52MkZXWG5LL2hU?=
 =?utf-8?B?MzR3RTlWNEF0cno2WEIvMmZ1M0dGK0ZwQ3hIV081cnhYaW9neFNGeEtlSDNS?=
 =?utf-8?B?SmkzbFlTWXRJR2JpQk1iNEx1WUs5NldhbVJKa3VSRTRZbEdoSk1WZllHRWVG?=
 =?utf-8?B?TE51UXNTc0F0a2lDZVZMZzJMa0xDbXltSW92VEk4NkZLT2RpUFZlSTZSY3hT?=
 =?utf-8?B?dVM2SGl2dVpDMlZ2UGw4cEp2bDBJUjcwV2ozVlVmN0RqZmVvakFOd0V6aUxM?=
 =?utf-8?B?MEZBM3BDRHFnRDdpc1JsdTM5LzdpMW9xcGJKVWVwd2tPZC9DZWZUKzF2TDhT?=
 =?utf-8?B?V0NBaDdWRW9xOGtpckJ4OGJTRUxNNDJwRHZza2dCRjB1UStkZTQzb0xZZVhh?=
 =?utf-8?B?UVIzZklGNFBsdHgzMkU0aFlXUkFaYXh0SkJXZXJHOW9YbHVJdUxDdWJRZys4?=
 =?utf-8?B?RzRiRm9Cd2l6YUdlMmhEOEl4MHhidXREQVJuYjIxU2ZTTC9vSmZXVEwzRStu?=
 =?utf-8?B?VUF3bnRzY016SlBRQ0ozM1dKazUrZDVKSnBHVzUzbVNrOU4vN05UUXdkR0VT?=
 =?utf-8?B?M1lmN0dyOTE0RXQ0RUNmYW5veTlLNnNmR2dQdDlYWVM5amowc1I4eVJySlRJ?=
 =?utf-8?B?ME1QdWNuUHNKZUNPTElXeTBpNGY2aDFGT0VPckVXeXh6RlRPbmdYenRPM3hN?=
 =?utf-8?B?aUh5emE5ODdGYmlYQzdQbWdzdllETG5EQmFSWUdnQlpOS2RIRUVkRnRZbzdm?=
 =?utf-8?B?eUQ4Z1RhRXVPU1pURER6dEpGZGVGMkF2eDZ2VUlFcU10aE1XeVhNNjd5ZzlJ?=
 =?utf-8?B?aVllRHJMOFJCamZPeHhpMHBwcFBFSWo2UVVjeUVQbkpZdi92ZDBkWklENWt3?=
 =?utf-8?B?alBJS3ZQYnA1RzhYeUxaOHJxNGVybll5WFRLQzJoOGhDVVRqSmlUOFhaUmdt?=
 =?utf-8?B?QjM1TFFXdTJUZDJUVkdVNUlkb04vZHNwOEVyWEd6RXRteWhSTCtkZitMY1Yw?=
 =?utf-8?B?c2N6dThJZnRTVjNPU3dTbXJSWVFNRWNCT3E4ajVGbExqcjByc3ZjaFZmQTZY?=
 =?utf-8?B?d0JUZit6cG5LL2FNeURKY3FwSTNrVW1YdGp3d2RMdFdLaERTMU5jQVdvNFYv?=
 =?utf-8?B?SWZEclBnK3JVRkMyaVIrN2hVZFZJdGs5UEhoc296ZWJDSEZEQVZuRzc3ZEJn?=
 =?utf-8?B?eUZjUjZld2VGL2xzeVd5a2Z1R2dEOTZ5SHdOV1pzTkJ4M24zanJlNmpwR0Vx?=
 =?utf-8?B?cHBtZ0dNYkZ0bTNuZXZzeVNnYU5IYlp1MGJwQnIrS3FuekVuWkFlbnpZY0lW?=
 =?utf-8?B?MWFTY2ZZRWxTcXhQS2QwdkZTakN4MldXZ2VuTEswU1dPdVhqNmJqYVZvRmJ5?=
 =?utf-8?B?dzhSM3liMFBaN2d4ZW55dDZVMm5SU3BRbFdZaGlWdEdSd1dYUGkwM1ZjdUhW?=
 =?utf-8?B?NFpRUmhmZlV5aStsaEdibzd0MnM1UkIxc2dWOUpaRGw2c2pyMFNqT3ZYSUNl?=
 =?utf-8?B?R1h0aUxtZGFvdzVEMzJ4WFh3eUFvZDQ4d1pKU2Q3ZnM1aHZ4Y09CY0RQWVpE?=
 =?utf-8?B?UTZBZm15WnNITjVLaGcxb25QbFltM2MyekpGQkEzdEJLazB1R3FGZVQyR3VG?=
 =?utf-8?Q?gwro+2W+l+iQU1C70Fpwht7gC0HLr4NvVfy9jxV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4611fc5a-965d-4d8e-4270-08d96127c544
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F/JDHDI2X//gF4bVXtz6jtt13Qld3No8BF1ULBxEKCL1A+s6V8+JJMTOruq0OgpY6lrsHGIYBLIVFXCa/XrGqb4FefH+4ZudaD/2kzRfdKUHJb9L8rdvL0PiYLsj+1CyAPWeZ/qsnYrvZEKoFXLimvi/vNxJIMpefwoVdinZgPycuWNEWt8NW8IxedkTryIXLWdwfALCSD0cUBiPK6MZ8KHRfwnJLc4VHDMyOpxTiRQjwtuqjfZiDoO/26M2kpndAEwd8lfT1xNim1JC3RKC4CTWteJ1AfLeZGUjSFt5X5cputXvqndNW3W6F41iL2eOORGPjr4ukPiKXk30N5hItxXjDvGCMddhsrCJnAYDkxCTLF0KWyCdtARp5MB3YJEwWV2v6g87cK0SIEld+PBa05zJTMZp5w+9qIYW/BBEuJg6vmc3iZmIvEVq7gBnLPC8cp3+2YEVKeL2VojS53+WWoA/URTjOMPDdZPc3gCa673ogx7UlNTA1qi+sLRLUr4aC0mdyd6H6cJOyzPsR4+Mvyf8fFkoetYL6DVfcn79m5nNvGNc1URVOt3abgdzyXMWZXVOkvY3rlAqHp603GBMBDAsy/brh0HJhhlIeRCvYoNlSph6cWH0nqIUxDCwQMTUtSynrOLsvRBCbyMhActOAnDCDt8hl3l2tKAIelKzBi8FB9SH7GAqxCT9TZ1G6mnmYGKNcAas6hpbA3rKme4kjQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(52536014)(33656002)(8936002)(53546011)(6506007)(478600001)(54906003)(5660300002)(336012)(8676002)(316002)(4326008)(26005)(186003)(110136005)(7696005)(70206006)(70586007)(81166007)(82310400003)(82740400003)(86362001)(47076005)(55016002)(9686003)(36860700001)(2906002)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 02:36:17.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4b97e0-74d3-49e8-9b71-08d96127ca18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2891

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE3LCAyMDIxIDE6NTUgQU0N
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNo
ZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDEw
LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWxsb2NhdGVfc3RhdGljX21lbW9yeQ0KPiANCj4gDQo+
IA0KPiBPbiAxNi8wOC8yMDIxIDA4OjUxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+ICsgICAg
ICAgICAgICAgICBkLCBiYW5rLCBwYmFzZSwgcGJhc2UgKyBwc2l6ZSk7DQo+ID4+PiArDQo+ID4+
PiArICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICogSXQgc2hhbGwgYmUgbWFwcGVkIHRvIHRo
ZSBmaXhlZCBndWVzdCBSQU0gYWRkcmVzcyByYW1iYXNlW2ldLA0KPiA+Pj4gKyAgICAgICAgICog
QW5kIHVudGlsIGl0IGV4aGF1c3RzIHRoZSByYW1zaXplW2ldLCBpdCB3aWxsIHNlZWsgdG8gdGhl
IG5leHQNCj4gPj4+ICsgICAgICAgICAqIHJhbWJhc2VbaSsxXS4NCj4gPj4+ICsgICAgICAgICAq
Lw0KPiA+Pj4gKyAgICAgICAgd2hpbGUgKCAxICkNCj4gPj4+ICsgICAgICAgIHsNCj4gPj4+ICsg
ICAgICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICAgICAqIFRoZSBjdXJyZW50IHBoeXNpY2Fs
IGJhbmsgaXMgZnVsbHkgbWFwcGVkLg0KPiA+Pj4gKyAgICAgICAgICAgICAqIEhhbmRsZSB0aGUg
bmV4dCBwaHlzaWNhbCBiYW5rLg0KPiA+Pj4gKyAgICAgICAgICAgICAqLw0KPiA+Pj4gKyAgICAg
ICAgICAgIGlmICggZ3NpemUgPj0gcHNpemUgKQ0KPiA+Pj4gKyAgICAgICAgICAgIHsNCj4gPj4+
ICsgICAgICAgICAgICAgICAgaWYgKCAhYXBwZW5kX3N0YXRpY19tZW1vcnlfdG9fYmFuayhkLCAm
a2luZm8tDQo+ID5tZW0uYmFua1tnYmFua10sDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc21mbiwgcHNpemUpICkNCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgICAgICAg
ICAgZ3NpemUgPSBnc2l6ZSAtIHBzaXplOw0KPiA+Pj4gKyAgICAgICAgICAgICAgICBiYW5rKys7
DQo+ID4+PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+Pj4gKyAgICAgICAgICAgIH0NCj4g
Pj4+ICsgICAgICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICAgICAqIEN1cnJlbnQgZ3Vlc3Qg
YmFuayBtZW1vcnkgaXMgbm90IGVub3VnaCB0byBtYXAuDQo+ID4+PiArICAgICAgICAgICAgICog
Q2hlY2sgaWYgd2UgaGF2ZSBhbm90aGVyIGd1ZXN0IGJhbmsgYXZhaWxhYmxlLg0KPiA+Pj4gKyAg
ICAgICAgICAgICAqIGdiYW5rIHJlZmVycyBndWVzdCBtZW1vcnkgYmFuayBpbmRleC4NCj4gPj4+
ICsgICAgICAgICAgICAgKi8NCj4gPj4+ICsgICAgICAgICAgICBlbHNlIGlmICggKGdiYW5rICsg
MikgPiBHVUVTVF9SQU1fQkFOS1MgKSB7DQo+ID4+DQo+ID4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgKzIuIENhbiB5b3UgY2xhcmlmeSBpdD8NCj4gPj4NCj4gPg0KPiA+IGdiYW5rIHJlZmVycyB0
byB0aGUgaW5kZXggb2YgdGhlIGd1ZXN0IGJhbmssIGFuZCBoZXJlIHNpbmNlIGN1cnJlbnQgZ3Vl
c3QNCj4gYmFuayhnYmFuaykNCj4gPiAgIG1lbW9yeSBpcyBub3QgZW5vdWdoIHRvIG1hcCwgdXNl
cnMgc2Vla3MgdG8gdGhlIG5leHQgb25lKGdiYW5rICsgMSksDQo+ID4NCj4gPiBnYmFuayArIDIg
aXMgdGhlIG51bWJlciBvZiByZXF1ZXN0ZWQgZ3Vlc3QgbWVtb3J5IGJhbmtzIHJpZ2h0IG5vdywg
YW5kDQo+ID4gc2hhbGwgbm90IGJlIGxhcmdlciB0aGFuIEdVRVNUX1JBTV9CQU5LUy4NCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFdoZW4gSSByZWFkICIyIiBJIHRlbmQgdG8g
dGhpbmsgd2UgYXJlIGNoZWNraW5nDQo+IHRoZSBiYW5rIGFmdGVyIHRoZSBuZXh0LiBIb3cgYWJv
dXQgd3JpdGluZzoNCj4gDQo+IChnYmFuayArIDEpID49IEdVRVNUX1JBTV9CQU5LUw0KPiANCj4g
b3INCj4gDQo+IGdiYW5rID49IChHVUVTVF9SQU1fQkFOS1MgLSAxKQ0KPiANCj4gVGhpcyBhcyB0
aGUgc2FtZSBlbmQgcmVzdWx0cywgYnV0IHdlIGNoZWNrIHRoZSBpbmRleCByYXRoZXIgdGhhbiB0
aGUgbnVtYmVyIG9mDQo+IGJhbmtzLg0KPiANCj4gQW55d2F5LCBJIGNhbiBzZXR0bGUgd2l0aCAy
IGlmIHlvdSByZWFsbHkgcHJlZmVyIGl0Lg0KPiANCg0KTmFoLCBJJ2xsIHRha2UgeW91ciBzdWdn
ZXN0aW9uLiBZb3VycyBpcyBtb3JlIGdlbmVyaWMuDQogDQo+IENoZWVycywNCj4gDQo+IC0tDQo+
IEp1bGllbiBHcmFsbA0K

