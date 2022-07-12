Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25855571A95
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 14:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365678.595962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFPy-0001zZ-CA; Tue, 12 Jul 2022 12:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365678.595962; Tue, 12 Jul 2022 12:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFPy-0001wh-90; Tue, 12 Jul 2022 12:55:10 +0000
Received: by outflank-mailman (input) for mailman id 365678;
 Tue, 12 Jul 2022 12:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYr8=XR=citrix.com=prvs=1856d22e9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBFPx-0001wb-IU
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 12:55:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0f2cd1-01e1-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 14:55:07 +0200 (CEST)
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
X-Inumbo-ID: da0f2cd1-01e1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657630507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wovSHjrqFB2rjLds3cXLKK5APzoYNGb9+u096JWxrw=;
  b=DkA3fZZndt94nfMG+I46nqinR2CmeXM+OfqdvsezhXTj+eP478a9pSjH
   NW6qCbSJ2qX2QIbHeRgrezx74SdCT0Nn1SLMpnz674is5CI3xTbMxgglu
   zIU1mcuD3qEw5GQakld3JAbmNhZLj87BqGMGXBMHO+EuDtUH0MbanlI/7
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75598299
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6lb21aqhqANQTdUcKC6KMdhXx1heBmJJZRIvgKrLsJaIsI4StFCzt
 garIBmFPv3fYDPye9pxbIi+8U5T75CAyt9kGgI9pSAwQ3hDoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvS4
 Imq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBZbTVuOkYd15jISwvIIQX17D+cSekiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwMUmRM0ceaz/7DroPutmTukncIgRaqWzWq5Rs8zOU7ydYhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1ayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4vHN+iaUA0xDdQxMOcEP5eA5fGx1z
 WbcyrsFGgdTXK2ppWO1r+nJ8m7jYXVMdQfudgdfE1JbvoCLTJUby0uWE409SPPdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi2+AswGzAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmCD3AAzQcF7qWT0k5JGQWy3yGgkTHqFz+5eIWO5C
 KMtkVk5CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps3pgi51SsEpLmevpXg2DWbJhjyFuBV9yskXZ
 MbEGftA+F5HUMyLOhLtH7dDuVLqrwhjrV7uqWfTkkz5jOPOOSXOIVrHWXPXBt0EAGq/iF292
 75i2wGikX2zjMWWjvHrzLMu
IronPort-HdrOrdr: A9a23:72e/4KER8mpSrgrppLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.92,265,1650945600"; 
   d="scan'208";a="75598299"
Date: Tue, 12 Jul 2022 13:55:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xl: relax freemem()'s retry calculation
Message-ID: <Ys1vJk13rCXNhJ/q@perard.uk.xensource.com>
References: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>
 <YsxOBUfIl47N+E+u@perard.uk.xensource.com>
 <2b06e97e-1c39-9889-8d04-f1a063b403d6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2b06e97e-1c39-9889-8d04-f1a063b403d6@suse.com>

On Tue, Jul 12, 2022 at 09:01:48AM +0200, Jan Beulich wrote:
> On 11.07.2022 18:21, Anthony PERARD wrote:
> > On Fri, Jul 08, 2022 at 03:39:38PM +0200, Jan Beulich wrote:
> >> While in principle possible also under other conditions as long as other
> >> parallel operations potentially consuming memory aren't "locked out", in
> >> particular with IOMMU large page mappings used in Dom0 (for PV when in
> >> strict mode; for PVH when not sharing page tables with HAP) ballooning
> >> out of individual pages can actually lead to less free memory available
> >> afterwards. This is because to split a large page, one or more page
> >> table pages are necessary (one per level that is split).
> >>
> >> When rebooting a guest I've observed freemem() to fail: A single page
> >> was required to be ballooned out (presumably because of heap
> >> fragmentation in the hypervisor). This ballooning out of a single page
> >> of course went fast, but freemem() then found that it would require to
> >> balloon out another page. This repeating just another time leads to the
> >> function to signal failure to the caller - without having come anywhere
> >> near the designated 30s that the whole process is allowed to not make
> >> any progress at all.
> >>
> >> Convert from a simple retry count to actually calculating elapsed time,
> >> subtracting from an initial credit of 30s. Don't go as far as limiting
> >> the "wait_secs" value passed to libxl_wait_for_memory_target(), though.
> >> While this leads to the overall process now possibly taking longer (if
> >> the previous iteration ended very close to the intended 30s), this
> >> compensates to some degree for the value passed really meaning "allowed
> >> to run for this long without making progress".
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I further wonder whether the "credit expired" loop exit wouldn't better
> >> be moved to the middle of the loop, immediately after "return true".
> >> That way having reached the goal on the last iteration would be reported
> >> as success to the caller, rather than as "timed out".
> > 
> > That would sound like a good improvement to the patch.
> 
> Oh. I would have made it a separate one, if deemed sensible. Order
> shouldn't matter as I'd consider both backporting candidates.

OK.

For this patch:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

