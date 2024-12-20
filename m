Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDE9F8C5B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 07:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861615.1273579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOW9Y-0003xo-RU; Fri, 20 Dec 2024 06:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861615.1273579; Fri, 20 Dec 2024 06:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOW9Y-0003vs-Oc; Fri, 20 Dec 2024 06:06:24 +0000
Received: by outflank-mailman (input) for mailman id 861615;
 Fri, 20 Dec 2024 06:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOW9W-0003vm-IX
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 06:06:23 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8768f5d4-be98-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 07:06:19 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 07:06:19 +0100
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
X-Inumbo-ID: 8768f5d4-be98-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734674780; x=1766210780;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=2RbFRUgw/qI9zihNzLR2Q2ojXC2qlL4c3ZQfciTB1hI=;
  b=caV6+td2pxVRTRTLgnUsLywWWvIxmv6NIFGQ0OkwcuZGM5oHIkPl/yM0
   H4bATC4cBSp+oPEdDU5X5s/PPUP7TRbXX/LwuNEN4+L5d9bpp/MLWCTSM
   8M9Tuw5oo44VjjWI2HYACt/u8y5wjmKs312Kwwneo6ppt2stdVB2OgehK
   0=;
X-CSE-ConnectionGUID: x7KDBgJ+RDmCofNbz/mOcQ==
X-CSE-MsgGUID: cat6bxRdT9+Hz3AwkC8aKA==
X-IronPort-AV: E=Sophos;i="6.12,249,1728943200"; 
   d="scan'208";a="28265590"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <20241219231352.579D5C4CECE@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219231352.579D5C4CECE@smtp.kernel.org>
Date: Fri, 20 Dec 2024 07:06:18 +0100
Cc: mm-commits@vger.kernel.org, sstabellini@kernel.org, roger.pau@citrix.com, michal.orzel@amd.com, julien@xen.org, jbeulich@suse.com, anthony.perard@vates.tech, andrew.cooper3@citrix.com, stable@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
To: "Andrew Morton" <akpm@linux-foundation.org>
MIME-Version: 1.0
Message-ID: <2f7a83-67650980-a2c7-5cf12280@54007280>
Subject: =?utf-8?q?Re=3A?= + =?utf-8?q?lib-remove-dead-code=2Epatch?= added to 
 mm-nonmm-unstable branch
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 20, 2024 00:13 CET, Andrew Morton <akpm@linux-found=
ation.org> wrote:

>=20
> The patch titled
>      Subject: lib/inflate.c: remove dead code
> has been added to the -mm mm-nonmm-unstable branch.  Its filename is
>      lib-remove-dead-code.patch
>=20
> This patch will shortly appear at
>      https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/=
tree/patches/lib-remove-dead-code.patch
>=20
> This patch will later appear in the mm-nonmm-unstable branch at
>     git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>=20
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed

Hello Andrew,

Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Cc: xen-devel@lists.xenproject.org

https://lore.kernel.org/lkml/20241219224645.749233-1-ariel.otilibili-an=
ieli@eurecom.fr/

Thank you,
Ariel
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>=20
> *** Remember to use Documentation/process/submit-checklist.rst when t=
esting your code ***
>=20
> The -mm tree is included into linux-next via the mm-everything
> branch at git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> and is updated there every 2-3 working days
>=20
> ------------------------------------------------------
> From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> Subject: lib/inflate.c: remove dead code
> Date: Thu, 19 Dec 2024 10:21:12 +0100
>=20
> This is a follow up from a discussion in Xen:
>=20
> The if-statement tests that `res` is non-zero; meaning the case zero =
is
> never reached.
>=20
> Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f=
0@suse.com/
> Link: https://lkml.kernel.org/r/20241219092615.644642-2-ariel.otilibi=
li-anieli@eurecom.fr
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
>  lib/inflate.c |    2 --
>  1 file changed, 2 deletions(-)
>=20
> --- a/lib/inflate.c~lib-remove-dead-code
> +++ a/lib/inflate.c
> @@ -1257,8 +1257,6 @@ static int INIT gunzip(void)
>      /* Decompress */
>      if ((res =3D inflate())) {
>  	    switch (res) {
> -	    case 0:
> -		    break;
>  	    case 1:
>  		    error("invalid compressed format (err=3D1)");
>  		    break;
> =5F
>=20
> Patches currently in -mm which might be from ariel.otilibili-anieli@e=
urecom.fr are
>=20
> lib-remove-dead-code.patch
>


