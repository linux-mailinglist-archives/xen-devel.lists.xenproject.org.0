Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE5BBD073
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 06:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137807.1473663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5cSY-0007zi-Ah; Mon, 06 Oct 2025 04:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137807.1473663; Mon, 06 Oct 2025 04:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5cSY-0007xS-4C; Mon, 06 Oct 2025 04:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1137807;
 Mon, 06 Oct 2025 04:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/hmW=4P=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v5cSW-0007xM-K6
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 04:04:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85197f6a-a269-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 06:04:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA4606036E;
 Mon,  6 Oct 2025 04:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939FAC4CEF5;
 Mon,  6 Oct 2025 04:04:11 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfauth.phl.internal (Postfix) with ESMTP id 6D24EF40066;
 Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-12.internal (MEProxy); Mon, 06 Oct 2025 00:04:10 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 14BDB2CE0072; Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
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
X-Inumbo-ID: 85197f6a-a269-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759723452;
	bh=84injLzOLRzdmbDYcF7g7essdb0dt9odOMPRFgL8OhA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dx6gZOcRbqZU+4kUH56naw+qthiBcZkT1qtIonANRtUnPXGgZSzKl9WgCt0SFdIhm
	 UbVwoHC4Vs5XWd+JXXmA7hVHDHHcljPxzABSrPU51Ilo+qPPKD4b50iM60t7KVVjsb
	 SMzmXH2mA9VXny2uTwbYaN5+nstbvZoog7xyFS4WtMcvFaxYJ3i1X4/aK2vr9AVBnQ
	 f0YfFDMNeIIwcHvnhWFJp9a2t2UhTULfUIaQQ+5l6+IR5madltMoqZysTSG0SPagkr
	 ukbTi0OjnBiX86Vpr47x0xqWuIEElCfBCKo/rFvEhZv8rGQQRLNt3XkZDanjZzNwxN
	 maoDHGG6tUMAQ==
X-ME-Sender: <xms:uj_jaP_ofC9a_l28ntKx_gy42AQmYCP8lb4C2SR10mCLtk9SsRoVMA>
    <xme:uj_jaGgiJzpY8OBGdAHO0Sug4_6m8jP9b99pQfrT4W6TnMBKVOLM7R8GEtxUIBrad
    -kpFskrRXUFhspIfBqdrOdo09KkfLKr2F4CPRVd9JM75FUTPegu8VYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejvefflefgledvgfevvdetleehhfdvffehgeffkeevleeiveefjeetieel
    ueeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvfedtheefleek
    gedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuh
    dpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegs
    phesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfh
    hrrghnkhgvnhdruggvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhope
    grnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtoheplhhinhhmrghgjees
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomh
    dprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrmhgvshdr
    sghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomh
X-ME-Proxy: <xmx:uj_jaLVfDv-gcu_8eG8KMmCcu_lqD-hKSTkIpQVlhGsqYjX-BjSkAg>
    <xmx:uj_jaB0W371EPdKaI_VHwQcrPhlDBdzMVGXgBoeat-lOPO7F0-eoBA>
    <xmx:uj_jaEj5JbL-yJ3t6Tejadmxf5_fK5DIiQgEqWTLJ9rYb1M0S8qU4w>
    <xmx:uj_jaJIeYEGT-skfES59I8zK2h3dLuh_CCWKnOpBJzKNKgbBNwzpFQ>
    <xmx:uj_jaFVMUbmcoU_NyQKMtnVnad6DjfKDRYBqvXnd_1VVAyrxFpX1Mb4b>
Feedback-ID: i927946fb:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYer2uYmcW7k
Date: Mon, 06 Oct 2025 07:03:49 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Miller" <davem@davemloft.net>,
 "Geoff Levand" <geoff@infradead.org>, "Helge Deller" <deller@gmx.de>,
 "Ingo Molnar" <mingo@redhat.com>, iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jason Wang" <jasowang@redhat.com>, "Juergen Gross" <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Matt Turner" <mattst88@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <d8c1e548-ebc5-4a07-8bf5-d98e9f2e6587@app.fastmail.com>
In-Reply-To: <20251005233133.GL3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com> <20251005132259.GA21221@unreal>
 <20251005233133.GL3360665@nvidia.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Oct 6, 2025, at 02:31, Jason Gunthorpe wrote:
> On Sun, Oct 05, 2025 at 04:22:59PM +0300, Leon Romanovsky wrote:
>> @@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
>>         ** Grab virtual index [0:11]
>>         ** Deposit virt_idx bits into I/O PDIR word
>>         */
>> -       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
>> +       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));
>
> Don't know how I missed this, but this is the virtual address for the
> cache invalidate James mentioned
>
> So the optimal is to drop the lpa() and to use phys_to_virt() to get
> vba for this instruction.

The optimal is to keep parisc arch code as I did in v1 and don't change it too much.

>
> Jason

