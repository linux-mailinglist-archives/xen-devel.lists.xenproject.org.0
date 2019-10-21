Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA4DEAEB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 13:28:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMVp8-00016z-CB; Mon, 21 Oct 2019 11:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMVp7-00016u-Ht
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 11:26:05 +0000
X-Inumbo-ID: 9126394e-f3f5-11e9-944e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9126394e-f3f5-11e9-944e-12813bfff9fa;
 Mon, 21 Oct 2019 11:26:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 25B31B55C;
 Mon, 21 Oct 2019 11:26:03 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-142973-mainreport@xen.org>
 <7002deb3-d5e2-19fa-0641-25eedac805a0@suse.com>
 <23981.37176.91376.271671@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5fe8c07e-bda3-c135-0f16-f88a5c81c0e2@suse.com>
Date: Mon, 21 Oct 2019 13:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <23981.37176.91376.271671@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 142973: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMTkgMTM6MDYsIElhbiBKYWNrc29uIHdyb3RlOgo+IErDvHJnZW4gR3Jvw58gd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQyOTczOiByZWdyZXNz
aW9ucyAtIEZBSUwiKToKPj4gT24gMjEuMTAuMTkgMTA6MjMsIG9zc3Rlc3Qgc2VydmljZSBvd25l
ciB3cm90ZToKPj4+IGZsaWdodCAxNDI5NzMgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4+PiBo
dHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyOTczLwo+
Pj4KPj4+IFJlZ3Jlc3Npb25zIDotKAo+Pj4KPj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2Vl
ZCBhbmQgYXJlIGJsb2NraW5nLAo+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBi
ZSBydW46Cj4+PiAgICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXB2c2hpbSAgIDE4IGd1ZXN0LWxvY2Fs
bWlncmF0ZS94MTAgICBmYWlsIFJFR1IuIHZzLiAxNDI3NTAKPj4KPj4gUm9nZXIsIEkgYmVsaWV2
ZSB5b3UgaGF2ZSBsb29rZWQgaW50byB0aGF0IG9uZT8KPj4KPj4gSSBndWVzcyB0aGUgY29udmVy
c2F0aW9uIHZpYSBJUkMgd2l0aCBJYW4gcmVnYXJkaW5nIHRoZSByYWNlIGJldHdlZW4KPj4gYmxr
YmFjayBhbmQgT1NTdGVzdCB3YXMgcmVsYXRlZCB0byB0aGUgaXNzdWU/Cj4gCj4gSSB0aGluayB0
aGlzIGZhaWx1cmUgaXMgc29tZXRoaW5nIGVsc2UuCj4gCj4gV2hhdCBoYXBwZW5zIGhlcmUgaXMg
dGhpczoKPiAKPiAyMDE5LTEwLTIxIDAyOjU4OjMyIFogZXhlY3V0aW5nIHNzaCAuLi4gLXYgcm9v
dEAxNzIuMTYuMTQ1LjIwNSBkYXRlCj4gW2JvdW5jaCBvZiBvdXRwdXQgZnJvbSBzc2hdCj4gc3Rh
dHVzICh0aW1lZCBvdXQpIGF0IE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gbGluZSA1NTAuCj4gMjAx
OS0xMC0yMSAwMjo1ODo0MiBaIGV4aXQgc3RhdHVzIDQKPiAKPiAxNzIuMTYuMTQ1LjIwNSBpcyB0
aGUgZ3Vlc3QgaGVyZS4gIEllLCBgc3NoIGRhdGUgZ3Vlc3QnIHRvb2sgbG9uZ2VyCj4gdGhhbiAx
MHMuCj4gCj4gV2UgY2FuIHNlZSB0aGF0IHRoZSBndWVzdCBuZXR3b3JraW5nIGlzIHdvcmtpbmcg
c29vbiBhZnRlciB0aGUKPiBtaWdyYXRpb24gYmVjYXVzZSB3ZSBnb3QgbW9zdCBvZiB0aGUgd2F5
IHRocm91Z2ggdGhlIHNzaCBwcm90b2NvbAo+IGV4Y2hhbmdlLiAgT24gdGhlIHByZXZpb3VzIHJl
cGV0aXRpb24gdGhlIG5leHQgbWVzc2FnZSBmcm9tIHNzaCB3YXMKPiAgICAgZGVidWcxOiBTU0gy
X01TR19TRVJWSUNFX0FDQ0VQVCByZWNlaXZlZAo+IAo+IExvb2tpbmcgYXQKPiAgICBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyOTczL3Rlc3QtYW1k
NjQtYW1kNjQteGwtcHZzaGltL3JpbWF2YTEtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRl
Ymlhbi5ndWVzdC5vc3N0ZXN0LS1pbmNvbWluZy5sb2cKPiB3aGljaCBpcywgSSB0aGluaywgdGhl
IGxvZyBvZiB0aGUgIm5ldyIgaW5zdGFuY2Ugb2YgZ3Vlc3QsIGFmdGVyCj4gbWlncmF0aW9uLCB0
aGVyZSBhcmUgbWVzc2FnZXMgYWJvdXQga2lsbGluZyB2YXJpb3VzIHNlcnZpY2VzLiAgRWcKPiAg
ICBbMTkxODA2NDczOC44MjA1NTBdIHN5c3RlbWRbMV06IHN5c3RlbWQtdWRldmQuc2VydmljZTog
TWFpbiBwcm9jZXNzCj4gICAgZXhpdGVkLCBjb2RlPWtpbGxlZCwgc3RhdHVzPTYvQUJSVAo+IFRo
ZXkgZG9uJ3Qgc2VlbSB0byBiZSBub3JtYWwuICBGb3IgZXhhbXBsZToKPiAgICBodHRwOi8vbG9n
cy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQyODY1L3Rlc3QtYW1kNjQt
YW1kNjQteGwtcHZzaGltL3JpbWF2YTEtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlh
bi5ndWVzdC5vc3N0ZXN0LS1pbmNvbWluZy5sb2cKPiBpcyB0aGUgcHJldmlvdXMgeGVuLXVuc3Rh
YmxlIGZsaWdodCBhbmQgaXQgZG9lc24ndCBoYXZlIHRoZW0uICBJCj4gbG9va2VkIGluCj4gICAg
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0Mjg2NS90
ZXN0LWFtZDY0LWFtZDY0LXhsLXB2c2hpbS9yaW1hdmExLS0tdmFyLWxvZy14ZW4tY29uc29sZS1n
dWVzdC1kZWJpYW4uZ3Vlc3Qub3NzdGVzdC5sb2cuZ3oKPiB0b28gYW5kIHRoYXQgaGFzIHNvbWUg
YWxhcm1pbmcgbWVzc2FnZXMgZnJvbSB0aGUga2VybmVsIGxpa2UKPiAgIFsgIDY4Ni42OTI2NjBd
IHJjdV9zY2hlZCBrdGhyZWFkIHN0YXJ2ZWQgZm9yIDE5MTgwOTIxMjMxMjggamlmZmllcyEKPiAg
IGcxODQ0Njc0NDA3MzcwOTU1MTM1OSBjMTg0NDY3NDQwNzM3MDk1NTEzNTggZjB4MCBSQ1VfR1Bf
V0FJVF9GUVMoMykKPiAgIC0+c3RhdGU9MHgwIC0+Y3B1PTAKPiBhbmQgYWNjb21wYW55aW5nIHN0
YWNrIHRyYWNlcy4gIEJ1dCB0aGUgdGVzdCBwYXNzZWQgdGhlcmUuICBJIHRoaW5rCj4gdGhhdCBp
cyBwcm9iYWJseSBzb21ldGhpbmcgZWxzZSA/CgpUaGlzIHNlZW1zIHRvIGJlIHRoZSBpc3N1ZSBT
ZXJnZXkgaXMgc2VlaW5nLCB0b28uCgo+IAo+IEFCUlQgc3VnZ2VzdHMgZ3Vlc3QgbWVtb3J5IGNv
cnJ1cHRpb24uCgpTdXJlPyBJJ2QgdGhpbmsgb2YgYW4gYWJvcnQoKSBjYWxsLgoKPiAKPj4gSWYg
dGhpcyBpcyB0aGUgY2FzZSwgY291bGQgeW91LCBJYW4sIHBsZWFzZSBhZGQgdGhlIHdvcmthcm91
bmQgeW91IHdlcmUKPj4gdGhpbmtpbmcgb2YgdG8gT1NTdGVzdCAodW5jb25kaXRpb25hbCBieSBu
b3csIG1heWJlIG1ha2UgaXQgY29uZHRpdGlvbmFsCj4+IGxhdGVyKT8KPiAKPiBJIGNhbiBhZGQg
dGhlIGJsb2NrIHJhY2Ugd29ya2Fyb3VuZCBidXQgSSBkb24ndCB0aGluayBpdCB3aWxsIGhlbHAK
PiB3aXRoIG1pZ3JhdGlvbiBhbnl3YXkuICBUaGUgY2FzZSB3aGVyZSB0aGluZ3MgZ28gd3Jvbmcg
aXMgZGVzdHJveS4KCk9rYXksIG5vIGh1cnJ5IHRoZW4uCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
