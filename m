Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAHZJ+i1pmk7TAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:20:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F292E1EC94C
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 11:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244622.1544035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxMqF-0006wI-L4; Tue, 03 Mar 2026 10:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244622.1544035; Tue, 03 Mar 2026 10:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxMqF-0006tY-GK; Tue, 03 Mar 2026 10:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1244622;
 Tue, 03 Mar 2026 10:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yHR=BD=bounce.vates.tech=bounce-md_30504962.69a6b591.v1-df24cb92e8e74cd2b1688990cf33efc8@srs-se1.protection.inumbo.net>)
 id 1vxMqE-0006tS-FP
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 10:19:02 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6428ef9a-16ea-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 11:18:59 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fQBbj5zSXz35hTcb
 for <xen-devel@lists.xenproject.org>; Tue,  3 Mar 2026 10:18:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df24cb92e8e74cd2b1688990cf33efc8; Tue, 03 Mar 2026 10:18:57 +0000
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
X-Inumbo-ID: 6428ef9a-16ea-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772533137; x=1772803137;
	bh=gY7bo8n2Ji8RCSj9PuRMRRI6asnxRBgmrksWWb7Qm5M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bLUGhutOM0yp3gtdBy0F2pyGsNrguMuxltwwlZVuRv0RJUyxjDdswWkk/44XuPaGX
	 axIPAbYtq2uQEQPNdYuCKk091q6cQ20Q6LGyYwBFxtnJRkamcXZX+ZN0ISdM/4viYS
	 ACMg859JKCpegVVewF1CC2fHb4uhGVnWhNkzpxkr2UemRmJ+PkijJt9fMxzsM9uQF4
	 nvkZINBJ3JLoWkq3ZGbUwyaNgIYAAcrt+UDuLdOK1UV6F15u3QENGEjL9II6EYEMac
	 YCZ3I5+xrVsuwnZlw6+7kj1IqzBD1bRBzsWSVEH4pt/RYNwM7qXRv5bdXqe+NvM8dk
	 eaeCVqsy0OgzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772533137; x=1772793637; i=teddy.astie@vates.tech;
	bh=gY7bo8n2Ji8RCSj9PuRMRRI6asnxRBgmrksWWb7Qm5M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BqNGpWNYyPJAtaQK2hFF+Bn3Xl863tFHM8xe8jMqq1SjcHLtZmBfekDm2XF9I+E+H
	 AGuEoR6W2QElwrpKoErkbh/LQKxzHs1fJVb7JebsYeznQTkh5YmiPqUbrSU/9gD7UI
	 l/yGcxCj+dgWuDeyRL5Es4gQiHgDAMIbGq7lz049hAJHA/1O3d8GoVLTTHibyEayjr
	 +KAqXS3PI+OQDT1bVRoFBw6h+Y2SKeOEbDflAwBSIGvHklxvczTjqcfd5qOx47AZp0
	 cM2r23ZhDKBRKjX9BWKp6WUASZXWu3xAa4YBvjdJ5of/oY1iPh9kCha3syePPaAHvY
	 pUwH/gfxNg8Nw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/ucode:=20Support=20discrete=20modules=20being=20CPIO=20archives?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772533136794
Message-Id: <d1ba9d04-bba1-4c0d-be14-0201cc056aa2@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260223185054.3598305-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260223185054.3598305-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df24cb92e8e74cd2b1688990cf33efc8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260303:md
Date: Tue, 03 Mar 2026 10:18:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F292E1EC94C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,suse.com:email,changelog.md:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.991];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Le 23/02/2026 =C3=A0 19:52, Andrew Cooper a =C3=A9crit=C2=A0:
> Multiple downstream distros have tried passing discrete CPIO archives and
> tripped over this not working.  It turns out to be easy to support, so do=
 so.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Teddy Astie <teddy.astie@vates.tech>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> v2:
>   * Docs update too.
>   * Set opt_scan in early_microcode_load() so microcode_init_cache() oper=
ates
>     properly
> ---
>   CHANGELOG.md                      |  1 +
>   docs/misc/xen-command-line.pandoc | 19 ++++++++-----------
>   xen/arch/x86/cpu/microcode/core.c | 20 +++++++++++++++++++-
>   3 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 18f3d10f20d2..c191e504aba9 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>      - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by=
 Xen to
