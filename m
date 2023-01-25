Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99667B32B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 14:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484311.750866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKfil-0005H9-QP; Wed, 25 Jan 2023 13:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484311.750866; Wed, 25 Jan 2023 13:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKfil-0005Es-Mo; Wed, 25 Jan 2023 13:21:47 +0000
Received: by outflank-mailman (input) for mailman id 484311;
 Wed, 25 Jan 2023 13:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtWz=5W=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pKfik-0005Em-7K
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 13:21:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a3eceb-9cb3-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 14:21:43 +0100 (CET)
Received: from DU2PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:10:2b0::28)
 by DU0PR08MB9655.eurprd08.prod.outlook.com (2603:10a6:10:447::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 13:21:39 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::4) by DU2PR04CA0173.outlook.office365.com
 (2603:10a6:10:2b0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.34 via Frontend
 Transport; Wed, 25 Jan 2023 13:21:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 13:21:39 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Wed, 25 Jan 2023 13:21:39 +0000
Received: from 59ade3a6353a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9B7593F-7726-4184-9E6F-A835AEBBD4E9.1; 
 Wed, 25 Jan 2023 13:21:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59ade3a6353a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Jan 2023 13:21:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB9825.eurprd08.prod.outlook.com (2603:10a6:10:462::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 13:21:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1909:220b:70ee:a5c3]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1909:220b:70ee:a5c3%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 13:21:30 +0000
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
X-Inumbo-ID: 35a3eceb-9cb3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0988EFARxls/2WUpzJM70zTAbLoSmEkUSsQwSp7PJg=;
 b=ZKW9SHH2ULX9O90kjlMc1aC2yJqzDB4sQ48kwFNyESJyEM4eclBNHpwgfxIrIpw15ux9APcV/LLVNiNwp+5hSG7FyPAcycuw/P0IXY1rUjZZMi+o/8BpAUgcT4bRWGR3XUe0B0uk+vdPXd2gU+cNN65agmHcmBu8FbULgHi28/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 708563b4c9ae479b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB2bpc6m0J4hTnmASH7aw9SATgfZ34ekPfDD9o1PFVx1J+0V6bAQ20ZzLPQea1iaoZLHl5+2j4brH1/ULJaKqnfMRflHgi9ZHnPajh5FhqoG8aaIthrGEBac1SwqH+Yzg2FMlnRR1/3uhc1zTejAVjkvO1AFjkp9Zv+xig78DrqZhbiNyPUmt3TXFUMr+ZUm8IHAqM0NRLo5H1jL7o3/FL/pS8ZrcCaIKx9eWE+zaDYRa+MNBP5vRPtcJ8Id7XBSQoLoBk5VkECPHfZCD66Wh+0KZTWa8e/lmz2rz4kwbNCOomQjdlR0vAD4J6mAxuuroIoXw1xTO4p9tdTzGGzpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0988EFARxls/2WUpzJM70zTAbLoSmEkUSsQwSp7PJg=;
 b=SKe2r8dTjbs5KuaRqyOvenZJZiCCosUIZu3uAwN8LfGe1oTUfAuZvjojzF9dfEhRwdZvAbn59qk+znqpsqMFkuXKlN/6mwac1SYY8OKfs5t6xm6W9LA91esMqV4EDPT1OwNnJvSURbfmJr4I0A4OQyTWVQuCza2YvLRz9vSQhAkuQ7nrkqfstmctDtJqz7yhK0xkzOE74GHdVi5sl5OQ7561Xg7UeN8AHeKppOi9j/8CLMdsrKH5pNx/ZE8QeQeUDQDZokTMygLO1H3mk9aNTbQBhgQurhfb/CQvfk+U8b3lqqk54be4yzIeoZvsHycksLYTKkVq02NFC3Wbn1ZYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0988EFARxls/2WUpzJM70zTAbLoSmEkUSsQwSp7PJg=;
 b=ZKW9SHH2ULX9O90kjlMc1aC2yJqzDB4sQ48kwFNyESJyEM4eclBNHpwgfxIrIpw15ux9APcV/LLVNiNwp+5hSG7FyPAcycuw/P0IXY1rUjZZMi+o/8BpAUgcT4bRWGR3XUe0B0uk+vdPXd2gU+cNN65agmHcmBu8FbULgHi28/I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Nick
 Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 0/8] SVE feature for arm guests
