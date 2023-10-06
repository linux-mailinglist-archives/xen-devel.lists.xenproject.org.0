Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7C7BB41A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613417.953902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogz2-0007Xe-8J; Fri, 06 Oct 2023 09:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613417.953902; Fri, 06 Oct 2023 09:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogz2-0007Ve-5I; Fri, 06 Oct 2023 09:18:56 +0000
Received: by outflank-mailman (input) for mailman id 613417;
 Fri, 06 Oct 2023 09:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qogz1-0007VY-Co
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:18:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e1e73ed-6429-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 11:18:53 +0200 (CEST)
Received: from AM6PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::46)
 by AS2PR08MB9222.eurprd08.prod.outlook.com (2603:10a6:20b:59e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 09:18:23 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::16) by AM6PR10CA0033.outlook.office365.com
 (2603:10a6:209:89::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Fri, 6 Oct 2023 09:18:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.30 via Frontend Transport; Fri, 6 Oct 2023 09:18:23 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 06 Oct 2023 09:18:23 +0000
Received: from 2ae5ff995623.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63962143-55D3-4B4F-ABE4-45C3F74F3FAD.1; 
 Fri, 06 Oct 2023 09:18:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ae5ff995623.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 09:18:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 09:18:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 09:18:15 +0000
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
X-Inumbo-ID: 5e1e73ed-6429-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPzvR52As8AvAcdqiEFW9+Zvx3a5JHzYz23vhbnaoSI=;
 b=uMCpLqdH/2a+Ve1afTZztKXUk8peJTvP+tLyY3uvbxlpzJfqhWbXV5Dqm/3S9458vHEnZ7rbXSny9+H4IdV2nWAaYs/EsV1E1gcr8uFWxHgX/FXMsRK30Aw2rT2N4I+cHpdm5C5cIFBtDS8wQ115Mc3GDQ3S2rz53ReWFBUJcnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25fb384b808c2e37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9/rI49OEFFD3q5Gw7fDu5hYRc+QdvjQUDKD3bfJ5AXTV9aNKRrTnkeBm4n0tE2qlEE3/il2plgIyZtODRAbfAoHq4TtxHJT58stAvR8oTkshnddv+vMqcx9/+kriMY+W7KNj3h07XwqIP4pZiNjGWGa3DKDw6y6QT1JG6VoSGvX1cyh7ZI4dJ1oXeqMmZYVYDGcWj7Fr+gUXLSLkzzO2X2I8vPjtffo/SiW6T0f8f1gGonng4aidOd4K2y5XepMVpVfn6BU6fjNU1Bmj13NTNOYNQZOSIZjK/wYEcT77o67ov3ZUnwK+HJIiidGBQWydYbErcpa1WO9U0S//Llcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPzvR52As8AvAcdqiEFW9+Zvx3a5JHzYz23vhbnaoSI=;
 b=R1kqe/XHiPX8E8o8cbO+p+V+rxuG755kxlbf8YMYRlGWlxfJBQFVM1rKctAOOBSWU/gJtWktdIasWSw55gMkEqVk0ZSiiz0kyS28dvrCP7FEUALI8frOUwlf3Mn/v+GEJebDTzE1zSl+1GoZLydh8+YAwCgrk6S6Hojd9avxBRUbQh9YpE2jKBCkyS7PvSv7PDRSBcmNxqv/TGb2qBZWGLCAyeW5A+TBVoJIwCsmebaF8i9G4+BjJrLgw8Y+weoUZxmQ9tORXH+KmXDyz963WH5TSCZt9OPVDVokmNznsIEBY5ioEIPBIuTFCsL/6MpUfstpSwZVf2KIyE6DrQxZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPzvR52As8AvAcdqiEFW9+Zvx3a5JHzYz23vhbnaoSI=;
 b=uMCpLqdH/2a+Ve1afTZztKXUk8peJTvP+tLyY3uvbxlpzJfqhWbXV5Dqm/3S9458vHEnZ7rbXSny9+H4IdV2nWAaYs/EsV1E1gcr8uFWxHgX/FXMsRK30Aw2rT2N4I+cHpdm5C5cIFBtDS8wQ115Mc3GDQ3S2rz53ReWFBUJcnY=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] domain: fix misaligned unmap address in
 unmap_guest_area()
Thread-Topic: [PATCH 1/2] domain: fix misaligned unmap address in
 unmap_guest_area()
