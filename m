Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C0BC0D20
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 11:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138616.1474266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v63hE-0005sg-M5; Tue, 07 Oct 2025 09:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138616.1474266; Tue, 07 Oct 2025 09:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v63hE-0005qc-IP; Tue, 07 Oct 2025 09:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1138616;
 Tue, 07 Oct 2025 09:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVcl=4Q=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v63hC-0005qP-Ue
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 09:09:23 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb3cf94-a35d-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 11:09:21 +0200 (CEST)
Received: from SA0PR11CA0205.namprd11.prod.outlook.com (2603:10b6:806:1bc::30)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:09:15 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:1bc:cafe::37) by SA0PR11CA0205.outlook.office365.com
 (2603:10b6:806:1bc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 09:09:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 09:09:15 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 02:09:13 -0700
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
X-Inumbo-ID: 4eb3cf94-a35d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vleI9z69FQKCXED9kn1KxSjKg1KUVrySUIjW7jzpEX2WqT4iEeUC3iOPPKdUou47fY1ciRBD9PkDm7rbnibVMBES3XMUaNzFAAeOaIyw1PA9qAKfBmStUQjigytnnce6zJOnRGPDknPpp3SH5PzZAZc1tr1cI478Ml/gQJ3l1/YvpNXY4zsNNzrlPVRO/K+YJrJ1OLW40u63/DbX8xJcDXMzkNxEvbhdV5b2/ZgRxtat9ETQgWAvuBMYAckDq4acbpJhluzjXR7n58tnC8m4NGDFn6Ab+uwXyRkBgM1+O0bbu1Q160U8NwUODSUJOvHRhBoIs291fZJZ4Fb74z9DRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y53R7dXIzSmchTXCzCHM+0ZEYQXLf4vm5J5ZVf/Pk0E=;
 b=DnD2q+5vYYwNZ5Madb4HihTKMSoN47sfSLyT5Rnj6jutkgae7ZgHCvKpcyLZAxJHLJHCawmmCLTfqcItdfr0xDKNifK02+WT+CnYf0pbgz43Un6HPiYiS8mss5M1FfxUp8ym3Cq9bxmsrCssf8Ka/w2/8zWvucEQA/v38aCTRpQUbn9+bKSpbrVCNfY0SKmeuj0xdhWseisYe20WPesdBZ93IbpHC68vbcmqjDyOX83Okt1zt0E4Q0JaF+/9cpVtUgmIDD2ydDdm/Tdm5YKOkZow3W5G/+LlnIBD6AAI8VDfbPHWemhjP18Ws1QxsRQX+DsBE4l0P9V9U3mk34N0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y53R7dXIzSmchTXCzCHM+0ZEYQXLf4vm5J5ZVf/Pk0E=;
 b=QUF8M9BQBkvqWZAdWhlV39X2Ei2VW6/YQ+qmhztpbjrp/kmCp5tSJteLZC/ngSjQ824P6dDLAHyTjdLTFJ5RX4ruWtM6oAnat7av4YXMj9a43a+2XmbX4lTAbC10vmwBLJWuhOGPGfCtLosrFsJOu7yoYHGpWnAVKm0TVbIWPMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 7 Oct 2025 11:09:12 +0200
Message-ID: <DDBZ0KEAQ90J.2ZXI8B95H2RV7@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Jan Beulich <jbeulich@suse.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <DD60R7HDKJ23.1BYEORZH67NOS@amd.com> <aNvTwrcHsja65ndP@Mac.lan>
 <DDBAHJDFXN5L.2U4TFNVR6NLZ@amd.com>
 <7bb14669-f8c2-47d5-a3ba-048c0e45458e@citrix.com>
 <aOS-T-LcuFsmdCOs@Mac.lan>
In-Reply-To: <aOS-T-LcuFsmdCOs@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: a600fa0c-08ba-4981-b164-08de05813075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|30052699003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFpEcUt4OTVZN1lHTE5jOEJ4YW13OVhzZ3ZDTGc3VHZkU2hqYkVWcmdZY2lp?=
 =?utf-8?B?bEh6R2szYnYyTkNFeWhNT0hXcXp6QmhnektoMWxKVW15ejBRQURYc1l1Nk1J?=
 =?utf-8?B?b3JDdGltTklFZkxCelZGeno1Y255TlBaSjZQY3pRTEwyTUo3SVdhZ3lQWVh6?=
 =?utf-8?B?OGpxNUN2UTAzWldDZzFQVDR4YzdJQ2cyVUpZR09zTSt0TFpSRXhEQ1ZlejYz?=
 =?utf-8?B?TVREZC9qeFdady9lSWFNM1h4SmM0SU4zMTZWOW1CblhUZVdickdGSkdVWm93?=
 =?utf-8?B?SHlyR2d3K3FnNFdSRjRTTjBBaWxTeWx1cjRWTDRsQmhEUHFtRkhnYmQ0eGVS?=
 =?utf-8?B?NVg3ZTlLTkFaYzJnTERlMVJoSG5CdXUrTmxsdExVSmI1MmpGRHFvMXlneC81?=
 =?utf-8?B?cUY5dEZiR3h6aFFPL2ZSM0xhcU5NejhhUDRyc1JDUzNqMHM5K1labUZJd3Ry?=
 =?utf-8?B?eFpMWkNGZVBYYmEzdW5QRllCSnFTKys0c2xGQkRSa1hTZlg1ZGNrT1paRnRS?=
 =?utf-8?B?UHRTMjJmdW5GNWgyRWRFMU84b2tFRlRtaUhydEZCekVmbElBR2hoRytOQzZC?=
 =?utf-8?B?eldJQmFmRmhhalRaUjZ1MjZ1QWU0anI0eVZBVFN4MTZoVlZCNUpxcFA3ZzJr?=
 =?utf-8?B?S3N3bkpEdElOL1NidlFYdCtublkyQU1ZWHc3MUk4R3RQR2g1Tk1XMGV3Y1RR?=
 =?utf-8?B?UHF2Y3NGMFdTWFpoR1dxSEI3WUljUDNCYVQrTkpmR2RYaTZTWW1heEZnRlpk?=
 =?utf-8?B?VzVORE9UcUJYUlppT2JxS0lMQlRJWnVJRGVBUE5JZURGNzJWMkdNQnVmZUU0?=
 =?utf-8?B?NmRsQWpFQ1I1NGpjQ0ZYZjFTcGJ3OHEwNmV0U1NUNlVLZTVrWWtkS0MzUmRO?=
 =?utf-8?B?ZTZLZEVLQm9rTTRRRm9pSHcyTUZUVzVGL2sxaFhDdlZlZGh5c3BBdjV5cHdo?=
 =?utf-8?B?UU5Damk5N3NLdjREMHRBWjhTOHJJOXc2S1pidmdTbWtQdi9hTTVGajIyejdm?=
 =?utf-8?B?b1ByL3RQUHhmcFVjNm4vaEwzUzV3ZDZsbWFDSWhZZDd5cU1MQmFGZXpsWDVQ?=
 =?utf-8?B?QmpZWTBKaFF4VGNhYjY2VnBSZjJWdHRGbjFsNVJJWEdkNXFYa3FXWTR0SlJ2?=
 =?utf-8?B?NzBtZGNyYjNJNkpweWpUbFkxcG5zN3pEdEVheEpCd3EwU1lxNWNsZUErYUdX?=
 =?utf-8?B?N0E1UDc2OXlrdFNkNm9YRExiZnRUV3E2RjdxVHpldzBTaTZqY2FSUkpBaWNY?=
 =?utf-8?B?ZDdDdkhCNkw2Rm9oSXNXd0VselA0VGp4NUgrMEttZ0Qra21BSnFrRXpjRlh6?=
 =?utf-8?B?RU1OcEFGSFZxYXJmODcyZlRBZUJjbUUwMEZ4eTdtVXRhaVpRV0N2TURsWFdJ?=
 =?utf-8?B?eTlPYVB1K1lmZE9xWFBVWEhJT1JmbE5Qc3JXVXB1ZGgvOXU3VFkzRmdTbk1L?=
 =?utf-8?B?Znp6S1k3aDBPVDFhcU8vZG9Ldjl5b3ZicXBna082cUlzVmtWQTlPS3o1K0NF?=
 =?utf-8?B?Zk9OUE1xUG13NVpBeVJYSlVreVRKOFF2UWx5TU9mS2EvRTNtOFNuODZCN2Iw?=
 =?utf-8?B?aHVHTWczRjJVMWVHV3luczZKeXVueFMxU0s3SWZveXBZUWYxM0VFRFNGd3lI?=
 =?utf-8?B?MjFzS3hBemZvaTdpM0VaR2lNaytkckV6c1ZtZ25mQnJSQVpGRDZLRWVBYnQr?=
 =?utf-8?B?WWpPWkdtVlVsWjJJY0RKZDVuSmtRbUE0bkloeGVQSWYzMDdtRGdpOUFRNml2?=
 =?utf-8?B?b1hLKzlJbXlacHRrbVIvd1ZjRCt0aklpWDFjUktuTmRDY1FZMjVQWi83Q0JI?=
 =?utf-8?B?YkRRdFdQUHpITkhWSlF2VDA2NFlXOW5wYkhSY1FDYXZRQnhPMGNVZkRWZmdo?=
 =?utf-8?B?clVjRFlyME00VzdxZkh2U2NyemlJUjVHYW1LL29IMnhHSExUdUZNRjJoTjJY?=
 =?utf-8?B?cFhuNTJqT25hQmpPMS8xdkowUkJaM3F2R2QzNk4wQVdnN0Z2a2xnNkh6TWJt?=
 =?utf-8?B?bmNUU2R3VTBmN2NhWHlHekxiUnV2MEhFZlZjQjBzNUUrYXBla0gxMCtQWXBE?=
 =?utf-8?B?dEFvU1BIekI1ZXdFeFcrMi80RFBPemVIWFVha2UzelBoUHU4Y1l1YjlKU0Rn?=
 =?utf-8?Q?vomI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(30052699003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:09:15.4469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a600fa0c-08ba-4981-b164-08de05813075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

On Tue Oct 7, 2025 at 9:16 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 06, 2025 at 03:29:11PM +0100, Andrew Cooper wrote:
>> On 06/10/2025 2:55 pm, Alejandro Vallejo wrote:
>> > On Tue Sep 30, 2025 at 2:57 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> >> On Tue, Sep 30, 2025 at 11:15:01AM +0200, Alejandro Vallejo wrote:
>> >>> On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
>> >>>> I've had the luck to come across a PCI card that exposes a MSI-X ca=
pability
>> >>>> where the BIR of the vector and PBA tables points at a BAR that has=
 0 size.
>> >>>>
>> >>>> This doesn't play nice with the code in vpci_make_msix_hole(), as i=
t would
>> >>>> still use the address of such empty BAR (0) and attempt to crave a =
hole in
>> >>>> the p2m.  This leads to errors like the one below being reported by=
 Xen:
>> >>>>
>> >>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 cl=
obbers MSIX MMIO area
>> >>>>
>> >>>> And the device left unable to enable memory decoding due to the fai=
lure
>> >>>> reported by vpci_make_msix_hole().
>> >>>>
>> >>>> Introduce checking in init_msix() to ensure the BARs containing the=
 MSI-X
>> >>>> tables are usable.  This requires checking that the BIR points to a
>> >>>> non-empty BAR, and the offset and size of the MSI-X tables can fit =
in the
>> >>>> target BAR.
>> >>>>
>> >>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with=
 AMD
>> >>>> EPYC 9965 processors.  The broken device is:
>> >>>>
>> >>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SAT=
A Controller [AHCI mode] (rev 93)
>> >>>>
>> >>>> There are multiple of those integrated controllers in the system, a=
ll
>> >>>> broken in the same way.
>> >>>>
>> >>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> >>>> ---
>> >>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> >>>> Cc: Jan Beulich <jbeulich@suse.com>
>> >>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> >>>>
>> >>>> While not strictly a bugfix, I consider this a worthy improvement s=
o that
>> >>>> PVH dom0 has a chance to boot on hardware that exposes such broken =
MSI-X
>> >>>> capabilities.  Hence I think this change should be considered for i=
nclusion
>> >>>> into 4.21.  There a risk of regressing on hardware that was already=
 working
>> >>>> with PVH, but given enough testing that should be minimal.
>> >>>> ---
>> >>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-=
----
>> >>>>  1 file changed, 45 insertions(+), 5 deletions(-)
>> >>>>
>> >>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> >>>> index 54a5070733aa..8458955d5bbb 100644
>> >>>> --- a/xen/drivers/vpci/msix.c
>> >>>> +++ b/xen/drivers/vpci/msix.c
>> >>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *=
pdev)
>> >>>>      if ( !msix )
>> >>>>          return -ENOMEM;
>> >>>> =20
>> >>>> +    msix->tables[VPCI_MSIX_TABLE] =3D
>> >>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_off=
set));
>> >>>> +    msix->tables[VPCI_MSIX_PBA] =3D
>> >>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offse=
t));
>> >>>> +
>> >>>> +    /* Check that the provided BAR is valid. */
>> >>>> +    for ( i =3D 0; i < ARRAY_SIZE(msix->tables); i++ )
>> >>>> +    {
>> >>>> +        const char *name =3D (i =3D=3D VPCI_MSIX_TABLE) ? "vector"=
 : "PBA";
>> >>>> +        const struct vpci_bar *bars =3D pdev->vpci->header.bars;
>> >>>> +        unsigned int bir =3D msix->tables[i] & PCI_MSIX_BIRMASK;
>> >>>> +        unsigned int type;
>> >>>> +        unsigned int offset =3D msix->tables[i] & ~PCI_MSIX_BIRMAS=
K;
>> >>>> +        unsigned int size =3D
>> >>>> +            (i =3D=3D VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_EN=
TRY_SIZE
>> >>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entr=
ies, 8), 8);
>> >>>> +
>> >>>> +        if ( bir >=3D ARRAY_SIZE(pdev->vpci->header.bars) )
>> >>>> +        {
>> >>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of ran=
ge BIR %u\n",
>> >>>> +                   &pdev->sbdf, name, bir);
>> >>> Would it be worth adding something here such that a device vendor te=
sting their
>> >>> hardware under Xen can trivially grep for device bugs?
>> >>>
>> >>> Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or =
some such.
>> >>>
>> >>> It would also let anyone not very knowledgeable about PCI know that =
a device
>> >>> they own is being unreasonable. Same below in the other XENLOG_ERR m=
essages.
>> >> We could add indeed.  I don't think we haven't done so in the past.
>> >> If we go that route I would suggest that I add a:
>> >>
>> >> #define DEVICE_BUG_PREFIX "[Device bug] "
>> >>
>> >> in lib.h or similar, to make sure we use the same prefix uniformly.
>> >> TBH
>>=20
>> We have several FIRMWARE BUG's in Xen already, and several more that
>> ought to move to this pattern.
>>=20
>> Given that Linux has definitely been booted on this hardware, we should
>> match whichever prefix they use for messages about this.
>
> I don't think Linux prints any message about this, it simply ignores
> the capability.
>
> We have another instance of having to support buggy devices in vPCI:
> when a device places registers in the same 4K page as the MSI-X vector
> or PBA tables.  In that case the offending device was an Intel
> Wireless card.
>
> I'm happy to use "[Device Bug]", will adjust the patch this afternoon.
>

