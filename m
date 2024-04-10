Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494A89EB65
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702932.1098623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS1j-0007df-Oh; Wed, 10 Apr 2024 07:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702932.1098623; Wed, 10 Apr 2024 07:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS1j-0007bD-Lr; Wed, 10 Apr 2024 07:05:47 +0000
Received: by outflank-mailman (input) for mailman id 702932;
 Wed, 10 Apr 2024 07:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh3E=LP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ruS1i-0007Jx-H8
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:05:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06af22f-f708-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:05:45 +0200 (CEST)
Received: from DU2PR04CA0352.eurprd04.prod.outlook.com (2603:10a6:10:2b4::23)
 by PA6PR08MB10393.eurprd08.prod.outlook.com (2603:10a6:102:3cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:05:43 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::99) by DU2PR04CA0352.outlook.office365.com
 (2603:10a6:10:2b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:05:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Wed, 10 Apr 2024 07:05:43 +0000
Received: ("Tessian outbound 5ad6c4395be7:v300");
 Wed, 10 Apr 2024 07:05:43 +0000
Received: from 18e3b3ca2c65.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E25C29E2-D0A2-49C4-B940-271134956D13.1; 
 Wed, 10 Apr 2024 07:05:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18e3b3ca2c65.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 07:05:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB8346.eurprd08.prod.outlook.com (2603:10a6:10:40a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:05:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:05:35 +0000
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
X-Inumbo-ID: c06af22f-f708-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ehHJUmx24aaxZooFRZZ/lgN9nrm0x8MLSMolkpilruYh7FTQ4kbWIWIevoNS5xWbUAU9QdY6pR9Y+STInMWQBGgOfYLvXRu7/lyTPiCm5yexDihTflmzJxqKUra72b06XFC2EzybOWLTUeChePmGwwmdBW2PUq6g5ehhQDyZbLMrv3AfYpzwQ4jaYU2Dgyi9ftcyyMbSuzvlyPrQNygOz4mIsg8SnGenGPuabH3VNiA9SXmIfYMaV6KBzOmPpzHJ1mgpvKdJGtuKKpsaaVEBaphF/U2zf7wMkCP43r0+bNn9AwWDQ48U5d/OXxakeIUbYjYF7IAolFZbq2/fKJwN6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/MwjtnK9qmzlWjtgCd002xcrCUf8czW5AHH3/FHceY=;
 b=iRsGgKrQq6XZ8sJDyUQFEi59O6dLk5ei73Lyg0cWymdtSlzjyHXIgjPzjOh1p4smiFCjHTRuorQ8qq7kZgrloPecjURegjkV3ziCBNl0aDWi7nwI0y/eC6fw7IlnoeMcfum1xUudpZtlxyRCryR5RsrKGWJ94a/fzQU7z1mwUESyBXV3dqHMEm3yUyKfdVPQXbg8PMtcryE8WJ3d2OOWiTvcISkJD4yFPyzi7XUbNlrVxGb+/nT7NAWRf8TT/VrifqdRDHq1+RXprjMUENCW323MmJi1oFjVSghecT2X3ZvvWx6/6ABJPmp9GQ6Ij776XFVlpBL9lKoq5kP7yoGqKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/MwjtnK9qmzlWjtgCd002xcrCUf8czW5AHH3/FHceY=;
 b=6SvFmwWwyKvOf1dz5rsd3XlZWpkzXLPJowvjJDHExM4NJfrlxx2yY/xphnXI7qOUksa4Zz4JaaVUVSmQf05M5f+7zVL9jSrAgHFBv3WMhC9o08gBCIuWVuU5d1Dxm1KbBX30bQ5ZnusIbvLhb/8Hwfl3fBqkHlu/4pPmG5VTGsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20fc27449019e2c4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjO4LVHuEL8YN3knICxtC72utVmX+zH6ma4XYOk8HedA8t7Lnzx2GxI23dt2nc2F9T/Mzg37tZkVqZMESprGi5mD4ckZ/yfBxKd6P7lEcJVYbTN+oATLw51y8iwCBk0Cxn/q2ZEwQEERM3hms/dLQXd9QBLRrVMp5IOCmcgn/Kyu+c2RiKgITdsvQ/a80zzZUzalQEGM4tfLwlGPbVvJWYMi0OiZjKNCUjgyE6iIOHPqj4Al0IFbWQKJsJoWuYGyhp/HMUstQ7wfhUAOraF4YVdedr7fx+Zi11kDEh2XsjqYMvW+xX/AhAlg8HnFY0FOqKxJhydG2tA+sLDIe82LZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/MwjtnK9qmzlWjtgCd002xcrCUf8czW5AHH3/FHceY=;
 b=OK/7WBC+z6SpUHAbxZu/KS/Jm2WNrfsKXtEGykajyMOZZDroExTMXeqiEi5yQeACUctOkhD8kDrcl3una6V9GPd4ILQ9B6DpDcRyMlSyBTsy8N9kEywA+0R8TBRsTcFmKSBgp3Gj9Phy4pwYdRtMBEze8udT87tg8S+8X3L3HjqMmI3k4ipd4Mj6w3A2W1cEcwCql9ZgvSbkwyl0P+H2WkfgF/cjspoIEesHfLUibiIbtQbEfNge2z9qmXFZGkdOyKlpl+qvUwrvvmhPoJ7NeYAImeFFOTHreZw2fuR50M0CA/QXjtr/58zK/OCJSe6GdtKdbRXSQsvkpBiC9JCK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/MwjtnK9qmzlWjtgCd002xcrCUf8czW5AHH3/FHceY=;
 b=6SvFmwWwyKvOf1dz5rsd3XlZWpkzXLPJowvjJDHExM4NJfrlxx2yY/xphnXI7qOUksa4Zz4JaaVUVSmQf05M5f+7zVL9jSrAgHFBv3WMhC9o08gBCIuWVuU5d1Dxm1KbBX30bQ5ZnusIbvLhb/8Hwfl3fBqkHlu/4pPmG5VTGsk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 2/5] xen/arm: ffa: use ACCESS_ONCE()
Thread-Topic: [XEN PATCH v1 2/5] xen/arm: ffa: use ACCESS_ONCE()
Thread-Index: AQHaipO90m+vC5zVBEutoTp706SovLFhFcSA
Date: Wed, 10 Apr 2024 07:05:35 +0000
Message-ID: <26F7F71B-C0C2-4844-81C6-3FF27F2C3854@arm.com>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-3-jens.wiklander@linaro.org>
In-Reply-To: <20240409153630.2026584-3-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB8346:EE_|DU2PEPF0001E9C2:EE_|PA6PR08MB10393:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c64TRGdL8MZrEZlN+Lqqf8UEEcr5HwWni9qIkzEoo4Nuf8+o3R/hYwVjISRmH5VjoGFfbwuA7mMb9/GrSe8IkwjEcF4nwHyBSEZDUM4v52J890MOMa2AE8ZsBVR/eMyOHvPuRdyilUxtCBfkTpsif+Nm3+tTb9XzE9pMxf6aXZQTGL8fgUwz1hMX2gFBYxf0WKaKkC4B/GzptQsx1/PaSDoEUYHRxgoJA+xc4U1IgFrwIaKfyqSmFYK0XsJIBHv4hWVNqa/dhKPC6iOBbdVQahPW2saWTnpkH3D7xJ8R17FQPqou8EDQJtnaEapbwPdVxG0BTosErspFahaNL2x35asCHoRR3zgMMoJIZ1KJYmpi3uPPCK4RM8BPkJUuwAJRlWOHnfeP5j1kRNRzPLI2ygnlKW21Ks1f1dbyk+j2hlExsssXwFL2KOrw40cF5vZuVIKr6jSVG3lIa/vmei7KKAbexDpphNf5upB96AwkXRw+zsKsekgNRv5zmVpd0j9/j1pMFmqaTwsgAv07daKDUg1b4BHmdRBFi+OIIkxJNQPdcS09H1T4lvXl7cx66dy4S20Q93H11eZZ3p9FSLSs/SgHSaQRR1mL1kEabALbRGPLQZOxDGcLgL1GVSzUApoIIgC0TQW6wZPqx7HKW1zt9RE+nXvO2O1ttt8RUnI5FII=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7CD5C1B6F0CB64294B5A25BC6DCA6D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8346
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9856ffc4-4cff-4524-9cda-08dc592ca348
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3S1zVmr6XOje5KPmvXGgPxMrr3FkQstgcwrTZV0kkMwhkGvMc0ZrovGee19QDg882+vUeBgX1d4WmE9AYluZyGCTPF+k6i3UrmZtir/nnSRAE7jz9kY/y46r+gmBxmMbfEUdIDNNBQS56UmfJhA6IDUYJ0zwQB0WqX/r48AKZPFsM9gYPUugNPLzCuj5tQvH8y+pzny3yM6gHFlnzjf1+0jrQMetZeepnUcmcRcoTzXEwXFw1QULZ4yDdBc1IcaD9v9pi7Ug5A7a0NFGyGvh7XjTNrGihtxod5fZBUV5pDR5+leM+brlMV/vsfzpX9SNfqfwXSJs2nLGRjFz7E5WPnag3C5N4KoGl60xOpluJGu4Pk4JcVuQwNjK6JrVprvVd5QqS9S94rw9LTJX3YarUt1zRKpJ1ocVk2vqnTdZzJwlXGq0DPQlaAzcfFZq1HEjtOfDa7bkNsTw0LanUXbDPc6qrONTOja3LZxIE4d1jvW8B8cp0Fkxw7jYjpwuDLqosekuCFlS3hiY1fJ23Ll1wgwut4c1JGOvI9x3x9WKnQ/HdBAQUaMm7vgr52KKoH52oZURyfdn//t9xYlwPQdZ6zpCTlZteHJytc9HMLZvy1P5Sj5yX6cipPG5KRMaYDVhIEYLdWm5PmERDLqN/Ur1gR0ERpaQQWR7HSJToaj04/jofKUhNtHxWZFjvePVuohpKDsA+Mjzj7pl8hIddGlyB6e8sar5f1r7MmwV7e2C+HA2DsT5WrQeZENO22Q3scFa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:05:43.2489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9856ffc4-4cff-4524-9cda-08dc592ca348
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10393

Hi Jens,

> On 9 Apr 2024, at 17:36, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Replace read_atomic() with ACCESS_ONCE() to match the intended use, that
> is, to prevent the compiler from (via optimization) reading shared
> memory more than once.

This definitely makes sense.

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa_shm.c | 15 ++++++++-------
> 1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index eed9ad2d2986..75a5b66aeb4c 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -7,6 +7,7 @@
> #include <xen/sizes.h>
> #include <xen/types.h>
> #include <xen/mm.h>
> +#include <xen/lib.h>
> #include <xen/list.h>
> #include <xen/spinlock.h>
>=20
> @@ -171,8 +172,8 @@ static int get_shm_pages(struct domain *d, struct ffa=
_shm_mem *shm,
>=20
>     for ( n =3D 0; n < range_count; n++ )
>     {
> -        page_count =3D read_atomic(&range[n].page_count);
> -        addr =3D read_atomic(&range[n].address);
> +        page_count =3D ACCESS_ONCE(range[n].page_count);
> +        addr =3D ACCESS_ONCE(range[n].address);
>         for ( m =3D 0; m < page_count; m++ )
>         {
>             if ( pg_idx >=3D shm->page_count )
> @@ -527,13 +528,13 @@ void ffa_handle_mem_share(struct cpu_user_regs *reg=
s)
>         goto out_unlock;
>=20
>     mem_access =3D ctx->tx + trans.mem_access_offs;
> -    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
> +    if ( ACCESS_ONCE(mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW )
>     {
>         ret =3D FFA_RET_NOT_SUPPORTED;
>         goto out_unlock;
>     }
>=20
> -    region_offs =3D read_atomic(&mem_access->region_offs);
> +    region_offs =3D ACCESS_ONCE(mem_access->region_offs);
>     if ( sizeof(*region_descr) + region_offs > frag_len )
>     {
>         ret =3D FFA_RET_NOT_SUPPORTED;
> @@ -541,8 +542,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>     }
>=20
>     region_descr =3D ctx->tx + region_offs;
> -    range_count =3D read_atomic(&region_descr->address_range_count);
> -    page_count =3D read_atomic(&region_descr->total_page_count);
> +    range_count =3D ACCESS_ONCE(region_descr->address_range_count);
> +    page_count =3D ACCESS_ONCE(region_descr->total_page_count);
>=20
>     if ( !page_count )
>     {
> @@ -557,7 +558,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>         goto out_unlock;
>     }
>     shm->sender_id =3D trans.sender_id;
> -    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> +    shm->ep_id =3D ACCESS_ONCE(mem_access->access_perm.endpoint_id);
>=20
>     /*
>      * Check that the Composite memory region descriptor fits.
> --=20
> 2.34.1
>=20


