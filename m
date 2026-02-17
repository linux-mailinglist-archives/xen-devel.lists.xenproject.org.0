Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFiZIip0lGnVDwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:59:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9DC14CDFA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235048.1538088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLaT-0006ry-JF; Tue, 17 Feb 2026 13:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235048.1538088; Tue, 17 Feb 2026 13:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLaT-0006oq-Ej; Tue, 17 Feb 2026 13:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1235048;
 Tue, 17 Feb 2026 13:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PabX=AV=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1vsLaR-0006oi-RP
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 13:57:59 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ed250e-0c08-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 14:57:56 +0100 (CET)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vsLa1-00000003Yoo-11bO; Tue, 17 Feb 2026 14:57:33 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vsLa0-00000002m9f-3s0R; Tue, 17 Feb 2026 14:57:33 +0100
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
X-Inumbo-ID: a8ed250e-0c08-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Pwz8t6PMdZ7Eyt0zG9XbbpQPro+70AXMQDf5xeeq3xY=; t=1771336676;
	x=1771941476; b=BTJfoUA5/Tssd/r89oNlyy+EYXq6gbr1AO+jgHGFHmuw4S1GS1dTscqK0jRoi
	ami5YzaozGjKFTpEYYz+1+ek8ythDO6BzyiAQ7yA7hZl+jHIBlkUgD6/bkzpFzhuLjDlhWfKif4QR
	g/FGh/ce0NFMJKEcbmQDHW7qW1OvI6HRhyXKZgvjTDRV6QoBoEtdjEsMPl9xlDA+WXYjdTRREgLBw
	WuRGfstyOupcvyD40ziEa8seSC9zPdPLPwlbnjEpQgYVzOiLhqkAZSAGaQ2jBwuSb0PVC5x9XFUQE
	DwoJIpVN3aSykl85Jx1+SawA2LXKHJfctjN3ZsCotUHwsUacaQ==;
Message-ID: <8317613a286ab637ac29740433ff51286ebbbaca.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky	
 <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Russell King	
 <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini	 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin	 <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson	
 <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar	
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux
	 <sparclinux@vger.kernel.org>
Date: Tue, 17 Feb 2026 14:57:31 +0100
In-Reply-To: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
		<20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
		<CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
		<e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
	 <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:leon@kernel.org,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:tsbogend@alpha.franken.de,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:geoff@infradead.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-alpha@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[samsung.com,kernel.org,arm.com,armlinux.org.uk,suse.com,epam.com,linaro.org,gmail.com,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,infradead.org,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,fu-berlin.de:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CC9DC14CDFA
X-Rspamd-Action: no action

Hi Marek,

On Tue, 2026-02-17 at 13:55 +0100, Marek Szyprowski wrote:
> On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> > On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > >=20
> > > Convert sparc architecture DMA code to use .map_phys callback.
> > >=20
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
> > >   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
> > >   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++--------------=
---
> > >   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++----------=
-----------
> > >   4 files changed, 82 insertions(+), 63 deletions(-)
> > >=20
> > > diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> > > index da0363692528..46ef88bc9c26 100644
> > > --- a/arch/sparc/kernel/iommu.c
> > > +++ b/arch/sparc/kernel/iommu.c
> > > @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device =
*dev, size_t size,
> > >   		free_pages((unsigned long)cpu, order);
> > >   }
> > >  =20
> > > -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *p=
age,
> > > -				  unsigned long offset, size_t sz,
> > > -				  enum dma_data_direction direction,
> > > +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t ph=
ys,
> > > +				  size_t sz, enum dma_data_direction direction,
> > >   				  unsigned long attrs)
> > >   {
> > >   	struct iommu *iommu;
> > >   	struct strbuf *strbuf;
> > >   	iopte_t *base;
> > >   	unsigned long flags, npages, oaddr;
> > > -	unsigned long i, base_paddr, ctx;
> > > +	unsigned long i, ctx;
> > >   	u32 bus_addr, ret;
> > >   	unsigned long iopte_protection;
> > >  =20
> > > +	if (unlikely(attrs & DMA_ATTR_MMIO))
> > > +		/*
> > > +		 * This check is included because older versions of the code
> > > +		 * lacked MMIO path support, and my ability to test this path
> > > +		 * is limited. However, from a software technical standpoint,
> > > +		 * there is no restriction, as the following code operates
> > > +		 * solely on physical addresses.
> > > +		 */
> > > +		goto bad_no_ctx;
> > > +
> > >   	iommu =3D dev->archdata.iommu;
> > >   	strbuf =3D dev->archdata.stc;
> > >  =20
> > >   	if (unlikely(direction =3D=3D DMA_NONE))
> > >   		goto bad_no_ctx;
> > >  =20
> > > -	oaddr =3D (unsigned long)(page_address(page) + offset);
> > > +	oaddr =3D (unsigned long)(phys_to_virt(phys));
> > >   	npages =3D IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
> > >   	npages >>=3D IO_PAGE_SHIFT;
> > >  =20
> > > @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *=
dev, struct page *page,
> > >   	bus_addr =3D (iommu->tbl.table_map_base +
> > >   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
> > >   	ret =3D bus_addr | (oaddr & ~IO_PAGE_MASK);
> > > -	base_paddr =3D __pa(oaddr & IO_PAGE_MASK);
> > >   	if (strbuf->strbuf_enabled)
> > >   		iopte_protection =3D IOPTE_STREAMING(ctx);
> > >   	else
> > > @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *=
dev, struct page *page,
> > >   	if (direction !=3D DMA_TO_DEVICE)
> > >   		iopte_protection |=3D IOPTE_WRITE;
> > >  =20
> > > -	for (i =3D 0; i < npages; i++, base++, base_paddr +=3D IO_PAGE_SIZE=
)
> > > -		iopte_val(*base) =3D iopte_protection | base_paddr;
> > > +	for (i =3D 0; i < npages; i++, base++, phys +=3D IO_PAGE_SIZE)
> > > +		iopte_val(*base) =3D iopte_protection | phys;
>=20
> 'base_paddr' was aligned to start of a page before this patch, while=20
> 'phys'=C2=A0includes the offset within a page.
>=20
>=20
> Could You check if the following change fixes the issue?
>=20
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index 46ef88bc9c26..edb0ffb21e2f 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device=20
> *dev, phys_addr_t phys,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (direction !=3D DMA_TO_DEV=
ICE)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iopte_protection |=3D IOPTE_WRITE;
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys -=3D offset_in_page(phys);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < npages; i++=
, base++, phys +=3D IO_PAGE_SIZE)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 iopte_val(*base) =3D iopte_protection | phys;

Thanks, I have forwarded your patch and asked the user to answer here if po=
ssible [1].

Adrian

> [1] https://github.com/sparclinux/issues/issues/75#issuecomment-391479186=
2

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

