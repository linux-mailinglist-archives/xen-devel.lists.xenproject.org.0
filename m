Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI+3GJ3CrmmRIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:52:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF323933F
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249475.1546929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vza5j-0003Rx-3L; Mon, 09 Mar 2026 12:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249475.1546929; Mon, 09 Mar 2026 12:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vza5j-0003Q6-0M; Mon, 09 Mar 2026 12:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1249475;
 Mon, 09 Mar 2026 12:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BjhM=BJ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1vza5h-0003Q0-Mv
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:52:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6f9d7fa-1bb6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:52:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 839E6600AE;
 Mon,  9 Mar 2026 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC24C4AF09;
 Mon,  9 Mar 2026 12:52:04 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id C5D69F40069;
 Mon,  9 Mar 2026 08:52:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 08:52:03 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 999C9700065; Mon,  9 Mar 2026 08:52:03 -0400 (EDT)
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
X-Inumbo-ID: c6f9d7fa-1bb6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773060725;
	bh=+l3GAe2jq8eBBZZbhrY4uib7DNJV8apVKmihOAiT6Gw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TSHrbFKPoRXfsXlhpwIxl3kZJwS2F2BttFk5QfPdMtO/2V51HyX6rtBr4NBX7fAnm
	 Mbo12H210Mu0rxpwX3x/oqe8N+CIQ1mUlnZIhdoYNbU87xSCxSCgXUoF4bHd6DbwKL
	 +j3OY3s1TM2gTxkaNs9J/IL2QVgVH5IxrNLE7MfKcJzecIH3329B0ZuHStfd7xZVaf
	 22b7kkG0HghO1/nWUHDjQHfrEUUYYxXoIdcvDQSPYVjLfLisQaKQqnPzaqg7HmmYlz
	 7bNv+jsnCFNqTQbCbDvjVrZ0nnUx4ye+D9QI0EaF1Hfh3XWKkSdZs4NO48m/Ck6zau
	 udgcC2oFo/FuA==
X-ME-Sender: <xms:c8KuaT6g5dfW3c5CvJAmOIXVGTkdvWPf_1QM9tkj9Uo4Ih2HRipxsA>
    <xme:c8KuaTvCc5M089GSvD9-x5Zb9s3cnu4ZwokOhjS_EvbvaTmzW5CmE8H91wSfVIP7N
    p3Ji-kBKSk56OzjrjYv0-oLOd1BiRoGgnZarhy-VIwNaMlgMTUK_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeekudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefhefgtefgkefhgfdvffdukeejheeuvedthfdtiefhleejhfefjeffieeu
    jeefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihohhtihhsrg
    hrkhgrrhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepihhlihgrshdrrg
    hprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuh
    igqdgvfhhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:c8KuaWcjcsw5z56A4U-0I8TpxxtNTYgcBSta9LzT8FhkHsW1Wcpt4g>
    <xmx:c8KuaSehKYxjTOw8IX5vaHSFoeHSbpymWVwezyS7Qb0SdlgfkExq_Q>
    <xmx:c8KuaZyDumFDVKesUG2kbHmbcAltYywi6iHzDnG0QlWiUUaFGX8MSw>
    <xmx:c8KuaZ-fJ1kWTGjVJ6UgZEl103GiQwkGGpA2aoIzzhEstZoUcvWo_g>
    <xmx:c8KuaRilkN9J9Yo9bdHlekGBpuyCg3gIBWtOc77In4fmiYdaKWJgdz_p>
Feedback-ID: ice86485a:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Al3Xjs-asQIN
Date: Mon, 09 Mar 2026 13:51:43 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: 
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org
Cc: "Soumyajyotii Ssarkar" <soumyajyotisarkar23@gmail.com>,
 xen-devel@lists.xenproject.org,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org
Message-Id: <2f8e9891-ef08-4094-ae86-c1b6d2dbe06c@app.fastmail.com>
In-Reply-To: 
 <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
References: 
 <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 0/2] Allow using BGRT table under Xen dom0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 15EF323933F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.18 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:linux-kernel@vger.kernel.org,m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,linaro.org:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:email];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ardb@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,linaro.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action


On Mon, 9 Mar 2026, at 13:17, Marek Marczykowski-G=C3=B3recki wrote:
> For a long time Xen was invalidating BGRT table as it was reclaiming
> BootServicesData memory (where boot graphics is located). This is now =
changing,
> and the boot graphics is preserved. This series has necessary changes =
to
> actually make Linux use the preserved graphics.
>
> This is a companion series to Xen side at
> https://lore.kernel.org/xen-devel/20260305191810.31033-1-soumyajyotisa=
rkar23@gmail.com/
>
> CC: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE=20
> INTERFACE (EFI))
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org> (reviewer:EXTENSIBL=
E=20
> FIRMWARE INTERFACE (EFI))
> Cc: linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE=20
> (EFI))
>
> Marek Marczykowski-G=C3=B3recki (2):
>   efi: make efi_mem_type() and efi_mem_attributes() work on Xen PV
>   efi: Enable BGRT loading under Xen
>
>  drivers/firmware/efi/efi-bgrt.c |  7 +++++--
>  drivers/firmware/efi/efi.c      | 27 +++++++++------------------
>  2 files changed, 14 insertions(+), 20 deletions(-)
>

Looks good to me - if nobody else has any concerns, I'll queue this up f=
or v7.1

