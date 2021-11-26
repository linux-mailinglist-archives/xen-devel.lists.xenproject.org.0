Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72D45EC15
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 12:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232538.403229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYxy-0005Jq-Sj; Fri, 26 Nov 2021 11:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232538.403229; Fri, 26 Nov 2021 11:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYxy-0005HK-Pg; Fri, 26 Nov 2021 11:00:30 +0000
Received: by outflank-mailman (input) for mailman id 232538;
 Fri, 26 Nov 2021 10:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93LH=QN=neclab.eu=simon.kuenzer@srs-se1.protection.inumbo.net>)
 id 1mqYuw-0004RP-LJ
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 10:57:23 +0000
Received: from mailer2.neclab.eu (mailer2.neclab.eu [195.37.70.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85ded130-4ea7-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 11:56:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mailer2.neclab.eu (Postfix) with ESMTP id CA23FF2008;
 Fri, 26 Nov 2021 11:57:20 +0100 (CET)
Received: from mailer2.neclab.eu ([127.0.0.1])
 by localhost (atlas-b.office.hd [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1mP4a9VkC9T; Fri, 26 Nov 2021 11:57:20 +0100 (CET)
Received: from titania.office.hd (titania.office.hd [192.168.24.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailer2.neclab.eu (Postfix) with ESMTPS id 80843F2001;
 Fri, 26 Nov 2021 11:57:10 +0100 (CET)
Received: from puck.office.hd (192.168.24.91) by titania.office.hd
 (192.168.24.89) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 26 Nov
 2021 11:57:10 +0100
Received: from puck.office.hd ([192.168.126.12]) by puck.office.hd
 ([192.168.126.12]) with mapi id 15.01.2375.017; Fri, 26 Nov 2021 11:57:10
 +0100
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
X-Inumbo-ID: 85ded130-4ea7-11ec-a9d2-d9f7a1cc8784
X-Virus-Scanned: Amavisd on Debian GNU/Linux (atlas-b.office.hd)
X-ENC: Last-Hop-TLS-encrypted
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neclab.eu;
	s=mailer2-20210408; t=1637924240;
	bh=DOtE/14xDtsOfs3Q3eu5136dze70GcMIIgV8ryhIUI4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jq15+bFjoYphQedudKQ27CwcthWRgDtSdHJ5AM1Dc6DRxDndECDY7SF+1A1oA0urk
	 7pkaA1TgczMdzmI3xx8sto5jY135M+5l3BtDVx7uxytgi6F/6rtTnhAbxlbkuCCprK
	 k2oNuOF6GzP4BG2JnxvKEXGBGMig/lGq+SqKdKIWVuHbxk8bUcR0FJWNMZogM9YZAZ
	 DiQg/isqYDjTYiUvj1oItlQ67rPgIJU2JBj9XJ1t9uGP3TwRg++uoQpiaMc1R7aOkf
	 mfof9mZ/Lm6w3Q6wtW6ahUCa4XuSrNj/dQ9kHTH1Ar31A+LwmEjiWEXYreGM97Hb2t
	 rl0s0seXALFJQ==
X-ENC: Last-Hop-TLS-encrypted
From: Simon Kuenzer <simon.kuenzer@neclab.eu>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Manuel Bouyer <bouyer@antioche.eu.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Thread-Topic: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Thread-Index: AQHX4pO3ccMM1QJyxkurYeSR+yaLN6wVkssA
Date: Fri, 26 Nov 2021 10:57:09 +0000
Message-ID: <18A6BC1C-E48B-4EAF-8972-AA7FEE7BC837@neclab.eu>
References: <20211126065547.22644-1-jgross@suse.com>
In-Reply-To: <20211126065547.22644-1-jgross@suse.com>
Accept-Language: en-GB, gl-ES, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.7)
x-originating-ip: [192.168.24.96]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1DF4372E04ED748A828405A3AF7AD96@office.hd>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi Juergen,

thanks a lot for putting us in CC. From the Unikraft perspective, we are fi=
ne with the change because we currently maintain a copy of the Xen headers =
in our tree. Our main reason is that we aim to keep compiling easier by avo=
iding off-tree references. Obviously, we have to update our copy but a diff=
 will tell us where we need to adopt our code.
In general, I like the clarity of the interface change that you are suggest=
ing.

Simon

> On 26. Nov 2021, at 07:55, Juergen Gross <jgross@suse.com> wrote:
>=20
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
>=20
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.
>=20
> Note that the known misuses need to be switched to the new
> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.
>=20
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Manuel Bouyer <bouyer@antioche.eu.org>
> Cc: Simon Kuenzer <simon.kuenzer@neclab.eu>
> Cc: Paul Durrant <paul@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> I have checked Xen, Mini-OS, qemu, grub2, OVMF and Linux kernel for
> misuses of the RING_HAS_UNCONSUMED_*() macros. There is currently only
> one instance in the Linux kernel netback driver. The BSDs, UNIKRAFT
> and Windows PV drivers should be checked for misuse, too.
> ---
> xen/include/public/io/ring.h | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
> index c486c457e0..efbc152174 100644
> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -208,11 +208,11 @@ typedef struct __name##_back_ring __name##_back_rin=
g_t
>     (RING_FREE_REQUESTS(_r) =3D=3D 0)
>=20
> /* Test if there are outstanding messages to be processed on a ring. */
> -#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               =
\
> +#define RING_NR_UNCONSUMED_RESPONSES(_r)                                =
\
>     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
>=20
> #ifdef __GNUC__
> -#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             =
\
> +#define RING_NR_UNCONSUMED_REQUESTS(_r) ({                              =
\
>     unsigned int req =3D (_r)->sring->req_prod - (_r)->req_cons;         =
 \
>     unsigned int rsp =3D RING_SIZE(_r) -                                 =
 \
>         ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
> @@ -220,13 +220,16 @@ typedef struct __name##_back_ring __name##_back_rin=
g_t
> })
> #else
> /* Same as above, but without the nice GCC ({ ... }) syntax. */
> -#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                =
\
> +#define RING_NR_UNCONSUMED_REQUESTS(_r)                                 =
\
>     ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
>       (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
>      ((_r)->sring->req_prod - (_r)->req_cons) :                         \
>      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
> #endif
>=20
> +#define RING_HAS_UNCONSUMED_RESPONSES(_r) (!!RING_NR_UNCONSUMED_RESPONSE=
S(_r))
> +#define RING_HAS_UNCONSUMED_REQUESTS(_r)  (!!RING_NR_UNCONSUMED_REQUESTS=
(_r))
> +
> /* Direct access to individual ring elements, by index. */
> #define RING_GET_REQUEST(_r, _idx)                                      \
>     (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
> --=20
> 2.26.2
>=20


