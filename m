Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C34287499
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 14:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4465.11618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVRC-00040Z-Sv; Thu, 08 Oct 2020 12:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4465.11618; Thu, 08 Oct 2020 12:54:26 +0000
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
	id 1kQVRC-00040E-PW; Thu, 08 Oct 2020 12:54:26 +0000
Received: by outflank-mailman (input) for mailman id 4465;
 Thu, 08 Oct 2020 12:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQVRB-000409-2b
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:54:25 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b158584-b5ed-480e-b4cb-4378216e8061;
 Thu, 08 Oct 2020 12:54:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z22so6712228wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:54:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o194sm6728427wme.24.2020.10.08.05.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:54:22 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQVRB-000409-2b
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:54:25 +0000
X-Inumbo-ID: 1b158584-b5ed-480e-b4cb-4378216e8061
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1b158584-b5ed-480e-b4cb-4378216e8061;
	Thu, 08 Oct 2020 12:54:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z22so6712228wmi.0
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GgFbCKyjOz9HeWAfWmdIujxFruBcbz3/RSlY+kjpREI=;
        b=Md5MOMlt9Ghs3cGQiZ+zQ+r+c+I5oaDJOJhTTx847eom6ZmtqbjXU6ihRab2eSXgu5
         L0kTr3ine1buViA9mlVhOX+nnYxdT7jULR5CRintgiRvkbXa93rhopMmYZ2MiK1NPJ54
         rrVokAZWFvg2V7F6r6kZqW8Q8A4RDYd3Pw63kFHAbmXIgPYB1LInyCF7Y40T3X6CXQ2D
         DxUTvgRgRls2j4fp87xCvK8hTqzsE1drQPRca0zHNpTkfLf6mgPDe7+1Ci0m4P/Sb5gS
         MqGHm378msveS9UWGcGdlDwZsfIjYQA3Xlq183wY6n535i+vLQEkvvytYN4iJaGy4zHG
         0aNA==
X-Gm-Message-State: AOAM531Egqy7hdubM0ObJ/XEOaFzdb19pld/atQhnT34WtZzPEOaOkWW
	SsOayA3fIblBFb4SoVciQTxCu6cYqMQ=
X-Google-Smtp-Source: ABdhPJwSoRzWdjLR6fSPR7LxriR7i32uk6XE0lk2dQAFX+26vpcjetuxFENeHxhyAfEaw7UQubssUA==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr8165275wmb.80.1602161663459;
        Thu, 08 Oct 2020 05:54:23 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o194sm6728427wme.24.2020.10.08.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 05:54:22 -0700 (PDT)
Date: Thu, 8 Oct 2020 12:54:20 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 0/5] tools/xenstore: remove read-only socket
Message-ID: <20201008125420.fvycxbba7mrypvmf@liuwe-devbox-debian-v2>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 05:41:36PM +0200, Juergen Gross wrote:
> The read-only socket of Xenstore is usable for the daemon case only
> and even there it is not really worth to be kept, as not all
> Xesntore operations changing the state of Xenstore are blocked,
> oxenstored ignoring the read-only semantics completely, and the
> privileges for using the ro-socket being the same as for the normal
> rw-socket.
> 
> So remove this feature with switching the related use cases to the
> Xenstore-type agnostic open- and close-functions..
> 
> Juergen Gross (5):
>   tools/xenstore: remove socket-only option from xenstore client
>   tools/libs/store: ignore XS_OPEN_SOCKETONLY flag
>   tools/libs/store: drop read-only functionality
>   tools: drop all deprecated usages of xs_*_open() and friends in tools
>   tools/xenstore: drop creation of read-only socket in xenstored

Acked + applied.

Please submit a follow-up patch for adding some comments to xenstore.h.

Wei.

