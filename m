Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC1A1587E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 21:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874291.1285049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYspL-00054g-48; Fri, 17 Jan 2025 20:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874291.1285049; Fri, 17 Jan 2025 20:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYspL-000529-17; Fri, 17 Jan 2025 20:20:23 +0000
Received: by outflank-mailman (input) for mailman id 874291;
 Fri, 17 Jan 2025 20:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRtS=UJ=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tYspJ-000523-0S
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 20:20:21 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779ba34e-d510-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 21:20:18 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 61BA25030C5;
 Fri, 17 Jan 2025 21:20:16 +0100 (CET)
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
X-Inumbo-ID: 779ba34e-d510-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1737145216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U1f/FOsYILpgODc2jCY0Q8D48grq7mgyBUP9Wk8XFUw=;
	b=Kf7goFDQXxGaNHDTP5iSUiYHdeLuUIwLDBjcUzqqepkZ0eHhCVh+lV6T5JM2V6FQTd8TIp
	+2aN8l28qOe9Gx68eAXnLNnf+DghJGiRyo/ef0NuH2mwb74k0FSrT2k1hfotGlpVlpU5Cy
	+Ii8DMLlVxOvtmsdFl2+HmT9OjeL71tLgJt+88XwK2C/gmcBqqcjbhKY7XbeudhcTsmGAp
	WaThmKUWaLyUDVWqzU9CU1BIBZn0NOfb+98sKbBdYnQoFF4kJywcpp+9jcmBUusPWiWNJP
	lmGhcGg8fPrPCkcnBnyiOAFS+lQjLcHacKooMJeYr4X5Y6hq9P5PhoJcBeJDZg==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject:
 Re: [XEN PATCH 0/1] Bug: Hyperlinks in generated documentation may point to
 the wrong architecture
Date: Fri, 17 Jan 2025 21:20:03 +0100
Message-ID: <2013076.usQuhbGJ8B@localhost>
In-Reply-To: <fe71538a-92ed-4ab5-95f7-e5c8d42929d2@citrix.com>
References:
 <cover.1736542505.git.maxi@daemonizer.de>
 <fe71538a-92ed-4ab5-95f7-e5c8d42929d2@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3528437.QJadu78ljV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3528437.QJadu78ljV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Fri, 17 Jan 2025 21:20:03 +0100
Message-ID: <2013076.usQuhbGJ8B@localhost>
In-Reply-To: <fe71538a-92ed-4ab5-95f7-e5c8d42929d2@citrix.com>
MIME-Version: 1.0

On Freitag, 10. Januar 2025 22:32:06 CET Andrew Cooper wrote:
> [...]
> Thanks for the patch.  I'll commit it in due course.
> 
> As an aside though, is there anything we could sensibly do in our own CI
> (Gitlab) to not regress this?
> 
> https://salsa.debian.org/reproducible-builds/reprotest looks like it
> might be good start, but I've never really played in this area before. 
> Would this be suitable, or do you have any other suggestion?

Hi Andrew,

thanks for merging all my patches. Having some upstream xen testing for 
reproducible builds would indeed be a good thing to have.

Reprotest is the tool the salsa CI currently runs as one step and I also have 
been using locally for testing. Salsa is the Debian gitlab instance and there 
is a CI pipeline provided for testing various Debian packaging related things, 
including reproducibility of the Debian package. We use this pipeline for 
testing our Debian xen package.
There is also the reproducible-builds project which among other things looks 
at being able to reproduce the whole Debian archive [1], but as far as i know 
they are using their own tooling for testing.

So to answer your question, I would say reprotest is a good tool for testing 
for reproducibility issues and I don't know any better alternative at the 
moment. There might be some issues e.g. faketime not working as intended in 
certain situations, but there is always the option to configure or disable a 
certain variation if it causes problems.

Maxi

[1] https://tests.reproducible-builds.org/debian/reproducible.html


--nextPart3528437.QJadu78ljV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmeKu3MACgkQgepkfSQr
0hVn7A/+NtVMzQKyKqKSf+2QrgsuVYF1/nj1TueW6iWsSayjGhR1D9fszUo9ZFi+
SZprv668ZPmR40QlmASfqSrAIjxYLrS/yEgWCcZrRd6RSofL8V9zvn3bsX58JJag
XIdFr2SDqqM4fu8pTScgGpxL7/pOiUxRUzKIjmHEy9MOmsbr9jpkV/4UPRZ1kSXa
r0x/Jvcb0bDTv+zF6hGqjZLUHDx+SWjx5UVpyHZjszupOM2SzaP+ZcZn6ez4E67q
/puHmCwGJk+uBQQPn8swkIcX5SGmv4V2BxmalTLFxgMp+uamr7MsQg7wb6fpg91M
qCdDOglfZjx0zGqUZripFLq1kocU1AXGHTGamGPlZe4A71G44jCXPqrqujzSke+1
xGExOiXzLScOHyjZiBdbfegoZedYUDkf6W7jf17fVV7CsnIIFErQS0JK1r6PjudJ
T0NfKp0X/V0kZDDdCb6mN88iQsdUnjlY4Mdw1+uteRw0poUWYvIzTvOEvOxRWJu8
Wh0Ab+ua1ryT3S/xdwQZbb018Iu1JOW8dBr1BseCDmVGupIn+ws8IU6TjuFBKJNo
W/5PK+kt3IdECj40vDXTWRexQUJNv1FJetK2dmWN+5jcoxumI2paeXt/+KYYfH/1
U+yBuPwC9iS1Wdlybo1DuqdG1AY5A9eFG6H1KYwsMw+lV1vzEvI=
=nrf+
-----END PGP SIGNATURE-----

--nextPart3528437.QJadu78ljV--




