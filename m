Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286EA5FEBB2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422623.668774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojH2C-0000iv-83; Fri, 14 Oct 2022 09:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422623.668774; Fri, 14 Oct 2022 09:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojH2C-0000gK-4g; Fri, 14 Oct 2022 09:31:16 +0000
Received: by outflank-mailman (input) for mailman id 422623;
 Fri, 14 Oct 2022 09:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojH2A-0000gE-N0
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:31:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f10d63b9-4ba2-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 11:31:12 +0200 (CEST)
Received: from AS9PR06CA0602.eurprd06.prod.outlook.com (2603:10a6:20b:46e::7)
 by GV2PR08MB7932.eurprd08.prod.outlook.com (2603:10a6:150:7f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Fri, 14 Oct
 2022 09:31:08 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::30) by AS9PR06CA0602.outlook.office365.com
 (2603:10a6:20b:46e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Fri, 14 Oct 2022 09:31:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 09:31:08 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 14 Oct 2022 09:31:08 +0000
Received: from 02957bd9d5fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4CE1846-BCF3-4581-9439-283CDC038883.1; 
 Fri, 14 Oct 2022 09:31:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02957bd9d5fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 09:31:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 09:31:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 09:31:00 +0000
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
X-Inumbo-ID: f10d63b9-4ba2-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sz3YIqKaEeveRotiNahZbRgZvQuWbSuE9/AMz10Edy3WACFu5clYXVaWdJorVykUY8qh5dIPOXeInnKdye9mWVCQQTO2/4WIGplojFxP3WP616DiuUrUBR1UaO20iUORikb4vypm0ewi2MoVrU8zPv+wHrXUC8De/qnHzW2aAyN7yk3w7yglm02Ai1wH7G3hnqAkENwcB42hFiENKy2FKTPO7WHxg5y0mPZCYCNwlCFqHODH5pIbJcRYx88Podckbck0malaYK9HB2pVYqtLMLdKSpkFPfwMbIohaykS2HB6bH143VCBV+LOwOAAj6qMkA7GMjxU2pNhAf0MQ5Prgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw+mE+hCGbWjo8enhFRs1cPf2DOpUeCL5aMaK943Lmg=;
 b=FSh+dOtW8qBzmfPKwGuRS2Favd6Fzxt4dDHswETEx4vvEfK+21PlSSsZSCCokW1EPrtq1qHEh/YAIqCnGE1XeFhfTqIAKkaoiWpgFaZ2E6JNidz+TjaXohYknDivfE6Fn/QnBqhW/fR+S5MIwaDJb9vTowqTk+uH+eks+jhHlQusORzzgdtnPF9wfsXfP/1zsoOPHV3NjjtMvQH5o4k/QO8cllhlTT+mpTPV9UouVsToX5/2gdCa4nLNZ6WscOpEveb72AurVH13FyDM29MGlYC0vg1Vs/7WqTF8YHoK0drt5gPd0ZNjKDEV9K4KimiRTL34HBCoH4sc6maBwgWG9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw+mE+hCGbWjo8enhFRs1cPf2DOpUeCL5aMaK943Lmg=;
 b=X4o245/wVSSdvFH7eD2mWWd2/ys+mUSenk/fauwWnT+t3IF1CTxaoz1p+KqIofgC5/uJkOyABC4CoqyFEvDPS4sPlu3W/Gkia6L+mEBUKg4STw4K2uL2/JyIKdt0UfkdpWcp6Z6A8YD7+AeaYGp67OSrQs1rG8EowphK0mbOgqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMeVErN05XAkl0M5YUWBE589guIfpd2PZQ3mz4e1evlKgFt789TSVCP2zDoe4IkE8OzFdVgWYJseTDkj2pap+eJ0YUnj4QKvi7vEPFZVptb2jIHRhRycy+2IZz6X4334VWrqfI9KmGl+Q7anSxPYX8UQ218u9LGIVfrlQ3JrO8/JQ2EGJmBGqMp+BYhoh1T6GvLdSlqfwEcxwO1y+Hw68xPPoBFwXhUy3EZqG2kXxPFuNUY7dB1tASAlKYAo3uEpB9VCHldGNmPq4PnPFRMajI5JhXpKUqJt1yuCqKBRcchX3RLrUo4xFjP2YNZQT1SZpVBxpSmFsODsI6LGrXAqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw+mE+hCGbWjo8enhFRs1cPf2DOpUeCL5aMaK943Lmg=;
 b=gEREg+8BmAnLVch0VS8ZLgRZ3HyYb4HYnSd+jGt7mji00nCZHDkpqPcEYpO+TOi4oR7ykxuWrB2obD4M286h6pGT5GMnfQ7+YSmd1p84S4q2QfYBrfB5nq5woQMz0kaEFYKdh7bPwXLVbkFq1nKn838AnpF9CkuUxqIpxE8DwvA0Xp7fns0/05jMSnMBpm/Axjc+J5WCuPoZRIsELId3/d6PQxml+riYxkW6qk/WjyHDtMeE46jzXcRBWFlYg1ZOtNGisUEHalL43J2bz9AxzZHJ7gmEDFnacMQF+r5qJalsINuOrR3AxVZGN29rOF/DBxrqXBLFNL01DqJ3KsZHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw+mE+hCGbWjo8enhFRs1cPf2DOpUeCL5aMaK943Lmg=;
 b=X4o245/wVSSdvFH7eD2mWWd2/ys+mUSenk/fauwWnT+t3IF1CTxaoz1p+KqIofgC5/uJkOyABC4CoqyFEvDPS4sPlu3W/Gkia6L+mEBUKg4STw4K2uL2/JyIKdt0UfkdpWcp6Z6A8YD7+AeaYGp67OSrQs1rG8EowphK0mbOgqc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Topic: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Thread-Index: AQHY3q+bU7An58kRd0C18nD7mqtwpK4Nk9IAgAAAuGCAAAmOAIAAAGRg
Date: Fri, 14 Oct 2022 09:31:00 +0000
Message-ID:
 <AS8PR08MB7991508880001B08C602881692249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-2-Henry.Wang@arm.com>
 <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
 <AS8PR08MB799119B54A5FE419CDDB9C1592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3cfdcd2b-cc18-0585-d837-f5932d9eeb0f@xen.org>
In-Reply-To: <3cfdcd2b-cc18-0585-d837-f5932d9eeb0f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7D9C695FC404CE4BA803EE34E357151F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6693:EE_|AM7EUR03FT009:EE_|GV2PR08MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5ab7b4-5b1f-4da3-2542-08daadc6d30e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wG+HVa1iYWnw3yXS+LlUHcghHIMo2pXWixNllI4sfKwX94Bnvdhts+ZmopBfe71q21utpVZyWr33l/DEiuexq+2dYlu6CNXErQnAmDlCskWIZo+hyR9fiS97ggA6Wz7C2VEAUKlVGQt2p3PwqNMNDDaawlKivhc81ghDVVrs89PNCNunaaFdEh47BiJcmr61PEN+6Ua3gpDd/THtHtjblekbYD6noCuuWwPP1X62ObOqUgLROOg2L/kiprd048+SYt2/lNM0WuByKGO1at9VL+Fmrt/4pBlsVwst4iRXdWHDCqUyAJz7K6mNqWvwVQGlyKHWtw18vdtQeCVLtWR2pJRIFmovL3I7WP1KHjjvUNl8HTMZZ+sbaRkR8CSA3FVCvojKgGDfK/KS6mqAGa1uDB+Z/MsAesaVIA2bL6WAu5e71gyl/U8XMTG9svTDj0FaYI6Sguy9DbwfOnoaTFtf1OF1EqZEVPLTq8kAXTir2slF0KzpcmDXz1IkXT4ZiTgLBJ3E9Z5rIIJpWuwb1NQZgYEcSWBnYhJY4Ab3ot+UDrgMNeUqNmUXVHXigEJgZ4vNGXDlvDGH0rEvwfVR79+fdYbDJfQJEpPjVRdk5lQrHWI2+EWuaYXbcv+E3Tl/BtFMMoTP/ZKatJ6RcD+dHYuuFwEUiqQDqe1ZrwRfyCL8IPCLcUFcar2nAa7QJdSppAOOKQJ3yXMNMFhRsR3llHgqUpRktNs/2D03XmHSlJzu+Fvhe10GKojfZPA2HlWiFiQ6eSrWaqJ1NsGSYDrhySEoCA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(38070700005)(71200400001)(54906003)(110136005)(122000001)(66899015)(38100700002)(478600001)(8936002)(2906002)(52536014)(316002)(86362001)(33656002)(26005)(66946007)(76116006)(66476007)(83380400001)(66446008)(64756008)(7696005)(9686003)(66556008)(8676002)(5660300002)(186003)(41300700001)(4326008)(55016003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd4d199b-ed1e-4b73-3b35-08daadc6ce8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+4rrfachkf9s7pbFgSEyanhezZir5a1SQ+/tPDdp0XfYliDP6vXsQT6Zl3OJRkpafKV2kVmcRPwLb9Yw8s0fq/gN46RjwE1f8kKB8N1yW9vGDYvn8frmSlhFpeyOdf1sPbhdzxZNxCxGuGWq65//tlGbKqGJ9OmRfRpBAG7wDc2MimIGx4x2sJUJDHZ6kTvmkeznZoQ+WcowrXR4zywLF015nEl2SY1NTuaAq6MPi6rYztCoA6EnhOSwa7ySO6P4j2dAXMvNCrQas/brCO10UnovYZ8388Ve3s45/JuTsWC7jW3aj7v5xnBpj467iA38Ac6AzcwRVdxpIHgGff52/KffbCjhhumSo5ePEypAgjd0+jwWnpfKbkrD73HilrV3rGdWoOWbQTq/zwXvyP4+ecXqSh1ImUUWR/q4X+CFDsb+/sWPDLacReMHbLRDVQQ8W0VSqCE7UcloQKzKXvv6uywZ6k9pDFFpO0l6Qz9RzXOSwXcTnsJJJRpDQ83x1R9xwme887xuDWAocZp8laTUSEGj1MrsdR2P67fL52XlS7GB6wLCq3sY4hRdZYI64GVYcanVu8CGDEqfhnZEdXKn15UV/2FBKcPY5P5otodXQxu0gahcaMdW7kdTPkanILGbm3XXtswLtGBgSTmlzt0YoyCALpR5oG9Uc1WWHUinjPKAeCqOCbVhJYMyBsSUfDRxFuxwpQf03SMDBm3gcc5baNDdtj5JtLLPfDLIl6ttfiOOh4tlMZKhKxHx4NTdO66UHlR4d20lPDskYHqSnOWbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(54906003)(66899015)(107886003)(7696005)(110136005)(316002)(8676002)(70206006)(478600001)(70586007)(4326008)(5660300002)(26005)(81166007)(47076005)(9686003)(8936002)(336012)(6506007)(2906002)(356005)(186003)(36860700001)(83380400001)(82740400003)(55016003)(40480700001)(82310400005)(33656002)(40460700003)(41300700001)(52536014)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:31:08.1771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5ab7b4-5b1f-4da3-2542-08daadc6d30e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7932

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+PiArVXNlcnMgc2hvdWxkIGJlIG1pbmRmdWwg
dGhhdCB0aGUgc3RhdGljIGhlYXAgc2hvdWxkIGF0IGxlYXN0IHNhdGlzZnkgdGhlDQo+ID4+PiAr
YWxsb2NhdGlvbiBvZiB0aGUgUDJNIG1hcHMgZm9yIGFsbCBndWVzdHMuIEN1cnJlbnRseSwgdGhl
IG1pbmltYWwNCj4gPj4gcmVxdWlyZW1lbnQNCj4gPj4+ICtvZiBwZXItZG9tYWluIFAyTSBwYWdl
cyBwb29sIGlzIGluLXN5bmMgd2l0aCBmdW5jdGlvbg0KPiA+Pj4gK2xpYnhsX19nZXRfcmVxdWly
ZWRfcGFnaW5nX21lbW9yeSgpIChmb3IgeGwtY3JlYXRlZCBkb21VcykgYW5kDQo+ID4+PiArZG9t
YWluX3AybV9wYWdlcygpIChmb3IgZG9tMGxlc3MgZG9tVXMpLCB0aGF0IGlzLCAxTUIgcGVyIHZD
UFUsDQo+IHBsdXMNCj4gPj4gNEtpQiBwZXINCj4gPj4+ICtNaUIgb2YgUkFNIGZvciB0aGUgUDJN
IG1hcCwgYW5kIHBsdXMgNTEyS2lCIHRvIGNvdmVyIGV4dGVuZGVkDQo+IHJlZ2lvbnMuDQo+ID4+
DQo+ID4+IEkgdGhpbmsgdGhpcyB3b3JkaW5nIGlzIE9LIGlmIHRoZSBmZWF0dXJlIGlzIGEgdGVj
aCBwcmV2aWV3LiBIb3dldmVyLCBpZg0KPiA+PiB0aGlzIGlzIHNlY3VyaXR5IHN1cHBvcnRlZCwg
d2UgbmVlZCB0byBwcm92aWRlIHNvbWUgbW9yZSBkZXRhaWxzIGFib3V0DQo+ID4+IHRoZSBzaXpl
Lg0KPiA+Pg0KPiA+PiBJbiBwYXJ0aWN1bGFyLCB0aGlzIGRvZXNuJ3QgdGVsbCBhIHVzZXIgaG93
IHRoZXkgY2FuIGZpbmQgdGhlIHNpemUgdGhhdA0KPiA+PiB3b3VsZCBmaXQgdGhlbS4gQ2FuIHRo
aXMgYmUgZGVjaWRlZCB3aXRoIGEgZm9ybXVsYT8NCj4gPiBNeSBmZWVsaW5nIG9mIHRoZSBmb3Jt
dWxhIHdvdWxkIGJlOg0KPiA+DQo+ID4gVG90YWwgaGVhcCBzaXplIG5lZWRlZCBwZXIgZ3Vlc3Qg
PSAgMU1CICogbnVtX2d1ZXN0X3ZjcHUgKw0KPiA+ICAgICAgNEtCICogZ3Vlc3RfcmFtX3NpemVf
aW5fbWIgKyA1MTJLQiArDQo+ID4gICAgICB0aGUgbWVtb3J5IGFsbG9jYXRlZCBmcm9tIGhlYXAg
YnkgeHphbGxvYy94emFsbG9jX2FycmF5IGZvcg0KPiAJdmFyaW91cyB1c2VzDQo+ID4gICAgICBm
b3IgZXhhbXBsZSBhbGxvY19kb21haW5fc3RydWN0KCksIGQtPnNoYXJlZF9pbmZvLCBldnRjaG5f
YnVja2V0LCBldGMuDQo+IA0KPiBUaGVyZSBhcmUgYWxzbyBzb21lIHBhZ2VzIGFsbG9jYXRlZCB1
c2luZyBhbGxvY197eGVuLGRvbX1oZWFwX3BhZ2VzKCkuDQo+IFdlIGFsc28gbmVlZCB0byB0YWtl
IGludG8gYWNjb3VudCBydW50aW1lIGFsbG9jYXRpb24gZG9uZSBieSBzb21lDQo+IGh5cGVyY2Fs
bHMgKEkgY2FuJ3QgcmVtZW1iZXIgd2hpY2ggb25lKSBvciBzdWJzeXN0ZW0gbGlrZSBPUFRlZS4N
Cj4gDQo+IEluIGFkZGl0aW9uIHRvIHRoYXQsIHlvdSBhbHNvIGhhdmUgbWVtb3J5IGZvciB0aGUg
c3lzdGVtLiBFLmcNCj4gZnJhbWV0YWJsZXMsIFhlbiBwYWdlLXRhYmxlcywgdmFyaW91cyBkcml2
ZXIgYWxsb2NhdGlvbnMuLi4NCj4gDQo+ID4NCj4gPiBJcyB0aGlzIGZvcm11bGEgc29tZWhvdyBt
YWtlIHNlbnNlIHRvIHlvdT8gSSB0aGluayB3ZSBuZWVkIHRvIGhhdmUgYQ0KPiA+IHJvdWdoIGVz
dGltYXRpb24gb2YgdGhlIGxhc3QgcGFydCAoYm9vdCB0aW1lIGFsbG9jYXRpb24pIHRob3VnaC4N
Cj4gDQo+IFRoYXQncyBnb2luZyB0byBiZSBoYXJkLiBJdCB3aWxsIHZhcnkgZGVwZW5kaW5nIG9u
IHlvdXIgc3lzdGVtIGFuZCB0aGlzDQo+IGNvdWxkIGNoYW5nZSBpbiB0aGUgZnV0dXJlIGFzIHdl
IGFkZCBtb3JlIGZlYXR1cmVzLiBGb3IgaW5zdGFuY2UsIEkNCj4gZXhwZWN0IHRoZSBQQ0kgcGFz
c3Rocm91Z2ggd2lsbCBuZWVkIHNvbWUgbWVtb3J5IHRvIGtlZXAgdHJhY2sgb2YgYWxsDQo+IHRo
ZSBkZXZpY2VzLg0KPiANCj4gSSBhbSB3b3JyeSB0aGUgZm9ybXVsYSB3aWxsIGJlY29tZSBjb21w
bGV4LiBJZGVhbGx5IHdlIG5lZWQgdG8gaGF2ZSBhDQo+IHZlcnkgc2ltcGxlIGZvcm11bGEuIElm
IHRoYXQncyBub3QgcG9zc2libGUsIHRoZW4gd2UgbmVlZCB0byBwcm92aWRlIGENCj4gd2F5IGZv
ciB0aGUgdXNlciB0byBlc3RpbWF0ZSBpdCBhdCBydW50aW1lIChsaWtlIHdoYXQgSSBzdWdnZXN0
ZWQgYmVmb3JlKS4NCg0KSSBhZ3JlZSwgSSB0aGluayB0aGUgc2ltcGxlIGZvcm11bGEgY2FuIG9u
bHkgYmUgYWNoaWV2ZWQgaXMgd2UgaGF2ZSBhbg0KZXN0aW1hdGlvbiBvZiB0aGUgd29yc3QgY2Fz
ZSBzY2VuYXJpbyBvZiB0aG9zZSBzY2F0dGVyZWQgbWVtb3J5IHVzYWdlcy4NCkkgcmVtZW1iZXIg
SSBvbmNlIGhhZCBhIHRyeSBzbyBsZXQgbWUgdHJ5IHRvIGZpbmQgdGhlIHJlc3VsdHMgYmFjayB0
aGF0IHRpbWUuLi4NCg0KSSBhbSBhbHNvIHZlcnkgaW50ZXJlc3RlZCBpbiB0aGUgbWV0aG9kIHRo
YXQgeW91IHByb3Bvc2VkIHRvIHByb3ZpZGUgYQ0KbWVjaGFuaXNtIGZvciB1c2VycyB0byBnZXQg
dGhlIHN5c3RlbSBtZW1vcnkgYWxsb2NhdGlvbiBhdCBydW50aW1lLiBCdXQNCklJVUMgdGhpcyBu
ZWVkcyBzb21lIHdvcmsgaW4gYW5vdGhlciBzZXJpZXMuIENvdWxkIHlvdSBwbGVhc2UgY29uZmly
bSBpZiBJDQphbSB1bmRlcnN0YW5kaW5nIGNvcnJlY3RseT8gT3IgcHJvYmFibHkgWGVuIGhhcyBz
b21lIG1lY2hhbmlzbXMgdGhhdA0KSSBhbSBsaWtlbHkgdW5hd2FyZT8gVGhhbmtzIQ0KDQpLaW5k
IHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg==

