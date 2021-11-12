Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F544ED98
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 20:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225400.389238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlcZw-0004YM-LV; Fri, 12 Nov 2021 19:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225400.389238; Fri, 12 Nov 2021 19:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlcZw-0004V3-I2; Fri, 12 Nov 2021 19:51:16 +0000
Received: by outflank-mailman (input) for mailman id 225400;
 Fri, 12 Nov 2021 19:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wpNo=P7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mlcZu-0004Ux-O4
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 19:51:14 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3939d4f-43f1-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 20:51:13 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id br15so21196468lfb.9
 for <xen-devel@lists.xenproject.org>; Fri, 12 Nov 2021 11:51:13 -0800 (PST)
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
X-Inumbo-ID: e3939d4f-43f1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D6mGGLpO7GesAhAkwpLpKBeUsqk33gSphpK4BPNXZyQ=;
        b=ADmczJ9K21rvQLMjBo8BhhX84Ej/GFBGd768CLxEoQtVBIwYgO4Jp5WujfDB8+9KP+
         dE2aLG9w45l9UdvQjyW4pvGsI/RWEjYLS9l7bysLRqtb2NH5aJBe2PoAIzuDN8uy4JT4
         PLb7uNKS9fDP6+PYAGXjnoV4tbZXMBwRz6a3FE++fHe3kd39R8Lr7pXbwl+yUBHw9MMp
         3P3wOZR9c8hWhSxtfUf3dPq3wLRr64Yx2qjwZFHAUgB5EeX3A5nIGInUBpLqN4x2Mrsg
         T7WojABze1gsN6ADf7hhlL+I//bTTFEEkyuYiOn23X52wkGs43klm3HPIdBnKEgMkZT+
         Nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D6mGGLpO7GesAhAkwpLpKBeUsqk33gSphpK4BPNXZyQ=;
        b=VO3yBPyas25I28sdXDqbf5p9k8YiD+A4wjOOS3p2R7G8SvW/+PhB2oXtuhbrmnBbIv
         Mh8qCtKT6oo8MHvNmjOw/JF+yrRbKUZSVeNNhWdSHnd8VI6QYkIdQsUeqQeD6H5mWEvX
         KRdP56aIgQZrmgIL6ujD94/qGHz1fX+J7JdyDKNtpRft6zpTFPpLvaImcwnXoyGfK7Pv
         Ul3aL+Plpz/+sOIShcn7keTE2WyUv+zlQGOmc0K10vfZKKAwmr+0mI5XG2oWD7iS7Rc9
         opk7qKRfS3lvvuHq4JfKLl8o9bTuu3dKDEBAXVZIw9iNjK6lx/GQnUrV0Ngvh0jn4jYf
         af9A==
X-Gm-Message-State: AOAM531klFT+e7A8YnNTCuZQ3rQ7waFLfBmS9umGM6OnVbxVwj+HgGbf
	YSbv+lkp7olJc4HHPkIj9jo7UIxBr/FBjYbieQs=
X-Google-Smtp-Source: ABdhPJzC9l3V8bQWfmPEh0b+mNNPbqBz9XRzvDE122pd69GtStIBzbr4TkcSy/9LReRGJY1dK5mfE75LFjIg1xYyl0o=
X-Received: by 2002:a05:6512:b21:: with SMTP id w33mr16207968lfu.447.1636746672195;
 Fri, 12 Nov 2021 11:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20211110091935.16906-1-jane.malalane@citrix.com> <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
In-Reply-To: <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 12 Nov 2021 14:51:00 -0500
Message-ID: <CAKf6xptiUjSaAxSrfN_=HFfX0PuTYVrojdsUyHfX8e6X0cGYJQ@mail.gmail.com>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo status
To: Andrew Cooper <amc96@srcf.net>
Cc: Jane Malalane <jane.malalane@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 12, 2021 at 1:51 PM Andrew Cooper <amc96@srcf.net> wrote:
>
> On 10/11/2021 09:19, Jane Malalane wrote:
> > Before, user would change turbo status but this had no effect: boolean
> > was set but policy wasn't reevaluated.  Policy must be reevaluated so
> > that CPU frequency is chosen according to the turbo status and the
> > current governor.
> >
> > Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
> >
> > Reported-by: <edvin.torok@citrix.com>
> > Signed-off-by: <jane.malalane@citrix.com>
> > ---
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Ian Jackson <iwj@xenproject.org>
> > ---
> >
> > Release rationale:
> > Not taking this patch means that turbo status is misleading.
> >
> > Taking this patch is low-risk as it only uses a function that already
> > exists and is already used for setting the chosen scaling governor.
> > Essentially, this change is equivalent to running 'xenpm
> > en/disable-turbo-mode' and, subsequently, running 'xenpm
> > set-scaling-governor <current governor>'.
> > ---
> >  xen/drivers/cpufreq/utility.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
> > index b93895d4dd..5f200ff3ee 100644
> > --- a/xen/drivers/cpufreq/utility.c
> > +++ b/xen/drivers/cpufreq/utility.c
> > @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
> >      {
> >          ret = cpufreq_driver.update(cpuid, policy);
> >          if (ret)
> > +        {
> >              policy->turbo = curr_state;
> > +            return ret;
> > +        }
> >      }
> >
> > -    return ret;
> > +    /* Reevaluate current CPU policy. */
> > +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
> >  }
>
> So, having looked through the manual, what the cpufreq_driver does for
> turbo on Intel is bogus according to the SDM.
>
> There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per
> package) for firmware to configure turbo, but it manifests as another
> dynamic CPUID bit (which I think we handle correctly).  It has the same
> semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider
> adding it to the set of bits we clear during boot.
>
> However, the correct way to turn off turbo is to set
> IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.  As
> such, it *should* behave far more like the AMD CPB path.

I wrote this in my HWP work (which I need to get back to...):
+/*
+ * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
+ * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
+ * with my HWP testing.  MSR_IA32_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGAGE
+ * is what Linux uses and seems to work.
+ */

Regards,
Jason

