Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE192D1516
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46784.82930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIn0-0006Nv-No; Mon, 07 Dec 2020 15:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46784.82930; Mon, 07 Dec 2020 15:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIn0-0006NW-KC; Mon, 07 Dec 2020 15:51:02 +0000
Received: by outflank-mailman (input) for mailman id 46784;
 Mon, 07 Dec 2020 15:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmImz-0006NR-34
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:51:01 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f1544ce-9ed7-456a-896c-4bee5f695aa0;
 Mon, 07 Dec 2020 15:51:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 3so14049897wmg.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:51:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c9sm10284253wrn.65.2020.12.07.07.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:50:59 -0800 (PST)
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
X-Inumbo-ID: 9f1544ce-9ed7-456a-896c-4bee5f695aa0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CVSlm2qIah8jgTFZMtp/c4oNrq3s/9fEez8UnRCzsCo=;
        b=iquGDs8ZqrRvUHmvLY+uVES9Fo2EVdQplwhk+QbHCIsdk+26xVX5ErHZyBjjUKyFBh
         r1Tc7dWkomf9lMtba2SWEkNqG5ZupZqjPnbKGnQ0S37qVNhqUmK81ro5qvKetQA3RaOo
         +DW9Lme4FEgFqFOSw4fAOJ+1G32+Ao4uV3N91rv0bwrJO9z8wz385RqfSpQkAzrmnuWJ
         uPpI+fc/F3MuM8FIYAQX+m6RO5jjkI6QGUa9hVZZA43pnKSFJUPGJWHU1ZeRdTT8mk+T
         XRoygx2wiGdzkVzypHdRvZofHjOFqaeKz1YpuwlgRqEISYzLHBuzv7G+Q4wH9PxCoDkv
         mR0g==
X-Gm-Message-State: AOAM532Qs9380vOTHWfMsCuVxxv6l7rbXoT3zsos0rRV1bKwkuJfwh85
	AFt1ghZV90Jmc4R+LG56jZnAC7JH/w4=
X-Google-Smtp-Source: ABdhPJyybxFFv3N/RuqRuoTjg7SuQ7VVFfW9DJkZ9h8SdBARS4vPGtunrfMDE1JfLKYWEe40tswRYg==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr19229359wmf.149.1607356259675;
        Mon, 07 Dec 2020 07:50:59 -0800 (PST)
Date: Mon, 7 Dec 2020 15:50:57 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] docs: remove stale README.incompatibilities
Message-ID: <20201207155057.fbjaz66auyxewrl6@liuwe-devbox-debian-v2>
References: <20200909105213.23112-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909105213.23112-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Sep 09, 2020 at 12:52:13PM +0200, Olaf Hering wrote:
> It mentions just stale and obsolete distributions.
> They are not suitable to build current Xen, since a couple of years.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked + applied.

Wei.

