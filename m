Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6574227D36
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:38:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpfV-0005NP-Oo; Tue, 21 Jul 2020 10:38:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxpfU-0005NJ-Ad
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:38:40 +0000
X-Inumbo-ID: 56b014ee-cb3e-11ea-84fe-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56b014ee-cb3e-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:38:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q15so2317465wmj.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=eixWLu67VU8LUPqETPCzqjgNnJL3BeZahrEuSfq3FmU=;
 b=GoySYz8zStWZ3l62G8wY3LD3N83fXRwBPLQuG7zODDV7TviHXydO7aLEAYntBIUDeL
 VasJWTw96iDBwInHKLYWItd7bIH/meu0ur2q+Ol5BW6DP/72RHAarv1eOeONxXuKYhsY
 vi04/R6HOA/o/9dE/qCz7b2huQgTd8MSrJigh70XMJ5OGqzDPl0mkMddO2Gn9QnN2ABm
 J3lsT0UrXz6iaL1IF/cLiIzz1XXmurvbD8bsyhfCDKP9QE/lXRZYOthOBl5cEa+SEt9D
 jHBzuIwWhku3LCoBAfagSGPOWmUBZyVn0JY/um1gnHlmQyvEtEC2U20hDOazaDLrGCr9
 0iHw==
X-Gm-Message-State: AOAM531Qy5O5uTKKjo+Df5j+ASSv9ZpM/td+k45JzEfWj61+fuq8KoJR
 djp99nYvNnNhkiFEFGYX1yE=
X-Google-Smtp-Source: ABdhPJxiFTII/CEwGTG5E+eqNo78WE3VAW1b0Gbu84hSLPspMcYZYPBjHvgSZ0UvzcuHxiPiKcP67g==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr3492831wmj.89.1595327918759; 
 Tue, 21 Jul 2020 03:38:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x9sm2890366wmk.45.2020.07.21.03.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:38:38 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:38:36 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] compat: add a little bit of description to xlat.lst
Message-ID: <20200721103836.ogdcvbcuknuxcf32@liuwe-devbox-debian-v2>
References: <d7d95acc-11b0-278b-373e-0115cfa99b51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7d95acc-11b0-278b-373e-0115cfa99b51@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 02:21:33PM +0200, Jan Beulich wrote:
> Requested-by: Roger Pau Monn� <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

This is much appreciated.

> 
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -1,3 +1,22 @@
> +# There are a few fundamentally different strategies for handling compat
> +# (sub-)hypercalls:
> +#
> +# 1) Wrap a translation layer around the native hypercall. Structures involved
> +# in this model should use translation (xlat) macros generated by adding
> +# !-prefixed lines here.
> +#
> +# 2) Compile the entire hypercall function a second time, arranging for the
> +# compat structures to get used in place of the native ones. There are no xlat
> +# macros involved here, all that's needed are correctly translated structures.
> +#
> +# 3) Adhoc translation, which may or may not involve adding entries here.
> +#
> +# 4) Any mixture of the above.
> +#
> +# In all models any structures re-used in their native form should have
> +# ?-mark prefixed lines added here, with the resulting checking macros invoked
> +# somewhere in the code handling the hypercall or its translation.
> +#
>  # First column indicator:
>  # ! - needs translation
>  # ? - needs checking

