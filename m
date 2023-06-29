Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068997430C6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557196.870341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0WM-0000TU-9G; Thu, 29 Jun 2023 22:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557196.870341; Thu, 29 Jun 2023 22:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0WM-0000Qj-6B; Thu, 29 Jun 2023 22:53:50 +0000
Received: by outflank-mailman (input) for mailman id 557196;
 Thu, 29 Jun 2023 22:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DWp=CR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qF0WK-000895-0J
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:53:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb4c621-16cf-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 00:53:46 +0200 (CEST)
Received: from AS9PR06CA0477.eurprd06.prod.outlook.com (2603:10a6:20b:49a::32)
 by PAXPR08MB6701.eurprd08.prod.outlook.com (2603:10a6:102:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.38; Thu, 29 Jun
 2023 22:53:11 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::34) by AS9PR06CA0477.outlook.office365.com
 (2603:10a6:20b:49a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 22:53:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 22:53:11 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Thu, 29 Jun 2023 22:53:11 +0000
Received: from 690facd05a75.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 686A98E0-5B82-4AEF-85AA-963DD5AC89CB.1; 
 Thu, 29 Jun 2023 22:53:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 690facd05a75.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 22:53:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9040.eurprd08.prod.outlook.com (2603:10a6:102:32d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 22:52:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 22:52:58 +0000
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
X-Inumbo-ID: cdb4c621-16cf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb0opwtVEAKr/38TBMxRuNOi5yr3x62SzdWm4Mg5AbA=;
 b=QZO7vOy2xzAcwFosXY0cPTu5WM2XfbfZ8DbTKJ2mvqHWKuvSvqoexPrjvt5OZAWOniQkQCoLrWX8Yk0G4Z+NgPL9+9ARtOGKi9Jbz8cPuSUcpX85iP0/e30XTSu7/cvjl/DOC2tkhtGrrMOlhNebB4UcFn4SP2LWr8CUBne/VlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaT9tt5sPB+hSYPQjwcOmeDxm05by5MG+k0DfJExrEmtvDJ0eciI2WcOiqhujdvOc3lBnkh30+Do4y9CU08WFksmE4XTDItMpd84RMUPurNoWK045BxBxjFrfvG5d8jHkqIMbb9HAcE/I4PzU4agUD5MjwfHTZqkwHncUXXcQxQo2h5aHt7l+/FIM8Ot6Jw3pvmKzKrr07n9K8uiRTKysIhsbKSOs5tCs+db2GWOvtQfrFrjGXYL8Tqc/5sFJ6chL/WMtxp4W+MCPFvYiwj9PcNUf8E07JQwhiLAAKVpiFSYZKvdHaO4S0BYEd8viGwZD1GTHSRaSyilGW+BdqLBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb0opwtVEAKr/38TBMxRuNOi5yr3x62SzdWm4Mg5AbA=;
 b=dv1LaTxNJeyfIyl+A1U/ZG65Un7Wdkdd3DFdM+EIb25YYmyfyLfmXnAfu1BdOV6Y09qvrxxHRsHBqby4TxNDvdpj8Tz8NolITqvCs2KfZnVH0jEjP5OOrjpaUYwDQGRxk2eJhJIa/p1QGEsTmBb4Jk3ExQACejFJJvknlx/KjXBoTnGXMvgiCtsJMD92nqMG5wTg5sae2IjrkI+sSV+HSnblQBfEj4Hs75b+1hfMfM0lLeA5vzpAzpUEJdRzbJ88yNFxdSmcRranqKylQPbePkeDVyluMrfwZ/mGUmr3FbPiwHMwPyb1O1Q2qG5Qtbk8WfA0tHH0kOYL3T8GZANY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb0opwtVEAKr/38TBMxRuNOi5yr3x62SzdWm4Mg5AbA=;
 b=QZO7vOy2xzAcwFosXY0cPTu5WM2XfbfZ8DbTKJ2mvqHWKuvSvqoexPrjvt5OZAWOniQkQCoLrWX8Yk0G4Z+NgPL9+9ARtOGKi9Jbz8cPuSUcpX85iP0/e30XTSu7/cvjl/DOC2tkhtGrrMOlhNebB4UcFn4SP2LWr8CUBne/VlQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Thread-Topic: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Thread-Index: AQHZqsXsNehRAmncWEmbzZpBKUuCiq+iYfbw
Date: Thu, 29 Jun 2023 22:52:58 +0000
Message-ID:
 <AS8PR08MB79915059BDCB84F87880ABDF9225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-2-julien@xen.org>
In-Reply-To: <20230629201129.12934-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5FBCF154F646D542B26292E7774B57FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9040:EE_|AM7EUR03FT024:EE_|PAXPR08MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 218e0289-938a-4cef-0f9b-08db78f39d41
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X1H0H7JI3QJEag0liZ98AHq+JTuoOGxGpGswpEUr+jLkviw8xA7SvjPPQXFwZcRFTFdbFrjgXg2xhEOCjK4RkmlsEvd4w3tv1TQAfGuBbAdtQk1KiuRfWJGEqpZxPRZP78IxDCz2PUlEbauQRvAgvmwdyee4/2yCeOxfRIxgQIc0EI/rbXycnED//0MMeCh6TheHuatOsNgH1LwU2r4Uav7SXnNFczbZAZmFDedKRkErcP19B5K8H0hMkg0zEmM1w30k36WbsFt8C22ESG3ee1Ku13fCcRtDyZK9UqgDIx8awwGvGNX2XL5Tdxrq1b2CFsa9J6TXTk/VP6qvqxeE+7d6f4GX/G7Cz06gcD8ha+GYISE2usJwsxHcqCX4lMVjnyUSAMrZ2cWQjCJSA0Vf5I7OtQnJYDn8EW43Ya3k5vBnGOppUsSYZAY4RSYBzK+pqWdwq1G+i57TQf98+UEtS4ACi9KRndwvosm9k7Yd6fpNTHjYRuaBgzlmKR+/fJKQ+ktvJJyrE4gBTjByN0piNz9/5AAkrUCwHrKQwn7EPKA/6WJwNUV4TooBcr9a+qTfFGKUg9p5y3T/YLrfduehuMGTovyJq79mXZuOaf6B5xxS9KMFSwUws28R8vNywtna
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(26005)(186003)(71200400001)(2906002)(86362001)(7696005)(55016003)(38070700005)(4326008)(8676002)(8936002)(110136005)(54906003)(316002)(478600001)(122000001)(6506007)(9686003)(38100700002)(5660300002)(33656002)(83380400001)(52536014)(66476007)(66946007)(66556008)(76116006)(64756008)(66446008)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35072844-ef5c-4b4b-5b4c-08db78f3956c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YZu1YlILBjGtRs3ANcoum5RAqSMwQqy0KYV22axypnSfgNOtBjgpejkDt7d9IT0zMfIehIOvMt5SFAuCv/PCNA5xTqEN7ukH7s8czFYsE098IUcdrJ3nZ5bcQJSJhQHZWHKX02McMw1kh3InYOYmO2O5jJOC75gigQv2NVjiCFMzrM1Q+0R37w5qC0PkDoTGfRF01xNUosQtALbOL2VJri9WYYrKnd1rTrD5cSo9KmCs/3wUYhcyodJF7JWC0x7rDIMbnxyrdfR9MKfIRxRlcsjf8FmL29HYAezbDNh4bAU13antRpZQPzrQNveN+g3UD6HAguy/iGa85MMxH1f+bn5bh5kd5MN2BMfxfzD5/Eign9flanHEE3J7r+Jkslu11ZocDq9mSfXU/LhsIultbaQbDp5P5Rp5NbqEs9dzm8XvUqOAyHM4P5U95g78ZI70C0zCwTiWeBPDR6JOj2mQLc1+ChdSMJMg9T6zOUCw6qn9z92BnyteGWYCdQ8MmN4a7fE0jJH44r/EhiN90q7477fSfK6YJiw3lVKO4c57vQS4isZEjZvLfZN3CKjoqVs1blR02OTT64UcALtO1xa5w8HISlvHIDITyMpLVp0WdUl9mjX804zxuSzyamdA9eSqeeiQer4Ek7rcgmkBTAdSgJ2G2GE8VEG6zpnEUmZJvvT/8Elu5luvQH0I/+RpAK6ETai5iOdSxyG4cEQN2wgRoEfOzHDuamj0hxA7rSI55jAX9KkRHTFPnYvcJGX6gO3C
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(86362001)(6506007)(82310400005)(2906002)(26005)(186003)(9686003)(356005)(81166007)(107886003)(47076005)(336012)(40480700001)(36860700001)(52536014)(70586007)(33656002)(40460700003)(5660300002)(70206006)(41300700001)(316002)(8936002)(8676002)(55016003)(82740400003)(7696005)(54906003)(4326008)(478600001)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 22:53:11.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 218e0289-938a-4cef-0f9b-08db78f39d41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6701

Hi Julien,

> -----Original Message-----
> Subject: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>     * We would need to use break-before-make if the extra PTE needs to
>       be updated to point to another region
>     * The extra area mapped may be mapped again by Xen with different
>       memory attribute. This would result to attribute mismatch.
>=20
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
>=20
> Lastly, take the opportunity to confirm that _start is equal to
> XEN_VIRT_START as the assembly is using both interchangeably.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

