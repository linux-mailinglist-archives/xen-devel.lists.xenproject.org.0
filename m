Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06279603A18
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425503.673363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2uR-0003Lu-9y; Wed, 19 Oct 2022 06:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425503.673363; Wed, 19 Oct 2022 06:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2uR-0003Iy-6K; Wed, 19 Oct 2022 06:50:35 +0000
Received: by outflank-mailman (input) for mailman id 425503;
 Wed, 19 Oct 2022 06:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2xL=2U=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ol2uP-0003Is-FG
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:50:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 527767d6-4f7a-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 08:50:31 +0200 (CEST)
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by GV1PR08MB8665.eurprd08.prod.outlook.com (2603:10a6:150:82::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 06:50:24 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::c2) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 06:50:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 19 Oct 2022 06:50:23 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 19 Oct 2022 06:50:23 +0000
Received: from 8f385ddfac47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A826DB7-3955-41BC-9012-573A9422BBDE.1; 
 Wed, 19 Oct 2022 06:50:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f385ddfac47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 06:50:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 06:50:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 06:50:10 +0000
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
X-Inumbo-ID: 527767d6-4f7a-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RNMVXRL9vHrSm//K9mOvLIqdvWBI7VeXU4oVGazG05uc5I+Hg5CHUj5fkyk6QGsEZ7xTZD7xGx6tM7ZLUp3nLDf2j+rePwZsUlEAQ+8tLEyrTY9Nd6RAMxHKHMryOgRgztQvk48ptQCJELPvL3pT7xHhxGz1V4gMYqrY80Eh8wq1gvZebHoP9W7EzKb0Lu2NhATJ5llNXHIBXk00uXUgJC34f3NLBePeQVJ7eUFbqc5wcjWH8V4qugZzshTg8aF8pRvA6+ipAapUncByRldIaeP1cPwey/qkxot8uapw15phgv9jQW5qD4xe+H6Pp8PpOpMKxFgIDlaKniSzqVR9Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaaLxsF1qs+9uUuDbYX1U0wpk4yRP1W7MFE3egtqdU8=;
 b=HTRS2hJIhe0HReacJtdBBUQBUyFn2jn+MXh2WKzhqsWOs3TmQzzZthf8X912P3rOkTHcmKOslTlIKWJZlxayc5vHCwoLrFt0RnRzZ5a4S2FsDahocHLPTnWenPKe58Rl6OaQH6ufKRcNzz8ro506l7T8f/8mOZMJL/JFdzv26jpep/pTcYhqX7/QDbXBlfYVhyfuR5D36TPy0ECJ0YVlO3tsui/jk86k94+56DEq/EExowhvmMNL+re3pdg0fBt8AskANNF9HD6yx6tRJZRCCVYCyDrodZx2PRhEGV4klZu/BFdqjVvdujpYtvXVpCloDguiy9/vMIfsBWIfUdpLyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaaLxsF1qs+9uUuDbYX1U0wpk4yRP1W7MFE3egtqdU8=;
 b=nRPqlN9T+ie0fiXUqk2zryCPJLTkdbFThlVbSBMgsvWHXCwtUqJkHk2LNL1Q+1Qu8SA45L0wDSn4KDTsRZLT6/2Xn9ugMP9WWbVxeg6tMvU+32ZT1nExQmk/0uzISj0TKxFikuYjOGXkBjMIWEYvZjjnlJsr8vll5yyA8JKdoW0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1FKIWIQj28l4r/OxXd9CbVdqZTv1CZEHb6kl5OWMX3yPxU1gY7pgwc9rZyvLp+i1z3sG05PzNVn+VPsl6sPw5CVUJV+XYQ2ZZw2dO7rZZRyJloyRJDy3HhAgCkCfBztQ68hCnwVOxe3BpSmQqV4lUIxke4x0xC9DyWC/kalVdJlAMEFqwSS5jG/JgGmxkYg9+roxDyxOBB9gK3U/Qs/4mr1T1GBHK0Y5J+Xkx0qI+LyTaZw3BVnWNSYDIXg4NbyUUUm679JYx+mOsZBL4IuU+T1+w5t0FPUiWFwPoBfuos0tZjIw2Y9ZS6zTn9B+L8pp0ztjUfK+ecnT6tw+aHB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaaLxsF1qs+9uUuDbYX1U0wpk4yRP1W7MFE3egtqdU8=;
 b=YPl9xLF+8Lm94d+lCJhHqbeP+0RN5ULGHG8kHkFvfiX5blI7ZbXnUXjHRs1Oh8AFQAarVrjiTkZqoMasLVVSimwg9XZdzmjdCme6LH2fJVtUpayDFO303IB4ugbN6nVrcBKbriJ1Zr2mCdWkstgFiqQnXz0f52MN7xlUy28iiMBe5NR++b53Ew0wd4FRwP0XwlEVu1F+2r16N0+dOFLs8XwkdHXbaAeCgmkuLdCOEmo9lnnUoim0/ULVT8KwUPJXQeTd1/ST9rnKHwl62tg43lvZB41Oy8ZiTCo2HdHczcHF8EzuH60Sjb9NNCSpsH+BdtlM9Ygv42j6KwoGxDXPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaaLxsF1qs+9uUuDbYX1U0wpk4yRP1W7MFE3egtqdU8=;
 b=nRPqlN9T+ie0fiXUqk2zryCPJLTkdbFThlVbSBMgsvWHXCwtUqJkHk2LNL1Q+1Qu8SA45L0wDSn4KDTsRZLT6/2Xn9ugMP9WWbVxeg6tMvU+32ZT1nExQmk/0uzISj0TKxFikuYjOGXkBjMIWEYvZjjnlJsr8vll5yyA8JKdoW0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHY3WMp8fkwGFUvPUGj/zptqNRTAq4UNRwAgAEdejA=
