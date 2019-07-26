Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0776702
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:14:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr003-0004i0-IS; Fri, 26 Jul 2019 13:11:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XdPt=VX=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hr001-0004hs-HJ
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:11:05 +0000
X-Inumbo-ID: d1dc92fa-afa6-11e9-a264-3f94c9fd359c
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1dc92fa-afa6-11e9-a264-3f94c9fd359c;
 Fri, 26 Jul 2019 13:11:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1564146663; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=vCMU6DVuDI1KBrTwQy0K2qAAPMDz5siWv41dxpezXnA=;
 b=N0X9DRoahi4ajN3WUpm8Tmvt/tqDT6CPFru1lmB9nR5z4cuaMZUSiY4ISE76tJAEwkXkFGa0
 dt5a2/Um+5Xq3yRZ/HASyVDppBMsNQUh7DhDDZTCbNcL5c/cBZXyE0hBYFMbaU8r/m/kDP/E
 oTbb4kYz4kfBztKatWjTpRXkJ1I=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5d3afbe6.7f01d13d4f30-smtp-out-n01;
 Fri, 26 Jul 2019 13:11:02 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v19so47679717wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 06:11:01 -0700 (PDT)
X-Gm-Message-State: APjAAAX8bm+XBhYIg6sznfv+m2iRrIopMmIDFbs54l3f5ZxJnzUIB0Gl
 ts2vPlEM6WkyOYz7a0ZYXfSAzOu22bBShO+jITs=
X-Google-Smtp-Source: APXvYqyb/jFd4nkKC4OXtQ/y0zjOR2w8Cc13MWHX1JCa4rnEglfTKybn7OSvzQJ1noZUtVQnDJ/PmZgeW1N0i1mn/lo=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr86150522wmc.169.1564146660978; 
 Fri, 26 Jul 2019 06:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190726101057.21324-1-andrew.cooper3@citrix.com>
 <CABfawhncHLf=TTU8kHvFqCQxdjKOXuRaNT-stOi3wM7NLu3WWg@mail.gmail.com>
 <fee2771d-3b56-c22a-10be-de8aa23a0cc3@citrix.com>
