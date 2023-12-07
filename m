Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51728096DB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650256.1015566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOHy-0007Kr-Re; Fri, 08 Dec 2023 00:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650256.1015566; Fri, 08 Dec 2023 00:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOHy-0007Ie-N7; Fri, 08 Dec 2023 00:00:18 +0000
Received: by outflank-mailman (input) for mailman id 650256;
 Fri, 08 Dec 2023 00:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBOHw-0007Fc-CY
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:00:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23d612d-955c-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:00:14 +0100 (CET)
Received: from DB8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:10:110::20)
 by VE1PR08MB5759.eurprd08.prod.outlook.com (2603:10a6:800:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 00:00:05 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::7e) by DB8PR04CA0010.outlook.office365.com
 (2603:10a6:10:110::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 00:00:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 00:00:04 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Fri, 08 Dec 2023 00:00:04 +0000
Received: from 77b1333ed8ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2EFB638-849B-4698-93B3-C8E09287AA2B.1; 
 Thu, 07 Dec 2023 23:59:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77b1333ed8ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Dec 2023 23:59:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9447.eurprd08.prod.outlook.com (2603:10a6:102:2e5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 23:59:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 23:59:54 +0000
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
X-Inumbo-ID: c23d612d-955c-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WKR2FOYEjvHnOU06f6NYXw8c4FBXuq8w94hdgwxg9FxI6Y5uoKv9EHnpNEdQAHDdAGG+rTkUlM6B0WGdIZKQLRx/rlkLn4CRcwiVBzAdh/Zj7u7tFZfW6GRQAYf0i1bvXRvA22GAURqrZ33XGpNp8jImspbFCdbUUInCPQEBwB+HWqtjehecnSvzVu0KFO4WL8zJxCBKQSqmOfVMgEJ+GEUBk1RPeJDR5R63TqJTS8YA53jz/b9VkceTwczyptCI9lLsoNjiMRHQ+C2V1vQugLyFGrvfI+bVEK2iQzpbhGJpUjlAHlUuDkaRFGgdOBICIB81u6l07Nm+LebGTTGbdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boPBa4VejgfHo42zyExBK0i5u1UMVZmfKNpu9PWdb1o=;
 b=OQKS9EwdVmo+qiY1hhHVZqMkSfSi1oBncojh91cWCPnWqL9khnLV25CbzQwYRQ7aS1z8+Is0Xnf9AOiyJ7GAnHnf+WK4RIxksSr1fPafMgKFHcrFuze9y0WGuWg1cpwZZ10w9uXUFy8f01f8H4snVcylrroZQWZfOmYxnLlG7u9tBD6y5x+syrpWXyPsPDLVjNGYczhY8TTS9nfepPfk0y+RuBwe3ESeSz22WB8QYcYHhP+ifj3A5zGKdzfWBG1b6ii6xXMLCH+Mv9oTMxlL9PkSk/LIX8yGXxDSYxNDoCBmi5CEk4NbzrFcH03qtjad9b4kgViG6PyjVW8cONC6tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boPBa4VejgfHo42zyExBK0i5u1UMVZmfKNpu9PWdb1o=;
 b=KjbKbFEStTmwPF6I5rnkRTC1kqx0hc2B32v4WVkq8EAToc8hOXZyP7TeovmYv5O87Vr8WqjXPvCNsETb0Ds1lymsvFw8PfhJB7rkNV8xO4fz29xlqLvIRJU886wWnDPDVsNZ60OTWkfTigAndYZDhQ2G0nJJdgZ9JI5sNyadu/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48b4da49aee17f2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fM5OXgM0LqlfVas/k7bYSQfh6aYgsf3ZXvRNBgs3Z1MC6MJkoRzyN2enYxeg2cy6XiuyIVImuY3VznBX/eMAKHJC1BkcGP+1ido/8tFgawDYBnLvloUfTdLaZoAO2zqnVKFV7+VfigPu0aEuouLGT7xqSVuX4KDGdivFO2HcxJicxHo/8aN4jzmJWrsqacmlOHeJwIzh/rVspnJMAtw8BEnL8gVp5zuR+Vq7HIPSPO3gEwTqrCJ/dwTHiUfkaJeH6nQe0ZfS4w4/Ve0kRFRyIRbX29mB86CxBCCwOkf0nPoKDAq+7VCWKpAGRr81J6Et3Gvio5IJfXiLJX8JSCANhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boPBa4VejgfHo42zyExBK0i5u1UMVZmfKNpu9PWdb1o=;
 b=e1HavqCvVktMQVvrjwMwbLbeIgxzdxG8o2SWh6z1nCFC0hxex8QlpvQ5yk+MXRXVugfEwpmSK/b7HlQiWFCNG8+aybInmWEOVgSjxv/smWmnK+fHa3gsZrKeT13uBbI2UAsVYe9yqO9GQ9L/JgH3wxxc+C2E1H6kNiSrRQz0uY+/czy1yiiBBx17Y+Bt9C9HszFTnk/m+1rHXI/lQ4odjN3+CYik860ztwHjDYBgMZB1SrXty9TNcT/CJrIn/dP1S2Llwqy6tWNR6wGH4pMztFAVmTXCC7TAKg24B0Otm4Pmej6q/yAwixOnQKcXiRAZ736zmXyAFZP59olgt5tY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boPBa4VejgfHo42zyExBK0i5u1UMVZmfKNpu9PWdb1o=;
 b=KjbKbFEStTmwPF6I5rnkRTC1kqx0hc2B32v4WVkq8EAToc8hOXZyP7TeovmYv5O87Vr8WqjXPvCNsETb0Ds1lymsvFw8PfhJB7rkNV8xO4fz29xlqLvIRJU886wWnDPDVsNZ60OTWkfTigAndYZDhQ2G0nJJdgZ9JI5sNyadu/A=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Thread-Topic: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Thread-Index: AQHaKSldo7hFZj4qPEe+Lgu8crXqgbCeKRCAgAAn3QCAAC+lgA==
Date: Thu, 7 Dec 2023 23:59:54 +0000
Message-ID: <581CA0BA-02BD-4696-A0E3-BE58568C2479@arm.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
 <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
 <38ed531570ef67b6b1f95ba5fa44bb37821bca9e.camel@gmail.com>
In-Reply-To: <38ed531570ef67b6b1f95ba5fa44bb37821bca9e.camel@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9447:EE_|DU6PEPF0000A7DF:EE_|VE1PR08MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: a476220d-e480-432a-9fc8-08dbf780a1d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dD+dqSSNJUdDAS8OpP9qbVIOKxS+0+xXhEwMRdWOS/yOv/+AFn50CpWBVicgLAI7jZ6+w2s1eVRfMj/6TreqhlT7EoYuHSNVFpLZ6FWg6cKBpMLdHEE0/s9QouTsqpUcVAuwl1OwrHU1hzG1BjmP55kRkFbc3twuGfzntyd/p+EgtAbCSV8um76hnZT3uyTqz186NEXbvhJpubqqyDYZkWNbZTwJsYsp67TrIFdjon7MkK9ZlJDfG1iT2f6OdVBHI4GmrLTiZNTiT5lX1H4hDcqIeWUyYkMzFqDKjgWJGvgRxBNRZAu9gkl8W99dE8ps5ac4oQPD+EByMSNNfLGEaKn8QWfbW3XWm/OpuGuvOZ598uHZvWe63PT+EnX/O04UNOUMnJ/z23f4UHI4OuHju0yKXb0pVe10BA0e1KXzcjKFw0PIBAn3w4JQkXj9StsdSUscxn+xtz1panb5VTcEp2h/ka2j10ZCymmNgn+ALmrtJD0tTTsFvGEX0daUHsF/uGdo1nq0bHHbQwsgvYL/Va4O8kHRYnCkOEF2rklNjjPZ/cHyT+riBosL/CP9oe/7OvnGmruSmQa27W5d24p8cXsFe/nc4J3kPHYHNRbVjV+cYh/XndnYuuO7Qpsc3AKPIJi36pHs3EBZmZaVBZ6RGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(71200400001)(53546011)(6506007)(6512007)(8676002)(8936002)(26005)(6486002)(2616005)(478600001)(122000001)(38100700002)(66946007)(316002)(54906003)(66476007)(64756008)(110136005)(66556008)(66446008)(76116006)(91956017)(38070700009)(41300700001)(86362001)(5660300002)(33656002)(36756003)(4326008)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <359737ED939BCC428CC669AEFCC5D987@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c57b222-19ba-43af-9a42-08dbf7809b95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hwt2Mt0L9oXwHQp26S0tBLx6i1MaNok4FAyUStYRahiBDeEupweXJKDlpVMO+VCZQ+rh9t38+Bz6VwcfunDqoiKl7mAlzBL7uVGALMxsmSnqwf0244tKaQmcuyzoy9t5j90qHSJKQfIwq1mhJK/U9oSoHSQo8KIf0MguoxbE2b55mDT2SYQibxbeoxL3vurDjOnZsHrKXoGhHMYHw612H2+74LmRdTfEKvlsLOlfY2MdZFJFY0FTFuAnM+oDEpNYgHUQDcPZhdrNU+oBEE716vJdRIkhVdexn7JQhMlfgY0sRCg7pbBUAH6d28ga5vjHcJAOELTMzDURwUH94lAEi9UuadzLhVWx9UC7jmW8jl0ugX242UFm1rjTUXegT6tsCBuYXcPUWicKbJ5j53hVTJUSxwfZS/wK259K+rVyKn8tY/ZB4sgemULtxm1aUn/4rTEr+LtBgTnDm0yop+bIAydJzwkcqJoYCZ21DoeJx+ronKpau8AW6RR1/ZVT3dgjQ4LOIcBydd5YzQZIrczK1aLfUzjo55ipkJIUkxPg0kqxQPzD0JE0wOiSaipLt3UQNvT/YV2p7TOEorDKSC6ynzGq1K+Wd/V31RuL78PzmIxLjbCvgEWrkgf+MnhWx0xdeE/6+HUZ5EIlvNak/O0zxj9gLzvUHId9nzJ9eiAiYZx0dY12ywFi6Z7hMuFPPc2dF+8YsWy8uZZe64HAZgwxjydmt0UAM/O7PYRRFoldHbh3z9PBmoEWkBVhN93uxeol
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39850400004)(136003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(316002)(110136005)(54906003)(70206006)(8936002)(4326008)(8676002)(70586007)(6486002)(40460700003)(478600001)(5660300002)(36756003)(41300700001)(33656002)(2906002)(86362001)(2616005)(26005)(336012)(36860700001)(40480700001)(6506007)(53546011)(356005)(82740400003)(6512007)(47076005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 00:00:04.5907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a476220d-e480-432a-9fc8-08dbf780a1d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5759

SGkgSnVsaWVuLCBPbGVrc2lpLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAwNTowOSwgT2xla3Np
aSA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGkgSnVsaWVuIGFu
ZCBIZW5yeSwNCj4gDQo+IE9uIFRodSwgMjAyMy0xMi0wNyBhdCAxODo0NiArMDAwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPj4gSGksDQo+PiANCj4+IE9uIDA3LzEyLzIwMjMgMTY6MjAsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+Pj4gSSd2ZSBmaW5pc2hlZCB0aGUgb3Bwb3J0dW5pdHkgdG8gZG8gdHdv
IHJlbGVhc2VzICg0LjE3IGFuZCA0LjE4KQ0KPj4+IGFuZCBPbGVrc2lpIEt1cm9jaGtvIGhhcyB2
b2x1bnRlZXJlZCB0byBiZSB0aGUgbmV4dCByZWxlYXNlDQo+Pj4gbWFuYWdlci4NCj4+IA0KPj4g
SGVucnksIHRoYW5rcyBmb3IgeW91ciB0aW1lIGFzIHJlbGVhc2UgbWFuYWdlci4NCg0KVGhhbmsg
eW91IEp1bGllbiBmb3IgeW91ciBraW5kIHN1cHBvcnQgYXMgdGhlIHJlbGVhc2UgdGVjaG5pY2lh
biENCg0KPj4gT2xla3NpaSwgdGhhbmtzIGZvciBzdGVwcGluZyB1cCBhbmQgZ29vZCBsdWNrIGZv
ciB0aGUgcm9sZSENCj4gVGhhbmsgeW91IHZlcnkgbXVjaC4NCj4gDQo+IEp1c3Qgb25lIHF1ZXN0
aW9uOiBJcyBpdCBuZWNlc3NhcnkgdG8gcHJvdmlkZSBteSBBQ0s/DQoNCk9sZWtzaWk6IFllcyBw
bGVhc2UsIHlvdXIgYWNrIG1lYW5zIHlvdSBhcmUgaGFwcHkgd2l0aCB0YWtpbmcgdGhlIHJvbGUu
DQoNCkFsc28sIGFueSB0aGluZyB0aGF0IHlvdSBuZWVkLCBwbGVhc2UgZG9u4oCZdCBoZXNpdGF0
ZSB0byByZWFjaCBvdXQuIEkgd2lsbCBzdGljaw0KdG8gdGhlIGNvbW11bml0eSAobW9yZSBhcyB0
aGUgY29kZSBjb250cmlidXRvciB0aG91Z2gpIHNvIEkgd2lsbCBiZSBtb3JlDQp0aGFuIGhhcHB5
IHRvIGhlbHAuDQoNCj4+PiBIYW5kIG92ZXIgdGhlIHJvbGUgdG8gaGltIGJ5IGNoYW5naW5nIHRo
ZSBtYWludGFpbmVyc2hpcCBvZiB0aGUNCj4+PiBDSEFOR0VMT0cubWQuDQo+Pj4gDQo+Pj4gU2ln
bmVkLW9mZi1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPj4gDQo+PiBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+IA0KPj4gSSBkaWRuJ3Qg
aGVhciBhbnkgb2JqZWN0aW9uIGR1cmluZyB0aGUgY29tbXVuaXR5IGNhbGwuIEJ1dCBJIHdpbGwN
Cj4+IGdpdmUgDQo+PiB1bnRpbCBUdWVzZGF5IG1vcm5pbmcgKFVLIHRpbWUpIGp1c3QgaW4gY2Fz
ZS4gSWYgdGhlcmUgYXJlIG5vbmUsIHRoZW4NCj4+IEkgDQo+PiB3aWxsIGNvbW1pdCBpdC4NCg0K
VGhhbmtzIEp1bGllbi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPj4gDQo+PiBDaGVlcnMs
DQo+PiANCj4gDQo+IH4gT2xla3NpaQ0KDQo=

