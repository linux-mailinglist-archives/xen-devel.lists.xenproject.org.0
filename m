Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FA70DBC7
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538440.838377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QXR-0001LX-Qo; Tue, 23 May 2023 11:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538440.838377; Tue, 23 May 2023 11:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QXR-0001Ju-O6; Tue, 23 May 2023 11:50:49 +0000
Received: by outflank-mailman (input) for mailman id 538440;
 Tue, 23 May 2023 11:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1QXQ-0001Jo-39
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:50:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d84b5b2-f960-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 13:50:45 +0200 (CEST)
Received: from DB6PR0301CA0046.eurprd03.prod.outlook.com (2603:10a6:4:54::14)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 11:50:16 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::7e) by DB6PR0301CA0046.outlook.office365.com
 (2603:10a6:4:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Tue, 23 May 2023 11:50:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 11:50:15 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Tue, 23 May 2023 11:50:15 +0000
Received: from d4b6237505fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 158FAB78-C492-4C52-B5BD-B3B8641032C4.1; 
 Tue, 23 May 2023 11:50:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4b6237505fa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 11:50:08 +0000
Received: from VI1PR08MB3760.eurprd08.prod.outlook.com (2603:10a6:803:c1::27)
 by AS4PR08MB7431.eurprd08.prod.outlook.com (2603:10a6:20b:4e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 11:50:06 +0000
Received: from VI1PR08MB3760.eurprd08.prod.outlook.com
 ([fe80::2fda:206f:dfef:271a]) by VI1PR08MB3760.eurprd08.prod.outlook.com
 ([fe80::2fda:206f:dfef:271a%5]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 11:50:06 +0000
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
X-Inumbo-ID: 0d84b5b2-f960-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gntxz5waQTKUMc2v5Abr7thKpt6n/nRJDpo0w5JvnFk=;
 b=8LVYmoRonWzeCIXkWHD1B5S+iZlbhcMtDPsOg23/+uBMj+i8L1fNCD0vFS5T+DxDe1oaN1YJiM5ofmuY613OtvD3yCH+LqMi2am6b9O39AA3TThz36z0kQ4sMzPgok4Soxzz6r2CUYx0mVGSYfKIDQVfv9gQHv7oZ0725uKdkcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a8c8fccef13b4c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ankw7P3NO9EB0dwHzGMNIq0ZtGP1VdPuhTMOF5H8tsq+skdsq36JrHK3PFG0tbJ0oUWNW5XyFdAuyt5fNm5pjnRGLm+2ALBnKQW2WvEIpqV+RLdiH5Uj41l8JERxhU64KgoW0rE1DLD1GIlDaq5SB983lEA07+R3caOt7U7cHdWdX5R2O83fsMHJmBZAqNLs5iDRrL6GLMsR4Y1p/N+uPNjmkZ0hGMIsZr8oR4o3XfWSjXsksHCA2LVzXKBOCFPX+V2iLr0V59GK5FfQwNuc0X2cCXJvVKoVcRhHYJAFGoD61IV2SvJAkoFvpLt4RBK6TfSPtoYoOtjnCmaMkr4syQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gntxz5waQTKUMc2v5Abr7thKpt6n/nRJDpo0w5JvnFk=;
 b=AnMImUt8Tl5geEhz9pK5yDXGKxtiydGOGoYrtWycX6+5w92rlc6PUEkyYoMestLREWVb5ueyvhkdup/QDMBEZEGSeaVJ4JHX9khZQbgyGE50VC/wU4Jpog4Q4qAiEAo1CxwH4cqG91o5BoTXkZWkeBelsEAkGQCBpCKZ89qbJeZK6nAT3kd6djFWIus3lCrYTYoggn6kIXqASDfRg8NpTKu/fDHqUlp3ZSb9kCFo/5Kk65PP4KTg57syl/OaysjzL5nIf1yzhQybSQnLvJ6HRCMA03VByhHKA79vuFqhHmYxoSZOfa/tDuAjeZw0bZfMlCfDEsBmpLyXRpQsYhhRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gntxz5waQTKUMc2v5Abr7thKpt6n/nRJDpo0w5JvnFk=;
 b=8LVYmoRonWzeCIXkWHD1B5S+iZlbhcMtDPsOg23/+uBMj+i8L1fNCD0vFS5T+DxDe1oaN1YJiM5ofmuY613OtvD3yCH+LqMi2am6b9O39AA3TThz36z0kQ4sMzPgok4Soxzz6r2CUYx0mVGSYfKIDQVfv9gQHv7oZ0725uKdkcI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZjUpfkyJmVIVJBUW8KdO0aW075a9noLWAgAAFYICAAALiAIAAFdcA
Date: Tue, 23 May 2023 11:50:06 +0000
Message-ID: <45285215-4528-435A-B203-B770D60FABAA@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
 <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
 <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
In-Reply-To: <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB3760:EE_|AS4PR08MB7431:EE_|DBAEUR03FT063:EE_|AS8PR08MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 146c2fa1-3fd5-4a5b-d2f3-08db5b83dfd9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wx/gVWLOD+abr4QkU4AeTwGweYY5tU4Dyvs6UsQpwzvwwm8dmO+uwU2FfeZNYTI/wXKxGRfZJTlHt8tFV7sTpfj3urcKW7NLf6oFDPU04Z93bLN3P5Af72FwhzMBfU7AgcQ04Bu5uosL9ic1nRVBR1SJlJrdS4T6NAMuxhdlzBhdrpjS6z2veDDH4yOWUnySXjOyhEwNlJuYLhvMpfWsKaCFfd/bem1ugXCV3GB3ZpQNgdakNhx2kuw6wsufnEeDnThvpkMPVYNizv4Dv7Ih6TGt+ZlmP30HCW62fMLDxL5OgWxjoF8Xj91KoMm/yf46BxUEhKkOTKch39TCZT7VRlZ/LKZEDU6/odUYqJk2eBTLF6IMMYR93kwvhG7N5Iz84uoqJdA7q2Xq8Nm1H2MaO+kJZytdIPiwEcWOlyadSeTwTAFGsSABtSQ/Etzlc1v2enOo0L325cvCbrXtpxA4EpJiQuBPcXPfVlVJv4EBSTE7nmyiHDkMEaTcMN9hu0BEHg/v5zQ1HEV0foKg7sAwYJYZZcB5D3cQz2iWVfhmV9MKfqVXhKCjNl2ULBDqmkLaC5ZX/80GziXfR3ivYSKVXaASj9ap3iy9PcfeUpX/o5twy0aVrTTrG5AlEX9/tMA5KZcKC6ipTVE6h7GyAFrqOg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3760.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(316002)(38100700002)(54906003)(76116006)(66946007)(66556008)(66476007)(6916009)(64756008)(4326008)(66446008)(91956017)(71200400001)(122000001)(41300700001)(478600001)(38070700005)(6486002)(86362001)(5660300002)(8676002)(8936002)(186003)(33656002)(53546011)(26005)(6506007)(6512007)(2906002)(36756003)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C0F2C5F71EA58409164D64D794858D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7431
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0d67079-9c53-4dec-1317-08db5b83da66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	59RwllMuR4ykA6vkI+6aduDosEBw7PzxpG6mODfhfBepEDS08tdYSCiTNvKKfqfITh73hKlUKHZ4Or0b8XGluGCLdMiJTorRABPyePq8b5P7eeKRHiE5OQCVgTgBPvhHDw9BciuQxDjmTHmuT3d9j98XIHpIu3RlfiDfiDkB++BfcUC011Qb5nlVz2xaa4PFb+3VaS0pK+u71W4LguCrbvH9WAm6SutueXvM3Xi3zx1DSyuwNuv7kQVDHKGk4m4gXK08mjO3x777ZQojIFy/TV36tpenJYyRTiwaslyV7hNkce+84LranZo1XEmPDv484IQ8dhKjYXlJzIcf9ZsY4uTmohuI8InitAyx4Bre4+c1EBqr5kfjVvBxEGsD/XlwCOTt9YqGXjxbVlDISzrT7nObA28LrGUH+5WQuE1YoPktn+c7LQe4nb5AYzcfEHVFen9tzpzijUPU8fG5iRAjmNVkAhKXFz7JXTMIxEW+3TTumgJDti2UWD2G2o5KClYCvL7f2IOblV8NIrXHCRrOf1oEHpGkW+JZAb0dxdRhVOrTeR1J3x6SdegJTOhiUL/8b6diHscoTQZ17hH5h/RjtacfVHfBgFduZpi4ADbDAM8bgSC246QZhMdLlJGBm2q5r6JDY1TQ0xDvCGP/25859J5XteQfKkB/7EITCci4LULm1vJNKoNG9oIJ26iw5pJvcc26fpJ9sqhjTKEsElbSHtRH6z94QtaZCwTgGscZkyMCC0fs0zwVskHA4DEikybT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(82740400003)(356005)(6506007)(6512007)(26005)(33656002)(186003)(53546011)(40460700003)(81166007)(2616005)(36860700001)(47076005)(36756003)(83380400001)(336012)(2906002)(40480700001)(6486002)(41300700001)(316002)(54906003)(82310400005)(478600001)(70586007)(70206006)(4326008)(86362001)(8676002)(8936002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:50:15.7338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146c2fa1-3fd5-4a5b-d2f3-08db5b83dfd9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDExOjMxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDUuMjAyMyAxMjoyMSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyMyBNYXkgMjAyMywgYXQgMTE6MDIsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjMuMDUuMjAyMyAwOTo0MywgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gQEAgLTgzOCw2ICs4MzgsMjIgQEAgQ29udHJvbHMgZm9yIGhvdyBkb20w
IGlzIGNvbnN0cnVjdGVkIG9uIHg4NiBzeXN0ZW1zLg0KPj4+PiANCj4+Pj4gICAgSWYgdXNpbmcg
dGhpcyBvcHRpb24gaXMgbmVjZXNzYXJ5IHRvIGZpeCBhbiBpc3N1ZSwgcGxlYXNlIHJlcG9ydCBh
IGJ1Zy4NCj4+Pj4gDQo+Pj4+ICtFbmFibGVzIGZlYXR1cmVzIG9uIGRvbTAgb24gQXJtIHN5c3Rl
bXMuDQo+Pj4+ICsNCj4+Pj4gKyogICBUaGUgYHN2ZWAgaW50ZWdlciBwYXJhbWV0ZXIgZW5hYmxl
cyBBcm0gU1ZFIHVzYWdlIGZvciBEb20wIGRvbWFpbiBhbmQgc2V0cw0KPj4+PiArICAgIHRoZSBt
YXhpbXVtIFNWRSB2ZWN0b3IgbGVuZ3RoLCB0aGUgb3B0aW9uIGlzIGFwcGxpY2FibGUgb25seSB0
byBBQXJjaDY0DQo+Pj4+ICsgICAgZ3Vlc3RzLg0KPj4+IA0KPj4+IFdoeSAiZ3Vlc3RzIj8gRG9l
cyB0aGUgb3B0aW9uIGFmZmVjdCBtb3JlIHRoYW4gRG9tMD8NCj4+IA0KPj4gSSB1c2VkIOKAnGd1
ZXN0c+KAnSBiZWNhdXNlIGluIG15IG1pbmQgSSB3YXMgcmVmZXJyaW5nIHRvIGFsbCB0aGUgYWFy
Y2g2NCBPUyB0aGF0IGNhbiBiZSB1c2VkDQo+PiBhcyBjb250cm9sIGRvbWFpbiwgSSBjYW4gY2hh
bmdlIGl0IGlmIGl0IHNvdW5kcyBiYWQuDQo+IA0KPiBJZiB5b3UgbWVhbnMgT1NlcyB0aGVuIGJl
dHRlciBhbHNvIHNheSBPU2VzLiBCdXQgbWF5YmUgdGhpcyBkb2Vzbid0IG5lZWQNCj4gc3BlY2lm
aWNhbGx5IGV4cHJlc3NpbmcsIGJ5IHNheWluZyBlLmcuICIuLi4sIHRoZSBvcHRpb24gaXMgYXBw
bGljYWJsZQ0KPiBvbmx5IG9uIEFBcmNoNjQiPyBPciBjYW4gYSBEb20wIGJlIDMyLWJpdCBvbiBB
cm02NCBYZW4/DQoNCkkgdGhpbmsgdGhlcmUgaXMgbm8gbGltaXRhdGlvbiBzbyBEb20wIGNhbiBi
ZSAzMiBiaXQgb3IgNjQuIE1heWJlIEkgY2FuIHNheQ0K4oCcLi4uIEFBcmNoNjQga2VybmVsIGd1
ZXN0cy7igJ0/DQoNCj4gDQo+Pj4+ICsgICAgQSB2YWx1ZSBlcXVhbCB0byAwIGRpc2FibGVzIHRo
ZSBmZWF0dXJlLCB0aGlzIGlzIHRoZSBkZWZhdWx0IHZhbHVlLg0KPj4+PiArICAgIFZhbHVlcyBi
ZWxvdyAwIG1lYW5zIHRoZSBmZWF0dXJlIHVzZXMgdGhlIG1heGltdW0gU1ZFIHZlY3RvciBsZW5n
dGgNCj4+Pj4gKyAgICBzdXBwb3J0ZWQgYnkgaGFyZHdhcmUsIGlmIFNWRSBpcyBzdXBwb3J0ZWQu
DQo+Pj4+ICsgICAgVmFsdWVzIGFib3ZlIDAgZXhwbGljaXRseSBzZXQgdGhlIG1heGltdW0gU1ZF
IHZlY3RvciBsZW5ndGggZm9yIERvbTAsDQo+Pj4+ICsgICAgYWxsb3dlZCB2YWx1ZXMgYXJlIGZy
b20gMTI4IHRvIG1heGltdW0gMjA0OCwgYmVpbmcgbXVsdGlwbGUgb2YgMTI4Lg0KPj4+PiArICAg
IFBsZWFzZSBub3RlIHRoYXQgd2hlbiB0aGUgdXNlciBleHBsaWNpdGx5IHNwZWNpZmllcyB0aGUg
dmFsdWUsIGlmIHRoYXQgdmFsdWUNCj4+Pj4gKyAgICBpcyBhYm92ZSB0aGUgaGFyZHdhcmUgc3Vw
cG9ydGVkIG1heGltdW0gU1ZFIHZlY3RvciBsZW5ndGgsIHRoZSBkb21haW4NCj4+Pj4gKyAgICBj
cmVhdGlvbiB3aWxsIGZhaWwgYW5kIHRoZSBzeXN0ZW0gd2lsbCBzdG9wLCB0aGUgc2FtZSB3aWxs
IG9jY3VyIGlmIHRoZQ0KPj4+PiArICAgIG9wdGlvbiBpcyBwcm92aWRlZCB3aXRoIGEgbm9uIHpl
cm8gdmFsdWUsIGJ1dCB0aGUgcGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0DQo+Pj4+ICsgICAgU1ZF
Lg0KPj4+IA0KPj4+IEFzc3VtaW5nIHRoaXMgYWxzbyBjb3ZlcnMgdGhlIC0xIGNhc2UsIEkgd29u
ZGVyIGlmIHRoYXQgaXNuJ3QgYSBsaXR0bGUgdG9vDQo+Pj4gc3RyaWN0LiAiTWF4aW11bSBzdXBw
b3J0ZWQiIGltbyBjYW4gdmVyeSB3ZWxsIGJlIDAuDQo+PiANCj4+IE1heGltdW0gc3VwcG9ydGVk
LCB3aGVuIHBsYXRmb3JtcyB1c2VzIFNWRSwgY2FuIGJlIGF0IG1pbmltdW0gMTI4IGJ5IGFybSBz
cGVjcy4NCj4gDQo+IFdoZW4gdGhlcmUgaXMgU1ZFIC0gc3VyZS4gQnV0IHdoZW4gdGhlcmUncyBu
byBTVkUsIDAgaXMga2luZCBvZiB0aGUgaW1wbGllZA0KPiBsZW5ndGguIEFuZCBJJ2QgdmlldyBh
IGNvbW1hbmQgbGluZSBvcHRpb24gdmFsdWUgb2YgLTEgcXVpdGUgb2theSBpbiB0aGF0DQo+IGNh
c2U6IFRoZXkndmUgYXNrZWQgZm9yIHRoZSBtYXhpbXVtIHN1cHBvcnRlZCwgc28gdGhleSdsbCBn
ZXQgMC4gTm8gcmVhc29uDQo+IHRvIGNyYXNoIHRoZSBzeXN0ZW0gZHVyaW5nIGJvb3QuDQoNCk9r
IEkgc2VlIHdoYXQgeW91IG1lYW4sIGZvciBleGFtcGxlIHdoZW4gS2NvbmZpZyBTVkUgaXMgZW5h
YmxlZCwgYnV0IHRoZSBwbGF0Zm9ybSBkb2VzbuKAmXQNCmhhdmUgU1ZFIGZlYXR1cmUsIHJlcXVl
c3Rpbmcgc3ZlPS0xIHdpbGwga2VlcCB0aGUgdmFsdWUgdG8gMCwgYW5kIG5vIHN5c3RlbSB3aWxs
IGJlIHN0b3BwZWQuDQoNCk1heWJlIEkgY2FuIHNheTogDQoNCuKAnC4uLiB0aGUgc2FtZSB3aWxs
IG9jY3VyIGlmIHRoZSBvcHRpb24gaXMgcHJvdmlkZWQgd2l0aCBhIHBvc2l0aXZlIG5vbiB6ZXJv
IHZhbHVlLA0KYnV0IHRoZSBwbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnQgU1ZFLiINCg0KDQoNCj4g
DQo+IEphbg0KDQoNCg==

