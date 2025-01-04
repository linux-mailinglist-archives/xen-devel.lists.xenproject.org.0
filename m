Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1146A011F8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864990.1276262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuI0-00066P-Ne; Sat, 04 Jan 2025 02:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864990.1276262; Sat, 04 Jan 2025 02:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuI0-00063u-Ko; Sat, 04 Jan 2025 02:53:24 +0000
Received: by outflank-mailman (input) for mailman id 864990;
 Sat, 04 Jan 2025 02:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuHz-00063X-6u
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:53:23 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f5aec5a-ca47-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:53:22 +0100 (CET)
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
X-Inumbo-ID: 0f5aec5a-ca47-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959201; x=1736218401;
	bh=3d4Wsut02P5KYlq1G0hgh3SC/fqXiajwkExK340YX0I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NBdwEoK8J+fhYFkimaWQf+shWMun2aL2umovKhq+6/DwW7+Igo/yla/1qas6lyWqm
	 GV9cUHOEDF2VIIkOIlzn5ph7WuH4r9L+BoQJkWKDDzoZF0T9ORuIc8ZOnmW1PlnX3N
	 JekiUQbBelSdInu4HkeLsvMOq7L0P8rTi87pMAFZaMP/6EW0bXZD1YVypzYCdreegx
	 Oa4LLxt8tMxQD1pwWCRu8Mw2pC3hoHPiW7Rfk1gfHtvW5U1LrfgUNrcdjItnEElLUw
	 ZRwLhHuPYvtOroC1jobiJKG5BwvTX6/WxULdMKZuVgo2tGwDvNKRs6wqwTve8guI8J
	 AdGKwUJa+OYgg==
Date: Sat, 04 Jan 2025 02:53:16 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 13/35] xen/console: rename console_input_domain
Message-ID: <me5SVEwY-C-nKgeVQAhd3qDdCZw13e3N13_1dk4kdIyIJUwbnV1RBAlpILxCX3LFIodVmtS3Dz5GDZ5yX5aVayE-dYINkMh44ZRggf9juK4=@proton.me>
In-Reply-To: <16b43ca4-d56d-4c1c-b43e-1e3bd4919857@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com> <16b43ca4-d56d-4c1c-b43e-1e3bd4919857@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ad5143812a365f510af47846d03b7192b1c4f224
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 6:01 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > console_input_domain() takes an RCU lock to protect domain structure.
> > That implies call to rcu_unlock_domain() after use.
> >
> > Rename console_input_domain() to rcu_lock_domain_console_owner() to
> > highlight the need of calling rcu_unlock_domain().
>
>
> While I can see where you're coming from, ...
>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -477,7 +477,7 @@ static unsigned int __read_mostly console_rx =3D 0;
> >
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > /* Make sure to rcu_unlock_domain after use */
> > -struct domain *console_input_domain(void)
> > +struct domain *rcu_lock_domain_console_owner(void)
> > {
> > if ( console_rx =3D=3D 0 )
> > return NULL;
>
>
> ... the new name no longer expresses that a domain pointer is being retur=
ned
> (out of thin air). I'm uncertain this is an improvement.

I introduced console_{get,put}_domain() in v3 as per Roger's suggestion.

>
> Jan



