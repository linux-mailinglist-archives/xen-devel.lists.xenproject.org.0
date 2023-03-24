Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98636C827C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 17:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514357.796499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfkQ1-0004fC-S0; Fri, 24 Mar 2023 16:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514357.796499; Fri, 24 Mar 2023 16:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfkQ1-0004dT-Os; Fri, 24 Mar 2023 16:37:33 +0000
Received: by outflank-mailman (input) for mailman id 514357;
 Fri, 24 Mar 2023 16:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6lt=7Q=citrix.com=prvs=440da7b32=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfkQ0-0004dN-8S
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 16:37:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28bfcbc1-ca62-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 17:37:30 +0100 (CET)
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
X-Inumbo-ID: 28bfcbc1-ca62-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679675850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKe8cYC30KwzBZf1KdWEPYTvCtxZcuYCQaXKesOoaC0=;
  b=OhKF55CGtM4De1M7cNYQoWA/0QI4mymN3txsYpuvOguFaXNnNZNhlSx8
   pXdEzhhExb3F2C6dN4jHmMv6CL97xfb+urH7KiY/sqdMUtLpr015KVlcw
   1QUJ1KGtyepchReJPcPMxMEUR9l9g8NXjnUbkpeFK4FoimGBGiZ6FCIxX
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102138743
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:o1eK7qk9lOdZdZa5zsKroYfo5gw+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWT2APKzcNmahLdsiaYXk8E4A78WDnYIyTVBl+yhhEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fUkIjQfTUqevs/ozamnceldqeogMfC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 DudrzulWXn2MvS1wjqPsVymnNTOsn7KVq05PeOe971T1Qj7Kms7V0RNCArTTeOCok25XchWJ
 woL+y4tha8o/UevQ5/2WBjQiGGAlg4RXZxXCeJSwBqEz7fZ50CFBmkORyNFdPQrstRzQS0t0
 BmOhdyBLTV3vaecU3616raepjT0Mi8QRUcHbDUBRBEI4PHipp8ylRPFStt/EK+zgcbxEDu2y
 DePxAA1jq8fisMj3Kyh8VfKxTmro/DhXgMzownaQG+hxgd4f5K+IZyl70DB6vRNJ5rfSUOO1
 FAIls2fxOEIE5CWlSaJTfkNHbem/PKMOnvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBS
 E3OvQJc4rdDMX3sarV4C6qzAck3yanrFfz+S+vZKNFJZ/BMmBSvpX80IxTKhia0zRZqyPtkU
 XuGTSqyJX8mA6B172CrfspD3KQ3/SAP6k3QWKmumnxLzoGiiG6ppaYtaQXRP75nsfnf+G054
 P4EaZLUlkw3vPnWJ3COrNVNdQ1iwW0TX8ieliBBSgKUzuOK8kkFAuSZ/74ucpcNc099xraRp
 SHVtqO1JTPCaZz7xeaiMCoLhEvHB8oXkJ7CFXVE0ayU83Yie52zy6wUaoE6e7IqnMQ6k6ElE
 qhbJp3ZXKoTItgix9j6RceVkWCfXE7z2VLm09SNOVDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 oBMIjjzGMJZLyw7VZa+VR5a5w/p1ZTrsL4oDhSgzxg6UBmEzbWG3ASt0aBqcplRcE+rK/nz/
 1/+PCr0bNLl++cdmOQlT4jdx2t1O4OSxnZnIlQ=
IronPort-HdrOrdr: A9a23:G/hCGql3cqFlPFh1EZPX7AkF7ZfpDfLr3DAbv31ZSRFFG/Fxl6
 iV7ZImPH7P6Ar5PUtKpTnuAsi9qB/nhPtICOoqTM6ftWvdyROVxehZhOOMrQEIcxeOjdK1vp
 0QF5SWZueAamRSvILW2iT9NfAKqePqzEmvv43j5kYody1RL4tHyChYJDqhOnBXYi4DP7YFfa
 DshfZvln6ueXEadMSpCmNtZYX+jtfWjo/hZRIcJzNP0njtsQ+V
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="102138743"
Date: Fri, 24 Mar 2023 16:37:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>,
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Konrad Rzeszutek
 Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Goldstein
	<cardoe@cardoe.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v6 0/5] Stop using insecure transports
Message-ID: <c47045b4-25a4-4b2d-b3cf-76708bdcd6ca@perard>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <cover.1679412247.git.demi@invisiblethingslab.com>
 <fa35a012-dd6c-426b-2c54-f03024b010cc@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fa35a012-dd6c-426b-2c54-f03024b010cc@citrix.com>

On Wed, Mar 22, 2023 at 08:37:43AM +0000, Andrew Cooper wrote:
> On 21/03/2023 5:33 pm, Demi Marie Obenour wrote:
> > Demi Marie Obenour (5):
> >   Use HTTPS for all xenbits.xen.org Git repos
> >   Change remaining xenbits.xen.org link to HTTPS
> >   Build system: Do not try to use broken links
> >   Build system: Replace git:// and http:// with https://
> >   Automation and CI: Replace git:// and http:// with https://
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/813510934 from
> patchew, so I think we're good now on the containers.
> 
> >
> >  Config.mk                                   | 20 ++++---------
> >  README                                      |  4 +--
> >  automation/build/debian/stretch-llvm-8.list |  4 +--
> 
> Except for this, where I thought we'd already dropped it...

We dropped llvm-8 on the unstable container, I don't think there's been
patch for the stretch container.

-- 
Anthony PERARD

