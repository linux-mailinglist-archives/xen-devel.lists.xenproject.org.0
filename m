Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0C6FB941
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 23:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531923.827895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw8Ff-0001xI-Ap; Mon, 08 May 2023 21:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531923.827895; Mon, 08 May 2023 21:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw8Ff-0001uY-7E; Mon, 08 May 2023 21:18:35 +0000
Received: by outflank-mailman (input) for mailman id 531923;
 Mon, 08 May 2023 21:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkai=A5=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1pw8Fe-0001uS-Ch
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 21:18:34 +0000
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a80f5a-ede5-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 23:18:33 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-52c30fbccd4so4605531a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 May 2023 14:18:33 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 c35-20020a631c23000000b00513ec871c01sm6699252pgc.16.2023.05.08.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:18:31 -0700 (PDT)
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
X-Inumbo-ID: e2a80f5a-ede5-11ed-b226-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683580712; x=1686172712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9LwMl3SaVI5b8sezFDQVcUBEvYrPsuHk5i8fgGhI70=;
        b=dRQ1o2a4swNAtvDeAqk3PDLdsymy1sdiyBuuLqn4CboEusFBPZexHSnnvjPJTWgSpe
         zCUqFQyMIf7rkb+qBz8Mtte+Vz8mQkmmq7vXnaLN5oZsrYJwtyAVg+VUGMkLrYXajkNE
         uIsTfxF5YT05vwcRwaMFAkIpVT0rseiBwvSF6CV34GHSdhL06ypC+eLcPa3lHEUbP+9j
         Cf8iip0ZU9V91tJdIE+PXW46H7ug0NcQnbIuYU/a6Y402qJ3gRakFK7jkNrp6kuVd+Zv
         sV+u6DrSu9+P+c77oK+FC7CesSPowOxXqDHIzVn+1/ZwY5cMU/Jeidz5CxnY/g9q8Ipg
         BcIg==
X-Gm-Message-State: AC+VfDxieX762xRAOk/wOH6GIjUGYXkBABinObUxujFviZSMMZidKtL0
	9TfMQfFBwtqHb+jRKFpTL8g=
X-Google-Smtp-Source: ACHHUZ6kteuJnNZnZsRe+bisWrFQUndJSqajeCoEM2/rFLcMVskwkNxu1jPZifG3ayQwvJCBSdGnnA==
X-Received: by 2002:a05:6a20:1591:b0:f0:ec64:f3de with SMTP id h17-20020a056a20159100b000f0ec64f3demr15058351pzj.25.1683580711711;
        Mon, 08 May 2023 14:18:31 -0700 (PDT)
Date: Mon, 8 May 2023 21:18:29 +0000
From: Wei Liu <wei.liu@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Alexander Graf <graf@amazon.com>,
	Forrest Yuan Yu <yuanyu@google.com>,
	James Morris <jamorris@linux.microsoft.com>,
	John Andersen <john.s.andersen@intel.com>,
	Liran Alon <liran.alon@oracle.com>,
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
	Marian Rotariu <marian.c.rotariu@gmail.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>,
	=?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Will Deacon <will@kernel.org>,
	Zahra Tarkhani <ztarkhani@microsoft.com>,
	=?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>,
	dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v1 6/9] KVM: x86: Add Heki hypervisor support
Message-ID: <ZFlnJRsJh2fX3IJb@liuwe-devbox-debian-v2>
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-7-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505152046.6575-7-mic@digikod.net>

On Fri, May 05, 2023 at 05:20:43PM +0200, Mickaël Salaün wrote:
> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> 
> Each supported hypervisor in x86 implements a struct x86_hyper_init to
> define the init functions for the hypervisor.  Define a new init_heki()
> entry point in struct x86_hyper_init.  Hypervisors that support Heki
> must define this init_heki() function.  Call init_heki() of the chosen
> hypervisor in init_hypervisor_platform().
> 
> Create a heki_hypervisor structure that each hypervisor can fill
> with its data and functions. This will allow the Heki feature to work
> in a hypervisor agnostic way.
> 
> Declare and initialize a "heki_hypervisor" structure for KVM so KVM can
> support Heki.  Define the init_heki() function for KVM.  In init_heki(),
> set the hypervisor field in the generic "heki" structure to the KVM
> "heki_hypervisor".  After this point, generic Heki code can access the
> KVM Heki data and functions.
> 
[...]
> +static void kvm_init_heki(void)
> +{
> +	long err;
> +
> +	if (!kvm_para_available())
> +		/* Cannot make KVM hypercalls. */
> +		return;
> +
> +	err = kvm_hypercall3(KVM_HC_LOCK_MEM_PAGE_RANGES, -1, -1, -1);

Why not do a proper version check or capability check here? If the ABI
or supported features ever change then we have something to rely on?

Thanks,
Wei.

