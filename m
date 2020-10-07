Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89679285CF2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3411.9813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6md-0004fB-Hd; Wed, 07 Oct 2020 10:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3411.9813; Wed, 07 Oct 2020 10:34:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6md-0004em-EL; Wed, 07 Oct 2020 10:34:55 +0000
Received: by outflank-mailman (input) for mailman id 3411;
 Wed, 07 Oct 2020 10:34:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQ6mb-0004eh-Uz
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:34:53 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bda542e0-ec04-4a18-9872-e2c8b0647df9;
 Wed, 07 Oct 2020 10:34:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k18so1759909wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:34:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w11sm1610663wrn.27.2020.10.07.03.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:34:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQ6mb-0004eh-Uz
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:34:53 +0000
X-Inumbo-ID: bda542e0-ec04-4a18-9872-e2c8b0647df9
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bda542e0-ec04-4a18-9872-e2c8b0647df9;
	Wed, 07 Oct 2020 10:34:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k18so1759909wmj.5
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 03:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GsmpmQ8iRPAZ/finHj9qx+zPldlNPPFEeNURkdcky4c=;
        b=m6urFejpmxCyGBNIuRyWnjut4d0jBMSLRu5YonVv/29badXI7vZI5owP2r/svQnIas
         TnrMRXwf0ev5Cm8x4Umb/K2M/MZ1Fe6B+jt+zPbPWEmDOfw9mlyrBIFVAM7JRU++jAMu
         cxz3oLUDv7NvceBYHUkVvykIvEw5RI3UYfYJ+5i7A5SwijiZGoRvUk60OMftiIKxMM6k
         H0sbJYHDMkiXvDp9RWeHmYTl8jHJQA+ztvMW1K0Uf8pqK7pbtL79yO5WaI3IPjZzrFPk
         erMC+Ea6PCvYSByBYPmJ2rlKVJU8lOyJNnV7jRP5m754v1PUlMUsLD8P1b4RsRkblv0P
         t7wA==
X-Gm-Message-State: AOAM530e54sP1chTPKAenc/qPODuNOU2/oMwkObVrEV68yQHO5XOAPLO
	Qcl6x76bZi0UrqNjVSr+ZIU=
X-Google-Smtp-Source: ABdhPJzTib7Sv0zS7dNDDGn2TOGoGwXi1b4RWxRAN2KCorYTMApBFqsLCdq4I8R9P3nx9OLuzza25w==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr2537102wmj.101.1602066892043;
        Wed, 07 Oct 2020 03:34:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id w11sm1610663wrn.27.2020.10.07.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:34:50 -0700 (PDT)
Date: Wed, 7 Oct 2020 10:34:49 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/3] tools/init-xenstore-domain: support xenstore pvh
 stubdom
Message-ID: <20201007103449.h6sfj3yhuxbvvqaa@liuwe-devbox-debian-v2>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-3-jgross@suse.com>
 <20200930154611.xqzdumwec7nlnidl@liuwe-devbox-debian-v2>
 <baa915a8-bd96-4669-dfa1-1e4e09024493@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baa915a8-bd96-4669-dfa1-1e4e09024493@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 07, 2020 at 08:54:43AM +0200, Jürgen Groß wrote:
> On 30.09.20 17:46, Wei Liu wrote:
> > On Wed, Sep 23, 2020 at 08:45:40AM +0200, Juergen Gross wrote:
> > > Instead of creating the xenstore-stubdom domain first and parsing the
> > > kernel later do it the other way round. This enables to probe for the
> > > domain type supported by the xenstore-stubdom and to support both, pv
> > > and pvh type stubdoms.
> > > 
> > > Try to parse the stubdom image first for PV support, if this fails use
> > > HVM. Then create the domain with the appropriate type selected.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > [...]
> > > +    dom->container_type = XC_DOM_HVM_CONTAINER;
> > > +    rv = xc_dom_parse_image(dom);
> > > +    if ( rv )
> > > +    {
> > > +        dom->container_type = XC_DOM_PV_CONTAINER;
> > > +        rv = xc_dom_parse_image(dom);
> > > +        if ( rv )
> > > +        {
> > > +            fprintf(stderr, "xc_dom_parse_image failed\n");
> > > +            goto err;
> > > +        }
> > > +    }
> > > +    else
> > > +    {
> > > +        config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> > > +        config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
> > > +        dom->target_pages = mem_size >> XC_PAGE_SHIFT;
> > > +        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
> > > +        dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> > > +                          LAPIC_BASE_ADDRESS : mem_size;
> > > +        dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> > > +                           GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
> > > +        dom->mmio_start = LAPIC_BASE_ADDRESS;
> > > +        dom->max_vcpus = 1;
> > > +        e820[0].addr = 0;
> > > +        e820[0].size = dom->lowmem_end;
> > > +        e820[0].type = E820_RAM;
> > > +        e820[1].addr = LAPIC_BASE_ADDRESS;
> > > +        e820[1].size = dom->mmio_size;
> > > +        e820[1].type = E820_RESERVED;
> > > +        e820[2].addr = GB(4);
> > > +        e820[2].size = dom->highmem_end - GB(4);
> > 
> > Do you not want to check if highmem_end is larger than GB(4) before
> > putting in this region?
> 
> Oh, just realized: further down I'm setting the guest's map with either
> 2 or 3 entries depending on dom->highmem_end value.
> 
> So I think this is fine.
> 

Fair enough.

Acked-by: Wei Liu <wl@xen.org>

Wei.

> 
> Juergen
> 

