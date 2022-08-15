Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6192593121
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387584.623894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbY0-0002hr-9G; Mon, 15 Aug 2022 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387584.623894; Mon, 15 Aug 2022 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbY0-0002eY-6F; Mon, 15 Aug 2022 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 387584;
 Mon, 15 Aug 2022 14:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkVB=YT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oNbXz-0002eS-3J
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:58:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b94b6394-1caa-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 16:58:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id x21so9901364edd.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Aug 2022 07:58:29 -0700 (PDT)
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
X-Inumbo-ID: b94b6394-1caa-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xsRqMIUsWLxIv18zmsiSh4JZVpHs4hJ3Xc5BPW03tOE=;
        b=as6qbHPdnCnVE75yq160qXcM2Wk721dTg/Kksep4PSYHt8n6lZI5/PbPuVB/x/viHn
         oV+/WDeEaMew8Csj0XDYGl8+/QHD6Sol0/KcRr7u+Rf4Q0WYLV0P6MK23rbldHql+ZFY
         Z3NHGjEj0YFZ5CHp2vDzu+HQwqgzItIjaPXvT1kyht2pjMZOb5TwAwTwxW75kTJIA8KR
         VXO9ECo2+Nj7DBKKC3bwIm0l9ILKRu63AVqiZSXPxYtbPTAgZAs7GFWrSbF7H/nBjj8N
         X8BlnE5PavFXA59Y9wUQ1HtHybJUjKBSBQO+7gkhy39LCOGzlb84HkW3gbgPVxhnQE8X
         8Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xsRqMIUsWLxIv18zmsiSh4JZVpHs4hJ3Xc5BPW03tOE=;
        b=26Eceq0zS3XRTX1vg9c17pAMZAjcpJD+BIJDCWt2740aef5YwbPxoNSv3/0qnmbckN
         Uc+v7qpyFDdQk86aKsoDY+llOGxk6mRGU3npnTQ8YjpSVw0QbnNXIJ4vCOUX38cQYk9T
         nXQojwVhOGIFDBO7Fo1CmHcqBpSJHlHGobxouVFLeRCxREDyp1vvxk3/6KYyjeaO2139
         gAgk3a2bHVlc4QoaNDf4SV4cH8/1P9fs5s92RZGWOXY8xCLYAJVRz/sasoeSYqJWkxec
         cjOAsJ0X7VcdFMUtTo8BjkpYhJNs7Fu6/1yqyao3RlTW1nQbyPCoZqPbXkemjApmp4vU
         e/og==
X-Gm-Message-State: ACgBeo1jmeWSBQBTyIAtXQyc+IoZC4K9JX9cfqGDBmNjYiRnm57Tp6Pe
	HIdMzo6bmOVPIQPyXO+sfJptFrgn7TAsjAi8aoU=
X-Google-Smtp-Source: AA6agR5X+SPUl4wLHvdjgPllkE9XEMzHKQAvVzpRthy/jKD3UHhVhSEpzQAOeg4ft/H8iep/rjnWFk4A8K4yUZsNU6Y=
X-Received: by 2002:aa7:d8c6:0:b0:43d:b0a1:5266 with SMTP id
 k6-20020aa7d8c6000000b0043db0a15266mr14656114eds.164.1660575509505; Mon, 15
 Aug 2022 07:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220810192944.102135-1-jandryuk@gmail.com> <20220810192944.102135-4-jandryuk@gmail.com>
 <9dd6cb04-30fd-aaa3-5afa-02c4f3264f97@suse.com>
In-Reply-To: <9dd6cb04-30fd-aaa3-5afa-02c4f3264f97@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 15 Aug 2022 10:58:18 -0400
Message-ID: <CAKf6xpvv8F9wuVNn2vqGo4bfO1ha9B5m1Ns-ydHESGRQD8a97g@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] cpufreq: Export intel_feature_detect
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.08.2022 21:29, Jason Andryuk wrote:
> > Export feature_detect as intel_feature_detect so it can be re-used by
> > HWP.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > v2
> > export intel_feature_detect with typed pointer
> > Move intel_feature_detect to acpi/cpufreq/cpufreq.h since the
> > declaration now contains struct cpufreq_policy *.
>
> I don't mind the new placement, but I don't follow the reasoning.

v1 added
void intel_feature_detect(void *info);
to acpi/cpufreq/processor_perf.h

v2 adds
void intel_feature_detect(struct cpufreq_policy *policy)
to acpi/cpufreq/cpufreq.h, which was selected to have the type available.

> > --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > @@ -340,9 +340,8 @@ static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
> >      return extract_freq(get_cur_val(cpumask_of(cpu)), data);
> >  }
> >
> > -static void cf_check feature_detect(void *info)
> > +void intel_feature_detect(struct cpufreq_policy *policy)
> >  {
> > -    struct cpufreq_policy *policy = info;
> >      unsigned int eax;
> >
> >      eax = cpuid_eax(6);
> > @@ -354,6 +353,11 @@ static void cf_check feature_detect(void *info)
> >      }
> >  }
> >
> > +static void cf_check feature_detect(void *info)
>
> This function is invoked indirectly via on_selected_cpus() (hence
> the cf_check attribute) - I wonder how you get away without that for
> HWP. Or else why we need this as a wrapper here when then you'd have
> another similar wrapper elsewhere.

HWP calls hwp_init_msrs via on_selected_cpus, which then directly
calls intel_feature_detect().  ACPI needs the cf_check on
feature_detect, but intel_feature_detect is only called directly.

> > +{
> > +    intel_feature_detect((struct cpufreq_policy *)info);
>
> Why the cast?

I thought it was necessary to keep the compiler happy.  Double
checking, you are correct that it is not needed.

Thanks,
Jason