Thread-Index: AQHZ+DXYlqgh1jA6/kuitcOo78sZGrA8e5kA
Date: Fri, 6 Oct 2023 09:18:15 +0000
Message-ID: <03A43C0A-CDC2-4400-BC5F-34F5646D4C47@arm.com>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-2-roger.pau@citrix.com>
In-Reply-To: <20231006091353.96367-2-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB8791:EE_|AM7EUR03FT063:EE_|AS2PR08MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f84963-5573-4dd9-3a47-08dbc64d30b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 psXzwQQSO30L90CuhD2M8CS0XcFxbNezrwL43Pre9TtjyqbGtF1vRM6v3lby/5UU8sTmIF56T8xMmV8lBromqlN7n5n3ATm4kwPZf7yhazFT/W97AesplLVFWuu1wjmYKG6DjtI5ga7IeKRFaMQJrAu/hUmjlJxpGAs51wiNgHGB/7Bdk9RHmcZtKghJYo5d3KxzOJ3Ws4O25LWGUkdQq7i6WA/pKiuRo7C+X5GxRYm+AGwdz1Rye3+Qb3DFW2U1LPek4h3RNsesVCXxZlU8TNDzrQWC3b3PZf6+gm4GrZ+780xXAipf1cSMYC0MXXstoF0Dw9oBHTYWg5HONkBHKuO0gIekiAG69bKJqQuBzRAj+5vXN1wFTfmQQceEXn55VN/9sjWoKrooD7x0l+UUy7RYiHzc63xpjBelcvQepnal0QRM/24KYxg12XUQDyZpwVz7UTg+yRTXfhgg+SFdvsQ+atmWeZFCgg9k0BB/tAPkXdaoc7Wo0jvt/z21Krujb7ffqMbxyMIM9L8HNmwHDpbWFhzBtgtC6xNa80Km0g8hivQnArfmNfJE2rgLwFv3TRST0+1o0Cu0VayFoAJVSdtU3ztpA/X0+HciMzCGPDxpo2aMuXCWSVFm7LbG2g6TXQKVdhKyxQrsLqOVUO5lRg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(6506007)(71200400001)(478600001)(6486002)(6512007)(2616005)(83380400001)(26005)(2906002)(316002)(41300700001)(54906003)(6916009)(76116006)(91956017)(66446008)(66476007)(66556008)(66946007)(64756008)(5660300002)(8676002)(8936002)(4326008)(36756003)(33656002)(38100700002)(38070700005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D736783761C074A9E0825C56C70B22C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2412affc-6c55-4b82-754c-08dbc64d2bc5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sNJXMfI9ApkiqgSVn04P2d8Vaq1AKCymcXwLo6BXC8d4ItKaTBGS5WRZWwq1YaHeuPLedZdY7Z06LtUHwMsMH7vPANqx8TcDPVh9T3jtV5Gu+hOEcw4McPL+Szh0STq11Z0PP5w7TUIcpiRKSG4WFlKZnTSY2FGHJ/c9ShDd6OM82DJkYtcvHZXv8rFvbTK6xTX4MEUBAss/p9d0h1NXAFfyyIS5pdw8JAUeb+udWhhcrfNSvxTB6PwkNKQTzIBBp0x/0CtJ1JgCRhtXuUu7QmCpcrKGyRyYpo67zAgiOJQMUvzFHVtGKACa3BojmJz8K+UiW7XwGeT1XAQasrR2y/G94hz+v45oHS2dNTP71/LwoNhaMsZrRgQcZD44pwekHhZlHrIBLHKefmHWkJe4v/kzKIqQSGWxjFKFmb/P8IqS/erFYk1N6eSX1CooaClqKnBUTiygSfrs1Ci5uWBRWW7MwfqPzlopRViu1rRB2CD6s81FHDhfGSOkMDXpbcG/HsjQDKUfbNbKLUWqXARecBj6mVTGI4xRKOqt90BMNZu/szSajZEzspTiB9c+Qt8JaH0DhXkSiT3dIJAYrnkRJMvsPptz+vTyZSswY7Utkg6ja7XL+KMSWwbKKnmOMwWROKhaBrlLXWP1UMPebIf4Fxu+0E0gOxKsLps3dqErsB9UXs/fgREg4bHsVf2yLZKXsgJARfr9AoqcVA1Dh8uyod7L0JzRqZDFiMglCeH6t8Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(53546011)(6486002)(6506007)(478600001)(36860700001)(81166007)(33656002)(86362001)(82740400003)(356005)(8676002)(83380400001)(336012)(26005)(2616005)(47076005)(36756003)(6512007)(5660300002)(316002)(70586007)(6862004)(54906003)(8936002)(70206006)(2906002)(41300700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:18:23.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f84963-5573-4dd9-3a47-08dbc64d30b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9222

SGkgUm9nZXIsDQoNCj4gT24gT2N0IDYsIDIwMjMsIGF0IDE3OjEzLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IHVubWFwX2RvbWFpbl9wYWdlX2ds
b2JhbCgpIGV4cGVjdHMgdGhlIHByb3ZpZGVkIGFkZHJlc3MgdG8gYmUgcGFnZSBhbGlnbmVkLCBv
cg0KPiBlbHNlIHNvbWUgb2YgdGhlIGNhbGxlZCBmdW5jdGlvbnMgd2lsbCB0cmlnZ2VyIGFzc2Vy
dGlvbnMsIGxpa2UNCj4gbW9kaWZ5X3hlbl9tYXBwaW5ncygpIG9uIHg4NiBvciBkZXN0cm95X3hl
bl9tYXBwaW5ncygpIG9uIEFybS4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgYXNzZXJ0IGhhcyBiZWVu
IHJlcG9ydGVkIGJ5IG9zc3Rlc3QgYXJtIDMyYml0IHRlc3RzOg0KPiANCj4gKFhFTikgQXNzZXJ0
aW9uICdJU19BTElHTkVEKHMsIFBBR0VfU0laRSknIGZhaWxlZCBhdCBhcmNoL2FybS9tbS5jOjEy
NDMNCj4gKFhFTikgLS0tLVsgWGVuLTQuMTgtcmMgIGFybTMyICBkZWJ1Zz15ICBOb3QgdGFpbnRl
ZCBdLS0tLQ0KPiAoWEVOKSBDUFU6ICAgIDANCj4gKFhFTikgUEM6ICAgICAwMDI3MWEzOCBkZXN0
cm95X3hlbl9tYXBwaW5ncysweDUwLzB4NWMNCj4gWy4uLl0NCj4gKFhFTikgWGVuIGNhbGwgdHJh
Y2U6DQo+IChYRU4pICAgIFs8MDAyNzFhMzg+XSBkZXN0cm95X3hlbl9tYXBwaW5ncysweDUwLzB4
NWMgKFBDKQ0KPiAoWEVOKSAgICBbPDAwMjM1YWE4Pl0gdnVubWFwKzB4MzAvMHgxYTAgKExSKQ0K
PiAoWEVOKSAgICBbPDAwMjZhZDg4Pl0gdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKzB4MTAvMHgy
MA0KPiAoWEVOKSAgICBbPDAwMjA4ZTM4Pl0gdW5tYXBfZ3Vlc3RfYXJlYSsweDkwLzB4ZWMNCj4g
KFhFTikgICAgWzwwMDIwOGY5OD5dIGRvbWFpbl9raWxsKzB4MTA0LzB4MTgwDQo+IChYRU4pICAg
IFs8MDAyMzllM2M+XSBkb19kb21jdGwrMHg4YWMvMHgxNGZjDQo+IChYRU4pICAgIFs8MDAyN2Fl
MzQ+XSBkb190cmFwX2d1ZXN0X3N5bmMrMHg1NzAvMHg2NmMNCj4gKFhFTikgICAgWzwwMDIwMTlm
MD5dIGFyY2gvYXJtL2FybTMyL2VudHJ5Lm8jcmV0dXJuX2Zyb21fdHJhcCswLzB4NA0KPiANCj4g
Rml4ZXM6IGVhZGMyODhjYmIwZCAoJ2RvbWFpbjogbWFwL3VubWFwIEdBRERSIGJhc2VkIHNoYXJl
ZCBndWVzdCBhcmVhcycpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5X
YW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gLS0tDQo+IHVubWFwX2Rv
bWFpbl9wYWdlX2dsb2JhbCgpIGFuZCB2dW5tYXAoKSBzaG91bGQgbGlrZWx5IGhhdmUgdGhlIHNh
bWUgYWxpZ25tZW50DQo+IGFzc2VydHMsIGFzIG5vdCBhbGwgcGF0aHMgbGVhZCB0byBkZXRlY3Rp
bmcgdGhlIG1pc2FsaWdubWVudCBvZiB0aGUgcHJvdmlkZWQNCj4gbGluZWFyIGFkZHJlc3MuICBX
aWxsIGRvIGEgc2VwYXJhdGUgcGF0Y2guDQo+IC0tLQ0KPiB4ZW4vY29tbW9uL2RvbWFpbi5jIHwg
MiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4u
Yw0KPiBpbmRleCBiODI4MWQ3Y2ZmOWQuLjJkY2M2NGU2NTljYyAxMDA2NDQNCj4gLS0tIGEveGVu
L2NvbW1vbi9kb21haW4uYw0KPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+IEBAIC0xNjM0
LDcgKzE2MzQsNyBAQCB2b2lkIHVubWFwX2d1ZXN0X2FyZWEoc3RydWN0IHZjcHUgKnYsIHN0cnVj
dCBndWVzdF9hcmVhICphcmVhKQ0KPiANCj4gICAgIGlmICggcGcgKQ0KPiAgICAgew0KPiAtICAg
ICAgICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwobWFwKTsNCj4gKyAgICAgICAgdW5tYXBfZG9t
YWluX3BhZ2VfZ2xvYmFsKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKW1hcCAmIFBBR0VfTUFTSykp
Ow0KPiAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBnKTsNCj4gICAgIH0NCj4gfQ0KPiAtLSAN
Cj4gMi40Mi4wDQo+IA0KDQo=

