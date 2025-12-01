Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB5C98092
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 16:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175806.1500422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5kz-0003sS-57; Mon, 01 Dec 2025 15:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175806.1500422; Mon, 01 Dec 2025 15:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5kz-0003qb-2S; Mon, 01 Dec 2025 15:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1175806;
 Mon, 01 Dec 2025 15:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSEW=6H=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQ5kx-0003qQ-Gz
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 15:24:03 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf823066-cec9-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 16:23:55 +0100 (CET)
Received: from CH0PR13CA0038.namprd13.prod.outlook.com (2603:10b6:610:b2::13)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:23:46 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::a8) by CH0PR13CA0038.outlook.office365.com
 (2603:10b6:610:b2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 15:23:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 15:23:46 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 09:23:45 -0600
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
X-Inumbo-ID: bf823066-cec9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEZ+ah64FZaR7rGv6dUizT8AsMUuIJ81QJBJh+21qhskDnKnbN7nTRRseRKZhkxhKfAvzghNkPSclxSgTtQ/ZgKxasRyskrXZR99+/+ece6mp361+sIJycsGlbbivy5yeNMuQnjb3O+Cqa/DTXBWC0IToRSr3r7KG9MjWX0xRErrvsRE5xkeshtt4nlKCZVPgbiLN4TkVHpki4afB8XjFmqjmS+BTyZGT0tl5s4vkTTcnuJXqAUEZkQ+oqMR00VO3cyWgevcgKZQyLQxvJMFx9Zo3OoY2OEOuDaTa425tJ3qoCNsYDJWqT7NChn9TjgktuIgKO9sUZHwaHw9Ngh4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi5qthMk8m27brwK0/AIX3bayGyenIbZaP/5taARoxI=;
 b=XxFwh3cg7VNz0NW3fchE2IWQKGS+B7ZD5SnU4Kr/5fWarEV+kiDX/Ji8J6JpyGsJ0CJ1Z1VavEdVpexY+MlLunEeUX/FpvrigccODNz11Ijnqpeb/PZIfRPhmc9QiHAi03U+gRY2P7vm9R4g321CBPTxLKmvWkVqSpnD6vVXLdaG4ZA/+xjXMhyfEx8gVsmNtm9xI0Y9LXRRPhO9dxu92wV4K/5TuFJlSuO8PvM8FO2ltZpmocFECKa1RDoB5ZArHLlFhhf5YCgdK7EOQdBWm9CYJHeD0mc5A/+MdBhL+z60UjaGnXTfy7j1pq6g+N/UQGC24+38v3buly7kHNPaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi5qthMk8m27brwK0/AIX3bayGyenIbZaP/5taARoxI=;
 b=msvXvFqi5ATOyyS5iQRucypzRiYQFezNYRbN77M4bkfks1wJFB8ZjRK/26c/FuKpPxfobJN6a6s28okxTJfbkWu6koMJhBm2/Ed+Dke19eJ+dc2QiIJ/9aoa1fu05d9E5camg2DwDa8Yfds2E9g6N8HVqv6nojoH8SYeFgbu4iY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Dec 2025 16:23:43 +0100
Message-ID: <DEMZF9XKYNUM.1NZ3NE2U54R8L@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/svm: Make vmcb_struct private to svm/
X-Mailer: aerc 0.20.1
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-2-andrew.cooper3@citrix.com>
In-Reply-To: <20251128201937.1294742-2-andrew.cooper3@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2268c697-ba77-445e-19a5-08de30ed9f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXBLTWNTUG9PeVVyZEhPNTFNMTlYV2tpQzZibWFFK292dVR2Yk8xUCszNHBt?=
 =?utf-8?B?RjRVUGl4WWNGVUJNb3Q2WXhFU1ovdU9vMnNLa0dJN3Y1T0Ixajd2Y3R4dGRC?=
 =?utf-8?B?SDdzWUVKVGUxSy94SkJmZXhpTStTOUV0dkJqWTlhaEJ2QVpLZmNXVGxJRkE3?=
 =?utf-8?B?Z1dtRkxmS0pON3ZwUjBSS3VXcXdCU0xPeE5JUXU3eG1yNExqMkptUjZLZ0Nk?=
 =?utf-8?B?Z203VnV0Q2FQNjc2RitzQk5MbE00ZXVyUzkzaHNtaXVTZXU2NDhLSGtyNktH?=
 =?utf-8?B?L0VVa2p0NFJhQndTV3N6RG9TWDVTaUZiSENsSlk1bFdEL1YwVUpJTU43NXlj?=
 =?utf-8?B?OEY1MWRwdTVnTGdJa01hUmxjWllNNVg2emorN3pybUlSdzcvNkdZckhRTDIr?=
 =?utf-8?B?cE13Kzl1eUIxcVRZWjEzRjd0ODFCSTZDOWZNN2V3MnpOcmRNZ0QrUmtHNEhy?=
 =?utf-8?B?Mnc5c3QzRlBRS2FrRG1kQWVMVllOYnAydllVeU9LYjhJKzR1bEh5OXRMMkNI?=
 =?utf-8?B?LzhQbDViZnZKUUlQZXBYemJGRGd6T08yd2VvTWFHeU1TN3hXZmptQlhwTlNh?=
 =?utf-8?B?MjBNeUJ5bTd3T1cxVXE0YnRRVHpKeG9pemNtMFJJSkRveU1RVlpMbGNNL3Zu?=
 =?utf-8?B?aGYyWTkyYkpzczV5UVBYSUlTSmpwQnptOW83amNlU0UxQjRDc1cvK0pkSm1i?=
 =?utf-8?B?MDFrV0hwcXBLcTFKdjFIYzFCaDF5UUpNbFZnNnRYdGpjQzl4OVZ1NDZOVWpx?=
 =?utf-8?B?ZnNISlh0SGEyajRLd1loTm1HcEd3eFo5ZGlqdXRXZnpBMmIyald2d0VTT0c1?=
 =?utf-8?B?dnBnVG5OeTAzcG91alpIbTZZMWZGbkUrN3d2VWNLdVpHeG40SDBMYm4ydTEv?=
 =?utf-8?B?Z2hsZmVDdEczYndkUUhYd2lHNXNncHVsbWthUCtvUGNwdFVzNkNQUmU1c0FK?=
 =?utf-8?B?QXRpZUtMSEFaU1ZOVWxOTWQ0dDllblE0QnNQY2t1bFFHUkp0TDUrNTRCdmlq?=
 =?utf-8?B?dEM2dWI1K0E5dGt4QjMyajJCN1hrc01vanJaZXVQYklNRTc3akt3dW4zOTBo?=
 =?utf-8?B?ajJubWJWcWcveC8zTlN1Tm8yUVpRYmI0aUhTWXJWczgxZ1NLSGJZQmU4WXgz?=
 =?utf-8?B?bG1ISTRLRTR3QktqR0tZdVhvUmpabFBuUzRON0lOT0xCUGJ6MHB0c1JHRDc0?=
 =?utf-8?B?cUNQZHZRSEdWMjdDbEE1MHFFdHFmSmxpMWoza2pDcDFNK1Q1VmJEc1ZLRkdV?=
 =?utf-8?B?OWFjWitWZ05rY2JMWDZYclhyWHZmQ3hzV1c3NGVNcVVFQ3V0Qkg2R0lCU0c5?=
 =?utf-8?B?bFBLTFl1eGtyRW02b0E0aXJ6UG0zWEtsc0JvZWtYbkhYYUZXeFFNTklLUTVs?=
 =?utf-8?B?NXNZU2VEODJJWnF1UWcxWEdRUWtidGFVbHpyclBMb1c4a1ExdmpKY3dUUFk2?=
 =?utf-8?B?QVpBTzFEZ1RUUmpVRjBIc2I4RFc1bDY1S0o5Ym1TbFhVa1NFTG1JK0FJeHJB?=
 =?utf-8?B?OWQ0WER6RGRwWG5hVnFmeE9zczZ1TkVUaWlIdWZGMnkxMmdrYXM1blJBWW11?=
 =?utf-8?B?Unp6MXloOGRkSHF4bENlejhqRkZZcWVRVUwwR0NKa3o1RjN4ajRSMDhRaUhQ?=
 =?utf-8?B?VCtVZU1GcHJlV0RnUklPUi9RMTZZTFV4UVhOT1VkVFlHdlJDTXF6OGZXOGt0?=
 =?utf-8?B?Ymk0Wm9leVV6VFJ2NDE5aXNpOGFzUWs2Z2JSMHBKMUtTdG1JaUVlT2hQd2RF?=
 =?utf-8?B?SnhVa0xEZWUxbllsT1A5akc5L3BjdnRpSEtKVlQrR3NMcmY0Qi9hcm11V20v?=
 =?utf-8?B?VEphMUlRV3NWS0dYWFZKb3FDZWlLSGkyd0ZRVFlWT3VzVWZYOFNEZUZvTk9l?=
 =?utf-8?B?NFBZMUtWYUhINHFXUUw2RWpDai8wMHJkTE5mVTJPcEwxMVZ3c0Vpb1ZFTDhD?=
 =?utf-8?B?YVhGVGY0TDBweW9UekZDYmJiWlVWSCt3WGNnL1l5NXpmWU44RUlyYzVQYTV2?=
 =?utf-8?B?dGFySW5jWHN3YVN3aFdyam9rakNOTytPQjNkd25pMmZ2YWVhSlc5R2FhS3Zv?=
 =?utf-8?B?ckc5QXkwTVUrQUNxTDFYeHNWNlJLbTJkR2ptZ3hDN3A2MkN1Qk8zUnI3Y05Z?=
 =?utf-8?Q?2Yh4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:23:46.6070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2268c697-ba77-445e-19a5-08de30ed9f07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488

Hi,

Code motion is correct according to my scripts. A nit though...

On Fri Nov 28, 2025 at 9:19 PM CET, Andrew Cooper wrote:
> The rest of Xen has no buisness knowing this structure, and it is current=
ly
> included via xen/sched.h into most code.  Create a new private svm/vmcb.h=
.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/asid.c             |   1 +
>  xen/arch/x86/hvm/svm/emulate.c          |   1 +
>  xen/arch/x86/hvm/svm/intr.c             |   1 +
>  xen/arch/x86/hvm/svm/nestedsvm.c        |   1 +
>  xen/arch/x86/hvm/svm/svm.c              |   1 +
>  xen/arch/x86/hvm/svm/svmdebug.c         |   2 +
>  xen/arch/x86/hvm/svm/vmcb.c             |   2 +
>  xen/arch/x86/hvm/svm/vmcb.h             | 617 ++++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/svm/vmcb.h | 606 -----------------------
>  9 files changed, 626 insertions(+), 606 deletions(-)
>  create mode 100644 xen/arch/x86/hvm/svm/vmcb.h
>

[snip]

> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> new file mode 100644
> index 000000000000..68012948a9e3
> --- /dev/null
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -0,0 +1,617 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SVM_PRIVATE_VMCB_H
> +#define SVM_PRIVATE_VMCB_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/x86_emulate.h>

Worth commenting here that this exists because the segment selector struct =
lives
as part of the x86 emulator even though it's part of the SVM ABI.

In an ideal world this wouldn't exist. Otherwise everything looks fine.

With or without the nit addressed

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

