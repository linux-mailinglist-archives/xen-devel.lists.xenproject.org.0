Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B48A700689
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 13:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533781.830713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQnH-0006Xq-J1; Fri, 12 May 2023 11:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533781.830713; Fri, 12 May 2023 11:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQnH-0006Vq-GM; Fri, 12 May 2023 11:18:39 +0000
Received: by outflank-mailman (input) for mailman id 533781;
 Fri, 12 May 2023 11:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uaj=BB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pxQnG-0006Vg-1n
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 11:18:38 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf2b41d-f0b6-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 13:18:36 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4CBIXJFd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 May 2023 13:18:33 +0200 (CEST)
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
X-Inumbo-ID: bcf2b41d-f0b6-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683890313; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FRe3TEsviGbwhVJHmGWu8+4MSEgkw3T0lAC2syXgRI1nGIqq4IFHA7nDWfp5zn0XGQ
    O5BzPCqdZVs6nyvvGOKjM66fhLQwN7GZw1Q3YU+q+4VzeKeaUrwTYAvqaJvSjcbxVH6e
    32/MhSugwJcx6icbAoSRkuTrHxdLc0PgaayPeO9YHmh6gb/JtQLy+FAUvDrmFe7kzDua
    6pBVen1s7R0KHbZ8oKMiTCt8h5lOjeRl35dS9R7HqLsJ2G5jrZPjPSaCNfCpBTnAelGO
    7CHdcp0xUYOMj79BBgnN4ET/xNQcmoDwXioMoelkK4Yu2IBCNcAnxZz/IkM2x0u6ZmgG
    v6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683890313;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tigSnCt6TQ+e8MtVlCi7/8cx0Lj8IuTBbKJnyQt5R9A=;
    b=LVpkvAGQjOlKwXktpKmA7wDt7CqCtc4Uq9Xz9KTS57bpP8kdH0yRtlJJQjxB3NXxP6
    C7/xkL8zP2BpknsFVleJF390C7VaC3VUA+CzNTiF+hu2nHSZFN1+mNnT+WanF9Q4d6hm
    VmMyvrupmmexpRy2cLub6kk2KWu2Q9EfWdqpnZGfHTGDVADb+bPoojo2f6pS+8fZuU6O
    of7TfnubFVyONlq9tKtQB6hmJfBwC9aZSIE3cfrEsd7NLr9x+djzVnsgy0AOriWXbgQS
    p9uhYBmLuadbn+jLC+sle6EHT5HYFVTPOnLPEE4XAPdUuu6+Bb3WSfqaFrrIy9FQAW16
    TwAQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683890313;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tigSnCt6TQ+e8MtVlCi7/8cx0Lj8IuTBbKJnyQt5R9A=;
    b=JOjldXokCJourXLUdec+xYfP6g2DvmiEgzgQ90vLixVHpBCWWxPAt8UssmKGAqFkQp
    sIoHJn4t0dgCVKqXqxincuKslzkPTPyykbF30skYQrNmyu+Ep+89kDfOKsDy8clsrNp4
    GUEvvgORgIF75oNqsT4qTaxDc4NvBGirxTLlDPmQEFUrv2lu+416p9S8JmJPUZAP71eU
    LSy7U4CTvw0Nd6myDQR31nn8vKIHfmOPUm6zKn7pr0dEieK0x1u+7X1g5VKPx5UMU9xY
    Q6fwLkqXKCQzxEftxejkBzDexgCkjrn2DcKGOx8SvwVRPt0JP92gx+yu0ZtnV8hRtRpY
    bxCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683890313;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tigSnCt6TQ+e8MtVlCi7/8cx0Lj8IuTBbKJnyQt5R9A=;
    b=hCYCpVVGIoXu0A9dIKa/bmac/BobJqKH+shMvSXjpx7iNAsLf6H8EMvFzHw3rJvuJX
    PABA0JDOP7r1drqVPWDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Fri, 12 May 2023 13:18:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] Fix install.sh for systemd
Message-ID: <20230512131819.02b3a128.olaf@aepfle.de>
In-Reply-To: <0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
References: <20230508171437.27424-1-olaf@aepfle.de>
	<0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kmuudUbtj62vrb0QAzfYPWU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/kmuudUbtj62vrb0QAzfYPWU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 9 May 2023 13:47:11 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> Why is this 700, and the others just using regular perms?
