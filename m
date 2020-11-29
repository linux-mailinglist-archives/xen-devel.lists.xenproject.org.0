Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92292C7A01
	for <lists+xen-devel@lfdr.de>; Sun, 29 Nov 2020 17:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40474.73419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjPZr-0002FN-E5; Sun, 29 Nov 2020 16:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40474.73419; Sun, 29 Nov 2020 16:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjPZr-0002Ey-99; Sun, 29 Nov 2020 16:29:31 +0000
Received: by outflank-mailman (input) for mailman id 40474;
 Sun, 29 Nov 2020 16:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLU4=FD=helimail.de=oliver_linden@srs-us1.protection.inumbo.net>)
 id 1kjPYo-0002DH-4m
 for xen-devel@lists.xenproject.org; Sun, 29 Nov 2020 16:28:26 +0000
Received: from mail.hamcom.de (unknown [2001:14f0:0:dc03::37:215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b400b7ea-e0b8-4ca7-9719-139f725ad6aa;
 Sun, 29 Nov 2020 16:28:23 +0000 (UTC)
Received: from [37.85.82.69] (port=55888 helo=[192.168.1.100])
 by mail.hamcom.de with esmtpa (Exim 4.92.3)
 (envelope-from <oliver_linden@helimail.de>) id 1kjPYi-0002RD-9A
 for xen-devel@lists.xenproject.org; Sun, 29 Nov 2020 17:28:23 +0100
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
X-Inumbo-ID: b400b7ea-e0b8-4ca7-9719-139f725ad6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helimail.de
	; s=201711; h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JLNEniUypK9+9KC8p4FYhCtIXDWa772T7XBz1uyibpk=; b=AIoG4oCwbYdRdmMwU7i+TpVkMY
	GSourdl2fRWedW3FLY2bwr87CxdvNXHw7t0OFxk0fE2A+BPJfE1SMtOM9oEDhVwXhS6D8jw/VtVQq
	pTCZG98NoVld//Yo6eA5eiitDKyw0Z/GZCZoy0pZBXA//H6JOPUgsnU12jSTFdiQkyXE=;
X-HeLi-id: cfcd208495d565ef66e7dff9f98764da
To: xen-devel@lists.xenproject.org
From: Oliver Linden <oliver_linden@helimail.de>
Subject: HVM - 2nd bridge breaking DomU config
Message-ID: <a7b21eef-8580-c3e8-a93d-e625b88bb947@helimail.de>
Date: Sun, 29 Nov 2020 17:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="f759fcgGUbWP7g50xGNMrNbMKsBX54s8c"
X-Spam-Score: -1.0
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f759fcgGUbWP7g50xGNMrNbMKsBX54s8c
Content-Type: multipart/mixed; boundary="XJ66UDMsWA5tAAePrOHIWa0o9qM0SktcF";
 protected-headers="v1"
From: Oliver Linden <oliver_linden@helimail.de>
To: xen-devel@lists.xenproject.org
Message-ID: <a7b21eef-8580-c3e8-a93d-e625b88bb947@helimail.de>
Subject: HVM - 2nd bridge breaking DomU config

--XJ66UDMsWA5tAAePrOHIWa0o9qM0SktcF
Content-Type: multipart/alternative;
 boundary="------------D0BBEA754AD91EDEC9AA23AB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D0BBEA754AD91EDEC9AA23AB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgYWxsLAoKZ290IHRoZSByZWNvbW1lbmRhdGlvbiBmcm9tIHRoZSBmcmVlbm9kZSB4ZW4g
SVJDIGNoYW5uZWwgdG8gb3BlbiBhCnRpY2tldCBoZXJlLiBIb3BpbmcgdGhhdCdzIG9rLgoK
UHJvYmxlbToKCkkgd2FudCB0byBwcm92aWRlIGEgc2Vjb25kIGJyaWRnZSB0byBhIEhWTSBM
aW51eCBEb21VLiBCdXQgYXMgc29vbiBhcyBJCmFkZCB0aGlzIHRvIHRoZSBEb21VIGNvbmZp
ZyBmaWxlIHRoZSBEb21VIGRvZXNuJ3Qgc3RhcnQgYW5kIHRoZSBxZW11IGxvZwpmaWxlIGRv
ZXMgc3RhdGUKCipxZW11LXN5c3RlbS1pMzg2OiAtZGV2aWNlCnJ0bDgxMzksaWQ9bmljMSxu
ZXRkZXY9bmV0MSxtYWM9MDA6MTY6M2U6MzU6YWY6YWY6IHhlbjogZmFpbGVkIHRvCnBvcHVs
YXRlIHJhbSBhdCAxMTAwYzAwMDAqIChzYW1lIHdpdGggZTEwMDApCgpQcm92aWRpbmcgb25s
eSBvbmUgYnJpZGdlIGRvZXMgd29yayBmaW5lLiBTaW5jZSBJIGNvdWxkbid0IGZpbmQgYW55
dGhpbmcKbWVhbmluZ2Z1bCB0byBtZSBvbiB0aGUgSW50ZXJuZXQgSSdtIGFza2luZyBoZXJl
LiBBbnkgaGVscCBpcyBoaWdobHkKYXBwcmVjaWF0ZWQuCgpyb290QEhBTS1YRU4xOi9ldGMv
eGVuIyBsc2JfcmVsZWFzZSAtYQpObyBMU0IgbW9kdWxlcyBhcmUgYXZhaWxhYmxlLgpEaXN0
cmlidXRvciBJRDogVWJ1bnR1CkRlc2NyaXB0aW9uOsKgwqDCoCBVYnVudHUgMjAuMDQuMSBM
VFMKUmVsZWFzZTrCoMKgwqDCoMKgwqDCoCAyMC4wNApDb2RlbmFtZTrCoMKgwqDCoMKgwqAg
Zm9jYWwKCnJvb3RASEFNLVhFTjE6L2V0Yy94ZW4jIHVuYW1lIC1hCkxpbnV4IEhBTS1YRU4x
IDUuNC4wLTU0LWdlbmVyaWMgIzYwLVVidW50dSBTTVAgRnJpIE5vdiA2IDEwOjM3OjU5IFVU
QwoyMDIwIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eAoKcm9vdEBIQU0tWEVOMTov
ZXRjL3hlbiMgeGwgaW5mbwpob3N0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDogSEFNLVhFTjEKcmVsZWFzZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6
IDUuNC4wLTU0LWdlbmVyaWMKdmVyc2lvbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6ICM2MC1VYnVudHUgU01QIEZyaSBOb3YgNiAxMDozNzo1OSBVVEMgMjAyMAptYWNoaW5l
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogeDg2XzY0Cm5yX2NwdXPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAxNgptYXhfY3B1X2lkwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDogMzEKbnJfbm9kZXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDog
MQpjb3Jlc19wZXJfc29ja2V0wqDCoMKgwqDCoMKgIDogOAp0aHJlYWRzX3Blcl9jb3JlwqDC
oMKgwqDCoMKgIDogMgpjcHVfbWh6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDog
MzU5My4zMjYKaHdfY2Fwc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6CjE3OGJm
M2ZmOmY2ZDgzMjBiOjJlNTAwODAwOjI0NDAzN2ZmOjAwMDAwMDBmOjIxOWM5MWE5OjAwNDAw
MDA0OjAwMDAwNTAwCnZpcnRfY2Fwc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogaHZt
IGh2bV9kaXJlY3Rpbwp0b3RhbF9tZW1vcnnCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IDMyNjk5
CmZyZWVfbWVtb3J5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IDcxNTAKc2hhcmluZ19mcmVl
ZF9tZW1vcnnCoMKgIDogMApzaGFyaW5nX3VzZWRfbWVtb3J5wqDCoMKgIDogMApvdXRzdGFu
ZGluZ19jbGFpbXPCoMKgwqDCoCA6IDAKZnJlZV9jcHVzwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOiAwCnhlbl9tYWpvcsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogNAp4ZW5f
bWlub3LCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IDExCnhlbl9leHRyYcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDogLjQtcHJlCnhlbl92ZXJzaW9uwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA6IDQuMTEuNC1wcmUKeGVuX2NhcHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDogeGVuLTMuMC14ODZfNjQgeGVuLTMuMC14ODZfMzJwIGh2bS0zLjAteDg2XzMyCmh2
bS0zLjAteDg2XzMycCBodm0tMy4wLXg4Nl82NAp4ZW5fc2NoZWR1bGVywqDCoMKgwqDCoMKg
wqDCoMKgIDogY3JlZGl0Cnhlbl9wYWdlc2l6ZcKgwqDCoMKgwqDCoMKgwqDCoMKgIDogNDA5
NgpwbGF0Zm9ybV9wYXJhbXPCoMKgwqDCoMKgwqDCoCA6IHZpcnRfc3RhcnQ9MHhmZmZmODAw
MDAwMDAwMDAwCnhlbl9jaGFuZ2VzZXTCoMKgwqDCoMKgwqDCoMKgwqAgOgp4ZW5fY29tbWFu
ZGxpbmXCoMKgwqDCoMKgwqDCoCA6IHBsYWNlaG9sZGVyIGRvbTBfbWF4X3ZjcHVzPTItMwpk
b20wX21lbT0xMDI0TSxtYXg6MjA0OE0gaW9tbXU9YW1kLWlvbW11LWdsb2JhbC1pbnRyZW1h
cCBsb2dsdmw9YWxsCmd1ZXN0X2xvZ2x2bD1hbGwgcXVpZXQgbm8tcmVhbC1tb2RlIGVkZD1v
ZmYKY2NfY29tcGlsZXLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogZ2NjIChVYnVudHUgOS4y
LjEtMzF1YnVudHUzKSA5LjIuMSAyMDIwMDMwNgpjY19jb21waWxlX2J5wqDCoMKgwqDCoMKg
wqDCoMKgIDogdWJ1bnR1LWRldmVsLWRpCmNjX2NvbXBpbGVfZG9tYWluwqDCoMKgwqDCoCA6
IGxpc3RzLnVidW50dS5jb20KY2NfY29tcGlsZV9kYXRlwqDCoMKgwqDCoMKgwqAgOiBUdWUg
TWFyIDEwIDA5OjA0OjA2IFVUQyAyMDIwCmJ1aWxkX2lkwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA6IDcwZWRmNTBmY2U0NDRhNzA2ZWI1YzY5NzM1YzM1YzE4MzhlNGVhZWUKeGVu
ZF9jb25maWdfZm9ybWF0wqDCoMKgwqAgOiA0CgpCZXN0LCBPbGl2ZXIKCg==
--------------D0BBEA754AD91EDEC9AA23AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>got the recommendation from the freenode xen IRC channel to open
      a ticket here. Hoping that's ok.</p>
    <p>Problem:</p>
    <p>I want to provide a second bridge to a HVM Linux DomU. But as
      soon as I add this to the DomU config file the DomU doesn't start
      and the qemu log file does state</p>
    <p><b>qemu-system-i386: -device
        rtl8139,id=3Dnic1,netdev=3Dnet1,mac=3D00:16:3e:35:af:af: xen: fai=
led
        to populate ram at 1100c0000</b> (same with e1000)</p>
    <p>Providing only one bridge does work fine. Since I couldn't find
      anything meaningful to me on the Internet I'm asking here. Any
      help is highly appreciated.<br>
    </p>
    <p>root@HAM-XEN1:/etc/xen# lsb_release -a<br>
      No LSB modules are available.<br>
      Distributor ID: Ubuntu<br>
      Description:=C2=A0=C2=A0=C2=A0 Ubuntu 20.04.1 LTS<br>
      Release:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.04<br>
      Codename:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 focal</p>
    <p>root@HAM-XEN1:/etc/xen# uname -a<br>
      Linux HAM-XEN1 5.4.0-54-generic #60-Ubuntu SMP Fri Nov 6 10:37:59
      UTC 2020 x86_64 x86_64 x86_64 GNU/Linux<br>
    </p>
    <p>root@HAM-XEN1:/etc/xen# xl info<br>
      host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : HAM-XEN1<br>
      release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 5.4.0-54-generic<br>
      version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : #60-Ubuntu SMP Fri Nov 6 10:37:59 UTC
      2020<br>
      machine=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : x86_64<br>
      nr_cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16<br>
      max_cpu_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : 31<br>
      nr_nodes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : 1<br>
      cores_per_socket=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 8<br>
      threads_per_core=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 2<br>
      cpu_mhz=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 3593.326<br>
      hw_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
      178bf3ff:f6d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:0000=
0500<br>
      virt_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : hvm hvm_directio<br>
      total_memory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : 32699<br>
      free_memory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 7150<br>
      sharing_freed_memory=C2=A0=C2=A0 : 0<br>
      sharing_used_memory=C2=A0=C2=A0=C2=A0 : 0<br>
      outstanding_claims=C2=A0=C2=A0=C2=A0=C2=A0 : 0<br>
      free_cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : 0<br>
      xen_major=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : 4<br>
      xen_minor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : 11<br>
      xen_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : .4-pre<br>
      xen_version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 4.11.4-pre<br>
      xen_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : xen-3.0-x86_64 xen-3.0-x86_32p
      hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 <br>
      xen_scheduler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : credit<br>
      xen_pagesize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : 4096<br>
      platform_params=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : virt_st=
art=3D0xffff800000000000<br>
      xen_changeset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : <br>
      xen_commandline=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : placeho=
lder dom0_max_vcpus=3D2-3
      dom0_mem=3D1024M,max:2048M iommu=3Damd-iommu-global-intremap
      loglvl=3Dall guest_loglvl=3Dall quiet no-real-mode edd=3Doff<br>
      cc_compiler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : gcc (Ubuntu 9.2.1-31ubuntu3) 9.2.1
      20200306<br>
      cc_compile_by=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : ubuntu-devel-di<br>
      cc_compile_domain=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : lists.ubuntu.com<=
br>
      cc_compile_date=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : Tue Mar=
 10 09:04:06 UTC 2020<br>
      build_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : 70edf50fce444a706eb5c69735c35c1838e4eaee<br>
      xend_config_format=C2=A0=C2=A0=C2=A0=C2=A0 : 4<br>
    </p>
    <p>Best, Oliver<br>
    </p>
  </body>
</html>

--------------D0BBEA754AD91EDEC9AA23AB--

--XJ66UDMsWA5tAAePrOHIWa0o9qM0SktcF--

--f759fcgGUbWP7g50xGNMrNbMKsBX54s8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQG14HRX/gP3AY3+bqqsNqQA1FaigUCX8PMHgAKCRCqsNqQA1Fa
ilg0AJoClBHCBbkYeb54qHKtOIIwDtDGOACgnQ4GcTTAMsE13k5V+KDiilxI78Y=
=7dei
-----END PGP SIGNATURE-----

--f759fcgGUbWP7g50xGNMrNbMKsBX54s8c--

