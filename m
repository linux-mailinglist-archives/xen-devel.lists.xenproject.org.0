Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59523287773
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 17:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4505.11782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXtr-0002dL-Fx; Thu, 08 Oct 2020 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4505.11782; Thu, 08 Oct 2020 15:32:11 +0000
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
	id 1kQXtr-0002cw-Ce; Thu, 08 Oct 2020 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 4505;
 Thu, 08 Oct 2020 15:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQXtq-0002cr-1m
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:32:10 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04fc85e3-2f1c-4eba-a5f6-9e4a1247aad4;
 Thu, 08 Oct 2020 15:32:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5so7091562wrp.8
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:32:08 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a17sm7835694wra.29.2020.10.08.08.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 08:32:07 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQXtq-0002cr-1m
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:32:10 +0000
X-Inumbo-ID: 04fc85e3-2f1c-4eba-a5f6-9e4a1247aad4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 04fc85e3-2f1c-4eba-a5f6-9e4a1247aad4;
	Thu, 08 Oct 2020 15:32:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5so7091562wrp.8
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GFEvg+G8XLVTz8WQ66J6MfKtZsIj4/8kxVUZHxyvJoo=;
        b=GtUqY1LXbKJ/LPmgwO/IwRCbgBAZaBveDK2NMC0hyDCMzHW/AVEuB1/Gggf8Hu0dE2
         INCavHuOlS0QszovnbsGMTSBfgCtnT2tCicJoL7Zh8acXN5AulTyRuuC+pXmM1jHx26J
         ysDhJzRVWloruQIBVIuvxMRGRWYNj1e8HzbC+OiXf45yoCIPvq1mrvMiutiHa59eXF87
         AiDL6iH93i6pJsMMGBq3pT9ullEueDlBdRHrNPRAG5djA8PnJjUiWvbXem4T5cwBvAly
         kORMBXv6Z2tJECBYs2pPtb4yE2EhmY2IaqWByEis2P07I+yRLTstWXm2G+k9+3ZUTgGS
         G1Kw==
X-Gm-Message-State: AOAM530NexjD7hen2yZHuZhNJIeaGOZ86mTEbVhSXeTX/c4lj8bKDR/8
	m1jtapqkEl4pZ7ecMx3RKkc=
X-Google-Smtp-Source: ABdhPJzZKGGn4IZeiu5hTjl+rIUDl3jtUF8aGQx2DLUTwo/0vTk3cJSHf0z0xGu1A9BDzNveYQVFpQ==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr10254283wrw.324.1602171128053;
        Thu, 08 Oct 2020 08:32:08 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id a17sm7835694wra.29.2020.10.08.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 08:32:07 -0700 (PDT)
Date: Thu, 8 Oct 2020 15:32:05 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH 1/3] tools/libs: move official headers to common directory
Message-ID: <20201008153205.6quz43n7w7utli22@liuwe-devbox-debian-v2>
References: <20201002142214.3438-1-jgross@suse.com>
 <20201002142214.3438-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002142214.3438-2-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 04:22:12PM +0200, Juergen Gross wrote:
> Instead of each library having an own include directory move the
> official headers to tools/include instead. This will drop the need to
> link those headers to tools/include and there is no need any longer
> to have library-specific include paths when building Xen.
> 
> While at it remove setting of the unused variable
> PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
> 

Not sure about this.

Will this make packaging individual libraries more difficult?
Maintainers will need to comb through a large amount of headers to pick
the ones they want.

What do others think?

Wei.

