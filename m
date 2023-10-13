Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418527C81C4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616332.958247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEIl-0001k4-I5; Fri, 13 Oct 2023 09:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616332.958247; Fri, 13 Oct 2023 09:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEIl-0001gh-Ey; Fri, 13 Oct 2023 09:17:47 +0000
Received: by outflank-mailman (input) for mailman id 616332;
 Fri, 13 Oct 2023 09:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5iA=F3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrEIk-0001gZ-32
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:17:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c999109-69a9-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 11:17:42 +0200 (CEST)
Received: from DU2PR04CA0301.eurprd04.prod.outlook.com (2603:10a6:10:2b5::6)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 09:17:40 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::78) by DU2PR04CA0301.outlook.office365.com
 (2603:10a6:10:2b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Fri, 13 Oct 2023 09:17:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.31 via Frontend Transport; Fri, 13 Oct 2023 09:17:39 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 13 Oct 2023 09:17:39 +0000
Received: from ff2664c0a239.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF6B914E-3DE4-400A-8519-69A3E1D10C20.1; 
 Fri, 13 Oct 2023 09:17:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff2664c0a239.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Oct 2023 09:17:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7742.eurprd08.prod.outlook.com (2603:10a6:20b:50a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 09:17:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 09:17:31 +0000
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
X-Inumbo-ID: 5c999109-69a9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WTD5AERBcG88HvphDJ5e61yx+2QMCF7n5OIbUV0jXg=;
 b=g/7rooAjVrHX6xKvkotUlAiRktK9xtiqv9mOYhgReTx7EegMFcmzqiuRLdOfMdFcPYgGuJl7xZTT/CKMEAAI4Yz/9tnLHdQv31Aeg3OWnfEt1WTAFLE95k0UkyrRupApdvknyVA4B8NeRxBtUfQDkip9KsL+11lFXCxjxnrbI00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe197d223d261cf7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFhWGDTIK8XwS1DZTEbk3FXc+WFrs0IASWCv0qGPGu3i56Dm9vzyYQewgWR2wOv8YSmvQycwhYL4iipAep1nzy6JBB2dSywoney4pFQ3ry0umYq9LT49F756NegcZKswaZaIK30LcFkAgYYU18tneaAQ4bGGnCUXT/s49wjwy7s1hhH/OZvw/R6I3nDraO+K7Ruw/QpOHgYpuo9/hAgiH3SmC3XuRi4ndliDYNs2yMvj0Yjo1qq7AahHTbi3GWTcxlSjTY0HGm4/gLfTYNY/7dIek5saoKK/VlFhACoJ9hrjuGSZrQQirfTJMsNb55Ot2kTb1qwzWi7+WSQWv+UDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WTD5AERBcG88HvphDJ5e61yx+2QMCF7n5OIbUV0jXg=;
 b=n5Go1PXKoBBbtxqtdmnnCZuf7BXLn2AnNxspX/7VxTKkzMERA8gnmmJd7UDZmTIxHOhLq2afZKy990J6tya23+OmgzjXtx9blohdQAHWUyABz6aR8dQLxwKg33J6XMqPzO1oPw7pH7/Itwhd19qQYlsLTBSYnjrKrpy0kYxM3dnl1C4gIf1OzzOXD1eO0H2ktQ1jirCMPkGM987ncLyOswrGJ0Iqa1rJlAuNZ21nyCiOCHzuM8IJNWvZ5M2YmacZ5g7oF4080+1XyLc+B8I32HBpp3cM4sq3ZBMkCE2U/Fdqw9ZeLJYlGdoGra+LUg/P183NIPEFXLTbYeRNWUSirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WTD5AERBcG88HvphDJ5e61yx+2QMCF7n5OIbUV0jXg=;
 b=g/7rooAjVrHX6xKvkotUlAiRktK9xtiqv9mOYhgReTx7EegMFcmzqiuRLdOfMdFcPYgGuJl7xZTT/CKMEAAI4Yz/9tnLHdQv31Aeg3OWnfEt1WTAFLE95k0UkyrRupApdvknyVA4B8NeRxBtUfQDkip9KsL+11lFXCxjxnrbI00=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Thread-Topic: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Thread-Index: AQHZ/bNI9rurnZMB2EitKmMnzqD0o7BHcLkA
Date: Fri, 13 Oct 2023 09:17:31 +0000
Message-ID: <A808F505-03DE-4F39-B114-1FB5BF3198F0@arm.com>
References: <20231013085654.2789-1-roger.pau@citrix.com>
In-Reply-To: <20231013085654.2789-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7742:EE_|DBAEUR03FT028:EE_|PAVPR08MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a057d0-79ed-4a54-8c16-08dbcbcd3f68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /h9AoKc4/cdgmDUuFWQGyzc+Tf6YEUCyt8Zcq0dI7QzNYygh+1L1ktByqtc0k1ZNKKjqd4Wz9HBTcHGBSqKf4YJyVQFfizmkYyyQ4dIzsQEl5sMrxOe6opadeY1JIWTVknzmsfYl4KeXjf9Ak3ZiP9F0ZYc6Y/0G/9kYNCHbuRd+bhOPLydr+Yug7NEpc2sMSe5j7cl7eWsTgl6cWkUPbbLinwePEYytvvV/CoTmd7R8aa1veZ2rPbBUMe6LjlxBpL/JOR7aEwv29FTXU6D+ouNnAGoRtDD64KtkCgHq/z+fx0DCi1rBnYhPes0m/0vGXIKUBuMpi1ls4Gy9YCYFQgceaLY63EhUkD3rPpq3J0QiQw0bBJr6+Fl2cGq0glauTuVjtt0JzmRkIIe1PioPLsivonf4WGzT9xbWjQhzNN3kRHZkGRZrPIreGW05wlWkCUtFP1hruubop2E3ilaMu45fgxnUdNS04deUxakSA+zumtxyhCOFMROB4CwT7b6m+lXX2QAs0ut/2fls2SxTiCiEWR3LQvaS2I/0V+WIj+xOFm3RIh4MxN3k0bG0LRm7ab7v7R08eGK6piPGXH/saT/9avS44YLMle+skvJlkrx9J4nJxSY4p9xG2dREB1DMUZKyOkjYBVveUuqenbP+vg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(2616005)(71200400001)(26005)(6512007)(53546011)(122000001)(36756003)(38100700002)(86362001)(33656002)(38070700005)(83380400001)(2906002)(5660300002)(91956017)(66476007)(66946007)(66556008)(64756008)(76116006)(66446008)(41300700001)(316002)(6916009)(54906003)(478600001)(4326008)(6486002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05117EEB3F8F804B89D182F25946580C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7742
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29d36cec-b256-48e6-eaad-08dbcbcd3a68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dYalfI7fB6MH+lx2iQsISiAUWD2x1t4nSjygLGUNAMg5ILannPh1A7FmGs8ezcx3n7/PgTpXpVr86wtBXtxHQk5WC9J0o4ChQIHkFmJykuKYoYWn7RltWNc1w0m4QenngWKLKGOtvrS1cmZSfOQRnZrW4B84xG9QPrvQ0ZvbpOuuicKHVTh5yk95oXBXXZHAlSo5xJGEuok+yTC/OIzFxwwqHO45B8p0Ui533suk27kOeMBLuMR6ibKzeVdoYHX1giLeFNdrlDVxZcSFq31kyWXjDVLFsyyHX8Q1iYjXarviralJxEM7xMmbWIs9JvYYYp7wjPs+VDLVXJw8NbBowAdQuTugez87W4IKkNovkE9+6WNxpCOOJ/PYbM/LO+FkSwkYOvzCbP/ox70ud0bfFdhVV08eUE9lYcCIyiS2qb+yGR0ruTIQ5+NZw5iT/jIquicbOjSUfIpG0oU4maIDvCAZSCWWgSKc1Ck3VMsjpGnkI1k0xMn7y3ymrxezNlUN1p7/phLFZA7ujQT8L3VBZmXknhV0wDZMheaL0b/wf8CT39lWhWEwUtDKyR8RO4z3UcAnm7fWrGZ8+eFQUPlWVOJlxJIa1any4uznuxn8YqHz29AqVUp+JgCDaIujmGkB73DofzEQL6plw4VL9pIoo49hvEFSbmaRyJN3JlNDTuhFbxAyUbJYe2nAydWs0R3jY8ZVG6p01HzzWRZ+h/CtXQg2czP/jMYGKsUZl7+YHC2/wrI2K8tPGiS8EPbrL7aU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(82310400011)(1800799009)(64100799003)(36840700001)(46966006)(40470700004)(47076005)(33656002)(2906002)(40460700003)(36756003)(36860700001)(82740400003)(86362001)(356005)(40480700001)(81166007)(2616005)(53546011)(54906003)(70206006)(41300700001)(70586007)(316002)(26005)(6486002)(6512007)(6506007)(478600001)(83380400001)(5660300002)(8676002)(8936002)(336012)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 09:17:39.5451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a057d0-79ed-4a54-8c16-08dbcbcd3f68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650

SGkgUm9nZXIsDQoNCj4gT24gT2N0IDEzLCAyMDIzLCBhdCAxNjo1NiwgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgbWFwcGluZyBvZiBtZW1v
cnkgcmVnaW9ucyBiZWxvdyB0aGUgMU1CIG1hcmsgd2FzIGFsbCBkb25lIGJ5IHRoZSBQVkggZG9t
MA0KPiBidWlsZGVyIGNvZGUsIGNhdXNpbmcgdGhlIHJlZ2lvbiB0byBiZSBhdm9pZGVkIGJ5IHRo
ZSBhcmNoIHNwZWNpZmljIElPTU1VDQo+IGhhcmR3YXJlIGRvbWFpbiBpbml0aWFsaXphdGlvbiBj
b2RlLiAgVGhhdCBsZWFkIHRvIHRoZSBJT01NVSBiZWluZyBlbmFibGVkDQo+IHdpdGhvdXQgcmVz
ZXJ2ZWQgcmVnaW9ucyBpbiB0aGUgbG93IDFNQiBpZGVudGl0eSBtYXBwZWQgaW4gdGhlIHAybSBm
b3IgUFZIDQo+IGhhcmR3YXJlIGRvbWFpbnMuICBGaXJtd2FyZSB3aGljaCBoYXBwZW5zIHRvIGJl
IG1pc3NpbmcgUk1SUi9JVk1EIHJhbmdlcw0KPiBkZXNjcmliaW5nIEU4MjAgcmVzZXJ2ZWQgcmVn
aW9ucyBpbiB0aGUgbG93IDFNQiB3b3VsZCB0cmFuc2llbnRseSB0cmlnZ2VyIElPTU1VDQo+IGZh
dWx0cyB1bnRpbCB0aGUgcDJtIGlzIHBvcHVsYXRlZCBieSB0aGUgUFZIIGRvbTAgYnVpbGRlcjoN
Cj4gDQo+IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxMy4xIGQwIGFkZHIgMDAwMDAw
MDAwMDBlYjM4MCBmbGFncyAweDIwIFJXDQo+IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDow
MDoxMy4xIGQwIGFkZHIgMDAwMDAwMDAwMDBlYjM0MCBmbGFncyAwDQo+IEFNRC1WaTogSU9fUEFH
RV9GQVVMVDogMDAwMDowMDoxMy4yIGQwIGFkZHIgMDAwMDAwMDAwMDBlYTFjMCBmbGFncyAwDQo+
IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxNC41IGQwIGFkZHIgMDAwMDAwMDAwMDBl
YjQ4MCBmbGFncyAweDIwIFJXDQo+IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxMi4w
IGQwIGFkZHIgMDAwMDAwMDAwMDBlYjA4MCBmbGFncyAweDIwIFJXDQo+IEFNRC1WaTogSU9fUEFH
RV9GQVVMVDogMDAwMDowMDoxNC41IGQwIGFkZHIgMDAwMDAwMDAwMDBlYjQwMCBmbGFncyAwDQo+
IEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxMi4wIGQwIGFkZHIgMDAwMDAwMDAwMDBl
YjA0MCBmbGFncyAwDQo+IA0KPiBUaG9zZSBlcnJvcnMgaGF2ZSBiZWVuIG9ic2VydmVkIG9uIHRo
ZSBvc3N0ZXN0IHBpbm90ezAsMX0gYm94ZXMgKEFNRCBGYW0xNWgNCj4gT3B0ZXJvbih0bSkgUHJv
Y2Vzc29yIDMzNTAgSEUpLg0KPiANCj4gTW9zdGx5IHJlbW92ZSB0aGUgc3BlY2lhbCBoYW5kbGlu
ZyBvZiB0aGUgbG93IDFNQiBkb25lIGJ5IHRoZSBQVkggZG9tMCBidWlsZGVyLA0KPiBsZWF2aW5n
IGp1c3QgdGhlIGRhdGEgY29weSBiZXR3ZWVuIFJBTSByZWdpb25zLiAgT3RoZXJ3aXNlIHJlbHkg
b24gdGhlIElPTU1VDQo+IGFyY2ggaW5pdCBjb2RlIHRvIGNyZWF0ZSBhbnkgaWRlbnRpdHkgbWFw
cGluZ3MgZm9yIHJlc2VydmVkIHJlZ2lvbnMgaW4gdGhhdA0KPiByYW5nZSAobGlrZSBpdCBhbHJl
YWR5IGRvZXMgZm9yIHJlc2VydmVkIHJlZ2lvbnMgZWxzZXdoZXJlKS4NCj4gDQo+IE5vdGUgdGhl
cmUncyBhIHNtYWxsIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3IsIGFzIGhvbGVzIGluIHRoZSBsb3cg
MU1CIHdpbGwgbm8NCj4gbG9uZ2VyIGJlIGlkZW50aXR5IG1hcHBlZCB0byB0aGUgcDJtLg0KPiAN
Cj4gRml4ZXM6IDZiNGY2YTMxYWNlMSAoJ3g4Ni9QVkg6IGRlLWR1cGxpY2F0ZSBtYXBwaW5ncyBm
b3IgZmlyc3QgTWIgb2YgRG9tMCBtZW1vcnknKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkg
V2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IC0t
LQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIFJld29yZCBjb21taXQgbWVzc2FnZS4NCj4gLS0t
DQo+IHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAgICAgIHwgMjIgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyB8ICA4ICst
LS0tLS0tDQo+IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDI5IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVu
L2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMNCj4gaW5kZXggYmMwZTI5MGRiNjEyLi45NzlkYjdk
MWVjNGQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jDQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jDQo+IEBAIC00NDksMjggKzQ0OSw2IEBA
IHN0YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9wMm0oc3RydWN0IGRvbWFpbiAqZCkNCj4g
ICAgICAgICB9DQo+ICAgICB9DQo+IA0KPiAtICAgIC8qIE5vbi1SQU0gcmVnaW9ucyBvZiBzcGFj
ZSBiZWxvdyAxTUIgZ2V0IGlkZW50aXR5IG1hcHBlZC4gKi8NCj4gLSAgICBmb3IgKCBpID0gcmMg
PSAwOyBpIDwgTUIxX1BBR0VTOyArK2kgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcDJtX3R5cGVf
dCBwMm10Ow0KPiAtICAgICAgICBtZm5fdCBtZm4gPSBnZXRfZ2ZuX3F1ZXJ5KGQsIGksICZwMm10
KTsNCj4gLQ0KPiAtICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApDQo+IC0g
ICAgICAgICAgICByYyA9IHNldF9tbWlvX3AybV9lbnRyeShkLCBfZ2ZuKGkpLCBfbWZuKGkpLCBQ
QUdFX09SREVSXzRLKTsNCj4gLSAgICAgICAgZWxzZQ0KPiAtICAgICAgICAgICAgLyoNCj4gLSAg
ICAgICAgICAgICAqIElmIHRoZSBwMm0gZW50cnkgaXMgYWxyZWFkeSBzZXQgaXQgbXVzdCBiZWxv
bmcgdG8gYSBSTVJSIGFuZA0KPiAtICAgICAgICAgICAgICogYWxyZWFkeSBiZSBpZGVudGl0eSBt
YXBwZWQsIG9yIGJlIGEgUkFNIHJlZ2lvbi4NCj4gLSAgICAgICAgICAgICAqLw0KPiAtICAgICAg
ICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9ydyB8fCBtZm5fZXEobWZuLCBfbWZuKGkpKSk7
DQo+IC0gICAgICAgIHB1dF9nZm4oZCwgaSk7DQo+IC0gICAgICAgIGlmICggcmMgKQ0KPiAtICAg
ICAgICB7DQo+IC0gICAgICAgICAgICBwcmludGsoIkZhaWxlZCB0byBpZGVudGl0eSBtYXAgUEZO
ICV4OiAlZFxuIiwgaSwgcmMpOw0KPiAtICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiAtICAgICAg
ICB9DQo+IC0gICAgfQ0KPiAtDQo+ICAgICBpZiAoIGNwdV9oYXNfdm14ICYmIHBhZ2luZ19tb2Rl
X2hhcChkKSAmJiAhdm14X3VucmVzdHJpY3RlZF9ndWVzdCh2KSApDQo+ICAgICB7DQo+ICAgICAg
ICAgLyoNCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5j
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMNCj4gaW5kZXggYzg1NTQ5Y2Nh
ZDZlLi44NTdkY2NiNmE0NjUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3g4Ni9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5j
DQo+IEBAIC00MDAsMTMgKzQwMCw3IEBAIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfaHdk
b21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgbWF4X3BmbiA9IChHQig0KSA+PiBQQUdF
X1NISUZUKSAtIDE7DQo+ICAgICB0b3AgPSBtYXgobWF4X3BkeCwgcGZuX3RvX3BkeChtYXhfcGZu
KSArIDEpOw0KPiANCj4gLSAgICAvKg0KPiAtICAgICAqIEZpcnN0IE1iIHdpbGwgZ2V0IG1hcHBl
ZCBpbiBvbmUgZ28gYnkgcHZoX3BvcHVsYXRlX3AybSgpLiBBdm9pZA0KPiAtICAgICAqIHNldHRp
bmcgdXAgcG90ZW50aWFsbHkgY29uZmxpY3RpbmcgbWFwcGluZ3MgaGVyZS4NCj4gLSAgICAgKi8N
Cj4gLSAgICBzdGFydCA9IHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSA/IFBGTl9ET1dOKE1CKDEp
KSA6IDA7DQo+IC0NCj4gLSAgICBmb3IgKCBpID0gcGZuX3RvX3BkeChzdGFydCksIGNvdW50ID0g
MDsgaSA8IHRvcDsgKQ0KPiArICAgIGZvciAoIGkgPSAwLCBzdGFydCA9IDAsIGNvdW50ID0gMDsg
aSA8IHRvcDsgKQ0KPiAgICAgew0KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGZuID0gcGR4X3Rv
X3BmbihpKTsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgcGVybXMgPSBod2RvbV9pb21tdV9tYXAo
ZCwgcGZuLCBtYXhfcGZuKTsNCj4gLS0gDQo+IDIuNDIuMA0KPiANCg0K

