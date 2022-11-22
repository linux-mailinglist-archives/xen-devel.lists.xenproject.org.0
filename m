Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB8633A69
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 11:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447063.702934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxQmO-0002Jf-Km; Tue, 22 Nov 2022 10:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447063.702934; Tue, 22 Nov 2022 10:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxQmO-0002H1-Hi; Tue, 22 Nov 2022 10:45:28 +0000
Received: by outflank-mailman (input) for mailman id 447063;
 Tue, 22 Nov 2022 10:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxQmN-0002Gv-81
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 10:45:27 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabf99b7-6a52-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 11:44:40 +0100 (CET)
Received: from AS9PR06CA0567.eurprd06.prod.outlook.com (2603:10a6:20b:485::35)
 by AM8PR08MB6467.eurprd08.prod.outlook.com (2603:10a6:20b:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 10:45:19 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::bf) by AS9PR06CA0567.outlook.office365.com
 (2603:10a6:20b:485::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 10:45:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 10:45:19 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Tue, 22 Nov 2022 10:45:18 +0000
Received: from 824d84545918.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B24797F-C5A8-4911-92EC-F77C61C36745.1; 
 Tue, 22 Nov 2022 10:45:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 824d84545918.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Nov 2022 10:45:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5637.eurprd08.prod.outlook.com (2603:10a6:10:1b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 10:45:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 10:45:09 +0000
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
X-Inumbo-ID: aabf99b7-6a52-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL45yE1auA7pXF1rabve14a/zbaXeKNZRFhxInGfmKU=;
 b=nNZntcHGfKxncZLQlYjuseftFsBVLoAPsh5zzs9DEzyPjZFbbC7ow6gf2JkVt7SJfOvCzcw8X7QelJV+cAHijz9j2yTa8ji8h+z/fbBBQXe+lj1ztJImMM04eDwk9remjqY4EG6kAcpY2CGCnHTfWHP2JN/ZohUyHgjv0twcD5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e32d7a7df4ffb05
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOoppdOHG1JUlX+SiTZ3tsdOetIUEAVmqnlbaVCOFO2y41U+0op6RfmPpix5Uyo2VubXuIPlKFUQBorE5RRTNrfsaC0Wu/hVeVtmodcnNGQMYtcDeVi9ty+bwNTUjwp0h8QhXeInjCv71SlUyYjKMjM22QS6yVxm4qjklPD34to+hz00NSMJaklBhdWOmZfSjoVRLLIPXnC4Y+Lx1HLeBoiIZMKE4Elnnxqnc3RR3U/DWy7bTHO64kRtra+diOMDPVKEzekrCo5xEcvJ9ZMpRID1RaCFUm11qLpEXpNOhVy8kDfgeP1FIyqWvwzOev4wO13Gt6Beofvut21NSeWhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL45yE1auA7pXF1rabve14a/zbaXeKNZRFhxInGfmKU=;
 b=lede8blayh62s8eU1wi9Rc9kWU6Yn08AV27qtQuLgLiHCx+XhkkkJXsYcihRrlgZmHMn9llbW8DFgFcgRtd8gTFoMppCdsXBN7Emm3w3iP/GGmEHD1RxtbRK7/9zfhcyU9NyziUeaPHP6nU+liu88SU+4kdAQKjdsDa21vrhu82CGrzenpXJ0TBVT7YHnzOwaKYKrvflm3gcf3gYdPqNC0eaZj8eG4DDU9bZNxgX8/pbOVWk47LBAdHdIWdnRczs44T++l4Mn+Z6GrHEPobA57IOz3gj6NdZodhOGYTmwPK0SDnc+NTsOObS/tE/1x7FcB+CgmnbC+q31B66IiCEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL45yE1auA7pXF1rabve14a/zbaXeKNZRFhxInGfmKU=;
 b=nNZntcHGfKxncZLQlYjuseftFsBVLoAPsh5zzs9DEzyPjZFbbC7ow6gf2JkVt7SJfOvCzcw8X7QelJV+cAHijz9j2yTa8ji8h+z/fbBBQXe+lj1ztJImMM04eDwk9remjqY4EG6kAcpY2CGCnHTfWHP2JN/ZohUyHgjv0twcD5s=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Topic: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Thread-Index: AQHYM7LpT1yHXMQKSUCKpVv8817rGK5MN16AgAAcG4CAAANG8A==
Date: Tue, 22 Nov 2022 10:45:09 +0000
Message-ID:
 <AS8PR08MB799148BAA16C7D382ABBD545920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
 <22626b14-8047-8fbe-0668-5caeff304640@xen.org>
 <1977c21c-4c77-e2e5-76ee-0a5d4c0fa977@citrix.com>
In-Reply-To: <1977c21c-4c77-e2e5-76ee-0a5d4c0fa977@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 971F519E2E538045B14637933C59231D.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5637:EE_|VI1EUR03FT017:EE_|AM8PR08MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dfecd1-9fc2-4bf7-6255-08dacc76a63e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WDoxlbe8vyDDcdm48ZTIBKkcvtNrtaSf5PKBdlb/s3tSchnEAd7yGD7fxjPRaaTe6vFqCvUn7GrDK4XSg/w8xd4eU7bRr5pjGbkCyiq5ZsG5Wh2CnG5KuAGEYjKtsPygWpiZ8vzcWtbkAq1d5u38Xis2Kz0AIrTN1iiw1XJOj6mu6vVn8SgAS/jP0Wb/BvOLKX6L5+CWggWhIfORAwSVTlVkttWldKnt8BJFfRSm24rG75IUM365qizglVaXh2kzaImEFMa05YQPH1CDb6mRwACCAx66U/ROrn6cxOS7gSm1TEmrNMzEUGxMsrXycFlJcSAYGDgybqjcf/LllRL1VaDa3dfYDmMxKEBJnUPozUOhUXh108yw9eU1QsiccKVRV5ujmCv51PnlvXyaF2HvPDrA0wIDxnT/4LXx7iVxySyvJgd/kOe5H5XkaVtteRoySU5DX/N5jY26a0a/gy7UiKhoBRg9b3EtFwlYOV+MHJh+I6Rfhvx6CniDuz9yA94PvmFdYafbNu6lZVgK1UawIXlQx1Z09p2OvoI4RsJfjdHl7l1Ssn9yl2oLTzhe5qzdFYxcgTu4MYKD3+nwItYzH2uXMyTfAddBAqNWUfXxsVL4wtu1xAN/YMEzghGRqGYXJITRHQMiwrasTKJfiryXjjm4Zyb7HYBcthCaoUCABfojpZzxcO3A2MFgfglBMz5RVOGT21//f5l45FYVCm38AoJe0AeOSwnu48XIPCAq4/0iejn06od8nnHXeEAvJ8wojWEsS++v63PFenxKvXWux+G0MpCrigEN0xr0hnE4ycYFK+UbzvrE6bDzSeTfpHupXTuGpiOsgNrsv/RDPHECYoMfVE9K8aYhs6AoqQ/+OUs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(41300700001)(76116006)(52536014)(8936002)(54906003)(316002)(66946007)(66446008)(5660300002)(66556008)(4326008)(66476007)(64756008)(8676002)(86362001)(6506007)(55016003)(71200400001)(478600001)(83380400001)(38070700005)(110136005)(2906002)(7696005)(186003)(53546011)(122000001)(9686003)(38100700002)(33656002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d68e3aa-f1c1-4b82-878e-08dacc76a05a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pFSdNfGTmcWDiyMuZlMKkdSAfeUiA0GkLW0WoGYrCJk9LyBXU6Nc806riEpnl53W1JNKa/vpHGHru5ZIZqUkplQ6Mh9Mb6WVp8bxM9gKHddbQ9rbqewxc61uR2O8Ws94LX33bE8L38niq9x7w6Zxugx8J25J3OqEuupZe4vc5ReGXlz/4o780PWZu9WE+RDEbESNUr3abuunlwR8ZGleHZ6MojZmoAgZs1eKQLHg42yXx7eGqJ5bNatEKnCeHeG+PuYqAhHiqA6FrMvFXtIzpcigQj/CubLN3tzbE7vuSkB4Vq0MTqisqOkdiYqppQWKkZal8xzzC1p04+5y7ddOb9s6YQeJzOFyd00ZtqxHM/Cx9b6HdiZ2ivXi+NKXre3tyqFPmUlpxtGrIxSTstZ7oJZnZ0/ZQria/b6YUXGLvaxwyLLnHGZiYPenMV1oGs6kER9OxTBaKg3ZRZ+NqglQGsAt5aebQKX2bzXZ2UOwXgzR1uoqytmJ3R8jf7RpCRZ1hhf12TBCkvt+ttwN4cJ3PBPkfxPNzPU1Dk2UxPO5Di2t01Ax1ZRQtOEdvdGLKXuXrq3GoTQ6rgIDfb968g7ENt2oSKYu8Svv2AXpuo9UO/x2luexWgqieEAglY+JujL3Q/cQpQtLeuZUvzeGKRq7ypqL+dm1Cw59CtlLDdv99RBl2sCNYgNTa+g12M4fv8LGuzyzmo8mDtulncbUBqrokM6fx6susZvOoiHwPmPj/L3XFVua5lcJkEFr2hS1Cs7PR1p0QZAFi/cdzpzX8uv0b+TytUXEyGG5yp62deLGsQ4Q48U27taDyJHsgbvO12lRtEPguAgvUbyLqhQfzmC/5mTMK+CLlwcHWXzNiRfWdVs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(316002)(110136005)(478600001)(47076005)(54906003)(52536014)(186003)(82310400005)(5660300002)(6506007)(53546011)(7696005)(336012)(2906002)(9686003)(82740400003)(83380400001)(26005)(356005)(41300700001)(40480700001)(70586007)(70206006)(8676002)(36860700001)(86362001)(4326008)(55016003)(33656002)(81166007)(40460700003)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 10:45:19.2566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dfecd1-9fc2-4bf7-6255-08dacc76a63e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6467

SGkgQm90aCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDIvMl0gQ2hhbmdlbG9nOiBBZGQgX19yb19hZnRlcl9pbml0IGFuZCBDRVQNCj4gDQo+
IE9uIDIyLzExLzIwMjIgMDg6NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiBIaSBBbmRyZXcs
DQo+ID4NCj4gPiBPbiAwOS8wMy8yMDIyIDEyOjM5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPiA+PiAtLS0NCj4gPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4g
Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPj4gLS0tDQo+ID4+IMKgIENIQU5HRUxPRy5tZCB8IDYg
KysrKysrDQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPiA+PiBpbmRleCA4
M2Q4NWZhZDViYmMuLjU3NzUxNzM4M2VjOSAxMDA2NDQNCj4gPj4gLS0tIGEvQ0hBTkdFTE9HLm1k
DQo+ID4+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPiA+PiBAQCAtNiw2ICs2LDEyIEBAIFRoZSBmb3Jt
YXQgaXMgYmFzZWQgb24gW0tlZXAgYQ0KPiA+PiBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFu
Z2Vsb2cuY29tL2VuLzEuMC4wLykNCj4gPj4gwqAgwqAgIyMgW3Vuc3RhYmxlDQo+ID4+DQo+IFVO
UkVMRUFTRURdKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hv
cnRsb2c7aD1zdGFnaW4NCj4gZykNCj4gPj4gLSBUQkQNCj4gPj4gwqAgKyMjIyBBZGRlZA0KPiA+
PiArIC0gX19yb19hZnRlcl9pbml0IHN1cHBvcnQgb24geDg2LCBmb3IgbWFya2luZyBkYXRhIGFz
IGltbXV0YWJsZQ0KPiA+PiBhZnRlciBib290Lg0KPiA+DQo+ID4gVGhpcyBpcyBhbHNvIHN1cHBv
cnRlZCBieSBBcm0gKHNlZSBjb21taXQgYWNlNDAzMDIyMzU4ICJ4ZW4vYXJtOg0KPiA+IFN1cHBv
cnQgcHJvcGVybHkgX19yb19hZnRlcl9pbml0IG9uIEFybSIpLg0KPiANCj4gWWVzLCBJIGtub3cu
wqAgQ2hlY2sgdGhlIGRhdGUgb24gdGhpcyBlbWFpbC4NCg0KVGhhbmtzIEp1bGllbiB2ZXJ5IG11
Y2ggZm9yIHBvaW50aW5nIHRoaXMgb3V0IDopIEkgd2lsbCBjb3JyZWN0IHRoaXMgdG8NCiItIF9f
cm9fYWZ0ZXJfaW5pdCBzdXBwb3J0LCBmb3IgbWFya2luZyBkYXRhIGFzIGltbXV0YWJsZSBhZnRl
ciBib290LiINCmluIHYzIHdoZW4gSSByZXNwaW4gdGhlIHNlcmllcywgc2luY2UgSmFuIGFsc28g
cHJvdmlkZWQgc29tZSBjb21tZW50cw0KYWJvdXQgcGF0Y2ggIzMgYW5kIEkgZ3Vlc3MgQW5kcmV3
IHdvbid0IG1pbmQgaWYgSSBkbyB0aGUgcmVzcGluICg/KS4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg0KDQoNCj4gDQo+IH5BbmRyZXcNCg==