> Also, doesn't it want quoting like the other examples too?

It is not clear why there is a single mkdir -m 0700 in the tree.
Most likely it will not give any extra security.

The scripts source hotplug.sh, which defines a variable XEN_RUN_DIR.
I think it is better to use the shell variable instead of hardcoded paths.

Regarding quoting: there are many paths used without quoting.
For the beauty an additional (huge) change could be done to quote
everything. Not sure if it is worth the effort...

I will post a v3 with this relative change:

--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -34,7 +34,7 @@ xen_startcmd()
 	local time=3D0
 	local timeout=3D30
=20
-	mkdir -p "@XEN_RUN_DIR@"
+	mkdir -p "${XEN_RUN_DIR}"
 	xenstored_pid=3D$(check_pidfile ${XENSTORED_PIDFILE} ${XENSTORED})
 	if test -z "$xenstored_pid"; then
 		printf "Starting xenservices: xenstored, xenconsoled."
--- a/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/FreeBSD/rc.d/xendriverdomain.in
@@ -27,7 +27,7 @@ xendriverdomain_start()
 {
 	printf "Starting xenservices: xl devd."
=20
-	mkdir -p "@XEN_RUN_DIR@"
+	mkdir -p "${XEN_RUN_DIR}"
 	PATH=3D"${bindir}:${sbindir}:$PATH" ${sbindir}/xl devd --pidfile ${XLDEVD=
_PIDFILE} ${XLDEVD_ARGS}
=20
 	printf "\n"
--- a/tools/hotplug/Linux/init.d/xendriverdomain.in
+++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
@@ -49,7 +49,7 @@ fi
=20
 do_start () {
 	echo Starting xl devd...
-	mkdir -m700 -p @XEN_RUN_DIR@
+	mkdir -p "${XEN_RUN_DIR}"
 	${sbindir}/xl devd --pidfile=3D$XLDEVD_PIDFILE $XLDEVD_ARGS
 }
 do_stop () {
--- a/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
+++ b/tools/hotplug/NetBSD/rc.d/xendriverdomain.in
@@ -23,7 +23,7 @@ XLDEVD_PIDFILE=3D"@XEN_RUN_DIR@/xldevd.pid"
=20
 xendriverdomain_precmd()
 {
-	mkdir -p "@XEN_RUN_DIR@"
+	mkdir -p "${XEN_RUN_DIR}"
 }
=20
 xendriverdomain_startcmd()


--Sig_/kmuudUbtj62vrb0QAzfYPWU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmReIHsACgkQ86SN7mm1
DoDskBAAikvmuvF3oMZ4tZTsP4/IdSAHXs2PuwupI9S0+uN/kncGYT2iOAtwiyhd
w99nTHWWqQ7DHY3yGxXkwJgeBhlVLUUtLUDCQ7uldRv//C/uRybFEYtOgLtg//Mg
04fONaZaCMjfd4O3Y+h4V2jFrepKwtiYh1moC73s0vrmG1WQ0FtcPzQgh5eY7ezN
I6myUdOx1Dgm/B6JxnJi73VbpbyJEIH3m31RgGb9Wl1Kh3xrRLmSFujn39M3xSjs
16oW0wU1/TGJAvgtNMCJ+HIl5pNPKeIOknJFevt1BGrOxE6hRDa2dsjdjLw9zdCq
fKbQ5fUTKhUh6zL7grXUdluywnYzVc9eWtC5IFpYZMN3wyaJHOLYHe02DQ1bxrE2
T2v6k7XoivyTTiPRkg7Zd+/FYOuxR5HkLapjYnwZ4+0sTIVUqIwTIy9enEYxMyid
e4t9w/l/lswBujutEw5WaA9hxux3MPOlaQRPSqq2BeCPthadMmo/MHYpELCEMT/x
GbsnE2CCAhK5O9T7TGHaxLYSAzQvpr5VaYG6LSHW36KK39YjmTBMz+H5baONQddW
skrAGri/1/7cN0giU4smY7tGpkr07fRK8D1obwrDc6dXA81AcKA9dzDtSeH8rkq5
Ngk4GzmXylckaoCw/Tt9CQZH+tiEMBLhoKs38YglsFUoj04BNB4=
=Gy9K
-----END PGP SIGNATURE-----

--Sig_/kmuudUbtj62vrb0QAzfYPWU--

