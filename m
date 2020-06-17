Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CD1FCE89
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:36:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlYEd-0005u2-SL; Wed, 17 Jun 2020 13:36:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxAP=76=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jlYEc-0005tx-Lw
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:36:10 +0000
X-Inumbo-ID: 7dd3557c-b09f-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dd3557c-b09f-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 13:36:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z9so2842550ljh.13
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fhxgw1sjLqMS7CqTdoFKMVQKulz+t3CEc2SleEtaktI=;
 b=DqQEbQJFwIrrc/9NwPOfF3yGvcgyRLZZlx9J17BBWZbtShTlhM8bsZ+pXI5N7Bg0OM
 9SuaB6EAVMmzOKxMpvnGh/HAHtZUzyyTa2BbT/v/LROnbbmIcbRDnGm69Jn6lBF8FcAl
 f/Q1uVOAXFH71kldcQhvUNaQt2AUoUgDA9CFNiG+xVrAQngetNbFCz2ZDduBWkltYzIA
 O/yUr2jPhADNUDoy+8UtkpQh8QQ3XSbPlQtbt/wEdQ3NU5Q/7nWWhSt1lyHW3CXtKqKz
 v2KpmvmZ/TE9paGu+Up+NeDN4IjbIMZVkdrGhApW8rM/cmTc2HCY7cljGczU0w+ct3Pe
 sd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fhxgw1sjLqMS7CqTdoFKMVQKulz+t3CEc2SleEtaktI=;
 b=Oc2xPcdRdpDFyOuH7v50jqJfFuYViQ0Zp7fONRxOS8qpGMZZh0GapOO4KL6+CKXKGT
 cQCrFSZb4IlnMJiNd1y6WxeJMsi7PlTgr2EwhgYKU4G2Y4rjbiT8ikDpuxMtRotLYDX9
 pjWsxXJP2UaL1ee2SeiNEyu8eB+juw8VR/bFUnXPRW8kpQg/49JqGDx1hmwcXcyoQ5Dq
 Zz30Q3h0qv1N1NiQchAat4f07P1hS3GI9nWyh+ITaqD39z2Pp/PPrW4KZBO8bzSlsY0H
 A6axz9C7V/qUFId+EPKHRGS3mW2Hm+Ar5w56h0Ax7zotuRD/jAOmKeodG8O49cN8+kqH
 QuTw==
X-Gm-Message-State: AOAM533VKKdXBmVv6xBr6NpUllkVJ6WftZT31ZNPpx43RJds6w/bUWgU
 CzMmtXYePXODqs9VjOI4ZGtCuA32/i1LPcBH5mw=
X-Google-Smtp-Source: ABdhPJwp+ZgeNjs3mBEm0aiJXrfAmDdnI6eBtts8FYevch18MuxwEWijZ4rpDx4pV94UbCnhX4Tnl36SeC2vjHVjDD4=
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr4025489lji.36.1592400964126; 
 Wed, 17 Jun 2020 06:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200617060841.7241-1-olaf@aepfle.de>
In-Reply-To: <20200617060841.7241-1-olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 17 Jun 2020 09:35:52 -0400
Message-ID: <CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>
Subject: Re: [PATCH v1] stubdom/vtpm: add extern to function declarations
To: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 2:10 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Code compiled with gcc10 will not link properly due to multiple definition of the same function.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

