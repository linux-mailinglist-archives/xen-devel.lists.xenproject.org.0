Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD269D9BB7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843911.1259485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFygG-0006YH-D5; Tue, 26 Nov 2024 16:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843911.1259485; Tue, 26 Nov 2024 16:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFygG-0006Vi-AX; Tue, 26 Nov 2024 16:44:52 +0000
Received: by outflank-mailman (input) for mailman id 843911;
 Tue, 26 Nov 2024 16:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v151=SV=bounce.vates.tech=bounce-md_30504962.6745faf9.v1-0688dcd5cbf84ea789141c1879271c86@srs-se1.protection.inumbo.net>)
 id 1tFygE-0006Vc-5a
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:44:50 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc2e17d4-ac15-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 17:44:43 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XyT2159SCzG0CBP9
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 16:44:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0688dcd5cbf84ea789141c1879271c86; Tue, 26 Nov 2024 16:44:41 +0000
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
X-Inumbo-ID: bc2e17d4-ac15-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImJjMmUxN2Q0LWFjMTUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjM5NDgzLjQwMjkzNywic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDVmYWY5LnYxLTA2ODhkY2Q1Y2JmODRlYTc4OTE0MWMxODc5MjcxYzg2QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732639481; x=1732899981;
	bh=u2edpL9A3CYIADy/5nFGhk+zu8DB9yJIDOSz906iVHQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E/DA2Uc3VkE6FWg1hTDsJcvmB06VBkO6JaPnorJ9YX5i6cTyhMoYrLV8I7YxzeekV
	 0T49cah80iOlKFGq6t8q2OBfNSMa/fFowhQ59+c+2OyDAH0Zbm95pIonTwgHtnySdy
	 3QfXOLOn/QG1pUXhVWZABz70PcvMKRtd9QfOt7ZzhpMCKcLu5CapTBnkRhxPBwh1yM
	 ifwIX6KdsjEQTITGsj1PTVANoQdeZUYF9Cy0EH05OAB+vvdwifbnWObDJfiyGO02C/
	 yJ02QrtkEXS5ok9Ze5fOy31TgyyTkQJygc7g5X/PHddf9OJUQsLK8Mr2ougGqJEiaE
	 N5pt+6nGLlVNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732639481; x=1732899981; i=anthony.perard@vates.tech;
	bh=u2edpL9A3CYIADy/5nFGhk+zu8DB9yJIDOSz906iVHQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FSFaVkV3h6/EnawpgvEn63nUdKER2KWtVs0JvqONM7gxAbHZVRfFQy1j8OI6xahuU
	 i1MxaNhzIvkseF0i/15D3ypGwsIcRaXbH/LNgous45hjJgVWiGAQnCaW9PpVxnUj/2
	 NMAJdcdTeB5zPq6azyF6Eurswqh8Zv0jlF80Mf1haqygbmQgd93MBz7KhSRlL6B4EP
	 4fHJZ7wcqBVA8counh5xdZR6Nupv3FTYoGTC2Qe1W3A8mmpSomFSvjt1dutnmoW3YM
	 GoglQfeMvA30zpwhbQCI5uru1eDwxeMikdTmIR9PrO0L9fRV83H1MaUYdJSp5piE4R
	 QD9Ch10Q4Ii5w==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/6]=20tools/libs:=20add=20a=20new=20libxenmanage=20library?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732639481127
To: =?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z0X6-EzHQtVjDGs7@l14>
References: <20241023131005.32144-1-jgross@suse.com> <20241023131005.32144-5-jgross@suse.com> <Z0CNNdezcIbUelrk@l14> <1846da14-f942-4414-8776-d76019fba37f@suse.com>
In-Reply-To: <1846da14-f942-4414-8776-d76019fba37f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0688dcd5cbf84ea789141c1879271c86?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241126:md
Date: Tue, 26 Nov 2024 16:44:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 04:12:25PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 22.11.24 14:55, Anthony PERARD wrote:
> > On Wed, Oct 23, 2024 at 03:10:03PM +0200, Juergen Gross wrote:
> > > diff --git a/tools/include/xenmanage.h b/tools/include/xenmanage.h
> > > new file mode 100644
> > > index 0000000000..2e6c3dedaa
> > > --- /dev/null
> > > +++ b/tools/include/xenmanage.h
> > > @@ -0,0 +1,98 @@
> > > +/*
> > > + * Copyright (c) 2024 SUSE Software Solutions Germany GmbH
> > > + *
> > > + * This library is free software; you can redistribute it and/or
> > > + * modify it under the terms of the GNU Lesser General Public
> > > + * License as published by the Free Software Foundation;
> > > + * version 2.1 of the License.
> > > + *
> > > + * This library is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > > + * Lesser General Public License for more details.
> > > + *
> > > + * You should have received a copy of the GNU Lesser General Public
> > > + * License along with this library; If not, see <http://www.gnu.org/=
licenses/>.
> > 
> > Shall we use SPDX tags instead of this boilerplate?
> 
> My thinking was to avoid that for "official" header files, as those might
> be copied verbatim to other projects, which might not use SPDX. So having
> the license text verbatim avoids any problems in this regard.

Well, this header in particular would be fairly useless, I believe, if it
was copied into an other project, it described a library so need to be
distributed along side the library. Second, this isn't the text of the
license but something describing which license is used and where to
find the text for it. An SPDX tag does nearly the same thing, but can
actually be parse by a computer.

Official headers that would be useful to be copied into other project
already expose the SPDX tags, many/all the headers in
xen/include/public, as well as headers created by `mkheader.py` in this
directory (tools/include).

I've taken a look into my directory "/usr/include", and they are plenty
of headers having the SPDX tag.

So overall, I think we are fine to use SPDX tags here as well. ;-)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


