Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E6227FC2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:16:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrBm-0007Jt-9S; Tue, 21 Jul 2020 12:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxrBk-0007Jo-T8
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:16:04 +0000
X-Inumbo-ID: f0f54991-cb4b-11ea-a0ab-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0f54991-cb4b-11ea-a0ab-12813bfff9fa;
 Tue, 21 Jul 2020 12:16:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 88so10699442wrh.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 05:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qKIoboWBkto8IvigdE+OP1JMbIIchmAvhLpreVrtlpM=;
 b=dsJAAs1e7PsCn8kEdn2SOtMnCY+VwfZXgYJp0lxcYr5pt+gfNWoZqFUi3hSvSXJ80L
 gERN8UcxEbYmA3rSgxuUXXiiYxKlLSGzPUJJV/UgKsa4TVvNLk+MGaK2gBL0KQ/42+mS
 rJKPuDOf+vdZlG7RK/y7rY7ApKXXTjIhKaPLzc+29tzL5nMi+X+g3l1AhJTxXrIeGzLs
 Mm1y+91nWPjKIR/DRgMRgmqqu2XYyBm8YXb98quILWVlOEKuPy9BiRqR9gtGarUE4WjP
 pVxOW2sALD7H1hxuBQsKF/7EhhEaxc/O9STEhIkwC4TVk6TEeddQwf3wYH2A4uwklLgM
 FKfA==
X-Gm-Message-State: AOAM530ceCYT1wItpb3TYuuD4cGofngmsXb5pMd/1hD6MprS3dRdZQIV
 etEaig23XqPxXxmXu6qknrk=
X-Google-Smtp-Source: ABdhPJwZda6uAmwqdM1t1VxXAXTRW6NtUBm0eIZwU1D8TmAj6HqCmdfqU8TRn+jAeA9JraDZdHeOSw==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr25877177wrl.129.1595333761872; 
 Tue, 21 Jul 2020 05:16:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v5sm3044835wmh.12.2020.07.21.05.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:16:01 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:16:00 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tools/xen-cpuid: use dashes consistently in feature names
Message-ID: <20200721121600.vdglmcv3m74qfnhw@liuwe-devbox-debian-v2>
References: <2bd92eaf-a29d-3fbf-e505-af118937cdda@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd92eaf-a29d-3fbf-e505-af118937cdda@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 02:04:59PM +0200, Jan Beulich wrote:
> We've grown to a mix of dashes and underscores - switch to consistent
> naming in the hope that future additions will play by this.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

