Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B241DE39C
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:59:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4SP-0008I9-I2; Fri, 22 May 2020 09:59:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nXpb=7E=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jc4SO-0008Hw-J6
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:59:12 +0000
X-Inumbo-ID: e2ae8094-9c12-11ea-b07b-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2ae8094-9c12-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 09:59:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w64so9212687wmg.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vo0TO+fBgnYreyEx5cxh9gkmxSN5jFGdN8I+8XzFfYI=;
 b=iIGKOzDxHOzfvjqBSfS7f1g77I29rHX+/lqD2XcBn+DS6xhR3Eri0L8FWg9g+TI1Qg
 2ZdAyG+BtHTrU1oDhecBxLaJZqetzjyW/aevpQIbX46MsO+2eiPWV97gEDt0AM+TYs5L
 SmGjh7Y8KYg1KnX1gnbU367KOsRoySMkSAyxQ+idSUaq3a4H2ucOkKw2l/uR1WIU2Ljv
 JepXw7O1lTJU1BzYmsS4RNsmAgDXTkJuoYlkcP9Wit7VREaVfDiUPt0RFAsqSay226kR
 IItDq3QxUfaBus/JQvtGi2UY8HmdywErFBu2VTqcrNEE3FfsB1rfoPoe1TYB0PPY7sWU
 FqeQ==
X-Gm-Message-State: AOAM533Xi+g+qwUVP8tDZov0ShD9k4SsUY73wumKBYkn2pUN5pv4UnCT
 Mv1A99ufddcTQB54Z+qDnkY=
X-Google-Smtp-Source: ABdhPJxzB3s1XUsarnDILUCrUGdK5hh0Ixpcne2INW8jZxlWhT4w/lwbIsmMF/r6NtW/ae5cHPWQtg==
X-Received: by 2002:a1c:96d8:: with SMTP id y207mr5676302wmd.167.1590141551119; 
 Fri, 22 May 2020 02:59:11 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d15sm63318wrq.30.2020.05.22.02.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 02:59:10 -0700 (PDT)
Date: Fri, 22 May 2020 09:59:09 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Message-ID: <20200522095909.h3qc3mhogocdvwas@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
 <20200522090553.eegs4fcltfqjuhzo@debian>
 <9FBA46AA-9727-4AA9-A23D-B72F5AE9C35C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9FBA46AA-9727-4AA9-A23D-B72F5AE9C35C@arm.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 09:37:51AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> > On 22 May 2020, at 10:05, Wei Liu <wl@xen.org> wrote:
> > 
> > On Fri, May 22, 2020 at 08:41:17AM +0000, Bertrand Marquis wrote:
> >> Hi,
> >> 
> >> As a consequence of this fix, the following has been committed (I guess as a consequence of regenerating the configure scripts):
> >> diff --git a/tools/configure b/tools/configure
> >> index 375430df3f..36596389b8 100755
> >> --- a/tools/configure
> >> +++ b/tools/configure
> >> @@ -4678,6 +4678,10 @@ for ldflag in $APPEND_LIB
> >> do
> >>     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> >> done
> >> +if  ! -z $EXTRA_PREFIX ; then
> >> +    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> >> +    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> >> +fi
> >> CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
> >> LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS”
> >> 
> >> This should be:
> >> if  [ ! -z $EXTRA_PREFIX ]; then
> >> 
> >> As on other configure scripts.
> >> 
> >> During configure I have not the following error:
> >> ./configure: line 4681: -z: command not found
> >> 
> >> Which is ignored but is adding -L/lib and -I/include to the CPPFLAGS and LDFLAGS
> >> 
> >> What should be the procedure to actually fix that (as the problem is coming from the configure script regeneration I guess) ? 
> > 
> > Does the following patch work for you?
> > 
> > diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
> > index 08f5c983cc63..cd34c139bc94 100644
> > --- a/m4/set_cflags_ldflags.m4
> > +++ b/m4/set_cflags_ldflags.m4
> > @@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
> > do
> >     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> > done
> > -if [ ! -z $EXTRA_PREFIX ]; then
> > +if test ! -z $EXTRA_PREFIX ; then
> >     CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> >     LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> > fi
> > 
> > 
> > You will need to run autogen.sh to regenerate tools/configure.
> > 
> 
> Yes that works on my side and generate tools/configure using “test”
> 
> But why are the [] being removed when generating tools/configure ?

No idea why autoconf removed [] really.

I think switching to test is better anyway since that's what is used
throughout tools/configure.

Wei.