In-Reply-To: <fee2771d-3b56-c22a-10be-de8aa23a0cc3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jul 2019 07:10:24 -0600
X-Gmail-Original-Message-ID: <CABfawhkcKFXucB=dfVQUoeN+iBeJSc__rmMHtBr4hahjCqNDnw@mail.gmail.com>
Message-ID: <CABfawhkcKFXucB=dfVQUoeN+iBeJSc__rmMHtBr4hahjCqNDnw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH RFC] x86/shim: Refresh pvshim_defconfig
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNjo1OCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI2LzA3LzIwMTkgMTM6NTUsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDQ6MTEgQU0gQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gKiBBZGQgYSBk
ZXBlbmRlbmN5IHNvIHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9kZWZjb25maWcg
Y2hhbmdlcy4KPiA+PiAqIERlZmF1bHQgdG8gdGhlIE5VTEwgc2NoZWR1bGVyIG5vdyB0aGF0IGl0
IHdvcmtzIHdpdGggdmNwdSBvbmxpbmUvb2ZmbGluZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPj4gLS0tCj4gPj4g
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiA+PiBDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KPiA+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+PiBDQzogRGFyaW8g
RmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggZGVwZW5k
cyBvbiBEYXJpbydzIHNlcmllcywgYW5kIGNhbnQgZ28gaW4gdW50aWwgdGhlbi4KPiA+Pgo+ID4+
IEFsc28gUkZDLgo+ID4+Cj4gPj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiA+PiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
Pgo+ID4+Cj4gPj4gSSB0cmllZCB0dXJuaW5nIG9mZiBNRU1fQUNDRVNTLCBidXQgSSBjYW4ndCBn
ZXQgS2NvbmZpZyB0byBhY3R1YWxseSB0dXJuIGl0Cj4gPj4gb2ZmIGluIHRoZSBidWlsZC4gIFdo
YXQgaXMgdGhlIGRlYWwgd2l0aCBNRU1fQUNDRVNTX0FMV0FZU19PTiA/ICBJdCBtYWtlcyBpdAo+
ID4+IGltcG9zc2libGUgdG8gdHVybiBNRU1fQUNDRVNTIG9mZiwgYmVjYXVlIGl0IGlzIHNlbGVj
dGVkIGJ5IHg4Niwgd2hpY2ggbGVhdmVzCj4gPj4gTUVNX0FDQ0VTUyBlbmFibGVkIGFuZCB1bm1v
ZGlmaWFibGUuCj4gPiBXZSBuZXZlciBtYWRlIGl0IGNvbmZpZ3VyYWJsZSB0byBoYXZlIE1FTV9B
Q0NFU1MgYmUgZGlzYWJsZWQgb24geDg2Lgo+ID4gVGhlIG9wdGlvbiBvbmx5IGV4aXN0cyBiZWNh
dXNlIHdoZW4gSSBzdGFydGVkIG1vdmluZyB2bV9ldmVudCB0bwo+ID4gY29tbW9uIGNvZGUgaXQg
aGFkIHRvIGJlIGRpc2FibGVkIGZvciBBUk0gYXQgZmlyc3QuIFRoZW4gaXQgbG9va3MgbGlrZQo+
ID4gU3RlZmFubyBkaWQgbWFrZSBpdCBjb25maWd1cmFibGUgZm9yIEFSTSBzbyB0aGVyZSBpdCBj
YW4gYWN0dWFsbHkgYmUKPiA+IGRpc2FibGVkLgo+Cj4gSXMgaXQgc29tZXRoaW5nIHdlIGNvdWxk
IGNvbnNpZGVyIG1ha2luZyBjb25maWd1cmFibGUgYXQgdGhpcyBwb2ludD8KPiBJdHMgY2VydGFp
bmx5IHNvbWV0aGluZyB3ZSdkIHdhbnQgdG8gdHVybiBvZmYgaW4gdGhlIFBWIHNoaW0gYnVpbGQu
Cj4KPiBXaGlsZSB0aGlua2luZyBhYm91dCBpdCwgaXQgaXMgc3BlY2lmaWMgdG8gSFZNIGd1ZXN0
cywgc28gb3VnaHQgdG8KPiBkZXBlbmQgb24gQ09ORklHX0hWTSBhbnl3YXksIHdoaWNoIG1pZ2h0
IGJlIHRoZSBlYXNpZXN0IHdheSB0byBleGNsdWRlCj4gaXQgZm9yIHRoZSBQViBzaGltIGJ1aWxk
IGlmIHdlIGRvbid0IHdhbnQgdG8gbWFrZSBpdCBhY3RpdmVseQo+IGNvbmZpZ3VyYWJsZSB5ZXQu
CgpTdXJlLCBJIHdvdWxkIEFjayBhIHBhdGNoIHRoYXQgbWFrZXMgaXQgY29uZmlndXJhYmxlLiBU
aGVyZSB3ZXJlIHNvbWUKd29ya3MgaW4gdGhlIHBhc3QgdG8gbWFrZSBtZW1fYWNjZXNzIGZvciBQ
ViBkb21haW5zIGFzIHdlbGwgYnV0IHRoYXQKd2FzIGEgd2hpbGUgYWdvLCBJIGRvbid0IHRoaW5r
IGFueW9uZSBoYXMgaW50ZXJlc3QgaW4gdGhhdCBhbnltb3JlLgpNYWtpbmcgaXQgZGVwZW5kIG9u
IEhWTSBmb3IgeDg2IGJ1aWxkcyBzb3VuZHMgcmVhc29uYWJsZSB0byBtZSwgbm90CnN1cmUgaWYg
dGhhdCB3b3VsZCB3b3JrIGZvciBBUk0gdGhvdWdoIGFzIEkgZG9uJ3QgdGhpbmsgaXQgaGFzIEhW
TQpjb25maWcgb3B0aW9uLiBBbnl3YXksIGlmIHNvbWVvbmUgbWFrZXMgY2hhbmdlcyB0byB0aGlz
IEkgd291bGQgaGlnaGx5CnByZWZlciB0byBnZXQgcmlkIG9mIHRoZSBNRU1fQUNDRVNTX0FMV0FZ
U19PTiBjb25maWcgb3B0aW9uIGFzIGl0J3MgYQpjb25mdXNpbmcgb3B0aW9uIG5hbWUuCgpUYW1h
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
