Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567875FECDB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422781.669049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIV0-00075b-BI; Fri, 14 Oct 2022 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422781.669049; Fri, 14 Oct 2022 11:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIV0-00072n-7x; Fri, 14 Oct 2022 11:05:06 +0000
Received: by outflank-mailman (input) for mailman id 422781;
 Fri, 14 Oct 2022 11:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojIUy-0006zg-JE
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:05:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d655ebe-4bb0-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 13:05:03 +0200 (CEST)
Received: from AM6P195CA0070.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::47)
 by AS2PR08MB9341.eurprd08.prod.outlook.com (2603:10a6:20b:59a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 14 Oct
 2022 11:05:00 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::e0) by AM6P195CA0070.outlook.office365.com
 (2603:10a6:209:87::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Fri, 14 Oct 2022 11:05:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 11:05:00 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 14 Oct 2022 11:05:00 +0000
Received: from 1a001a0ea954.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 058FCDEC-C182-432A-BA59-BEA4D8624984.1; 
 Fri, 14 Oct 2022 11:04:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a001a0ea954.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 11:04:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9106.eurprd08.prod.outlook.com (2603:10a6:10:470::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:04:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 11:04:46 +0000
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
X-Inumbo-ID: 0d655ebe-4bb0-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=URDv07kzyKn++dAAhjm0guzY3IKUWavkt2EWoXVzHkG/DJldoFNRdPKZHDqL0CYvQA/9zsVnr0GDUyDgfjdcHv5P1XH/C6mq4j52fobmtcqNwCtyJ3nSx+STGQr2cWmqOwY19qe8m1ul5Igw6f12fP/ZnT+CvqnIliXuUqyVaQ0ilVBTbAZu5P/WlrnmmfyEOF8sNW2EmJaKUUn7HO9t9+TyNIpjZdm4dO9POR0rx/+laVS+k4oYWkaGhiuj+8OF1Vq38AGb/sQ7DsK0G+0Xrmn1RpueibPqBKIES1Jt479FoxIX+1a84wpev8c2l/LepjidTeBOVVL3tqiNpXlAVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WIx7+9Kmj0jZaJfjK06rhnidXq+sl8u1mnTolCGvrc=;
 b=DCHPbfVV8j8tbRMC3ZAcd/3dUF1+nVdapH7m+uvmB48T/TFTGY5R/d2Pi5tH4fuyN0Hu/eyzibElKUBdC6vrBvm3z2uaDaMq11YHiOxsSOyDGoeFH8Dt/4sAxuDf++rwyi9yvEY0ahoqi29zy77tGbwC7EZHZ2kvYg7B5w1/yHI2EVk/iO7UpYiQ/rrmoAQ7Rd2R96HzL+/axUkLMTK8mpbALcwUCFfM7rUiFn+ZyA9MGb1JmLPV4n+SNGsDrqLUApCXDak2YCaFVAAyIFBa/lcKqyM6vdydOOOX/8lHuY9rss8lx2KVg5aZlis5oUzfECoCzpqsmsCXCqOvRbYUPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WIx7+9Kmj0jZaJfjK06rhnidXq+sl8u1mnTolCGvrc=;
 b=Z2nqP4qsP9k2KQ9yVZrIyowetpN19UkQRd8OMrFiT9j+Qx/BLdt9es2L7rJ47gxtJNniTN6jiqGGyMUcmPv+wDNtn3BhtGm+pxAsdLuh9dcY566agi6rtweuAd7b5IVY22tB8j3rR1iizXiyaLOHU+1vD7u+IC/LQNzXN/v1VaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGfIh1GmoaNURPzh6anAQQ7Hl0mDuqQF0H5YBqJMwZ9NxzZLPis8inyKNxaGbY/z2hI3RwFqYElKYse8D2nmFV4MN3C4UJiTFpVQNkw3SL8uBiiWZihNQ9fZsAUvtsjfvdjXjyqeXpfQYenFIywE+nlcUh0RANuKCaURXmt7M+mY66UePxLniPRryE5Jy62eCL8OWcuKZzHpMZsU5UtGfj/pTEE11PSqCCzpJ3z5yZ0Lk2NtcvOhzQ4SrHfVkF2bPeVTRiUNn/xzzX6MICHQz4qd/rY0dG24qFOP7qGV9oPfnNtGgiHdZhKNGM/RNjqtaY7vPNvU2iOgqdHCAch8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WIx7+9Kmj0jZaJfjK06rhnidXq+sl8u1mnTolCGvrc=;
 b=e3S2nkkoirzFPaXy8UPekxVUUYh3bBEcVFVc/Ik0OV7NSUhzUPgBzg+Ox9/6RVU4k20MXfVhJTALqWW9uWELZoSpYLF+8657/tsno1JA3bej7EnnZyTys53pzuPaiYP4nla3P+7Ht2LGfVxGfsr/fGs7xHVVdi0wzYAAyAh45WTnWqQedvRx+cSm96SKUA8uV1Zm8pj/HQ9myK+zGOH88YAQ4vYPzcdFg6s4/EDotMg46N+PlhaaSrHTBhTCM195HY/oxI3RESpNnJuVfESakUyoT2kveTKtMBXiMKp7XY/ZJ0nu6XTBT3AhRoRrEqHX7oRRTFsms6uLqoEaLCigTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WIx7+9Kmj0jZaJfjK06rhnidXq+sl8u1mnTolCGvrc=;
 b=Z2nqP4qsP9k2KQ9yVZrIyowetpN19UkQRd8OMrFiT9j+Qx/BLdt9es2L7rJ47gxtJNniTN6jiqGGyMUcmPv+wDNtn3BhtGm+pxAsdLuh9dcY566agi6rtweuAd7b5IVY22tB8j3rR1iizXiyaLOHU+1vD7u+IC/LQNzXN/v1VaI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RSrOIThkYtnEq9RrtWc+uYX64NnUwAgAAAd5CAAA4NgIAAAPkwgAAIMgCAAAAtcIAAA6oAgAAAMLA=
Date: Fri, 14 Oct 2022 11:04:46 +0000
Message-ID:
 <AS8PR08MB7991A81D931E20A000FEFE0092249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
 <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e60803a6-44c5-9d22-88b5-c924ee854fca@suse.com>
In-Reply-To: <e60803a6-44c5-9d22-88b5-c924ee854fca@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D5726570D288FA40BC2055DEE1488B4F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9106:EE_|VE1EUR03FT009:EE_|AS2PR08MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 100f8650-d8f6-4a69-eb89-08daadd3f00a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 909RvsrqfQq0BhfKXT+x7fMzVcBeTcGImn58xkaS2NLgOCWFyQK8Df1lUkbZEKaOuRR/qvu9UPKRSSrm+0BkchtWKIGGDVL80F3O8faX4r5db+ig4GEp8D51GIGFX1209my99w2ezV8ohsVTdgSvFPOH1ydhVqpAmCVrmXfNVfx7cO5S37ggYYTndvo5mEV8RRLH/XLauN/oI3w7nR/WKaUMNtnXsNYidcBPHm442D982bPm4Mr2YNV6QtyePZ8qI1mkUcB8Or8SLg+Vjwz1wzqGjTrhwBzqjye8tp3FfIN6zeO7KWOYTW5Sw6OPMQdy0Ecdte17W/FKTlxHc3MzMJICoskgUad7fXvX7E09FBqFuV1R6LPLQPOJLyN/WKilbXKS6ijmZazcMXsPPAqgOfEA20dUHFvQ7TA435mbvXvJbySXjR+ojiH0ZhvhffSnkbruJDYDm+voe7hxnUQctmP+9ZMIBvoS4bmZBAbWcWtWJCpRO8yUxPYZun5SOhxAtNFR2rDB9P77C3PkIwTpSKZOaJh1ougYcdYXrgYxaKnpUWp9CIZoGX+cHcbXlN2kC+Z139C1PMKrc51F06gO/Nc8krG+uRPI7/v1ib3Ji2FRkPLGNebDaHd89Mf+3R44TFwPPGPJ2tF0W61UKj3RZr3jLBCsHkw8W9OCkLbGFXKpi7IfVhQtKqY4pU89wkoQZV2D/ihN3xkDWm8q0HTB5O1wlbgkd7es3ijuBI6t0wf/9/XkDEJ5zxwzxm3R3kLKHqxIAW9HrTUeJLyaMrjTeg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(54906003)(6506007)(71200400001)(9686003)(316002)(38070700005)(4326008)(83380400001)(7696005)(55016003)(4744005)(41300700001)(8676002)(26005)(2906002)(38100700002)(6916009)(52536014)(33656002)(76116006)(122000001)(186003)(66556008)(66446008)(64756008)(86362001)(66476007)(478600001)(66946007)(5660300002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13ba4365-38ee-4f9d-096a-08daadd3e79e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r3iJVpfUTKOdCA1CZ9YZmyhH/5JXE8lmOLJN1kL3rLV9DG9W1W+EzNemKwMmQRw7JyCO2gFOzQ4RwbNu6PCtRfDvKq5uy+3mp+eowWEIXTXNWwFn5k2a4fkXyGbz+W6RCu68bZvOcoBKW8p6pE5Bi42lL+64Izc8R719CrgCiBGph1wphyxZ+e47w21Kb+FoFVdEi9ig40DQnFmvNoveMilV828VuYyUAAy/WgML9/SN48hTm9IcYsMKidxJSvVJE8VsdPbU5YmigKgcv10sJC/Gaag/PFrAdCKEuOrI33v0ogqrwiKPvPNawjEo/+GbswrJ5swsNJaI/Pw/UVjuKSOX+1dj61eDsekKyKmBpSFQxMSpFMRitK0OpM+NKwmObU+MISoY+f8f5aN5GyMRBxUmWGnMiJlbhxIskfjyKIUYP2ldmfaYCrUWuXaCOIFAKe1FtUnboeMiyIUhYlXUsDl4+92nNgJcKhepf4LApDxe0qYWutrNjdj0b556iRAciKwDoP292ULKql5artj9ZLNvCsfmoy7mdOeRf62a0AUHUXH4W5rykj/qfSh9EwvMpPbvabuBdnITM2HCOmwiVTOnBAUUYuQdTS/Ubz33Tq2RfDwcMeuV4NSMkD1oNjdJ1s5VKJeT5wYdBREKtiWuM+DuiAeut/VXGs+rD0+WYhK00/w+A6FC9bMa2qKIec2IXvpCe5MUWGjOsCg6CweXFUywLWv0lOxTuKsVFA8haQ+zlILTW11tBQSPun4WRpA8zNTyuMlwz7ywOSx0yYGtzg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(9686003)(8936002)(6862004)(2906002)(47076005)(81166007)(26005)(40460700003)(52536014)(70206006)(478600001)(186003)(86362001)(33656002)(41300700001)(356005)(336012)(8676002)(6506007)(70586007)(82740400003)(7696005)(4326008)(54906003)(55016003)(82310400005)(40480700001)(83380400001)(316002)(36860700001)(4744005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 11:05:00.2205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100f8650-d8f6-4a69-eb89-08daadd3f00a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9341

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL2Fy
bTogcDJtOiBQb3B1bGF0ZSBwYWdlcyBmb3IgR0lDdjIgbWFwcGluZyBpbg0KPiBhcmNoX2RvbWFp
bl9jcmVhdGUoKQ0KPiANCj4gPiBNeSBpbml0aWFsIHRob3VnaHQgaXMgdGhlICJlbHNlIGlmIiBw
YXJ0IGluIHAybV9zZXRfYWxsb2NhdGlvbi4gSXQgbWlnaHQgYmUNCj4gPiB3cm9uZy4gV291bGQg
dGhlIGNvZGUgYmVsb3cgc2VlbXMgb2sgdG8geW91Pw0KPiA+DQo+ID4gaW50IGVycjsNCj4gPg0K
PiA+IGRvIHsNCj4gPiAgICAgZXJyID0gcDJtX3RlYXJkb3duX2FsbG9jYXRpb24oZCkNCj4gPiB9
IHdoaWxlICggZXJyID09IC1FUkVTVEFSVCApDQo+IA0KPiBTdXJlLCBvbmUgb2Ygc2V2ZXJhbCB3
YXlzIG9mIGRvaW5nIGl0Lg0KDQpUaGFua3MgZm9yIHlvdXIgY29uZmlybWF0aW9uLiBKdXN0IHRv
IHBsYXkgc2FmZSBpZiB5b3UgaGF2ZSBtb3JlIHNpbXBsZQ0KU29sdXRpb25zIHBsZWFzZSBkbyBy
YWlzZSBpdC4gSXQgaXMgYSBnb29kIG9wcG9ydHVuaXR5IGZvciBtZSB0byBsZWFybiBhbmQNCnBl
cnNvbmFsbHkgSSBhbSBub3QgYSBiaWcgZmFuIG9mIGVpdGhlciBkby13aGlsZSBvciB0aGUgaW50
cm9kdWNlZCAiZXJyIg0Kd2hpY2ggaXMgdXNlZCBvbmx5IGJ5IHAybV90ZWFyZG93bl9hbGxvY2F0
aW9uKGQpLCBjb25zaWRlcmluZyB0aGUNCnAybV9maW5hbF90ZWFyZG93bihkKSBoYXMgYSB2b2lk
IHJldHVybiB0eXBlLi4uDQoNClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSBpbiBhZHZhbmNlIDop
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gSmFuDQo=

