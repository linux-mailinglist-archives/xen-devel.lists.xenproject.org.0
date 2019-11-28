Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0610CB2D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 16:01:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaLGh-0001Ma-5Y; Thu, 28 Nov 2019 14:59:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C34r=ZU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iaLGf-0001MV-9V
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:59:41 +0000
X-Inumbo-ID: b393e7b6-11ef-11ea-a3d3-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b393e7b6-11ef-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 14:59:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z19so12038678wmk.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2019 06:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rJ176ht3X7Ya5u+nKJMFLX6Nb+Jwzl0DhtnCBeys8eA=;
 b=PIboIYoJ7UbY4/teT/FoVM0GCTxq7xtRpidHqiJOARmNzzIn6aJlxm0PjuwvhKZoR1
 cv7ijp2Odhifxw8UpWb9ch2AkQjgXRL32pyqiFY0OnmO6DnVIbbIHuy4jLKKC+7FdH4v
 Koo7NTlMdwvmhT4fYcMMf2gKbm8KcaLMCph6YpnfUrzI3BFZ4I4/Uo6t/hwrUP5i+OOE
 o37tOCEMUYSpDlz3gZbbwG3EC/9R4yd7zMrDUqVEqU+Ow2DIje09vr7s2+tozy2c1wSZ
 PmMJ1+vK9JC8LGjPviMI7ilxz4CwmXF2HjrY3vU2IS+WkSsCdojbxUbOVBTveGEsnZnM
 x25Q==
X-Gm-Message-State: APjAAAW/pWUzdwVh4fXQjGHMxG9b+RQjkx6lDnhcHSkiHAdH9H4/8g/o
 aANyCsKrHuO5ArR0NLnZCj0=
X-Google-Smtp-Source: APXvYqwz4WvaM7/kAr1V9iHNarvqCjH8MsJkdWYORIxFqVOxLFq9ZD9JnHcSjkAbn5k/SeoVLTj2nw==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr1933082wmj.53.1574953179209; 
 Thu, 28 Nov 2019 06:59:39 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id i9sm22728943wrb.2.2019.11.28.06.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:59:38 -0800 (PST)
Date: Thu, 28 Nov 2019 14:59:37 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191128145937.24l6eyup4lrrq5wz@debian>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
 <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
 <a6682041-3a08-d003-27d3-8f7117300876@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6682041-3a08-d003-27d3-8f7117300876@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, WeiLiu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDE6MTA6MDVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8xMS8yMDE5IDEwOjE3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4+IE9u
