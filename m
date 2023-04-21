Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154B6EA24E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 05:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524429.815352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pphMp-0006Du-98; Fri, 21 Apr 2023 03:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524429.815352; Fri, 21 Apr 2023 03:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pphMp-0006Av-6T; Fri, 21 Apr 2023 03:23:23 +0000
Received: by outflank-mailman (input) for mailman id 524429;
 Fri, 21 Apr 2023 03:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ii9+=AM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pphMo-0006Ap-B0
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 03:23:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa51514-dff3-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 05:23:18 +0200 (CEST)
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by AS2PR08MB9416.eurprd08.prod.outlook.com
 (2603:10a6:20b:594::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Fri, 21 Apr
 2023 03:23:05 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::30) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 03:23:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.26 via Frontend Transport; Fri, 21 Apr 2023 03:23:04 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Fri, 21 Apr 2023 03:23:04 +0000
Received: from 68399d3fb0b3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 096B505E-256B-43B8-AA24-CAA8DE7B3A84.1; 
 Fri, 21 Apr 2023 03:22:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68399d3fb0b3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 03:22:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7756.eurprd08.prod.outlook.com (2603:10a6:150:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 03:22:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 03:22:52 +0000
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
X-Inumbo-ID: daa51514-dff3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LENz2T83NBmBa89xPiAXm3Qmok3tPn+Fo4PXGwsp4vE=;
 b=MUBi1QJqCZNBJ2T1bmbGoYbSPx9f1miJOxU/XHR2N3jFWyy9HFrEEyH8bK6+4MTlvQFUn/V13jK+KufviGxMhT0xJJEw8rOaHDVb1n10UYlyAaAQOCvUM6huAbH32fypsxRcxIsGyK5U0CQhpm2NVAQosrrDzl4PuNPTIAmr+bM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F89WwR5p+Rc2JSjatdP0UtxvOCXw/Le5Wiw/l6vALzo4NWOr+74onijUlQtOcFgtLQApbZlt+OhofKuZxWn0FRzuL31dFySGdzD1c8fQ6xYGwD5WU9f+s90a7dk/LgOwa1DNVxLQeG331YlJo8/9bTtI2B7rnm6+QSjh51VYYj3HANPLUVKw0EDbKihMCf6ZXzte7fNXkMBPcu1r+C8oQ3auNKDpg/uDTKHbz8bN4WPC3XySidp2cwLuWugCiSJL8IwOoF6l0FeDajzicWYHN53ukqI2apvTpu6WwzrvmK18pkyu6Dk9THnNc5DABM2DEQWFWqh9VLsl5LmR3p2tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LENz2T83NBmBa89xPiAXm3Qmok3tPn+Fo4PXGwsp4vE=;
 b=OU8QtHZwMNisF+g/fL7Etgh6NGRAqg85dMSSvOWR3AFIaklv0eQ9xcRJUNtsTKG0P79cNjyBV7VHVMudOvYm8yrMI/vbvOksEOgrQbFxtWws9wbZA4HVpL9DPMVwiJ10ZPLHbg4mLWgc/iLwYQVELkBOqcLAcgKED6QAROK3F8NhY3EJYx5gBYvBFh9qfOV40s6ULlPGmSPYMQxmYHe/tE7fAp6lbhqM7DUuP0UKOjnO7WJ03p/bTXEPp/xXlUPidLff3Er/SaMh5kOSAVNOrkS/oemh5f7k2bbykVj5NKECPyrmUdYaIf4wsA1zxvpADGkVtJFIwBzR7sVeK+eztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LENz2T83NBmBa89xPiAXm3Qmok3tPn+Fo4PXGwsp4vE=;
 b=MUBi1QJqCZNBJ2T1bmbGoYbSPx9f1miJOxU/XHR2N3jFWyy9HFrEEyH8bK6+4MTlvQFUn/V13jK+KufviGxMhT0xJJEw8rOaHDVb1n10UYlyAaAQOCvUM6huAbH32fypsxRcxIsGyK5U0CQhpm2NVAQosrrDzl4PuNPTIAmr+bM=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>,
	Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@cloud.com>, Juergen
 Gross <jgross@suse.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18 release:
 Proposed release schedule)
Thread-Topic: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
 release: Proposed release schedule)
