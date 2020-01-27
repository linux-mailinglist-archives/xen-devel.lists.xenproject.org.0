Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4862D14ABE0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 23:00:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwCMf-0002QO-PZ; Mon, 27 Jan 2020 21:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmsS=3Q=cs.helsinki.fi=ilpo.jarvinen@srs-us1.protection.inumbo.net>)
 id 1iwCMe-0002QJ-5C
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 21:56:12 +0000
X-Inumbo-ID: d38387ea-414f-11ea-85cc-12813bfff9fa
Received: from script.cs.helsinki.fi (unknown [128.214.11.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d38387ea-414f-11ea-85cc-12813bfff9fa;
 Mon, 27 Jan 2020 21:56:10 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Mon,
 27 Jan 2020 23:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type:content-id; s=dkim20130528; bh=Lpghl/
 thQ1zZ3LEy3Wpqs8O2TBUMU/9iRujKqH+optc=; b=H4B6wK5SpsCyc74B+6nOBb
 ADjGZpjsRCZ+HH7bwlez7blO8ttRuspVvZFyJgRUJ97HiARiLrzl/aVJErdHcBf1
 5DCqBky8pqdMNs4mAXDpX2KqwQwUzYt5lfrcAOnp26OX5q+qfs+kh92G846hZD6x
 SWxmTkPhzIVMTn4NIzaOI=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Mon, 27 Jan 2020 23:56:08 +0200
 id 00000000005A014E.000000005E2F5C78.0000406E
Date: Mon, 27 Jan 2020 23:56:08 +0200 (EET)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: "=?ISO-8859-15?Q?Marek_Marczykowski-G=F3recki?="
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20200127213722.GC2995@mail-itl>
Message-ID: <alpine.DEB.2.20.2001272340530.10612@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
 <20200127213722.GC2995@mail-itl>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-16518-1580162168-0001-2"
Content-ID: <alpine.DEB.2.20.2001272342480.10612@whs-18.cs.helsinki.fi>
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
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
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-16518-1580162168-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.20.2001272342481.10612@whs-18.cs.helsinki.fi>

On Mon, 27 Jan 2020, Marek Marczykowski-G=F3recki wrote:

> On Mon, Jan 27, 2020 at 03:45:11PM +0100, J=FCrgen Gro=DF wrote:
> > On 27.01.20 14:16, Ilpo J=E4rvinen wrote:
> > > Hi,
> > >=20
> > > I've noted that 5.5-rcs and now 5.5-based kernel fails to boot in V=
M.
> > > 5.4 based kernels worked fine and there seems to have been some cha=
nges in
> > > drivers/xen post-5.4 so perhaps they broke something?
> >=20
> > I can't reproduce your problem. Just booted a VM with kernel 5.5 as
> > PV- and as HVM-guest without any problems.
>=20
> It looks like an issue with gntdev driver, so reproducing it require an=
y
> userspace that actually makes use of it.

I don't know enough about gntdev to understand what would use it.

> Any idea what recent change could cause that?

This is just my debian-10 based AppVM booting up. There's nothing special=20
in it I can think of besides the fact I've compiled the kernels myself=20
(and have some TCP related changes in the kernel, the same which work ver=
y=20
fine on 5.4; but the crash occurs so early into the boot I don't think TC=
P=20
even comes into the equation yet).

I can of course compile a kernel without any of my mods if necessary=20
and even try to bisect the problem if need be but any hint or idea which=20
way I should look would certainly help in that effort.


--=20
 i.
--=_script-16518-1580162168-0001-2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=_script-16518-1580162168-0001-2--

