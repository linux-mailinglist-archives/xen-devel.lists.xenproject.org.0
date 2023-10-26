Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB97D8249
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623757.971903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzAq-0001Ml-AY; Thu, 26 Oct 2023 12:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623757.971903; Thu, 26 Oct 2023 12:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzAq-0001Kr-6t; Thu, 26 Oct 2023 12:09:16 +0000
Received: by outflank-mailman (input) for mailman id 623757;
 Thu, 26 Oct 2023 12:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm+b=GI=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qvzAo-0001Kl-R9
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:09:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79560d7a-73f8-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:09:12 +0200 (CEST)
Received: from DM6PR06CA0026.namprd06.prod.outlook.com (2603:10b6:5:120::39)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 12:09:08 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:120:cafe::e1) by DM6PR06CA0026.outlook.office365.com
 (2603:10b6:5:120::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 12:09:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 12:09:08 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 07:09:06 -0500
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
X-Inumbo-ID: 79560d7a-73f8-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuxsdzHuXtLZw4NvNp0fc6rPMWfJ8Sdh2zmLHuw57OFdqlv5snjlokzRGnWo2A+gTwa+4zlkYJV53zNlaFaTOopDRvoIjIPrVx2F8S+tBiiC/dFUtIfNosimpCUy/EJfhrL8c70TS5eFjI+1A/lFX/dbpnH/z2sop5EcEMSrBiZlN90pYTj1AHyD4aX7VASdAg6VgpMvK7y6tl3PNgkiFNpccZwI2enVT4BHtRdHQy93RQ6xLkoyZu8CAJico9taDDa0dd37Yq1YubMz60EPXMC5TYR/bZCfn6qdRVh/RiGNIJuacljxBFVWvyabTr6xwQN8t1/7zbreSVLcJAg6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPW8hp4LCcjyJ331tYGrN7maLJAXNAP8u5sEArrU/V4=;
 b=jfLETQmuf4o1AhfQPhTjWMlna0o8AobQ6Tc5tWeqipz0ZIBVIge5NRkclvysx2FW3f1vgjIVIRh/kUpWtEGq05d2oiQRX/NOOKqJYj8CMbh3o5EhiBl5uLjgdqeJsXrlaj5XXaBftSkjMxQdY0EuvMbboRC2IBuUjWoY66jhnPJURd4clV9I0ci/KmGMr8CDtzI7CVwBwj42awTIMcF5il795q7rzfPtDFFAtsqFfH7//ykeXXxOPYTYItfZheQZ8GtAdZpTd8iteFVJebmbzcCpnX2h1ehJYtH1saT7a89U1C9BvAH/uG3zSZk/XK90SxCW5HfZxep8HkpO5I3GRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPW8hp4LCcjyJ331tYGrN7maLJAXNAP8u5sEArrU/V4=;
 b=IqQxlTAegjyYFG9lASixt2WfWqIxjykTzvzxcs+OWFg/1hXSZ8zGMrHDVB5urAF9xAiXPyeUwR5jA+QhW46oj14fRDK+eDXMeEJpFB1EmWFb3G6nFDet/N+I40Z8yYKkxYj5GIKE6ipjcfUc5gzhdsr5yYWxqh0XzYIW2lwnBGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Content-Type: multipart/alternative;
	boundary="------------xK8LwNjbcfUgRdA726EB40HV"
Message-ID: <a4d4cac5-3987-4891-8aac-c5f559a02b59@amd.com>
Date: Thu, 26 Oct 2023 15:09:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
 <84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f0b158-a907-4bf8-2d0d-08dbd61c5b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uhBKR4oyfvVLYTtkJo6OhVVnxoSMkhrx1pF2ThvnGtoyuHNipe7OEdROWqdZJwKbrxeAEERbO8artPbfeG/nNkLtVtpukc9SLtbxEASbzyYNxGyI8SAgM9l2Cl5+WhCpJ2U3ymLo9paEGAN1cXFt/wZDcCHhctR62urj+nqa+65emrb62W2jR2UW9KNgoh3z40BMWuZdv3/LAnBs5vBG57uQSYQA7ok/1sY/+zSv5SXfFX0LCFRfarQL0K9J7l50O3x89f+YQUiNcDuci7YX1UgZHxFaFXB4lkuP2ASM1YRxCsd7wTcIkM5VF/g+d81r6vSLVCqapkTYU3XRgseMtIQdHIIDScwX7xLng35aM3cEuivUJlT3mCizLDE9vvQalSoxadvggOzO4g2cCaSfVCHgvX13XkSw++Nts8TkFAfxMMcrwaIy2gMY0kGmDpKVVFKAWdEz/BZm4Gr2y2UFjza3LeEQJMdTSpcAp1pb7JQ7VowyMhy+zUhoZ+hB7q8gdmQouNUDGa0dmEslUoX19QCY9g5adLq3v6bh9SD+oi7wlGiCYD1AY92eVxE03B21aqN6MRI/gM9AExk7SnDIec4Fhapm1WQSW7gVpfShjcFC7o+LHOWBadl59YiWkieyNbiB4rd8aoPhGeDSKM/wMWvQ6NnmGNsyk25Fub+1E9NtOnFWbro7cuJIxl/hyKSvnhutjeYOI58QmWWSG4zR+LCQka+izzddSCA90k+vDUVu89RWmbPrUXSgif3CWEZprTpFGB34VjKTq+CHHeOYtG2s3AVcOEVt8cHZmqf2UmADaz6/UrYQmmJDWgg9lB7H
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(31696002)(86362001)(2906002)(44832011)(81166007)(316002)(36860700001)(478600001)(82740400003)(16526019)(356005)(16576012)(110136005)(33964004)(70206006)(47076005)(53546011)(336012)(426003)(83380400001)(40480700001)(4326008)(40460700003)(5660300002)(41300700001)(2616005)(54906003)(36756003)(8936002)(8676002)(31686004)(70586007)(26005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:09:08.5093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f0b158-a907-4bf8-2d0d-08dbd61c5b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773

--------------xK8LwNjbcfUgRdA726EB40HV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/23 14:41, Jan Beulich wrote:
> On 26.10.2023 12:31, Andrew Cooper wrote:
>> On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>> Given that start < kernel_end and end > kernel_start, the logic that
>>>>> determines the best placement for dom0 initrd and metadata, does not
>>>>> take into account the two cases below:
>>>>> (1) start > kernel_start && end > kernel_end
>>>>> (2) start < kernel_start && end < kernel_end
>>>>>
>>>>> In case (1), the evaluation will result in end = kernel_start
>>>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>>>> In case (2), the evaluation will result in start = kernel_end
>>>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>>>> of the memory region under evaluation.
>>>> I agree there is a problem if the kernel range overlaps but is not fully
>>>> contained in the E820 range under inspection. I'd like to ask though
>>>> under what conditions that can happen, as it seems suspicious for the
>>>> kernel range to span multiple E820 ranges.
>>> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
>>>
>>> I know ... that maybe shouldn't have been permitted at all, but
>>> nevertheless we hit this issue.
>>
>> Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
>> entrypoint is not position-independent.
> Very interesting. What size is their kernel? And, Xenia, can you provide
> the E820 map that you were finding the collision with?

Sure.

Xen-e820 RAM map:

  [0000000000000000, 000000000009fbff] (usable)
  [000000000009fc00, 000000000009ffff] (reserved)
  [00000000000f0000, 00000000000fffff] (reserved)
  [0000000000100000, 000000007ffdefff] (usable)
  [000000007ffdf000, 000000007fffffff] (reserved)
  [00000000b0000000, 00000000bfffffff] (reserved)
  [00000000fed1c000, 00000000fed1ffff] (reserved)
  [00000000fffc0000, 00000000ffffffff] (reserved)
  [0000000100000000, 000000027fffffff] (usable)

(XEN) ELF: phdr: paddr=0x1000 memsz=0x8000
(XEN) ELF: phdr: paddr=0x100000 memsz=0x28a90
(XEN) ELF: phdr: paddr=0x128aa0 memsz=0x7560
(XEN) ELF: memory: 0x1000 -> 0x130000

>> So trying to put the binary anywhere else is going to work about as well
>> having the notes section misalign the pagetables by 0x20 bytes[1].
>>
>> ~Andrew
>>
>> [1] Guess what was causing the "Zephyr doesn't boot PVH" issues.  Which
>> is doubly irritating because about 6h of debugging prior, I'd pointed
>> out that the linker was complaining about an orphaned section and that
>> that ought to be fixed before trying to debug further...
--------------xK8LwNjbcfUgRdA726EB40HV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26/10/23 14:41, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com">
      <pre class="moz-quote-pre" wrap="">On 26.10.2023 12:31, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
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

Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
entrypoint is not position-independent.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Very interesting. What size is their kernel? And, Xenia, can you provide
the E820 map that you were finding the collision with?</pre>
    </blockquote>
    <p>Sure.<br>
    </p>
    <p>Xen-e820 RAM map:</p>
     [0000000000000000, 000000000009fbff] (usable)<br>
     [000000000009fc00, 000000000009ffff] (reserved)<br>
     [00000000000f0000, 00000000000fffff] (reserved)<br>
     [0000000000100000, 000000007ffdefff] (usable)<br>
     [000000007ffdf000, 000000007fffffff] (reserved)<br>
     [00000000b0000000, 00000000bfffffff] (reserved)<br>
     [00000000fed1c000, 00000000fed1ffff] (reserved)<br>
     [00000000fffc0000, 00000000ffffffff] (reserved)<br>
     [0000000100000000, 000000027fffffff] (usable)<br>
    <br>
    (XEN) ELF: phdr: paddr=0x1000 memsz=0x8000<br>
    (XEN) ELF: phdr: paddr=0x100000 memsz=0x28a90<br>
    (XEN) ELF: phdr: paddr=0x128aa0 memsz=0x7560<br>
    (XEN) ELF: memory: 0x1000 -&gt; 0x130000<span
    style="white-space: pre-wrap"></span><br>
    <p><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So trying to put the binary anywhere else is going to work about as well
having the notes section misalign the pagetables by 0x20 bytes[1].

~Andrew

[1] Guess what was causing the "Zephyr doesn't boot PVH" issues.  Which
is doubly irritating because about 6h of debugging prior, I'd pointed
out that the linker was complaining about an orphaned section and that
that ought to be fixed before trying to debug further...
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------xK8LwNjbcfUgRdA726EB40HV--

