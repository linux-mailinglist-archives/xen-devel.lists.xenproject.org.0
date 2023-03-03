Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0A6A9552
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:35:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505800.778744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2lE-0004dN-26; Fri, 03 Mar 2023 10:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505800.778744; Fri, 03 Mar 2023 10:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2lD-0004aZ-Ub; Fri, 03 Mar 2023 10:35:35 +0000
Received: by outflank-mailman (input) for mailman id 505800;
 Fri, 03 Mar 2023 10:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY2lC-0004aT-Fr
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:35:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1efa7723-b9af-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:35:31 +0100 (CET)
Received: from DBBPR09CA0009.eurprd09.prod.outlook.com (2603:10a6:10:c0::21)
 by DB9PR08MB6492.eurprd08.prod.outlook.com (2603:10a6:10:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 10:35:28 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::b1) by DBBPR09CA0009.outlook.office365.com
 (2603:10a6:10:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 10:35:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 10:35:28 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Fri, 03 Mar 2023 10:35:27 +0000
Received: from 979cfc0d99c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC8DF958-AB09-4E5F-8F60-73BDF6A17A90.1; 
 Fri, 03 Mar 2023 10:35:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 979cfc0d99c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 10:35:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 10:35:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 10:35:14 +0000
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
X-Inumbo-ID: 1efa7723-b9af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN5YmQIz2EE/czgxeRJLRjP2UdqsnUy2/I1lmBst4ho=;
 b=sValK+TTfhrlb3mFBm/9hd7omWYilBELHmpPTTHND7cxvp3UIk2E5WIda1EKcwcxKB43EIrRM7sfXtojNsLQQDxc5DUM8tMsmNyCKmbZALz1HNI28/UJ/hIgNiP9xUt75UGJBmYuboQxRVTlBWUG0+eWyr1uou5Smr65a8ZxarU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1b37e6af7953a57
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHRTn1TcJAs67CZJkyKlemyyIrqeJkWQ5aKogIBqijDxLXVQQB0iNG/RIABXzXtuzjyYwol/j9p2XrxkxAZBJmqUXZL+tkGrwoE98CaCXJyqsT0EHYC20s+WP9kneSG76Mki/XIgEhZIvpNbRm9oRDEx9ln/EVRSOgTNAGOB8AlipSVZ/wyrG9gay/Vspc9B95mVnJoGUwOFDnROJwf2oQu/DLB1PldQNhRmvBulM8ZieNymysG/91TVIjSHYtRXBN6SxLfA9dW3/wmuPaXhfDpVir5nbBJMy38tSRZ9yARSgaRhbryStquGc2kfRYDDpe1HSDoi/5KDrOxA5s7/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN5YmQIz2EE/czgxeRJLRjP2UdqsnUy2/I1lmBst4ho=;
 b=fdxsvB3zI5VNqAqLtAv961bnGfG+AwvcrqnLWEivreo+x66osZc28V6fl635Wm6fcCtxwqoOo4ZhS+hxk5YZ/Rg8jdH0X+pexBS8KC58m4fsip7MEiqQ+Xc/mel6aCAJHDYX6Ctr3oBVsa9/KIggtN+3GbEZrqtEWHyEulybE8BPjf2DygqL0Ot78RZCeRCNkzGGeXFqTLXPMwRhGuBn6jOTQTvL4YE5ZXMUPVAV/V9wCibtFrAoz1YGKntyBHWE9Kk3UyewNNcaAf1u59QWYMZM++vPwm3ZE8ruw51SjCiXWiKUYzzlOec3HldRGxDCgFpqrMWkahyT0Q+33j/V0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN5YmQIz2EE/czgxeRJLRjP2UdqsnUy2/I1lmBst4ho=;
 b=sValK+TTfhrlb3mFBm/9hd7omWYilBELHmpPTTHND7cxvp3UIk2E5WIda1EKcwcxKB43EIrRM7sfXtojNsLQQDxc5DUM8tMsmNyCKmbZALz1HNI28/UJ/hIgNiP9xUt75UGJBmYuboQxRVTlBWUG0+eWyr1uou5Smr65a8ZxarU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v6 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZTRemNcTNCEx/pkKdN97JgIHeCq7o3XCA
Date: Fri, 3 Mar 2023 10:35:14 +0000
Message-ID: <8BCE9C06-D081-4627-8057-1FF3D59390C6@arm.com>
References: <20230302145916.44035-1-julien@xen.org>
 <20230302145916.44035-4-julien@xen.org>
In-Reply-To: <20230302145916.44035-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5807:EE_|DBAEUR03FT061:EE_|DB9PR08MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: eb018062-cfa3-41e0-f006-08db1bd3017d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r1soHF/BeQRwozrHzbtMrQhBg26CriAfkUrCscfrbKykO7OwR09zHfUKLUIafFrmisoWAYgewjiASozeJWVekObcA0duK4mlqhypl3wp+9dJ5CcrNKkRhNBle7usaalBJChBCIjAhij0ECgidovfqwqxgF6/Myrsp+4t0A27HjHP/kVQU+UJru0RklmTA5z/ya/GnGLgQ+2i82HvLlNlpxA/J2TpElP5EwSF07eDpYkvYwP35MvK174MstZBws/U5QPoPLpYcA9XFpfqErUw+ZqDa2xpt8GhyjyspfD4L62uE3Ouwl6ue2vykO21wCsMhhgyjvs0YGE0+OCXykD3XI/c93YYR9dZttGEI7/uOqc1UegNWjF4oW54p8rleiqh28eHPIV+nGHgHR9Z3SbsMuR+NENw044l8FcqlTtVGJBZpyGy5Tv7bJ+vZbU026Zf4OCrNfqWsjXIMBFFXugqOfbyk7bR06JuID8HJzahpcPEIydkx2fvGITsnNE5yG6+72fz/pKLvgeB4IWbp/0N+QghPQ6AED0pi7PGC/BGzPLSoFa7mDXHa+yFNkqVZnKyPOJV5TEqmmodYgKHeSxIKURrsRviwZOXOaaR27C0SZr8P3u90nFFI7ViyTu5b6ZPsn+SF1d6niBadY4oPmfKpGF6UVzJn3jSeyNNEVKMoz8jOWIImvgdrT4f+p03RDlLJdm8VZJOzB3jAP+0FOCby9W/xwuKWGTln02upo+r8sQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199018)(36756003)(33656002)(83380400001)(6506007)(6512007)(26005)(53546011)(71200400001)(186003)(2616005)(41300700001)(6486002)(8936002)(64756008)(66446008)(76116006)(91956017)(66476007)(4326008)(6916009)(8676002)(66556008)(2906002)(66946007)(5660300002)(86362001)(30864003)(38070700005)(122000001)(38100700002)(316002)(54906003)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DDDFF3559B7F147BE61C805C7C181D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	56f2b2ba-445c-4426-2d26-08db1bd2f930
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bE4N1KyrWPr45WstLAH4ymcCQH15G1FnMaXNjU5iUy1DFQooAYjYNOSAnhgAi+qv0EsCc4Su0BonA50nQBvTRA80fR0SDF3BF1rofCpmLltjHU6JxZqNYzR/b7kkOY6+visZ5osSY1msFA9YYi4b54BNQi1iZhEJWgW1AEGCHG99B/2cC6DjsSkEfXQFDKJuUEqUugUgZbC/kQBvKXTR9/WQkz2MxTO13UuN9m+s2zzFC1ufNjofA0nsZIbockd811lxPBqv9FIdKwRGHDNlDUj05gfkQLdmfkt3raWeifU7SurlX8dRRFeosRaSdz2fMdhll3d85RdU12AJPbuCAlBYYOUhWrYJ9JFisjP4oxypP8mHDjR3eq2kd6pAHWv0UalQVBh0FO29K8kW5g38tUp5PJ4gTz/3Cx3ttVMoPJkL4kVsrgVL/2F5W1Wyz9t16lMe7arCe+Hcexuwc/5ugGN/UrEItiZiZ64M+mqSjHxE5B05oJNADh3Y6bCfN4oaYH2Kb5n95SUz21CUzSN/jez9NPBiMrEFUdP3lmZ/3mnINajXUjCWBioJxICtBA46mpKmJKQ2ZWmDDGEUeMGkO24/bJE1dRfvqozgFIIOs9Mmd0bXs7cLSbrGZYYq1PL9j9r9fxU0XqkkSICggkW1Rl+qSE1b1UFJM2NE9cBHNvl2i5g5YvRc6VWFzL+gVaTNqKoqOa/ny7ah+/YA97R/2A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199018)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(107886003)(47076005)(40460700003)(36756003)(8936002)(82740400003)(6862004)(5660300002)(478600001)(81166007)(356005)(33656002)(40480700001)(86362001)(82310400005)(2616005)(186003)(26005)(336012)(6506007)(53546011)(6486002)(6512007)(70586007)(8676002)(70206006)(2906002)(30864003)(316002)(4326008)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:35:28.0137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb018062-cfa3-41e0-f006-08db1bd3017d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6492

