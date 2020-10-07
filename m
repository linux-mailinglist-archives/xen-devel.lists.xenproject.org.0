Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF726285DDD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 13:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3440.9897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7LL-0000uq-8d; Wed, 07 Oct 2020 11:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3440.9897; Wed, 07 Oct 2020 11:10:47 +0000
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
	id 1kQ7LL-0000uR-5Y; Wed, 07 Oct 2020 11:10:47 +0000
Received: by outflank-mailman (input) for mailman id 3440;
 Wed, 07 Oct 2020 11:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQ7LK-0000uM-2e
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:10:46 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eb58c09-d92d-41a7-b15c-b11c3ff66c28;
 Wed, 07 Oct 2020 11:10:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1663691wrp.10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 04:10:45 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o14sm2289271wmc.36.2020.10.07.04.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 04:10:43 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mlZt=DO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQ7LK-0000uM-2e
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:10:46 +0000
X-Inumbo-ID: 9eb58c09-d92d-41a7-b15c-b11c3ff66c28
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9eb58c09-d92d-41a7-b15c-b11c3ff66c28;
	Wed, 07 Oct 2020 11:10:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1663691wrp.10
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 04:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ynFyq2KGNcjPWVqbajZNB1n/z5Dl+CaD2IPMkheUkO0=;
        b=C9sboVPjmqDHb6OrcYiDPf6mlvpjLv49aYLRZy92ZLWNatURVxJhRXCRttWvmlzPrI
         aclsRwss/7LTzHS6ZgdmnnFyKrewuhAujs+NqTt6ITEzTgvQqHvZvqlrGK6huituhwpK
         MOufD03xSq9g8LhYkDKXl7n/ioNNNICyhyLXYbOFkvX9AG38FTCl40dT6I8PBd0p/kMW
         Tlm6yUU8/ldIePM8xzbx3pqjiQY0kA/XZf3iwek533Ph2Oini+E3aST/AUCx0v/fwS5C
         vTAV8iY7tWbiCl2rPiV8K3PGehHme4mTsQrpsIdQIUEGFWKwBgMWz8KYpbSB/cEAHNpw
         C7TA==
X-Gm-Message-State: AOAM533tE7Fq15FEjrySFUWaI1TGGMJe/r744iyYr/KTQuoXh3yf4wcn
	Fc9aHVOoaqYJOifj9uJ+XJ0=
X-Google-Smtp-Source: ABdhPJzIgQ89z8kXlTbjXGCncMSCpv5pPfyBz9b7VwUNzw+LPWdtAg0Nt0u699JmditVbQiHjmuHQQ==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr2924637wrv.30.1602069044317;
        Wed, 07 Oct 2020 04:10:44 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o14sm2289271wmc.36.2020.10.07.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 04:10:43 -0700 (PDT)
Date: Wed, 7 Oct 2020 11:10:42 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Message-ID: <20201007111042.2vbyppns6yef55nf@liuwe-devbox-debian-v2>
References: <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
 <78C4CCD0-403B-4670-A2C2-C1BB2AD498FD@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78C4CCD0-403B-4670-A2C2-C1BB2AD498FD@arm.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 07, 2020 at 11:03:37AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 2 Oct 2020, at 13:12, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 02.10.2020 12:42, Bertrand Marquis wrote:
> >> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
> >> 
> >> This is removing the dependency to xen subdirectory preventing using a
> >> wrong configuration file when xen subdirectory is duplicated for
> >> compilation tests.
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > 
> > (but more for the slight tidying than the purpose you name)
> 
> Ping: Could this be pushed ?
> 

Done.

