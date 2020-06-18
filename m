Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07AC1FF84B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwu1-00029o-0s; Thu, 18 Jun 2020 15:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlwtz-00029i-T6
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:56:31 +0000
X-Inumbo-ID: 4545a222-b17c-11ea-bab2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4545a222-b17c-11ea-bab2-12813bfff9fa;
 Thu, 18 Jun 2020 15:56:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IF2lUxJiCLfeb+NMa0u2nWI+U9T1Cqi5ttIEA/BMekhF9lgo6tP9pa9rXzPWDL/GZrzem8+eW1
 la+xNqD1+yRHRz4ygBLIavLDEbFvUBdinfpO5e2RFzTb8WMEza5D0MB9dsMJAZmegf/kxj5SJA
 9r/cDXNndrO0T4JpdOMPeqOp6JHYZhOTrv/vpnDmufp9hEo4COGK/4wReZechVaZjZMbjwrEah
 0HeqBtDe9QGC/Mqqb6v0Yvd09i5+VqfDuG46zevJrfgiwI+YJiSik3xhejJuVLF4jyIb23wXgq
 BmI=
X-SBRS: 2.7
X-MesageID: 20401635
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20401635"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.36521.246994.731819@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 16:56:25 +0100
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [XEN PATCH for-4.14 v1] stubdom/vtpm: add extern to function
 declarations
In-Reply-To: <20200617134025.2tdrjxslnh66dmng@function>
References: <20200617060841.7241-1-olaf@aepfle.de>
 <CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>
 <20200617134025.2tdrjxslnh66dmng@function>
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Samuel Thibault writes ("Re: [PATCH v1] stubdom/vtpm: add extern to function declarations"):
> Jason Andryuk, le mer. 17 juin 2020 09:35:52 -0400, a ecrit:
> > On Wed, Jun 17, 2020 at 2:10 AM Olaf Hering <olaf@aepfle.de> wrote:
> > >
> > > Code compiled with gcc10 will not link properly due to multiple definition of the same function.
> > >
> > > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > 
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Acked-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks.  I have confirmed that these symbols look to be defined (in
tpm/tpm_emulator_extern.c).  So the patch is correct.

I think this is 4.14 material.  Paul ?

We should also consider it for backports.  How far back do we need
to go ?

Ian.

