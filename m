Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9497C620A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 03:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615672.957007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqk9Q-0006kd-7Z; Thu, 12 Oct 2023 01:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615672.957007; Thu, 12 Oct 2023 01:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqk9Q-0006hx-4n; Thu, 12 Oct 2023 01:06:08 +0000
Received: by outflank-mailman (input) for mailman id 615672;
 Thu, 12 Oct 2023 01:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo6N=F2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qqk9P-0006PE-3l
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 01:06:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 856c0d5f-689b-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 03:06:06 +0200 (CEST)
Received: from AS9PR06CA0335.eurprd06.prod.outlook.com (2603:10a6:20b:466::34)
 by AS2PR08MB9269.eurprd08.prod.outlook.com (2603:10a6:20b:59e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:06:02 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::bb) by AS9PR06CA0335.outlook.office365.com
 (2603:10a6:20b:466::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Thu, 12 Oct 2023 01:06:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.29 via Frontend Transport; Thu, 12 Oct 2023 01:06:01 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Thu, 12 Oct 2023 01:06:01 +0000
Received: from 0721ca77c177.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECB55C80-BEA0-4D70-B95C-DBFE7E69DC3E.1; 
 Thu, 12 Oct 2023 01:05:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0721ca77c177.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Oct 2023 01:05:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Thu, 12 Oct
 2023 01:05:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 01:05:53 +0000
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
X-Inumbo-ID: 856c0d5f-689b-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kAhKHMb243F747T48zMP7z7yg+3C3TYzKnuLlszRpI=;
 b=PYu/q0O+mvx1fTcAS1/xGf2qFOOwyALHdc/lwTf4rNR/gdF3sU5lYKZqCD+AXmfEeToVL5mbniI3K1/dSDDd9izd4oQMruw1dnaGPybl8M5LwvM/rlLZ3LxwGrcbn986oACyb0AFNPZA36V6teVmQBDsCyiQo2YcFzXiMFV24eg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f810850efbf01202
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcLfkWn2p1UKHLBG8qeCTAeynrjcDxU9Je2MIKrHdYRJ5emzZWMj0zRkTkf70fS7Cd/NV+dHbe2TAoMm7KWhZqcmoqJ70SGqHtj3+FCRt9HtAoMF8M81SORpuU6LGNKuX2SrJPA4OHTM9Xg3vaFggNSwQIISoaS0uBNcDdyQWig09fB742dQy/THVPn3YVCbeiGbYuPMZ24NXS/Rz5BzdkxXAz/5FDMQdSr9QyFVVm2AbROqMaRZ5OdhSos1+esZ5N99MZpQrBfZ4L76TL3btXRv/5rxdqeT4dHLnyoFhgATdwHVtWo3ydPXegn4JAxQjuvheSsRLbiXcA9FrToR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kAhKHMb243F747T48zMP7z7yg+3C3TYzKnuLlszRpI=;
 b=H8NUS7kfSY4L2x98KXy+ild/OdCOluqwd7RmOCHBXRcCXpYReridoyzEDNhRxGmKebWH/pgmOHZaitXbjaM8MgfMBYnnhCso9YVFSxiM7in+T9VFqJEzr1nrhwiZJMzy3YEWDJkxrqJkV5zW/VcTzeWu5ZAgqlR82ccSTgh5Zge4wlONPeaY5PCfMxoKkG1HD25UMfvbqGdtgc+QhqneLLioLNrHfKQs0aoIJF9TWsvkIUxHzW+5kgPmC1qbkjAx8kcxQcg8HTo+jWfd/FmxX5ZynrTDw1kSt0fwdWkec5xWo+qYt4JYmHaP5Ye8n3wzLGwHUYKGF4y1jegKzsEbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kAhKHMb243F747T48zMP7z7yg+3C3TYzKnuLlszRpI=;
 b=PYu/q0O+mvx1fTcAS1/xGf2qFOOwyALHdc/lwTf4rNR/gdF3sU5lYKZqCD+AXmfEeToVL5mbniI3K1/dSDDd9izd4oQMruw1dnaGPybl8M5LwvM/rlLZ3LxwGrcbn986oACyb0AFNPZA36V6teVmQBDsCyiQo2YcFzXiMFV24eg=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/pvh: fix identity mapping of low 1MB
Thread-Topic: [PATCH] x86/pvh: fix identity mapping of low 1MB
Thread-Index: AQHZ/FkBJ1Y4R9KHakOp0UUb/Jg2U7BEzMgAgACK9wA=
Date: Thu, 12 Oct 2023 01:05:53 +0000
Message-ID: <EC78B0C1-DE30-4B49-AAE2-616B25C87C90@arm.com>
References: <20231011153756.16714-1-roger.pau@citrix.com>
 <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
In-Reply-To: <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6466:EE_|AM7EUR03FT058:EE_|AS2PR08MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: a0237bef-3113-4342-6fc7-08dbcabf66af
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JzvPRXCFCfm/SWDHxe2XMwVHHhK+bJj6Wzfw2aPPicsAX6hfBRQcMMEPVlGYWDLQXcu4mbYoiAj8J7pWTz3HM8nOMwLkCFnnbCUwtxQcXEaSFKKpw0qpC88C27Pjj8Oy8D925oy8G395O8EzZG+1Hyww/OG9l9RSkRVs6oLD3J00ZjaPAoEriwDXpf9wcSU5HawhmI2acryDTYbgrT3hmGL65evDgUDI5HNIToZqb/DnwXIpdMvbbJF7/tfJ0UO8AGauAVYAlrHQbGo1Si0++lALi9p95qBgefdXAwObkHhqXXVGbl0DmH+6J+BfnwIKlcFRfjMApfGaEMp9r6Jr5VInhy68L4YnziB37h2PbhHE6BnzGOIrZE3hIKdDWRmAxuibusvywNWn7/fX5yxLsp2efY1YnkBXEKvBfIMXBgryrQ3zQv4tj6O40Z5JgHtqqZq1ChePRlQ9ysBvYugiQQbcRpiN1qGeAvzzpANGlHl1i0nlF/WIeKBpw9dfprmC/6GLdxgZXAVzKd8dXcvu17Z+avtm6k9vbfm2HJ6m204XhJ8iKcNZDHt25p7EEFVDe/cI3eCXLlrsIq2pvhWDsA+7GCVEA2rR1IlaxzS239RDzaiiyBazlpeOqWtPz+xO7f/tYPQQfhGY+15Dr1Z7Qg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(54906003)(66446008)(38100700002)(66946007)(2906002)(83380400001)(53546011)(71200400001)(5660300002)(2616005)(41300700001)(66556008)(66476007)(64756008)(76116006)(33656002)(6916009)(91956017)(316002)(6486002)(86362001)(6506007)(6512007)(4326008)(122000001)(8936002)(478600001)(26005)(38070700005)(36756003)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6487ED5A9987BA47AAF056F65E655EE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	451ad9ba-3eb9-4a74-9147-08dbcabf61cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlsVJ5GF2B0bOv6hgi2OwkmS1DWXRB+doaek9G/UjNr6J0oxchZ7uymo+5KevqdIIGEUS/1Tk21iWdX5jXhaJDfhsx9MRze75A0oLcCnZsylJkEm9t8jX9FXj4kOJYTAG78hyS2zt85wdc7xkesSLdj76GGI8FAZT5uV/ZEHbSBxfe0ih7Wdx63WiFfwW03I7k63RCk8D3Kw1VVlsrZGRwyWrW8Pyvu3qPHa6ybNIy0C8Q4K6ikCzwkenp4RB4BG1mIWLtToi4d577a88TcBLv8rO95kwLKMOzqah9HFQFaFsvjFv/y0GUspc3yx8SPwankDsIevkrBBFFLxDHcgYeTiNwH/wXYVZhJ2Enxy29RRDNyB6E+dFVfIGsWkpy7N1uifcGjtH/h5kfYSHE5n5CwpV/1opDE4VccOGl34yCynYMcJNrC/GBEiAX2pz5zl1R/hRlu7VBwuhHOx0RZBi9CCsGPRsrzoDws31HBUzX7AxWLgknJhDmvPH6k27nrRZczik8+erDltTh43Cs+KxXZbZvcrmaFQLkPYMW/7h7kqKAX0wynolKDd7bXxAvfo+F9oSF8gLhKtnw+bNb4aoeAjr9aQ30Q3c2OGCCSCl0TCfUxLImSEM1iSE74ECl2D6lMNwKgx5QwA+SC7TYGJ4fCBgongzR23lIUqcSqD9JqAz72TeBzTqj6xNIy/vNSLsH64amLi9/YQOmy4B3WwQef6oOaWprZGBMWFyERIbIGNYLc2O6ZImzs59pCB/uAJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(1800799009)(64100799003)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(40480700001)(2906002)(6862004)(26005)(54906003)(47076005)(336012)(83380400001)(356005)(82740400003)(8936002)(36860700001)(8676002)(81166007)(4326008)(2616005)(5660300002)(478600001)(316002)(53546011)(41300700001)(70206006)(6506007)(6486002)(40460700003)(70586007)(6512007)(33656002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:06:01.2613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0237bef-3113-4342-6fc7-08dbcabf66af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9269

SGksDQoNCj4gT24gT2N0IDEyLCAyMDIzLCBhdCAwMDo0OCwgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxMS8xMC8yMDIzIDExOjM3IHBt
LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+PiBUaGUgbWFwcGluZyBvZiBtZW1vcnkgcmVnaW9u
cyBiZWxvdyB0aGUgMU1CIG1hcmsgd2FzIGFsbCBkb25lIGJ5IHRoZSBQVkggZG9tMA0KPj4gYnVp
bGRlciBjb2RlLCB0aHVzIGNvbXBsZXRlbHkgYXZvaWRpbmcgdGhhdCByZWdpb24gaW4gdGhlIGFy
Y2gtc3BlY2lmaWMgSU9NTVUNCj4+IGhhcmR3YXJlIGRvbWFpbiBpbml0aWFsaXphdGlvbiBjb2Rl
Lg0KPiANCj4gVGhpcyB0b29rIGEgd2hpbGUgdG8gcGFyc2UuICBJIHRoaW5rIGl0IHdvdWxkIGJl
IGNsZWFyZXIgdG8gc2F5ICJidWlsZGVyDQo+IGNvZGUsIGNhdXNpbmcgdGhlIHJlZ2lvbiB0byBi
ZSBhdm9pZGVkIGJ5IHRoZSBhcmNoIC4uLiINCj4gDQo+PiAgVGhhdCBsZWFkIHRvIHRoZSBJT01N
VSBiZWluZyBlbmFibGVkDQo+PiB3aXRob3V0IHJlc2VydmVkIHJlZ2lvbnMgaW4gdGhlIGxvdyAx
TUIgaWRlbnRpdHkgbWFwcGVkIGluIHRoZSBwMm0gZm9yIFBWSA0KPj4gaGFyZHdhcmUgZG9tYWlu
cy4gIEZpcm13YXJlIHdpdGggbWlzc2luZyBSTVJSL0lWTUQgcmFuZ2VzIHRoYXQgd291bGQgb3Ro
ZXJ3aXNlDQo+PiBiZSBsb2NhdGVkIGluIHRoZSBsb3cgMU1CIHdvdWxkIHRyYW5zaWVudGx5IHRy
aWdnZXIgSU9NTVUgZmF1bHRzIHVudGlsIHRoZSBwMm0NCj4+IGlzIHBvcHVsYXRlZCBieSB0aGUg
UFZIIGRvbTAgYnVpbGRlcjoNCj4gDQo+ICJGaXJtd2FyZSB3aGljaCBoYXBwZW5zIHRvIGJlIG1p
c3NpbmcgUk1SUi9JVk1EIHJhbmdlcyBkZXNjcmliaW5nIEU4MjANCj4gcmVzZXJ2ZWQgcmVnaW9u
cyBpbiB0aGUgbG93IDFNQiB3b3VsZCAuLi4iID8NCj4gDQo+PiBBTUQtVmk6IElPX1BBR0VfRkFV
TFQ6IDAwMDA6MDA6MTMuMSBkMCBhZGRyIDAwMDAwMDAwMDAwZWIzODAgZmxhZ3MgMHgyMCBSVw0K
Pj4gQU1ELVZpOiBJT19QQUdFX0ZBVUxUOiAwMDAwOjAwOjEzLjEgZDAgYWRkciAwMDAwMDAwMDAw
MGViMzQwIGZsYWdzIDANCj4+IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxMy4yIGQw
IGFkZHIgMDAwMDAwMDAwMDBlYTFjMCBmbGFncyAwDQo+PiBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6
IDAwMDA6MDA6MTQuNSBkMCBhZGRyIDAwMDAwMDAwMDAwZWI0ODAgZmxhZ3MgMHgyMCBSVw0KPj4g
QU1ELVZpOiBJT19QQUdFX0ZBVUxUOiAwMDAwOjAwOjEyLjAgZDAgYWRkciAwMDAwMDAwMDAwMGVi
MDgwIGZsYWdzIDB4MjAgUlcNCj4+IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxNC41
IGQwIGFkZHIgMDAwMDAwMDAwMDBlYjQwMCBmbGFncyAwDQo+PiBBTUQtVmk6IElPX1BBR0VfRkFV
TFQ6IDAwMDA6MDA6MTIuMCBkMCBhZGRyIDAwMDAwMDAwMDAwZWIwNDAgZmxhZ3MgMA0KPj4gDQo+
PiBNb3N0bHkgcmVtb3ZlIHRoZSBzcGVjaWFsIGhhbmRsaW5nIG9mIHRoZSBsb3cgMU1CIGRvbmUg
YnkgdGhlIFBWSCBkb20wIGJ1aWxkZXIsDQo+PiBsZWF2aW5nIGp1c3QgdGhlIGRhdGEgY29weSBi
ZXR3ZWVuIFJBTSByZWdpb25zLiAgT3RoZXJ3aXNlIHJlbHkgb24gdGhlIElPTU1VDQo+PiBhcmNo
IGluaXQgY29kZSB0byBjcmVhdGUgYW55IGlkZW50aXR5IG1hcHBpbmdzIGZvciByZXNlcnZlZCBy
ZWdpb25zIGluIHN1Y2gNCj4+IHJhbmdlIChsaWtlIGl0IGFscmVhZHkgZG9lcyBmb3IgYWxsIHJl
c2VydmVkIHJlZ2lvbnMpLg0KPiANCj4gImluIHN1Y2ggcmFuZ2VzIiwgb3IgaW4gdGhpcyBjYXNl
ICJpbiB0aGF0IHJhbmdlIiB3b3VsZCBiZSBiZXR0ZXIuICBBbHNvDQo+ICJmb3IgcmVzZXJ2ZWQg
cmVnaW9ucyBlbHNld2hlcmUiIElNTy4NCj4gDQo+IEp1c3QgdG8gY29uZmlybSwgd2UncmUgc2F5
aW5nIG91ciBkZWZhdWx0IHRyZWF0bWVudCBvZiBpZGVudGl0eSBtYXBwaW5nDQo+IGU4MjAgcmVz
ZXJ2ZWQgcmVnaW9ucyBpbnRvIHRoZSBJT01NVSBpcyBtYXNraW5nIChvciBub3QpIGEgbWlzc2lu
Zw0KPiBSTVJSL0lWTUQgZW50cnk/DQo+IA0KPj4gDQo+PiBOb3RlIHRoZXJlJ3MgYSBzbWFsbCBk
aWZmZXJlbmNlIGluIGJlaGF2aW9yLCBhcyBob2xlcyBpbiB0aGUgbG93IDFNQiB3aWxsIG5vDQo+
PiBsb25nZXIgYmUgaWRlbnRpdHkgbWFwcGVkIHRvIHRoZSBwMm0uDQo+PiANCj4+IEZpeGVzOiA2
YjRmNmEzMWFjZTEgKCd4ODYvUFZIOiBkZS1kdXBsaWNhdGUgbWFwcGluZ3MgZm9yIGZpcnN0IE1i
IG9mIERvbTAgbWVtb3J5JykNCj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiANCj4gSSBzdXBwb3NlIHlvdSBpbnRlbmRlZCB0byBtYXJr
IHRoaXMgZm9yIDQuMTggYXMgeW91IENDJ2QgSGVucnksIGFuZCBhbHNvDQo+IHNlbmQgaXQgZm9y
IHg4NiAoQ0MgYWRkZWQpPw0KDQpGaW5lIGZvciBtZSB0byBpbmNsdWRlIHRoaXMgYnVnZml4LA0K
DQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gSSdtIHRlbXB0ZWQgdG8gY29tbWl0IGl0IGJh
c2VkIG9uIHRoZSBkaWZmc3RhdCBhbG9uZS4gIEhvdyBkbyB3ZSBzdGlsbA0KPiBoYXZlIHNvIG11
Y2gganVuayBjb2RlIGxpa2UgdGhpcyBseWluZyBhcm91bmQgYnJlYWtpbmcgdGhpbmdzLi4uDQo+
IA0KPiBBbnl3YXkgLSBpdCdzIGEgY2xlYXIgaW1wcm92ZW1lbnQuDQo+IA0KPiBCdXQgYSBxdWVz
dGlvbiBmaXJzdC4gIElzIHRoaXMgZnJvbSBkZWJ1Z2dpbmcgdGhlIFhTQS00NDIgZmFsbG91dD8g
IElmDQo+IHNvLCBpdCdzIHByb2JhYmx5IHdvcnRoIG1lbnRpb25pbmcgdGhlIGhhcmR3YXJlIHdl
IHNhdyB0aGlzIG9uICh3aGljaA0KPiBJSVJDIHdhcyBmYWlybHkgb2xkIEFNRCksIGFuZCB0aGF0
IFhTQS00NDIgdW5tYXNrZWQgYSBwcmUtZXhpc3RpbmcgYnVnLiANCj4gQW5kIHdlIHRoaW5rIGl0
J3MgVVNCL1BTMiBlbXVsYXRpb24/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiB+QW5kcmV3DQoNCg==

