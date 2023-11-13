Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F87E9FC8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631689.985265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YkY-0005lJ-TG; Mon, 13 Nov 2023 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631689.985265; Mon, 13 Nov 2023 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YkY-0005ir-QL; Mon, 13 Nov 2023 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 631689;
 Mon, 13 Nov 2023 15:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUjx=G2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2YkX-0005il-22
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 472ebba0-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:21:12 +0100 (CET)
Received: from DUZPR01CA0165.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::6) by AS8PR08MB6567.eurprd08.prod.outlook.com
 (2603:10a6:20b:318::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:21:08 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::98) by DUZPR01CA0165.outlook.office365.com
 (2603:10a6:10:4b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26 via Frontend
 Transport; Mon, 13 Nov 2023 15:21:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 15:21:08 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Mon, 13 Nov 2023 15:21:07 +0000
Received: from 50741a1a0188.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C33DAEEB-F183-421E-8D91-CAE35F2DBF66.1; 
 Mon, 13 Nov 2023 15:20:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50741a1a0188.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 15:20:56 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS2PR08MB10226.eurprd08.prod.outlook.com (2603:10a6:20b:62f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:20:53 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:20:53 +0000
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
X-Inumbo-ID: 472ebba0-8238-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=M8MbWkqCozhrPjGnLQSum6vvafaRqZIUerobW+il+wezpl1Vey76EPar1va8NxflWzaGCQkGxgmzYrRhmHhyweylOHwmTxiEPipoVgFR3MhApCqcaq8x8CsJj2Mrpdxk7dCR+ADEXg5d3HPPHsfrNCwxpjo9bI54DCtF3jf5VvYezx0L8FLpuh3PelCXrLW6P8ob6CW0x2jUDap/CDNnEkr+JyBhl4wQZvyRLq8n6oBm3TzTn6PGM72uuoNRC+e/7Xn4CHrsuqfYTrZbcZC4UpItcnVfXmyOmYdgqhV/YBaO1oMG82RSStWOWkkEHPSq9qMTpPvHPtcOXLyM6ymKMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6I83BIHWLG7ukuBbIlY6vEQOV9lrGVifcZKKQH3w9I=;
 b=IGmKHtMsJT09FBtP8Gya0cmg6yjm8Pnk+71JF9mcY/MIul9otK/O4j1ecDW2llBzlQK3wZBlwG+tYf94FYcCjlcoBUGIJYGRSUGUse1kvm9iuN32HHYRufH+SZcoVldnVZMsBAjaBdh1k7HaMNkP+YVG5LRGvxEoNhvFM8iH4VGXLdO3LWeO5b6lqfUA3wWqjtSYFIH2maHRUDO+KdQ6ju4maiFT2JgpplOBNh2D9SAf0rZ0yPbaJYQo5mLkrGNrGmYYNY7qpKYoKLE4rnmSYgaAWSXnRZ1HozfJzaTwJzZ5w6j5AcPgH7AlVawF9mOwM2SEkr8DWrUsScbZB0CTRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6I83BIHWLG7ukuBbIlY6vEQOV9lrGVifcZKKQH3w9I=;
 b=JRoveuMrykmZ/WgTzqETURdVkXKIOqns/IBkd1MTulmc+TGFlsGVgkZ8M6PhyL6SmUKtxskyzd1MVJkvuhfAWGQBSs5X2PkIrFkT60NU+tBdlDUL+FtQ6dT723vnqpq0lO2c0atFkS34yk/00CkbcZOKp7o3Z1mhpkn+ckGb5aw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06a415a9a3c099fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+GJ/1ggJk1L3wza08LpAIlz0JAOEptAkopkajm/wRjmb8BNkzut/MIboxJ0UKiYm8tYautp6ZH1wP+xBmCA36BcTjouBxQmpWgFXtWAedHQq1/3RF1nhHoqMp8bprzle7+k8/xwruJkae39j+NDUTcE/sre8DHURII4BdREg0x6IfFXmwYzPbhy78owtDByuk6+YOPOSvrFu8Siq/5YUBJV8jTRFILfLkRAHNfi61H8NUVqqH1MMNLp86H2exlFeTIoAYNWRQP58Cdw3UbCNYiEXoZPsUlO4Lrqphkk+AG4cWM7vpZL1Q7bjgXmnyjf9KoI8J9Ugbl/THYGn6sOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6I83BIHWLG7ukuBbIlY6vEQOV9lrGVifcZKKQH3w9I=;
 b=SzgIIe46gI+XzP7u7kOT5pnHhGD5AVY0KATxpwPFoO96ErRbfrAos7BkkFCb+lgTXqoBHkQx5izLxLR3gUOwjvzDTduiouHprktJHzJJwAKY2k+51Z1Q/E/uiyy7jouURLHREvPIn8dCX9sQ2bLeGOFm8PuoyXb1uJuPc0ZbV4E1xAENxwLdE8U/DJEIDx9SB1Mj2lfotHLhZwGDwZXLjMPqDEf9cyrRyj7BKNPWGEsjTznwbYJ+3+lg5ZRdDNdr+scPtPClgUS/v5J9+CC4Z6n/OYYQ5J3SFPw9qIx9YvN7ppjcCEWK7NLyoNLkTem5XM3cQjBi8COmR+rb+ps2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6I83BIHWLG7ukuBbIlY6vEQOV9lrGVifcZKKQH3w9I=;
 b=JRoveuMrykmZ/WgTzqETURdVkXKIOqns/IBkd1MTulmc+TGFlsGVgkZ8M6PhyL6SmUKtxskyzd1MVJkvuhfAWGQBSs5X2PkIrFkT60NU+tBdlDUL+FtQ6dT723vnqpq0lO2c0atFkS34yk/00CkbcZOKp7o3Z1mhpkn+ckGb5aw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 1
Thread-Topic: Clang-format configuration discussion - pt 1
Thread-Index: AQHaEild8psuTSSrb0SmQq+9AXKRR7B4JX+AgABAHYA=
Date: Mon, 13 Nov 2023 15:20:53 +0000
Message-ID: <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
In-Reply-To: <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS2PR08MB10226:EE_|DU6PEPF0000B61D:EE_|AS8PR08MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: a11ec8f5-8cd1-471d-3cc5-08dbe45c2936
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kcnbl7j6Nq6CDeCn7iiq5d+rs5Go1K72xBb+TMJAOQWfxq+t64x3uZtbmYKxB43c1eGL+ATXvHPWZZ6eq1cwW4Wc+MhjFbMu8LXM/3cICds18BnU8ehit7v8uu6OpC22aZd0U3+rO8DY+X/3B78gqlOfsJ/2BmkEiOXzoiGy3wYkdu2YCaoTmGpt2ugcPEdKC+m65i4cmhUPzSimsaMkPbUyRb4I53UQXyqnnE1mkDMSTjejatjXithBlZ6UJ+XwmeYUoEohF4adZw5h5k0T6Jft6xFctKVBWJQTsBL3SlCddwX1X/b4YLl10Him4mEQKz56WD95eTICQ5b8bc3uVcJNR4YCeypYnH1rqpo9OhroEbO9BjYFfSEllbZA6F2/cTAR0HcHvqJPnMkj6EZGa0nWeM1HEAc6PRDKEa9Q3lUtitlbTy1w4U129KPbS17j9Tp2jIhXDs+IgE3DA3uZ70axx5u0BR+KlpNX1WG0pbql/1sCPgZ0pE1eAQHhpkf6RdSMa6mBzapObvbWM/OMIUTEj+A6GBpl+VettJILRedgvY/vStrBI4CS5lP670XD0/pa8TwTLtI/pdkGSV6lrtNDyy3dCpllaPPU29/JGkZxbP7umdqlbwTtY9c0I9qqGBfWO5RIQEpGEv3JDzCN3w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(53546011)(6506007)(71200400001)(2616005)(6512007)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(6916009)(91956017)(66476007)(66446008)(54906003)(64756008)(66556008)(66946007)(76116006)(122000001)(36756003)(86362001)(316002)(33656002)(38100700002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A723D13E93FDCE45B532A4BA86FA8B78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42e87ad5-e2e1-4326-278c-08dbe45c208e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GXYLbgb1iXutsOXbbV4Ne6tGJZjSFtDLx1reHrTnnJ3F3e7KCSgXWYQt7ONOfJDuoCwF0WwOQ7YXLdLop225pOMY7qopJwuwdeOO6cRD7WJCCXWCGdLzxrTaS6TqV9QdB5Wj85qMzMZX5vBz0p03Sx/XJTKa0AYhpSeCdvkOejOP33CQkvjDXyoHT06gtN6nVk7brSNQN/zITeHZF4wvUih4bUy3rrF4FzdbyBJet1f5ObmxZujwk/6xczkGYtrjp2nApBaS1sq5wQxBU6HqNpS9FcFCnGEtm5nEIQwW6YeWM8/tnpIdckRWAxTTnwOrFPiBu2+ib+zoMkH2wncBvqPSHMiY+zlixjsWuuMwKHn8GP3jmMDPb3q5vEKwgqBg9xUKKwIaWD2xteh2nQACX8x2KA4PzfRMbteqC4pAVmh/JSMEajkY6b/d8u4BajR5663j9SLnggu5k82Lr8GvYWn2IDdSgky9DC/p6CQiAHlHvlfle3+ncBZnOZQ7cokSGQWDQ5Y3W5uSXoEeU48TmlbfrrwLEpn0zM6o5FaTJuFPCB5tyYM1EJl6QiUHz2hp2cUz3A2z5O0Nklzb6RFMH+/imaL5qjycPw+GIp0QGqgKqb2nOtlL5m+f2r1sH3RiyGoPNF66uDdmp60vWgwDVLsAZ3bOSvoXgD3qNgdgFsXXizxzO0JgM2dJrR/SAuJLPsY8FUWsHi4wH9tEeptQbHtsu+pEJXhjsz3tmSF6bEuXf6ynuGfBLed247DGkSex
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(40460700003)(2616005)(5660300002)(86362001)(41300700001)(47076005)(33656002)(336012)(26005)(82740400003)(54906003)(70586007)(6512007)(70206006)(316002)(36756003)(81166007)(478600001)(6486002)(53546011)(356005)(6506007)(8676002)(6862004)(4326008)(40480700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:21:08.2601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11ec8f5-8cd1-471d-3cc5-08dbe45c2936
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6567

DQoNCj4gT24gMTMgTm92IDIwMjMsIGF0IDExOjMxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDguMTEuMjAyMyAxMDo1MywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+
IA0KPj4gU3RhbmRhcmQ6IEMrKzAzDQo+PiANCj4+IC0tLQ0KPj4gRnJvbSB0aGUgZG9jdW1lbnRh
dGlvbjogUGFyc2UgYW5kIGZvcm1hdCBDKysgY29uc3RydWN0cyBjb21wYXRpYmxlIHdpdGggdGhp
cyBzdGFuZGFyZC4NCj4gDQo+IFNpbmNlIEkgY29udGludWUgdG8gYmUgcHV6emxlZCAtIGlpcmMg
eW91IHNhaWQgdGhpcyBpcyBiZWNhdXNlIG9mIGxhY2sNCj4gb2YgYXZhaWxhYmlsaXR5IG9mICJD
OTkiIGFzIGEgdmFsdWUgaGVyZS4gV2hhdCdzIGVudGlyZWx5IHVuY2xlYXIgdG8NCj4gbWUgaXM6
IEhvdyBkb2VzIHRoaXMgbWF0dGVyIHRvIGEgdG9vbCBjaGVja2luZyBjb2Rpbmcgc3R5bGUgKHdo
aWNoIGlzDQo+IGxhcmdlbHkgYWJvdXQgZm9ybWF0dGluZywgbm90IGFueSBsZXhpY2FsIG9yIHN5
bnRhY3RpY2FsIGFzcGVjdHMpPw0KPiANCj4+IFRoaXMgdmFsdWUgaXMgdXNlZCBhbHNvIGluIExp
bnV4Lg0KPiANCj4gQ29uc2lkZXJpbmcgaG93IGRpZmZlcmVudCB0aGUgdHdvIHN0eWxlcyBhcmUs
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcw0KPiBvdmVybHkgcmVsZXZhbnQuDQoNCk9rLCBtYXliZSBJ
IHVuZGVyc3RhbmQgeW91ciBwb2ludCwgeW91IGFyZSBsb29raW5nIGZvciBhIHJlYXNvbiB0byBk
ZWNsYXJlIHRoaXMgY29uZmlndXJhYmxlIGluc3RlYWQNCm9mIG5vdCBzcGVjaWZ5aW5nIGl0IGF0
IGFsbD8NCg0KSWYgaXTigJlzIHRoYXQsIGZyb20gd2hhdCBJIHVuZGVyc3RhbmQgY2xhbmctZm9y
bWF0IHdpbGwgdXNlIHRoZSBkZWZhdWx0IHZhbHVlIGlmIHdlIGRvbuKAmXQgc3BlY2lmeSBhbnl0
aGluZw0KZm9yIHRoaXMgb25lLCBzbyBpdCB3aWxsIHRha2Ug4oCYTGF0ZXN04oCZLiBJIHRoaW5r
IHdlIHNob3VsZCBwdXQgYSB2YWx1ZSBmb3IgdGhpcyBvbmUgdG8gZml4IGl0IGFuZCBkb27igJl0
IGhhdmUNCnN1cnByaXNlcyBpZiB0aGF0IGJlaGF2aW91ciBjaGFuZ2VzIGFuZCBzZWVpbmcgdGhh
dCBhbHNvIGluIExpbnV4IHRoYXQgdmFsdWUgaXMgZml4ZWQgaW5jcmVhc2VkIG15DQpjb25maWRl
bmNlLg0KDQpIb3dldmVyLCBpZiB5b3UgZmVlbCB0aGF0IHdlIHNob3VsZCBub3Qgc3BlY2lmeSBp
dCwgSeKAmXZlIGRvbmUgYSB0ZXN0IGFuZCBub3Qgc3BlY2lmeWluZyBpdCBpcyBub3QgY2hhbmdp
bmcNCnRoZSBjdXJyZW50IG91dHB1dC4gSSBjYW7igJl0IHNheSB0aGF0IGZvciBhIGRpZmZlcmVu
dCBjbGFuZy1mb3JtYXQgdmVyc2lvbiB0aG91Z2ggb3IgaWYgY2hhbmdlcyBoYXBwZW4gaW4gdGhl
DQpmdXR1cmUuDQoNCg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+IA0KPj4gQXR0cmlidXRlTWFjcm9zOg0KPj4gIC0gJ19faW5pdCcNCj4+ICAt
ICdfX2V4aXQnDQo+PiAgLSAnX19pbml0ZGF0YScNCj4+ICAtICdfX2luaXRjb25zdCcNCj4+ICAt
ICdfX2luaXRjb25zdHJlbCcNCj4+ICAtICdfX2luaXRkYXRhX2NmX2Nsb2JiZXInDQo+PiAgLSAn
X19pbml0Y29uc3RfY2ZfY2xvYmJlcicNCj4+ICAtICdfX2h3ZG9tX2luaXQnDQo+PiAgLSAnX19o
d2RvbV9pbml0ZGF0YScNCj4+ICAtICdfX21heWJlX3VudXNlZCcNCj4+ICAtICdfX3BhY2tlZCcN
Cj4+ICAtICdfX3N0ZGNhbGwnDQo+PiAgLSAnX192ZnBfYWxpZ25lZCcNCj4+ICAtICdfX2FsdF9j
YWxsX21heWJlX2luaXRkYXRhJw0KPj4gIC0gJ19fY2FjaGVsaW5lX2FsaWduZWQnDQo+PiAgLSAn
X19yb19hZnRlcl9pbml0Jw0KPj4gIC0gJ2Fsd2F5c19pbmxpbmUnDQo+PiAgLSAnbm9pbmxpbmUn
DQo+PiAgLSAnbm9yZXR1cm4nDQo+PiAgLSAnX193ZWFrJw0KPj4gIC0gJ19faW5saW5lX18nDQo+
PiAgLSAnX19hdHRyaWJ1dGVfY29uc3RfXycNCj4+ICAtICdfX3RyYW5zcGFyZW50X18nDQo+PiAg
LSAnX191c2VkJw0KPj4gIC0gJ19fbXVzdF9jaGVjaycNCj4+ICAtICdfX2twcm9iZXMnDQo+PiAN
Cj4+IC0tLQ0KPj4gQSB2ZWN0b3Igb2Ygc3RyaW5ncyB0aGF0IHNob3VsZCBiZSBpbnRlcnByZXRl
ZCBhcyBhdHRyaWJ1dGVzL3F1YWxpZmllcnMgaW5zdGVhZCBvZiBpZGVudGlmaWVycy4NCj4+IEni
gJl2ZSB0cmllZCB0byBsaXN0IGFsbCB0aGUgYXR0cmlidXRlcyBJ4oCZdmUgZm91bmQuDQo+IA0K
PiBMaWtlIGFib3ZlLCB0aGUgc2lnbmlmaWNhbmNlIG9mIGhhdmluZyB0aGlzIGxpc3QgYW5kIG5l
ZWRpbmcgdG8ga2VlcCBpdA0KPiB1cC10by1kYXRlIGlzIHVuY2xlYXIgdG8gbWUuIEkgZ3Vlc3Mg
dGhlIHNhbWUgYWxzbyBhcHBsaWVzIHRvIGEgZmV3DQo+IGZ1cnRoZXIgc2V0dGluZ3MgZG93biBm
cm9tIGhlcmUuDQoNCkZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIHdlIHNob3VsZCBnaXZlIHRvIHRo
ZSBmb3JtYXR0ZXIgdG9vbCBhbGwgdGhlIGhpbnQgcG9zc2libGUgdG8gbWFrZSBpdCBkbyBhIGdv
b2QNCmpvYiwgZm9yIGV4YW1wbGUgaGVyZSB3ZSBzaG91bGQgbWFpbnRhaW4gYSBsaXN0IG9mIG91
ciBhdHRyaWJ1dGVzIHNvIHRoYXQgY2xhbmctZm9ybWF0IGRvZXNu4oCZdCB0aGluayB0aGUgZnVu
Y3Rpb24NCmJlbG93IGlzIGNhbGxlZCBfX2luaXQgaW5zdGVhZCBvZiBkZXZpY2VfdHJlZV9ub2Rl
X21hdGNoZXMuDQoNCnN0YXRpYyBib29sIF9faW5pdCBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMo
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwgY29uc3QgY2hhciAqbWF0Y2gpDQp7IC4uLiB9DQoN
Cj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAN
Cj4+IFN0YXRlbWVudE1hY3JvczoNCj4+ICAtICdQUk9HUkVTUycNCj4+ICAtICdQUk9HUkVTU19W
Q1BVJw0KPj4gIC0gJ2JpdG9wJw0KPj4gIC0gJ2d1ZXN0X2JpdG9wJw0KPj4gIC0gJ3Rlc3RvcCcN
Cj4+ICAtICdndWVzdF90ZXN0b3AnDQo+PiAgLSAnREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUnDQo+
PiAgLSAnX19ERUZJTkVfWEVOX0dVRVNUX0hBTkRMRScNCj4+ICAtICdfX19ERUZJTkVfWEVOX0dV
RVNUX0hBTkRMRScNCj4+ICAtICdwcmVzbXBfaW5pdGNhbGwnDQo+PiAgLSAnX19pbml0Y2FsbCcN
Cj4+ICAtICdfX2V4aXRjYWxsJw0KPj4gDQo+PiAtLS0NCj4+IEEgdmVjdG9yIG9mIG1hY3JvcyB0
aGF0IHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyBjb21wbGV0ZSBzdGF0ZW1lbnRzLg0KPj4gVHlw
aWNhbCBtYWNyb3MgYXJlIGV4cHJlc3Npb25zLCBhbmQgcmVxdWlyZSBhIHNlbWktY29sb24gdG8g
YmUgYWRkZWQ7IHNvbWV0aW1lcyB0aGlzIGlzIG5vdCB0aGUgY2FzZSwgYW5kIHRoaXMgYWxsb3dz
DQo+PiB0byBtYWtlIGNsYW5nLWZvcm1hdCBhd2FyZSBvZiBzdWNoIGNhc2VzLg0KPj4gDQo+PiBX
aGlsZSBJIHdhcyB3cml0aW5nIHRoaXMsIEnigJl2ZSBmb3VuZCB0aGF0IGZyb20g4oCYREVGSU5F
X1hFTl9HVUVTVF9IQU5ETEXigJkgdW50aWwgdGhlIGVuZCBvZiB0aGUgbGlzdCwgcHJvYmFibHkg
SQ0KPj4gc2hvdWxkbuKAmXQgbGlzdCB0aGVzZSBlbnRyaWVzIGJlY2F1c2UgYWxsIG9mIHRoZW0g
ZW5kIHdpdGggc2VtaS1jb2xvbi4NCj4gDQo+IEFoLCBqdXN0IHdhbnRlZCB0byBhc2suIEkgYWdy
ZWUgdGhhdCB3ZSdkIGJldHRlciBoYXZlIGhlcmUgb25seSBpdGVtcw0KPiB3aGljaCB0cnVseSBy
ZXF1aXJlIGFuIGV4Y2VwdGlvbi4NCg0KWWVzIG15IG1pc3Rha2UsIEnigJlsbCBmaXggdGhlIGxp
c3QuDQoNCj4gDQo+IEphbg0KDQo=

