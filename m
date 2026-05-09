Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L4qGpxo/2nQ6AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 19:02:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7650099A
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 19:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304888.1577571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLl2v-0002wA-Qo; Sat, 09 May 2026 17:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304888.1577571; Sat, 09 May 2026 17:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLl2v-0002tC-KX; Sat, 09 May 2026 17:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1304888;
 Sat, 09 May 2026 17:00:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wLl2t-0002t6-Un
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 17:00:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLl2s-001bV2-VQ
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 19:00:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69ff6830-2eae-0a2a0a5409dd-0a2a45048f3a-26
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 19:00:54 +0200
Received: from [209.85.222.180] (helo=mail-qk1-f180.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69ff6845-1dec-0a2a45040019-d155deb4a4ee-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 19:00:54 +0200
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8dbbc6c16b2so404700585a.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 10:00:54 -0700 (PDT)
Received: from ziepe.ca
 (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net.
 [47.54.130.67]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c91c807sm2841885185a.32.2026.05.09.10.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 10:00:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wLl2p-00000001ptR-0bDu;
 Sat, 09 May 2026 14:00:51 -0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=ziepe.ca header.i="@ziepe.ca" header.h="In-Reply-To:Content-Disposition:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778346053; x=1778950853; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRop8m7XaImUSxbpG/XbxbRCDh4G22WGRyOV4N0sJrU=;
        b=QISdGVENNJWF3WqynFWR9xj5ZY6K/dgoKEJvvh39m+ZOTOFpw/G31Xz7jZTqf2YMe8
         MR0kttlI4rmvboJKaxANkjBqlm8q7zupdVsEpiRn1lPuwX2hOs+uzz0MRoQL2+vv34qU
         ZSKMPd+xZkvob5u+vwfIFdJMzlPXFaY7f8wb34X2qCEUHBxdgVsMbUNg/lIoZoivTBGy
         Sad0AmzxZq3UGNJbpFfNCHDSHcEhdrybJTce1szDpi7wSbqQnZ9Nb26+lHjnbl4k770U
         hNuPCUJTt7g1Yt/rVAWwHeoiyOrelxoHwl9K41hmCRXQ6E1alqHf+GYONs33zH1SIAYL
         vzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346053; x=1778950853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRop8m7XaImUSxbpG/XbxbRCDh4G22WGRyOV4N0sJrU=;
        b=cnpyIWjDbYGVwgoPSlMYuAOnI4tMy+0+KRIa967aXNlxvNJPLP2NLiiZyQNlHiaA0p
         T2S4PRNiqwwc25awUH5P0FgTULynOr4uPMb7mU61AKyTwf7TRRUsxlfuY70CU+AhyuxF
         kR0GL/DMSqgZc+d36kYzRJdVWryhQtLDkJefw2GCl2v4kMyB57Ah9wjqzl/pO2ZeguWk
         2AjbcbL0cfwmDIlnpNFwBzgt9JfqklRPRxnIeXGzIvOFNiZ/M9KfOalpLsoNi+5kf6qO
         jcJOP/X/WqLvXMI3NVUdWn/uOw69UAn1VnDCvqW4L69CbS1SKij8q2IbaY4rRDKi4t6X
         BAjA==
X-Forwarded-Encrypted: i=1; AFNElJ/HP+8ua7sEMp5YrkBs+6Fsqdp4qHOmem0nYdRWcJrGjeSZVWctcc/s2fHUK9HWwSLKR0RiYKwx1R0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/UDbne6YoBr46onHakO0VcbzH9ACmWTJd8cfYzDtVUP5cLk1A
	w9Gi0njCqslJz2S9+m41IkR7wqZO890kLq6FsM0ObwAKG7kIM+RwZ1eaeedSO8bNHMg=
X-Gm-Gg: Acq92OFdmqNrvw15F6YnDZ830pRAwR9fHd7o46C2QBCj8PWEYJcL0iwpiO9s41ggxJf
	AqYV4ZsKCOHEaFinRATRcXIxYtxEFPf/8pwDvwUfVTqd9cviSffNVFUuILLckseO9cfYCg93K91
	lmXxjpX8HkzqrO/z4B+6I50Hcy1eNYajlTvlEP9LnJxox5v4/Lkgael2wz/aOWTnTYs0Kj1ime9
	5Qh9G5T/UeSaXl6b36krMamZJeswDAPjwoTFN934bUvxsWTsHE5UMyo7Ud/vzK6dwCanQI68Q4T
	XmgpiarHfylNhcWZw/MqYINIM+lJ9SWJ3BxW5lJ7+wKj8LzcxHGtSKojeZSXobB3OWDMioM8jb6
	OiTDXJnlrmpDY5Lw+NM8OSw3QYUGjo288wHutCBv+HkHgynn10NRnl+qc4n6YqVjMdBnrUmIuJP
	EdhhhbneITpRQwiu9TgjqihSeYoSYPHRjlZ/Ez5mQJU0lrdQU0NdgEQY0SUkm7+MjHnYWsYAKYG
	cL0WA==
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr1667325985a.44.1778346053103;
        Sat, 09 May 2026 10:00:53 -0700 (PDT)
Date: Sat, 9 May 2026 14:00:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: How to express "externally managed" IOMMU domains for
 VFIO/IOMMUFD ?
Message-ID: <20260509170051.GD9285@ziepe.ca>
References: <1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@vates.tech>
 <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260426133027.GB3501894@ziepe.ca>
 <BN9PR11MB52768B5170F6CE558B0AC8AA8C3C2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52768B5170F6CE558B0AC8AA8C3C2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-purgate-ID: tlsNG-ebf023/1778346054-2A5603FF-95453907/0/0
X-purgate-type: clean
X-purgate-size: 2153
X-Rspamd-Queue-Id: B9E7650099A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,ziepe.ca:mid,ziepe.ca:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:teddy.astie@vates.tech,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 08:02:40AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Sunday, April 26, 2026 9:30 PM
> > 
> > On Thu, Apr 23, 2026 at 08:01:50AM +0000, Tian, Kevin wrote:
> > > > On Xen, we have a dedicated hypercalls for moving a device into another
> > > > guest (so it no longer belongs in Dom0, at far as DMA is concerned).
> > > >
> > > > But it looks like there are no way to describe that idea of "attach that
> > > > device to this VM" nor "the device is in a VM"; which makes that
> > > > impracticable.
> > > >
> > > > There may be things that could be done with the vIOMMU objects, but
> > > > there would be no "parent domain" in such case, as said earlier it
> > > > doesn't exist in the IOMMU subsystem.
> > > >
> > > > What is expected to be done instead ?
> > > >
> > > > Teddy
> > > >
> > > > [1] https://www.youtube.com/watch?v=pLMGRgEJ-Eg
> > > >
> > >
> > > It'd be much easier to collect comments if you can put plain words
> > > to explain the problem rather than expecting other folks to watch
> > > the video first...
> > 
> > It sounds like CC and pkvm to me so I think it should re-use those
> > mechanisms..
> > 
> 
> for CC and pkvm the guest memory is still allocated from host.

From an iommu perspective that doesn't entirely matter, what it sees
is that the translation is controlled by some secure world and it
only needs a way to associate the kvm handle for the secure world with
any required call for configuring the viommu.

It is not very different from KVM installing encrypted pages that have
been completed unmapped from all page tables in the hypervisor into
the VM's secure EPT through TDX calls and then iommufd creating a
viommu that re-uses the secure EPT.

The only thing dealing with the memory map is KVM. I'd expect Xen to
work the same, however the invisible memory was affiliated with the VM
through KVM the iommu side should pick up the KVM and then request a
VIOMMU to be setup for the VFIO device on the target KVM and that
should trigger the hypercalls to move the device into the selected
guest.

Jason

