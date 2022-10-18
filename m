Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D0602C35
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 14:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424995.672715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okm7J-0001iY-3G; Tue, 18 Oct 2022 12:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424995.672715; Tue, 18 Oct 2022 12:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okm7J-0001fj-0S; Tue, 18 Oct 2022 12:54:45 +0000
Received: by outflank-mailman (input) for mailman id 424995;
 Tue, 18 Oct 2022 12:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Ts=2T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okm7G-0001fd-PH
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 12:54:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07cb2092-4ee4-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 14:54:41 +0200 (CEST)
Received: from AS9P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::9)
 by AS2PR08MB9497.eurprd08.prod.outlook.com (2603:10a6:20b:60f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 12:54:33 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::f9) by AS9P250CA0003.outlook.office365.com
 (2603:10a6:20b:532::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Tue, 18 Oct 2022 12:54:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 18 Oct 2022 12:54:33 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 18 Oct 2022 12:54:32 +0000
Received: from c1c0513f0fe9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7CC28BC-7E93-469D-9889-11CF627D939E.1; 
 Tue, 18 Oct 2022 12:54:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1c0513f0fe9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 12:54:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7838.eurprd08.prod.outlook.com (2603:10a6:20b:529::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 12:54:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:54:18 +0000
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
X-Inumbo-ID: 07cb2092-4ee4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GfACyHzofszpH7E990Q+doPO9sAXPAKDqMhl0YqIrQTjmPmaiGrghl0wF4U8iHYJqVWoQ/DuEREAaX/h43GEF2s7jWCUnA0MP/MG+tOP622xPvJIiA50EePjZMer8l0IGexRpqxjyQkLW2902PaMLERi3YTDgM/Qw3v7uPPPf5pnDfBrneBc1S6zh1hAJw6ePXue7OfwnZ9fQJqYJS9jjXRXCwNU/i1nB5jCJnlhyPoyk90B8eXZoc30POjRkiEd2zrpxLFVtEo9Rkto0a68LB/tIcQLGJCjQxbJ8khoyw9DvHEPi5LlQdt1KTtrS/SxZceiXGK5dGRuB7ZGz2biqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZVPCmAawhP/ivgOYB1lMAEBPcBuPLOnQXrB6xC0yQ8=;
 b=jgfjR0WSFZyumVYwZ/Sy0tYR3eIP33aNcxPSRy6fLWCkTQiiZXlcf7Gb80N3dFnWE0LP+GbrgzGxNaODUjm6sNaAJ1r/+aZlbNCz01zXvZ5Bn9shiwYj5PMoEGAipClXTgw/OGctVGMRpF8lE1dIFY/2ZaAM0U9h1ecfKCihiflJEwjDQeFi+/YIvGVz4n3Fm/YtHPg3P4XjoOp5OQsnfgyGuwucIBKAFZXy4Sec2Ps4u6l+JbLL6MLChBYHf4SzGF49ieRElWgR+7nx6gy6YGGllO2HonNHuM7XbPUNcxgWYL8DSgsxa36ijWhajG5zubxoZR5+sxot8SUkw0O1/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZVPCmAawhP/ivgOYB1lMAEBPcBuPLOnQXrB6xC0yQ8=;
 b=zXHLab2OD1G7gWVKhhwxQvRZzvc19n/JUApRS1eDxHruuSlp5QOGgwhKUAOHPc+1359AcuxmRHGW7Qgi0ymTHri+DJyqOEeiPFV6lT84j8OQw4T8ZLzU9chM1xUe5ptHzmI11bBYpId91vkHV5CkEhr7Q+ctdvVuZbeAIPa4xs4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDZjNQcS29hiyts6Tqe/Bamwkaj0F5tUTg+knrMSjsyIavzNiecQk5ts41kjQL8YfMsyeCb9FLw1qoGQYu5qV8jajXa42uq3ESgsxlcvQtL+NRapMwDV2Qdj/5QPWedh9xJAZUKZxgNHKvfHWTNisScW1KbI5sxRLohmIEXvxB34idYFDhWEK+V4pRjjyHz3FSWx1O7TXTV/js/gvpXSXEcRIwojNAPXJzBIJfmq6JX0pNAyOB4wPWMgbVfQkZ1URiiV+FCgBYJTEHEuR0ta5ogYPyKuKLIPephdrg0f/0AAQiiPIlyVhc7hYkWuZMgCmyz8/jIPFR/Ls9i5V6+hgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZVPCmAawhP/ivgOYB1lMAEBPcBuPLOnQXrB6xC0yQ8=;
 b=QrEnVWiAxPA3+n9OJvzlCSoC4ioQIFQ90aoMJAdHRYYZY6jQD+Q2yqXB/9EmQkCt8bLzdYU3PZmgWXjz5ThhkrPtA2iLffAbU67Uvk3qHbfn8Rw2rVwjOFRF//PRAwnjYGueHn6EXpcGleHbWdDo5rcVZ2IhKbPPRiEBySv8AgvxZXwg6qZvP7Fhrcn/8dpx/BbUJFZWpzNfOq1VDrh314yeH/8PMwAGhJyPYb6XESPv5JCRjqwwuRKBb9X8630dAtDcDiByhO9lFPAdlNABwpGKDb18GEFBGrFFfY8XqIVKmtjP1FnBUpXz4s/GFjd/ja8oe98yM6jIzg1iriqDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZVPCmAawhP/ivgOYB1lMAEBPcBuPLOnQXrB6xC0yQ8=;
 b=zXHLab2OD1G7gWVKhhwxQvRZzvc19n/JUApRS1eDxHruuSlp5QOGgwhKUAOHPc+1359AcuxmRHGW7Qgi0ymTHri+DJyqOEeiPFV6lT84j8OQw4T8ZLzU9chM1xUe5ptHzmI11bBYpId91vkHV5CkEhr7Q+ctdvVuZbeAIPa4xs4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4kjE8chHQ2hgBESCJmpSFAnjhK4UGfkAgAAAnDA=
Date: Tue, 18 Oct 2022 12:54:18 +0000
Message-ID:
 <AS8PR08MB7991C654A0DE223131D6635D92289@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221017165133.17066-1-Henry.Wang@arm.com>
 <9da32b0b-7e3c-ad38-01c6-9ae78bf92702@xen.org>
In-Reply-To: <9da32b0b-7e3c-ad38-01c6-9ae78bf92702@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 607CD119499FA74BA3053861FD7048D2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7838:EE_|AM7EUR03FT024:EE_|AS2PR08MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f68226c-460a-43e5-4f03-08dab107e76b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2rtgllXRreyDz3acFMiz3orwvc7MQgnL8HnOdRWWtc57uHQqLRCyUULPyPnqwf5EvqOOftFbl5L4QD8EWYzF2rHM4tAUEPYlp2mo278lb2P+1Sj9ZnF/7JFGmv7UHtys0bd1p3Mp7JVQP9I1hcMcae5/fLcLmSA1+kzpOSSYX6XLYl2WSKUzXjgv2b3qTigmQnE07tNeG2XtD4ViPc9LFO/Pr+6TTEz6smW4YjEYkDYksUodGX4nb6PaiqjRBAgb2ofsmP1AZibfD8CGTBSmutHIDIZ4rTw+HyF7A847goPrlLSJE4CMTC2MBIIgkUz8uOlKvcr7FZ1jOnbpos+72GIkdGTWK+xPbdjTJ96FCy+mAubuiGjN0anmBQSGhQz5INIbCymou61k/vXFJ5upqNkXZX3PzmPLC714TQpKbA1S9JfhuGcB06c89HMF+QWvL6QRg0SPh/pu6p4xiIQ6S6IGobJNt9l/hd3fyxPRfBINBB25+QAgQgrTUskomRDxCX8h+/YSRA+6PCOqCENEkqadWLTUSWggsyxhY3bdranv6E/z8lXs1UfdhimOZWpeeUEk0ofWvx508TTgyb+8Rrr95FvFRvpCwIyapG9ngvfb7HuUdkCp8o07ro9AykzNBD2egFpwJSWsdmQG+YPNzebwCOg0aZlWl4ddiEzF4n7i/nJDwduVVdb80AS5esMTKmc5UvxNOGlmN7ofzuYoZ9MyktsO+BCEosL++IcW6TU94nO/4y4EtZlEASxV9C4HIaLwurWrRz7vCq1k2NDASQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(71200400001)(54906003)(186003)(38070700005)(83380400001)(38100700002)(86362001)(5660300002)(122000001)(2906002)(7696005)(55016003)(8676002)(64756008)(52536014)(41300700001)(4326008)(9686003)(478600001)(8936002)(6506007)(316002)(66556008)(66446008)(76116006)(110136005)(66476007)(66946007)(26005)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7838
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd6334b7-c0fd-45a0-29bf-08dab107deb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	coplwlqysIKOMhjFXVe3lwKDsAuVOfzQ86RnO1vgxql7bZgsNy8Hi16FNeRijfcFMm2Ar15avgixDlDTNRWK0o3mKRx06Z059c6eypLdOmllw/+e9Y/WJgeemqS4OD6oNCDqmtB3B3zP4fcnTweqV86nceUcQDAazsqqLZ1W/64c4nSHQ7njaVxpn4rE3ShuL/mbmdwsDKsdLHMqNS7J5Qh55qP7bHwjtf+0TVGBxNOnNdxJQ/yD+Oz2aEYW0bIStI5GbHVLKJtQLZdm9kPXGGKg3T3UlRw/x2zj87DCDXTrlBwxl2Sg8Jq6Yq5LAdaDm6qVJptfvO0ylmSDe67bP+0Vi97MRwSg0W/b35O9Tm2zEoy+8MfJ59GPtDndCyn2RdUm6Q3ScLWO1bRzz1/sI/jVUGjx6o4wW+PP79Hte3QDSdy2bs8oXp0n/F0K7owATOReSBpENXDrn5hqWwWmFkiGm0lGmdjzvM9J2PS7epcl8SzhqqPMwZ4KtreaI917NNwz+t9eX2QHg2IzVVqTByS+LfoaI/0XpdvNtl5Hv7kmvp5LlD01z9tq7MnMwUe3RUmHgHGcxgy4rGyRrB/M255beoq56hYJP/0ps734ad+9YTJCEBZIVpIjDbiy/ZJB6jWpMatdvisMthXgrQaSjr4jwahTTs40QB32PlDW6HF7vn8zTKwjeAPRVfhUseqeS9sxDmrfewrrMEQImpwIFl4ck0ceFRPbM+6ZSeBsdh99ZxW+MmO84irZEvfaLJ9VkD0fQIUTs1dkz/og+uYfFA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(33656002)(86362001)(356005)(81166007)(82740400003)(186003)(6506007)(55016003)(40460700003)(2906002)(5660300002)(40480700001)(36860700001)(107886003)(7696005)(9686003)(478600001)(83380400001)(26005)(336012)(47076005)(4326008)(316002)(110136005)(54906003)(8936002)(82310400005)(70586007)(41300700001)(8676002)(52536014)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:54:33.1334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f68226c-460a-43e5-4f03-08dab107e76b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9497

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjRdIHhlbi9h
cm06IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9kb21h
aW5fY3JlYXRlKCkNCj4gPiAgICAgICBpZiAoIHAybS0+cm9vdCApDQo+ID4gQEAgLTE3ODQsNiAr
MTgwMCw4IEBAIGludCBwMm1faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiANCj4gQXMgQW5kcmV3
IHBvaW50ZWQgb3V0IHRoZSBjaGFuZ2UgaW4gcDJtX2luaXQoKSB3aWxsIGVuZCB1cCBsZWFraW5n
DQo+IGVpdGhlciB0aGUgVk1JRCBvciB0aGUgcm9vdCB0YWJsZS4NCj4gDQo+IEFuZHJldydzIHBh
dGNoICMxIFsxXSBzaG91bGQgaGVscCB0byBzb2x2ZSB0aGUgcHJvYmxlbS4gU28gSSB3b3VsZA0K
PiBzdWdnZXN0IHRvIHJlYmFzZSBvbiB0b3Agb2YgaXQuDQoNCk9mIGNvdXJzZS4gSSBhcHByZWNp
YXRlIEFuZHJldyB2ZXJ5IG11Y2ggZm9yIGZpbmRpbmcgdGhlIGlzc3VlLiBUbw0KcHJvcGVybHkg
c29sdmUgdGhlIHByb2JsZW0gYW5kIHJlZHVjZSB0aGUgYW1vdW50IG9mIHdvcmsgZnJvbQ0KbWFp
bnRhaW5lcnMsIEkgd2lsbCB0cnkgdG8gcmVzcGluIHRoZSBwYXRjaCBzZXJpZXMgKHdpdGggIzEg
ZnJvbSBBbmRyZXcNCmFuZCAjMiBmcm9tIG15IHJlYmFzZWQgcGF0Y2ggd2l0aCBjb21taXQgbWVz
c2FnZSBwcm9wZXJseSBhZGFwdGVkKS4NClNvIHRoYXQgZWl0aGVyIHdlIGRlY2lkZWQgdG8gcGlj
ayBBbmRyZXcncyB3aG9sZSBzZXJpZXMgb3IgQW5kcmV3J3MgIzENCnBsdXMgbXkgIzIsIHdlIGNh
biBmZXRjaCB0aGUgc2VyaWVzIGRpcmVjdGx5IGZyb20gTUwuDQoNClsuLi5dDQoNCj4gDQo+IE90
aGVyIHRoYW4gdGhhdCwgdGhlIGxvZ2ljIGxvb2tzIGdvb2QgdG8gbWUuIFRoaXMgaXMgZXZlbiBr
bm93bmluZyB0aGF0DQo+IEFuZHJldyBzYWlkIHRoZSBjb2RlIGlzIGJ1Z2d5LiBJIHNwZW50IHNv
bWUgdGltZSBzdGFycmluZyBhdCB0aGUgY29kZQ0KDQpUaGFua3MgZm9yIHlvdXIgdGltZSA6KQ0K
DQo+IGFuZCBjYW4ndCBmaWd1cmUgb3V0IHdoZXJlIHRoZSBpc3N1ZSBsaWVzIGJlY2F1c2UgcDJt
X3RlYXJkb3duKCkgd2lsbCBkbw0KPiBub3RoaW5nIHdoZW4gdGhlIGxpc3QgaXMgZW1wdHkuIElm
IGl0IGlzIG5vdCBlbXB0eSwgdGhlbiBpdCBpcw0KPiBndWFyYW50ZWVkIHRoYXQgdGhlIFZNSUQg
YW5kIHJvb3QgdGFibGUgaXMgYWxsb2NhdGVkLiBTbyB0aGUgY29kZSBsb29rcw0KPiBmdW5jdGlv
bmFsIGJ1dCBqdXN0IG5vdCBlZmZpY2llbnQuDQo+IA0KPiBXZSBhbHJlYWR5IGRpc2N1c3NlZCB0
aGUgbGF0dGVyIHBvaW50IGVhcmxpZXIgaW4gdGhlIHJldmlldyBhbmQgYWdyZWVkDQo+IHRvIGxv
b2sgYXQgaW1wcm92ZSBpdCBwb3N0IDQuMTcuDQo+IA0KPiBGb3IgdGhlIGZvcm1lciwgSSBhbSBo
YXBweSB0byBiZSBwcm92ZW4gd3JvbmcuIEJ1dCB0aGlzIGlzIGdvaW5nIHRvDQo+IHJlcXVpcmUg
bW9yZSBzdWJzdGFudGlhbCBleHBsYW5hdGlvbnMuDQoNCi4uLmhhdmluZyBzYWlkIHRoYXQsIGRl
ZmluaXRlbHkgbm8gcHJvYmxlbSBmb3IgbWUgdG8gd2FpdCBmb3IgYSBiaXQgZm9yDQp0aGUgZGlz
Y3Vzc2lvbiBjb250aW51ZXMuIFdlIGNhbiBwaWNrIHRoZSBtb3N0IHN1aXRhYmxlIHNlcmllcyB3
aGVuIHdlDQpyZWFjaCB0byB0aGUgY29uY2x1c2lvbi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkN
Cg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

