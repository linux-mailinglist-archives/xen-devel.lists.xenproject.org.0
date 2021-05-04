Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB78372C34
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 16:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122500.231057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldwCo-0002ZM-4G; Tue, 04 May 2021 14:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122500.231057; Tue, 04 May 2021 14:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldwCo-0002Yx-0n; Tue, 04 May 2021 14:39:22 +0000
Received: by outflank-mailman (input) for mailman id 122500;
 Tue, 04 May 2021 14:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldwCm-0002Ys-O8
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:39:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2270ca45-af1e-4ff0-a54a-c848ddfeb789;
 Tue, 04 May 2021 14:39:20 +0000 (UTC)
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
X-Inumbo-ID: 2270ca45-af1e-4ff0-a54a-c848ddfeb789
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620139159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5PynkD+3oVBooqyRQbevV7cegVq//k1+w7uE7ORl0TU=;
  b=Q5YeS6SyH7skE7PdDCTGkvUk738JNYDasr9u1XygxMEo7xdQeRkbHTYq
   d1yDOmpHUqdPF0isIDWHtFqYcYkECYdyKyH6FayEvMEjXrkPfL/QFZF24
   1JsZeA+1JCQODfCi7GF3EY1Bxv+k1BCg2a7RrGf3IlteXgN07OwD/RJJd
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: U5RaGnfdi66XYNbPNrX4YnNboXV+jgxe6eNDIZcFgS0U8nHJqPrJhG0sgFtC9qORJD8NGh1Ejn
 P6fg3fMFJKCsXhDf2A7XwTyHUXEhFUDYgz5x3wu5wedDpeEC4dAAP45ASKg6zEugzlcqpGe5CD
 w8+Oy19ygUiIIpziV4NqgpUnb8jGIUI70+qCvKUqU6rIkiZf9flL2GFy93krYIB4p4WDuC/N8P
 oEWjXluDnELmotfYaLjczuP62OCDMnPQ40FMUChSDnBDEp7cSd+HYYvi1cid3GJ/lUp5G0WCyy
 cBY=
X-SBRS: 5.1
X-MesageID: 43041665
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xhfDgKHmnk4eiVPvpLqEeceALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkTL1ki8WQnE8mdaGUZPwJk/035hz/IUXIPOeTBDr0VHYSL1KwIP+z1TbdxHW2fVa0c
 5bHJRWKNq1NlRiiNa/3Q/QKadH/PCi0ISFwdjT1G1sSwYCUdAE0y5cBhyAGkN7AClqbKBJd6
 a03cZMqzq+dXl/VK3SbRNpY8H5q9LGj57gaxIdbiRXijWmtj+09KX8VyGRwxZ2aUI3/Z4Z7W
 PHnwblj5/Cj9iHzHbnuVPu0w==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43041665"
Date: Tue, 4 May 2021 15:39:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC v2 1/7] libxl: remove extra whitespace from gentypes.py
Message-ID: <YJFckz3BLlOr8/I+@perard>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <7a75b14f66acac499a0b17ab1c5595549421bac7.1614734296.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7a75b14f66acac499a0b17ab1c5595549421bac7.1614734296.git.rosbrookn@ainfosec.com>

On Tue, Mar 02, 2021 at 08:46:13PM -0500, Nick Rosbrook wrote:
> No functional change, just remove the extra whitespace from gentypes.py.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

