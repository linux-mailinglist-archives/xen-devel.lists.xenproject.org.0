Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F4AF6F79
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 11:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031912.1405650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGhA-0007HH-Jr; Thu, 03 Jul 2025 09:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031912.1405650; Thu, 03 Jul 2025 09:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGhA-0007Fp-Gd; Thu, 03 Jul 2025 09:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1031912;
 Thu, 03 Jul 2025 09:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTCS=ZQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uXGh8-0007Fj-MH
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 09:57:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fb7451a-57f4-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 11:57:28 +0200 (CEST)
Received: from MW4PR03CA0042.namprd03.prod.outlook.com (2603:10b6:303:8e::17)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 09:57:23 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::7b) by MW4PR03CA0042.outlook.office365.com
 (2603:10b6:303:8e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 09:57:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 09:57:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 04:57:20 -0500
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
X-Inumbo-ID: 1fb7451a-57f4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzX6QSTOKhirUhjzA8PLSScstujrzZkPhQvb74Q420qwL8MtTz/bOdmCzYRog68yIANtXaYZFM1YAGbAJjScL16rd6Nv46zGNnlqfta5AsjQRqwVynYMiS5RyTAXz08UXCKVyL/EYlajuVwWaS1pKviW0vLAw8x/nC/5bn4lfTsplkYiR6IPl6MaAUQrtz+S/6nTYFeS87o2GAtvVB87ql80uavIhBBKIpcJ5tpRAu7HEmiYPzYLq5butT7tu0cxxFQpLJ/UOBMXSywh/x6WS7pVcWJ7Up2wYzwP0Qq2tH80834BPn0au8ixaBwt+XM9jdArsp4hYn9D1mRVnbAIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeFoMnOy8oVOAb2Mm/3vI66cwtfVRDa9P4HllKKHufQ=;
 b=nbuIqAflhf8mLXai2DDLIhyuyFVjPOHeVhgNw5mxczi5dp9ZYpmLpUtHoRL3HhrlCvhvMWvLcYKLHZVQwFww7zcmPFFuvvTx1f73vBsJSaSDXbKmiuY+MEA994vWiaX1/D0eVAZ2qxKC+32kprogeo8XYWuKsadO4DJvSL3n9usc0lP//Y5z5PjXD1801SFQKY7ql0QewzLVYFoxky3CEKJ3gB8iWPsstMcUUSBJjjt914rsER8n1ShImyGGVeJbHNPzqy+Kvl56MrW4L4HxWRMK2vGbBJ0TsFrpKMI9uApjP3LOGSWIVbUoQOkFCRKSyfbeqMBZ4PQpJnPR2qhc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeFoMnOy8oVOAb2Mm/3vI66cwtfVRDa9P4HllKKHufQ=;
 b=P1bkzj7n9L8zpk/PmxmY3wU+NXjud/2xBlfF2G2ESCaCjs8CdgY5sGuU/kpTFW1zeg61y7w5glPJMkkxfbKICEHQdRNIu8sV1R2AVp8Y7Sb98Oy1N7aPVVyqLTP+F5Q7uCCMLMcj5vpAL7Fow4tbnvjgnSRQErtQ9q9dwphF4fw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 3 Jul 2025 11:57:19 +0200
Message-ID: <DB2BX4539JEN.3EBOW5J8FDKQ5@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 02/10] xen: Refactor kernel_info to have a header
 like boot_domain
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-3-agarciav@amd.com>
 <3128c4ae-7146-4480-b7b3-e17f253e3870@suse.com>
 <DB1P3E6TW6WS.CPYEJLOZTFO6@amd.com>
 <d9601a06-4118-4c1a-9784-51fe514d0697@suse.com>
