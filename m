Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4E5A98E6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396626.636836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkKu-0005eD-Si; Thu, 01 Sep 2022 13:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396626.636836; Thu, 01 Sep 2022 13:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkKu-0005c7-Pw; Thu, 01 Sep 2022 13:34:24 +0000
Received: by outflank-mailman (input) for mailman id 396626;
 Thu, 01 Sep 2022 13:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzPc=ZE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTkKt-0005c1-Kd
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:34:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e037b0-29fa-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 15:34:22 +0200 (CEST)
Received: from FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::16)
 by PA4PR08MB5998.eurprd08.prod.outlook.com (2603:10a6:102:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 13:34:21 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::d0) by FR3P281CA0045.outlook.office365.com
 (2603:10a6:d10:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Thu, 1 Sep 2022 13:34:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 13:34:20 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 01 Sep 2022 13:34:20 +0000
Received: from 87e32432c947.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11A2EF6A-1F75-461F-91F9-D93F00363BF7.1; 
 Thu, 01 Sep 2022 13:34:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87e32432c947.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 13:34:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8492.eurprd08.prod.outlook.com (2603:10a6:20b:565::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Thu, 1 Sep
 2022 13:34:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 13:34:09 +0000
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
X-Inumbo-ID: c9e037b0-29fa-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g7VCfSoLX4aSrypoRWTLXNfUio1FNYEVQ5V/lgjQE8ZX+hVQfmIZH+hzkkZYJeZwI4xsB97gleTBI6s6ReFiMC/BqvkimQV046XSmp7IY+rjNs+iEwappcBfFmVqxGtPIHXQI0Y6mu0T+f4HcGQQt0NFgxVikuWuceuldHRYe69BKdTLfyuVSt2bWcK4x47NcNOpQ5RHfYDp+eQCtpvSp1Ely2g8S0J8zXXgFmApNyHzoid3KCCrJP5EIbS0vubOdVpMl4t7d7U9zwirbCuEqFBs6ALmEcA5hi28Fgjmv4XexxtGZqUlsh1CjKaI7aLBjY7hcSD7emt77g2MBH3jYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxRw09bemW009EVnRvkMOlocZZXMODx4PFwP1puPuW4=;
 b=ilfApVadfPbgmAwFG+HD7jng+q5IfZhU26zAM/NUdGoU6GCSF2xm1G55xo7dreGyWUpDWwIu4UO905bITYJIi2pqMjYRyvmxC6SCrkjJ07uTXtrGsiOkbHPZBTmQi3sMtP/cpK3KH0Q+UZeurrIXumDBozIJqxHtXupsCj5HLEmlnA0N4wsVx5+RxknrvpyH5x+GOBvtoNJ6HoFub2MnciwYDQ7QyUCpJfYA2lFdyT8fBlanPj012uSSUdF/85SDk43QGugRMBwQRqKKT/i4azb08+SdIVhnzOSq1bLUJAx9ZXaEhX+brHqh0dUnqLp3tGkX4IJR5hby58He52c97Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxRw09bemW009EVnRvkMOlocZZXMODx4PFwP1puPuW4=;
 b=wZ3ldVdb63kzec1dmSmKOKPNXI71YpQ+TkArpL5UrsDiQLtTXeUMo6jJGQ3MATFGcfVvnINu/Ej+V0Zst+H3d7+AuN9FYh5LUPeAsiDztUgQoUQa90x1f4T23XcirR2WAfYDxkJ+d/7KouJv0ONdwIj6OeRZRV8f7fEyRjL8aEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a534867fea7ffc4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hcd9S8YN3uJFe+UASidkv+AZpdLEtNqwdSH7koKvtMfDPBsOItBKzhfmZ8QWijEJzLz/LpyQTblPDfNUypdlJvrqkJDlC9YldQyZRrPuHqbkDHMgdSuZ72zK8BIfrK9qFJYhh3E/do8Mw+g9Mm8JdsxyOffNbmqAPJ7J1Rvfy0jRPenD75AY7bUfhAVw9dW1e52v5vIWm/UdRqNqQGM/+0EN5UApXzovcZIRMxPhbA4/vJ64a1o3QzE2AQUHYitK4kdXkD4SxKFBSkBnUidVVSZpFip55QegfPT/y0XghR0WbHEvSX+hQiM5lujNh3MB3f6f2bFqCSex2bVibJYz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxRw09bemW009EVnRvkMOlocZZXMODx4PFwP1puPuW4=;
 b=VhD62jDQe+DopgorYDM6DfNyZ147LCTwcNLUDEUj1SYGzefFsFFF4FW8FKqYjWiHSk1RFxOCjt9slkRoCidh4i7CRA8m+SzlBaqOkO1RuPiZHkn0dbnYk6mfMrrp8X43qsXwrClofh9DeNOzqGsJch9QsIBs8/jpRG1gqs4QvSKrGQriqqFpQ+oMdBPqhyOGL6eP5iFYBiCaQlblKrQ0ZeNCldmTL9Z+dczOM+4AGqhLHwwoQIf/7G+1KPS0iph/ZDorvsF3TMpsdCju/WMyXX+4TNDc/OjSw8KJBvueRuHnjIrqZVnQtaYBHBpe80Y4AbE25Lz6x5vcAa2xALo/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxRw09bemW009EVnRvkMOlocZZXMODx4PFwP1puPuW4=;
 b=wZ3ldVdb63kzec1dmSmKOKPNXI71YpQ+TkArpL5UrsDiQLtTXeUMo6jJGQ3MATFGcfVvnINu/Ej+V0Zst+H3d7+AuN9FYh5LUPeAsiDztUgQoUQa90x1f4T23XcirR2WAfYDxkJ+d/7KouJv0ONdwIj6OeRZRV8f7fEyRjL8aEw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Thread-Topic: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Thread-Index: AQHYtAQe6qSxrEQGbEumth30q9ivnq3Jq9wAgAC2VQCAAETOgA==
Date: Thu, 1 Sep 2022 13:34:09 +0000
Message-ID: <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
 <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
In-Reply-To: <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 58d535a1-fe06-4f7c-1358-08da8c1ead28
x-ms-traffictypediagnostic:
	AS8PR08MB8492:EE_|VE1EUR03FT044:EE_|PA4PR08MB5998:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qOdoVoefY8lZVYQElcojZn9r26/27vPyVqq+8v/iClRdazSdKRUN43dSEIAblnOUke5/1wH001D0atE+KKOdqKkU135SBe83Z7zRO+X6IT3ss2OND0AytOJ5TlcjEHngZG9TaZqBBR1soULLL2Yhsif/tf8G5mqU22Pm340zodJaxhT99m91maxqxGh9v9RCiJFEH1XxZxpSM4WorRwFWJWLGOI3PU7mv8/lNsj0ssdVEXd7oBCirNWPPnWXmBt+zloOMOwYHOE27M9kSlU6BUZJb/H9HXZUINGWecUkzWcylmFn7yi6HaChCd6zfV+PoECHYZIUSGadL76MRSYUMWBgR5ZUabTtiF7Hskwn5IcC1sMKofiy4QTaVzeMI3psqz6QdCuPK3BXAVtjGtaNGtkaNRt7LMa9O55r52Mfk4bJommbapISz5IFEIpmOPpNJuPPN8XblfWHD+scNT6Wr1En8ReHIYK4THikaeCxI4dH1ydW6ftb2Tpa4bc+zHvP7oVnaDEvlksGn4LcQ4s8GG4XTdc7rCAqHbM84a6sBQSURFRR3uEKHzhrEAXJNF7UYploEp6U76DSwJT5TVnjV1MoTZDuOE06rUgmJKiLPTvnsXEx7VUKyyrxsycdQRm962LCzHSLxaFILpQkc5AGE3o01SdEXSZ3tQeE7UHZaLMr0po8QZW6c5UOYCB/OR/ugtdowlx1FfvTTHScM+yW7G8SxFG3v9XFRRAshvxqnSTTMl8rcwFFhSJm/0HvDBeCbwObDM+nEAr95zsWYVpZLqpdfML9fHQKhULIuASZxXE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(66476007)(6506007)(53546011)(66556008)(33656002)(38070700005)(6512007)(122000001)(76116006)(36756003)(26005)(91956017)(66446008)(38100700002)(66946007)(86362001)(8936002)(2616005)(5660300002)(186003)(316002)(6916009)(7416002)(8676002)(64756008)(41300700001)(6486002)(2906002)(54906003)(83380400001)(4326008)(478600001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18EC336AF5600647983E32F5A3A95FF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8492
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83467797-0b15-4ee2-75fc-08da8c1ea663
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MBUO010RounXtJdv59cobfAL0UBA+Qfsbd2TFdOnPR+MAl+swupS32FgbwIaj3eF2BT0E7TAgLRRxBlXzucJvE2mxJQA3HShj2Sefyvo+2XR1P3PKPyyFy/KmjuIt0Pu0JHFExkc7khqJpGSnviXiOQU9LKXxlOkTM66F+VQo2Qbz7AEPh0p6E5U1e1qNVMvKFNaqDj5RmBTmTU1Yb4cB4pUXN/kEyMY09NV2CfbyRZ/IOoy5ctRzs6vy/WcXBc3jlw1vDosYai91cZRksQ6n8PgXxe3ZNqKyUh5O53So6Wb5Eoxce3mtqBDdRZO1tu2Y+mN8PO7PGV4QZUkEL/bPjjEiz92lWh2AM3zdhRjYXH2IEctj5g0yPSlQY9+059SiqDZVPr/mIZKEKOzb2t5A2UCLE2sTLG3YS14npM4aniS6s3J+A3dMMgm4+IvT54Gfu/XdAiKMQep40vTPrB4e6O6fHNkpUL8lNbOiMOh0nbpQ5e3TNQ9bdLyDI1/2YzlWMruNiijNmczepC5eGrC53cj0c9eRf5QM8MnYMkY4wPdY9gLvcyO0CWTn0TSxftrmUvpglCjTtwXfUDwPMi4i12LC3ANWfHC46qIr/ijTbWHOkRFsIp7vH8/NZL0BQ//qUOQ/U2x6FJm8nyhcrRg0CfmE6tROLnSfdHtd1VvoOcmYQusPbolfuMffllGR/1af+f7aefgCl1AXor3dEg96R0WO5yCEfrSmPvpdWGXp/QAB/ZYL2l13Uar84z5zj3mzmor2H8Si3Dy47dPp74gfA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(40470700004)(46966006)(36840700001)(356005)(2616005)(86362001)(81166007)(40460700003)(186003)(47076005)(336012)(8936002)(5660300002)(6862004)(41300700001)(33656002)(26005)(6512007)(53546011)(2906002)(6506007)(36860700001)(82740400003)(40480700001)(83380400001)(82310400005)(54906003)(36756003)(70586007)(70206006)(478600001)(6486002)(316002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:34:20.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d535a1-fe06-4f7c-1358-08da8c1ead28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5998

Hi Xenia,

> On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
>=20
> On 9/1/22 01:35, Stefano Stabellini wrote:
>> Patches 1, 4, and 6 are already committed. I plan to commit patches 2, 3
>> and 5 in the next couple of days.
>> Patch 7 needs further discussions and it is best addressed during the
>> next MISRA C sync-up.
>=20
> I would like to share here, before the next MISRA C sync, my understandin=
gs that will hopefully resolve a wrong impression of mine, that I may have =
spread around, regarding this rule.
> There was a misunderstanding regarding the rule 20.7 from my part and I t=
hink that Jan is absolutely right that parenthesizing macro parameters used=
 as function arguments is not required by the rule.
>=20
> The rule 20.7 states "Expressions resulting from the expansion of macro p=
arameters shall be enclosed in parentheses" and in the rationale of the rul=
e states "If a macro parameter is not being used as an expression then the =
parentheses are not necessary because no operators are involved.".
>=20
> Initially, based on the title, my understanding was that it requires for =
the expression resulting from the expansion of the macro to be enclosed in =
parentheses. Then, based on the rule explanation and the examples given,  m=
y understanding was that it requires the macro parameters that are used as =
expressions to be enclosed in parentheses.
> But, after re-thinking about it, the most probable and what makes more se=
nse, is that it require parentheses around the macro parameters that are pa=
rt of an expression and not around those that are used as expressions.
>=20
> Therefore, macro parameters being used as function arguments are not requ=
ired to be enclosed in parentheses, because the function arguments are part=
 of an expression list, not of an expression (comma is evaluated as separat=
or, not as operator).
> While, macro parameters used as rhs and lhs expressions of the assignment=
 operator are required to be enclosed in parentheses because they are part =
of an assignment expression.
>=20
> I verified that the violation reported by cppcheck is not due to missing =
parentheses around the function argument (though still I have not understoo=
d the origin of the warning). Also, Eclair does not report it.
>=20
> Hence, it was a misunderstanding of mine and there is no inconsistency, w=
ith respect to this rule, in adding parentheses around macro parameters use=
d as rhs of assignments. The rule does not require adding parentheses aroun=
d macro parameters used as function arguments and neither cppcheck nor Ecla=
ir report violation for missing parentheses around macro parameters used as=
 function arguments.


Thanks a lot for the detailed explanation :-)

What you say does make sense and I agree with your analysis here, only prot=
ect when part of an expression and not use as a subsequent parameter (for a=
 function or an other macro).

Regards
Bertrand

>=20
>> On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
>>> Xenia Ragiadakou (7):
>>>   xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7 violations
>>>   xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7 violations
>>>   xen/elf: Fix MISRA C 2012 Rule 20.7 violations
>>>   xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
>>>   xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
>>>   xen/arm: processor: Fix MISRA C 2012 Rule 20.7 violations
>>>   xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations
>>>=20
>>>  xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
>>>  xen/arch/arm/include/asm/new_vgic.h   |  2 +-
>>>  xen/arch/arm/include/asm/processor.h  |  4 ++--
>>>  xen/include/xen/device_tree.h         |  6 +++---
>>>  xen/include/xen/elfstructs.h          |  4 ++--
>>>  xen/lib/rbtree.c                      |  2 +-
>>>  xen/xsm/flask/ss/sidtab.c             |  8 ++++----
>>>  7 files changed, 18 insertions(+), 18 deletions(-)
>>>=20
>>> --=20
>>> 2.34.1
>>>=20
>=20
> --=20
> Xenia


