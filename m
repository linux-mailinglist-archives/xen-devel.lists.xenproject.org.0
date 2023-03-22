Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341996C5276
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513556.794728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2Gn-00073C-Mt; Wed, 22 Mar 2023 17:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513556.794728; Wed, 22 Mar 2023 17:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2Gn-00070U-Jy; Wed, 22 Mar 2023 17:29:05 +0000
Received: by outflank-mailman (input) for mailman id 513556;
 Wed, 22 Mar 2023 17:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iBq=7O=citrix.com=prvs=4381ba85d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pf2Gm-00070L-LZ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 17:29:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 081468bd-c8d7-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 18:29:01 +0100 (CET)
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
X-Inumbo-ID: 081468bd-c8d7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679506141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DytmOjUNdiX7vzjz0yXYe0uTK+WwdkwbcLzI54Pygks=;
  b=cHQ8VLtMtUxIjP1RU98KX3k1fmBb4FdY6KTjdx36ImfwisXVWgM5DqBQ
   R9PDPBVhCoTfs8K/oj6uihYGNeSi21/fUOhYoS/pDuLoV8A6IFD5QmMTx
   s2Ai39EdhK7pFs5EeGKi8B79udl6MCeOMAcmCQ6d8Ww93+iQpEbtDAoHR
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 100702932
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TO3hw6qrt86Xi/MZRJefxxmFTg1eBmIDZRIvgKrLsJaIsI4StFCzt
 garIBmOaKyCajeheYp+aY7j8B8FvJKEy9ZkT1Bprnw3EnkSopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG09TRrEtePs+qy2V801gpURE9D0f4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 juepzuhWEBBbrRzzxKU1H/2osnKux+le7sTU5T78+RzrFSckzl75Bo+CgLg/KjRZlSFc9BWL
 UAO6zcthac3/U2vCNL6WnWQonGeuQUHc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BWYaaDUNVwct/9jpq4Z1hRXKJuuPC4bs0IezQ2uph
 WnX8m5n3e57YdM3O7uToGDkiXWep8LzUAMowlzTD1Ca9xw6a9vwD2C30mQ3/cqsPa7AEAbQ5
 yZZy5HFhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6T7wJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUidGU/g2kWftF751PVoX+8zD7TmLGcCTI+qPiNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqNZ7BQlTfRAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8Pz7mVo
 yvgCx4wJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:yzE5pKOhqR8HNsBcTtCjsMiBIKoaSvp037BL7S1MoHluGaalfq
 +V/MjzqiWE6gr5NEtOpTniAsW9qBHnhP1ICOAqVN+ftWLd2VdAQrsN0WLq+UyEJxHD
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="100702932"
Date: Wed, 22 Mar 2023 17:28:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 2/3] tools/xl: make split_string_into_pair() more
 usable
Message-ID: <326177a0-730d-422d-a4bd-fa99eaf81770@perard>
References: <20230322073453.7853-1-jgross@suse.com>
 <20230322073453.7853-3-jgross@suse.com>
 <CAKf6xpvG5+OGJ1iivOAqO7mAf+SfsimMgdfjEh1F36AfatUUkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpvG5+OGJ1iivOAqO7mAf+SfsimMgdfjEh1F36AfatUUkA@mail.gmail.com>

On Wed, Mar 22, 2023 at 08:29:51AM -0400, Jason Andryuk wrote:
> On Wed, Mar 22, 2023 at 3:35 AM Juergen Gross <jgross@suse.com> wrote:
> >
> > Today split_string_into_pair() will not really do what its name is
> > suggesting: instead of splitting a string into a pair of strings using
> > a delimiter, it will return the first two strings of the initial string
> > by using the delimiter.
> >
> > This is never what the callers want, so modify split_string_into_pair()
> > to split the string only at the first delimiter found, resulting in
> > something like "x=a=b" to be split into "x" and "a=b" when being called
> > with "=" as the delimiter. Today the returned strings would be "x" and
> > "a".
> >
> > At the same time switch the delimiter from "const char *" (allowing
> > multiple delimiter characters) to "char" (a single character only), as
> > this makes the function more simple without breaking any use cases.
> >
> > Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