In-Reply-To: <d9601a06-4118-4c1a-9784-51fe514d0697@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: b7137909-a7c1-48cb-8376-08ddba180233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVQ1MG9reXJsblR0NWZiNG1LZnNUazNqeEpEZmc5b2NTRmY1ZTlweE50OTVa?=
 =?utf-8?B?dHFOSlFpNG1Vdk1mOEl0UjF4ckx1UnJBcUhtbnVkWDMyaFNEQXZ3Rm5welc4?=
 =?utf-8?B?SnVoVEQzTHJnaTNOdHBoaDdEZnViQThENklOV3RvVjBpWHNTQUdjUlV4UURz?=
 =?utf-8?B?aTI4bWNJMnhJVjZXQ1pBOGRiRG9xQmRNYVFNTGlXQTBTVDdMRE93V3JsTTYz?=
 =?utf-8?B?V3IxemY4MUFWbmpqY0xLc3RsTnpMcC84MDBFWFQ0V2dYTXo4MHBGcTJOcmJ3?=
 =?utf-8?B?YXUxYzhCMDRiU2I4aE9xRVp0ODM1NGZkeDkvTFRCTGhaWGhuTnEvb2oxZnRi?=
 =?utf-8?B?Y2FFZnlaWjNhNjIvd29DRWJtaTUvMTZoUHBoNk1OVEtJd2NFUkZtR3Y1QytT?=
 =?utf-8?B?amY5d1oxTlA1cHlTa2tINWpZWnJKUDc5YkxWMEJJVGIva1RGUCtjVWhyOUIr?=
 =?utf-8?B?MjlGeDV5RjN4K1duTkNuWFdqMTIrMEQ3NWF2RnJMUlZTWlUwL1M2SHZyR3Jj?=
 =?utf-8?B?ck45M1l3aWwyWHgzYXUxWlUraU9LVUIxQWxFdGU2aFZHdS9qT2haUEtudVFI?=
 =?utf-8?B?OWpJelNmdHBYbzJoVC9QS2dpVjFWeXRuem4ranFwOWtOVGFzeTZ4STczejgx?=
 =?utf-8?B?TE56QTZrdlRrRGNCMkw0TUhlUXZFTnZvTEpHZ3JPb0dIVk9ScXlNY2dBdEEw?=
 =?utf-8?B?YUZadDZYb3BPWE0vUjdEOStKRXN0WjFON1pyY0NSMHZMWmRrS0trbjZ3a2hl?=
 =?utf-8?B?NjZDZEthUkhlUGplS1crUEJaUHRlMEw4dGp5OVFpVjdTczRYVzRGYXcyKzFn?=
 =?utf-8?B?WlRCbk5KRktqMFk0V3laanJob3VIQkVPcHo5L3djdnJ2RWl0ZmFySHpjN2o0?=
 =?utf-8?B?UXhTVFVDOGU3VXRjUERjVHRFVVFkTXFpNkJUTG1saVd1cDJnTUZvUXd2d3NO?=
 =?utf-8?B?VVdvL2JyWmRicXgvczlBZGo0aWh6TkQvd3FWWk1MVEZPVXJIRkx2ekZpT1Zo?=
 =?utf-8?B?QitlRWFsYUdic056YXJNb2QzSUlZcWh0OWhRaThFZEtQMmVIVkZWemtoVGZI?=
 =?utf-8?B?V0VlY29LVnlDUFJxbndZNmdPYktnQ3BHaEN1RE5mRHI2Y3FqWWRkVTZQSkZK?=
 =?utf-8?B?S2JnYmk5QXZjZmRHcmdJc1VBMUNhY2NMMXUwN3dlQ0tNazlZVGpxSEhhRmJq?=
 =?utf-8?B?ODExK2tVaUoycGpFTFBZZ0xpcmZ2MWlsR3RtaHZSSnBrTytjNVNZMGVJcUpY?=
 =?utf-8?B?cmRMc1MrNkNmRUpKWlIraGZTcXFwbklHWk1nMmo5V2hhcUxheUlzN1dIZ1R0?=
 =?utf-8?B?YjBjaU1CYzBkS0R1b2R2RTdHTkJNWXpuZEtZckZhMDUyQ2ZRUWNxeHV3bG84?=
 =?utf-8?B?TmQxVGFZK25iQ2xVMUNLSmhkamptQkRHT0hSUkJIZmQ4TWRJZUhKZ0ZTV3R6?=
 =?utf-8?B?VFFKMjA5Wmp1bUFKakF1QW52RkltWG1ycWpJWnZPN0I2QWZRd2FjcVRER1hP?=
 =?utf-8?B?dnVCRTdsRDEyT1hLdWpYajJobUdEUEc5dU1QQVNUODZFVVcySFBhQVJzMmFi?=
 =?utf-8?B?eXJsTThBVGRDTjlxaWI0NFhjTWwzVS9KK3RkUnQrY21FTjh6V25ocDh4ZmNJ?=
 =?utf-8?B?K0NJMHFnMHBXajVIVEVvbWRPWUNNb3c3NVhIS014c1hXOHRhdVp1VjhtRUxY?=
 =?utf-8?B?djBJVWFZcFFjOXBOeUM4S25wbFJ3cnRVZUJweG9scWM3Rkt2MGorWDZiRmRs?=
 =?utf-8?B?MkNpMWFaMGhoeVpmL2E1UXcwVmhpOWFXTHVoYUVSUVRMQjF3YzdoT2JacVJu?=
 =?utf-8?B?bS93ajdsUUJkQ21ydGZXdC96Mi9LU3VhRVJqOXpjMTZVTys3dVBMQzhYalVK?=
 =?utf-8?B?S2Uwb1I3QnNSeVFUOVlYaTc5VEtZQVVNSXVlOE52SDlaczhjUW5DY0x3NFpk?=
 =?utf-8?B?SG9JTXIwQVFGdmw2dm1yTlpHMTNuc3BuMnNKVE1NbHVkcXdOZTZQWURHYmQ1?=
 =?utf-8?B?eDB6SUNPS0kya3Z6ekk4dnRkdG5nWnMrUGQ3YTdSNis3OGM0cWxXZTNicGQ1?=
 =?utf-8?Q?HkqHrD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:57:23.4037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7137909-a7c1-48cb-8376-08ddba180233
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250

On Thu Jul 3, 2025 at 8:01 AM CEST, Jan Beulich wrote:
> On 02.07.2025 18:04, Alejandro Vallejo wrote:
>> On Wed Jul 2, 2025 at 2:56 PM CEST, Jan Beulich wrote:
>>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>>> --- a/xen/include/xen/fdt-kernel.h
>>>> +++ b/xen/include/xen/fdt-kernel.h
>>>> @@ -16,7 +16,7 @@
>>>>  #endif
>>>> =20
>>>>  struct kernel_info {
>>>> -    struct domain *d;
>>>> +    struct boot_domain hdr;
>>>> =20
>>>>      void *fdt; /* flat device tree */
>>>>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>>>> @@ -34,8 +34,7 @@ struct kernel_info {
>>>>      paddr_t gnttab_size;
>>>> =20
>>>>      /* boot blob load addresses */
>>>> -    const struct boot_module *kernel, *initrd, *dtb;
>>>
>>> Where did this "const" go?
>>=20
>> x86 mutates the boot module to set the released flag, the headroom, etc.
>
> Might be nice to mention such an aspect in the description.
>
> Jan

Sure.

Cheers,
Alejandro

