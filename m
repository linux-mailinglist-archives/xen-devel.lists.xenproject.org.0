Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC61D940B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 12:07:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaz8u-0005km-9O; Tue, 19 May 2020 10:06:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mazm=7B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jaz8s-0005kh-T8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 10:06:34 +0000
X-Inumbo-ID: 6ac97018-99b8-11ea-a8eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ac97018-99b8-11ea-a8eb-12813bfff9fa;
 Tue, 19 May 2020 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=MFa7Bhv3NLCsM2M0nsBmdqB1BOouQkXDgO8AR5eNfW8=; b=qA/0Cxx+XE4L+I84iKZuGtIi2K
 Z1ADjqWXkHyh4bXaSjzsH5bm/ugaWaorY0u0FiBCCfv9bbqKjzRXpkvEAJ3uWGzduOZYOsBzUFU3X
 1Gpyqx1Sm4UUBT+Whjs5xUSA84b+F3De5NnCuF2/dZV+0Rzqm2a5dqqGLW/g+JElAGTM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jaz8q-0005OI-Ch; Tue, 19 May 2020 10:06:32 +0000
Received: from 96.142.6.51.dyn.plus.net ([51.6.142.96] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jaz8q-0000lc-39; Tue, 19 May 2020 10:06:32 +0000
Date: Tue, 19 May 2020 11:06:29 +0100
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 1/2] tools/python: Fix install-wrap
Message-ID: <20200519100629.pnozlsd5ozc6gfvl@debian>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
 <20200311175933.1362235-2-anthony.perard@citrix.com>
 <20200519085815.nswits7owiutn3nc@debian>
 <20200519094222.GB2105@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519094222.GB2105@perard.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 10:42:22AM +0100, Anthony PERARD wrote:
> On Tue, May 19, 2020 at 09:58:15AM +0100, Wei Liu wrote:
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > 

Haha :-)

> > On Wed, Mar 11, 2020 at 05:59:32PM +0000, Anthony PERARD wrote:
> > > This allows to use install-wrap when the source scripts is in a
> > > subdirectory.
> > > 
> > > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > > ---
> > >  tools/python/install-wrap | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/python/install-wrap b/tools/python/install-wrap
> > > index 00e2014016f9..fef24e01708d 100755
> > > --- a/tools/python/install-wrap
> > > +++ b/tools/python/install-wrap
> > > @@ -44,7 +44,7 @@ shift
> > >  destf="$dest"
> > >  for srcf in ${srcs}; do
> > >  	if test -d "$dest"; then
> > > -		destf="$dest/${srcf%%*/}"
> > > +		destf="$dest/${srcf##*/}"
> > 
> > This seems to have changed the pattern from "Remove Largest Suffix" to
> > "Remove Largest Prefix".
> > 
> > What does it do in practice?
> > 
> > For POSIX sh
> > 
> > x=posix/src/std
> > echo ${x%%*/} -> posix/src/std
> > echo ${x##*/} -> std
> > 
> > I would think the former is what you want. But I could be missing
> > something obvious.
> 
> The former is a noop. It's the same as not doing anything.
> 
> Unless x="dir/dir/" and in that case, the %% would remove everything,
> resulting in an empty string.
> 
> $srcf contains the path to where the script which we want to install is,
> which is a relative path from where the ./install-wrap is executed from.
> $destf is the final destination of the script, but if $dest is a
> directory, then ./install-wrap wants to install the script in $dest, not
> in some sub-directory of it. ./install-wrap doesn't handle this
> sub-directory it fails to execute when there is one. (It's probably the
> $install that failed to copy $srcf in a non-existing directory.)
> 
> This from the next patch is probably where things fails
>     $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)

I see. Thanks for explaining.

Acked-by: Wei Liu <wl@xen.org>

> 
> -- 
> Anthony PERARD

