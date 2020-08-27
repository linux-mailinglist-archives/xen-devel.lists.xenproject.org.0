Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD52543E1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:39:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFJJ-0006hu-Dr; Thu, 27 Aug 2020 10:39:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFJI-0006hn-Eq
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:39:12 +0000
X-Inumbo-ID: 906310cb-9a3c-4b5a-83e8-80d565937c93
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 906310cb-9a3c-4b5a-83e8-80d565937c93;
 Thu, 27 Aug 2020 10:39:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w2so4474219wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j9dYGIgvTBGYLgBGreImgcffZSWiPI1e4XklDUlXFng=;
 b=e2KZ28pocSCsslZhX66fUhb3+RJ8LBb+XBA6LVw7oP0V+SBlny780+kXFBWE1nsqeK
 VaujcOJTcQcWk2ZdguQv59cB4tcNge80KfC6CfonJNhwYEmViExUvUkq46rY/hi7Vvjt
 25nfgyAfcRk0oEHOq6Koy22gLw4MVr2bGNRXzHFjCH51JAJgdmuFbevsfLJSitayzJmU
 nzDhIgbvcQHl9ix0oxif+nljluhg9lj2rLEp20lNYOjAu/McgH8jENpBNmiQqUDzqmfe
 0H03xPrOzWl2yey2sNde2Jr7HkmuzaQZDIkpWWJiBIjpaUzOwY3yMWHd4NWLqKKIX6SD
 vA5g==
X-Gm-Message-State: AOAM533a/BnqtAajgPSd1RIeih09XF0uV8ThwU4/EsfgNGqo8cv7uKY1
 4WlJrvEKRx2djzOYmkG9PEg=
X-Google-Smtp-Source: ABdhPJz+Oh0AvJG7udL/eNTpT/gUcrzb1QkaJICcCo888ssznpix2Le0+kyQJanWOrm9PYemZmHylw==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr11393058wme.172.1598524751046; 
 Thu, 27 Aug 2020 03:39:11 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u7sm5214276wrq.89.2020.08.27.03.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:39:10 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:39:09 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 18/38] tools/libxc: remove unused headers xc_efi.h and
 xc_elf.h
Message-ID: <20200827103909.wstqptrzwn4kg4qy@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-19-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-19-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:34:59AM +0200, Juergen Gross wrote:
> Remove xc_efi.h and xc_elf.h as they aren't used anywhere.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I haven't checked if they are really unused, but that should be easy to
find out if it is not the case.

Acked-by: Wei Liu <wl@xen.org>

