Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6897375AA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552272.862249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBheS-0006HK-7C; Tue, 20 Jun 2023 20:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552272.862249; Tue, 20 Jun 2023 20:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBheS-0006FE-44; Tue, 20 Jun 2023 20:08:32 +0000
Received: by outflank-mailman (input) for mailman id 552272;
 Tue, 20 Jun 2023 20:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2irc=CI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBheQ-0006F8-Qt
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:08:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384e3f4a-0fa6-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 22:08:28 +0200 (CEST)
Received: from DU2PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:10:232::28)
 by PAXPR08MB7490.eurprd08.prod.outlook.com (2603:10a6:102:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 20:08:25 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::a) by DU2PR04CA0083.outlook.office365.com
 (2603:10a6:10:232::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 20:08:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 20:08:25 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 20 Jun 2023 20:08:25 +0000
Received: from 7f82db77059e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1139284F-16F9-499E-8EED-5CDE8158E5EB.1; 
 Tue, 20 Jun 2023 20:08:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f82db77059e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 20:08:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8657.eurprd08.prod.outlook.com (2603:10a6:20b:565::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 20 Jun
 2023 20:08:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Tue, 20 Jun 2023
 20:08:16 +0000
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
X-Inumbo-ID: 384e3f4a-0fa6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw99xWogjdWBedewA/C/J9H/djM3wdn7pVa0v5ebsBQ=;
 b=395CCCr235uJ7K4UeKBXySIU5q+ibAU/csQsoiJHmoICl9eeOqy8zrFBvSC9NwN+FgUACkeGuLImW1qdPiW4P6aRVv80g3CED8wyjcyLRTIZwRkRKLtr3issJsupdXgiV7KQh9DPtKyMGgcTO1/WxKYWoQafLiMCBVHcryCNMXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 185425556636f6fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPoNHG6SVAFv3A+ULji3/WRZHxQ5fHT0qYW31ed8PfSzhmdJnaPjy7m9DvctU4d8i9d8yO2l4t3VHrqSstd9sy7+1j/iAdBWTlrLF9bXmncq/TJxgpRWw0Wm8tDHQ9oBiwQA8xNtgwC9kTql6Am3dnoworFAOka44DkC7Bc7V9F538feYN5YEX+kFcrny5Pe+PMuqKK+XWux1nMkMX8oxc6SPKHMQUt6Mr1PZWB+d/He7i4vHgpHDBh2OCIDCED6P6AIEi21zN43rhtUIaK2QN57CNjodrIjvIAyFCG5qx3KR8P5hWEE/ZD/z9P7u+9LTtQheCJzJ9ndVCct40B4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw99xWogjdWBedewA/C/J9H/djM3wdn7pVa0v5ebsBQ=;
 b=Y0YdcOhbqfDy87Axl8EacapuJCEQcF6KRX3h58UDikyGO3GLSUkpygAcl0Q/DvNsMV+pyorVVep8DNNiBLvtpYbgvorQy8Ds3RTtBxYT8OhE7UP02HBZzeYSyqA/5BosZ2dslbBktgCX0NKv/uoxjDOc0qnMNPWFWZFozhCHuHO3KZ+Y8TQAOz4kUIZt38NsSz56EDW8e/tHKfw80GjbO8wccJxcTRsG669KVusNO49HKElfip00tEM96wEXF48/D98X2ZJ16oLoAK5EPh+Gjyvl1G+uKer7gON/onRJrtXllKDpBxXvyoxyec3BPtmvLzkyKu0Uy4LmUZHzP6s5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw99xWogjdWBedewA/C/J9H/djM3wdn7pVa0v5ebsBQ=;
 b=395CCCr235uJ7K4UeKBXySIU5q+ibAU/csQsoiJHmoICl9eeOqy8zrFBvSC9NwN+FgUACkeGuLImW1qdPiW4P6aRVv80g3CED8wyjcyLRTIZwRkRKLtr3issJsupdXgiV7KQh9DPtKyMGgcTO1/WxKYWoQafLiMCBVHcryCNMXY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "consulting@bugseng.com" <consulting@bugseng.com>, Gianluca
 Luparini <gianluca.luparini@bugseng.com>, Michal Orzel
	<michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan
 Kumar <ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012
 Rule 7.2
Thread-Topic: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012
 Rule 7.2
Thread-Index: AQHZo2afksvNjPDPpkuuVAXSvearq6+TodUAgAB9NwA=
Date: Tue, 20 Jun 2023 20:08:16 +0000
Message-ID: <37C5BC47-E735-4731-A6C6-F30189FA6B9D@arm.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com>
 <7cdd53c7-4d57-39f2-10fa-2fa2ddc98389@suse.com>
In-Reply-To: <7cdd53c7-4d57-39f2-10fa-2fa2ddc98389@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8657:EE_|DBAEUR03FT017:EE_|PAXPR08MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ec17c1-9ee0-4735-7112-08db71ca1adf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +rN+F5CiJALqKqG1L1cStV20wijTTdjpL6abfMgvsqjZiC60Wj5M+XH7qfhrA2q5Iau52INfqe00nKOKDETe5OElEX+GmqUyEs5ReLwVU7my45L5RlBwYfpZSK1yohHD/zuHRmEZMVas+7zrc71AA1HnNJM039c1Y8nYWcf8e8UWzc1WvDrdmKAkUv/kQ68xcTsB3/aMSHgLitH4QCRCIq0LFZj2/eobHV8di7b/9UJw9lt7gJUcDVRmBDln1OQXNlfZBU3A6/TWWbPniQLFQ2MSSk/6u29dKs2W3JOjrR6WgplQ6oA3k9IyuLOiWdoXmtckDyj0PtWFT4JfhOFcI7FDJNBnSUJeM0pvCXkMK053Ci4Zm0Se7uAVgFz4q5+Y2TrPaK6J2DhRavuL6fGCGjAKwFL2eYk5orLt6T4pGqe1Z+OJD6aKicnp68Lg4Gdts5hagUwto/bkPQDnXcmspZ9cXGxHAQWy+aHGAVd8qXJ0bgn/YUbpqxL7imvI9art2CoNrknc6R9ezdNe8c6Eb/lgpRTfyikcQDN2Jr2g5XTU60pYh42TFd82xwLZwj36dBBCthA0QgQHFCASAJRX0Mmzty62XyPvfqp2QaP4FRJPI3I714pwHlcRn1MHm7jaeqTkFFtW5kyAU/7lnwjeFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(7416002)(8676002)(8936002)(54906003)(36756003)(41300700001)(5660300002)(2906002)(316002)(71200400001)(6916009)(4326008)(76116006)(66446008)(91956017)(64756008)(66946007)(66476007)(66556008)(33656002)(6486002)(478600001)(38100700002)(86362001)(2616005)(122000001)(186003)(53546011)(38070700005)(6512007)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4E9FC93D1EE5C468C9FF9AC3E1E0EEB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bf8ccc7-408c-444d-b04d-08db71ca15de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRepRdNzEEs3tE7Wt27osfaSntqdT3guw9pDGzzQEc5cKebkEJgROHdX/xM1Jy33BqPrbo3tyKwayo/dG34QHEmsRnyOv8HLsH2jhmG3SR4Zkchuqy98gUor1STe5Zfe9Vj7bixCrT0kG9x4ahccPihNLizDS2p1gNgqz8hmF7v39JYghRBWw5Nbm3d0WvVX6iT/EyytnWu3ur001hIrBBGFheij9bH+owBdcEnedfxsQkRhjdCo4ehcZtodymU/eMLbTPWTyCA+WXBG7oW7PS0J4s01EZfsFQrvSJ4VUXTbEKzfIt73RHe+JlMqiRXvZIkd+Ookp11M5G4+Pg9uA1IHmE2n9zbJIRpMP8z2fov8JNhwKOoHOOfO9DR47VrRIa0+/+htiZY9nvlYJ+kUJu9s9qrMRvXo/zVIuR+rDTS/rWVCCBL+GUIa9LyHSni5Samkz6pHiSkn8YMDnOjPPwwaXqNoHqGcSqKA4I23RS0i0CnsSMXZ1FXLugtWbxr7bxSdWLm0aDaKRCXCnGxeLXYduOA9xfyfwFlacYCbblOlb4bdIPDJbydxN9Z9k2TARjU06emcEAm3KCUFL6FPvrGXDJhb4BM6XnY1DXDpbRHZEcpJmungKh3z0eCKPGRR3ZLWJgH9f98cm4Qtf1JXwnRNGy14yywvSjb7tyBAwr/w0KcsEDuqA29kiQneU8aDlIP6wRv9DWRN0RLa3LlRHjvZ5MtHlajBTgLSDNlbgs1NEKS/jI/C13d6ISmDyBmE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(53546011)(81166007)(356005)(6506007)(6512007)(26005)(2616005)(336012)(47076005)(186003)(36860700001)(40480700001)(2906002)(33656002)(5660300002)(6862004)(8676002)(8936002)(36756003)(41300700001)(316002)(478600001)(70586007)(40460700003)(4326008)(54906003)(86362001)(70206006)(6486002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 20:08:25.1240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ec17c1-9ee0-4735-7112-08db71ca1adf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7490

DQoNCj4gT24gMjAgSnVuIDIwMjMsIGF0IDEzOjM5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAuMDYuMjAyMyAxMjozNCwgU2ltb25lIEJhbGxhcmlu
IHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LWRlZnMu
aA0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LWRlZnMuaA0KPj4g
QEAgLTM4LDQ5ICszOCw0OSBAQA0KPj4gICAgICAgICAoKHVpbnQ2NF90KShvZmZzZXQpIDw8ICgx
MiArIChQVEVfUEVSX1RBQkxFX1NISUZUICogKChsZXZlbCkgLSAxKSkpKQ0KPj4gDQo+PiAvKiBJ
T01NVSBDYXBhYmlsaXR5ICovDQo+PiAtI2RlZmluZSBQQ0lfQ0FQX0lEX01BU0sgMHgwMDAwMDBG
Rg0KPj4gKyNkZWZpbmUgUENJX0NBUF9JRF9NQVNLIDB4MDAwMDAwRkZVDQo+IA0KPiBTZWVpbmcg
dGhpcyBhbmQgc2ltaWxhciB1c2VzIGZ1cnRoZXIgZG93biwgSSB0aGluayB0aGVyZSdzIGEgcHVy
ZWx5DQo+IHN0eWxpc3RpYyBxdWVzdGlvbiB0byBiZSByZXNvbHZlZCBmaXJzdCAoYW5kIGhlbmNl
IEknbSB3aWRlbmluZyB0aGUgVG86DQo+IGxpc3QgaGVyZSk6IERvIHdlIHdhbnQgdG8gYWxsb3cg
ZWl0aGVyIGNhc2Ugb2YgVSB0byBiZSB1c2VkDQo+IGludGVyY2hhbmdlYWJseSwgbGVhdmluZyB0
aGUgY2hvaWNlIHVwIHRvIHRoZSBwYXRjaCBhdXRob3I/DQoNCkJlY2F1c2UgeW91IGFzayB0byB0
aGUgbGlzdCwgbXkgcGVyc29uYWwgb3BpbmlvbiBpcyB0aGF0IHdlIG1pZ2h0IHdhbnQgdG8NCmhh
dmUgb25seSBjYXBpdGFsIFUsIHNvIHRoYXQgaXTigJlzIGNvbnNpc3RlbnQgYWNyb3NzIHRoZSBj
b2RlYmFzZSBhbmQgd2UgZG9u4oCZdA0KbmVlZCB0byBjcmVhdGUgdG9vIG1hbnkgcnVsZXMgZm9y
IHRoZSBkZXZlbG9wZXIsIGl0IHN0YW5kcyBvdXQgYW55d2F5IGFzIGl0IGNhbuKAmXQNCmJlIGFu
IGhleCBkaWdpdCwgYWxzbyBtYXliZSBldmVyeSBoZXggY29uc3RhbnQgaXMgbmljZXIgdG8gaGF2
ZSB3aXRoIGFsbCBjYXBpdGFsLA0KYnV0IHRoaXMgaXMgYW5vdGhlciBzdWJqZWN0Lg0KDQpTYWlk
IHRoYXQsIGNsZWFybHkgaXTigJlzIHVwIHRvIHRoZSBtYWludGFpbmVycyB0byBjaG9vc2UuDQoN
Cj4gDQo+IFBlcnNvbmFsbHkgYXQgbGVhc3QgZm9yIGhleCBudW1iZXJzIEknZCBwcmVmZXIgdGhl
IHN1ZmZpeCB0byBzdGFuZCBvdXQ6IElmDQo+IHRoZSBkaWdpdHMgdXNlIHVwcGVyIGNhc2UsIGhh
dmUgdGhlIHN1ZmZpeCBiZSBsb3dlciBjYXNlIGFuZCB2aWNlIHZlcnNhLg0KPiAoSWYgdGhlcmUg
YXJlIG9ubHkgbnVtYmVycywgdGhlbiBzdXJyb3VuZGluZyBjb250ZXh0IHdvdWxkIG5lZWQNCj4g
Y29uc3VsdGluZy4pIEkgcmVhbGl6ZSB0aG91Z2ggdGhhdCB0aGlzIHdpbGwgbm90IGZpdCB3ZWxs
IHdpdGggdGhlIGRlc2lyZQ0KPiBvZiBhdm9pZGluZyBsb3dlci1jYXNlIGwgaW4gbnVtYmVyIHN1
ZmZpeGVzOyBpdCB3b3VsZCBiZSBmaW5lIGZvciBlLmcuDQo+IDB4RkZ1bC4gTm90IHN1cmUgaW4g
aG93IG1hbnkgY2FzZXMgdGhpcyB3b3VsZCBtYXR0ZXIgdGhvdWdoLCBhcyBJIGV4cGVjdA0KPiBt
b3N0IGNvbnN0YW50cyB3YW50IHRvIGJlIHVuc2lnbmVkLg0KPiANCj4gSmFuDQo+IA0KDQo=

