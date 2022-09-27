Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631055EBF07
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412435.655773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Gp-0005Vz-V0; Tue, 27 Sep 2022 09:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412435.655773; Tue, 27 Sep 2022 09:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Gp-0005St-RF; Tue, 27 Sep 2022 09:52:55 +0000
Received: by outflank-mailman (input) for mailman id 412435;
 Tue, 27 Sep 2022 09:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n76Z=Z6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1od7Go-0005Sn-H4
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:52:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27077972-3e4a-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:52:52 +0200 (CEST)
Received: from AS8PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:20b:451::17)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 09:52:50 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::33) by AS8PR07CA0022.outlook.office365.com
 (2603:10a6:20b:451::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14 via Frontend
 Transport; Tue, 27 Sep 2022 09:52:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:52:50 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Tue, 27 Sep 2022 09:52:49 +0000
Received: from 58cb7bc26f62.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 250A2EC2-9752-4978-8940-69E629EA59BC.1; 
 Tue, 27 Sep 2022 09:52:43 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58cb7bc26f62.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 09:52:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:52:40 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 09:52:39 +0000
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
X-Inumbo-ID: 27077972-3e4a-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JbT5AoMNrXZdhj4mUtIR1cSzZ66m+fKgYl/lMds8iGqEiI0kV8B3UaDyEfACPfJtcN9GcPcT/SfOPncPdvn5QR+DoKWYdzOjNUrp0M15XVvqgPdbHN9RvvSd5Oe5G375JwQPTdDqXv4hFU15Is3o9eaiuIlY3JR2QxrScwrpyGtP5YpoC9jqPykQ4sKHV0QNiy1UcdyqryypHe9t4fO9C2pN4biOy6eDSE9HisXX9X/hW9WhDrfTe+0duXi26DaMhiBGhnuaFRlTt/lDJ9y3xeHVxH546ArGoisEKnjS6J2v0CLUgejxHzDNsms0i1S8Vr6tc5oW7krCPdVFuQbsCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5T4xcs+fgl0o6ntK/Xq1p7Zxc2rJPIJe5eMydf0Nu0=;
 b=Q74VlkQ1FPyvvdXT7uVYuSHgJxqxKZ3UNaiQlHG3eItBH6YwTq93xsmjcbG3MoFEN2J5T+hZ99SBdkngLrN98wprDYT0j+AYkIo2Y1725vui9xd27Tc1thIl6ruIjXVrJ6js9oTeq5cXFeHyncuOafUFRH9SlbdhjRaCDdUvhpUZkA1hBivh2TLhsz2UFiftb9VoaWJDKhCaw4LEfVnpVQsQ81ew4x1fdKc+8F0DEmoYablYXTaGV5HrDIWintYwaRAMMF78kxYd3J4pJKFNpIGCINYuq6yWee7hp1Nx4+UJgcEGSNEl9cHqmeChmj3ahBvvzpRWVHJWRCGBCeE2UA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5T4xcs+fgl0o6ntK/Xq1p7Zxc2rJPIJe5eMydf0Nu0=;
 b=OD93kzjmgbZfBzSbsRxtxmG4igStDS2y8WeoWal3m1bn0N0bQvbzy+1eP6iCTJGniGhbCTkD1cInRS/fYQx/CBQPe5tyOPZhMmh8l1f2k3eR0JLe+XZMYmNzKqIkxJ9KBTDFjlGV4sp6HB+QjFlnQF73kjl1gXaUryhbNmza3a8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5744ed7afb5fb337
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAngEPmcTkpD8RRJCPdr/kNMB3KSTIjO9RVFPut+v8Z9zl1vmSegwJrHj9tbAX2sZRpIonsgCxBQkIgDFAazPCKdLahEaS3SFyHdFFkpVloKQJPfRLrlI5AtEB3/E27DW3n3pVGwkbncDhzpFnsQU9oXW/MmWn6agDzyaFhpuLYyoBEoEq5a8kea0tG/T0uzm1sKxji/epdbDtSgpYrdxjJAf2bpU5AjENClHhA2btUQU5QjliRFRWSLfy/aRaRMPsVrE2PwPHapTKd9TqnJvozTdJOfmvMm2HkPESE7ca1ySEdNZ9SIUwnydpXMTJ3cWpCE82APZSU0UenYDwD/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5T4xcs+fgl0o6ntK/Xq1p7Zxc2rJPIJe5eMydf0Nu0=;
 b=Pi8N28f/zXFZmVCkK28EVG32eSdE6iLb5RroHC2DGTjHEzy39TDYgV6r7NFrFoU4S5H4+BNW/1kksQZJQEPc8W8eEwWosyclpSZv+3mOSwuUcS6occovS1FvCyyflLwMGogwB3VEqSq2HjycskmaEdefmEzrrsvbN9+IdKr3ZWhHUnZUiDnP7SU9dv8QTwQwNsP5jgoiMq6M9vyOD6i31ckkDWTM53seCrHR541v40OjhTBQrdBSpkK5qeuKgMHIQ7o00ipRUuHjtcGOVYTPmwy22IX8b0WWt3iRXwKwC79Gc2DQ7pbjg2OmvvfOtTmVY7IwIo1WrAzvwH8dSZ2omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5T4xcs+fgl0o6ntK/Xq1p7Zxc2rJPIJe5eMydf0Nu0=;
 b=OD93kzjmgbZfBzSbsRxtxmG4igStDS2y8WeoWal3m1bn0N0bQvbzy+1eP6iCTJGniGhbCTkD1cInRS/fYQx/CBQPe5tyOPZhMmh8l1f2k3eR0JLe+XZMYmNzKqIkxJ9KBTDFjlGV4sp6HB+QjFlnQF73kjl1gXaUryhbNmza3a8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 07/10] automation: qemu-alpine-arm64: Cleanup and fixes
