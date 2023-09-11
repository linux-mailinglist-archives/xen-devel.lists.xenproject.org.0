Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299079A5F7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599130.934400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcCY-0004oi-Eg; Mon, 11 Sep 2023 08:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599130.934400; Mon, 11 Sep 2023 08:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcCY-0004m6-BQ; Mon, 11 Sep 2023 08:23:22 +0000
Received: by outflank-mailman (input) for mailman id 599130;
 Mon, 11 Sep 2023 08:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uN2d=E3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qfcCW-0004lv-SN
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:23:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76461c37-507c-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:23:18 +0200 (CEST)
Received: from AS9P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::6)
 by DU0PR08MB7485.eurprd08.prod.outlook.com (2603:10a6:10:355::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 08:23:15 +0000
Received: from AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::7e) by AS9P194CA0006.outlook.office365.com
 (2603:10a6:20b:46d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Mon, 11 Sep 2023 08:23:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT011.mail.protection.outlook.com (100.127.140.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.14 via Frontend Transport; Mon, 11 Sep 2023 08:23:14 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Mon, 11 Sep 2023 08:23:14 +0000
Received: from c8cc6428193f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF2A81DB-2802-449F-9E06-228C356ED7B7.1; 
 Mon, 11 Sep 2023 08:22:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8cc6428193f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 08:22:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8975.eurprd08.prod.outlook.com (2603:10a6:20b:5fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Mon, 11 Sep
 2023 08:22:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:22:33 +0000
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
X-Inumbo-ID: 76461c37-507c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPKr6nNJUDDP/HAmZuVsptS9b2sNJEyG/3qCj7/fGTc=;
 b=ubyJ10to57UH8Gyqt/RCAWZ4kI8VRcge8W+nxz57Zdbx4hRHvhaTC8/uAmPInTh0vLODHIoJ5E5g+j2ADFV7v3YEFQDyI22Z041Ym5UXPEa2tKFrl6pjx/ZGzb3e045VKohZ6JPJoLsRlrqUZDn/5dDWMeU5uVwmfXaC2gAQ1Tc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f48857b73cc9d04
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCfeahVeaaVYfSHenoTMz2fo/uvV6GVseD0CPks1aEnIdeXSZIpnaleEWE+75rRgg43l5D+N+8ZN0wmtIaZZkZ6q2mrfTr46suwUhNTDsuO051PMGSHekJaIL2BilJYKVLp+81N/4tWzEl4SrYl5vjvgkcM4uKhdDeOAPb5IwcaBkTFcxZXcZDLRiaFssUpdoAdXv5nwMtLWLjI/OVNrn+iqMr85ljyd6b0pEi39pM26MZTaEvAepcSrvhgekPP950ntfORyIH2PZHryGvu1l8cXI4JPbRMkg6Ik0JIqVEDxsqG3XoyomHQ02JMVAg27Y1h8aewaM4SIC2H3IttWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPKr6nNJUDDP/HAmZuVsptS9b2sNJEyG/3qCj7/fGTc=;
 b=NsBFxmvhjbeVWt3nJsVboxANe4PWb+bmBIhv+Dn5yiOzL/LZJ9LHAKjYqhOcGvr7sSAZpXcpjsPTjXVlPMqcvzwWfbTp296RzSpe4RbDZTOfvEO67R1Ulqm/HYBcRg9zGtox/mP+F/51K7Wa9oqEzYI5HIWnqjeCvqQaQA7Sst2JrwPCVxYYMFrlDNJ6HKVORc6GKP6vpcR3ngcVAGjxJ6RVbC2DTAnDP9F8QntZzEcDFyhELcwNEPgiHJeHsJLUq3CzMSIsZbH7xPgaug6lMX5WG1+mVZtOcEx0RvfLIdYjVO/pdkhyupytpR5xJDR21v5aDhm4iBFip/1A10aGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPKr6nNJUDDP/HAmZuVsptS9b2sNJEyG/3qCj7/fGTc=;
 b=ubyJ10to57UH8Gyqt/RCAWZ4kI8VRcge8W+nxz57Zdbx4hRHvhaTC8/uAmPInTh0vLODHIoJ5E5g+j2ADFV7v3YEFQDyI22Z041Ym5UXPEa2tKFrl6pjx/ZGzb3e045VKohZ6JPJoLsRlrqUZDn/5dDWMeU5uVwmfXaC2gAQ1Tc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "community.manager@xenproject.org"
	<community.manager@xenproject.org>, "jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
Thread-Topic: Xen 4.18 release: Reminder about feature/code freeze
Thread-Index: AQHZ5EwwAcMhmoMxmE+/YPpcDc9wALAVQ9+AgAAB/ICAAAO2AA==
Date: Mon, 11 Sep 2023 08:22:33 +0000
Message-ID: <5CAF2167-1EFA-4CB8-88E6-62F54B701125@arm.com>
References:
 <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com>
 <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8975:EE_|AM7EUR03FT011:EE_|DU0PR08MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ed363f-dc4c-46f3-f3e5-08dbb2a05856
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DNGQV+LMCwGtp8aHhuRWP8rT2jNPOKKDzhO4+V2E4Sv40aML+U6EFF1yJZ8+Zbfv/EzdEXCj41Oj92ZhW+z3y2xHiMHfJnFa3XJX4NgVUp9W4RBx361ObpWybyIwU0beHTVCMNNbESvZzQnn7OxXAXTDCKjKbAFduBDjDlRWkk9mmiX3KS/WfKYWDZU95+ag/ObqXi9LyOiWCTsuYusyKUNnq6frtTPzv/0gn85rjDmh98Widn779wjTBYYSklQdFIBEjB9LUHyVUaXbHgyn9Y9gu7iqVJ6HK+HtuzWX8O1FTxYiWVBxPuqzvuWySu3ykqePFZmAuvenYxFG9X+/Dohh1qyfFe3vQL8uZkjLv0JRE+bXbaYOGvOyvGEZzEmk1motaqzU3kGljhak7tkjjQeOOgn0bkXc/ZbCijWe+zD2+d9uP4ItGf2DshJQiOzxn8i6zGf4y917DfBq4Ry5BqC9IbOo68J6SjXbzAC1G2TD/jmhYLB5p72eXSy8MBiBZdTYM3xEVTb6hAEIvOcL+yk/kPiSKqaIlEdUPfzvN7AbCiUkGY468wrE9xNxHbpwXYuivhrb/rxlD4X3hC4s8W1BfW+bC9p0C31RmQLJdwEbCIHgpMFhSOSr3HHUdwA1JNTvfaEcHEeXFg4/N8LXzg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199024)(186009)(1800799009)(76116006)(122000001)(53546011)(6506007)(6486002)(71200400001)(38070700005)(33656002)(36756003)(86362001)(38100700002)(6512007)(91956017)(26005)(2906002)(83380400001)(478600001)(66476007)(110136005)(4326008)(41300700001)(5660300002)(8936002)(8676002)(2616005)(66946007)(66446008)(7416002)(64756008)(316002)(54906003)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BDE395AE94A8C4DB06ACECF957B1D57@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8975
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ec711ac-4b69-4943-bf7d-08dbb2a03f74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wm7/E6smlxAtO1LlW/4oA/LEBdGn4EiACqFe7ovv5K5pLzSkd2Eae5RQHChZUlmvJQjaJmqsUvbQqgyXjoyBQIym7RfxLM25gNHkFwPjxvjP/H8ZF2AgHD1vfivRZTpSOwbAYy3fM17MTiWIlFlkWm0cQZnaKgsUR1oX40Cr7bOyp5JnIFdy64lBHy2bOFdSf9iDoTzUSm5gHxJSkwJCGPS/hkwz1TAcvMnGsxFXzb3vX8b9fHOwlPvRAaALHlXAN5FGU6kZdyFmBrLvpSS2TTL4aZQlI7wfjzExBQe7kLXnhxKLM5T5nJEhi1nHl1FxPFxtFkkv1p0wokFoAssshECwIoZ5d0Ta+b6+ZMODckcComzsnPsZTDGuMi9qkLdElv+ADhbF15L+JYuhlw22nOZUh9GVXcmRDVrddRB7bg1+PbOWGuKD+8uePteT+G51L4AqZ0Li5NLNoJj7FqHoIIMxJw8QQcYYfdD+QkJB2MG739wlqQJ/LQFunLI2CazujEhpaILpaTZa+mA5BFgPWUNgMhUGDDfxRNLzItAATUbK9QfpZ9z/vWB333MP7QkFWsLBrc563NWK8CrYVWd9RVVmhRUSgxC5ULjxte3W47qMFYuzWCM+irehAjmmftBhcOJ83gpcysY0f9TrFOYI6UjpbRUswmON92VS131hlqmuz6eBR5X6RbCpOmYizkQSFv07YpuOgx67MiBFlwTsQ6mYrcVyvn0LN1FnaAoXg1jHYvqLODJqs8rCmwvgmjlm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(53546011)(40480700001)(6512007)(6486002)(6506007)(40460700003)(2616005)(26005)(86362001)(33656002)(4326008)(5660300002)(8676002)(8936002)(2906002)(41300700001)(110136005)(70586007)(36756003)(70206006)(81166007)(54906003)(316002)(356005)(82740400003)(478600001)(83380400001)(36860700001)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:23:14.9037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ed363f-dc4c-46f3-f3e5-08dbb2a05856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7485

SGkgSnVsaWVuIGFuZCBBeWFuLA0KDQpSZXBseWluZyB0byBib3RoIGluIHRoZSBzYW1lIGVtYWls
Lg0KDQo+IE9uIFNlcCAxMSwgMjAyMywgYXQgMTY6MDksIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsLm9zc0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAxMSBTZXAgMjAyMyBhdCAw
OTowMiwgQXlhbiBLdW1hciBIYWxkZXIgPGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiBIaSBI
ZW5yeSwNCj4gDQo+IE9uIDExLzA5LzIwMjMgMDI6MDgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IA0K
PiBEaWQgeW91IG1pc3MgIltQQVRDSCB2NiAwMC8xM10geGVuL2FybTogU3BsaXQgTU1VIGNvZGUg
YXMgdGhlIHByZXByYXRpb24gDQo+IG9mIE1QVSB3b3JrIiA/DQo+IA0KPiBBRkFJVSBIZW5yeSBs
aXN0ZWQgYWxsIHRoZSBjcml0aWNhbCBzZXJpZXMgZm9yIDQuMTguDQoNClllcyBKdWxpZW7igJlz
IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4gSSBvbmx5IGxpc3RlZCBjcml0aWNhbC9ibG9ja2Vy
IGl0ZW1zLg0KDQo+IENhbiB5b3UgZXhwbGFpbiB3aHkgZG8geW91IHRoaW5rIHRoaXMgaXMgb25l
Pw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSXQgc2VlIHRoYXQgcGF0Y2hlcyBmcm9tIFtQQVRDSCB2
NiAwNi8xM10geGVuL2FybTogU3BsaXQgcGFnZSB0YWJsZSANCj4gcmVsYXRlZCBjb2RlIHRvIG1t
dS9wdC5jIC4uLiBhcmUgeWV0IHRvIGJlIHJldmlld2VkIGFuZCBjb21taXR0ZWQuDQoNCkFsdGhv
dWdoIEkgd291bGQgc2F5IHRoaXMgc2VyaWVzIGlzIGVsaWdpYmxlIHRvIGJlIGluY2x1ZGVkIGlu
IHRoZSA0LjE4IHJlbGVhc2UNCnNpbmNlIGl0IGlzIGp1c3QgZG9pbmcgc29tZSByZWZhY3Rvcmlu
ZyBpbnN0ZWFkIG9mIGludHJvZHVjaW5nIGEgbmV3IGZlYXR1cmUsIEkNCnRoaW5rIHRoZSBwcm9n
cmVzcyBvZiB0aGUgc2VyaWVzIHNob3VsZCBiZSBjb25zaWRlcmVkIGJhc2VkIG9uIHRoZSBiZXN0
IGVmZm9ydA0KYmFzaXMgb2YgdGhlIHJldmlld2Vycy9tYWludGFpbmVycy4gSSB3aWxsIHRyeSBt
eSBiZXN0IHRvIHJlc3BpbiB0aGUgc2VyaWVzDQp3aGVuZXZlciBwb3NzaWJsZSwgaG9wZWZ1bGx5
IHdlIGNhbiBjYXRjaCB0aGUgcmVsZWFzZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAN
Cj4gLSBBeWFuDQo+IA0KPiA+IEtpbmQgcmVnYXJkcywNCj4gPg0KPiA+IEhlbnJ5DQo+ID4NCg0K
DQo=

