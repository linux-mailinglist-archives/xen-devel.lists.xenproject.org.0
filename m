Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0433B71CF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 14:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148023.273363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyCad-0005qU-U3; Tue, 29 Jun 2021 12:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148023.273363; Tue, 29 Jun 2021 12:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyCad-0005oW-Qn; Tue, 29 Jun 2021 12:11:43 +0000
Received: by outflank-mailman (input) for mailman id 148023;
 Tue, 29 Jun 2021 12:11:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DRwR=LX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lyCac-0005oQ-Kg
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 12:11:42 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e638679c-2502-4049-be2e-ec5e1a5f19a4;
 Tue, 29 Jun 2021 12:11:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h15so38997687lfv.12
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jun 2021 05:11:41 -0700 (PDT)
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
X-Inumbo-ID: e638679c-2502-4049-be2e-ec5e1a5f19a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xb8hQI+wE43pCRiBedZ9Z+fQ8WfeuCfjS/51Qh7sNpk=;
        b=N6hfdzHeQxpuDGQJg76RdW7Z95jQ1GDBKFpFq4cHo9dxGGJaJA77MN2Xn7KeqdOk5z
         4rEL0ptkk5yeM6WJi40nmw6pssKmcwjkzYkZscv4EOD4svhjx+vB12ngUsnK2FDDMILM
         d/n+x+6A7X4vLytkwSw/TVBlNjdy6UnqUMupTmC/2kJMxUeV7YdtCinh4Iq8ijffW9Zx
         shzRUwYcYU6TzE35FlZtPdE6NxnYTvK00916F4Ep7X76WdFrBgIMrzrlV40NsxAnfDD8
         BfhgcMJ9W1wPCsYPlyhmj/ByVgVO8xiniHKn55RkFGuga8iPdIFw4wiZDSJxhPYV/Hm+
         sgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xb8hQI+wE43pCRiBedZ9Z+fQ8WfeuCfjS/51Qh7sNpk=;
        b=sAxTXG7Hdgnb7JahAdGG+Q6wDOdMVm4oLg9WZW22Snhi+l9M2ZtCDemqpxGle30cZ7
         4eJjep9SmiYcDf22kJYVzjTFmE38EgKs62ChAw2ZsxOSLzuJfS3TH/bSvmcCI5Y9/+Em
         Q6Kc2xJmXF4GVsSL+Cx4PbBnEGvCRbR4zsG8tBIVf5MNHRvs3KQsEGFsnH2tTR0FudqZ
         z4MWRDFVk8Ic80krDJB9CDMJqKLyo5NsaNGoOk2qL/nOW0svzppWFPux3WwBOCg0ARDB
         WXE9ohrPjAfYmUe5IerUGFWmcEEYnCtd5HJCQ72kP6UEJ7gAPrElaZ8SibXip9uteaLe
         Ppog==
X-Gm-Message-State: AOAM533JsIVylRt/JpRVCC9n0EdPpLDUrQjHPxkVcvof6D21WbaDyAoP
	GEr3NVgzFJdTXq36tA8R/OlD+f1GfJR0sY9/OHs=
X-Google-Smtp-Source: ABdhPJzMkE61pUjXKYrYhlRUIYucoUGKAW7Yz3A2KBcXdiB6JqTj9NupDqRK2/AEmyu4Y2Ozqq+Fxd4ZhjWM+bGKvpI=
X-Received: by 2002:a19:c147:: with SMTP id r68mr22016546lff.226.1624968700973;
 Tue, 29 Jun 2021 05:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210628100157.5010-1-anthony.perard@citrix.com> <20210628100157.5010-2-anthony.perard@citrix.com>
In-Reply-To: <20210628100157.5010-2-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 29 Jun 2021 08:11:29 -0400
Message-ID: <CAKf6xps7w0_zT2iecRvq9UkZfqvqLqMo_p4BwZ1Oife37O2sFA@mail.gmail.com>
Subject: Re: [XEN PATCH 1/2] libxl: Replace short-form boolean for QEMU's -vnc
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 6:02 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> f3f778c81769 forgot one boolean parameter.
>
> Fixes: f3f778c81769 ("libxl: Replace QEMU's command line short-form boolean option")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

