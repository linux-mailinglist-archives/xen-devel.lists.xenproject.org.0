Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D666F773625
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 04:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579203.907076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTC2w-0000Kb-M1; Tue, 08 Aug 2023 02:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579203.907076; Tue, 08 Aug 2023 02:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTC2w-0000Hq-Ig; Tue, 08 Aug 2023 02:02:06 +0000
Received: by outflank-mailman (input) for mailman id 579203;
 Tue, 08 Aug 2023 02:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxwq=DZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qTC2w-0000Hh-0X
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 02:02:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 905ce88b-358f-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 04:02:02 +0200 (CEST)
Received: from DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) by DU0PR08MB8640.eurprd08.prod.outlook.com
 (2603:10a6:10:400::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 02:01:58 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::d9) by DUZPR01CA0268.outlook.office365.com
 (2603:10a6:10:4b9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Tue, 8 Aug 2023 02:01:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.16 via Frontend Transport; Tue, 8 Aug 2023 02:01:58 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Tue, 08 Aug 2023 02:01:58 +0000
Received: from f2d9e0b0293b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BEC2FAF1-3579-4520-BE87-45EEB7A2D982.1; 
 Tue, 08 Aug 2023 02:01:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2d9e0b0293b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Aug 2023 02:01:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9586.eurprd08.prod.outlook.com (2603:10a6:10:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 02:01:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 02:01:17 +0000
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
X-Inumbo-ID: 905ce88b-358f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVh67N903PEeqgYmoTVepU8+1oMgWaDdvrubCIM5/DY=;
 b=wokl2kC/d9yBW1h76+5n/OrbreOXgyeT/tCQnThJjLBkEZJ9CyUegswE9+OfAgQkeGQS0dnFHF5EGR466WiNpyy1iSuqMmRgI6ZPbDlgnCuXbfrZZqjKwbZ4NNgkFRXNjexJfNuRRSW1e8bctMHDLbKjeZ2/9cfrpS/wJmaREoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f57b506ecfbf673
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjcT06M2F8jsPISg5M6zYHlM4+/2HZuXozqk8mo9fYXRA+/pEV/5RHEczwZaR1qU0n8oS0yGlubxF3Sne4f8TU8xlhMjRy/inl/+YWecutCzt69xWvEg9LQVuxlO5Aj0uaSIGMI/LBmlI3JNpiuhSOIvca/EKK+GZ1pnvy0dJ5+o9DWA59TUHCZrVrITOEgTUQmBVCnlFhoLuEi0jW0NUXbYM4sfMsxsw+F09Zh1QGm8z+mYwzXwW+OWrFCGu+1YJRLwMTKDSeDhEawuJzQDvSduPMRmBWQ2rbUOcruqZTJLfCvrIMxfEj1HmSZ1trkegotMw9rhJ4SNoLH3uYPeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVh67N903PEeqgYmoTVepU8+1oMgWaDdvrubCIM5/DY=;
 b=mejGeM5BzK6YAw9/MgYyfGx76tNLHWUnL/g6kJpmZKrU63sLvI8IOa7WD2fJ6nV8R/HqzJgK83dOHw6khzdd79uP0ZuQtg/joP5BRbi6yjZMlfsBNFWOvVo1vOzaHaOlxE8qET7vZNVYsSeu6XapbhWLrMgAQnjdPvCC9kEwaDGAkHB0x4OvNx3n7ZIyadBIHbqj6y1SHosnnKe1brWkpKC9z3mAoTvlG5VJqlURUdNG9ZvoLyaixDlmezOrr2O2nkDZPNkvbU9rCXGI7LFYWoBciZ1+RzAJI1ZTZRF8GOxWCquSCpiZAI9Xp3PnRXk5SzPhgHDXbeHboo5nhyGknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVh67N903PEeqgYmoTVepU8+1oMgWaDdvrubCIM5/DY=;
 b=wokl2kC/d9yBW1h76+5n/OrbreOXgyeT/tCQnThJjLBkEZJ9CyUegswE9+OfAgQkeGQS0dnFHF5EGR466WiNpyy1iSuqMmRgI6ZPbDlgnCuXbfrZZqjKwbZ4NNgkFRXNjexJfNuRRSW1e8bctMHDLbKjeZ2/9cfrpS/wJmaREoA=
From: Henry Wang <Henry.Wang@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien
 Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
Thread-Topic: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
Thread-Index: AQHZxCqJmtSfvrOVyE67LM5R2F23xa/e2swAgADVQQA=
Date: Tue, 8 Aug 2023 02:01:17 +0000
Message-ID: <C6C12C0C-317B-4402-A848-515C16548F13@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-3-Henry.Wang@arm.com>
 <d6ef94ff-0477-bc23-fa09-454287bcf19d@amd.com>
In-Reply-To: <d6ef94ff-0477-bc23-fa09-454287bcf19d@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9586:EE_|DBAEUR03FT044:EE_|DU0PR08MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: eeec1f96-bf42-4409-124d-08db97b372cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GYNlqg8RFi7vlgRs3SzZBG/vOou9sbEEGLgXcPaKkgoeZGklU5zrV7hx/sAUdp50ZYJojcOfqI5YACzeTPXtjgX6VX2TiFq7ZEcg/cjFk+MBBKl6vzsPks2UOEVfoRd9lhTR5VYYDzC6TWNRIOWA2c4OFnWS4hY+72sVucKEfUegiYFFSUxFTOZDLz64Y1uMa3ZMBRru6KpHAuQr+bFdyfyxE3BEevRZpHeI/dXKNsSX9/1QltuNKyT5DVoq2jrHlDYNzJCUX6XCud8nmu02j/EkThGzUFIsg2cvZEauyugJiuD2bRtGPziryzBixWAGKsT5bhQBjVfK9OC95FPBk5R4qFRAF4gqwgDac1WcYx61YnZbfWNcOzXMHR38S919ArrnifHD+QrnQeSksEry6OMnjO6U6P40KlEe2bjmQP4+DL52l7yF6gHaQLHaXl2lsmuLONOx3d2C+uJ/qYOTuQy6VsgQTP42pPVEELI2w6Pc2KICf+JurphO8X7fjCRb2uEJvqPeOIPHBtETK6O/RcAZ9lPwXodjEXQbXI5o4lg0+CkfCLP4R6Hh358MQqzDNACkFiu69HHsTXxesYNcsen4WFAgbxGMIkMCRP2dXpF9N4xEXubkD3dvvHMwvnEBCMOm6UjXVxA/QyZ1zjk9cWbyzBgNy8EAZOH16G/Twuf9B6/kHLx6KONJRHbcMeSguY4w0WOO+Ulx+6ET+Ybg5w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(1800799003)(186006)(90011799007)(90021799007)(451199021)(83380400001)(2616005)(54906003)(2906002)(6916009)(4326008)(316002)(5660300002)(8936002)(38070700005)(8676002)(76116006)(64756008)(66556008)(66476007)(91956017)(66946007)(38100700002)(66446008)(966005)(6512007)(478600001)(33656002)(122000001)(71200400001)(86362001)(6486002)(41300700001)(6506007)(36756003)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2279DB4368683942AB995E3EA0B189D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9586
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	585252b5-531b-4be5-063c-08db97b35a49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCFZW49IyNcA4ZiEaSKwPUBcIXcTFqFjw3Whyra34bSnWY4KFcI9h+vti7+g2xJFfqfYCKkhQFOb3cp2HbnE2b2LFOrggL9ZiQmOM0zu/Yr7oHGQocn5SI5wXmVjik2EV5EnFvqWYteiNw4vjqliLdzCBVd0nA/48H8iTj2B95Hu62QxsWddoD8lS26eulUteHyUra6mhhoC/klQnMkp7tBUa+erk8ITbIxu57faBTmyfbuIzuzaxjdMF8DFMvAzUGxjMsNHBvhqdwus2f/0gDyCVJZkggXaJqZJCiSVBTUIBGdUlJZpSuXjOJxKzJYb6RwwiFmRQIi/r7wxKlIEpK6OqfpxALa1PRyEfM8q2fV5vxIysMYN7MgBBQBYwkhsvFTZMTPJh0frsPPODdW6mxBAqe28QATnKQGjPu2R+Dz2eUMt8QlaBAET+uq3cGLSbGpGmn6V5QgjDjJOYEbRnN7mt+/xCgtk8fSXxGDZUaBtVHL5UUmlzLfabzKryS13cNYhGMtGIfO9ILxb/rCMb3JSM7CcDIHJHuxwOLmgPAd8aOAneDB9p6lS4udzUwfPTclThtzzKO/d5xepQ6ssXc3ghlBqhi1Rg6gjDkUF9dMQA8s7Y6swd4PWw0PcOa+Zumhin/3YT8ehLp3m9jNrsy431yb9KR4ujWyhUMfO+jGygLGLS4nD4USdisAzo4TsGYv14jjXqAYEb91oOeXPnEgHIGgFgQ+0fMiMJdznfN3jfvMl/vp7pvNU6LrCljZZuxHumu1NCnNmwdfKAOBV2b8T7YnLobp2KA4Qpgr4ZXM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(82310400008)(90011799007)(186006)(1800799003)(90021799007)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(26005)(107886003)(2906002)(5660300002)(83380400001)(8676002)(36860700001)(47076005)(8936002)(6862004)(40460700003)(2616005)(40480700001)(336012)(81166007)(86362001)(316002)(33656002)(53546011)(82740400003)(6506007)(6486002)(54906003)(356005)(478600001)(70586007)(70206006)(6512007)(966005)(4326008)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 02:01:58.3817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeec1f96-bf42-4409-124d-08db97b372cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640

Hi Ayan,

> On Aug 7, 2023, at 21:17, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Henry,
>=20
> On 01/08/2023 04:44, Henry Wang wrote:
>> CAUTION: This message has originated from an External Source. Please use=
 proper judgment and caution when opening attachments, clicking links, or r=
esponding to this email.
>>=20
>>=20
>> There are two types of memory system architectures available for
>> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
>> and the Protected Memory System Architecture (PMSA). According to
>> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
>> controls address translation, access permissions, and memory attribute
>> determination and checking, for memory accesses made by the PE. And
>> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
>> scheme where an Memory Protection Unit (MPU) manages instruction and
>> data access. Currently, Xen only suuports VMSA.
>>=20
>> As a preparation of the Xen MPU (PMSA) support. Introduce a Kconfig
>> choice under the "Architecture Features" menu for user to choose the
>> memory system architecture for the system. Since currently only VMSA
>> is supported, only add the bool CONFIG_HAS_MMU to keep consistent with
>> the default behavior. User can choose either VMSA or PMSA but not both
>> in the future after PMSA/MPU is supported in Xen.
>>=20
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> The patch looks good, but it does not cleanly apply
>=20
> b4 mbox 20230801034419.2047541-3-Henry.Wang@arm.com
>=20
> git am ./20230801034419.2047541-3-Henry.Wang@arm.com.mbx
>=20
> Applying: xen/arm: Introduce 'choice' for memory system architecture
> error: xen/arch/arm/Kconfig: does not match index
> Patch failed at 0001 xen/arm: Introduce 'choice' for memory system archit=
ecture

This is weird, so I tried to apply this patch (by clicking the mbox button =
on the top
right of [1]) on top of
65f0d6fc80 x86: Drop opt_pku entirely

and below is what I have:

$ git am ~/v4-02-13-xen-arm-Introduce-choice-for-memory-system-architecture=
.patch
Applying: xen/arm: Introduce 'choice' for memory system architecture

I suspect recently there is some Kconfig changes, so could you please clari=
fy your
base commit? Thanks!

[1] https://patchwork.kernel.org/project/xen-devel/patch/20230801034419.204=
7541-3-Henry.Wang@arm.com/

Kind regards,
Henry

>=20
> - Ayan


