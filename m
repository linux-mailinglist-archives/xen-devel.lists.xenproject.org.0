Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF6809EAA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 09:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650433.1015945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWfK-0001ID-WD; Fri, 08 Dec 2023 08:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650433.1015945; Fri, 08 Dec 2023 08:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWfK-0001Es-TL; Fri, 08 Dec 2023 08:56:58 +0000
Received: by outflank-mailman (input) for mailman id 650433;
 Fri, 08 Dec 2023 08:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBWfJ-0001Em-P8
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 08:56:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe02::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9c9b0e-95a7-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 09:56:55 +0100 (CET)
Received: from DUZPR01CA0289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::20) by DBBPR08MB10411.eurprd08.prod.outlook.com
 (2603:10a6:10:536::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 08:56:51 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::7e) by DUZPR01CA0289.outlook.office365.com
 (2603:10a6:10:4b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 08:56:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 08:56:49 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Fri, 08 Dec 2023 08:56:49 +0000
Received: from 3853d9572eab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE5E640C-285D-4889-98A2-AFC212C33EEB.1; 
 Fri, 08 Dec 2023 08:56:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3853d9572eab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 08:56:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA6PR08MB10622.eurprd08.prod.outlook.com (2603:10a6:102:3cd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 08:56:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 08:56:38 +0000
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
X-Inumbo-ID: bc9c9b0e-95a7-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H3XZEtjkVdgEYgmQtfxW0NQ4sjryEne5UJPHb+PHwC3XkH7M6/SMvWVTro65bu2nA8AKaGQ151uJ7YVzf++12gaHII2Darkh4eJysFrgLYCubrmZSZrw+gp3rAFwUlFnMytvqUVB1wHlbE774lM2hfjz1PZp0v77H/KOk7UaizOL3T9BdG9zVWrOs547lV6QkcX3yOLKaTfVtUNhQIZj5ufWFrX/OFegM1WHH8ofWazAzJVEBKuoM4DFqsp7NBLyiI8Se4YbSKkuY8GYcmqqfQFDwZ33deQxEaeg1Ov9zsQ0tJB08aaGDowHGAEPIHiIE0bvnDWiRAfkEljg7mED8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlX09O5pdtIpVgkUO3NDWsQtjoI/eqSQ57MdOnQfTaA=;
 b=Cu7BXW2Bza1r6FbUBLxJWx2qTpFFIUSyyyneeAFfEIj0k00dxZ3Eu2sjwMcEM2j0HULjGDyJnQzIoTQnCU2ai4L143RxNHrTyCdNzemjaM1i7JGNN3AiK9VcOmQScUwo0V6wk+Jckf4FCoFflhcnkSeuDAu4cBbg5G5djcg3AJCl3BbwK8uFfHcCOqVFJA5Sg5QPacDuNK6dO5yc6daqdcxtW3Bgldv653h8X9ExeNzwxGAabsJN6sXpCEgeztZ3PJuRTBlHlsoE60jG2+mOSXo2dVfvPG/y0GU87Ow5O404XsBdGACacV+oyt2OEvbsk+NQrcc0QgT35hl1mHw7uA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlX09O5pdtIpVgkUO3NDWsQtjoI/eqSQ57MdOnQfTaA=;
 b=d7NzwIPnAfgGbf8PzKE+x37oRil7NEPYL0PUcaeRdWAY2MeDHdGsmexS7HGQkmnFKC4FeO82pkcmwfsi0qiLS7a9MzrFHzNLmnqwUsuRHwSG08VBPhxTi9OD4bdV5YWlPvy5pKQY4FzeN32d0p/iGrlhcYuGOskty7Djd+9SCAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1b38ee05c6e07b3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te+s/4IBs5ip7FtS0TeNUqDH890rrA70M5m5WHs0sYaCYzWIawQu1CDz0ov0zlhBBYi2s/ybVBfBC8FweyX7BZjTqIH2mkPYKG+0loAxwRexT1aKrbewWAsJlAUk3eAqDpS8gjUUknbhHx2so+qv7+c1SUNyTm15H3XzbpmuvVsBBp86iPWg69MN6YsB1Oz7f/RhhdwPuo534Qyweml5FI4a9a8vyA+DMQbgYbkNNyd+ORI3vx10aPAg/wFb6HKx0hnCcx9hyuKbjnROgq7KIvFIla0QoHSlp5Ezx759M5cOWmukJvoZk6eEAJYoMQ5/0TgC27PPh/SdCujqv5XBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlX09O5pdtIpVgkUO3NDWsQtjoI/eqSQ57MdOnQfTaA=;
 b=QK9BeJuYDTqmStI3BzLj2beIfXC6gjNg84oVGqlyVQ7a7MzqLuyyMnQ3d4Of4eoWGbSTM570YzargnUu6hBoVXs9OoeMGbMRuw114J5iJUqyFckAVMCLHo7mR03ayPYcGwhM7n/zToSjoMgptw+dkFtMZ5vyTI1lDAled9SnUAAvzPQtgRygfQDWTzSSCoJv3kjr++xtRpq7tl5FuB8/4cjiyGSHKqIM5XTA1oWk/ayE5EVia0AS7OJS9Ex4W4fzmg7ra6FnvGLj30/7IMtnUbAwsNrhZloWLoMYEgvfx+auysy2UNpZZVUB8axd7TTRzkTZF8rVVoeCaFjgrdJKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlX09O5pdtIpVgkUO3NDWsQtjoI/eqSQ57MdOnQfTaA=;
 b=d7NzwIPnAfgGbf8PzKE+x37oRil7NEPYL0PUcaeRdWAY2MeDHdGsmexS7HGQkmnFKC4FeO82pkcmwfsi0qiLS7a9MzrFHzNLmnqwUsuRHwSG08VBPhxTi9OD4bdV5YWlPvy5pKQY4FzeN32d0p/iGrlhcYuGOskty7Djd+9SCAA=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v2 2/5] automation: Add the Dockerfile to build TF-A and
 U-Boot for FVP
Thread-Topic: [PATCH v2 2/5] automation: Add the Dockerfile to build TF-A and
 U-Boot for FVP
Thread-Index: AQHaKZn9nB8nbm9rDUK+GJE7s4YGUrCfEO6AgAAEuYA=
Date: Fri, 8 Dec 2023 08:56:38 +0000
Message-ID: <CC528228-94A0-4D22-897F-24BDD5A5A11E@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-3-Henry.Wang@arm.com>
 <beb72672-4ff6-4fce-a3bd-2a7ead9e64ec@amd.com>
In-Reply-To: <beb72672-4ff6-4fce-a3bd-2a7ead9e64ec@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA6PR08MB10622:EE_|DB5PEPF00014B90:EE_|DBBPR08MB10411:EE_
X-MS-Office365-Filtering-Correlation-Id: 972adf9b-1cfb-40bb-6637-08dbf7cb9d53
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QfGpIKqMH5zRzUo6UCLUJXddgS9qV1/CjMcLXS/lqjQmkPH0tfKOmYLA5c0I88HGDoE5EkhzZ8lqbYviyToyTQOe187MaaM4Ba1ov+CZgu8vQ20Vtbhivs0adNgPfPPYK0IlV3qje/6heN+UDtFqQEXRYbsxZCI98JKWPBs+i03Uovx3FBEs0pT6SSvawJMR0g92Ecqdt7NXy2noygUjcGfbO7Uf6bqhfE+AA3NI8IVql6xmgQCxrbQI8jjU8d1RacaATSuNXNbbsp9TfIML10xwaBm1XkepVHIgoLiueLelCGF9GPGHF1vkQv59CHS//9xoPkoSZtjPlTmOTO0zEprzKAsI5bLlE7SOe53XpHmWghaE1s6k6SrcIh6v5s7ECAxPA04sf5Pd/cCDP88iu8jt0Wc0AlZJTfckznNrGyj4nASXTmexIi38CtGNwQBzo/hhlbg6pehxrhUvyrCxY0FJl1f45jSZx9Imk300lV6SXI01+TeaQEkdoyeRpqeo34QcDot0h2xrEmskgZh3EM1fLtU9gondMrnGKzjsq8uFwD2Q8TohNrCOpVg76R4W708J4uxnnyPBo/+U+GNuHHrkZsdh5gt/Lqkz281hKGKkCfQpZLj8o0qX1kXZs1nxqlUeV3XB+U82CSYm6mRHQlPe3aTZ3Ie6mash8eO9SDlrC0byZHuIVtInalVjAmLV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8936002)(4326008)(41300700001)(36756003)(26005)(316002)(38070700009)(64756008)(66446008)(71200400001)(66476007)(66556008)(8676002)(66946007)(54906003)(966005)(6916009)(6486002)(86362001)(76116006)(2616005)(91956017)(6512007)(33656002)(478600001)(2906002)(53546011)(5660300002)(6506007)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B8A8F85D6FB0745ADE816DF754CC4AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d45f302-7658-4c80-bdd2-08dbf7cb96da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	erNxcPtoLY2L09JfKraB+JsFT8jEv2EuiUc7QQsFeVxaQ0rKF5u8oIUCBrBfMIFsvmfUq+vWFMyjzABf5qNwpyBEMvOFkma/kvmHe1xq5bRksL0FEIgFXK26wv2HHyDJuKX9BjrDkGYVyx4TBK+wLSNtDTkuHJSr5i4GkWUn5h7AVogPR+pM7OmsKteDVvWN1taWZPiIIL/2ovLw8EW0hxxa/wVPr49SaHyB+DgzHlf5OWamZ3zM/BJjRECdSsZQFV75Iy3YaejWQQxwd0xoyMxkGFEp/tcNAV1dST45ZElFUBt6Z7QaPtzHVoCnj+LvMEpGodICtj/BXFRqLNRfC6JXRWuf42X+PKXMFeglynA+sYzoaERY8ZxwD1JQBazalBlzrFvdvXjMQ8EqfopFo3BR+SuDb7Z62J5F91V9Ibu1WXxv7di3a6IRGHFIr9+J7Pvt6LHzCYZLZ7Vtojk+V65fgpjtpSt0KuKxibB2vW3E6l6qlnmdNctce7f/L16lVe7JnCiE+8dZKtSsoxpRMSI6ICRrFbqBfMspxJZN2xH0I/FvLoBQMt0jGa4vF280vTPY+fQyCskV0eQC/RPDmaZ+OfD5lxtRz+p0hKafiLVaGRkDEFqNKsbDsMGbTW2/kd8Nwj6PMUOUhaeH2QJsrIpJE3Co8F2OFia59oYZnfg/NaUFpBjo/EONIR/WfWZN7LoGQJIB59BZKSOP7ujFizfdz7sxOIqBxJ/YiWRQ13X29FKUzEu5YKWy5e7x85o1IbQKQ46JfErWTZD35r9L4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(478600001)(5660300002)(40480700001)(2906002)(6486002)(966005)(36860700001)(4326008)(86362001)(316002)(54906003)(33656002)(70206006)(70586007)(8936002)(6862004)(8676002)(6512007)(356005)(6506007)(36756003)(41300700001)(81166007)(2616005)(53546011)(40460700003)(26005)(82740400003)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 08:56:49.2967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972adf9b-1cfb-40bb-6637-08dbf7cb9d53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10411

SGkgTWljaGFsLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAxNjozOSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDA4
LzEyLzIwMjMgMDY6NDYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiANCj4+IFVubGlrZSB0aGUgZW11
bGF0b3JzIHRoYXQgY3VycmVudGx5IGJlaW5nIHVzZWQgaW4gdGhlIENJIHBpcGVsaW5lcywNCj4+
IHRoZSBGVlAgbXVzdCBzdGFydCBhdCBFTDMuIFRoZXJlZm9yZSB3ZSBuZWVkIHRoZSBmaXJtd2Fy
ZSwgaS5lLiB0aGUNCj4+IFRydXN0ZWRGaXJtd2FyZS1BIChURi1BKSwgZm9yIGNvcnJlc3BvbmRp
bmcgZnVuY3Rpb25hbGl0eS4NCj4+IA0KPj4gVGhlcmUgaXMgYSBkZWRpY2F0ZWQgYm9hcmQgKHZl
eHByZXNzX2Z2cCkgaW4gVS1Cb290IChzZXJ2ZSBhcyB0aGUNCj4+IEJMMzMgb2YgdGhlIFRGLUEp
IGZvciB0aGUgRlZQIHBsYXRmb3JtLCBzbyB0aGUgVS1Cb290IHNob3VsZCBhbHNvIGJlDQo+PiBj
b21waWxlZCBmb3IgdGhlIEZWUCBwbGF0Zm9ybSBpbnN0ZWFkIG9mIHJldXNpbmcgdGhlIFUtQm9v
dCBmb3IgdGhlDQo+PiBleGlzdGluZyBlbXVsYXRvcnMgdXNlZCBpbiB0aGUgQ0kgcGlwZWxpbmVz
Lg0KPj4gDQo+PiBUbyBhdm9pZCBjb21waWxpbmcgVEYtQSBhbmQgVS1Cb290IGV2ZXJ5dGltZSBp
biB0aGUgam9iLCBhZGRpbmcgYQ0KPj4gRG9ja2VyZmlsZSB0byB0aGUgdGVzdCBhcnRpZmFjdHMg
dG8gYnVpbGQgVEYtQSB2Mi45LjAgYW5kIFUtQm9vdA0KPj4gdjIwMjMuMTAgZm9yIEZWUC4gVGhl
IGJpbmFyaWVzIGZvciB0aGUgVEYtQSBhbmQgVS1Cb290LCBhcyB3ZWxsIGFzDQo+PiB0aGUgZGV2
aWNlIHRyZWUgZm9yIHRoZSBGVlAgcGxhdGZvcm0sIHdpbGwgYmUgc2F2ZWQgKGFuZCBleHBvcnRl
ZCBieQ0KPj4gdGhlIENJIGpvYiBpbnRyb2R1Y2VkIGJ5IGZvbGxvd2luZyBjb21taXRzKS4gTm90
ZSB0aGF0LCBhIHBhdGNoIGZvcg0KPj4gdGhlIFRGLUEgd2lsbCBiZSBhcHBsaWVkIGJlZm9yZSBi
dWlsZGluZyB0byBlbmFibGUgdGhlIHZpcnRpby1uZXQNCj4+IGFuZCB0aGUgdmlydGlvLXJuZyBk
ZXZpY2Ugb24gdGhlIEZWUC4gVGhlIHZpcnRpby1uZXQgZGV2aWNlIHdpbGwNCj4+IHByb3ZpZGUg
dGhlIG5ldHdvcmtpbmcgc2VydmljZSBmb3IgRlZQLCBhbmQgdGhlIHZpcnRpby1ybmcgZGV2aWNl
DQo+PiB3aWxsIGltcHJvdmUgdGhlIHNwZWVkIG9mIHRoZSBGVlAuDQo+PiANCj4+IFNpZ25lZC1v
ZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiAtLS0NCj4+IHYy
Og0KPj4gLSBBZGQgU3RlZmFubydzIFJldmlld2VkLWJ5IHRhZy4NCj4+IC0tLQ0KPj4gKyMgQnVp
bGQgVS1Cb290IGFuZCBURi1BDQo+PiArUlVOIGN1cmwgLWZzU0xPIGh0dHBzOi8vZnRwLmRlbngu
ZGUvcHViL3UtYm9vdC91LWJvb3QtIiRVQk9PVF9WRVJTSU9OIi50YXIuYnoyICYmIFwNCj4+ICsg
ICAgdGFyIHh2ZiB1LWJvb3QtIiRVQk9PVF9WRVJTSU9OIi50YXIuYnoyICYmIFwNCj4+ICsgICAg
Y2QgdS1ib290LSIkVUJPT1RfVkVSU0lPTiIgJiYgXA0KPj4gKyAgICBtYWtlIC1qJChucHJvYykg
Vj0xIHZleHByZXNzX2Z2cF9kZWZjb25maWcgJiYgXA0KPj4gKyAgICBtYWtlIC1qJChucHJvYykg
Vj0xIGFsbCAmJiBcDQo+IERvIHdlIG5lZWQgJ2FsbCc/IENhbid0IHdlIGp1c3QgYnVpbGQgdGFy
Z2V0ICd1LWJvb3QnIGZvciB1LWJvb3QuYmluPw0KDQpJIHRoaW5rIHlvdXIgc3VnZ2VzdGlvbiBt
YWtlcyBzZW5zZSwgYW5kIEkgY2FuIGhhdmUgYSB0cnksIGlmIGNoYW5naW5nIGFsbCB0byB1LWJv
b3Qgd29ya3MsDQpJIHdpbGwgdXNlIHRoYXQgaW4gdjMuDQoNCj4+ICsgICAgY2QgLi4gJiYgXA0K
Pj4gKyAgICBnaXQgY2xvbmUgLS1icmFuY2ggIiRURkFfVkVSU0lPTiIgLS1kZXB0aCAxIGh0dHBz
Oi8vZ2l0LnRydXN0ZWRmaXJtd2FyZS5vcmcvVEYtQS90cnVzdGVkLWZpcm13YXJlLWEuZ2l0ICYm
IFwNCj4+ICsgICAgY2QgdHJ1c3RlZC1maXJtd2FyZS1hICYmIFwNCj4+ICsgICAgY3VybCAtZnNT
TE8gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLWFybS9wbGFpbi9tZXRhLWFybS1i
c3AvcmVjaXBlcy1ic3AvdHJ1c3RlZC1maXJtd2FyZS1hL2ZpbGVzL2Z2cC1iYXNlLzAwMDEtZmR0
cy1mdnAtYmFzZS1BZGQtc3Rkb3V0LXBhdGgtYW5kLXZpcnRpby1uZXQtYW5kLXJuZy5wYXRjaCBc
DQo+PiArICAgICAgICAgLS1vdXRwdXQgMDAwMS1mZHRzLWZ2cC1iYXNlLUFkZC1zdGRvdXQtcGF0
aC1hbmQtdmlydGlvLW5ldC1hbmQtcm5nLnBhdGNoICYmIFwNCj4+ICsgICAgZ2l0IGNvbmZpZyAt
LWdsb2JhbCB1c2VyLmVtYWlsICJ5b3VAZXhhbXBsZS5jb20iICYmIFwNCj4+ICsgICAgZ2l0IGNv
bmZpZyAtLWdsb2JhbCB1c2VyLm5hbWUgIllvdXIgTmFtZSIgJiYgXA0KPiBJZiB0aGlzIGlzIG5l
ZWRlZCBmb3IgZ2l0IGFtLCB5b3UgY291bGQgZ2V0IGF3YXkgdXNpbmcgJ3BhdGNoIC1wMScNCg0K
SG1tbSByaWdodCwgdGhlbiBwcm9iYWJseSB3ZSBjYW4gZXZlbiBub3QgaW5zdGFsbCBnaXQgYW5k
IHVzZSB0aGUgdGFyYmFsbCBpbnN0ZWFkIG9mDQpnaXQgY2xvbmUuDQoNCg0KPj4gKyAgICBnaXQg
YW0gMDAwMS1mZHRzLWZ2cC1iYXNlLUFkZC1zdGRvdXQtcGF0aC1hbmQtdmlydGlvLW5ldC1hbmQt
cm5nLnBhdGNoICYmIFwNCj4+ICsgICAgbWFrZSAtaiQobnByb2MpIERFQlVHPTEgUExBVD1mdnAg
QVJDSD1hYXJjaDY0IEZWUF9EVF9QUkVGSVg9ZnZwLWJhc2UtZ2ljdjMtcHNjaS0xdCBhbGwgJiYg
XA0KPj4gKyAgICBtYWtlIC1qJChucHJvYykgREVCVUc9MSBQTEFUPWZ2cCBBUkNIPWFhcmNoNjQg
RlZQX0RUX1BSRUZJWD1mdnAtYmFzZS1naWN2My1wc2NpLTF0IGZpcCBCTDMzPS4uL3UtYm9vdC0i
JFVCT09UX1ZFUlNJT04iL3UtYm9vdC5iaW4gJiYgXA0KPj4gKyAgICBjcCBidWlsZC9mdnAvZGVi
dWcvYmwxLmJpbiAvICYmIFwNCj4+ICsgICAgY3AgYnVpbGQvZnZwL2RlYnVnL2ZpcC5iaW4gLyAm
JiBcDQo+PiArICAgIGNwIGJ1aWxkL2Z2cC9kZWJ1Zy9mZHRzL2Z2cC1iYXNlLWdpY3YzLXBzY2kt
MXQuZHRiIC8gJiYgXA0KPj4gKyAgICBjZCAvYnVpbGQgJiYgXA0KPj4gKyAgICBybSAtcmYgdS1i
b290LSIkVUJPT1RfVkVSU0lPTiIgdHJ1c3RlZC1maXJtd2FyZS1hDQo+IFlvdSBmb3Jnb3QgdG8g
cmVtb3ZlIHUtYm9vdCB0YXIgZmlsZQ0KDQpvb3BzLCBuaWNlIGNhdGNoLCB0aGFua3MuIFdpbGwg
YWxzbyByZW1vdmUgdGhhdCBpbiB2My4NCg0KPiBPdGhlciB0aGFuIHRoYXQ6DQo+IFJldmlld2Vk
LWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGFua3MhDQoNClN0
ZWZhbm86IENhbiBJIGtlZXAgeW91ciBSZXZpZXdlZC1ieSB0YWcgYWZ0ZXIgYWRkcmVzc2luZyBN
aWNoYWzigJlzIGNvbW1lbnRzIGFib3ZlPw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0K
PiB+TWljaGFsDQoNCg==

