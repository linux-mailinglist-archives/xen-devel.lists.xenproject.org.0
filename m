Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE0229E7F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 19:25:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyITp-00082f-91; Wed, 22 Jul 2020 17:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyITn-00082a-Jw
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 17:24:31 +0000
X-Inumbo-ID: 333f0b8e-cc40-11ea-8685-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 333f0b8e-cc40-11ea-8685-bc764e2007e4;
 Wed, 22 Jul 2020 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595438670;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IcWoqAeuOPX0NqK6CnpgbZTbdVuOgRpQ5eCh0w/ifE4=;
 b=Ju5hfX2hI9PImKjokgEg1EPoYjxhQMmhSGUHIu3ku2YKc3CQIe/FqBRF
 eQUUk7MYkhZxDIm8bTjB/fS14ur7p5re4KbHZRAraGlGlb0jiKGG3H8nE
 Wz42pcAmLIspaIe+ZE3OkWawY7QbOucBTOWFcjL5NWO6lJ+9IFkD6hoPO E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uymvW4qasOXPyCqG65QrBt7O/LoW9C0GADH0lriwwHG6FJrMYUgSkgIdvHMOJ/157xFdXsWHeZ
 xqzhVLzLl3IIP/k3uPH3Chz5uu6u11vbR0gwE2a5m1hm2VbwERmvQHEv/TY0FV2rPSr6HpCKJg
 fv8OLT2+wNJUQJAtB291/oOSXvZwYg64YD5fPFOEswKPFu8/LaqDf1c9YilXO0GTt7hpFrn7qG
 cJiNjLqm2wZqruw3T6KOt2/CSSi7PwJ713nJz6LlJbzYcvJt9KvvwuTspBLiBoIFMRl5/Bm3dt
 ILY=
X-SBRS: 2.7
X-MesageID: 23162212
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23162212"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24344.30280.164326.834894@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 18:24:24 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
In-Reply-To: <20200722165544.557-1-paul@xen.org>
References: <20200722165544.557-1-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH-for-4.14] SUPPORT.md: Set version and release/support dates"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> 
> Obviously this has my implicit Release-acked-by and is to be committed to
> the staging-4.14 branch only.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

The plan is to commit this as part of the 4.14 release deliverables
prep.

Ian.