Hi Julien,

> On 2 Mar 2023, at 15:59, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>    - arch_setup_page_tables() will setup the page-tables so it is
>      easy to create the mapping afterwards.
>    - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

In Arm internal CI this patch (or maybe an other in the serie) made one
of our test crash on qemu-arm64.

The error log is here after.

Cheers
Bertrand

- UART enabled -

- Boot CPU booting -

- Current EL 0000000000000008 -

- Initialize CPU -

- Turning on paging -

- Zero BSS -

- Ready -

(XEN) Checking for initrd in /chosen

(XEN) RAM: 0000000040000000 - 00000000bfffffff

(XEN)=20

(XEN) MODULE[0]: 0000000040200000 - 00000000403590c8 Xen=20

(XEN) MODULE[1]: 0000000048000000 - 0000000048008f20 Device Tree=20

(XEN) MODULE[2]: 0000000045000000 - 00000000463e3200 Kernel=20

(XEN)=20

(XEN)=20

(XEN) Command line: console=3Ddtuart dtuart=3D/pl011@9000000 dom0_mem=3D512=
m

(XEN) Domain heap initialised

(XEN) Booting using Device Tree

(XEN) Platform: Generic System

(XEN) Looking for dtuart at "/pl011@9000000", options ""

Xen 4.18-unstable

