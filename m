Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5BC2CEC4C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44332.79453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8S2-0002P4-Pw; Fri, 04 Dec 2020 10:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44332.79453; Fri, 04 Dec 2020 10:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8S2-0002Of-MV; Fri, 04 Dec 2020 10:36:34 +0000
Received: by outflank-mailman (input) for mailman id 44332;
 Fri, 04 Dec 2020 10:36:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8S1-0002Oa-WF
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:36:34 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a48f77cc-f3ce-4461-aeb7-5790db91d473;
 Fri, 04 Dec 2020 10:36:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p8so4823429wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:36:33 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y2sm3032650wrn.31.2020.12.04.02.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:36:31 -0800 (PST)
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
X-Inumbo-ID: a48f77cc-f3ce-4461-aeb7-5790db91d473
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iCwX12JvinfsBXupn1+ExlWFe4TW7BvvX0Qxxio66Zw=;
        b=iVfbt9oblLZ3wkcxcAUIliUWe5LPzw6qkNFEQQhYLUYuRQChq7JKiqLNv183nqJXC0
         Z7RhHYYjpAvs/ckOYTEfI5eosJ5KacanY4rBOUQq7GhUTWGcnWuB8PBOXsnQNaVU5lPS
         Oz2Rbs7n2rldQFRQjgsDEtNd5glNvKG/DJe8AvAHxUQ4bMNiFhdMN99k0ynOYMdcTG2Q
         VvTTGEsi3U+oyYbdRNxZSlkSAjdUfK74iVYgKtXn+NDclsf9Uhlqj24QTB6GZ8etKhNR
         9NxToae/BXf51sr8mtK/sXf1ev7YqEuFJquHPtvwTHNG4ERFf7D2Xy34FJxURa6FeNyQ
         NGIA==
X-Gm-Message-State: AOAM531QhjfMnEODAdKeI91c7IC2zCLt13THf95KK90htEKFiTSfxHcR
	TVuL1hb2n9wU0YqwYen9QqA=
X-Google-Smtp-Source: ABdhPJydpAA/xOKVpHwzXnu0wlIzM0yGBGdQWdr9LwoJ2pVfMgeiFJDLGZJeMErSlU26OEDEgpFmpA==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr4245212wrr.1.1607078192458;
        Fri, 04 Dec 2020 02:36:32 -0800 (PST)
Date: Fri, 4 Dec 2020 10:36:30 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Cc: 'Wei Liu' <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [EXTERNAL] [PATCH v3 00/13] viridian: add support for
 ExProcessorMasks...
Message-ID: <20201204103630.2v5ftevpqlhswqtg@liuwe-devbox-debian-v2>
References: <20201124190744.11343-1-paul@xen.org>
 <001b01d6c7eb$9c6d0240$d54706c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001b01d6c7eb$9c6d0240$d54706c0$@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 01, 2020 at 02:09:40PM -0000, Paul Durrant wrote:
> Wei,
> 
>   I'll likely send a v4 to address the style nit Jan picked up in patch #1 but the rest should be stable now. Could you have a look over it?

I've only been able to skim-read this patch set, but I agree in general
that adding ExProcessorMasks support is a good idea. It is needed to
cope with more than 64 cpus as far as I can tell.

With Jan's comments addressed.

Acked-by: Wei Liu <wl@xen.org>

Wei.


