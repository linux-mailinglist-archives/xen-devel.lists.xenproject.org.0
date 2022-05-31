Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52E53964C
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339971.564913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6bw-0004Gq-3W; Tue, 31 May 2022 18:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339971.564913; Tue, 31 May 2022 18:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6bw-0004Et-0i; Tue, 31 May 2022 18:28:56 +0000
Received: by outflank-mailman (input) for mailman id 339971;
 Tue, 31 May 2022 18:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LtR/=WH=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nw6bu-0004En-4P
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 18:28:54 +0000
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 859f81d1-e10f-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 20:28:53 +0200 (CEST)
Received: by mail-il1-x12d.google.com with SMTP id f7so3726567ilr.5
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 11:28:53 -0700 (PDT)
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
X-Inumbo-ID: 859f81d1-e10f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqoYlTKISt4pYqngzf0Xnq2lJyvUsnaz0a7MCsINQvI=;
        b=JbnmzjRBKBBueKQElvFIh4fX8U9QD0j9YUxKehSiF6fr5Ua7Q0kUB6FKin1WnAU91r
         b4o857CHCTZe6t98HKLJrr/cbO3Mbp3RDFjfwxo9sVd/7I+o6NAaKBv8dr8Fcnx/vFX2
         sgWWP14/0+KMHOdJnwMabzkM3zNaG2JldL/H26OZj2X4hgdzcaGSI/7imaTlX6QR5H9T
         EwxEYCHtjbjRU5HPjpn9biatGz8USCsh5Ra5pIf9ZMhaxGpEzLAVvg5QeVbCOvaH2rIL
         UUGSyrcQOBcCTTXFEW5XFLmCwZOumnTda0w9xgeoM/+QP9+a/19pWU2Bz7S3azdCJPoQ
         f9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqoYlTKISt4pYqngzf0Xnq2lJyvUsnaz0a7MCsINQvI=;
        b=BhOkYwWsvz1kat+Ncm8ny7yGVrxRJua+o8vE0lHZri+2eSNe+ZnTJ2ZX/QE8RfN0Ay
         GnM/jl/ElgUXv/XxrZroa1qWyQynd6ivEYrQUfmG9DJLi+afyQ57UNExkMrMvk9nf18L
         ahOqB5z8C+9tWm7Mtn0IkUhsciDP3JS3jOgOYQuTp20OxpcI/K9X/57QZhIZ6QfuwCIw
         K5vCdccxy/C4MujLyb8R8J+Zpeh1Ul/pndMlQfIdvBqAS6yjmUJ56/uOaMGm3mMeEtzp
         gZfmFKOqEljnrgtCy4/pepqq6NLeD64aERo7qZvhtJFzVkQDPrA3M6AY+VhNjZArZGbu
         X9Gw==
X-Gm-Message-State: AOAM530uCpGeSRNYeiJoAyKtyJ8d5tD6pn3fsVSm0cnl9Kj6gtTShxxp
	Mzx/GHEVXoJqwu5jQVlK/Srcohi9xrNHGrmmSTEWZHYi
X-Google-Smtp-Source: ABdhPJwjBlkOZhJYCXTV5XBgzIfkozEBXFELlWJu2X0oyWX2cIG4Z4c08v9n1iyuLepDTorgWBGiyrbIpQ0bY6mUmOs=
X-Received: by 2002:a05:6e02:198e:b0:2cf:4a7a:faf8 with SMTP id
 g14-20020a056e02198e00b002cf4a7afaf8mr30353315ilf.206.1654021731940; Tue, 31
 May 2022 11:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220531182041.10640-1-dpsmith@apertussolutions.com> <20220531182041.10640-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220531182041.10640-2-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 31 May 2022 14:28:40 -0400
Message-ID: <CAKf6xpuW_s0uugZYbrT-gOyk426PMmFZnYie9b9wFhgcSfJODA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] xsm: only search for a policy file when needed
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	christopher.clark@starlab.io, Jan Beulich <jbeulich@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 2:22 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> It is possible to select a few different build configurations that results in
> the unnecessary walking of the boot module list looking for a policy module.
> This specifically occurs when the flask policy is enabled but either the dummy
> or the SILO policy is selected as the enforcing policy. This is not ideal for
> configurations like hyperlaunch and dom0less when there could be a number of
> modules to be walked or doing an unnecessary device tree lookup.
>
> This patch introduces the policy_file_required flag for tracking when an XSM
> policy module requires a policy file. Only when the policy_file_required flag
> is set to true, will XSM search the boot modules for a policy file.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

