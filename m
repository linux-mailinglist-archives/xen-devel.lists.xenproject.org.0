Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B25A9C00
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396820.637158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmNb-00017U-3y; Thu, 01 Sep 2022 15:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396820.637158; Thu, 01 Sep 2022 15:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmNa-00014U-UJ; Thu, 01 Sep 2022 15:45:18 +0000
Received: by outflank-mailman (input) for mailman id 396820;
 Thu, 01 Sep 2022 15:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjVP=ZE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTmNZ-000144-4z
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:45:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12370bdc-2a0d-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 17:45:15 +0200 (CEST)
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by DB9PR08MB8739.eurprd08.prod.outlook.com (2603:10a6:10:3d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 15:45:13 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::80) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 15:45:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 15:45:13 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 01 Sep 2022 15:45:12 +0000
Received: from cfc7f4c03195.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C247EC8-4C63-461C-83EA-708298A56978.1; 
 Thu, 01 Sep 2022 15:45:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cfc7f4c03195.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 15:45:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8436.eurprd08.prod.outlook.com (2603:10a6:10:3d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 15:45:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 15:44:59 +0000
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
X-Inumbo-ID: 12370bdc-2a0d-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fbQFrs1sXMlx9WrJFcKt4OhKOJ+is9A0+jjrw1jyhVoieu82rLZ8iUeC5ajpA+S+bCFyqOYLKJr94ZWWGCpOeaBlHkMDYNKMLO9gSp3dEPIifWNACbIJDvACN3x2Kwl/TNI+Bw3N2/KnqWuP1iX5t/XqlDBSPVxuzeQMidiz8AitEl4Nq8l/OO8elq5FXjqQxeUAB+pS2yCpm/HH3v8rbHif0PRmEqvlFsG8LwKn2tGFuURToCKNgLGV4r3fe4fvIOj7wZJtz24dbn7Iwro43lxdf8/XXgyQ/Tbb1FSm8ieq+3RJM/adsGJgCQGPgFOYv/xlXwGk8HokxTg3OpZdJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SsNd35CtOlcvxyDaUqih9TSX4ZvggNCWsBQN7ZI98s=;
 b=bHcGw81GUTmj3uABvRE9AuJeUWRTyHub7sCScsEYLkE6VvmdFi2BRuIfOPo25WJUym0AAPCB4Sb9q1kkRbZMytuCk6QVilnX34niTUBojaq1mXz7AW1HcdDk6bn9E/9zT9I5MiGnJ/D7d8bFj7Mf85dzk2Uw9AR7GKsCaQsXS6pFUZxq4FevhifIMU7AqFnSozuzbpCsPLUGahOeBbPAQG8Vdz286S+qJhjpeoZYaHLOVA2ZubPFwmRl8tr7qPIvaW1YC2ju/liNaMJgzA8BN95o3zdGuBvHTG0AygAjmBj2wLcr5w82Cr2jL/PyS4I5woujmYN69jlEl9fVM2c/8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SsNd35CtOlcvxyDaUqih9TSX4ZvggNCWsBQN7ZI98s=;
 b=ZToEZmRRQcjDRW6OFfzh9M6f+gQ0+InsyOVPWKUHr9GlPLgZXIJ0Rf+CMVygLLkb8qjtFO8xEMEuc9Qh+deOiqxm2ANUdHn80yO0TN2Z7w7EEiHqAB/Y6Em5LEPIMveIN+6ZLSINlBPQ59lr6YAy60LnO0Y+e+wA9yZwGm0slX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3TbteVgelgdQv7u6jM45yPzAlQt1Uo+m16akNAgBwQkYBC1nCmMMkKDG76tJdhyICSO8GxizaSWstJe9IXUFsfCJGL0IkrhZvWSaTpdMV+tnCP9cf2SwRaMy1dtkoQQphyQIKJ7hPyal0tjvLzY6Yk63DOgrxd955z2nQhIXfFDjFzLBNP1aSn4FoBF3QU8OuUyuyFhWfQw+oDwfE8U4dQbHF/BZ73nvZBTbWP0121AHa2QOSK4z4NOG6my6lGxRPUnrolRsijjwIbyhLx9ST5TgiqP+pe7NCCSUQSZGvpEvuuQRUm1BHHcCzNiSkz4g/A5rnq35eh5+QTGfoF/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SsNd35CtOlcvxyDaUqih9TSX4ZvggNCWsBQN7ZI98s=;
 b=HuGXWkJ/RbcF97Bed4U6Ba9XCK9AvgaIUhrbkCnb7aPTJiAtvvZRWey8csFumZy80PakviqGgH9zPLa0OemyFqPYTROq/CPYBJ0f6JpUBEYBL+CquZPWiAVLI0Mz51Fj4RJs2TcBxeyFxSetLHGZzZXLhgnstTyOO3Eo49NhAx7U9u4C825gOlXGT0/5fvUv1If7Uet1nJCHjQYfCUXG+MCalTGFKYlI0+Y72/xgKYgWJBmiFgBDxU7oIBJBzMSViBNZCzUY41ITp7cTlaz7ELUle61kqvcKWTFeOXIdLWdhdIPqUesLwntTdM1iOpcclWCjBVhqlOc1TLuwauNGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SsNd35CtOlcvxyDaUqih9TSX4ZvggNCWsBQN7ZI98s=;
 b=ZToEZmRRQcjDRW6OFfzh9M6f+gQ0+InsyOVPWKUHr9GlPLgZXIJ0Rf+CMVygLLkb8qjtFO8xEMEuc9Qh+deOiqxm2ANUdHn80yO0TN2Z7w7EEiHqAB/Y6Em5LEPIMveIN+6ZLSINlBPQ59lr6YAy60LnO0Y+e+wA9yZwGm0slX4=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: RE: Push 4.17 Feature freeze and Code freeze one week later
Thread-Topic: Push 4.17 Feature freeze and Code freeze one week later
Thread-Index: AQHYvhXwY5ksNZUEbUKzv0CjRBnFYK3KsCCA
Date: Thu, 1 Sep 2022 15:44:59 +0000
Message-ID:
 <AS8PR08MB7991DD9E3E7C966E9C6DCA03927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2745BA23-B42E-49E2-89A2-59A0ED70388F@arm.com>
In-Reply-To: <2745BA23-B42E-49E2-89A2-59A0ED70388F@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8D35FE9FF03492489B0764B48EF6AB9E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 59748237-588b-40a1-3d69-08da8c30f572
x-ms-traffictypediagnostic:
	DB9PR08MB8436:EE_|DBAEUR03FT027:EE_|DB9PR08MB8739:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gKeMFMvWwuKpkk2JD3NS/hjlUjIE0VM+ppmjCLfrKebWPvCBef15pUskEQy3CkrnvRF+8G4TMCZZOfhPS7Uv42DRPPnXsg8Kip8rVVbQ5TW5g1upmko+UX8HiTIfVZmeG8poEKwPyACnbainYntbsOXznExCdxyqpkKQwwzhoTLhHF4xdVLYP3gly/8teeeMFB/NzQG/JsgwrsaslF8Pyh79QiTiLBfqvsqLapo/U6VR01TCk83q4N9AT+UZh6FiywEhD1lp1fq8dZgCK/qsiYPRCQ3//J5xLbGSNdJhROgJDXgly6F6EASwDpkUJf5O/x9qa1mXHOMBx6hB8wmVrGmYHmbVMV5HYTzkSKMuuz+FW5gHfnJZHaI/gqHCkFc3987K/cEwm7F+4P8buW6QfraAcqBW9XZaDjzVf9vtjPgcPf5GuVmOCCIcXIuq7ngOA20+C2etfmH4XrxRCArIys66b1Z1JBUYxoizWxwKAXHzXKF1q9C9WD4hXJUAr30xcSbbttPdIcULJc/U6wwVa8NT5lKpAXD13IZPRSM619PNr5+UBbC1m/qCaQqfRr/i/XVnFegM1CO0iRvvareCkjZvK7AGRJUFHGgbsa2YM3eADsCeuHASR1yzNiiZK+Avxx2gozxKAEM+G/Now0DYswBvyT3TLxNfmDEH6pspO+NydTJP0VIhgZMi4IRlJakjz3qtlnwlXaFJJdDDLUfz3D1aGYa9b0RzpRayAshBZTyCMfymrz+b8joROxga32DoFBBQBE1dM6CN7x5SaCnN0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(41300700001)(54906003)(110136005)(478600001)(38070700005)(71200400001)(7696005)(26005)(38100700002)(9686003)(186003)(6506007)(66556008)(5660300002)(55016003)(33656002)(86362001)(2906002)(4744005)(66946007)(316002)(8676002)(66476007)(64756008)(66446008)(52536014)(76116006)(83380400001)(4326008)(8936002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8436
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8464d1de-2bbc-4c0d-d5d1-08da8c30ed9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5iO/Fqtk5XD5trSOHKwFd8qdU1cF9zZS59MG12LzhySBUZxTn+uJbHg7knEsO5P/ZmetFVsxpRpphE461Q43qbauzfvR/FriOyFk1mMT8Xh1G+GzS9hGuElVv5oFJ3bjEhnLXJDuusGz5LOrXcCcucNrJA1WT7nl7YilkkmZG/wKE/hr7qeaFTTAIBIPOmqu5S1HIh8WQPaJ3TtT/an1xgzBWMihfDPRNuKCbtTVJ3469ZMehrc0uUgLkY6FAxTddmfssNMcsQtwQC36B1SY7gSGlmSrRu+FUEEsw0t+ooo+eOlojNz4AjXlY/8GSqX8ESAmAMMLSc94BEvZDjP0/uzlXg4fdpVUd0+bC/S9Qeo82Xqp/o9QdWGyMwALZmwyVFSUqFV5/tq2z5kUPa42h/ux7uZ4PgkVvyXuPMx9Gs+CgoS5SgdbIFWU6r5J7P9ylje+sS9qX0U2eebTFDnu+ATn072KtbbH/OnBvQoHDI6uBtGH7FunQuoAX/wl6iVX6HzC1iYeUgQoursuqBTlPz9pSnRZA82jtUkfyUrXNVzgMkdARTJpe112cU4dLADBJhvp1CyRpBbNkSfcENiKb17iNCHJ31oyColYw8Uek6vKQAG/nUlwV11Zczyg7jiC8Z8eUC0qOnwjuYLJEoLjtas5Wm39hirXmgNiNVAyPFtdCVSWHPWmsQ8WKy1lEhU2UEUgeUrrtbxz01yQI9D5yZgj/MRaSjh6LYFQYmCfsn5HCv0eCw53dy/H0rIJT9l10NcwZcJYJsArMb+6t9LvWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(40470700004)(46966006)(336012)(5660300002)(8676002)(4326008)(86362001)(70586007)(356005)(70206006)(110136005)(54906003)(316002)(81166007)(6506007)(41300700001)(40460700003)(7696005)(82310400005)(107886003)(83380400001)(26005)(47076005)(9686003)(186003)(82740400003)(55016003)(40480700001)(478600001)(36860700001)(33656002)(52536014)(8936002)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:45:13.0413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59748237-588b-40a1-3d69-08da8c30f572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8739

Hi Bertrand,

> -----Original Message-----
> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Subject: Push 4.17 Feature freeze and Code freeze one week later
>=20
> Hi,
>=20
> Seeing that we have lots of series quite advanced in review but not alrea=
dy
> merged, could we push
> both Feature freeze and Code freeze deadline one week later to have a
> chance to finish those ?

I am good with that. The updated schedule now would be:

- Feature freeze             Fri Sep 9, 2022=20
- Code freeze                Fri Sep 30, 2022 (+3 weeks from Feature freeze=
)
- Hard code freeze           Fri Oct 14, 2022 (+2 weeks from Code freeze)
- Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code free=
ze)
- Release                    Wed Nov 2, 2022

The planned RCs would then be (1 per week as soon as the code freeze):
- RC1: Fri Oct 7, 2022.
- RC2: Fri Oct 14, 2022.
- RC3: Fri Oct 21, 2022.
- RC4 (Final): Fri Oct 28, 2022.

Please raise concerns and questions about above schedule and we can have
a discussion.

Kind regards,
Henry

>=20
> Cheers
> Bertrand
>=20


