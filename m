Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF219595
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 01:07:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOs4n-0007Cc-TR; Thu, 09 May 2019 23:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=przs=TJ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hOs4l-0007CX-Kf
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 23:03:43 +0000
X-Inumbo-ID: aeae655e-72ae-11e9-a9fb-8ffde5bb096b
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeae655e-72ae-11e9-a9fb-8ffde5bb096b;
 Thu, 09 May 2019 23:03:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1557443019; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=dguiUlchMOgqz21ihL08/9z1z84Knij3f2DadGHjmrw=;
 b=Y822rLjYfMRltQaGW0JbGwTMQSeKQQ2Grhu9pTQ9V4TaULeLNVzVaDekG/XXZTqqA+rp1C3h
 S/adKlWHl27N+DcVu/XBXVsmSLg9xAa3ELWekYD/K9z+T5q4fNRkbgxh8wxMWDFJdWWRGfBh
 HaxGonhdiM/WTbuGVOqJv7E2LLY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5cd4b1ca.7f1de5d06870-smtp-out-n03;
 Thu, 09 May 2019 23:03:38 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r4so5185056wro.10
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 16:03:38 -0700 (PDT)
X-Gm-Message-State: APjAAAURecZS3QGeFj7SZVJGiQfmqQYZu3yZ04hfKf+vV6YLwnWoeyTD
 Z2OrKpjCwwzBheyERZHevUuCaMX0ITZRGfc/Bhk=
X-Google-Smtp-Source: APXvYqwDkLzgKZBy7HeF3Mwcq1Nh04Vaav0oEKV25/gag/s2wo1Yx2Lfcj2Kcs+ebKCgZ0p1KpjAF2bgY/AeabSCU/A=
X-Received: by 2002:a5d:4fd2:: with SMTP id h18mr5229881wrw.117.1557443017626; 
 Thu, 09 May 2019 16:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
 <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
 <CABfawhn-Qhjr3ES=g2n9kskauXC0JV9eoQBAZ23U-0cHR8YsNQ@mail.gmail.com>
 <596cae03-a96b-0521-7a08-4e91f02460fe@citrix.com>
