Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43899372BA9
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 16:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122469.230997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvi1-0007u8-EN; Tue, 04 May 2021 14:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122469.230997; Tue, 04 May 2021 14:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvi1-0007tj-Am; Tue, 04 May 2021 14:07:33 +0000
Received: by outflank-mailman (input) for mailman id 122469;
 Tue, 04 May 2021 14:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldvhz-0007tb-It
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:07:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4882147-9be8-4eb2-aa55-0198c304447f;
 Tue, 04 May 2021 14:07:30 +0000 (UTC)
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
X-Inumbo-ID: e4882147-9be8-4eb2-aa55-0198c304447f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620137250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Evkx80lpR4d0ahpeYk3ZR0XUOTpDMjEy6K7Hw1hpxJ8=;
  b=ITKEqzGFHb9h1rmc3gWLbLmggr0nz+SGK5+wr9zHU9y6vwWqpvRk+DMc
   IrFYpQt66QO0/RE5Z0wilruD62XU0rYnZ+qm7/ow7NsSmNv9t+XcXNDa1
   m5e9I1pG0rla/NOHZCPseHDIr8r8TGVjnbguaMXJ2ryaHZ4EKjJudP7cd
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PQR98lDqIlDtyPdmqskIihDJxIcFNIBywuGxLnQTRXxufri13546R1evgubmIrKPmFoggQ9Wjh
 5ZVFVHUQVL/IMzlfgsvT6LNS9BvlPuUiuchpstpqC9VB200dfDyl6M5zuYnCelsOvJjyPueSiQ
 1aoBbUkmou2mQ+H/AzH2Pu1b3JDg3fb7IC+YoSk9Ah3pGF4NJAQQKnNzjMUo8u5+fwVySvsKhb
 yp3bBEJ8UyoDIQC83JcxdIb59YmPhR6evL7/Kf/Ior5/QSpfAOEo1KDg6/3RDMQTZUcdIEy1mO
 0GM=
X-SBRS: 5.1
X-MesageID: 43020350
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Cvz0QarNlGz6EMuE2Y0EivIaV5qbeYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUdXE7gNabOLSBR3S0z+8T3aA6O7C+UA76/FayJIZ54of4hxHmESvy9ulSvJ
 0QFZRWItv2EFR8kILG8BC1euxQpOWv3ai0iY7lo0tFYhptb8hbgDtRKgHeKUFuQRkDOJxRLu
 vk2uNihx6NPUsadd66AH5tZZmnm/TumIj9aRALQz4LgTP+7g+A07LxHxiG0hp2aVomqt1OzU
 H/nwP0/amluf2goyWstVP71JhKhMDnjuJKGc3ksLlsFhzXlg2qaI59MofjgBkJpoiUhmoXrA
 ==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43020350"
Date: Tue, 4 May 2021 15:07:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 01/13] libxl: don't ignore the return value from
 xc_cpuid_apply_policy
Message-ID: <YJFVHGJpTHAypuS4@perard>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210430155211.3709-2-roger.pau@citrix.com>

On Fri, Apr 30, 2021 at 05:51:59PM +0200, Roger Pau Monne wrote:
> Also change libxl__cpuid_legacy to propagate the error from
> xc_cpuid_apply_policy into callers.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since v2:
>  - Use 'r' for xc_cpuid_apply_policy return value.
>  - Use LOGEVD to print error message.
> 
> Changes since v1:
>  - Return ERROR_FAIL on error.
> ---

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

