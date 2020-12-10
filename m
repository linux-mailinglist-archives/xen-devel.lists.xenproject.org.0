Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D642D5F15
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49412.87380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNZl-0000Rg-BG; Thu, 10 Dec 2020 15:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49412.87380; Thu, 10 Dec 2020 15:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNZl-0000RG-7n; Thu, 10 Dec 2020 15:09:49 +0000
Received: by outflank-mailman (input) for mailman id 49412;
 Thu, 10 Dec 2020 15:09:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNZj-0000RB-He
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:09:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22e8c2aa-6abb-40fc-acd5-431b8ca02cd2;
 Thu, 10 Dec 2020 15:09:45 +0000 (UTC)
Received: from AM5PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:203:91::28) by AM6PR08MB4691.eurprd08.prod.outlook.com
 (2603:10a6:20b:cc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 15:09:42 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::40) by AM5PR0502CA0018.outlook.office365.com
 (2603:10a6:203:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:09:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:09:42 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Thu, 10 Dec 2020 15:09:41 +0000
Received: from c3e0269dda7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFCD8F4D-6813-4B77-AFE1-203E5426B5BD.1; 
 Thu, 10 Dec 2020 15:09:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3e0269dda7c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:09:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 10 Dec
 2020 15:09:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:09:22 +0000
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
X-Inumbo-ID: 22e8c2aa-6abb-40fc-acd5-431b8ca02cd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6HlzVGwjUBj42alFlMf0NbLNUbRd/U/JMZvhKBC6BU=;
 b=g+Mvimp1hhpoRNgXgZngd8a2avQ6nW3VHq+nhrZrNafl45DYiK10sdyMuTDa0tXSLETjFRpTU5a6wvcf23ctV5Iyr59ufODXsBzyIoEMjkgmtKRLOYuXUZdnCvKTMzs3EquF/kz46Hg6Pr/WFXpg8FjEnyeS/o8TnmRQI7EQCnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3399b676f8fc5d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C77A8BflKsTU1t4PADopIE1b2jTGA1X52x0SLi9D4qAMzuHCTv7JyX634eZJkTpOqVzqguvn7If84fPSQoCPtjxn+22Q3YJUDY/PDdSNxyB2Kxxi3XTVBTfioqAoJHrW6cWxwoVqLaBo3r3NYcRBhu+BkUb+0HXyfjzq94sLXH1Zgwp0VTj1HasmXPrywyk852/WbPebFitkI1AwlwGZnR7H2o+toCEzCBwz69cTS4klo0NzCVEyN0DOrkFg5V06KKJ7TC0IB4lxNNTCR83UtXF9frmZkILvRNfeSwI09xf8ERece9vOszbgN85GX/uHHxA/Usc1i4F7kIdjuIT7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6HlzVGwjUBj42alFlMf0NbLNUbRd/U/JMZvhKBC6BU=;
 b=h3OEL6H7ynijTLefrXsQoDhENGfYYhLbbngPUA/TgpEHCR2iJKZDgsM4FQ7Y7YmtvKr0oNqCDWc0beoPnPv9zfOgvIl2Aswokaiyi0EbnKCF8Cck6mPiBy0XTP2boVQZzhOEclKZ+QZhOWc+9UKMQdfvY/NzOWiCKlF+mGGvKxr4xOAD3wg/5ApFst0a9xzYq55TzHNnDnaISh1SoGk2v9HcGI/sEqTdtz24r19uw3RsVRAuIRW54SZl2SEGG95XqlYNLWd9mWg+8fjXAAt6cnilw5h4Rg5grY1TQgdQtismZfIJoRORrpEURsaDWHirAqDa4djXLuj9m1UxAmcEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6HlzVGwjUBj42alFlMf0NbLNUbRd/U/JMZvhKBC6BU=;
 b=g+Mvimp1hhpoRNgXgZngd8a2avQ6nW3VHq+nhrZrNafl45DYiK10sdyMuTDa0tXSLETjFRpTU5a6wvcf23ctV5Iyr59ufODXsBzyIoEMjkgmtKRLOYuXUZdnCvKTMzs3EquF/kz46Hg6Pr/WFXpg8FjEnyeS/o8TnmRQI7EQCnQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v3 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWzklmttlhxiafuUKrQQSihgPiRKnvLa8AgAFCnwA=
Date: Thu, 10 Dec 2020 15:09:22 +0000
Message-ID: <C881A361-12A2-42FF-B64E-7AE8A1F436EC@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <5a36325410f485dbdddc0f6088378cacc54c5243.1607524536.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012091153400.20986@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012091153400.20986@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eeac6912-0e32-460c-2544-08d89d1d9f41
x-ms-traffictypediagnostic: DBBPR08MB6315:|AM6PR08MB4691:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4691DEC5FF67C6B7365829D09DCB0@AM6PR08MB4691.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1Ge728XOyOakXuKrM3/UaAByhSRPjLnJTyrRj7LBXj7OlVqja6s3gF1d1OAKDEpcckEn0R2q3nPqeJbN8w89OlXZhFSTqBgVLT/5nR2lQuDLR8uyEbjBmi23ZkQYcGoRAlU+8vGKX3HiyIdoDFXwl9HWTNXiEyoRyGm6YfYi5ekO79c+RO4CO3ASS0906iE5vHynW1NjXYLovbMFNIELI1CEH9Md/mTsn6wNlFbPsgGCDWxGemlYjHy8PsUWLybVlqqMI4l0SUrXFA6hk29fkRfnJiG0C5isYRooAzckM6rJ4UuSIr57K3RicdxCZ35ZmT/zcenceEvR1KlB8XAXH/enYZAcW5k3ZNKaHSFGFE2EyBRN0YECiIViFSBtv3jz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(76116006)(91956017)(2616005)(66476007)(316002)(8936002)(33656002)(5660300002)(6506007)(66946007)(36756003)(86362001)(66446008)(8676002)(83380400001)(71200400001)(6512007)(54906003)(186003)(66556008)(6486002)(2906002)(26005)(64756008)(4326008)(478600001)(6916009)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?c21wOU4walFGdUI5L1IvUklOOS96RVlFZVI1a3o4RmYrM2NOT0RHS1d2Vm5y?=
 =?utf-8?B?NFVneDk2c29pWHIzem5XQ0lMNU1DY2hZVjZSczcyc0VjNVBTUURucUUvS29I?=
 =?utf-8?B?MW8vaVdUNUxOK3pZSU9XR0FGaXJqUDBKYVU3T09nZVA1OGV5b1ZHZFZkYU9j?=
 =?utf-8?B?bkJZOTI1UCtEb3M3ZGRMRFhXM3ZjR2pIMGp0dVdUNWwrbjV5MGo2OXRobElo?=
 =?utf-8?B?c0dBNUxmQ1pxOWlkbDFZdWVGZmtZNTFNVVNROHk1bFVEMGdqZ0NYWEVPT1BT?=
 =?utf-8?B?YjJWanBOTG1aeno0RUxMeXllMDZVakEvZUNScGZ6Mzd5S1VkZHJCV0JVNjFT?=
 =?utf-8?B?aEVFZElPWWd1SS9kSnZmZEJlMEpldzVzTzRwanlQK2ZYcm9VU3JGMUVLSi9P?=
 =?utf-8?B?c2VjTG0zcUVObVU5bHpxMkZJZjYxSTh0ZHNwRXBBd2RhQU1ybEwxSmZ0djNX?=
 =?utf-8?B?aEFQNlBPWXo4WWE1aDV5WEJ6c2V5SnRJZ0JrYlRWbGlrUFBCTXhiVUxOOUsv?=
 =?utf-8?B?Z0ZjcUt5OHpmZHFaTXBhc213ZkhDckt2bXpyNk1qSXBKMW9IdEJZbkJ0TCtF?=
 =?utf-8?B?UmZUM3EzdlpsOW1Rcm1UbXRLUzFxaUlRcUd2T1pwc0gzZHJQNm1xczY2dG1w?=
 =?utf-8?B?RG9vd1A2MzBtMG9DT09MZVlCc201SFRXNzlBSXVURlpXM3g4U2hkVU15WFNU?=
 =?utf-8?B?Y2hTWEpVZ2xvMjl6VEhMTmhJNXZIdnQ4VzlqVlloaS9wUy9jQTVQRGpFZHJW?=
 =?utf-8?B?Um5VdUxYWUxKRURrV3ZpNUhaU09BbjUvMzZxUmJ1TmtXc1dMaUZKSHY5ZVBN?=
 =?utf-8?B?OC9TZDM3d2RTMXJWa3hyV3pzd1VuaWZkb3h4alBvQ1p0Si96VVZqOWhzYytN?=
 =?utf-8?B?b3I0czBNZmcvdnpBMkUrYk1CNVZDdi83TFlCWVpEeU9VdVJDakdFT3NwVWdF?=
 =?utf-8?B?NUt4YVErTVdVRDZqRUtQYjJVUVJPWHdFWENXZ2hreGVmMGE2YkNiTWcrdkI5?=
 =?utf-8?B?THF2TXJyaldsS1hnYmozeG1lRUNudm9SZERJQmY5d2hJK2RqYVpLMDdkZHhl?=
 =?utf-8?B?TndSZk5Nb0RXbDhnRXdUWitlNkhNYThLSDZiZW1DY3RlL1BnUndJSWRES0pL?=
 =?utf-8?B?NzRyV21yKzFBQkJ1bE9XcFBhNE91eUh3cExRNjQ2OGJZL3hPMjdGSlV0L1ox?=
 =?utf-8?B?ZGxacDhxWmhFQmNxS2tjazBvWnJ4cFdKZXkvMlNZTmxwOGlIcjh2UWZpM2tY?=
 =?utf-8?B?N0svM1VNek12ak5RQnZCMVpkcmdoaVNnZjFvSnFUakxtcDFwcHJES0NBNHF1?=
 =?utf-8?Q?EgF2035fQJeAowofF0s8ROx4//NC25Y6A9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAEBD7E8EEF3A44DBF48DFB22D444E4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff1d8988-be18-45f4-2ac0-08d89d1d93ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bIt6VX5tKMtGlVAvmgZxEGj+nLkW0iQffVayJJCIdwo/ppnMw548D7lBJ166iafWkex7vIkghTWf6I+TU8wVSaKauXVATFCH+a4pxyNI+T4/0zMBFPCL8hGcfor0OsdL6xOPg/KLTEz2QRu7XiJAxXagi35ZZ8BTWwH2u+vwI044uyMmBlHuUZPz1qpKW1aySNCCiIETJ9mpGfmLEiwHBv8Lw7V0vOL+Whw4ERBfQ3oWMts8nDp9CTFGew97qjnILiCr456PRjahvGsxl7u+c45WSA6fa/D11ynbyBFSI/yBXV2/+Jnmpv6cIETitc66rgClsRwm6dluEdOi9VFSxBDOPa7CjonMu0NaRDq9rRKeFsbyTHkGhzKUbk+erYbfkHfXXIvYxOKu3orBExc1UA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(356005)(2906002)(54906003)(4326008)(6862004)(82740400003)(83380400001)(8676002)(107886003)(47076004)(6512007)(81166007)(6486002)(82310400003)(8936002)(86362001)(316002)(5660300002)(336012)(36756003)(478600001)(6506007)(53546011)(26005)(186003)(70206006)(2616005)(33656002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:09:42.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeac6912-0e32-460c-2544-08d89d1d9f41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691

SGkgU3RlZmFubywNCg0KPiBPbiA5IERlYyAyMDIwLCBhdCAxOTo1NCwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgOSBEZWMg
MjAyMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEFkZCBzdXBwb3J0IGZvciBlbXVsYXRp
b24gb2YgY3AxNSBiYXNlZCBJRCByZWdpc3RlcnMgKG9uIGFybTMyIG9yIHdoZW4NCj4+IHJ1bm5p
bmcgYSAzMmJpdCBndWVzdCBvbiBhcm02NCkuDQo+PiBUaGUgaGFuZGxlcnMgYXJlIHJldHVybmlu
ZyB0aGUgdmFsdWVzIHN0b3JlZCBpbiB0aGUgZ3Vlc3RfY3B1aW5mbw0KPj4gc3RydWN0dXJlIGZv
ciBrbm93biByZWdpc3RlcnMgYW5kIFJBWiBmb3IgYWxsIHJlc2VydmVkIHJlZ2lzdGVycy4NCj4+
IEluIHRoZSBjdXJyZW50IHN0YXR1cyB0aGUgTVZGUiByZWdpc3RlcnMgYXJlIG5vIHN1cHBvcnRl
ZC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFy
cXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOiBSZWJhc2UNCj4+IENoYW5n
ZXMgaW4gVjM6DQo+PiAgQWRkIGNhc2UgZGVmaW5pdGlvbiBmb3IgcmVzZXJ2ZWQgcmVnaXN0ZXJz
DQo+PiAgQWRkIGhhbmRsaW5nIG9mIHJlc2VydmVkIHJlZ2lzdGVycyBhcyBSQVouDQo+PiAgRml4
IGNvZGUgc3R5bGUgaW4gR0VORVJBVEVfVElEM19JTkZPIGRlY2xhcmF0aW9uDQo+PiANCj4+IC0t
LQ0KPj4geGVuL2FyY2gvYXJtL3ZjcHJlZy5jICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4geGVuL2luY2x1ZGUvYXNtLWFybS9jcHJlZ3MuaCB8IDI1
ICsrKysrKysrKysrKysrKysrKysrKysrDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlv
bnMoKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Y3ByZWcuYyBiL3hlbi9h
cmNoL2FybS92Y3ByZWcuYw0KPj4gaW5kZXggY2RjOTFjZGY1Yi4uZDM3MWExYzM4YyAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3Zj
cHJlZy5jDQo+PiBAQCAtMTU1LDYgKzE1NSwxNCBAQCBUVk1fUkVHMzIoQ09OVEVYVElEUiwgQ09O
VEVYVElEUl9FTDEpDQo+PiAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICAgICB9DQo+PiANCj4+ICsvKiBNYWNy
byB0byBnZW5lcmF0ZSBlYXNpbHkgY2FzZSBmb3IgSUQgY28tcHJvY2Vzc29yIGVtdWxhdGlvbiAq
Lw0KPj4gKyNkZWZpbmUgR0VORVJBVEVfVElEM19JTkZPKHJlZywgZmllbGQsIG9mZnNldCkgICAg
ICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICBjYXNlIEhTUl9DUFJFRzMyKHJlZyk6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICB7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
Pj4gKyAgICAgICAgcmV0dXJuIGhhbmRsZV9yb19yZWFkX3ZhbChyZWdzLCByZWdpZHgsIGNwMzIu
cmVhZCwgaHNyLCAgICAgXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgMSwgZ3Vlc3Rf
Y3B1aW5mby5maWVsZC5iaXRzW29mZnNldF0pOyAgICAgXA0KPj4gKyAgICB9DQo+PiArDQo+PiB2
b2lkIGRvX2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhz
ciBoc3IpDQo+PiB7DQo+PiAgICAgY29uc3Qgc3RydWN0IGhzcl9jcDMyIGNwMzIgPSBoc3IuY3Az
MjsNCj4+IEBAIC0yODYsNiArMjk0LDM3IEBAIHZvaWQgZG9fY3AxNV8zMihzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikNCj4+ICAgICAgICAgICovDQo+PiAg
ICAgICAgIHJldHVybiBoYW5kbGVfcmF6X3dpKHJlZ3MsIHJlZ2lkeCwgY3AzMi5yZWFkLCBoc3Is
IDEpOw0KPj4gDQo+PiArICAgIC8qDQo+PiArICAgICAqIEhDUl9FTDIuVElEMw0KPj4gKyAgICAg
Kg0KPj4gKyAgICAgKiBUaGlzIGlzIHRyYXBwaW5nIG1vc3QgSWRlbnRpZmljYXRpb24gcmVnaXN0
ZXJzIHVzZWQgYnkgYSBndWVzdA0KPj4gKyAgICAgKiB0byBpZGVudGlmeSB0aGUgcHJvY2Vzc29y
IGZlYXR1cmVzDQo+PiArICAgICAqLw0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfUEZS
MCwgcGZyMzIsIDApDQo+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIxLCBwZnIzMiwg
MSkNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX1BGUjIsIHBmcjMyLCAyKQ0KPj4gKyAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfREZSMCwgZGJnMzIsIDApDQo+PiArICAgIEdFTkVSQVRF
X1RJRDNfSU5GTyhJRF9ERlIxLCBkYmczMiwgMSkNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZP
KElEX0FGUjAsIGF1eDMyLCAwKQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjAs
IG1tMzIsIDApDQo+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMSwgbW0zMiwgMSkN
Cj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIyLCBtbTMyLCAyKQ0KPj4gKyAgICBH
RU5FUkFURV9USUQzX0lORk8oSURfTU1GUjMsIG1tMzIsIDMpDQo+PiArICAgIEdFTkVSQVRFX1RJ
RDNfSU5GTyhJRF9NTUZSNCwgbW0zMiwgNCkNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElE
X01NRlI1LCBtbTMyLCA1KQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjAsIGlz
YTMyLCAwKQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjEsIGlzYTMyLCAxKQ0K
Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjIsIGlzYTMyLCAyKQ0KPj4gKyAgICBH
RU5FUkFURV9USUQzX0lORk8oSURfSVNBUjMsIGlzYTMyLCAzKQ0KPj4gKyAgICBHRU5FUkFURV9U
SUQzX0lORk8oSURfSVNBUjQsIGlzYTMyLCA0KQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8o
SURfSVNBUjUsIGlzYTMyLCA1KQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjYs
IGlzYTMyLCA2KQ0KPj4gKyAgICAvKiBNVkZSIHJlZ2lzdGVycyBhcmUgaW4gY3AxMCBubyBjcDE1
ICovDQo+PiArDQo+PiArICAgIEhTUl9DUFJFRzMyX1RJRDNfUkVTRVJWRURfQ0FTRToNCj4+ICsg
ICAgICAgIC8qIEhhbmRsZSBhbGwgcmVzZXJ2ZWQgcmVnaXN0ZXJzIGFzIFJBWiAqLw0KPj4gKyAg
ICAgICAgcmV0dXJuIGhhbmRsZV9yb19yYXoocmVncywgcmVnaWR4LCBjcDMyLnJlYWQsIGhzciwg
MSk7DQo+IA0KPiBTYW1lIHF1ZXN0aW9uIGFzIGZvciB0aGUgYWFyY2g2NCBjYXNlOiBkbyB3ZSBu
ZWVkIHRvIGRvIHdyaXRlLWlnbm9yZQ0KPiBmb3IgdGhlIHJlc2VydmVkIHJlZ2lzdGVycz8NCg0K
QXJtIGFyY2hpdGVjdHVyZSByZWZlcmVuY2UgbWFudWFsIGlzIGxpc3RpbmcgYWxsIHRob3NlIHJl
Z2lzdGVycyBhcyBSTyBpbmNsdWRpbmcNCnRoZSByZXNlcnZlZCBvbmVzIChjZiB0YWJsZSBEMTIt
MikuIFRoaXMgc2FpZCBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIG1ha2UgdGhlbQ0Kd3JpdGUgaWdu
b3JlIGJ1dCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhpcyB3b3VsZCBub3QgcmVmbGVjdCB0aGUg
aGFyZHdhcmUNCmJlaGF2aW91ci4NCg0KPiANCj4gDQo+PiAgICAgLyoNCj4+ICAgICAgKiBIQ1Jf
RUwyLlRJRENQDQo+PiAgICAgICoNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJt
L2NwcmVncy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHJlZ3MuaA0KPj4gaW5kZXggMjY5MGRk
ZWI3YS4uNWNiMWFkNWNiZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3By
ZWdzLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmgNCj4+IEBAIC0xMzMs
NiArMTMzLDMxIEBADQo+PiAjZGVmaW5lIFZQSURSICAgICAgICAgICBwMTUsNCxjMCxjMCwwICAg
LyogVmlydHVhbGl6YXRpb24gUHJvY2Vzc29yIElEIFJlZ2lzdGVyICovDQo+PiAjZGVmaW5lIFZN
UElEUiAgICAgICAgICBwMTUsNCxjMCxjMCw1ICAgLyogVmlydHVhbGl6YXRpb24gTXVsdGlwcm9j
ZXNzb3IgSUQgUmVnaXN0ZXIgKi8NCj4+IA0KPj4gKy8qDQo+PiArICogVGhvc2UgY2FzZXMgYXJl
IGNhdGNoaW5nIGFsbCBSZXNlcnZlZCByZWdpc3RlcnMgdHJhcHBlZCBieSBUSUQzIHdoaWNoDQo+
PiArICogY3VycmVudGx5IGhhdmUgbm8gYXNzaWdubWVudC4NCj4+ICsgKiBIQ1IuVElEMyBpcyB0
cmFwcGluZyBhbGwgcmVnaXN0ZXJzIGluIHRoZSBncm91cCAzOg0KPj4gKyAqIGNvcHJvYyA9PSBw
MTUsIG9wYzEgPT0gMCwgQ1JuID09IGMwLCBDUm0gPT0ge2MyLWM3fSwgb3BjMiA9PSB7MC03fS4N
Cj4+ICsgKi8NCj4+ICsjZGVmaW5lIEhTUl9DUFJFRzMyX1RJRDNfQ0FTRVMoUkVHKSAgICAgY2Fz
ZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxSRUcsMCk6IFwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxSRUcsMSk6IFwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSBIU1JfQ1BS
RUczMihwMTUsMCxjMCxSRUcsMik6IFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxSRUcsMyk6IFwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSBIU1JfQ1BSRUczMihwMTUs
MCxjMCxSRUcsNCk6IFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxSRUcsNSk6IFwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxSRUcs
Nik6IFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSBI
U1JfQ1BSRUczMihwMTUsMCxjMCxSRUcsNykNCj4+ICsNCj4+ICsjZGVmaW5lIEhTUl9DUFJFRzMy
X1RJRDNfUkVTRVJWRURfQ0FTRSAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxjMCxjMywwKTogXA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlIEhTUl9DUFJF
RzMyKHAxNSwwLGMwLGMzLDEpOiBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNhc2UgSFNSX0NQUkVHMzIocDE1LDAsYzAsYzMsMik6IFwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSBIU1JfQ1BSRUczMihwMTUsMCxj
MCxjMywzKTogXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
YXNlIEhTUl9DUFJFRzMyKHAxNSwwLGMwLGMzLDcpOiBcDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEhTUl9DUFJFRzMyX1RJRDNfQ0FTRVMoYzQpOiBcDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEhTUl9DUFJFRzMyX1RJRDNf
Q0FTRVMoYzUpOiBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEhTUl9DUFJFRzMyX1RJRDNfQ0FTRVMoYzYpOiBcDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEhTUl9DUFJFRzMyX1RJRDNfQ0FTRVMoYzcpDQo+IA0KPiBUaGUg
Zm9sbG93aW5nIGFyZSBtaXNzaW5nLCBpcyBpdCBhIHByb2JsZW0/DQo+IA0KPiBwMTUsMCxjMCxj
MCwyDQo+IHAxNSwwLGMwLGMwLDMNCj4gcDE1LDAsYzAsYzAsNA0KPiBwMTUsMCxjMCxjMCw2DQo+
IHAxNSwwLGMwLGMwLDcNCg0KSENSLlRJRDMgZG9jdW1lbnRhdGlvbiBpcyBzYXlpbmcgdGhhdCBh
Y2Nlc3MgdG8gImNvcHJvYyA9PSBwMTUsIG9wYzEgPT0gMCwgDQpDUm4gPT0gYzAsIENSbSA9PSB7
YzItYzd9LCBvcGMyID09IHswLTd94oCdIGFyZSB0cmFwcGVkIHNvIENSbSA9IGMwIGlzIG5vdCBo
YW5kbGVkIGhlcmUuDQoNCkNoZWVycw0KQmVydHJhZG4NCg0KDQo=

