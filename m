Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FDEB511F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:12:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAF79-00081F-He; Tue, 17 Sep 2019 15:09:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kgQ4=XM=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iAF78-000816-1z
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:09:58 +0000
X-Inumbo-ID: 357a8698-d95d-11e9-a337-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 357a8698-d95d-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 15:09:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1568732997; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=jDLu4iTet+tS4HNDRKtlkDIIx1gzZICox7XRQSxCwnY=;
 b=FeW0LfOb7nuOFEJreyVn1UjZuzM/G4EwX+p7UlZq46UdtrqGnDZ5/4cMLpa/nTVkMcdktMIu
 qRtOunTk5rn+972O/MxHVYZrjNQ5zfTnPipT3pjRvZCh6J1Z3+fHPQKxn+RoV6u5g4ik/W0Q
 /c8apu05pFDM8U8dLam9pZ6iAKw=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5d80f742.7ff563b20f30-smtp-out-n02;
 Tue, 17 Sep 2019 15:09:54 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i1so3580723wro.4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2019 08:09:54 -0700 (PDT)
X-Gm-Message-State: APjAAAVWoSYscmROKKhjluETLxXKes3KJfUA1u3WuGnIbmLutjPI365z
 TOxhW20KiCapnWADA7me7z209eQIXRSL6D9l48c=
X-Google-Smtp-Source: APXvYqyJvJE5esxsmDdk53Rqkqslwqd2PxCHHOcie9aLioWOIan0lUxboJCS9kFRbNZue5UwM11XOnC5R9nDp919Kk4=
X-Received: by 2002:adf:f607:: with SMTP id t7mr3229459wrp.60.1568732992641;
 Tue, 17 Sep 2019 08:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
