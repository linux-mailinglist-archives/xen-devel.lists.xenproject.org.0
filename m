Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC31073EB9A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 22:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555644.867551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDsaW-0002f3-2u; Mon, 26 Jun 2023 20:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555644.867551; Mon, 26 Jun 2023 20:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDsaV-0002bx-Vm; Mon, 26 Jun 2023 20:13:27 +0000
Received: by outflank-mailman (input) for mailman id 555644;
 Mon, 26 Jun 2023 20:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDsaU-0002br-N7
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 20:13:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7713e18-145d-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 22:13:24 +0200 (CEST)
Received: from AS8P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::30)
 by PA4PR08MB7524.eurprd08.prod.outlook.com (2603:10a6:102:26d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 20:13:10 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::ec) by AS8P189CA0026.outlook.office365.com
 (2603:10a6:20b:31f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 20:13:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 20:13:10 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Mon, 26 Jun 2023 20:13:09 +0000
Received: from 53de5a3694dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAFE3E89-5F77-4612-BCAF-E0067973023B.1; 
 Mon, 26 Jun 2023 20:13:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53de5a3694dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 20:13:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6250.eurprd08.prod.outlook.com (2603:10a6:10:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 20:13:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 20:13:00 +0000
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
X-Inumbo-ID: e7713e18-145d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtTFkdtLGLjGQbWWy/+YMDMPBv3qdeC6YuDwRjCpNcc=;
 b=gkg3Ix/zMPYfDzRuqLmxmfohbRf5SOnB6gpzfzmEavzrT2GN6lhOGSw4QvcKalO5Ehw61rW14+U2E2BF+N93dBfLuz4jDb1k9ne/ypzFLcZ50ScTtIHTABk+PFKx0QTkeCm7bAOKDMkeE0cU2khju4FKTv1mTA3JDDXmkxveaV8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ee8d8b02bec805e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PooGw3D7dltyXKBiVlOig+rlQksbp1Ju/idO9ujHsJ928xabYP2lrPVK5cPXbZxEOMr2r436mDT2eD188Ejb38ET8SY/RkTEvUfia+pkjC6rkKR8H80f9QcGDjlljI7vCB0j6zPdR23nM/a5EjeSIjd3uBFETC7e2v2iGcmFqF1p2eFzpaGW5PfSqrQvcKx8tW2TGs8vgFhffe0SZwH+7+8A2rT6+InNfqu2AUlGKA+3vvRJjdMKl4rbcOndr+LhjtrDijptbl62uXpo0tQZY0d61QOldtmGRGoixTYE+EffPjBAOFO/x8npBphrBLAjC7uc6ng0PcQc8+1bujbIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtTFkdtLGLjGQbWWy/+YMDMPBv3qdeC6YuDwRjCpNcc=;
 b=U1QUEhfixVF8TYlrGhYpLJpsN5JNJVB6oTVSX4xLKCTEb2oconrfEmo3pa7rhzSKm1cKu0hwSDFJGSgg2xuRTyAjgiml/00feZFSwrVFIe2gDvXfMYJSFo8Ht8NnA9JqCKuBXEvmpRethj4iMlnmBNo7Jl0Y4U6MYMREbeLzceKszdxcS1hEGxeFvVGv2RsJqibFN/3uNqRyzh2wJR1TalXI0ylIhH4CCFt3p8gJLKkHr3u6VEICbxxjVXwS59M9B4smPdILQs0GL2/zb/zTEnu139tYZb72E9HrOx3lJY5Jr78ke4ghnJ+Uv9rFHULPHXlAKoLShtSMgqEGnzIxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtTFkdtLGLjGQbWWy/+YMDMPBv3qdeC6YuDwRjCpNcc=;
 b=gkg3Ix/zMPYfDzRuqLmxmfohbRf5SOnB6gpzfzmEavzrT2GN6lhOGSw4QvcKalO5Ehw61rW14+U2E2BF+N93dBfLuz4jDb1k9ne/ypzFLcZ50ScTtIHTABk+PFKx0QTkeCm7bAOKDMkeE0cU2khju4FKTv1mTA3JDDXmkxveaV8=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: Xen Summit 2023 Design Session: R82/R52 Upstream
Thread-Topic: Xen Summit 2023 Design Session: R82/R52 Upstream
Thread-Index: AdmoaYOzBL78EMmRQsKUGzHLWfv8Hw==
Date: Mon, 26 Jun 2023 20:13:00 +0000
Message-ID:
 <AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D1424E0D40F17741BD328B9C7ED3A0F4.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6250:EE_|AM7EUR03FT064:EE_|PA4PR08MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7a1382-c96d-415b-efb3-08db7681c355
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m/jLDgZhgg6nMLzEIJjWsd/zuYGHLgFlmer3jSXLSVbQ49GP4rqXN0//f8gpl7rR1zi8eSafIPdoBo5E4kK55h0ASyaIT5qLP6ncgho4fpHzA86Z3frLQfwJBPg/4PJOnw4S78MBBcP5XWcBCneoUVuIWOWlYWCnA1jezJE2EHCyKrF5u3jJjPBZQKbqETDXycp+Fa66vaktpSFAq6KnJghw7vSivL+AsXe4RYIUK+biLnGxBoQ5hErzSa1JCk6+qn07b6kHF7Q5BC4miNHtdOC3FTTXcYbl+QRA1TtzyZcP5DZaHAnIy4w8sl7eT43klDG9OCmUMHSeZY6uKk5V5MFPzKYNTSAfDKFz2RfsoKQ+SiKTmJrWuoASbF3Y/UwW5ErU12xlsAeUyxxjkDEtssJ+IJE32VC474f3GreLIz6hPa100oX4X7HYW8f1DHcuUA0mKMftnU4zD31vlCIpMOL+hbAAA/1gQChbD0dA8E4iE8JTMml6y9iqHXQ0+9S0ocuwy7Ejoa0BqAjIfv9drUcfqb79G3J1lZZMSTDcI8FWgm+p0DqjN72G+wNNGa91TlJ6gdYhEpJvONO0XNZExyBhVetSznvLncHGQHoyxcqxD3UuvlcJyTIJiRH6fQE3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(45080400002)(7696005)(38100700002)(122000001)(83380400001)(71200400001)(6506007)(26005)(186003)(9686003)(55016003)(966005)(41300700001)(86362001)(54906003)(38070700005)(478600001)(64756008)(4326008)(66556008)(66446008)(33656002)(66946007)(66476007)(316002)(76116006)(6916009)(52536014)(5660300002)(8676002)(8936002)(66899021)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6250
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d2987fe-83eb-48c4-053e-08db7681bd91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eWmoowEXOoFh7t8UV4xS8m5g41Prehs9FVSWsUsCYKU6JZoZu4x/YRjz/OrerUKyFBWBd/CAtXwJQRgcsm0z9FubczmqiHhCyy+4wMy6QL4wEnfh3Spm/UU3S8cWYBjlZe6AG028VcuxrIuh4fs3y6d0W9s0cjkOtiEdEfvdwCd7uN8D3EgiapaAKs56rPpcNxkH+Mnz+itksYnJ3faJfyneu+swzYe+uVfu2RtUJwtP/b6V4BLMQfnKqIRG9of/KaAceXh8ixmamXs7ZwM2tF2L6jzh8FIg8q49MKz4zOLgyrmsZDdy+x93VWF4Y8KJ3JEbD1LTGGYEzi+nCMEwr+wVtOC8kfwHrT0ZUTRp6Ab+3xL9CGXDobLLZtlxSILIlN93FCsznWXOhvD06WxM5lsyGyKhuVcAjyg66S+JZxCXSTSTPbvzidYjJ3SglALLbj5v0b5woRp5AqbDHvWjqXmRAfNb1iR78tYwc0u+Wi9L+soWyxpeDts5l+Engi2pKSNY+Leo4taG0HQ14zmBR/rmWO6nQa5QrhJie2/Y/J99l+8aItMXBqCpMSQkBIkD87zFG4DG95Vc/Ut57KZiq3coIVI6CWkRH9b0FVLoeJXsbRyYOl4VG9ZI0CvqI32a8AYfJ3X5y8BwbnDBmynJyNoSYDUx4inAN1C7h6oiZ80Fr+pTIWE4fv59qLZe+5FXvmvUDaCTgHoZs/HGql6F+tbrwnzTVZewwPMREZI2f/XdwBUxK6X1MvmPotlVfITw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(82310400005)(45080400002)(7696005)(356005)(107886003)(83380400001)(81166007)(26005)(9686003)(186003)(47076005)(82740400003)(336012)(36860700001)(40460700003)(55016003)(966005)(40480700001)(41300700001)(54906003)(86362001)(478600001)(70206006)(4326008)(6916009)(33656002)(70586007)(316002)(6506007)(5660300002)(52536014)(8676002)(8936002)(66899021)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 20:13:10.2323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7a1382-c96d-415b-efb3-08db7681c355
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7524

Hi all,

Below is the (merged) note take from the R82/R52 design session. Thanks Luc=
a and
Ayan for sharing the notes taken from their side.

B: Status of current R82? Summary of the changes from last version?
P: R82 updated patches are on mailing list. A lot of change, now map
   on demand, and deleted "mpu,xxx-section" properties in device tree,
   only need to specify static heap
J: Problem is how to split and integrate the MPU code to the current
   code base
S: better to split MPU and MMU, I wouldn't mind p2m to be duplicated,
   instead of ifdefs and things like that.
J: Better to look at the whole series to have a overview of the current cod=
e.
B: We need to maintain the MPU code for a long time.
S: Keeping MMU and MPU so close together now might be not a really good ide=
a
B: We should make sure MPU is not an Arm specific thing because RISCV also
   has MPU solutions, we need to take this into account, Do we want some MP=
U
   on common code?
Jan: if code to be shared by x86, arm, riscv etc, they should be common cod=
e.
A: Possibility to cut the series short?
P: The latest series out in ML already doing MMU refactoring first (the fir=
st
   22/23 patches), then introduce MPU
B: It is tricky to just see the first part without looking what is being do=
ne
   later, because one change on the first can make sense reading maybe the
   last patches.
   We are introducing a core concept in xen and finding the correct approac=
h is important
   From the review point of view, we should not cut the series to parts
J: I agree.
B: The first (refactoring MMU) part is also critical for the MMU users in
   production, we need to make sure we do things right.
S: We should look at the whole series first, then iterate only the first pa=
rt?
J: Yes and no...
B: Important for Ayan to look at what penny has done to avoid rework from h=
is
   or both side. Review from Ayan as a reminder for arm32 MPU work is impor=
tant.
   Is there any major code refactoring (of Penny's series) required to make=
 it run on R52?
   The expectation is that the MPU code should be common between R82 and R5=
2.
   If so, Ayan put appropriate comments in Penny's patches.
J: We need to review the whole series. This might should take some time (1-=
2 full days).=20
B: We are near to the release, any goal for this series?
J: MMU/MPU split to merge as the release goal would be nice. Some rework of=
 the
   mmu is fine for 4.18, MPU won't be in for this release.
Ayan: Like linux kernel, creating topic branch is a good idea?
B & S: We had these discussions, I dont think to create topic branch for MP=
U is
   a good idea, but a topic branch makes sure everyone has a same view of t=
he
   code instead of their own pieces.
B: Once Ayan does the rebase, we can have a place in gitlab to store the co=
de
Ayan: I will point the "problematic" part from Penny's series during my reb=
ase
   process and signal in mailing list.
B: I think penny has limited time on MPU, wei what's your input?
Wei: I've convinced internal management to include Henry in MPU
Wei: Also in current work containing 52 patches, we already split the patch=
=20
   logically in parts which can be committed separately.
B: Will try to achieve the above goal for 4.18
J: Tell maintainers how to test MPU
S: Upstream gitlab runner might have the license issue.
B: upstream yocto (might) solved this issue?
S & Ayan: R series EL2 emulation is not possible in QEMU
Wei: Zephyr is already using FVP_BaseR in CI
B: Zephyr is not using gitlab, EULA is difficult, but it is a known issue a=
nd=20
   possible to solve this
Ayan: Summary - (1) B & J & S will look the series to see if the MMU MPU sp=
lit=20
   is fine (2) Ayan will try to rebase and signal penny about gaps for R52
   (3) Check if the EULA license permits FVP to be used in docker.
S: 3 design questions:
 - how do we split the mmu and mpu,  Things like P2M is difficult, how to m=
ake
   p2m work
 - a lot of static inline return 0 (stubs), can we use common instead?
 - MPU is even more static than the normal dom0less, so usually for differe=
nt
   platform it's a build time configuration. Having it dynamic it's not rea=
lly=20
   a use case, it's nice to have but it's not necessary.
B: Nobody will use MPU without recompile Xen, also we dont have bootloader =
for
   R series
J: why not PIE?
B & Wei: toolchain support is bad. GCC has weak support for PIE, also for
   realtime purpose PIE isn't used. Statically allocated resources are hard=
 to=20
   deal with the PIE case.
Wei: We also have discussed the PIC/PIE possiblity in=20
https://lore.kernel.org/all/PAXPR08MB74206746246D1754682AA1959E999@PAXPR08M=
B7420.eurprd08.prod.outlook.com/t/#m77cbaf5b606901e5834e7c6fb3e30841da589d4=
b=20
section#3.3
J: Linux is able to do it. But we can start from things that are easy.
B: Introducing too much "dynamic" part is not good for real time.
S: Although I personally like the dynamic stuff, but most users will not us=
e
   them.
B: You dont have firmware, booting on several platform is already a problem=
.
   We will investigate PIE, but not a good idea for the current stage.

We can relax the check in head.S for arm32.

Kind regards,
Henry


