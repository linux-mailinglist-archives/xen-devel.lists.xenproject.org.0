Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D047D7FEF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623641.971673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwxS-0001IV-Cm; Thu, 26 Oct 2023 09:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623641.971673; Thu, 26 Oct 2023 09:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwxS-0001G9-8f; Thu, 26 Oct 2023 09:47:18 +0000
Received: by outflank-mailman (input) for mailman id 623641;
 Thu, 26 Oct 2023 09:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qvwxQ-0001G3-Kd
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:47:16 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3162f34-73e4-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 11:47:13 +0200 (CEST)
Received: from CY5PR15CA0188.namprd15.prod.outlook.com (2603:10b6:930:82::9)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 26 Oct
 2023 09:47:08 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:82:cafe::79) by CY5PR15CA0188.outlook.office365.com
 (2603:10b6:930:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22 via Frontend
 Transport; Thu, 26 Oct 2023 09:47:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 09:47:07 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 04:47:04 -0500
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
X-Inumbo-ID: a3162f34-73e4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9k8vDM6wtvk70wtwaajzoYEzt/TrIGXJrdKj55cqVmwf24VIYOhyboKELmytAlobnXLtjNbyQmMdhwe42NftgNt0HHJ+YB46Pg1EnjlkZ6T9+YkWRSWNMr7n1eiqxG65CzmVolbX9CkjBaAIgxspNllIoLOuR+IaHM/pTTgsSVGHGoPWseDc2QLaRkxmszfehyb9ZCMbyT4aCDUvVVw2E3MbM9ejd4mF2cPMBzJJ25v8bVjWegHv1eqi1j/HWpURIWFdK+bJlXQnV2f4+JkkCWgVk9NNg4Lv5IYQzP/QVzP8W92WhfQuU1Chsx9ylFX+SIldkXJOvab9WOi6RJ4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpxjwBFCBu4GVbrCVetKq3Zrkk6FRLF+hLzDjDD3LyU=;
 b=g+qpMl60S+rRfiHnFGAYYaaAsnVyC86oEWT/gaMbPgaWYks7+iVNqEFBFXeVAk/1V8lCHNADqbMvSbt2JqmYFlebd8NC2Ki+vClDLO4HtWAF+UEoG9Msb1mL4kDrSJIpMP9UrIg/ppoibxw2qUx5kqURIEtKLyFPW7VPgDsbXM3jlCkiI8luw2wNosL4BWDTYdZ2MBUssAvTwi3Mh8miSBuc/xU2/qa2HTo44V/MxJCfoi8uSfXo+8Fc5ruKhnYjPxqNaik+uVGT7T5PT63KiiccwAVZnxPwnRD8BXvE3Y/ci4VybcA+G6ma+dtw5daJ18pV/2lYn7zSqGp91ScBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpxjwBFCBu4GVbrCVetKq3Zrkk6FRLF+hLzDjDD3LyU=;
 b=DIGoEaFVMsFHQGlUtI9W6BLASorzMYugPOD0h4bkKbWvmWbWogi6fTwaVwH3aqOUrkDhomhnK2wkPAJWLsYd6EXWn9SDGj/bA+WfdN6cCa1xrOxWd4X9tYE3YT1D+zre3TljgO5a75dAtYHZBzoxmgu5xfqY6yinleBnXYrzIyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Content-Type: multipart/alternative;
	boundary="------------83AJLeVJPG8Yqwo11XIXY4hN"
Message-ID: <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
Date: Thu, 26 Oct 2023 12:46:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: bd996a71-63be-4466-7cba-08dbd60884c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8OqyppI3msdKrjyPGcwEvj3+gAk3bRZR3eW6+m2ORqh1UGRU5YDw7UFOeu1EC9uyGlBHzwViLGnhdBv1CleyflVqskopNMyHh4e2DiOmAKfUG19eK8xheRGMx2QT6A2OPSElFKQEGS9XDld3wtUG33Kf7guxwzaLukuoCfl1nqG22iy/PWmJbzb8mJ1J70DS+he4qsnC2pnFGn0Z2lKSU79voBD3bdkLKJ2r4Q1kBnuk+Bt+jjoB6RGohAcFN61NHEeV3n+l9lSFiMhzkKfj/1HkmqhovPh+/Z/0ewR4H1JxZotQWDwRUfBpEdjtynRCrJmkxQm8Vx+yX5sNCNDJ59f7mFnV/Djnw1/w5h0XOS/uiug37XIL4oxKRvWDzXBsHtXVlejG3PRX/vUzKoFEHcgpfqEnHtr0OO+CBqptJnTs214lBfo5RC3aVKP53TiI6aDROuPzIJEUx/b11b5GHSLAatxxD89BfXawZOBy4u0sZ5H81/CJAwSNd1j8bxm+jg18ZfTEAKqBwnnZZQvtIJF1Sidmqe8QL5mfelO+Q0tgzS6ksHYpnM6D4CePL70VOu42SgbX9rzZFjzBP09AIh/OLpbf9Vtw8VScqh6RtcJ9sW/SZzHe4QWHIgwGYV9Fv++VQJEcWxR4v0EWhc6e7OdZ7hXULYlCz6ej7Q4Mg5UQKJIs1Yo/u1nyoLpGxYIM9Whh+c4FglG/wJH4xAVDCRAXDTtJ0zM4NWSWnVTISIDAvNrVs7XbqGt8DbEtajx4HzG/ZI1VlfMHL57Hif1RDKwkoQCeqml0y1echvsA4ZVE+vdUFUW2si102pjjUTiq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(33964004)(26005)(356005)(31686004)(66899024)(2906002)(36756003)(86362001)(31696002)(5660300002)(4326008)(41300700001)(8936002)(8676002)(40460700003)(70586007)(16526019)(2616005)(53546011)(6666004)(16576012)(6916009)(36860700001)(54906003)(81166007)(82740400003)(316002)(70206006)(478600001)(83380400001)(44832011)(40480700001)(336012)(47076005)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:47:07.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd996a71-63be-4466-7cba-08dbd60884c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650

--------------83AJLeVJPG8Yqwo11XIXY4hN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/23 11:45, Jan Beulich wrote:

> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>> On 26/10/23 10:35, Jan Beulich wrote:
>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>> Given that start < kernel_end and end > kernel_start, the logic that
>>>> determines the best placement for dom0 initrd and metadata, does not
>>>> take into account the two cases below:
>>>> (1) start > kernel_start && end > kernel_end
>>>> (2) start < kernel_start && end < kernel_end
>>>>
>>>> In case (1), the evaluation will result in end = kernel_start
>>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>>> In case (2), the evaluation will result in start = kernel_end
>>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>>> of the memory region under evaluation.
>>> I agree there is a problem if the kernel range overlaps but is not fully
>>> contained in the E820 range under inspection. I'd like to ask though
>>> under what conditions that can happen, as it seems suspicious for the
>>> kernel range to span multiple E820 ranges.
>> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
>>
>> I know ... that maybe shouldn't have been permitted at all, but
>> nevertheless we hit this issue.
> How can they expect to have a contiguous, large enough range there?
Me too I wonder. I don't know, maybe somebody else could shed
some light on this.
>>>> This patch rephrases the if condition to include the above two cases
>>>> without affecting the behaviour for the case where
>>>> start < kernel_start && end > kernel_end
>>>>
>>>> Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
>>>> Signed-off-by: Xenia Ragiadakou<xenia.ragiadakou@amd.com>
>>>> ---
>>>>    xen/arch/x86/hvm/dom0_build.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>>>> index c7d47d0d4c..5fc2c12f3a 100644
>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>            if ( end <= kernel_start || start >= kernel_end )
>>>>                ; /* No overlap, nothing to do. */
>>>>            /* Deal with the kernel already being loaded in the region. */
>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>> +        else if ( kernel_start + kernel_end > start + end )
>>> What meaning has the sum of the start and end of either range? I can't
>>> figure how comparing those two values will be generally correct / useful.
>>> If the partial-overlap case needs handling in the first place, I think
>>> new conditionals need adding (and the existing one needs constraining to
>>> "kernel range fully contained") to use
>>> - as before, the larger of the non-overlapping ranges at start and end
>>>     if the kernel range is fully contained,
>>> - the tail of the range when the overlap is at the start,
>>> - the head of the range when the overlap is at the end.
>> Yes it is not quite straight forward to understand and is based on the
>> assumption that end > kernel_start and start < kernel_end, due to
>> the first condition failing.
>>
>> Both cases:
>> (start < kernel_start && end < kernel_end) and
>> (kernel_start - start > end - kernel_end)
>> fall into the condition ( kernel_start + kernel_end > start + end )
>>
>> And both the cases:
>> (start > kernel_start && end > kernel_end) and
>> (end - kernel_end > kernel_start - start)
>> fall into the condition ( kernel_start + kernel_end < start + end )
>>
>> ... unless of course I miss a case
> Well, mathematically (i.e. ignoring the potential for overflow) the
> original expression and your replacement are identical anyway. But
> overflow needs to be taken into consideration, and hence there is a
> (theoretical only at this point) risk with the replacement expression
> as well. As a result I still think that ...
>
>>> That said, in the "kernel range fully contained" case it may want
>>> considering to use the tail range if it is large enough, rather than
>>> the larger of the two ranges. In fact when switching to that model, we
>>> ought to be able to get away with one less conditional, as then the
>>> "kernel range fully contained" case doesn't need treating specially.
> ... this alternative approach may want considering (provided we need
> to make a change in the first place, which I continue to be
> unconvinced of).
Hmm, I see your point regarding the overflow.
Given that start < kernel_end and end > kernel_start, this could
be resolved by changing the above condition into:
if ( kernel_end - start > end - kernel_start )

Would that work for you?

> Jan
--------------83AJLeVJPG8Yqwo11XIXY4hN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 26/10/23 11:45, Jan Beulich wrote:</p>
    <blockquote type="cite"
      cite="mid:809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com">
      <pre class="moz-quote-pre" wrap="">On 26.10.2023 10:34, Xenia Ragiadakou wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 26/10/23 10:35, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre class="moz-quote-pre" wrap="">I agree there is a problem if the kernel range overlaps but is not fully
contained in the E820 range under inspection. I'd like to ask though
under what conditions that can happen, as it seems suspicious for the
kernel range to span multiple E820 ranges.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.

I know ... that maybe shouldn't have been permitted at all, but 
nevertheless we hit this issue.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How can they expect to have a contiguous, large enough range there?</pre>
    </blockquote>
    Me too I wonder. I don't know, maybe somebody else could shed<br>
    some light on this.<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This patch rephrases the if condition to include the above two cases
without affecting the behaviour for the case where
start &lt; kernel_start &amp;&amp; end &gt; kernel_end

Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
Signed-off-by: Xenia Ragiadakou<a class="moz-txt-link-rfc2396E" href="mailto:xenia.ragiadakou@amd.com">&lt;xenia.ragiadakou@amd.com&gt;</a>
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
          <pre class="moz-quote-pre" wrap="">What meaning has the sum of the start and end of either range? I can't
figure how comparing those two values will be generally correct / useful.
If the partial-overlap case needs handling in the first place, I think
new conditionals need adding (and the existing one needs constraining to
"kernel range fully contained") to use
- as before, the larger of the non-overlapping ranges at start and end
   if the kernel range is fully contained,
- the tail of the range when the overlap is at the start,
- the head of the range when the overlap is at the end.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes it is not quite straight forward to understand and is based on the
assumption that end &gt; kernel_start and start &lt; kernel_end, due to
the first condition failing.

Both cases:
(start &lt; kernel_start &amp;&amp; end &lt; kernel_end) and
(kernel_start - start &gt; end - kernel_end)
fall into the condition ( kernel_start + kernel_end &gt; start + end )

And both the cases:
(start &gt; kernel_start &amp;&amp; end &gt; kernel_end) and
(end - kernel_end &gt; kernel_start - start)
fall into the condition ( kernel_start + kernel_end &lt; start + end )

... unless of course I miss a case
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, mathematically (i.e. ignoring the potential for overflow) the
original expression and your replacement are identical anyway. But
overflow needs to be taken into consideration, and hence there is a
(theoretical only at this point) risk with the replacement expression
as well. As a result I still think that ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">That said, in the "kernel range fully contained" case it may want
considering to use the tail range if it is large enough, rather than
the larger of the two ranges. In fact when switching to that model, we
ought to be able to get away with one less conditional, as then the
"kernel range fully contained" case doesn't need treating specially.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... this alternative approach may want considering (provided we need
to make a change in the first place, which I continue to be
unconvinced of).</pre>
    </blockquote>
    Hmm, I see your point regarding the overflow.<br>
    Given that start &lt; kernel_end and end &gt; kernel_start, this
    could<br>
    be resolved by changing the above condition into:<br>
    if ( kernel_end - start &gt; end - kernel_start )<span
    style="white-space: pre-wrap">
</span>
    <p><span style="white-space: pre-wrap">Would that work for you?
</span></p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com">
      <pre class="moz-quote-pre" wrap="">Jan
</pre>
    </blockquote>
  </body>
</html>

--------------83AJLeVJPG8Yqwo11XIXY4hN--

