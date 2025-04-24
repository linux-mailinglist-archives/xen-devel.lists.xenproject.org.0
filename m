Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4BA9A873
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 11:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966035.1356375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7t55-0004WT-Di; Thu, 24 Apr 2025 09:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966035.1356375; Thu, 24 Apr 2025 09:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7t55-0004Tm-AL; Thu, 24 Apr 2025 09:41:19 +0000
Received: by outflank-mailman (input) for mailman id 966035;
 Thu, 24 Apr 2025 09:41:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7t54-0004TE-Ey
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 09:41:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7t53-001ZJD-1X;
 Thu, 24 Apr 2025 09:41:17 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7t53-00AFix-05;
 Thu, 24 Apr 2025 09:41:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=+IARJY4v0fSj3emoiMfOQahZi4aUMsoPojKmfZ/bv9g=; b=gfeF79RADN8Ke6r6yODssHBSzJ
	UW1QV1xLpmhqFPcGPw9CQLRG0XPadLOyqlRs0UWrSzVQMP9eeOknjOiX3spu6uhdfVmQkFmcE5N5S
	IGmt6Fybm7xDXEj1tPxerUVxLrZ/oy3ZfgIP1mQjjzpzYKVE45KKJf62Ituetj/+ant0=;
Date: Thu, 24 Apr 2025 11:41:14 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
Message-ID: <aAoHOrcZ5LlhEObL@l14>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408123526.14613-3-jgross@suse.com>

On Tue, Apr 08, 2025 at 02:35:20PM +0200, Juergen Gross wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 7339c44efd..ccf0c58895 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -895,12 +895,6 @@ is used.
>  Specifies the path to the X authority file that should be used to
>  connect to the X server when the B<sdl> option is used.
>  
> -=item B<opengl=BOOLEAN>

This `opengl` sub-option is also mention above, for the `vfb` option.

> -
> -Enable OpenGL acceleration of the SDL display. Only effects machines
> -using B<device_model_version="qemu-xen-traditional"> and only if the
> -device-model was compiled with OpenGL support. The default is 0 (disabled).
> -
>  =item B<keymap=LANG>
>  
>  Configure the keymap to use for the keyboard associated with this
> @@ -1215,17 +1209,14 @@ working graphics passthrough. See the XenVGAPassthroughTestedAdapters
>  L<https://wiki.xenproject.org/wiki/XenVGAPassthroughTestedAdapters> wiki page
>  for graphics cards currently supported by B<gfx_passthru>.
>  
> -B<gfx_passthru> is currently supported both with the qemu-xen-traditional
> -device-model and upstream qemu-xen device-model.
> +B<gfx_passthru> is currently supported with the upstream qemu-xen device-model.

I don't understand why this is written in the doc :-(, where is it not
supported? Previous revision had: "only supported on qemu-trad, no
support for qemu-xen" which was useful information, and was changed
later when qemu-xen gain support. I would remove the sentence.

>  When given as a boolean the B<gfx_passthru> option either disables graphics
>  card passthrough or enables autodetection.
>  
>  When given as a string the B<gfx_passthru> option describes the type
>  of device to enable. Note that this behavior is only supported with the
> -upstream qemu-xen device-model. With qemu-xen-traditional IGD (Intel Graphics
> -Device) is always assumed and options other than autodetect or explicit IGD
> -will result in an error.
> +upstream qemu-xen device-model.

Here, we can remove the "Note that this behavior is only supported with
qemu-xen dm", this is the only device model supported so I hope the
behavior is supported in this case...

>  
>  Currently, valid values for the option are:
>  
> @@ -1903,10 +1894,7 @@ it may be useful to request a different one, like UEFI.
>  
>  =item B<rombios>
>  
> -Loads ROMBIOS, a 16-bit x86 compatible BIOS. This is used by default
> -when B<device_model_version=qemu-xen-traditional>. This is the only BIOS
> -option supported when B<device_model_version=qemu-xen-traditional>. This is
> -the BIOS used by all previous Xen versions.
> +Loads ROMBIOS, a 16-bit x86 compatible BIOS.

This option is not valid anymore, libxl will complain with:
    "qemu-xen does not support bios=rombios."

And I have no idea if it can work on not, I just know that XenServer
still use RomBIOS with a patched QEMU.

>  =item B<seabios>
>  
> @@ -1926,8 +1914,7 @@ Override the path to the blob to be used as BIOS. The blob provided here MUST
>  be consistent with the B<bios=> which you have specified. You should not
>  normally need to specify this option.
>  
> -This option does not have any effect if using B<bios="rombios"> or
> -B<device_model_version="qemu-xen-traditional">.
> +This option does not have any effect if using B<bios="rombios">.

This doesn't seems to be true. I think the only way currently to have
`bios_path_override` been effective is to start a guest with type=hvm
and device_model_version=qemu-xen.

So maybe instead we should write "Requires
B<device_model_version="qemu-xen">." like we have for the bios=ovmf option.


Thanks,

-- 
Anthony PERARD

