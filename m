Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB727ED86
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823.2803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNeDp-0001dQ-OP; Wed, 30 Sep 2020 15:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823.2803; Wed, 30 Sep 2020 15:40:49 +0000
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
	id 1kNeDp-0001d1-Kb; Wed, 30 Sep 2020 15:40:49 +0000
Received: by outflank-mailman (input) for mailman id 823;
 Wed, 30 Sep 2020 15:40:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNeDo-0001cr-Mq
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:40:48 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fdd6215-62b9-43bd-bfc1-9e629d939694;
 Wed, 30 Sep 2020 15:40:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so2332032wrx.7
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:40:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r21sm4217394wrc.70.2020.09.30.08.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:40:46 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNeDo-0001cr-Mq
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:40:48 +0000
X-Inumbo-ID: 1fdd6215-62b9-43bd-bfc1-9e629d939694
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fdd6215-62b9-43bd-bfc1-9e629d939694;
	Wed, 30 Sep 2020 15:40:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so2332032wrx.7
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9srVVigH2/e6J0r1QRh1Eh+4CNPoMKI5vaC62rqAe+c=;
        b=QruGhA0TPWdBxjQg7yH7xBUzSXPA1yrGqXubfhfJXml4JOwXdUZZMG0/mgUog7AeK3
         hcIwPfRUvr79++2BpFMB79Zxcc4QNscv60QIgh3BSGvR6YGizPRPc1TWuCJfHAee+Ddb
         uY5Vz0P7ygUMH0Ef9F4S2nwH5uURdjvBiVHuI/Sk0bRNxALLjFdSqZDH6HaoEWx+HecU
         cDZfb2X2s2YgmeuwdEEhGr441BpZwQMkhEG4q4oW2Doh+CMTef4YofoBinPO8I+FoQzq
         iF+svJO/nxfGANhhaPGKbV3lscm0Sso2ZufH/SLIqpPIp+aoFYPygdudvOYapKYl4AmQ
         zpzg==
X-Gm-Message-State: AOAM532D1OQMXgHR+pjH+eLlT+ld38qxcM8Pt84ae1oKgmGJDgaVJ08w
	/o6lxzfeBuu2jJcrldX6PfKqShSR7QM=
X-Google-Smtp-Source: ABdhPJxiT92lr9SY8aYkDz7VAMrIZyJ2C6urH4FecqruNYP4RehsrwkiyGhaMqoDpTmTwut0zgSCcQ==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr4140940wrn.57.1601480446999;
        Wed, 30 Sep 2020 08:40:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id r21sm4217394wrc.70.2020.09.30.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:40:46 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:40:44 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/init-xenstore-domain: add logging
Message-ID: <20200930154044.wk6g3rleu5cgtgv2@liuwe-devbox-debian-v2>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923064541.19546-2-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 23, 2020 at 08:45:39AM +0200, Juergen Gross wrote:
> Add a possibility to do logging in init-xenstore-domain: use -v[...]
> for selecting the log-level as in xl, log to stderr.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

