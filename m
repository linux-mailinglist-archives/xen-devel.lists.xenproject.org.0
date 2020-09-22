Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19E274311
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:31:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiNk-0001Ke-K0; Tue, 22 Sep 2020 13:30:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDGT=C7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kKiNj-0001KI-Hm
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:30:55 +0000
X-Inumbo-ID: 75bd52ec-71d5-4989-9052-3ceabc3ef216
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75bd52ec-71d5-4989-9052-3ceabc3ef216;
 Tue, 22 Sep 2020 13:30:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x14so17050250wrl.12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 06:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ggdKjtuWpSCk++gr+QRvXr189JLC3m1f9EyChAZehoM=;
 b=p3B6b9xX9OI9iF7d0sFCJSPOcaDxaeIFM7a7gbuUz3u3zKTYWkjff8NHorRsIshEzm
 thgxAVhnB6ycfLnFLWiwL8Ahmge8c6Y/bMqjpBklWTAnIe8QMVUVT/jFhL+Kje9lRbJs
 4cdnjyui0UbiwRTQu/Ky15x1qBtCk2vuhx3Psc4SCQfAKOc4NJaTto4a9UDg60PDxrXo
 8GxgLmgJKdlTRrMOG0QLV//dEFtgNtzQj0Za/1xv22cT637KB8R7YQ2pbg5N88qrtIDB
 /NyRAJ8uYK7MSWLZWWrjNTiLljQRkcr0rNUyb7ScbeXv3dqtC12alL+eQZnIvcv6vgLy
 POTw==
X-Gm-Message-State: AOAM530lzRh/fg9MizDGsyvONwfcwPpORlM+M4OtszPkX1qfhDfJ0aGU
 Z40LB1u61rpRI4f3sEX+zp/fC73QTfY=
X-Google-Smtp-Source: ABdhPJx2bfkS7gnp4Mb3Ehu/vHEsW/Y6/jYjo3uzY6pM95EFBmCVQeRcoUPxw8IiZKP1lmAkitKYXg==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr5405042wru.30.1600781449153; 
 Tue, 22 Sep 2020 06:30:49 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d18sm26685178wrm.10.2020.09.22.06.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 06:30:48 -0700 (PDT)
Date: Tue, 22 Sep 2020 13:30:47 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dmitry Fedorov <d.fedorov@tabit.pro>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
Message-ID: <20200922133047.4646b2ab62cszn46@liuwe-devbox-debian-v2>
References: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
 <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 04:27:45PM +0100, Andrew Cooper wrote:
> On 14/09/2020 15:50, Dmitry Fedorov wrote:
> > Hi,
> >
> > Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
> > an issue where a device model stub domain doesn't have maptrack entries.
> >
> > Would it be possible to apply a user defined max_maptrack_frames value
> > to dm_config in the same way as for max_grant_frames?
> >
> > Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>
> 
> This looks entirely reasonable.
> 
> CC'ing the maintainers for their opinion.
> 

Looks fine to me.

Acked-by: Wei Liu <wl@xen.org>

> ~Andrew
> 
> > ---
> >  tools/libxl/libxl_dm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> > index f2dc5696b9..f044f2566c 100644
> > --- a/tools/libxl/libxl_dm.c
> > +++ b/tools/libxl/libxl_dm.c
> > @@ -2292,7 +2292,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc,
> > libxl__stub_dm_spawn_state *sdss)
> >      dm_config->b_info.target_memkb = dm_config->b_info.max_memkb;
> >
> >      dm_config->b_info.max_grant_frames =
> > guest_config->b_info.max_grant_frames;
> > -    dm_config->b_info.max_maptrack_frames = 0;
> > +    dm_config->b_info.max_maptrack_frames =
> > guest_config->b_info.max_maptrack_frames;
> >
> >      dm_config->b_info.u.pv.features = "";
> >
> > -- 
> > 2.26.2
> >
> >
> 

