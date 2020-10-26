Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F9298FD7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 15:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12372.32220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX3oY-0004Nu-1B; Mon, 26 Oct 2020 14:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12372.32220; Mon, 26 Oct 2020 14:49:38 +0000
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
	id 1kX3oX-0004NV-U8; Mon, 26 Oct 2020 14:49:37 +0000
Received: by outflank-mailman (input) for mailman id 12372;
 Mon, 26 Oct 2020 14:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kX3oW-0004NM-CV
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:49:36 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 947a35a7-d3ba-4566-8a2f-8079694e7140;
 Mon, 26 Oct 2020 14:49:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h5so12909753wrv.7
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 07:49:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c18sm22280009wrq.5.2020.10.26.07.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:49:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kX3oW-0004NM-CV
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:49:36 +0000
X-Inumbo-ID: 947a35a7-d3ba-4566-8a2f-8079694e7140
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 947a35a7-d3ba-4566-8a2f-8079694e7140;
	Mon, 26 Oct 2020 14:49:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h5so12909753wrv.7
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 07:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=x/kvi4dGENrB3A6TGaDyypQDm6iRWN/t/maDZTvbmPc=;
        b=OaqLcDD+95YGk5VJ/zCgDEGFT4hWZDtnd5tKj4xVWGGKIlv+wGzAtZ5UZQv+eKZIqR
         +nVIw8qpgoQnxXHjWs6VUICcm47MYj2uHzB0ez8RCxV+Is3YjHttOPwuDIos5ISpGuZy
         LJWa6CDdt7rci8rv5+EX9JE/yAIl4iPJoVqLtzcvQ98/GJdmuMNXDhlE32qwPCkOCh0/
         R6H3zQKm+gApq3u6RIcTQpPBymUeq47JyeE4gdJNlvUZGnDDyN1PvE4EBTbrK8p/d71q
         NQamc2RcLkfXN5qs4rk/TtBmGLuy4vZAHCDNqfnQtvqUcKWPVy1JolB+QBo9cSu2r8Ih
         DWCg==
X-Gm-Message-State: AOAM5309te1lanFnmlgTBUpERIsiNQ+f68qQtlHYZwGxWhvPs0sCHwxS
	vjYNyM/oOeahU14MPbrnnO4=
X-Google-Smtp-Source: ABdhPJw8zbFdbIWfe33eQyaLtKeddr3v1dWgxf8PsVKy/afKJsKkeRRD7jD8iRel3SEF9chhobs2qw==
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr18757084wrx.10.1603723773711;
        Mon, 26 Oct 2020 07:49:33 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id c18sm22280009wrq.5.2020.10.26.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:49:33 -0700 (PDT)
Date: Mon, 26 Oct 2020 14:49:31 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable-smoke test] 156241: regressions - trouble:
 blocked/fail
Message-ID: <20201026144931.cvrc72esryhcnwxy@liuwe-devbox-debian-v2>
References: <osstest-156241-mainreport@xen.org>
 <8528afe9-4225-1942-9f7c-54ec50379345@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8528afe9-4225-1942-9f7c-54ec50379345@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Oct 26, 2020 at 02:35:00PM +0100, Jürgen Groß wrote:
> On 26.10.20 14:27, osstest service owner wrote:
> > flight 156241 xen-unstable-smoke real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/156241/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   build-amd64                   6 xen-build                fail REGR. vs. 156117
> >   build-arm64-xsm               6 xen-build                fail REGR. vs. 156117
> >   build-armhf                   6 xen-build                fail REGR. vs. 156117
> 
> I'm pretty sure these failures will be fixed by my patch
> 
> "tools/libs: let build depend on official headers"
> 

I've applied that patch. Let's see how it goes.

Wei.

