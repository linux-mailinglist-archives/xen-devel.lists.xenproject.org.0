Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB2532EBE
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 18:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336664.561034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXDx-0008Vm-LE; Tue, 24 May 2022 16:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336664.561034; Tue, 24 May 2022 16:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntXDx-0008T0-I6; Tue, 24 May 2022 16:17:33 +0000
Received: by outflank-mailman (input) for mailman id 336664;
 Tue, 24 May 2022 16:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4sq=WA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ntXDv-0008Sr-VX
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 16:17:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03066982-db7d-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 18:17:31 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id t25so31652130lfg.7
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 09:17:31 -0700 (PDT)
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
X-Inumbo-ID: 03066982-db7d-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k099nDBtGace6sjCooD+aLLT0GH+QzaCjURhwuSBBe8=;
        b=bNoUFohODtLlGn/8i384Z202NzQkh2BWsrS9Qxo4+Ja1Oihf0f+r/9tuXTXb4aPvp/
         0LZ6YfsP3y5XE3USGgXbPkjgyCnqe0s9DdLTpOmjwhhhWLDZTlBTI1yN6ExT71DLZRqr
         8hb+1aPUF79wGA3bHTFjOSWl9FJgfOCfPTDhj4UbOAMzAOmI4WBU64K5aj7njd91bsnG
         YYQdDJ3rqp3hI0Tkqb/Nxg7dEd0PYyBQc/Xf7jtKnLigCEZjMpVGWk75gkQL7okcsg29
         SXT0aDAt+VQbS4Uv9e2PFYPLk4O40nEih/Uf8irteIwDMZSQIKqVEjXh6j5OYYrRyJzL
         c9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k099nDBtGace6sjCooD+aLLT0GH+QzaCjURhwuSBBe8=;
        b=nBDWiP0wDZ8F7aIqerYT+06RGUuPM6GBNs2c2CWXFgyLvInBBYAUWwzzfbyP8xEu5Z
         rU9fKZrTsK3g6KSc5O3i4Rg20rC1mPvRKqi6ZKlDT+vUILn2+FXHylf5wrOyIjLMeH/T
         56DCm3x0FvxZuN/UVAiaK973/I8FL8RUOPgEbB+J0WgYZRe+Jn3OP3IkqeRKZF0KCESQ
         gSqPRvYwfq50CZm3+QqtCePxDWb+phSS81kPQxb3hcy5twcAf7ysQmMYp0clhYrJgvnz
         c40qY9Uv5cfq0QdKxo76+UWbwQM4HC7YtEiX5j2wkNHSxEdE8m56db2FE+35/9fVheeI
         AL0Q==
X-Gm-Message-State: AOAM531LFr71M+HnIpbj36HwAmORKc4kDbtTAob0r+wPCABAPL1AoqAJ
	JXG5g6SaRos0YIHwJPA1faqEIsq7kv154sQkHippZGZddU0=
X-Google-Smtp-Source: ABdhPJzpkf/nHXWx/CF680RPX4UDXIIKw9cgIAmr8mhWTkOFlxuv4mRWaKBg8J38LqYJAEKPYPodaVfE7aPwGBEiqcA=
X-Received: by 2002:a05:6512:a88:b0:473:e080:40e8 with SMTP id
 m8-20020a0565120a8800b00473e08040e8mr20263087lfu.359.1653409050495; Tue, 24
 May 2022 09:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220523154024.1947-1-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 24 May 2022 12:17:18 -0400
Message-ID: <CAKf6xptJHoA=Zn+jQi6_xDjA8pkAuOnGtnfw_WZenVJYcmwX8w@mail.gmail.com>
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	christopher.clark@starlab.io, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 23, 2022 at 11:40 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> It is possible to select a few different build configurations that results in
> the unnecessary walking of the boot module list looking for a policy module.
> This specifically occurs when the flask policy is enabled but either the dummy
> or the SILO policy is selected as the enforcing policy. This is not ideal for
> configurations like hyperlaunch and dom0less when there could be a number of
> modules to be walked or unnecessary device tree lookups
>
> This patch does two things, it moves all policy initialization logic under the
> xsm_XXXX_policy_init() functions and introduces the init_policy flag.  The
> init_policy flag will be set based on which enforcing policy is selected and
> gates whether the boot modules should be checked for a policy file.

I can see the use of init_policy to skip the search.  (I'm not the
biggest fan of the name, need_policy/uses_policy/has_policy?, but
that's not a big deal).  That part seems fine.

I don't care for the movement of `policy_buffer =
xsm_flask_init_policy;` since it replaces the single location with two
locations.  I prefer leaving the built-in policy fallback in
xsm_core_init since it is multiboot/devicetree agnostic.  i.e. the
boot-method specific code passes a policy if it finds one, and
xsm_core_init can fallback to the built-in policy if none is supplied.
Since a built-in policy is flask specific, it could potentially be
pushed down in flask_init.

Is there a need for the xsm_flask_init_policy movement I am missing?

Regards,
Jason