In-Reply-To: <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Sep 2019 09:09:16 -0600
X-Gmail-Original-Message-ID: <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
Message-ID: <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgODoyNCBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiYnUuYml0ZGVmZW5kZXIuYml6PiB3cm90ZToKPgo+IE9uIDkvMTcvMTkgNToxMSBQTSwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gPj4+Pj4gK2Jvb2wgaHZtX21vbml0b3JfY2hl
Y2tfcDJtKHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsCj4gPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGtpbmQpCj4gPj4+Pj4gK3sK
PiA+Pj4+PiArICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7Cj4gPj4+Pj4gKyAgICB2bV9ldmVu
dF9yZXF1ZXN0X3QgcmVxID0ge307Cj4gPj4+Pj4gKyAgICBwYWRkcl90IGdwYSA9IChnZm5fdG9f
Z2FkZHIoZ2ZuKSB8IChnbGEgJiB+UEFHRV9NQVNLKSk7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsgICAg
QVNTRVJUKGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQpOwo+ID4+Pj4+ICsKPiA+
Pj4+PiArICAgIGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxzZTsKPiA+
Pj4+PiArCj4gPj4+Pj4gKyAgICBpZiAoIHAybV9nZXRfbWVtX2FjY2VzcyhjdXJyZW50LT5kb21h
aW4sIGdmbiwgJmFjY2VzcywKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFs
dHAybV92Y3B1X2lkeChjdXJyZW50KSkgIT0gMCApCj4gPj4+Pj4gKyAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4+Pj4gLi4uIG5leHQgdG8gdGhlIGNhbGwgaGVyZSAoYnV0IHRoZSBtYWludGFpbmVy
cyBvZiB0aGUgZmlsZSB3b3VsZAo+ID4+Pj4gaGF2ZSB0byBqdWRnZSBpbiB0aGUgZW5kKS4gVGhh
dCBzYWlkLCBJIGNvbnRpbnVlIHRvIG5vdCB1bmRlcnN0YW5kCj4gPj4+PiB3aHkgYSBub3QgZm91
bmQgZW50cnkgbWVhbnMgdW5yZXN0cmljdGVkIGFjY2Vzcy4gSXNuJ3QgaXQKPiA+Pj4+IC0+ZGVm
YXVsdF9hY2Nlc3Mgd2hpY2ggY29udHJvbHMgd2hhdCBzdWNoIGEgInZpcnR1YWwiIGVudHJ5IHdv
dWxkCj4gPj4+PiBwZXJtaXQ/Cj4gPj4+IEknbSBzb3JyeSBmb3IgdGhpcyBtaXNsZWFkaW5nIGNv
bW1lbnQuIFRoZSBjb2RlIHN0YXRlcyB0aGF0IGlmIGVudHJ5IHdhcwo+ID4+PiBub3QgZm91bmQg
dGhlIGFjY2VzcyB3aWxsIGJlIGRlZmF1bHRfYWNjZXNzIGFuZCByZXR1cm4gMC4gU28gaW4gdGhp
cwo+ID4+PiBjYXNlIHRoZSBkZWZhdWx0X2FjY2VzcyB3aWxsIGJlIGNoZWNrZWQuCj4gPj4+Cj4g
Pj4+IC8qIElmIHJlcXVlc3QgdG8gZ2V0IGRlZmF1bHQgYWNjZXNzLiAqLwo+ID4+PiBpZiAoIGdm
bl9lcShnZm4sIElOVkFMSURfR0ZOKSApCj4gPj4+IHsKPiA+Pj4gICAgICAgICphY2Nlc3MgPSBt
ZW1hY2Nlc3NbcDJtLT5kZWZhdWx0X2FjY2Vzc107Cj4gPj4+ICAgICAgICByZXR1cm4gMDsKPiA+
Pj4gfQo+ID4+Pgo+ID4+PiBJZiB0aGlzIGNsZWFycyB0aGluZyB1cCBJIGNhbiByZW1vdmUgdGhl
ICJOT1RFIiBwYXJ0IGlmIHRoZSBjb21tZW50Lgo+ID4+IEknbSBhZnJhaWQgaXQgZG9lc24ndCBj
bGVhciB0aGluZ3MgdXA6IEknbSBzdGlsbCBsb3N0IGFzIHRvIHdoeQo+ID4+ICJlbnRyeSBub3Qg
Zm91bmQiIGltcGxpZXMgImZ1bGwgYWNjZXNzIi4gQW5kIEknbSBmdXJ0aGVyIGxvc3QgYXMKPiA+
PiB0byB3aGF0IHRoZSBjb2RlIGZyYWdtZW50IGFib3ZlIChkZWFsaW5nIHdpdGggSU5WQUxJRF9H
Rk4sIGJ1dAo+ID4+IG5vdCByZWFsbHkgdGhlICJlbnRyeSBub3QgZm91bmQiIGNhc2UsIHdoaWNo
IHdvdWxkIGJlIElOVkFMSURfTUZOCj4gPj4gY29taW5nIGJhY2sgZnJvbSBhIHRyYW5zbGF0aW9u
KSBpcyBzdXBwb3NlZCB0byB0ZWxsIG1lLgo+ID4+Cj4gPiBJdCBpcyBzYWZlIGVub3VnaCB0byBj
b25zaWRlciBhIGludmFsaWQgbWZuIGZyb20gaG9zdHAyIHRvIGJlIGEKPiA+IHZpb2xhdGlvbi4g
VGhlcmUgaXMgc3RpbGwgYSBzbWFsbCBwcm9ibGVtIHdpdGggaGF2aW5nIHRoZSBhbHRwMm0gdmll
dwo+ID4gbm90IGhhdmluZyB0aGUgcGFnZSBwcm9wYWdhdGVkIGZyb20gaG9zdHAybS4gSW4gdGhp
cyBjYXNlIHdlIGhhdmUgdG8gdXNlCj4gPiBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeSgpLgo+
Cj4gSW4gdGhlIGFic2VuY2Ugb2YgY2xlYXIgZ3VpZGFuY2UgZnJvbSB0aGUgSW50ZWwgU0RNIG9u
IHdoYXQgdGhlIGhhcmR3YXJlCj4gZGVmYXVsdCBpcyBmb3IgYSBwYWdlIG5vdCBwcmVzZW50IGlu
IHRoZSBwMm0sIHdlIHNob3VsZCBwcm9iYWJseSBmb2xsb3cKPiBKYW4ncyBhZHZpY2UgYW5kIGNo
ZWNrIHZpb2xhdGlvbnMgYWdhaW5zdCBkZWZhdWx0X2FjY2VzcyBmb3Igc3VjaCBwYWdlcy4KClRo
ZSBTRE0gaXMgdmVyeSBjbGVhciB0aGF0IHBhZ2VzIHRoYXQgYXJlIG5vdCBwcmVzZW50IGluIHRo
ZSBFUFQgYXJlIGEKdmlvbGF0aW9uOgoKMjguMi4yCkFuIEVQVCBwYWdpbmctc3RydWN0dXJlIGVu
dHJ5IGlzIHByZXNlbnQgaWYgYW55IG9mIGJpdHMgMjowIGlzIDE7Cm90aGVyd2lzZSwgdGhlIGVu
dHJ5IGlzIG5vdCBwcmVzZW50LiBUaGUgcHJvY2Vzc29yCmlnbm9yZXMgYml0cyA2MjozIGFuZCB1
c2VzIHRoZSBlbnRyeSBuZWl0aGVyIHRvIHJlZmVyZW5jZSBhbm90aGVyIEVQVApwYWdpbmctc3Ry
dWN0dXJlIGVudHJ5IG5vciB0byBwcm9kdWNlIGEKcGh5c2ljYWwgYWRkcmVzcy4gQSByZWZlcmVu
Y2UgdXNpbmcgYSBndWVzdC1waHlzaWNhbCBhZGRyZXNzIHdob3NlCnRyYW5zbGF0aW9uIGVuY291
bnRlcnMgYW4gRVBUIHBhZ2luZy1zdHJ1Yy0KdHVyZSB0aGF0IGlzIG5vdCBwcmVzZW50IGNhdXNl
cyBhbiBFUFQgdmlvbGF0aW9uIChzZWUgU2VjdGlvbiAyOC4yLjMuMikuCgoyOC4yLjMuMgpFUFQg
VmlvbGF0aW9ucwpBbiBFUFQgdmlvbGF0aW9uIG1heSBvY2N1ciBkdXJpbmcgYW4gYWNjZXNzIHVz
aW5nIGEgZ3Vlc3QtcGh5c2ljYWwKYWRkcmVzcyB3aG9zZSB0cmFuc2xhdGlvbiBkb2VzIG5vdCBj
YXVzZSBhbgpFUFQgbWlzY29uZmlndXJhdGlvbi4gQW4gRVBUIHZpb2xhdGlvbiBvY2N1cnMgaW4g
YW55IG9mIHRoZSBmb2xsb3dpbmcKc2l0dWF0aW9uczoK4oCiIFRyYW5zbGF0aW9uIG9mIHRoZSBn
dWVzdC1waHlzaWNhbCBhZGRyZXNzIGVuY291bnRlcnMgYW4gRVBUCnBhZ2luZy1zdHJ1Y3R1cmUg
ZW50cnkgdGhhdCBpcyBub3QgcHJlc2VudCAoc2VlClNlY3Rpb24gMjguMi4yKS4KClRhbWFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
