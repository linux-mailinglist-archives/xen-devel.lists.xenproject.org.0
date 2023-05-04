Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEE6F6E31
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529828.824673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaKH-0003T2-8H; Thu, 04 May 2023 14:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529828.824673; Thu, 04 May 2023 14:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaKH-0003R4-5E; Thu, 04 May 2023 14:52:57 +0000
Received: by outflank-mailman (input) for mailman id 529828;
 Thu, 04 May 2023 14:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYMk=AZ=citrix.com=prvs=481980579=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puaKF-0003Qw-UA
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:52:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f8dd66-ea8b-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 16:52:53 +0200 (CEST)
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
X-Inumbo-ID: 57f8dd66-ea8b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683211973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+g/k07CXD/gTtcKxuOaPCrh5JfZwNTbDY+vcD/fIfQ=;
  b=Tdj/cqwdkOpKttvQXSCMCNwqSMSgDnmfEqYYQcP0XVrGnxQ5HC438C7w
   473oWEyQszQ6f4htO1qVANC2K6lqMdVgGfYnVeZLMyILrAIwOwbpP9/vj
   GTEofndyZVynLsxfEyPEoOJI/6S0tJjSS1QzqFUmy0rGY1eojtY1inaac
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107896292
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:W7jMc6+hxqWKOb0YEarfDrUDq36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2EcDDzXb67ZazOneYh+b4jjoxtUvZCAm9JlSFNurSg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkNq
 Oc5AgImXiqT2dqu3peYEu9ijJ8KeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhnI9
 zycrj6R7hcyGO3E1yOc3niVg9CSoAHwRbIoT5e736s/6LGU7jNKU0BHPbehmtG7gEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDddgnuckeVTEsk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXrnR85uCqevgvXpGDv7x
 HaBqy1WulkIpZdVjePhpwmB2m/y4MGTFWbZ+zk7QErmsxhYTryOV7a4t2DD89NjdICXRAKo6
 S1sd9el0AweMX2cvHXTEL5VRev5uKnt3C702gA2QcR4n9i50zv6JN0LvmkjTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONk1Hs0DaJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35unjqPHcmjl0v2jNJygUKopUotagPSPojVEovdyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3EJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4ACj3Sefd1/RNRiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:sGUI4qFTmUGMtbzqpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AxNJZNWlD+lSdNTL+/9cQJ5HjeBLXOT6A11b6EWS?=
 =?us-ascii?q?IM3Y3cKWLbHzI/q1uyOM7zg=3D=3D?=
X-Talos-MUID: 9a23:CLg+PQuAtaHTuSfn8c2nqAA5Kt5xz66XDX9QrLcNpvm+bgZzEmLI
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="107896292"
Date: Thu, 4 May 2023 15:52:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] build: omit "source" symlink when building
 hypervisor in-tree
Message-ID: <9febc330-9586-4810-880d-f694a2b07b0d@perard>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
 <0d073a56-b3a0-a64d-6bf4-851c660c6155@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0d073a56-b3a0-a64d-6bf4-851c660c6155@suse.com>

On Wed, Mar 29, 2023 at 12:23:37PM +0200, Jan Beulich wrote:
> This symlink is getting in the way of using e.g. "find" on the xen/
> subtree, and it isn't really needed when not building out-of-tree:
> The one use that there was can easily be avoided.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

