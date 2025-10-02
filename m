Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E0BB41E3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135894.1472821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jsq-0003KI-ED; Thu, 02 Oct 2025 14:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135894.1472821; Thu, 02 Oct 2025 14:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jsq-0003Im-AN; Thu, 02 Oct 2025 14:02:12 +0000
Received: by outflank-mailman (input) for mailman id 1135894;
 Thu, 02 Oct 2025 14:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Jsp-0003I8-Np
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:02:11 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6234b922-9f98-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 16:02:08 +0200 (CEST)
Received: from BN9PR03CA0662.namprd03.prod.outlook.com (2603:10b6:408:10e::7)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:02:03 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::fe) by BN9PR03CA0662.outlook.office365.com
 (2603:10b6:408:10e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 14:02:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 2 Oct 2025 14:02:03 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 07:02:01 -0700
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
X-Inumbo-ID: 6234b922-9f98-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9gQ9JSD7tcFHO7Q+J/u7LmztQ95ZqzQ0supcfwNNSa8N+AxeKtzRLGCR+1WHRktGH2LnKMZrVqgg3ITUFUO9xD9MjpDPNac6ASkDZPyQjQ59ON8wyEFl3HC3djfCl9vVYCat8M6XrCJ9+gu+QC3FMxnVM4njvR9ZitR1nnregSClO6bdUmTK26ycuI8xhnPPcRvGEi/V1z9TTnXQj/MRqHv1uEfUzD8jJdtWU9TU6LmEN9OQk8TZuKqtfBnr3kESxtpGDlgfNtDeGE+cWXQrdpYpYcwQ94SqQ6DUYs4/K8ig/g9SEl0Ru0DGldrqhosv6v8f7YQvP87fxT+s7C4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAaKGktffNeK+JSSKbbvBP+NQdcyLCUYzZAW96No8zw=;
 b=AU04U6Lm2jkp2CLA0OWdwVd24t67tm8MESJdSADtm0HR9U4eCyhlzVkJc7dlYwE+GW4QlM55bYxnpj+j5gtVKCDvv/pePEwHLWQ/1W0YFipA6JCOZvka+BEm35+EplFtUjto9KDA3NzXGqmqAPzvPyzh5h2IfTeYrnS2gfLJlrSRq9/v5QcBLGwoI46XgAtoIFczLc/uCkTfawUUvrcAJM9IPvZOUlOOdanXm9pEMixA2i9UVqiLyutbhstrZX/SDNvwCrGDQ/pNrhxvtMb6Eq2uMMw87yIl0Nnz5aru/JDnYn6CiNAmVmErIk67ixkDSp9JD3bTKBbAq7iGAu7Axg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAaKGktffNeK+JSSKbbvBP+NQdcyLCUYzZAW96No8zw=;
 b=DN/X8rWZKSiqF8r8KgH5YYkvwqzrpxF8QXChZActRIHG9qWhmV6P7FfqvOzQ82V2xH/baYODDByyE+5y9dqVhI5bP28EGLHtT9QZmC2ROzLoCOjqhSjUO5VEkSx7pzKVMji+yos8qvhIKtw5ISqJo2NljnrCRLy9V1gyhZQysN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Oct 2025 16:02:00 +0200
Message-ID: <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
X-Mailer: aerc 0.20.1
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
 <aN6APR-CUc9xRjfM@Mac.lan>
In-Reply-To: <aN6APR-CUc9xRjfM@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 176576af-3948-42da-ebed-08de01bc438b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1V2dXpYYjJya2l5TklHcTlDWnpBN2gyb2EwRDFMSUo5TGdnN2xmbGdjekQ2?=
 =?utf-8?B?WGZXNlJRZUwzYUFpL0pSaThXZTVVdmtNNWlFeUpMSHRFRkZqNEZ0VzFyRXFL?=
 =?utf-8?B?VExkakhaTVRqb2NrWjBGWE1YOXh4UU40eWMraFFoYWtWdGUyaEg4Qm44c3JU?=
 =?utf-8?B?dEZqR05YdUR1aUIwdU1rS2dzTXU4dGs1R3FlaENWL3FRdmxkR1RCSmpta0dW?=
 =?utf-8?B?YlFSZ0tmck12T0xLYStGbXk1Q3JNQTU5NVhkWWI0QitLZkVIUmUxUys0ek5j?=
 =?utf-8?B?MWxxaEp5cjIyeDlCbzFDazhrcFV6djJ6dDRWdGRCK3dHejVKemhPbjQwOTBa?=
 =?utf-8?B?Zjl1a05nVW1nK0VWa2hxZnc4aG92YXFrSFFuc0NCZTZqbnBWVS9uQ3ZWcmRw?=
 =?utf-8?B?UmVoZkUvMUZSMEo5MHQxUDdPRUxJWDBNTndwSEVuK1hmTHZML1U5RWNqNjQ2?=
 =?utf-8?B?N29FazI1NmVPYkYxY0R0dWE1MzVmVzhveVhSTGUxVzJjK05BVjVBK1M4K3pU?=
 =?utf-8?B?NnJqVkZ2aUpSeU4zLzVhVDZTVkZkSFRvYkJuWThId2xScW4yN1hTS25rZTg0?=
 =?utf-8?B?bmlwQVViMzl4enk5a2RYMkJ4MnlwRjM2dU9SVlNOOUFsbkE5aCt3UVhrL2h4?=
 =?utf-8?B?dEg3blFlOG00NGVPVlNBanRIMXcrenhEaHFlL0c0M3dNdkZFaWRoM0VybE9D?=
 =?utf-8?B?U1BXZXJYQ2RCZnVTZFhqa1M0bzdDTHN0YjMyK2IxMlNzTFBQeFVPK1h0K1Y1?=
 =?utf-8?B?TzhWYzEzcDBXR205SEdvRkNDaFNwSWN5dkRHNXdTNTZ6UXJHN2JlSGFYZS96?=
 =?utf-8?B?VW00c0U3TSs0K2VCdWtNcDlzTTJpMTBOeGh1enVQekpPTDNTWThibGZ3MXdo?=
 =?utf-8?B?ZCtSS01wbzNRd0J0OUU5aEdiUVQvMHArMmxpQ21YaG5wek80SHVXdExjRnNi?=
 =?utf-8?B?OGFMUkVzSDNRQ2laWStDbnZEVmtJeWdSNFlmTE56Y1M5Q3FkYXFQL04zdTJQ?=
 =?utf-8?B?bXlEelM3NXZpT0RibXVWSEI0Z21sVWFpWERhaFptS2JRRWxDUXJlN29qM1NV?=
 =?utf-8?B?R3A2RkMySGFzd1BNMElrZk40NHFpM05Od1BvZWpEM1JNWmtLUFh5LytBN0Vt?=
 =?utf-8?B?L0JpWTliK204bldtMG1lTUxKTHBVYjViZklHYWNWN1Uzdk5kVitPQm5LMkZI?=
 =?utf-8?B?OGRCeGRxV0VwR0lwcFRBU2YvMlhkc3NXKzVGK1QxbkpEODluQ25Wc29pVDRI?=
 =?utf-8?B?RU9IdFJycGtla2I2bk8vNGVkY0swc3ZnQTlVWGpTRmlNdXlNWnhzbkZMVTVC?=
 =?utf-8?B?Mkhqb0FKT3lJbHRvZzVTd1NvdGJ3UCs4U0FHZ3Z0V2c3NWI4K3BLVXVYSDZp?=
 =?utf-8?B?ZXlZL3FRd3lSYitabVFBNHpkbTVxeWYySDNpUUlXTS9Nb0NuLzdhRHBrNDU5?=
 =?utf-8?B?djI4T0JiS1pFR3NINUtKbHFUdXRxOTR4elNzRnhmb0tjbldSNGdleHNEblNj?=
 =?utf-8?B?ZFlpSDBtRWVzNFZRTExwczdOdkU3aWRjc1FTeTFDcGxkK3VOTjVvdXFZQmxF?=
 =?utf-8?B?NGJCYmZhaHZQNnFEZndPWWsvZkZOUlhjNEoxNXJ1SG9scSsycXY1NG02S2VM?=
 =?utf-8?B?aHRhV01tMm9TMVV2d2MxY2pmU1lGazhDb2FmeWlqODVPWGNjQkRIT2tWVVlk?=
 =?utf-8?B?cG1rMDdUL2lyOEpiSWxKVGNCNkJpUTBxUWU2WnNvQ2ltK2RCRWZXSitLdW5J?=
 =?utf-8?B?RGlveS9uYWxOTTIwaHJacEkyNEREZ0VFY2JlSExlTGd2RkxGVHR3ZDhnNVB5?=
 =?utf-8?B?ZmFLcnpDcVZaVTRidmdIWHhSQ29QTVRPTFc3UnA2b0R2S0Y0ZTc3aDdUQUYx?=
 =?utf-8?B?aDJpY0IzaDRZRkg0T0xmSGovNjlXTDBES001cFJWZmxrV2l4L2FSTWw2ZWl1?=
 =?utf-8?B?SDFPT3ZQbUFjU0dhL25vaGhack5VaGNGc3N5d2JGL2RLZXluejFwV2xDZWc4?=
 =?utf-8?B?dHN2eXRTM2lWU2xYNjhMQVVCb09Nait0d0JyTVN4ckYrTWw2bTdkRFVwSlp6?=
 =?utf-8?Q?sD0vfn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:02:03.1477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 176576af-3948-42da-ebed-08de01bc438b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911

On Thu Oct 2, 2025 at 3:38 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
>> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
>> > Reading from the E9 port if the emergency console is active should ret=
urn
>> > 0xe9 according to the documentation from Bochs:
>> >
>> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
>> >
>> > See `port_e9_hack` section description.
>> >
>> > Fix Xen so it also returns the port address.  OSes can use it to detec=
t
>> > whether the emergency console is available or not.
>> >
>> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractio=
ns.")
>> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>=20
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>=20
>> That's been wrong for rather a long time.=C2=A0 How did you find it?
>
> I came across the documentation above and I didn't remember Xen
> returning any value for reads, which sadly was indeed true.
>
> This was because I had the intention to suggest Alejandro to (also?) use
> the port 0xe9 hack for printing from XTF, which should work for both
> Xen and QEMU.

QEMU doesn't support 0xE9 though?

Cheers,
Alejandro

