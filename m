Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF36186A8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436966.691253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeP1-0003BP-D1; Thu, 03 Nov 2022 17:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436966.691253; Thu, 03 Nov 2022 17:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeP1-00033D-8p; Thu, 03 Nov 2022 17:53:19 +0000
Received: by outflank-mailman (input) for mailman id 436966;
 Thu, 03 Nov 2022 17:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsA7=3D=dominikbrodowski.net=linux@srs-se1.protection.inumbo.net>)
 id 1oqdyY-0006Wd-Dd
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:25:58 +0000
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93655017-5b9c-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 18:25:56 +0100 (CET)
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 5C1742013E3;
 Thu,  3 Nov 2022 17:25:53 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
 id 6880A8024B; Thu,  3 Nov 2022 18:25:45 +0100 (CET)
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
X-Inumbo-ID: 93655017-5b9c-11ed-91b5-6bf2151ebd3b
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Date: Thu, 3 Nov 2022 18:25:45 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2P2ja26ikNecTsv@smile.fi.intel.com>

Am Thu, Nov 03, 2022 at 07:12:45PM +0200 schrieb Andy Shevchenko:
> On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> > Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:
> 
> ...
> 
> > > -
> > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > -		res = s->cb_dev->bus->resource[i];
> > > -#else
> > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > >  #endif
> > > +
> > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > >  		if (!res)
> > >  			continue;
> > 
> > Doesn't this remove the proper iterator for X86? Even if that is the right
> > thing to do, it needs an explict explanation.
> 
> I dunno what was in 2010, but reading code now I have found no differences in
> the logic on how resources are being iterated in these two pieces of code.
> 
> But fine, I will add a line to a commit message about this change.
> 
> Considering this is done, can you issue your conditional tag so I will
> incorporate it in v3?

Certainly, feel free to add

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik

