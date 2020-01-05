Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AEB130A02
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 22:26:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioDM5-0003u3-Uo; Sun, 05 Jan 2020 21:22:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ioDM4-0003ty-1h
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 21:22:36 +0000
X-Inumbo-ID: 7cdc32d5-3001-11ea-aa77-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cdc32d5-3001-11ea-aa77-12813bfff9fa;
 Sun, 05 Jan 2020 21:22:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so35016600wru.4
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 13:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zdlyB2wOXPo9zxe3l0np1j0Gbw7XwPfWktqt/fl/Dg8=;
 b=lH56YaFCLtZUv4ggkzHV9ustoW5JTdkqqiWCx9Krs46Wfc/cLPQQJiyvRaB1em1hcD
 zbcEqESyBtrUtokkk4UpQ+7+U6+ZXALpAvmzcewTj+FLArcTB/henkkrzZ0VKLv3I71t
 cYGTH+aVIJ7qZszGvhPXRZGwm+T71lBSSycTEyPxnxuA/JM9jWLbo0zepzuPbJNZopqp
 ScctseRlnppHwZOBxqIcyCqyUkAOPlYKTR7cf1JE2w5RE+hLPyqGn/CY/WMdvO/4zAAe
 yYShRS3nawQKRtiLziWJ5TO5Eol4eQ1dXJO//vyJiyXy13EhpsHxPBYiHs7BS6KCcVV6
 PcZw==
X-Gm-Message-State: APjAAAWhYLs3Y/+5+eKOMrnp4fIXi+dee2f444F3u6Xb4xaxeCT/l7kA
 ugXwWR0KeTx0Rc19YSiBj2s=
X-Google-Smtp-Source: APXvYqzntTbp/Oir2VZqnPc+6KEO+Mxw5ugbLdMJ5RoWgAR9kkBVNG2O27SJhxNXC5CvypezPEbdVg==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr69203614wrs.222.1578259354178; 
 Sun, 05 Jan 2020 13:22:34 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id e8sm69832113wrt.7.2020.01.05.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 13:22:33 -0800 (PST)
Date: Sun, 5 Jan 2020 21:22:31 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200105212231.ty7cjfdu5di5sf4j@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
 hypercall functions
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

