Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB2ACBADB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 20:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003758.1383367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9d6-0000rd-Fp; Mon, 02 Jun 2025 18:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003758.1383367; Mon, 02 Jun 2025 18:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9d6-0000op-DB; Mon, 02 Jun 2025 18:11:24 +0000
Received: by outflank-mailman (input) for mailman id 1003758;
 Mon, 02 Jun 2025 18:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xAfn=YR=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1uM9d4-0000oj-LA
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 18:11:22 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de
 [2001:4ca0:0:103::81bb:ff8a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8f8a25-3fdc-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 20:11:20 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4bB23C2KMKzyTF;
 Mon,  2 Jun 2025 20:11:19 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id RyoEwIVJ5yHU; Mon,  2 Jun 2025 20:11:18 +0200 (CEST)
Received: from [IPV6:2a02:2455:1858:e00:c6d3:21dc:a17f:42be] (unknown
 [IPv6:2a02:2455:1858:e00:c6d3:21dc:a17f:42be])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4bB23B0B0DzySg;
 Mon,  2 Jun 2025 20:11:17 +0200 (CEST)
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
X-Inumbo-ID: fb8f8a25-3fdc-11f0-b894-0df219b8e170
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=tu-postout21; t=1748887878; bh=xFEbZ8xtgjmVRJg/XWv4y5j1rCjH9a
	WD7HGyeBIkrR4=; b=DK1lD5ylKJUoqd4/Xgvkddy9JcehvR89/NCV4kcW8cCM6u
	Ud5Wg6m43NNlwxESNpUzkbP/ehO/wozwv+hOf5HPCX1QZsm56Kh7h1a6Pkge6yp7
	RCPbpSRhJQ8Auhvlcti/L03qz2E/WHp4eT5Z2/QSIS2V5IYLvBh/RDQLsEqVUCRK
	pOI2YEYb8Gra02ED28N7UbXRcKXd3jDgsJJWnMv4uzzskQw/D09qhWmnzuH4N6X0
	ZzRepwHkHZlU6Qj2tnSTpz+aWQ54pwx4R6Vllp9/zcaFjikA+7U4XZgGej/PYqKO
	PFbj5I/lzFPqrYUweDu/4lH2pUWo1cavR0A3bBSg==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level:
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
 LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001,
 LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001,
 LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_SUBJ_FW_RE=0.001,
 LRZ_UA_MOZ=0.001] autolearn=no autolearn_force=no
Message-ID: <1cf78023-69cf-405f-9678-a3e60d594650@tum.de>
Date: Mon, 2 Jun 2025 20:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nullptr dereference in nested VMX when shadow VMCS support is
 available
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>
 <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
 <21dcca4d-1c51-42f1-b73b-65702451de13@suse.com>
 <26f412e2-ba65-4e3f-8c5f-7e15f5f32491@tum.de>
 <cf307474-8404-41db-8fc5-8084b8671584@suse.com>
Content-Language: en-US
From: Manuel Andreas <manuel.andreas@tum.de>
Autocrypt: addr=manuel.andreas@tum.de; keydata=
 xjMEY9Zx/RYJKwYBBAHaRw8BAQdALWzRzW9a74DX4l6i8VzXGvv72Vz0qfvj9s7bjBD905nN
 Jk1hbnVlbCBBbmRyZWFzIDxtYW51ZWwuYW5kcmVhc0B0dW0uZGU+wokEExYIADEWIQQuSfNX
 11QV6exAUmOqZGwY4LuingUCY9Zx/QIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKpkbBjgu6Ke
 McQBAPyP530S365I50I5rM2XjH5Hr9YcUQATD5dusZJMDgejAP9T/wUurwQSuRfm1rK8cNcf
 w4wP3+PLvL+J+kuVku93CM44BGPWcf0SCisGAQQBl1UBBQEBB0AmCAf31tLBD5tvtdZ0XX1B
 yGLUAxhgmFskGyPhY8wOKQMBCAfCeAQYFggAIBYhBC5J81fXVBXp7EBSY6pkbBjgu6KeBQJj
 1nH9AhsMAAoJEKpkbBjgu6Kej6YA/RvJdXMjsD5csifolLw53KX0/ElM22SvaGym1+KiiVND
 AQDy+y+bCXI+J713/AwLBsDxTEXmP7Cp49ZqbAu83NnpBQ==
In-Reply-To: <cf307474-8404-41db-8fc5-8084b8671584@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 17:42, Jan Beulich wrote:

>>>> This is possible when:
>>>>
>>>>    1. The malicious domain has nested HVM capabilities.
>>>>    2. The CPU is running on top of VMX and supports shadow VMCS.
>>>>
>>>> To trigger the bug, the domain must first enable VMX operation for
>>>> itself, execute VMXON and then finally execute VMPTRLD on a guest
>>>> physical address that is backed by a non-writable p2m mapping.
>>>> In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen
>>>> will check whether or not this mapping is suitable for writing and if
>>>> not immediately unmap the nested VMCS again and abort the setup of
>>>> `nvcpu->nv_vvmcx`. However, Xen at this point erroneously continues
>>>> emulation of the VMPTRLD. In particular, if VMCS shadowing is available,
>>>> Xen will nonetheless attempt to link up the nested VMCS to its own VMCS
>>>> in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to
>>>> dereference the presumably mapped nested VMCS (which now is merely a
>>>> NULL pointer) in order to mark it as a shadow VMCS by applying the
>>>> `VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page
>>>> fault handler will panic Xen.
>>>>
>>>> I've attached an XTF reproducer that triggers the bug. To setup such a
>>>> non-writable p2m mapping for the malicious VMCS, I first setup an
>>>> appropriate grant table entry. I've tested it on Xen version 4.20.0.
>>> I expect this to not work anymore on current staging or 4.20.1-pre.
>>> See a8325f981ce4 ("x86/P2M: synchronize fast and slow paths of
>>> p2m_get_page_from_gfn()").
>> On first glance I don't see how that would impact the type of the
>> established p2m mapping.
> Thing is that with said change grant mappings will cause
> hvm_map_guest_frame_rw() to simply fail, rather than returning a r/o
> mapping for r/o grant entries.
I see, that makes sense. Thanks for the clarification!

Best,
Manuel

