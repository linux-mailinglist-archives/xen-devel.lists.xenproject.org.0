Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1EE7ABE8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 17:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsTd4-0003qa-IT; Tue, 30 Jul 2019 15:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hz7M=V3=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hsTd3-0003qR-5H
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 15:01:29 +0000
X-Inumbo-ID: e799359e-b2da-11e9-8276-4387be46ea12
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e799359e-b2da-11e9-8276-4387be46ea12;
 Tue, 30 Jul 2019 15:01:27 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id AEE3A1247;
 Tue, 30 Jul 2019 11:01:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 30 Jul 2019 11:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zvdSC+
 ++bOixa8/Ggn3YSFdCsBfxtdhmukIIZhQQVgs=; b=lW+W2m09RjTW3IqalZ8nAn
 FSD+/aAr7gAdc5pa7CPKW3L82lWY7dJn+6/Gr23FPNxuMJnI/xrjPU0IIP7/zb3p
 5k+VsJg2pmEKJz3azrNAGRmDONjC5kl2dyEwteYcz551n+KY+LnCKI6WFEgUYZKb
 RDblacx4JKeUWRzwShHITV1aMT5+W47beGTgZD6F3ue6a8uuhd9MRyCR7s20ZeKq
 kpA/PCcwus1ILYsOfUoAszNv0SRJdzrcnoEKaerpuRPRcGA7SfRuryzp27xAl4vp
 bZWmnZLD3LkHbMmMw3g5A6aCMdynN7tjF2buSgh3CTxBul395PTJqOtTE9DnBciQ
 ==
X-ME-Sender: <xms:xVtAXeR9tmyWb7Jq50fEaB4mJnR4qwywkr4BgNzG1mH7rHpnEUx11w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xVtAXV210lSFKwmpx-PfTm8U5WmitHBoEz5HwQNjvesy9ZYtz0Osrg>
 <xmx:xVtAXZ_MOb1wHRptEn25foHXEtIqmD6mI2XiFyhIgbRk2BlqJsoGGQ>
 <xmx:xVtAXe9t3K9R8osyOcYpwdk3UUEyDI2qBoJR5QueB7AFJ7Fv3HYPJw>
 <xmx:xltAXSJtbrQmVHYJZvo0vjZM4LrE06nFs4xuqcvzmZW7QWQGN-Lqgw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 937328005A;
 Tue, 30 Jul 2019 11:01:23 -0400 (EDT)
Date: Tue, 30 Jul 2019 17:01:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Message-ID: <20190730150119.GS1250@mail-itl>
References: <20190215024830.GA26477@jordon-HP-15-Notebook-PC>
 <20190728180611.GA20589@mail-itl>
 <CAFqt6zaMDnpB-RuapQAyYAub1t7oSdHH_pTD=f5k-s327ZvqMA@mail.gmail.com>
 <CAFqt6zY+07JBxAVfMqb+X78mXwFOj2VBh0nbR2tGnQOP9RrNkQ@mail.gmail.com>
 <20190729133642.GQ1250@mail-itl>
 <CAFqt6zZN+6r6wYJY+f15JAjj8dY+o30w_+EWH9Vy2kUXCKSBog@mail.gmail.com>
 <bf02becc-9db0-bb78-8efc-9e25cc115237@oracle.com>
 <20190730142233.GR1250@mail-itl>
 <CAFqt6zZOymx8RH75F69exukLYcGd45xpUHkRHK8nYXpwF8co6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZOymx8RH75F69exukLYcGd45xpUHkRHK8nYXpwF8co6g@mail.gmail.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_map_pages()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 robin.murphy@arm.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0020357988194920202=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0020357988194920202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KI6XeYrntNhU1GwB"
Content-Disposition: inline


