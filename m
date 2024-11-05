Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD79BD00C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830392.1245377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8L7d-00021m-9K; Tue, 05 Nov 2024 15:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830392.1245377; Tue, 05 Nov 2024 15:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8L7d-0001zd-6h; Tue, 05 Nov 2024 15:05:33 +0000
Received: by outflank-mailman (input) for mailman id 830392;
 Tue, 05 Nov 2024 15:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oaTJ=SA=bounce.vates.tech=bounce-md_30504962.672a3434.v1-c55403c78d914d1c97b60d2ea93038c9@srs-se1.protection.inumbo.net>)
 id 1t8L7b-0001zM-SS
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:05:31 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 636512a8-9b87-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 16:05:27 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4XjWq86Pm8zBsVPZv
 for <xen-devel@lists.xenproject.org>; Tue,  5 Nov 2024 15:05:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c55403c78d914d1c97b60d2ea93038c9; Tue, 05 Nov 2024 15:05:24 +0000
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
X-Inumbo-ID: 636512a8-9b87-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzMy4xIiwiaGVsbyI6Im1haWwxMzMtMS5hdGwxMzEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYzNjUxMmE4LTliODctMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE5MTI3LjM1NTE2Miwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MmEzNDM0LnYxLWM1NTQwM2M3OGQ5MTRkMWM5N2I2MGQyZWE5MzAzOGM5QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730819124; x=1731079624;
	bh=8PsoYL/E5IR3ApL5Be8k3DWKAIX30g2Be4e6ZK9EXI8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qs/d8suxhYMs/TtSf3/kZ+7QZgji3wsmr+WGmQk4hw86uii6WQQGD4ABYgyf7r4d+
	 P/czdBZJhRkbk1PjWt+qYduVzru1s4lw1u4liPcypXce1GTnAMYdai+9/Iot2EoBDX
	 01WXljL/KDAKYDMN4RfGlzN0D6zPWapwXfMo6POZGo0h4fVcn4Q0jvs8f0y7cGwdQ4
	 0bKz8IeXHH8Sqw4Txg3HqqnChjxfBFB1B0rfP8e/TR4V66s177ImVBeP3gMl9tL3Ni
	 n80NBliQpzXpxt7l98sLflHOHemabkiWVaa4RziZDSwflvpk83WgWADMihweiQaG+Y
	 HsUf49ZyOj9ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730819124; x=1731079624; i=anthony.perard@vates.tech;
	bh=8PsoYL/E5IR3ApL5Be8k3DWKAIX30g2Be4e6ZK9EXI8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SDL2JCc+qaj9/8z7AfVPJgI1s7RMjD10WDzZ0M/+17SVZ0NaFk4NPnbkcspXsX1pU
	 zlrsCXhnwgc5hZxji1cVTTg6F41sQD4E1/4pxvLYNkkmlq55zF5hMEkvU5Kni1Pdb2
	 W8u5PA+LZY3IsS6isEPlwufZonxFAc42nJPdI5EysxokRbh1gJ2t0LlVFw/Nwj7scG
	 BBvBFG2j1JlAq+kTNxF5wIbY2P8Z+3QgFyrRLGGWCdPIilcvbqdWN9fSzvTqyUcNar
	 sxIBG05lssUgSyMKzmpKBfvJUs343N8GzKoirzdNx0OVoL7rHpEXgORAQs1W+W8A4U
	 ZZz99GU62MTYw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/libxl:=20remove=20usage=20of=20VLA=20arrays?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730819123823
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monne" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Zyo0M08gb5yhBiJF@l14>
References: <20241028114831.27487-1-roger.pau@citrix.com> <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
In-Reply-To: <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c55403c78d914d1c97b60d2ea93038c9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241105:md
Date: Tue, 05 Nov 2024 15:05:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 12:03:59PM +0000, Andrew Cooper wrote:
> On 28/10/2024 11:48 am, Roger Pau Monne wrote:
> > Clang 19 complains with the following error when building libxl:
> >
> > libxl_utils.c:48:15: error: variable length array folded to constant ar=
ray as an extension [-Werror,-Wgnu-folding-constant]
> >    48 |     char path[strlen("/local/domain") + 12];
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Replace the usage of strlen() with ARRAY_SIZE(), which allows the liter=
al
> > string length to be known at build time.  Note ARRAY_SIZE() accounts fo=
r the
> > NUL terminator while strlen() didn't, hence subtract 1 from the total s=
ize
> > calculation.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> >  tools/libs/light/libxl_utils.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_ut=
ils.c
> > index 10398a6c8611..b3f5e751cc3f 100644
> > --- a/tools/libs/light/libxl_utils.c
> > +++ b/tools/libs/light/libxl_utils.c
> > @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsign=
ed long maxmem_kb, unsigned
> >  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
> >  {
> >      unsigned int len;
> > -    char path[strlen("/local/domain") + 12];
> > +    char path[ARRAY_SIZE("/local/domain") + 11];
> >      char *s;
> >  
> >      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
> > @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx =
*ctx, const char *p,
> >  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
> >  {
> >      unsigned int len;
> > -    char path[strlen("/local/pool") + 12];
> > +    char path[ARRAY_SIZE("/local/pool") + 11];
> >      char *s;
> >  
> >      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although I have a minor preference for sizeof() as suggested by Frediano.

I have a preference for sizeof() too, we even used it this way (more or
less) in libxl before, for `eom` here:
    https://elixir.bootlin.com/xen/v4.19.0/source/tools/libs/light/libxl_qm=
p.c#L1608

I was a bit supprised by the use of ARRAY_SIZE on a string literal but
it's just an array of char :-).

For the patch, with sizeof() or ARRAY_SIZE():
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


