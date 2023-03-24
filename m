Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842496C8053
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 15:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514339.796475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfilG-0007Vq-Vc; Fri, 24 Mar 2023 14:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514339.796475; Fri, 24 Mar 2023 14:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfilG-0007ST-SJ; Fri, 24 Mar 2023 14:51:22 +0000
Received: by outflank-mailman (input) for mailman id 514339;
 Fri, 24 Mar 2023 14:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6lt=7Q=citrix.com=prvs=440da7b32=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfilF-0007SN-Ig
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 14:51:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 546f1f66-ca53-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 15:51:18 +0100 (CET)
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
X-Inumbo-ID: 546f1f66-ca53-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679669478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuCyO2YU2quaoAmFDdKczCUFwNTV4tF8lC1oimdVCdI=;
  b=QXxiPKjD55HQTuv7WcYPjugrfbJsexIR+VNGa955urJR4oRhvfW4ZjFl
   qNWFhulE+u7P5VZg5HWVIbrW1qNOjYR97onSirQPMIAvjSSabjHkvWWNJ
   /N5PYD3G4xYrjo/c5IY9kD4Kws7GDgE7k78dY5zz4swIszfeFbsvNekVX
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101002808
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:g+9mbK+iGzwXxqPmSg6iDrUD4HmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DBLXWnQOf6IZzOhf9EkOoqw/E5Xvp/Tm4RqHFY/pCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQ1
 s0kGiIwVSnensaHy7mqE6pCoYc8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh/A/
 jiWpzSR7hcyOdex5R6s31mWo+rggjn2ZYIvRZOh36s/6LGU7jNKU0BHPbehmtG1lUuhAfpeL
 UIO8yYjpKR081akJvHlVgC8iG6JuFgbQdU4O/Q37RzIxqfK7gKxAG8CQThcLts8u6ceXTYt0
 E2ImdLBHzFjsLSJD3ma89+8rzS7Pm4Qa2oLfzMFSxAt5MPqq4U+yBnIS75LGai2k8ezEHf52
 TeQpQA5nbwYicNN3KK+lXjcmC6lrJXNSg8z5y3UU3ij4wc/Y5SqD6S26FvB5PMGI4+DTkaIu
 FANnsTY5+cLZbmdmSrITOgTEbWB4/eeLCaakVNpB4Mm9Tmm5zikZ484yChjJUF1P8INUSXkb
 E/apUVa45o7FHelbKt9bpitI94nwajpCZLuUfW8RsJDfpVrMgqO7S1jYUq422HrmVIr16YlN
 v+zeN6hF38ABYx7zTC9QKEW1rpD+8wl7TqNH9ahlU3hiOfAIifPEt/pLWdicMhnz5K4khfoy
 O8CLu+7wB5OCa7QRWrIpNt7wU8xEZQrOXzng5UJKb/dfFc8QzlJ5+z5mu14JdE890hBvqKRp
 yzmBBcFoLbqrSefQThmfEyPf18GsXxXiXsgdRIhMl+zs5TISdb+tfxPH3fbkFROyQCC8RKXZ
 6NfEyl4Kq4TIgkrAhxEBXUHkKRsdQ6wmSWFNDe/bT40cvZIHlKWq4K1IFa3rXdQUkJbUPfSR
 JX+vj43vLJZH1gyZCooQKvHI6yNUYg1x7spAhqgzih7c0Tw6ol6QxHMYgsMC5hUc33rn2LKv
 zt69D9E/YEhVadpqoiW7U1Fxq/1e9ZD8r1yRDGBt+ntZXeBrgJOA+ZoCY61QNwUb0uskI3KW
 Amf56qU3CEv9LqSj7dBLg==
IronPort-HdrOrdr: A9a23:/9ePgavTxnEN/DZClOTO0iZm7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="101002808"
Date: Fri, 24 Mar 2023 14:51:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Paul Durrant <paul@xen.org>, <qemu-devel@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
	<ankur.a.arora@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>, Juan Quintela
	<quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/xenpv: Initialize Xen backend operations
Message-ID: <ac5c322b-7774-45ce-9583-01771e43f54d@perard>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-10-dwmw2@infradead.org>
 <209fe980-7f9d-4d79-90fb-12e38f12b2bc@perard>
 <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>

On Thu, Mar 23, 2023 at 10:57:34AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> As the Xen backend operations were abstracted out into a function table to
> allow for internally emulated Xen support, we missed the xen_init_pv()
> code path which also needs to install the operations for the true Xen
> libraries. Add the missing call to setup_xen_backend_ops().
> 
> Fixes: b6cacfea0b38 ("hw/xen: Add evtchn operations to allow redirection to internal emulation")
> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Tested-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

