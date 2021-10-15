Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163B42EE8D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210168.366924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKDb-0007lv-Ij; Fri, 15 Oct 2021 10:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210168.366924; Fri, 15 Oct 2021 10:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKDb-0007j0-Es; Fri, 15 Oct 2021 10:13:39 +0000
Received: by outflank-mailman (input) for mailman id 210168;
 Fri, 15 Oct 2021 10:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWEc=PD=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mbKDZ-0007iq-Md
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:13:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e78dc42-2da0-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 10:13:35 +0000 (UTC)
Received: from AS9PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:20b:48b::11)
 by AM6PR08MB4456.eurprd08.prod.outlook.com (2603:10a6:20b:b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 10:13:33 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::f3) by AS9PR04CA0069.outlook.office365.com
 (2603:10a6:20b:48b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 10:13:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:13:33 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 10:13:32 +0000
Received: from 41f811c56e9a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5C82085-1852-443E-9583-32E12AD01F69.1; 
 Fri, 15 Oct 2021 10:13:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41f811c56e9a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:13:23 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5951.eurprd08.prod.outlook.com (2603:10a6:102:ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 10:13:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:13:19 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ae::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:13:19 +0000
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
X-Inumbo-ID: 8e78dc42-2da0-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iohhfgrr3LCvkvtkU3E3dhPp19PWUSdlUFKzONORix4=;
 b=MEnUOXT6xaArxqr/QMFf1QPQmVRIlj4N4CkoHTdtRWZVswIYbKnAWSdqwI1uBte9Xa+JQaZbAsN3CgjGrCw0rmr43zQ8cm6ppNrN+aq25up2p9Lz2C6e+XRo73l4kTx2XtAbRZwJcOzUtxnw2R6NFZzSyUzt7V2XdpNKL8/8PgE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a7781c2fd872a67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJyJ2vnSFQP1M0V5zqlX9dggjrGJIfooeraHb2Dibb1LONobkHO68J2eLWKV1m7WyT8Sx9nDej1Yklr/zE+/rUvNRyX9jr+rT9eL8PfcwMvPmdphivkurZFvvortiSc3aZJG+2tbuI3okvuXA3IziU3PHMZOR9e9ehwyIdMVJcsacecFOwgsQfdRIj7Hp3XUe3zIDq5QqHnUfP088Xusz6aE99NjolqjfJZKxuwZ6G9QFWUkBxdaYdjI5zS2wsy+1Z1GTjmtwOz0k0WjLEx0FLRW+E9+v977TVCZ4/MzSrAGL+eEY8s+GZCsUpfFf+OtfysG8v+FVD82G1a1ztHjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iohhfgrr3LCvkvtkU3E3dhPp19PWUSdlUFKzONORix4=;
 b=l71sMyy+mupsa3S9Knc6uwDkqokHD7AZQG4uWz7uKm+mZzOiOHWC8/HKqun7Q37OP5rTO8pLXLZvGtG+nyIaBvhpp1VsPcMKEuWA5sPxVUSw8QE5YeN984Z007yw8fOEscpZ3M4JqVaTPGHt38Dut8839c1SxMFKYon0YPDBBfZ7wdCEy2NxoMF4HoNlwGYsN4gdhg2b3o2LonQFtzwwMhp7gngAOR9njvCzH/tU9rmhgGmQQsbGsqUz/v1QOJocpFdUe5+o256R4sZeRPe1vf1R84FtAW/qP+NJrJdqQnzkBJQdbQSM5mmlfYfX60mjyKKzrYc2AxvbZZI02aGw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iohhfgrr3LCvkvtkU3E3dhPp19PWUSdlUFKzONORix4=;
 b=MEnUOXT6xaArxqr/QMFf1QPQmVRIlj4N4CkoHTdtRWZVswIYbKnAWSdqwI1uBte9Xa+JQaZbAsN3CgjGrCw0rmr43zQ8cm6ppNrN+aq25up2p9Lz2C6e+XRo73l4kTx2XtAbRZwJcOzUtxnw2R6NFZzSyUzt7V2XdpNKL8/8PgE=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
Date: Fri, 15 Oct 2021 11:13:13 +0100
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E80D6A5A-2556-49C4-A9F0-E85CCD44D1A8@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06b6e886-ce2a-4422-54a7-08d98fc4719e
X-MS-TrafficTypeDiagnostic: PA4PR08MB5951:|AM6PR08MB4456:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4456BF65911278A555E0C991E4B99@AM6PR08MB4456.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FRgYwfC58/1SMqTOIEsyhx1lpF5U5r0b6BHGxxDwJiUbC78hzVzWqALxlMgXvwzCiG+pVRr4hlbOz3tomu41dfNkIgEJRSz9hG890zlxO6aceDtLUwn3V/Xz0EwFI2C19c5/xVR1RDZtNb2dCxAru3/oDuccEVxVgyxShUV4JKIrz27372XtTK87NqDd59hcrB9lFQPHrHqOUcHa3yp0Hx93GMRWOqezBOZZ02hUvuSKlgk5y3SRYruLzATF5F7B+EvwrWHEfnHRsm2ogcqrDRtzBzgVLeAFjf/E+GsY8MYECqGBusyAnn9rhMyNvS5RCFXiTd0bl0JC/1xYaQKxhP8hUE6cm9JIWbg2eqKx33p5ahuhektKZod6MRqIVpwlZZHtcGx9g4RAYH6TDZ2Jl8FnqfzDlL2EAXVGBnPbA+19i0mRgUAI4jEgcag6r83NL1W27180+bf3QCUGVWjfv0bHhNg4Lc+zONXoJ4UKZvZVTbxX5irR8QUfh62Bja6+pfoH9okdzhUXSDdaE3CmpOprV8Ld9AjPnX0ZSaH+6piJkXQelqP5xUV9cs/PdyUxZjYiF68vjrIbE71IQPkzq6NPFLbRmHD1MP0dNIv7z6e28wkjTbbGV4mQGo0Y7s1ZlaIOSjptAPL8mgLsGTK09r8iWdxz7dlq9z+maRM3PAPsKY9glYjg3AQpkrgn91iC/5IqBtN2Oju+RTi2uoGytqEIPoKkyiTZ4hvUsmQggolSlAUm7oUy2CG7Z5w+txHeotDxxEmO7y2ieUYLUzfKmumChTp8tmPfQpylPlCNpif/orvl5FaMn+lNEpeAtCgH0aA3bnjxGhCAf6AEiERsk7aEKJLF9JSzegFGMm+uexZqvp7afY0UN1O/6WIALkFe
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(26005)(53546011)(30864003)(6506007)(508600001)(38100700002)(54906003)(38350700002)(37006003)(6666004)(4326008)(66476007)(66556008)(66946007)(33656002)(7416002)(2616005)(956004)(6486002)(44832011)(8676002)(6512007)(86362001)(966005)(6862004)(52116002)(83380400001)(316002)(36756003)(6636002)(8936002)(2906002)(2004002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5951
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06fcd33c-ef71-4306-2bbb-08d98fc46973
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ero8ZkQf4qoGYjTcVTRRsubOe/V8bfSXmO5kgC959VhJmZ0adS5iPP9d2iP5Yqd3f4IoiJdQGgYOXlmGkEf5PMfnSdGVdX1lDieBW9tOwJme2kRKgzYQMZ8UkvYllz1h/0OQ9ovmpV1Aa5QsEFwCN9OkeJyJe0bG4wzzz4UW4C2p8C5vZIvNT1OJWu7QgyQkAN5jCFwa1yKgAQwvB9q1+6HePkHaJ5fiwfM2SbVmflcgN98O8U9CgWD+KUZC9bQrVMqLz3yfFZq47YQski/hYzIDZGw7WVTnzdYjCk6IXWvVNr0U47OPMAcOYwh2xiQN34VTnzVx874zUMX7OBvCdy+phVAER44xWntg7d/mc+J3/k2nUOJZjb+co+mqqtLqt1oIifzZDiZ7JuipNLiseKnkdY939X4m5Y4mxKXIXwkucIAXF7HBtyEwzvPEDj17OMw56ze3Gs5f5LJ1l26A5Vk7mQu2l96nCsEJbHo42/TALJoCieAdwm83T1VtviPjDHgwWLArZZkr2rAzgf+q6haZ5VOOk5w2Wp379vu/wuLQHPGCntRFriEttxZcJSnUcwDbHQtB+8fV9ETmZezyJ5TdHmZxl5n22gCuG6KqfpAv/Ke3H3UQB8Y5FiWVaUV+8bYFxefadWQW/nL8FAqBuX/Ke+y53pxlnFFGKThbe3TFhBqW9SKvX1kJoIfOsNt/XkyxgnbaS05zoBYILn7CxR/5cAYxTzXRDcsyOdetI0hQ6NKhH4vv7YMjmDOxWxYEkOB9ikJ7t0pQBIqkH3sMddyzg23dPerqh/PrVpsB+leI4+MfxGjs7Bj1wqouQicGhCasjqTJTO1TDN2jFh5givUuQTc01Y8RyTQ7X0gAKSM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(33656002)(8936002)(508600001)(83380400001)(6636002)(966005)(956004)(2616005)(186003)(47076005)(44832011)(8676002)(26005)(30864003)(86362001)(6666004)(36860700001)(5660300002)(82310400003)(107886003)(4326008)(2906002)(53546011)(316002)(81166007)(6512007)(54906003)(336012)(37006003)(36756003)(356005)(6506007)(6862004)(70206006)(6486002)(70586007)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:13:33.0782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b6e886-ce2a-4422-54a7-08d98fc4719e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4456



> On 15 Oct 2021, at 10:52, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Roger,
>=20
>> On 15 Oct 2021, at 09:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>>=20
>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
>>> From: Rahul Singh <rahul.singh@arm.com>
>>>=20
>>> The existing VPCI support available for X86 is adapted for Arm.
>>> When the device is added to XEN via the hyper call
>>> =E2=80=9CPHYSDEVOP_pci_device_add=E2=80=9D, VPCI handler for the config=
 space
>>> access is added to the Xen to emulate the PCI devices config space.
>>>=20
>>> A MMIO trap handler for the PCI ECAM space is registered in XEN
>>> so that when guest is trying to access the PCI config space,XEN
>>> will trap the access and emulate read/write using the VPCI and
>>> not the real PCI hardware.
>>>=20
>>> For Dom0less systems scan_pci_devices() would be used to discover the
>>> PCI device in XEN and VPCI handler will be added during XEN boots.
>>>=20
>>> This patch is also doing some small fixes to fix compilation errors on
>>> arm32 of vpci:
>>> - add a cast to unsigned long in print in header.c
>>> - add a cast to uint64_t in vpci_ecam_mmio_write
>>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> Changes in v6:
>>> - Use new vpci_ecam_ helpers for PCI access
>>> - Do not set XEN_DOMCTL_CDF_vpci for dom0 for now (will be done in a
>>> future patch once everything is ready)
>>=20
>> Isn't the series missing a revert of XEN_DOMCTL_CDF_vpci? I think
>> that's what we agreed would be the way forward.
>=20
> A separate reverse patch for that has already been merged:
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D9516d01ac3015f=
522528ed6dafb3f584eaa7ed2c
>=20
>>=20
>>> - rename REGISTER_OFFSET to ECAM_REG_OFFSET and move it to pci.h
>>> - remove not needed local variables in vpci_mmio_write, the one in read
>>> has been kept to ensure proper compilation on arm32
>>> - move call to vpci_add_handlers before iommu init to simplify exit pat=
h
>>> - move call to pci_cleanup_msi in the out section of pci_add_device if
>>> pdev is not NULL and on error
>>> - initialize pdev to NULL to handle properly exit path call of
>>> pci_cleanup_msi
>>> - keep has_vpci to return false for now as CFG_vpci has been removed.
>>> Added a comment on top of the definition.
>>> - fix compilation errors on arm32 (print in header.c, cast missing in
>>> mmio_write.
>>> - local variable was kept in vpci_mmio_read on arm to prevent a cast
>>> error in arm32.
>>> Change in v5:
>>> - Add pci_cleanup_msi(pdev) incleanup part.
>>> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Change in v4:
>>> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
>>> Change in v3:
>>> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled =
variable
>>> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
>>> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
>>> Change in v2:
>>> - Add new XEN_DOMCTL_CDF_vpci flag
>>> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
>>> - enable vpci support when pci-passthough option is enabled.
>>> ---
>>> ---
>>> xen/arch/arm/Makefile         |  1 +
>>> xen/arch/arm/domain.c         |  4 ++
>>> xen/arch/arm/vpci.c           | 74 +++++++++++++++++++++++++++++++++++
>>> xen/arch/arm/vpci.h           | 36 +++++++++++++++++
>>> xen/drivers/passthrough/pci.c | 18 ++++++++-
>>> xen/drivers/vpci/header.c     |  3 +-
>>> xen/drivers/vpci/vpci.c       |  2 +-
>>> xen/include/asm-arm/domain.h  |  1 +
>>> xen/include/asm-x86/pci.h     |  2 -
>>> xen/include/public/arch-arm.h |  7 ++++
>>> xen/include/xen/pci.h         |  3 ++
>>> 11 files changed, 146 insertions(+), 5 deletions(-)
>>> create mode 100644 xen/arch/arm/vpci.c
>>> create mode 100644 xen/arch/arm/vpci.h
>>>=20
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 64518848b2..07f634508e 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>>> obj-y +=3D platforms/
>>> endif
>>> obj-$(CONFIG_TEE) +=3D tee/
>>> +obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
>>>=20
>>> obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
>>> obj-y +=3D bootfdt.init.o
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index eef0661beb..96e1b23550 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -39,6 +39,7 @@
>>> #include <asm/vgic.h>
>>> #include <asm/vtimer.h>
>>>=20
>>> +#include "vpci.h"
>>> #include "vuart.h"
>>>=20
>>> DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>>> @@ -773,6 +774,9 @@ int arch_domain_create(struct domain *d,
>>>    if ( is_hardware_domain(d) && (rc =3D domain_vuart_init(d)) )
>>>        goto fail;
>>>=20
>>> +    if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
>>> +        goto fail;
>>> +
>>>    return 0;
>>>=20
>>> fail:
>>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>>> new file mode 100644
>>> index 0000000000..7c3552b65d
>>> --- /dev/null
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -0,0 +1,74 @@
>>> +/*
>>> + * xen/arch/arm/vpci.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License as published b=
y
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +#include <xen/sched.h>
>>> +#include <xen/vpci.h>
>>> +
>>> +#include <asm/mmio.h>
>>> +
>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>> +                          register_t *r, void *p)
>>> +{
>>> +    pci_sbdf_t sbdf;
>>> +    /* data is needed to prevent a pointer cast on 32bit */
>>> +    unsigned long data =3D ~0ul;
>>> +    int ret;
>>> +
>>> +    /* We ignore segment part and always handle segment 0 */
>>> +    sbdf.sbdf =3D ECAM_BDF(info->gpa);
>>> +
>>> +    ret =3D vpci_ecam_mmio_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>> +                              1U << info->dabt.size, &data);
>>> +
>>> +    *r =3D data;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>>> +                           register_t r, void *p)
>>> +{
>>> +    pci_sbdf_t sbdf;
>>> +
>>> +    /* We ignore segment part and always handle segment 0 */
>>> +    sbdf.sbdf =3D ECAM_BDF(info->gpa);
>>> +
>>> +    return vpci_ecam_mmio_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>>> +                                1U << info->dabt.size, r);
>>> +}
>>=20
>> I'm not sure returning an error value here is helpful, as I'm not sure
>> how native Arm behaves and how this error is propagated into the
>> guest. FWIWreturning ~0 or dropping writes is what we do in x86 when
>> vPCI is not capable of handling the access.
>=20
> Mmio handlers can take a return code on arm if something did not work
> so I think this is the right way to do it on arm.
> Now has agreed with Jan, we will change the return type of=20
> vpci_ecam_write (also renamed) to be a boolean.
>=20
>>=20
>>> +
>>> +static const struct mmio_handler_ops vpci_mmio_handler =3D {
>>> +    .read  =3D vpci_mmio_read,
>>> +    .write =3D vpci_mmio_write,
>>> +};
>>> +
>>> +int domain_vpci_init(struct domain *d)
>>> +{
>>> +    if ( !has_vpci(d) )
>>> +        return 0;
>>> +
>>> +    register_mmio_handler(d, &vpci_mmio_handler,
>>> +                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, =
NULL);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> +
>>> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
>>> new file mode 100644
>>> index 0000000000..d8a7b0e3e8
>>> --- /dev/null
>>> +++ b/xen/arch/arm/vpci.h
>>> @@ -0,0 +1,36 @@
>>> +/*
>>> + * xen/arch/arm/vpci.h
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License as published b=
y
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#ifndef __ARCH_ARM_VPCI_H__
>>> +#define __ARCH_ARM_VPCI_H__
>>> +
>>> +#ifdef CONFIG_HAS_VPCI
>>> +int domain_vpci_init(struct domain *d);
>>> +#else
>>> +static inline int domain_vpci_init(struct domain *d)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>> +
>>> +#endif /* __ARCH_ARM_VPCI_H__ */
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pc=
i.c
>>> index 3aa8c3175f..8cc529ecec 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -658,7 +658,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>                   const struct pci_dev_info *info, nodeid_t node)
>>> {
>>>    struct pci_seg *pseg;
>>> -    struct pci_dev *pdev;
>>> +    struct pci_dev *pdev =3D NULL;
>>>    unsigned int slot =3D PCI_SLOT(devfn), func =3D PCI_FUNC(devfn);
>>>    const char *pdev_type;
>>>    int ret;
>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>=20
>>>    check_pdev(pdev);
>>>=20
>>> +#ifdef CONFIG_ARM
>>> +    /*
>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci han=
dler when
>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>> +     */
>>> +    ret =3D vpci_add_handlers(pdev);
>>> +    if ( ret )
>>> +    {
>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +        goto out;
>>> +    }
>>> +#endif
>>=20
>> I think vpci_add_handlers should be called after checking that
>> pdev->domain is !=3D NULL, so I would move this chunk a bit below.
>=20
> On arm this would prevent the dom0less use case or to have the PCI
> bus enumerated from an other domain.
> @oleksandr: can you comment on this one, you might have a better
> answer than me on this ?

For my understanding, as also Jan pointed out, this should be put inside th=
e
If ( !pdev->domain ) because also as the comment suggests, this operation
should be performed only when there is a Dom0 and when we are using
a dom0less setup the pdev->domain should be NULL if I=E2=80=99m not wrong.
@oleksandr maybe can confirm

>=20
>>=20
>>> +
>>>    ret =3D 0;
>>>    if ( !pdev->domain )
>>>    {
>>> @@ -784,6 +797,9 @@ out:
>>>                   &PCI_SBDF(seg, bus, slot, func));
>>>        }
>>>    }
>>> +    else if ( pdev )
>>> +        pci_cleanup_msi(pdev);
>>=20
>> I'm slightly lost at why you add this chunk, is this strictly related
>> to the patch?
>=20
> This was discussed a lot in previous version of the patch and
> requested by Stefano. The idea here is that as soon as handlers
> are added some bits might be modified in the PCI config space
> leading possibly to msi interrupts. So it is safer to cleanup on the
> error path. For references please see discussion on v4 and v5 where
> this was actually added (to much references as the discussion was
> long so here [1] and [2] are the patchwork thread).
>=20
> [1] https://patchwork.kernel.org/project/xen-devel/patch/9bdca2cda5d2e83f=
94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com/
> [2] https://patchwork.kernel.org/project/xen-devel/patch/f093de681c2560a7=
196895bcd666ef8840885c1d.1633340795.git.rahul.singh@arm.com/
>=20
> Regards
> Bertrand


