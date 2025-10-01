Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E62BAFF55
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 12:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134769.1472397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3tlw-0001jf-NL; Wed, 01 Oct 2025 10:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134769.1472397; Wed, 01 Oct 2025 10:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3tlw-0001hM-Jn; Wed, 01 Oct 2025 10:09:20 +0000
Received: by outflank-mailman (input) for mailman id 1134769;
 Wed, 01 Oct 2025 10:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zY0S=4K=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v3tlu-0001hB-A1
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 10:09:18 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af8f90a5-9eae-11f0-9d14-b5c5bf9af7f9;
 Wed, 01 Oct 2025 12:09:16 +0200 (CEST)
Received: from BYAPR07CA0087.namprd07.prod.outlook.com (2603:10b6:a03:12b::28)
 by DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 10:09:11 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::2) by BYAPR07CA0087.outlook.office365.com
 (2603:10b6:a03:12b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 10:09:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 10:09:10 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 03:09:09 -0700
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
X-Inumbo-ID: af8f90a5-9eae-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWflHQoR24FK2esoB9j1zOyNh5PO/6H3SjXqpW4bMnIGTWo7v6D9GT33KakObeI1opAO9U3ZNwk87bGUevURZ3n9JLZS90l3e7g1f7nonzZTvw0+HKHmVMwpS68EJGQGnvsu0aOkUWWb25+ZfesBHYFFCnIc8xsf0plX9tXb25IQjYjzLgSzebB0wDU/1Vl3x1Fc4QSRpK2k3pcCavR/dCxNWUoJ66eyTIq20Ri/Mecj1JXUYRntG4lE9cZfWl2jnjruKl6SyAmlmDSeEjIcVKEki+wVenxsj7Sq66Om/HLPm3SpCS5eIl7ygjg5mOa/2n8mMmQ2UGNCaAuFW092bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVeAwhESu7sky54dBkKmIFypERR2RQyJxNZQKPljmKg=;
 b=Q7mm7YdclAXU6lyDdAxi1thW4PUUEyPNCJFLvGi1gi0Xrirk9MI5+MsQ/yMNVCDXKTlj3PJ4WfG3aK9EqKlKv76RoPaWMwdOV560tCZ+W99zv5m9WVVRPVaQa5bXTziMFrDgm05d0u+gL3LqPnXgsKcHYxf3wjQVfMqmtGFD4d1lNcDSBSSznr7GV+4+AvnFDuIh9yVwDy2oFewPrkCDtORcN8A+M9yc8RFY9nGt7NKa2jOUBuEsdmZTgCweLQO0zaesnonbuZCjk9AOol6unUnEQuWK73A3YEyKC+w7sSV2RUry2/sAwzNrCttTlN+sdwYD5QQd7VmtTZ/Neq+Tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVeAwhESu7sky54dBkKmIFypERR2RQyJxNZQKPljmKg=;
 b=nVmn/dj04QBNtullNFhYo9htlatptgXSje75R6it4vqyV+u2p6RLxBn5uFmK6bOg5rhvUGFn9o+nrLmlX7Ntgcy/OA3GotskdQ04oGKQXQpk3aGWBeJt2qOxyH3g9IGRbe5iIDywC/S9kixBMJ2w2ECjd/zp7k0g+4UaCNF6zHo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 1 Oct 2025 12:09:07 +0200
Message-ID: <DD6WJ6AVBQRV.154QDILMV3EW2@amd.com>
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] tools: init-dom0less: Replace err() with more
 informative messages
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251001075149.31545-1-michal.orzel@amd.com>
In-Reply-To: <20251001075149.31545-1-michal.orzel@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 23159db9-4b55-42db-9462-08de00d290dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3Bpck85UFFzQU5RYjVaT1BERVNWQ2MrZjFYMDBEVTRNc0NkTHpaNmpiUTF0?=
 =?utf-8?B?TllxTXhTRFVvK2M3QVU3OUNqZ1pZSlRubzhKMVBOWTd2aXRVQzdPcERSdFNQ?=
 =?utf-8?B?MkhWa1QyM3JDYXc4R2hBcDhqc1FkVjhsYzUzanNXTnM3U2I4ZWFJWGNuaDdW?=
 =?utf-8?B?TUc5UVlONGcyRGtwRkc2WFhYaFdNZmwwbi9DTmt3b3ZCSlZCZ2wvMkFWR1VH?=
 =?utf-8?B?MUVLeS9pdXJJb3g5R01CeENyTVRnK2dDVStmZVd5N3ZBd3pScTI1eGtzL2Ur?=
 =?utf-8?B?d1RQUGFRVnl6QTlxRXQ4RHZmRDQvSG1MU0RiTndFRUN5QUlQeDBIdGQ5cElv?=
 =?utf-8?B?R28rcU8ydlRuOC9mR0tRd2hBZFpuMHZaUG11amNZOHlCeDdoK3gxY0xEbU5C?=
 =?utf-8?B?clFHMjFPYWlsWUlWZjJWVUdON1hSeEUxRHBoVndSZkl3aXVtSzRNYk11TU9O?=
 =?utf-8?B?MzN5RWZkQkMwM2FWWGVFQlBsQWx2bFlJTS9xTmVNM3VySXBsNlRRTFJyTnE4?=
 =?utf-8?B?cDkvbyt0UklpUmc5K0RFRElwYnJiV3dMOHRFSG9sTGNsZkU0Z05zYWIreEsy?=
 =?utf-8?B?eGMzdlMxYlJrQVJGK1JxLzd0UFNyeEUycmlZcnhrWEt6dXhLTFpGSTlhNW1w?=
 =?utf-8?B?NGRQQ3d5cit4UHM4YTV0ajdDbm01Sm5vTUVra2VvdFdneVNaa2ZYU0lQSlVu?=
 =?utf-8?B?aHlZTGZ3QVY0SnVmTFYvaUp4bktYVkxGQlg5VmVWRnU1cmFORlQ4SGVURU05?=
 =?utf-8?B?ZGsrVXRLVlREdkZ6TU9JREZpbTVYQ3ora2E5dk54MFlteS8rc004cFFKSHBt?=
 =?utf-8?B?c092NExGL3R1blBrdVVaNTdwcENVcENUakgzN1ZRN1JrKzRpRW0xMEx3Nkd2?=
 =?utf-8?B?SlhCVzN0aHFoUTRmNUxXZG1GVUFjbXUyLzBWQit2eEN4R0NhS1FRS2RkYTIz?=
 =?utf-8?B?RFBiVUswUTVUQkxQdE80YUVIL09XK2lwT211Z25sczdETDY0TGZQVWR5WTMz?=
 =?utf-8?B?WkRuUDgyVWREdmVyblFUcDNSMmNaOVc0UmpsdHkrdVY5US82VG55c0dBRkdV?=
 =?utf-8?B?SXdvZWxmUDdaYVBIblBzOWx6dDlkclNpNkFzaXFOZllqeGZBVzRHaTU4YnZP?=
 =?utf-8?B?N2JUVnBNSnlLU1F0T1I0aVhDOUxIN3dYTjB6K2t0NSt3ZjkxNjl3dTZhbWY2?=
 =?utf-8?B?L0RWL041YlhvUnI3MkcwZWkzSWVVVVBLNWppQ0sxWWRMVkhBREJoU2VZb1ZG?=
 =?utf-8?B?U0hGUnNEZTFrVDM2VWFvVlp0d1pDYlNlSmdVYkVFTXYzRm9IcVEvVFpLVG1B?=
 =?utf-8?B?Zmx5eGNyQXhCUisxaGFIVkV6eHBpNzBzQi9jSFFscTFubWNXTGZOSVhvQUNQ?=
 =?utf-8?B?djh5My92V0NNV1JGVG1LZDNHbzh2QmRwVE9NdHlXakdkTkVVZTRNM1QwNFVV?=
 =?utf-8?B?b1J3OFM5T2FqcW5KYUtzQlM4elYxOVZUWUxoUk81bFN2NkxPZ093d2V0MmR1?=
 =?utf-8?B?ekRZUkhjRkEwYUc5Q2hsYUlYNVkwSGpDVkQ4ZDJ0VC9mY2FORzJNN0YwS2ZW?=
 =?utf-8?B?cUhna1dYWEtpSWVqRVpKM2RPcHNrdTVYb29BMDVQYStpQ1pmeEJiWFdWRzg4?=
 =?utf-8?B?bWhxbE9uL21BQWJsVlJwTmdMN2VhcEVoaUxIZnAwU0Vsa3BweTVZSDBMV1Yy?=
 =?utf-8?B?S2dSQXo4bVBPU0dwdHJMeEtnMFdOZHJwYTNjRzc0V3lHVTNLNzRTRTVwdjNi?=
 =?utf-8?B?b3BmRU56SHF4MGNYY2dGTUFESDVYYkNjS3pETkp4Y1hOQUd1dFFweW1YUDg5?=
 =?utf-8?B?ZmdKekFvWGhxTHByR3A1UEEyTmhYTjRwUnpYRllvUXBsc3FUVGpxSURCcHV3?=
 =?utf-8?B?QjArcDV1VG9scGhpZ3RIMHB5RjdUaTNVek1OVndxcWpKRWg2TEZ6Tzl6bjMr?=
 =?utf-8?B?M1RnRDhncWxTY0RGZzlWK2FzZlBUNitzVXNTbzFhbXJKdkdYNnIxaGFINzh1?=
 =?utf-8?B?cXRpckxMRkhBMVgyNy9RWkFYejVpZnJlUjJqUHdtamczUExGaHdGaDJCSHov?=
 =?utf-8?B?VFIwd0ZDOXpTcnh2YS9qM1VLWTNOR2Rqalp6cSs5Wlo2bTVhRXd2MnBNMENL?=
 =?utf-8?Q?l+8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 10:09:10.5365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23159db9-4b55-42db-9462-08de00d290dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319

