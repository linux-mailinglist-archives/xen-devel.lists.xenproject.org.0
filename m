Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5CAE5D95
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023189.1399117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy1a-0002Qc-Kj; Tue, 24 Jun 2025 07:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023189.1399117; Tue, 24 Jun 2025 07:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTy1a-0002O5-HZ; Tue, 24 Jun 2025 07:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1023189;
 Tue, 24 Jun 2025 07:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTy1Y-0002Nz-Jh
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:24:56 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 524e0878-50cc-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:24:53 +0200 (CEST)
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
X-Inumbo-ID: 524e0878-50cc-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750749892; x=1751009092;
	bh=VVhCu6AXyGiFE/pEpXY9yPGFpgtwRZv27Ird8ALnhrM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y5y+/Kd1pIAG5xQf96EyOXZxruLT8r7svg8RPAUDylNVRwu2kut5cv+YpMBx67Idc
	 g4f1GsWNcYL9rmSzHQrYat5VyKwSuLcMOPHi3xTr0dGXNKmDDnVlDlwVz1nFo//oM6
	 aaCVEps4u+YRbR2y0cAGqJHcr8p0j0MmW0f7F/RtdbZfE38E1kDeQyJ8FyrWurwTbU
	 GFQ7tMjwtuH7l2zCZdRrGRzhKg+NUZ8z1R9e6CjHhtWoz78y6qzNh+vgc1GPStErYj
	 LqMtaVZDrGo/sVKCm7uFdgUCt1nt5I45Votu5kczB8auanSn/YT2ReZ5rLsLqYXQ1S
	 Gyzj4urxftYlw==
Date: Tue, 24 Jun 2025 07:24:48 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig option
Message-ID: <aFpSvMzxrNrgQEVB@kraken>
In-Reply-To: <da16500d-f589-4396-8ad6-78cdb443da60@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-2-dmukhin@ford.com> <da16500d-f589-4396-8ad6-78cdb443da60@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0491f51817f76b1e65b102aad53aa0d5dc29fad7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 08:13:08AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.
> Why? We emulate SBSA UART and not PL011. Despite the similarities (the fo=
rmer is
> a subset of the latter) they are not the same. I find it confusing and dr=
ivers
> for PL011 might not work with SBSA UART. Also, in the future we may want =
to
> emulate full PL011 in which case it will be even more confusing.

That's because the emulator is called vpl011, but yes, it is SBSA UART.
I will adjust to SBSA, thanks!

>=20
> Also, why HAS_?

My understanding is that HAS_ is the desired naming convention throughout t=
he
code (not documented, though), e.g. all Arm UART drivers are gated by HAS_X=
XX
(e.g. arch/arm/platforms/Kconfig).

>=20
> ~Michal
>=20


