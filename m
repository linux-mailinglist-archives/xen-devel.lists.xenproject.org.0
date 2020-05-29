Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB441E827F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:50:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehH9-0001ex-MM; Fri, 29 May 2020 15:50:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehH8-0001er-VD
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:50:26 +0000
X-Inumbo-ID: 1c8f2dac-a1c4-11ea-a8dc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c8f2dac-a1c4-11ea-a8dc-12813bfff9fa;
 Fri, 29 May 2020 15:50:25 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fBWYZBBs1op9YnQI1yi++tyl6dGKiTeorTVV8woKQiZGrfehCNZMx+fPttN57PTiQVQdauLqOR
 8tyRg1TqG4k50FX65Uj/J/RWUS8MO8WhnI+40gn3BC0gI4uKKnXkH7Eqj6Z2s8n4DB74X4XycH
 2O43CVAb1dDXmmbcHyO27F5a8srd6/5fRELiG/ArDaHrEwFJh3mDU/qPv6zBY/U1agqNheZBky
 ajOvvQxUGpCcpMUPti6tr1u9Ne2e/5bTtvZbma2T31ObIU+qVt3dqhTIN9qGKnjvYcBHUR3s/t
 O9A=
X-SBRS: 2.7
X-MesageID: 18772315
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="18772315"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24273.12092.863484.245282@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 16:50:20 +0100
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: fix Rules.mk library make variables
In-Reply-To: <20200529102953.12714-1-jgross@suse.com>
References: <20200529102953.12714-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross writes ("[PATCH] tools: fix Rules.mk library make variables"):
> Both SHDEPS_libxendevicemodel and SHDEPS_libxenhypfs have a bug by
> adding $(SHLIB_xencall) instead of $(SHLIB_libxencall).
> 
> The former seems not to have any negative impact, probably because
> it is not used anywhere in Xen without the correct $(SHLIB_libxencall)
> being used, too.
> 
> Fixes: 86234eafb95295 ("libs: add libxenhypfs")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I will commit this momentarily.

Ian.

