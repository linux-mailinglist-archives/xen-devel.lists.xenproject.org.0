Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951727FC8E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 11:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145.3773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNv1h-0000W7-7U; Thu, 01 Oct 2020 09:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145.3773; Thu, 01 Oct 2020 09:37:25 +0000
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
	id 1kNv1h-0000Vi-4G; Thu, 01 Oct 2020 09:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1145;
 Thu, 01 Oct 2020 09:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNv1f-0000Uw-Na
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:37:23 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8d2bfc4-a7d1-4583-a8fb-d9265447f5c0;
 Thu, 01 Oct 2020 09:37:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k15so4844360wrn.10;
 Thu, 01 Oct 2020 02:37:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 185sm8475760wma.18.2020.10.01.02.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 02:37:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNv1f-0000Uw-Na
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:37:23 +0000
X-Inumbo-ID: a8d2bfc4-a7d1-4583-a8fb-d9265447f5c0
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a8d2bfc4-a7d1-4583-a8fb-d9265447f5c0;
	Thu, 01 Oct 2020 09:37:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k15so4844360wrn.10;
        Thu, 01 Oct 2020 02:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LLZQPOYWmcB5OcvPbTDTfwETRWYxrmdG96TWBsyI9VY=;
        b=fQsXnkvgkJ67zoE2Ehr9TRD7DFy7o+SQPLBHd7yOvQVvVS6f775Un+AFCJ9tuMFiii
         +XuoU8oOsvuIOVyTlV32Yto8BdlS32gQatTex1u0xUH15R5JkELLljbWdmgTJ51couY6
         7uqys0pwkBCQAHZUUbHLoRxz4ePzmmLNI0Y23qY+12NiAZlrrcIEkwE8KCeerl5pbR0T
         gXdrA0hU82lP/tAFaRzHlE5c5gv5iA8BhgNsDZQYyEvQKzxAorQKwHtRizJSm+WpGLup
         LfekMbbrDN+74pvlDbh/LldElZH7fwFnXFN3SpaJ22JvlQKrj+tHPvz5TTIhMX9nlcr9
         yFow==
X-Gm-Message-State: AOAM531Vo1qiH5g2hzalrL34n5xFbqjaHe72SBO0xDoIbxHDBYxGleQw
	VZPV9IkM7GHbJ9iwl45uJZQ=
X-Google-Smtp-Source: ABdhPJzE23z/Iabn8OLDLbEXKIeu7gT8UV4Ljqia8gjLDC2AmQKhZJdscRBdzLVrvgBBaC+yFPE1Lg==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr8403169wrb.29.1601545036696;
        Thu, 01 Oct 2020 02:37:16 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id 185sm8475760wma.18.2020.10.01.02.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:37:15 -0700 (PDT)
Date: Thu, 1 Oct 2020 09:37:14 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	samuel.thibault@ens-lyon.org, wl@xen.org
Subject: Re: [PATCH 0/2] mini-os: netfront: fix some issues
Message-ID: <20201001093714.bcfs7rf4myle6t7g@liuwe-devbox-debian-v2>
References: <20200922105826.26274-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922105826.26274-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Sep 22, 2020 at 12:58:24PM +0200, Juergen Gross wrote:
> Fix two issues in mini-os netfront:
> 
> - undo init_netfront interface change and replace it with an alternative
> - fix mini-os suspend/resume handling in netfront
> 
> Juergen Gross (2):
>   mini-os: netfront: retrieve netmask and gateway via extra function
>   mini-os: netfront: fix suspend/resume handling
> 
>  include/netfront.h |   4 +-
>  lwip-net.c         |   4 +-
>  netfront.c         | 173 ++++++++++++++++++++-------------------------
>  test.c             |   2 +-
>  4 files changed, 84 insertions(+), 99 deletions(-)

Pushed to mini-os.

Wei.

> 
> -- 
> 2.26.2
> 

