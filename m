Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADF36DDF5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 19:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119502.226002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnjm-0003hs-NG; Wed, 28 Apr 2021 17:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119502.226002; Wed, 28 Apr 2021 17:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnjm-0003hX-K7; Wed, 28 Apr 2021 17:12:34 +0000
Received: by outflank-mailman (input) for mailman id 119502;
 Wed, 28 Apr 2021 17:12:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1fc=JZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbnjl-0003hS-UQ
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 17:12:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5fa1fd5-bbf6-4a70-aa77-e1975c64c6db;
 Wed, 28 Apr 2021 17:12:32 +0000 (UTC)
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
X-Inumbo-ID: c5fa1fd5-bbf6-4a70-aa77-e1975c64c6db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619629952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mklfZ2wXVf5x/X6VQtHr66OIW5LFqHBxp/SN4TTXNOU=;
  b=M3/15tLVFPSaKYCmbh7tQu+BmSvWSgGfv9c2pVMHJAphrsOirYNK76zM
   dQu1G3vPTii4qvcjuOYn45GM3X0yTlabnNwVPmZlxUd5JnPgapj2u+I1a
   bKZzcVBjh2oGMGtTBRk+aRwYT0L2NEducc4CoBYdXsFl549PL03EC3Xux
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1ZkLDtpa6R+gCGA4tSZJAVut+9ez2wS+Gg4LBrfueD6uSZNLwz2x32kXtiIy2YR6tOVKGZIM67
 +E7xyb1Ymn0oTfH7Qh0Dhc9qw15M8hPSJ21NTKp56sMDocKqs0aw1JC+G6e25VRUiaq0Q/32pG
 3UKrwL3azARVtFaIMdpJT4qeaCWthxXP6mkYE1Iaku12UVGND2USnrs5zY8sPXkkNH0XB93JXE
 Gu1FTDvGf2obah4f56wPnHnTi1FyNBYAL+0yfMY4MQhDPJrddDPzlM2nshFet5tNnZO72i1Q+i
 SZU=
X-SBRS: 5.1
X-MesageID: 42644011
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ovf2BajE6NSRCH4cFjOKv3PWLXBQXksji2hD6mlwRA09T+Wzva
 mV/cgz/xnylToXRTUMmcqYPrOBXHPb8vdOkO4sFJ2lWxTrv3btEZF64eLZslndMgD36+I178
 tdWodkDtmYNzdHpOb8pDK1CtMxhOSAmZrY49v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7ag+a7OWhIICwUq7wODl1qTmdzHOiOVwwsEVHd3yaoimF
 K16jDR3LmpsP2w13bnt1P70pI+orXc9uc=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42644011"
Date: Wed, 28 Apr 2021 18:12:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [SUSPECTED SPAM][RESEND PATCH 1/2] tools/libxl: Mark pointer
 args of many functions constant
Message-ID: <YImXfc4oaPgWzkeT@perard>
References: <cover.1613496229.git.ehem+xen@m5p.com>
 <2e18b114fc91028459b2d6cbfd0f1204501dfde9.1613496229.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e18b114fc91028459b2d6cbfd0f1204501dfde9.1613496229.git.ehem+xen@m5p.com>

On Fri, Dec 18, 2020 at 01:37:44PM -0800, Elliott Mitchell wrote:
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -2073,9 +2073,9 @@ struct libxl__xen_console_reader {
>  /* parse the string @s as a sequence of 6 colon separated bytes in to @mac */
>  _hidden int libxl__parse_mac(const char *s, libxl_mac mac);
>  /* compare mac address @a and @b. 0 if the same, -ve if a<b and +ve if a>b */
> -_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b);
> +_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
>  /* return true if mac address is all zero (the default value) */
> -_hidden int libxl__mac_is_default(libxl_mac *mac);
> +_hidden int libxl__mac_is_default(const libxl_mac *mac);

It turns out that older version of gcc complains about the const of
libxl_mac:


    libxl_nic.c: In function 'libxl_mac_to_device_nic':
    libxl_nic.c:40:9: error: passing argument 1 of 'libxl__compare_macs' from incompatible pointer type [-Werror]
             if (!libxl__compare_macs(&mac_n, &nics[i].mac)) {
             ^
    In file included from libxl_nic.c:18:0:
    libxl_internal.h:2076:13: note: expected 'const uint8_t (*)[6]' but argument is of type 'uint8_t (*)[6]'
     _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
                 ^
    libxl_nic.c:40:9: error: passing argument 2 of 'libxl__compare_macs' from incompatible pointer type [-Werror]
             if (!libxl__compare_macs(&mac_n, &nics[i].mac)) {
             ^
    In file included from libxl_nic.c:18:0:
    libxl_internal.h:2076:13: note: expected 'const uint8_t (*)[6]' but argument is of type 'uint8_t (*)[6]'
     _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
                 ^
    libxl_nic.c: In function 'libxl__device_nic_setdefault':
    libxl_nic.c:69:5: error: passing argument 1 of 'libxl__mac_is_default' from incompatible pointer type [-Werror]
         if (libxl__mac_is_default(&nic->mac)) {
         ^
    In file included from libxl_nic.c:18:0:
    libxl_internal.h:2078:13: note: expected 'const uint8_t (*)[6]' but argument is of type 'uint8_t (*)[6]'
     _hidden int libxl__mac_is_default(const libxl_mac *mac);
                 ^
    cc1: all warnings being treated as errors


That happens on ubuntu trusty, debian jessie, and centos 7.

Cheers,

-- 
Anthony PERARD

