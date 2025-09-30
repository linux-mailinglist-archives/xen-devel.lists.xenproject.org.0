Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE247BAC378
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 11:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134132.1472136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WSB-0003yr-SY; Tue, 30 Sep 2025 09:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134132.1472136; Tue, 30 Sep 2025 09:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WSB-0003wT-Pe; Tue, 30 Sep 2025 09:15:23 +0000
Received: by outflank-mailman (input) for mailman id 1134132;
 Tue, 30 Sep 2025 09:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BylR=4J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v3WSB-0003wN-9j
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 09:15:23 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcc1a45d-9ddd-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 11:15:21 +0200 (CEST)
Received: from BYAPR06CA0005.namprd06.prod.outlook.com (2603:10b6:a03:d4::18)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 09:15:15 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::c3) by BYAPR06CA0005.outlook.office365.com
 (2603:10b6:a03:d4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 09:15:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 09:15:14 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 02:15:02 -0700
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
X-Inumbo-ID: fcc1a45d-9ddd-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7nLHrrutVTHLScnZ5tBRTP0qfdDUPnunC/uSX2+bN8xXTMw5poLJHmIiKY8igkbAZBOFnmhZ06lWfcQ53CntgQq+H0sr7w0ITBPCBmPbH8fBIbjuNV+Kh0ZX35cXzasl6W0AdEsgfbZRvPGl3erUmiRAaVQbZZBOXHGm3DAKQ5a+MfRUUlpOrcyjTRefMdju/+lFDNSc+NBeKuKFrj7nlC10OF99VBb5kjKQYkM5D/rXWxk7I+/2YgA+nvksQjOJHLEDjSRRY+M7iNtHJEnSjU6d3h0RVOJyieak1uDuliSF0zFbwREjCKR1LaMFKd5f1oeZ+wvVddvAO1WnJk9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AreZ7zKG8bk3F4BWT7SaaEX5dBp9i0cOavKWQdYOCY=;
 b=Sdc7Frjt2CCr2EMyZv58JifYEjbIJZA4dB1HRqUD0364N4AtyxKCUY2rlrMbjvP7OiMN4R5Z0CjYC4kDFA14KamYWE7rMAtu34J+LG8eJNMQ+Lc6n9HvAM6jylTtAgG+Gnj2B1+fJ1AcBYFxczaGMLCfSyeM/N1BMukdxq9VPkZ3LsIKy5U1szzhoJ8u/OBfpYmzFI7oJyMUeA5OlXfEfYBzbp1uHcZ4yN6l7cmrbna2BC1r02Fbv59lyApX/NY0UgQ7pnBqd8oLVbSqmvelQlkj+xk2wnplL2cX7uBfK4Y0Kh6dEeNbl7wggyv17VD3Q9aPai9Nd8KeN957GCJJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AreZ7zKG8bk3F4BWT7SaaEX5dBp9i0cOavKWQdYOCY=;
 b=pfWXJOz8ci4uWuX5VtQDOeLPjjW9ni7eOOjgv318sj20QVHnHd1T6F1nyZXVSuHHkmER9SpYDL4P4ANxZ63gzUnIpyu+HUtDo5LaxdhAL3UOOBErKEG8Ixh1ZNdC1gnXAT8D0vKSTd8+FBVrDoj0wRjYyn+xwl3AQeYErqfglIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Sep 2025 11:15:01 +0200
Message-ID: <DD60R7HDKJ23.1BYEORZH67NOS@amd.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250929084149.70560-1-roger.pau@citrix.com>
In-Reply-To: <20250929084149.70560-1-roger.pau@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 21724ccc-0a37-4c5c-9b28-08de0001dd9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|30052699003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ri9idThCdGNsaFZodDdidFpKZ1ZnQkYzeFJQaHgwRGFTeGphYWZCRUFpM2RW?=
 =?utf-8?B?REhVRjFxWVJNNU1TRVg1VmZ1MUpnOTVlaVFYdlM2VWdaTUtkVkc1N3hUVW9q?=
 =?utf-8?B?dWJTbjVGRWxPVWthKyt5aHc2RHhMT2JaT1RIaGJXK0lMUmVyNXFDQStRMlYw?=
 =?utf-8?B?bi9tckNOdkc3QXo2MWhSRWx6SU9hMHZueS96eklDU0hjUnFJMXIzekt5NTJ4?=
 =?utf-8?B?MUp6Ni9IM2JQNkJMK2pMMWZFTFRmSXNKeG9FN1doTFBYSmJTOWhrMHNHTjg2?=
 =?utf-8?B?Zm1GSG1uQXcwbE5QTXVUY2Y1UVBNWEU5UVUrL0c3UDNIazFMRVJRekRabGFG?=
 =?utf-8?B?T2p3Y1ROYmlJbmMxTjdLdE92RGs5cExaNC94am1vSFNtSm9tQ1hYNm1hRktr?=
 =?utf-8?B?dFk2c1VVUUtDTFRidDlXMjdtbVRFL2ZVTndkYXZUOVN4MTN0TlozOXdGMTJw?=
 =?utf-8?B?YUUyTGRlVlRuSWViOFE3bStST0tDK1Q4TmsvZWFJaUxnU2JQSEk1N09EZHBT?=
 =?utf-8?B?SGFJOE9taFhRK20yMk5KQ0ZLQ3AxTXFrS2p1VE43dTRMMWpuMzVzNG5mUXFn?=
 =?utf-8?B?OG4rdlhLeVFidzlqTEhIWloxNVZzTGpOVHdhTDdqNGk4YXpYZlpFOHlBZkRR?=
 =?utf-8?B?MzFSM0RMYUpwbThsdWdabFU0aXUzSUZnZk95WHRMSUtkYWt6bHZCcm01WTlj?=
 =?utf-8?B?STlFMzNDYUp2Y2orY2ZWeERseXBVUkRVeWNoMTFKdzM0YXBQaVBGT2pjVTU0?=
 =?utf-8?B?clBXczJ5YXBZUVZVVXVVSmYwdHB4bjhVdnl1ek8xUTJkNW9JTkp2TTR2N3dr?=
 =?utf-8?B?RFRMK3I2ZHJjMXhZK1lqM1hvN2xQbFptTFY5RVVkb0Z3U1lTUFpZSTZlMGFq?=
 =?utf-8?B?cFozbFpTeEdDaTNWSEFMYkUyeGJpN0VKNmMxc1VFU2xLUEJrdVpkSFI3L0Mx?=
 =?utf-8?B?bXN3emFJMWp3alVPK2hkN1crMVJROVJVcUdtc2tmekFsOW55dzVoNDZxOFJp?=
 =?utf-8?B?K09ITW0zWFcyMStzZDZqRWdkU2hBei80bFFBWnlzNXJJQWNjR0cySG9sL2Fs?=
 =?utf-8?B?T29EYjJsVThhVjhrZ1BtU083YUExRlNaenFsb28rcENkOXBQNG5ybEUwWWhw?=
 =?utf-8?B?QTZ5eHd1OTh0bVN4K2NHMDcyc2Fna3J6eU9TWm4wYk5Ud2ZGUXdoczlZQ09Z?=
 =?utf-8?B?QysrdHVYZDkvOWR0OGJtMmtDU3NKRGNYa0RBTEltWlZWTzQxUmY3RTlZb3Bo?=
 =?utf-8?B?bnFId0RKMGwzR3lrZUtTZStNc20vOGxxVUJmTXFKcmNyekJKQUhpV3JtdUJy?=
 =?utf-8?B?d1hxcFBoOU5lMGtxUmE1RDJRbE82Qkd4YVI1THNMeU9WMjZKMjM4L1ZtWnAx?=
 =?utf-8?B?MlJjT1pnOXV4NXdVczhVMUh3TGZQOUx5a1grVjQ0RUxjYUkzbXpMNG5UMkhG?=
 =?utf-8?B?eEFtOTNaMHQrS2k2TnVDT3BpMjZ6dzBpRzRjb3o3S3htdUx0bWpocWdXaW4v?=
 =?utf-8?B?SXQ0T3NCcTcrWUR4eUl0cnBLc2gvM2tnemtXNStBNnErck5NWVJTd1g2bTJQ?=
 =?utf-8?B?MlJMVGVPYWFyWTBLZnpSMmZMZXEzTUlVaHE5ajlCdDVsd3NKbVo2RXhTNXlu?=
 =?utf-8?B?ZC95YS9IalR1SlJ1S2FjbldXd053VXdhc1V3WEljNWk4WGt3UGttc0pMWnFs?=
 =?utf-8?B?dHRHV3ZnOUpmdjIyWkQ3TENZMkJ4elJWNHNkNVlWUXVINVlmbk5Wb01uZk1q?=
 =?utf-8?B?WUJuL3N3VWhTcHZWV3dlNXhLOHNDL3ZZVTNGc2p2R3JWa3hjN0diUUVJUm9k?=
 =?utf-8?B?UjlqMDlvRHkxZkdockNQNHNIdlJTaXhlZXR2SVpBMTRuWVFuQTF5bUtDWFpl?=
 =?utf-8?B?SlBtYlFMSEdubS9oUEU4ODRxRHNJa1dwYkpSM1E3aHRxTmkvLzZ1ZHFaNnBO?=
 =?utf-8?B?S0xLSFRCdDRzZFNJaExWU0hXelNMS2dkS0lWNmZibTk4c2N2dStMWVM4dnFT?=
 =?utf-8?B?dzcySmw0YWlHTkR0V3BoTVJOUUMzRnhKWGo4d1IxREtiL1IwbXdCLytWYWpS?=
 =?utf-8?B?SjUxOFY2YXNCK09NUm5ITjlFbWV1NkFmMG9BV0ZlQ0IvV0dwNEo2VElFQXhw?=
 =?utf-8?Q?GyKE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(30052699003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 09:15:14.4771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21724ccc-0a37-4c5c-9b28-08de0001dd9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547

On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
> I've had the luck to come across a PCI card that exposes a MSI-X capabili=
ty
> where the BIR of the vector and PBA tables points at a BAR that has 0 siz=
e.
>
> This doesn't play nice with the code in vpci_make_msix_hole(), as it woul=
d
> still use the address of such empty BAR (0) and attempt to crave a hole i=
n
> the p2m.  This leads to errors like the one below being reported by Xen:
>
> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers=
 MSIX MMIO area
>
> And the device left unable to enable memory decoding due to the failure
> reported by vpci_make_msix_hole().
>
> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> tables are usable.  This requires checking that the BIR points to a
> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> target BAR.
>
> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> EPYC 9965 processors.  The broken device is:
>
> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Cont=
roller [AHCI mode] (rev 93)
>
> There are multiple of those integrated controllers in the system, all
> broken in the same way.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> While not strictly a bugfix, I consider this a worthy improvement so that
> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> capabilities.  Hence I think this change should be considered for inclusi=
on
> into 4.21.  There a risk of regressing on hardware that was already worki=
ng
> with PVH, but given enough testing that should be minimal.
> ---
>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 5 deletions(-)
>
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..8458955d5bbb 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      if ( !msix )
>          return -ENOMEM;
> =20
> +    msix->tables[VPCI_MSIX_TABLE] =3D
> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> +    msix->tables[VPCI_MSIX_PBA] =3D
> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> +
> +    /* Check that the provided BAR is valid. */
> +    for ( i =3D 0; i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        const char *name =3D (i =3D=3D VPCI_MSIX_TABLE) ? "vector" : "PB=
A";
> +        const struct vpci_bar *bars =3D pdev->vpci->header.bars;
> +        unsigned int bir =3D msix->tables[i] & PCI_MSIX_BIRMASK;
> +        unsigned int type;
> +        unsigned int offset =3D msix->tables[i] & ~PCI_MSIX_BIRMASK;
> +        unsigned int size =3D
> +            (i =3D=3D VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SI=
ZE
> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8=
), 8);
> +
> +        if ( bir >=3D ARRAY_SIZE(pdev->vpci->header.bars) )
> +        {
> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR=
 %u\n",
> +                   &pdev->sbdf, name, bir);

Would it be worth adding something here such that a device vendor testing t=
heir
hardware under Xen can trivially grep for device bugs?

Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or some su=
ch.

It would also let anyone not very knowledgeable about PCI know that a devic=
e
they own is being unreasonable. Same below in the other XENLOG_ERR messages=
.

> + invalid:
> +            xfree(msix);
> +            return -ENODEV;
> +
> +        }
> +
> +        type =3D bars[bir].type;
> +        if ( type !=3D VPCI_BAR_MEM32 && type !=3D VPCI_BAR_MEM64_LO )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n"=
,
> +                   &pdev->sbdf, name, bir, type);
> +            goto invalid;
> +        }
> +
> +        if ( (uint64_t)offset + size > bars[bir].size )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: MSI-X %s table offset %#x size %#x outside of B=
AR%u size %#lx\n",
> +                   &pdev->sbdf, name, offset, size, bir, bars[bir].size)=
;
> +            goto invalid;
> +        }
> +    }
> +
>      rc =3D vpci_add_register(pdev->vpci, control_read, control_write,
>                             msix_control_reg(msix_offset), 2, msix);
>      if ( rc )
> @@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      msix->max_entries =3D max_entries;
>      msix->pdev =3D pdev;
> =20
> -    msix->tables[VPCI_MSIX_TABLE] =3D
> -        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> -    msix->tables[VPCI_MSIX_PBA] =3D
> -        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> -
>      for ( i =3D 0; i < max_entries; i++)
>      {
>          msix->entries[i].masked =3D true;


