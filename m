Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A775C5129D9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 05:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315933.534627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njuXU-0000qg-Nq; Thu, 28 Apr 2022 03:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315933.534627; Thu, 28 Apr 2022 03:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njuXU-0000nH-Ke; Thu, 28 Apr 2022 03:09:56 +0000
Received: by outflank-mailman (input) for mailman id 315933;
 Thu, 28 Apr 2022 03:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwC7=VG=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njuXS-0000nB-To
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 03:09:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac250a2b-c6a0-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 05:09:53 +0200 (CEST)
Received: from AM6PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:f0::29)
 by AM5PR0802MB2388.eurprd08.prod.outlook.com (2603:10a6:203:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 03:09:50 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::65) by AM6PR04CA0052.outlook.office365.com
 (2603:10a6:20b:f0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 28 Apr 2022 03:09:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 03:09:49 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Thu, 28 Apr 2022 03:09:49 +0000
Received: from 739725c40aa1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B7858F6-DAD2-40B9-AB8E-C9F2F54D25FC.1; 
 Thu, 28 Apr 2022 03:09:42 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739725c40aa1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Apr 2022 03:09:42 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by PA4PR08MB6287.eurprd08.prod.outlook.com (2603:10a6:102:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 03:09:40 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 03:09:40 +0000
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
X-Inumbo-ID: ac250a2b-c6a0-11ec-8fc3-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f6JVItza79fDmpaIW/KjZs1fhKyLzRn3FDnwFTbY2sWoquzF02w6bgLtAPFA352uAUeXW7EhBLomV/h4oU2lLAUrZsxlWRznboiv4JrJ+bwmQOCBedYjl6w3cFmQOyS8u3Qz+a8pWHLM/vptvQ/ak9Fp1LyJ3whaFF1gY0ZXfYOyN7VLYNkqoj2qE0kau8Vj1LF/gKhy2v1BCajpFVW4Uldt2XjYYumj7ZcBOIcTSlhfHQJB3bcmv91gkxbsoWUWQ3GicmlDQOMWE50mNyiTVPaH22u2ap1l+wbr0ULUMn8UyTNI2K5ZnDF6BR1webyS4HrETpkrWo39oN9UFYuvGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgnqZybNVy3cW5Sb/DOu5q87BXbgnXw56tW293dCPME=;
 b=lmkyU5PTNQ1+Xxycsccg6tbl6LguZ2DdMspXywPCzxJO33kblNMaumqLPdVmzGzTehm+2Vo+71WvJ+Z21bIHUfI/5TkfaI2JeqEQnSf/ZbSoJ/G8ZUod4p6yEEmoSACvBlyLIvfDEmP56aqOfIVKGXvCSgCWPcB1mWosrnkLTiq7fVrfDrH2mTMJ/ccNiSPymLmN3pmpouv5z2rJP0zTbLxZRB71eCRZDLnmWLCzxY+Rcav9xPJhcZCzh6XHJXe5B9+5Ytkqhy4/88kXsEDEPz//TGwHYOiQZvebYQuYkO221vsPrseIi7NMlSohVh2TUeogtaaXQzAVg/28oWp3GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgnqZybNVy3cW5Sb/DOu5q87BXbgnXw56tW293dCPME=;
 b=EPnQsgw673x++6mgdF3JnZ1FC7x3qq6eKDbYTv0hQsaoJvVF3ApIizQSe/kPHlDNKBe69jTNIZ9pbr17ZR3YjgT6k15mHvBzBadw0K9qjFw7l5lJpOHrePQjMPA61elkgX4/vXD72L75WOHv76ebM76JaJ+SOTxUvceWyAiTBq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMNOjnogKfj+JgFuxZfdE31w1bu1jlfX7wSYOe/8AFY138pOuySBoUfA1+ANFT8N7UfFWdZFadFLE8KPs003DPnaPyu9mOyM2cHc/aileGeyGTLff/5bi5J+DRmP8LSnZNntM+pskpTnJqdzF4WbRYBQnXNdf22KN/i/WAwfh7EuhkunKdD3UJQfMtzcXZcs6brp3KBtTPCDUY8/VqpPYIKWH0oDPalzsvUr7p477lO15vzEdquPQeGIqyweC5muCybAi+Iw7KMKooaf/QrxMP860I/HkFssy6j+5A//0PICGctc5+6F5bi2EI41ILxGDdeCEviTBNS83wsce+WRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgnqZybNVy3cW5Sb/DOu5q87BXbgnXw56tW293dCPME=;
 b=c7XKCafVMh3K60HPaM1SWKxw3HnJm0DiW47wqHgplLg2gAZiKPbcufaKDAKw5OdQJqO2B69uLbcEkl8FlkhbdA1af8XQVIIrqDhenz5BHCpAuihr16y5d/djLdOdVg90t4VihBwezkub0HQgo/5DDDkl/ESEKU9MaIvUtkEld0ItosXYttqpGA7BzhNlVU76ihcyaMER+fKAI2IvaaDe3kQvnHW8Huc5deD8GoaoBebnOfe+DscRkz2e4MS2KePfxfgbBsNJ9/iDUwobyrM+YsKI/pLyYldLaBLI+jEzId0jWdYIlU9uUy6eaZRYeIR1WZx3uhrnhq+owXri5HIPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgnqZybNVy3cW5Sb/DOu5q87BXbgnXw56tW293dCPME=;
 b=EPnQsgw673x++6mgdF3JnZ1FC7x3qq6eKDbYTv0hQsaoJvVF3ApIizQSe/kPHlDNKBe69jTNIZ9pbr17ZR3YjgT6k15mHvBzBadw0K9qjFw7l5lJpOHrePQjMPA61elkgX4/vXD72L75WOHv76ebM76JaJ+SOTxUvceWyAiTBq8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Index:
 AQHYWhk9pvmpyYf9yk6PCG0TATWN+q0DifWAgAAAvZCAAALDgIAAAKBggADK+ACAAEzRYA==
Date: Thu, 28 Apr 2022 03:09:39 +0000
Message-ID:
 <DU2PR08MB7325AD0A6D2E65D6ADBF5598F7FD9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-6-Penny.Zheng@arm.com>
 <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
 <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <433f9e2a-9da7-662f-04b5-0379eca7496f@xen.org>
 <DU2PR08MB73250C2576634910269805CFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204271531410.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204271531410.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5907F57659E134FBA6F6FEB04016A38.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 11823219-f32d-46c7-8f70-08da28c48e9c
x-ms-traffictypediagnostic:
	PA4PR08MB6287:EE_|VE1EUR03FT025:EE_|AM5PR0802MB2388:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2388F67C60F8A25A5136D9FBF7FD9@AM5PR0802MB2388.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QXf0QqWZIUPVqHTypvi7U373qyfghFoidtLp3YRKT0Rc7lTXchPlcIYtdu1j1f1RxhZSPTOp/AjubSRWUKRKpOTczjaRzXEyb1Dx8eaVs2N+O2v4B6EaYR3VIvUctCyKXbs9qze+lWHc19ooa5Z0THh7aou5gJa9SjOW53drYx4KJVtoNeRAM6lbctqkFZTuacoblTufuLChXVV/tI4qnI3ci1XWcc+AkQXg0sXVBrffVoa4qGSRGtBYYjgv1GQ0ltYLwMDyteVbmhm6ERYyAaPbbpM5GlXqn1dFYe3UFrG31mSZUpDtd0G3E8a5SHyHo7t5gModhPaY8UAV4WJ72DSA2XW/YcgGjzFgKz7AqZ0AJiK0JAZB0pfyvConSpRX2bCE6TzUOiZaZhsGicUjx1X53QIEG+ClAIWTj7M8rBX3Cafw/bsrN5rxvDR+2h7znuVFG2HwOm7q04s6ogh8X+UkMnOGn75AahszSuIx/vxUIB/5BU3hgBa1zqJ20wEfpCxvclDNMi4OO+n449S/UFEp6sTDIffAIMg5lEsbcx3Cr32EQkfInFo0m8q7lxWShXxOSTgCEBBPsz6awmbZbRKn/ntBk408MIgbaiq2UWer2JMKV4Wb0cA+it4tNxAUoAhxLdcqF0WEMvvdko5w+XmY/udC0qjxNqVYrw7D4GjU/++kL2uNS5Ss1htsy6Y2Ic18qkJfq+YhDupxl96VvkoWYW40hVp+/qPyO3ptMIgQEzQcEAVSRzQzIX1+BLmjuPi4j8KmXzSleTw1+Eh+mX7Mjtgv7RN4yYaenZE84sA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(508600001)(71200400001)(86362001)(53546011)(122000001)(26005)(6506007)(9686003)(38100700002)(38070700005)(66476007)(316002)(76116006)(66946007)(66556008)(7696005)(186003)(33656002)(55016003)(2906002)(5660300002)(8936002)(110136005)(54906003)(4326008)(52536014)(64756008)(66446008)(83380400001)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6287
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01fd391f-786d-4442-747d-08da28c488d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeU9Am2s17cOpxMN9O4pGezrJk4x9bQFrohkIM6WYeGfoimjRB+2sw+sc6na3QBUiSDpJ8EEvGPLeObcnLrdqps9HyDW8DCKoyKBroBGNJ4g9rt29Qd36DgKsv+HFqwqxbZwENIPQElTp1G5yYiui/AYNfMHu6vWAjuju8/zGx/KAWcxT1yOYQPnHrMg+7UU8urdWR+PdWvFc9ffmjArcvQ06mjZR4hcRujeN6trrhggiF0AHi6+PqhxRdMbn66+5gcihr7iQCRYkAL9KSD/CDuUmcuE6OKSw07rqcYsni6fhx5TuJXESCtTqDRlTcundDp7EqZOTexPR0AUuWu8SMVd8fsxr6AMCtd1iQDV8F0KudtrjmC/ryVzZJHwtB5/xNKNeiAl7/SqKrOj3EySjJbst0zacJJ7Dptul/eALsihrzudR6g4G5Dq0U0pwGbcIzyUltIAzDPVlzIimjNcI3tfKGN2TEG6F/ZHsxBeaGGj3wYP1O6EoXUOWU2UaIOyoeYGJ19Xk4HsYdVwbVwVCa0Ot39W0QOGciJe6xNmNS35MIgAj6OPBH2tyssLO/tLWToRCiGTK5l6sLmO8k+N3vtnHJ9xoTs+5iZDs5nz34IOWN0yE0qX/JjVmqaFlYiune4S5VfasUL2liGYp/e755ZnDSAP/B9iakS6mYRvJxCtHN8r1/Z47/kHXdztEiKuprVJT4ls/VuMP6NrDLoFHZEKnTjG6EZnO9N1ZSbgj16TxxogUVqzBop/l2tqKOV6Y92GRFdd0L5IVvYQ4RGeNg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(82310400005)(26005)(6506007)(86362001)(7696005)(81166007)(9686003)(55016003)(70586007)(70206006)(316002)(54906003)(186003)(110136005)(336012)(4326008)(8936002)(8676002)(33656002)(508600001)(40460700003)(52536014)(966005)(83380400001)(2906002)(53546011)(5660300002)(36860700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 03:09:49.6578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11823219-f32d-46c7-8f70-08da28c48e9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2388

Hi=20

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Thursday, April 28, 2022 6:32 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org; Wei Ch=
en
> <Wei.Chen@arm.com>; Henry Wang <Henry.Wang@arm.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
> Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>
> Subject: RE: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is
> static
>=20
> On Wed, 27 Apr 2022, Penny Zheng wrote:
> > > Hi Penny,
> > >
> > > On 27/04/2022 11:19, Penny Zheng wrote:
> > > >>> +/*
> > > >>> + * Put free pages on the resv page list after having taken them
> > > >>> + * off the "normal" page list, when pages from static memory
> > > >>> +*/ #ifdef CONFIG_STATIC_MEMORY
> > > >>> +#define arch_free_heap_page(d, pg) ({                   \
> > > >>> +    page_list_del(pg, page_to_list(d, pg));             \
> > > >>> +    if ( (pg)->count_info & PGC_reserved )              \
> > > >>> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
> > > >>> +})
> > > >>> +#endif
> > > >>
> > > >> I am a bit puzzled how this is meant to work.
> > > >>
> > > >> Looking at the code, arch_free_heap_page() will be called from
> > > >> free_domheap_pages(). If I am not mistaken, reserved pages are
> > > >> not considered as xen heap pages, so we would go in the else
> > > >> which will end up to call free_heap_pages().
> > > >>
> > > >> free_heap_pages() will end up to add the page in the heap
> > > >> allocator and corrupt the d->resv_page_list because there are only=
 one
> link list.
> > > >>
> > > >> What did I miss?
> > > >>
> > > >
> > > > In my first commit "do not free reserved memory into heap", I've
> > > > changed the behavior for reserved pages in free_heap_pages()
> > > > +    if ( pg->count_info & PGC_reserved )that
> > > > +        /* Reserved page shall not go back to the heap. */
> > > > +        return free_staticmem_pages(pg, 1UL << order,
> > > > + need_scrub);
> > > > +
> > >
> > > Hmmm... somehow this e-mail is neither in my inbox nor in the
> > > archives on lore.kernel.org.
> > >
> >
> > Oh.... I just got email from tessian that they held my first commit,
> > and needed my confirmation to send. So sorry about that!!!
> >
> > I'll re-send my first commit ASAP.
>=20
> Just FYI I still cannot see the first patch anywhere in my inbox

So sorry about the mess again...
I've resend it just now, PLZ check https://patchwork.kernel.org/project/xen=
-devel/patch/20220428030127.998670-1-Penny.Zheng@arm.com/=20

