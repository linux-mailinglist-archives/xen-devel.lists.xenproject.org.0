Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F95C01CF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 17:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409855.652843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1pX-0005M9-5e; Wed, 21 Sep 2022 15:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409855.652843; Wed, 21 Sep 2022 15:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1pX-0005K1-2I; Wed, 21 Sep 2022 15:40:07 +0000
Received: by outflank-mailman (input) for mailman id 409855;
 Wed, 21 Sep 2022 15:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bDw2=ZY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ob1pW-0005Jv-7h
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 15:40:06 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ff962f-39c3-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 17:40:05 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id z2so9339495edi.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 08:40:05 -0700 (PDT)
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
X-Inumbo-ID: a9ff962f-39c3-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UkE1Uvo2VLi/vi+llqYADgTt3/eHe/MMoRBjfkfB2+Y=;
        b=UEsr0+bVmuAeq6wuYevs2+ggkjHR1GOqipkjtipHHP4brlv7RFFPFahiFWIG+2+/KI
         vB6V4dy0qZ6LXMXObj7lUuibbfCmaMlG8+YwOKTpAfuj4nLDTn7SAzC8KN2oU8zwo9u7
         SEsGeHRCuAkOtmlxzCalb+fJrJ2nBvzte7DkGSMUgw6yaBF2kyPFga0Xg45PQl5CX74d
         IOiWAJNku9Z5eZfctgvHsGL5RE0ft7xqzQdVMFO6rs1IuvzXfQoCNuyL7t6muJI80Oq+
         ne+FS8BsrhELPCujaxoCR8xntjJPw1ZHUDMh90gVdoWkFl5XlcUvC7lr43lFi1xr46E0
         wrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UkE1Uvo2VLi/vi+llqYADgTt3/eHe/MMoRBjfkfB2+Y=;
        b=y6FHZjYZMmfU63qxjDaLgnunZGKffXipmV2J1tZN9m1qN9e/pcfXWMWZhCB+ZUSJfO
         ftBrLr268zF72Hbe00uur4UMsNIxzTPT/RnKo55WAo3VESg18LkjVY5FdTprs6iw84Y9
         CYNd2L9BORFoOSKoeGK71mPVZFtl3+vidHVYwCChUDI3XVuC8+XUCHbce73s3fJSjhWP
         ZrsO8qTqexYe4HFxycWe04w02bxZGGrxnIe0P4WZwZIqW9Y6iW1jDLwomZVK0mKnXqvn
         m/Ko9sI3jV4OWzf0Mu1yP8oNpkSHmZ0nhHIl7zDv0vaPK6GTCgnYq0W7BXvC/8wvAK8J
         YCkw==
X-Gm-Message-State: ACrzQf1fMqlasP72W9RKhbFGuut45nCfhnn3+aTgEzw2mmrwmz3ADMsB
	puXHazkoUTXlxwxWTMmsM8bihOnWR+3w2zdftlw=
X-Google-Smtp-Source: AMsMyM7a9nMacE6vu4e+rhswsuOOwCPBp1WSP8CIK+ekPKeWXuRhbha27Hj/r3a9CdWEYaEbFZRh9GG89q9NjNuSWvg=
X-Received: by 2002:a05:6402:3223:b0:452:ce21:b1dd with SMTP id
 g35-20020a056402322300b00452ce21b1ddmr25760054eda.340.1663774804844; Wed, 21
 Sep 2022 08:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220921151614.9400-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220921151614.9400-1-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Sep 2022 11:39:52 -0400
Message-ID: <CAKf6xpsLy1Q=-HD6NSikO-d3SbvV-sqzmNcY78c1REBWxUz9Zw@mail.gmail.com>
Subject: Re: [PATCH v2] xsm/flask: adjust print messages to use %pd
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 11:16 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> Print messages from flask use an inconsistent format when printing the domain
> id. When referencing system domains, the domain id is printed which is not
> immediately identifiable. The %pd conversion specifier provides a consistent
> and clear way to format for the domain id. In addition this will assist in
> aligning FLASK with current hypervisor code practices.
>
> While addressing the domain id formating, two relatd issues were addressed.

s/relatd/related/

> The first being that avc_printk() was not applying any conversion specifier
> validation. To address this, the printf annotation was added to avc_printk() to
> help ensure the correct types are passed to each conversion specifier. The second
> was concern that source and target domains were being appropriately reported for
> an AVC. This was addressed by simplifying the conditional logic.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Replacing domid=32767 with source=d[IDLE] seems more user friendly to me.

Thanks,
Jason

