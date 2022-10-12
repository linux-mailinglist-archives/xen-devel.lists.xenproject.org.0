Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860165FC705
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 16:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421213.666430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oicPv-0003oh-HV; Wed, 12 Oct 2022 14:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421213.666430; Wed, 12 Oct 2022 14:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oicPv-0003mu-Do; Wed, 12 Oct 2022 14:09:03 +0000
Received: by outflank-mailman (input) for mailman id 421213;
 Wed, 12 Oct 2022 14:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fG8j=2N=citrix.com=prvs=27725cbfe=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oicPt-0003mo-VG
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 14:09:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69775591-4a37-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 16:08:58 +0200 (CEST)
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
X-Inumbo-ID: 69775591-4a37-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665583739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7zWONsme+WDKmmjQ1XFM8fVK9PhFgGENwA9ndf+Jzg=;
  b=JIuSTWYZgEcIOEPTQXpvZ8beGJpEw1z68zy4BiY6aJRhMw274sxC/7lb
   TB/esru5fJ3AKYIGkaWQVR/xdsB6kGe7IyRXMjFJMG4W2ZXWvQihuyItx
   wLlp/moWRqlOx5kHHUxnj6IGPQkOLRm6mNoKWQ8zhQYAERO4uuAnTpyqI
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 85085026
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l457wKkNx7j9au6x6Yg+nxjo5gy7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWW3VaaqNZjP0etsgaoq28hhXuJbQn4NmT1Y6pSE0HiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnP6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL3xOy
 fkUOQ43M1OzorOL4ajkEfFAr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TaGJ0Fwx7C+
 Aoq+UzVOzM9Csy9lgOF0Xvwmu7fgXuhSIU7QejQGvlC3wTImz175ActfVmmpfi0jGauVtQZL
 FYbkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLRxitqeED02U8Li8pCm3fyMSKAcqZyUJUA8E6NnLu5wog1TESdMLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1X7agw6pqon3dFN21iCGY0O/sVhhSKfwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiOMrKigbArLmdrGR2Cg2bKhggBd2B1yckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+TDOSfOEOhUYArXBgzc0E9iiF+Mm
 zq4H5LToyizrcWkOnWHmWLtBQpiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY4cl3het/0Mzo/1E
 oSVABAwJKzX2SKacm1nqxlLNNvSYHqIhSJiZHBzZw/3hRDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6NdEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:82EYkKMXwq44CsBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.95,179,1661832000"; 
   d="scan'208";a="85085026"
Date: Wed, 12 Oct 2022 15:08:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2][4.15] libxl/Arm: correct xc_shadow_control()
 invocation to fix build
Message-ID: <Y0bKXm7lznpmYfAL@perard.uk.xensource.com>
References: <af81d6d5-5d2b-3db8-634f-17392ef328f9@suse.com>
 <AS8PR08MB79910144ACE4842C43A205C392229@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB79910144ACE4842C43A205C392229@AS8PR08MB7991.eurprd08.prod.outlook.com>

On Wed, Oct 12, 2022 at 01:16:47PM +0000, Henry Wang wrote:
> Hi Jan,
> 
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Subject: [PATCH v2][4.15] libxl/Arm: correct xc_shadow_control() invocation
> > to fix build
> > 
> > The backport didn't adapt to the earlier function prototype taking more
> > (unused here) arguments.
> > 
> > Fixes: c5215044578e ("xen/arm, libxl: Implement XEN_DOMCTL_shadow_op
> > for Arm")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

