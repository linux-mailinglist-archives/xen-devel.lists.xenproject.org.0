Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D697D7E8F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623584.971553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvp1-0001aS-7Q; Thu, 26 Oct 2023 08:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623584.971553; Thu, 26 Oct 2023 08:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvp1-0001XX-48; Thu, 26 Oct 2023 08:34:31 +0000
Received: by outflank-mailman (input) for mailman id 623584;
 Thu, 26 Oct 2023 08:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qvvp0-0001XR-1M
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:34:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79661572-73da-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 10:34:28 +0200 (CEST)
Received: from DM5PR07CA0096.namprd07.prod.outlook.com (2603:10b6:4:ae::25) by
 SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 26 Oct
 2023 08:34:24 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::e0) by DM5PR07CA0096.outlook.office365.com
 (2603:10b6:4:ae::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 08:34:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 08:34:24 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 03:34:22 -0500
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
X-Inumbo-ID: 79661572-73da-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM7cf9NXG7Y5v8qD59PnWl+YFYm54/N1lFYpPlAOo+ez08eEDad6ubilykmWN2yuIQ9AVvrUygkA3KXqTaOWd0MINrUkpF24gPSTUsVbag2ZrsUwOPfvPBhS4UEW6NGbMlfWQpUXyIvNWfDObCYAVEwjk/i1a8qulCTQfYZuwlKW0/Bt8U8XBQ6Gzy5lxCUmzjjHRgM1OF6GlH8x6ium5dyJtH0H4TrcPIK/1kVpb2/GPy5ns1ppweLdPhlAyV6YVmxXhxN+/EzOznznRaO3kR/ef6D3aQJK0vGZYkxqAn2a6EfrDLSCN0YV7UcQdaqEXsg661RJEHquCTXXApIZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGB5Xy0JiVpg5CUd5pEyPzgFuIy7KaBKFTWQ5Lox5nk=;
 b=FMMtJVhtArFLEvCYoYeuggevkZJa/EKZ/arU1UI+LE4eY7ZKnZB7qj+lN9hsN0UNPt0CwWb9tlBPJ5689TKy4xRPT8w8aQFZlNp6njtOrlfhsgRVUknfZsiJgldpB9+rP+ZRLYn4ZJaBMJM6p99A1P6lBsWNznVsiSJNxWZVikR76mwUPFNAy8gn4xhapSidiPbg+EVwXO/1TUWDx+5BQF4YmggxmgOvA8Dp5J1yITItJIl01hEUd8CaCX2MXaJozfpwTXtnHFCg+SxcWhRNtPkR8Pi3Yr93ZXYGf+9/qiQuDIzILWwP4f6a+dmXTn94gxLiyVdmXFd87PUyo+C9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGB5Xy0JiVpg5CUd5pEyPzgFuIy7KaBKFTWQ5Lox5nk=;
 b=vMbKaC3qud03DV1R4Dzl1ni6TabkK9WUSaDc3gVdkmdcsawm//UOJ/B2h634TrOlW1WBwgJzNcEZeV7wJfiLjDG9OVPRbwcLb0GfAF1QABdEt1O0NQh3TQAKuQXGJf6jgyrh0GJe1nM7ulUt8wgs3SLDoSnXGaa/hVGhxiS8D8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Content-Type: multipart/alternative;
	boundary="------------MW6eaoWyfdtKOVnw0KOQSJjC"
Message-ID: <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
Date: Thu, 26 Oct 2023 11:34:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
Content-Language: en-US
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: fad24fa6-974f-463a-b50a-08dbd5fe5c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8sAGbTZ32t8WtQbn5kHBkPqZFMFNC9MEuKM5pR88Q/Ky/JcfLRfTsDfxN4HXZ3sum1Y5cQidFqGYojX2CsEvIUKsDAwP1Y4MKeXInvo30BZcPuHI7/Kg5Oq/py38bBAW4EFN0JRA1cRGJCbnslPZDbaOyQ3QZ5O7YlPKyqUYTCGNu7JROr63tLHGAPFEseLaUTBVvBzCFF1jNihvilRC0JHgs87cgnUUYVJUxUeUi1hbkPrubZ5cPVq4A538cuYcT7pyTSPMAZYhUqgpJMPGxUdGHNUgAaCVcH48sTn7nN+660lITTwq0ffg38Fih2s5mJmFcwbmXjF8FSZEbf1tHgWMp7h0usGffon3JJEEPAlbq2NOUY6aMdOkUyVyurO118qUnSy9XXjUCZNx3rr3eHQ3GxSTYT1lLDHaCZ/e7mNS3BNWi4RoP52PucLVUGaHwFSH/7hcnvZxQJtjDyPLhEiMpSEaVw2YT1qeIm3j2Kh98pviI9bBLcmU/VljYRN8T0+vviYXDG//pUOxFRExYkcpBcB76uHoTOK3GaL3CS0bjiei5EYiP9KEtya2ay2kdmysgBbnbcqfVMZOM6dO3D0BO1+QjCfhwh4U2VgoiK9ma2phfxXGVO2AYQSdAslwRnXYfKSSS0RREPbEEa12+tA4icECuPNIHPpXIo+EE8tK/LmJ3Owike7CMLXgDahGowgSWGXqi4HKd+RvIfqFjbRECFa7JxGbe3HdVth7M3rbZ9GePdqzQFbRV1mkADcc2u8PoVHYtnL40EuIIM7CNLDgLvdtac9dnS5PSH5qJxMxln69GzDlGJfjcvxl1YE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(16576012)(40460700003)(70586007)(70206006)(83380400001)(53546011)(16526019)(356005)(6666004)(86362001)(81166007)(2616005)(31696002)(36860700001)(426003)(47076005)(82740400003)(316002)(6916009)(54906003)(478600001)(33964004)(44832011)(41300700001)(5660300002)(336012)(2906002)(31686004)(66899024)(26005)(8936002)(4326008)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:34:24.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad24fa6-974f-463a-b50a-08dbd5fe5c1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678

--------------MW6eaoWyfdtKOVnw0KOQSJjC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 26/10/23 10:35, Jan Beulich wrote:
> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>> Given that start < kernel_end and end > kernel_start, the logic that
>> determines the best placement for dom0 initrd and metadata, does not
>> take into account the two cases below:
>> (1) start > kernel_start && end > kernel_end
>> (2) start < kernel_start && end < kernel_end
>>
>> In case (1), the evaluation will result in end = kernel_start
>> i.e. end < start, and will load initrd in the middle of the kernel.
>> In case (2), the evaluation will result in start = kernel_end
>> i.e. end < start, and will load initrd at kernel_end, that is out
>> of the memory region under evaluation.
> I agree there is a problem if the kernel range overlaps but is not fully
> contained in the E820 range under inspection. I'd like to ask though
> under what conditions that can happen, as it seems suspicious for the
> kernel range to span multiple E820 ranges.

We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.

I know ... that maybe shouldn't have been permitted at all, but 
nevertheless we hit this issue.

>> This patch rephrases the if condition to include the above two cases
>> without affecting the behaviour for the case where
>> start < kernel_start && end > kernel_end
>>
>> Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
>> Signed-off-by: Xenia Ragiadakou<xenia.ragiadakou@amd.com>
>> ---
>>   xen/arch/x86/hvm/dom0_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index c7d47d0d4c..5fc2c12f3a 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>           if ( end <= kernel_start || start >= kernel_end )
>>               ; /* No overlap, nothing to do. */
>>           /* Deal with the kernel already being loaded in the region. */
>> -        else if ( kernel_start - start > end - kernel_end )
>> +        else if ( kernel_start + kernel_end > start + end )
> What meaning has the sum of the start and end of either range? I can't
> figure how comparing those two values will be generally correct / useful.
> If the partial-overlap case needs handling in the first place, I think
> new conditionals need adding (and the existing one needs constraining to
> "kernel range fully contained") to use
> - as before, the larger of the non-overlapping ranges at start and end
>    if the kernel range is fully contained,
> - the tail of the range when the overlap is at the start,
> - the head of the range when the overlap is at the end.

Yes it is not quite straight forward to understand and is based on the
assumption that end > kernel_start and start < kernel_end, due to
the first condition failing.

Both cases:
(start < kernel_start && end < kernel_end) and
(kernel_start - start > end - kernel_end)
fall into the condition ( kernel_start + kernel_end > start + end )

And both the cases:
(start > kernel_start && end > kernel_end) and
(end - kernel_end > kernel_start - start)
fall into the condition ( kernel_start + kernel_end < start + end )

... unless of course I miss a case

> That said, in the "kernel range fully contained" case it may want
> considering to use the tail range if it is large enough, rather than
> the larger of the two ranges. In fact when switching to that model, we
> ought to be able to get away with one less conditional, as then the
> "kernel range fully contained" case doesn't need treating specially.
>
> Jan
--------------MW6eaoWyfdtKOVnw0KOQSJjC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26/10/23 10:35, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com">
      <pre class="moz-quote-pre" wrap="">On 26.10.2023 08:45, Xenia Ragiadakou wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Given that start &lt; kernel_end and end &gt; kernel_start, the logic that
determines the best placement for dom0 initrd and metadata, does not
take into account the two cases below:
(1) start &gt; kernel_start &amp;&amp; end &gt; kernel_end
(2) start &lt; kernel_start &amp;&amp; end &lt; kernel_end

In case (1), the evaluation will result in end = kernel_start
i.e. end &lt; start, and will load initrd in the middle of the kernel.
In case (2), the evaluation will result in start = kernel_end
i.e. end &lt; start, and will load initrd at kernel_end, that is out
of the memory region under evaluation.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I agree there is a problem if the kernel range overlaps but is not fully
contained in the E820 range under inspection. I'd like to ask though
under what conditions that can happen, as it seems suspicious for the
kernel range to span multiple E820 ranges.</pre>
    </blockquote>
    <p>We tried to boot Zephyr as pvh dom0 and its load address was
      under 1MB.<br>
    </p>
    <p><span style="white-space: pre-wrap">I know ... that maybe shouldn't have been permitted at all, but nevertheless
we hit this issue.
</span></p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch rephrases the if condition to include the above two cases
without affecting the behaviour for the case where
start &lt; kernel_start &amp;&amp; end &gt; kernel_end

Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
Signed-off-by: Xenia Ragiadakou <a class="moz-txt-link-rfc2396E" href="mailto:xenia.ragiadakou@amd.com">&lt;xenia.ragiadakou@amd.com&gt;</a>
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index c7d47d0d4c..5fc2c12f3a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -518,7 +518,7 @@ static paddr_t __init find_memory(
         if ( end &lt;= kernel_start || start &gt;= kernel_end )
             ; /* No overlap, nothing to do. */
         /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start &gt; end - kernel_end )
+        else if ( kernel_start + kernel_end &gt; start + end )
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What meaning has the sum of the start and end of either range? I can't
figure how comparing those two values will be generally correct / useful.
If the partial-overlap case needs handling in the first place, I think
new conditionals need adding (and the existing one needs constraining to
"kernel range fully contained") to use
- as before, the larger of the non-overlapping ranges at start and end
  if the kernel range is fully contained,
- the tail of the range when the overlap is at the start,
- the head of the range when the overlap is at the end.</pre>
    </blockquote>
    <p>Yes it is not quite straight forward to understand and is based
      on the<br>
      assumption that end &gt; kernel_start and start &lt; kernel_end,
      due to<br>
      the first condition failing.<br>
    </p>
    <p>Both cases:<br>
      (start &lt; kernel_start &amp;&amp; end &lt; kernel_end) and<br>
      (kernel_start - start &gt; end - kernel_end)<br>
      fall into the condition ( kernel_start + kernel_end &gt; start +
      end )<br>
    </p>
    <p>And both the cases:<br>
      (start &gt; kernel_start &amp;&amp; end &gt; kernel_end) and<br>
      (end - kernel_end &gt; kernel_start - start)<br>
      fall into the condition ( kernel_start + kernel_end &lt; start +
      end )</p>
    <p><span style="white-space: pre-wrap">... unless of course I miss a case 
</span><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com">
      <pre class="moz-quote-pre" wrap="">That said, in the "kernel range fully contained" case it may want
considering to use the tail range if it is large enough, rather than
the larger of the two ranges. In fact when switching to that model, we
ought to be able to get away with one less conditional, as then the
"kernel range fully contained" case doesn't need treating specially.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------MW6eaoWyfdtKOVnw0KOQSJjC--

