Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BFE6FD3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 11:45:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP2TX-0000z0-KL; Mon, 28 Oct 2019 10:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8VQ8=YV=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iP2TW-0000yu-2p
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 10:42:14 +0000
X-Inumbo-ID: 99d33fa4-f96f-11e9-beca-bc764e2007e4
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99d33fa4-f96f-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 10:42:13 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id l3so6622039pgr.8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFJ1MADmTL2kSK7g+Rzc/3ZDGYhkkDKaXbc+r5jeHrY=;
 b=Sx8RJEH3SIfSZFfkb0xrBxBsU+0NnJQXkJUx0b3d9EycSyuePR6SoWAFA/bOEpbX0V
 raqvIZagxKYpciZip52uB33A79p3Zy6473eGE23J4GDQk9BIW2tKyfX9TlgpKWdwbltU
 1F5+vAioQf3ydXJDEFdvFSQiWBXhSOnq+8sPnqCEm8zoeJZrsep1+44A5TpSGYo1dqT4
 nUNxfVFXqJnGQRnvQVGDgzrUQCYdKm1oYDCJNazXIXgPgzECmqyrCfr4CSnNYhkVUp3A
 dBsLf3dTAVmUx8iSgk/ZiivCXtPiOXCo6VLzG+x0teU+FBJi6j7xFZsKGlFVPpc4hVgj
 +qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFJ1MADmTL2kSK7g+Rzc/3ZDGYhkkDKaXbc+r5jeHrY=;
 b=DiejPA3dTaiyv+/V50z9DEsftUpDzk+LFY6vw2NUVBGtp3HXFmQrEpU6gY0ZlpclP8
 tOjonU/y8xNovdas6PTddsYAEU7epw2FiWIjwwPh4yKMfr7C9Zuqt/mgf/8IzjE0Vhph
 03PtVOGakATqc8gunun37nai5J35V6oXD9Gz8D5rn/vNoly7GOJt5Zq4viQBudK1QdGg
 kJq+x8cffGL//pDT7dAqfEDaUbgVz9hICXFtjdWlj6P9slc/ONA9Ca+BS24U/mbGkMg1
 Cl6YnFffd6XnhJ4Dxqp+Lp7eUnwmgFXNTgm0FLPPS6sMjctbtTzonqcscQUDGqqYbxxd
 rflA==
X-Gm-Message-State: APjAAAWEm8zg3+tNKz1fE7kpYFn5mAuDgu4lrYrD3OHJ37denUD/D1a8
 juPznBCJwxxU04oPrjkg3LIWfCQIeR/qr7XTsYerq7/EYsxFGTBm
X-Google-Smtp-Source: APXvYqw9meYagvgaLS6PDdaXpPYL0HbvAUgZsSX2yNNNqEbeJNQJsGlUn1CZB9Rdv1m951fBkRqnp2dNaLZEe1gq4/s=
X-Received: by 2002:a63:cf4d:: with SMTP id b13mr19729469pgj.396.1572259332282; 
 Mon, 28 Oct 2019 03:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
 <7333496f-48e7-c659-5314-54feffde0273@suse.com>
