Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958814A6A0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:57:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5nA-0005g4-UO; Mon, 27 Jan 2020 14:55:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tmsS=3Q=cs.helsinki.fi=ilpo.jarvinen@srs-us1.protection.inumbo.net>)
 id 1iw5n9-0005fp-Df
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:55:07 +0000
X-Inumbo-ID: 0107bffa-4115-11ea-8560-12813bfff9fa
Received: from script.cs.helsinki.fi (unknown [128.214.11.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0107bffa-4115-11ea-8560-12813bfff9fa;
 Mon, 27 Jan 2020 14:55:06 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Mon,
 27 Jan 2020 16:55:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=vdxg5gjMyzskaNQix
 ta8LOlAYFrSE5qJm2t6RbiNQOI=; b=U07Geb8xs/EPd1OaXFcmv/9oSOuCNonn2
 K6yBaRFoKVms3YSkfMKk/10btqCx4CYIWbZ5j1SUr18Zs+whduV0FiNjJpfXz608
 rQzkUKauuMoNsMsZFiDQpu1SHA6phOnYeB3ZhV7F6M0st4nHRd78jvRbU0rqcMl/
 Ri2qcutaaM=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Mon, 27 Jan 2020 16:55:04 +0200
 id 00000000005A014E.000000005E2EF9C8.000048F2
Date: Mon, 27 Jan 2020 16:55:04 +0200 (EET)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: "=?ISO-8859-15?Q?J=FCrgen_Gro=DF?=" <jgross@suse.com>
In-Reply-To: <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
Message-ID: <alpine.DEB.2.20.2001271649440.7272@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-18726-1580136904-0001-2"
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-18726-1580136904-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jan 2020, J=FCrgen Gro=DF wrote:

> On 27.01.20 14:16, Ilpo J=E4rvinen wrote:
> > Hi,
> >=20
> > I've noted that 5.5-rcs and now 5.5-based kernel fails to boot in VM.
> > 5.4 based kernels worked fine and there seems to have been some chang=
es in
> > drivers/xen post-5.4 so perhaps they broke something?
>=20
> I can't reproduce your problem. Just booted a VM with kernel 5.5 as
> PV- and as HVM-guest without any problems.

Thanks. The VM in question is using PVH (but I don't know enough to know=20
if that makes any difference).

> You seem to use qubes. Maybe you should start asking there?

Yes, I'm using qubes and I actually first send an email there asking=20
whether I should escalate it to xen-devel.

--=20
 i.
--=_script-18726-1580136904-0001-2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=_script-18726-1580136904-0001-2--