Thread-Topic: [PATCH v3 07/10] automation: qemu-alpine-arm64: Cleanup and
 fixes
Thread-Index: AQHY0lZEIc8FFBrysEKfGaXgho1gHK3zCRKA
Date: Tue, 27 Sep 2022 09:52:39 +0000
Message-ID: <CC0725E4-9E9B-4391-9FC8-C1D75AD9EDBA@arm.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-8-michal.orzel@amd.com>
In-Reply-To: <20220927094727.12762-8-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DB9PR08MB6331:EE_|VE1EUR03FT036:EE_|DB9PR08MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: f78f884a-9672-45e1-d959-08daa06e0a0b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ty7L+dDH1zAeriMV1/G/O2+F6tkypSrGHX8jHB9z34FLlKVgT8G+d/dXZxrU/+MUEPm/JnMP6GIGfoGtN1bUqFpVHQu/cE6Gtg13yp8z9Nh6l3Nq7WeWLCnbiPmWfn3KcXjKEqt0miRRmHhWoK5X+7+41Y4Wgqp/+dXc7vrY3E3MVr1SLdPYl1DhQvWATEd7MeeqSIw975si7TumtudIbHnLBKlLhlVde9uk8LH9UruVA7hEtYOEZYHlIW9ZqXn6hdapa9pxi0yVieD9j+bN0ydobhNO3N3QSrtXsUbDjbk2Gorr2IL37fGZ3FFzjcYbgq7ox6xMbtN6RerJmXdm9tcgktKWyW8H/VfmSBqGsocR766uuGSvr/sfGr4f4Vw3P0FSkPHptdOBKcESHRngl8oO7x1idpSfhtaA0L2tDuorYcTAwEDjkRkd7nN32NzSNVHwDKyVUpQmFVRabZZiNepimtcRGc3/U2ykm6qeK2JJ4+ux0p9T6AEXu6A9wDMbN3MF0AQYoYM/i7TIBMtTOD4wMR7z+TsFKrexzdcEpLKLh+Tu3eLOPBK9fIwAc3HQbUWb2V9Woxdi8O7MzKNAWX7PTpvErqtUwsQ1yOG1YBIeWLD5cglwjaqByDsEwr/nIO/nQ74Byl3gNnyMUvALZgUO8SIr2THRWgyuxFUJfGAnxd/z6czoEwaI6nb+6HdidyoLqf8mT67wAQopb1FX7Iw+6lcOxXQgbBjvHYaa47HF+fF36HTjV956th4zvPAbYm0Tn/Qog0o+APeYc3yQ/oavGGC2CNp1Z8To8J9oEVo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(8936002)(38070700005)(5660300002)(2906002)(4744005)(86362001)(71200400001)(41300700001)(26005)(186003)(6512007)(6486002)(478600001)(91956017)(2616005)(6916009)(6506007)(53546011)(4326008)(76116006)(66946007)(66446008)(316002)(66476007)(122000001)(8676002)(64756008)(66556008)(54906003)(38100700002)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D90653D468E8214D8A435A04D5F37D6B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbc7de6f-d52c-4982-ba2c-08daa06e0386
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zu/Pp7lFQ1UYNJPZpZ+dYTT5WQwqbrkp3Og6e0Uyg6x8aQAIfequtC/dnV4NjN7/NxQGeWs14RmMr6cxvcqWmrPLs1/lfzetSCUKlRytu+2QPwJdPt0Bh/x/C3Me+o3RhAbhOOzkeJfxJAfPIqot9bOYraSsWD4XTCKOKe+U69KBunXgYott5ABEBDgrOglgMREJOdPAjK16WwXF8q26wUwauRZBDvqT/6aVF1OBjlKJLSTL1N/RouYtKN0hHb4LDOqfJfu/I+x6aUzq4Ffj+SiX7JvsvmshWZJ39mIGrpJQQpAVBTmFCWfPhmvPriGcHDNgqu0IC5evYDChl0sa1Lcjg79kXE0ZRnsnlzf6rorpaXkM05gTNtJEHbIrE5KmMf3SVR6f+wt5dDKa9KUwk3g7rtWyh6zRnIhw7nDwu0Sa1VHyEJiPnZvxIe/2qioPQhjyKe6xvWPvS+19LrnYTd5uEeO7OIQWVUn1lHTzkarc/Vp2HIP0RCJxvUMW2Gmz+5erPrmOlo1gWMPfQscJNnO9lsj3DeZgEg3K20udqp3egsnkw04O61r82C9LZMQw2Il22CiGu4pJ9FbNwvuhJO2wVNeXlBzNhORaHLnmVJculG5SjVzNkC4g48hb/HMiPVv1vGJ8GKwK4jtZId3SLXCelyqwiZ+EQwH9ksuBxSbmcOUB10KcovimPGi67DEYzpy7jVOMiN3kW6YUP/PVc36aHrNFyJS58S+yhhvTzdL3Yb1598nfn/yBS1TFErc0+dmBSv0fr40SCm0S5HZa4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(356005)(82310400005)(70586007)(8676002)(70206006)(86362001)(82740400003)(8936002)(6862004)(53546011)(6506007)(41300700001)(6486002)(33656002)(36756003)(40460700003)(478600001)(4744005)(40480700001)(316002)(54906003)(26005)(6512007)(5660300002)(36860700001)(186003)(47076005)(336012)(2906002)(107886003)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:52:50.0648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78f884a-9672-45e1-d959-08daa06e0a0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620



> On 27 Sep 2022, at 10:47, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Perform the following cleanup:
> - rename the device tree from virt-gicv3 to virt-gicv2 as the GIC version
>  used in this test is v2,
> - use fdtput to perform modifications on the dtb,
> - use DEBIAN_FRONTEND=3Dnoninteractive to prevent interactive prompt bein=
g
>  stuck waiting for answer other than "yes",
> - fix the number of cpus in the device tree because currently we generate
>  it with a single cpu and try to run QEMU with two,
> - fix the memory size we pass when generating QEMU device tree as it does
>  not match the memory size with what we run QEMU.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v3:
> - s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/, drop Ack
> Changes in v2:
> - none
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