T24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMDc6MDg6MjhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAKPiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50
NjRfdCBjb250cm9sLCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKPiA+ICt7Cj4gPiAr
ICAgIHVpbnQ2NF90IHN0YXR1czsKPiA+ICsKPiA+ICsgICAgYXNtIHZvbGF0aWxlICgibW92ICVb
b3V0cHV0XSwgJSVyOFxuIgo+ID4gKyAgICAgICAgICAgICAgICAgICJjYWxsIGh2X2h5cGVyY2Fs
bF9wYWdlIgo+ID4gKyAgICAgICAgICAgICAgICAgIDogIj1hIiAoc3RhdHVzKSwgIitjIiAoY29u
dHJvbCksCj4gPiArICAgICAgICAgICAgICAgICAgICAiK2QiIChpbnB1dCkgQVNNX0NBTExfQ09O
U1RSQUlOVAo+ID4gKyAgICAgICAgICAgICAgICAgIDogW291dHB1dF0gInJtIiAob3V0cHV0KQo+
ID4gKyAgICAgICAgICAgICAgICAgIDogImNjIiwgIm1lbW9yeSIsICJyOCIsICJyOSIsICJyMTAi
LCAicjExIik7Cj4gCj4gSSB0aGluayB5b3Ugd2FudDoKPiAKPiByZWdpc3RlciB1bnNpZ25lZCBs
b25nIHI4IGFzbSgicjgiKSA9IG91dHB1dDsKPiAKPiBhbmQgIityIiAocjgpIGFzIGFuIG91dHB1
dCBjb25zdHJhaW50LgoKQWx0aG91Z2ggaXQgaXMgbmFtZWQgYG91dHB1dGAsIGl0IGlzIHJlYWxs
eSBqdXN0IGFuIGlucHV0IHBhcmFtZXRlciBmcm9tCkh5cGVyLVYncyBQb1YuIEl0IGNvbnRhaW5z
IHRoZSBhZGRyZXNzIG9mIHRoZSBwYWdlIEh5cGVyLVYgc2hvdWxkIHdyaXRlCml0cyBvdXRwdXQg
dG8uCgo+IAo+IEluIHBhcnRpY3VsYXIsIHRoYXQgZG9lc24ndCBmb3JjZSB0aGUgY29tcGlsZXIg
dG8gcHV0IG91dHB1dCBpbnRvIGEKPiByZWdpc3RlciBvdGhlciB0aGFuIHI4IChvciB3b3JzZSwg
c3BpbGwgaXQgdG8gdGhlIHN0YWNrKSB0byBoYXZlIHRoZQo+IG9wYXF1ZSBibG9iIG9mIGFzbSBt
b3ZlIGl0IGJhY2sgaW50byByOC7CoCBXaGF0IGl0IHdpbGwgZG8gaW4gcHJhY3RpY2UgaXMKPiBj
YXVzZSB0aGUgY29tcGlsZXIgdG8gY29uc3RydWN0IG91dHB1dCBkaXJlY3RseSBpbiByOC4KPiAK
PiBBcyBmb3IgdGhlIG90aGVyIGNsb2JiZXJzLCBJIGNhbid0IGZpbmQgYW55dGhpbmcgYXQgYWxs
IGluIHRoZSBzcGVjCj4gd2hpY2ggZXZlbiBtZW50aW9ucyB0aG9zZSByZWdpc3RlcnMuwqAgVGhl
cmUgd2lsbCBiZSBhIGRlY2VudCBpbXByb3ZlbWVudAo+IHRvIGNvZGUgZ2VuZXJhdGlvbiBpZiB3
ZSBkb24ndCBmb3JjZSB0aGVtIHRvIGJlIHNwaWxsZWQgYXJvdW5kIGEgaHlwZXJjYWxsLgo+IAoK
TmVpdGhlciBjYW4gSS4gQnV0IExpbnV4J3MgY29tbWl0IHNheXMgdGhhdCdzIG5lZWRlZCwgc28g
SSBjaG9zZSB0byBlcnIKb24gdGhlIHNhZmUgc2lkZS4KCkknbSBmaW5lIHdpdGggZHJvcHBpbmcg
cjktcjExLgoKPiBIb3dldmVyLCBIeXBlclYgd2lsbChtYXk/KSBtb2RpZnkgJXhtbXswLi41fSBp
biBzb21lIGNhc2VzLCBhbmQgdGhpcwo+IHdpbGwgY29ycnVwdCB0aGUgY3VycmVudCB2Y3B1J3Mg
RlBVIGNvbnRleHQuwqAgQ2FyZSB3aWxsIG5lZWQgdG8gYmUgdGFrZW4KPiB0byBzcGlsbCB0aGVz
ZSBpZiBuZWNlc3NhcnkuCj4gCgpUaGUgaHlwZXJjYWxscyB3ZSBjYXJlIGFib3V0IChUTEIsIEFQ
SUMgZXRjKSBkb24ndCB1c2UgdGhhdCBBQkkgYXMgZmFyCmFzIEkgY2FuIHRlbGwuIEF0IHRoZSB2
ZXJ5IGxlYXN0IExpbnV4LCB3aGljaCB1c2VzIHRoZSBzYW1lIHNldCBvZgpoeXBlcmNhbGxzLCBk
b2Vzbid0IG5lZWQgdG8gc2F2ZSAvIHJlc3RvcmUgWE1NIHJlZ2lzdGVycyBhcm91bmQgdGhlCmNh
bGxzLgoKV2VpLgoKPiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
