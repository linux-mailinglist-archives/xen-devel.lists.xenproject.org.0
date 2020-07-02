Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA292212C6D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 20:38:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr46E-0007DG-Fa; Thu, 02 Jul 2020 18:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rv/I=AN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jr46C-0007DB-5Q
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 18:38:17 +0000
X-Inumbo-ID: 301a96c4-bc93-11ea-bb8b-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 301a96c4-bc93-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593715094;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=kLvpg1soij3DNc2umoAvjn9s26IXsI1NG+9wQq0SEnU=;
 b=TZHVSU8ujsYqSaDp5YUibxI0yo5qWe2SwQh6m6PNIH8KFXesE9xEJ4Cf53v30EMdQZ
 fbMlnucF6GACbKjBNqVq+AqKJIEYNl3tdOSr6Hgl3lNDyaYkKbfHQHSL+z9BY9Ee5BQA
 xpgZ1QeryfbE8sK+uVQ01pA+WE3uaS5YyUic3vFk1bBwhApIfLoMIPohypd9yvM7AkHS
 ErOqJ3albVvFBbDKOHbCMqyT19q2Jl57mFJ0D0xRkk2hB+UbkqYoKvDvOeJsUEICeVJ+
 HYsq+RuEmHUvjXm5GYVXKqwApCC/E3NksYw7r9GQ9WgjvIvzDiQMuxraUQKSN6ocDEa9
 tjrw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS329Fjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id m032cfw62IcAX2S
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Jul 2020 20:38:10 +0200 (CEST)
Date: Thu, 2 Jul 2020 20:38:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Michael Young <m.a.young@durham.ac.uk>
Subject: Re: Build problems in kdd.c with xen-4.14.0-rc4
Message-ID: <20200702183806.GA28738@aepfle.de>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, Michael Young wrote:

> I get the following errors when trying to build xen-4.14.0-rc4

This happens to work for me.

Olaf

---
 tools/debugger/kdd/kdd.c | 8 ++++----
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -742,25 +742,25 @@ static void kdd_tx(kdd_state *s)
     int i;
=20
     /* Fix up the checksum before we send */
     for (i =3D 0; i < s->txp.h.len; i++)
         sum +=3D s->txp.payload[i];
     s->txp.h.sum =3D sum;
=20
     kdd_log_pkt(s, "TX", &s->txp);
=20
     len =3D s->txp.h.len + sizeof (kdd_hdr);
     if (s->txp.h.dir =3D=3D KDD_DIR_PKT)
         /* Append the mysterious 0xaa byte to each packet */
-        s->txb[len++] =3D 0xaa;
+        s->txp.payload[len++] =3D 0xaa;
=20
     (void) blocking_write(s->fd, s->txb, len);
 }
=20
=20
 /* Send an acknowledgement to the client */
 static void kdd_send_ack(kdd_state *s, uint32_t id, uint16_t type)
 {
     s->txp.h.dir =3D KDD_DIR_ACK;
     s->txp.h.type =3D type;
     s->txp.h.len =3D 0;
     s->txp.h.id =3D id;
@@ -775,25 +775,25 @@ static void kdd_send_cmd(kdd_state *s, uint32_t subty=
pe, size_t extra)
     s->txp.h.type =3D KDD_PKT_CMD;
     s->txp.h.len =3D sizeof (kdd_cmd) + extra;
     s->txp.h.id =3D (s->next_id ^=3D 1);
     s->txp.h.sum =3D 0;
     s->txp.cmd.subtype =3D subtype;
     kdd_tx(s);
 }
=20
 /* Cause the client to print a string */
 static void kdd_send_string(kdd_state *s, char *fmt, ...)
 {
     uint32_t len =3D 0xffff - sizeof (kdd_msg);
-    char *buf =3D (char *) s->txb + sizeof (kdd_hdr) + sizeof (kdd_msg);
+    char *buf =3D (char *) &s->txp + sizeof (kdd_hdr) + sizeof (kdd_msg);
     va_list ap;
    =20
     va_start(ap, fmt);
     len =3D vsnprintf(buf, len, fmt, ap);
     va_end(ap);
=20
     s->txp.h.dir =3D KDD_DIR_PKT;
     s->txp.h.type =3D KDD_PKT_MSG;
     s->txp.h.len =3D sizeof (kdd_msg) + len;
     s->txp.h.id =3D (s->next_id ^=3D 1);
     s->txp.h.sum =3D 0;
     s->txp.msg.subtype =3D KDD_MSG_PRINT;
@@ -807,25 +807,25 @@ static void kdd_break(kdd_state *s)
 {
     uint16_t ilen;
     KDD_LOG(s, "Break\n");
=20
     if (s->running)
         kdd_halt(s->guest);
     s->running =3D 0;
=20
     {
         unsigned int i;
         /* XXX debug pattern */
         for (i =3D 0; i < 0x100 ; i++)=20
-            s->txb[sizeof (kdd_hdr) + i] =3D i;
+            s->txp.payload[sizeof (kdd_hdr) + i] =3D i;
     }
=20
     /* Send a state-change message to the client so it knows we've stopped=
 */
     s->txp.h.dir =3D KDD_DIR_PKT;
     s->txp.h.type =3D KDD_PKT_STC;
     s->txp.h.len =3D sizeof (kdd_stc);
     s->txp.h.id =3D (s->next_id ^=3D 1);
     s->txp.stc.subtype =3D KDD_STC_STOP;
     s->txp.stc.stop.cpu =3D s->cpuid;
     s->txp.stc.stop.ncpus =3D kdd_count_cpus(s->guest);=20
     s->txp.stc.stop.kthread =3D 0; /* Let the debugger figure it out */
     s->txp.stc.stop.status =3D KDD_STC_STATUS_BREAKPOINT;

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7+KY4ACgkQ86SN7mm1
DoBuFA/+IZZ+sENG0nz+pSvf5pYjGZyLMHgqqTGKOn9VxoX2HeJZg8Mc2A2NMDYE
ImX/uXMXbPKZI02eFMB3hFCQORjW7BztEEVzbVQZ9ZDw5hG/N+l82tMUyJM/HfW3
YJrRRx6RMCDecwLAXVdhI0+0xgpET7mLXCLlLiFMByy2pKE0Dpqjka7b3I+BLNTk
3/juc+OnCH+SikYa4yx2KY88Bd6k0guiEjSEvH63BhkuTVkXfh+VHo3L41K5fQ2F
pbp37Gah6XUUIZ4/s+h40sZbDaBjmzsmF6kI72mrWT/6D2xlv8Kbk9A3p3EJtaCG
RBl90byqh6a5+7kdcLAT60bQW1lwObimQd1QxGLkvRovxAVGXoE2gSgJl8U/v9eK
jhLQB/tlwHEdvliMvtjOdj6mB82qDxQ60H9MlIvs2fpQrbNNrG6uYbGJ9HVHriOc
RYNOdL/f2s/KKAVwkk/aqPrigzayeCTopR4o97/b8gcm7CaQyD/gQ2w1CBIqwJ/+
GApwnQRN1a4VPSx0X1/jKUU3jYYYyKa04DCuQcnPvPXk+lCcZ+YcZA211iXSrmfg
AkbDHu4s0Pq1gTZ3asYLKP4tEQHl+nrT4z+xd6GBq45/MbzCcqukBj5Ru/pBVFkV
i07b5hmk/4Gd1zjLOYbX/deldyoHykw5w2p0KvBdhwiro2kZTn4=
=onR7
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

