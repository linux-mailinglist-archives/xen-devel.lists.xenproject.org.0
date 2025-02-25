Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB479A432C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 03:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895402.1304000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmkKG-0002KU-8g; Tue, 25 Feb 2025 02:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895402.1304000; Tue, 25 Feb 2025 02:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmkKG-0002He-5u; Tue, 25 Feb 2025 02:05:36 +0000
Received: by outflank-mailman (input) for mailman id 895402;
 Tue, 25 Feb 2025 02:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cgXI=VQ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tmkKE-0002HY-AN
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 02:05:35 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5d2abc-f31c-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 03:05:30 +0100 (CET)
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
X-Inumbo-ID: fd5d2abc-f31c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740449129; x=1740708329;
	bh=V7PPKjUf553a3qTP7MDszfe0M3K6/c9WY67tJFxQQuE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dAEsxPljJ1rcIhTF8FVgKH/FXH8wqqlchD9/xjzpzGTwIGx/q7jKCUZu+gMhC0p41
	 Zifhop7/WVUnh996QGlovR8hs35G14HSIo2xQt832Nw//+JFwcOwV5Zw8xh3in/RoE
	 /fQeSbAj2YCQIxUPFyAKAxCDUHyETvaSPMCg3WeQv5X03VL43pR4eC0xJBP8so817f
	 iYg4gkgngBGtbOOHThy1i7VxoP0lx3eOy0lTb9MxZxmO6cFifvv66uuXbkRmPjQXVK
	 BWxXqKMxGxbVBdBrQWTXV71mOSk1gnpfrIREo5dOSzBSv79sOadyhB6gTX2HtoD1yQ
	 oWwrqBSciGCUw==
Date: Tue, 25 Feb 2025 02:05:25 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/console: print Xen version via keyhandler
Message-ID: <klvw-Xn0DG4JhH3GUDBMdlr5wLDxJe6NQYhF18CXnd_FyHNXJb8uR7e6ahPk2c_-pHfliAvI7ELdgBZdkcJlEaOE3b6gN1DxIOQrv5-czNM=@proton.me>
In-Reply-To: <21cbd761-7ba0-4608-9076-75d0412e647e@suse.com>
References: <20250221220925.1391144-1-dmukhin@ford.com> <21cbd761-7ba0-4608-9076-75d0412e647e@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 867873111dd8eab124d3f4ab4dedfab46d570d57
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, February 24th, 2025 at 3:03 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>=20
>=20
> On 21.02.2025 23:10, dmkhn@proton.me wrote:
>=20
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -210,10 +210,29 @@ void __init xen_build_init(void)
> > }
> > }
> > #endif /* CONFIG_X86 */
> > - if ( !rc )
> > - printk(XENLOG_INFO "build-id: %phN\n", build_id_len, build_id_p);
> > }
> > #endif / BUILD_ID /
> > +
> > +void print_version(void)
> > +{
> > + printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> > + xen_major_version(), xen_minor_version(), xen_extra_version(),
> > + xen_compile_by(), xen_compile_domain(), xen_compiler(),
> > + xen_build_info(), xen_compile_date());
> > +
> > + printk("Latest ChangeSet: %s\n", xen_changeset());
> > +}
> > +
> > +void print_build_id(void)
> > +{
> > + /
> > + * NB: build_id_len may be 0 if XEN_HAS_BUILD_ID=3Dn.
> > + * Do not print empty build-id.
> > + */
> > + if ( build_id_len )
> > + printk("build-id: %phN\n", build_id_len, build_id_p);
> > +}
> > +
> > /
> > * Local variables:
> > * mode: C
>=20
>=20
> I'm sorry to be picky, but why do you think I said in the v5 reply where
> I think the code additions want to go? As it stands, you could as well
> have left the editing to me, while committing, as now I will still need
> to edit things.


Sorry for confusion!


>=20
> Jan

