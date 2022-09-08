Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FAF5B23B8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403535.645670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKYx-0006lu-3O; Thu, 08 Sep 2022 16:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403535.645670; Thu, 08 Sep 2022 16:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKYx-0006it-0T; Thu, 08 Sep 2022 16:39:35 +0000
Received: by outflank-mailman (input) for mailman id 403535;
 Thu, 08 Sep 2022 16:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4jV=ZL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWKYv-00068U-0t
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:39:33 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08f2dec-2f94-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 18:39:32 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id u9so39423705ejy.5
 for <xen-devel@lists.xenproject.org>; Thu, 08 Sep 2022 09:39:32 -0700 (PDT)
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
X-Inumbo-ID: d08f2dec-2f94-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ikluf8e3QSda96uKF/vkS8E/GZVzqkjV8CfGxf9WSz8=;
        b=GTinL6w1wbQ310pf/hiYqfYyDA6zAJ7ir8t6QpyFPW3CDLhvYP1UO1HwWzF2d7fV/H
         RMtEciAXBqxRgOIp0OHgCsULyDl41mwpNgVVgx88cpZ4K0QHd6vNU6IeVo/W7u6NCOvJ
         Dc2rfhm0JsRELFkcBLkn90muv8TGQvMBjN6w1JNUBXdmA7xwU8oU9kuq0osmidd1cxoL
         DxydOQRO1+lcwNFaO2oqsrNIsM0+AMk32riNKowIjdxavFZ6tBdSLPp5W7r4zaGbr4nK
         zwwlcXJ7EFpPpgsIfSG9z1ws2wZqGBsZNkEPW+8vdoOp7b1SP3C9t6C6/g+Z9QdREsO+
         pLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ikluf8e3QSda96uKF/vkS8E/GZVzqkjV8CfGxf9WSz8=;
        b=NVOVXUsvqKsHK+KdPiG/CLz84uETgrR4oiPn/Un41uK3y8z5Q8myJLD9nIpgfLdjhd
         pVlPNEd2T+XQg6wcxMeFZ4XW5TRPLCOeC2NsYjTOvvG/JOxCXtQUkAroC1J3ld7HUeNm
         E3+iHDgiMKQFgDyftvk8+YtRsbQcG5GaTr+RCor31YprovMq6n8Drl9HMTlni1zH+dZV
         ejlQ+Y3BBeVbDeWCdeHG81B4uZ4rFR6oeTGmsaAJ2QtBo5iVPCqRhjXt0q8PCybF5n6r
         w75UpaYejyarNwK74oy95ncA3Gi6c9NvEu/rSdRvHKtNCR8KRVkP5/CHXtteVFomlCSe
         AFzw==
X-Gm-Message-State: ACgBeo16R7m4ou1H4uPKX6DgkDM+w+P7UjxZswOo+gcCBoD6pWHR5ihT
	E4pTihozWEAAsR31BmfGD5xAovw5hnq3JgDLWkU=
X-Google-Smtp-Source: AA6agR4+APZPNPzujT2m/y6WXbqxzmpuXoJyZPk4mt6C98gne2owIogNl7xkQ8c4e7mkb6UqJiHRQgSKR/Y0x0mmn+4=
X-Received: by 2002:a17:907:2ce7:b0:741:6e62:4558 with SMTP id
 hz7-20020a1709072ce700b007416e624558mr6820741ejc.273.1662655171767; Thu, 08
 Sep 2022 09:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220810194827.103428-1-jandryuk@gmail.com> <20220810194827.103428-4-jandryuk@gmail.com>
 <Yxnqw7wLlkMtijDK@perard.uk.xensource.com>
In-Reply-To: <Yxnqw7wLlkMtijDK@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Sep 2022 12:39:20 -0400
Message-ID: <CAKf6xpuA=nZhFNcS-i8gso+FjpAZo-aVj+sM1MwpKrV_KaGQLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] xl/libxl: Add OEM string support to smbios
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 9:14 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> On Wed, Aug 10, 2022 at 03:48:27PM -0400, Jason Andryuk wrote:
> > Add support for OEM strings in the SMBIOS type 11.
> >
> > hvmloader checks them sequentially, so hide the implementation detail.
> > Allow multiple plain oem= items and assign the numeric values
> > internally.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  docs/man/xl.cfg.5.pod.in           |  4 ++
> >  tools/golang/xenlight/types.gen.go | 99 ++++++++++++++++++++++++++++++
> >  tools/libs/light/libxl_types.idl   | 99 ++++++++++++++++++++++++++++++
> >  tools/xl/xl_parse.c                | 15 +++++
> >  4 files changed, 217 insertions(+)
> >
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 7edf5d23f3..7947bf07ea 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2104,8 +2104,12 @@ Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
> >
> >  =item B<battery_device_name=STRING>
> >
> > +=item B<oem=STRING>
> > +
> >  =back
> >
> > +oem= strings can be specified mutiple times up to a limit of 99.
>
> This could be move to just before =back I think.

Moved like you suggest, the man page output is:
"""
           oem=STRING
               oem= strings can be specified mutiple times up to a limit of
               99.

       ms_vm_genid="OPTION"
"""

I'll also re-word to "oem= can be specified up to 99 times."

> > +
> >  =item B<ms_vm_genid="OPTION">
> >
> >  Provide a VM generation ID to the guest.
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index d04207748e..58f404af37 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -436,6 +436,105 @@ libxl_smbios_type = Enumeration("smbios_type", [
> >      (15, "enclosure_asset_tag"),
> >      (16, "battery_manufacturer"),
> >      (17, "battery_device_name"),
> > +    (18, "oem_1"),
> > +    (19, "oem_2"),
> > +    (20, "oem_3"),
> [...]
> > +    (115, "oem_98"),
> > +    (116, "oem_99"),
>
> Instead of this long lists of enum value, could we just have one "oem"
> type, and allow it to be used more than once? I know that would mean
> having a special case in libxl, but that also mean that libxl will be
> the only one to deal with the implementation detail on how to write oem
> string for hvmloader (as opposed to deal with this in every application
> using libxl).

I'll pursue a single "oem" type.  Also, I'll check the count in both
libxl and xl.  While only the libxl check is needed, it seems better
to detect issues while parsing the config instead of only later during
the domain build.

Thanks,
Jason

