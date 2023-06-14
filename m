Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C772F82B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 10:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548585.856571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9M6s-0003U3-0a; Wed, 14 Jun 2023 08:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548585.856571; Wed, 14 Jun 2023 08:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9M6r-0003S9-U2; Wed, 14 Jun 2023 08:44:09 +0000
Received: by outflank-mailman (input) for mailman id 548585;
 Wed, 14 Jun 2023 08:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RSaz=CC=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q9M6p-0003S3-Uq
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 08:44:08 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ef3d05b-0a8f-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 10:44:06 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z5E8i5kWd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Wed, 14 Jun 2023 10:44:05 +0200 (CEST)
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
X-Inumbo-ID: 9ef3d05b-0a8f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1686732245; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mFhYt+eQVW2Joa+AdEWNc24kP9hRLrcmduKO75xNGZMSdvPHlKB3RkF9hDA0i2+wd/
    eCIj2JsFXytlOGfvZjR7pbrdSJS0TPZoV9E18bGU7a+yj1iqt9osVit4lX/TE9WrjITY
    N8gI2jC5V4HgwhPkn8oCsKulaYN8m1cBHssn+xUgzteBeF2CMgiD0Y82m7Of0yHU0CFG
    2kXwIGyukm0LUTKBtn+v1ubprmHO0Jw5KGFn4SfjiDIoE8ERRe3/pHdVxs0Crw1lmHYO
    OUaoTh7ZxwiWBrXVprVffFulNUH6AwhfbQ6LQ+9W8I2tiRVoxCj5AtS3sfQV/lRVvrdo
    ojDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686732245;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=feGxpcqc2SUWbawaHYkxho7w62lCWXe/X00TfFDE8RA=;
    b=UAIh18N/dbYmZKUzYGggnxiWR+9R+jaxqefjg+YD5XeiD48yYeFFX6sqBcDy/uNR37
    M7uQlE9+P5wqbHPhwAQYPWJhmZb2X0sy2liK5xen9L+aUOo/Rfq1N3Yio0PFtthbn1Cr
    VIqWRBCrs8FwuZQzwykZsshfDtzXhWLUYeDU0iHn2TDbcUS64MEvQ4yC8jGeRQwP81cw
    irt8JhJ8rVrHT6ZTP/6CotSdSUX4NaFVAedqRm63oqT6VLgYsFtHkaM56SeblfxjyDJt
    jyR7P1NCqyV7OfPVmmoUSRjRx/eI6o3usxZclzTZky1pfV1W0SWnQAIBHO3ck1ZHgGlt
    Y8iQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686732245;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=feGxpcqc2SUWbawaHYkxho7w62lCWXe/X00TfFDE8RA=;
    b=KVmQ/nwmK20iagxenOCnDGsn2n92RC0/IdRlfgGzcYkULXV+oLv2lyzpuJZ0FFbKg+
    y7sDTq1w/7pk3uvgV3cH4YQO/9kDIp1+d5r9DeFoUsN079FJglwd6XdDsH7D/FkL7XQ2
    M0PT+dK96coNVSA87HnJSiirAQo7z3KgCvknYYoxIVpLAP74epgdL0oAqPH2gLXWc1QP
    L1wNZfKWXzrL0UdpcvXGY2igfAArH4P4J90WyDTP+4LLtn6SWCn+A1rJWwHxourXYf73
    eoSNlBQSf2u6ghoQP+EaxdLXUoOPONuHeo8u4U4fo8P4ji8EDYH0mNFCpEa8DiGoA/JQ
    W3Qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686732245;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=feGxpcqc2SUWbawaHYkxho7w62lCWXe/X00TfFDE8RA=;
    b=BKEOCNiIKIV6Dk4olxVDm/deRpLU33eZ4st9mx//RSvtNW6Ve0OszJCc4cTq8/vdB8
    BdRrw/jfTGZ4WyFFC2Bg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Wed, 14 Jun 2023 10:43:58 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: compat code lacks support for __attribute__
Message-ID: <20230614104234.56835aa9.olaf@aepfle.de>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W/VWX/Lck0UsJ4n=a.wQTi+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/W/VWX/Lck0UsJ4n=a.wQTi+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I would like to share code between the hypervisor and xenalyze, so that
every definition comes from a single place and is not duplicated in xen
and xenalyze. This works as long as simple constructs like struct x {};
are used. Depending on the data to be stored into the trace buffer, having
support for __packed may reduce the amount of data that need to be copied.

The tooling currently converts ___attribute__ into compat___attribute__.
Was support for __attribute__ intentionally left out, or was there just
no usecase for it?


Olaf

+++ b/xen/include/public/trace.h
@@ -80,6 +80,14 @@
 #define TRC_LOST_RECORDS        (TRC_GEN + 1)
 #define TRC_TRACE_WRAP_BUFFER  (TRC_GEN + 2)
 #define TRC_TRACE_CPU_CHANGE    (TRC_GEN + 3)
+#define TRC_a (TRC_GEN + 123)
+struct __attribute__((__packed__)) trc_a {
+    unsigned a;
+};
+#define TRC_b (TRC_GEN + 321)
+typedef struct __attribute__((__packed__)) trc_b {
+    unsigned b;
+} trc_b_t;
=20
 #define TRC_SCHED_RUNSTATE_CHANGE   (TRC_SCHED_MIN + 1)
 #define TRC_SCHED_CONTINUE_RUNNING  (TRC_SCHED_MIN + 2)

--Sig_/W/VWX/Lck0UsJ4n=a.wQTi+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSJfc4ACgkQ86SN7mm1
DoDk7Q//c+eVEcmadgX3awWOlIL87B/B2i6I78bm5TkgZ+RhHJI/fu++rYWfLzb4
6wOfOfV28/pZXd9OIJwS8t0vEFuDf5AejBEp9UDSslp9QrVGEWdaeDQvz7ny/y1t
g/DtccsMoXx/ofYQxRNcUP4qeUpZTgWU1ZBfAWyj+WAOhZ36k/stYG27ID94phzn
pjLKshExwqtz5VkA7L4x4JOL8sq565LDV0pprJmRLKPYgMMRM/4CVi1vwxoIdKSI
Vl1J3UMMeiJMa00fB3OYqnqTIlXYu2zABNZSEXp1pAWNAnfz+xVar3CuUVtIuu9X
Whd7hV0Htbd0e5PAynm7cNwKIs3zpPc/Vn7M2LbSeyLUHwMWIz9mu1lXRX0kInBp
vS7CRr/oKS2CUY+dl9R+yszEMxgh+qAoy3lRBt8s+owZ/7WC+ZoYs7/jXgzT3Hqp
U3cuF0JLLVOmXDNyCWPlr/Gu/wpg6ZzHvo1tm60+QZdrQvho1yWlKvraaYBnp00l
zpKEZFWZR7KBgXlAtGdVa1TpmWOI6WEVTciCF0mBBW3BzUSvW/03TvUED7Fw6Z0D
/TXEDc0v+rbXRSUx/tdOxBArtfzhlMdRbrTD2FBPazoWQ7GMv9r//A0IfrsAR01N
8GZa38D2uPCXl9GZQV188rLIx90RgeAmBoxIqcoGtputGK27st4=
=JGnU
-----END PGP SIGNATURE-----

--Sig_/W/VWX/Lck0UsJ4n=a.wQTi+--