In-Reply-To: <7333496f-48e7-c659-5314-54feffde0273@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 28 Oct 2019 10:42:01 +0000
Message-ID: <CACCGGhDpfQmg9es=yTiSDPuSaGW1W8wKJ0-hsTrhHx2_7MjSTQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Juergen Gross <JGross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOCBPY3QgMjAxOSBhdCAwOToyMSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IE9uIDI1LjEwLjIwMTkgMTk6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4gPiBPbiAyNC8xMC8yMDE5IDEyOjU3LCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cj4gPj4gSGkgYWxs
LAo+ID4+Cj4gPj4gSSd2ZSBtYW5hZ2VkIHRvIGdldCB0aGUgZ2l0IG1hc3RlciB2ZXJzaW9uIG9m
IFhlbiBvbiB0aGlzIGFmZmVjdGVkCj4gPj4gc3lzdGVtIGFuZCB0cmllcyB0byBib290IGEgV2lu
ZG93cyBTZXJ2ZXIgMjAxNiBzeXN0ZW0uIEl0IGNyYXNoZXMgYXMKPiA+PiBwZXIgbm9ybWFsLgo+
ID4+Cj4gPj4gSSBtYW5hZ2VkIHRvIGdldCB0aGVzZSBsb2dzLCBidXQgSSdtIG5vdCBxdWl0ZSBz
dXJlIHdoYXQgZWxzZSB0byBkbyB0bwo+ID4+IGRlYnVnIHRoaXMgaXNzdWUgZnVydGhlci4KPiA+
Cj4gPiBBZnRlciBhIGNvbGxhYm9yYXRpdmUgZGVidWdnaW5nIHNlc3Npb24gb24gSVJDLCB3ZSd2
ZSBpZGVudGlmaWVkIHRoZQo+ID4gcHJvYmxlbS4gIEhlcmUgaXMgYSBzdW1tYXJ5Lgo+ID4KPiA+
IGh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9BbWQvY29tbWVudHMvY2tyNWY0L2FtZF9yeXplbl8z
MDAwX3Nlcmllc19saW51eF9zdXBwb3J0X2FuZC8KPiA+IGlzIGNvbmNlcm5pbmcgS1ZNLCBidXQg
aXQgaWRlbnRpZmllZCB0aGF0IHRoZSBUT1BPRVhUIGZlYXR1cmUgd2FzCj4gPiBpbXBvcnRhbnQg
dG8gZ2V0dGluZyB3aW5kb3dzIHRvIGJvb3QuCj4gPgo+ID4gWGVuIGRvZXNuJ3QgY3VycmVudGx5
IG9mZmVyIFRPUE9FWFQgdG8gZ3Vlc3RzIGF0IGFsbC4gIEZpeGluZyB0aGlzIGlzIG9uCj4gPiB0
aGUgVE9ETyBsaXN0IGFsb25nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHRvcG9sb2d5IHJlcHJlc2Vu
dGF0aW9uIHN3YW1wLgo+ID4KPiA+IE9uIGEgaHVuY2gsIEkgb2ZmZXJlZCB1cCBhIFhlblNlcnZl
ciBwYXRjaCB3aGljaCB3ZSBhcmUgc3RpbGwgdXNpbmcsIGluCj4gPiBsaWV1IG9mIGZpeGluZyB0
b3BvbG9neSBwcm9wZXJseS4gIEl0IGlzIGxvZ2ljYWxseSBhIHJldmVydCBvZgo+ID4gY2EyZWVl
OTJkZjQ0IGFzIHRoYXQgY2hhbmdlIHdhc24ndCBtaWdyYXRpb24gc2FmZS4KPgo+IFdvdWxkIHlv
dSBtaW5kIGhlbHBpbmcgbWUgdW5kZXJzdGFuZCBob3cgdGhpcyByZXZlcnQgbWF0Y2hlcyB1cCB3
aXRoCj4geW91IHNheWluZyBhYm92ZSB0aGF0IFRPUE9FWFQgaXMgbmVlZGVkIGZvciBXaW5kb3dz
IHRvIGJvb3QgaGVyZT8gSQo+IGRvbid0IHRoaW5rIEkgY2FuIGNvbmNsdWRlIGFueXRoaW5nIGlu
IHRoaXMgZGlyZWN0aW9uIGZyb20gdGhlIGFydGljbGUKPiB5b3UndmUgcHJvdmlkZWQgdGhlIGxp
bmsgb2YuCj4KCk5vLCBJIGNvdWxkbid0IHF1aXRlIHNlZSB0aGF0LiBHb29nbGUgZm91bmQgbWUK
aHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMDMvbXNn
MDM2ODQuaHRtbAp3aGljaCBzdWdnZXN0cyB0aGF0IHRvcG9leHQgZGVhbHMgd2l0aCBjYWNoZSB0
b3BvbG9neSBpbmZvcm1hdGlvbiwKcmF0aGVyIHRoYW4gYmVpbmcgdG8gZG8gd2l0aCBjb3Jlcy90
aHJlYWRzLiBJcyBXaW5kb3dzIHNpbXBseSBhc3N1bWluZwp0aGUgZXhpc3RlbmNlIG9mIHRoZSBp
bmZvLiBiZWNhdXNlIGl0IGlzIHNlZWluZyB0aGUgbW9kZWwvZmFtaWx5IG9mCnRoZSBwaHlzaWNh
bCBDUFUgYW5kIHRoZW4gZ2V0dGluZyB1cHNldCBiZWNhdXNlIGl0J3Mgbm90IHRoZXJlPwoKICBQ
YXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
