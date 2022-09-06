Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227365AF702
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400127.641772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHn-0007c7-JY; Tue, 06 Sep 2022 21:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400127.641772; Tue, 06 Sep 2022 21:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHn-0007Yu-Ax; Tue, 06 Sep 2022 21:39:11 +0000
Received: by outflank-mailman (input) for mailman id 400127;
 Tue, 06 Sep 2022 21:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVgHA-0000Cs-4I
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 139e8272-2dd6-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 13:21:39 +0200 (CEST)
Received: from AM5PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:206:1::28)
 by AS8PR08MB6677.eurprd08.prod.outlook.com (2603:10a6:20b:39a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 11:21:27 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::b2) by AM5PR04CA0015.outlook.office365.com
 (2603:10a6:206:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 11:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 11:21:26 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 06 Sep 2022 11:21:26 +0000
Received: from 478a74f64546.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24A74AD9-070C-4590-9DF5-BA9DB30B1EA2.1; 
 Tue, 06 Sep 2022 11:21:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 478a74f64546.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 11:21:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7491.eurprd08.prod.outlook.com (2603:10a6:102:2b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 11:21:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 11:21:13 +0000
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
X-Inumbo-ID: 139e8272-2dd6-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HEHekkQnyWMyFop2e3ZmtlRBgyByvtHDYQiuHEsnShM54w6ksCu9XD9tfuFV3JsTXHZC0tWhd9OFupVg8N0sYuX3AWmfB1xWZ0jXH6pMsnuYwW2Wy823GTfblEDfOD+KW+s7KQZ88pU1oQ7J4l3NXYCapCRNqxGH9LWBE6iEvUsJ8e0S7yhe4CPW+2mpzE1nhFi5SUUWdvkGCBQxnzO3xte1v5Zi0E9qPam8rt+jPMwKTUNMU8uAJJ9123TsuwcwBbc2W7po/42jKI72wfLujOQhS+NOekrIj8svqnUOt7UhIPNArrJZLzT++iw+tetZuGUw4FOnHkVXe+tomVs6TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1SSNS3eg7SXX1hODtJoNFP6P0KDOOlpSytHYp0jhc0=;
 b=nFjen6jxxr7H48ZyOkvLJm/Ee2RygKfix55g+MGtMaiHHM2UBR/WFEzjGnVY8bfNml5J9hjR3vXpFHgKETHE/gSMgGlLMWsVlRr86CCRZNn2xX6BjeVbpoP+rz+DPn+WNCawuhbjGzJfal/j54pQPTdC+Kewv5+ksEWOsWvy+1gvVZlI0X66UVC7xO8SaU0yV+yV3Zjn2BTOAEcarynf3faAK5rKc3DHtiWq8dsAtZFtQFH6EwSbCfU/GqkOgNdCEndOKz74lvPeRqWteTpCcWmdrLNEdzJptBwxta9Eld1tu66UbqlYr7eiYgk52KP0NFuyFsewHraAE4+yGFrjKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1SSNS3eg7SXX1hODtJoNFP6P0KDOOlpSytHYp0jhc0=;
 b=aFnbO1fhH027Ynm9UBrdyKUMQ6nIkKOiLlTnH0gag4uUeFjX3Obe2zqukmbaeAHp10y4KKj+gU8YqpjOsBE4Kav60SP3UjPpFiPpECvsmtaEr2GiGcwJTB2wMl/CgV7zIKAOuiQq5Abt5IrOtrosGt78BYq3peKb6pfuapwCjZg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps3QuBWg9Z3ZzvV9gYOWf73ZNxisbyNA7soXWh++S/RAI+cAML/dq+1XouhS4J/HOHCAxr6hWbUYV5uSGG8aElMnhLxRHne37G0sHUOOuStxERXHU/OatKY9uBSYALRWwEwHMGPOK0gUSMlQn1MPPv7aSD6uAJg71b1UwbQBszp/vZkKDdAOksVT/rGTr5sUs9SJPFAq3K1kH/+J3RgrjMh1PZITuDiVwFR1RYAwMYTspE81IIJ5gBGEN6VzQfq9/kYzdpBfIvSOVXSEIi6pNr/2mf7jblPdlAMppj1/an0bROLxo77ztxvQKt00gRO9Crfoz2Kggml7YJwLDeNBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1SSNS3eg7SXX1hODtJoNFP6P0KDOOlpSytHYp0jhc0=;
 b=gHyx66Uak4u8FvFKaJtl7hSpoEEIrRlpvQLiwSw0oceXlJrjo1+0aPY/gGHPa96WhJQX79yeO4xj4E4dqZeAcfXqs2G8qaMAb90LeM2tf8n50Pqb95QhtnY+QMAeOpYPNm6XJMUby0i02NR1Ax1uYnXoSNpodzm1SL1k7j4cFyX3Go68tHr17AmZJJr9V2sqjtFcvI8mzjW5MUb+BylInw0ZT3czM4rVCoXOX12Qjw3s+g0JtHNZ5MQvokftDdgLE0r7yHKCCJOcCBeAgy2y1GuaIRvDHVTwXd9YupKQ2mY1AXrK6ZGdiSLa+GX2TW+df7MXA8LlrR3O0qI4uv4Llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1SSNS3eg7SXX1hODtJoNFP6P0KDOOlpSytHYp0jhc0=;
 b=aFnbO1fhH027Ynm9UBrdyKUMQ6nIkKOiLlTnH0gag4uUeFjX3Obe2zqukmbaeAHp10y4KKj+gU8YqpjOsBE4Kav60SP3UjPpFiPpECvsmtaEr2GiGcwJTB2wMl/CgV7zIKAOuiQq5Abt5IrOtrosGt78BYq3peKb6pfuapwCjZg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Xen 4.17 release: Current status before the feature freeze
Thread-Topic: Xen 4.17 release: Current status before the feature freeze
Thread-Index: AdjA2VmJ6EcVoZ5cTOOgVSRHep4cQABAa48AAAGq5sA=
Date: Tue, 6 Sep 2022 11:21:13 +0000
Message-ID:
 <AS8PR08MB799148D177260178423E2D29927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3ff2be60-0a25-638d-53ce-bb7d861c0a9f@suse.com>
In-Reply-To: <3ff2be60-0a25-638d-53ce-bb7d861c0a9f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5E96B3AF57AD0B4EAC4D5AA659E74DF4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1c0281f8-b4e7-46a3-de84-08da8ff9f085
x-ms-traffictypediagnostic:
	PAXPR08MB7491:EE_|VE1EUR03FT047:EE_|AS8PR08MB6677:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CB2quD2MZeMcduzY9C52PdY5mpW52g9N63+MbTopPe3aenbhRfFmTLRtXNwYS0B+7ZL/nu5u3VUEGTIx8fdVJxci8FiJcbUWhg59x905aCrN0dmrSoyF2kz3eGX5vMFZVjIOsBWFCLjUAK6MTW4axguz3Q0goxnKg1b8ixs5yHQTpP5SbJgNDi4/O2Gu+uFTv3HE7qOzjHg1KzPG8y+BO0dgUx4Dek/3XFd66Y48aKuKc6yHuwzLOEd+F6rDBja85pQLONyggD/SJfxdqfIIYySC4vLXmuunU/VILbngMZRs1gbV0k8xIdIcHMruVYHpaH2+drpXbAQJbdhbCHOz9xDpSZjgg99VEhBiKbkNH1g+kr/eIWvrTayETqkPmKvWOXpEbv+70JtTisashs+zdQgVhWqQE14r0nk+r3CIaeDgbfOS5NQrz5on7vzTW8mblwiio5H14240cEL/WpmJkLegbbfqRFUxZHtaeGoq43QflCRZmuopKWeVBqLNokPzPY8RaJy3si9X16FQ1qMSdrziW6yyYgyAOZVe+REQVBsIfDytW6yEXXAy59iPACJtpEfqUQni8FIVcCo80wallve3HydJ4J5+7jhg0yDBk1kSDdXsMPVOUOs71twobocY8ANNflj3ykyLlUMu7iJkDKmsKl+FGWGEXtZB3q3as1tfXZdiPTYv6bo9sBOEUtJ2SVvJhzKwWEfXDrMuGfpUrcpZ9zHIHsGnqWEED7fh/RDjExAnU+ukLTy8Hs1Hrlv5dlbvrizHKFbT+op6j+DBB879ctl8byfWn9iG7DliKABMqpICxI3cpRBfaIZzeiq+jHyhe1PeSLVIjdFe/jRvGw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(6506007)(7696005)(53546011)(966005)(6916009)(41300700001)(316002)(71200400001)(54906003)(478600001)(26005)(86362001)(9686003)(38100700002)(122000001)(83380400001)(38070700005)(186003)(55016003)(2906002)(33656002)(52536014)(5660300002)(7416002)(4326008)(8936002)(66556008)(76116006)(66476007)(8676002)(66946007)(66446008)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7491
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f50d413-a88e-4651-b3ed-08da8ff9e83f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LuQG3xYN7ozjEYFv4ADtVAcMWa0l3lZ+5Na0bfyyd46RF2QCCqAOyEsJaUIgWd8PlPo28JLved0jrYNj6rSfyk3KuqlKXxVglZhCEchd4MGaAka1X5TUlp4EYmQlJYYvSo/ISvqLKIW/ZvWppqYHzJshluvpWbGX9vut9LxWf9Yu2rrOD7HKlTsBjWGRwxxJdRvtJJ7qZDLiBjhOPOedSFJcpSMSbajN7XfNcyZ31W1jQQKKCvrv4THlzouUO4OSuHOOxxXuuzNkHyqIrUn51c3c7PAUTdgRSapSgag7in17E7wDVbUlHw2KReXKqciAj6cDrKC7gjExP/93trO/wKwEIOHNNxMAkVd1dBOdw1yAL28ugJfiMHH02O06kwUyflKw9nOniXEc2TH1erLB9zBxSa4ic6AVKa3iywkjfqSjCrnseHZAgF84AacyBs1Tu/OFhHLxEOqOGHERTHR86E5u1XkYOIOa96nwkTS7DtnzoYD1AeHCJK8ZUJBcPE9t5XNYNi4iHsSZEsPtkNMek2jSB4GvVlADlN9qQ8V5L6INjo1mj4G7/rnvPpJe9kvNkh+qBLkLooAffTOQ/4+E+saUTCZEARaJoMqn8TkftE8Bd7MUyKyyUvQydLHoLYjISHeUBI4iTCdT6wsA493LnHoMes4g/0OokNSqTAWhDJAyOwYeXKQ+4YPntQGrBjRMJxJA8e9fm4H2pMyMrZa4JueWWDCaDpC95zsXaI94o1e52bydMlK5otNx/s5xvSxr3uqfamWqwkVej+69aFV1thkfAqQhIlh80+oPn2UnWlhdXIProh3WGUWlE3mrnzZrom5AU2e5cJIDGf14ByJT7UGE4LJodrNeL4foBLIGtV8NVWHWQRogKN8MLzhM/eyilsAm8dPBMHF5ik1Tdh9HWw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(36860700001)(33656002)(6862004)(2906002)(55016003)(52536014)(83380400001)(8676002)(40460700003)(82740400003)(40480700001)(70206006)(70586007)(4326008)(316002)(54906003)(86362001)(82310400005)(47076005)(81166007)(336012)(6506007)(26005)(186003)(356005)(9686003)(41300700001)(7696005)(53546011)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:21:26.9874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0281f8-b4e7-46a3-de84-08da8ff9f085
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6677

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFhlbiA0LjE3IHJlbGVhc2U6
IEN1cnJlbnQgc3RhdHVzIGJlZm9yZSB0aGUgZmVhdHVyZSBmcmVlemUNCj4gDQo+IE9uIDA1LjA5
LjIwMjIgMDU6NDQsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gKiogeDg2ICoqOg0KPiA+IDEuIFt2
Ml0geDg2OiBzaG93X2h2bV9zdGFjaygpIHJlcXVpcmVzIGVuYWJsZWQgaW50ZXJydXB0cw0KPiA+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2Vy
aWVzPTY2NzExNA0KPiA+IFN0YXR1czogTmVlZCByZXZpZXdzLg0KPiANCj4gSWYgSSdtIG5vdCBt
aXN0YWtlbiB0aGlzIGlzIHRoZSBzYW1lIGFzIGJsb2NrZXIgbGlzdCBpdGVtIDEuIFRoZSB0aXRs
ZQ0KPiBoYXMgY2hhbmdlZCBpbiB2Mi4NCg0KT2ggdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlv
bi4NCg0KPiANCj4gPiA0LiBJbnRlbCBIYXJkd2FyZSBQLVN0YXRlcyAoSFdQKSBzdXBwb3J0DQo+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9z
ZXJpZXM9NjY2NjkwDQo+ID4gU3RhdHVzOiBOZWVkIHJldmlld3MuDQo+IA0KPiBUbyBiZSBob25l
c3QgSSBkb24ndCBleHBlY3QgdGhpcyB0byBtYWtlIDQuMTcsIHVubGVzcyBzdWRkZW5seSBuZXcN
Cj4gcmV2aWV3IGJhbmR3aWR0aCBhcHBlYXJzIG91dCBvZiBub3doZXJlLg0KDQpJIGFncmVlLCBp
biBmYWN0IEkgbmVlZCBzdWNoIGluZm9ybWF0aW9uIHRvIG1ha2Ugc3VyZSBJIGFtIHRyYWNraW5n
IHRoZQ0KY29ycmVjdCB4ODYgc2VyaWVzIGZvciB0aGUgcmVsZWFzZSwgYXMgSSBwZXJzb25hbGx5
IGhhdmUgdGhlIGlkZWEgZm9yIEFybQ0KYnV0IG5vdCB4ODYuIFRoYW5rcyBmb3IgdGhlIGlucHV0
Lg0KDQo+IA0KPiA+ICoqIHRvb2xzdGFjayAqKjoNCj4gPlsuLi5dDQo+ID4gOC4gYWNwaTogQWRk
IFRQTTIgaW50ZXJmYWNlIGRlZmluaXRpb24gYW5kIG1ha2UgdGhlIFRQTSB2ZXJzaW9uDQo+IGNv
bmZpZ3VyYWJsZS4NCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVu
LWRldmVsL2xpc3QvP3Nlcmllcz02NzI1ODgNCj4gPiBTdGF0dXM6IE5lZWQgYWN0aW9uIGZyb20g
YXV0aG9yLg0KPiANCj4gRGlkbid0IHRoaXMgY29tZSBxdWl0ZSBhIGJpdCB0b28gbGF0ZSB0byBi
ZSBlbGlnaWJsZSBmb3IgNC4xNz8gT3IgaGFzDQo+IHRoZXJlIGJlZW4gYW4gZXhjZXB0aW9uIGFn
cmVlZCB1cG9uIGJlaGluZCB0aGUgc2NlbmVzPw0KDQpTYW1lIGhlcmUsIGFzIGl0IGlzIHF1aXRl
IGxhdGUgc28gdGhpcyBzZXJpZXMgcHJvYmFibHkgaXMgbm90IGVsaWdpYmxlIGZvciA0LjE3Lg0K
DQo+IA0KPiA+IDkuIFVzZSBkaXJlY3QgSS9PIGZvciBsb29wIGRldmljZXMNCj4gPiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz02Njg1
MzcNCj4gPiBTdGF0dXM6IE5lZWQgaW5wdXRzIGZyb20gcmV2aWV3ZXIvbWFpbnRhaW5lci4NCj4g
DQo+IEFpdWkgdGhpcyBuZWVkcyBhIHYyLg0KDQpPaywgYW5kIHNhbWUgZm9yIC4uLg0KDQo+IA0K
PiA+ICoqIFhTTSAqKjoNCj4gPiAxLiBbdjEyXSB4c206IHJlZmFjdG9yIGZsYXNrIHNpZCBhbGxv
YyBhbmQgZG9tYWluIGNoZWNrDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJpZXM9NjY2MzAyDQo+ID4gU3RhdHVzOiBOZWVkIHJldmll
dy4NCj4gDQo+IE15IGNvbmNsdXNpb24gZnJvbSB0aGUgdjEyIGRpc2N1c3Npb24gd2FzIHRoYXQg
YSB2MTMgd291bGQgYXBwZWFyLg0KDQouLi5oZXJlLg0KDQo+IA0KPiA+ICoqIGRyaXZlcnMgKio6
DQo+ID4gMS4gQWRkIFh1ZSAtIGNvbnNvbGUgb3ZlciBVU0IgMyBEZWJ1ZyBDYXBhYmlsaXR5DQo+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9z
ZXJpZXM9NjczNjMwDQo+ID4gU3RhdHVzOiBOZWVkIHJldmlld3MgZm9yICMxICMyICM0ICM5ICMx
MA0KPiA+DQo+ID4gMi4gUENJOiBhdm9pZCBib2d1cyBjYWxscyB0byBnZXRfcHNlZygpDQo+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJp
ZXM9NjY2MzIyDQo+ID4gU3RhdHVzOiBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgaXMgc3VwZXJzZWRl
ZCBieQ0KPiA+IFBDSTogcmUtd29yayBwY2lfZ2V0X3BkZXYoKSBhbmQgZnJpZW5kcywgaWYgc28g
cGxlYXNlIGlnbm9yZSB0aGlzLg0KPiANCj4gWWVzLCB0aGF0IG9uZSB3YXMgc3VwZXJzZWRlZC4N
Cg0KVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLg0KDQo+IA0KPiA+ICoqIENvbW1vbiAqKjoN
Cj4gPiAxLiB4ZW46IGFkZCBsYXRlIGluaXQgY2FsbCBpbiBzdGFydF94ZW4NCj4gPiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz02NjQ5
NjMNCj4gPiBTdGF0dXM6IE5lZWQgYWN0aW9ucyBmcm9tIGF1dGhvci4NCj4gDQo+IFdhc24ndCB0
aGF0IHBhdGNoIGVmZmVjdGl2ZWx5IHdpdGhkcmF3bj8NCg0KWWVhaCB0aGUgYXV0aG9yIG1lbnRp
b25lZCBoZSB3b3VsZCBtYWtlIGEgbmV3IHRocmVhZCBpZiBoZSBjYW4gaW1wcm92ZQ0KdGhlIHBh
dGNoZXMsIHRoYXQncyB3aHkgdGhlIHN0YXR1cy4gQnV0IEkgdGhpbmsgaW4gYW55IGNhc2UgdGhp
cyBpcyB0b28gbGF0ZQ0KZm9yIHRoZSByZWxlYXNlLg0KDQo+IA0KPiA+IDIuIHhlbi93YWl0OiBJ
bXByb3ZlbWVudHMNCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVu
LWRldmVsL2xpc3QvP3Nlcmllcz02NjA1NjUNCj4gPiBTdGF0dXM6IE5lZWQgcmV2aWV3cyBmb3Ig
cGF0Y2ggIzQgIzUuDQo+IA0KPiBSZXZpZXdzIHdlcmUgZG9uZSwgYW5kIChwZXJoYXBzIGluZGlj
YXRlZCBvbmx5IG9uIGlyYykgdGhlc2UgbGFzdCB0d28NCj4gdGhlbiB3ZXJlIHdpdGhkcmF3biBp
aXJjLg0KDQpPaCB0aGUgSVJDLCBvayB0aGVuIEkgdGhpbmsgd2UgYXJlIGFsbCBkb25lIGhlcmUu
DQoNCj4gDQo+ID4gOS4gTWFrZSBYRU5fRldfRUZJX01FTV9JTkZPIGVhc2llciB0byB1c2UNCj4g
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nl
cmllcz02NzA4MTINCj4gPiBTdGF0dXM6IE5lZWQgY29uZmlybWF0aW9uIGZyb20gbWFpbnRhaW5l
cg0KPiANCj4gQ29uZmlybWF0aW9uIGZyb20gbWFpbnRhaW5lcj8NCg0KSSB0aGluayB5b3UganVz
dCBkaWQgdGhlIHJlcGx5IHRvIHRoZSBhdXRob3IgYWJvdXQgdGhlIGxhc3QgcXVlc3Rpb24gdG9k
YXkuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

