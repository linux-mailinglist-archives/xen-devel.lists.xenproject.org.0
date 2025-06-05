Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC19ACF19A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006925.1386182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBNZ-00012W-Hc; Thu, 05 Jun 2025 14:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006925.1386182; Thu, 05 Jun 2025 14:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBNZ-00010S-Eu; Thu, 05 Jun 2025 14:15:37 +0000
Received: by outflank-mailman (input) for mailman id 1006925;
 Thu, 05 Jun 2025 14:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNBNX-00010M-TD
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:15:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2414::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89710c9b-4217-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 16:15:33 +0200 (CEST)
Received: from BLAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:36e::9)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 14:15:26 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::b4) by BLAPR05CA0006.outlook.office365.com
 (2603:10b6:208:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 14:15:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 14:15:26 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 09:15:24 -0500
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
X-Inumbo-ID: 89710c9b-4217-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnKILXxAUXUvly7zGQaxGKzEA6plHLslSkK+fAsSDLZ+zBbP0hVGnfchowUpQQDuqRMrOm024OsRpKtOqLeDO710+rAvPBRN0+yY6Dkh+XkBfbtScROEQs/wQi2B/uH5FiRI+zA3vfT/MsaWTOMX2UdyGHC3bQbqF2q1JkoGx6zHtxXz4utsbt2KfgR+kpTA6XcvMAhk3ZRNupXmZHfl2gkK8T22AJsmFa5r9cBW0MB2AIEJI7be4NUUdQ6wtx2a0ksurHYbCApsS7f/qWk0SfldcgEKAWRsVNGLyNGbAimtZp9potf2M7i35t9IgHAtCUkW79qUu833faqkjubZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHKjQfU4bxhYT26M6l0FU4nyZquQYBgbcOeFFL9KKsQ=;
 b=aAh5DlftbfHFxJQYz8U5+sKD8HURh6i+kRDfZDQCfV1dW72eyzZdk0xpVd4pT5iO8vBLXU0ZaRvi2nDkawi9YW1Xqix7qNt2mOsBGYVtKJXo2J/3Pnc2rNh3ZxB0jXQ3bBB8mtdeN/SSslFBQVSgLvabdndj5eE052CYie6WeV73wmBrYr6bpFaMQBsUZJZt15TO+u0Wp4oNCKd7q9qnnf+RgUhqRmHjy6q49eMnRSVP5fYLzGRzI+4mzlog5jRoPKISErDMQGp2x9JSE/G6tfRKDrcxo/CQ1QeZCNgGnvzYkmIdl9r06hBdXaAx1YFGavfiKR+AZXnMGOH1Va67Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHKjQfU4bxhYT26M6l0FU4nyZquQYBgbcOeFFL9KKsQ=;
 b=U6isFvUSMriRi7J7vhBJ9fI4O4d06no4PypNaWRMdsXC4KDRYKP9tUfeNLKsk7FZ6zI7aZNCAZmUOpDjx4NY/mDuKZYJjsU1ql8itkrI+yzeb+q8q/mH7vTWBAs3YxPB8wivSndVJw2GPerpf723jSHs3oRbsqPP2cYYNxnYVDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 16:15:23 +0200
Message-ID: <DAENVFUK1OBR.BKRNCOBGBQ9Q@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
 <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
 <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
In-Reply-To: <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f00e70-14a7-4d2f-7451-08dda43b6b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0Z0QVVlZExoUVJ1cG1LN3NKRXk2Q1BZQXNsazZuNWk4bDFudnVJTWx3Wlhv?=
 =?utf-8?B?UUUyZDd0MXZRY29rZld2OWFDaFFleGo4eFNmTFVqQXdyQ0pNTlFKNjlNVkVJ?=
 =?utf-8?B?cU91OHBidGE5WHBmbWtQZjdoRURDbTN2UGdnV3NCRGhhbEJ4NTRINXJteCth?=
 =?utf-8?B?VFBSdDVoazhtWUlzV3p1VzUzdHdCQisvaERTS0V5WGYwMFpSRnRTc0Zxa01F?=
 =?utf-8?B?MVVIYTRBNDFvRk1tREtPODBhMXVtZ3VKZlg2ZzRBcGoxWW1iWjFtTVU3UHV0?=
 =?utf-8?B?eGIxVFRBcHF0V082azh3KzZnd3ZRV1poaFl1Qk53UzN1TFdsSWhhUzRTVnR1?=
 =?utf-8?B?d0FUTTRiVGdVR1crZ3ZqMnpqTnE5N0k4NEVkYzFDRGF6S1FWamkwRHRQYzQ5?=
 =?utf-8?B?U25SWE1RN2czdCs3RVlacE1MLzc0QnA5bkNUS1g5VTJvYkNFRFdKR2Vtejg0?=
 =?utf-8?B?aXFXUHhORmUvcUF4bU9uY1lQU1dYa21iMFNGOXdTbW9sY1p1bDVtUk9EK3Nx?=
 =?utf-8?B?eHNQd0lNcitOVnFHOFpzSjJoOFVsSlZyTjM5QUloK29xb3BseGhyMllncU5i?=
 =?utf-8?B?STJVMlN5Sk1ybVdKc3RDYW9SWXJyTFVxSmdJeVYvVkhwK0xVTTNBQWxBOUMx?=
 =?utf-8?B?SWFndXhJRVlNTWVDZjNJcGhqRUhIRmtkdXhZOGtXSkQ4UjY2T0NHeTNubU9W?=
 =?utf-8?B?N1V3N2h2M1RwRURYenBCWGxoa2tPV01OSW5oc0J1VkZkT3RoOEZXbktnczBF?=
 =?utf-8?B?dnhnZVZlYUFZU09ZR2twczdTNk12NmNMdnY4R0NiM3JiM0wwNVZUdW94Wkc3?=
 =?utf-8?B?TlpaMXlEQjBCWEFtZUcrN2VoWWVERnlEMmROS1dyaUFJdStUMkprMXk0ZVJS?=
 =?utf-8?B?RTdMam5IUmJpeWEwRlBscmlXbDNYdTVqanBBdkdBL04yc1dlYmFCb043VnNB?=
 =?utf-8?B?VFJFbnFaTWpDditTWTR6ZWwyV0pudVF0dW1WNkFQOWRoZ2RzTDV4R1pucWpx?=
 =?utf-8?B?aWhINHYrcHFkM3FsV2Jick5oeFFsZGdRVktKZEhmMlJ4bEZUdlZhMlFCUWhi?=
 =?utf-8?B?RXhJc25UTjFoRWVubkN0RFJweUpJZ2h6MlYwMzRCbWNQd2VMQ1BaNDlJRytx?=
 =?utf-8?B?NEU2QlF5aVNsUmcvTEhhMUxlMkl0YmJqKzFTZWd0ZGxmcDEzTUtIdUV1NGR6?=
 =?utf-8?B?NGo5akM2YWxjNmVSUjczWEtZdVpwcjd6YnZXaFJDZ085SzVvSmcrT0FTOFA4?=
 =?utf-8?B?Mmt3OWNrN0dVWWJjZXVOWTVSZUF4NllXYnV1eFQvVnIzSkpGVlFBNHdoa3Zh?=
 =?utf-8?B?NnY1VTUzZUFzSVhRRnVIOTJySDJUak1CSFVqZmRCTE5pQjU4cjNIUWRBMTlD?=
 =?utf-8?B?UVY3MXpuNjJXSlNhSDM0N1NCVnY4VU9hNlh3dmgwalRMZkVINUJtZU5QZHNT?=
 =?utf-8?B?UWpFOFBQSnVORlZVdEtFOVBYdE9jUENhekJ3SUVnZlBjZ2NlSjJhU082aHJR?=
 =?utf-8?B?RCt1N0cvTFRxc0FocjdGWDBFUzhDQ2dGekFLbjBlTmozc0JTVXJUYlZPVlhu?=
 =?utf-8?B?d0xoZUpVZGxyWTVpc2VVYjdQMUxTQlpjNVBZSDdyMWt6OXIyQXQ5OUVGSll6?=
 =?utf-8?B?RldNckRMNW92dWxOSEtBUEUrYit1N1MzUGZSd1ZyQkE0U0hNT0gxUjRYOS8r?=
 =?utf-8?B?YWh5TDFhNEJjYnJ1MkxwS2s2bllCSzJIZDlzOSsvK0hZM2NhZjJIaUhab2pL?=
 =?utf-8?B?SlJqaXlRT3Rqb0xmbk9FUDVTaG9JR2s5aW1hNHZ1L3dZWmFEaVI2UWtyU2VL?=
 =?utf-8?B?MjJWTVJTeGRsQklQTnJTc0VQQVFwSm84OHg4aERJNzZ0U1A1U25nMW5vQW50?=
 =?utf-8?B?SEV5clJtcGkrZmI0Uy90aWp2US9SRXowd3FPdExaWXlnYnB2QytKaFB4VmtV?=
 =?utf-8?B?WDhGV1RnRW45VnFiNWV2SjlkaDlFUjdGNVZmU1RTOXRwZC9aU3c0NENtQy81?=
 =?utf-8?B?ajZVSWxBSGx0WGsrZm8zV3BSZjFWdHNOblRiN05UYTJLMHluazZZb1hjZHlh?=
 =?utf-8?Q?o6/hEz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:15:26.8600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f00e70-14a7-4d2f-7451-08dda43b6b70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191

On Mon Jun 2, 2025 at 4:24 PM CEST, Jan Beulich wrote:
> On 02.06.2025 16:19, Alejandro Vallejo wrote:
>> On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>>> --- a/xen/include/asm-generic/device.h
>>>> +++ b/xen/include/asm-generic/device.h
>>>> @@ -6,9 +6,7 @@
>>>> =20
>>>>  enum device_type
>>>>  {
>>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>>      DEV_DT,
>>>> -#endif
>>>
>>> Why would this enumerator need exposing on a non-DT arch? In fact I wou=
ld have
>>> hoped for ...
>>=20
>> A non-DT arch would not include this. x86 doesn't.
>
> Both here and ...
>
>>>>      DEV_PCI
>>>
>>> ... this to be hidden for arch-es not supporting PCI.
>>>
>>> Similar concerns elsewhere in this change.
>>=20
>> This file is exclusively used by arches supporting DT to abstract away w=
here
>> the device came from. x86 does not use it at all, and while it wouldn't =
be
>> impossible to compile-out DEV_PCI, it would needlessly pollute the codeb=
ase with
>> no measurable gain, because the abstractions still need to stay.
>
> ... here: In "xen/include/asm-generic/device.h" there's nothing at all sa=
ying
> that this file is a DT-only one. Instead there is something in there sayi=
ng
> that it's suitable to use in the entirely "generic" case.
>
> Jan

Try to use it from x86 and observe the build system catch fire. It could be=
 made
to not go on fire, but it implies heavy refactoring in x86 (particularly IO=
MMU
code) for no good reason because there's no devices in a DTB to disambiguat=
e.

How about adding this to the top of the header?

```
 /*
  * This header helps DTB-based architectures abstract away where a particu=
lar
  * device comes from; be it the DTB itself or enumerated on a PCI bus.=20
  */

  [snip]

 #ifndef CONFIG_HAS_DEVICE_TREE
 #error "Header meant to be used exclusively by DTB-base architectures."
 #endif
```

Cheers,
Alejandro

