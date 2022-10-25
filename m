Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552360C116
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 03:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429469.680469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8qV-00020s-8b; Tue, 25 Oct 2022 01:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429469.680469; Tue, 25 Oct 2022 01:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8qV-0001zH-4Z; Tue, 25 Oct 2022 01:35:11 +0000
Received: by outflank-mailman (input) for mailman id 429469;
 Tue, 25 Oct 2022 01:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1on8qU-0001y8-1j
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 01:35:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4154549f-5405-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 03:35:07 +0200 (CEST)
Received: from AS4P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::20)
 by PAVPR08MB9699.eurprd08.prod.outlook.com (2603:10a6:102:31e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 01:35:00 +0000
Received: from VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5da:cafe::30) by AS4P192CA0012.outlook.office365.com
 (2603:10a6:20b:5da::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 01:35:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT034.mail.protection.outlook.com (100.127.144.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 25 Oct 2022 01:34:59 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Tue, 25 Oct 2022 01:34:58 +0000
Received: from a7622d7f2350.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63DE547D-CF02-4C4D-860F-CF5DE72A686C.1; 
 Tue, 25 Oct 2022 01:34:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7622d7f2350.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 01:34:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9954.eurprd08.prod.outlook.com (2603:10a6:20b:638::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 01:34:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 01:34:43 +0000
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
X-Inumbo-ID: 4154549f-5405-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S7slj3cDWrGOMMgCiOFEOMQXPazSGAZ/gHxsJkJjneTJZAbhOBt61zNfmX1nfm/6UlSfbh1vCgS7vLk0osGU+HOtjFJf6ZmNHj5ac9sjnOIyReskvGbgHgtSJVLzY3Fe2gZyJ02PmU9yNEjs5m2bIQlquZD7pU8YExyMRth1doGVi7FJAa36+a8Ca93sBjvJZHRp8X8s1bpmr7hbVA1V0RAaX2KN87hXqKZDzvTIMe/DZ7TIrB8R8YukNd65xPPRjMZzips/6FF1JU9bitrPIGP0zuBe9mZS/v/RZtSMZ/9kpNuQq/5vGo4x2i1J1ZTG6BVWsz79tPlw1wK39RRLKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoqdFGHZfe9bo5NAlol0Mzq2Y+3sE2s88KNckVqwgAI=;
 b=cpkc08hkXxZ/jfDnhZ51Fccm7sMEyOj14Mphxqa2FbL4xVnvpukCXdhoOKEfT2je60YN6NsLvDL5KGUyKJ7LS7paktYVnroXpmRsiyh2DfCFoYQhMFFaV002tqb2Iywz9jabmJ9eSkem+GYWUy0QGmyediSeh6oZHdj04Wf2jwhElh5bBUUf9ad9So93UmrF/4kC4nBVnVdaNjxAXtEVmz65MFQhQk36Ngf7HBNKQ55JT7ILOVemzHuJ8f/9BOrMnESjtw3zlCIz01AXyvZ90Q5MzwODRxnf9/kJXwDMKlylHroJARz35BJjx3iCjUi5eYeRvIoEoE4N745nkTL6+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoqdFGHZfe9bo5NAlol0Mzq2Y+3sE2s88KNckVqwgAI=;
 b=p/x42PoQPLUEctyOLhnt/f59rHkRzuVAhGy7Ni/9oN68EU+yr2mOXHzgzP+rVOG49LCNPV8aM4kD639VYlZqiQPG9AbhmTxI4dXHgnh96GNV7XCoIQ4o1S8Uq1YkmV4O+Uwc479QrgtQIQ66J52zmeUeg85nHrRSqnuQKXNtrGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bomybA0vYaouKrA/7PSUbThqCHXIZwq7yTou0A+YuOdu0IKd3jqY4O9RI7BPYpNLJNB0VguEZfj0ADtj3UDW2dQ+MIe5HUFTLKpPLDXUwXSEXcKEKNK+Hxrto95eSfOJeHaPmGVxX0VgNySQC5QhsrA+C66zNHUINKU+bpXIw7nIpJSUu8G3MvFOyLOHXZcmIPYwZFtunL8DXsWACQ5tbRQARFnPO1Z3VTtUVnPvBRMwGM8/gaMhhUke1d1XuNu5WWN/3CGz5rKUnJGYb8k0SdAvdS1glyS0ALvS6Tnvu2qC5q32NhrLwV/Dvew0EQTzStTniFYV8aqqV0fcSNB/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoqdFGHZfe9bo5NAlol0Mzq2Y+3sE2s88KNckVqwgAI=;
 b=QNRKPbHg99owKUhoV+FnB7JcrL0Gg7e76Rru5xZr2HTQVyuDIS1X42PYx7g+EeNQSrF26J27Dqe5nqp+/HgV5yP6z9vNQ/udydMG/CKlmZdFn9EsfGXszkFjEZnVsxgfi7gjDOfMOlgaYKP+SNh/dFOrom3BJxqo+/P3tNrxdHFeNo1K3Jc67ugJXIFdXXfOFRfJh0K8gTJXDwD5Ar1JaYrP/nch44u7CGNEwMBXmQhMI37D1F8Fy6iKgALM3uzVvlr3W0qbZFNj4OCb39P3+BiAnq9Febyif87+aZuNB6s6TRej+dd5ffYAg2Jztqh0rFNf4UrjNpuCsMZpvQJpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoqdFGHZfe9bo5NAlol0Mzq2Y+3sE2s88KNckVqwgAI=;
 b=p/x42PoQPLUEctyOLhnt/f59rHkRzuVAhGy7Ni/9oN68EU+yr2mOXHzgzP+rVOG49LCNPV8aM4kD639VYlZqiQPG9AbhmTxI4dXHgnh96GNV7XCoIQ4o1S8Uq1YkmV4O+Uwc479QrgtQIQ66J52zmeUeg85nHrRSqnuQKXNtrGs=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, "Andrew.Cooper3@citrix.com"
	<Andrew.Cooper3@citrix.com>
Subject: RE: [for-4.17, PATCH v2] automation: Explicitly enable NULL scheduler
 for boot-cpupools test
Thread-Topic: [for-4.17, PATCH v2] automation: Explicitly enable NULL
 scheduler for boot-cpupools test
Thread-Index: AQHY56Dh3WoyrbPBzESSx3/Zf+sWVa4eTsyAgAAFwFA=
Date: Tue, 25 Oct 2022 01:34:43 +0000
Message-ID:
 <AS8PR08MB799168EFE670DE74F2EAD86792319@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221024120443.16202-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2210241810200.1151068@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210241810200.1151068@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DDEF1D1DC8E50B4F87D4AE5EA6CE25E7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9954:EE_|VI1EUR03FT034:EE_|PAVPR08MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 4995ce3d-26b3-4dd0-22f4-08dab6292128
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AqB7WwTHe4u3ii2njESdaedQH2SI5vxh7k9zr4l1T9NG11SpQQfwqzzmeyxYY/teWCR47CbeBFI3hwFGXkl8O3fNM9HylJ8KEwxnUCrDP6n+8VPoYqj3vuDjcv+0qn4gpI+HHvl7ldfjt5b7HJ/i/M6d5l3xxRh+Hf/tkuKVI7Q1qgDcvLyz4xz4cN6IDxrzuMbi4MWKMwCFWZJIjifQaLRUFOso4CV0WC/fhkgU7+xjZK1Uup8kqIXorkYw4fc+VhsYhJyK+QV6poEl0vAPVZjTyb3Jz9vGRewqgWwoJcpOk19qhmAjZXmdH5ZFyS4o+6RvxB2myD3V11lS1Lp6lpq5jIwY/YcQdNdLlS3m6rOmhkuOIDUlF9K0jurapEg0WMeydTphfW5/+4uGDCksJRshZmDuG54MxeMgKM6i7QvhlCcvGDLQP5b1KZTLg4wtis5xL4LSPvvX3V6qeSHv5XIYaH23HOeMzvcAAL0ncld+BVWkb0JQOtHn7aGYVl9gcTmY1ELxOdpOWVnYq85j91z+9lexFg0CfACqyL1E9sB08Hc/rAFSem0nAqnhUhsXaca0zMhTpOw1I5czjttkLUc4GYMjtlSbkkb3s6TOGrzfkaHFP5HkakNMyHYVbiaQBLnmdkZ3g8EK8bR6Umne5OZztyIgjhlKCbO2+yZpLgTTm6GZvqqkfYMvtexUvJ2QDf7HR5UDyNB/YljjuNo96Bx5oi5D4uYuVKTAT0u+MuXMk7Ccxlm+nbdyR17G4OzGQvK9+l2NX889NIfvPqfg/Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(71200400001)(83380400001)(86362001)(478600001)(110136005)(8676002)(4326008)(7696005)(41300700001)(9686003)(26005)(5660300002)(316002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(6506007)(54906003)(52536014)(8936002)(38100700002)(122000001)(33656002)(55016003)(186003)(4744005)(2906002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9954
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a93c62a4-e29b-4d27-319b-08dab62917c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vzEUPBUp0BZwytGGZ3lmKOnHGZ/Aj6MynIz9dvUWBiDbVZcMXhJCj4oqfYk5TsTlvrUnRJKPkJrmBVSrDik4IKseJ1P0mkQw7l7ISXOHiL+WlF0KVNgn1GI7IYBDB8z3+cGFExp/1rOUB6iaofeZROhdvMRq9Llom055VE5VZ3CLEl1B8gM10RZuBgTHR0IgLJnB+trfuFZTBEqozxOMS7oOGBxUt/IT1bJVnYeX/HJz/GIJAAWGYCpXu16LTV0ollqXTICOEpYPdF5dphPaNbH3cJHb7Q+zqT6N7MT+AXLbgjf+m2QDLG1lvtUdtlT9hi5+9H0u78QhQdP3jCD7cJGX86BJJXbHdVn8pJcwzSSTg43KlVIsZ7OWmXL5Dl1llO0udexyOiYst0JqZ92RLYJwBU0LH4QtZlCq8EVVmGY0sM8G26ohymriTfCM3r/OrXw6aWlJEMUBH4afU0mM49WhdU7Mn8heRrw4WiDbeEmJSCzowfoAnVq3TqTbxvfcGJKTsXYG32AuMdiZO53KwaV3w9WcpUdDLpWu0vewlw+o0fcXPU/XHBxfLD4noSQtxslFeIeyogNd5ScjcqtDLv2Qrce435hbBKmYVpojKRNzBoTxeq5jwHIZOGjs6ttCprW9QkNkCBlkLrDF0lCGupTqF/iGe0UO7dA9vCqd8SeHL/RxfsmY5IzC0e6wHGicrBhI+UMpF++4xjwbU6Y9muihBdn0IjnnjUyLmJIwu2h6/Dk/LVJwk0LFnv9ImqkdZ+rt912HbaZrdiKYEPcaXQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(186003)(8936002)(5660300002)(2906002)(4744005)(36860700001)(82740400003)(336012)(83380400001)(47076005)(86362001)(33656002)(356005)(81166007)(54906003)(26005)(110136005)(478600001)(9686003)(40480700001)(40460700003)(70586007)(316002)(55016003)(107886003)(70206006)(41300700001)(8676002)(4326008)(52536014)(6506007)(7696005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 01:34:59.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4995ce3d-26b3-4dd0-22f4-08dab6292128
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9699

Hi Stefano and Michal,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [for-4.17, PATCH v2] automation: Explicitly enable NULL
> scheduler for boot-cpupools test
>=20
> On Mon, 24 Oct 2022, Michal Orzel wrote:
> > NULL scheduler is not enabled by default on non-debug Xen builds. This
> > causes the boot time cpupools test to fail on such build jobs. Fix the =
issue
> > by explicitly specifying the config options required to enable the NULL
> > scheduler.
> >
> > Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time
> cpupools on arm64")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> I would like a release-ack by Henry on this

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


