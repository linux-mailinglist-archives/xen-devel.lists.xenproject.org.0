Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AA5FFA30
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 15:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423464.670122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojh0H-00067k-Og; Sat, 15 Oct 2022 13:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423464.670122; Sat, 15 Oct 2022 13:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojh0H-00064e-LT; Sat, 15 Oct 2022 13:15:01 +0000
Received: by outflank-mailman (input) for mailman id 423464;
 Sat, 15 Oct 2022 13:14:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DPIc=2Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojh0F-00064Y-Gh
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 13:14:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d2b37bb-4c8b-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 15:14:57 +0200 (CEST)
Received: from AS8PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:20b:311::28)
 by DB9PR08MB9442.eurprd08.prod.outlook.com (2603:10a6:10:458::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sat, 15 Oct
 2022 13:14:54 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::d0) by AS8PR05CA0023.outlook.office365.com
 (2603:10a6:20b:311::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Sat, 15 Oct 2022 13:14:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Sat, 15 Oct 2022 13:14:53 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Sat, 15 Oct 2022 13:14:53 +0000
Received: from b69eba9a8df3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AEF203E-23CA-4D7A-820C-F50D99C3DD48.1; 
 Sat, 15 Oct 2022 13:14:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b69eba9a8df3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 15 Oct 2022 13:14:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9879.eurprd08.prod.outlook.com (2603:10a6:150:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sat, 15 Oct
 2022 13:14:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.029; Sat, 15 Oct 2022
 13:14:44 +0000
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
X-Inumbo-ID: 5d2b37bb-4c8b-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BzyDuTdNRoSHLffTEzqb6KVzzHvngJwjj2JMBENGN79ENuVG+ejhHI8Oh0kQzbzQ8agZqh+eJMNrZtumpRZRMmmvAeuGS83AXfK822jF1RWSiC8CbOh5NwuZBOi8eBe66lShIeXymacjQhHlZo37cRm1ESn2Qymd6hyvI9QpsQtO20SA9s/Mr2Jhw8YiImM0HEDZWiNpk7KdvVMvqgf10/ftxgoEgn8IxhkqB3LTycuwwCvFxjFblACf6AJymRfCSVWx0wA8To4SgBqRWQOXpW0CYxsEGBVSYoxDYZnzN/Kuyd3E24WrcDBFoS9akERW7vWaK3MijU3mGRxU3+Gm+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7XP1jibOmnC8B6gmAGNYfyQ+uFUyvyw7XPGM2uHVS8=;
 b=Qap7oucwy//SlzzjdVKFUU1V6OdlUZpqeMy7HSsd1b2tDBGOujSkk7J8obSs2o/rc/T0k0mIrsoakk0uxLTigyyHCuhm+wiqstXm8PMGrujm5Ue5HASGt/kkHgGgHz7+4y0cvkUXl2pskdcr5ADCLrGHKX1xDnX4ooQkkhkyRh7rEw72J8czev7X1mJMShu4n+kbPJfaM++fTMt8JoLnKSDs/Y6KthQUHeM8CLTC+3p5l/jYABdS8x+Ytdx85oTdbkm5/PpvJlDJMUwgcDG1ur9JqHhWwg8IUKuMUbmrKUaH5eEcIllmzQzUKqsBzid8zgeM7OtnEa1lDnXLwSM5qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7XP1jibOmnC8B6gmAGNYfyQ+uFUyvyw7XPGM2uHVS8=;
 b=R8iLK1P3nse9kr7a1FSJp5wGA7C323XRB39VrADWyR2qFgZ0ozW7DeulZVdDkyNmanZ7LmszRIvroPD4tarl7R5tiw770bZbdqgVRJ84eBEsFfcxJEfj9eZFyO7btQwndSpsGyIE0afn/ijgQ68JCR/NrV5ZmGFYgetpgseKj0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt6suVxt8G5cbDOE3qXshTkDuk6mZCfM+uokwC9WA57K0Z0cCiUmWRLJsCRvV/4n8hlTRiTCXaTRAewTfHYrSBzrkErd7Tyj19vukQOHTlNt7uIuoMpdPqwawYKEsPuq82JlQ8jOHSGHQd8DbrQpnXdL7m3IWG4QBwVbNJGiUbtSb0/x4DC1keyZnbf1O2uvKpN8EMW6SiP2m6PbDfsRcNVxesZgUODbKcomY6R3/cl8CiB+CMyi48bsfI8NEcEtCbZF+7xr3oz+rqghYlTIDuxa2SmkCiyQooPT1P4BihGJOGtgzZdulU5i2qmuunaeBPOwNq8SA0oGw4GESo7Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7XP1jibOmnC8B6gmAGNYfyQ+uFUyvyw7XPGM2uHVS8=;
 b=gSsD52Xm1ZJ8FBVtybV7pebVfJoIHsiw68U7Hmc4Qo34XVzS25Zr0y1Qn7ELueb7PuprMHmXINQT6cadRqYvWQz3VJN3TXCm2GQjnVDpCFrKbNmqWgeBQ1A3MnsMlb0I9jgD6wgidAjTDNYRJn/Fg+JJOS0dV9T5ODtxiTtA+9ijtn9SPlYpA6CSs/KQPVg/5mqT1ksRC9AYvc/j1HSTnWBP8atnOM8JyrAprBZph7wGxOL+U+MVqeigGUkFVYcDJMicVJ/vaTPblx+l2H4LqkRoBRq2FuhBk1h/ZTW4VKYXJ9OlAHFgIUGaoYrhJra1fcpRpnGmvHezfDoIR8lFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7XP1jibOmnC8B6gmAGNYfyQ+uFUyvyw7XPGM2uHVS8=;
 b=R8iLK1P3nse9kr7a1FSJp5wGA7C323XRB39VrADWyR2qFgZ0ozW7DeulZVdDkyNmanZ7LmszRIvroPD4tarl7R5tiw770bZbdqgVRJ84eBEsFfcxJEfj9eZFyO7btQwndSpsGyIE0afn/ijgQ68JCR/NrV5ZmGFYgetpgseKj0g=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY36RSrOIThkYtnEq9RrtWc+uYX64NsO2AgAACdYCAAZeJAIAAAyvQ
Date: Sat, 15 Oct 2022 13:14:44 +0000
Message-ID:
 <AS8PR08MB7991976335ACE7B47A3FCB9792279@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
In-Reply-To: <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 47B477FFB382264FAA6A03814C453EDB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9879:EE_|AM7EUR03FT039:EE_|DB9PR08MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 6018f37b-c20b-4da4-9e5e-08daaeaf3f8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a+piy5ieQNSX7+/lzhBWGCzMD1NQ3Q1NCrxnmtAgG0JvGGCyRW+VZ4quppKw6tuLThJEzVvFe4dbIIKa+0MnFdGHtOiWLMd1CE1Cn5X9Txs4wV5V9K1NqV8itUnW1EQyfR6+XKCkinLvPzfUV/MLM0BebToyYb/1YY2Zs+muP+B7A+AphEtKaGXDMe4UvLxo1zs9Cd3KtemGvzbm1oKTLprYiwXJ5T8pv6nrogCZBIRvVxsL7WDOput354znxQmCj7f87mHIfKDuthEhBdwrgwzI26G5q8GpboHjqVD+rxtGuH6ZiRmvoqXuKsnJinUHCt90jE18lPWSOsOCrm2xZI9j4pRu0TqWSXZ4azGONDuHPoGjM+1RaPcz2ONI/vFyAt0rsQMzCSmv6Ov85U2lCg5d/EW0MwrBqbJUEaZ7Fb2ByHrXwCiZE6v7AVVBHmDFqF16khsWXGPMvj9HooduuO/y8jdRLWB28LcZO/6iwQhjLCp3EAwT031wxJM1c/nEuZKw4rUnNGussHH9VFT3F5yYoDkafaVgLb/v9QN1CpwnQFvU4YhdxLVWL92KIjNBNo4edx58xcIfwsXJbJHUZFPuaNKV5WsUiVBQACrWSrHW7fr/JbG1YQq4Km+0E7JN/MNrU6k3VADAkBfnWXYDef9jIfoFD3MeqycO4OKFxe6GJgzjCOsTAT9Jm7K5mYQinaUhTPvSxVIzDMlZQ+zUM5eQkn3cAZp4PCxXsC0S9bLYwLIvWNbZ947vjkhLxuR0Pc5sL3K9XgQlyl+f6zqE9A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(38070700005)(71200400001)(316002)(478600001)(110136005)(54906003)(38100700002)(66946007)(186003)(4326008)(55016003)(8676002)(122000001)(66476007)(66446008)(76116006)(64756008)(66556008)(5660300002)(53546011)(7696005)(9686003)(6506007)(41300700001)(26005)(8936002)(33656002)(2906002)(86362001)(52536014)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9879
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3db4ea0-ef80-4080-3cd7-08daaeaf3a15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n8LBe2y1H+FDt5766sFW4EasCK8l8h6Xj6oTFqR52oX2KFoXOrIHqJ/ho/gZfDJfA3PZsdsHkPsXk9HxU+S/Fh96LuiLNE2bGzWIM0v+B8L42IxR8on0vD6SgBMjuqqaoKpnSjg91QR0ObYink8oasIm4agULDJ87fNOpxOvUvhdBeNG/QnDrpBHTg9bTUJP7EFei0arzLgf5ztYToRxwkkUvdAm8FPPrOzqXnEpiqd4NgKdfg8uRM2t/x9POqXkNgBZUjYBWE9b+Mq/Y+F62ZyseMK3AV0BEDhQ8C233P5clwlEeTfMH3b2N9WiMcIkXdhCtz6N3HhnnlbQ9w9NKVxppUDZg1Cys6t0xdRKuNQFGwx2SE9YnX3mDxlPhZSIispdKhpEXEwZzGgKN5PaoKLAa4SoB9NAq7g0+/xnKrWT71og7uoFOyQvplZen6Zg2ju7SVBg7wmfbOaRkl1lx3mmtIZ175rXhkgpUCoqUSc3yIRdhEWP9seyFLxAL5dCev1NEVbMbhSLRKoRXpZ9Cw36QnMShOjAo/3fB2nkpT8DoC0jbvJzXfQjdlMrrnNkjeF5BRmEBedeSzAx7UHUOTybO9Vd5oHbUTxJFtiHuzE9YaDVxxp9QLaipXjFf/Hopk7zNlgj/D2Ffe8joZgcJUxpq+ZAt08/RuFWqh/BMhNOHlnTxOG9cD86weKDSy0HYUN4s/p6ZsfDuTRoFQaVx2wjwvaEtThows1Ipe4pwIdxtdzIOR+njprRbUCmcx9qI/Xd8QGX5Bzl/dZO/V1jgQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(9686003)(40460700003)(52536014)(26005)(33656002)(316002)(5660300002)(8676002)(4326008)(8936002)(70586007)(70206006)(81166007)(110136005)(6506007)(7696005)(356005)(86362001)(41300700001)(186003)(82310400005)(53546011)(2906002)(55016003)(40480700001)(82740400003)(336012)(54906003)(478600001)(83380400001)(107886003)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 13:14:53.4255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6018f37b-c20b-4da4-9e5e-08daaeaf3f8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9442

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIHJlcGx5IGFuZCBzaGFyaW5nIHlvdXIgb3BpbmlvbnMh
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL2FybTogcDJtOiBQ
b3B1bGF0ZSBwYWdlcyBmb3IgR0lDdjIgbWFwcGluZyBpbg0KPiBhcmNoX2RvbWFpbl9jcmVhdGUo
KQ0KPiBPbiAxNC8xMC8yMDIyIDEyOjE5LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEhpIEp1bGll
biwNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+ICAgICAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOw0KPiA+Pj4gICAgICAg
IHVuc2lnbmVkIGxvbmcgY291bnQgPSAwOw0KPiA+Pj4gQEAgLTE3MTYsNyArMTcxNiw3IEBAIGlu
dCBwMm1fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4gPj4+ICAgICAgICAgICAgcDJtX2Zy
ZWVfcGFnZShwMm0tPmRvbWFpbiwgcGcpOw0KPiA+Pj4gICAgICAgICAgICBjb3VudCsrOw0KPiA+
Pj4gICAgICAgICAgICAvKiBBcmJpdHJhcmlseSBwcmVlbXB0IGV2ZXJ5IDUxMiBpdGVyYXRpb25z
ICovDQo+ID4+PiAtICAgICAgICBpZiAoICEoY291bnQgJSA1MTIpICYmIGh5cGVyY2FsbF9wcmVl
bXB0X2NoZWNrKCkgKQ0KPiA+Pj4gKyAgICAgICAgaWYgKCBhbGxvd19wcmVlbXB0aW9uICYmICEo
Y291bnQgJSA1MTIpICYmDQo+ID4+IGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgKQ0KPiA+Pj4g
ICAgICAgICAgICB7DQo+ID4+PiAgICAgICAgICAgICAgICByYyA9IC1FUkVTVEFSVDsNCj4gPj4+
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+Pj4gQEAgLTE3MzYsNiArMTczNiwxNyBAQCB2b2lk
IHAybV9maW5hbF90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+Pj4gICAgICAgIGlmICgg
IXAybS0+ZG9tYWluICkNCj4gPj4+ICAgICAgICAgICAgcmV0dXJuOw0KPiA+Pj4NCj4gPj4+ICsg
ICAgaWYgKCAhcGFnZV9saXN0X2VtcHR5KCZwMm0tPnBhZ2VzKSApDQo+ID4+DQo+ID4+IERpZCB5
b3UgYWRkIHRoaXMgY2hlY2sgdG8gYXZvaWQgdGhlIGNsZWFuICYgaW52YWxpZGF0ZSBpZiB0aGUg
bGlzdCBpcyBlbXB0eT8NCj4gPg0KPiA+IFllcC4gSSB0aGluayB3ZSBvbmx5IG5lZWQgdGhlIHAy
bV90ZWFyZG93bigpIGlmIHdlIGFjdHVhbGx5IGhhdmUNCj4gc29tZXRoaW5nDQo+ID4gaW4gcDJt
LT5wYWdlcyBsaXN0Lg0KPiANCj4gSG93IGFib3V0IGFkZGluZyB0aGUgY2hlY2sgaW4gcDJtX3Rl
YXJkb3duKCk/IFNvIGl0IHdpbGwgYmUgZWFzaWVyIHRvDQo+IHJlbWVtYmVyIHRoYXQgdGhlIGNo
ZWNrIGNhbiBiZSBkcm9wcGVkIGlmIHdlIG1vdmUgdGhlIHplcm9pbmcgb3V0c2lkZSBvZg0KPiB0
aGUgZnVuY3Rpb24uDQoNClllcywgSSB3aWxsIHR1cm4gYWJvdmUgaWYgY2hlY2sgdG8gYQ0KDQpp
ZiAoIHBhZ2VfbGlzdF9lbXB0eSgmcDJtLT5wYWdlcykgKQ0KICAgIHJldHVybiAwOw0KDQppbiB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBwMm1fdGVhcmRvd24oKSwgYW5kIGRvIHRoZSBjbGVhbiAmIGlu
dmFsaWRhdGUNCmZvbGxvdy11cCBhZnRlciB0aGUgcmVsZWFzZS4NCg0KPiANCj4gPg0KPiA+Pg0K
PiA+Pj4gKyAgICAgICAgcDJtX3RlYXJkb3duKGQsIGZhbHNlKTsNCj4gPj4NCj4gPj4gVG9kYXks
IGl0IHNob3VsZCBiZSBmaW5lIHRvIGlnbm9yZSBwMm1fdGVhcmRvd24oKS4gQnV0IEkgd291bGQg
cHJlZmVyIGlmDQo+ID4+IHdlIGFkZCBhbiBBU1NFUlQoKS9CVUdfT04oKSAob3IgZWxzZSkgdG8g
bWFrZSBjb25maXJtIHRoaXMgaXMgdGhlIGNhc2UuDQo+ID4NCj4gPiBTb3JyeSBJIGRvIG5vdCBy
ZWFsbHkgdW5kZXJzdGFuZCB3aHkgd2UgY2FuIGlnbm9yZSB0aGUgcDJtX3RlYXJkb3duKCkNCj4g
PiBwcm9iYWJseSBiZWNhdXNlIG9mIG15IEVuZ2xpc2guDQo+IA0KPiBObywgSSBmb3Jnb3QgYSB3
b3JkIGluIG15IHNlbnRlbmNlLiBJIHdhcyBtZWFudCB0byBzYXkgdGhhdCB0aGUgcmV0dXJuDQo+
IG9mIHAybV90ZWFyZG93bigpIGNhbiBiZSBpZ25vcmVkIGluIG91ciBzaXR1YXRpb24gYmVjYXVz
ZSBpdCBvbmx5IHJldHVybg0KPiAwIG9yIC1FUkVTVEFSVC4gVGhlIGxhdHRlciBjYW5ubm90IGhh
cHBlbiB3aGVuIHRoZSBwcmVlbXB0aW9uIGlzIG5vdA0KPiBlbmFibGVkLg0KPiANCj4gQnV0IEkg
d291bGQgbGlrZSB0byBhZGQgc29tZSBjb2RlIChlaXRoZXIgQVNTRVJUKCkgb3IgQlVHX09OKCkp
IHRvDQo+IGNvbmZpcm0gdGhhdCBwMm1fdGVhcmRvd24oKSB3aWxsIGFsd2F5cyByZXR1cm4gMC4N
Cg0KSSBhZGRlZCB0aGUgZG9jIGFza2VkIGluIHlvdXIgcHJldmlvdXMgZW1haWwuIEFsc28sIEkg
d2lsbCB1c2UgYQ0KDQpBU1NFUlQocDJtX3RlYXJkb3duKGQsIGZhbHNlKSA9PSAwKTsNCg0KaW4g
cDJtX2ZpbmFsX3RlYXJkb3duKCkgaGVyZS4NCg0KPiANCj4gPiBMZXQncyB0YWxrIGEgYml0IG1v
cmUgaW4gQyBpZiB5b3UgZG9uJ3QgbWluZCA6KSkNCj4gPiBEbyB5b3UgbWVhbiBwMm1fdGVhcmRv
d24oKSBzaG91bGQgYmUgY2FsbGVkIGhlcmUgdW5jb25kaXRpb25hbGx5DQo+IHdpdGhvdXQNCj4g
PiB0aGUgaWYgKCAhcGFnZV9saXN0X2VtcHR5KCZwMm0tPnBhZ2VzKSApIGNoZWNrPw0KPiANCj4g
U2VlIGFib3ZlLg0KDQpUaGFua3MuDQoNCj4gDQo+ID4NCj4gPj4NCj4gPj4gVGhpcyBhbHNvIHdh
bnRzIHRvIGJlIGRvY3VtZW50ZWQgb24gdG9wIG9mIHAybV90ZWFyZG93bigpIGFzIGl0IHdvdWxk
DQo+IGJlDQo+ID4+IGVhc2llciB0byBrbm93IHRoYXQgdGhlIGZ1bmN0aW9uIHNob3VsZCBhbHdh
eXMgcmV0dXJuIDAgd2hlbg0KPiA+PiAhYWxsb3dfcHJlZW1wdGlvbiBpcyBub3Qgc2V0Lg0KPiA+
DQo+ID4gT2ssIHdpbGwgZG8uDQo+ID4NCj4gPj4NCj4gPj4gSSBhbHNvIG5vdGljZWQgdGhhdCBy
ZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgaXMgbm90IGNhbGxlZC4gVGhpcyBzaG91bGQNCj4gPj4g
YmUgZmluZSBmb3IgdXMgYmVjYXVzZSBhcmNoX2RvbWFpbl9jcmVhdGUoKSBzaG91bGQgbmV2ZXIg
Y3JlYXRlIGENCj4gPj4gbWFwcGluZyB0aGF0IHJlcXVpcmVzIHAybV9wdXRfbDNfcGFnZSgpIHRv
IGJlIGNhbGxlZC4NCj4gPj4NCj4gPj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRvIGNoZWNr
IGl0IGluIF9fcDJtX3NldF9lbnRyeSgpLiBTbyB3ZSBkb24ndA0KPiA+PiBlbmQgdXAgdG8gYWRk
IHN1Y2ggbWFwcGluZ3MgYnkgbWlzdGFrZS4NCj4gPg0KPiA+IEkgdGhvdWdodCBmb3IgYSB3aGls
ZSBidXQgZmFpbGVkIHRvIHRyYW5zbGF0ZSB0aGUgYWJvdmUgcmVxdWlyZW1lbnRzDQo+ID4gdG8g
cHJvcGVyIGlmIGNvbmRpdGlvbnMgaW4gX19wMm1fc2V0X2VudHJ5KCkuLi4NCj4gDQo+IEZvciBj
aGVja2luZyB0aGUgbWFwcGluZywgd2UgY2FuIGRvOg0KPiANCj4gaWYgKCAhcmVtb3ZpbmdfbWFw
cGluZyAmJiAocDJtX2lzX2ZvcmVpZ24odCkgfHwgKHAybV9pc19yYW0odCkgJiYNCj4gaXNfeGVu
aGVhcF9tZm4obWZuKSApDQo+ICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNClRoYW5rcyBmb3IgdGhp
cywgSSBndWVzcyB3aXRob3V0IHlvdXIgaGludCBpdCB3aWxsIHRha2UgYWdlcyBmb3IgbWUgdG8N
CnRoaW5rIG9mIHRoaXMuLi4uIA0KDQo+IA0KPiBXZSBhbHNvIG5lZWQgYSB3YXkgdG8gY2hlY2sg
d2hldGhlciB3ZSBhcmUgY2FsbGVkIGZyb20NCj4gYXJjaF9kb21haW5fY3JlYXRlKCkuIEkgdGhp
bmsgd2Ugd291bGQgbmVlZCBhIGZpZWxkIGluIHRoZSBkb21haW4NCj4gc3RydWN0dXJlIHRvIGlu
ZGljYXRlIHdoZXRoZXIgaXQgaXMgc3RpbGwgaW5pdGlhbGl6YXRpbmcuDQo+IA0KPiBUaGlzIGlz
IGEgYml0IHVnbHkgdGhvdWdoLiBBbnkgb3RoZXIgc3VnZ2VzdGlvbnM/DQoNCk15IGZpcnN0IHRo
b3VnaHQgaXMgY2hlY2tpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mIGRvbWFpbl9jcmVhdGUoKQ0K
YW5kIGFyY2hfZG9tYWluX2NyZWF0ZSgpIChhcyBib3RoIHdpbGwgY2FsbCBhcmNoX2RvbWFpbl9k
ZXN0cm95KCkNCndoZW4gZmFpbCkgdG8gc2VlIGlmIHRoZXJlIGFyZSBzb21lIGZpZWxkcyBpbiBz
dHJ1Y3QgZG9tYWluIG9yDQpzdHJ1Y3QgYXJjaF9kb21haW4gdGhhdCBhcmUgc2V0L2NoYW5nZWQg
aW4gdGhpcyBzdGFnZSBzbyBwcm9iYWJseSB3ZQ0KY2FuIHJldXNlLiBPdGhlcndpc2UgSSB0aGlu
ayBhZGRpbmcgYSBuZXcgZmllbGQgc291bmRzIGEgZ29vZCBpZGVhLg0KDQo+IA0KPiA+DQo+ID4+
DQo+ID4+IEkgd291bGQgaGF2ZSBzdWdnZXN0ZWQgdG8gYWRkIGEgY29tbWVudCBvbmx5IGZvciB2
ZXJzaW9uIGFuZCBzZW5kIGENCj4gPj4gZm9sbG93LXVwIHBhdGNoLiBCdXQgSSBkb24ndCBleGFj
dGx5IGtub3cgd2hlcmUgdG8gcHV0IGl0Lg0KPiA+DQo+ID4gLi4uaG93IGFib3V0IHAybV9maW5h
bF90ZWFyZG93bigpLCB3ZSBjYW4gdXNlIGEgVE9ETyB0byBleHBsYWluIHdoeQ0KPiA+IHdlIGRv
bid0IG5lZWQgdG8gY2FsbCByZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgYW5kIGEgZm9sbG93aW5n
IHBhdGNoDQo+ID4gY2FuIGZpeCB0aGlzPw0KPiANCj4gVG8gbWUgdGhlIFRPRE8gd291bGQgbWFr
ZSBtb3JlIHNlbnNlIG9uIHRvcCBvZiBwMm1fc2V0X2VudHJ5KCkNCj4gYmVjYXVzZQ0KPiB0aGlz
IGlzIHdoZXJlIHRoZSBpc3N1ZSBzaG91bGQgYmUgZml4ZWQuIFRoaXMgaXMgYWxzbyB3aGVyZSBt
b3N0IG9mIHRoZQ0KPiByZWFkZXIgd2lsbCBsaWtlbHkgbG9vayBpZiB0aGV5IHdhbnQgdG8gdW5k
ZXJzdGFuZCBob3cgcDJtX3NldF9lbnRyeSgpDQo+IGNhbiBiZSB1c2VkLg0KDQpHb29kIGlkZWEs
IHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24hDQoNCj4gDQo+IFdlIGNvdWxkIGFsc28gaGF2ZSBh
IGNvbW1lbnQgaW4gcDJtX2ZpbmFsX3RlYXJkb3duKCkgc3RhdGluZyB0aGF0IHRoZQ0KPiByZWxp
bnF1aXNoIGZ1bmN0aW9uIGlzIG5vdCBjYWxsZWQgYmVjYXVzZSB0aGUgUDJNIHNob3VsZCBub3Qg
Y29udGFpbiBhbnkNCj4gbWFwcGluZyB0aGF0IHJlcXVpcmVzIHNwZWNpZmljIG9wZXJhdGlvbiB3
aGVuIHJlbW92ZWQuIFRoaXMgY291bGQgcG9pbnQNCj4gdG8gdGhlIGNvbW1lbnQgaW4gcDJtX3Nl
dF9lbnRyeSgpLg0KDQpZZXMsIG15IGN1cnJlbnQgd29yZGluZyBmb3IgdGhpcyB3b3VsZCBiZToN
CisgICAgLyoNCisgICAgICogTm8gbmVlZCB0byBjYWxsIHJlbGlucXVpc2hfcDJtX21hcHBpbmco
KSBoZXJlIGJlY2F1c2UNCisgICAgICogcDJtX2ZpbmFsX3RlYXJkb3duKCkgaXMgY2FsbGVkIGVp
dGhlciBhZnRlciBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQ0KKyAgICAgKiB3aGVyZSBy
ZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgaGFzIGJlZW4gY2FsbGVkLCBvciBmcm9tIGZhaWx1cmUg
cGF0aCBvZg0KKyAgICAgKiBkb21haW5fY3JlYXRlKCkvYXJjaF9kb21haW5fY3JlYXRlKCkgd2hl
cmUgbWFwcGluZ3MgdGhhdCByZXF1aXJlDQorICAgICAqIHAybV9wdXRfbDNfcGFnZSgpIHNob3Vs
ZCBuZXZlciBiZSBjcmVhdGVkLg0KKyAgICAgKi8NCg0KSSB3aWxsIGFkZCB0aGUgd29yZHMgcG9p
bnRpbmcgdG8gcDJtX3NldF9lbnRyeSgpLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoNCj4g
DQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

