Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858B1DE5BA
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:42:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc63n-0002w2-Fs; Fri, 22 May 2020 11:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nXpb=7E=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jc63m-0002vu-I6
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:41:54 +0000
X-Inumbo-ID: 3b807a2a-9c21-11ea-abb5-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b807a2a-9c21-11ea-abb5-12813bfff9fa;
 Fri, 22 May 2020 11:41:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l17so9876852wrr.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 04:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Lta0CLT675UZSrc5FKSeHPcgBmKBhAoBlEaF84MSk+s=;
 b=q0DmaK01gNtPBELdxe4OVUKmN7xPpzL/GAht7n098WUpmRBR/kyCuWwQH6XnmXXqOh
 yRuBiLvnuy9Z4HGtLgJmP6FRIzn7NMnFxqC5OSRqWDSg4pfaI91jgWSKXaP7spk/PRH4
 ZSggSQkjAG3+vsyLEPKwR0YOJOc9rmMDg/tFdetf5C1aL5pOzt7XeDrBwUIP7//b1+ia
 1DqdufZQYFNV+uYDoArcrx0f63GWzpQmtes05+EyV1JQ0V1P4bTUbe6IP172Y9DTiygg
 DdWo68eEGCL17KO/0rfYxLLG979cIonfP0pB6D/3mkq1Hs+x8Xk1JhEVESdHaIVOkU06
 RfFA==
X-Gm-Message-State: AOAM530vsAvZTkTCT7RI2K/+tnXNihYbUaGpeXtCfImkieS65z8rMo1U
 FBJSuAn/N1A0Cyy8oWDCXUc=
X-Google-Smtp-Source: ABdhPJyZYzVPkWKLVkShoFhLaKYw3Sb4G9DSOxEnaJnvGTjhf0F7bFbo9otGPKk7xIMwItu5K9bAog==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr3087077wrp.230.1590147712805; 
 Fri, 22 May 2020 04:41:52 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a184sm9469377wmh.24.2020.05.22.04.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 04:41:52 -0700 (PDT)
Date: Fri, 22 May 2020 11:41:50 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Message-ID: <20200522114150.txqx7q2menpouekk@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
 <20200522090553.eegs4fcltfqjuhzo@debian>
 <20200522111940.GB54375@Air-de-Roger>
 <26610F4A-34B2-4B61-BEB2-ED2D16283B81@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26610F4A-34B2-4B61-BEB2-ED2D16283B81@arm.com>
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 11:40:06AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 22 May 2020, at 12:19, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, May 22, 2020 at 10:05:53AM +0100, Wei Liu wrote:
> >> On Fri, May 22, 2020 at 08:41:17AM +0000, Bertrand Marquis wrote:
> >>> Hi,
> >>> 
> >>> As a consequence of this fix, the following has been committed (I guess as a consequence of regenerating the configure scripts):
> >>> diff --git a/tools/configure b/tools/configure
> >>> index 375430df3f..36596389b8 100755
> >>> --- a/tools/configure
> >>> +++ b/tools/configure
> >>> @@ -4678,6 +4678,10 @@ for ldflag in $APPEND_LIB
> >>> do
> >>>     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> >>> done
> >>> +if  ! -z $EXTRA_PREFIX ; then
> >>> +    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> >>> +    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> >>> +fi
> >>> CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
> >>> LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS”
> >>> 
> >>> This should be:
> >>> if  [ ! -z $EXTRA_PREFIX ]; then
> >>> 
> >>> As on other configure scripts.
> >>> 
> >>> During configure I have not the following error:
> >>> ./configure: line 4681: -z: command not found
> >>> 
> >>> Which is ignored but is adding -L/lib and -I/include to the CPPFLAGS and LDFLAGS
> >>> 
> >>> What should be the procedure to actually fix that (as the problem is coming from the configure script regeneration I guess) ? 
> >> 
> >> Does the following patch work for you?
> >> 
> >> diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
> >> index 08f5c983cc63..cd34c139bc94 100644
> >> --- a/m4/set_cflags_ldflags.m4
> >> +++ b/m4/set_cflags_ldflags.m4
> >> @@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
> >> do
> >>     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> >> done
> >> -if [ ! -z $EXTRA_PREFIX ]; then
> >> +if test ! -z $EXTRA_PREFIX ; then
> >>     CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> >>     LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> >> fi
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks. I will transfer your tag to the proper patch I just sent.

Wei.

