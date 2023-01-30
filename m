Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0E68185D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487136.754640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYak-0000eC-1H; Mon, 30 Jan 2023 18:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487136.754640; Mon, 30 Jan 2023 18:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYaj-0000c3-TV; Mon, 30 Jan 2023 18:09:17 +0000
Received: by outflank-mailman (input) for mailman id 487136;
 Mon, 30 Jan 2023 18:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYai-0000bo-LA
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:09:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33138544-a0c9-11ed-8ba2-5fe241e16ab0;
 Mon, 30 Jan 2023 19:09:14 +0100 (CET)
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
X-Inumbo-ID: 33138544-a0c9-11ed-8ba2-5fe241e16ab0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675102154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xouqlqiYb7B9rW3YcR6qZFZRtnr9jXX8J8LIOIh3rbE=;
  b=FRDCoBen31wtHZ9Du5LvDM/Fz5Q1P+Ih/P6Vslh0+0Pdz1gkxe9vjeT1
   FUoJuntmCXTWYeSC+7KsMgySEBnQEieng554pbdIPfBXw0vzdaentIwzY
   CA9BqNMt+1XGUeP4xyG83f+4CxJ/T8ZNEuBkCIDL8PuyqKxwdyRFB6KxJ
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95283211
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SFDY0aDvb2slChVW/w7jw5YqxClBgxIJ4kV8jS/XYbTApDkkhDxVy
 WUeXziPPPuLMTahLYggbI3ipkxTsceAx9MwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpD5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/7hKXWwU8
 uEhdw8hMDKawOvon5K7Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9K4HQFZ4Pxx/wS
 mTuwSf+WTM7Ctijyzep1zWd2u/zlCLZcddHfFG/3qEz2wDCroAJMzUUWkG8uuKRkVOlVpRUL
 El80iM2oLI77kCDUtj3VBr+q3mB1jYDX/JAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3u7K93XoY3FTdDJcI3ZeFmPp/uUPvqk20C+TQ4xkDZfqsfGrOyi3y
 m7VjCgh0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsI2SBj
 Kz741k5CHpv0JyCMMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhdxyfhgY
 MfHKZfzZZr/NUiA5GPmL9rxLJdxnnxurY8tbc+TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6Itc9xv8Ey76gE
 7PUchYw9WcTTEbvcW2iAk2Popu1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:0FfoiKs2e7jvxr5gB0Yi90Qc7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="95283211"
Date: Mon, 30 Jan 2023 18:09:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH 6/6] tools: Introduce a xc_xenver_buildid() wrapper
Message-ID: <Y9gHv3Ype4+x4r8L@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-7-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:36PM +0000, Andrew Cooper wrote:
> ... which converts binary content to hex automatically.
> 
> Update libxl to match.  No API/ABI change.
> 
> This removes a latent bug for cases when the buildid is longer than 4092
> bytes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