(XEN) Xen version 4.18-unstable (@eu-west-1.compute.internal) (aarch64-poky=
-linux-gcc (GCC) 11.3.0) debug=3Dy 2023-03-02

(XEN) Latest ChangeSet:=20

(XEN) build-id: cc83f93cef7a75d303680ba1f98e756c07df5497

(XEN) Processor: 00000000411fd070: "ARM Limited", variant: 0x1, part 0xd07,=
rev 0x0

(XEN) 64-bit Execution:

(XEN) Processor Features: 0000000001000222 0000000000000000

(XEN) Exception Levels: EL3:No EL2:64+32 EL1:64+32 EL0:64+32

(XEN) Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg

(XEN) Debug Features: 0000000010305106 0000000000000000

(XEN) Auxiliary Features: 0000000000000000 0000000000000000

(XEN) Memory Model Features: 0000000000001124 0000000000000000

(XEN) ISA Features: 0000000000011120 0000000000000000

(XEN) 32-bit Execution:

(XEN) Processor Features: 0000000000000131:0000000010011001

(XEN) Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle

(XEN) Extensions: GenericTimer

(XEN) Debug Features: 0000000003010066

(XEN) Auxiliary Features: 0000000000000000

(XEN) Memory Model Features: 0000000010101105 0000000040000000

(XEN) 0000000001260000 0000000002102211

(XEN) ISA Features: 0000000002101110 0000000013112111 0000000021232042

(XEN) 0000000001112131 0000000000011142 0000000000011121

(XEN) Using SMC Calling Convention v1.0

(XEN) Using PSCI v0.2

(XEN) SMP: Allowing 4 CPUs

(XEN) enabled workaround for: ARM erratum 832075

(XEN) enabled workaround for: ARM erratum 834220

(XEN) enabled workaround for: ARM erratum 1319367

