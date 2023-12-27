Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A081F09D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Dec 2023 17:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660130.1029711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIXB8-00055G-LZ; Wed, 27 Dec 2023 16:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660130.1029711; Wed, 27 Dec 2023 16:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIXB8-00053c-ID; Wed, 27 Dec 2023 16:54:46 +0000
Received: by outflank-mailman (input) for mailman id 660130;
 Wed, 27 Dec 2023 16:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1EeP=IG=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1rIXB6-00053W-UN
 for xen-devel@lists.xenproject.org; Wed, 27 Dec 2023 16:54:45 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a17d6212-a4d8-11ee-9b0f-b553b5be7939;
 Wed, 27 Dec 2023 17:54:42 +0100 (CET)
Received: from neowutran.ovh (maisonhome.neowutran.ovh [82.65.3.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 78B0760C59;
 Wed, 27 Dec 2023 16:54:40 +0000 (UTC)
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
X-Inumbo-ID: a17d6212-a4d8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1703696080; bh=8BYkaWflkhgBjERzagtQSSe50YwD0x8dC+MF//KIfSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AP2QgVBd4IFI4o4XNKZOvbc2ImOaiNQMqlYVt4ia/9HvdIqO2hF3166K1DryrM9WU
	 5c63u78SMRRN2yX9wzryvwz9/SqH4mYT1UdY762dtV3KoM55zgtX2HTyuEz0VwFF2i
	 htubrbMNJQC1PaOqep1GFAPJJC4TOZY5x8i7gPZw4CEbUng5iQChPiuOJv3fUcrQQ4
	 i68uubshEWibfdwQf+ou+DcFx0Jw8ftb5zBU9XwPv4SsEFWI9VVdwkdwh5cpNlPeRn
	 RRaLNX+tGhfwwt5mH0sS9gOxq1RDg7FrzLjdA7FB78NLWKNvsnqwQxTEncMTN1pPDg
	 q0liO8h34wLW2ncyJvau3QtrECnA5QXAHh80JQl2yN/ckbhurLSmdEYav3yM+uOj8+
	 eGYhqto5udTou7gahvUFqI9qevSLxmEOsxzAPkw356X8KVd0JXAReMNpm8bnthrfpl
	 BK3aiqbkO4/ZqjS5s6aYavZS+1ktzn0y+ABcXgBuaDLJe1QQBTImu2JW4dh6A0LUpm
	 qOppyv/1/CQoyB+BOC785uRKvUJVMoGJ9eUto1NvjhEcJQfLkSLG6OsqRmY0xs1W5x
	 tmTqXJOvH/4wKz2ZneFPCOKz6J4Ni9aPSX8bG5YXeU/Y7tpXXCHbDnPEaJmP5qtblv
	 rNU/+e/vfppZX5huXz3KfWjE=
Date: Wed, 27 Dec 2023 17:54:31 +0100
From: Neowutran <xen@neowutran.ovh>
To: 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Disable relocating memory for qemu-xen in
 stubdomain too
Message-ID: <dvzyuckd4w7vii3bytpsecdyyzizgbgxslyxiciobw3ac6wmlb@uolzr2buvi2k>
References: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>

On 2023-12-27 03:12, Marek Marczykowski-Górecki wrote:
> According to comments (and experiments) qemu-xen cannot handle memory
> reolcation done by hvmloader. The code was already disabled when running
> qemu-xen in dom0 (see libxl__spawn_local_dm()), but it was missed when
> adding qemu-xen support to stubdomain. Adjust libxl__spawn_stub_dm() to
> be consistent in this regard.
> 
> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  tools/libs/light/libxl_dm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 14b593110f7c..ed620a9d8e14 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2432,6 +2432,16 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>                          "%s",
>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
>      }
> +    /* Disable relocating memory to make the MMIO hole larger
> +     * unless we're running qemu-traditional and vNUMA is not
> +     * configured. */
> +    libxl__xs_printf(gc, XBT_NULL,
> +                     libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
> +                                    libxl__xs_get_dompath(gc, guest_domid)),
> +                     "%d",
> +                     guest_config->b_info.device_model_version
> +                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> +                     !libxl__vnuma_configured(&guest_config->b_info));
>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>      if (ret<0) {
>          LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
> -- 
> 2.41.0

Seems to work as expected

Thanks, 
Neowutran


