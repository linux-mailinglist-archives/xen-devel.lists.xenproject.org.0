Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DED272C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 12:29:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIVbB-0003Jr-Vh; Thu, 10 Oct 2019 10:23:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ud0r=YD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iIVbA-0003Jm-Fl
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 10:23:08 +0000
X-Inumbo-ID: f1f6dfaa-eb47-11e9-97ff-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1f6dfaa-eb47-11e9-97ff-12813bfff9fa;
 Thu, 10 Oct 2019 10:23:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j11so7193513wrp.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 03:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=eOxVnXrb4Ff/YT109rmOChUl1uVTlh7mk0e/dweQ3oM=;
 b=JgpSScwJUncWDaVe+iKqm/ASdwbK9BK0OSsVxy3v3rgDRXfqHxaUcpYMjHRs43Uin3
 66c7FHodoFwzC6QTKCQyO9sxQWfFb5Uk7fUa3YcTFEDucqZNv+0s4Jf2ZdREmhzE4Yf6
 g7Mj4C31ioojwM+BEjYRszxVFB72o36ebWLRk3rfSqxUFCfo4ZGrOQ01egbPRX/xkFYX
 qcm4USvuWhJkMjeZTNoJcEFt2wEMADt4MYV76zOP6xPsjqpzV2y6pZiVaIQsw7Qhd5L+
 phNECRbOqQtSKRCVuq4veG1qB23FMAqvO68/+4x0p5U6nW0++aUaInRVecmPBhQvKnhH
 1PUA==
X-Gm-Message-State: APjAAAV/CodDHELqeFOtsCoLVALZOW9GF+yZi8o58dW8ipk2iK5po+ln
 2gCbBgfDCiwtwN1KgXckybE=
X-Google-Smtp-Source: APXvYqyVW19rthc6VeM2sRd0YFtIIb6JWvQtRV7ghJvq0c964O2tWfxf6g2PxGSPj8nZmQexQWibcA==
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr7487633wrw.245.1570702984319; 
 Thu, 10 Oct 2019 03:23:04 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id w18sm5772308wmc.9.2019.10.10.03.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 03:23:03 -0700 (PDT)
Date: Thu, 10 Oct 2019 11:23:02 +0100
From: Wei Liu <wl@xen.org>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20191010102302.7wpjaad446ooreub@debian>
References: <20191009083321.1743-1-roger.pau@citrix.com>
 <20191009111343.GA16457@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009111343.GA16457@gao-cwp>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] pci: clear {host/guest}_maskall field on
 assign
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Spassov,
 Stanislav" <stanspas@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDc6MTM6NDVQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTA6MzM6MjFBTSArMDIwMCwgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOgo+ID5UaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBob3N0X21hc2thbGwg
