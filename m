Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7F2B820A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 17:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30097.59845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQUf-0002cV-Qo; Wed, 18 Nov 2020 16:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30097.59845; Wed, 18 Nov 2020 16:39:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQUf-0002bu-N2; Wed, 18 Nov 2020 16:39:41 +0000
Received: by outflank-mailman (input) for mailman id 30097;
 Wed, 18 Nov 2020 16:39:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfQUe-0002bL-4H
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:39:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd111f8-76ea-4c9d-b93a-54e9472fe8c9;
 Wed, 18 Nov 2020 16:39:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=135G=EY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfQUe-0002bL-4H
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:39:40 +0000
X-Inumbo-ID: 3cd111f8-76ea-4c9d-b93a-54e9472fe8c9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3cd111f8-76ea-4c9d-b93a-54e9472fe8c9;
	Wed, 18 Nov 2020 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605717579;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cIqBOwyWtYipTi7x6RKeIF9zCwnkxFiBwPSwymY1Pcg=;
  b=Bamf3iW/V4ohRwTlsTh+603e2lP9qLqe3nrWp2Fp6P0gu1Sp+MiiTNfa
   R6j3bMxniA5P50YTvZmdrQgzpkJFFWCXT21dZskpsuN/KGD32qolE1jVy
   JSp6Ujwh+dUfPIbEmv47PQJTVACfCWNtXX13wgVpidEG78UM6r5WICNg7
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AXxwPL8FIVb3/4eKlZAlo1psc6ltiyMwBh4OrCIzLXi+Z5NeRY1hWvo+J/NYtL7iZwk6z73bqW
 v/rphDkXg7CWC5DpL7Fl+sGd1EDH82QwpudBl7IurZrQaCVtov5GCsyWVvL5W0hSAWeL1U6ZzD
 DdtCsd+NmP/qYPepddAtxz/Gl25OLAXz2w2ozgI+uJvENGyGX/sR3ZYz/jGBA5EZIeyi75ix4S
 n3HnAUvf8fnQSLRvTjUQibyhWqjtvbg2JHbE3GU/ZXZR0YM9A0KxogULlpEUPAKUfMLcacahKm
 Xnk=
X-SBRS: None
X-MesageID: 32591259
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,488,1596513600"; 
   d="scan'208";a="32591259"
Subject: Re: [PATCH] ci: drop building on CentOS 6
To: Doug Goldstein <cardoe@cardoe.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20201118162706.66551-1-cardoe@cardoe.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9d24beae-1bcf-5a05-5c1e-a0cd45dfedd7@citrix.com>
Date: Wed, 18 Nov 2020 16:39:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118162706.66551-1-cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 18/11/2020 16:27, Doug Goldstein wrote:
> CentOS 6 is no longer supported by upstream so we cannot test against it
> for future Xen releases.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Do we want to drop the dockerfiles as well?  We probably also want to
drop one line from containerise as well.

I can fix on commit if you're happy with this.

~Andrew

