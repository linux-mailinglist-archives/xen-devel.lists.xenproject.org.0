Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD962CFC3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 01:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444443.699667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSq1-0008Ki-Tx; Thu, 17 Nov 2022 00:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444443.699667; Thu, 17 Nov 2022 00:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSq1-0008Ie-RC; Thu, 17 Nov 2022 00:33:05 +0000
Received: by outflank-mailman (input) for mailman id 444443;
 Thu, 17 Nov 2022 00:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lx8M=3R=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovSq0-0008IY-TH
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 00:33:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649a5065-660f-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 01:33:02 +0100 (CET)
Received: from AS9PR06CA0242.eurprd06.prod.outlook.com (2603:10a6:20b:45f::10)
 by DU0PR08MB8254.eurprd08.prod.outlook.com (2603:10a6:10:412::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Thu, 17 Nov
 2022 00:33:00 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::e1) by AS9PR06CA0242.outlook.office365.com
 (2603:10a6:20b:45f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Thu, 17 Nov 2022 00:33:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 00:32:59 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 17 Nov 2022 00:32:59 +0000
Received: from fe5cf1dfd153.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B51DE658-5D37-4FA5-BD8D-C9C7648D60B7.1; 
 Thu, 17 Nov 2022 00:32:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe5cf1dfd153.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Nov 2022 00:32:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8978.eurprd08.prod.outlook.com (2603:10a6:10:466::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Thu, 17 Nov
 2022 00:32:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%7]) with mapi id 15.20.5834.007; Thu, 17 Nov 2022
 00:32:50 +0000
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
X-Inumbo-ID: 649a5065-660f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV6VPE4BZmIDvtYs4TXWlmWPqM9X2XIBhF6qETb7avE=;
 b=c1FrXatlp6ufvEOREZDB27CgWqJmnMGdJLVctO1DKJFV87e4JXUETEegRpDt+ihiQOtpAGastg3imAR5WNZkyTcKAEw0zBo/FOM16TTlUGMnqvjxqXK1ReEv+yj7wXXESoyTZeyoudhTu22U2XFO+1FrcZFyfOwwAgSAUbqHOwE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhGL/6W4ldOs2zUDojasDT2iKPIVqk72YXySXCvQamzCeMfvHSM3XwW7v2OXeRGJWYA6GFWafwDtEjTaYgVRftMjigJ1ynWC+9rwY5ulUsXLGQ0MP/OmUABSTiupYPKMKoKOeBKn3FfakCHIwoVPsSWMhio71Epwl27nYr8QrSD7TfjVhiB+HMTAvFKy8eLRVzaOdKOrvIGBQMk+MDSBQbiOgD9KYnA/dfUIbwiphsmVwv++yiYuD1Oy6CGfIQJll9JZ/rRLK/Qm7BZUJZRXcr9cRgkb5LWjOsm6PKPJRVbMacIpjomLNN3c98BYwmbtIl93oCImaRTXkr1wOJwjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV6VPE4BZmIDvtYs4TXWlmWPqM9X2XIBhF6qETb7avE=;
 b=Oh15qD4qcExsJKOo+iBJNDkgndqotTv0an5hDruRHREr2tynvEpMnHgG4SBH+uG+WGJBb0DaOKOoWSqNBW7kAVFMcH84BIhkTFN+NRhMQl6lR/usiuAC8XQwIfcCg+hXtnM8KtXPfAd70zeHVUnHIV+NfMUTD3UrDJm3QANnMWjE/1rmiTvH9yDMmkgLhwVdlsVL3JQPjx9f0IQt/4MmixzIl4uy6OjRfR5NbvOCekbd+z3nH/sVINlE/a1Zfjxg/cUORdoZXls0H1g2P9BavMjQ2TWZ03joqwk+7Ixa9AHbEDWLDdlnk2+rPzp/Tkc3PM0Vdsz+uMJ2f0jxsJH8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV6VPE4BZmIDvtYs4TXWlmWPqM9X2XIBhF6qETb7avE=;
 b=c1FrXatlp6ufvEOREZDB27CgWqJmnMGdJLVctO1DKJFV87e4JXUETEegRpDt+ihiQOtpAGastg3imAR5WNZkyTcKAEw0zBo/FOM16TTlUGMnqvjxqXK1ReEv+yj7wXXESoyTZeyoudhTu22U2XFO+1FrcZFyfOwwAgSAUbqHOwE=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Topic: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Index: AQHY+Io5SsSPwLQd50Ssx9qPxKXw6q4/rWQAgAIwJACAAGmBEA==
Date: Thu, 17 Nov 2022 00:32:50 +0000
Message-ID:
 <AS8PR08MB79914273B496A2369DA089DE92069@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
 <29469c16-856c-bce7-c556-66622e349f1c@suse.com>
 <2334ba7c-d744-c1ca-8f67-b2013e9c5fe4@citrix.com>
