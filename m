Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F225D681857
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487126.754619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYZd-0007uo-B6; Mon, 30 Jan 2023 18:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487126.754619; Mon, 30 Jan 2023 18:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYZd-0007sZ-7y; Mon, 30 Jan 2023 18:08:09 +0000
Received: by outflank-mailman (input) for mailman id 487126;
 Mon, 30 Jan 2023 18:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYZc-0007o2-0J
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:08:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09ed18af-a0c9-11ed-8ba2-5fe241e16ab0;
 Mon, 30 Jan 2023 19:08:05 +0100 (CET)
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
X-Inumbo-ID: 09ed18af-a0c9-11ed-8ba2-5fe241e16ab0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675102085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VEkJZWBAAtXC9BWq4tD82Ej5MvxPoFi+Ko2JT2G+O9I=;
  b=fS07MpDGRJImPDOjjSuAnECesluuFa1rd8LRfi8pWo2tsxVT4EHx4rlJ
   bCqF8PKnpBT1xd5ALH/L8H3RVg//haLnbbexxjrM4U/ONpCvOM8iF1V3u
   b8vHxwe4jlnEjs4aBmB/Bw136z6zEGciZkpqWg/OsZzSa3fRIsDMt9t75
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94887947
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wwyh0KBImoi//BVW/x/jw5YqxClBgxIJ4kV8jS/XYbTApD4r3jJRz
 TMXXm2CaPyPZDamfdByYY+/8E9XvZ6EyddqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpD5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6vgwJXhIz
 fwkazkOXBGk2OioxJPhRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9K4DaFZoEwhnwS
 mTuxVWhHhoBOtejlAGpzl6UgrDXjznBR9dHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJSwAOC0K3P+C6CG3MJCDVGbbQOuMYoSBQw2
 1SOntevAiZg2JWcUX+H/62YhS+zMyMSa2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 yCU6wwngY0TsY0C1Je62g/NnTaN/JecG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctOOpd6Oxwl8AM8OgJsdiJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05k2fuHrhEgeNzl39WKYbvqXfTlkTP7FZjTCTNFedt3KWmMYjVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQliEJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4AGm3iWeclTXMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:aEJNO6x/eKmQZN7QhQ9fKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="94887947"
Date: Mon, 30 Jan 2023 18:07:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 4/6] tools: Introduce a non-truncating
 xc_xenver_changeset()
Message-ID: <Y9gHdQerdxcPXZLh@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-5-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:34PM +0000, Andrew Cooper wrote:
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