bWFrZXMgaXQgc3RpY2t5IGFjcm9zcwo+ID5hc3NpZ24gYW5kIGRlYXNzaWduIGNhbGxzLCB3aGlj
aCBtZWFucyB0aGF0IG9uY2UgYSBndWVzdCBmb3JjZXMgWGVuIHRvCj4gPnNldCBob3N0X21hc2th
bGwgdGhlIG1hc2thbGwgYml0IGlzIG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPiA+
Y2FsbCB0byBQSFlTREVWT1BfcHJlcGFyZV9tc2l4IGlzIHBlcmZvcm1lZC4gU3VjaCBjYWxsIGhv
d2V2ZXIKPiA+c2hvdWxkbid0IGJlIHBhcnQgb2YgdGhlIG5vcm1hbCBmbG93IHdoZW4gZG9pbmcg
UENJIHBhc3N0aHJvdWdoLCBhbmQKPiA+aGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJl
ZCB3aGVuIGFzc2lnbmluZyBpbiBvcmRlciB0byBwcmV2ZW50Cj4gPmhvc3RfbWFza2FsbCBiZWlu
ZyBjYXJyaWVkIG92ZXIgZnJvbSBwcmV2aW91cyBhc3NpZ25hdGlvbnMuCj4gPgo+ID5Ob3RlIHRo
YXQgdGhlIGVudHJ5IG1hc2tiaXQgaXMgcmVzZXQgd2hlbiB0aGUgbXNpeCBjYXBhYmlsaXR5IGlz
Cj4gPmluaXRpYWxpemVkLCBhbmQgdGhlIGd1ZXN0X21hc2thbGwgZmllbGQgaXMgYWxzbyBjbGVh
cmVkIHNvIHRoYXQgdGhlCj4gPmhhcmR3YXJlIHZhbHVlIG1hdGNoZXMgWGVuJ3MgaW50ZXJuYWwg
c3RhdGUgKGhhcmR3YXJlIG1hc2thbGwgPQo+ID5ob3N0X21hc2thbGwgfMKgZ3Vlc3RfbWFza2Fs
bCkuCj4gPgo+ID5BbHNvIG5vdGUgdGhhdCBkb2luZyB0aGUgcmVzZXQgb2YgaG9zdF9tYXNrYWxs
IHRoZXJlIHdvdWxkIGFsbG93IHRoZQo+ID5ndWVzdCB0byByZXNldCBzdWNoIGZpZWxkIGJ5IGVu
YWJsaW5nIGFuZCBkaXNhYmxpbmcgTVNJWCwgd2hpY2ggaXMgbm90Cj4gPmludGVuZGVkLgo+ID4K
PiA+U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPi0tLQo+ID5DYzogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiA+Q2M6ICJTcGFz
c292LCBTdGFuaXNsYXYiIDxzdGFuc3Bhc0BhbWF6b24uZGU+Cj4gPkNjOiBQYXNpIEvDpHJra8Ok
aW5lbiA8cGFzaWtAaWtpLmZpPgo+ID4tLS0KPiA+Q2hhbywgU3RhbmlzbGF2LCBjYW4geW91IHBs
ZWFzZSBjaGVjayBpZiB0aGlzIHBhdGNoIGZpeGVzIHlvdXIKPiA+aXNzdWVzPwo+IAo+IFRlc3Rl
ZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAKPiBJIGdvdCB0aGUgYXNzZXJ0
aW9uIGZhaWx1cmUgYmVsb3cgd2hlbiBzdGFydGluZyB4ZW5jb21tb25zIHdpdGggdGhlCj4gbmV3
ZXN0IHN0YWdpbmc6Cj4gCj4gU2V0dGluZyBkb21haW4gMCBuYW1lLCBkb21pZCBhbmQgSlNPTiBj
b25maWcuLi4KPiB4ZW4taW5pdC1kb20wOiBfbGlieGxfdHlwZXMuYzoyMTYzOiBsaWJ4bF9kb21h
aW5fYnVpbGRfaW5mb19pbml0X3R5cGU6IEFzc2VydGlvbiBgcC0+dHlwZSA9PSBMSUJYTF9ET01B
SU5fVFlQRV9JTlZBTElEJyBmYWlsZWQuCj4gL2V0Yy9pbml0LmQveGVuY29tbW9uczogbGluZSA1
NDogIDIwMDYgQWJvcnRlZCAgICAgICAgICAgICAgICAgKGNvcmUgZHVtcGVkKSAke0xJQkVYRUNf
QklOfS94ZW4taW5pdC1kb20wICR7WEVOX0RPTTBfVVVJRH0KCldoYXQgaXMgeW91ciBzZXR1cCBs
aWtlPwoKRGlkIHlvdSBwZXJoYXBzIGhhdmUgc29tZSBzdGFsZSBsaWJyYXJpZXM/CgpXZWkuCgo+
IAo+IEl0IHNob3VsZCBiZSBpcnJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4gU28gSSBhcHBseSB0aGlz
IHBhdGNoIG9uCj4gY2Q5Mzk1MzUzOGFhYyBhbmQgaXQgd29ya3MuCj4gCj4gVGhhbmtzCj4gQ2hh
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
