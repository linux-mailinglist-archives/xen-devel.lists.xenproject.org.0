Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E191F3C3A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jieDD-0008KI-Ql; Tue, 09 Jun 2020 13:22:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jieD9-0008KD-Jt
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:22:42 +0000
X-Inumbo-ID: 49abebe8-aa54-11ea-b31f-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.165])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49abebe8-aa54-11ea-b31f-12813bfff9fa;
 Tue, 09 Jun 2020 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591708957;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TJ+n7JQJ9orNHoKmwICi073w1Uz7eo0ncOIFOz2e6GM=;
 b=sGAgKhYg2tY004+3X36fJ/2Bntpp93Yu6Vh7hK/SVQeau/OfT/vYo93k84gsoijinD
 FycRzloM9GDm/ecmcgkQlb64Hgq7zgGXf4cyTt6xNkXK29RFDTtHNiHj/D3BrZWArkCm
 LUtlo0R/5eceYE7ApUo2iEPM3uLUUt26O/tW1jIOWh9PSrZ86NLo2Xwdct/zH4E5Zrij
 g5D52jBcT7uXpAJWciMVNU6hT0kfYTTC2VkJwfsFmEHoo4TEhd9COTndI4lMQCdHYFIR
 GczzjW+BBbMdhdiVMN+1VziyV5XaZubWTixfJ5Os4ISPbuEorR9MqYIfQvZLUydn6vAy
 01uA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w59DMXKvW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 15:22:33 +0200 (CEST)
Date: Tue, 9 Jun 2020 15:22:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200609152233.039cfc86.olaf@aepfle.de>
In-Reply-To: <20200609121549.GA90841@deinos.phlegethon.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VuIC4TD1X18_ExiDyAMRCB3"; protocol="application/pgp-signature"
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

--Sig_/VuIC4TD1X18_ExiDyAMRCB3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 13:15:49 +0100
schrieb Tim Deegan <tim@xen.org>:

> Olaf, can you try dropping the 'payload' field from the header and replac=
ing the payload[0] in pkt with payload[] ?

In file included from kdd.c:53:
kdd.h:325:17: error: flexible array member in union
  325 |         uint8_t payload[];

--- orig/kdd.h  2020-06-08 17:40:05.000000000 +0000
+++ kdd.h       2020-06-09 13:20:36.724887538 +0000
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
+        uint8_t payload[];
     };
 } PACKED kdd_pkt;
=20

Olaf

--Sig_/VuIC4TD1X18_ExiDyAMRCB3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fjRkACgkQ86SN7mm1
DoANUg/9Er0atjG/tO+ONwROD47A34d/ennh7n/+dTflSnfRuFBSPcLEYM/+76of
E473c9Vr14SumtcjXxRCOiLeMROhd00pyA6LomLYxIWypY/nrypvLp7GPHH2yABZ
xR/j40ybYlLYy8IBAXCHjFAnEwhxvbTbAriwTsLIkBOsJ6Y06UMa/Ma6CQdzfXYo
CIhVPoX+wgVMaUKfqie9UE1V0pCCHADSJWCt5oSXpEISkW+Sg5W/jQris+6aVHJj
hQ22UFphfqwBTQEAhxwyFab8aiWQBeohGURJqBGLrq3LlFDNNBmWcw1JO0snYjL4
pwdwCy/anun1r/dQsLP//Geh9zwMDVBKZu+zU3Mw3YHLLn5T+9uZp9JIZBIlHFNr
x7ScCMEo76QemkJW0Hd/FiMK2DiOaxTdoc737ql4g9phleIx7AaEeO0G1amoM1Ss
ffqbQupNqlUuA6fKCkGAcvliqWQyezcOAWVYDwBPSKRouzR/KC1vKZbGvNO1ynLh
aqF/wtUz3HuLtNiVpzUxg9Cg4E8KiVtKMfP3j22VzqvTpdH98aE6DSnJyCwC1mr3
F9OgmL+ItAwT7I1Hp8FXr4lWE7uRaJ+J585OhgAMs1uzQekyVynmFnTpNJTXJnrf
Ryfj2AgdIX9wggo4Ca6yALK2MAoUxqHCbtAzkpQwx7RfHpkXrFk=
=NWDg
-----END PGP SIGNATURE-----

--Sig_/VuIC4TD1X18_ExiDyAMRCB3--

