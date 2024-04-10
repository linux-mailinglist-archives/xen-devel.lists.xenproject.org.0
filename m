Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621F89F975
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703314.1098930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYco-000629-SZ; Wed, 10 Apr 2024 14:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703314.1098930; Wed, 10 Apr 2024 14:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYco-00060S-Pa; Wed, 10 Apr 2024 14:08:30 +0000
Received: by outflank-mailman (input) for mailman id 703314;
 Wed, 10 Apr 2024 14:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruYcn-00060M-06
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:08:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2611::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf64c23-f743-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 16:08:27 +0200 (CEST)
Received: from AM6PR08CA0011.eurprd08.prod.outlook.com (2603:10a6:20b:b2::23)
 by PA6PR08MB10624.eurprd08.prod.outlook.com (2603:10a6:102:3d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Wed, 10 Apr
 2024 14:08:24 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:b2:cafe::e3) by AM6PR08CA0011.outlook.office365.com
 (2603:10a6:20b:b2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 14:08:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 14:08:24 +0000
Received: ("Tessian outbound 5ad6c4395be7:v300");
 Wed, 10 Apr 2024 14:08:23 +0000
Received: from 9fd9624a4f18.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95663788-0E67-46E8-B942-FC4E34D3A80D.1; 
 Wed, 10 Apr 2024 14:08:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fd9624a4f18.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 14:08:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU2PR08MB7360.eurprd08.prod.outlook.com (2603:10a6:10:2f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Wed, 10 Apr
 2024 14:08:05 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 14:08:05 +0000
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
X-Inumbo-ID: ccf64c23-f743-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N3a/xfIG6ZnJGM+GNqxw0f8CZWpCgMuuWT8KLDMcz+NphEPyWBs9VrLDuZrmP2I9JiTsEty0PS3rVOY3mcGGBrC+Uf087sRr+EboK6y0z9vH9E9up8NTiedGuSpMKb3eG5+heUwZ8ciIrtfedDr1sb5mPwBTAZfcwhWZfx8e51SEar6W5bKLg+gE266eafzavo8B15WWEZDTnZEdm9F/YLJGKJUXPXfyAfm5BiP4js3djl85/8ST7PIqyFZxgbfFuG7NJcaUe0lpQFX/VMZpoliB1Yjjkk8v9SqBv+wxcuNUADEBlUhAKVa4Mc0V28RThCk4Z4w0zrslHI/Tffg/9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltsPFWhJLxKQAabjmdEhyDMnVaRfWXK24rj3aHIp5FU=;
 b=oXSgdWcM3tUX1vMJ5E/LUi10uzdgADK/ZWbBF9SRszE6fdEdHsLn8BUoBHdtalCj5roVfm4Lw4vAb5dFl/E+UDP2P/caidSNVqLm2SjiZRCjVDeLzjErfW2TKBpSZt9xcGLYnz636/ZTnGGmqZh6Loih1hRO7ZVgb/tabShyYOF6VYQzf97K6FgG97Mlx8b4ScqcmekK79Vb08KNcL6fwjAytqKkx/kNkHZeQoulra6OwANAIBghTttlI0FkDAcLKrHlDeJhyMLhQnTBdZroDGiI5X7HzlatuxQzLGcXNrLulvzYLGahbxQbvsPUtBnDH4AHDOUXFaT7Xqq36eZZsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltsPFWhJLxKQAabjmdEhyDMnVaRfWXK24rj3aHIp5FU=;
 b=ah3scvPY3Clj9aMDfrOOkhAmRr4goSfrVNfxsasmyccwQfa+I5966loNa9VCAEr2yTYLjyVUgdRiE/PBRxEEjMVzB9ltC3vm8ZDby7VrOLtCw+39TMaLcDjA92V4Aq6dd65uBqckW+naBQEhKvfAb2rtPR6q7sRd/WZiyDoiwJQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29b33a97734fda7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/J2D10s15aAfFWh6lS341EJHzN0nycYtwZvzThIHEE4+0mj16C3MBDWARb7oPXu9PmZDiHWETFok1FDRot0dZBzMiiwRi5vh8MDuDPfaAydioGa/m4WwuMalby1LnYT/Ju1TRW31bztjJE+Z5r+T9/4O3wBcxL+9U9HuZjcE0AFH3PujA4KQ5QndMbhtBqibUYYTlmP7sR4hpUd0QytjE1DiZ3S8w81g9U/QsPNhRPUcg626rAVi6SoDjsHpBlK2MSBo48RrbcaURAfj38D2pdyE/MDjfal3zdg8Pc52qZnfm2dKF/aC0anlcOFpE8xu6Nf0TM+eSOifSzG70171g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltsPFWhJLxKQAabjmdEhyDMnVaRfWXK24rj3aHIp5FU=;
 b=PyciLrR5d3NpGsDL1bjeXv4RDcvBp5OPwkF+D0FMrM29CRIYuur/UVsH23axc87Z7WunhQEGhi2dEG9pr7lIIkxA6JsQXjkEFNBd+JASsv1IrOA2quKc4pgWnClPn2L1fi6aQxqs+4zeEbkrRz5YkK9v246iRHcpeF3G50XWthXXvP7MTWlzit1vXDLgBfjeS7JOOI5ax2qnibmI5KDkzYJ6Go69c/26Nu1Yop59M0bTZm7IinjL6he2lWHGVekJujXKWneJxKk7Lydw8BefGTElI8cF0i60ZCK67IIhKmjmZ+xlgDYigYtoRng6rxnvWkGejHx4GsmJ0wVF8Zfm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltsPFWhJLxKQAabjmdEhyDMnVaRfWXK24rj3aHIp5FU=;
 b=ah3scvPY3Clj9aMDfrOOkhAmRr4goSfrVNfxsasmyccwQfa+I5966loNa9VCAEr2yTYLjyVUgdRiE/PBRxEEjMVzB9ltC3vm8ZDby7VrOLtCw+39TMaLcDjA92V4Aq6dd65uBqckW+naBQEhKvfAb2rtPR6q7sRd/WZiyDoiwJQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
Thread-Topic: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
Thread-Index: AQHainORNadX2Zn/QkSGO7PTdS59ZLFhXAaAgAAwCoA=
Date: Wed, 10 Apr 2024 14:08:05 +0000
Message-ID: <B92FBADE-8FB8-471F-AD6E-693FC5C1D91A@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-11-luca.fancellu@arm.com>
 <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
In-Reply-To: <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU2PR08MB7360:EE_|AMS1EPF00000049:EE_|PA6PR08MB10624:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CuUgHr6+G6iQy3ytLlDK63IY6QpE6LKKVu3YYBcUyQBzIf5G1VJVuQ0m32wRLxPgriSeUxqx+hFiWia06kKx3oOwdsZTjfndXrxK2nPVpTTzTMBDNbBQvybjYAOxd/OwdsXwIqOskiY433jA73vKIAgQnjqe/EJsqIDuO42/5H50sJkx/X2EY7g2V/CxmgtdShAPhMVv3k1SB/0/a7Nbc8vXRNV2VsEyPthgGork9wdumhXlAscBERAoUKkXfWarHepgcWKHwV2IDc+1JhYF7u8g6GmllKu14uP/Wq0QmxyMPlWOq0ccuY5+PgQwtrl4BO2n3VitTHEwPLJmjS48zre3tJv9bf7YfNEjFHgjGCzSc3/xalLxWu5SBBVUTsvceL44Vm1DmucLOcO8xEuHax7txEBvSYmVun9Rk9srR7tkbBFVKOdCOJsFxsVkYsGyHj+ctppWsf9XKreD+EhXehCwYc68vkhmyVfFnwxIBbVGbV8y6kRI3AIa8OB0mCgSJWdBqWkX8rfzTqi+ABe72QuJrevTK7nrxJzYSTJ5fcUC2Ii8VxoDUJ5pU1EmOdP5Q+aVsbhR7SRmG9vJJIZrZIjsdCMXMNkoABVy9RlOlU4865jAdhvoRm2Sim0tG1bZZZXY6yoh21rhMihH1M95gmjmYScA3Ugw7GFUrFYnNtc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9D5486F28A0D8A4FBAC2B37041563FD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7360
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb3e206-10e0-4f51-3471-08dc5967af87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kZfqZDSgUPcG8jOHPqNz80cVbsk2pwgHX7TXDLL1zkjfwMql0DaT2hn0x0YFByuqZ7BieyR0cgcF/gPLmdcNjVS8eMATi0G3ylnLTclWwTAmEkJ7zCNNofLRb5nG2oxrdyk5Z9mCHWnzw2fIi9LLAUU3AxGDJbyAx99I91d6dkn8RBPMfq42PNXgEn10qRphT8GcGJRe5ZF0DJuTdBtwPHB5XeARNmp2O86sFyaPz6Fwnsn5MVmMYvoaC2ouuLsmdjQSZSjCHmZHigsfX3u0uxANuMpwlN+uUnoxHaZmITOSCvpGuO7r2KMn2qYdMa4QO13eypfZkezsOtc23UvdiCAALu22k38WvShv3HsN9sMKbs0T89671JelOd5JrqSayZP6GhbnpvSBn0o3HGQdFmPI+e7rOiFgguPKgDWHr03FEjcOod0Kc0YNGeyv2SmJo1sXtAE8wRUw8IFrNKeqQ6bNx8DZ9liVImCf4Ct94V9lPxqKM5MuGM9ihLLh6Gy3TjVfSm8UWoisXAIDrYAFtaDOY32efGVp744q8QVzptkEL4nN+AFkDp7HdLHShBlsbhq2LX1soqYz5JKI+R0XKZQLbPS+qzRbWlQyXoa2/GzG1hOVwSVl3TvNkjFVFLlYBjcbjqqy5tBWQzCZjqGt16K718Tlgf1SfBbAjupCJEiYKeMPY2N7kyVUOk9vF9nGWXtt6aoIjDkVypjCayRNemj/Y6/hCoRboTnWj7Q+LvM4oDx+pI57Bo4Pkdvqpioh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:08:24.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb3e206-10e0-4f51-3471-08dc5967af87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10624

Hi Michal,

>>=20
>> For direct-map domain with iommu on, after we get guest shm info from "k=
info",
>> we use "remove_shm_from_rangeset" to remove static shm.
>>=20
>> For direct-map domain with iommu off, as static shm has already been tak=
en
>> care of through reserved memory banks, we do nothing.
> Stale info given that shmem is no longer part of reserved memory banks. I=
t's been taken care
> of by removing shmem regions in find_unallocated_memory()

Sure, will amend for this:

>>=20
>> +int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
>> +                                    struct rangeset *rangeset)
>> +{
>> +    const struct membanks *shm_mem =3D &kinfo->shm_mem.common;
>> +    unsigned int i;
>> +
>> +    /* Remove static shared memory regions */
>> +    for ( i =3D 0; i < shm_mem->nr_banks; i++ )
>> +    {
>> +        paddr_t start, end;
>> +        int res;
>> +
>> +        start =3D shm_mem->bank[i].start;
>> +        end =3D shm_mem->bank[i].start + shm_mem->bank[i].size - 1;
> If you look at other rangeset_remove_range use cases and error messages, =
1 is subtracted
> in PFN_DOWN() so that the error message contains end unchanged. Please ad=
here to that so that
> printed messages are consistent.

Yes I will change it to have -1 inside PFN_DOWN(), here and in the other oc=
currences
>>=20
>> +    /* Remove static shared memory regions */
>> +    res =3D remove_shm_from_rangeset(kinfo, guest_holes);
>> +    if ( res )
>> +        goto out;
>> +
> Could you please add a comment explaining here what's done below?

Is it ok something like this:

/*
 * Take the interval of memory starting from the first extended region bank
 * start address and ending to the end of the last extended region bank.
 * The interval will be passed to rangeset_report_ranges to allow it to
 * create, by the add_ext_regions callback, a set of extended memory region
 * banks from the guest_holes rangeset, which contains the original extende=
d
 * memory region ranges where the static shared memory ranges are carved
 * out.
 */

>> +    i =3D ext_regions->nr_banks - 1;
>> +    start =3D ext_regions->bank[0].start;
>> +    end =3D ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
>> +
>> +    /* Reset original extended regions to hold new value */
>> +    ext_regions->nr_banks =3D 0;
>> +    res =3D rangeset_report_ranges(guest_holes, PFN_DOWN(start), PFN_DO=
WN(end),
>> +                                 add_ext_regions, ext_regions);
>> +    if ( res )
>> +        ext_regions->nr_banks =3D 0;
>> +    else if ( !ext_regions->nr_banks )
>> +        res =3D -ENOENT;
>> +
>> + out:
>> +    rangeset_destroy(guest_holes);
>> +
>> +    return res;
>> +}
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> --
>> 2.34.1
>>=20
>=20
> ~Michal
>=20

Cheers,
Luca=