>        mitigate (by rate-limiting) the system wide impact of an HVM guest
>        misusing atomic instructions.
> +   - Support for CPIO microcode in discrete multiboot modules.
>   
>   ### Removed
>    - On x86:
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index c1f2def9f99c..ebdca007d26b 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2764,23 +2764,20 @@ Controls for CPU microcode loading, available whe=
n `CONFIG_MICROCODE_LOADING`
>   is enabled.
>   
>   In order to load microcode at boot, Xen needs to find a suitable update
> -amongst the modules provided by the bootloader.  Two kinds of microcode =
update
> -are supported:
> +amongst the modules provided by the bootloader.  Two formats are support=
ed:
>   
>    1. Raw microcode containers.  The format of the container is CPU vendo=
r
>       specific.
>   
> - 2. CPIO archive.  This is Linux's preferred mechanism, and involves hav=
ing
> -    the raw containers expressed as files
> + 2. CPIO archive, which involves having the raw containers expressed as =
files
>       (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a =
CPIO
> -    archive, typically prepended to the initrd.
> +    archive.  Linux commonly prepends this to the initrd.
>   
> -The `<integer>` and `scan=3D<bool>` options are mutually exclusive and s=
elect
> -between these two options.  Further restrictions exist for booting xen.e=
fi
> -(see below).
> +The `<integer>` and `scan=3D<bool>` options are mutually exclusive and w=
ork as
> +follows.  Further restrictions exist for booting xen.efi (see below).
>   
> - *  The `<integer>` option nominates a specific multiboot module as a ra=
w
> -    container (option 1 above).  Valid options start from 1 (module 0 is
> + *  The `<integer>` option nominates a specific multiboot module as cont=
aining
> +    microcode in either format.  Valid options start from 1 (module 0 is
>       always the dom0 kernel).  A negative number may be used, and will
>       back-reference from the end of the module list.  i.e. `ucode=3D-1` =
will
>       nominate the final multiboot module.
> @@ -2794,7 +2791,7 @@ When booting xen.efi natively, the concept of multi=
boot modules doesn't exist.
>   Instead:
>   
>    *  In the [EFI configuration file](efi.html), `ucode=3D<filename>` can=
 be used
> -    to identify a file as a raw container (option 1 above).  Use of this
> +    to identify a file as containing microcode in either format.  Use of=
 this
>       mechanism will disable both `<integer>` and `scan=3D`.
>   
>    *  If `ucode=3D<filename>` in the EFI configuration file is not used, =
it is
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microco=
de/core.c
> index ea0b35c4991d..9b8d1e09cb98 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -767,6 +767,7 @@ static int __init early_microcode_load(struct boot_in=
fo *bi)
>       void *data =3D NULL;
>       size_t size;
>       const struct microcode_patch *patch;
> +    struct cpio_data cd;
>       int idx =3D opt_mod_idx;
>       int rc;
>   
> @@ -783,7 +784,6 @@ static int __init early_microcode_load(struct boot_in=
fo *bi)
>           for ( idx =3D 0; idx < bi->nr_modules; ++idx )
>           {
>               const struct boot_module *bm =3D &bi->mods[idx];
> -            struct cpio_data cd;
>   
>               /* Search anything unclaimed or likely to be a CPIO archive=
. */
>               if ( bm->kind !=3D BOOTMOD_UNKNOWN && bm->kind !=3D BOOTMOD=
_RAMDISK )
> @@ -851,6 +851,24 @@ static int __init early_microcode_load(struct boot_i=
nfo *bi)
>                      idx, size);
>               return -ENODEV;
>           }
> +
> +        /*
> +         * If this blob appears to be a CPIO archive, try interpreting i=
t as
> +         * one.  Otherwise treat it as a raw vendor blob.
> +         */
> +        cd =3D find_cpio_data(ucode_ops.cpio_path, data, size);
> +        if ( cd.data )
> +        {
> +            data =3D cd.data;
> +            size =3D cd.size;
> +
> +            /*
> +             * (Ab)use opt_scan to inform microcode_init_cache() that
> +             * early_mod_idx refers to a CPIO archive.
> +             */
> +            opt_scan =3D true;
> +        }
> +
>           goto found;
>       }
>   
> 
> base-commit: 5eb84d6c992cf4e81936872c441b649057947442



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



