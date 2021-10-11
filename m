Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C294294AA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206357.361910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyJE-0008Oi-PS; Mon, 11 Oct 2021 16:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206357.361910; Mon, 11 Oct 2021 16:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyJE-0008Mk-M9; Mon, 11 Oct 2021 16:37:52 +0000
Received: by outflank-mailman (input) for mailman id 206357;
 Mon, 11 Oct 2021 16:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZyJE-0008Me-4B
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:37:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92f3eeac-2ab1-11ec-80ec-12813bfff9fa;
 Mon, 11 Oct 2021 16:37:51 +0000 (UTC)
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
X-Inumbo-ID: 92f3eeac-2ab1-11ec-80ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633970271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XlKJpIUE3UGy9C8tSy3dP5WgcSVqWoye1hTcfBmgpqQ=;
  b=SW6Ap15Q1totEzoYDuCTYHxbYJrXZJEJYqHYX+znvUK1i56U0FBOEZ8B
   uRDsvnsQmRHAibcVPOcQrmNH1aw5aOAlf9TFbwKCjyFcRsVdVjZDBB3Af
   ya5JLMdQupsZCKutktmBWDpOFv699lqdzvyqJD32UzAhFfgTOSL0oh77N
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PdyW0O+b5+D+IODLioCQtExeE2Esuo6XBB8pwYXXMPq4Ca3Ch2MNwxtly8FrYrrrPrUfwGy9W/
 DsLaJenWuvbahWtxHfejERttRc8y4vhtSBJeNSETiVw+xyGQpX30S+9LIEv1ZRnUtSGO7qxb6/
 hI+hB9ND/vZ5hg6+IufYf6KkqmqTODgoxbn29uv1FtG00NEWdmmhP0J9BX/bOBi99WSoSAaDcj
 SUWRU3KK4/bi9glaUmOiinp6eu5OMgoNNVPrOIlfxMyU1Wh3AhS+IsreFOSPq8vD6uIi6D/eC0
 FAj7kuMdMj/5mAOPkP09JDZX
X-SBRS: 5.1
X-MesageID: 56771204
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uliClK+/biLTm9t3BLotDrUDVniTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GcaWGyAPazfZGrwe99yPYu2oEoB7Z/TyoNmGQJp+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhp9
 IhOrJK6cD15FaGQgc1aWD5ZEiVXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0QQqmHP
 ZJFAdZpRDbRTjhSOxAcNMsvkKT310jjVRNfhXvA8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2Amlq0j/LLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684makUtJCL
 woP+ywhrYA77kntRd74NzW6r2SDpQU0QMdLHqsx7wTl4qvL4S6JC24cVDlDZdc68sgsSlQC0
 VuEnMjgAzB1h7STRWiA7befrT60Oi89IHcLYGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFdzgzRUnj/tlshTIGgbo2sr1Pc6J5oN52FR1OMu
 HwFncm27+0UC5yJ0iuXT40lNau16vOyFSzTiF9iAbEs7z2ovXWkeOh4/jZ6I0t4N9ceTjXga
 kTTpAB56YdaOT2haqofS4W1BscxxK7sD+P5R+vUZdpDZJt2XAKf9SQobkmVt10Bi2B1z/t5Y
 83CN5/xUzBKUsyL0QZaWc8F7eIo3y40/FmDbpyn1j3g2p2fZXq8HOJt3ES1Usg166aNoQPw+
 tlZNteXxxg3bNASchU74qZIcghUdSlT6YTe7pUNLLbac1UO9HQJUqeJmdscl5pZc7O5fwsi1
 kq2XVNE0xLBjHnDJBTihptLOe63A8gXQZ7WO0UR0beUN5oLPdbHAEQ3LcJfkVwbGApLl6Mco
 x4tIZToPxi3Ym6bkwnxlLGkxGCYSDylhBiVIw2uayUlcphrSmTho4G/JVu+rHZXV3bp7qPSR
 oFMMCuAG/LvoCw4Xa7rhA+HlQvt7RDxZsojN6c3HjWjUBq1q9U7Q8AApvQ2P9sNOX3+Ksiyj
 G6r7eMjjbCV+ecdqYCR7Yjd9tvBO7YuTyJyQjiAhZ7rZHayw4ZW6dIZOAp+VWuGDz2cFWTLT
 bg98swQx9VexAwU7NEmT+oypU/8jvO2z4JnIs1fNC2jRzyW5nlIeBFqBOFD6f9AwKF3owyzV
 h7d89VWI+zRasjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 btzssAh9AHi2AEhNcyLj34I+j3UfGAASaguqroTHJTv1lgw0lhHbJGFUn327ZiDZs9iKE4vJ
 jPI1qPOi64FnhjJcmYpFGiL1u1Y3MxctBdPxV4EBlKIhtua2aNngEwPqWw6F10HwA9G3uR/P
 nlQG3d0fajerS11gMVjXny3H10TDhOu5UGsmUACk3fUThf0WzWVfnE9I+uE4GsQ73lYImpA5
 LidxWvoDWTqccX20ndgUEJpsaW+H9l49wmEk8G7BcWVWZI9ZGO90KOpYGMJrTrhAN8w2xKb9
 bU7or4oZP2pLzMUro06F5KehOYZRx2zLWBfRe1sofESFmbGdTDugTWDJihdoC+WyyAmJaNgN
 /FTGw==
IronPort-HdrOrdr: A9a23:tZO7i6wt6NYWvSqA0MexKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="56771204"
Date: Mon, 11 Oct 2021 17:37:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <paul@xen.org>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>,
	"Juergen Gross" <jgross@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Message-ID: <YWRoMtLTd4G55koT@perard>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211008055535.337436-8-andr2000@gmail.com>

On Fri, Oct 08, 2021 at 08:55:32AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Arm's PCI passthrough implementation doesn't support legacy interrupts,
> but MSI/MSI-X. This can be the case for other platforms too.
> For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> it to the CFLAGS and compile the relevant code in the toolstack only if
> applicable.

I don't think that's true anymore since v2 ;-). The compiler may
choose to avoid compiling code that wouldn't be executed, but I think
that would just be optimisation.

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 7d8c51d49242..bd3f6be2a183 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
>  	-Wno-declaration-after-statement -Wformat-nonliteral
>  CFLAGS += -I.
>  
> +ifeq ($(CONFIG_X86),y)
> +CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> +endif
> +

Could you write this instead:
  CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ

In any case,
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

