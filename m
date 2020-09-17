Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95126E11F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 18:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIx5m-0001RD-NZ; Thu, 17 Sep 2020 16:49:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W15F=C2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kIx5l-0001R8-I8
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 16:49:05 +0000
X-Inumbo-ID: 302998fb-2081-40db-aecc-c03d46d179cd
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 302998fb-2081-40db-aecc-c03d46d179cd;
 Thu, 17 Sep 2020 16:49:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x23so2619542wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 09:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SVPBr8G8DsODeKRBiuavvwy/tfRxe3wqSHSlxS3Azzw=;
 b=pZDv1ThQEUA3xiqF0NhT9Yalc2bAJGlD7eCj4rHx8ZLz1AMC2N4vYqSZPgTVF+jAxT
 KWOuwDeEowxZ76HC9E1eEW/+vIkbmSGTSDE/v3+RXlcVBErJ4NCUN5JJ1+5n4nQd/xlO
 hwWKww8B4WFcZa77gUVGjloVPuD3wzLcndp2HWXeOhdhfQ7n269flz2LRnltItensLgD
 qkMXK7K1gKGbC3DTjsdkaEod1lz3zCYH+a+bpaiah7VXulXiX3XF4zHZBDTXdzQWU3+3
 Icmrv8OIGB7dntgDtpHqne51oHuJUhuox5tZd37iR7xiq5NbEeIB2oT3qUWx9vXG8E5y
 9+2Q==
X-Gm-Message-State: AOAM530aNRk9kWoTWYUJ0aBd22XbScYepRJFK78NCKbyVIDLo8ZYnTsk
 EB+jgHRzNdqXD6IKpDcjymw=
X-Google-Smtp-Source: ABdhPJyBvSpu8F/LZKjksCawPqV8neBg6AKt+388XoftRm0wqG8e7+P8uQfMH8/dugzgGfKwRYMR8Q==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr10851958wme.122.1600361343257; 
 Thu, 17 Sep 2020 09:49:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w7sm163247wrm.92.2020.09.17.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 09:49:02 -0700 (PDT)
Date: Thu, 17 Sep 2020 16:49:00 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH] EFI: some easy constification
Message-ID: <20200917164900.ocsapgx2h4osphfh@liuwe-devbox-debian-v2>
References: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
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

On Thu, Sep 17, 2020 at 01:27:12PM +0200, Jan Beulich wrote:
> Inspired by some of Trammell's suggestions, this harvests some low
> hanging fruit, without needing to be concerned about the definitions of
> the EFI interfaces themselves.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Wei Liu <wl@xen.org>

