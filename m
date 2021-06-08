Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E339F3C7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 12:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138404.256217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqZ9W-00032C-E4; Tue, 08 Jun 2021 10:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138404.256217; Tue, 08 Jun 2021 10:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqZ9W-0002zF-9w; Tue, 08 Jun 2021 10:40:10 +0000
Received: by outflank-mailman (input) for mailman id 138404;
 Tue, 08 Jun 2021 10:40:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exX0=LC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lqZ9V-0002z9-7r
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:40:09 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67a3e3aa-6079-45a5-a9ff-2deac61a1652;
 Tue, 08 Jun 2021 10:40:08 +0000 (UTC)
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
X-Inumbo-ID: 67a3e3aa-6079-45a5-a9ff-2deac61a1652
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623148808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7RGMDtvv5YlLqoFWHQvJ5ttRUT/lGNn6s4fM/Uca3g8=;
  b=FLtIrB/ozoeB3j18lUZcdofI4VmpEa5cP1PMZ14WPoRz/gzQMm3yoZ+r
   vL3JuvaIo14QhqluOshUq7Wzo1ZfkSCqn/k7AhRUxGQsnVXv3vLTBv0Er
   sehA20C8K3D1vJ551PSm940YOkKxcwYGgge2Jtcru7neFm6lTmucSuVRW
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OwXe7mCLfrL1GTaz0eGaXytpCatcfLJtIoT6N59rcKOFTWYP6MO59iAFTI/LKZI5wuJc3atmg0
 KLDBqb+W8KSsIg5uBC4wUdVQyt9/YSt7dpfAXXFik0k7x0KdrAxnORR0BmDmdybXQ3WYfA0rnT
 tHbj8PGbRr1c3fhuYtO9kKpnN/eFxGufoEMsyzwGn9goA3P8Z6iH6tpKIdR29lV66Sx5+dQm4I
 GNcQN5ERJvcFq155ziqsGhy+R/DLgwMSHvI99dBePqOVamwQ54MMmS3a4burBNpXkqWSdykrZa
 GiQ=
X-SBRS: 5.1
X-MesageID: 45608740
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ciKPEaF7t9Vd4xI/pLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.83,257,1616472000"; 
   d="scan'208";a="45608740"
Date: Tue, 8 Jun 2021 11:40:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file is
 exist
Message-ID: <YL9JBMnLxdUqLmY3@perard>
References: <20210601102804.698364-1-anthony.perard@citrix.com>
 <24767.18086.549942.159942@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <24767.18086.549942.159942@mariner.uk.xensource.com>

On Tue, Jun 08, 2021 at 11:29:58AM +0100, Ian Jackson wrote:
> Anthony PERARD writes ("[XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file is exist"):
> > A platform introduced in EDK II named OvmfXen is now the one to use for
> > Xen instead of OvmfX64. It comes with PVH support.
> > 
> > Also, the Xen support in OvmfX64 is deprecated,
> >     "deprecation notice: *dynamic* multi-VMM (QEMU vs. Xen) support in OvmfPkg"
> >     https://edk2.groups.io/g/devel/message/75498
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> I will commit this in a moment.
> 
> Do we need to backport this ?

Yes, because osstest is wired to use the latest version of OVMF.

Thanks,

-- 
Anthony PERARD

