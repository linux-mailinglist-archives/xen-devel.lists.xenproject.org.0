Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5D49DCBF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261316.452310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Oh-0003fE-Ba; Thu, 27 Jan 2022 08:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261316.452310; Thu, 27 Jan 2022 08:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Oh-0003d4-8T; Thu, 27 Jan 2022 08:44:51 +0000
Received: by outflank-mailman (input) for mailman id 261316;
 Thu, 27 Jan 2022 08:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0Of-0003cy-Li
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:44:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6289be1a-7f4d-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:44:48 +0100 (CET)
Received: from AM6PR10CA0102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::43)
 by GV1PR08MB7363.eurprd08.prod.outlook.com (2603:10a6:150:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 27 Jan
 2022 08:44:46 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::67) by AM6PR10CA0102.outlook.office365.com
 (2603:10a6:209:8c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 08:44:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:44:44 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 27 Jan 2022 08:44:43 +0000
Received: from a0ab422b5cb9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB75B7DC-E613-46EC-BD3F-82D7E2908FF5.1; 
 Thu, 27 Jan 2022 08:44:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0ab422b5cb9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:44:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB7027.eurprd08.prod.outlook.com (2603:10a6:20b:34e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:44:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:44:30 +0000
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
X-Inumbo-ID: 6289be1a-7f4d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPJCqTHmwpltoHKb3HtG+WTzxhVcrMGlenQZU1EZIb4=;
 b=veAbBI5GwLv+kNAZLcoO/ISmRZKDAp2GLhWvhiE+8rwQvKlY+S5zAY1Jbhbx2PEgQE+D/FhhpGYQ9lbNYdqess/bzi5fWuXBdRnNVdrOqzSBVUmBoBMobLNTi4rCg/olPy5akSwjRZDg4+36bok444iBjeEQimwc08QV0ftILZk=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJr+fxZGu1pFKekBR1239Kbjq7HtlqpvVyeq4g2Vf6yJVfJ6l/U752bsjc9Vn/Trq/vdeguZ3d57u/OK+SM5x3F9FBqyV+XnfAwkJd679XH3T0yGNKlSFcLlntXbNG3khHgPG/C/DRbuB84RCFXM1zkhTwzWxe3/hAK0cLJ/r2s+EpyyRSUOqMy0uEy1X87DxHaJOf2fudJNj3muq5xV2RSeUC8drr73LVLYql158WY3pg/GIy6H1CUWi08HlbR1/OR30Aa2xgF0IwCyRvaLvo03x/PVoPRWQ94j0s04GI1thpHOM8mK3nySTukoijqDIPrLhry2yNRbGMX42GqWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPJCqTHmwpltoHKb3HtG+WTzxhVcrMGlenQZU1EZIb4=;
 b=lRKDoY5K45ZMsH5NLwfKzH6du/ehrKSSrh8rH8JK+6jaM6YQSU4Kho5Pmn6AMS3dJhNAP0IL3TkhSxVLMCI9NkzZIQycwnE974MGZOGYhy1u9QXoRZxlCxNyD9L51kIAyt4X140sMmlM8wPn2GVw/F2PLGxixHSjsGJSdc6MKARtMrphsOHBInjjulMSSORQR5QH+vBkJSJu5J2QFoHR+8JbyWouhZ2lGO413mPCu8S2SFV1HTaUnPhoAsPN53wEqaTERR3YBdLycyixmC7KkMETy73cIrXY+oPx2sD9yS+1nDF7/IkIBOhB9PZF3paTAkOhx85hGHoszZ6kpMOr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPJCqTHmwpltoHKb3HtG+WTzxhVcrMGlenQZU1EZIb4=;
 b=veAbBI5GwLv+kNAZLcoO/ISmRZKDAp2GLhWvhiE+8rwQvKlY+S5zAY1Jbhbx2PEgQE+D/FhhpGYQ9lbNYdqess/bzi5fWuXBdRnNVdrOqzSBVUmBoBMobLNTi4rCg/olPy5akSwjRZDg4+36bok444iBjeEQimwc08QV0ftILZk=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index: AQHXsHMtR+l18+MmpE6rl/RjSXTBgqx0TXyAgAME0EA=
Date: Thu, 27 Jan 2022 08:44:30 +0000
Message-ID:
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
In-Reply-To: <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0B26039A0A4C7C4DA094F99B4F734DB7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 710486eb-0db7-4f82-18af-08d9e1714460
x-ms-traffictypediagnostic:
	AS8PR08MB7027:EE_|VE1EUR03FT044:EE_|GV1PR08MB7363:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB73637BA34BEA7AE9928774719E219@GV1PR08MB7363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DFdi154/sf1XAaKoKyXe2r3DWiCCLn0bBTUfmIvzOFFQv9FC6jSxERXukgsZGucs7A299K3s9903uGuDNL2OeWOx8QZxCTScVQYU7RnrNYdec2B3E5/X9pwLtlYocP/b1mo009eH0Z0Dhi8kc4qVUqPLZ+Fb3YpK117P4xjCTWYAprew5j0/aKlAW5gtziUTtLh7qDtSbD6U+UccPQQs2it0P2v6tVH4aqOgNoYz52g7FoKBPHBEvAncYrGsiYvToUF493TzILxJOy36C/MYI5n6j0KX6CGGIuaLi0kVmumn4MxkeRPsUA0CqwID8g/WBAMo31UrO6MzX7ar7jhQx0iV1KEUTy3sMwYN+kzBcoQoa6EBiPHG+oAHUKz5pM+0dN+stZZZQJxHtBnMzVSTC/q5Qu3ZTfb6UM4JGMhIhMSCScYeG5Qr3C8mFWHcDUFl368n66TS3vsY42grh4J/S3/OKusb/RrYphcZ9fCwbiCMmEYuTkmUibw0FFKBgsuPvQ+Spxb+de0ZO1YvnISWqNYrBBcVY/sg8YQztLxEIUzD09b3JX4McRZK4/qOwBoCsAyaJroVQF+SPlvjkW2Fh5I0DA3Qiq+KpzHJje0s8uZd/SYFjRekE+bc4PTpBpmko23+RfXIuMIOlsE3vc1kL7SSk4hdvJ0/QZ3VU9a+6wcluTr4OUXer3E3HUD8LsHOU1PPeZZMnLxD+aHBYzxdWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(7696005)(6506007)(26005)(86362001)(76116006)(9686003)(66946007)(186003)(8936002)(4326008)(66556008)(8676002)(53546011)(66446008)(66476007)(64756008)(38070700005)(5660300002)(55016003)(122000001)(54906003)(71200400001)(83380400001)(6916009)(508600001)(316002)(33656002)(52536014)(38100700002)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7027
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4c13ed3-e00e-4c1b-4259-08d9e1713c58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e/BIBRP9mmd+Ye6dmrDvpsUnLlPI2bBr4vTf+6hko7UE3bJcEtmk0a04el0rtZ2YAWfBVZhansQrPZWaA72kC7AdSHLpOyoIGpQ7QtZ+QqevHnGbPuOhaniMXuZk8+365LNJGNrIUGUUMXFZkFDqy6kVDxFeMnOQh3ZY1ynXeEbsbRa6LjGg4/4ctSC0l3Jvi6NPzCaTqhwGU6lM9G3wXZdUke5uR4ej2Vzp+wzSOjbazobae7lPnEQYGp5rmdQxQgK06oy/Nhzmsu/c3sGSdMk7IKuVWBnreI5b2AdFjTkgpp6mgGPLNuXaVi0YXtq3JntiDOd7SBonnXRxrnYjSFiFXH243LqjtiYZ/yA2I6hwEzz0QbqB8PSXMxshcnmIVxWVR/myrXGwa52Laa4vQ+OwAPLyoai0BTgw9Lxlji+Bbd5x5O78VwxQkGAwTQlibdtqWD4l/00d1vVJCKMVk6ngw8NCiN8+WkeICsHhCvqSKhl+jCNM2PpTWcXxAq9vkvIRKDqKgH+EzKXhq6zjeh2Mo2pM+U2usjFMd2xFDo4cKH4yHzvY2JmpKGNlb7w5oLbmHOrqVmhw2YITZp0/M2A8HyFLjABqckMRhcoFOHTWWBZndZky6eQVUK5ry4x5fw1Uis6j1lI2/o5JG2S0WMSF8k5ROvWFxAhJKtfJV7LkJbWYAjIrARSp5fnOCK1WzJryclXteoszjynJb8DekcR331Y0F3iL1yFq2ynL1WGz9kBu8/JnhBbughDwepGmiA4ZrVvQv1WidvVrNjJvPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700004)(40460700003)(316002)(63350400001)(186003)(33656002)(86362001)(70586007)(83380400001)(82310400004)(2906002)(336012)(4326008)(508600001)(5660300002)(52536014)(8936002)(6506007)(8676002)(26005)(356005)(81166007)(70206006)(53546011)(54906003)(9686003)(55016003)(36860700001)(47076005)(63370400001)(7696005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:44:44.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 710486eb-0db7-4f82-18af-08d9e1714460
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7363

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODozNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIgQVBJ
IGZvciBub24tDQo+IEVGSSBhcmNoaXRlY3R1cmUNCj4gDQo+IE9uIDIzLjA5LjIwMjEgMTQ6MDIs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ICsrKyBi
L3hlbi9jb21tb24vS2NvbmZpZw0KPiA+IEBAIC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09NUEFU
DQo+ID4gIGNvbmZpZyBDT1JFX1BBUktJTkcNCj4gPiAgCWJvb2wNCj4gPg0KPiA+ICtjb25maWcg
RUZJDQo+ID4gKwlib29sDQo+ID4gKwktLS1oZWxwLS0tDQo+ID4gKyAgICAgIFRoaXMgb3B0aW9u
IHByb3ZpZGVzIHN1cHBvcnQgZm9yIHJ1bnRpbWUgc2VydmljZXMgcHJvdmlkZWQNCj4gPiArICAg
ICAgYnkgVUVGSSBmaXJtd2FyZSAoc3VjaCBhcyBub24tdm9sYXRpbGUgdmFyaWFibGVzLCByZWFs
dGltZQ0KPiA+ICsgICAgICBjbG9jaywgYW5kIHBsYXRmb3JtIHJlc2V0KS4gQSBVRUZJIHN0dWIg
aXMgYWxzbyBwcm92aWRlZCB0bw0KPiA+ICsgICAgICBhbGxvdyB0aGUga2VybmVsIHRvIGJlIGJv
b3RlZCBhcyBhbiBFRkkgYXBwbGljYXRpb24uIFRoaXMNCj4gPiArICAgICAgaXMgb25seSB1c2Vm
dWwgZm9yIGtlcm5lbHMgdGhhdCBtYXkgcnVuIG9uIHN5c3RlbXMgdGhhdCBoYXZlDQo+ID4gKyAg
ICAgIFVFRkkgZmlybXdhcmUuDQo+IA0KPiBUaGUgd2F5IGVuYWJsaW5nIG9mIChmdWxsKSBFRkkg
c3VwcG9ydCB3b3JrcyBvbiB4ODYsIEkgY29uc2lkZXIgaXQNCj4gd3JvbmcgLyBtaXNsZWFkaW5n
IHRvIHB1dCB0aGUgb3B0aW9uIGluIGNvbW1vbiBjb2RlLiBBdCB0aGUgdmVyeSBsZWFzdA0KPiB0
aGUgaGVscCB0ZXh0IHdvdWxkIG5lZWQgdG8gY2FsbCBvdXQgdGhlIGV4dHJhIGRlcGVuZGVuY2ll
cy4gUGx1cyB0aGUNCj4gaGVscCB0ZXh0IG9mIGNvdXJzZSB0aGVuIG5lZWRzIHRvIGJlIGdlbmVy
aWMgKGkuZS4gYXBwbGljYWJsZSB0byBib3RoDQo+IEFybSBhbmQgeDg2KS4gVGhhdCdzIG5vdHdp
dGhzdGFuZGluZyB0aGUgZmFjdCB0aGF0IHdpdGhvdXQgYSBwcm9tcHQNCj4gdGhlIGhlbHAgdGV4
dCB3b24ndCBldmVyIGJlIHNlZW4gd2hpbGUgY29uZmlndXJpbmcgWGVuLg0KPiANCj4gQWxzbyAo
bml0KTogSW5kZW50YXRpb24uIEFuZCBwbGVhc2UgZG9uJ3QgdXNlIC0tLWhlbHAtLS0gYW55bW9y
ZSBpbg0KPiBuZXcgY29kZS4NCj4gDQoNCkkgaGF2ZSB1c2VkIENPTkZJR19BUk1fRUZJIHRvIHJl
cGxhY2UgdGhpcyBjb21tb24gRUZJIGNvbmZpZyBpbiBteQ0KbGF0ZXN0IHZlcnNpb24uIFRoaXMg
S2NvbmZpZyBvcHRpb24gaGFzIGJlZW4gcmVtb3ZlZC4NCkFuZCB0aGFua3MsIEkgd2lsbCBub3Qg
dXNlIC0taGVscC0tIGFueW1vcmUuDQoNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmgN
Cj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgNCj4gPiBAQCAtMjUsNiArMjUsOCBAQCBl
eHRlcm4gc3RydWN0IGVmaSBlZmk7DQo+ID4NCj4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4g
Pg0KPiA+ICsjaWZkZWYgQ09ORklHX0VGSQ0KPiA+ICsNCj4gPiAgdW5pb24geGVucGZfZWZpX2lu
Zm87DQo+ID4gIHVuaW9uIGNvbXBhdF9wZl9lZmlfaW5mbzsNCj4gPg0KPiA+IEBAIC00NSw2ICs0
Nyw4IEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0cnVjdCB4ZW5wZl9lZmlfcnVudGltZV9jYWxs
ICopOw0KPiA+ICBpbnQgZWZpX2NvbXBhdF9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9uIGNv
bXBhdF9wZl9lZmlfaW5mbyAqKTsNCj4gPiAgaW50IGVmaV9jb21wYXRfcnVudGltZV9jYWxsKHN0
cnVjdCBjb21wYXRfcGZfZWZpX3J1bnRpbWVfY2FsbCAqKTsNCj4gPg0KPiA+ICsjZW5kaWYgLyog
Q09ORklHX0VGSSovDQo+IA0KPiBJIGNhbiBzZWUgdGhhdCBpbiB0aGUgbGF0ZXIgcGF0Y2gsIHdo
ZW4gaW50cm9kdWNpbmcgaW5saW5lIHN0dWJzLA0KPiB5b3Ugd291bGQgbmVlZCBjb25kaXRpb25h
bHMgaGVyZSwgYnV0IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhlbQ0KPiByaWdodCBoZXJlIChv
ciB5b3UgbWF5IHdhbnQgdG8gaW50cm9kdWNlIHRoZSBzdHVicyByaWdodCBhd2F5KS4NCj4gDQo+
IEFsc28gKG5pdCk6IE1pc3NpbmcgYmxhbmsgaW4gdGhlIGNvbW1lbnQuDQo+IA0KPiBKYW4NCg0K

