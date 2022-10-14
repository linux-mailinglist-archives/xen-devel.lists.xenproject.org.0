Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0315FEC9E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422718.668940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI5T-0007Ir-UO; Fri, 14 Oct 2022 10:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422718.668940; Fri, 14 Oct 2022 10:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojI5T-0007FX-Q7; Fri, 14 Oct 2022 10:38:43 +0000
Received: by outflank-mailman (input) for mailman id 422718;
 Fri, 14 Oct 2022 10:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojI5S-0007FR-FK
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:38:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e65f1dd-4bac-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 12:38:41 +0200 (CEST)
Received: from FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14)
 by DU0PR08MB9438.eurprd08.prod.outlook.com (2603:10a6:10:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Fri, 14 Oct
 2022 10:38:38 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::af) by FR3P281CA0067.outlook.office365.com
 (2603:10a6:d10:4b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Fri, 14 Oct 2022 10:38:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 10:38:37 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 14 Oct 2022 10:38:37 +0000
Received: from 9ed0489979c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 032564F8-BB43-45C9-B5DC-31E7B258416A.1; 
 Fri, 14 Oct 2022 10:38:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ed0489979c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 10:38:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9195.eurprd08.prod.outlook.com (2603:10a6:20b:57f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:38:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:38:29 +0000
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
X-Inumbo-ID: 5e65f1dd-4bac-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J2HKeOxmrYKsvTCikh9EMN/jW4mh4LRhp9ybBoyhvV2xkkqJtV+NnV58MNFY1vwp4MGdlwM9Q0uPg50WCX8sgujUSFhEtuWSaGCNni3Tbtp3MOYW9fe6MQ6KTy9QUq42OA6EQl5k8HtMA9deGliP0EDorwzhFw3KJzKA8Zki9ZHnokje8Hl2VEW/QKfQuwUWNkO2whZPUWizo9/Dec7muSPH54Cky1eMSKhDfCCoLN7nqIQ/tKde3aaXV5YHnWfS59q8a8r7YhuwD4BKM4eSFW4pErY2eVFXjK/wH1cPy+VrdEKx5gHLnCZjiiBqEJmq97aTyfx6fs/HkMAz1um6hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlL8+1BvEfMN6YB6D3qMgFFOOzmaFnpxC4LRI1A/U/k=;
 b=L+a01MSDQe16Jmk/Mp0I5x2+EhvXqSqHwZUkMq/SNe18q2EdTmS5LpGxXXoXjZg7+wHhmlOhSjHjRP1be5f8kvXFvO15fdF0wzbhPB99lhgmPEjxxoDlm1tnn+s/IPm+czPbSXS97WoyjKD4QZe00yayAU1xDwz70g7R+Kxsis2BW5NP9XechUm6Qre7hjxsi2XB3ZInBRt8ICteRGTkdgQbnZWyOK1oKgT3+Dd3lATjwQB+D2uJRIPIqDpUMOfwQ/N3wxsc2L4JUIUXUHXMvVqrVgq4/7S+SAmeODM7eZ/woWYyhYeWLdeCXxtH5dR9TZmLDUgP0kxfo36URXQMzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlL8+1BvEfMN6YB6D3qMgFFOOzmaFnpxC4LRI1A/U/k=;
 b=YfCtSkTn0VRqi6ufx8oMa1yzy+t0JChHd1fcGb/woDL4zrRv6n7lJBWHbzufhZwGce727N/KPppD6kq1TUuEJN6rltrdyqH5lwOk1etiJQwKALlmcD/zdgHKmZ7f3/t4ILVhpIgpprEkBtCtpC9XtTYk85vlg+8TBiHumnsyroo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THBJsdJ+Ur/JT9IqWuJ5225KIR5RadCENEH1NXR+aT0h5hNefRgK9Vc/RP5tLTIgw/b/HN4XCI/ZsPCHwsQzmGA6j9giiPbC+mXRBudO80A0auqe4CQ6lfsXVpVrYa7uqdlL/KK20rUegIHsh96Gw6dSIRk1Z8bB8la1VCcuWl261FAMnM1gX249JOIGYtbXnQ+pS05Wamed/zpjt5mgyEklZgwxIH2Q90hpC6W1nkskEQbbBn8JcD3yV2K14xgzD5lsSTw5yiLyln+WhwPrPlqMP5TA+rIoTohYUexFZTK5N8pqilp1s8yenfH0qRe3sQfmCChQJEnZA0SRopkbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlL8+1BvEfMN6YB6D3qMgFFOOzmaFnpxC4LRI1A/U/k=;
 b=I/p4BvycdOJFq8xPLh+YkZiF3+H6/DF8/JQa2HjIn/lSMNV3fKHANj7Mvd+pkshsY6XqCOMuRf6xvr5e6hMxlrIl4QpXr/3URPmsWarjTpnxWWju0iLyY+MYh9vHXsVQt+qMMCVgTXgptRSYxQmV8rCMUXjBlroZ4f1Hz2cUL6ELJCGMET0j85b5Sh1qyVydJS9SAVYY+tAuFKbz//ze2Dfn/XjRhrzRfkqktb+yKv9HoiZDW2bUquTkcr8YaqE9lOFyMr6AnR6qjnn/kWp8fsrzIxiHOzbSMltl2AG8/vwsB1XtDAr48WDOpV6EeAU6qV+9k9XQD9f86WDbcFQ2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlL8+1BvEfMN6YB6D3qMgFFOOzmaFnpxC4LRI1A/U/k=;
 b=YfCtSkTn0VRqi6ufx8oMa1yzy+t0JChHd1fcGb/woDL4zrRv6n7lJBWHbzufhZwGce727N/KPppD6kq1TUuEJN6rltrdyqH5lwOk1etiJQwKALlmcD/zdgHKmZ7f3/t4ILVhpIgpprEkBtCtpC9XtTYk85vlg+8TBiHumnsyroo=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY36RSrOIThkYtnEq9RrtWc+uYX64NnUwAgAAAd5CAAA4NgIAAAPkw
Date: Fri, 14 Oct 2022 10:38:29 +0000
Message-ID:
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
In-Reply-To: <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2E6B81E99331B344897E250B2EC5A775.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9195:EE_|VE1EUR03FT030:EE_|DU0PR08MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a579f33-f7cf-4e02-5648-08daadd040d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RBiDjzO3Sk54rJa31Mqer3zRl+8Wgz9uykAV19FpKEqlzoT1hwhpj8Li5nxJiDzBFyxPWLjBzITA0qxhdnl/KyMAuU08ETnUVuhIIqpHjXAm4ok2ScfAniiZZ2/b6qWYr5WHai1fqmCm3idNyr8VnN1N6aMvAizW3LfrAUEt/ThSOU9Nhuolgovhdp0JP5eaglSRq85ynqCL5J94C3TcJj1rg6Uw2NA9+SVvgU4jjVbav38lofRVDm7mX742c5q6M3xbpkvW+JuF0mzcdwtogQwNxskSqqkJTl7e6Q+f9cPcujkOlKO10U36sRfaDvDwWWsyqf6QUAIb1PuXhrs8MUhsv54hafHwVgcjLyTBYhihnhKrlmm878qciIpEZNCPPT4plYG0ga18ksYjozNpJ8ONP4SfPMFoQRVA8ezWIlg/jAj5DZg39zo/yhjh0gp+E0Mpl9aS98QhWwddHvDCea5mp/0T2AvS5cYwYY5e/N3ssAu1lVZtPscVGNVAHk8ju9gRr2crRnjWeJxEhptpQGUicZn9i7M8j6dxkHPXuf3dBe5FVmjmcbbLNlEe6MbFFjZJpmZp0ub1uHmTs8RB5qRqvgsBWvN4XiSeR7gvj8xXg5lxarGzfMuu7f8oWrUUzJQYZHJYVO3ra8aQTn+paXxXRBxrQW4hV62Qc8cH1KMIsnzuZG8RBOSeEC4HJamEZf5rY4JExNQj5KWFteBnPYwKfJ6VZy8LUanswZuk3+ymoJq5ofIVbVmlMyYkGLZNRaI8ZoTZnLcMMdYaIl3GVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(478600001)(54906003)(316002)(110136005)(71200400001)(66476007)(64756008)(66556008)(66446008)(8676002)(66946007)(4326008)(76116006)(186003)(52536014)(9686003)(26005)(8936002)(41300700001)(5660300002)(122000001)(6506007)(7696005)(2906002)(38100700002)(83380400001)(55016003)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9195
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89378802-0091-4de4-7f75-08daadd03bee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Qy1Fv4PfS/mghpkAVWgljTto5VVR3NBujWsTWcvdkiq8hX3fzoWfswHY6pb4XZ4/GTeA/ntQnA7toByRkn3gw1cxnlx1Q9PkuiZv0PrshLeP3eD/s1I5Eg3GB7gDxhivLPBErnbt/YZ7LctGlXZF+qDJkz4z31LHraBBet+lZDPmkYw0vDt+tMHpMsAg/KcE55oCfFHVNKnPQJ/B+iom7Xne3JXIaSCGOdbLp3fYBlrVKilHS1CWwdxxmrWyQ1K0pTn/qNMhjIAsa2XJDod0qn/UYYKSASDaW8VTO4OVQg1fUTD75fSczs39EjDgx55BBl8N3k4K6oH3slvZAbP5E550GfVKRS4VRgoGHQmJEm8Gv1V7FQEupBDOZ4ugw5+P1/r5lQ4EXZ2TPLHF8qjDATWuruhc/1LzEq3YHGm5fbZZawnGps6pGqlf9nCWsmGtXEgDS/f1y5kFgQRxLDv0ItzADYgoUTNzWk2fXeyFQP6Y3brb40P3Kz789PTwgT8w3V7RP1eMkJs0717mll/XAwZT54F3Y3u4mWH9rDuC8NFLIzbLWLOwz5hgKb71D+Wbk41/pTBDeBSS5x5g7wci/U5AfZIiOCU2c9tAYzPVajsrrg4JZVqJZCKX6Y4K6r6JqBlCdRsWIQguwNCPi9yBZFZxYaF/iz96zO0RsCk2MI7DZtyE+SBGQz8MYx0Vr8tpnk0mDUJSIdo3NV7pfHc9rXQ20jKUnTXpv0Hd2BSOSEiKe6meGhzKoG+Z8ZTDlSBRz9+YbWGYGEdxkW1XJDZ9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(82740400003)(36860700001)(81166007)(356005)(40460700003)(33656002)(41300700001)(110136005)(186003)(478600001)(26005)(8936002)(55016003)(2906002)(4326008)(70206006)(316002)(5660300002)(54906003)(70586007)(9686003)(83380400001)(86362001)(7696005)(336012)(6506007)(40480700001)(52536014)(47076005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:38:37.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a579f33-f7cf-4e02-5648-08daadd040d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9438

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhlbi9h
cm06IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9kb21h
aW5fY3JlYXRlKCkNCj4gPj4+ICsgICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsN
Cj4gPj4+ICsgICAgcmMgPSBwMm1fc2V0X2FsbG9jYXRpb24oZCwgMTYsIE5VTEwpOw0KPiA+Pj4g
KyAgICBzcGluX3VubG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ID4+PiArICAgIGlmICgg
cmMgIT0gMCApDQo+ID4+PiArICAgICAgICBnb3RvIGZhaWw7DQo+ID4+DQo+ID4+IFB1dHRpbmcg
dGhpcyBsZXZlbCBvZiBrbm93bGVkZ2UgaGVyZSBmZWVscyBsaWtlIGEgbGF5ZXJpbmcgdmlvbGF0
aW9uIHRvDQo+ID4+IG1lLiBNeSBmaXJzdCBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIG1vdmUgdGhp
cyBjYWxsIHNvbWV3aGVyZSB1bmRlcg0KPiA+PiBwMm1faW5pdCgpLg0KPiA+DQo+ID4gVGhhdCBp
cyBkZWZpbml0ZWx5IHBvc3NpYmxlLiBJZiBKdWxpZW4gb3Igb3RoZXIgQXJtIG1haW50YWluZXJz
IGFyZSBub3QNCj4gPiBhZ2FpbnN0IHRoYXQgSSBhbSBoYXBweSB0byBtb3ZlIHRoaXMgdG8gcDJt
X2luaXQoKSBpbiB2My4NCj4gSSB1bmRlcnN0YW5kIGJvdGggb2YgSmFuIGFuZCB5b3VyIGNvbmNl
cm4uIEkgZG9uJ3QgcmVhbGx5IGhhdmUgYSBzdHJvbmcNCj4gb3BpbmlvbiBlaXRoZXIgd2F5Lg0K
PiANCj4gWW91IGFyZSB0aGUgYXV0aG9yIG9mIHRoZSBwYXRjaCwgc28gSSB3aWxsIGxldCB5b3Ug
Y2hvc2UuDQoNClRoZW4gcDJtX2luaXQoKSwganVzdCB3YW50IHRvIG1ha2UgZXZlcnlvbmUgaGFw
cHkgOikpKQ0KDQo+IA0KPiA+Pj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnAybV90b3RhbF9w
YWdlcyAhPSAwICkNCj4gPj4+ICsgICAgew0KPiA+Pj4gKyAgICAgICAgc3Bpbl9sb2NrKCZkLT5h
cmNoLnBhZ2luZy5sb2NrKTsNCj4gPj4+ICsgICAgICAgIHAybV9zZXRfYWxsb2NhdGlvbihkLCAw
LCBOVUxMKTsNCj4gPj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2Nr
KTsNCj4gPj4+ICsgICAgICAgIEFTU0VSVChkLT5hcmNoLnBhZ2luZy5wMm1fdG90YWxfcGFnZXMg
PT0gMCk7DQo+ID4+PiArICAgIH0NCj4gPj4NCj4gPj4gSXMgaXQgaW50ZW50aW9uYWwgdG8gbGFy
Z2VseSBvcGVuLWNvZGUgcDJtX3RlYXJkb3duX2FsbG9jYXRpb24oKSBoZXJlPw0KPiA+DQo+ID4g
WWVzLCBBRkFJQ1QgcDJtX3RlYXJkb3duX2FsbG9jYXRpb24oKSBpcyBwcmVlbXB0aWJsZSBhbmQg
d2UgZG9uJ3Qgd2FudA0KPiA+IGFueSBwcmVlbXB0aW9uIGhlcmUuDQo+IA0KPiBMaWtlIEphbiwg
SSB3b3VsZCBwcmVmZXIgaWYgd2UgY2FuIGF2b2lkIHRoZSBkdXBsaWNhdGlvbi4gVGhlIGxvb3AN
Cj4gc3VnZ2VzdGVkIGJ5IEphbiBzaG91bGQgd29yay4NCg0KSSBhbSBhIGxpdHRsZSBiaXQgd29y
cmllZCBhYm91dCB0aGUgLUVOT01FTSwgaWYgLUVOT01FTSBpcw0KcmV0dXJuZWQgZnJvbSBwMm1f
dGVhcmRvd25fYWxsb2NhdGlvbihkKSwgSSB0aGluayB3ZSBhcmUgaW4NCnRoZSBpbmZpbml0ZSBs
b29wLCBvciBkaWQgSSBtaXNzIHVuZGVyc3Rvb2QgdGhlIGxvb3AgdGhhdCBKYW4gcmVmZXJyZWQN
CnRvPw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0K
PiBKdWxpZW4gR3JhbGwNCg==

