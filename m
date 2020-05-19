Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BE1DA5B5
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:39:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBpM-0007hU-9y; Tue, 19 May 2020 23:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLmZ=7B=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jbBpK-0007hP-Tt
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:39:15 +0000
X-Inumbo-ID: f2b35126-9a29-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x834.google.com (unknown [2607:f8b0:4864:20::834])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2b35126-9a29-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 23:39:14 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id z18so1198822qto.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 16:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XEZQ7OYpVxyRqBV7t8uMteTmkrGbMYoCI/OeTqmbrJY=;
 b=aCcBTwGLdVSB7IFPcFD1/e9gg6W8dVc7fHHGFL2a2XokliWa356TaKDBzKgLXdpctH
 Mo6nEocpgYEZKTm9EgWpy2pt6fwOzBKTRIbxaRMmCTi63xWkM7ZmWDpwFdRhhX7ZPVnk
 EI9g66doi777brPkxhyx3k8mqoLyk8rJTfkdTG/9W18Z9yTWvROYvwlvcqCXtTg/nmL1
 /E20Q8y3eLcH4tpzMf6lmSc3gWMh33m1xlot6pUvDYRj212p2166fhprmD36aXZDKfQi
 AnQg9JJ+rAERGKEcTQHuEYuCFHBUDeaECQfXmc2ZsRVp+BKOIKww1uTGsgo7sCxeR+yO
 IQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XEZQ7OYpVxyRqBV7t8uMteTmkrGbMYoCI/OeTqmbrJY=;
 b=JtFFD3KcXisaGNnbl7PRsMkmIbFf5gsPb54a2/fl/BnQDzBfsOxKKvQmNLh/3Cn3M7
 sGbdED8xYUcvxx5GyCHlm/b/37oLzL+h1WyEAlEt5rCEs/vfMHgkVB/4WbrWx9IHHdsr
 XlD0xbvTtINh6F+a0tFE5gl2T639OeWL63kx2gTOiZPfvx2ETAinAVv8GNjG8krHE+nV
 zzl0DUQb/vPCah5LpQxj+ozouN6PluVawbZ/qOenMpI7kF1LJlr0GYXXY2+QUrJA/TOJ
 cN6gRPzFgap1D+y2yeeHTi+xCPz7mUlAsV07CGo7EpVeHgyaUngy0feiP5Mo3jyyuCxO
 Lixw==
X-Gm-Message-State: AOAM53016ANP+lZPI3ghUTQGRlYOW2kBPK8D5A2u0MrxrlgDKk7jCoE8
 iaoa7kuVQiHHPItnXWZ1ZFioc1CeqiJJXQ==
X-Google-Smtp-Source: ABdhPJz89Y7T87BKBrdCINIRM04ldnJTQowwJdg2ufyv3kaSOZ92HHS9vyScACkx9xrhBfuzaiFR3A==
X-Received: by 2002:ac8:3609:: with SMTP id m9mr2594942qtb.107.1589931553709; 
 Tue, 19 May 2020 16:39:13 -0700 (PDT)
Received: from piano ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id l184sm858490qke.115.2020.05.19.16.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 16:39:13 -0700 (PDT)
Date: Tue, 19 May 2020 18:39:11 -0500
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200519233911.GA22451@piano>
References: <20200429225108.GA54201@bobbye-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429225108.GA54201@bobbye-pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: michal.zygowski@3mdeb.com, daniel.kiper@oracle.com, ardb@kernel.org,
 krystian.hebel@3mdeb.com, olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 29, 2020 at 05:51:08PM -0500, Bobby Eshleman wrote:
> 
> # Option #1: PE/COFF and Shim
> 

... snip ...

> 
> # Option #3: Lean on Grub2's LoadFile2() Verification
> 

... snip ...

It's safe to say that the options boiled down to #1 and #3.  Seeing as how we
may not be able to start playing with the new Grub functionality for some time,
and also seeing as how the security properties of each approach are very
similar, I think that option #1 is probably the best path for what we are
looking to achieve in supporting UEFI SB.  With out any strong objections
against this, that'll be the path we start heading down (starting with Daniel's
patch set) and will be hoping to get upstream.

If possible, the implementation would support both SHIM_LOCK and LoadFile2(),
potentially by one falling back to other upon reporting a security violation,
or detecting the functionality provided by Grub in some manner...  but this
will be easier to evaluate after seeing how the LoadFile2() mechanism will
work.

If LoadFile2() proves itself a better approach, we would not be opposed to
moving in that direction when it is available.

I started joining community calls shortly after the intent of 'docs/design'
was discussed there.  Is this a change that merits a 'docs/design' RFC?

Best regards,
Bobby

