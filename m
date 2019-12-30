Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E890E12D056
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:39:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilvDK-0005yd-49; Mon, 30 Dec 2019 13:36:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilvDH-0005yX-V5
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:36:03 +0000
X-Inumbo-ID: 527c0e45-2b09-11ea-a032-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 527c0e45-2b09-11ea-a032-12813bfff9fa;
 Mon, 30 Dec 2019 13:36:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so32670397wrw.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 05:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=y9YNa6rFIr+ok5NVNRdK3ojth/0JVZiTbbXc4Fj3vok=;
 b=nKoz7TMxVu8m5+XEc4QXvyfDx4YhF12nB4a/LFYtjZzsFHK2Qa9UiviBtF18sDyW88
 XMZOokfL1QOsR3tpU5FYVjj9Ms/vAAP6fSODM1UTaxLI199SDut7oP/pZ/STjWa9zXYg
 3+SQrHKwI+1rcAwxROTAMy+HTAylpA07l3Z/LHj3e68icxqL6HDnAMotioUc8bLLDv9s
 3kWiYkvgoUTj4FA4pCeGKX5bZoBv2uviNmRaqm4pOfG/n9JhJ68taky9PAvqP/UluD/k
 RSyix6BwXo3cxJJVXS0HGScCLXI/wCme7Q1k2MTjy7I5oW8iFZv5S++YIgFdmyYj8YBc
 6T8g==
X-Gm-Message-State: APjAAAVsJitaNaWZagjaskJHXY9B61OeOZt87AuicpGfTDYl9MGO0xwJ
 U9TOE9p5T+SfgrzjnYd7gz8=
X-Google-Smtp-Source: APXvYqyojqVq8jVMGsB8hBN5Wmx3I8JkPeT6Na2Mc7Iocz0Sqp4Inl9KiOo1C2zXbPcxber23JZcOQ==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr66227455wrl.190.1577712962352; 
 Mon, 30 Dec 2019 05:36:02 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id g2sm45169051wrw.76.2019.12.30.05.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 05:36:01 -0800 (PST)