--KI6XeYrntNhU1GwB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 08:22:02PM +0530, Souptick Joarder wrote:
> On Tue, Jul 30, 2019 at 7:52 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Jul 30, 2019 at 10:05:42AM -0400, Boris Ostrovsky wrote:
> > > On 7/30/19 2:03 AM, Souptick Joarder wrote:
> > > > On Mon, Jul 29, 2019 at 7:06 PM Marek Marczykowski-G=C3=B3recki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > >> On Mon, Jul 29, 2019 at 02:02:54PM +0530, Souptick Joarder wrote:
> > > >>> On Mon, Jul 29, 2019 at 1:35 PM Souptick Joarder <jrdr.linux@gmai=
l.com> wrote:
> > > >>>> On Sun, Jul 28, 2019 at 11:36 PM Marek Marczykowski-G=C3=B3recki
> > > >>>> <marmarek@invisiblethingslab.com> wrote:
> > > >>>>> On Fri, Feb 15, 2019 at 08:18:31AM +0530, Souptick Joarder wrot=
e:
> > > >>>>>> Convert to use vm_map_pages() to map range of kernel
> > > >>>>>> memory to user vma.
> > > >>>>>>
> > > >>>>>> map->count is passed to vm_map_pages() and internal API
> > > >>>>>> verify map->count against count ( count =3D vma_pages(vma))
> > > >>>>>> for page array boundary overrun condition.
> > > >>>>> This commit breaks gntdev driver. If vma->vm_pgoff > 0, vm_map_=
pages
> > > >>>>> will:
> > > >>>>>  - use map->pages starting at vma->vm_pgoff instead of 0
> > > >>>> The actual code ignores vma->vm_pgoff > 0 scenario and mapped
> > > >>>> the entire map->pages[i]. Why the entire map->pages[i] needs to =
be mapped
> > > >>>> if vma->vm_pgoff > 0 (in original code) ?
> > > >> vma->vm_pgoff is used as index passed to gntdev_find_map_index. It=
's
> > > >> basically (ab)using this parameter for "which grant reference to m=
ap".
> > > >>
> > > >>>> are you referring to set vma->vm_pgoff =3D 0 irrespective of val=
ue passed
> > > >>>> from user space ? If yes, using vm_map_pages_zero() is an altern=
ate
> > > >>>> option.
> > > >> Yes, that should work.
> > > > I prefer to use vm_map_pages_zero() to resolve both the issues. Alt=
ernatively
> > > > the patch can be reverted as you suggested. Let me know you opinion=
 and wait
> > > > for feedback from others.
> > > >
> > > > Boris, would you like to give any feedback ?
> > >
> > > vm_map_pages_zero() looks good to me. Marek, does it work for you?
> >
> > Yes, replacing vm_map_pages() with vm_map_pages_zero() fixes the
> > problem for me.
>=20
> Marek, I can send a patch for the same if you are ok.
> We need to cc stable as this changes are available in 5.2.4.

Sounds good, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KI6XeYrntNhU1GwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1AW78ACgkQ24/THMrX
1yzCXgf/RBo3QvtbZfVV9r4EG7nQccY0lAa6q3J2HQnpO7yS80HMzp40ccWa+5io
c7QEt7/NsgEzzv7Aergzv6QivV7yH18RFG+RGWN/nEMOX2qNuSHIB6UVhVFtasWU
+4MfnwFyd6qMogaOXYSQ+n9Um2IPUdhc5hqZiMLufY2As7d3ccNYvccpR/ydE7oc
LdYvyAjOwPwFlketiZ5j73iL0J4aPNqjox00ZoVAtEijnAyTzf3RB+fIUc0WtPUW
+UrEDqTkVDwbCg0NfQtsR7UI3FZmv7x5gbmXlGZkdDGFlpKSbFhZwXLpmfv5cHKt
0lP4AtlbS/Pw0vrNR4Vb3Ex6oU/+NQ==
=afZC
-----END PGP SIGNATURE-----

--KI6XeYrntNhU1GwB--


--===============0020357988194920202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0020357988194920202==--

