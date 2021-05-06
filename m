Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9B375560
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123573.233099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leecL-0002R3-2m; Thu, 06 May 2021 14:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123573.233099; Thu, 06 May 2021 14:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leecK-0002OC-VL; Thu, 06 May 2021 14:04:40 +0000
Received: by outflank-mailman (input) for mailman id 123573;
 Thu, 06 May 2021 14:04:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leecJ-0002O0-6z
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:04:39 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3eb1cdc7-de8c-4eb5-9a96-bda0214f6a85;
 Thu, 06 May 2021 14:04:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id o16so7219105ljp.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:04:38 -0700 (PDT)
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
X-Inumbo-ID: 3eb1cdc7-de8c-4eb5-9a96-bda0214f6a85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iv4rh0azE3wyuDutQfPSy04R7NYdGndNnYAgr/OMFeg=;
        b=pj/5fOnn8TnE5gNgEuCZCSMg1KRasWlUjpOJl0y8JA1f8XFXtQ7kqC7Crtj0LksDLL
         Ew8ZwVieI+gM/sb7Tu2gakIdZF3lJwhXYGLhIQA2t6GLMSziftIIQcLLifOjyt/3xIpH
         83olv1LMwNTR2sF5mVtk3nvSuDEiWWIAe+3IAMj//SAZ61horCH3yjxoKHo9+bCG7Qr/
         ixwZNucZN97DQ3EDiKorxUYsGR4tSL0httvnVXdB6Nf+MFIIJJlKBZwP9fM8+8Zp296X
         SI6BT4snB5kgW9a+PsOL9HxYWkvenxRsfI4SYMHVNJHp9axKpDuwt5oBmkU9VWy1Ta2G
         jCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iv4rh0azE3wyuDutQfPSy04R7NYdGndNnYAgr/OMFeg=;
        b=lV27YFsdUlnwEHyMIuTA9cCbn/GPC9Xm1HNsuP1VqsD7KgV/HawuP3pkZiNMWrOXMG
         YOg55TtddOv6HYx4c9QITTnVKrW2r905Ciml+m4vXQpQ5xsclJ+udxOUa4ePGMYrCG30
         kC6VrikaAlJTMlV+m8UR+xrT7n0YDSBFXUkVTRTKw11PQghWnuwzZmisKwyWm08985Hd
         iaQ0rWzLNZTBN+iX45MnamCK6+liWw3YREO+mT+YtjjlzOZ+16H6TfnT1GMWsHyf/kcE
         iCKEgMT1KfICeGoeIvs5Gi7M87ycUYQcOSrPlY02cHlciYOe3mnnQZ6ntK1OiTz2X206
         ZalQ==
X-Gm-Message-State: AOAM531HkBL0fzg7YRt6lslQUdpknukfPM0aQXA0onI7VD1TB2TazYXA
	docLU+hI0jQK0Z+GE0khekOD0BlwWB7iJcysqAwZUM4C
X-Google-Smtp-Source: ABdhPJzueLl1gPUv2yD0a3QJtKHmPXTsCEIt/UCkovPWKoufUqHtzsUNPQaFrGy48U5rcsnW97xK8bJbcfReHsEbEGM=
X-Received: by 2002:a2e:8356:: with SMTP id l22mr3558079ljh.204.1620309876985;
 Thu, 06 May 2021 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210506135923.161427-1-jandryuk@gmail.com> <20210506135923.161427-9-jandryuk@gmail.com>
In-Reply-To: <20210506135923.161427-9-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 6 May 2021 10:04:25 -0400
Message-ID: <CAKf6xptH+p3KmNsaok_5dy+1WHZ5RHJfqKfmQVmsiauAo8FakA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] vtpmmgr: Shutdown more gracefully
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 10:00 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> vtpmmgr uses the default, weak app_shutdown, which immediately calls the
> shutdown hypercall.  This short circuits the vtpmmgr clean up logic.  We
> need to perform the clean up to actually Flush our key out of the tpm.
>
> Setting do_shutdown is one step in that direction, but vtpmmgr will most
> likely be waiting in tpmback_req_any.  We need to call shutdown_tpmback
> to cancel the wait inside tpmback and perform the shutdown.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>

Whoops, this should be "Reviewed-by: Samuel Thibault
<samuel.thibault@ens-lyon.org>".  The above is missing an "l" in the
last name.

-Jason

