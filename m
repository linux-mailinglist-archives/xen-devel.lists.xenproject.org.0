Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA1716E54
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541378.844094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q45bv-0005l2-Hy; Tue, 30 May 2023 20:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541378.844094; Tue, 30 May 2023 20:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q45bv-0005hl-EO; Tue, 30 May 2023 20:06:27 +0000
Received: by outflank-mailman (input) for mailman id 541378;
 Tue, 30 May 2023 20:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZK1=BT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q45bt-0005hd-8r
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:06:25 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72d224ac-ff25-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:06:22 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4UK6LJxH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 30 May 2023 22:06:21 +0200 (CEST)
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
X-Inumbo-ID: 72d224ac-ff25-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685477181; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gPMvZ02d8pgWLJXgf0m0QKwKMlGMZYEFBgWC8P5RXNRn591fXKRmJMx8OwdsQm8zY3
    9LzQgXWf51Osa6KmhZWrpggVBiqjlfOfBbTKL8QLhvjAHXkFpTLxYFyBI/jdJRB/g00U
    F5KKKCs/PntPZyi1pNYRgIgpeAdO7Ft09uPLnQzwI/wPlN/o00bBEMaTQ0M+Rx+MM7tn
    Ua8fsk1DwWR+wzgEKQh2CywATO5wqi6F7+wkDLYCF3RF8hSEbDZQ4g1OUwfhRMHb/0nr
    tm88QggUsLgFnkUs+jdP6qOOa2NE+CkMxz+VgNa8c3GOJ8UvWv1hREhuBOcXf8jcaN2M
    USLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685477181;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uYfGoVSOyGoPL5PshkzxCPvn4zASsscH3kmekFXLH/I=;
    b=QhRFOeeCj0rQgY7qv+kix7AJPB+uyqyLr2NLKrYF+YzlO30ShpC/pS+DJgiCXwjmpx
    JeC7GOkaDBhxU2V7pc5Ge7BeifUoBWxYvF9bTyXxHFAkgRaf3mdT9XFdk8cc6teZXnt9
    nxb5PSONfnUtjZSjLdwUNZoAYN7DWVQu47z+CofIltxjU3t14MraRGuAXGhzFNy2c1dc
    eP+8hMuwkNU/Sot/w+zuiFFu0Srsl+3idQng5TbQVl0G5MXa0M8Ha/CZ5yPY0vui5NkZ
    QnBN1GGLOrKDpaB1iikjNy1voPynQ1BEpmBE1xYYsDfKOwuCWmNq1HSMhwC7KC0jjA63
    yLlg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685477181;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uYfGoVSOyGoPL5PshkzxCPvn4zASsscH3kmekFXLH/I=;
    b=CPJp8AMmAV/UosZqAkzq6KWPm9Jil21sz/W3vjqC2TP7rt5TZjZ09P3txew96H9J/f
    qxg1gkQ84F2p/KIlhlMEnxOApqHJec9hMvCzYhquGo7j1EngB5rxLjmVBxkUH8Hq+O7q
    GswIZyZ5jxLdi2qcL/d1Rp6F+73MR7J4m4OqpcB+WQaMsQNaLn/ZBp/dkEiRfF9PF9E+
    D4KB6Urfyp7L45YgpszjYyMJQu3o37/T/h5pOwvc7RbzPFNVUpVPG+sFUieW9ybQiojT
    CM2x/DgCg4ZUW7qW3rPMESVHy6BZ7lR/31tl/YiqwGYGVlIWxngZf5YyzFtb87lKwgrc
    xveA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685477181;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uYfGoVSOyGoPL5PshkzxCPvn4zASsscH3kmekFXLH/I=;
    b=gzHUix8uIxiBd7RsZ/XhwMYzyfLNmGRBzXnCEfpWwPca2g+A6dhyRr0kxhQsAnRd3b
    olybCPMNRueS/rk0+EAQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Tue, 30 May 2023 22:06:13 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230530220613.4c4da5cc.olaf@aepfle.de>
