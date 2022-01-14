Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023AD48EA83
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 14:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257626.442804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MWP-0005Eh-VK; Fri, 14 Jan 2022 13:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257626.442804; Fri, 14 Jan 2022 13:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MWP-0005CU-SA; Fri, 14 Jan 2022 13:21:37 +0000
Received: by outflank-mailman (input) for mailman id 257626;
 Fri, 14 Jan 2022 13:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yvwj=R6=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1n8MWO-0005CO-HK
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 13:21:36 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55c2826-753c-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 14:21:35 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id o3so15554147wrh.10
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 05:21:34 -0800 (PST)
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
X-Inumbo-ID: e55c2826-753c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpCJcdfrLKqNtlqlNpQkl2GOld+EZGvTCm28pDy2AHo=;
        b=g/7lZB2IJBRSh7MsX1G9/5wdZ8tEnTPBO+AsAoTH8eP+9uJqAlJJDy+UNqDTv0cPMP
         mGd/R/U3eSW7+H4Dpd5UJE0A9lzhqRPWxcO7KqTtPGSHq9QXUpsbru5HBddHGaGEbMz9
         UHw5kwvdzmhhiVzUdKoFXbHYjZxQtD2eVt/AiGTr3igF+7OfLlYiuqFTwpvr2QJfsu9M
         B3w1H2kK/VAqijdD86AanlYQBbgVt8qXf7H4QoV2eVQcue2t70ek2Np3bzJAr3jI1f9U
         ZPPeJh7/k/SWRU3vD4q9Q3rBQMLUMAKnTeidZgnkOEbHcjqIjMIHQOOhTqp4fJ7xQvTr
         Yayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpCJcdfrLKqNtlqlNpQkl2GOld+EZGvTCm28pDy2AHo=;
        b=3HHsDqcwkX7ALqGHotTFDeEfXygLr0v/6/I3nNyyGOdjxNlMqoiFr6BIJAysgwethW
         Trwy3Ss/29DF0ahxazR7zRdoI9btoHmVTBxtDCB1b3cgss9ymvLTVX0eqgYlPe9pO4JO
         tcrIYI5gqpTfTRJu0vC24xGHCLQZHH0L6Yp9aiyhm2djy0yPPQ37tGj1FuQqw3yDTloj
         +W0n99eBXQi1ZcAMfqKiVsWSk4FC3F5B/W3w9gj4MjcQZ7NQB+K22sh5kyDSO00Bbk60
         34CzW/z3chHd8GuhJSWyP3gTyrbmSpl7ky2UBVC/zyh8tO+Zsgepo27wzdd7fKewFrIV
         4abw==
X-Gm-Message-State: AOAM532aN4ge6BEp5ZEIsebAm188areguhL2CAIImBt6jCXthln+STPD
	/GHbwVbEPwlJ6AlvGrSlFJ80k274O0P84IshccJnOg==
X-Google-Smtp-Source: ABdhPJxc8CSCWZXb7472Y8HujlrTP9t/PGLMn7X+NSPFgS/mqv/LOYieP4ZeGzYqbG7VrcnjaeB/NYhlUxlzXCVLTEQ=
X-Received: by 2002:adf:e907:: with SMTP id f7mr8267985wrm.319.1642166494516;
 Fri, 14 Jan 2022 05:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20220112171402.112183-1-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:21:23 +0000
Message-ID: <CAFEAcA9JiMc7O1HQAzT_G-gsr03i5bHzzvhTVo84SVT2aHdD9A@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>, Fam Zheng <fam@euphon.net>, 
	Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org, 
	Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	"Richard W.M. Jones" <rjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jan 2022 at 17:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to db608fb78444c58896db69495729e4458eeaace1:
>
>   virtio: unify dataplane and non-dataplane ->handle_output() (2022-01-12 17:09:39 +0000)
>
> ----------------------------------------------------------------
> Pull request
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

