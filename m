Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80320AF82
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:19:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolQy-0001tP-V3; Fri, 26 Jun 2020 10:18:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jolQx-0001tK-Qd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:18:11 +0000
X-Inumbo-ID: 561945f2-b796-11ea-8496-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 561945f2-b796-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 10:18:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r12so8887920wrj.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=of9h1NRjUJ18XWncnHmChowLD1aeWLqQRvW9jUzW09g=;
 b=iXC+fnnk7RGdRdxzFXNpEJS9YgWaBwkD3Nh0tqXzrOXNQEd0Kv4QoDAYEloYDmb2/e
 MmMYU0H8/56y+vOBLtdHyIgz2n1hwlp6B/jzcnFJ+PcMjLckL6FF99HpRRvOo+5JdKWN
 5lwPV6xmZCLxFP4MB48i+N7uel0dRTMFD+Su+Ibm8b+x7dyyD6XRitQCFsAIQQ+/IvdO
 SfV31KvQGjDq3SaQCRpdwjhMTXAM9WxVDOr+ESOu3wIqP53dP65IKcs6E3vftcY/62bR
 wtoqtVG/fsGFgkvOiY3iqoN0w2fZ3S+ieZ9DynWk/qGOFH4dMa0ySFMdXhrU5nCsYNBX
 Taxg==
X-Gm-Message-State: AOAM531lgvH7lTXq70e9/9gl8RdTGjomAi0bWIxsXbEgJlQ//nfRJJXX
 gW9zO1EAxLoMkCHGrwp11Ys=
X-Google-Smtp-Source: ABdhPJwArNzAXXiebnwjAp8s2NlujCinOyfLLMjqtdNZpgi6q2WyNY2b3B5Juk8KaeS2peSffeLuCA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr2850448wrw.355.1593166690104; 
 Fri, 26 Jun 2020 03:18:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p17sm16150338wma.47.2020.06.26.03.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:18:09 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:18:07 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy
Message-ID: <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
References: <20200611032936.350657-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 marmarek@invisiblethingslab.com, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 11:29:26PM -0400, Jason Andryuk wrote:
> This series addresses some Coverity reports.  To handle closing FDs, a
> state struct is introduced to track FDs closed in both main() and
> data_loop().
> 
> v2 changes "Ensure UNIX path NUL terminated" to avoid a warning with
> gcc-10.  Also, "Move perror() into listen_socket" and "Move perror()
> into connect_socket" are new.
> 
> Jason Andryuk (10):
>   vchan-socket-proxy: Ensure UNIX path NUL terminated
>   vchan-socket-proxy: Move perror() into listen_socket
>   vchan-socket-proxy: Move perror() into connect_socket
>   vchan-socket-proxy: Check xs_watch return value
>   vchan-socket-proxy: Unify main return value
>   vchan-socket-proxy: Use a struct to store state
>   vchan-socket-proxy: Switch data_loop() to take state
>   vchan-socket-proxy: Set closed FDs to -1
>   vchan-socket-proxy: Cleanup resources on exit
>   vchan-socket-proxy: Handle closing shared input/output_fd

Acked-by: Wei Liu <wl@xen.org>

Cc Paul. V1 of this series was posted back in May. I consider this
series bug fixes, so they should be applied for 4.14. The risk is low
because vchan-socket-proxy is a small utility used by a small number of
users.

Marek, you gave Review tags in v1. Do they still apply here?

> 
>  tools/libvchan/vchan-socket-proxy.c | 183 ++++++++++++++++++----------
>  1 file changed, 119 insertions(+), 64 deletions(-)
> 
> -- 
> 2.25.1
> 

