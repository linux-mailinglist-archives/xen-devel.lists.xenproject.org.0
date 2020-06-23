Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6552047FC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 05:37:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnZjF-0006Zt-96; Tue, 23 Jun 2020 03:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVA3=AE=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jnZjE-0006Zo-DQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 03:36:08 +0000
X-Inumbo-ID: ac143746-b502-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac143746-b502-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 03:36:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h5so18962220wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2020 20:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D4wqSIKGFsCHRVPBqjkiTbY/zH06jC+fIhRvgpJIiRU=;
 b=Y8mu6Abx12+ismB6uSJQcWNz1U4KObb1fv+ZO/HCEIUMDU0tFskFQ/uZP+ppekSRqD
 e5DLnGx4+7C1QE1E8NsiSCcXKhlgJNqVyBcHJ7M74Q+J07azDm7BhGXAK4S7SM2nksH0
 jc3TYfPhHiXOeVEtepLo6MmhstAlAdTTzmYT9hy/KLfvnCsnGqaMXD2aAM7snsV/A0xm
 zIKnLAgRCwjZQWo/EWMLyASOV5a4tsKW/f3EaB8K8M/hCxMN3AH3S1BDbSik2advqosK
 amMmR8jjNIYjq02IFLc7TWS6Coj5GqXIAvf11Lx/+xuX1aX2d09LhVcoTzjCl7BF+ika
 XtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D4wqSIKGFsCHRVPBqjkiTbY/zH06jC+fIhRvgpJIiRU=;
 b=okUfmo5Weq3v5aEeCIx62s9hKUTO9TjPh/d/7i011l8JA5mLhCp49eXgHLx1ttzKnD
 998UkZev+I75SS52OPlcvcVT/4/gp58GGW5/tpINSluQ7jMbaQg/J8YtfbPA8K+EBw1f
 QKiC6pq0pgyrxYf+wPtZTag0BxY0TJZad3OEQXaM5dmS3q471H1lUXQ6i13Bs6gWH+bc
 muREyQlQtkwe1GR/GCviHeuz2l55frejg4w3QrI6hy1LdIKxDjyksvi0ONB+07T0n5Fd
 WaTiBKxC4jolfGtUcRS7vrcXZyiITfQuizniW+NI2/BMcuf4bNpIJS8mhuIm2n1T/DhA
 GPSQ==
X-Gm-Message-State: AOAM531QIoSCRYT6bOi0IAJGTvXq87F9Y62kQE8aHUUW5VIMNLgN1IsM
 xQhCfbrTd7HsMbiBiKo243QCiOfpDADYoIdEfh4=
X-Google-Smtp-Source: ABdhPJwq3+OdYkvL8iKBnT/liMA1JSKAnZ1WjN/qvc31cItfopI06QHOwwj2CnuqmdMz6dWbG8NJWERAd7BnTSj0BWU=
X-Received: by 2002:adf:e648:: with SMTP id b8mr23262509wrn.386.1592883366619; 
 Mon, 22 Jun 2020 20:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <1786138246.11444015.1592849576272.JavaMail.zimbra@cert.pl>
In-Reply-To: <1786138246.11444015.1592849576272.JavaMail.zimbra@cert.pl>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 23 Jun 2020 03:35:30 -0600
Message-ID: <CABfawh=uHn1dF5jXc1FpymOLESEJ7tfpxr6SZBrHJMuqeMwsqg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool
To: =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> +    rc = xenforeignmemory_unmap_resource(fmem, fres);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to unmap resource\n");
> +        return 1;
> +    }
> +
> +    rc = xc_vmtrace_pt_disable(xc, domid, vcpu_id);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
> +        return 1;
> +    }

Looks like you are missing an xc_interface_close here.

> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.20.1
>
>

