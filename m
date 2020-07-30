Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD123300D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 12:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k15U0-0008KF-17; Thu, 30 Jul 2020 10:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k15Tx-0008KA-Il
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 10:08:13 +0000
X-Inumbo-ID: 93593032-d24c-11ea-8d29-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93593032-d24c-11ea-8d29-bc764e2007e4;
 Thu, 30 Jul 2020 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596103693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yzatxMaE63S7r7J7i/D4AKibgu4cOAE1pxAdd0hTzXI=;
 b=AHg26eu+ySocCvh0ziXkczWVgqkta3tOiu9X/VZV/atoHI5tfAHH5Z6r
 bwDLJZ9obnjdADgjSCrlqZagOKqBs97oTxLCxHmydLlk+sLkd8sIv2k8/
 6gu8MI4SmYqY6+i1p8MVhkhG5ruT85+WSffm5q67Yca9SC6F40zPAJBxO Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GmJmumpcoXIrQKZQKbZASPbHoUjLZf9syUU+kPJbw1bvzqMUryZNXi7Aue6QGo3uy7kxPeU0Kx
 5ypbEJxg99F2ioRVN1UuMoN9C9LAFed2d4k3HVz0a1kVJbvJBeRTFk6k0fsoj7owQkrUliBMlQ
 xvNzmY0FETMDU56dzTvkoBOYHYeIvEbSKj3nN1z4qSnr1Fwe9zjI3qdIl2bLZvlKlWuFzBgCFy
 KHHPW4fI8dtRpg8SXM9hYjVdkMVUWrERKgVDHVw46SZdroZENZvEqarMu6A3Qel8lMAYatGfMi
 8Zc=
X-SBRS: 2.7
X-MesageID: 23853738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="23853738"
Date: Thu, 30 Jul 2020 12:08:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] print: introduce a format specifier for pci_sbdf_t
Message-ID: <20200730100801.GF7191@Air-de-Roger>
References: <20200727103136.53343-1-roger.pau@citrix.com>
 <ca6cd6a5-3221-4d34-08a0-8ea4b2dc92d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca6cd6a5-3221-4d34-08a0-8ea4b2dc92d0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 29, 2020 at 09:28:53PM +0200, Jan Beulich wrote:
> On 27.07.2020 12:31, Roger Pau Monne wrote:
> > The new format specifier is '%pp', and prints a pci_sbdf_t using the
> > seg:bus:dev.func format. Replace all SBDFs printed using
> > '%04x:%02x:%02x.%u' to use the new format specifier.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Acked-by: Julien Grall <julien.grall@arm.com>
> > For just the pieces where Jan is the only maintainer:
> > Acked-by: Jan Beulich <jbeulich@suse.com>
[...]
> In all reality, Roger, it looks to me as if you should have dropped
> my ack, as there seems to be nothing left at this point that I'm
> the only maintainer of.

Yes, just realized that now, I'm sorry. Your Ack happened before Paul
became a maintainer of vendor-independent IOMMU code and I completely
forgot about it.

I think the overall result of having a modifier for printing SBDFs is
a win for everyone. TBH I just revived the patch because I think it
will be helpful to the Arm folks doing the PCI work, if not I wouldn't
have sent it again.

Roger.

