Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B6110334
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 18:12:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBgL-00059u-UV; Tue, 03 Dec 2019 17:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icBgK-00059p-9z
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 17:09:48 +0000
X-Inumbo-ID: b576d8be-15ef-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b576d8be-15ef-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 17:09:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a15so4604394wrf.9
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 09:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u/pTBi3FGEDQGqEEiPwFWOmyhx9C+XnzPTo8wUdCspY=;
 b=nCAL+vh7dFcR7AoS09P3e/zL/8s0uROoiC6A/BiExiqL1+0xpTn02Ve3ZjeV/LOW78
 ISeXHDGUn/OBqs/YzXRSJx8aNlYei5TZnaMVH/GMyS8/bufvZPA/eBcalitLsnog4Z9E
 bZW9s8I+G3By6jHXfkdU6Hr+GshXdHoZfsnKnc+UVH98OMmYZt7HEfueyZOeapIVyC9S
 69U57jna5gvcGroElZ8D73JeWo0IqkRmHTlLhxIMwej69FS0pqyTciNw3jOnmnu/De5f
 CCqYUcv7IinEPgqKuXUiiAiA7m/sUMWH7OXKgWqerVuzDk1O7TFythzZgNu+G1rK9w2J
 aoTQ==
X-Gm-Message-State: APjAAAUwyCieVLPKr0XKARfoDwWD4LXMEu4+BGE3gcjDHlepJU6Msl3g
 39gvb9euxsW8oQJHMSeAsMk=
X-Google-Smtp-Source: APXvYqw0yzjvgnaZVQJ9tOfYJJjDLEUyE2+cCWDL3fRnwmX5oysR++Ggw01dP87Sr3jm1r4iUUCfiw==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr6387564wrq.123.1575392986166; 
 Tue, 03 Dec 2019 09:09:46 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id t81sm3839994wmg.6.2019.12.03.09.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:09:45 -0800 (PST)
Date: Tue, 3 Dec 2019 17:09:43 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203170943.dx4n2s6442a7g2l7@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-8-liuwe@microsoft.com>
 <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
 <20191203163736.ssykoba43expjx3k@debian>
 <4361888e-3e89-25e0-f7b8-2949a32c5c6f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4361888e-3e89-25e0-f7b8-2949a32c5c6f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 7/8] x86: be more verbose when running on
 a hypervisor
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDU6NTg6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMTIuMjAxOSAxNzozNywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgRGVj
IDAzLCAyMDE5IGF0IDAzOjU0OjM1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDMwLjExLjIwMTkgMTI6NTcsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IEFsc28gcmVwbGFjZSByZWZl
cmVuY2UgdG8geGVuX2d1ZXN0Lgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxs
aXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4+Cj4gPj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiA+IAo+ID4gVGhhbmtzLgo+ID4gCj4gPj4KPiA+PiBIb3dldmVyLCAu
Li4KPiA+Pgo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4+PiArKysgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwo+ID4+PiBAQCAtNzAwLDYgKzcwMCw3IEBAIHZvaWQgX19pbml0IG5v
cmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gPj4+ICAgICAgICAgIC5t
YXhfZ3JhbnRfZnJhbWVzID0gLTEsCj4gPj4+ICAgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVz
ID0gLTEsCj4gPj4+ICAgICAgfTsKPiA+Pj4gKyAgICBjb25zdCBjaGFyICpoeXBlcnZpc29yX25h
bWU7Cj4gPj4+ICAKPiA+Pj4gICAgICAvKiBDcml0aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3Ig
VFNTLiAgQW55IGZhdWx0IGlzIGRlYWRseSEgKi8KPiA+Pj4gIAo+ID4+PiBAQCAtNzYzLDcgKzc2
NCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJp
X3ApCj4gPj4+ICAgICAgICogYWxsb2NpbmcgYW55IHhlbmhlYXAgc3RydWN0dXJlcyB3YW50ZWQg
aW4gbG93ZXIgbWVtb3J5LiAqLwo+ID4+PiAgICAgIGtleGVjX2Vhcmx5X2NhbGN1bGF0aW9ucygp
Owo+ID4+PiAgCj4gPj4+IC0gICAgaHlwZXJ2aXNvcl9wcm9iZSgpOwo+ID4+PiArICAgIGh5cGVy
dmlzb3JfbmFtZSA9IGh5cGVydmlzb3JfcHJvYmUoKTsKPiA+Pgo+ID4+IC4uLiB5b3Ugbm8gbG9u
Z2VyIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiBtdWx0aXBsZSB0aW1lLCB3aHkgZG9lcwo+ID4+IHBh
dGNoIDQgc3RpbGwgcHV0IGluIGEgcmVzcGVjdGl2ZSBndWFyZD8KPiA+IAo+ID4gUmVtbmFudCBm
cm9tIHByZXZpb3VzIGl0ZXJhdGlvbnMuCj4gPiAKPiA+IEkgY2FuIHN1Ym1pdCBhIGZvbGxvdy11
cCBwYXRjaCB0byBkcm9wIHRoYXQgLS0gZG8gcmVhbGx5IHdhbnQgdG8KPiA+IGludmFsaWRhdGUg
YWxsIHRoZSByZXZpZXdzIGFuZCBhY2tzIEkgZ290IHNvIGZhci4KPiAKPiBBY2NvcmRpbmcgdG8g
bXkgcmVjb3JkcyBwYXRjaCA0IGhhZCBubyBhY2tzIGV4Y2VwdCBtaW5lLCB3aGljaCB5b3UKPiBj
b3VsZCBrZWVwIHdpdGggdGhpcyBjaGFuZ2UgKGluIGZhY3QgSSB3YXMgdGhpbmtpbmcgb2YgbWFr
aW5nIGl0Cj4gZGVwZW5kZW50IHVwb24gdGhlIGRyb3BwaW5nIG9mIHRoaXMgbGVmdG92ZXIpLiBT
dWJzZXF1ZW50IHBhdGNoZXMKPiBtYXkgb25seSBuZWVkIHJlLWJhc2luZywgd2hpY2ggZG9lc24n
dCBpbXBseSBkcm9wcGluZyBvZiBhbnkgYWNrcy4KCk9LLiBJbiB0aGF0IGNhc2UsIEkgd2lsbCBk
cm9wIGl0IGxvY2FsbHkuIElmIHRoYXQgY2F1c2VzIGFueSBzdWJzdGFudGlhbApjaGFuZ2VzLCBJ
IHdpbGwgcG9zdCBhbm90aGVyIHZlcnNpb247IG90aGVyd2lzZSBJIHdpbGwganVzdCBrZWVwIGFs
bCB0aGUKdGFncyBhbmQgcHVzaCB0aGlzIHNlcmllcyBzb29uLWlzaC4KCkhvdyBkb2VzIHRoYXQg
c291bmQgdG8geW91PwoKV2VpLgoKPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
