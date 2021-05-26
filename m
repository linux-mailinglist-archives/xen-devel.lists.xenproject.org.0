Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B323A391A98
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 16:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132548.247194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llum3-00083a-Qo; Wed, 26 May 2021 14:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132548.247194; Wed, 26 May 2021 14:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llum3-00081P-Mi; Wed, 26 May 2021 14:44:43 +0000
Received: by outflank-mailman (input) for mailman id 132548;
 Wed, 26 May 2021 14:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqRz=KV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1llum2-00081J-Ly
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 14:44:42 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e6838ac-72a5-43da-8a49-68949570e4bb;
 Wed, 26 May 2021 14:44:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b12so2006098ljp.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 07:44:41 -0700 (PDT)
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
X-Inumbo-ID: 5e6838ac-72a5-43da-8a49-68949570e4bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmGzLwWpMtm0N3bYg4lgK+/MnGvyjKcNNzXT2Jsec8U=;
        b=oK9p4uaO8rtf2B1z1LPohkBBsqYgYizsoCSTMPPnGXnRowp4cSSjpbLP6gf0qUQFfJ
         uyw7/h+ftCp+mxtaUSFQJqoDyvdrEODXKBR6fxxRWvHyqtixAY8rL15N6zUYqzoTfxPE
         cAFBQplRyMOlHqlfZBKrFiRkfVXAvXv0f5MKpT+fy5k6KFP5lwrtVpHJ0pLLbXvlrmSn
         zYR6YKiwesDZu73moOp94z6EjlV6eVnxVP0fCO/ktXcI6a3jxohsXlWD4qe65Q/5Sphy
         lNxEJ2ccqHRHNP4WOlbhg/8YR+0JO7DkQv5Lly8vDPdPn4x+PhYTFRXFJHtYLyqj4JAz
         hcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmGzLwWpMtm0N3bYg4lgK+/MnGvyjKcNNzXT2Jsec8U=;
        b=sGLsls0iDJsOSK+oVF4Ygb/+nXLrPazCo7tw/MflmYvkexkjsVUh6Wrr8LrZ1wucgS
         78g6Gclp3kVCxMCZrdY2DemipM2594MLJ4VQDPMXCthP624yn59Zwj/X2x+kKNa2vnmV
         HyG0tU4114nLBSdZ2eTR1EkXQq7g/29cim2L801bk8+XDBLQaB5+sROtZNjEnUAFIpYX
         4lVzMTzqkbYwtexQJCUtIQaiq9JJaIoesCVM8ZN8kVH4m7kT3ZtdqJXd+NIlUIUXjs9T
         b2Aa2b7UPtUfK634ik+P/SH+Ajy+NVtTS2M6EWTUsROAHnfQG/kqbOj6NE3LiTO0OZ+S
         d+Rw==
X-Gm-Message-State: AOAM531dI0CwgRuebwgvbofs8vr+NOI9Hv7o6VF2s0I4vykrfXJdb794
	2pPOK6PpicbpG5pkBLXu8hdVkewqja1sm4F68/U=
X-Google-Smtp-Source: ABdhPJwYyoTPpDN0XuFHa+XLU7foSWuX37LIl8ZNLYF0dx019FjBmT7yHeC4GHPMMR173lVNjGdm4yLwpbnjaJRks3k=
X-Received: by 2002:a05:651c:232:: with SMTP id z18mr2578241ljn.489.1622040280623;
 Wed, 26 May 2021 07:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-4-jandryuk@gmail.com>
 <68c32d6e-8c6f-35da-c9cd-a560d3d6895b@suse.com>
In-Reply-To: <68c32d6e-8c6f-35da-c9cd-a560d3d6895b@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 May 2021 10:44:28 -0400
Message-ID: <CAKf6xpuni2=Ud9hojAn2U_aBEVQHNU7KkR9sG8WM6RMCYOnf7Q@mail.gmail.com>
Subject: Re: [PATCH 03/13] cpufreq: Export intel_feature_detect
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 9:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:28, Jason Andryuk wrote:
> > Export feature_detect as intel_feature_detect so it can be re-used by
> > HWP.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
>
> > --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > @@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
> >      return extract_freq(get_cur_val(cpumask_of(cpu)), data);
> >  }
> >
> > -static void feature_detect(void *info)
> > +void intel_feature_detect(void *info)
> >  {
> >      struct cpufreq_policy *policy = info;
>
> ... because of this (requiring the hwp code to stay in sync with
> possible changes here, without the compiler being able to point
> out inconsistencies) I'm not overly happy with such a change. Yet
> I guess this isn't the first case we have in the code base.

For acpi-cpufreq, this is called by on_selected_cpus(), but hwp calls
this directly.  You could do something like:

void intel_feature_detect(struct cpufreq_policy *policy)
{
    /* current feature_detect() */
}

static void feature_detect(void *info)
    struct cpufreq_policy *policy = info;

    intel_feature_detect(policy);
}

Would you prefer that?

Regards,
Jason

