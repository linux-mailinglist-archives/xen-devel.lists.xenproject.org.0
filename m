Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E805ACABC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 08:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398481.639321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV5ep-0001fR-9k; Mon, 05 Sep 2022 06:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398481.639321; Mon, 05 Sep 2022 06:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV5ep-0001d2-6R; Mon, 05 Sep 2022 06:32:31 +0000
Received: by outflank-mailman (input) for mailman id 398481;
 Mon, 05 Sep 2022 06:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oV5en-0001cw-Bi
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 06:32:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82bf1966-2ce4-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 08:32:27 +0200 (CEST)
Received: from DB8P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::11)
 by VE1PR08MB5678.eurprd08.prod.outlook.com (2603:10a6:800:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 06:32:24 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::11) by DB8P191CA0001.outlook.office365.com
 (2603:10a6:10:130::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 06:32:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 06:32:23 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 05 Sep 2022 06:32:23 +0000
Received: from 69e9e9a9c2c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16300792-A05B-4B43-B43D-0E6C22A8CC15.1; 
 Mon, 05 Sep 2022 06:32:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69e9e9a9c2c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 06:32:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9349.eurprd08.prod.outlook.com (2603:10a6:150:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 06:32:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Mon, 5 Sep 2022
 06:32:10 +0000
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
X-Inumbo-ID: 82bf1966-2ce4-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hnV0HzZ+V2GmnwTG/62f1ZI60zhGh0vSE9Ibc+EaQ/jI3C3/ateem7tvEM0LD3UZQZR0U27rKSpxVwvb2wugHvU7V84BMlA7Om6DyuAklFTvLDvPkjab05mFD3kqBSPsEaNMKd+AXuSrikslDh1DQwXIb8ehlXJZpL/ENdMD3+vH1/WRVrG2JKUhHEDyWYku+aQJ06dxIWBJkwguSgJz+aXc/nCwyA4sS3QP650N+mimgdzZ3Gy8kBybHPGbhk/5ir0fnrDfMdRNBdL4nhlInrqegfev2fITkaV97Sr9wTqI5xi2s4r+eaw8N+a9oXTodAZUz8iI3Nq6bFhcs9KJPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MqpPF/edmWMSORvpVcHoHFZe05iZXukyC3jbWDN62A=;
 b=GYZCHCDlt4sxadQuV/+3QQOEkAzCJWJHrpJOE/iWYoeMud/6wxTU/OErt83YxqMsPGI9Kf6Qpc7TjvsE3n6f/iWIngBIu1rN/v1TY7ztI6AEV5T2DUkcv6EAjl0k5Pf2DGIed+NwLj5rUfAp0ElhU2Oaz2ZcZPl2B1kCNL9FV/2P5HUHtSLPkQ1DI6HdILmurh5lL8yB71ZvXEPaxTi+eaXPKiltDaxCeJxSP0R07yLJ3QyTNICMs2HYCgpKaBBAlCK108Z+vjAWwScyS+aoluM+5LJZJFh1BiKAJ19cBCq5fV7Uos7zwPwAkm3YfVXfc+2gSTKCwr2H52QHNoobIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MqpPF/edmWMSORvpVcHoHFZe05iZXukyC3jbWDN62A=;
 b=zX2k5Qtqlb0fMEGeqq+DbR5KhvLioWZy6OHiGNNektQ+tEuJo0lKNFYqTq16f4bsxNcu4E2xaC0CwYaHbO1a9i+vG9R3qd8g/DLTy715OhXlgMOhs6CJNq2ua1QEXa8b2Y8Ayrjio2CoohvS6e7MC7CgUOMI7K8b0st4Z5KEnJ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijk84FKmZu+Ihs71C3Ge0oTmH1thUnRSVAoASmkFOdAo7KWtN/kiDxp/YjOVKn1/S3dHDiLk30V0SbFLPbCTqsElzYZk8beLhDvYgZLie//6jsvhQVz4erBzxs9kT1MM5FaxHVhNH6LDk/DhWN5X4eVWZxKpHgDW10CMJu91kJ3AYEGb90awoF15ldhEbJw5LSDhOszcq8Pwn2gM35zcldKrgBD+uu5nWKLknXP5XoeshXL+tcxhmJpz9hrzkmSA7efjfq3TM0ukP0bBODR9yBgDE+nVIxj1eb2dUCS2G13lGWtsIqYUeJ3Ugfwb5KKMybPaHj/B7mIoRIRHwGRRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MqpPF/edmWMSORvpVcHoHFZe05iZXukyC3jbWDN62A=;
 b=b6MS1EGCcxVgP/FncijZS6MY6PrubVLTyxiy6MVBolrOPdSG7Nh2J6dQmIhPAX7b2z3l9uIGFDOQVe1eQ2lvPQ0p5QzgdAojYVdve78amnVR4jmvwmMng31dEqoOlZl/5mZpFvj6oczj+GOjdbaL+8IgrXzyiXlEVJZDEBCAO+9efGXTPrzWlHulwBN3Osnw2QdkfAVTz8Xmf8WgGHLmhfYAVVcGu4ot/zNlPWPCZ/mgq/s3+ny8g9q4+688VJtlWoLY8TWQDJxhxtyqzP6PdF5qVWROMU34xaVaYnDQzluUCWOmyTE0rznFiZFgT/GoDEk+2UUizVCzqs/FG9BDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MqpPF/edmWMSORvpVcHoHFZe05iZXukyC3jbWDN62A=;
 b=zX2k5Qtqlb0fMEGeqq+DbR5KhvLioWZy6OHiGNNektQ+tEuJo0lKNFYqTq16f4bsxNcu4E2xaC0CwYaHbO1a9i+vG9R3qd8g/DLTy715OhXlgMOhs6CJNq2ua1QEXa8b2Y8Ayrjio2CoohvS6e7MC7CgUOMI7K8b0st4Z5KEnJ0=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: RE: Xen 4.17 release: Current status before the feature freeze
Thread-Topic: Xen 4.17 release: Current status before the feature freeze
Thread-Index: AdjA2VmJ6EcVoZ5cTOOgVSRHep4cQAAFz7uAAAARPBA=
Date: Mon, 5 Sep 2022 06:32:10 +0000
Message-ID:
 <AS8PR08MB79917A14DE661B2D8E1A6009927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c13fcce8-461a-5ff2-c668-738fa167b385@amd.com>
In-Reply-To: <c13fcce8-461a-5ff2-c668-738fa167b385@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3BA66BA891313547A71F151FD0D52755.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 31b730f1-54ee-41cf-a5fe-08da8f0864b6
x-ms-traffictypediagnostic:
	GV2PR08MB9349:EE_|DBAEUR03FT030:EE_|VE1PR08MB5678:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OPs385BS6uXWmnNq7WWwCw1eAydLmGw8HA0vqbgzc97yi+MxyzK7S7CHbilb4djdeKPDr7d5XlmFGKCUmNUgSHVpEgRX7sRvkaM/HQtPXKdoXguCAB/AeqwG1GXu/oiYNHuczi3OfNvyNuiZMOojbmCFAzWfMjZ9NmcuEOID+iKT5PAIC+mtF2czZCDNYCj8ajSS+IjQDPfbVt65HKo+IKsB5pQDLzVOMmjpaMQw9CT9gS2lffi/F/lnznm3PNTZKNYgpGfnyei87dgOZZE4W88EJT8xEpyBdpZqBkJZcVPQKKhYWscwkE7LQRofSxuYejEAEjotjqsKlxKT6wwVrwZx3vDa46YNNSgg0S2ipFWiafIm/dmaEB3N7TYRbQqwN44vTiGZh5LZqppWENQOyFQs501wymi+h2GEF7dy2qGpcdnjqWkej/JcInImQdZFmdmr0hcAroTjoNaHI37Qo5uHEuhE03T6Y588dRUDzeabrALuLLw1kOEsfsNUbzHxxsDwrFPuD99KhkgQHW8tOMvQVZ3Ms+eJV/Y5Tcyr46sKhI9FYDNRRUB0K1CxGNbkab5FdGHceIhdhbeDMP5tsNrh0O5jVnTzf6eQsm0Xf8XVRWUgi8lC3zXQVAqVm7aRB26kRij86lfGDrmxQKwB1UNyRFJHdSZdWrwnF9ban/cvLqxAttDEt1Q+tb0Bzxi0scz0ZR995W9/Z1Z/jTuZG9y+gzYTjNPcvJus3HqXRCsbxoY1m2xjo6ih/mYez1REVDkS1IxCagqwAydm+yoDK8UM0gkmFvadQ8C2nYpkBLQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(122000001)(66556008)(8676002)(66446008)(66476007)(76116006)(4326008)(66946007)(64756008)(38100700002)(966005)(41300700001)(71200400001)(186003)(26005)(7696005)(9686003)(478600001)(54906003)(6506007)(316002)(83380400001)(2906002)(45080400002)(110136005)(8936002)(52536014)(55016003)(5660300002)(7416002)(33656002)(38070700005)(4744005)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be9a39b6-19e0-4122-d6ae-08da8f085cd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22lHgBDpKPWX4vax3V7aTg7SYhE5PuuVEAZM/F9yb/lRoLg3Az/MpuOqepbrzKaLx2FvIZoEcHcHjW7dvG8jwIV+xxoRBSD4ZUcawKjbeJoqDxMderfwCZwe2GO++eeE0QQRTR15jUfpTIgJ9ob9rNMUtSGSQCWxWRbqVBwBKV4F3k79z4yW4+vi0VR9TAR2B9cuN1hw6Bt4AaOYkq9O2kKsSt+it8km6mU42zhBPnnEuXdCx28BfgPw2om43lQ6ChXV1j9mQK/XSKaOiBubK6LxR58/iASK9T2NDuZe38XIokdMrANspZTbXRIFeVQPDPyueBE6eWQ7XMOMYn7F4Lhe3cPsQS0xtg8ceJ18VlEdqdsn6vs4eO7fiLCI7B/4JqfNj11wKQFotonzOea7vrMkKrY0vUeN7AwzoNeRKplVm3c2YJgtrvJphiiIyZXZ2dApxGWcJB1FpiVdTOGdYAU8qs8ppXKnhus/sUfJi8Ye93g6sOI7Rhtn7RpGB9KoCLcToa4q9aXuN1bi1cbLs9YdLSVh7zSY/G8sKb2UQyPq/3nDqzzdltIWUCIc5GGH/sgCVo1uXltS9gCOKLuxHR4HfIBCLw/ipJX4SjHMAIfnrhRGsizGVheuq8IfxXpyKjXIuSnvYapJmNLKE5z+j5ZcfnUh0ba4vzGBTCZmymjdQM3d5Ag4b1NXUdGKOqHYssVeNwQqRVtfTuLUopwRRy3unfYZveELMJc1FPRYhk60CNA/WtJcizqv/xGLP+MA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39850400004)(36840700001)(46966006)(8676002)(47076005)(70586007)(4326008)(70206006)(478600001)(36860700001)(81166007)(966005)(52536014)(7696005)(6506007)(83380400001)(107886003)(8936002)(4744005)(41300700001)(26005)(9686003)(2906002)(356005)(33656002)(5660300002)(86362001)(45080400002)(82310400005)(82740400003)(40480700001)(316002)(336012)(55016003)(186003)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 06:32:23.8548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b730f1-54ee-41cf-a5fe-08da8f0864b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5678

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4gMi4gYXV0b21hdGlvbjogVGVzdCBh
IHB2IG5ldHdvcmsgaW50ZXJmYWNlIHVuZGVyIGRvbTBsZXNzIGVuaGFuY2VkDQo+ID4NCj4gaHR0
cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGcGF0Yw0KPiBod29yay5rZXJuZWwub3JnJTJGcHJvamVjdCUyRnhlbi0NCj4gZGV2ZWwl
MkZsaXN0JTJGJTNGc2VyaWVzJTNENjY2MTI4JmFtcDtkYXRhPTA1JTdDMDElN0NtaWNoYWwub3J6
ZWwNCj4gJTQwYW1kLmNvbSU3QzNmODNmOGVhM2IxMzQyMTE3NDBhMDhkYThlZjEwYzgyJTdDM2Rk
ODk2MWZlNDg4NGU2DQo+IDA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc5Nzk0NjMxOTc3
Nzk3NTglN0NVbmtub3duJTdDVA0KPiBXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0oNCj4gWFZDSTZNbjAlM0QlN0MzMDAwJTdD
JTdDJTdDJmFtcDtzZGF0YT0yQjRoc1hzMTcwZ3p5RmZJSHVzaHNwNQ0KPiBSdFNSUjBPSGlRMDJv
SllSeGVoOCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+IFN0YXR1czogTmVlZCByZXZpZXdzLg0KPiBU
aGlzIG9uZSBpcyBhbHJlYWR5IGNvbW1pdHRlZCBzbyBubyBmdXJ0aGVyIGFjdGlvbnMgYXJlIG5l
Y2Vzc2FyeS4NCg0KT29wcywgc2hvdWxkIGhhdmUgZHVnIGEgbGl0dGxlIGJpdCBkZWVwZXIgaW4g
dGhlIGxvZyA6UCBzb3JyeSBmb3IgdGhhdC4uLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K

