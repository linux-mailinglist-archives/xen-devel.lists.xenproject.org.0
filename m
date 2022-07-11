Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16356D744
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 10:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364918.594892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoKx-0006GU-2k; Mon, 11 Jul 2022 08:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364918.594892; Mon, 11 Jul 2022 08:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoKw-0006DR-VE; Mon, 11 Jul 2022 08:00:10 +0000
Received: by outflank-mailman (input) for mailman id 364918;
 Mon, 11 Jul 2022 08:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTyw=XQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oAoKu-0006DK-QE
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 08:00:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c693e8-00ef-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 10:00:06 +0200 (CEST)
Received: from AS8PR04CA0102.eurprd04.prod.outlook.com (2603:10a6:20b:31e::17)
 by AS8PR08MB6961.eurprd08.prod.outlook.com (2603:10a6:20b:344::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 08:00:04 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::e7) by AS8PR04CA0102.outlook.office365.com
 (2603:10a6:20b:31e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Mon, 11 Jul 2022 08:00:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Mon, 11 Jul 2022 08:00:03 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Mon, 11 Jul 2022 08:00:02 +0000
Received: from 07bb5164edfc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74EDF590-346B-4F79-A45C-CC349AB7A089.1; 
 Mon, 11 Jul 2022 07:59:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07bb5164edfc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 07:59:56 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by GVXPR08MB7798.eurprd08.prod.outlook.com (2603:10a6:150:4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 07:59:53 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 07:59:53 +0000
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
X-Inumbo-ID: 79c693e8-00ef-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HudwDHVgPc6zorNXrKjIoKrwXqEeNLnccv7MYl8/hrlLKHpY2pzvl3N0LNq1K5koE1yCCPjuzM5PUnj+SQK6/DI0vvrf87dU8Ted+9xCQ35uRqodUOsu4VDdbNcGvB7HN4gHMIVhUPBGSZuJPs0EDRG4EkSG+VsJLBOVYwJ3rgO1OxNmYUbRUz76cjBzUB9tiYteYBdCRwoa9w9M75e1xGSmn+fFEMcHyiQC25lP36fvr3WgE5L3fAzFnysN/+OabD/QXED3tU+n68s6QXKw7z8qbaoFtgm1HW2mJqi9rXcpGO+ks5+cBUSlP6fxXcTgyi2Hdi7ycyvd52Ti/Ohe/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO/HhnIGAYjzAOgdXEWYWnm0JHwl981Pp2F5LU/7NdU=;
 b=WvwyOCEGS3j42jfTZtOe3gc4PC9e8kx6znUQsiTi08tN7L/w6X+Wb1W5we3MXq8qPONsrmBrid+2tYa3t+oiUxlD6LTEe98ldvIAHrPgaBuhvzuk60EHoevYWTYxGsOZPp9N0mMWaCO9L9GaLIvm2z6WrI4b81TMyJVFwgwR7WhwSLXLFPMww25vlK+/kO7BjSh4zTCjt7kDy/PLWlf3Jlmq6MeMJjvDXJySBE3Wv6OWaZfeDbQhEV/A8wjisk4X9ayz9Jn5zMz3Te7VtzhMquL1GxhDdpPUQJKuhTbogKQc177yRbNAJTblW/6SniqlUrmUBDZK8QzANlA7wDQGhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO/HhnIGAYjzAOgdXEWYWnm0JHwl981Pp2F5LU/7NdU=;
 b=kffRdIC6DtWCHWjtHjT3S2IYF8qLvfX0Qj4gcUX6E7v2s0YT+odAfm2rmQa/AM9OaATP8/RsWjijSshvoXDXJ1edc+A9MYHHgOFDt4mv6RFDU3Kum9+Npf2tV5pib+w1NiKj00ajzZaWL4mLi5nSmeQR8vxM0BpYbQxLA9+EMOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd+sTbzDCRD/TRhb71GIDs0J70/YVbysn/AbiYvueXaODWY7jTKHdb3SgulUnH68eeM6/JtLF5NF6x4NW4wvX74a09rMI452A0OwTBJumjxy9dC/qGUuwE8CF+gwADb4ReauNzpvVnuOZsNQVN0Ug/yT4zUrs26fSPEIDKCBoLHWk7vYNczlRJPmJFv9qznxlw5IODr0Q8o+SY5ZNwAXFpLL4lYNK8HAEk2epCpk+W4BoSP1EAHMMjCQ6xxT8mVkYazO0Fe2yFRuicZhVJsiVVdmMWC3mQIwhiST9z7wR8lkhD5w3L3smFhaMKJ4Kuz7kBEji3qsHG08yW2ReKFiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO/HhnIGAYjzAOgdXEWYWnm0JHwl981Pp2F5LU/7NdU=;
 b=eH8WdD8g5CQxAdHPvUJU1v39+DErp2WKcvWbKZp08Q441y2pS8Ck2puYXUdTyAHvlMkFgWj//i81x2x7LwtyRrvflYfzVeWpGUluk9j12H1kx8pFOM4C9/ndj956m6zRNY8T14Z94zh/orX8LDWkVQk0qNoOBWd7ST1tD9DgCoBTrREJw2A3gFFMLP4zsNgKNDECTuQDVUWAapQrCFNhqKamBZIkyEXY+jFtxtyXFuTw01nrXGchoxaW1rghP0S6vfjh1sdKlGgMwFAT5s5HS0jDCSEjiMc7JMSql4ex+yp7DIzhZd0WfGwuekiQ5oGmvd/vYxZWJhC/p7xOXRBFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO/HhnIGAYjzAOgdXEWYWnm0JHwl981Pp2F5LU/7NdU=;
 b=kffRdIC6DtWCHWjtHjT3S2IYF8qLvfX0Qj4gcUX6E7v2s0YT+odAfm2rmQa/AM9OaATP8/RsWjijSshvoXDXJ1edc+A9MYHHgOFDt4mv6RFDU3Kum9+Npf2tV5pib+w1NiKj00ajzZaWL4mLi5nSmeQR8vxM0BpYbQxLA9+EMOY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index:
 AQHYhGRGiM2+sN9ON0uL+hMDdx46E61e+NuAgAApAYCADsZBcIAENhcAgAAuPSCAAn2ogIAD+Wug
Date: Mon, 11 Jul 2022 07:59:53 +0000
Message-ID:
 <DU2PR08MB7325C84F1D3DAE02AC26AAD5F7879@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-8-Penny.Zheng@arm.com>
 <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
 <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2207061647160.2354836@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325C9A6011B877DDF09524FF7839@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2207080938280.2354836@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2207080938280.2354836@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1579FEAE9BA8AF4FA53EEA214587A7A7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2c4dd65d-9767-4d85-4c8b-08da63135c70
x-ms-traffictypediagnostic:
	GVXPR08MB7798:EE_|AM5EUR03FT061:EE_|AS8PR08MB6961:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7RKa0i0B5gMkpBLGSXcc5dLDOClQ3lPpGBXuUEUXIRf5E3fwJ2y+RxdwtBpJGxcICLCudC9mKLAszKDnmRIuzTW1h5P+T2acXbRpeTYpOJg4NUy4fm8wQZW7GOWzCWEMAY8knrZmYeWPgT7XXYEJz2c0QJD/htjC6+1Y73OaD25JpHTwvwce+GC59LB9e4ObRk42jKzkxOWnhWGM+Fac7lq9aMuxhToKCcwgWCUyDYn7XxbStCboWADAr91//OjZYIydxRFGd2p5xVFp18/LpztTWjZAMalE09H2wMg0t+d16z/bWDRWEYZ1SjlzYS7gbTLb3LM1sVFyoe4kcXotKn3YpRUJv51ZrUXVFjngm/1fz/u8lAwelmFCvMtG2lbMqMTdLwuuIoxNW8o7IGuOnVHiGPwQBEq9ZY+V6TPe3fuHue4cfFPsgOGDfiFnHunKu6/od9aiFnraH3Eh8EcPMG2KD8hb1JfIfraR2PcTRvR75XC6xBLsghXWd7csMvwbWMVTfSsUNcxsznODG9O9duSyPPB7ne+VowsVDFdJ71Alanm93AeZ3I1Ek7pFlghCvkj/NYuCrR2MDIHCqBolZu73QKkEK1i4wjDwO6x8BpK8Dd1zqsBz5XgesAUzFCQMk8mZdooIk2DCWTYAop4cYbK5YKNL7InYr8tRhI6r0slXh9U0MTppnxn7+7qmt0C9scSee0yEqkGnwsgPyrwRRt0+gI1R3hTmoNsWo4c36CtHr1Ltg91VYDsHfGNpcQ9tlVuFAq7hvin/7G8rG/SWHl0o+rX+j1BtWqpfLLhzGRBXZg8f/NufboNwdfiwjSvP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(54906003)(478600001)(316002)(6916009)(6506007)(2906002)(52536014)(71200400001)(7696005)(41300700001)(64756008)(66446008)(66556008)(55016003)(53546011)(66946007)(76116006)(66476007)(5660300002)(30864003)(8936002)(122000001)(38100700002)(38070700005)(86362001)(26005)(33656002)(186003)(83380400001)(4326008)(8676002)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7798
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc321019-cec9-4e3e-fc28-08da631356b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WbLN+AVikF/9Xn7TMQFv8iPHASHFtFpkyHrYiAyaOwZhrTJM3TkdfuHy4o0D8TKRxIc+WpN5aR56zCm9Rzs4UbVNkMHIQAGxJPj8bRbAKIa/NFfj+VcsQ2x5BtH6Lar3Px6VwawmpZlHvuTzE/SBoDanezXYSvBV1/uawVsh96P/mAWP3OOQiK8pYOabgLrC1adb6J8Zn+TtFUHxfHGyhnxRQ9LrYMoTgdn0HzZhgz27mzViZuzyRYEuIh6gss4rn/NCuXII44IlEzZBoWCLrEbt5LuX1jTbGDOTbRaiOcRKKDX8QDlc+pdlDLHrP0W3FmCpV95W6wqRJCDdQBupF4VwqiOFAikLGopvXzcU2SU4y++ykLKuYAr4Tx+dSVUtPvLtDJnuycYsoXqeU2RNfPs0PwDPUit/lIfIhWdfyQuVMtvRowbLvM1wzK21gtMrxxlK7EiCngv2JU7/to2kuejNCifCYPEmm4jrHqCq0OnYv9FIDSnA658r+WkpjRetq1nPt7dpYvLGkXfq9dPttCBPD3YEYxsPFzfTjyclTGIr3yBm/9NqBi6nEMOFz0V8bOULEpjSMNGJTVx3zrd4/+TB+jW2ryZHZeoJkxmi91IRxbXq6PS3L1uds/tKJUIwTMIHGcPrJ17yGoRfPHXB9C+ErrzLme8n8tPxaXHiIQW/kAXvJw4jpSreej8QMklkX9yC2gr/YO79FtoqmSHV8sULg15pyNNtNLk8OSzZGgVRB1Kk+ByJQdoUvJY3q8fWE7gj8Te8OvlF51hXKbjN/FDE7h5mKxfYWCMz+54sdBAypi/nZySJwZQ517Z9eyFP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(356005)(81166007)(40480700001)(47076005)(36860700001)(336012)(83380400001)(54906003)(8936002)(55016003)(6862004)(5660300002)(82310400005)(316002)(478600001)(30864003)(82740400003)(6506007)(52536014)(4326008)(53546011)(8676002)(186003)(2906002)(9686003)(26005)(7696005)(41300700001)(86362001)(40460700003)(70586007)(70206006)(107886003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:00:03.1800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4dd65d-9767-4d85-4c8b-08da63135c70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6961

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Saturday, July 9, 2022 12:41 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>; julien@xen.org; xen-
> devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; Bertrand
> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
> device tree
>=20
> On Thu, 7 Jul 2022, Penny Zheng wrote:
> > Hi Stefano and julien
> >
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: Thursday, July 7, 2022 7:53 AM
> > > To: Penny Zheng <Penny.Zheng@arm.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> > > <julien@xen.org>; xen-devel@lists.xenproject.org; Wei Chen
> > > <Wei.Chen@arm.com>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>;
> > > Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in
> > > guest device tree
> > >
> > > On Mon, 4 Jul 2022, Penny Zheng wrote:
> > > > Hi Stefano and Julien
> > > >
> > > > > -----Original Message-----
> > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Sent: Saturday, June 25, 2022 5:57 AM
> > > > > To: Julien Grall <julien@xen.org>
> > > > > Cc: Penny Zheng <Penny.Zheng@arm.com>;
> > > > > xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
> > > Stefano
> > > > > Stabellini <sstabellini@kernel.org>; Bertrand Marquis
> > > > > <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > > > > <Volodymyr_Babchuk@epam.com>
> > > > > Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes
> > > > > in guest device tree
> > > > >
> > > > > On Fri, 24 Jun 2022, Julien Grall wrote:
> > > > > > On 20/06/2022 06:11, Penny Zheng wrote:
> > > > > > > We expose the shared memory to the domU using the
> > > > > > > "xen,shared-
> > > > > memory-v1"
> > > > > > > reserved-memory binding. See
> > > > > > > Documentation/devicetree/bindings/reserved-
> memory/xen,shared
> > > > > > > -
> > > > > memory.
> > > > > > > txt in Linux for the corresponding device tree binding.
> > > > > > >
> > > > > > > To save the cost of re-parsing shared memory device tree
> > > > > > > configuration when creating shared memory nodes in guest
> > > > > > > device tree, this commit adds new field "shm_mem" to store
> > > > > > > shm-info per domain.
> > > > > > >
> > > > > > > For each shared memory region, a range is exposed under the
> > > > > > > /reserved-memory node as a child node. Each range sub-node
> > > > > > > is named xen-shmem@<address> and has the following
> properties:
> > > > > > > - compatible:
> > > > > > >          compatible =3D "xen,shared-memory-v1"
> > > > > > > - reg:
> > > > > > >          the base guest physical address and size of the
> > > > > > > shared memory region
> > > > > > > - xen,id:
> > > > > > >          a string that identifies the shared memory region.
> > > > > > >
> > > > > > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > > ---
> > > > > > > v5 change:
> > > > > > > - no change
> > > > > > > ---
> > > > > > > v4 change:
> > > > > > > - no change
> > > > > > > ---
> > > > > > > v3 change:
> > > > > > > - move field "shm_mem" to kernel_info
> > > > > > > ---
> > > > > > > v2 change:
> > > > > > > - using xzalloc
> > > > > > > - shm_id should be uint8_t
> > > > > > > - make reg a local variable
> > > > > > > - add #address-cells and #size-cells properties
> > > > > > > - fix alignment
> > > > > > > ---
> > > > > > >   xen/arch/arm/domain_build.c       | 143
> > > > > +++++++++++++++++++++++++++++-
> > > > > > >   xen/arch/arm/include/asm/kernel.h |   1 +
> > > > > > >   xen/arch/arm/include/asm/setup.h  |   1 +
> > > > > > >   3 files changed, 143 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > > > b/xen/arch/arm/domain_build.c index 1584e6c2ce..4d62440a0e
> > > > > > > 100644
> > > > > > > --- a/xen/arch/arm/domain_build.c
> > > > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > > > @@ -900,7 +900,22 @@ static int __init
> > > > > > > allocate_shared_memory(struct domain *d,
> > > > > > >       return ret;
> > > > > > >   }
> > > > > > >   -static int __init process_shm(struct domain *d,
> > > > > > > +static int __init append_shm_bank_to_domain(struct
> > > > > > > +kernel_info
> > > *kinfo,
> > > > > > > +                                            paddr_t start, p=
addr_t size,
> > > > > > > +                                            u32 shm_id) {
> > > > > > > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > > > > > > +        return -ENOMEM;
> > > > > > > +
> > > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start =3D
> start;
> > > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size =3D si=
ze;
> > > > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id =3D
> > > shm_id;
> > > > > > > +    kinfo->shm_mem.nr_banks++;
> > > > > > > +
> > > > > > > +    return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int __init process_shm(struct domain *d, struct
> > > > > > > +kernel_info *kinfo,
> > > > > > >                                 const struct dt_device_node *=
node)
> > > > > > >   {
> > > > > > >       struct dt_device_node *shm_node; @@ -971,6 +986,14 @@
> > > > > > > static int __init process_shm(struct domain *d,
> > > > > > >               if ( ret )
> > > > > > >                   return ret;
> > > > > > >           }
> > > > > > > +
> > > > > > > +        /*
> > > > > > > +         * Record static shared memory region info for later=
 setting
> > > > > > > +         * up shm-node in guest device tree.
> > > > > > > +         */
> > > > > > > +        ret =3D append_shm_bank_to_domain(kinfo, gbase,
> > > > > > > + psize,
> > > shm_id);
> > > > > > > +        if ( ret )
> > > > > > > +            return ret;
> > > > > > >       }
> > > > > > >         return 0;
> > > > > > > @@ -1301,6 +1324,117 @@ static int __init
> > > make_memory_node(const
> > > > > > > struct domain *d,
> > > > > > >       return res;
> > > > > > >   }
> > > > > > >   +#ifdef CONFIG_STATIC_SHM
> > > > > > > +static int __init make_shm_memory_node(const struct domain
> *d,
> > > > > > > +                                       void *fdt,
> > > > > > > +                                       int addrcells, int si=
zecells,
> > > > > > > +                                       struct meminfo *mem)
> > > > > >
> > > > > > NIT: AFAICT mem is not changed, so it should be const.
> > > > > >
> > > > > > > +{
> > > > > > > +    unsigned long i =3D 0;
> > > > > >
> > > > > > NIT: This should be "unsigned int" to match the type of nr_bank=
s.
> > > > > >
> > > > > > > +    int res =3D 0;
> > > > > > > +
> > > > > > > +    if ( mem->nr_banks =3D=3D 0 )
> > > > > > > +        return -ENOENT;
> > > > > > > +
> > > > > > > +    /*
> > > > > > > +     * For each shared memory region, a range is exposed und=
er
> > > > > > > +     * the /reserved-memory node as a child node. Each
> > > > > > > + range sub-node
> > > > > is
> > > > > > > +     * named xen-shmem@<address>.
> > > > > > > +     */
> > > > > > > +    dt_dprintk("Create xen-shmem node\n");
> > > > > > > +
> > > > > > > +    for ( ; i < mem->nr_banks; i++ )
> > > > > > > +    {
> > > > > > > +        uint64_t start =3D mem->bank[i].start;
> > > > > > > +        uint64_t size =3D mem->bank[i].size;
> > > > > > > +        uint8_t shm_id =3D mem->bank[i].shm_id;
> > > > > > > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0=
 */
> > > > > > > +        char buf[27];
> > > > > > > +        const char compat[] =3D "xen,shared-memory-v1";
> > > > > > > +        __be32 reg[4];
> > > > > > > +        __be32 *cells;
> > > > > > > +        unsigned int len =3D (addrcells + sizecells) *
> > > > > > > + sizeof(__be32);
> > > > > > > +
> > > > > > > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > > > > > > mem->bank[i].start);
> > > > > > > +        res =3D fdt_begin_node(fdt, buf);
> > > > > > > +        if ( res )
> > > > > > > +            return res;
> > > > > > > +
> > > > > > > +        res =3D fdt_property(fdt, "compatible", compat,
> sizeof(compat));
> > > > > > > +        if ( res )
> > > > > > > +            return res;
> > > > > > > +
> > > > > > > +        cells =3D reg;
> > > > > > > +        dt_child_set_range(&cells, addrcells, sizecells,
> > > > > > > + start, size);
> > > > > > > +
> > > > > > > +        res =3D fdt_property(fdt, "reg", reg, len);
> > > > > > > +        if ( res )
> > > > > > > +            return res;
> > > > > > > +
> > > > > > > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"-
> > > >%#"PRIx64"\n",
> > > > > > > +                   i, start, start + size);
> > > > > > > +
> > > > > > > +        res =3D fdt_property_cell(fdt, "xen,id", shm_id);
> > > > > >
> > > > > > Looking at the Linux binding, "xen,id" is meant to be a string.
> > > > > > But here you are writing it as an integer.
> > > > >
> > > > > Good catch!
> > > > >
> > > > >
> > > > > > Given that the Linux binding is already merged, I think the
> > > > > > Xen binding should be changed.
> > > > >
> > > > > We would be compliant with both bindings (xen and linux) just by
> > > > > writing shm_id as string here, but if it is not too difficult we
> > > > > might as well harmonize the two bindings and also define
> > > > > xen,shm-id as a
> > > string.
> > > > >
> > > > > On the Xen side, I would suggest to put a clear size limit so
> > > > > that the string is easier to handle.
> > > >
> > > > I've already made the xen,shm-id parsed as a string too, seeing
> > > > the below
> > > code:
> > > > "
> > > >     prop_id =3D fdt_get_property(fdt, node, "xen,shm-id", NULL);
> > > >     if ( !prop_id )
> > > >         return -ENOENT;
> > > >     shm_id =3D simple_strtoul(prop_id->data, NULL, 10);
> > > >     if ( shm_id >=3D NR_MEM_BANKS )
> > > >     {
> > > >         printk("fdt: invalid `xen,shm-id` %lu for static shared mem=
ory
> node.\n",
> > > >                shm_id);
> > > >         return -EINVAL;
> > > >     }
> > > > "
> > > > The size limit is smaller than 256, just as stated in doc:
> > > > "
> > > > - xen,shm-id
> > > >
> > > >     A string that represents the unique identifier of the shared me=
mory
> > > >     region. The maximum identifier shall be "xen,shm-id =3D 255".
> > > > "
> > > > Hope this fits what both of you suggested~~~
> > >
> > > Yes. I think supporting arbitrary strings like "my-shared-mem-1"
> > > would be nice-to-have but I wouldn't make it a hard requirement.
> > >
> >
> > Oh, the example "my-shared-mem-1" really expands my mind, I think I
> > understand what you and Julien referred as free form string, which
> > shall not be limited to only numeric number... thanks!!!
> >
> > You were suggesting a strict limit on the number of characters, TBH, I
> > have no clue What the standard is here. Any suggestions?
> >
> > If considering padding, maybe 19?
> > "
> > struct membank {
> >     paddr_t start;
> >     paddr_t size;
> >     bool xen_domain; /* whether the memory bank is bound to a Xen
> > domain. */ #ifdef CONFIG_STATIC_SHM
> >     char shm_id[19];
> >     unsigned int nr_shm_borrowers;
> > #endif
> > };
> > "
>=20
> Yeah I suggested a strict limit on the number of chars so that we could
> embed the string in struct membank. I would pick 16 characters which is
> equivalent to two uint64_t in terms of memory usage.
>=20
>=20

Hmm, Am I calculating wrongly? When it reaches to nr_shm_borrowers, it
requires 4 bytes-aligned, and if it is 16 characters, it will ask extra 3 b=
ytes
to do the padding(8 + 8 + 1 + 16 + "3"). This is the reason why I chose 19,=
 to
make use of every byte.

Or maybe 16 characters is applied to be the multiple orders of 2, which has=
 more
flexibility for newly added field?

Just out of curiosity why you choose 16 over 19, hope it doesn't bother too=
 much~

> > > "255" as a string would match Linux's requirements for xen,id.
> >
> > I will use your example "my-shm-mem-1", I think its better for users
> > to understand, at least for me...
>=20
> +1

