Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA34529926
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 07:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330461.553831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqq75-0005Co-PS; Tue, 17 May 2022 05:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330461.553831; Tue, 17 May 2022 05:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqq75-0005Aa-Lk; Tue, 17 May 2022 05:51:19 +0000
Received: by outflank-mailman (input) for mailman id 330461;
 Tue, 17 May 2022 05:51:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKte=VZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nqq74-0005AU-1O
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 05:51:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf1f39b-d5a5-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 07:51:15 +0200 (CEST)
Received: from AS8PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:20b:331::33)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 05:51:12 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::ed) by AS8PR04CA0178.outlook.office365.com
 (2603:10a6:20b:331::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 05:51:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 05:51:11 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 17 May 2022 05:51:10 +0000
Received: from 386d6afb0574.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BC2BD0D-9782-4C3B-8CE7-24D863167F10.1; 
 Tue, 17 May 2022 05:51:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 386d6afb0574.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 05:51:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 05:51:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 05:51:00 +0000
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
X-Inumbo-ID: 5cf1f39b-d5a5-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jaLS7WgQZVLJOGrdb43ln/PIoCjxp7KkXAD9fJbMgg8Im6nJj3nzWDCLDubQr+MhNCcMuFiTwuPdrWv6c7NPlWPh7oj04OUV4NDtZV0RVWCI7pByBuf7Jvd+/mF+CQrSM22BD39nyP8GGDjqPvJQZRLfbO723nUiKRZ8oo4We1viOq7LPis1v1xawzsISKHOn6bkw+f2RBvhUm3TcdjGPQ20pMOVvJJ82gX9ukm98MZ1oT3tUG80KdL52mRVpAZ4axOiRVRsYdR5EWmm0K1IUV4HCFOK1RlNLqhsTEZJagVkvF+0pmN36un6SS2RqXECJ/6zqs1Z7SDU8XSR86hLFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt3O8kinsp+nND0P0kmSdThiPFlBty7J0TAjOJJT5iA=;
 b=UfJo/5x2fZpTP8hNYHTrNnC+CmlZBudK3zCeK2T7uvItLQwmAGTCbp7QCI+IQROHhaqFeffBjZ2zsho8nkOuzNSfhB3s9bt2ZfBLlqtiWbmof6GMjsoNWgtw8PmFwo3/th6eNSeNNKIXosvSprkPQLZGTT0xL3m/bFFVDAUGefgF3hOyvSdbHBw3eSys7xyPBQ/8j5Fzd/nxmVpGyvb7stQGYQke09+fZlyUxxe8QK8ZCI4SUtn5NDPjMMxYF97BtGqfgT7QlrTihZkVAsxHzP41sGXy/ZwXalUFojIg5hi3eN94KRWizHk4i/zNwL1iu3bM6E646rpnidL93V4RTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=timeout (key query timeout) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt3O8kinsp+nND0P0kmSdThiPFlBty7J0TAjOJJT5iA=;
 b=S+FSzx8uCOoVOyVWkd9fwtHhwOMbbbmU0FsAuKAXcgA1IP2fT5fZ/gfjNkHbW1L+N/OYqkbxSyagWI3TVbaSsauuSDLfpu32U1PburX6M7YvbasC9PnjQGnuZDs/L7xeLmknZ1HYdZl941C/JVBrTqorM1k0l9e+nR9oNf9+VuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=timeout (key query timeout)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKO7FAQWYWT5TAAbMxEj80hCImvXIKLIwPdF7DHcEn/j2NLerW3ukDWoJQ5QqwZd7Ely/g5Ox8gbsGOqm2M8GOlSmIE6KT+E4JVQvVeepP5ZT/1bhNz81gXNiBdLQQft8Zy0BExdpskdABah7NwKRLmZ8WLo/vhICrxZ3qfe4yMi1HzMsnJn8UuzNbHBCZFj9VOzmkELtz1pVwg5hVYaUio7YrG1+TPg9tUHjSNqIdqZ2OpDxxQ943z1alr7GgaJx2AXzv91GBYSOYiJ/Gjhw8I4mTWDEvwQs0ViJmjMOXcQO7RR+b6eM3gWXENAnkbghcd53ma9xTP2VvhJruaw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt3O8kinsp+nND0P0kmSdThiPFlBty7J0TAjOJJT5iA=;
 b=NN1MI8YWhzGNcLhATQIBFymT3XzwnRmMmBBCl5tySeynhELslqCGDKVDiSsHjLRAfwNAkIZ9LptbpCY9Pc+hLIfC5rXEw71s3lb+KGjYVbT6KmP+6qAXakG9g4sWlicvgA7aF98AHsBuBc5NcEpsQo6TAEjZrvB1kKk5MGiZ8iH2j1JuDnmNhaNWrj7X0cWJG6vESFwozAiiSXiSaluRn4GDHrfPIo3FZyor4PSFLUghL254YwTz7LnZUOMSKprbSNa3hJvDlmMNhlxCGhCZtdeYujucFL1BXtGlTJSoQUv3dytbKwbr7rgrdTc8oYqUgpB39vkv/rEWGG16nN+Qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt3O8kinsp+nND0P0kmSdThiPFlBty7J0TAjOJJT5iA=;
 b=S+FSzx8uCOoVOyVWkd9fwtHhwOMbbbmU0FsAuKAXcgA1IP2fT5fZ/gfjNkHbW1L+N/OYqkbxSyagWI3TVbaSsauuSDLfpu32U1PburX6M7YvbasC9PnjQGnuZDs/L7xeLmknZ1HYdZl941C/JVBrTqorM1k0l9e+nR9oNf9+VuU=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, Jiamei Xie
	<Jiamei.Xie@arm.com>, =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH V1] libxl/arm: Insert "xen,dev-domid" property to
 virtio-mmio device node