In-Reply-To: <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
	<578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VbbszYJd+QIJaS=1chhlVSo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/VbbszYJd+QIJaS=1chhlVSo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 30 May 2023 10:41:07 +0200 Jan Beulich <jbeulich@suse.com>:

> Using this N would be correct afaict, but that N isn't num_online_cpus().
> CPUs may have been offlined by the time trace buffers are initialized, so
> without looking too closely I think it would be num_present_cpus() that
> you're after.

In my testing num_online_cpus returns N, while num_present_cpus returns
all available pcpus. There is also num_possible_cpus, but this appears to
be an ARM thing.

If Xen is booted with maxcpus=3D, is there a way to use the remaining cpus?
In case this is possible, the code needs adjustment to reinitialize the
trace buffers. This is not an easy change. But if the remaining cpus
will remain offline, then something like this may work:

+++ b/xen/common/trace.c
@@ -110,7 +110,8 @@ static int calculate_tbuf_size(unsigned int pages, uint=
16_t t_info_first_offset)
     struct t_info dummy_pages;
     typeof(dummy_pages.tbuf_size) max_pages;
     typeof(dummy_pages.mfn_offset[0]) max_mfn_offset;
-    unsigned int max_cpus =3D nr_cpu_ids;
+    unsigned int nr_cpus =3D num_online_cpus();
+    unsigned int max_cpus =3D nr_cpus;
     unsigned int t_info_words;
=20
     /* force maximum value for an unsigned type */
@@ -148,11 +149,11 @@ static int calculate_tbuf_size(unsigned int pages, ui=
nt16_t t_info_first_offset)
      * NB this calculation is correct, because t_info_first_offset is
      * in words, not bytes
      */
-    t_info_words =3D nr_cpu_ids * pages + t_info_first_offset;
+    t_info_words =3D nr_cpus * pages + t_info_first_offset;
     t_info_pages =3D PFN_UP(t_info_words * sizeof(uint32_t));
     printk(XENLOG_INFO "xentrace: requesting %u t_info pages "
            "for %u trace pages on %u cpus\n",
-           t_info_pages, pages, nr_cpu_ids);
+           t_info_pages, pages, nr_cpus);
     return pages;
 }
=20


Olaf

--Sig_/VbbszYJd+QIJaS=1chhlVSo
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmR2VzUACgkQ86SN7mm1
DoCAhg//WFjBXPZT6Z/4yq4WxlJF0+i2nBvetK+oMxV+FtZuAsR0rS8CZWKKF1u5
MwAGwjqDXH+xgYCZiYrXRXKPj72tjkQh7e+GHmwxz/q1DsjDryJxFFB5asbS4lIw
Wpq2zZ78J9IQBsCfodY9Bi/mYKIPHVNA/uiWIJRaXzt7j4+Usbrh/biebiPsNOu9
qKPYfWAhDFX4eTPoDQgSqDkeKaUQ0bN/d1h1fLPs8CdLVBaEZJfBtJisWIQ0CRd1
Np359ttizbjjC/PR/NmZmmFGwqlKoL13GghHn2/91PGSTiAThKWM+b0pQg6NH4gI
+MDQ/KN+O4o4cRClbu2O/vSohHMR/aDXbHdmRm/OF1+JEg47MSXp1Dl2f/PFJYER
HHhVGGeSzi+NMKn8jjFD4zvc91T0Bsg8DkR/ibPmv0K2eM0daRqNLEThhoKjXFsb
kiq0pNpHn+DJ07vYLX8f+6usnH+1k4GprClUuV7uMpZskaUoGuuJHCak53xstJ4m
hvGIDYqcEJmzQ4JhHi7rojxvAk0QgZyjOTzTHxwZWNluS3hUXRO/8liCopfjSo3C
xn84GeDF5kHoRB69LKH8FlvDpogag0gGftMQkWHjupex1Zth9x6jpGf0pW527RdI
A2zGycAdoXDR3gzEtwLm4LiAHG7ZV/TiLN579SQbADRXw9lMdms=
=fqHp
-----END PGP SIGNATURE-----

--Sig_/VbbszYJd+QIJaS=1chhlVSo--

