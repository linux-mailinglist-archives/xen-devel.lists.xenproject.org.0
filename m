Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB7A40272
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 23:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894680.1303399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbFF-0001FQ-EK; Fri, 21 Feb 2025 22:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894680.1303399; Fri, 21 Feb 2025 22:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbFF-0001Dp-Be; Fri, 21 Feb 2025 22:11:41 +0000
Received: by outflank-mailman (input) for mailman id 894680;
 Fri, 21 Feb 2025 22:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ozyL=VM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlbFD-0001BA-UV
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 22:11:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d216177b-f0a0-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 23:11:38 +0100 (CET)
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
X-Inumbo-ID: d216177b-f0a0-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740175896; x=1740435096;
	bh=T4FAb5xjrj98WcC8lm2Q5GtfGwGNHcd7RK5vRIb6rd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Lk63JX0TDYuFhmsxS7s0qYELav25X8rCO/XxEaPeowXx5qi33ZnDg0hnFOXVKo0q6
	 PD2tJaSE5tn9IKbm2HfLWAwE2ivH3FNqTS0DkapKvCMwkpDnE4F9rljutBNFzVTcVf
	 nZR8rikaj3vG60seIa/6ehio08bJuQ6f6rbM1s9GdD/Bh94s/hzSDZcp1Pydps57Cr
	 PliYGAqs3H4WfAbqiBvEt6NFlBnhQgmVnds8EjmNxYedlxrvsyPJ4MTSQbxb4bRgpx
	 KzA0s5IgvZSW9opeLNdOwgJelgB6sj4J7MD0XMIFLDI47Sj5rz18BL27cv9Ru7giVC
	 ZUf14BOWmJcgg==
Date: Fri, 21 Feb 2025 22:11:32 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] xen/console: print Xen version via keyhandler
Message-ID: <Wi0Ti7rSDjrxQNoUp0lx9y6BPWqHurGHfHbDmqqBB3EVsj7_rpoR3Zmjpn8boU1nt1H78UM_JnBpmAN4Y4csk1QMvBXqtOsWTiSo0tUji6M=@proton.me>
In-Reply-To: <cdcdab1c-f19f-42a4-820a-bd35dbf4ab28@suse.com>
References: <20250217213253.2067015-1-dmukhin@ford.com> <cdcdab1c-f19f-42a4-820a-bd35dbf4ab28@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f5ff6e1c0e82ae5d8c169a80d74f92242ae990b6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, February 19th, 2025 at 5:41 AM, Jan Beulich <jbeulich@suse.co=
m> wrote:

>=20
>=20
> On 17.02.2025 22:33, dmkhn@proton.me wrote:
>=20
> > Add Xen version printout to 'h' keyhandler output.
> >=20
> > That is useful for debugging systems that have been left intact for a l=
ong
> > time.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > Reviewed-by: Jan Beulich jbeulich@suse.com
>=20
>=20
> Hmm, wait - there's yet another issue:
>=20
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -129,6 +129,10 @@ static void cf_check show_handlers(unsigned char k=
ey)
> > unsigned int i;
> >=20
> > printk("'%c' pressed -> showing installed handlers\n", key);
> > +
> > + print_version();
> > + print_build_id();
>=20
>=20
> Here and in console_init_preirq() you expect to be able to call the two
> functions, no matter what the tool chain. Then ...
>=20
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -210,9 +210,28 @@ void __init xen_build_init(void)
> > }
> > }
> > #endif /* CONFIG_X86 */
> > - if ( !rc )
> > - printk(XENLOG_INFO "build-id: %phN\n", build_id_len, build_id_p);
> > }
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
> > #endif / BUILD_ID */
>=20
>=20
> ... their definitions cannot be inside an #ifdef. They want to move up:
> - print_build_id() between xen_build_id() and the #ifdef BUILD_ID,
> - print_version() yet higher up, perhaps after xen_build_info().
> I guess I can do so while committing.

Oh, that's right.
Thanks!

Sent v6 with the fix.

>=20
> Jan

