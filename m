Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F95B23AC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403495.645627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKVH-0004Li-PD; Thu, 08 Sep 2022 16:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403495.645627; Thu, 08 Sep 2022 16:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKVH-0004Jv-MS; Thu, 08 Sep 2022 16:35:47 +0000
Received: by outflank-mailman (input) for mailman id 403495;
 Thu, 08 Sep 2022 16:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4jV=ZL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWKVG-0004Jp-Us
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:35:46 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4970dcf3-2f94-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 18:35:46 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id q21so17605043edc.9
 for <xen-devel@lists.xenproject.org>; Thu, 08 Sep 2022 09:35:45 -0700 (PDT)
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
X-Inumbo-ID: 4970dcf3-2f94-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VW4KfvfzyVHPd8uiTuoi1ws0SBlUslXncR/03SR1FNE=;
        b=Gj4Njw0OFwJFGyy/CpBsWrtaBlodwVsytOVMo0at++gVmVcKEHXv5IQZFRIQwT/d+N
         fhtp/sGmbhcxk802b1qtoS2CFjSCb5IB4RXY+j1IUxlac4iD9wgSqvayqv9zSzL2n2te
         QLcpJ22aUMWyxS7AJ3tRskbVVFVLOlIreLWxxHR79eGs6p4Wm6y6ouJHj5/y2hroCJlC
         GIBT8RbNzpIhPwTLRxM3eKJV/eO7k82LKj4xAtC+Irw3bO/1lkpEzwk6ZZgN+9SU/FoE
         dYp2nlq6kQgDNjeGTXsHZvG7rTa7CLNqoypOWNlltFodkAqGjGs5ALlV6T9QyI6cqbLz
         RfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VW4KfvfzyVHPd8uiTuoi1ws0SBlUslXncR/03SR1FNE=;
        b=IKAhwp1WptFNVVl6y1ka3x/8OnbqzfnFFkny7nelJI9wEoVO4hRb7q3zfZc4nkgJGh
         d7zXQgh+FkVb4k9FHjuAXaNyMaiqyibiWSWuSGCKms9m2ZsV5ZZkXzqvOrhQqjjeb68i
         zbNTYEbFPn6pOAE8Mmknzs49p6Swd2RZKQ7VkgAKWjgj1NUiixHjhrJFx3PJO2x6+v6j
         Rqx4+ooG27mK7BoZTxTgw99FaVgmz5VQtDLuKcTfYGTFX0Pch7sM++wcM5lB7w5pB//9
         jKeIe+uO9VoMLb666CUe5Vnix1eF3ACetYq2MjV76oL5brFNN0YucRa4LFGpUjAelnC3
         FIwQ==
X-Gm-Message-State: ACgBeo3g5H9w+ynd/LMQuFn6IMNJvgOId6Qk7cKJydm9bs0G6cqti06J
	MfGiM949mSp2TkO5YAZtXNhTcpf3JHceSl8XnTA=
X-Google-Smtp-Source: AA6agR60EsHy+umEW+DkcyJqAPtFQEJqGtmjo3l8FZl0Yg8CwYgu7ksl7zLlC55BFTK6IgOpyhuXXPeH7d4z5KExZ5s=
X-Received: by 2002:aa7:c956:0:b0:43b:206d:c283 with SMTP id
 h22-20020aa7c956000000b0043b206dc283mr7892981edt.381.1662654944865; Thu, 08
 Sep 2022 09:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220810194827.103428-1-jandryuk@gmail.com> <20220810194827.103428-3-jandryuk@gmail.com>
 <YxnixSEDEoYOlzfm@perard.uk.xensource.com>
In-Reply-To: <YxnixSEDEoYOlzfm@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Sep 2022 12:35:33 -0400
Message-ID: <CAKf6xpt6fVMQ5QjpyFQ1opYH_yfRkubgbM19j+9EOBc87_6EaQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] xl/libxl: Add ability to specify SMBIOS strings
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 8:40 AM Anthony PERARD <anthony.perard@citrix.com> wrote:

> > ---
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> > index 2abaab439c..9034933ea8 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -771,6 +771,26 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
> >              goto err;
> >      }
> >
> > +    for (int i = 0; i < info->u.hvm.num_smbios; i++) {
> > +        char *p;
> > +        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
> > +                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
> > +
> > +        /* libxl defines are all "_", but the HVM_XS_ strings are "-". */
>
> "libxl defines are all "_"" seems a bit weird to me as a comment in
> the source code, maybe a better comment would the conversion we need to
> do, something like:
>
>     Convert libxl_smbios_type string to xenstore path that hvmloader
>     will use, as defined by HVM_XS_*. That is convert the '_' to '-'.

I'll use this.  All your other comments sound good, and I'll change accordingly.

Thanks for taking a look.

-Jason