(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 62500 KHz

(XEN) GICv3 initialization:

(XEN) gic_dist_addr=3D0x00000008000000

(XEN) gic_maintenance_irq=3D25

(XEN) gic_rdist_stride=3D0

(XEN) gic_rdist_regions=3D1

(XEN) redistributor regions:

(XEN) - region 0: 0x000000080a0000 - 0x00000009000000

(XEN) GICv3: 256 lines, (IID 0000043b).

(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000

(XEN) XSM Framework v1.0.1 initialized

(XEN) Initialising XSM SILO mode

(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)

(XEN) Initializing Credit2 scheduler

(XEN) load_precision_shift: 18

(XEN) load_window_shift: 30

(XEN) underload_balance_tolerance: 0

(XEN) overload_balance_tolerance: -3

(XEN) runqueues arrangement: socket

(XEN) cap enforcement granularity: 10ms

(XEN) load tracking window length 1073741824 ns

(XEN) Allocated console ring of 32 KiB.

(XEN) CPU0: Guest atomics will try 1 times before pausing the domain

(XEN) Bringing up CPU1

(XEN) arch/arm/mm.c:874: Changing MFN for a valid entry is not allowed (0x8=
284 -> 0x40200).

(XEN) Xen WARN at arch/arm/mm.c:874

(XEN) ----[ Xen-4.18-unstable arm64 debug=3Dy Not tainted ]----

(XEN) CPU: 0

(XEN) PC: 0000020000272438 mm.c#xen_pt_update+0x6d0/0x82c

(XEN) LR: 0000020000272438

(XEN) SP: 000002000030fc60

(XEN) CPSR: 0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)

(XEN) X0: 0000020000318038 X1: 0000000000000002 X2: 0000000000000000

(XEN) X3: 0000000000000003 X4: 00000200002be956 X5: 0000000000000002

(XEN) X6: 000080007ffe9360 X7: fefefefefefefefe X8: ffffffffffffffff

(XEN) X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101

(XEN) X12: 0000000000000008 X13: 0000000000000030 X14: 0000000000000005

(XEN) X15: 0000000000000000 X16: fffffff800000000 X17: 0000000000000001

(XEN) X18: 0180000000000000 X19: 0000800000326000 X20: 0000000000000003

(XEN) X21: 0000800000326000 X22: 000002000030fd5c X23: 000002000034f000

(XEN) X24: 0000000000000003 X25: 0000000000040200 X26: 000002000031b074

(XEN) X27: 0000000000000000 X28: 0000000000040200 FP: 000002000030fc60

(XEN)=20

(XEN) VTCR_EL2: 0000000000000000

(XEN) VTTBR_EL2: 0000000000000000

(XEN)=20

(XEN) SCTLR_EL2: 0000000030cd183d

(XEN) HCR_EL2: 0000000000000038

(XEN) TTBR0_EL2: 000000004034e000

(XEN)=20

(XEN) ESR_EL2: 00000000f2000001

(XEN) HPFAR_EL2: 0000000000000000

(XEN) FAR_EL2: 0000000000000000

(XEN)=20

(XEN) Xen stack trace from sp=3D000002000030fc60:

(XEN) 000002000030fd60 00000200002727f8 ff00000040200b80 0000000000000000

(XEN) 0000000000000001 000002000034f430 000002000034f000 00000200002aef18

(XEN) 00000200002f0d38 0000000000000001 0000000048000000 0000000000008f20

(XEN) 0000000000000001 0000020000000037 0000000000000001 0000000000000001

(XEN) 000000010030fd00 00000200002b4eb8 0000000000000001 000000000004034e

(XEN) 0000000000000020 0000020000000037 0000000000000000 0000000000000001

(XEN) 0000000000000000 000002000031b074 0000000040200000 0000000000000001

(XEN) 000002000030fd60 000002000024c710 0000000100000000 0000000000000001

(XEN) 000002000030fd70 0000020000265cac 000002000030fda0 0000020000265d38

(XEN) 0000000000000001 0000000000000000 0000000000000001 00000200002aef18

(XEN) 000002000030fdc0 00000200002787f4 0000000000000001 00000200002787ac

(XEN) 000002000030fe10 0000020000201f78 0000000000000001 0000000000000000

(XEN) 00000200002f0d38 00000200002dccf8 000002000030fe10 0000020000201f50

(XEN) 0000000000000001 00000200002c1358 000002000030fe40 00000200002dc92c

(XEN) 0000000000000001 00000200002b3000 00000000c0000000 00000200002bee58

(XEN) 0000000000000000 00000200002001bc 0000000040200000 fffffe0040000000

(XEN) 0000000048000000 0000000000000000 0000020000400000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) Xen call trace:

(XEN) [<0000020000272438>] mm.c#xen_pt_update+0x6d0/0x82c (PC)

(XEN) [<0000020000272438>] mm.c#xen_pt_update+0x6d0/0x82c (LR)