Thread-Index: AQHZdACNvTYSYql02kern4BL0bR1Kw==
Date: Fri, 21 Apr 2023 03:22:49 +0000
Message-ID:
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 70CBA437B84F104799042B1B96D0274B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7756:EE_|DBAEUR03FT059:EE_|AS2PR08MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9204668f-4fbd-4602-4a85-08db4217b830
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +Icr5BS1NYU8t5GVRPPa0TKrMMrOlKMhO7C8sr4Q4Brx4fpwQSMIzD5l8Xvt4QzJuAe/cyW7vq7BGMNctmiGBVcq8s1fIf4Qmhvho/g7EpmtQDOkEuw89Qs/g6APKMqOGionaziQ3Ile6isgfNhXblwRJlBvlYbUWa6FXoTZHHNpC3JPueUDRgojDKdu58Gsa9jXox6GOOjEblABZMuIy1InU/Ag2Q2XWei46Gx4Shh4g3WTklKBHYr3XFDdKh2M8iwX+eeTm0surS+/Rx0/cU359ZpQxa3xPKMb0f2CeJdQgwEbZ5VzBWTaX9Kxn4vJ2ETIZzsBEH8XA1itI9y+LM4r2vy4QVuBoRV8qTIVfnHJR/giHPpO1/eBLQK77giPGnxBDlVxSLkziB6U5L8A/ySIwTRmKyjXgF4mYD7zZSTSiyLm4+XgnOMXOPxxr4fjnCubLDmxCfr6ns1sJoPWqX3Qfmt7nyTGt7jKtVTjXAPSPWLxPNCppAK6e1r+jXjJCPWMOuQbKFd8OpQMsX0G7RQrfIPl1DiTnO5TdpdVrerynqtA7+TJ0L3+O9rhLtoaLiMQ3MUVrJuKp7LQtGS4N+7k7j58YWX6nOpDtMmvgsywmXhs8c3hFN+d9KEaBMdp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(54906003)(8936002)(8676002)(122000001)(52536014)(15650500001)(7696005)(6666004)(55016003)(7416002)(5660300002)(6506007)(38070700005)(33656002)(41300700001)(26005)(186003)(9686003)(83380400001)(2906002)(38100700002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(6916009)(316002)(478600001)(71200400001)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7756
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa5fb66d-8f0e-4b11-69d6-08db4217af92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hp2nzMigZpwrYVtjH8I7S9qlU6CpZRVAQH2GaURcLxELXyIP0OtIHUd6ZxG34X9kcmB9qmhoomwXPryObIAkxPoq3svfKY1nVPNujcipDEKwW+k4GjXoJoHyEuSJwXTJkmwkQbUAyQKJ/M8rlJrRwkwbtJpPiaK8iWFXJFSEuWeFIU2Ke1Y7GLGTlBMye13JG+QH4LpUOweUjjVYR0/gA95cWgmbiR3P8u2Hdi9Hoy8thrEUvsRBKrNbzOgTbuSpwQKOQl9ld9jaNhpWyG4BRAoVDlM3K2wdVfVuSwNLL0GxfbEB7oPuvlQDZLJlIqvaFofaiIGOUa22Sq8oPQX8WCIrPc2gZAWexniHzBy2nKXBOnjrX/CTFy2+WH3Fnj42duHTgVndrZOgjG6JOfxkUOMLzIX4z1Ypsr/3lfT6witQxaCiUhR2OmqHrmCF7VtiNfvTaCrU1QUuF5/079W0pjYYvbbiCrnPIwvzjS+tHc2zV19mAU87i92Ddg6GZlCGXzIPU7lwd023jUPS3vgz2AOpcvsj3xu9ty4fvFQhsTwrn9w3ZsAYaEIVMHJgoUadY763wPvWm97/sH/8sZmlOlcXgtrrJlpn4M4aJl9sNTFeZZBmxMAEfMuUB+uJNAZaQb/A/Ka3vtekdB5F1PN+xvkdwLf+5m+1Onp20SjlNRHvnxO6HqPVTUBfzu9+iRHfhBdAv+bWqG3z+b9EY0wqyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(33656002)(82740400003)(82310400005)(81166007)(356005)(2906002)(15650500001)(47076005)(36860700001)(83380400001)(336012)(8676002)(52536014)(5660300002)(8936002)(86362001)(26005)(186003)(41300700001)(6506007)(9686003)(316002)(4326008)(6916009)(70586007)(70206006)(40480700001)(6666004)(54906003)(55016003)(7696005)(40460700003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 03:23:04.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9204668f-4fbd-4602-4a85-08db4217b830
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9416

Hi all,

Following the discussion in April community call, here comes the two
updated possible release schedule options that I came up with.

Both of these two options will satisfy the requirements/concerns that
I've received so far. But I personally would prefer the option 2 as we
shouldn't expect there will be much progress happen in August due to
the EU holiday season. I wonder if anyone has any objections or alternate
suggestions.

Please don't hesitate to raise your concerns and opinions. I would
encourage that the feedback collection is cut off by the middle of May
(say May 19). If nobody will have anything better, then let's go option 2
by "lazy consensus". Thanks.

** Proposed option 1: Wed Aug 30, 2023 **
(+8 months from Xen 4.17 release)

- Last posting date          Fri Jun 16, 2023

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

(Note that Xen Summit is Jun 24 - 26, 2023)

- Feature freeze             Fri Jul 7, 2023 (+3 weeks from Last posting da=
te)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Jul 21, 2023 (+2 weeks from Feature freeze=
)

Bugfixes only.

- Hard code freeze           Fri Aug 11, 2023 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Aug 25, 2023 (+2 weeks from Hard code free=
ze)

Branch off staging-4.18.

- Release                    Wed Aug 30, 2023


** Proposed option 2: Wed Sep 27, 2023 (or the first week of Oct)**
(+9 months from Xen 4.17 release)

- Last posting date          Fri Jul 14, 2023

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Aug 4, 2023 (+3 weeks from Last posting da=
te)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Aug 18, 2023 (+2 weeks from Feature freeze=
)

Bugfixes only.

- Hard code freeze           Fri Sep 8, 2023 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Sep 22, 2023 (+2 weeks from Hard code free=
ze)

Branch off staging-4.18.

- Release                    Wed Sep 27, 2023

Kind regards,
Henry