Thread-Topic: [PATCH V1] libxl/arm: Insert "xen,dev-domid" property to
 virtio-mmio device node
Thread-Index: AQHYZIMZsdRVC7TfqkSWxMHQ36uuy60ime0A
Date: Tue, 17 May 2022 05:51:00 +0000
Message-ID:
 <AS8PR08MB7991597DE6EE2E5F7B4BA77A92CE9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <1652196676-14745-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1652196676-14745-1-git-send-email-olekstysh@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ADE2F1BC16BD9340B58BBE32E330CCA6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ef252c0c-929b-4451-82c9-08da37c93ef6
x-ms-traffictypediagnostic:
	VE1PR08MB5758:EE_|AM5EUR03FT038:EE_|DB8PR08MB5402:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB540233391D9A214C3B56057892CE9@DB8PR08MB5402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vdxs4qOzVWAa37bYtEdnqDI8Zrkcuu5rGEzLqF3Rhtk/T+DWFmGaoKvwKo7vdrZ1b3aaZYrOSULn/emTfrb5cDrp24N30Jx1DjZ63Dn5USFcMKKt1G8avIwdPeF3aXd1u0M2qlr/n3ejltA8EF89t9DEB77bogdMDQsL8KO+5Af+HBc7lnPQ5xXwuv8Wnz1v5SAaTsXbLZqCpS/ZDUkHU5nzKmbUhJYKkHMEtlDFfEJ3CZ0Zru/WrZA+Z+pNKBRj8xeoAGNRj/+8BaysZr9Wa2rmiYmxnho4Dfzzzar6xJILj2yUL/y0qRNL5GbRBgNNyQw1v9O1ZiX07nuWHKa0wb5bObMLrDL527tXiMQvbFgWwvrFvh5l5e85y44dljBzdQDhv77HBdeVcDCLWQnXMWPDx88Sg6kDsclAair9qdcF2wVm1W/r/DtaqMBT/ciqGxhqx8oO+glSgDQsoKsSOh0SBO+O4gli/8m2jKFYW2emHVL9TZgyo9Ntb500MmaUaCyN7HGxtBdGRMtFwggLH7H/dPV7Kx1D2LROjVR+nP/rppT00nwiUa6gdwb4jBIRxQPHTpiYBUpszdB2ZLaNVcdIX6u/+CABxedRh6T5VIw31zzRhgMjmXTHop1xa4XZTDly9XUjidm1imD3V9gWlCDqLqt7YdAGTHYOnb4CkqCrtAFFNIDFcN75ap2bg1BG2HaAtD0APK1zdo5Ovfsdgg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(26005)(9686003)(71200400001)(64756008)(508600001)(52536014)(66476007)(54906003)(6506007)(86362001)(33656002)(38100700002)(4744005)(83380400001)(2906002)(7696005)(316002)(5660300002)(186003)(38070700005)(8936002)(66556008)(66946007)(66446008)(76116006)(110136005)(55016003)(8676002)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50e575a5-ca08-4a2d-22ea-08da37c938c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rCTq2FoowktUgNzg66gn4hrawGLVIV8WtwClG3pJq7ieEjgfZSG2FaJfDo+W3aiQO9h2KMQY4V5Xzu+1dgLnV9hB7yDhp31hdYjlEW8yUAAltmSX9luedzqdag00X8FKrkMlFrKPhyV8cPqjsnTvu5IVvQHoNWXlVtfwonesHrZcOY/t95tidpImySCz/Cwitd6BfTiOAvWhedaQPKOhB/R+m8DEezrQV1QKlGG9noJLf7j1V+DV3at9gl/VING3p2KRGBe9XeDrX5XRVpSolAy4JmmHq6JWuQr+Wa2UkgtRaJTArIboRCAY+zjMsRhORDtfeSzJD4k2yq41sD3r9ZPfrnXvK49c9QleGSrc4hJZrem2xi0d4pa9jVTDznvum6whMH4Cbn4cG5h/r6NXa1Wn9988k5aGI7+KZM6mLTELdRJptl1b//lPMNteyhruPUtS6OK19Tv2O9qvwU8j+ctZKVcLJHcg+JcwoP2ygUjEu6bfxEJpjHUUVARc6LjGgDg/Qso7GpHaUFaXHufIhatHzYWCyjLyrc3Sn0aouf9SknEng033RfaflrZgcVf2scLYRZtyLBolInePLH1wpcUIr4HrbC9NoqWqHza5SqNKHt2s068h2t5UXXkvSXyG9mj3TtqiCzIzlVRejy9z13JwzbGcNjfTPN3nHW4t330O2bFxQVyYxwjZ10tR6uTB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(7696005)(26005)(107886003)(40460700003)(33656002)(6506007)(81166007)(47076005)(336012)(55016003)(4744005)(52536014)(8936002)(9686003)(82310400005)(54906003)(508600001)(86362001)(4326008)(70586007)(70206006)(8676002)(356005)(5660300002)(186003)(83380400001)(2906002)(316002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 05:51:11.0174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef252c0c-929b-4451-82c9-08da37c93ef6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc3R5c2hAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggVjFdIGxpYnhsL2FybTogSW5zZXJ0ICJ4ZW4sZGV2LWRvbWlkIiBwcm9wZXJ0eSB0byB2aXJ0
aW8tDQo+IG1taW8gZGV2aWNlIG5vZGUNCj4gDQo+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtv
IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4gDQo+IFVzZSBzcGVjaWZpYyBiaW5k
aW5nIGZvciB0aGUgdmlydGlvIGRldmljZXMgZm9yIHdoaWNoIHRoZSByZXN0cmljdGVkDQo+IG1l
bW9yeSBhY2Nlc3MgdXNpbmcgWGVuIGdyYW50IG1hcHBpbmdzIG5lZWQgdG8gYmUgZW5hYmxlZC4N
Cj4gDQo+IEJhc2VkIG9uIGRldmljZS10cmVlIGJpbmRpbmcgZnJvbSBMaW51eDoNCj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS94ZW4sZGV2LWRvbWlkLnlhbWwNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4NCg0KVGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLiBTbw0KUmV2aWV3ZWQt
Ynk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg==

