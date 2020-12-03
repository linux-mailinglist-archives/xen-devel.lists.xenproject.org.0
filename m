Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FC2CCD5C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 04:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43083.77504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkfOE-0000Iv-K1; Thu, 03 Dec 2020 03:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43083.77504; Thu, 03 Dec 2020 03:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkfOE-0000I3-G3; Thu, 03 Dec 2020 03:34:42 +0000
Received: by outflank-mailman (input) for mailman id 43083;
 Thu, 03 Dec 2020 03:34:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9WK=FH=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kkfOC-0000Hy-E0
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 03:34:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37105a36-fcce-414d-a4ea-a7276788f817;
 Thu, 03 Dec 2020 03:34:36 +0000 (UTC)
Received: from AM0PR07CA0005.eurprd07.prod.outlook.com (2603:10a6:208:ac::18)
 by PA4PR08MB6270.eurprd08.prod.outlook.com (2603:10a6:102:f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 03:34:34 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ac:cafe::e7) by AM0PR07CA0005.outlook.office365.com
 (2603:10a6:208:ac::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9 via Frontend
 Transport; Thu, 3 Dec 2020 03:34:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:34:33 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Thu, 03 Dec 2020 03:34:33 +0000
Received: from 349f6f0cdda8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8857B516-DA64-4196-93EE-332D406E0E7D.1; 
 Thu, 03 Dec 2020 03:34:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 349f6f0cdda8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 03:34:28 +0000
Received: from DB7PR08MB3753.eurprd08.prod.outlook.com (2603:10a6:10:7e::15)
 by DBBPR08MB5932.eurprd08.prod.outlook.com (2603:10a6:10:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 03:34:27 +0000
Received: from DB7PR08MB3753.eurprd08.prod.outlook.com
 ([fe80::9dc1:2537:2a5:718a]) by DB7PR08MB3753.eurprd08.prod.outlook.com
 ([fe80::9dc1:2537:2a5:718a%6]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 03:34:27 +0000
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
X-Inumbo-ID: 37105a36-fcce-414d-a4ea-a7276788f817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjd0b1p0cV12doTQSN6u3hhq7xPLvTEFseVLMDrCvRo=;
 b=g/HLJe/5d0xcC+T6HZkdVXycY1QD3G2xs6brsUWEjIkRy08dx4WAeHFwm8bcNDc6Z4UbZW6Eb6CJ4sFudN99BCED87IF10T5wF1Y8zplpQaeELEL7kRuTUReKHWkAiUgCczgi5pUYcyeWtXY2bWAtexugPV+n9tDqarazxtnwBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKZ0rXIKjgKeGPlBOo4d6lJvHT/YI72XkVKdVMqT++aCgMC4tr32o3F+eKLTy/QmIwdekAIQpkxrFSZZkpstJFfdHLpcFyBXpZSzywdEV0WWd14TgpTntwb7k61tC2HOUFPKAlgUWzELwyXu9dx7yNoJSBxmfoIgo0aMFNDZ6ZxDdDsuBDDIVQQ9SXyTGAk38tAUrlZjPfCkqr3UKrMUnhZkbBqkt6Ob1dZEzhAKF42DDeY9Y5HbW0N8gkIBMbu0T+OHtKDkvQxwiVQGqvcKrnHg9BmHiOYMXljdwj859ihKlhH94xpG8Fx/3YO9+/7+1gy8OSoDqXoVNM5P/ItlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjd0b1p0cV12doTQSN6u3hhq7xPLvTEFseVLMDrCvRo=;
 b=bOK0gdNWZYgcxWaYBFvZ0uGcvoojn3+LHGB1E5zA0ispNA3Awm0BXo6nvAVpREY1owNnERPJUh+uV1rVyXOrZKLNQ0y5/whXJbRlddA7fONEu5O3+WDl3Uo4o4eCWP9gn5vDUmxBmweKcxkyoaquHqvc/s+LQ8Nte3tsvVN84c191mPY1QZHQRNtN72gvyfLK/ey6wWYnt+6vADJoDcgTytrr+ucJeG5auLwfvh873BOmGW2E8+bqpJAiMxA1e8ws+R/9ArGzG4D1kO/oIDYwmfwi7D8mZggpVpJdzZtL7u63Y4YwJr6vbd4/YguqaW8KWjvcuObIs3s7bDUlN1vgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjd0b1p0cV12doTQSN6u3hhq7xPLvTEFseVLMDrCvRo=;
 b=g/HLJe/5d0xcC+T6HZkdVXycY1QD3G2xs6brsUWEjIkRy08dx4WAeHFwm8bcNDc6Z4UbZW6Eb6CJ4sFudN99BCED87IF10T5wF1Y8zplpQaeELEL7kRuTUReKHWkAiUgCczgi5pUYcyeWtXY2bWAtexugPV+n9tDqarazxtnwBQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd
	<nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index:
 AQHWtnF2jWNIb4RgFU+PRE0mwpdPDam/tA6AgAW2ODCAFDcMgIAAINyAgACWHQCAAAX2cIAJ4doAgAB8mZA=
Date: Thu, 3 Dec 2020 03:34:27 +0000
Message-ID:
 <DB7PR08MB3753C88E41582E76E3C9049F9EF20@DB7PR08MB3753.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
 <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
 <AM0PR08MB3747912905438DA6D7FF969C9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <8f47313a-f47a-520d-3845-3f2198fce5b4@xen.org>
 <AM0PR08MB37478D884057C8720ED1023D9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <0a272ffd-24de-2db4-5751-9161cc57cec3@xen.org>
In-Reply-To: <0a272ffd-24de-2db4-5751-9161cc57cec3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6C134F9AD1ED91418BA2296B52978671.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0839a82-a83e-4e34-c6e2-08d8973c5a39
x-ms-traffictypediagnostic: DBBPR08MB5932:|PA4PR08MB6270:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB62708209C7C41B73763337C39EF20@PA4PR08MB6270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2vv1/whwBEhhnfFLzTnruNjAF8tO/HDdCSlauq2He2K61LxE5OS+1haPWzHW0fUJEmg+6ctpY20Th1boRY1UwO/H+BTc/8TvtZCfg2GP61OANRYOLFVQed802tAUGjzVNC7B/UTUihTVklnMk8Qrr9L0YVsMMMm8maWeM6Mvl9uec3ZOFteQGmxKmKxwU+JSNrpjdqmyqDaIORlR5DPygQXyXhZtCnk6TUsG8K88Xnd9a/qApOx+ZaexjVcwaC9g5GAzuiYEEcr1fXPFvwadaF1jxOb5hEa9ayx5jLTFqOdfB2KpNt81KzMWXCLJ5qjfQX4WYLGYkQhIfhryXwW49n93ZjwUjJEcqQqfQ1YKXxibTXdQo+W2QJq+ilsGbhhRdsiZbSWzbxPqu20J/w482Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3753.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(110136005)(53546011)(26005)(52536014)(478600001)(54906003)(86362001)(5660300002)(6506007)(4326008)(83380400001)(7696005)(55016002)(66446008)(8676002)(64756008)(9686003)(33656002)(8936002)(186003)(316002)(2906002)(71200400001)(76116006)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MVhGSkJPUVpQSVV1TnM5Z2dzbXN6QjJmU2hQQURSc24zUWFUZTJhSnBSODcx?=
 =?utf-8?B?d0RybElkUkprMHliZXoyTTVyZzlseGtXV1M0NnFZUWptVlhsVk1MQjYvd2R3?=
 =?utf-8?B?ZldmNC9RM2REN2hYZEIrU2Z6ZW1FNEZEY28rcnQzc0IzUEF3ZzlYYWY0U1Zo?=
 =?utf-8?B?KzRQdlBuMWhtRU0zNUJSVTJiL0c3Njk4SVVRcjlXdXhLZkFxdHNTT0ZHZmFJ?=
 =?utf-8?B?cTFJMjczenlEbVlMWll6U0J0Qmt6aDFlUWV4VnFyQnRQTWlZWnNPelM5Mmo2?=
 =?utf-8?B?azFIUGpEZzcvOEc3M1BCSkJoc0l1dGdGVnp0dkZpZklkdXdPSUE3VDdmeXRr?=
 =?utf-8?B?UlNOTm83Z0dscFZDdm1WK3VybmxKNUFxNDQ1ZHFDekdWeGY4djJIVjVKNEZB?=
 =?utf-8?B?TzhnYlRQZFY4eTBJelEyMnBvbzdqcURCK1pGM2M2UDFRbzNYYytkSEdGTWhV?=
 =?utf-8?B?UlZGV3gxb1NXSkZ1RTVEbzBTSkhIa214dXNsckpCVUEvaUF4eUc1bE0zTVhJ?=
 =?utf-8?B?ZE04dmk5MWxuWmljUGVRUXQ0ZGpPblJMQUtpdTVDREJNbXJwa1AxWDYrM0xU?=
 =?utf-8?B?bnRtUXlSc3ZBWHdOL0Fkeis1WGtVYnV3N1BFUkVVQlhzNm1FbkR4SlNEd2Jr?=
 =?utf-8?B?RW9KK3NKcEdYdkF3dFh2RnhmMytZbXRFS3NwZ1dHK2N4N1hRZXI4Z1BOMnhG?=
 =?utf-8?B?dmZ6OGdUTHNVc283TTh2VmFuYkkvS3IwSTdJb01CdzlEV1FCelY0OUVCWG1m?=
 =?utf-8?B?VW5TZGFTaXhhUnFUajNldXF1SXVKUmdUMmN5ekdyUkNWM3I5SFp3Uk1yWSt0?=
 =?utf-8?B?VTNBNUw4L0VLd2VaNnNCLzYyZFdtUWg4Y2Mrek9nQloreWlzUEZRcG1iRlpi?=
 =?utf-8?B?TnM4SkYvdkVTOU5lNWZrVXBTMzMyazIzWk11ai9VaS9JS3JXVU9nK2lyZ3RC?=
 =?utf-8?B?cnFsQ3I2dStjeVhQMHZCWkhjdlhRRjJGUFpKUGxuY3l3Qm1CQkVvZVowQzl2?=
 =?utf-8?B?MVg1dkRmQ3dLNjVMN0QxQVJESGNRRWx5cDIyNWFJUCs5UUxNbnhqUndRSlcr?=
 =?utf-8?B?QWxCK2VGeDF0ZjcyaHI3WG5xaFpwclVIVVZmQ0c4TWd5Z1RKRk5uVW5rOFNF?=
 =?utf-8?B?UXJYdzhIQ3N2cDc0a0tDYzdzS2EvblhtWnQyblB5QjVmUXB0S2ZFajB5T0h3?=
 =?utf-8?B?bEp4YkptL1R6TllTa2xWcVpuZzVTTjFLNEZtRXNqLzVPNG40TGZWZnhvNDVu?=
 =?utf-8?B?T2ttUmsvT1RIWHRPdk5RY0VlUGdlUkhkN0QxSjM0cFJHTEVJMTFCZCtTSURC?=
 =?utf-8?Q?noB9uu0AZPTHA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5932
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af0fe58d-cf11-4056-88fa-08d8973c5669
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GDyir3R2Vwi7z4yWrnq9d9SBN5AQAZJURhSq6AbZ10ytjpE9xDOn15mNRHG+eoJH8Rfr6MmRleprOSd6U2BZfIvamA7iRC8+vc9wEdPYJPSJN4AUaf0Bg+vAjc36Drt78WALFJI1RtAxvPeoBSkcqECpySbixIxvRF7yQf+ZDmRC3A/JrRiXWqFbVpVPVc61nkmHfEMmkVDEts3/aeCy5RqO1CxAKMKdneA2mCMGUCe9Lh7DHRNpWJsFl3CBL0Ut7A7L7qH+sk/D5c9EZj1EsyQCnDw3+TL5+3RzxNKM6asuNdHrMvPJA2gQ4SShrh5A6+E8CUQkfSoE7jZ32pR46NkgNVtRCWWRBH5RE3UBrIb1sZxa5cTzhQZyvVMpcOPadx1P3jbpsq70SZChOFb2eK5S/5BI/N2DkelUCHdosLBiVencITFc1EElfY3NX4C7WW9AIm8rOHTzJWmhTM83Lc3vOlo2TRMhAZvHjNJG5Jo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(5660300002)(47076004)(52536014)(82740400003)(55016002)(9686003)(70206006)(70586007)(356005)(33656002)(110136005)(54906003)(81166007)(316002)(36906005)(8676002)(2906002)(8936002)(83380400001)(186003)(6506007)(53546011)(26005)(7696005)(336012)(86362001)(478600001)(4326008)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:34:33.9933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0839a82-a83e-4e34-c6e2-08d8973c5a39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6270

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjDlubQxMuaciDPml6UgMjoxMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJt
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gQW5kcmUgUHJ6eXdhcmEg
PEFuZHJlLlByenl3YXJhQGFybS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBLYWx5IFhpbiA8S2FseS5YaW5AYXJtLmNvbT47IG5kDQo+IDxuZEBh
cm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4vYXJtOiBBZGQgQ29ydGV4LUE3MyBl
cnJhdHVtIDg1ODkyMSB3b3JrYXJvdW5kDQo+IA0KPiANCj4gDQo+IE9uIDI2LzExLzIwMjAgMTE6
MjcsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjDlubQxMeaciDI25pelIDE4OjU1DQo+ID4+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4gQ2M6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVu
Z0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+PiBBbmRyZSBQ
cnp5d2FyYSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IEthbHkgWGluIDxLYWx5LlhpbkBhcm0uY29tPjsg
bmQNCj4gPj4gPG5kQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06
IEFkZCBDb3J0ZXgtQTczIGVycmF0dW0gODU4OTIxIHdvcmthcm91bmQNCj4gPj4NCj4gPj4gSGkg
V2VpLA0KPiA+Pg0KPiA+PiBZb3VyIGUtbWFpbCBmb250IHNlZW1zIHRvIGJlIGRpZmZlcmVudCB0
byB0aGUgdXN1YWwgcGxhaW4gdGV4dCBvbmUuIEFyZQ0KPiA+PiB5b3Ugc2VuZGluZyB0aGUgZS1t
YWlsIHVzaW5nIEhUTUwgYnkgYW55IGNoYW5jZT8NCj4gPj4NCj4gPg0KPiA+IEl0J3Mgc3RyYW5n
ZSwgSSBhbHdheXMgdXNlIHRoZSBwbGFpbiB0ZXh0Lg0KPiANCj4gTWF5YmUgZXhjaGFuZ2UgZGVj
aWRlZCB0byBtYW5nbGUgdGhlIGUtbWFpbCA6KS4gQW55d2F5LCB0aGlzIG5ldyBtZXNzYWdlDQo+
IGxvb2tzIGZpbmUuDQo+IA0KPiA+DQo+ID4+IE9uIDI2LzExLzIwMjAgMDI6MDcsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+Pj4gSGkgU3RlZmFubywNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+DQo+ID4+Pj4gU2VudDogMjAyMO+/ve+/vTEx77+977+9Mjbvv73vv70gODow
MA0KPiA+Pj4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPj4+PiBDYzogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0u
Y29tPjsNCj4gPj4geGVuLQ0KPiA+Pj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3Rh
YmVsbGluaUBrZXJuZWwub3JnOyBBbmRyZSBQcnp5d2FyYQ0KPiA+Pj4+IDxBbmRyZS5Qcnp5d2Fy
YUBhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsNCj4gPj4+PiBLYWx5IFhpbiA8S2FseS5YaW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29t
Pg0KPiA+Pj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHhlbi9hcm06IEFkZCBDb3J0ZXgtQTczIGVy
cmF0dW0gODU4OTIxDQo+IHdvcmthcm91bmQNCj4gPj4+Pg0KPiA+Pj4+IFJlc3VtaW5nIHRoaXMg
b2xkIHRocmVhZC4NCj4gPj4+Pg0KPiA+Pj4+IE9uIEZyaSwgMTMgTm92IDIwMjAsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+Pj4+Pj4gSGksDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMDkvMTEvMjAyMCAw
ODoyMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+Pj4gQ05UVkNUX0VMMCBvciBDTlRQQ1Rf
RUwwIGNvdW50ZXIgcmVhZCBpbiBDb3J0ZXgtQTczIChhbGwgdmVyc2lvbnMpDQo+ID4+Pj4+Pj4g
bWlnaHQgcmV0dXJuIGEgd3JvbmcgdmFsdWUgd2hlbiB0aGUgY291bnRlciBjcm9zc2VzIGEgMzJi
aXQgYm91bmRhcnkuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBVbnRpbCBub3csIHRoZXJlIGlzIG5v
IGNhc2UgZm9yIFhlbiBpdHNlbGYgdG8gYWNjZXNzIENOVFZDVF9FTDAsDQo+ID4+Pj4+Pj4gYW5k
IGl0IGFsc28gc2hvdWxkIGJlIHRoZSBHdWVzdCBPUydzIHJlc3BvbnNpYmlsaXR5IHRvIGRlYWwg
d2l0aA0KPiA+Pj4+Pj4+IHRoaXMgcGFydC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IEJ1dCBmb3Ig
Q05UUENULCB0aGVyZSBleGlzdHMgc2V2ZXJhbCBjYXNlcyBpbiBYZW4gaW52b2x2aW5nIHJlYWRp
bmcNCj4gPj4+Pj4+PiBDTlRQQ1QsIHNvIGEgcG9zc2libGUgd29ya2Fyb3VuZCBpcyB0aGF0IHBl
cmZvcm1pbmcgdGhlIHJlYWQgdHdpY2UsDQo+ID4+Pj4+Pj4gYW5kIHRvIHJldHVybiBvbmUgb3Ig
dGhlIG90aGVyIGRlcGVuZGluZyBvbiB3aGV0aGVyIGEgdHJhbnNpdGlvbiBoYXMNCj4gPj4+Pj4+
PiB0YWtlbiBwbGFjZS4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55
IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9u
IGEgcmVsYXRlZCB0b3BpYywgZG8gd2UgbmVlZCBhIGZpeCBzaW1pbGFyIHRvIExpbnV4IGNvbW1p
dA0KPiA+Pj4+Pj4gNzVhMTlhMDIwMmRiICJhcm02NDogYXJjaF90aW1lcjogRW5zdXJlIGNvdW50
ZXIgcmVnaXN0ZXIgcmVhZHMgb2NjdXINCj4gPj4+Pj4+IHdpdGggc2VxbG9jayBoZWxkIj8NCj4g
Pj4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IEkgdGFrZSBhIGxvb2sgYXQgdGhpcyBMaW51eCBjb21t
aXQsIGl0IHNlZW1zIHRvIHByZXZlbnQgdGhlIHNlcS1sb2NrIHRvIGJlDQo+ID4+Pj4+IHNwZWN1
bGF0ZWQuICBVc2luZyBhbiBlbmZvcmNlIG9yZGVyaW5nIGluc3RlYWQgb2YgSVNCIGFmdGVyIHRo
ZSByZWFkDQo+IGNvdW50ZXINCj4gPj4+Pj4gb3BlcmF0aW9uIHNlZW1zIHRvIGJlIGZvciBwZXJm
b3JtYW5jZSByZWFzb25zLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJIGhhdmUgZm91bmQgdGhhdCB5b3Ug
aGFkIHBsYWNlZCBhbiBJU0IgYmVmb3JlIHJlYWQgY291bnRlciBpbiBnZXRfY3ljbGVzDQo+ID4+
Pj4+IHRvIHByZXZlbnQgY291bnRlciB2YWx1ZSB0byBiZSBzcGVjdWxhdGVkLiBCdXQgeW91IGhh
dmVuJ3QgcGxhY2VkIHRoZQ0KPiA+PiBzZWNvbmQNCj4gPj4+Pj4gSVNCIGFmdGVyIHJlYWRpbmcu
IElzIGl0IGJlY2F1c2Ugd2UgaGF2ZW4ndCB1c2VkIHRoZSBnZXRfY3ljbGVzIGluIHNlcSBsb2Nr
DQo+ID4+Pj4+IGNyaXRpY2FsIGNvbnRleHQgKE1heWJlIEkgZGlkbid0IGZpbmQgdGhlIHJpZ2h0
IHBsYWNlKT8gU28gc2hvdWxkIHdlIG5lZWQgdG8NCj4gPj4gZml4IGl0DQo+ID4+Pj4+IG5vdywg
b3IgeW91IHByZWZlciB0byBmaXggaXQgbm93IGZvciBmdXR1cmUgdXNhZ2U/DQo+ID4+Pj4NCj4g
Pj4+PiBMb29raW5nIGF0IHRoZSBjYWxsIHNpdGVzLCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB3ZSBu
ZWVkIGFueSBJU0IgYWZ0ZXINCj4gPj4+PiBnZXRfY3ljbGVzIGFzIGl0IGlzIG5vdCB1c2VkIGlu
IGFueSBjcml0aWNhbCBjb250ZXh0LiBUaGVyZSBpcyBhbHNvIGENCj4gPj4+PiBkYXRhIGRlcGVu
ZGVuY3kgd2l0aCB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgaXQuDQo+ID4+DQo+ID4+IEkgYW0gYXNz
dW1pbmcgeW91IGxvb2tlZCBhdCBhbGwgdGhlIHVzZXJzIG9mIE5PVygpLiBJcyB0aGF0IHJpZ2h0
Pw0KPiA+Pg0KPiA+Pj4+DQo+ID4+Pj4gU28gSSBhbSB0aGlua2luZyB3ZSBkb24ndCBuZWVkIGFu
eSBmaXguIEF0IG1vc3Qgd2UgbmVlZCBhbiBpbi1jb2RlDQo+IGNvbW1lbnQ/DQo+ID4+Pg0KPiA+
Pj4gSSBhZ3JlZSB3aXRoIHlvdSB0byBhZGQgYW4gaW4tY29kZSBjb21tZW50LiBJdCB3aWxsIHJl
bWluZCB1cyBpbiBmdXR1cmUNCj4gd2hlbg0KPiA+PiB3ZQ0KPiA+Pj4gdXNlIHRoZSBnZXRfY3lj
bGVzIGluIGNyaXRpY2FsIGNvbnRleHQuIEFkZGluZyBpdCBub3cgd2lsbCBwcm9iYWJseSBvbmx5
IGxlYWQNCj4gdG8NCj4gPj4+IG1lYW5pbmdsZXNzIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLg0K
PiA+Pg0KPiA+PiBJIHJlYWQgdGhpcyBhcyB0aGVyZSB3b3VsZCBiZSBubyBwZXJmb21hbmNlIGlt
cGFjdCBpZiB3ZSBhZGQgdGhlDQo+ID4+IG9yZGVyaW5nIGl0IG5vdy4gRGlkIHlvdSBpbnRlbmQg
dG8gc2F5Pw0KPiA+DQo+ID4gU29ycnkgYWJvdXQgbXkgRW5nbGlzaC4gSSBpbnRlbmRlZCB0byBz
YXkgIkFkZGluZyBpdCBub3cgbWF5IGludHJvZHVjZSBzb21lDQo+ID4gcGVyZm9ybWFuY2UgY29z
dC4gQW5kIHRoaXMgcGVyZm9ybWFuY2UgY29zdCBtYXkgYmUgbm90IHdvcnRoLiBCZWNhdXNlIFhl
bg0KPiA+IG1heSBuZXZlciB1c2UgaXQgaW4gYSBzaW1pbGFyIHNjZW5hcmlvICINCj4gDQo+IERv
bid0IHdvcnJ5ISBJIHRoaW5rIHRoZSBwZXJmb3JtYW5jZSBzaG91bGQgbm90IGJlIG5vdGljZWFi
bGUgaWYgd2UgdXNlDQo+IHRoZSBzYW1lIHRyaWNrIGFzIExpbnV4Lg0KPiANCj4gPj4gSW4gYWRk
aXRpb24sIEFGQUlDVCwgdGhlIHg4NiB2ZXJzaW9uIG9mIGdldF9jeWNsZXMoKSBpcyBhbHJlYWR5
IGFibGUgdG8NCj4gPj4gcHJvdmlkZSB0aGF0IG9yZGVyaW5nLiBTbyB0aGVyZSBhcmUgY2hhbmNl
cyB0aGF0IGNvZGUgbWF5IHJlbHkgb24gaXQuDQo+ID4+DQo+ID4+IFdoaWxlIEkgZG9uJ3QgbmVj
ZXNzYXJpbHkgYWdyZWUgdG8gYWRkIGJhcnJpZXJzIGV2ZXJ5d2hlcmUgYnkgZGVmYXVsdA0KPiA+
PiAodGhpcyBtYXkgaGF2ZSBiaWcgaW1wYWN0IG9uIHRoZSBwbGF0Zm9ybSkuIEkgdGhpbmsgaXQg
aXMgYmV0dGVyIHRvIGhhdmUNCj4gPj4gYW4gYWNjdXJhdGUgbnVtYmVyIG9mIGN5Y2xlcy4NCj4g
Pj4NCj4gPg0KPiA+IEFzIHg4NiBoYWQgZG9uZSBpdCwgSSB0aGluayBpdOKAmXMgb2sgdG8gZG8g
aXQgZm9yIEFybS4gVGhpcyB3aWxsIGtlZXAgYSBmdW5jdGlvbg0KPiA+IGJlaGF2ZXMgdGhlIHNh
bWUgb24gZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMuDQo+IA0KPiBKdXN0IHRvIGJlIGNsZWFyLCBJ
IGFtIG5vdCAxMDAlIHN1cmUgdGhpcyBpcyB3aGF0IEludGVsIGlzIGRvaW5nLg0KPiBBbHRob3Vn
aCB0aGlzIGlzIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGNvbW1lbnQgaW4gdGhlIGNvZGUuDQo+
IA0KPiBAU3RlZmFubywgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBAV2VpLCBhc3N1bWluZyBT
dGVmYW5vIGlzIGhhcHB5IHdpdGggdGhlIHByb3Bvc2FsLCB3b3VsZCB5b3UgYmUgaGFwcHkgdG8N
Cj4gc2VuZCBhIHBhdGNoIGZvciB0aGF0Pw0KPiANCg0KT2YgIGNvdXJzZSwgSSBhbSB3aWxsaW5n
IHRvIGRvIHRoYXQuIEl0IHNlZW1zIHRoZSBlbmZvcmNlX29yZGVyaW5nIHBhdGNoIGhhcyBiZWVu
DQptZXJnZWQuIEFuZCBWaW5jZW56byByZXBvcnRlZCB0aGUgZW5mb3JjZV9vcmRlcmluZyBtZXRo
b2Qgd2lsbCBoYXZlIH40LjUNCnBlcmZvcm1hbmNlIGltcHJvdmVtZW50WzFdIChDb21wYXJlIHRv
IElTQikuIFNvIEkgd2lsbCB1c2UgZW5mb3JjZV9vcmRlcmluZw0KbWV0aG9kIGRpcmVjdGx5IGlu
c3RlYWQgb2YgdXNpbmcgSVNCLg0KDQpbMV1odHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8zLzEz
LzY0NQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

