Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93A27EDBC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825.2815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNeJ7-0001pX-Cq; Wed, 30 Sep 2020 15:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825.2815; Wed, 30 Sep 2020 15:46:17 +0000
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
	id 1kNeJ7-0001p8-9V; Wed, 30 Sep 2020 15:46:17 +0000
Received: by outflank-mailman (input) for mailman id 825;
 Wed, 30 Sep 2020 15:46:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNeJ5-0001p3-Ic
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:46:15 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09d6399b-a258-40dd-afe6-10e8cb7a1679;
 Wed, 30 Sep 2020 15:46:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c18so2341399wrm.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:46:14 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l8sm3629498wrx.22.2020.09.30.08.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:46:13 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNeJ5-0001p3-Ic
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:46:15 +0000
X-Inumbo-ID: 09d6399b-a258-40dd-afe6-10e8cb7a1679
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 09d6399b-a258-40dd-afe6-10e8cb7a1679;
	Wed, 30 Sep 2020 15:46:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c18so2341399wrm.9
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7F54Ci7cgQ1naVpk2PDPBuaQFZElngFHUdH8Kw8+h1k=;
        b=BZg5xOADzOr4C8CUgkHDlN+nyoyN137EvnQgIPQrm0m7Yodrwics5pManOArgBpQmX
         vzKFXD5Zj64Ugud7c2TZEZXRn8ewMHbIr5unKkyYyjn2z1r+YBvvF/HCu2nAXr+mll86
         SCpbs9K27vTJujKDBBLQqAHHXik5AUEW2NIp0pGYFLWtdcgXGG8wk5Sw4IkqXy7OsIkz
         AruvUvXvczKRsgMsM8DgpSSjYxUf5QCyetWieI7j904qw6uyz33VuFOTixtQq/4D++4I
         TFax8CfP5Bzsf7eJ1pUsbWSOfkB7Le/Au4nFi6vatszYYoqWj4SvqeBTFKEHlNAsmqEx
         hEFA==
X-Gm-Message-State: AOAM532z/8sA32oTFvBHEk459+gTmYSfyeRtDmhXnn4tpytYftvFYZXV
	MXXG5cYZF++wMltl437hGN8=
X-Google-Smtp-Source: ABdhPJw3D5TwpQJcpO2wGAGUDdDd66HDvK/k8KWBPq4PDubfLjai4+7WNL57L2amBsswcHDlFcdRsA==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr3682108wrs.281.1601480773895;
        Wed, 30 Sep 2020 08:46:13 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id l8sm3629498wrx.22.2020.09.30.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:46:13 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:46:12 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] tools/init-xenstore-domain: support xenstore pvh
 stubdom
Message-ID: <20200930154611.xqzdumwec7nlnidl@liuwe-devbox-debian-v2>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923064541.19546-3-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 23, 2020 at 08:45:40AM +0200, Juergen Gross wrote:
> Instead of creating the xenstore-stubdom domain first and parsing the
> kernel later do it the other way round. This enables to probe for the
> domain type supported by the xenstore-stubdom and to support both, pv
> and pvh type stubdoms.
> 
> Try to parse the stubdom image first for PV support, if this fails use
> HVM. Then create the domain with the appropriate type selected.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
[...]
> +    dom->container_type = XC_DOM_HVM_CONTAINER;
> +    rv = xc_dom_parse_image(dom);
> +    if ( rv )
> +    {
> +        dom->container_type = XC_DOM_PV_CONTAINER;
> +        rv = xc_dom_parse_image(dom);
> +        if ( rv )
> +        {
> +            fprintf(stderr, "xc_dom_parse_image failed\n");
> +            goto err;
> +        }
> +    }
> +    else
> +    {
> +        config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> +        config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
> +        dom->target_pages = mem_size >> XC_PAGE_SHIFT;
> +        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
> +        dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> +                          LAPIC_BASE_ADDRESS : mem_size;
> +        dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> +                           GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
> +        dom->mmio_start = LAPIC_BASE_ADDRESS;
> +        dom->max_vcpus = 1;
> +        e820[0].addr = 0;
> +        e820[0].size = dom->lowmem_end;
> +        e820[0].type = E820_RAM;
> +        e820[1].addr = LAPIC_BASE_ADDRESS;
> +        e820[1].size = dom->mmio_size;
> +        e820[1].type = E820_RESERVED;
> +        e820[2].addr = GB(4);
> +        e820[2].size = dom->highmem_end - GB(4);

Do you not want to check if highmem_end is larger than GB(4) before
putting in this region?

> +        e820[2].type = E820_RAM;
> +    }

This hardcoded e820 map doesn't seem very flexible, but we
control the guest kernel anyway so I think this should be fine.

The rest of this patch looks okay to me.

Wei.

