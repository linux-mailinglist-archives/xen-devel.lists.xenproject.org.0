Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86A1F6DC4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 21:10:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjSaj-0006Ro-Qe; Thu, 11 Jun 2020 19:10:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uMo8=7Y=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jjSag-0006R5-8J
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 19:10:20 +0000
X-Inumbo-ID: 2ead46b0-ac17-11ea-b568-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.160])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ead46b0-ac17-11ea-b568-12813bfff9fa;
 Thu, 11 Jun 2020 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591902615;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=c/YyX5dxTABHxkDhF1RlHPlerlbc2wZsuCS0Fyi+oFQ=;
 b=stAu9TixQCDdsYDP5iG5Jz2jxlgryKLQheKeECxzo+LKBTUPdAt99WhTERIZ/4xNLq
 VS4ZYnh63AlSbqp58/lKVOXTo00Nse85J8pnisYVew+D+wOnZZ57Lkt8xr8DjFCfyQpa
 4qFrgILaNdnvtSl81wSq1VVXYLLSH+JW85BxYq/vO4StMkkVQ9T1raLqVbBYsPlqENCw
 8Eb7QfbtZ1QwF8NE6KIiMvtPEkGUMXt0na42Umez8SxRgwNqGyGIsFNjX8VVig58CCCL
 kbKB8b9KsaI4mfIrICG4Fdf/+Ejp51vdhpm/0ULm6ATNXA0vRdAXuwz6scsp6B67/ctZ
 Rq9A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 0013a0w5BJAB0XP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 11 Jun 2020 21:10:11 +0200 (CEST)
Date: Thu, 11 Jun 2020 21:10:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200611211004.11e38f8f.olaf@aepfle.de>
In-Reply-To: <20200610191657.GA69414@deinos.phlegethon.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IQe_EQz7_eTqPFTXG09yN=2"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/IQe_EQz7_eTqPFTXG09yN=2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 10 Jun 2020 20:16:57 +0100
schrieb Tim Deegan <tim@xen.org>:

> How tedious.

Indeed. This compiles for me as well:

--- orig/kdd.h  2020-06-08 17:40:05.000000000 +0000
+++ kdd.h       2020-06-11 19:00:44.234364040 +0000
@@ -68,7 +68,6 @@
     uint16_t len;     /* Payload length, excl. header and trailing byte */
     uint32_t id;      /* Echoed in responses */
     uint32_t sum;     /* Unsigned sum of all payload bytes */
-    uint8_t payload[0];
 } PACKED kdd_hdr;
=20
 #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them)=
 */
@@ -323,7 +322,7 @@
         kdd_msg msg;
         kdd_reg reg;
         kdd_stc stc;
-        uint8_t payload[0];
+        uint8_t payload[65536];
     };
 } PACKED kdd_pkt;
=20
--- orig/kdd.c  2020-06-08 17:40:05.000000000 +0000
+++ kdd.c       2020-06-11 19:08:36.775724640 +0000
@@ -79,11 +79,11 @@
 /* State of the debugger stub */
 typedef struct {
     union {
-        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for t=
x */
+        uint8_t txb[sizeof (kdd_hdr) + 0xffff];   /* Marshalling area for =
tx */
         kdd_pkt txp;                 /* Also readable as a packet structur=
e */
     };
     union {
-        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for r=
x */
+        uint8_t rxb[sizeof (kdd_hdr)];   /* Marshalling area for rx */
         kdd_pkt rxp;                 /* Also readable as a packet structur=
e */
     };
     unsigned int cur;       /* Offset into rx where we'll put the next byt=
e */

Olaf

--Sig_/IQe_EQz7_eTqPFTXG09yN=2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7igYwACgkQ86SN7mm1
DoD4KA/4vENTigbsP76xRkx5K0yvtfscs3zvqtKTn6AcADsLsgNQC1r1HXpnrka1
EXt3CCz6C7GV1KvvaCA1x+6z2xtKv2VL40mNiamAD97HcWE6bdqLWms7N2AGda4Z
PNMP3jab7L5vwLJ92JktOjnDBRoutgPNI0nbp/tdOAUIVDxGOSTEseWnB81AeWrg
ld++KVRRC8kuYSHBThvUFNZOkej/bym22T+C9UIdWGs/FaR9G5fQ3cLOh13EY21J
Ff3GAIJCIVg1OtUOJ1wHWKINri4p16BWtW25CxmrPtGcqOiC2HL5wPwkmbFBC2ap
Hv1Fc5A99v32ZZGUFN4zuj4N+Gkc8x0+RIuoDa9M2d7QByGmCHI+pjKvRcjcmpqA
zseNlV9MdpRJzEWm7x6tAh5/TH2KjIyHo4v1xAkFKBC72vik9cz8lZjLGT55ZcZw
GC95dpCGYlDY2qU9iUx/K39fjXiJOH+8IwVS65o+Uz/FfNaNBC3MHvoKx7OyUK7X
YvwlpWz6NhvezruMNSNg2GHNFW56Ucu24/yD5xloagA1dKLbHCm7E/QGt8SsdnRy
egAm3p3rxuc1SE+NvNqdk3jCCiRGboZq+jmp2EO33+ll6vGxb1mo8+3GvLOP5vbb
LEH1ezbWacRaL+IDzqtAVZDhlCky0ZGcQDkMgtMdR4IJaSMyMA==
=MsgC
-----END PGP SIGNATURE-----

--Sig_/IQe_EQz7_eTqPFTXG09yN=2--