Date: Mon, 30 Dec 2019 13:36:00 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191230133600.sagi4t4e2b2gkrcz@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-6-liuwe@microsoft.com>
 <cd41600f-6e83-572e-2083-29aa1317d78a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd41600f-6e83-572e-2083-29aa1317d78a@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 5/8] x86/hyperv: provide Hyper-V hypercall
 functions
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
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMDE6MDQ6MzNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOS8xMi8yMDE5IDE4OjMzLCBXZWkgTGl1IHdyb3RlOgo+ID4gVGhlc2UgZnVu
Y3Rpb25zIHdpbGwgYmUgdXNlZCBsYXRlciB0byBtYWtlIGh5cGVyY2FsbHMgdG8gSHlwZXItVi4K
PiA+Cj4gPiBJIGNvdWxkbid0IGZpbmQgcmVmZXJlbmNlIGluIFRMRlMgdGhhdCBIeXBlci1WIGNs
b2JiZXJzIGZsYWdzIGFuZAo+ID4gcjktcjExLCBidXQgTGludXgncyBjb21taXQgbWVzc2FnZSBz
YXlzIGl0IGRvZXMuIEVyciBvbiB0aGUgc2FmZSBzaWRlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaCB8IDEwNSArKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWh5cGVyY2FsbC5oCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWh5cGVyY2Fs
bC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi42MDE3MTIzYmU1Cj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1o
eXBlcmNhbGwuaAo+ID4gQEAgLTAsMCArMSwxMDUgQEAKPiA+ICsvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCj4gPiArICogYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKPiA+ICsgKgo+ID4g
KyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKPiA+ICsgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiA+ICsgKiBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFz
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgo+ID4gKyAqCj4gPiAr
ICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBi
ZSB1c2VmdWwsCj4gPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4g
dGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiA+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQo+ID4gKyAqIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiA+ICsgKgo+ID4gKyAqIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+ID4gKyAq
IExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3
LmdudS5vcmcvbGljZW5zZXMvPi4KPiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBN
aWNyb3NvZnQuCj4gPiArICovCj4gPiArCj4gPiArI2lmbmRlZiBfX1g4Nl9IWVBFUlZfSFlQRVJD
QUxMX0hfXwo+ID4gKyNkZWZpbmUgX19YODZfSFlQRVJWX0hZUEVSQ0FMTF9IX18KPiA+ICsKPiA+
ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9hc21fZGVm
bnMuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+Cj4gPiArI2luY2x1
ZGUgPGFzbS9wYWdlLmg+Cj4gPiArCj4gPiArZXh0ZXJuIHZvaWQgKmh2X2h5cGVyY2FsbDsKPiA+
ICsKPiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50NjRfdCBj
b250cm9sLCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKPiA+ICt7Cj4gPiArICAgIHVp
bnQ2NF90IHN0YXR1czsKPiA+ICsKPiA+ICsgICAgaWYgKCAhaHZfaHlwZXJjYWxsICkKPiA+ICsg
ICAgICAgIHJldHVybiB+MFVMTDsKPiA+ICsKPiA+ICsgICAgYXNtIHZvbGF0aWxlICgibW92ICVb
b3V0cHV0XSwgJSVyOFxuIgo+ID4gKyAgICAgICAgICAgICAgICAgICJjYWxsIColW2h5cGVyY2Fs
bF9wYWdlXSIKPiA+ICsgICAgICAgICAgICAgICAgICA6ICI9YSIgKHN0YXR1cyksICIrYyIgKGNv
bnRyb2wpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIitkIiAoaW5wdXQpIEFTTV9DQUxMX0NP
TlNUUkFJTlQKPiA+ICsgICAgICAgICAgICAgICAgICA6IFtvdXRwdXRdICJybSIgKG91dHB1dCks
Cj4gPiArICAgICAgICAgICAgICAgICAgICBbaHlwZXJjYWxsX3BhZ2VdICJtIiAoaHZfaHlwZXJj
YWxsKQo+ID4gKyAgICAgICAgICAgICAgICAgIDogImNjIiwgIm1lbW9yeSIsICJyOCIsICJyOSIs
ICJyMTAiLCAicjExIik7Cj4gPiArCj4gPiArICAgIHJldHVybiBzdGF0dXM7Cj4gPiArfQo+IAo+
IEluZGlyZWN0IGNhbGxzIGFyZSBleHBlbnNpdmUgdGhlc2UgZGF5cyBkdWUgdG8gcmV0cG9saW5l
L0lCUlMsIGFuZCBpbgo+IHRoaXMgY2FzZSwgdW5uZWNlc3NhcnkuCj4gCj4gWW91IHdhbnQgc29t
ZXRoaW5nIGxpa2U6Cj4gCj4gYXNtICggIi5wdXNoc2VjdGlvbiBcIi50ZXh0LnBhZ2VfYWxpZ25l
ZFwiLCBcImF4XCIsIEBwcm9nYml0c1xuXHQiCj4gwqDCoMKgwqDCoCAiLmFsaWduIDQwOTZcblx0
Igo+IMKgwqDCoMKgwqAgIi5nbG9ibCBoeXBlcnZfaHlwZXJjYWxsXG5cdCIKPiDCoMKgwqDCoMKg
ICJoeXBlcnZfaHlwZXJjYWxsOlxuXHQiCj4gwqDCoMKgwqDCoCAibW92IC0xLCAlcmF4XG5cdCIK
PiDCoMKgwqDCoMKgICJyZXRcblx0Igo+IMKgwqDCoMKgwqAgIi5hbGlnbiA0MDk2O1xuXHQiICk7
Cj4gCj4gV2hpY2ggd2lsbCBwdXQgb25lIHBhZ2Ugd29ydGggb2Ygc3BhY2UgaW4gLnRleHQucGFn
ZV9hbGlnbmVkIChzbyBpdCBnZXRzCj4gbWFwcGVkIGV4ZWN1dGFibGUpLCBhdCBhIGxvY2F0aW9u
IHRoZSBsaW5rZXIgY2FuIGV2YWx1YXRlIChzbyB5b3UgY2FuCj4gdXNlIGEgZGlyZWN0IGNhbGws
IGFuZCB0aGUgZGlzYXNzZW1ibHkgd2lsbCBiZSBlYXNpZXIgdG8gZm9sbG93KSwgd2hpY2gKPiBp
cyBpbml0aWFsaXNlZCB0byB0aGUgIm5vdCByZWFkeSB5ZXQiIGNvZGUgc28geW91IGRvbid0IG5l
ZWQgYSBydW50aW1lCj4gY2hlY2sgaW4gZXZlcnkgaHlwZXJjYWxsIHRoYXQgeW91IGRpZG4ndCBn
ZXQgdGhlIG9yZGVyIG9mIGluaXRpYWxpc2F0aW9uCj4gd3JvbmcgYXQgYm9vdC4KClRoaXMgd29y
a3MgZm9yIG1lLiBUaGFua3MuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