(XEN) [<00000200002727f8>] map_pages_to_xen+0x10/0x1c

(XEN) [<0000020000265cac>] update_identity_mapping+0x58/0x94

(XEN) [<0000020000265d38>] arch_cpu_up+0x30/0x78

(XEN) [<00000200002787f4>] __cpu_up+0x80/0x1d0

(XEN) [<0000020000201f78>] cpu_up+0xc8/0xf8

(XEN) [<00000200002dc92c>] start_xen+0x8fc/0xcb0

(XEN) [<00000200002001bc>] head.o#primary_switched+0x10/0x30

(XEN)=20

(XEN) Xen BUG at arch/arm/arm64/mm.c:120

(XEN) ----[ Xen-4.18-unstable arm64 debug=3Dy Not tainted ]----

(XEN) CPU: 0

(XEN) PC: 0000020000265ce4 update_identity_mapping+0x90/0x94

(XEN) LR: 0000020000265cac

(XEN) SP: 000002000030fd70

(XEN) CPSR: 0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)

(XEN) X0: 00000000ffffffea X1: 0000000000000001 X2: 0000000000000000

(XEN) X3: 0000000000000002 X4: 00000200002bee06 X5: 0000000000000001

(XEN) X6: 000080007ffe9358 X7: fefefefefefefefe X8: ffffffffffffffff

(XEN) X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101

(XEN) X12: 0000000000000008 X13: 0000000000000030 X14: 0000000000000005

(XEN) X15: 0000000000000000 X16: fffffff800000000 X17: 0000000000000001

(XEN) X18: 0180000000000000 X19: ff00000040200b80 X20: 0000000000000000

(XEN) X21: 0000000000000001 X22: 000002000034f430 X23: 000002000034f000

(XEN) X24: 00000200002aef18 X25: 00000200002f0d38 X26: 0000000000000001

(XEN) X27: 0000000048000000 X28: 0000000000008f20 FP: 000002000030fd70

(XEN)=20

(XEN) VTCR_EL2: 0000000000000000

(XEN) VTTBR_EL2: 0000000000000000

(XEN)=20

(XEN) SCTLR_EL2: 0000000030cd183d

(XEN) HCR_EL2: 0000000000000038

(XEN) TTBR0_EL2: 000000004034e000

(XEN)=20

(XEN) ESR_EL2: 00000000f2000001

(XEN) HPFAR_EL2: 0000000000000000

(XEN) FAR_EL2: 0000000000000000

(XEN)=20

(XEN) Xen stack trace from sp=3D000002000030fd70:

(XEN) 000002000030fda0 0000020000265d38 0000000000000001 0000000000000000

(XEN) 0000000000000001 00000200002aef18 000002000030fdc0 00000200002787f4

(XEN) 0000000000000001 00000200002787ac 000002000030fe10 0000020000201f78

(XEN) 0000000000000001 0000000000000000 00000200002f0d38 00000200002dccf8

(XEN) 000002000030fe10 0000020000201f50 0000000000000001 00000200002c1358

(XEN) 000002000030fe40 00000200002dc92c 0000000000000001 00000200002b3000

(XEN) 00000000c0000000 00000200002bee58 0000000000000000 00000200002001bc

(XEN) 0000000040200000 fffffe0040000000 0000000048000000 0000000000000000

(XEN) 0000020000400000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN) 0000000000000000 0000000000000000

(XEN) Xen call trace:

(XEN) [<0000020000265ce4>] update_identity_mapping+0x90/0x94 (PC)

(XEN) [<0000020000265cac>] update_identity_mapping+0x58/0x94 (LR)

(XEN) [<0000020000265d38>] arch_cpu_up+0x30/0x78

(XEN) [<00000200002787f4>] __cpu_up+0x80/0x1d0

(XEN) [<0000020000201f78>] cpu_up+0xc8/0xf8

(XEN) [<00000200002dc92c>] start_xen+0x8fc/0xcb0

(XEN) [<00000200002001bc>] head.o#primary_switched+0x10/0x30

(XEN)=20

(XEN)=20

(XEN) ****************************************

(XEN) Panic on CPU 0:

(XEN) Xen BUG at arch/arm/arm64/mm.c:120

(XEN) ****************************************

(XEN)=20

(XEN) Reboot in five seconds...



