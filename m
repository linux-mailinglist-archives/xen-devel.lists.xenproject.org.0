Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81858228028
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:42:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrbV-0002AW-9I; Tue, 21 Jul 2020 12:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxrbU-0002AR-4q
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:42:40 +0000
X-Inumbo-ID: a81425da-cb4f-11ea-a0ae-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a81425da-cb4f-11ea-a0ae-12813bfff9fa;
 Tue, 21 Jul 2020 12:42:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w3so2717337wmi.4;
 Tue, 21 Jul 2020 05:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tELJWANfqx4mlHBXTpXLWhk9GZg3z4LZLshklfe6VAQ=;
 b=Cp1vjdAsUVVDpjtVKHpUGBe4r/3z59eFIqn5WpGDzZOVy3rAQ5oI4DwqFrsPwoVByD
 svVEzmE4AT+2q56oMyVMYiqdUSpr1m5m3xqrt5BxaznpgGuAgHwZtHeG3YXFnWKf5+2L
 DreUH5L4OBpOmGgX8Is1fRCc0BUIr3D0xzwPFI9IauZ4qa8Tr7MN4C4JxWxuDV32+mZj
 p6QdUCVT6s/vivE2zBAUkS+bumazk1zUQxO/mUUAf3YgllDSxLJlLaOtNjrbJdxymK1D
 qCr2pbblpH6oXw1taiVVxHAIhhmInjDRcj0YJNo1yCj1HkGxmPCD0PJ6SW3SWoTNM+jl
 QKyw==
X-Gm-Message-State: AOAM530NLl0g+stKhvWx82gOvLRFTdbpuvzNwY5MOtOrFmFIiIHNBcw2
 8urQy1b/CcruULTefItveZY=
X-Google-Smtp-Source: ABdhPJysXW0HJF3DUf8MVNwlk735cjCrddyvm8JU58tgCSG0CcXRlr232Icr/zmIqv6CUSFjbNtfuA==
X-Received: by 2002:a1c:7ecb:: with SMTP id z194mr3552455wmc.12.1595335356790; 
 Tue, 21 Jul 2020 05:42:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y6sm37664262wrr.74.2020.07.21.05.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:42:36 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:42:34 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] mini-os: don't hard-wire xen internal paths
Message-ID: <20200721124234.y2ly2xgxmqwhobdv@liuwe-devbox-debian-v2>
References: <20200713084230.18177-1-jgross@suse.com>
 <20200718181827.7jrs5ilutt3jzp4i@function>
 <20200721122122.ypuumlnwn4djwevw@liuwe-devbox-debian-v2>
 <3f8f2da2-552c-c651-5744-dfa01bd9821c@suse.com>
 <20200721123940.blw3njlbpzbd5iia@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721123940.blw3njlbpzbd5iia@liuwe-devbox-debian-v2>
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
Cc: minios-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 12:39:40PM +0000, Wei Liu wrote:
> On Tue, Jul 21, 2020 at 02:24:51PM +0200, Jürgen Groß wrote:
> > On 21.07.20 14:21, Wei Liu wrote:
> > > On Sat, Jul 18, 2020 at 08:18:27PM +0200, Samuel Thibault wrote:
> > > > Juergen Gross, le lun. 13 juil. 2020 10:42:30 +0200, a ecrit:
> > > > > Mini-OS shouldn't use Xen internal paths for building. Import the
> > > > > needed paths from Xen and fall back to the current values only if
> > > > > the import was not possible.
> > > > > 
> > > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > 
> > > > Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> > > 
> > > Unfortunately this doesn't apply to staging.
> > 
> > Since when does mini-os.git have a staging branch?
> > 
> > > Juergen, can you rebase?
> > 
> > To what?
> 
> Urgh, my bad! I thought this was a patch for xen.git. :-p

Applied to mini-os.git.

Wei.