In-Reply-To: <2334ba7c-d744-c1ca-8f67-b2013e9c5fe4@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A0A92095E3A37747A62DD842BD9AB497.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8978:EE_|AM7EUR03FT062:EE_|DU0PR08MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f7cd1d-bab0-44be-c354-08dac8334781
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g5YuA1QXIRzslmShASxC2tSxuMSFcBxI3YJHSrTH4ofyMrmLcF8cBd0k3cVgBiilsON22j0sE6R97tXrJ1dut1uGQhlQt4+9IVrm0QEdbufaLIl70W9ALeEmadZfzeSZVaKIL1/YY49wMcV+n7qW3SdLFEvyPXC8PVuJRkexAVArAro3gjEia9loPXhHRX3T9wT45YmXRzuk+D2yVeUyptC+kKorsX+YSBC6PnMa6WY0nib6L4iaTejmy28B7745iSRCAZp+a9L9BXpapAjK9sKavk3c4mqRhpa7avsa/Cx0s2yzC7NnoXGWL+R3gb7dMA0QypSIo7j5kZgEbEAmH8GJ7JVgm5xHASMLhRU1kkIy+Pyoh8FQTU8eBde3eNYfPhurXNNONuBaC1IYv/L6tKtvNTkZGJ+WVAhKilEF4/K7CWmtKdsZxZGv9sY4vonx0cnYYqAOdeBMy0OD/cpNuvhM/s5P14TXtjKnAbbp0EyjJ21zLnEag+wV5IWhdo0AwkUMFCzgaRSMIp7UOKJajkqNHenXxoIb+zKghTg31WLb2pjNxMdWVvLEa+Qn9AAwJc+yIz7IVXIHzn6mrcyIiAtADmMeCHWS/KmMtHKknmXdmHR1835lV0FlHMaRWGS80xH5ycBKMllHyUb1ikIdm0griPMz+Ylu2LqxufbaFkJ3QYw3XwqRIWBRE73uZqS+5tolD3d8wvjBvZJjDi4fRe/gVyB4GFNako6pxOna5Hcwe3feoMJQxV+I980LjfnvE2VDTu+FAVu+JjBZviIPVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(33656002)(38100700002)(86362001)(2906002)(4744005)(8676002)(8936002)(4326008)(122000001)(83380400001)(66556008)(38070700005)(110136005)(316002)(41300700001)(76116006)(186003)(54906003)(66946007)(478600001)(66446008)(66476007)(5660300002)(52536014)(64756008)(9686003)(26005)(7696005)(71200400001)(6506007)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7bf778e4-04be-47c9-8cfd-08dac8334249
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m72Uvp7O0dRAZKXtlVv3vf8dYaLXdktpCXLxlWjZVhLJ7aUi851boOawwijcR+DpFZbjSe1Eo+gibEn2XmYIOXIOa6h2jKDauX3LIyGq5yfLoqiTQYUPVy/5WdPRTe7Q/qKLOlj99u2qL9v1PH6ugxIl/4GYQL8FKtVqYu1Mc11vvlixhLEmNyQDwz/q7H73WQEy8/4fuK0DPnyFjgaqtlGlIgjKANcGrzd/D2iRgpBWQinj85Y5B2DClZRCX4DIa1ktPhbUEazsA5UNpDKsoF7rG3Ca/yznI6nTu2sXnst02/FvAY0lH66ECVZ2AL5zSeeudp1YIyCngnez4NfJxd9G6FbRMH0pWNRaJnVvqBuBxjf2Rs0SFG42v8lxUsIUXR1HioXRAzlkVMHoHRKrOaR9vEOQQ/Yl/162B4S3aEnE7TUd2NW7BwfeCNyW8RCH6Oq104YxKdvkZKQc2umlFht0MnW3RDgaPXVs3BccDwKsaxpRdgfzR/3miHVljtjOeqrxMsHg2syAlye46QiX6mFY8onyT8kklqg7hLXs5sS0k/cisQiaid7OMBh6eNPMBlrPDmhEYXER2mmPBWpGU1QI6CrgY6w0LJasu33vRKDaYJmtee3GA/y3V4b6LBrSAtZxszpRLZoJXcRiouJZWiFGb0LOEtf8DBBZIj9Ywc/BMogqLA1BRLZKOnFylCtJGtl/gQibyytg2iUgbDPJ2R5NdPzK7A2cCORwNmo4SwhI41+iI1BEQBtAVWYt5V4OWNfV/vxU2XB1M04WGU5frQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(186003)(83380400001)(6506007)(26005)(9686003)(82310400005)(7696005)(478600001)(40460700003)(36860700001)(86362001)(336012)(82740400003)(55016003)(40480700001)(81166007)(52536014)(33656002)(356005)(8936002)(41300700001)(2906002)(5660300002)(47076005)(110136005)(4744005)(54906003)(4326008)(8676002)(316002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 00:32:59.4295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f7cd1d-bab0-44be-c354-08dac8334781
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8254

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggZm9yLTQuMTddIHg4Ni9odm06IFJldmVydCBwZXItZG9tYWluIEFQSUMgYWNjZWxlcmF0aW9u
DQo+IHN1cHBvcnQNCj4gDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4gUHJvdmlzaW9uYWwgdXBvbiBSb2dlciBub3Qgb2Jq
ZWN0aW5nIChpLmUuIGhpbSBhdCBsZWFzdCByZW1haW5pbmcNCj4gPiBuZXV0cmFsKSwgYW5kIHBy
ZWZlcmFibHkgd2l0aCB0aGUgYWJvdmUgcmVtYXJrcyBhZGRyZXNzZWQ6DQo+ID4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IFRoYW5rcy4NCg0KUmVsZWFz
ZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQoNCj4gDQo+IH5BbmRyZXcNCg==

