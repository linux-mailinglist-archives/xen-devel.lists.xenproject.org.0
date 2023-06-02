Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D671F83C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 03:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542900.847320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4u3t-0005RU-N7; Fri, 02 Jun 2023 01:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542900.847320; Fri, 02 Jun 2023 01:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4u3t-0005P9-KI; Fri, 02 Jun 2023 01:58:41 +0000
Received: by outflank-mailman (input) for mailman id 542900;
 Fri, 02 Jun 2023 01:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIO5=BW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q4u3s-0005P3-Er
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 01:58:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd94c0bd-00e8-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 03:58:38 +0200 (CEST)
Received: from AM5PR0201CA0004.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::14) by AS4PR08MB7653.eurprd08.prod.outlook.com
 (2603:10a6:20b:4cf::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 01:58:35 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a4) by AM5PR0201CA0004.outlook.office365.com
 (2603:10a6:203:3d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 01:58:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.10 via Frontend Transport; Fri, 2 Jun 2023 01:58:35 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Fri, 02 Jun 2023 01:58:35 +0000
Received: from 7980f28d47d3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A7A23AF-BD66-4B3A-80C7-4AE51976150D.1; 
 Fri, 02 Jun 2023 01:58:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7980f28d47d3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jun 2023 01:58:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8832.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 01:58:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 01:58:26 +0000
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
X-Inumbo-ID: fd94c0bd-00e8-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6HTBq2BtnCXTO9LEis8hpg7lMj2+rcpyw1lBs0GN7I=;
 b=ygXelLs82LJDaU1A7zKnoiNG5IrTCA5cnuyMVfCO6oPWl8rSLBtlea8w/6FmPuQgJtPQ6hM8szIZsdR5qNa6WlP+/mcuyKmk9hmeO0Oqxpa6x7CxIFL+sbCpQmrmC32CbTVNYsL70B8jPtIQ+xsZqwTRvsygDrGUZeC2e636kgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff5UF5Ggr95yP4h6iHogJxyKMFqr9vw8hxZ+4qBQfwP8+h7Bn6+qk1/xnPEYn1GKMvtfYU8t7AjlvPRYol/Vo/Pokh/49H3753tf5vgpxoZz3CTovvcOcMpWqFGoCrpw8uNNtuXKgbZVhWfg0392P6xm6HNXF0/t6WV7qa0u+7bp9nbgICcuk83pkm1pWPqBYDJquY071jKo7Ms0xtIBWs2qfuCII628gBZyzyeitv0cA689aJk5epvR84FQHvzJcXXf4/U7nR6KW4UWEFYwz159r0GiypeMgYNJzzku1VTWAPDA8lEbH3mdrohYvzusek4cktAvIXN/kg20Dg2C8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6HTBq2BtnCXTO9LEis8hpg7lMj2+rcpyw1lBs0GN7I=;
 b=XktVANklJcKKHDVw5ioVMrfXu6nmhQ09XGQKoc3sFDc9AU6DABzzJ3jjQ0xYQyDOAWHS+okNACc7vWET9lqtG39NpcEjOHcEmfez7165KX/aPIKtQUCuIOSk3sNEyJK3L0qGEB9lpYaY5RT7vjjS5861WrGdXX3AxyXtSRar+FSM0u61C9wSO7nMl4m0r5sg7LgnocywsJojSqssydHKt9wAc2hZQtBYhEgN84Qp9RlQ5nqztMKZPupVFGHpJsLt3R4PnhpKiEqESVPEiLjFNG0NGMQ5ed1XM4KnRW/BqTWekdS0i0WkOb2oIfQ5K/GVA8XNO7D1fazpzMDVaEXaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6HTBq2BtnCXTO9LEis8hpg7lMj2+rcpyw1lBs0GN7I=;
 b=ygXelLs82LJDaU1A7zKnoiNG5IrTCA5cnuyMVfCO6oPWl8rSLBtlea8w/6FmPuQgJtPQ6hM8szIZsdR5qNa6WlP+/mcuyKmk9hmeO0Oqxpa6x7CxIFL+sbCpQmrmC32CbTVNYsL70B8jPtIQ+xsZqwTRvsygDrGUZeC2e636kgc=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "michal.orzel@amd.com" <michal.orzel@amd.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
Thread-Topic: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
Thread-Index: AQHZlOwaX4LVBFA07UiCkT/feXB9lq92wX/Q
Date: Fri, 2 Jun 2023 01:58:25 +0000
Message-ID:
 <AS8PR08MB7991EBC4BE5563F949A06392924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-15-vikram.garhwal@amd.com>
In-Reply-To: <20230602004824.20731-15-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0FC1BC7B3E393F4BA3AE2973372BE4F5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8832:EE_|AM7EUR03FT046:EE_|AS4PR08MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 7341cc02-9da6-406a-09b0-08db630ce023
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xkICVglXSJTqOn49r2zGuAJdsw8XAzDcbIgNMDTb3OJEnUje5eKS9qWO5+skSQutRUt8MzVdnWhzeeHDOXG4V5kLlIc9y0SjQuIhBP4YPE+Qwc+ZjFLbAZrCgZiZTxenIMdP18PNjqACPeCVC+fLqcQATdpRW8bgxxB6mF71G9lvZHTHgb5BbWUMkssIRJmRjDdwSA82VBiSyj2AqEENY3kge6r0CIbUq/9u6Nx8IzWTT52sbRioRbRq6LdYNG+QqawDRuUTTWWVQ/c9VRHNx52JnvBIUMrNkAzsk5hFyC4lZUHwEdce+ZTAjkDr2i/wUb/QcC2JOalltv1WE5Gok7oLxHLRODCmRhxtjZFgQ60Hzsl1uOo0vX7og34GM+Vd/lsElHgDdxbR1lc7KMBqCKrN+ccECT71XSBvsOXssk9iCcRXEF1aM6YOsnP0GY0h1qCU6bw2J2qY9sjP+daXqysKCrIlr/HveiE8zkK3VOGzL51kN5RhTpkRnfPrDIwC6LJ5H75XwBYBvpyjZlCCaJhAtqkmoycfuAFcHpi74PjC2f7+f5Q3RZyI07HGF1Biyf5+ioBGnxiyXIt5XgnPKV/qTdQa3VqKL0rVBirCbqWFVemKdY02G12DKM1QV5ie
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(86362001)(110136005)(186003)(54906003)(71200400001)(478600001)(55016003)(7696005)(6506007)(9686003)(26005)(41300700001)(38100700002)(8676002)(8936002)(33656002)(83380400001)(316002)(2906002)(38070700005)(4744005)(52536014)(5660300002)(66476007)(64756008)(76116006)(66556008)(66446008)(66946007)(4326008)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8832
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac05e5ad-f007-4813-4a7f-08db630cda86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OXSBxMTg+Ew9yJq7/vw5f8aJFdItn/apr73WrGKcF0JGFioxzMArHpYb/o91wmT+/tRQ1oaSvhLFV1TeNEwzD6YAcjvvtZhxyqzvbegHe/fKf9Mn7bKXvnq87+11I52ZCn4JEMvBUGcd2OxxYLxo/vWLQg/8A112vMQAtmU15Jki4oOMMA6m3aCskqWPC3p+ZSRhMPCS/LvCrUVM5bgFdMbznELIW7YeAXWR6i93bpVlLVZyWduGhkZGFdfBp9MRnXN4tjbukt+3HiD4Vgab0KOvCjVWeUzNlmIyQ1e1nSwrFIJ525H4Hi5iCw+D1TpLbw0ffQny5ojoXa1w7f59fwlQHggnRwpugSs+Uemrszyk8SoU+ivuYX2aUTRsTuSyRaCUDLjHrUCsr89ZKwRpOSzvO1fwz8xIb8yKfKB/xeHv0wvd5CQpCNJt5ZE0tmc+2V4XqGBx+sw9WrNaSy2OxhXQ/obNMEAufmsPIXlxAyKfwoikTQXj06EsmGPQpamtKR52c54fCHZJR/7VMIO00jFHfp5b4sGeV+qbWgZJqisKhOTdO7TxcMB3myGo/sKxHQB9XCNBokG/jTvMzLe3H60nxvpeO1rm9M1e8OKbsuIV2qANytjxNFA1DXPeZuYWP/Z3q3t+tHJVNuQm7E83bpm0Or7u3eOD4wXrBkhrjtVM6Id7s53aIqSOSsswjJaIs3Km/6K6RZ82DhSqVBjzsBlpAU7b7QtAHl9EKgnAV15Uwzs1hLVL9DMbPanvpuYe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(47076005)(36860700001)(55016003)(83380400001)(40480700001)(336012)(82740400003)(4326008)(81166007)(356005)(41300700001)(316002)(33656002)(7696005)(6506007)(26005)(9686003)(70206006)(70586007)(52536014)(40460700003)(2906002)(4744005)(8676002)(8936002)(5660300002)(54906003)(110136005)(478600001)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 01:58:35.3738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7341cc02-9da6-406a-09b0-08db630ce023
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7653

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
>=20
>  Dynamic programming ops will modify the dt_host and there might be other
>  function which are browsing the dt_host at the same time. To avoid the r=
ace
>  conditions, adding rwlock for browsing the dt_host during runtime.
>=20
>  Reason behind adding rwlock instead of spinlock:
>     For now, dynamic programming is the sole modifier of dt_host in Xen
> during
>         run time. All other access functions like iommu_release_dt_device=
() are
>         just reading the dt_host during run-time. So, there is a need to =
protect
>         others from browsing the dt_host while dynamic programming is
> modifying
>         it. rwlock is better suitable for this task as spinlock won't be =
able to
>         differentiate between read and write access.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