On Wed Oct 1, 2025 at 9:51 AM CEST, Michal Orzel wrote:
> Current use of err() has the following issues:
> - without setting errno, on error it results in printing e.g.:
>  "init-dom0less: writing to xenstore: Success"
>  This is very misleading and difficult to deduct that there was a
>  failure.
> - does not propagate error codes to the caller.
> - skips "init_domain failed" message by exiting early.
>
> Replace err() with more informative messages propagating rc when
> possible.

Sounds good to me. Only suggestion I'd make is to also print relevant argum=
ents
where needed, like...

>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  tools/helpers/init-dom0less.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.=
c
> index a182dce56353..3dd2d74886eb 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -288,24 +288,33 @@ static int init_domain(struct xs_handle *xsh,
> =20
>          rc =3D xc_dom_gnttab_seed(xch, info->domid, true,
>                                  (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> -        if (rc)
> -               err(1, "xc_dom_gnttab_seed");
> +        if (rc) {
> +            printf("Failed to seed gnttab entries\n");

... also printing the domid and the xenstore pfn here. Or...

> +            return rc;
> +        }
>      }
> =20
>      libxl_uuid_generate(&uuid);
>      xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
> =20
>      rc =3D gen_stub_json_config(info->domid, &uuid);
> -    if (rc)
> -        err(1, "gen_stub_json_config");
> +    if (rc) {
> +        printf("Failed to create stub json config\n");

... the domid and uuid here.

Similar suggestions for the other printfs.

> +        return rc;
> +    }
> =20
>      rc =3D create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtch=
n);
> -    if (rc)
> -        err(1, "writing to xenstore");
> +    if (rc) {
> +        printf("Failed to write to xenstore\n");
> +        return rc;
> +    }
> =20
>      rc =3D xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_=
evtchn);
> -    if (!rc)
> -        err(1, "xs_introduce_domain");
> +    if (!rc) {
> +        printf("Failed to introduce a domain\n");
> +        return 1;

nit: Maybe -EBUSY so it's -errno like the others?

> +    }
> +
>      return 0;
>  }
> =20

Cheers,
Alejandro