Thread-Topic: [RFC PATCH 0/8] SVE feature for arm guests
Thread-Index: AQHZJcpxlecBD3vJ/066zddcxj2mrq6ZcImAgAE+YoCAAVwdAIATKTYA
Date: Wed, 25 Jan 2023 13:21:30 +0000
Message-ID: <B81C0C5E-6FEC-4B71-B740-8418EC1BBA06@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <3e4ce6c0-9949-1312-f492-913b7dd2cf18@xen.org>
 <EB12FEDD-F3EC-401A-9648-77D7B28F6750@arm.com>
 <f8823ca1-450f-7522-d5db-41f124195ab3@xen.org>
In-Reply-To: <f8823ca1-450f-7522-d5db-41f124195ab3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB9825:EE_|DBAEUR03FT028:EE_|DU0PR08MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb3f806-a3c8-4d28-35b2-08dafed717b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3sl2G05paPbZMOVGiyC+JEwpRMwm7Qm2ls43hwi3xtYL0aa2DHcv69TwTmua6mAhcqpVTBW0RmZsc4XRziNtY1eJZYw8OE7QGb6yF5lVvolIzocFUsICMmHh5aVofoW07QzbdrNvXDJmT8J9Z334I0da57+6N/OPRWnKShmMsKsc9eyB+VrTQOUZ+gnJ4iWHUO2T3IxXQZD0MbtXxzGFHhsvWd2zr393Fu4HqR3oRdHH14i/UwxtETiyk3WyGjCYPWBXaMYMgE+OeW5pidkJ8TBFR3bgS7a10pbWvUC2xGNZ3iRQH2aZ4Ttvs+5wrYMD9hD4+JOCMTqp3EQvUY/uDZlCUAsG5kANl4tuh4ocseY9591OubVWB+Ncn1UIkspn8B40Sb3MB70Mm2z+3tnspfDltmFzQ6lMi6rx6O1u6bo7n7zhpnL2fmss03QOSFU9/gyrZkP1s4Rwk5YZPdiQSI1zR7QWOuXmbPF/BYZdYcY6hKplNrq5X/YDfy1fh1kJlnKpdmjH2RFZiNTKjo2wi8pnG6yR0CfCCdF1zEhaXLKrAiQcSQD3tFRNIVv1hY7zLXstvQ0+UnnzXHcrcNJCMIgrzG/VGDcJPQ3oyZ4nMCSDcNQIuhScEpqZFkM3ZrJcuPOKOFWpDMHH26mgRNW61LKcTkflGjN4Pbw3AWguAv/P75wV2Vkn4E88o3FlGcLvbbUl+eMM2POXUdeTUjsSWEwkcos7YtklBulBkEgTm8s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199018)(66476007)(5660300002)(122000001)(36756003)(2906002)(478600001)(7416002)(91956017)(86362001)(76116006)(66556008)(53546011)(64756008)(8676002)(6916009)(66946007)(186003)(66446008)(6486002)(2616005)(71200400001)(4326008)(83380400001)(38070700005)(33656002)(38100700002)(6506007)(41300700001)(316002)(6512007)(8936002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A693D382F7B0344A950662B7F827E277@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb89ed59-fbff-4a59-0b1b-08dafed7123f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9OaMwV2hg+pZLE+IXXfXU2Y3A9WMZeEyxLoTl8+iS9KPpbldE7zgFBe1/HR61i6jLSemtYQl8ZxiX684qQBtm/Px84dBJtGfL4wJ7N0KVvESIBgy/ZSvrsPggbsqQH53rzSv2I/L4v8a0+CgBHP0qnBaQi84mRn0Fwoqm5HnQuqmKeMhwJSOue6DmDCurKu1nq06AYRvmb3nKpBO0FW0VqcuiLFAzbK5z+GVZTPJuqbY4uGonV2c5Lu+YEWBRxXqw6lNhUBg67HLLz8e+DrMdkOY5my+S8BXgIhoC/8lASC5fwmx/foKQiiX2BRP/XWeJUms1NxbwiW4liAbl9txbqe9WnmtJl3Sj2WEHGHMLuwUqMWiyZ7APDMRqVc0S1Jz+dkWf+A7swAyWgtsUmNXV151X998Rgaq8JGv4E83XNIMk9JTC8BHGV7zyucMpdQVYorAEbPp9ZgYGmwzOIRTjr2xVHW7Rx7cDoTNuasze6MkfB/QunyCbMUz2SfQT7G37LsOaWh4P+kRLpkASFPa+WEhy8G3IFZNus5o9LS0WGEtMU6EaL4DaJ4obwCwYJAsOMYMUIeA37wTM+t9JMLJpdCneF6ycyzFslTybDUuFcCnCe2kzpkNCHw+r+rLSAj9DB84PEmJzZP3ygiEMhyFO278AHrW1RUQ7nx9Kq9+XtDa3ph31ZCAst2rFNdePceH9PDYc9NoLz3DqiPrDRSesw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(36860700001)(26005)(8936002)(5660300002)(70586007)(316002)(4326008)(41300700001)(81166007)(6862004)(186003)(70206006)(2906002)(336012)(82740400003)(36756003)(53546011)(6512007)(478600001)(40480700001)(8676002)(40460700003)(83380400001)(6506007)(2616005)(47076005)(54906003)(356005)(33656002)(86362001)(6486002)(82310400005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 13:21:39.5103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb3f806-a3c8-4d28-35b2-08dafed717b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9655

Hi Julien,

> On 13 Jan 2023, at 09:44, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 12/01/2023 11:58, Luca Fancellu wrote:
>>> On 11 Jan 2023, at 16:59, Julien Grall <julien@xen.org> wrote:
>>> On 11/01/2023 14:38, Luca Fancellu wrote:
>>>> This serie is introducing the possibility for Dom0 and DomU guests to =
use
>>>> sve/sve2 instructions.
>>>> SVE feature introduces new instruction and registers to improve perfor=
mances on
>>>> floating point operations.
>>>> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE =
field, and
>>>> when available the ID_AA64ZFR0_EL1 register provides additional inform=
ation
>>>> about the implemented version and other SVE feature.
>>>> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_EL=
x.
>>>> Z0-Z31 are scalable vector register whose size is implementation defin=
ed and
>>>> goes from 128 bits to maximum 2048, the term vector length will be use=
d to refer
>>>> to this quantity.
>>>> P0-P15 are predicate registers and the size is the vector length divid=
ed by 8,
>>>> same size is the FFR (First Fault Register).
>>>> ZCR_ELx is a register that can control and restrict the maximum vector=
 length
>>>> used by the <x> exception level and all the lower exception levels, so=
 for
>>>> example EL3 can restrict the vector length usable by EL3,2,1,0.
>>>> The platform has a maximum implemented vector length, so for every val=
ue
>>>> written in ZCR register, if this value is above the implemented length=
, then the
>>>> lower value will be used. The RDVL instruction can be used to check wh=
at vector
>>>> length is the HW using after setting ZCR.
>>>> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so ther=
e is no
>>>> need to save them separately, saving Z0-Z31 will save implicitly also =
V0-V31.
>>>> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie=
 the
>>>> register is added to the domain state, to be able to trap only the gue=
sts that
>>>> are not allowed to use SVE.
>>>> This serie is introducing a command line parameter to enable Dom0 to u=
se SVE and
>>>> to set its maximum vector length that by default is 0 which means the =
guest is
>>>> not allowed to use SVE. Values from 128 to 2048 mean the guest can use=
 SVE with
>>>> the selected value used as maximum allowed vector length (which could =
be lower
>>>> if the implemented one is lower).
>>>> For DomUs, an XL parameter with the same way of use is introduced and =
a dom0less
>>>> DTB binding is created.
>>>> The context switch is the most critical part because there can be big =
registers
>>>> to be saved, in this serie an easy approach is used and the context is
>>>> saved/restored every time for the guests that are allowed to use SVE.
>>>=20
>>> This would be OK for an initial approach. But I would be worry to offic=
ially support SVE because of the potential large impact on other users.
>>>=20
>>> What's the long term plan?
>> Hi Julien,
>> For the future we can plan some work and decide together how to handle t=
he context switch,
>> we might need some suggestions from you (arm maintainers) to design that=
 part in the best
>> way for functional and security perspective.
> I think SVE will need to be lazily saved/restored. So on context switch, =
we would tell that the context belongs to the a previous domain. The first =
time after the current domain tries to access SVE, then we would load it.

We should try to prevent those kind of things because it makes the real tim=
e analysis a lot more complex.
The only use case where this would make the system a lot faster is if there=
 is only one guest using SVE (which might be a use case), other than that c=
ase this will just create delays when someone else is trying to use SVE ins=
tead of having a fix delay at context switch.

>=20
>> For now we might flag the feature as unsupported, explaining in the Kcon=
fig help that switching
>> between SVE and non-SVE guests, or between SVE guests, might add latency=
 compared to
>> switching between non-SVE guests.
>=20
> I am OK with that. I actually like the idea to spell it out because that =
helps us to remember what are the gaps in the code :).

I like this solution to.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


