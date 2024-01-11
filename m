Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719D82AAB1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666073.1036505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrEM-0006t1-3u; Thu, 11 Jan 2024 09:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666073.1036505; Thu, 11 Jan 2024 09:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrEM-0006rw-0z; Thu, 11 Jan 2024 09:20:06 +0000
Received: by outflank-mailman (input) for mailman id 666073;
 Thu, 11 Jan 2024 09:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETxW=IV=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rNrEK-0006W2-1u
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:20:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98217bca-b062-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:20:01 +0100 (CET)
Received: from DS7PR03CA0096.namprd03.prod.outlook.com (2603:10b6:5:3b7::11)
 by SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 09:19:55 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::fc) by DS7PR03CA0096.outlook.office365.com
 (2603:10b6:5:3b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Thu, 11 Jan 2024 09:19:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Thu, 11 Jan 2024 09:19:55 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 11 Jan
 2024 03:19:52 -0600
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
X-Inumbo-ID: 98217bca-b062-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARiSL9WhnjOjUkuFQrCa+Df56Fy0NP0ldt2yHvUl++8Xy11ppTgc6sc4ch/AKHyZ4nI67lpgkBPe2rsR1FHFW9CA4HyQL4ahkhUw86tnMiAok/6aj1Zv9Z0zIdycj9X0oZYh5GQQ89Iu6B6t7RfgIbwA1aw8XkdzTwXvoC5/+9pHPLpeXLiGFsfAuNeGLUCZSYrbEXshJfcGhh7WL0x+UWqtkYnobOoMzd2GTW9iY83kJvathSvxRUnsjHTMuD6/uN6PLFcIT0ZXDRU+8Elox//WvZRH3ppkvWSdq2TWoV+f0Y6eA8u6utZHOWDCYF1bIcC/OcGrrEivo0FG+3Zn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gbuXdVNdRi1YMwNVz1bSAXG/w/y9Z7eYpqQVXaJS1w=;
 b=K4BQ/b5PsHQrQjHIp4IaAaIxjDW6h5nm/eMMNh/c1fuGbFAvykPgkHwY//jAwwYUkjb5suNUQCmZIL99DxhRwzkOUnxWEcs+HAZLAurnwkEG1NRsPVaKwpUD4xpgRNffQKMaYzz4SslXciHtlzWVTL5ijJ0a+TJ2ADW5HaUgHuwVSyze78iZ16G0r21dZnl5DKWhrO3c4rutZrceM//yECFT6CyV12WNnyl7fjjLh0K3GFRl5rk7zbEtLKY/0RdGliV1Sq+XUnlQhlZHPJAv4M3yKTBmmsczDPPQVDgV729H0fRJ01wTv8mg8SOtvRz7RUmHfYY6IoqfLcsuboDM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gbuXdVNdRi1YMwNVz1bSAXG/w/y9Z7eYpqQVXaJS1w=;
 b=r/TyWaGRWalKnKTSiXN02ozJjUbzf3oCMQ5Ht7Ga97zFfrkg6H3LXOG1xe5LRhH9zj2NBcHN4v5O4cVBCgjorny2XnktNe/d3amRrggntlKaTql8bQow6cFrgNGxloU+vN1cHTmSd8w0y04Q6DHTAqlUQ6rgex2czeGvN4i0Uao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cb9479db-2f68-4b78-8bc2-922a59566464@amd.com>
Date: Thu, 11 Jan 2024 11:19:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Patrick Plenefisch <simonpatp@gmail.com>
CC: <xen-devel@lists.xenproject.org>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SJ0PR12MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 1150e1bd-8aa3-4bf3-6b1a-08dc128679c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8oEMTyOma3n9JZWjwqwINNsbAF8t/+EICV1H4rM6K6I6jQsCkOtjRwDrXxjzYRMR6k7vyZn589sq7bje/Jfg98ZGVAYDqsUYZ/qNRFS+f2GcZRPGznTleJbfd8K7O4Ge8HMU3QPVMV2XmSrgZMS11r7a3MrafAfVmKrcREUX4Vw6b4d0YnKq2sgBerFEwuuJDf29ox6qPDYJfdpjXCsLZI9awzmFBAlYRns8D0Y/pXZtcoi3/XeBul/oAu6iaBnIPHLGMV9cAe6Vqd2jOOVO/Sr+8M4GRWHkfQCZ655/pkR3LcBS/T9lswPYWKcjxrcyIJplo9W3QELe3fEXXnUndEYu+8rhqt0IRe1faYCHKXKxtOQ4RglyNTFsMSzGsphuZNH49Swn9z7Gv/VJHFaQScbFIzyjYLepEzlQDiKFBQLeBcYt32COJhDl/uypwMySjR6pIzR4SPgrgQpHh2VNIvC8GdTPDQn+MebcbAN/w5VuCcjo38B1/t82iLn3t9947ThLoubMhHOzoS+kEq5xB2D/Ee6Y03hzGE6QKT2cCU6JC+JIjVFc6WIwmHDJaZ8JXK2QSwktxyuCg1ns3ohnACUBF5PvrDe/nTQ50NJKEcFqxdVhnat8FkX9j2qRN4vCizVcnyH+HWuf2keVRFyBmLggENM2RVXxfJ+bnW285nc5YJeATtWOCZ/AgtlfH9DHPlSwIdjLp722yU3q4lK7EtOcA+5mUsR24J/wM3HBtFFR7TLaVVwNbOMJsIpbBY7zHfuouhctV2ratXPGMVGz+LETR4qMSWasNY8v1Z3Ri74=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(426003)(53546011)(336012)(6666004)(26005)(478600001)(2616005)(966005)(47076005)(36860700001)(16526019)(83380400001)(5660300002)(2906002)(16576012)(110136005)(4326008)(8936002)(70586007)(8676002)(44832011)(316002)(70206006)(36756003)(82740400003)(81166007)(86362001)(31696002)(356005)(41300700001)(31686004)(40460700003)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 09:19:55.6729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1150e1bd-8aa3-4bf3-6b1a-08dc128679c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6966


On 11/1/24 10:37, Jan Beulich wrote:
> On 11.01.2024 03:29, Patrick Plenefisch wrote:
>> Hi,
>>
>> I ran into a memory allocation issue, I think. It is the same as
>> https://github.com/QubesOS/qubes-issues/issues/8791 and I saw at the end it
>> was recommended (by marmarek) that the issue reporter forward the issue to
>> this list. I searched the list, but as I didn't see it in the list already,
>> I'm doing that now.
>>
>> Hardware:
>> I have an AMD Threadripper 7960X on a ASRock TRX50 WS motherboard. The
>> Qubes reporter had a Threadripper 3970X on an ASUS Prime TRX40-Pro
>> Motherboard. I saw a 3rd issue report of a similar issue on another
>> Threadripper, so I think this may be Threadripper-specific.
>>
>> Setup:
>> The QuebesOS reporter was using Qubes Installer.
>> My install was that I had a fresh install of Debian 12 (no gui), and then
>> did `apt install xen-system-amd64` and rebooted.
>>
>> The issue:
>> Any boot of Xen on the hardware results in a halted machine. When
>> monitoring the logs with `vga=,keep`, we get:
>>
>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>> (XEN) Freed 644kB init memory
>> mapping kernel into physical memory
>> about to get started…
>> xen hypervisor allocated kernel memory conflicts with E820
> 
> So first of all (the title doesn't say it) this is a Linux Dom0 issue.
> Whether or not needing addressing in Xen is unknown at this point.
> 
>> (XEN) Hardware Dom0 halted: halting machine
>>
>> None of the settings I or the Qubes reporter have tried have been able to
>> get past this failure.
>>
>> I am happy to provide debugging support.
> 
> Well, the crucial piece of data initially is going to be: What's the
> E820 map Xen gets to see, what's the E820 map Dom0 gets to see, and
> what address range is the conflict detected for? The first question
> is possible to answer by supplying a serial log. The second question
> likely means adding some debugging code to either Xen or Linux. The
> answer to third question may be possible to infer from the other
> data, but would likely be better to obtain explicitly by adjusting /
> amending the message Linux emits.

We 've already hit similar issue because xen doesn't take into account 
the reserved memory regions when loading the dom0 kernel (even if it is 
relocatable). It can be worked around by changing accordingly 
CONFIG_PHYSICAL_START in kernel config.

Let me provide more details on how to get the info Jan requested:

1) in the xen cmdline add: e820-verbose=true console_to_ring

2) in the dom0 kernel cmdline add: earlyprintk=xen

3) change the xen log message emitted by the linux kernel to print the 
conflicting address, like below

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index cfa99e8f054b..ad88b700d58e 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -717,7 +717,7 @@ static void __init xen_reserve_xen_mfnlist(void)
         xen_relocate_p2m();
         memblock_phys_free(start, size);
}
-
+void xen_raw_printk(const char *fmt, ...);
/**
   * xen_memory_setup - Hook for machine specific memory setup.
   **/
@@ -853,7 +853,8 @@ char * __init xen_memory_setup(void)
          */
         if (xen_is_e820_reserved(__pa_symbol(_text),
                         __pa_symbol(__bss_stop) - __pa_symbol(_text))) {
-               xen_raw_console_write("Xen hypervisor allocated kernel 
memory conflicts with E820 map\n");
+               xen_raw_printk("Xen hypervisor allocated kernel memory 
conflicts with E820 map: %#lx - %#lx\n",
+                              __pa_symbol(_text), 
__pa_symbol(__bss_stop));
                 BUG();
         }

> 
> Jan
> 

