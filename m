Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3871EA7FC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 18:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfnec-0003yZ-FJ; Mon, 01 Jun 2020 16:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfneb-0003yU-LU
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 16:51:13 +0000
X-Inumbo-ID: 19731ca8-a428-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19731ca8-a428-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 16:51:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NKYITG2Nna1s56beZgklef6jwSPFDnR0DvWsVEs7qjASBC12AIVJNkHr7X8LsCmNseY9g7+oiW
 9dpkM0VYSfTOaBpP1CYvLIXbO4bVeX+PWaHr9sSSq0/OVQ2VslLxqbi3B7w2raVr5ZstXfu7cT
 YRkGVKIGaInch/AqT6h7etus5OftTxgWaookItUq1Rn2gRf2cJ3vWSayqj+bnViLT02UxQ7NeE
 4+SjNND5lMZ0NdVmwqNATzcyVCZA7DPnRnjelHDeSw1v9Z7dRfyg2bx8UUqO9GcmzQYGQoYu9N
 u6Y=
X-SBRS: 2.7
X-MesageID: 19197850
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="19197850"
Date: Mon, 1 Jun 2020 18:51:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading
 documentation
Message-ID: <20200601165105.GU1195@Air-de-Roger>
References: <20200601134025.24142-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200601134025.24142-1-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On Mon, Jun 01, 2020 at 02:40:25PM +0100, Andrew Cooper wrote:
> Extend the disclaimer about runtime loading.  While we've done our best to
> make the mechaism reliable, the safety of late loading does ultimately depend
> on the contents of the blobs.
> 
> Extend the xen-ucode portion with examples of how to use it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> ---
>  docs/admin-guide/microcode-loading.rst | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
> index 5f0f661a2e..8cd5d0351b 100644
> --- a/docs/admin-guide/microcode-loading.rst
> +++ b/docs/admin-guide/microcode-loading.rst
> @@ -104,8 +104,8 @@ modules to find any CPIO archives, and search the archive for the applicable
>  file.  Xen will stop searching at the first match.
>  
>  
> -Run time microcode loading
> ---------------------------
> +Runtime microcode loading
> +-------------------------
>  
>  .. warning::
>  
> @@ -113,7 +113,23 @@ Run time microcode loading
>     or at boot time.  Not all microcode updates (or parts thereof) can be
>     applied at runtime.
>  
> -The ``xen-ucode`` utility can be used to initiate a runtime microcode load.
> +   Given the proprietry nature of microcode, we are unable to make any claim
> +   that a runtime microcode is risk-free.  Any runtime microcode loading needs
> +   adequate testing on a dev instance before being rolled out to production
> +   systems.
> +
> +The ``xen-ucode`` utility can be used to initiate a runtime microcode load::
> +
> +  [root@host ~]# xen-ucode
> +  xen-ucode: Xen microcode updating tool
> +  Usage: xen-ucode <microcode blob>
> +  [root@host ~]#
> +
> +e.g. With a Linux dom0 on a Haswell system::
> +
> +  [root@host ~]# xen-ucode /lib/firmware/intel-ucode/06-3c-03

Could you expand a bit on the nomenclature used here?

I assume it's something like <fam>-<model>-<version> but might be good
to provide people a hint to know how to find the appropriate blob for
their system if possible.

Thanks, Roger.

