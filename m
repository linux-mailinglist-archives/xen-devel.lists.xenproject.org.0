Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC624C248
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mad-00073W-RS; Thu, 20 Aug 2020 15:34:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddnW=B6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k8mab-00073R-VC
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:34:53 +0000
X-Inumbo-ID: 3107b300-c624-4192-a1af-3c5447eabce5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3107b300-c624-4192-a1af-3c5447eabce5;
 Thu, 20 Aug 2020 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597937693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GT4Wl/D+4NhzJRaoMf/yM5omzEmXk23J2lRTjZHe4oQ=;
 b=FCOMumPdYLp8pLtNb4+5bZvyV7ojC2u3tS33v4q/IpqYILcOocsvPsKR
 D+o5FmYdkFZCTh8FYDDXUxhsm1P9xrxD/6tJIOrd9xXZqS9c9NN/Ts3lN
 2eRDXyuv37iCiDdXwuMy9Lv2cfuEPS2KWqkiYRp3mFoLmkm6LgZ7s6Ce4 k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zt099DJFApclj8vBK3EbxfTbHrLBRGE14BoA8xltKpO25W33zkCj72eV0Olpza91OePjxE0FYW
 OrTPYmIzqH4DtAuz5K3mfPahXSEP/BPgnFGGDjDybb+BpcsToClwNtBXX85H6IBr2+EOojF4kU
 NqaIac/MbMAFXlhhkjCcO0Mz7kzdAjJ7AN6IZWk8iXyV5QyuI/qfBhkDnnRM0o6YOooVYSf8PE
 /cmdeR6IIv6MnhurE8kQOSveVbw6rViWYEgMv9Xpca5LYxkpt1bKCKWm4CE7Tpyjz6nne6M3wC
 Wpo=
X-SBRS: 2.7
X-MesageID: 25269797
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25269797"
Date: Thu, 20 Aug 2020 16:34:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Eduardo Habkost <ehabkost@redhat.com>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 26/58] xen-legacy-backend: Add missing typedef
 XenLegacyDevice
Message-ID: <20200820153449.GG2024@perard.uk.xensource.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-27-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200820001236.1284548-27-ehabkost@redhat.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 19, 2020 at 08:12:04PM -0400, Eduardo Habkost wrote:
> The typedef was used in the XENBACKEND_DEVICE macro, but it was
> never defined.  Define the typedef close to the type checking
> macro.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

