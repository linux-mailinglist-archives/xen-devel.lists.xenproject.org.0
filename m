Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB51E26D0
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 18:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdcKo-0002eO-Eq; Tue, 26 May 2020 16:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LE0D=7I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jdcKn-0002eJ-L3
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:21:45 +0000
X-Inumbo-ID: fdbb4c66-9f6c-11ea-8993-bc764e2007e4
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdbb4c66-9f6c-11ea-8993-bc764e2007e4;
 Tue, 26 May 2020 16:21:45 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id v15so9706737qvr.8
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=3e404zhK40BBVf7jsCAC5LYdQeS8cu+XadHO8+AJo8Y=;
 b=JfU+f55wOh00HAi9EVvVIEWjX0/DFX8tR92LwZHVa53x6dsayBt6d4sUevz5RMkHGr
 XjE4eZuBCvDp2o0AFz4jWzTvVLxAa/qxZ9Pc3uCd6T5wbaLtf8GchrGC4Bnm6dTsIOmY
 wVnyLGVMC+ppztqiadNB1I2d4BJoaA8hdp3Vu94CMOR0L9EpQUM3JilRXOrStUl0dBak
 JkoX8qZPhA8M2Px44899D0Qz20Wywqd4fTcG4fCaKTLjYeQOPAupmGPi70/uC40cJ2T/
 WC1jzAh9x5qaQ9cpnaF57noCnLHVBY9XMrYwkpc/M66t1aLZ+4A+xkSSWCX0hJ974Y13
 Zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3e404zhK40BBVf7jsCAC5LYdQeS8cu+XadHO8+AJo8Y=;
 b=S9r/WKv738kWXY5Wgq49rflIdHIfTas2dGY6xt7bTlMxX99u1IfBJe5ukcifQ8L49J
 Rv54bd9iRLCyJrQkRzZuXhwpUp3U6rn2PFhO5DiVorTrgzp33RCsO65+OZlGVvjZ5Jh1
 nMFFQjiUa7X+UmfKhKz57PKU/0a/u9e5YCMUMe0o1Jzdr43cdHasC9drkNMDerIHJnEV
 2TxKQ1Cjf5KX6qstwBe9yuVvPQazwn9R4dI6V4W3NabSRvT4OMpqeuFZfn9Hm+pinmeH
 we32MN8bPIEQmC+SjMRal0ZQl1p/BovRDaEEKaYJ+8TYogWZwj9Mday45t2iJJIB3trj
 2zLA==
X-Gm-Message-State: AOAM530XySmg2+GD2rc8TNbPMPQvSlflNVPCXdWpxilgjICRhouKZnwy
 aqubI46J3+MgCJ/q4XUIaNo=
X-Google-Smtp-Source: ABdhPJyk210gdYaFNoalUbVRBrirbIXc9vU7rJ2kINFf/hkQ3yWyLfV4iDIgNg2R5EF9KENl4FhdlQ==
X-Received: by 2002:a05:6214:1392:: with SMTP id
 g18mr19512692qvz.210.1590510104681; 
 Tue, 26 May 2020 09:21:44 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b189sm54033qkg.110.2020.05.26.09.21.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 May 2020 09:21:43 -0700 (PDT)
Date: Tue, 26 May 2020 12:21:41 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: [PATCH 5/5] gitignore: Ignore golang package directory
Message-ID: <20200526162141.GA28056@six>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
 <24269.8059.28506.353748@mariner.uk.xensource.com>
 <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> With golang, you don’t really distribute package binaries; you only distribute source files.
> 
> However, we don’t want to wait until someone tries to clone the package to see if we’ve broken the build; so the current makefile does a “build test” of the package files.
> 
> Before golang’s “modules” feature, the only way to do this was to have the code to build inside $GOPATH/src/$PACKAGENAME.  We can set GOPATH but we can’t change the “src” component of that.  So we used to set GOPATH to $XENROOT/tools/golang, put the files in $XENROOT/tools/golang/src/$PACKAGENAME, and 
> 
> With the “modules” feature, code can be built anywhere; the build at the moment doesn’t require GOPATH.
> 
> If we’re willing to limit ourselves to using versions of golang which support modules by default (1.12+), then we can probably get rid of this bit instead.  (And if we do want to support older versions, we should really add some code in the configure script to determine whether to build with modules or GOPATH.)
> 
> Nick, any opinions?

I can't think of a reason we need to support anything older than go
1.11, so I think it would be fine to get rid of remnants of the GOPATH
build.

-NR

