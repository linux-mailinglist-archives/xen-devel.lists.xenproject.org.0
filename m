Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC35B9FB0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 18:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407597.650150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYrnt-0000LU-5d; Thu, 15 Sep 2022 16:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407597.650150; Thu, 15 Sep 2022 16:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYrnt-0000J5-33; Thu, 15 Sep 2022 16:33:29 +0000
Received: by outflank-mailman (input) for mailman id 407597;
 Thu, 15 Sep 2022 16:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiOX=ZS=citrix.com=prvs=2502044d7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oYrnr-0000Iy-98
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 16:33:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e19dd44-3514-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 18:33:25 +0200 (CEST)
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
X-Inumbo-ID: 1e19dd44-3514-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663259605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9KCtAw+CG74CAe7fbKsxrOFejQJFw35vUc4ijoSaNBE=;
  b=SzeH3Jg7mkpbL8+HlBE0kjiipGKZ5XS57jJ0X1UDoXeufO6Z15up2eMs
   DzNCHKgBNiVMLXhU677KH+dMTKK63mv6kjrudxuGCNiw376B/HDq5qtBY
   5RlJiQBgCXxVCss8AkmTO7EV9nVpogG1/oVQB7OloSFc2MfaK5m4o5E35
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79764948
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:f3xN6qBJ8p8oeBVW/0Djw5YqxClBgxIJ4kV8jS/XYbTApDIj0jwPm
 jceC2rXO6vZN2D0fYwiOonj8hgHvcfWx9M1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFsv/b8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW0Xlw9g3Ml4IB7wj9dtGCmhxx
 P4aAglYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDmMklAgjOiF3Nz9ecSOaJRSrgGjq
 0XX/V7fEC0faIGf8G/Qmp6rrrCWxn6qMG4IL5W66/prjVu71mEVThoMWjOToOa7ol6zXcpFL
 E4Z8TZoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUyU9prNkyyMAxkuIlIzbiY7fAkHyeC29enfkSnzosZf/L+d14OrQmmtm
 WjX8kDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBvazt3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510Kvc8LYSbzPP8vC25UNyjN5fG5fekJq9iONoYeCnSPXFXvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUsn5VBc5GPvH48gPUoDnH9WKZX7Gc+mlHxKENO2OBaodFvyGAHWM7FivP/f8Vi9H
 hQ2H5Li9iizmdbWOkH/mbP/53hTRZTnLfgac/BqS9M=
IronPort-HdrOrdr: A9a23:XEAlBK/Iz2sTN87RLy1uk+DeI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjzsiWE7wr5OUtQ/OxoV5PsfZqxz/JICMwqTNGftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyIMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="79764948"
Date: Thu, 15 Sep 2022 17:33:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	"Julien Grall" <julien@xen.org>
Subject: Re: [PATCH v2] libvirt: disable Werror for non-libvirt flights
Message-ID: <YyNTwpjt3se7YHfn@perard.uk.xensource.com>
References: <20220915162052.50522-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220915162052.50522-1-roger.pau@citrix.com>

On Thu, Sep 15, 2022 at 06:20:52PM +0200, Roger Pau Monne wrote:
> Current usage of Werror=switch-enum by default for libvirt builds out
> of the git tree causes issues when new items are added to libxl public
> API enums if those are used in a switch statement in libvirt code.
> This leads to libvirt build failures for seemingly unrelated libxl
> changes.
> 
> In order to prevent those errors from blocking the push gate, disable
> Werror for libvirt builds when not in a libvirt specific flight.
> 
> The errors will be reported on the libvirt flight, and block the
> pushes there.  So the author of the changes in libxl is still expected
> to send a fix to libvirt code.  This is no ideal, but the other option
> is to just disable Werror for all libvirt builds and let libvirt
> developers fix the breakage when they notice it.
> 
> runvar differences for a xen-unstable flight are:
> 
> --- /dev/fd/63  2022-09-15 15:57:44.340581730 +0000
> +++ /dev/fd/62  2022-09-15 15:57:44.340581730 +0000
> @@ -574,6 +574,10 @@
>  test-xtf-amd64-amd64-3                                arch                            amd64
>  test-xtf-amd64-amd64-4                                arch                            amd64
>  test-xtf-amd64-amd64-5                                arch                            amd64
> +build-amd64-libvirt                                   autogen_options                 --disable-werror
> +build-arm64-libvirt                                   autogen_options                 --disable-werror
> +build-armhf-libvirt                                   autogen_options                 --disable-werror
> +build-i386-libvirt                                    autogen_options                 --disable-werror
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    bios                            seabios
>  test-amd64-amd64-qemuu-nested-amd                     bios                            seabios
>  test-amd64-amd64-qemuu-nested-intel                   bios                            seabios
> @@ -1217,6 +1221,10 @@
>  build-arm64-libvirt                                   make_njobs                      1
>  build-armhf-libvirt                                   make_njobs                      1
>  build-i386-libvirt                                    make_njobs                      1
> +build-amd64-libvirt                                   meson_options                   -Dwerror=false
> +build-arm64-libvirt                                   meson_options                   -Dwerror=false
> +build-armhf-libvirt                                   meson_options                   -Dwerror=false
> +build-i386-libvirt                                    meson_options                   -Dwerror=false
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_dmrestrict               true
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  recipe_dmrestrict               true
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_nomigrate                true
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

