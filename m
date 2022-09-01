Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755FB5A9775
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396592.636780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjjA-0007Rh-Or; Thu, 01 Sep 2022 12:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396592.636780; Thu, 01 Sep 2022 12:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjjA-0007Oj-MC; Thu, 01 Sep 2022 12:55:24 +0000
Received: by outflank-mailman (input) for mailman id 396592;
 Thu, 01 Sep 2022 12:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICnC=ZE=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oTjj9-0007Ob-1U
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:55:23 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ea88a2-29f5-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 14:55:22 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id qh18so14204450ejb.7
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 05:55:22 -0700 (PDT)
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
X-Inumbo-ID: 56ea88a2-29f5-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sCiNS6w6foNP+CKWvl8CEHUqFG0zx9VfwcMDKTwmM7k=;
        b=cA/7Dqww2zwOVK27MmDrhDPquXkIzEfGx3arKa75fFdUmRemrjIskpLVXFDAn4egN2
         5LSThc0Dgh85zVnUjPX5Pj4x5lXxYctsYidH647bxBYuK+zXL2mODvpA0Odr6sIhZa3N
         vwDdb5SJybBCVyd1lTHt8mG7JNtfT6KFbT45tHbhAejHACUTaa+fyh7E3Tbco0bq/kcm
         dkTnOA9tUTK2bmqzy3slvm69odwfwNzbzp3ayDfV/8+2BvsPFU4KoTMbW5en6pr4xkP1
         fnaE0kroOZQn/2g+Gn1Sht3Pg34oDa659TVVdEQpjX8b9OFx/OtyTzc0EObOZ/wmMHuR
         jM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sCiNS6w6foNP+CKWvl8CEHUqFG0zx9VfwcMDKTwmM7k=;
        b=VJ+xwrS4Zx9uB9m4ueWdzft/h211esFaF2D4al3fSYmkS+KiDXtITdTuG1G+tO/FAY
         QKUf8qsrrG9qZg0Ei+FV5cyrpEbc2C2JBjPYnAVIdggm9Zj1t19On8EmKmIJ7stPUe15
         ZDWD1euRtMPwFb2cboAsYg2Irhf5zqV+OMji8wbPEBn39USincMrYiVlwW4wLi1qQkdA
         LyZTZ8toqSskhUePHYo4DcEJ2gmlzoRzlH2eFNyx7k0SH1jmcxDEsfIHH5grZH/O/qSF
         VH3gy4YD4oi0LGeThv1/jRL+Yz41iKEHy7pw4j2vjkXa4zs8a13tZS6oDZhQeJuL+xvj
         XVng==
X-Gm-Message-State: ACgBeo0Jkb8YrUlWDZpgZVQ8yRT8zHdwrGMIaXPlE6xD1xOSLqTvlJaD
	uNh2MnYUy5DKvuKOgcGf7jB61nHdqjbhT7QHU0M=
X-Google-Smtp-Source: AA6agR4RroBtQTt0co5okCkrxi5WGtHpVVl+N93eSqFHKu+g6OKclDLqrb4lUJWPUpW1TX0u/+CnuiSSh9wZEGcc/OM=
X-Received: by 2002:a17:906:3c4a:b0:741:6b91:867e with SMTP id
 i10-20020a1709063c4a00b007416b91867emr15261985ejg.297.1662036921514; Thu, 01
 Sep 2022 05:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
In-Reply-To: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 1 Sep 2022 08:55:10 -0400
Message-ID: <CAKf6xptUEirC7zh32Sg8=Tde4b8Sw8wkcnMxJ=82KuxaoH0JbA@mail.gmail.com>
Subject: Re: [PATCH] acpi: Add TPM2 interface definition and make the TPM
 version configurable.
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 4:30 PM Jennifer Herbert
<jennifer.herbert@citrix.com> wrote:
>
> This patch introduces an optional TPM 2 interface definition to the ACPI table,
> which is to be used as part of a vTPM 2 implementation.
> To enable the new interface - I have made the TPM interface version
> configurable in the acpi_config, with the default being the existing 1.2.(TCPA)
> I have also added to hvmloader an option to utilise this new config, which can
> be triggered by setting the platform/tpm_verion xenstore key.
>
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.

Is there a particular reason why CRB (Command Response Buffer) was
chosen over TIS (TPM Interface Specification)?  I think of CRB as more
of an embedded device TPM interface, and TIS is what is usually used
with physical TPMs.  My experiences have only been with TIS devices,
so that is influencing my outlook.  Hmm, this patch seems to reference
the Intel Platform Trust Technology (PTT) fTPM (firmware-TPM) as using
the CRB interface:
https://patchwork.kernel.org/project/tpmdd-devel/patch/1417672167-3489-8-git-send-email-jarkko.sakkinen@linux.intel.com/
 If PTT fTPMs are using CRB, then it's more than just embedded
devices..

Regards,
Jason

