Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905067E40D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485522.752814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNCt-00064U-JN; Fri, 27 Jan 2023 11:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485522.752814; Fri, 27 Jan 2023 11:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNCt-00062Z-GR; Fri, 27 Jan 2023 11:47:47 +0000
Received: by outflank-mailman (input) for mailman id 485522;
 Fri, 27 Jan 2023 11:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLNCs-00062T-Kv
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:47:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6953e2b0-9e38-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:47:44 +0100 (CET)
Received: from AS9PR06CA0070.eurprd06.prod.outlook.com (2603:10a6:20b:464::21)
 by AS2PR08MB9834.eurprd08.prod.outlook.com (2603:10a6:20b:605::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 11:47:42 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::2b) by AS9PR06CA0070.outlook.office365.com
 (2603:10a6:20b:464::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 11:47:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.25 via Frontend Transport; Fri, 27 Jan 2023 11:47:41 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Fri, 27 Jan 2023 11:47:41 +0000
Received: from 830692fff205.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16FD01B2-4282-411C-ABCD-C5AE7FF2B129.1; 
 Fri, 27 Jan 2023 11:47:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 830692fff205.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:47:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9346.eurprd08.prod.outlook.com (2603:10a6:10:41e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 11:47:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:47:33 +0000
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
X-Inumbo-ID: 6953e2b0-9e38-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNfAuDjB9ohOLCAlbAU9zSwBfbCvIFOHixWRJVF6lto=;
 b=Au1dsnPM6sbdX8xwBi629NQKtwQ1qtDsF09/FvT6qfX4SwrPFYXCEL8BeJHwLf2/1bsbp5acaZ8y6Ju6mrac/q8kxBwwbqTMP35Ydjsr3SdkFlgEdD5TZIT2GfqlUlPA57DjZE2l6tr83EZ00qWL+NFnIkBiZnOP/Y46s8Cb7Pw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi/nvl8/5SNu/2quC1r5gsSSlmAhB5oKHDwYbl1m77KsxpiGfFvjfPIHTs+VnTRkfUIaJNsuTO0DYZW3t7RLcCt9PwE3v/waHfJ0CnQJyDmcJRMXc4U21l2ZeSkM+wGZz4KVsi8vt44K7UtLqMgSkY+kVlGvPwxOOYvmmNlyNUGuEkK7k7G0FVNavkc1VrcRKaTIl9uMYIF0er2xM1rsOmQ4zEfZbNA5FBfBrr7BujDiDbY9kMZTiy1p8Kp3EgIuu3AB/GDHd6Hq61UUMTSF9PQUAybFiqweHrVqvnLjNLrLsTEb/HTp/HhT/UZTndWsJIOwbMlTUwSfzzvwgcTu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNfAuDjB9ohOLCAlbAU9zSwBfbCvIFOHixWRJVF6lto=;
 b=W4/8vj5tsY8jJjXvIq939L/OuvPJxf7pn23qUeV0HrEIKRRbVBtlfr/ISl7Qjr4HwtNkoJFbCmqM3uhp16tgj0f6ubMmtKT/SL87hi3B67nHuM+38YOxLM0TgDns5RetH82ZCmf0rLZCu04GYf/oAFNrQaQCfsBknue9mcCK3puuhWi/gUnprXLu/dKA54+FYTztUObtJ7K7H0PgGhVRz41n26ov4+GNa9SCAzyDzEG40+IfhMslqYbJHgedzNGX0oI2fblQ/Ey/bVO7UHyjF2axhE5rJK3esBZA45v9UHKiBAKILwtph0hw1LnTM6C0v2IrZ2q2BUPAkJawSXRtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNfAuDjB9ohOLCAlbAU9zSwBfbCvIFOHixWRJVF6lto=;
 b=Au1dsnPM6sbdX8xwBi629NQKtwQ1qtDsF09/FvT6qfX4SwrPFYXCEL8BeJHwLf2/1bsbp5acaZ8y6Ju6mrac/q8kxBwwbqTMP35Ydjsr3SdkFlgEdD5TZIT2GfqlUlPA57DjZE2l6tr83EZ00qWL+NFnIkBiZnOP/Y46s8Cb7Pw=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Topic: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Index: AQHZD2qaLVIiQ3Z13EK3E/FV+D1Sxa6vQakAgAMoxuA=
Date: Fri, 27 Jan 2023 11:47:33 +0000
Message-ID:
 <AS8PR08MB7991323841685D68FD648B7292CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221214031654.2815589-1-Henry.Wang@arm.com>
 <20221214031654.2815589-2-Henry.Wang@arm.com>
 <e86d2b48-2da7-f21c-d191-85615a934c81@xen.org>
In-Reply-To: <e86d2b48-2da7-f21c-d191-85615a934c81@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 739D5CA5CAF57D40BBD8EA37F8273760.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9346:EE_|AM7EUR03FT005:EE_|AS2PR08MB9834:EE_
X-MS-Office365-Filtering-Correlation-Id: b78d6bfe-688d-494f-6544-08db005c4bfb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VFHRTnzIAmtkeNVSmtOH7nff1OqWbxV1upD8lfouD/t/hEpTnQR08lrm3riNRJyMD5ZHqhv81+OdsdJpG9Cqu6VLNZTpuwtllH+8ERfDHo38dkQoSBN7Bt224DcZY4CwG+rvr/yg7e8c/ccPrexYAtsG+qAWlFb+GuMFIIwaE+2U3HlnChM+TCENidFDFc6s2eTTn1+HDPCoK1uhbfivkwZZ8FO6HdiVLxba7AavGlyqeYPjoG+xNdV4+BglvC2iCCLuxytKTFFHo5BtQPoJl48/crxR+PHYHIhVwh4KBkPbwzspXQLiAQvq6Q300d4lnVmDZ/BiZ+pMntEb1in1hLvRmlVp9epo60FCxUXxKVusa7Z+aguNRqo7RG0UCAJ+dWsMoM7G9w05eS2OFxZXMPa7JUmBN5Z1aUcww6MN22qjHCjoqOUpOqNlhY3mgcefM9qQfElA3g/ZGg3yretBL2eC/4uQ5Hm2x9pICd/O+GTH5Jrt9AUyP1f7XQ+u20Ci1PHn8q04hIaUdnOafV+K6dv5xDrMIDXJyr4Rz2cVSjDAayi6QjpDrgMtGkPHiMbKReLKp6Dy89WSD61xE1F5TMlWyUsAxoXzeTy9R+8+N9DXytR0ALE9TWkrPXq+1O2tjWAwtKdYN5qqC3gSsr0KTJvDOkaJJRleEo45OBwGipCmJ5K4l4MCr4OPRkacyv/9Sz7Czq5haRSo+Q5W4Jd6bA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199018)(8936002)(52536014)(41300700001)(5660300002)(122000001)(4326008)(86362001)(83380400001)(38070700005)(33656002)(66946007)(54906003)(7696005)(110136005)(64756008)(186003)(76116006)(66556008)(71200400001)(66476007)(38100700002)(316002)(66446008)(9686003)(55016003)(6506007)(478600001)(26005)(8676002)(4744005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae5fa694-e7ce-4805-077b-08db005c4707
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AEUDPI1YKR6msjuU21q90tzJAmsKxcx+49JeiY85u7Eh7R+1hrRUJjIjjAKT0bXU2OsmAq0ZX8P1E39G4QBIvczM8dFXC97/6AFB5lg2Q0PzD/tXRXBJMEJRU+SO0wor5dqpkwemEShMEqj7t6h1ce7qAWCY5yESKhH7fDijulsjjq7k9CihHfvKsUWRVMW+dHmNGa1e9vSYdY+OXoxwXlPtimd6zVuOGo9Ber2XI6r+G1pJKNcMcmt8n46/QJRknw9U9OL/V46rBabv4OxFcajnY+V92fmj9HnmnfvKoAnU+34ZuaBMB/CqNAWH801FUAtiQeMKvUE/hJIDBtuJ7//gELlcmcscSp4GgMam8lGCjL3OiR/Bj7LC1aw18VXotOxAXNOqLyM5tpnCP3TgE1f7pd0IT2/GBuurOUOnXTrbRkJ+Mcc93fka2YKUgeb6gyjhevaE/PdOVil7A3kIgVRnByHtUY36HuUMK1Sto8LPPk/D8J2S4q5KZPzs9LzsLD49bw2f2Pd7rLHiYBOok5LvTKwCpfho9HfZh1vea29Lqr15Qrz0/VtLS/yib64HKT/NQDXp69ZO2torjYXeIf9ViQLab0zH+IS8SgOF69V/TksEWvI5Bu4uV4WToH2FtSh5OIKa8Me2PevFTg8R4ia7FKKobPCLKigYyw9Q6gsf88iSI8/9LHLnDFDUnSLp1gxf83WTTUC1+LcwHSJrqA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199018)(46966006)(36840700001)(40470700004)(336012)(41300700001)(356005)(83380400001)(4744005)(8936002)(47076005)(5660300002)(52536014)(7696005)(81166007)(478600001)(86362001)(107886003)(36860700001)(40460700003)(33656002)(40480700001)(70206006)(4326008)(70586007)(55016003)(8676002)(2906002)(6506007)(26005)(186003)(54906003)(82740400003)(82310400005)(316002)(9686003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:47:41.4190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78d6bfe-688d-494f-6544-08db005c4bfb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9834

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMS8zXSB4ZW4vYXJtOiBBZGQgbWVtb3J5IG92ZXJsYXAgY2hlY2sgZm9yDQo+
IGJvb3RpbmZvLnJlc2VydmVkX21lbQ0KPiA+ICsgICAgICAgICAgICBwcmludGsoIlJlZ2lvbiAl
IyJQUklwYWRkciIgLSAlIyJQUklwYWRkciIgb3ZlcmxhcHBpbmcgd2l0aA0KPiBiYW5rWyV1XSAl
IyJQUklwYWRkciIgLSAlIyJQUklwYWRkciJcbiIsDQo+IA0KPiBBRkFJQ1QsIGluIG1lc3NhZ2Vz
LCB0aGUgZW5kIHdvdWxkIGJlIGluY2x1c2l2ZS4gQnV0IGhlcmUuLi4NCj4gDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICByZWdpb25fc3RhcnQsIHJlZ2lvbl9lbmQsIGksIGJhbmtfc3RhcnQsIGJh
bmtfZW5kKTsNCj4gDQo+IC4uLiBpdCB3b3VsZCBiZSBleGNsdXNpdmUuIEkgd291bGQgc3VnZ2Vz
dCB0byBwcmludCB1c2luZyB0aGUgZm9ybWF0DQo+IFtzdGFydCwgZW5kWyBvciBkZWNyZW1lbnQg
dGhlIHZhbHVlIGJ5IDEuDQoNCkFub3RoZXIgZ29vZCBwb2ludCwgdGhhbmtzISBJIHdpbGwgc3dp
dGNoIHRvIHRoZSAiW3N0YXJ0LCBlbmRdIiBmb3JtYXQNCmluIGFsbCAzIHBhdGNoZXMuDQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBH
cmFsbA0K

