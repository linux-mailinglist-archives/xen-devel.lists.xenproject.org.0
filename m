Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F10BBE3F2
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138229.1473984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lhD-0007Dz-Dv; Mon, 06 Oct 2025 13:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138229.1473984; Mon, 06 Oct 2025 13:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lhD-0007CY-Ar; Mon, 06 Oct 2025 13:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1138229;
 Mon, 06 Oct 2025 13:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5lhC-0007CN-AT
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:56:10 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343cdb88-a2bc-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 15:56:07 +0200 (CEST)
Received: from MW4PR04CA0062.namprd04.prod.outlook.com (2603:10b6:303:6b::7)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 13:55:57 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::9f) by MW4PR04CA0062.outlook.office365.com
 (2603:10b6:303:6b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 13:55:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Mon, 6 Oct 2025 13:55:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 06:55:55 -0700
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
X-Inumbo-ID: 343cdb88-a2bc-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmklaY8xU/sOqilV9XwDCG8M1t5dywBc3N/FcaRpUfADc1hj8pW/9S4o75/Zw8k0Q1m/0gdU6aTrETl5eQrwd4RWMlOCDE6wOsp4dv0sihjMMskyXKvLBmvdYdvlRNxHyir+BbC7wlAcd/Z8QzpFvSkb+wQGC2FZmxMS6H9OeRpjN0SHEI6d0TOrG/TZN3uB62CGmJOqKC/pzy5y1YF1828lrXOi8LV76u2Xctuncq5afkkk65HseMMhx7QAhfTbQgo39AkTVHfFciY9qqySts4Mwayg0ccKbWwgWh5XQ5kkopd8zdMPcT5rTa/IOCyY/nQddcfryylmF8dHN6SVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSpxngmid82N1+Q7DvU9+LBUUBFrnEtHp23hcckNy0I=;
 b=g/mnWpGX4JTMwMgNCMh/ybyDWx01zngXUtUprG/wda8SRvncE9nxlLzTs6IQaexeBjbrswI/qFygNYUqlIlZjxTT5tFPzQd3fBYDJKybq42rvRsbkTmcdaf237Dodv6A9mHsPMClM4MtrxhbAeeoGTG0EinlmbvHffGw3NfxqasI9in3M5Z8Qj3c9P2GfobOWIccdEpI5sWzzWxwg/iesCXI1EQlM4dor6YYYC/9F8nEzOCA2ADl7cmeySE0WJEHxaZeFMqELzcTx0gAn2YkcUOH5798aDA+X/qC/V2tVmW3UMRIVnJPcyd1+4T3TPM8nb5xKmOHuMfEE3ojAq9xdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSpxngmid82N1+Q7DvU9+LBUUBFrnEtHp23hcckNy0I=;
 b=T6u2gCvm9rNrmBLo/yT/ZSU1JWd8+J8Cg5ttoHq4bPWjR7C/7r+3wrl6LwUdbzBgWBh8boOVcGcjTb+912yvUS3Gy2Xy2sgKVLq/be8wmbb10mTXx93KD4zuBBR9RlQqbXNajYk5uCZDZWlU0aaDwsbxKC2t/SNzwrYgHQfB8jA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Oct 2025 15:55:54 +0200
Message-ID: <DDBAHJDFXN5L.2U4TFNVR6NLZ@amd.com>
CC: <xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Jan Beulich <jbeulich@suse.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <DD60R7HDKJ23.1BYEORZH67NOS@amd.com> <aNvTwrcHsja65ndP@Mac.lan>
In-Reply-To: <aNvTwrcHsja65ndP@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb0761f-ee63-43ff-1cf5-08de04e0132f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFBNRXI3ZE1ET0hIRUdOZU1pTkI1NFpMRUlRZVBJVFZheGF2dCsvTGZYdEh6?=
 =?utf-8?B?VTFBWVBRcnAyTGIyUjBNb1ppc0lDVC9GRXdnT2dyRG9LTkw4R3R2eE5GQnYw?=
 =?utf-8?B?WTM3MnhaemJwTmk2blgveGRxMVRwby9OMjFQNldIRFZwM1hsaWdrR2ZwenU0?=
 =?utf-8?B?a1VHMi85VVlQbnlhSFZyUit3VS9yOElsUnZNM1BtQWRkTTAybTVpSTlhK0hL?=
 =?utf-8?B?ZXV5L2RuaWFoYW5lVnhZVnAvTXMzTFJQSjh2V2xpUkUxemE2ZGJSeHpKQnF0?=
 =?utf-8?B?cnF2aG1HMmZia1llTnA2UU5HTmxGSWNFM2xoanJDYmR0TElVN1BxWTRuaWF1?=
 =?utf-8?B?eDZ1ZzBJYlVnK0dqdDVaYk5ZT3B6RVdOZ3B6NmhHaUlhMkthZjZ5dVBQRDJE?=
 =?utf-8?B?K0hUTDE3dnd0WUlVNk14aXNTZERVbmFxRGxLZ2luT013Uk9IelRGV0xFd2sr?=
 =?utf-8?B?dS9lZHM2dWJMLy9qakZYaFdhL0lueDNRN2hPVi9OR2RORTlZbWIvNFg4Skhs?=
 =?utf-8?B?ZnE3TjZQZXV3MnVuKytocjdXL0xRNkgxUm1uOUJqSWZ0NFVra0YzU1JacTdG?=
 =?utf-8?B?cjB4NXlpaVRIMmI2WnRydTN2d1R4M3FaNjkyL3pQSzFSZlJvMGY3cU5sOGpV?=
 =?utf-8?B?SXlhbUR5SllMbUpGUnh6VW9CN3RHSEl0K0JXMjBMM09tbEtubUpZelFJc2xv?=
 =?utf-8?B?VmJwV2RSNGxDZjI0OXhBdlAzQ25Fc1AxV254RWJRcXlxeW1LWUl0ZlRwWlMv?=
 =?utf-8?B?eDVNTGt1cmdqZlJRM3hWQi9FTDZ1eFZyRmx2QllTZDEvOXhvUUlCMGJpN3Nx?=
 =?utf-8?B?NzlEelVMR0Y4QmlmQ1lDVDRqcUJkd1FrUzFRMlZveFJ5MzR0RmR0NjNLQ3BR?=
 =?utf-8?B?eEZYckVLNnAzWWI2bTRkYXhNRlZ1OUE2NDg4TkhMV3Z4ZE1sUHpEQlREU0tQ?=
 =?utf-8?B?NEYzOHl3QTlzMnY0b1hOMUlPL3lkL1dEQ1F0NllFS3NYQkVSdWV3L29ZUHkr?=
 =?utf-8?B?MnJiaDlkZFFxREEva25Nc2ZUTTFEUDZCOUZKNzVLZC9JL01LVkh4OW1hYlNq?=
 =?utf-8?B?dTl4NjNHTHFqM2Z1QmFDWHJjbDJkNlBwNFlTZ212VWx2NWNjc0FWSjg5Ulh5?=
 =?utf-8?B?VUVJRFdWdEhvYnVkN0RSdUZrdS9SOW9JK3pzVERheWM2SkIzOWRPRTlBVVM2?=
 =?utf-8?B?RHBWYjQyM0pHOTh1YTQ4dVFFM0IyNEtNTlJ0QkJsdUN2MENVd01PMjRFeEhq?=
 =?utf-8?B?Smhzd2RqZEY1cHRJUWVpK0R3clljdmF1dE42dHEvT3JpQTk2cFhFYjE4eWxn?=
 =?utf-8?B?RVJDZjlUNk1EOVltbU1UeFhGdnpWbVJZYVJObWpMME5zampCZkZCSk9ndU94?=
 =?utf-8?B?WFphdFNTY0lWRDFWUVJENHJVUE1mMzZQZlBZeW5TOGZuWDRWUEIzUWFyaENs?=
 =?utf-8?B?OER2enRSZHZSVEovRGxrYWFicmFUUVpqdS8rZll2clJrK2FpeW40Q1BLQmJX?=
 =?utf-8?B?SGFUaktZY1NuUTIvSzhTTm9HSkdnM3lRUW43N0lxN2xteDV5WGR0dmtkTGh4?=
 =?utf-8?B?Y2F6elE4UnlHNUpnT3JKR05sUUJENjdKL1ZXQjJxejdNVEljb0hQcTk3TTRL?=
 =?utf-8?B?R01FQmFDamhHQVpJSDJmbFRFNnhwS29KcHl4WjlTSEYzRzBJdW1TNnY1KzU0?=
 =?utf-8?B?Y1FHZzZZLzUxd0Uwd2ZXMUZ5b1VOUlhTeUd0eTdsbUNQbHV0NlJtQVBUWGdn?=
 =?utf-8?B?M3BIcERXZ0p3dXhicUQ3UmRVaGt6b3ZNVUcyaWtWZWk5N0s5Um9JYTMrZUdG?=
 =?utf-8?B?YnpRTGNFNTNrNjM3Q0p6UGRqdEFIMEZjTlVhcllSd0JpZ1NIYTlEdENLM1Y3?=
 =?utf-8?B?TkFsR1d3L0g5cENjSGtpaTl5TGw4VkVjalB6dmlKbjhNWmdWVjdGbW1EZ21u?=
 =?utf-8?B?enUvWThPdlBNMXlnSVo2SEQyT01TNkpUaXJCTzQrMW1xL3hQa0FXU2F1c2Fz?=
 =?utf-8?B?NldHS3F3M2lrYmtYaFRRNEpEamhESzRyZHpDZTBCMFJNMy96MUthTUlaZFZD?=
 =?utf-8?B?aSs4MkRkczlGRklDc3BTU0VqTnVZT3p6c3NNZ2VuOFNDNS9SdDQ4VU83ZzB6?=
 =?utf-8?Q?LMoI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:55:57.2896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb0761f-ee63-43ff-1cf5-08de04e0132f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

On Tue Sep 30, 2025 at 2:57 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 30, 2025 at 11:15:01AM +0200, Alejandro Vallejo wrote:
>> On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
>> > I've had the luck to come across a PCI card that exposes a MSI-X capab=
ility
>> > where the BIR of the vector and PBA tables points at a BAR that has 0 =
size.
>> >
>> > This doesn't play nice with the code in vpci_make_msix_hole(), as it w=
ould
>> > still use the address of such empty BAR (0) and attempt to crave a hol=
e in
>> > the p2m.  This leads to errors like the one below being reported by Xe=
n:
>> >
>> > d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobb=
ers MSIX MMIO area
>> >
>> > And the device left unable to enable memory decoding due to the failur=
e
>> > reported by vpci_make_msix_hole().
>> >
>> > Introduce checking in init_msix() to ensure the BARs containing the MS=
I-X
>> > tables are usable.  This requires checking that the BIR points to a
>> > non-empty BAR, and the offset and size of the MSI-X tables can fit in =
the
>> > target BAR.
>> >
>> > This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AM=
D
>> > EPYC 9965 processors.  The broken device is:
>> >
>> > 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA C=
ontroller [AHCI mode] (rev 93)
>> >
>> > There are multiple of those integrated controllers in the system, all
>> > broken in the same way.
>> >
>> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> > ---
>> > Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> > Cc: Jan Beulich <jbeulich@suse.com>
>> > Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> >
>> > While not strictly a bugfix, I consider this a worthy improvement so t=
hat
>> > PVH dom0 has a chance to boot on hardware that exposes such broken MSI=
-X
>> > capabilities.  Hence I think this change should be considered for incl=
usion
>> > into 4.21.  There a risk of regressing on hardware that was already wo=
rking
>> > with PVH, but given enough testing that should be minimal.
>> > ---
>> >  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++----=
-
>> >  1 file changed, 45 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> > index 54a5070733aa..8458955d5bbb 100644
>> > --- a/xen/drivers/vpci/msix.c
>> > +++ b/xen/drivers/vpci/msix.c
>> > @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pde=
v)
>> >      if ( !msix )
>> >          return -ENOMEM;
>> > =20
>> > +    msix->tables[VPCI_MSIX_TABLE] =3D
>> > +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset=
));
>> > +    msix->tables[VPCI_MSIX_PBA] =3D
>> > +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset))=
;
>> > +
>> > +    /* Check that the provided BAR is valid. */
>> > +    for ( i =3D 0; i < ARRAY_SIZE(msix->tables); i++ )
>> > +    {
>> > +        const char *name =3D (i =3D=3D VPCI_MSIX_TABLE) ? "vector" : =
"PBA";
>> > +        const struct vpci_bar *bars =3D pdev->vpci->header.bars;
>> > +        unsigned int bir =3D msix->tables[i] & PCI_MSIX_BIRMASK;
>> > +        unsigned int type;
>> > +        unsigned int offset =3D msix->tables[i] & ~PCI_MSIX_BIRMASK;
>> > +        unsigned int size =3D
>> > +            (i =3D=3D VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY=
_SIZE
>> > +                                   : ROUNDUP(DIV_ROUND_UP(max_entries=
, 8), 8);
>> > +
>> > +        if ( bir >=3D ARRAY_SIZE(pdev->vpci->header.bars) )
>> > +        {
>> > +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range =
BIR %u\n",
>> > +                   &pdev->sbdf, name, bir);
>>=20
>> Would it be worth adding something here such that a device vendor testin=
g their
>> hardware under Xen can trivially grep for device bugs?
>>=20
>> Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or some=
 such.
>>=20
>> It would also let anyone not very knowledgeable about PCI know that a de=
vice
>> they own is being unreasonable. Same below in the other XENLOG_ERR messa=
ges.
>
> We could add indeed.  I don't think we haven't done so in the past.
> If we go that route I would suggest that I add a:
>
> #define DEVICE_BUG_PREFIX "[Device bug] "
>
> in lib.h or similar, to make sure we use the same prefix uniformly.
> TBH

That works. As would DEV_BUG_PREFIX, XENLOG_DEV_BUG or even just DEV_BUG.

LGTM in any form or shape that makes it patently clear the admin is running
on buggy hardware.

> I think vendors care little about the output of Xen, as long as it boots.

They might care more once they realise they can "grep" lines of interest. T=
hat's
what happened on Linux, after all.

Also, it's not just for vendors. Users and developers alike might be intere=
sted
in using these message as a "taint" to know when they bought known-bad hard=
ware.

Maybe to avoid buying it twice.

>
> The downside of this is that it makes those messages longer, which
> will require more time to print if using a slow UART.

Only the reporting of known bugs. Which isn't a high throughput operation.

Hopefully.

Cheers,
Alejandro

