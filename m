Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BBD813F7C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 02:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654821.1022221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDxN8-00026M-9w; Fri, 15 Dec 2023 01:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654821.1022221; Fri, 15 Dec 2023 01:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDxN8-00023j-6O; Fri, 15 Dec 2023 01:52:14 +0000
Received: by outflank-mailman (input) for mailman id 654821;
 Fri, 15 Dec 2023 01:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j7Oc=H2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1rDxN6-00023d-SQ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 01:52:12 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e06f95a-9aec-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 02:52:10 +0100 (CET)
Received: from [IPV6:2601:646:8002:4641:eb14:ad94:2806:1c1a]
 ([IPv6:2601:646:8002:4641:eb14:ad94:2806:1c1a])
 (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 3BF1p8ju3422931
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 14 Dec 2023 17:51:09 -0800
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
X-Inumbo-ID: 8e06f95a-9aec-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3BF1p8ju3422931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023121201; t=1702605070;
	bh=V5+Mh+vAvnbIoWj79wEvhgtTOB599w/6t78stUt4jko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ko9BU3RN/mr7W5ck/3mbDE4qKSw33iFOYqtP3Bs8t7H7TxLB+/0ExArIn930tFBEi
	 wWbvQQoYiUA7zMZvjSaeXKgyHzcb9mAkrJ87Z2gsAbhvkmy6EbjDtjTwdW6FMy0FYc
	 VgdPLrTe3CHOz3Xo7SPARoBWimh+KFFFPdBO7jNfjgY9FJtcSQhWgFJV3jlS5Cz7mo
	 S/PJcXtZmE6b+S5qI9ETjyCjHpeMTV7pk75QbVPr9Jlmf7SFThEQoF2YVfA6hc4UAS
	 Kn1skMzQ1FKQeIswTvZJQueASmlEY9ufG5Z+3vml4ygCKhmYWXGplfjznWRxPZLQH2
	 oP8f2Lo3MSN7Q==
Message-ID: <c0c7c605-d487-483e-a034-983b76ee1dfa@zytor.com>
Date: Thu, 14 Dec 2023 17:51:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 24/35] x86/fred: Add a NMI entry stub for FRED
Content-Language: en-US
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org,
        pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
        nik.borisov@suse.com, shan.kang@intel.com
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-25-xin3.li@intel.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20231205105030.8698-25-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

So we have recently discovered an overlooked interaction with VT-x. 
Immediately before VMENTER and after VMEXIT, CR2 is live with the 
*guest* CR2. Regardless of if the guest uses FRED or not, this is guest 
state and SHOULD NOT be corrupted. Furthermore, host state MUST NOT leak 
into the guest.

NMIs are blocked on VMEXIT if the cause was an NMI, but not for other 
reasons, so a NMI coming in during this window that then #PFs could 
corrupt the guest CR2.

Intel is exploring ways to close this hole, but for schedule reasons, it 
will not be available at the same time as the first implementation of 
FRED. Therefore, as a workaround, it turns out that the FRED NMI stub 
*will*, unfortunately, have to save and restore CR2 after all when (at 
least) Intel KVM is in use.

Note that this is airtight: it does add a performance penalty to the NMI 
path (two read CR2 in the common case of no #PF), but there is no gap 
during which a bad CR2 value could be introduced in the guest, no matter 
in which sequence the events happen.

In theory the performance penalty could be further reduced by 
conditionalizing this on the NMI happening in the critical region in the 
KVM code, but it seems to be pretty far from necessary to me.

This obviously was an unfortunate oversight on our part, but the 
workaround is simple and doesn't affect any non-NMI paths.

	-hpa

On 12/5/23 02:50, Xin Li wrote:
> +
> +	if (IS_ENABLED(CONFIG_SMP) && arch_cpu_is_offline(smp_processor_id()))
> +		return;
> +

This is cut & paste from elsewhere in the NMI code, but I believe the 
IS_ENABLED() is unnecessary (not to mention ugly): smp_processor_id() 
should always return zero on UP, and arch_cpu_is_offline() reduces to 
!(cpu == 0), so this is a statically true condition on UP.

	-hpa

