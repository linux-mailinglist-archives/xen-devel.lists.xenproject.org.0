Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A178922801D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:40:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrYk-0001P0-Oq; Tue, 21 Jul 2020 12:39:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxrYk-0001OZ-27
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:39:50 +0000
X-Inumbo-ID: 40565e04-cb4f-11ea-a0ae-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40565e04-cb4f-11ea-a0ae-12813bfff9fa;
 Tue, 21 Jul 2020 12:39:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y3so3697350wrl.4;
 Tue, 21 Jul 2020 05:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yYk/n9bSJ9lpUEb/G+eXAQy/jJCRVpTKTHSuMovV7kY=;
 b=R4pKLxpzy5LZTjYYA67Jxg9l28RnXRsWOJwfNGtlQPS0AG8PZ3XFL8ENudop4UreCE
 WKjiLCItKpQ0mVGO6nqO38m0GXSBoyqr8R9XINTkTbSft7wq3/NOQ52mFizKDRU2YmOc
 rP2ZIEXWfGo9UWXfgclCdNZKtSx6FAocz0szVFW//5z1BGiC8iqIZBvCry4nfzQj2Al7
 D7sMqsSNrbn2xGG6lgiBx3/aTXanmad9Q5vW+4rLKo0Eulj4L1jUcOK0/NSsHhUntuQF
 iPASDnD5MTShcXy1IZ0APqIwlCpw/q0Zb14yZClseFH1SMLxpPYj9E/QrrNh+o8a7v6x
 Iv6Q==
X-Gm-Message-State: AOAM53295sUiV6mlLnVoAD5agYYio7ljrErSf/gT+2c/b9t3xITL18ky
 en5cFdSUNKqsXpRWTrWLtyU=
X-Google-Smtp-Source: ABdhPJxQFBI+NVd6cWdmZezxXmsyzRI73/sZyomF7mD/wbR25S6xZBigGFS8km4RSDSPly+vrl2J8g==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr4100912wrf.309.1595335182708; 
 Tue, 21 Jul 2020 05:39:42 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v15sm3239420wmh.24.2020.07.21.05.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:39:42 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:39:40 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] mini-os: don't hard-wire xen internal paths
Message-ID: <20200721123940.blw3njlbpzbd5iia@liuwe-devbox-debian-v2>
References: <20200713084230.18177-1-jgross@suse.com>
 <20200718181827.7jrs5ilutt3jzp4i@function>
 <20200721122122.ypuumlnwn4djwevw@liuwe-devbox-debian-v2>
 <3f8f2da2-552c-c651-5744-dfa01bd9821c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f8f2da2-552c-c651-5744-dfa01bd9821c@suse.com>
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

On Tue, Jul 21, 2020 at 02:24:51PM +0200, Jürgen Groß wrote:
> On 21.07.20 14:21, Wei Liu wrote:
> > On Sat, Jul 18, 2020 at 08:18:27PM +0200, Samuel Thibault wrote:
> > > Juergen Gross, le lun. 13 juil. 2020 10:42:30 +0200, a ecrit:
> > > > Mini-OS shouldn't use Xen internal paths for building. Import the
> > > > needed paths from Xen and fall back to the current values only if
> > > > the import was not possible.
> > > > 
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > 
> > > Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> > 
> > Unfortunately this doesn't apply to staging.
> 
> Since when does mini-os.git have a staging branch?
> 
> > Juergen, can you rebase?
> 
> To what?

Urgh, my bad! I thought this was a patch for xen.git. :-p

Wei.

> 
> 
> Juergen

