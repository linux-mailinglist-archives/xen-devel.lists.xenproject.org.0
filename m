Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8893CBEA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 02:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765180.1175766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX8XI-0004Ua-Oz; Fri, 26 Jul 2024 00:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765180.1175766; Fri, 26 Jul 2024 00:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX8XI-0004SH-L4; Fri, 26 Jul 2024 00:10:16 +0000
Received: by outflank-mailman (input) for mailman id 765180;
 Fri, 26 Jul 2024 00:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdqS=O2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sX8XH-0004SB-NL
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 00:10:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d7fc060-4ae3-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 02:10:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D33F61465;
 Fri, 26 Jul 2024 00:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9D4C116B1;
 Fri, 26 Jul 2024 00:10:11 +0000 (UTC)
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
X-Inumbo-ID: 6d7fc060-4ae3-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721952612;
	bh=Tkz4GQlHoVPhtWQR8vMeBbjvWRmzouX17IeGbQXjVMg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZfePysSYhNoiPsxOojav541KYWboUwwsxGwe/lOXfp5TQidbl6v4HkU7fcqecMeFx
	 h2zntHUNYteFtL8XpMXvgHj61Ez3QDb3MQldWTL5K/JxYOUuUMpYuDRh84zn44epvC
	 y+3CytXMCcPVULYSw4PYnTQWb+F8p/ODcMZ8T1LPl3ppk7ERb0de+Z0F6NrO4cbaVJ
	 ZOs53lzBJDsMK6qoyF12O0sZxeTDnm2hs/l4RkCktg6RphWi0lEvsA4rhpQl8IvVbi
	 MXp+HOsFSP9tiNolgM1Scdg38qeGWrJCgPS+09qUx6h04fP2y2if8qt81qiEU1DQCC
	 odVUQ2df2vmsg==
Date: Thu, 25 Jul 2024 17:10:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: workaround broken selinux+docker interaction in
 yocto
In-Reply-To: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2407251709250.4857@ubuntu-linux-20-04-desktop>
References: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2146384984-1721952612=:4857"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2146384984-1721952612=:4857
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 20 Jul 2024, Marek Marczykowski-Górecki wrote:
> `cp --preserve=xattr` doesn't work in docker when SELinux is enabled. It
> tries to set the "security.selinux" xattr, but SELinux (or overlay fs?)
> denies it.
> Workaround it by skipping selinux.selinux xattr copying.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I tested this patch together with another patch to upgrade Yocto to
scarthgap, I'll send that separately. I have already built and pushed
the yocto scarthgap containers.

> ---
> Tested here:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7386198058
> 
> But since yocto container fails to build, it isn't exactly easy to apply
> this patch...
> "kirkstone" branch of meta-virtualization seems to target Xen 4.15 and
> 4.16, so it isn't exactly surprising it fails to build with 4.19.
> 
> I tried also bumping yocto version to scarthgap (which supposedly should
> have updated pygrub patch), but that fails to build for me too, with a
> different error:
> 
>     ERROR: Layer 'filesystems-layer' depends on layer 'networking-layer', but this layer is not enabled in your configuration
>     ERROR: Parse failure with the specified layer added, exiting.
>     ...
>     ERROR: Nothing PROVIDES 'xen-image-minimal'. Close matches:
>       core-image-minimal
>       core-image-minimal-dev
>     Parsing of 2472 .bb files complete (0 cached, 2472 parsed). 4309 targets, 101 skipped, 0 masked, 0 errors.
> ---
>  automation/build/yocto/yocto.dockerfile.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
~ index fbaa4e191caa..600db7bf4d19 100644
> --- a/automation/build/yocto/yocto.dockerfile.in
> +++ b/automation/build/yocto/yocto.dockerfile.in
> @@ -68,6 +68,10 @@ RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
>  ENV LANG en_US.UTF-8
>  ENV LC_ALL en_US.UTF-8
>  
> +# Workaround `cp --preserve=xattr` not working in docker when SELinux is
> +# enabled
> +RUN echo "security.selinux skip" >> /etc/xattr.conf
> +
>  # Create a user for the build (we don't want to build as root).
>  ENV USER_NAME docker-build
>  ARG host_uid=1000
> -- 
> 2.45.2
> 
--8323329-2146384984-1721952612=:4857--

