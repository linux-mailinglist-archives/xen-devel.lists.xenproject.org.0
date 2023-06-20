Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E07361FF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551402.860954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRin-000819-6r; Tue, 20 Jun 2023 03:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551402.860954; Tue, 20 Jun 2023 03:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRin-0007xF-3A; Tue, 20 Jun 2023 03:07:57 +0000
Received: by outflank-mailman (input) for mailman id 551402;
 Tue, 20 Jun 2023 03:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRil-000587-HA
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b87cf7-0f17-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 05:07:53 +0200 (CEST)
Received: from AS8PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:20b:451::15)
 by PAXPR08MB6686.eurprd08.prod.outlook.com (2603:10a6:102:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:24 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::33) by AS8PR07CA0018.outlook.office365.com
 (2603:10a6:20b:451::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 03:07:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:07:24 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Tue, 20 Jun 2023 03:07:23 +0000
Received: from fee44d7552f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA98F3E9-D3E8-44DF-A589-84F392DCE62D.1; 
 Tue, 20 Jun 2023 03:07:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fee44d7552f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:07:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:07:11 +0000
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
X-Inumbo-ID: a5b87cf7-0f17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1ky7RN88ulN/YDII4sVGZ/ZjtuxO9vC7qI2HibHfu0=;
 b=wfcOG1qESRKT7R/Pctv0lnaTJwoXhilGf4uuqCFA7GUW7O+B1SnzRh58uF2pYKZfypfWDWoWpwV+OystNhn7i3gPg0N2x1nW2Afsebz7E+cP4H+vdJyHg36J6W12at65LFk8KId0Wag2iB7CKhdJ2ovQ5/YYzAjjmPbU0vsD+CU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3x8xphxigJC/I+6HqlUHERXOCS8/Af+/65D1lTi22h9quj8fA1kyHV7+ES5jLX0fqC8rVnJr+8zGWJAAB+Fc8ALyQ2Sn9uthtq9Q6wcO69fGacf+zmrOq+E1Q/JVX2iG8JbEunVItkojrOVQoPUmbwY0w6R1cnFsKEckLvj/adbzOWlNC2Y5sZ6yemh9/NNyRsXWCd6X8DQkKNA6EKngZjOkXdNddS9ux7x3SghQOtLOejN6RuUDiIDCH/U148tbdh3PKzJuQ+/KSCW8LhL8MDRd/7SsWXOHtvxPF6yJIHcLN+vXbEAF3GcrLS2X2Sqn2ro8SODaTp5/7GAWsTigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1ky7RN88ulN/YDII4sVGZ/ZjtuxO9vC7qI2HibHfu0=;
 b=P/BFgtzaA8P+5et0r8w6izizJiAXrtK35KwraTkuexo3NVRs5e/OpqZnZzQBoHbMO1UcVOxV6md0GRNPMMiEb1Sb0Qj/Iw/x6uzOjJZuNdFQKu5Ne/1a98InNH7Mx5rDCaSoIXgzjDolMQ+aIaJBquDGWh/9ZkKUe6fXymdgt3VMBA3CjwRMD2eZImA6gG3nFQXLtNKBz4SPvubN3JkEUlRlwrYR2D4vG2jEyqcoYxuIx8sVOY918nH+KdAEFgNi+VEp1sZn1I/D/fw109KELgu4LvjUqsqPu/5KzLRGJOl4pQzRQN6G3CD5eibGnf/rP8DlSM1bKAMSOqnpzbfbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1ky7RN88ulN/YDII4sVGZ/ZjtuxO9vC7qI2HibHfu0=;
 b=wfcOG1qESRKT7R/Pctv0lnaTJwoXhilGf4uuqCFA7GUW7O+B1SnzRh58uF2pYKZfypfWDWoWpwV+OystNhn7i3gPg0N2x1nW2Afsebz7E+cP4H+vdJyHg36J6W12at65LFk8KId0Wag2iB7CKhdJ2ovQ5/YYzAjjmPbU0vsD+CU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 6/7] xen/arm: mm: Add missing ISB in xen_pt_update()
Thread-Topic: [PATCH 6/7] xen/arm: mm: Add missing ISB in xen_pt_update()
Thread-Index: AQHZos+2CRVN/3/A6kOyIoDn1Cdi6q+S15lw
Date: Tue, 20 Jun 2023 03:07:11 +0000
Message-ID:
 <AS8PR08MB79915628AC5BB0625D3CD3C5925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-7-julien@xen.org>
