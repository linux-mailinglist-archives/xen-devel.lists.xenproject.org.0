Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE313CB8C2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 16:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157218.290194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4OuD-0004j2-Nj; Fri, 16 Jul 2021 14:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157218.290194; Fri, 16 Jul 2021 14:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4OuD-0004gV-KW; Fri, 16 Jul 2021 14:33:33 +0000
Received: by outflank-mailman (input) for mailman id 157218;
 Fri, 16 Jul 2021 14:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4OuC-0004gP-Kx
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 14:33:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc9ce2c-beae-4c1a-bd8f-adc1e3a42a58;
 Fri, 16 Jul 2021 14:33:31 +0000 (UTC)
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
X-Inumbo-ID: 5cc9ce2c-beae-4c1a-bd8f-adc1e3a42a58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626446011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IDK2S2YLO7aS11WhBRvScTjaYDyMl91cVkEaZAXeIFg=;
  b=B8GY8fpdVwYEtQKHOKFOypvFbhsfVWikLjRehml7MWxaHQKwtoIYxGpS
   2Yzx51KPD+ocL27YcwSRf2vitZ6J8E4+NsDSsmi8BmCmt832q68nhn9el
   lp0tt+1v8Kz+gWfvjfL8dGse+7MrTnEiZXNbeVDNEmypqpwEd6DpMf1TH
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xQG7TupR0Mnl/0Xey3krvv6+VvZCd8WXpg5fwfNeR3LoOR7hITfn5u4ju2R81jTHTGegMv2nHt
 m44G/W/OJVOP8Y94xb/Bumy2uq4/Yw5w4KGHZj5aCDa1onl3wLKJpS+/Ryl2NHvkYEkQf0xntW
 r5iLcwQiU5DWWUJuhgaVx3wAvK1wakOEEbPo65VW9aM8tujfnBZaHM/uW38juy1R1RDpjIzsSW
 vfCnCd5FA/h1Xpw5X924SpInOfP6qVEHdIin9icarff4MCR4gyLtqiwY1f3/d9wHlG/3Tw7dRO
 kDc=
X-SBRS: 5.1
X-MesageID: 50098572
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U4DqMK8qqQvie+/+tX9uk+DgI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jzsiWE7gr5OUtQ/exoV5PtfZqxz/FICMwqTM6ftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCBHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="50098572"
Date: Fri, 16 Jul 2021 15:28:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <YPGXm9F3OHqLk/ml@perard>
References: <20210708065435.24515-1-olaf@aepfle.de>
 <e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
 <20210714093104.52f25e70.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714093104.52f25e70.olaf@aepfle.de>

On Wed, Jul 14, 2021 at 09:31:04AM +0200, Olaf Hering wrote:
> Am Thu, 8 Jul 2021 12:43:41 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> 
> > As for testing, get an account on Gitlab.  I'll add you to xen-project,
> > after which pushes to your local fork of Xen here will use the
> > project-wide runner configuration, rather than using the Gitlab's pool
> > of public workers (which amongst other things, lack ARM).
> 
> Now there is https://gitlab.com/xen-project/people/olafhering
> This should have been a "group" I think, so that I could create a xen.git below.
> Now it is an empty repository. Pushing anything to it fails because it lacks a default branch.
> Undoing the mistake fails as well because the webui lacks a knob to delete this repository.

Actually, it's possible to delete the repo.
Navigate to the repo you want to delete ( https://gitlab.com/xen-project/people/olafhering )
then in the sidebar/menu (hopefully on the left) there is "Setting".
Navigate to "Settings/General", in the "Advanced section" there is
"Delete project", read it all, hopefully it says which repo you want to
delete (olafhering).

At this point, you can probably create a new "subgroup". Navigate to
https://gitlab.com/xen-project/people then click on "New subgroup".

Hopefully, you have your own subgroup now, time to fork Xen!
Navigate to the Xen repo ( https://gitlab.com/xen-project/xen ), then
click "Fork". Choose your new subgroup as "namespace" (project url
section).


Hopefully, those instructions are enough to get you were you want to be.
Otherwise, I think I can do all that if needed.

Cheers,

-- 
Anthony PERARD

