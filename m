Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C5540160
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343337.568655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaCT-0004jT-2O; Tue, 07 Jun 2022 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343337.568655; Tue, 07 Jun 2022 14:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaCS-0004gv-Vo; Tue, 07 Jun 2022 14:28:52 +0000
Received: by outflank-mailman (input) for mailman id 343337;
 Tue, 07 Jun 2022 14:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0mQ=WO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nyaCR-0004go-4D
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:28:51 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25bb5404-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:28:49 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id t25so28581893lfg.7
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 07:28:49 -0700 (PDT)
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
X-Inumbo-ID: 25bb5404-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Cp/kyM102WmBQnkCm9RNeqyZdx7wIJ+Bk+Kzplg+ZE=;
        b=QzccWae2yrURKMCTOJ3MlyR29k9PwmbUktfz9xzPMWMLqTJXzCP3Z7wr20btdLbYWY
         Cnlb7Vfytse8b6Aqj+HOWrdjsT0bUD11pCYpY6twTaN7fhbjw0jFIXr+LWcM3D4aXH6P
         w1CO5ezX3IA08Db1V+Mn2OyWXDmYEmiTMrZJPCBz8UMazF4IRzRrOrvP21fC2rfP3lGZ
         asnpPT8v1XyCRHnwP2FCPt9cU8x/glMWSYeaIxktgZr2tdrf6pIh1Cbs1YfCFLYdXjv1
         4ya2GRrpL5WPxkryHu/YcNKyIGwTlixscYAh1RDJthWcB9BduwC4gLpjRwMCkDVz7NXc
         0XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Cp/kyM102WmBQnkCm9RNeqyZdx7wIJ+Bk+Kzplg+ZE=;
        b=crH7PeqiDoBPXKE8RMsAhICItH38gQKg/vzsHKSv8m7ap1bEFv364bPin5cYn0wM/k
         NSgWwAcxreJ5RfvxFL22fEMX3dqtyWCcNEvPJZwYW5IRJsFoBqGGDfEDnT83k9pf9GGS
         yF8NR+VRWbzjGr9P7AhSSeSjHTNoI0QpDyezCi/M9AfhxnUZjTi2A79GGY3pZ9aQ8NsB
         Bqy2sKyZxUwUp97sjDQuSNgg2DpLg09hXLuf4/UTSYquv/Gkbnoc/1F0yskybP7a6Rp5
         PbXItjLsfBRT4N6LBRDeYkwOJp3iWS76I01UcmiU4AWNCp8bzv1UVg6sqDoYser0haP+
         DKjg==
X-Gm-Message-State: AOAM532mUByDa0zXo79YXYV9mZst2pAkj5rpRi3hWEpx8SByUbbPXZxX
	fLJ0+SslRHpRqqmXzDRS+NCprPG1FdTehYoqcPo=
X-Google-Smtp-Source: ABdhPJyBzkxpbAnjAcYH30+5JeC4fL+UQAGjJXcJHNVqJIbc3+U3+XDrfpeKzEJjDRg1ytMERd82aOE+3dsqmFR2eu8=
X-Received: by 2002:a05:6512:249:b0:479:a3c:de with SMTP id
 b9-20020a056512024900b004790a3c00demr19183936lfo.128.1654612129170; Tue, 07
 Jun 2022 07:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com> <6f177e81-9c97-0f7f-2f79-88cc4db83e02@citrix.com>
 <6d6b14ad-2a0d-c7aa-d835-3131f83e0f68@apertussolutions.com>
In-Reply-To: <6d6b14ad-2a0d-c7aa-d835-3131f83e0f68@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Jun 2022 10:28:37 -0400
Message-ID: <CAKf6xpuT1Dg1+JmXMngz0B03aqSUvW6+DOeapLvhhsLzS6_N2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"scott.davis@starlab.io" <scott.davis@starlab.io>, 
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 9:16 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
> Unfortunately the scope of what this series started out to solve, not to
> walk all the boot modules when no policy file is needed, and what the
> reviewers have been requesting be addressed is continually diverging.

You only need patch 1/3 to skip the walk, AFAICT.  So maybe you should
just submit that independently.

Regards,
Jason

