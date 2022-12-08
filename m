Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E55646778
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 04:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456781.714598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p37F9-0008Pr-14; Thu, 08 Dec 2022 03:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456781.714598; Thu, 08 Dec 2022 03:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p37F8-0008NZ-Th; Thu, 08 Dec 2022 03:06:38 +0000
Received: by outflank-mailman (input) for mailman id 456781;
 Thu, 08 Dec 2022 03:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/A3=4G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p37F7-0008NT-Sg
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 03:06:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5381ecb8-76a5-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 04:06:36 +0100 (CET)
Received: from FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a5::15)
 by DB9PR08MB7865.eurprd08.prod.outlook.com (2603:10a6:10:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 03:06:32 +0000
Received: from VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a5:cafe::dd) by FR3P281CA0200.outlook.office365.com
 (2603:10a6:d10:a5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Thu, 8 Dec 2022 03:06:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT010.mail.protection.outlook.com (100.127.144.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 03:06:31 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 08 Dec 2022 03:06:30 +0000
Received: from 2881c8a78aff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D00905BE-F332-4250-BCD0-A512F72E16A5.1; 
 Thu, 08 Dec 2022 03:06:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2881c8a78aff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Dec 2022 03:06:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7532.eurprd08.prod.outlook.com (2603:10a6:20b:4fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 03:06:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Thu, 8 Dec 2022
 03:06:24 +0000
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
X-Inumbo-ID: 5381ecb8-76a5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGlUX7q3Qtj1ROtVo1yZl4e0zk93YW05JgxJlgIbOvI=;
 b=Li31A049vfT6TqQoeAOpm6InBeHM75RX5FCwtRyjVjZgU0y3O7XNndvev/cvtvyTFbS9KF5kFWAG11Wyl8j8NvytGyo5UxDmFWK9K5+UbQ9q8uqgQNnVBF1CzJFr2EEkL3PjMK5Q7CCYTLacMcIXx+giXGbrN17FxsB+gb8unBo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz4WO2nxRTLFzS/SllDfeoC2+DD+MCCxL3AuxAgD2n9HGYCl/aadB0fG+cyPy6tJP1V7glcS2tfwGQzJ41ByyeosDB0lZP9OcY5UqCY7KcChdTXfSVHFXy6RBbhBAZ/+pcJgQE+hULFz942039XFAf0LXNgSMVudTJkOZAWfTuuGpU7QVWaoUeN8Fk0gtvHrGijqI+RsN0zYVzGg+3NTs1Dt2Yju0GsvOH4n+kTAiU+/YFQqyZw/Tkw72TSDuAt2WqlpylsXjLOlP1nqlR+/JX3/Vr1LdL7smkp93YWxBBZAEhxRqWttOPmoV0qtqrYhjB+9ZVwNBZ0W1eR9Ph0bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGlUX7q3Qtj1ROtVo1yZl4e0zk93YW05JgxJlgIbOvI=;
 b=NQYLiB63YRD4TMTvd9CI9b+iaDlcVQV7M3/fhQAbrlin+qBm5k8TtzU0VPodKsa0sResIKc8eBlJMnZprrmLGsY9WEwy+/RfHQ9XVI0Lbs2IeNVMWVvdXs6bSatUIAKC4niUVgwrAmaDegr774rY9dhqpJOBoDV1tbmk1jQi6B25xRoccU/sLnkp9dcutQKM6Mqp/JTm9da6eBBw+KNMum2/vHVcyURCtAd4OxroPwyL/EbvPZ8jk+fiL9W0jpco+t2upDTrR1Y2byE7IsrtEIlB8ddbtkQm+IVvceKUxYEeZZ8bL+scJ4uPHfek8uGCz4RUHtyQ1Brjys/kYYsv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGlUX7q3Qtj1ROtVo1yZl4e0zk93YW05JgxJlgIbOvI=;
 b=Li31A049vfT6TqQoeAOpm6InBeHM75RX5FCwtRyjVjZgU0y3O7XNndvev/cvtvyTFbS9KF5kFWAG11Wyl8j8NvytGyo5UxDmFWK9K5+UbQ9q8uqgQNnVBF1CzJFr2EEkL3PjMK5Q7CCYTLacMcIXx+giXGbrN17FxsB+gb8unBo=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY36RSrOIThkYtnEq9RrtWc+uYX64NsO2AgAACdYCAAZeJAIBUVNkA
Date: Thu, 8 Dec 2022 03:06:23 +0000
Message-ID:
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
In-Reply-To: <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A6BB1621F5AED4479752C130E5B72077.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7532:EE_|VI1EUR03FT010:EE_|DB9PR08MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 4361f82c-b79b-48fd-3d1f-08dad8c93519
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1xtaGPOIPwPt9oYosJQm6ecnVmOQ+lXg0GQCx57uX+MDiCeAXQVTpNT/rglNGbRka0LtbdAPm7qbuTDtp5mnfaICVyKpCPYCvBZu3eumdTY79m0p1+mBzLu43osE8O+LaVeX0co7dwAEYJgHxWDqIA0VgjItnfizVPZBz7zeuyicOmLAlgFOwPiqUW3VTK1EFvo8nnlGeHEpObY6KyRxEtG+Q+8jtDxohalnASI+sccFM7cRplbARVERksgZt2n1+vWdtFqHGU/kZJ6dzjSuY9P2XzOOLAZ/ofDL4kA19RmiG1FlsrFsVRJanIq7HGxuQ3gY71yfs6vTomTahacgVXpYQ4t45VLkLnIFUacwep8Hua6+o3LehiXBEi6zHP4zgINZcq9G1NBmztPFQcA6qMF93zy7nXi2nZeSaf/zd1G+XEroITruMLTdBzzqH/jGp9fBlFL0B1LK65Z0zOiZ9w8dUKwJUJfk1MEgyzHXaWxkGT+efgOYfCjLKikicPtQINLmIAENmNi7cgmlq1b99tEcQfyy6E9uVMu25WkA2fAI/XTPd24PsRuKoa0shrVx68RYHIsR2LenhBBrQoOn2eTtvEBZJH/Srx8DIwX0CrtgB9+TTxUMC1Hn/QrRFRywbRz8bRvamb6xFN/hlu9UK+hLI6rP7nv6udYdFtKWkcJXFPZ5VqQGZJuKgE+3GqdPoU2U+XQkTzCaolUEpeoEtw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199015)(2906002)(6636002)(86362001)(55016003)(71200400001)(33656002)(7696005)(6506007)(54906003)(186003)(83380400001)(110136005)(26005)(122000001)(66946007)(76116006)(8936002)(41300700001)(5660300002)(52536014)(38100700002)(66556008)(478600001)(8676002)(64756008)(9686003)(66446008)(4326008)(66476007)(38070700005)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7532
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0a34bc3-68fe-485a-0a46-08dad8c93080
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8N7r5j8jnZivhVuyJpaUdT+ad6dJiNB9ZRreZY6MrpwKd0dCXYY3O1UkxJwaex7izIEbibSgR6FgJTFL2hsldwfY6B7KIfDjmPmy4njaa/MCNv3tDAqco5MG+/38v7GD7xM6mNtxVKqZQwYhj9AIWb9u1br/mP0dmvA1kxHUCvyCUr9SzWIpyXFjGOLBKp3Ih3mg6nWCVdqN6As5u0PprPVQKUCu3EcrvkbMh3JQMTqfwNqUh62CP7xaxdSWI0qmEGzSXd0jgzyYB8QsxMix9F7taAt2nCACajJva1tLnZ7PCJWfisuMMY7MT/5jHHbUfMeJEVmMEEEaLXncMAvFqNvq+d9W/8AghlynmY4DuXLxGk+cpUP5ql52sWurCEbzfJCcYMmpc9oZk7lYtD/rQoFP1gJ7zu7wpKwGGrw/XeWBikdaAnwWx+ygIxwKpdzTwC+NZZbpNErGPnG+0DR/2XIFRhD6sa1HyTDIGNNudf971hgtmSzKdCl43tTkbIGSmu2MsPUbsnOdZOSOm3mbwm8Lx9s4zg6UUCPwYoa3NtqahV0+m+wgmTKlT1ynZSqj0rkAD2+pG+KTv96So+qn6lwa/SiSQDfeqn7inXpvPOkV8Rn6d7rruYCvebo1o6QMNlcLoUDvd9K/QQHANl5qhqnRr24isjMorrxd2XQoqOr9hOkEJpGvN0FYzaZEMnrOSHFbBOumM9FNpAK78gbEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(33656002)(83380400001)(47076005)(8676002)(8936002)(5660300002)(52536014)(4326008)(54906003)(316002)(70586007)(70206006)(41300700001)(6636002)(110136005)(55016003)(478600001)(40480700001)(82740400003)(7696005)(9686003)(26005)(82310400005)(86362001)(6506007)(81166007)(186003)(356005)(40460700003)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 03:06:31.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4361f82c-b79b-48fd-3d1f-08dad8c93519
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7865

SGkgSnVsaWVuLCBTdGVmYW5vLCBCZXJ0cmFuZCwNCg0KSSBhbSB0cnlpbmcgdG8gd29yayBvbiB0
aGUgZm9sbG93LXVwIGltcHJvdmVtZW50cyBhYm91dCB0aGUgQXJtIFAyTSBjb2RlLA0KYW5kIHdo
aWxlIHRyeWluZyB0byBhZGRyZXNzIHRoZSBjb21tZW50IGJlbG93LCBJIG5vdGljZWQgdGhlcmUg
d2FzIGFuIHVuZmluaXNoZWQNCmRpc2N1c3Npb24gYmV0d2VlbiBtZSBhbmQgSnVsaWVuIHdoaWNo
IEkgd291bGQgbGlrZSB0byBjb250aW51ZSBhbmQgaGVyZQ0Kb3BpbmlvbnMgZnJvbSBhbGwgb2Yg
eW91IChpZiBwb3NzaWJsZSkuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
Ml0geGVuL2FybTogcDJtOiBQb3B1bGF0ZSBwYWdlcyBmb3IgR0lDdjIgbWFwcGluZyBpbg0KPiBh
cmNoX2RvbWFpbl9jcmVhdGUoKQ0KPiA+PiBJIGFsc28gbm90aWNlZCB0aGF0IHJlbGlucXVpc2hf
cDJtX21hcHBpbmcoKSBpcyBub3QgY2FsbGVkLiBUaGlzIHNob3VsZA0KPiA+PiBiZSBmaW5lIGZv
ciB1cyBiZWNhdXNlIGFyY2hfZG9tYWluX2NyZWF0ZSgpIHNob3VsZCBuZXZlciBjcmVhdGUgYQ0K
PiA+PiBtYXBwaW5nIHRoYXQgcmVxdWlyZXMgcDJtX3B1dF9sM19wYWdlKCkgdG8gYmUgY2FsbGVk
Lg0KDQpGb3IgdGhlIGJhY2tncm91bmQgb2YgdGhlIGRpc2N1c3Npb24sIHRoaXMgd2FzIGFib3V0
IHRoZSBmYWlsdXJlIHBhdGggb2YNCmFyY2hfZG9tYWluX2NyZWF0ZSgpLCB3aGVyZSB3ZSBvbmx5
IGNhbGwgcDJtX2ZpbmFsX3RlYXJkb3duKCkgd2hpY2ggZG9lcw0Kbm90IGNhbGwgcmVsaW5xdWlz
aF9wMm1fbWFwcGluZygpLi4uDQoNCj4gPj4NCj4gPj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29k
IHRvIGNoZWNrIGl0IGluIF9fcDJtX3NldF9lbnRyeSgpLiBTbyB3ZSBkb24ndA0KPiA+PiBlbmQg
dXAgdG8gYWRkIHN1Y2ggbWFwcGluZ3MgYnkgbWlzdGFrZS4NCj4gDQo+IEZvciBjaGVja2luZyB0
aGUgbWFwcGluZywgd2UgY2FuIGRvOg0KPiANCj4gaWYgKCAhcmVtb3ZpbmdfbWFwcGluZyAmJiAo
cDJtX2lzX2ZvcmVpZ24odCkgfHwgKHAybV9pc19yYW0odCkgJiYNCj4gaXNfeGVuaGVhcF9tZm4o
bWZuKSkgKQ0KPiAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gV2UgYWxzbyBuZWVkIGEgd2F5
IHRvIGNoZWNrIHdoZXRoZXIgd2UgYXJlIGNhbGxlZCBmcm9tDQo+IGFyY2hfZG9tYWluX2NyZWF0
ZSgpLiBJIHRoaW5rIHdlIHdvdWxkIG5lZWQgYSBmaWVsZCBpbiB0aGUgZG9tYWluDQo+IHN0cnVj
dHVyZSB0byBpbmRpY2F0ZSB3aGV0aGVyIGl0IGlzIHN0aWxsIGluaXRpYWxpemF0aW5nLg0KPiAN
Cj4gVGhpcyBpcyBhIGJpdCB1Z2x5IHRob3VnaC4gQW55IG90aGVyIHN1Z2dlc3Rpb25zPw0KDQou
Li5hbmQgSSBhZ3JlZSB3aXRoIEp1bGllbiB0aGF0IHRoaXMgY2hlY2sgbWFrZXMgZ3JlYXQgc2Vu
c2UgYW5kIEkgd2lsbCBhZGQNCnRoaXMgY2hlY2sgaW4gdGhlIGZvbGxvdyB1cCBwYXRjaCBhcyBk
aXNjdXNzZWQuDQoNCkhvd2V2ZXIgSSBhbSBub3QgcmVhbGx5IGNvbnZpbmNlZCB0aGlzIGxvb2tz
IHByZXR0eSwgYW5kIEkgd291bGQgbGlrZSB0bw0KaGVhciBvcGluaW9ucyAvIHN1Z2dlc3Rpb25z
IGFib3V0IGJlbG93IGNvZGUsIGRvZXMgYmVsb3cgY29kZSBzbmlwcGV0DQpzZWVtIHBsYXVzaWJs
ZSB0byB5b3U/DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9h
cm0vcDJtLmMNCkBAIC0xMDQzLDYgKzEwNDMsMTAgQEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50
cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwNCiAgICAgICovDQogICAgIEFTU0VSVCh0YXJnZXQg
PiAwICYmIHRhcmdldCA8PSAzKTsNCg0KKyAgICBpZiAoICFyZW1vdmluZ19tYXBwaW5nICYmIGQt
PmFyY2gucDJtLmZyb21fYXJjaF9kb21haW5fY3JlYXRlICYmIA0KKyAgICAgICAgIChwMm1faXNf
Zm9yZWlnbih0KSB8fCAocDJtX2lzX3JhbSh0KSAmJiBpc194ZW5oZWFwX21mbihtZm4pKSApDQor
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisNCiAgICAgdGFibGUgPSBwMm1fZ2V0X3Jvb3RfcG9p
bnRlcihwMm0sIHNnZm4pOw0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbi5jDQpAQCAtNjg3LDYgKzY4Nyw4IEBAIGludCBhcmNoX2RvbWFp
bl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCiAgICAgaWYgKCAocmMgPSBwMm1faW5pdChkKSkg
IT0gMCApDQogICAgICAgICBnb3RvIGZhaWw7DQoNCisgICAgZC0+YXJjaC5wMm0uZnJvbV9hcmNo
X2RvbWFpbl9jcmVhdGUgPSB0cnVlOw0KKw0KICAgICByYyA9IC1FTk9NRU07DQogICAgIGlmICgg
KGQtPnNoYXJlZF9pbmZvID0gYWxsb2NfeGVuaGVhcF9wYWdlcygwLCAwKSkgPT0gTlVMTCApDQog
ICAgICAgICBnb3RvIGZhaWw7DQpAQCAtNzUxLDYgKzc1Myw4IEBAIGludCBhcmNoX2RvbWFpbl9j
cmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCiAgICAgaWYgKCAocmMgPSBkb21haW5fdnBjaV9pbml0
KGQpKSAhPSAwICkNCiAgICAgICAgIGdvdG8gZmFpbDsNCg0KKyAgICBkLT5hcmNoLnAybS5mcm9t
X2FyY2hfZG9tYWluX2NyZWF0ZSA9IGZhbHNlOw0KKw0KICAgICByZXR1cm4gMDsNCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg==

