Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6127FD9A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1181.3913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNw68-0007jy-A5; Thu, 01 Oct 2020 10:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181.3913; Thu, 01 Oct 2020 10:46:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNw68-0007jZ-6m; Thu, 01 Oct 2020 10:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1181;
 Thu, 01 Oct 2020 10:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNw65-0007jU-St
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:01 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03c6abc4-b95a-4d27-b81a-d4e5c923de3e;
 Thu, 01 Oct 2020 10:46:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z4so5120985wrr.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q12sm8370065wrs.48.2020.10.01.03.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:45:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNw65-0007jU-St
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:46:01 +0000
X-Inumbo-ID: 03c6abc4-b95a-4d27-b81a-d4e5c923de3e
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03c6abc4-b95a-4d27-b81a-d4e5c923de3e;
	Thu, 01 Oct 2020 10:46:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z4so5120985wrr.4
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1w/r3HI2q9NYFccaKwJBM3EJgliC7iBndo7ofno+z6E=;
        b=UHWLEyBs4C2yB/dDiJHNMZLTNgabzWG7wJ6WS1yk7tUbUgqIC4b6+ATsgd0AyQiIt0
         hi4Lz9ShUNEuKkBXfKGA02Q9hyX4RZ/mknDI8jhprLNKn/MmLR0O5Wbw0stN8YDv2IcS
         Wm1fdmrIleSxZNENxrBUJ5hcWMu8R1/G2eKsZQ1CdD28w9KfI5WPZDf6Z12/wU6bnALc
         HaHX0PHD0Qb0cJUQ8aClsTEI4PYVfttMyr2DkTzLS+QdsEkCCM75TkYELPc7oltzMivn
         BsvLkKquvvKdcaVpNADGtxPf1kg7lCLpQoj63gUqzhTPVvP6FOsDN4lJ0t/c8k08cB5I
         sfAw==
X-Gm-Message-State: AOAM532/2w1IE75HMGKobigwemgNZn7ve56aHnyXoKUbdRb4j2ConRCy
	4J/BSNPJq+tkniHBDDb+N48=
X-Google-Smtp-Source: ABdhPJxzjIK4hfFjtzblzYemBPxNxr75vZfECxRUpb4oxofsmcJ96ZvfWlIt+Mjl7ODRkKWqQXfMwg==
X-Received: by 2002:a5d:44cc:: with SMTP id z12mr8445689wrr.189.1601549160198;
        Thu, 01 Oct 2020 03:46:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q12sm8370065wrs.48.2020.10.01.03.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:45:59 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:45:57 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 29/31] tools: rename global libxlutil make variables
Message-ID: <20201001104557.5scj3po3s3fsx6tx@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-30-jgross@suse.com>
 <20200907155511.jhpucgrvmthhzlmv@liuwe-devbox-debian-v2>
 <c908bdee-3ab6-6a4b-0c93-e38116a98a5c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c908bdee-3ab6-6a4b-0c93-e38116a98a5c@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Sep 07, 2020 at 06:16:32PM +0200, Jürgen Groß wrote:
> On 07.09.20 17:55, Wei Liu wrote:
> > On Fri, Aug 28, 2020 at 05:07:45PM +0200, Juergen Gross wrote:
> > > Rename *_libxlutil make variables to *_libxenutil in order to avoid
> > > nasty indirections when moving libxlutil under the tools/libs
> > > infrastructure.
> > 
> > xl means xenlight.
> > 
> > So I think the name should be libxenlightutil here.
> 
> I don't really mind, but given that the name is completely internal
> to the build system I wonder whether the shorter name isn't more
> pleasant.

Oh, yes. It is just an internal name. That's fine then. There is no
point in quibbling about this further.

Acked-by: Wei Liu <wl@xen.org>

> 
> 
> Juergen

