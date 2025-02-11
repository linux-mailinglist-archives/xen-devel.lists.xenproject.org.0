Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA42A304B7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 08:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885104.1294881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thkvi-0004Z8-Pr; Tue, 11 Feb 2025 07:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885104.1294881; Tue, 11 Feb 2025 07:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thkvi-0004Ws-MX; Tue, 11 Feb 2025 07:43:38 +0000
Received: by outflank-mailman (input) for mailman id 885104;
 Tue, 11 Feb 2025 07:43:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ER+F=VC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1thkvh-0004Wk-JT
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 07:43:37 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3671133-e84b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 08:43:31 +0100 (CET)
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
X-Inumbo-ID: e3671133-e84b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739259810; x=1739519010;
	bh=j0KpxK4DDGMhgKEK6RuF2vyRaLE4RfnZrTQaAqVi8XM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=R+w00fk79J0kKXP9NgbLQfIPuyjz05onIdRrXK5fX99XvB7928hs4RXTIGaZRgGJT
	 xrBNhN0+P+maGRirFkpXOQ3+eZok7Ci49FNOorse6YxnfOEeTDcaWUraz3A+KzawBb
	 /V8vuXGqmWn4KPmvIwU2fcMxC63XKuD/Z4obRhPnP8MIIKlbQrwXDf1OwQgXxF/r93
	 DFnBH7n1BvDuwePDgeySzCm+5/ynFzi3Cjw6fH3f9RdI/3Ct8Ii81xfu8COk0BBa6/
	 mSAj+/eRpj/23XwZW0x6iBv7x933QmO10Vr5KoRfZoBbHZ54Ms9tj2BcSaBWBjmoGC
	 k1H0OnC+n2myg==
Date: Tue, 11 Feb 2025 07:43:25 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH] xen/include: introduce resource.h
Message-ID: <Ko-G31widhmIv5ESo26CR7Pt0D5th5XG_jfm1eORblFZav8mMWP5G3UWNfqrrRiI0ttw7-nUhU7glYoAX1jHrmcQtZRxSCRMt5AzCpQjIbc=@proton.me>
In-Reply-To: <a8dcd8a8-8b73-49f1-a030-d9614dc51896@suse.com>
References: <20250207231814.3863449-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2502071854231.619090@ubuntu-linux-20-04-desktop> <a8dcd8a8-8b73-49f1-a030-d9614dc51896@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d4e6ccc9f22b7412d5636125dd2e43e40921484e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, February 10th, 2025 at 1:27 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>=20
>=20
> On 08.02.2025 03:54, Stefano Stabellini wrote:
>=20
> > On Fri, 7 Feb 2025, dmkhn@proton.me wrote:
> >=20
> > > Move resource definitions to a new architecture-agnostic shared heade=
r file.
> > >=20
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> >=20
> > Reviewed-by: Stefano Stabellini sstabellini@kernel.org
>=20
>=20
> Hmm, don't you think ...
>=20
> > > @@ -70,22 +71,8 @@
> > > #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(n=
p, pname, out))
> > > #define of_property_read_bool dt_property_read_bool
> > > #define of_parse_phandle_with_args dt_parse_phandle_with_args
> > > -
> > > -/* Xen: Helpers to get device MMIO and IRQs */
> > > -struct resource
> > > -{
> > > - paddr_t addr;
> > > - paddr_t size;
> > > - unsigned int type;
> > > -};
> > > -
> > > -#define resource_size(res) (res)->size;
> > > -
> > > #define platform_device dt_device_node
>=20
>=20
> ... one of the blank lines being removed here would better stay?

I think the block of assorted macros (the first macro is not of not of_xxx(=
) type)
does not need an extra newline.

The resulting block of macros looks like the following:
[[

/* Alias to Xen device tree helpers */
#define device_node dt_device_node
#define of_phandle_args dt_phandle_args
#define of_device_id dt_device_match
#define of_match_node dt_match_node
#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pna=
me, out))
#define of_property_read_bool dt_property_read_bool
#define of_parse_phandle_with_args dt_parse_phandle_with_args
#define platform_device dt_device_node

]]

>=20
> Jan

