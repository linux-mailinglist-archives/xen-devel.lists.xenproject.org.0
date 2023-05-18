Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E77083F9
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536385.834650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzejb-0006Qj-8H; Thu, 18 May 2023 14:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536385.834650; Thu, 18 May 2023 14:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzejb-0006OS-4z; Thu, 18 May 2023 14:36:03 +0000
Received: by outflank-mailman (input) for mailman id 536385;
 Thu, 18 May 2023 14:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvkS=BH=citrix.com=prvs=495754ba3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pzejZ-0006OM-7M
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:36:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db8491d-f589-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 16:35:59 +0200 (CEST)
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
X-Inumbo-ID: 4db8491d-f589-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684420559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YoIYAW8qebn32nOP3GnLdPAr4RdbTEwwJ19kKHSvjNM=;
  b=UamC3Gw4ltwaBjyLJ4tDtBXQt4a3bw2eE9yXNpLu3X7A4mL/6n6pZLRX
   Grry6pdhT/Df9L8YHVZb/IsebgZpAr+YJfNXsjtHxWx0dlmtSNh3vBEwP
   EvXgTMHeMtDsaJzvbQSd5wgnSTQJDZps61ld/DSr+EzcyvfLPsIdaZHBs
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109417320
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:yqrlYqIVMm4ub/asFE+RVJUlxSXFcZb7ZxGr2PjKsXjdYENS0mYOz
 GZNDG2DOquIa2LwftBybIixoUIGupKDxtYxHQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c51XkNi8
 8MZKwkDMCiR3+aY/bOwVttj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZQJxxnD/
 DquE2LRJRpFaduvlTC88Sj8rOXugAf2Zas8G+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2Qd8Sovq+496VS3R/H0RRj+q3mB1jYVQ9dKGvc2wB2MwKHTpQ2eAwAsTDFbb8c9nNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIM+iAmJUddgFKezgtDvMTXxx
 TmQq245nbp7pcsCza7991fBhTOnp7DAVAtz7QLSNkqP4xllfoeja8qN4ELC8PdbBI+DSx+Ku
 31spiSFxLlQV9fXznXLGbhTWujzvJ5pLQEwn3ZtQLsN8Qus+EetI7hCuDVQGUZiLvQLLGqBj
 FDohStd45paPX2PZKBxYp6sB8lC8ZUMBegJRdiPMIMQP8EZmBuvuXg3OBXOhzyFfF0Ey/lXB
 HuNTSq74Z/244xDxSH+eeoS2KRDKssWlTKKHsCTI/hKPNOjiJ+ppVUtagPmggMRtvnsTODpH
 zF3aaO3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4Va+Nmu9xJtU9w/0N/gstw
 p1ach4w9bYCrSefdVXiho5LM9sDoqqTXVpkZHdxbD5EKlAoYJq17bd3SqbbiYIPrbQ5pdYtF
 qltRil1KqgXItgx02hHPMaVQU0LXEjDuD9iyAL5OWluL8YxFlWUkjImFyO2nBQz4uOMnZNWi
 9WdOsnzGMZTL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:JW8oQKjY4Sp4zFeF0M6z/H9rrHBQXgkji2hC6mlwRA09TyX4rb
 HNoB1/73TJYVkqNU3I9ertBED4ewKiyXcX2/hzAV7BZmjbUTCTXeRfBOLZqlWLJ8SZzIFgPM
 xbE5SWZuefMbFxt7ef3OGee+xQpqj/gdjY/tv2/jNPaQlrbq16hj0JdzpzancGPjWv2/ICZf
 2hDvIunUvdRZ29VLXEOkU4
X-Talos-CUID: 9a23:/wrDO2H3zhFQlCnPqmJlq2w4HP8kcUTTkk/Ce0uWNGdiVI+aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AlGaswQ2FWNLEZLfK86sxQVP4EzUjxK/xVUc9zZ8?=
 =?us-ascii?q?/uJPUHyZRJhOQsR2ZTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109417320"
Date: Thu, 18 May 2023 15:34:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>, Marc Bonnici
	<marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
Message-ID: <45f59b7a-592a-4a1e-b606-c2d564b979b8@perard>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-4-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230413071424.3273490-4-jens.wiklander@linaro.org>

On Thu, Apr 13, 2023 at 09:14:05AM +0200, Jens Wiklander wrote:
> Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> guest is trusted to use FF-A.

Is "ffa" working yet in the hypervisor? (At this point in the patch
series) I'm asking because the doc change is at the end of the patch
series and this patch at the beginning.

I feel like this patch would be better at the end of the series, just
before the doc change, when the hypervisor is ready for it.

In any case:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

