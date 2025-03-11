Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7223A5B9DA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907285.1314542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru6d-0000jv-4Y; Tue, 11 Mar 2025 07:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907285.1314542; Tue, 11 Mar 2025 07:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru6d-0000hH-1l; Tue, 11 Mar 2025 07:32:51 +0000
Received: by outflank-mailman (input) for mailman id 907285;
 Tue, 11 Mar 2025 07:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lFlb=V6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tru6a-0000h9-9z
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:32:48 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ebcb45-fe4b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:32:43 +0100 (CET)
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
X-Inumbo-ID: 04ebcb45-fe4b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gl7qq2yz5raglhuenk5bvtlaqi.protonmail; t=1741678362; x=1741937562;
	bh=vWTTExRyC3/C2U0W69/wzxbUGdMENXfn+QceqYVX4Go=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AJGyLRIozwTizWmr3UIXHbSB72iGCUjd7ujVCcdRUcaBYTfOQa5GUK2/NeAe5ZayU
	 tsmrhXObynHlLScsqbQ7kQdBrDWxoW360BdlvQ3o2qxF0axT/NDQ17tOggufsEhPuG
	 bpsRtbS4ntsPiv29XV2aHbqLpoBXdbye+AO+5fjz4qbHhziJhus+UYZNQEhKqdj2hu
	 Pk1zD+WIU9QuRB5P9IOU8EaRKqAC9uVFRvDerttwbQxOJvV4xWqFmMYs0Xufd2sMaC
	 4aOhNm+2q8bSc8/PprFPoiDEHePEVpnjFA69kr7u/XUeM75XHKz9t2Ov0Q1fCfr0ZL
	 B8/m3dw7pCysg==
Date: Tue, 11 Mar 2025 07:32:37 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] docs: add explanation for 'Resolved:'
Message-ID: <wI4Ade_t6I7-NM0K8sp6oM0TwvQvHFGheTS9ZP_dcsDFV3H5h9H50XUPYvFBAoxpkv_K03MNtct9GdRD_F-_JGNjSLzdV11R4BPMkf570kU=@proton.me>
In-Reply-To: <20250311072805.778362-1-dmkhn@proton.me>
References: <20250311072805.778362-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 457f128c424bd73b6b1b38b425761f43aecd0458
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, March 11th, 2025 at 12:28 AM, dmkhn@proton.me <dmkhn@proton.me>=
 wrote:

>=20
>=20
> From: Denis Mukhin dmukhin@ford.com
>=20
>=20
> 'Resolves:' tag may be used if the patch addresses one of the tickets
> logged via Gitlab to auto-close such ticket when the patch got merged.
>=20
> Add documentation for the tag.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com

Whoops, I made a typo in the subject line of the commit message:
  s/Resolved/Resolves/

If all looks good, can I ask to fix the typo on commit?

Thanks,
Denis

>=20
> ---
> docs/process/sending-patches.pandoc | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-p=
atches.pandoc
> index 2e74c3b57e..9fc3b407ff 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -106,6 +106,18 @@ If git was configured as explained earlier, this can=
 be retrieved using
> `git log --pretty=3Dfixes` otherwise `git log --abbrev=3D12 --oneline` wi=
ll
> give the proper tag and commit-id.
>=20
> +### Resolves:
> +
> +If your patch addresses an issue logged in a GitLab ticket, use the `Res=
olves:`
> +tag followed by the issue link to automatically close the ticket when th=
e patch
> +is merged.
> +
> + Resolves: <URL>
>=20
> +
> +E.g.:
> +
> + Resolves: https://gitlab.com/xen-project/xen/-/issues/185
> +
> ### Backport:
>=20
> A backport tag is an optional tag in the commit message to request a
> --
> 2.34.1

