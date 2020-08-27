Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A48254483
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGNi-00065t-CH; Thu, 27 Aug 2020 11:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGNg-00065l-ME
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:47:48 +0000
X-Inumbo-ID: 723943a2-f3dc-4d73-8766-e18e1d3dce25
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 723943a2-f3dc-4d73-8766-e18e1d3dce25;
 Thu, 27 Aug 2020 11:47:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y8so3563284wma.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y87KrFikKtZm9MegjCmJTrGXWoUyIly8hBnWp9zQ7Pg=;
 b=TOK8k+zhnzSO9/g3xA8fZtj3IlzaLaBWVGXYLa8mE9ZwGW2ddgyXlFNOHUMSv/ATur
 g61Ag4zGitn6GisPueYoZtWbQ1UFaL5daVKA72Ec/T1f6ePW8vbHD/LzEMWb9zlhKsB6
 I0hF8kKGe5EJrtUIH8ISmToaWxRex6aS3z6dnOzuz0LnM74RsIL1aPfWFYK/Zl3WtJYM
 EpUfOFT1ogspRU5fAc8mDRqM9IcJ9JZFGWrJMdpQ68TGkGUqfZ2CjJXDZ9jJw5gaib+r
 L24DHjle/LD+lBo+d42G0CyKA70wojG6a61cCWbF4+IRrQ145Zn9b0qmt82rnCDAaHtZ
 Z0Tw==
X-Gm-Message-State: AOAM531Sk/GSqeyV0C1tTkMkGFYCuOYLQdfiBg1hdwmkGiwuEdNtdELC
 /t97/M+2keXhtMrtpRllouQ=
X-Google-Smtp-Source: ABdhPJyj5OzZxdxPEHITdpXGUKZ5N254dU9eGIFDxXqPtd/wLnkNvQrW4+qsLctSGasCMm9qvde5yw==
X-Received: by 2002:a1c:3886:: with SMTP id
 f128mr11425852wma.121.1598528867003; 
 Thu, 27 Aug 2020 04:47:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n124sm4632933wmn.29.2020.08.27.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:47:46 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:47:45 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 33/38] tools/libxl: add missing items to clean target
Message-ID: <20200827114745.welbjn5lwbnhkxqt@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-34-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-34-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:14AM +0200, Juergen Gross wrote:
> Some generated files are not removed by "make clean". Add them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

