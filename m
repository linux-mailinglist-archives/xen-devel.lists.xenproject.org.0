Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1529F2C8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14355.35587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBXM-0002T6-LT; Thu, 29 Oct 2020 17:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14355.35587; Thu, 29 Oct 2020 17:16:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBXM-0002Sf-HN; Thu, 29 Oct 2020 17:16:32 +0000
Received: by outflank-mailman (input) for mailman id 14355;
 Thu, 29 Oct 2020 16:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
 id 1kYBDl-0008Js-CV
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:56:17 +0000
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e661ee0-febb-40c4-9359-9d5e833adb62;
 Thu, 29 Oct 2020 16:56:15 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id q1so3750861ilt.6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:56:15 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id r12sm2584639ilm.28.2020.10.29.09.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 09:56:14 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
	id 1kYBDl-0008Js-CV
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:56:17 +0000
X-Inumbo-ID: 7e661ee0-febb-40c4-9359-9d5e833adb62
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7e661ee0-febb-40c4-9359-9d5e833adb62;
	Thu, 29 Oct 2020 16:56:15 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id q1so3750861ilt.6
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=46u7k16lmtR7tMf5v+7fbJj/BQNg8vF1V9HFBp6hYFg=;
        b=TO+GpLM6LycPQoMwryo9xUQRLiEvWYgbGjKPlPQ6JQhAIVJlLxzOsJaEhiiNlylpPU
         rGt9Uq2jE226wycKVWSpG3npnQmZoU8s5A0MHGd4XSgMb8BejsiG/VnzNhIPy8QMD2Z2
         F7IuQvFLeFbghxG3CEhpvXe2WzK8pXgSdiSab7Hx7KATccJNuio5nWAfuBEIbjKsp7Jl
         57A4/cWqICjr/T8wosnkqI/KIZt/A6xx/E5Z8Ir2VJXwueycsYLO4vaFWXcEsKYYZcWb
         Jn/3mLxoII+jzekPaOQFJui7oYC1wE6ekbWbnMCmXPVPkacWmJDSEidjIcgzxSpyLhaA
         1ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=46u7k16lmtR7tMf5v+7fbJj/BQNg8vF1V9HFBp6hYFg=;
        b=snBJZKiUQ4dTvYdWXyl357GUfYGRIFPG7eST1O+WZ6D74eGEb3QSrcGVf+hvhjjoO6
         KF66OK3GF6URwK4vv2N06NJT2N00G0QRfKgcs5XL/brvfiYr93MoDEQsPgkp1Q1ClnVl
         IwrxKwBd5S9P3Y4XBrCdk9eIpIse8ZIOBVFrzMxtf70vcViHzgHUu5y11GH/CGsIPDtB
         GwV7PtcVZjS3XlLV+IHGeIn9xwLqKBe86u9710RWRQwpPLbfel51gKw3izBUoUFZYaN1
         13iEkgo2QFclP6TgqhFh3YjjqSOSaEfs8p2aFurcc6b8hRO31jxncEuC3UlzpX6+qXQS
         s23Q==
X-Gm-Message-State: AOAM533Yz0JaJpKcxS8VTzG0GqEXbOzeYTTFnFrOD0u8pk/yPmjCesJF
	J0ftWt7j5sDqDrPcbAMWznU=
X-Google-Smtp-Source: ABdhPJw9DVYgoIwqL5pROZm1JBXSItTI0Ey8t6jCLCnyLj0KmL714RaHercqOegkYMBCGEVvAtY/7g==
X-Received: by 2002:a05:6e02:2cc:: with SMTP id v12mr4099654ilr.115.1603990575376;
        Thu, 29 Oct 2020 09:56:15 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id r12sm2584639ilm.28.2020.10.29.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 09:56:14 -0700 (PDT)
Sender: Arvind Sankar <niveditas98@gmail.com>
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Thu, 29 Oct 2020 12:56:11 -0400
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Arnd Bergmann' <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Message-ID: <20201029165611.GA2557691@rani.riverdale.lan>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>

On Thu, Oct 29, 2020 at 03:05:31PM +0000, David Laight wrote:
> From: Arnd Bergmann
> > Sent: 28 October 2020 21:21
> > 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > There are hundreds of warnings in a W=2 build about a local
> > variable shadowing the global 'apic' definition:
> > 
> > arch/x86/kvm/lapic.h:149:65: warning: declaration of 'apic' shadows a global declaration [-Wshadow]
> > 
> > Avoid this by renaming the global 'apic' variable to the more descriptive
> > 'x86_system_apic'. It was originally called 'genapic', but both that
> > and the current 'apic' seem to be a little overly generic for a global
> > variable.
> > 
> > Fixes: c48f14966cc4 ("KVM: inline kvm_apic_present() and kvm_lapic_enabled()")
> > Fixes: c8d46cf06dc2 ("x86: rename 'genapic' to 'apic'")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > v2: rename the global instead of the local variable in the header
> ...
> > diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
> > index 284e73661a18..33e2dc78ca11 100644
> > --- a/arch/x86/hyperv/hv_apic.c
> > +++ b/arch/x86/hyperv/hv_apic.c
> > @@ -259,14 +259,14 @@ void __init hv_apic_init(void)
> >  		/*
> >  		 * Set the IPI entry points.
> >  		 */
> > -		orig_apic = *apic;
> > -
> > -		apic->send_IPI = hv_send_ipi;
> > -		apic->send_IPI_mask = hv_send_ipi_mask;
> > -		apic->send_IPI_mask_allbutself = hv_send_ipi_mask_allbutself;
> > -		apic->send_IPI_allbutself = hv_send_ipi_allbutself;
> > -		apic->send_IPI_all = hv_send_ipi_all;
> > -		apic->send_IPI_self = hv_send_ipi_self;
> > +		orig_apic = *x86_system_apic;
> > +
> > +		x86_system_apic->send_IPI = hv_send_ipi;
> > +		x86_system_apic->send_IPI_mask = hv_send_ipi_mask;
> > +		x86_system_apic->send_IPI_mask_allbutself = hv_send_ipi_mask_allbutself;
> > +		x86_system_apic->send_IPI_allbutself = hv_send_ipi_allbutself;
> > +		x86_system_apic->send_IPI_all = hv_send_ipi_all;
> > +		x86_system_apic->send_IPI_self = hv_send_ipi_self;
> >  	}
> > 
> >  	if (ms_hyperv.hints & HV_X64_APIC_ACCESS_RECOMMENDED) {
> > @@ -285,10 +285,10 @@ void __init hv_apic_init(void)
> >  		 */
> >  		apic_set_eoi_write(hv_apic_eoi_write);
> >  		if (!x2apic_enabled()) {
> > -			apic->read      = hv_apic_read;
> > -			apic->write     = hv_apic_write;
> > -			apic->icr_write = hv_apic_icr_write;
> > -			apic->icr_read  = hv_apic_icr_read;
> > +			x86_system_apic->read      = hv_apic_read;
> > +			x86_system_apic->write     = hv_apic_write;
> > +			x86_system_apic->icr_write = hv_apic_icr_write;
> > +			x86_system_apic->icr_read  = hv_apic_icr_read;
> >  		}
> 
> For those two just add:
> 	struct apic *apic = x86_system_apic;
> before all the assignments.
> Less churn and much better code.
> 

Why would it be better code?

