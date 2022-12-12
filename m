Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904264A4BC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459823.717600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lc8-0006YB-SK; Mon, 12 Dec 2022 16:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459823.717600; Mon, 12 Dec 2022 16:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lc8-0006VK-Od; Mon, 12 Dec 2022 16:25:12 +0000
Received: by outflank-mailman (input) for mailman id 459823;
 Mon, 12 Dec 2022 16:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jqX=4K=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p4lc6-0006V6-VN
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:25:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bd15796-7a39-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 17:25:10 +0100 (CET)
Received: from AS8PR07CA0041.eurprd07.prod.outlook.com (2603:10a6:20b:459::31)
 by DB4PR08MB9286.eurprd08.prod.outlook.com (2603:10a6:10:3f6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.7; Mon, 12 Dec
 2022 16:25:04 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::ec) by AS8PR07CA0041.outlook.office365.com
 (2603:10a6:20b:459::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9 via Frontend
 Transport; Mon, 12 Dec 2022 16:25:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 16:25:03 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 12 Dec 2022 16:25:03 +0000
Received: from 818f2a7d8fe0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4940C4F1-E30D-4778-9B09-DE6F5B21C0F9.1; 
 Mon, 12 Dec 2022 16:24:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 818f2a7d8fe0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Dec 2022 16:24:54 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAWPR08MB9711.eurprd08.prod.outlook.com (2603:10a6:102:2ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 16:24:49 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 16:24:49 +0000
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
X-Inumbo-ID: 8bd15796-7a39-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53OAeRwYVC6vgyPiJHR5Y2eg9PWA4qO7/4xHUd4scMo=;
 b=ZQ1h7L7AoKV54yJv4qwwrSczIrE/sCfy0vxrlD+YgRjUMnbscX0m5g2Z/sEvqmzncEC5Z0d+dzxeeJJeLCV84hDJWA4oJxXN1M4OUObCA3ZnIqhfzGRhZLdHIg2/rRd3KmglEEfhJRGf90Y5lesT1M5YEf0pV/L/ODXSpwRtrNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30da48d40377210f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZA3Mz8Byfk/86uhR5aMuysrGGgMhGw/MfiptdxucRiknYPJ9vqxJSrThY4DoKXs1rP5WQKU8YW9++7knGhWBl1htlJ8lJ/B0OPM4iNYw/2omD7ErUiFXA1tcVTCBpHIuURhUGWKGu6EomzuzGq7zhuRToBq+9sgJiKSMRj14qduVgRHhSbUE8nEAL1jx7g9sQOPEURi8dmoSALfYTv+LRHbavew/MGXIjHb2SKvYDk+6JilT+wVnFULuoWjjsHEZY491+0MHqOlMaKNDhr8gacKxCthpbyqwQXrNhCONS7weapVfhj9+MSrCdmS3KfkSs+Eaogwp7GK3HuKhg54OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53OAeRwYVC6vgyPiJHR5Y2eg9PWA4qO7/4xHUd4scMo=;
 b=TXOCGNl2BWWSBSd1WWVv2Nx+U4harA2VDbtF3nAm3aChI1IS8s4Cxgr7GwfRpf78aaGpDgQDPQrmzHy2GPFM150toWNyWBDJt/zkGpLNcTfnvi3hr+l6CqMLV5oaZNuInPCIZNE/6lX/QCHWfb7jsocnNWmYu6zLhBONEW0Z6x1p3pOJMuTFHjxPGhBPGRHZsw6AKuDrr7ZJzCGyHnLywaR6oh4AvVCwW8TU6iM/HCLpTi/MgvTyPjXexA8WneiVGA3RDBWMJl1Qa65lIyRJQ8q0KqqHmm9ZTGJ4wTfilVG+XAwY2ioiEx8UxgoZX1tFr6m62JKGmOx1NT8EmJlozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53OAeRwYVC6vgyPiJHR5Y2eg9PWA4qO7/4xHUd4scMo=;
 b=ZQ1h7L7AoKV54yJv4qwwrSczIrE/sCfy0vxrlD+YgRjUMnbscX0m5g2Z/sEvqmzncEC5Z0d+dzxeeJJeLCV84hDJWA4oJxXN1M4OUObCA3ZnIqhfzGRhZLdHIg2/rRd3KmglEEfhJRGf90Y5lesT1M5YEf0pV/L/ODXSpwRtrNM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv3: remove unused function
Thread-Topic: [PATCH] xen/arm: smmuv3: remove unused function
Thread-Index: AQHZDkLuKaGYVILFF0WaGMCTZHqskK5qazYAgAAExIA=
Date: Mon, 12 Dec 2022 16:24:49 +0000
Message-ID: <32990D42-8944-4438-ACE6-A4884ED5E74B@arm.com>
References: <20221212160031.31590-1-stewart.hildebrand@amd.com>
 <19f2def6-89ac-4cb3-9cfc-78351e9b5bde@xen.org>
In-Reply-To: <19f2def6-89ac-4cb3-9cfc-78351e9b5bde@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|PAWPR08MB9711:EE_|AM7EUR03FT004:EE_|DB4PR08MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9686912f-dd1c-408f-b4a3-08dadc5d6c93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fQlRicABPcy19PCq8fLIoGIe2r36//uS0n9CtegJUA7SadfhJ8vX0YZDB2meeZyeLoWg05alX0LhrNU7aPLhrOBtTx7Pxl4P9d+X1x7dupT9KoEBMKJLNQrb8Hv9uJRVXi2QTh0VrIIPMx/7jvMS3sdxB0ftf/hcPAV0d3xc1XHuR2ZnrDnhz8/EvR3fQvFDeZq7ejqz1h1z45utHN5prNA6c1ORCM87r+udTFiL80TtUhXWnMULvnY6iC13keP3IxNcFEh7YdU3YF3uyay3fOlq3qs1s83lCIaHg1PD8WJX667gc5bTWw7apXuQiyskQfLvnE7cR6Kqw3m68dRvPfE7g+QM7UqVGgkMM+U1MbNG62dvucEc6vy+7CCSWeFMdohNX/yeta+gtStZYFstuQqThxMH6KpApNUkuI9s+sXyOBVNGaxSiHKtMMH4naBvdjCqiFCvYBH/bEenW+rA4xUFOqjwazZ9vvq7cGRBN1kRJz/94byhBgd05HVeQkBs5Lllf18ufkc5oUZzBgtWLvXs3lmZFShLJsBBzlqBMPsxGY3+UpTdROuN/C+5s2R3jR27HhLRBheZUtukWuuaxQ0M6RmFYTILZphX/J3prYYpUF2Gj64IDEY0WGC0wvrKsYNXsCmABPGhxY+FHrsGHriVcIkEdpnishhgaGIDbkk3+GLu/8mVJEfqGXHaDAD7xTQv6+W0BQ+JevgT42g5839BUAenxNCILGqczokP2bw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(36756003)(316002)(54906003)(6506007)(186003)(53546011)(26005)(6512007)(6486002)(6916009)(86362001)(33656002)(122000001)(66946007)(76116006)(64756008)(66476007)(66446008)(8676002)(38100700002)(4326008)(66556008)(41300700001)(2616005)(71200400001)(38070700005)(478600001)(5660300002)(91956017)(2906002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AFF4C4347845B14AABBED492FA45EBFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a80f14e6-b9be-42e7-b8e9-08dadc5d6402
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ILyPAH8/4TSpXjM8etWPLUwDDRuSrwjW2RRZ84vBOXp02xujRjlJK5k+FIGWRDZgbVk0YAq22Jlj6OdE4gtW2PkCUo2LJaNSWSozbQbaHmvM7ytgGWG71AFKpf0bjKWn5shlvk+mc+AcuL5ffr8alqniKkmzrGNhXq4D+mLa/L0OsYcoWYktoOJGCAPbJkHV+uRRc4ppxcnrTIsIb8RgjMwd6Dt3wvqyLRr7UiQVVr7oBbjWCjAXs0GROqq9XsxmGsgFreb0ieqRw14o/lQbtMLYa7qOP4VO5nKgia/I1K7V/WExSidGgEPmqeHNKbqiWPuX89Q0V3rms/bUY2HBzYGE2ZrY3x4mKNoGuJdFpH2rpcK7N9pjIWC4iQ50JhHieWV85uVSnBK3ZQ1gzMZoSOp9t+TI++m7HA3veCDJk/BJSdRQWkKaii6mrxFrGOprFDe2dayvDN4PkrQO+0PnIEiqxUMkqffDB5kvq+zzTiqp8TUbQ8kktHarCq0ArMe5HxeNZk5RhcyVVG1Ch6ieEUQmNMxScIFhgt+97eBQdPYZMFn3ExIcyrsYPbpXJ6ekMKRYVnK+boSheo1N/A8ow6+UJPzQF3mv0BEutorLMvWK+5dJ4rbu538tG0lX9YpvHGnoxKTrv0i5nmCgMbcw78XOBWuMcyG+mNeLSNykU6zWkuNhFeN/YMXMMOmxdB2Sae2rEvl69od4MZUVtyczxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(86362001)(107886003)(8936002)(6862004)(82740400003)(33656002)(81166007)(53546011)(40460700003)(356005)(36860700001)(6486002)(54906003)(5660300002)(478600001)(41300700001)(47076005)(6506007)(316002)(4326008)(82310400005)(8676002)(70206006)(70586007)(2616005)(336012)(6512007)(40480700001)(186003)(26005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:25:03.7566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686912f-dd1c-408f-b4a3-08dadc5d6c93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9286

Hi Julien,

> On 12 Dec 2022, at 4:07 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stewart,
>=20
> On 12/12/2022 16:00, Stewart Hildebrand wrote:
>> When building with clang 12 and CONFIG_ARM_SMMU_V3=3Dy, we observe the
>> following build error:
>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_s=
mmu_disable_pasid' [-Werror,-Wunused-function]
>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master=
) { }
>>                    ^
>> Remove the function.
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> There is also a definition of arm_smmu_disable_pasid() just above,
>> guarded by #ifdef CONFIG_PCI_ATS. Should this one be removed too? It
>> might be nice to keep this definition for ease of backporting patches
>> from Linux, but if we ever plan on supporting PCI_ATS in Xen this may
>> need to be re-visited.
>=20
> Given the function is not called at all, I think this is a bit odd to rem=
ove the stub but leave the implementation when CONFIG_PCI_ATS is defined.
>=20
> Rahul, do you plan to use it in the PCI passthrough code? If yes, then I =
would consider to use __maybe_unused.

No, this function will not be used in PCI passthrough code, but when we mer=
ged the SMMUv3 code from Linux at that time we
decided to have this code and gate with CONFIG_PCI_ATS so that in the futur=
e if someone wants to implement the PASID feature
will use these functions.

I also agree with Julien we would consider using __maybe_unused.

Regards,
Rahul=

