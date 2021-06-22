Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2053B09AA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145945.268454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviko-0007D8-JV; Tue, 22 Jun 2021 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145945.268454; Tue, 22 Jun 2021 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviko-0007AQ-Fc; Tue, 22 Jun 2021 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 145945;
 Tue, 22 Jun 2021 15:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQNH=LQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lvikm-0007AK-K9
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:55:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e74d563c-3940-4db4-a43c-823ecfc4d455;
 Tue, 22 Jun 2021 15:55:55 +0000 (UTC)
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
X-Inumbo-ID: e74d563c-3940-4db4-a43c-823ecfc4d455
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624377355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JthbSS9hhfSjxnfO7f8LXXvJ6x04gBBc+yphges23jI=;
  b=AzUo21cg87x53+/X+NdfN9KhXUkjjsRIs7Fu52W6fabb8d3Dp/ups+G8
   3pjPPyjbXxY3I0JXpg9yYoMJeTUkViOFfJMUVrL7FLjZiObvTdIT8kySZ
   YrBrEAVlCAUy4gZjgkTSuaaNpPXalsJ+qWDr5JDs6p0iB83Ha9kvrg04O
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oMSkGR1CgLKk3ZvGVfsfXbNFiR2xJl+pCqIe8SdpBNrXpIq/EXbKZeLzqU2DX/OiUErGEpKikI
 QAPkjdCbvtoG/QEFIJto2sYygo84Yzqe1CuVpLPSaSXvhYZM7nGMAhm3TrsusHaNjR60xGuPC2
 BQDklCOHeXqMqG3NQRNgNliEROfXpj6niI1RM+G4CDqB8CN8voxO4EkQw6afFkiy4a0St1zMHI
 L9SEZq4W0CooZlaHvHcJYsKscYghVkVEWdr+n3784vqNzFnuk4krdT9i7MCeTifDK/3c1OmFv5
 EWc=
X-SBRS: 5.1
X-MesageID: 46689271
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3d4Si6rbDy9ZZmaQhLsPwM0aV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.83,291,1616472000"; 
   d="scan'208";a="46689271"
Date: Tue, 22 Jun 2021 16:55:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] Revert "tools/firmware/ovmf: Use OvmfXen platform file
 is exist"
Message-ID: <YNIIAvdClPze2cEg@perard>
References: <20210622153930.16003-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210622153930.16003-1-andrew.cooper3@citrix.com>

On Tue, Jun 22, 2021 at 04:39:30PM +0100, Andrew Cooper wrote:
> This reverts commit aad7b5c11d51d57659978e04702ac970906894e8.
> 
> The change from OvmfX64 to OvmfXen causes a change in behaviour, whereby
> OvmfXen maps its shared info page at the top of address space.  When trying to
> migrate such a domain, XENMEM_maximum_gpfn returns a very large value.  This
> has uncovered multiple issues:
> 
>  1) The userspace hypercall wrappers truncate all return values to int on
>     Linux and Solaris.  This needs fixing in Xen.
>  2) 32bit toolstacks can't migrate any domain with RAM above the 2^40 mark,
>     because of virtual address constraints.  This needs fixing in OVMF.
> 
> Fixes for both of these aren't completely trivial.  Revert the change to
> unblock staging in the meantime.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