IE5vdiAyOCwgMjAxOSwgYXQgOTo1NSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToKPiA+Pj4+PiBIYXMgYW55b25lIGFjdHVhbGx5IHRyaWVkIGJ1aWxkaW5nIGEgbGl2
ZXBhdGNoIHdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2U/Cj4gPj4+PiBBY3R1YWxseSAtIHdoYXQg
aXMgeW91ciBjb25jZXJuIGhlcmU/IFRoZSBleGFjdCBzcGVsbGluZyBvZiBzeW1ib2xzCj4gPj4+
PiBuYW1lcyBzaG91bGQgYmUgb2Ygbm8gaW50ZXJlc3QgdG8gdGhlIHRvb2wuIEFmdGVyIGFsbCB0
aGUgY29tcGlsZXIgaXMKPiA+Pj4+IGZyZWUgdG8gaW52ZW50IGFsbCBzb3J0cyBvZiBuYW1lcyBm
b3IgaXRzIGxvY2FsIHN5bWJvbHMsIGluY2x1ZGluZwo+ID4+Pj4gdGhlIG9uZXMgd2Ugd291bGQg
cHJvZHVjZSB3aXRoIHRoaXMgY2hhbmdlIGluIHBsYWNlLiBBbGwgdGhlIHRvb2wKPiA+Pj4+IGNh
cmVzIGFib3V0IGlzIHRoYXQgdGhlIG5hbWVzIGJlIHVuYW1iaWd1b3VzLiBIZW5jZSBhbnkgKHRo
ZW9yZXRpY2FsKQo+ID4+Pj4gcmVncmVzc2lvbiBoZXJlIHdvdWxkIGJlIGEgYnVnIGluIHRoZSB0
b29scywgd2hpY2ggaW1vIGlzIG5vIHJlYXNvbgo+ID4+Pj4gdG8gZGVsYXkgdGhpcyBjaGFuZ2Ug
YW55IGZ1cnRoZXIuIChHcmFudGVkIEkgc2hvdWxkIGhhdmUgZ290IHRvIGl0Cj4gPj4+PiBlYXJs
aWVyLCBidXQgaXQgaGFkIGJlZW4gY29udGludWluZyB0byBnZXQgZGVmZXJyZWQuKQo+ID4+PiBU
aGlzIG1pZ2h0IGFsbCBiZSB0cnVlICh0aGVvcmV0aWNhbGx5KS4KPiA+Pj4KPiA+Pj4gVGhlIGxp
dmVwYXRjaCBidWlsZCB0b29scyBhcmUgZnJhZ2lsZSBhbmQgdmVyeSBzZW5zaXRpdmUgdG8gaG93
IHRoZQo+ID4+PiBvYmplY3QgZmlsZXMgYXJlIGxhaWQgb3V0LiAgVGhlcmUgaXMgYSB2ZXJ5IHJl
YWwgcmlzayB0aGF0IHRoaXMgY2hhbmdlCj4gPj4+IGFjY2lkZW50YWxseSBicmVha3MgbGl2ZXBh
dGNoaW5nIHRvdGFsbHksIGV2ZW4gb24gR0NDIGJ1aWxkcy4KPiA+Pj4KPiA+Pj4gV2VyZSB0aGlz
IHRvIGhhcHBlbiwgaXQgd291bGQgYmUgeWV0IGFub3RoZXIgNC4xMyByZWdyZXNzaW9uLgo+ID4+
IEl0J3MgcGVyaGFwcyBhIG1hdHRlciBvZiBwZXJjZXB0aW9uLCBidXQgSSdkIHN0aWxsIGNhbGwg
dGhpcyBhCj4gPj4gbGl2ZSBwYXRjaGluZyB0b29scyBidWcgdGhlbiwgbm90IGEgNC4xMyByZWdy
ZXNzaW9uLgo+ID4gQWZ0ZXIgdGhlIGRpc2N1c3Npb24geWVzdGVyZGF5LCBJIHdhcyB0aGlua2lu
ZyBhIGJpdCBtb3JlIGFib3V0IHRoaXMsIGFuZCBJ4oCZbSBub3QgaGFwcHkgd2l0aCB0aGUgcHJp
bmNpcGxlIEFuZHkgc2VlbXMgdG8gYmUgb3BlcmF0aW5nIG9uLAo+IAo+IEknbSBzb3JyeSB0aGF0
IHlvdSBmZWVsIHRoYXQgd2F5Lgo+IAo+ID4gdGhhdCBpdOKAmXMgcmVhc29uYWJsZSB0byBjb21w
bGV0ZWx5IGJsb2NrIGEgYnVnLWZpeGluZyBwYXRjaCB0byBYZW4sIGZvcmNpbmcgYSB3b3JrLWFy
b3VuZCB0byBiZSB1c2VkIGluIGEgcmVsZWFzZSwgYmVjYXVzZSBpdCBoYXMgdW5rbm93biBlZmZl
Y3RzIG9uIGxpdmVwYXRjaGluZy4KPiAKPiBUaGlzIGlzIG5vdCBhIGZhaXIgY2hhcmFjdGVyaXNh
dGlvbiBvZiB3aGF0IGlzIGdvaW5nIG9uIGhlcmUuwqAgSWdub3JlCj4gdGhlIHNwZWNpZmljcyBv
ZiB0aGlzIHBhdGNoIC0gdGhleSBhcmUgbm90IHJlbGV2YW50IHRvIG15IG9iamVjdGlvbi4KPiAK
PiBBcyBhIG1haW50YWluZXIsIGl0IGlzIG15IHJlc3BvbnNpYmlsaXR5IHRvIGVuc3VyZSB0aGF0
IGNyYXAgZG9lc24ndCBnZXQKPiBjb21taXR0ZWQuCj4gCgpJdCBpcyBmaW5lIHRvIGhhdmUgZGlm
ZmVyaW5nIG9waW5pb25zOyBpdCBpcyBub3QgZmluZSB0byBtYWtlIGFuCmVtb3Rpb25hbGx5IGNo
YXJnZWQgY29tbWVudCBsaWtlIHRoaXMuIEl0IHNlcnZlcyBuby1vbmUncyBpbnRlcmVzdC4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
