Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6429FE4B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 08:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15417.38410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYOZR-0007ka-Tf; Fri, 30 Oct 2020 07:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15417.38410; Fri, 30 Oct 2020 07:11:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYOZR-0007kB-QD; Fri, 30 Oct 2020 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 15417;
 Fri, 30 Oct 2020 07:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAey=EF=kernel.org=mchehab+huawei@srs-us1.protection.inumbo.net>)
 id 1kYOZP-0007k2-Pf
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:11:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bfbac23-7c3c-4ceb-bd93-490a678f20ed;
 Fri, 30 Oct 2020 07:11:30 +0000 (UTC)
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de
 [95.90.213.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5A6620729;
 Fri, 30 Oct 2020 07:11:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fAey=EF=kernel.org=mchehab+huawei@srs-us1.protection.inumbo.net>)
	id 1kYOZP-0007k2-Pf
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:11:31 +0000
X-Inumbo-ID: 6bfbac23-7c3c-4ceb-bd93-490a678f20ed
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6bfbac23-7c3c-4ceb-bd93-490a678f20ed;
	Fri, 30 Oct 2020 07:11:30 +0000 (UTC)
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A5A6620729;
	Fri, 30 Oct 2020 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604041889;
	bh=HMfalVRoys07ml7VPXGsddZqQtyxcaotzZe94CKTB5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R7y6Bkg5GrGcYmjgIayZshuogEXNtD+N43HIj2ydphSqWHTpEKjdj+tkINZ9lO4pX
	 +EzN06y8xtiLvvAwAlP7B2jMtZP7Xz5TMkR6xCd/tfAA7bm7KHEvTD9Bw/cC31SHKp
	 JuVmtl721avx2j0rGBNlzZnqYSENceoWWYTIE5Wc=
Date: Fri, 30 Oct 2020 08:11:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Javier =?UTF-8?B?R29uesOhbGV6?=
 <javier@javigon.com>, "Jonathan Corbet" <corbet@lwn.net>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Andrew Donnellan <ajd@linux.ibm.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Baolin Wang
 <baolin.wang7@gmail.com>, Benson Leung <bleung@chromium.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Bruno Meneguele
 <bmeneg@redhat.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Dan Murphy
 <dmurphy@ti.com>, Dan Williams <dan.j.williams@intel.com>, Enric Balletbo i
 Serra <enric.balletbo@collabora.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, Felipe Balbi <balbi@kernel.org>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Guenter Roeck <groeck@chromium.org>, Hanjun Guo
 <guohanjun@huawei.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn
 <johannes.thumshirn@wdc.com>, Juergen Gross <jgross@suse.com>, Konstantin
 Khlebnikov <koct9i@gmail.com>, Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Len Brown <lenb@kernel.org>, Leonid Maksymchuk
 <leonmaxx@gmail.com>, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mario Limonciello <mario.limonciello@dell.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain
 <nayna@linux.ibm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Niklas
 Cassel <niklas.cassel@wdc.com>, Oleh Kravchenko <oleg@kaa.org.ua>, Orson
 Zhai <orsonzhai@gmail.com>, Pavel Machek <pavel@ucw.cz>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Peter Meerwald-Stadler
 <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>, Petr Mladek
 <pmladek@suse.com>, Philippe Bergheaud <felix@linux.ibm.com>, Richard
 Cochran <richardcochran@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vineela Tummalapalli
 <vineela.tummalapalli@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20201030081109.5f7bbdaf@coco.lan>
In-Reply-To: <20201029144912.3c0a239b@archlinux>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
	<4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
	<20201029144912.3c0a239b@archlinux>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 29 Oct 2020 14:49:12 +0000
Jonathan Cameron <jic23@kernel.org> escreveu:

> On Wed, 28 Oct 2020 15:23:18 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > 
> > Some files over there won't parse well by Sphinx.
> > 
> > Fix them.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Query below...  I'm going to guess a rebase issue?

Yes. I sent this series about 1,5 years ago. On that time, it
ended by not being merged, as there were too much docs patches
floating around. 

The second SoB is not there on my tree. It was added by
git send-email ;-)

Anyway, fixed.

Thanks,
Mauro

