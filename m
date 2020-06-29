Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A004B20CFAC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 17:28:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpvhd-0000CU-IZ; Mon, 29 Jun 2020 15:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onlP=AK=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jpvhc-0000CP-DQ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 15:28:12 +0000
X-Inumbo-ID: 243aa470-ba1d-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 243aa470-ba1d-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 15:28:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so15777809wme.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=khkhbBVlcOb2HLOWDZBBJqUA7a5qRZ07CmJjZNbLNqo=;
 b=QeN255AHmxSrQpsrB6NwGoG9YKZP9cVBVqKB/puDYkHAN3IhWYvnzWXXsEynpbnW2k
 Zod6kYffa3DvE9qQ5XbOxATKV/z3b9GioYa8m6OeZhgwS33xTxADVKgvjPrUeWJzzeYw
 NZGUbHmNeqZvOk4iZi5Lx//jBZIuzr0QfsZ8bPb0b+0GHVsNC/jC3nZpFTQW+TOXF2mo
 yikK47OKB+FTOQoUorFXBQFdh+PV+lJirgAKdgqxsWzMsv75d8A1yqAq8MEboOIGB1Tl
 D20J4whC5fIRQudhY+HJgxLz1DKbIedH/Cea9s+ibMtYg5K6sf+eHnnntD93fW5X12+L
 IbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=khkhbBVlcOb2HLOWDZBBJqUA7a5qRZ07CmJjZNbLNqo=;
 b=T14HrLZL473HMdH78BvorQFrt3WNI0wFcGoaZSi0A1qrPWoa2lPoar6nOx8Cl1xKSh
 P8h0zjUn/hHRn0npmGuZgHx6S6p+kfY5WfKpeH9j98pzrDad/o20o2wu9GCDS3YDgGUG
 0uXKJzTwCbOG6ixqw981MsO0wdM5oxXvEryO80EbO+SZyP/gZTxXHgcU9Czr8cFlw/2O
 AX6GHP4BOKTHIj8Xu25FUdJn23WIbHqpxU3atMdpYqhy6TrerMFYA5JSZfe1S+EjbMpX
 3Bwnh8tcGIENkQxVr3k05Y+a+wes8FoiFCQ0xOjOvfG1VQgnrGEGXNOH2ruujNemugB5
 TDMw==
X-Gm-Message-State: AOAM531fR2xXopQT8kSM7x+Vk7d939miDRxNadzAUk3kXV9uKc6dTns/
 rQMko0gTBqSTmIwg8eFcFem9aPbWmOWkAnVqshY=
X-Google-Smtp-Source: ABdhPJy1fcIKKd+ndv8TKbYBlOO/yJYfRoWoHQLtNu4hmVjjevp5vBS587f/wmWXmq8gO450qjSJ+OoQNN9Kc0NSwJw=
X-Received: by 2002:a1c:b103:: with SMTP id a3mr17033456wmf.186.1593444490851; 
 Mon, 29 Jun 2020 08:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <1786138246.11444015.1592849576272.JavaMail.zimbra@cert.pl>
 <20200626114824.mt2zsbwdbed5dtwj@liuwe-devbox-debian-v2>
 <24309.63267.596889.412833@mariner.uk.xensource.com>
In-Reply-To: <24309.63267.596889.412833@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 29 Jun 2020 09:27:34 -0600
Message-ID: <CABfawhmpGEE0jq=vMicqdmf2nbMs-a4Y0nxBUN=JwOeA_H-YGQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, "Kang,
 Luwei" <luwei.kang@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 7:26 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Wei Liu writes ("Re: [PATCH v3 7/7] tools/proctrace: add proctrace tool")=
:
> > On Mon, Jun 22, 2020 at 08:12:56PM +0200, Micha=C5=82 Leszczy=C5=84ski =
wrote:
> > > Add an demonstration tool that uses xc_vmtrace_* calls in order
> > > to manage external IPT monitoring for DomU.
> ...
> > > +    if (rc) {
> > > +        fprintf(stderr, "Failed to call xc_vmtrace_pt_disable\n");
> > > +        return 1;
> > > +    }
> > > +
> >
> > You should close fmem and xc in the exit path.
>
> Thanks for reviewing this.  I agree with your comments.  But I
> disagree with this one.
>
> This is in main().  When the program exits, the xc handle and memory
> mappings will go away as the kernel tears down the process.
>
> Leaving out this kind of cleanup in standalone command-line programs
> is fine, I think.  It can make the code simpler - and it avoids the
> risk of doing it wrong, which can turn errors into crashes.

Hi Ian,
while I agree that this particular code would not be an issue,
consider that these tools are often taken as sample codes to be reused
in other contexts as well. As such, I think it should include the
close bits as well and exhibit all the "best practices" we would like
to see anyone else building tools for Xen.

Cheers,
Tamas

