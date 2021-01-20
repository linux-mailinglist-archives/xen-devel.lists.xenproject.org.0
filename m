Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148A2FD93A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 20:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71722.128677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2IvL-0006Wy-Eq; Wed, 20 Jan 2021 19:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71722.128677; Wed, 20 Jan 2021 19:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2IvL-0006WZ-Bf; Wed, 20 Jan 2021 19:13:47 +0000
Received: by outflank-mailman (input) for mailman id 71722;
 Wed, 20 Jan 2021 19:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20gi=GX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1l2IvK-0006WU-9V
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 19:13:46 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e744a44-c1ef-41b9-b594-485d9dd0220b;
 Wed, 20 Jan 2021 19:13:45 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n11so27390682lji.5
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 11:13:45 -0800 (PST)
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
X-Inumbo-ID: 6e744a44-c1ef-41b9-b594-485d9dd0220b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xr5s3QZlCbiEuZtgWbPLVUvC90Axdr3xTcAJO6SmkJE=;
        b=Z5y74jl7Hhm1mLlxeMOk7j9XFDwTd58soP17HRRq0ec1Aevjho+oFnoEyopChsk6kn
         5BAo/IUg404i0eI+tbTvhggvTJ4lnt49Un1nbsJaoJVskReIXsOGJbK1yipDJHk0nBUf
         d9Ywi7vBQrp7MNp75c8oGUi50IZvUkpp1pozF2peyNcnJWearbgT7ctm09kM2ecItaFH
         CfUfxjC+SXLkKtbmffdgA+WsJ9Xr9BagwnF0wRyeWpuleK9b0zrt1tsnHEkoPIs4pZMM
         Ra0UIXegmzjuxvs4o5HYtyXzIntY7bGnmKvuT+LB0m+uRxnZsn6lz3NwHSANP/OHacG2
         T6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xr5s3QZlCbiEuZtgWbPLVUvC90Axdr3xTcAJO6SmkJE=;
        b=Q3QWzGFFUlqzM6kOT1FlooZBr7mugv/Wn1nEu/nnmBUngHotdNisBsFrseA8qk21sN
         fGu1IMfXFb/hDx3dMZyGkGKomEii7/x2tJoW82Rs8QjzesvYtWjKAxe9+SEf66Tr0xjy
         cdrvoB6FqkhKM/R2T6Q99A5I6oNM+8DM0Poc877HEZhVQ6x8pJXMwzHXmGFT8n8r3Sx/
         TmFKXt9BxO9oITwH5k5DLrrkxTHZS6v4i9gk8flR1KaQ/lh1Gcm7f8WSbx//AETIeTbz
         i5MRVTuyKVO8vWV6pUfHThdG9J97lnXD4hgjWXOl+F5LDNYp8hs3H6AdmcUVIHGLHIrZ
         IUPg==
X-Gm-Message-State: AOAM533/U0PMp49ILFf3uj+yGze44tnXMTV614+VMF7jKLhxi01DKAZP
	js3FmTtC49ILjpMFtsiOkAjzDm07q00/mrvuAAGrB95V
X-Google-Smtp-Source: ABdhPJxgxLv+AkhP2G0okW7894Dpltje8/7Znx+DnU5kMDIn6YVUW1c7ItrIe/tX1zqNDlc1jGZ+oJbo0cN68w8xUv8=
X-Received: by 2002:a2e:888e:: with SMTP id k14mr5119879lji.285.1611170023660;
 Wed, 20 Jan 2021 11:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20201019200318.103781-1-jandryuk@gmail.com>
In-Reply-To: <20201019200318.103781-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Jan 2021 14:13:32 -0500
Message-ID: <CAKf6xptj7jRAc_q4XZdB5L4xiL3rgjZtzWcunbgZYnkt8c+Hcw@mail.gmail.com>
Subject: Re: [PATCH] flask: label-pci: Allow specifying irq label
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 4:03 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> IRQs can be shared, so uniquely labeling doesn't always work.  You run
> into issues if you have domA_t allowed access to device_A_t and domB_t
> to device_B_t.  The shared IRQ can only be labeled one of
> device_A_t or device_B_t, and assignment of the second device fails
> since domA_t doesn't have permission for device_B_t and vice versa.
>
> Add the ability to specify an irq label to flask-label-pci.  A
> shared_irq_t can then be used to for the PIRQ.  The default remains to
> use the device label if an IRQ label isn't specified.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Hi,

This is useful to me and was posted before the 4.15 cut off.  Can it
make it into the release?

Thanks,
Jason


>  tools/flask/utils/label-pci.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tools/flask/utils/label-pci.c b/tools/flask/utils/label-pci.c
> index 9ddb713cf4..897b772804 100644
> --- a/tools/flask/utils/label-pci.c
> +++ b/tools/flask/utils/label-pci.c
> @@ -28,7 +28,7 @@
>
>  static void usage (int argCnt, char *argv[])
>  {
> -       fprintf(stderr, "Usage: %s SBDF label\n", argv[0]);
> +       fprintf(stderr, "Usage: %s SBDF label <irq_label>\n", argv[0]);
>         exit(1);
>  }
>
> @@ -39,12 +39,19 @@ int main (int argCnt, char *argv[])
>         int seg, bus, dev, fn;
>         uint32_t sbdf;
>         uint64_t start, end, flags;
> +       char *pirq_label;
>         char buf[1024];
>         FILE *f;
>
> -       if (argCnt != 3)
> +       if (argCnt < 3 || argCnt > 4)
>                 usage(argCnt, argv);
>
> +       if (argCnt == 4) {
> +           pirq_label = argv[3];
> +       } else {
> +           pirq_label = argv[2];
> +       }
> +
>         xch = xc_interface_open(0,0,0);
>         if ( !xch )
>         {
> @@ -107,7 +114,7 @@ int main (int argCnt, char *argv[])
>         if (fscanf(f, "%" SCNu64, &start) != 1)
>                 start = 0;
>         if (start) {
> -               ret = xc_flask_add_pirq(xch, start, argv[2]);
> +               ret = xc_flask_add_pirq(xch, start, pirq_label);
>                 if (ret) {
>                         fprintf(stderr, "xc_flask_add_pirq %"PRIu64" failed: %d\n",
>                                         start, ret);
> --
> 2.26.2
>

