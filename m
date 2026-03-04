Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKOcHllBqGl6rQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:27:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF362016DA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245467.1544834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnC4-0006G1-Ay; Wed, 04 Mar 2026 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245467.1544834; Wed, 04 Mar 2026 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnC4-0006Dm-8H; Wed, 04 Mar 2026 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1245467;
 Wed, 04 Mar 2026 14:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYqL=BE=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1vxnC2-0006Db-Vl
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:27:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb3ad6e-17d6-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:27:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 224B160097;
 Wed,  4 Mar 2026 14:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9DDC4CEF7;
 Wed,  4 Mar 2026 14:27:13 +0000 (UTC)
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
X-Inumbo-ID: 3eb3ad6e-17d6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772634435;
	bh=Es80wMpp1atjNoZqqiG8/9SjgOPQJW7TW/Pe4UalxUc=;
	h=Date:From:To:Cc:Subject:From;
	b=Akq6zWMimN7VrH4OZdRxecT0Lxvp/xOfecJM39rkSUx++qr4NDHCuEeJg3Srdg5D3
	 7vwz2iiLwsbTMznc66KNIdpHnMiGFxZO6aeqKN5/868rFfDWzyX81o+foR1g65W0SO
	 T+DarO/9H6bEA7gPnnrUS6bfDToMrBH3a7Xj6VAc7481Z56Kh4XtI60XN1pQY2czX5
	 twJVsqr5HEDWZMb4D9IYzLGBjPohVsHoAUoSfX/DdAzmM68iLe6YbffMySI+7GvHhd
	 /J11FwFWSy8YDj9Aoco8jHYDqE/cSBhz23K5jAaiEiTz6TjEU6cBgIcoesU7DcoVS4
	 e/T11An8Mb2ow==
Date: Wed, 4 Mar 2026 14:27:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Xen Devel <xen-devel@lists.xenproject.org>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <aahBPzflrEJ2FPx0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vafmZqH34VLuiaf8"
Content-Disposition: inline
X-Rspamd-Queue-Id: 2DF362016DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:konrad.wilk@oracle.com,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:houwenlong.hwl@antgroup.com,m:alexdeucher@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[suse.com,oracle.com,kernel.org,lists.xenproject.org,antgroup.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


--vafmZqH34VLuiaf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:38,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/amdgpu.h:56,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c:29:
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hw_types.h:221:6: error: 'pixel_format' defined as wrong kind of tag
  221 | enum pixel_format {
      |      ^~~~~~~~~~~~

Caused (I think) by commit

  4e05a08c6f3f3 (ACPI, x86/boot: Remove {set|get}_root_pointer() ACPI callbacks)

which changes the inclusions and I think triggers namespace clashes with
the unnamespaced pixel_format.  I've used the tree from next-20260303
instead but really the fix here is that amdgpu and other things defining
a pixel_format should namespace things, I'll consider if a revert is
more sensible.

--vafmZqH34VLuiaf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmoQT4ACgkQJNaLcl1U
h9BXbwf+NMgzm+EwZ+oRef+uo7RxieWsON/heDAaLQf7kj0S1+EUF48sTw++m2Xp
iS4EtFT0QNZCVTgH5JbbpxFkv7J9Z+Cycf9M6l9aZTsof8zzGWE1aYvrxXOo3Fw0
0ZXJlPOrxwmJldcQsf3F+rZEVY74BCL24XbQD5qHje5nqKKmlGA+XkjaZXW9KqHL
/icsEcg+PbZR226vH2nrrTcAUj6nX3WVcZw294QDas+N1Un/P7vDr2HOqxAiBzvO
9bzg8mUBf2fcCFQl+rNP88wa6ODwqeN0/w9twk33EVXqcJR86FfMZRvrrdcEc1gZ
Q4CM6t//I3zUfNNsrbV5tb/x3uu4zg==
=c3Fj
-----END PGP SIGNATURE-----

--vafmZqH34VLuiaf8--

