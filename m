Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190E4EDA5B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 15:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296962.505684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZufk-0003nc-QT; Thu, 31 Mar 2022 13:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296962.505684; Thu, 31 Mar 2022 13:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZufk-0003ln-NQ; Thu, 31 Mar 2022 13:17:08 +0000
Received: by outflank-mailman (input) for mailman id 296962;
 Thu, 31 Mar 2022 13:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZufi-0003lf-Iq
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 13:17:06 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc381614-b0f4-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 15:17:05 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id 17so31940481ljw.8
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 06:17:05 -0700 (PDT)
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
X-Inumbo-ID: dc381614-b0f4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mSzH78EoYEJXMQgWWHfg4gvtnQ9OmEXl5KNPypS1KlI=;
        b=pPOLwzk/Eb0+0gehavChpMhmFqTFI43cfCNJWfKuROQhhE8Z4PTnLxL1dmQ/FGVd2H
         VNvtjRFp0yPyPKUFHL+y9PT8JK86q8KRhM6a8LI5oZdGXnfqtotZONwlrhvUPmim+Zwr
         y6jw1aC9lffF+V5ylHrhFfA7D0UB9Wsotwvp3s9NbakItWsTIX0S7AwQmoawIWUthPQV
         PoHUWa/QwSh0v0jkgxKDYYYknUvvLyVPX88rey+PkN3igyI8wbSFz4G/0RYWngA1LUOa
         lXHuynfhnfB5daRSyuwsvozC/XmrmUQBwMzaanFyQM6bPmQe/NstgPNFEg78evJVOtzD
         6hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mSzH78EoYEJXMQgWWHfg4gvtnQ9OmEXl5KNPypS1KlI=;
        b=vErG+88DqR4ebYAGkmI53botENeDqpA4nHBQch7J5F9wInkaygQw2l2viVDA7qzdmK
         nvf8GuSRbgfeZ/3dzVz644Izk6+5nq3MWPr4oqxxX/iR09UlpDgxDP+O9QeD03O95h/F
         xvJt8o5iYQyNLFE927J6gJ/xjN1B2ypJnUZKHQ2sqtw2n3d/HtgU90An25UzK/TeajKv
         iVSkI2KQRIuXikfyFw55c83iTlufySqvu00lG25OgDdWfvHy0hUxoXv9Cuvh/+gJR5EA
         IUI8s13egrd9wFOJlR2Q0/Gv/pZEhU+9nzMPVjwAoLKZPZ8YpC9uU39zDhDXE4zJyoVd
         bNKg==
X-Gm-Message-State: AOAM533jMr3xb0ygRfHjGWj6I5VhimtV2OOfahqbua39fBgfDLakmRD+
	W8Mm7KiFn0Sn406qrdepMY9LmIiihKyzGD2SqKU=
X-Google-Smtp-Source: ABdhPJycfvdk+/WkcXOIejueROTiaI5ylf2OqeZWp6vskG/a7kKcz5GTptEhCQDifPJfTLSpKrq6eBdk3SJ7qvN3Dz0=
X-Received: by 2002:a2e:bc22:0:b0:249:80b6:55fd with SMTP id
 b34-20020a2ebc22000000b0024980b655fdmr10744322ljf.135.1648732625001; Thu, 31
 Mar 2022 06:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220330230549.26074-1-dpsmith@apertussolutions.com> <20220330230549.26074-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220330230549.26074-2-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 09:16:53 -0400
Message-ID: <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 3:05 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protected by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit introduces a pair
> of privilege escalation and demotion functions that will make a system domain
> privileged and then remove that privilege.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index e22d6160b5..157e57151e 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -189,6 +189,28 @@ struct xsm_operations {
>  #endif
>  };
>
> +static always_inline int xsm_elevate_priv(struct domain *d)
> +{
> +    if ( is_system_domain(d) )
> +    {
> +        d->is_privileged = true;
> +        return 0;
> +    }
> +
> +    return -EPERM;
> +}

These look sufficient for the default policy, but they don't seem
sufficient for Flask.  I think you need to create a new XSM hook.  For
Flask, you would want the demote hook to transition xen_boot_t ->
xen_t.  That would start xen_boot_t with privileges that are dropped
in a one-way transition.  Does that require all policies to then have
xen_boot_t and xen_t?  I guess it does unless the hook code has some
logic to skip the transition.

For the default policy, you could start by creating the system domains
as privileged and just have a single hook to drop privs.  Then you
don't have to worry about the "elevate" hook existing.  The patch 2
asserts could instead become the location of xsm_drop_privs calls to
have a clear demarcation point.  That expands the window with
privileges though.  It's a little simpler, but maybe you don't want
that.  However, it seems like you can only depriv once for the Flask
case since you want it to be one-way.

Regards,
Jason

