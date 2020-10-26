Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656829919F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12401.32286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4uS-0002QI-Hz; Mon, 26 Oct 2020 15:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12401.32286; Mon, 26 Oct 2020 15:59:48 +0000
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
	id 1kX4uS-0002Pv-Ek; Mon, 26 Oct 2020 15:59:48 +0000
Received: by outflank-mailman (input) for mailman id 12401;
 Mon, 26 Oct 2020 15:59:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kX4uR-0002Pq-AZ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:59:47 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a231f8f2-9a30-4314-9927-513498c579b0;
 Mon, 26 Oct 2020 15:59:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j7so13196048wrt.9
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 08:59:45 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a3sm24261537wrh.94.2020.10.26.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 08:59:44 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kX4uR-0002Pq-AZ
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:59:47 +0000
X-Inumbo-ID: a231f8f2-9a30-4314-9927-513498c579b0
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a231f8f2-9a30-4314-9927-513498c579b0;
	Mon, 26 Oct 2020 15:59:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j7so13196048wrt.9
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KLQHujeknDHRw2OOFJwGw/YxyPHbgCfirQBM51Dl8uQ=;
        b=FIFP48+EfXofAB+5gtp7/Uz9HsycISUvD2Pv/jnRfzvg0hIu13k1B1KDRHGVCfViln
         gQV8ZWDAIgGip5KjcPL8uFPBdYBIEMM1CIOKzOYkM1zs7rxR7MMggapuZUDc8H8eoqNs
         FClSM6P12QoNMe6Vi+pjYi4C/QVonHo9e9uWVO+0SC8WGxKIMQdu8RGTBT01EkcSjbnN
         ucSy08M8KMjTWd2/CHTsdszw4n8WI60IBFl2e4da0bibTcDIMKVFJFCgrEw9JCConBT1
         XJu0/0iYb5Y+MnZTE4DGzwZcSQlawFLCeYiguIJ1uynQJimIG5o031iIIJmxJXnYtR3e
         UmPQ==
X-Gm-Message-State: AOAM531KuuaGhnslteCvYj1AH2FeZkfVeU+Ftu63osB59MBMig+YBNeU
	EfRjIAyEbjfkvCQxptZ7p/A=
X-Google-Smtp-Source: ABdhPJzidQ6TCBptpVg7zevTuXmVzifC9efFXiyZ15Qa1nhrhKIH9sqxy4JESEqoyVzq0+ELKrhXhw==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr18420442wrj.169.1603727984575;
        Mon, 26 Oct 2020 08:59:44 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id a3sm24261537wrh.94.2020.10.26.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2020 15:59:42 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: don't open-code vmap_to_mfn()
Message-ID: <20201026155942.d3f2vxrspyexye2v@liuwe-devbox-debian-v2>
References: <d1aeb904-6ae1-2ca8-220a-920f2be5416d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1aeb904-6ae1-2ca8-220a-920f2be5416d@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Oct 26, 2020 at 04:53:58PM +0100, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