Date: Wed, 19 Oct 2022 06:50:10 +0000
Message-ID:
 <AS8PR08MB79911F3700C0619BA1DA34DE922B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
In-Reply-To: <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6053327C5EEA664ABA80973D1CDA52DF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5486:EE_|AM7EUR03FT022:EE_|GV1PR08MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db3890c-f382-46a2-cf68-08dab19e32b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jsesN+1ZECD441XflQei3NIZKT+t3MXCKAG39+S043lE52BMZssklu3Wm24szt5rgeNMQUvdGKrRKX6uPNPX80eua5sNQR4H/h/Cqb0iTdbjhp6jan3mog4HYLNgjUGdLMLyZJQigOnckJo2sFTwJsaCg80fAW+xhji1WHfjMRwAV3lKyfkxFmK2D54i1xoltdYorTA+EYbNxBqLlbuXxR+k1SnU8FQysS4X0Ukrpy84+sWlZ0ndKJ/XHdYuSel3MuTtZMJI1W/9DQm1OUaadl6Q3Hni/h55Ql+qYvs7eJUHvGOmiV3p8X/l5Gu1At4qau+WXHS1PtonAzOvLZ1ZyrYbFcF1IVOMKgvynsgRKOSugNzY0iBqSQawVFVSXhfKkC0eqD7i2IyITfAwxBeLi3oMTrtYe2XvEuINn4vv+HB9Y2mDQpAex6hBtHU/0ejZQ7yWLk/voJTmGgNZkJuDC8ZMd2cK+dIGqgCKJdi0gyfi336/K6xoTLd1pF28KlOGQwOiYLS5AT8y5SL5ReLncGYpy/WOINtQKkZvKcyErr55G9nxdLUNt0ZbvHmBy/TTsSr6SzluksNzvCxbPP5+gGe5+WArWDl5RH0pGVNNUQcPlvJ8WGHufGFOV767VA/XPnOVvxiPRpeaA4g7PU0sJKBaiZAxbIekMoOuUvAvdwN9w+L6IPArgvmHixfaq3dFSsfa0rzGB76tbMjy4FpncjJQt1pnBp3vWHKHBphenMNtWH0Qg1QWroaC5UWnVtsS98FfjUEDuFW5kj6qXyg/AQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(9686003)(186003)(26005)(7696005)(6506007)(53546011)(83380400001)(2906002)(5660300002)(55016003)(316002)(110136005)(4326008)(54906003)(41300700001)(71200400001)(6636002)(478600001)(52536014)(8936002)(8676002)(66556008)(76116006)(64756008)(66446008)(66476007)(66946007)(33656002)(86362001)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5486
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e67383a6-0c3f-46b9-8d25-08dab19e2add
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	21FR3fA0CcjX4OLmjKEPnx6zI+jtTGUGIKENeDLr2cws5mrAEuV1V8GLBLuUU5la2SxzhVKSs77ZGl8teHAfvE8iq5aDl5iWQNDKxcRDsrfdIxUVJjnWECVXW/JnJGBktM6zSr5gFcEXA5JyT2S6DA3n2hJfxZj71zBzQvyR6L5yYrHjsxR0rRVZsQVUBI/jnxkNeQlU0/gI1yf9ZwSmjXW+6df06+SP0o0bxOfI+A5SbTAY748SFd6+RTVYLpsI2i3klLx1FHvN2ZMn8nWCTX57P9GEZvf0nsLHT9k0ig09HNeJ7041Ov9yHbcoyTH4GV99IFumagtSbEy8X04+F47LSLicondv6Jjh0B0KaaaJa5zRH2HznzS5VDPsnatgKxIJrwLzkuD1CdUnojn6lzweD53HmKPJtsoTqKQ+nJLUd7AL30MWIhGlYDC5i2k7U9UfzYivSIpDqMxNJnlcFmr94x7u66K6p2L2c3ODa8XHr2XkdLGEje0mHlN3XWljinwnedBiga2GiMSahL1yDAFln7G2OkdHQejhdBzYum0en168xYNNxNZ7U7vOSPmPGyQaq7xVbyu5B1wuP1XjNzB9OrMNP97RxcI8I+BRS38CUpKxqGYaSNtOwu7js2Sg+UMfbIqSNvpEM8XviH3s+OkNbVK0EK34+eg679h/QW19X5HcGY9zYeHAZA0A8cS1S74oaKaCBYIwSVkKmqizuxWz2n6j3jDWgOUmVzn+RDZX6wjeKOn7ZQgscXCjyn3ADbr1BmsUltE2wMEW8adZbA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(86362001)(33656002)(82740400003)(356005)(81166007)(186003)(336012)(2906002)(40460700003)(5660300002)(40480700001)(55016003)(26005)(47076005)(9686003)(7696005)(6506007)(36860700001)(53546011)(83380400001)(316002)(478600001)(70206006)(110136005)(54906003)(41300700001)(82310400005)(4326008)(8676002)(6636002)(70586007)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:50:23.9643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db3890c-f382-46a2-cf68-08dab19e32b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8665

SGkgSmFuIGFuZCBXZWksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAyLzZdIHhlbi94ODY6IG1vdmUgZ2VuZXJpY2FsbHkgdXNhYmxlIE5V
TUEgY29kZQ0KPiBmcm9tIHg4NiB0byBjb21tb24NCj4gDQo+IE9uIDExLjEwLjIwMjIgMTM6MTcs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IHY1IC0+IHY2Og0KPiA+ICAxLiBSZXBsYWNlIG51bWFfc2Nh
bl9ub2RlIHRvIG51bWFfcHJvY2Vzc19ub2RlcyBpbiBjb21taXQgbG9nLg0KPiA+ICAyLiBMaW1p
dCB0aGUgc2NvcGUgb2YgcGFnZV9udW1fbm9kZSwgdm51bWEgYW5kIHBhZ2Ugb2YgbnVtYV9zZXR1
cA0KPiA+ICAgICBmdW5jdGlvbi4NCj4gPiAgMy4gVXNlIG1lbXNldCB0byBpbml0IHBhZ2VfbnVt
X25vZGUgaW5zdGVhZCBvZiBmb3JfZWFjaF9vbmxpbmVfbm9kZS4NCj4gPiAgNC4gVXNlICV1IGlu
c3RlYWQgb2YgJWQgZm9yIG5vZGVpZF90IGFuZCBqIGluIG51bWFfc2V0dXAgcHJpbnQNCj4gPiAg
ICAgbWVzc2FnZXMuDQo+IA0KPiBUaGUgb25seSBpbnN0YW5jZXMgb2Ygbm9kZWlkX3QgdHlwZWQg
dmFyaWFibGUgdXNlcyB0aGF0IEkgd2FzIGFibGUgdG8NCj4gZmluZCBhcmUgaW4gZHVtcF9udW1h
KCkuIEkgZ3Vlc3MgeW91IGNhbiBsZWF2ZSB0aGVtIHRoYXQgd2F5LCBidXQNCj4gc3RyaWN0bHkg
c3BlYWtpbmcgJXUgaXNuJ3QgY29ycmVjdCB0byB1c2UgZm9yIG5vZGVpZF90IChhcyBpdCBwcm9t
b3Rlcw0KPiB0byBpbnQsIG5vdCB0byB1bnNpZ25lZCBpbnQpLg0KDQpTb3JyeSBmb3Igc3VkZGVu
bHkganVtcGluZyBpbnRvIHRoZSBkaXNjdXNzaW9uLiBGaXJzdGx5IHRoYW5rcyBKYW4gZm9yDQp0
aGUgcmV2aWV3IDopKQ0KDQpJIGFtIGEgbGl0dGxlIGJpdCBjb25mdXNlZCBoZXJlLCBub2RlaWRf
dCBpcyBkZWZpbmVkIGFzOg0KdHlwZWRlZiB1OCBub2RlaWRfdDsNCg0Kc28gSSB0aGluayBoZXJl
ICV1IHNob3VsZCBiZSBwcm9iYWJseSBmaW5lIChJIG1heSBoYXZlIG1pc3NlZA0Kc29tZXRoaW5n
IHRob3VnaCk/DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

