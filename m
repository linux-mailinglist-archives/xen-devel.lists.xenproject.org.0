Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB219356FBF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106751.204111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9ij-0003XZ-Fn; Wed, 07 Apr 2021 15:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106751.204111; Wed, 07 Apr 2021 15:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9ij-0003XA-CE; Wed, 07 Apr 2021 15:03:53 +0000
Received: by outflank-mailman (input) for mailman id 106751;
 Wed, 07 Apr 2021 15:03:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L9xm=JE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lU9ih-0003X5-ST
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:03:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c42e1a3-a204-4685-b51e-da852e24e71e;
 Wed, 07 Apr 2021 15:03:51 +0000 (UTC)
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
X-Inumbo-ID: 3c42e1a3-a204-4685-b51e-da852e24e71e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617807831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dCcL9tZYdKA331q4Nw5XFfidGGKXo1yPU3a7vQpENx8=;
  b=TCSr5wLlQEMETFoUJsxUxGQBLjlzX54UfyXVIg/GlWuMMraP7o2yvrpO
   9woG7Pa/OCl5rgOxqtJQKzkhVbdxqD7ojo8NGwudkHSs6rGZGlZWNqEmr
   A3lgs8oIyq00GzvvOcsHleLf287rSRoRGr0yWXqKJL4VK80sCBE6PPnmx
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JcQOxFw4MmKPgtigDh26hoXUhDov/kliljCizXGag/AHX/T7E7ZfgBqK9YrFvqRy8hh9CIF8eX
 H0Vh5lUsEx+Ypo/5mmmWDuSfSrd1VWk/xJpXr5Wq+aAV5kkzjo9wJNAGvvictWjhW2ChSA5yCb
 jOefKMhiOFa1KTdK6Sg1fMKKpuOMkOcvRWg9ydq3AFz3BHsMJKHD7Jcl1UtGp77fUS0A69HKoQ
 fOHtqF9t3+ii4tMK3zn9AthlzF/h2zFj0RINSAcTcVZi3H9mBWseNf8+YFJJMMg9ie4prbS0DX
 CCo=
X-SBRS: 5.1
X-MesageID: 42544777
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qqPDYqBGaBULchHlHekz55DYdL4zR+YMi2QD/WoZc3JoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjlfVr385lp7Y4NeYqzRQWOghrMEKhO5ZbvqgeMJwTQ7ehYvJ
 0NT4FfD5nKAUF+nYLG5mCDYrEd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/Bq/QOlA/U+fOvNHNnp79CCR2ZCIP0wWSkSiurIfzDhnw5GZ5bxp03bwg/W
 LZ+jaZ2oyftZiApSPh6w==
X-IronPort-AV: E=Sophos;i="5.82,203,1613451600"; 
   d="scan'208";a="42544777"
Date: Wed, 7 Apr 2021 16:03:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
Message-ID: <YG3J0rRCCG0JotRq@perard>
References: <20210322141744.522041-1-anthony.perard@citrix.com>
 <20210401162454.78fb0290.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210401162454.78fb0290.olaf@aepfle.de>

On Thu, Apr 01, 2021 at 04:24:54PM +0200, Olaf Hering wrote:
> Am Mon, 22 Mar 2021 14:17:44 +0000
> schrieb Anthony PERARD <anthony.perard@citrix.com>:
> 
> > We use the deprecated QMP command "query-cpus"
> 
> There is also the already removed "cpu-add" command used, which apparently has to be replaced by "device_add".
> 
> Do you happen to have a fix for this as well?
>
> Another thread suggests that more deprecated commands are used. I think they have to be adjusted as well, ideally before they finally disappear from upstream qemu.

I'm working on a fix for cpu hotplug and other deprecated/removed
things, I'll try to propose the patches upstream soon after the release
of Xen.

Thanks,

-- 
Anthony PERARD

