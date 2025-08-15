Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E161AB2781B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 07:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082782.1442519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ummij-0007jC-Io; Fri, 15 Aug 2025 05:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082782.1442519; Fri, 15 Aug 2025 05:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ummij-0007gX-Cd; Fri, 15 Aug 2025 05:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1082782;
 Fri, 15 Aug 2025 05:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3nai=23=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1ummii-0007gR-L9
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 05:11:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f1fca16-7996-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 07:11:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 451BD5C4C44;
 Fri, 15 Aug 2025 05:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF32C4CEF4;
 Fri, 15 Aug 2025 05:11:03 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfauth.phl.internal (Postfix) with ESMTP id CD58BF40066;
 Fri, 15 Aug 2025 01:11:02 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-12.internal (MEProxy); Fri, 15 Aug 2025 01:11:02 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 8094E2CE0071; Fri, 15 Aug 2025 01:11:02 -0400 (EDT)
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
X-Inumbo-ID: 3f1fca16-7996-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755234665;
	bh=rjs/V71n+3a48sbczUimLUbQ99An++PfjAuhQIEa13s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qaZHeg2/5a1nlFDrCh+QQq8+2z+k/HIBWZUD4nh0+1i6c37KB42J7MuL6+NCG/t+L
	 Sb4lS+mkZ14VoVX+YlDNVGPRMcWMXRHAGigO6GBs+JD82O/j0LxY54D+zDNDsJYKAo
	 sXevI5VIzQWOLFfl/WV5zUlxyV+wLZ1J0REOzQc8KXCWGG5zo4v1sD8WTb37YmZh26
	 fQvGeRnhGwhiRkaAiLioOMAOHFUuoJ1KDM4vS7BfgMxeW43efHE9YPv+gnweYXLTPM
	 XrWCUBDKKDrqe8banORHuWlWg0uTJGuY3c9EmS4cdtxIgiUKad4TjoW3OXKR2Ys5uU
	 wi4dFrypsvChQ==
X-ME-Sender: <xms:ZsGeaEjCAtEWX1UaHLA2gfColtQZO7w89chtZ2uFaG4vMYHweTmDIQ>
    <xme:ZsGeaNCED0uQ78E9d2j9GAg3NYkGAhxwrM8S6giPlAbcy5DsDkd_hrjkIGTNdnggG
    4eL_xWyjdx6jEOR_bI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfnfgvohhn
    ucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepffegjefgueegffffjeevheektdekgeevheelvdekieehvdejvdejjefh
    hfelhfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlvghonhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidquddvfedtheefleekgedqvdejjeeljeejvdekqdhlvghonh
    eppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuhdpnhgspghrtghpthhtohepfeejpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpd
    hrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohep
    tghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhope
    hmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrsgguihgvlhdrjhgr
    nhhulhhguhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdho
    rhhgpdhrtghpthhtohepghhlihguvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomh
X-ME-Proxy: <xmx:ZsGeaPWPNXdI6VvYib3k9QdMC2XlJbr86LA_KN5YspkDL_EEK6BRlA>
    <xmx:ZsGeaI3d1bh3fFRFl4aiXZUts9ejR-WHFcon7KnhJbC_6nOGWjjn2Q>
    <xmx:ZsGeaIdgKvfZyaCQpAF_MAary9Xg8Dva0Q5zSBAie2gJ8xC3nka9fw>
    <xmx:ZsGeaNVlXDFhOQ5jT6MnFggS_FVesjsSUNJLf3EVumbGV5Io7NaXkQ>
    <xmx:ZsGeaG9LccLFJ2EboOYrfkTWU2yRr6gsoUbWRyvB7Ij-X0QWOgy49Rp5>
Feedback-ID: i927946fb:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AWyaQ402xWe7
Date: Fri, 15 Aug 2025 08:10:43 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Christoph Hellwig" <hch@lst.de>, "Danilo Krummrich" <dakr@kernel.org>,
 iommu@lists.linux.dev, "Jason Wang" <jasowang@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>, "Joerg Roedel" <joro@8bytes.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Juergen Gross" <jgross@suse.com>,
 kasan-dev@googlegroups.com, "Keith Busch" <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-trace-kernel@vger.kernel.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 "Sagi Grimberg" <sagi@grimberg.me>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, virtualization@lists.linux.dev,
 "Will Deacon" <will@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <45552b38-5717-4b0c-b0eb-8c463d8cf816@app.fastmail.com>
In-Reply-To: <ccc8eeba-757a-440d-80d3-9158e80c19fe@csgroup.eu>
References: <cover.1755193625.git.leon@kernel.org>
 <ccc8eeba-757a-440d-80d3-9158e80c19fe@csgroup.eu>
Subject: Re: [PATCH v3 00/16] dma-mapping: migrate to physical address-based API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thu, Aug 14, 2025, at 22:05, Christophe Leroy wrote:
> Le 14/08/2025 =C3=A0 19:53, Leon Romanovsky a =C3=A9crit=C2=A0:
>> Changelog:
>> v3:
>>   * Fixed typo in "cacheable" word
>>   * Simplified kmsan patch a lot to be simple argument refactoring
>
> v2 sent today at 12:13, v3 sent today at 19:53 .... for only that ?
>
> Have you read=20
> https://docs.kernel.org//process/submitting-patches.html#don-t-get-dis=
couraged-or-impatient=20
> ?

Yes, I'm aware of that section. It is not even remotely close to the rea=
lity in different subsystems.

There are some places in the kernel where you never get any responses.

Thanks