In-Reply-To: <20230619170115.81398-7-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E9809A3716C1A54395A1F4089098B273.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|AM7EUR03FT015:EE_|PAXPR08MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa43609-289d-4e77-d2aa-08db713b787b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yH9xefzK5kqW0mwg3tirD6mwCW5vQb023ldAs6CCIshHFxdTz3VURDGoyx/IO5bp8PWv2fCh6skxFy8zujkwJ/f1fE34J377pA6EQ4Yl2RVeUldTZn6WTEV1K5e14qttzdYYkJrH06RBHp/fcp3LbGnsNWUG1gUHdMnkrglFKHN4DfdjTiebV37QdbYy1tFkdYSV72R7iFHwMJbVIhvUE/ergAAvtOwRmSw1mcN/sOmkose3GxhkhrwzPgDyCHw074LxlEbefGdirh2quTov+hxfTWVO3MF67IpjzdO17kpwuMM0maJkwqMzZ5RqlhT5sWfoGzo1D/PznTGzYmV2tPPJG0l02V2Fr+Yk5GbmdWA26uPAgpEPPLR7J81Kk+OsYJPzXjkc4liAJlWcbP4ANvTBP4tEqfUFzJ6lXI3ckJ6iCmry1elR1khwY+Jetr8Nm1f1M2QxtJeBOldKC0v9kYjjqWfeWm7Sxd7WvORWfV80Vm1km/KbTErMzXEcBADqy+/9XGGYlPiHRHoGHYE9fTZnGL+CZgr7wNOGjdG9c07DER4C6JBH8Nmr1nSD08pzDQrK6L7g07puNWOlpcwHggcqPt5qoZRX6lotcf5QojyhPIFjMhCnrsAXj3xhDAvM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf990f7d-e54b-4cda-1c2d-08db713b7110
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+bVEIguVpsaKLAzNWj9CWdSDzmUCN8FqaZpSgyNb6q9OfAGhgg6GUP4FNF0KR5WUruL0uPYSWvEbVWCS5BiNC4P02PuQ5q1nJK2I1G/e4DdVH6wKnAx2yHSFZnDGwLHDTRfFIe4yD0NAL5LPpArqUhskrchS6J5c7FL9qyeqkNfcvngLLYpvTnUnXwBN/IBeaVrHh/Z4pj0buBbtj6M/cWn4vpPeIiKGV6tsLdT8jAS3pRw9d4977u9wn9ybKsKocdCDs79ahXqCDSehIaNNuYKyQcdMN4Bxhy4CoiVlZUktPVOhBawEzJjUSgElIZgN9qORK5S67jWrZsDfCs23VtUPbWcqJPY+0RzKVJVWTWpKxhkAeeI/pB4glY8SIepZLXjao3MDbwz9GgxWKtJs3OhdCqLzCUad9auADIauT2i0kRyFvtwYkcEiugfajS//ztBB/C5pBg1oSeZ2fKWrANGFE1xyJzVDRXdx2pVyBkinW7jZDaE7MgU9psVpzvyOu27kG2NQX32EOUuD8MuJdNHPS7Ww3IXhOrxhf9rosMKomCWVD2kUkYJJYDo4KZMHxsZgQVkYBpNXRXaPD8Me+r6D6WB6wP7LW8kaB1bYp+LHHTDxvv0ASNobPxrnjCo6K4WmKb+ralIN4QW7kKzT2BI57F7aTAsimuod1OVWVfZdGQbu0UNFQ0V1XL0ChH9CadWYEELvMslWHnptS8dYFDy8Jfzvcu1VP6QBh8q2pZ2gIk/MvWmezb+II3DskEfv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(70586007)(70206006)(8936002)(4326008)(33656002)(8676002)(478600001)(40480700001)(316002)(5660300002)(52536014)(26005)(2906002)(40460700003)(41300700001)(55016003)(36860700001)(86362001)(54906003)(110136005)(7696005)(82310400005)(6506007)(9686003)(186003)(336012)(47076005)(82740400003)(107886003)(356005)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:07:24.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa43609-289d-4e77-d2aa-08db713b787b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6686

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 6/7] xen/arm: mm: Add missing ISB in xen_pt_update()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm, (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> Note that second sentence is not part of the newer Armv8 spec. But the
> interpretation is not much different.
>=20
> The updated entry will not be used until xen_pt_update() completes.
> So rather than adding the ISB after write_pte() in create_xen_table()
> and xen_pt-update_entry(), add it in xen_pt_update().
>=20
> Also document the reasoning of the deferral after each write_pte() calls.
>=20
> Fixes: 07d11f63d03e ("xen/arm: mm: Avoid flushing the TLBs when mapping
> are inserted")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, a=
nd this
patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

