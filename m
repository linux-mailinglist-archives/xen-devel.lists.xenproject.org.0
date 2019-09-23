Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FABB56D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOTE-0001BN-Ts; Mon, 23 Sep 2019 13:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCOTD-0001BD-9q
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:33:39 +0000
X-Inumbo-ID: bfcbc58e-de06-11e9-b299-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfcbc58e-de06-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 13:33:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v8so14006775wrt.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 06:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZsHRYdqxSEpIG7KN13K5ISD2MF2s+uPRIqugfKlQ35o=;
 b=GOuRy3azDBzS+llsqxC1l6ZSU+AOLxP91lwdNmtoXDQ90cx62vZGh60lvDcXlsokUt
 pOOK29yw1i8mNPEhR2Y6TFAcADS86RcBRyrTeuSbpr7wUwNJBVoZSp4J8U/oYFRf+2Q3
 9a0VEHFVd1wiKeDtnHlzhJcvd7SAHkjzL46ym8EVtAi4H+DhRYPkLlMf7SZfGCicCdAX
 +CfxccECuzaof0T34u0yBFtElNPnwx4esKf1p7WSp1/kT4CIBfqr92TfZQjsBVdnDVQM
 0UKgLOPNVNp3OVXxobaSn9AnLk2FZgDqYgX6XodWxAXLADZn/T7s2tnDjEIfxwXht9m2
 zVNA==
X-Gm-Message-State: APjAAAU+o16eBd9N5PtkfEOzW9z0LmlZMcHThwX7V1q4uraKbSMb6OHE
 0y3J/U8DQi0sG5JJGfEW/gU=
X-Google-Smtp-Source: APXvYqw6AX9omAscI+5+bYVieRjDCW8dcClHWQGkG4PXxUELJXThs4Yl5WhbYlRfmAhuPEiZlpFkNQ==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr10733116wrb.233.1569245617725; 
 Mon, 23 Sep 2019 06:33:37 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id 94sm7418774wrk.92.2019.09.23.06.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:33:37 -0700 (PDT)
Date: Mon, 23 Sep 2019 14:33:35 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190923133335.ktlnpbxqnanraytq@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
 <20190923125431.mpoyvjj7dz6ef4df@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923125431.mpoyvjj7dz6ef4df@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, 'Wei Liu' <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGEgYml0IG1vcmUgdGhvdWdodC4KCk9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDAxOjU0OjMx
UE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6ClsuLi5dCj4gPiA+IAo+ID4gPiBQZXIgVExGUywgZVZN
Q1Mgc2hvdWxkIGJlIHVzZWQgYnkgTDEgWGVuLgo+ID4gCj4gPiBZZXMsIEkgZ3Vlc3MgaXQgb25s
eSBuZWVkcyB0byBiZSB1c2VkIGJ5IEwxLCBidXQgV2luZG93cyBpcyB1c2luZyBhbgo+ID4gaW5j
cmVhc2luZyBudW1iZXIgb2YgVk1zIGZvciB2YXJpb3VzIHB1cnBvc2VzIHNvIEkgdGhpbmsgbWFr
aW5nIGl0Cj4gPiBzdGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KPiA+IAo+ID4gPiAKPiA+ID4g
Tm90IHN1cmUgd2hhdCB5b3UgbWVhbnQgYnkgRVBUIGZsdXNoLiBJZiB5b3UgbWVhbiB0aGluZ3Mg
bGlrZQo+ID4gPiBIdkZsdXNoR3Vlc3RQaHlzaWNhbEFkZHJlc3NTcGFjZSwgSSB0aGluayB0aGV5
IHNob3VsZCBiZSB1c2VkIGJ5IFhlbgo+ID4gPiBvbmx5IGFzIHdlbGwuIEknbSBub3Qgc3VyZSB3
aGV0aGVyIHRoZXkgc2hvdWxkIGJlIGV4cG9zZSB0byBMMiBndWVzdHMuCj4gPiA+IAo+ID4gCj4g
PiBZZXMsIHRoYXQncyB3aGF0IEkgbWVhbnQgYW5kLCBhZ2FpbiwgSSB3YXMgdGhpbmtpbmcgYWJv
dXQgdGhlIG5lc3RlZAo+ID4gV2luZG93cyBndWVzdCB1c2luZyBWTXMgaXRzZWxmLgo+IAo+IFNv
IHRoaXMgaXMgYmFzaWNhbGx5IG5lc3RlZCBvbiBuZXN0ZWQuIEknbSBub3Qgc3VyZSBob3cgdG8g
bWFrZSB0aGF0Cj4gd29yayB5ZXQuICBJJ20gYWxzbyBub3Qgc3VyZSBob3cgd2VsbCB0aGVzZSBp
bnRlcmZhY2VzIHN0YWNrLiBUTEZTIG9ubHkKPiBkZXNjcmliZXMgb25lIGxldmVsIG9mIG5lc3Rp
bmcuIEkgd2lsbCBuZWVkIHRvIGFzayBpZiB3ZSBjYW4gbWFrZSBuZXN0ZWQKPiBvbiBuZXN0ZWQg
d29yay4KPiAKClNpbmNlIEwyIFJvb3QgaXMgV2luZG93cyBpbiBhIEh5cGVyLVYgc2V0dXAsIGNo
YW5jZXMgYXJlIHdoYXQgeW91IHdhbnQKYWxyZWFkeSB3b3Jrcy4gT2YgY291cnNlIHRoaXMgZGVw
ZW5kcyBvbiB3aGV0aGVyIFdpbmRvd3MsIHdoZW4gcnVubmluZwphcyBSb290IG9yIENoaWxkLCB1
c2VzIFZNIHJlbGF0ZWQgZmVhdHVyZXMuCgpJJ20gbm90IHZlcnNlZCBpbiBXaW5kb3dzIGZlYXR1
cmVzLiBJZiB5b3UgaGF2ZSBzcGVjaWZpYyB0aGluZ3MgaW4gbWluZCwKSSBjYW4gYXNrIGZvciBt
b3JlIGRldGFpbHMgYW5kIHRoaW5rIGFib3V0IGhvdyB0byBpbXBsZW1lbnQgdGhlbSBpbiBYZW4u
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
