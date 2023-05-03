Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AA6F5CC7
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529403.823797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puG2N-0003kU-Sa; Wed, 03 May 2023 17:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529403.823797; Wed, 03 May 2023 17:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puG2N-0003hj-ON; Wed, 03 May 2023 17:13:07 +0000
Received: by outflank-mailman (input) for mailman id 529403;
 Wed, 03 May 2023 17:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zA8=AY=citrix.com=prvs=480c9ef0c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puG2N-0003hd-42
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:13:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3c7fa37-e9d5-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 19:13:06 +0200 (CEST)
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
X-Inumbo-ID: c3c7fa37-e9d5-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683133986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2M2YzHhQe+4b8uYTmzqGzDo4Ommpt+0EZR59fV316rw=;
  b=FeitYJwnKDgZTl2N4YMsDOc7cHw4SVKN/DjMJaXmh2vZp7B4uKQugpIA
   wPN4LATi2AeEqdpMZkDInovZjYTuCOtKO5KHjibVVRf+l9+MT+bbfh3tc
   gVy7+zYHb/mMbxomNBUhAPDnjZ9+FBSaY9+IAmNd5g1yCUBqh6PpnKfzt
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108156469
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KQ5owazzxBZDaiTWTYl6t+fyxirEfRIJ4+MujC+fZmUNrF6WrkUBm
 2BOUDuCOv+ONjOkKdt2Yd+19B5U7MCAndVhSQpp/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPasT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUxk0
 vEZBWEqVAqen9qd6bL4Usdoltt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzh/F+
 D6YrgwVBDkfK87cimCXz0mSh7OVsDrXc78pLbano6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZjxcbN0rsucmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcbSSMV7t+lp5s85jrNQcxkC7WdlcDuFHf7x
 DXihCEmiq8al8Ijy6Sx9leBiDWpzqUlVSZsuF+RBDj8qFokOsj8PdfABUXnAehoAay+Q1is7
 V8+gdWG1MsnDdKVuiidX7BYdF223MppIAEwkHY2Qcl6r233qyH8FWxDyGogfRk0a67obResO
 RaO4l0Jufe/KVPwNcdKj5SN59PGJEQKPfDsTbjqY9VHefCdnyfXrXg1NSZ8M40A+XXAcJ3T2
 r/BK65A9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLGexdbQDTN7pjtfPsTODpz
 jqiH5HSl0U3vBPWO0E7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJVzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4m9yJnYXByYgz0s5XhCK72hJoim1IMVeFP3IReITRcF
 ZHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:mHurl67v6tHjiHPC1QPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:1jjxam0e36RCFg2nBqTwxLxfN+oCf3zwnVDqOVKgMU1ASP6NZ1uA5/Yx
X-Talos-MUID: 9a23:VZnVpASIhgFhruwIRXTpmyMhd5163p+QCRxXvIwqkPS/DCdvbmI=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="108156469"
Date: Wed, 3 May 2023 18:12:53 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3 3/3] domctl: Modify XEN_DOMCTL_getdomaininfo to fail
 if domid is not found
Message-ID: <acca7d2f-8060-4366-b048-a4963b014da5@perard>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-4-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502111338.16757-4-alejandro.vallejo@cloud.com>

On Tue, May 02, 2023 at 12:13:38PM +0100, Alejandro Vallejo wrote:
> It previously mimicked the getdomaininfo sysctl semantics by returning
> the first domid higher than the requested domid that does exist. This
> unintuitive behaviour causes quite a few mistakes and makes the call
> needlessly slow in its error path.
> 
> This patch removes the fallback search, returning -ESRCH if the requested
> domain doesn't exist. Domain discovery can still be done through the sysctl
> interface as that performs a linear search on the list of domains.
> 
> With this modification the xc_domain_getinfo() function is deprecated and
> removed to make sure it's not mistakenly used expecting the old behaviour.
> The new xc wrapper is xc_domain_getinfo_single().
> 
> All previous callers of xc_domain_getinfo() have been updated to use
> xc_domain_getinfo_single() or xc_domain_getinfolist() instead. This also
> means xc_dominfo_t is no longer used by anything and can be purged.
> 
> Resolves: xen-project/xen#105
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