In-Reply-To: <596cae03-a96b-0521-7a08-4e91f02460fe@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 May 2019 17:03:01 -0600
X-Gmail-Original-Message-ID: <CABfawhmyzW9bnVyV-JV7ecXO+d7sgz9iV4CgF=0fAQ-PtaLpsg@mail.gmail.com>
Message-ID: <CABfawhmyzW9bnVyV-JV7ecXO+d7sgz9iV4CgF=0fAQ-PtaLpsg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCA0OjU0IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDkvMDUvMjAxOSAyMzozNCwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgOSwgMjAxOSBhdCAzOjUwIFBNIFJhenZhbiBD
b2pvY2FydQo+ID4gPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4+IE9uIDUv
MTAvMTkgMTI6MzEgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4+IFdoYXQgd2UnbGwgaGF2
ZSB0byBkbyBpcyBlbmQgdXAgaW4gYSBwb3NpdGlvbiB3aGVyZSB3ZSBjYW4gaGF2ZSBzb21lCj4g
Pj4+IHJlYWwgJWRyIHNldHRpbmdzIGdpdmVuIGJ5IHRoZSBWTUkgYWdlbnQsIGFuZCBzb21lIHNo
YWRvdyAlZHIgc2V0dGluZ3MKPiA+Pj4gd2hpY2ggdGhlIGd1ZXN0IGludGVyYWN0cyB3aXRoLiAg
QWxzbyBJIHNob3VsZCB3YXJuIHlvdSBhdCB0aGlzIHBvaW50Cj4gPj4+IHRoYXQsIGJlY2F1c2Ug
b2YgaG93IHRoZSByZWdpc3RlcnMgd29yaywgSXQgd2lsbCBub3QgYmUgcG9zc2libGUgdG8gaGF2
ZQo+ID4+PiBndWVzdC1zaGFkb3dlZCAlZHIgZnVuY3Rpb25pbmcgYXQgdGhlIHNhbWUgdGltZSBh
cyBWTUktcHJvdmlkZWQgJWRyCj4gPj4+IHNldHRpbmdzLgo+ID4+Pgo+ID4+PiBJIGd1ZXNzIHRo
ZSBtYWluIHVzZWNhc2UgaGVyZSBpcyBzaW1wbHkgaGlkaW5nIGZyb20gdGhlIGd1ZXN0IGtlcm5l
bAo+ID4+PiB0aGF0IGRlYnVnZ2luZyBhY3Rpdml0aWVzIGFyZSBpbiB1c2UsIGFuZCB3ZSBhcmUg
b2sgdG8gYnJlYWsgdGhlIHJlYWwKPiA+Pj4gdXNlIG9mIGdkYi9vdGhlciBpbnNpZGUgdGhlIGd1
ZXN0PyAgUmF6dmFuL1RhbWFzOiBBcyB5b3VyIHRoZQo+ID4+PiBtYWludGFpbmVycywgaXQgaXMg
eW91ciBjYWxsLCB1bHRpbWF0ZWx5Lgo+ID4+IFdoYXQgd29ycmllcyBtZSBoZXJlIGlzIHRoYXQg
aW4gdGhhdCBjYXNlIGl0IGJlY29tZXMgZWFzaWVyIGZvciBhIHJvZ3VlCj4gPj4gYXBwbGljYXRp
b24gaW5zaWRlIHRoZSBndWVzdCB0byBmaWd1cmUgb3V0IHRoYXQgdGhlIGd1ZXN0J3MgYmVpbmcK
PiA+PiBtb25pdG9yZWQsIGlmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5Lgo+ID4+Cj4g
Pj4gT2YgY291cnNlLCBhIGRvbTAgaW50cm9zcGVjdGlvbiBhZ2VudCBtYXkgY2hvb3NlIHRvIHNp
bXBseSBub3Qgc3Vic2NyaWJlCj4gPj4gdG8gRFIgZXZlbnRzLCBhbmQgdGh1cyBub3QgYWx0ZXIg
dGhlIGN1cnJlbnQgZmxvdyBhdCBhbGwsIHdoaWNoIG1ha2VzCj4gPj4gdGhpbmdzIGJldHRlci4K
PiA+IEkgYWdyZWUsIGlkZWFsbHkgbm9uZSBvZiB0aGUgVk1JIGV2ZW50cyBzaG91bGQgYWx0ZXIg
dGhlIGd1ZXN0cycKPiA+IGFiaWxpdHkgdG8gZG8gYW55dGhpbmcgaXQgbm9ybWFsbHkgY2FuIGFu
ZCB0aGUgVk1JIGV2ZW50cyBzaG91bGQgb25seQo+ID4gYWRkIG92ZXJoZWFkIChhbmQgb2YgY291
cnNlIHRoZSBjYWNoZSBzaWRlLWVmZmVjdHMgdGhhdCBhcmUKPiA+IGRldGVjdGFibGUpLiBUaGF0
IHNhaWQsIHNpbmNlIHRoZSB1c2VjYXNlIGZvciBNYXRoaWV1IGlzIG9uZSB3aGVyZSBoZQo+ID4g
Y2FuIGxpdmUgd2l0aCB0aGUgZ3Vlc3Qgbm90IGJlaW5nIGFibGUgdG8gcnVuIGEgZGVidWdnZXIs
IEkgd291bGQKPiA+IHN0aWxsIGFjY2VwdCB0aGUgcGF0Y2ggYXMgbG9uZyBhcyB0aGVyZSBpcyBh
biBleHBsaWNpdCBjb21tZW50Cj4gPiBkb2N1bWVudGluZyBpdHMgbGltaXRhdGlvbi4gV2UgY2Fu
IHdvcnJ5IGFib3V0IGZpZ3VyaW5nIG91dCBob3cgdG8KPiA+IG1ha2UgdGhlIGV2ZW50IHRyYW5z
cGFyZW50IGlmZiB0aGF0IGJlY29tZXMgbmVlZGVkIGZvciBzb21lIG90aGVyCj4gPiB1c2VjYXNl
Lgo+Cj4gSXQgaXMgbm90IHBvc3NpYmxlIHRvIHNoYXJlIHVzZSBvZiB0aGUgZGVidWdnaW5nIGZh
Y2lsaXRpZXMsCj4gaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgeW91IHdpc2ggdG8gaGlkZSB0aGUg
c2hhcmluZyBmcm9tIHRoZSBndWVzdCBrZXJuZWwuCj4KPiBEZXBlbmRpbmcgb24gZXhhY3RseSB3
aGF0IHRoZSBWTUkgYWdlbnQgd2FudHMgdG8gZG8sIGl0IGNvdWxkIHNlZSBhYm91dAo+IGNvbnRl
eHQgc3dpdGNoaW5nIHRoZSBoaWRkZW4tYWN0aXZlIHNldHRpbmdzIGJlaGluZCB0aGUgYmFjayBv
ZiB0aGUKPiBrZXJuZWwsIGUuZy4gaWYgb25lIHByb2Nlc3MgaXMgZGVidWdnaW5nIGl0c2VsZiwg
YnV0IHRoZSBWTUkgYWdlbnQgd2FudHMKPiB0byB0cmFuc3BhcmVudGx5IGRlYnVnIGFub3RoZXIu
Cj4KPiBIb3dldmVyLCBpZiBib3RoIHRoZSBndWVzdCBhbmQgVk1JIGFnZW50IHdhbnQgdG8gdXNl
IHRoZSBkZWJ1Z2dpbmcKPiBmYWNpbGl0aWVzLCBvbmUgaXMgZ29pbmcgdG8gaGF2ZSB0byByZWxp
bnF1aXNoIHVzZS4gIEl0IHNob3VsZCBiZQo+IHBvc3NpYmxlIGZvciB0aGUgVk1JIGFnZW50IHRv
IGNsZWFubHkgZGV0YWNoIGl0cyBoaWRkZW4gc2V0dGluZ3MuCgpSaWdodCwgbGlrZSByZWxpbnF1
aXNoaW5nIHRoZSBoYXJkd2FyZSBicmVha3BvaW50cyBhbmQgc3dpdGNoaW5nIHRvCnNvZnR3YXJl
IGJyZWFrcG9pbnRzIGluc3RlYWQuCgo+IEVpdGhlciB3YXksIGV2ZXJ5dGhpbmcgY29tZXMgZG93
biB0byB3aGF0IGJlaGF2aW91ciBpcyB3YW50ZWQgdG8gc3RhcnQgd2l0aC4KCkFzIEkgc2FpZCwg
SSB0aGluayBhZGRpbmcgdGhhdCBtb25pdG9yaW5nIGNhcGFiaWxpdHkgaXMgZmluZSBhcyBsb25n
CmFzIGl0cyBsaW1pdGF0aW9uIGlzIGNsZWFybHkgZG9jdW1lbnRlZC4KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
