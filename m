Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC71A12F939
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:31:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNwu-0003b3-SJ; Fri, 03 Jan 2020 14:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inNwt-0003ay-JK
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:29:11 +0000
X-Inumbo-ID: 67deb2bc-2e35-11ea-a4b5-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67deb2bc-2e35-11ea-a4b5-12813bfff9fa;
 Fri, 03 Jan 2020 14:29:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so42636187wrh.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 06:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R9GapnPIgMVS8KGg+pW60n1GUfY5GzqqG9Z+UHzJEdQ=;
 b=OFXXpvqpT3rD6i57TP5NBO/nBEJNKgTNeh7YYCsiNArnOdxoK4VGv067tt+6Rg3vd+
 uKnevg/0SM8HkE+sVUEp7t4/rMQYSRl7td3VyB08XILj3bHKUahdN1O1/EkjDLgDxAHo
 Uqg/ZABkzokuTQxZccmlEhAeeQTkEs4R+wfvbl7vBj2VV73hWeBWZGTnkP0LdUA1g5rJ
 Hf/aqVfwIkN46/I7zs3QPISqIQAmnV1WGJuikjxcim2Kj0PHWLZTfFrFHXWDhtHK//f2
 1VfWpqcxjnGZ3F6WHte/0t9SOLU8PRUvSkb6A5oF9Tjr+8aS58lKXDf6UV9x4hIwZVBH
 1LHQ==
X-Gm-Message-State: APjAAAUe2c37X79iGTcD4Ppv87z1EEHg8WxwVaMsUck0e63SMPmKtOGS
 yVkfO1Bd4OKx+XVOc4QY1eQ=
X-Google-Smtp-Source: APXvYqzoM2B6hZfBp8O+T+zIW0QlJN2kListrmPYUw2fqwXU/gOLFwjkLNPIub2OeIraJJKl2aNefw==
X-Received: by 2002:adf:8297:: with SMTP id 23mr34313343wrc.379.1578061749548; 
 Fri, 03 Jan 2020 06:29:09 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id r5sm59503628wrt.43.2020.01.03.06.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 06:29:09 -0800 (PST)
