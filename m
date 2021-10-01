Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70F41E907
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 10:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200491.355017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDoI-0006XE-5p; Fri, 01 Oct 2021 08:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200491.355017; Fri, 01 Oct 2021 08:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDoI-0006UB-1k; Fri, 01 Oct 2021 08:22:26 +0000
Received: by outflank-mailman (input) for mailman id 200491;
 Fri, 01 Oct 2021 08:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBg0=OV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mWDoG-0006U5-23
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 08:22:24 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34f88ce9-e327-472e-8cec-96ba0c1942c0;
 Fri, 01 Oct 2021 08:22:22 +0000 (UTC)
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
X-Inumbo-ID: 34f88ce9-e327-472e-8cec-96ba0c1942c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633076542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZiGk4NDtrVug4ya2/5PA4fG3vz7ezTa7Zl8doUDMxSQ=;
  b=e6zL2uFw/HEs2oUjbJwpWUCkOCTq6VcvYSi+gAopy3Lj4PYp9umMhoyn
   87tgit01Vu3AP/wqHXULCWLL7sTakCXdyRWPFpApcCex37AkWk60js2Sg
   dRleklU0u+mzV2llo11LZlwQbrijD6V9ttYe71mnt9vTKIBdWe1hFAFAC
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xjNuC5huCGOgSsZo8JWW09tuGFvRFIs9PxbBPY+iAPb15W/Ohc8HgpPHXmqcjeM9qc2ESbmm1o
 xn1Bwy+a1/9+4yA568AsXGqOIYxIaGI6q3R6KrWJMeABWPveoOCYoio3Pga6ea2PWJKXUlMNOl
 sQK7LgR28t0q5frvhRozzwYkhCyJ9zK4CvhrXVxNdD8eAQHfD78Z7jUojOILQnJ5Xt48GYhIEK
 rs+kMw4Alykl5EgXmKP8XfoH7tcvlV2uEGZW2esPvUGSy5dzfjMGH9GSLh+D3ILijGNyBwcWdj
 t3PqoGB3WuAi3zrGrfEl9Oti
X-SBRS: 5.1
X-MesageID: 55941337
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2FpJxaiMeUcNhNF9qhNf6vHOX161vBcKZh0ujC45NGQN5FlHY01je
 htvWD2PPaqDYDb8e9BwaIy19kgFsJ7cnYRlQAZqpS9hQSgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1A7LihECFyYZTu28M+ED9AMz93ZaFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauDN
 pZAMmEwBPjGSzFmY1gHK5gypsPyukTOUiJZiX/FlJNitgA/yyQuieOwYbI5YOeiTsxPkkGVj
 mnP5Wj+D1cRM9n34TOD7nKrgP6JhS7hUZgePLK9//9uxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEAJFxpQMfp96/YUBhsJl
 XmRv83gXTBg5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqVEI88QffdYsndXGGom
 m/W/EDSkp1J1aY2O7OHEUcrat5GjrbOVBJ9wgzKUm+/4gp9aeZJjKTzsgODvJ6swGuDJ2RtX
 UToeeDCsYji7rnXzURhpdnh+pnyu55p1xWG3zZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiDxNfUoONzoVpR7pUQFKTgDfquIBjapSsIvHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrTYf1U6SD1/Ua+5LHFIU9UNopm5X9zgp
 hmVMnK0AnKk7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:MoPd6aHBnsQ+/4TLpLqE0MeALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZMgpHnJYVcqKRUdcL+7VJVoLUmyyXcx2/hpAV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyJMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.85,337,1624334400"; 
   d="scan'208";a="55941337"
Date: Fri, 1 Oct 2021 09:21:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Add qemu to debian:stretch container
 for smoke test
Message-ID: <YVbFGqWEMIVyr1JY@perard>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
 <20210930161720.825098-3-anthony.perard@citrix.com>
 <c242d263-25e1-1540-419b-11c74b2719d5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c242d263-25e1-1540-419b-11c74b2719d5@citrix.com>

On Thu, Sep 30, 2021 at 06:05:44PM +0100, Andrew Cooper wrote:
> On 30/09/2021 17:17, Anthony PERARD wrote:
> > --- a/automation/scripts/qemu-smoke-x86-64.sh
> > +++ b/automation/scripts/qemu-smoke-x86-64.sh
> > @@ -6,9 +6,11 @@ set -ex
> >  variant=$1
> >  
> >  # Install QEMU
> > -export DEBIAN_FRONTENT=noninteractive
> > -apt-get -qy update
> > -apt-get -qy install qemu-system-x86
> > +if ! type qemu-system-x86_64; then
> > +    export DEBIAN_FRONTENT=noninteractive
> > +    apt-get -qy update
> > +    apt-get -qy install qemu-system-x86
> > +fi
> 
> I'd just delete this all.  It's wrong for running smoke tests in other
> containers anyway.
> 
> Can fix commit too.

Sounds good, thanks. In that case, I need to push the updated container
before we commit the patch.

Cheers,

-- 
Anthony PERARD

