Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E164577D60
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369365.600741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDM18-0003YQ-KK; Mon, 18 Jul 2022 08:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369365.600741; Mon, 18 Jul 2022 08:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDM18-0003VL-H2; Mon, 18 Jul 2022 08:22:14 +0000
Received: by outflank-mailman (input) for mailman id 369365;
 Mon, 18 Jul 2022 08:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDM16-0003VF-6s
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:22:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b85db049-0672-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:22:11 +0200 (CEST)
Received: from AM6P193CA0140.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::45)
 by PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 08:22:08 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::7a) by AM6P193CA0140.outlook.office365.com
 (2603:10a6:209:85::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Mon, 18 Jul 2022 08:22:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 08:22:07 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 18 Jul 2022 08:22:07 +0000
Received: from 618754c55b8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41B7B2EF-9AA6-4B79-A5C8-231EA7A1C0D5.1; 
 Mon, 18 Jul 2022 08:22:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618754c55b8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 08:22:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB6972.eurprd08.prod.outlook.com (2603:10a6:102:1dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 08:21:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:21:58 +0000
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
X-Inumbo-ID: b85db049-0672-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Krddpn27Qh+4/K/MabD0yPdiDtH8N9s4HvgwyQn79WM3GgfXGlLdsK+g1BvK9z1LZFwHYEr33iHnAfYugplxfksjS8Nr+QL/FV1iSZt2udLOu+HOhyOKklU2txBKMwFVBYnV/BTGhl8eZYdCTZwGsIYr9dOLm0iqznwA6MZhbapozkwjrg84vqKBbVXeoS/7jvLaeUuA8oZpm4SIGn942KtunpnEbnxNhsUcj/0JeBcBKCVSnV02FPyqsP93WwmCYP7D/BIRZCp7xN6PvPLH+md/cWmxFYsamHY7gAmq1oRvscqcMSrjmNaW2xT2jcreeyM8m/UjGrfF/USG7YdsFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P3BF+AqsvyB7H/9sjXGoLW1vk2+/1oxAQaHmfCcm+Y=;
 b=lCF+Nq4wUELmNIlj+I9WtUTu0LMidnzW8zJ587BDevjVMirBU2WWfjcBHmHfgTjnW8CUYO/J4n3eBHpel06+oTM0l67Pv341S2ox32FJpdcB7bLYKxscWPNAq8LPjvECwwwda9spppjw4Hv0HlFKQw/DfrGh3ESiKu95nCCKT9szojwaL4UR8RyrAMLcdIGAL+UYenmf3Z5ujct8KplwSJ91t/INL/1R+JhHSC7zFhvxB6Oxl+TnUpQQVpZgDsaWzaeI9dpwttwXtMeNZu3R9nRQ895jbO0Az70uuqnhMaqoK8INlyVcpDx95rsCZy/r7cm5RVj1SdoGDNcKoJnWwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P3BF+AqsvyB7H/9sjXGoLW1vk2+/1oxAQaHmfCcm+Y=;
 b=xaYoq2O712PC6tx76G+DfA9DtZ5ZFBnJZSDF8iwAwvWU+uMEOiLLtv5zQ1ga6tAv275qc7yraCdk+PCD/rmuyC27Hp1ig/L0DhOXRUJreQ6sN7TGsaBw0AZbI7xcsMnsuNDmCbW3mHEa6GL9LLrOuYp/ebvkVwXCgXtLBo2v5Ws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TILqza8r9L0qGngyApp7aHwIvt8iLodUItZkj1G5DDZBXhK8/MRo+Bxd4EqgvHSIbX/v96nSKWZ+X00snFOZbucepa9XD8BsWptExi2r6AAj1T8OLo5hcuwfoKSZeQntvdjS9q3VBaFuPUUzv0PMgjcyOhHzPJFez4u+pTtpOQZCQz/4+/FHiAFiewxfxhpwCtAgE5LZcgcwX1jNi1AudgQ1MtZM/ClzS8jtpdnnJq+x4BO2TLllyepuMdTMb4YGql12KGTfKIaXl3Fn3OPlIpUQtPSXiaWjMwEnzaSOaK43GWy3Y2VvYI5g8gsVIeakbhZnwFi4nmiHIhZhE/09hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P3BF+AqsvyB7H/9sjXGoLW1vk2+/1oxAQaHmfCcm+Y=;
 b=I4ffz4RlSQupqPnNR6XiOo8AmNyTQOIB+hiCU6u8Bjyg5+kCIeL9lw1I7XxATAYwXs7tlreKbuLTQR1fQFQFWz1j28fTVqK9pjDieon1X3SMuzJ+peBUgAIIU8OT9SKPVMvftujeLq/Yl75cIS/z21aep0ImMEgjXrat7SsHSLKixBtckeK6FjGXW+ilimC5STVV8dVeOG46qSMwZU3luVlWwOW380zqx9FuBHM1S9ydrwPbFOOJleAPJbmt3DMddGjP32GkomdG7zJAgGEHhWTSH3LJMXIXmcLiAdZE3SOii+fXcW9DbUHhqwwuDQjSnVq/miOiLl29+oawVMjO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P3BF+AqsvyB7H/9sjXGoLW1vk2+/1oxAQaHmfCcm+Y=;
 b=xaYoq2O712PC6tx76G+DfA9DtZ5ZFBnJZSDF8iwAwvWU+uMEOiLLtv5zQ1ga6tAv275qc7yraCdk+PCD/rmuyC27Hp1ig/L0DhOXRUJreQ6sN7TGsaBw0AZbI7xcsMnsuNDmCbW3mHEa6GL9LLrOuYp/ebvkVwXCgXtLBo2v5Ws=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index:
 AQHYktrGRUcF8MDJDk6LN0+4egi+Ca160z2AgALXevCAABQigIAABL8AgAYMPgCAAAYhgIAAAsoQ
Date: Mon, 18 Jul 2022 08:21:58 +0000
Message-ID:
 <PAXPR08MB74204CAA487C96218F2ED7D19E8C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
 <a9cd1e2f-fb49-ef68-41a9-58eb7c546266@xen.org>
 <PAXPR08MB7420CC0ACE1AAEED5254981C9E8C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <fff36e89-85da-7ccc-6058-6941150a6cd4@suse.com>
In-Reply-To: <fff36e89-85da-7ccc-6058-6941150a6cd4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F4A71446FA05274E93634B698C44F9B1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 75eb83b6-e654-44f1-d873-08da68969ab9
x-ms-traffictypediagnostic:
	PAXPR08MB6972:EE_|AM5EUR03FT049:EE_|PAXPR08MB6956:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6WETbHRjDV3ebKLoESThSEyNf75H5uzLZgm0LaR4F5zrPUgyryo1gbNsHJM9aYGwZuq2fRo5Zz2W/WuuAgutK8C65BUhAUnYKW3CC8HmUZciIU0C2G3OXmSa6nIL2Jitfdp9972HFAk/eGRm00hV8dH5fht1F8rBMRg4wZdfOflSIfZUOy1fs0KYcLBDYOnWGv8hrufOGYE7C2+m1K90FrlPgItrdR14BfA8rBtZAu5y7WM2ql5RSLviotpeQFI+NcW0C48F1SeUO1C7AXj535GDm9joTqClceAnhzYdi80j1D6Udorwrp+od/+5RTuW/IieN0/OUd4Snn7zo2FL/eeE1sast2X8AYif/majfPoQyzu/7uNmvNwEQUyU3X4bNZi66nihjn1uXZN2rbqGkTJ+tBu32GgFKe+MiNT3fsmHE6B4PGQnUTGBYo3X9sMs8hIUVpJBYFMzQ+qDNjyBE9Q88ThSOYd5uj5gUDZwdDAqY7UCx1tDENmCD5b1SARmLq1X4tMmHo/RKN4j72PedEULcjXKx1e2pvPDvmeA2f47txf0Pp1/z+nTLH8WNcC3s8qPHmymAmwnBGgN/ZepyoRMMBT/O555ZVBjuQNXoSl2V5LtZMQO8IZrbXXTdFv6yekPvvixyCbCxf0LgIB53fO5CAv05YOi3Xoc03FATEnMbjuCam5DItaK+0h6pqUGLinc+r+aaPWoihkL/x0dEqmhftQq0KyxecaJXT16qyc8/gEWn4j85NiQt2K4av7KNTbk7TpGz2CizhZWgCXHGELUJPJa/tG/yepHGYjk3SiTcw+gzj53gcpMkqeclM3+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(33656002)(52536014)(5660300002)(8936002)(55016003)(2906002)(54906003)(6916009)(86362001)(4326008)(76116006)(66556008)(66446008)(66476007)(8676002)(316002)(53546011)(122000001)(478600001)(7696005)(41300700001)(71200400001)(9686003)(6506007)(83380400001)(38100700002)(26005)(186003)(38070700005)(66946007)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6972
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc9f2c89-04f5-46a1-1e97-08da68969587
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sz21iGWyppVg8Oz6wfDkjuWow8sUIDifG9dqRZXEXQizNX9gKIoJXpeV0AfOxErYLH4BLaAw6fo3jUgGb1jNUJrm5EqJq8Fs+jCjavsP5dfGnZtajXwrpDESGA1uXtZMcXyWqjkNn2ApXojyio22fsW6tMJdjxUBT6IBr5kmZEjYP/M0oNW13w+VX8Ix+JsGkkJoJ4+hOU46ghkob2ZMG4oRB6j/EgHH/UpWhEj3j9GPNDiZ1+HlUiuatUWpbBx5F3I37cy9lIg6DJgLSlYh/aH/xVsfzU1SoZLrfKmwIduVMbxJc0rijoN0Ar+Ez+buSlXFSg3gZ+XgV38Om71TWfxtQlkI2UmlZQZJwvG7/e0H5+aYWJDGREwl0orxlHcBQg4IToCUCziymSBUzdQ1qv8IrN5doAuAXRuB6lgBSaLB7IYfhnSzXXiDIokV4wOVptnYlUALkci58Bdgq6jXBw/WH2bWj+4tMEy9u1FposWQYxQB5GxNJ5BFKG1Qyb5Src8LK8Vh7ONqnYr22NNSHnFhESHH6Evs4XC/sSB9hwTWEjBPVIIBlCHLEFXHkSn9xzJlI5vjj7ntWBnoiRYzkOTkShoaGZC63v73YSUGre35vJqp8PKDRW8OKXtrOePnOgMwxomx6efdIyxbNuZz9mRQEiXXeJ0ukfQau2yRarnIMv+lBRqkvSLTOSUfv9nZuXVlgR2r8Ksqiu+olrgElRWJj8tQl8iZAd+PFEwVUeeTVVfjJZNINoKtfzydCmBCaE+E6nR4U4vsiFrjD8s9ccytisCufZjCFWx5CCLkf3H3o1M71snszOeaHrJzJq2p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(40470700004)(36840700001)(36860700001)(52536014)(82310400005)(8936002)(33656002)(40460700003)(86362001)(6862004)(356005)(478600001)(82740400003)(5660300002)(81166007)(316002)(54906003)(4326008)(8676002)(70586007)(70206006)(47076005)(336012)(186003)(40480700001)(55016003)(83380400001)(53546011)(7696005)(6506007)(41300700001)(2906002)(26005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:22:07.5975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75eb83b6-e654-44f1-d873-08da68969ab9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6956

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxOOaXpSAxNjoxMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgOS85XSB4ZW46IGludHJvZHVjZSBhIEtjb25maWcgb3B0aW9uIHRvIGNvbmZpZ3Vy
ZQ0KPiBOVU1BIG5vZGVzIG51bWJlcg0KPiANCj4gPj4+Pj4gU2VudDogMjAyMuW5tDfmnIgxMuaX
pSAyMjozNA0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiAwOC4wNy4yMDIyIDE2OjU0LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL0tjb25maWcNCj4gPj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL0tjb25maWcNCj4gPj4+Pj4+IEBAIC0xNywzICsxNywxNCBAQCBjb25maWcgTlJfQ1BV
Uw0KPiA+Pj4+Pj4gICAJICBGb3IgQ1BVIGNvcmVzIHdoaWNoIHN1cHBvcnQgU2ltdWx0YW5lb3Vz
IE11bHRpLVRocmVhZGluZyBvcg0KPiA+Pj4+PiBzaW1pbGFyDQo+ID4+Pj4+PiAgIAkgIHRlY2hu
b2xvZ2llcywgdGhpcyB0aGUgbnVtYmVyIG9mIGxvZ2ljYWwgdGhyZWFkcyB3aGljaCBYZW4NCj4g
Pj4gd2lsbA0KPiA+Pj4+Pj4gICAJICBzdXBwb3J0Lg0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gK2Nv
bmZpZyBOUl9OVU1BX05PREVTDQo+ID4+Pj4+PiArCWludCAiTWF4aW11bSBudW1iZXIgb2YgTlVN
QSBub2RlcyBzdXBwb3J0ZWQiDQo+ID4+Pj4+PiArCXJhbmdlIDEgMjU1DQo+ID4+Pj4+PiArCWRl
ZmF1bHQgIjY0Ig0KPiA+Pj4+Pj4gKwlkZXBlbmRzIG9uIE5VTUENCj4gPj4+Pj4NCj4gPj4+Pj4g
RG9lcyAxIG1ha2Ugc2Vuc2U/IFRoYXQncyBub3QgZ29pbmcgdG8gYmUgTlVNQSB0aGVuLCBJIHdv
dWxkIHNheS4NCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IE9rLCB3ZSBuZWVkIGF0IGxlYXN0IDIg
bm9kZXMgdG8gYmUgYSByZWFsIE5VTUEuDQo+ID4+Pj4NCj4gPj4+Pj4gRG9lcyB0aGUgdmFsdWUg
YmVpbmcgKHBlcmhhcHMgZmFyKSBsYXJnZXIgdGhhbiBOUl9DUFVTIG1ha2Ugc2Vuc2U/DQo+ID4+
Pj4+DQo+ID4+Pj4NCj4gPj4+PiBBcm0gaGFzIDEyOCBkZWZhdWx0IE5SX0NQVVMgKGV4Y2VwdCBz
b21lIHBsYXRmb3JtcykgYW5kIHg4NiBoYXMgMjU2Lg0KPiA+Pj4+IFNvIEkgYW0gbm90IHZlcnkg
Y2xlYXIgYWJvdXQgeW91ciBjb21tZW50cyBhYm91dCBmYXIgbGFyZ2VyPyBBcyBteQ0KPiA+Pj4+
IFVuZGVyc3RhbmRpbmcsIG9uZSBub2RlIGhhcyAyIG9yIDQgY29yZXMgYXJlIHZlcnkgY29tbW9u
IGluIGEgTlVNQQ0KPiA+Pj4+IFN5c3RlbS4NCj4gPj4+DQo+ID4+PiBUaGUgZGVmYXVsdHMgYXJl
IGZpbmUuIEJ1dCBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSAyNTUgbm9kZXMgd2hlbg0KPiA+
Pj4ganVzdCAzMiBDUFVzIHdlcmUgc2VsZWN0ZWQ/IEknbSBhZnJhaWQga2NvbmZpZyBpcyBnb2lu
ZyB0byBnZXQgaW4gdGhlDQo+ID4+PiB3YXksIGJ1dCBJIHRoaW5rIEknZCBsaWtlIHRoZSB1cHBl
ciBib3VuZCB0byBiZSBtaW4oTlJfQ1BVUywgMjU1KS4NCj4gPj4NCj4gPj4gTG9va2luZyBhcm91
bmQgTlVNQSBub2RlcyB3aXRoIDAgQ1BVcyBleGlzdHMuIFNvIEkgZG9uJ3QgdGhpbmsgd2UNCj4g
c2hvdWxkDQo+ID4+IHRpZSB0aGUgdHdvLg0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBzb21lIG5vZGVz
IGNhbiBvbmx5IGhhdmUgUkFNIGFuZCBzb21lIG5vZGVzIGNhbiBvbmx5IGhhdmUgQ1BVcy4NCj4g
PiBTbyBpcyBpdCBvayB0byB1c2UgMi0yNTUgZm9yIG5vZGUgcmFuZ2U/DQo+IA0KPiBQZXJzb25h
bGx5IEkgdGhpbmsgd2Ugc2hvdWxkbid0IGFsbG93IHVucmVhc29uYWJseSBoaWdoIG5vZGUgY291
bnRzLA0KPiB1bmxlc3MgcHJvdmVuIGJ5IHJlYWwgaGFyZHdhcmUgZXhpc3RpbmcuIFdoaWNoIGdv
ZXMgaGFuZCBpbiBoYW5kIHdpdGgNCj4gbWUgd2FudGluZyB0aGUgdXBwZXIgYm91bmQgdG8gYmUg
YSBwb3dlciBvZiAyIHZhbHVlLCBpZiBmb3Igbm90aGluZw0KPiBlbHNlIHRoYW4gYSBoaW50IHRo
YXQgdXNpbmcgcG93ZXItb2YtMiB2YWx1ZXMgaGVyZSBpcyBwcmVmZXJhYmxlLg0KPiBIZW5jZSBJ
J2QgbGlrZSB0byBwcm9wb3NlIDY0IG9yIDEyOCBhcyB1cHBlciBib3VuZCwgaW4gdGhpcyBvcmRl
ciBvZg0KPiAobXkgcGVyc29uYWwpIHByZWZlcmVuY2UuDQo+IA0KDQpUaGFua3MsIEkgd2lsbCB1
c2UgNjQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpXZWkgQ2hlbg0KDQo+IEphbg0K