Date: Fri, 3 Jan 2020 14:29:07 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200103142907.ylckq7fh2h536w72@debian>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
 <20191219144217.305851-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219144217.305851-3-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH 2/2] automation: Cache sub-project git
 tree in build jobs
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDI6NDI6MTdQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gR2l0TGFiIGhhdmUgYSBjYWNoaW5nIGNhcGFiaWxpdHksIHNlZSBbMV0uIExldCdz
IHVzZSBpdCB0byBhdm9pZCB1c2luZwo+IEludGVybmV0IHRvbyBvZnRlbi4KPiAKPiBUaGUgY2Fj
aGUgaXMgc2V0dXAgc28gdGhhdCB3aGVuIHhlbi5naXQvQ29uZmlnLm1rIGlzIGNoYW5nZWQsIHRo
ZQo+IGNhY2hlIHdpbGwgbmVlZCB0byBiZSByZWNyZWF0ZWQuIFRoaXMgaGFzIGJlZW4gY2hvc2Vu
IGJlY2F1c2UgdGhhdCBpcwo+IHdoZXJlIHRoZSBpbmZvcm1hdGlvbiBhYm91dCBob3cgdG8gY2xv
bmUgc3ViLXByb2plY3QgdHJlZXMgaXMgZW5jb2RlZAo+IChyZXZpc2lvbnMpLiBUaGF0IG1heSBu
b3Qgd29yayBmb3IgcWVtdS14ZW4gdHJlZSB3aGljaCB1c3VhbGx5IGlzCj4gYG1hc3RlcicsIGJ1
dCB0aGF0IHNob3VsZCBiZSBmaW5lIGZvciBub3cuCj4gCj4gVGhlIGNhY2hlIGlzIHBvcHVsYXRl
ZCBvZiAiZ2l0IGJ1bmRsZSIgd2hpY2ggd2lsbCBjb250YWluIGEgbWlycm9yIG9mCj4gdGhlIG9y
aWdpbmFsIHJlcG8sIGFuZCBjYW4gYmUgY2xvbmVkIGZyb20uIElmIHRoZSBidW5kbGUgZXhpc3Qs
IHRoZQo+IHNjcmlwdCBoYXZlIHRoZSBYZW4gbWFrZWZpbGVzIGNsb25lIGZyb20gaXQsIG90aGVy
d2lzZSBpdCB3aWxsIGNsb25lCj4gZnJvbSB0aGUgb3JpZ2luYWwgVVJMIGFuZCB0aGUgYnVuZGxl
cyB3aWxsIGJlIGNyZWF0ZWQganVzdCBhZnRlci4KPiAKPiBXZSBoYXZlIG1vcmUgdGhhbiBvbmUg
cnVubmVyIGluIEdpdExhYiwgYW5kIG5vIHNoYXJlZCBjYWNoZSBiZXR3ZWVuCj4gdGhlbSwgc28g
ZXZlcnkgYnVpbGQgam9icyB3aWxsIGJlIHJlc3BvbnNpYmxlIHRvIGNyZWF0ZSB0aGUgY2FjaGUu
Cj4gCj4gWzFdIGh0dHBzOi8vZG9jcy5naXRsYWIuY29tL2VlL2NpL3lhbWwvUkVBRE1FLmh0bWwj
Y2FjaGUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KClRoaXMgaXMgYSBnb29kIGltcHJvdmVtZW50LgoKSGF2ZSB5b3UgcnVuIHRo
aXMgaW4gR2l0bGFiIENJPyBDYW4geW91IHBvaW50IG1lIHRvIGEgcnVuPwoKPiAtLS0KPiAgYXV0
b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbCAgICAgfCAgOCArKysrKwo+ICBhdXRvbWF0aW9u
L3NjcmlwdHMvcHJlcGFyZS1jYWNoZS5zaCB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA3NTUgYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUuc2gKPiAKPiBkaWZmIC0tZ2l0
IGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNp
L2J1aWxkLnlhbWwKPiBpbmRleCAxZTYxZDMwYzg1NDUuLjhmOWY1M2E0MjIyZiAxMDA2NDQKPiAt
LS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sCj4gKysrIGIvYXV0b21hdGlvbi9n
aXRsYWItY2kvYnVpbGQueWFtbAo+IEBAIC0xLDYgKzEsMTQgQEAKPiAgLmJ1aWxkLXRtcGw6ICZi
dWlsZAo+ICAgIHN0YWdlOiBidWlsZAo+ICAgIGltYWdlOiByZWdpc3RyeS5naXRsYWIuY29tL3hl
bi1wcm9qZWN0L3hlbi8ke0NPTlRBSU5FUn0KPiArICBjYWNoZToKPiArICAgIGtleToKPiArICAg
ICAgZmlsZXM6Cj4gKyAgICAgICAgLSBDb25maWcubWsKPiArICAgIHBhdGhzOgo+ICsgICAgICAt
IGNpX2NhY2hlCj4gKyAgYmVmb3JlX3NjcmlwdDoKPiArICAgIC0gLi9hdXRvbWF0aW9uL3Njcmlw
dHMvcHJlcGFyZS1jYWNoZS5zaAo+ICAgIHNjcmlwdDoKPiAgICAgIC0gLi9hdXRvbWF0aW9uL3Nj
cmlwdHMvYnVpbGQgMj4mMSB8IHRlZSBidWlsZC5sb2cKPiAgICBhcnRpZmFjdHM6Cj4gZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9wcmVwYXJlLWNhY2hlLnNoIGIvYXV0b21hdGlvbi9z
Y3JpcHRzL3ByZXBhcmUtY2FjaGUuc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMDE3ZjFiOGYwNjcyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2F1dG9tYXRp
b24vc2NyaXB0cy9wcmVwYXJlLWNhY2hlLnNoCj4gQEAgLTAsMCArMSw1MiBAQAo+ICsjIS9iaW4v
YmFzaAo+ICsKPiArc2V0IC1leAo+ICsKPiArY2FjaGVkaXI9IiR7Q0lfUFJPSkVDVF9ESVI6PWBw
d2RgfS9jaV9jYWNoZSIKPiArbWtkaXIgLXAgIiRjYWNoZWRpciIKPiArCj4gK2RlY2xhcmUgLUEg
cgo+ICtyW2V4dHJhcy9taW5pLW9zXT1NSU5JT1NfVVBTVFJFQU1fVVJMCj4gK3JbdG9vbHMvcWVt
dS14ZW4tZGlyXT1RRU1VX1VQU1RSRUFNX1VSTAo+ICtyW3Rvb2xzL3FlbXUteGVuLXRyYWRpdGlv
bmFsLWRpcl09UUVNVV9UUkFESVRJT05BTF9VUkwKPiArclt0b29scy9maXJtd2FyZS9vdm1mLWRp
cl09T1ZNRl9VUFNUUkVBTV9VUkwKPiArclt0b29scy9maXJtd2FyZS9zZWFiaW9zLWRpcl09U0VB
QklPU19VUFNUUkVBTV9VUkwKCkRvZXMgdGhpcyBtZWFuIGlmIGluIHRoZSBmdXR1cmUgd2UgYWRk
IG9yIHJlbW92ZSB0cmVlcyB3ZSB3aWxsIG5lZWQgdG8KbW9kaWZ5IHRoaXMgcGFydCBpbiB0aGUg
c2FtZSBjb21taXQ/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
