Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1154ED872D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 06:18:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKahX-0003dr-Jt; Wed, 16 Oct 2019 04:14:19 +0000
Resent-Date: Wed, 16 Oct 2019 04:14:19 +0000
Resent-Message-Id: <E1iKahX-0003dr-Jt@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IYuL=YJ=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1iKahV-0003dk-Gx
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 04:14:17 +0000
X-Inumbo-ID: 697d0e14-efcb-11e9-beca-bc764e2007e4
Received: from sender4-of-o54.zoho.com (unknown [136.143.188.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 697d0e14-efcb-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 04:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1571199230; cv=none; d=zoho.com; s=zohoarc; 
 b=U8dZk1H6yu9rfgOPOK2FLSPy/OwJUs4u/kV6xgPXnaSt77J97VAlECF5HOGR0sXC67omzLAwfFSpXCLHTBc55JO1jhwODS2zPENr77idzdksjQK6q2BIhGCQqafgEmXCrzayAHgrLZf7t1YioMZpCGw8m0NeP1lqA6fDeJPFWgU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1571199230;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+jND/LegwPAicL7+Y3xp96y+HEfeFXtu1h0GmSvfQgM=; 
 b=eJXbyX/JKkrUrze5japMaQyH5u1sPzR3uPsbcuM6Rxw+W9P/22B9VZxLihMUnwZE7sBBRIScRUMKuyJtj0mjQuRDv5m8CP0PHq+0nMroE3K6Hue/3DXGUZq6pRd57UfuO8cxEoYx4yX2YjgUxl4ULTql9uZKjZtHdWaqxPFvR/8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1571199227575731.7861531042065;
 Tue, 15 Oct 2019 21:13:47 -0700 (PDT)
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
Message-ID: <157119922523.5946.13253429873316869476@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Tue, 15 Oct 2019 21:13:47 -0700 (PDT)
X-ZohoMailClient: External
Subject: Re: [Xen-devel] [PATCH 00/32] hw/i386/pc: Split PIIX3 southbridge
 from i440FX northbridge
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: lvivier@redhat.com, thuth@redhat.com, sstabellini@kernel.org,
 ehabkost@redhat.com, kvm@vger.kernel.org, paul@xen.org, mst@redhat.com,
 qemu-devel@nongnu.org, imammedo@redhat.com, hpoussin@reactos.org,
 amarkovic@wavecomp.com, xen-devel@lists.xenproject.org,
 anthony.perard@citrix.com, pbonzini@redhat.com, aleksandar.rikalo@rt-rk.com,
 philmd@redhat.com, aurelien@aurel32.net, rth@twiddle.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAxNTE2MjcwNS4yODA4
Ny0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUEFUQ0ggMDAvMzJdIGh3L2kzODYvcGM6IFNwbGl0IFBJSVgz
IHNvdXRoYnJpZGdlIGZyb20gaTQ0MEZYIG5vcnRoYnJpZGdlClR5cGU6IHNlcmllcwpNZXNzYWdl
LWlkOiAyMDE5MTAxNTE2MjcwNS4yODA4Ny0xLXBoaWxtZEByZWRoYXQuY29tCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmUyOGZj
MDcgaHcvcGNpLWhvc3QvaTQ0MGZ4OiBSZW1vdmUgdGhlIGxhc3QgUElJWDMgdHJhY2VzCjQyNzhm
YzUgaHcvcGNpLWhvc3Q6IFJlbmFtZSBpbmNvcnJlY3RseSBuYW1lZCAncGlpeCcgYXMgJ2k0NDBm
eCcKYjViYjExYyBody9wY2ktaG9zdC9waWl4OiBFeHRyYWN0IFBJSVgzIGZ1bmN0aW9ucyB0byBo
dy9pc2EvcGlpeDMuYwoyNTZiNjRkIGh3L3BjaS1ob3N0L3BpaXg6IEZpeCBjb2RlIHN0eWxlIGlz
c3VlcwplMmUzOGQ4IGh3L3BjaS1ob3N0L3BpaXg6IE1vdmUgaTQ0MEZYIGRlY2xhcmF0aW9ucyB0
byBody9wY2ktaG9zdC9pNDQwZnguaAplYzNlMGU3IGh3L3BjaS1ob3N0L3BpaXg6IERlZmluZSBh
bmQgdXNlIHRoZSBQSUlYIElSUSBSb3V0ZSBDb250cm9sIFJlZ2lzdGVycwo3ZGEwZGM0IGh3L3Bj
aS1ob3N0L3BpaXg6IE1vdmUgUkNSX0lPUE9SVCByZWdpc3RlciBkZWZpbml0aW9uCmRlMmY4M2Ig
aHcvcGNpLWhvc3QvcGlpeDogRXh0cmFjdCBwaWl4M19jcmVhdGUoKQoxZjMzYTE2IGh3L2kzODYv
cGM6IFJlbW92ZSBrdm1faTM4Ni5oIGluY2x1ZGUKMTIwYmY2NCBody9pMzg2L3BjOiBFeHRyYWN0
IHBjX2k4MjU5X2NyZWF0ZSgpCjdmNGFlZDYgaHcvaTM4Ni9wYzogTW92ZSBnc2lfc3RhdGUgY3Jl
YXRpb24gY29kZQphZjA4NjNjIGh3L2kzODYvcGM6IFJlZHVjZSBnc2lfaGFuZGxlciBzY29wZQph
M2Y5YWQ5IGh3L2kzODYvcGM6IEV4dHJhY3QgcGNfZ3NpX2NyZWF0ZSgpCjkzM2QxY2QgaHcvaXNh
L3BpaXg0OiBNb3ZlIHBpaXg0X2NyZWF0ZSgpIHRvIGh3L2lzYS9waWl4NC5jCjIyM2M3MDEgaHcv
bWlwcy9taXBzX21hbHRhOiBFeHRyYWN0IHRoZSBQSUlYNCBjcmVhdGlvbiBjb2RlIGFzIHBpaXg0
X2NyZWF0ZSgpCjNkYjA1NzQgaHcvbWlwcy9taXBzX21hbHRhOiBDcmVhdGUgSURFIGhhcmQgZHJp
dmUgYXJyYXkgZHluYW1pY2FsbHkKNTkyMjViOSBwaWl4NDogYWRkIGEgbWMxNDY4MThydGMgY29u
dHJvbGxlciBhcyBzcGVjaWZpZWQgaW4gZGF0YXNoZWV0CmRhMDFkNTkgcGlpeDQ6IGFkZCBhIGk4
MjU0IHBpdCBjb250cm9sbGVyIGFzIHNwZWNpZmllZCBpbiBkYXRhc2hlZXQKNDA1MThkYiBwaWl4
NDogYWRkIGEgaTgyNTcgZG1hIGNvbnRyb2xsZXIgYXMgc3BlY2lmaWVkIGluIGRhdGFzaGVldAow
MTVkZTcxIHBpaXg0OiBjb252ZXJ0IHJlc2V0IGZ1bmN0aW9uIHRvIFFPTQozYTY4YzhmIHBpaXg0
OiByZW5hbWUgUElJWDQgb2JqZWN0IHRvIHBpaXg0LWlzYQpkYTUxYzUyIFJldmVydCAiaXJxOiBp
bnRyb2R1Y2UgcWVtdV9pcnFfcHJveHkoKSIKOGNkZWFjZiBwaWl4NDogYWRkIGEgaTgyNTkgaW50
ZXJydXB0IGNvbnRyb2xsZXIgYXMgc3BlY2lmaWVkIGluIGRhdGFzaGVldAplY2M5MmMyIHBpaXg0
OiBhZGQgUmVzZXQgQ29udHJvbCBSZWdpc3RlcgpjMmNkNTU2IHBpaXg0OiByZW5hbWUgc29tZSB2
YXJpYWJsZXMgaW4gcmVhbGl6ZSBmdW5jdGlvbgo2N2Q5YmU1IE1BSU5UQUlORVJTOiBLZWVwIFBJ
SVg0IFNvdXRoIEJyaWRnZSBzZXBhcmF0ZSBmcm9tIFBDIENoaXBzZXRzCjA1NjdlOWQgbWMxNDY4
MThydGM6IGFsd2F5cyByZWdpc3RlciBydGMgdG8gcnRjIGxpc3QKM2Q5ODk3YSBtYzE0NjgxOHJ0
YzogSW5jbHVkZSAibWMxNDY4MThydGNfcmVncy5oIiBkaXJlY3RseSBpbiBtYzE0NjgxOHJ0Yy5j
CjRjMGZkZTAgbWMxNDY4MThydGM6IE1vdmUgUlRDX0lTQV9JUlEgZGVmaW5pdGlvbgoxYTg0Mjdl
IG1jMTQ2ODE4cnRjOiBtb3ZlIHN0cnVjdHVyZSB0byBoZWFkZXIgZmlsZQowZTY1OTU2IGh3L2kz
ODYvcGM6IE1vdmUga3ZtX2k4MjU5X2luaXQoKSBkZWNsYXJhdGlvbiB0byBzeXNlbXUva3ZtLmgK
MDIwMWM5MCBody9pMzg2OiBSZW1vdmUgb2Jzb2xldGUgTG9hZFN0YXRlSGFuZGxlcjo6bG9hZF9z
dGF0ZV9vbGQgaGFuZGxlcnMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMzIgQ2hlY2tpbmcgY29t
bWl0IDAyMDFjOTBlOGFhZiAoaHcvaTM4NjogUmVtb3ZlIG9ic29sZXRlIExvYWRTdGF0ZUhhbmRs
ZXI6OmxvYWRfc3RhdGVfb2xkIGhhbmRsZXJzKQoyLzMyIENoZWNraW5nIGNvbW1pdCAwZTY1OTU2
M2JiZDIgKGh3L2kzODYvcGM6IE1vdmUga3ZtX2k4MjU5X2luaXQoKSBkZWNsYXJhdGlvbiB0byBz
eXNlbXUva3ZtLmgpCjMvMzIgQ2hlY2tpbmcgY29tbWl0IDFhODQyN2VjYWE5MiAobWMxNDY4MThy
dGM6IG1vdmUgc3RydWN0dXJlIHRvIGhlYWRlciBmaWxlKQo0LzMyIENoZWNraW5nIGNvbW1pdCA0
YzBmZGUwMGMxNTAgKG1jMTQ2ODE4cnRjOiBNb3ZlIFJUQ19JU0FfSVJRIGRlZmluaXRpb24pCjUv
MzIgQ2hlY2tpbmcgY29tbWl0IDNkOTg5N2FlMmNmMCAobWMxNDY4MThydGM6IEluY2x1ZGUgIm1j
MTQ2ODE4cnRjX3JlZ3MuaCIgZGlyZWN0bHkgaW4gbWMxNDY4MThydGMuYykKNi8zMiBDaGVja2lu
ZyBjb21taXQgMDU2N2U5ZGYwNzk1IChtYzE0NjgxOHJ0YzogYWx3YXlzIHJlZ2lzdGVyIHJ0YyB0
byBydGMgbGlzdCkKNy8zMiBDaGVja2luZyBjb21taXQgNjdkOWJlNTYxYzBjIChNQUlOVEFJTkVS
UzogS2VlcCBQSUlYNCBTb3V0aCBCcmlkZ2Ugc2VwYXJhdGUgZnJvbSBQQyBDaGlwc2V0cykKOC8z
MiBDaGVja2luZyBjb21taXQgYzJjZDU1NjFhZGY5IChwaWl4NDogcmVuYW1lIHNvbWUgdmFyaWFi
bGVzIGluIHJlYWxpemUgZnVuY3Rpb24pCjkvMzIgQ2hlY2tpbmcgY29tbWl0IGVjYzkyYzI2Nzhi
MCAocGlpeDQ6IGFkZCBSZXNldCBDb250cm9sIFJlZ2lzdGVyKQoxMC8zMiBDaGVja2luZyBjb21t
aXQgOGNkZWFjZmYzNGI1IChwaWl4NDogYWRkIGEgaTgyNTkgaW50ZXJydXB0IGNvbnRyb2xsZXIg
YXMgc3BlY2lmaWVkIGluIGRhdGFzaGVldCkKMTEvMzIgQ2hlY2tpbmcgY29tbWl0IGRhNTFjNTI0
N2QxZiAoUmV2ZXJ0ICJpcnE6IGludHJvZHVjZSBxZW11X2lycV9wcm94eSgpIikKMTIvMzIgQ2hl
Y2tpbmcgY29tbWl0IDNhNjhjOGY1ZmYzMCAocGlpeDQ6IHJlbmFtZSBQSUlYNCBvYmplY3QgdG8g
cGlpeDQtaXNhKQoxMy8zMiBDaGVja2luZyBjb21taXQgMDE1ZGU3MWI2ZTc1IChwaWl4NDogY29u
dmVydCByZXNldCBmdW5jdGlvbiB0byBRT00pCjE0LzMyIENoZWNraW5nIGNvbW1pdCA0MDUxOGRi
YmRjODIgKHBpaXg0OiBhZGQgYSBpODI1NyBkbWEgY29udHJvbGxlciBhcyBzcGVjaWZpZWQgaW4g
ZGF0YXNoZWV0KQoxNS8zMiBDaGVja2luZyBjb21taXQgZGEwMWQ1OTRkOGRkIChwaWl4NDogYWRk
IGEgaTgyNTQgcGl0IGNvbnRyb2xsZXIgYXMgc3BlY2lmaWVkIGluIGRhdGFzaGVldCkKMTYvMzIg
Q2hlY2tpbmcgY29tbWl0IDU5MjI1Yjk4ZDBkNiAocGlpeDQ6IGFkZCBhIG1jMTQ2ODE4cnRjIGNv
bnRyb2xsZXIgYXMgc3BlY2lmaWVkIGluIGRhdGFzaGVldCkKV0FSTklORzogYWRkZWQsIG1vdmVk
IG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMTky
OiAKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3Ms
IDE2NiBsaW5lcyBjaGVja2VkCgpQYXRjaCAxNi8zMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
LgoxNy8zMiBDaGVja2luZyBjb21taXQgM2RiMDU3NGNmNjVhIChody9taXBzL21pcHNfbWFsdGE6
IENyZWF0ZSBJREUgaGFyZCBkcml2ZSBhcnJheSBkeW5hbWljYWxseSkKMTgvMzIgQ2hlY2tpbmcg
Y29tbWl0IDIyM2M3MDE0OTBkMCAoaHcvbWlwcy9taXBzX21hbHRhOiBFeHRyYWN0IHRoZSBQSUlY
NCBjcmVhdGlvbiBjb2RlIGFzIHBpaXg0X2NyZWF0ZSgpKQoxOS8zMiBDaGVja2luZyBjb21taXQg
OTMzZDFjZGQ2Y2Y5IChody9pc2EvcGlpeDQ6IE1vdmUgcGlpeDRfY3JlYXRlKCkgdG8gaHcvaXNh
L3BpaXg0LmMpCjIwLzMyIENoZWNraW5nIGNvbW1pdCBhM2Y5YWQ5ODg3ZmYgKGh3L2kzODYvcGM6
IEV4dHJhY3QgcGNfZ3NpX2NyZWF0ZSgpKQoyMS8zMiBDaGVja2luZyBjb21taXQgYWYwODYzYzM1
Y2NiIChody9pMzg2L3BjOiBSZWR1Y2UgZ3NpX2hhbmRsZXIgc2NvcGUpCjIyLzMyIENoZWNraW5n
IGNvbW1pdCA3ZjRhZWQ2MTIyYmEgKGh3L2kzODYvcGM6IE1vdmUgZ3NpX3N0YXRlIGNyZWF0aW9u
IGNvZGUpCjIzLzMyIENoZWNraW5nIGNvbW1pdCAxMjBiZjY0YWU4OWMgKGh3L2kzODYvcGM6IEV4
dHJhY3QgcGNfaTgyNTlfY3JlYXRlKCkpCjI0LzMyIENoZWNraW5nIGNvbW1pdCAxZjMzYTE2Zjk2
NmUgKGh3L2kzODYvcGM6IFJlbW92ZSBrdm1faTM4Ni5oIGluY2x1ZGUpCjI1LzMyIENoZWNraW5n
IGNvbW1pdCBkZTJmODNiYTQxZTcgKGh3L3BjaS1ob3N0L3BpaXg6IEV4dHJhY3QgcGlpeDNfY3Jl
YXRlKCkpCjI2LzMyIENoZWNraW5nIGNvbW1pdCA3ZGEwZGM0MDM0ZTQgKGh3L3BjaS1ob3N0L3Bp
aXg6IE1vdmUgUkNSX0lPUE9SVCByZWdpc3RlciBkZWZpbml0aW9uKQoyNy8zMiBDaGVja2luZyBj
b21taXQgZWMzZTBlNzU1ZmE5IChody9wY2ktaG9zdC9waWl4OiBEZWZpbmUgYW5kIHVzZSB0aGUg
UElJWCBJUlEgUm91dGUgQ29udHJvbCBSZWdpc3RlcnMpCjI4LzMyIENoZWNraW5nIGNvbW1pdCBl
MmUzOGQ4NjllYzggKGh3L3BjaS1ob3N0L3BpaXg6IE1vdmUgaTQ0MEZYIGRlY2xhcmF0aW9ucyB0
byBody9wY2ktaG9zdC9pNDQwZnguaCkKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQg
ZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojOTc6IApuZXcgZmlsZSBt
b2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxMDEgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggMjgvMzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMjkvMzIgQ2hlY2tpbmcg
Y29tbWl0IDI1NmI2NGQyMmY5OSAoaHcvcGNpLWhvc3QvcGlpeDogRml4IGNvZGUgc3R5bGUgaXNz
dWVzKQozMC8zMiBDaGVja2luZyBjb21taXQgYjViYjExY2I0ZDg1IChody9wY2ktaG9zdC9waWl4
OiBFeHRyYWN0IFBJSVgzIGZ1bmN0aW9ucyB0byBody9pc2EvcGlpeDMuYykKV0FSTklORzogYWRk
ZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0
aW5nPwojNjQ6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBh
cm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiMzMTM6IEZJTEU6IGh3L2lzYS9waWl4My5jOjI0NToK
KyAgICAuc3Vic2VjdGlvbnMgPSAoY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uKltdKSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9y
cywgMSB3YXJuaW5ncywgOTM3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMwLzMyIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCgozMS8zMiBDaGVja2luZyBjb21taXQgNDI3OGZjNWYxYTc5IChody9w
Y2ktaG9zdDogUmVuYW1lIGluY29ycmVjdGx5IG5hbWVkICdwaWl4JyBhcyAnaTQ0MGZ4JykKV0FS
TklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBu
ZWVkIHVwZGF0aW5nPwojNjg6IApyZW5hbWUgZnJvbSBody9wY2ktaG9zdC9waWl4LmMKCnRvdGFs
OiAwIGVycm9ycywgMSB3YXJuaW5ncywgMzIgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMzEvMzIgaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwph
cmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMzIvMzIgQ2hlY2tpbmcgY29tbWl0IGUyOGZjMDdjYzdj
MSAoaHcvcGNpLWhvc3QvaTQ0MGZ4OiBSZW1vdmUgdGhlIGxhc3QgUElJWDMgdHJhY2VzKQo9PT0g
T1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1
bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MTAxNTE2
MjcwNS4yODA4Ny0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
