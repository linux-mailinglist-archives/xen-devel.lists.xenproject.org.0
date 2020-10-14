Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBE28E388
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6788.17880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSizK-0008OA-8g; Wed, 14 Oct 2020 15:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6788.17880; Wed, 14 Oct 2020 15:46:50 +0000
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
	id 1kSizK-0008Nl-5b; Wed, 14 Oct 2020 15:46:50 +0000
Received: by outflank-mailman (input) for mailman id 6788;
 Wed, 14 Oct 2020 15:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kSizI-0008NZ-2Q
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:46:48 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99fe849d-6377-43b1-8647-ead3e7699135;
 Wed, 14 Oct 2020 15:46:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b127so33360wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:46:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h7sm5615881wrt.45.2020.10.14.08.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:46:45 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kSizI-0008NZ-2Q
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:46:48 +0000
X-Inumbo-ID: 99fe849d-6377-43b1-8647-ead3e7699135
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 99fe849d-6377-43b1-8647-ead3e7699135;
	Wed, 14 Oct 2020 15:46:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b127so33360wmb.3
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gxmd6tf1v9v8jlG0vzr7wvhJT2iN4CIhQtbCXla3r/4=;
        b=ZFdVg65YEyB8R8ufh3Pdwziy1mEiZqwmCdawDgtCWQjtkzx/jAmOxNZRVsXzE8NDzH
         hTA9GZrFe2xxezhDLW0AAh6fMtw1dEi5Fkox0xwLO3yFDA1l3TPUdyMOzu5E5VVUIXXs
         RBRpt6yna+mPQ6AupqgpFcFIjGlGeaHHUk99wYbkBFq9Uo5qrLvWiLaAuf3Uetp+tDAD
         C3weBCrQ8PAYNnx9JdBSN5aYjX1TKKAGopMT5bsVWzekdccNRK43Cb/XvPf41BUa0DaY
         vNsAfY5W5hC2gsYfuKOmRuAdqZEQwoGVcw+5NY10D/ftuynO+xsGFrdVbaOrmWX4eUZz
         MbGQ==
X-Gm-Message-State: AOAM532+6OPXA9vifaYpMTi2oDA/Zt60Q53YuonWcDGZrgjkYfidbZCC
	ek80k185Q12nkChaZJwqL/k=
X-Google-Smtp-Source: ABdhPJyokHUVvvNJnXbUj7VNqoqJdrsk3QVEYx9ef4IqIZs00axHw3LaJ0i/WmClG1AB5I5UYfg2ag==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr32081wmj.141.1602690406494;
        Wed, 14 Oct 2020 08:46:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id h7sm5615881wrt.45.2020.10.14.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:46:45 -0700 (PDT)
Date: Wed, 14 Oct 2020 15:46:44 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen-detect: make CPUID fallback CPUID-faulting aware
Message-ID: <20201014154644.ea63gzu7m3lqbrff@liuwe-devbox-debian-v2>
References: <6b594869-1c64-93a3-7f19-f7374b62eeee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b594869-1c64-93a3-7f19-f7374b62eeee@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 14, 2020 at 05:23:23PM +0200, Jan Beulich wrote:
> Relying on presence / absence of hypervisor leaves in raw / escaped
> CPUID output cannot be used to tell apart PV and HVM on CPUID faulting
> capable hardware. Utilize a PV-only feature flag to avoid false positive
> HVM detection.
> 
> While at it also short circuit the main detection loop: For PV, only
> the base group of leaves can possibly hold hypervisor information.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