In Linux's printk.h

	/*
	 * FW_BUG
	 * Add this to a message where you are sure the firmware is buggy or behav=
es
	 * really stupid or out of spec. Be aware that the responsible BIOS develo=
per
	 * should be able to fix this issue or at least get a concrete idea of the
	 * problem by reading your message without the need of looking at the kern=
el
	 * code.
	 *
	 * Use it for definite and high priority BIOS bugs.
	 *
	 * FW_WARN
	 * Use it for not that clear (e.g. could the kernel messed up things alrea=
dy?)
	 * and medium priority BIOS bugs.
	 *
	 * FW_INFO
	 * Use this one if you want to tell the user or vendor about something
	 * suspicious, but generally harmless related to the firmware.
	 *
	 * Use it for information or very low priority BIOS bugs.
	 */
	#define FW_BUG		"[Firmware Bug]: "
	#define FW_WARN		"[Firmware Warn]: "
	#define FW_INFO		"[Firmware Info]: "

	/*
	 * HW_ERR
	 * Add this to a message for hardware errors, so that user can report
	 * it to hardware vendor instead of LKML or software vendor.
	 */
	#define HW_ERR		"[Hardware Error]: "

HW_ERR seems wired to MCEs and the like rather than everything covered by
quirks.c in Linux, but using [Hardware Error] might help grep scripts by
matching existing messages in Linux's dmesg.

Otherwise, "[Devive Bug]" works just as well.

Cheers,
Alejandro

