Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F07BF030
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRLd-0003vg-Gl; Thu, 26 Sep 2019 10:50:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDRLb-0003sO-Iw
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:50:07 +0000
X-Inumbo-ID: 66db3f6c-e04b-11e9-bf31-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id 66db3f6c-e04b-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 10:50:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h7so1884589wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 03:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lbBEpBnOR3CbwRruobX3uPQZPDR7VePwiqiq4SnwjnE=;
 b=YwXDmn/6GhCO4JveagtsaOcKkDmJDTa3nuXuX4AKagiCGQp+EOSWxGDCo20/v+ZE+M
 8XPL3KajOfuY+zjUCIXyBMXcPhqlpjg5EIt7mFhm+2xxWQXQlTKTgJe5lp4krmw0uBiw
 FlXspR5NL41sI0KTMtZpL8SbYm8ocRdQrVruYwu0LZY1gr4EMqLp4nz34UY7BrGlCTbN
 tMYG2RB4/+EMDSuxDD5NtsoqRKRKvMFdwOrqzWq3p9BcabKp5nqGlu2NvUNMdtqk7lCr
 dyiC3J6Pqi01uO8e4cyEvXqfmNrgm9MpRnMDhLPZPrymaX8JYIz7gfRw9ObiqMnI+iKs
 s+HQ==
X-Gm-Message-State: APjAAAWbQOV0TpVxSp3Ani53XCY0gWiAkMmeyDCfo9refuWiZnJaQ4SX
 4iR6eWQT77gvuD/Frr/pmAU=
X-Google-Smtp-Source: APXvYqw7S515Lb306MSyOAyRYPzCz3edXPWfXb0hFKjkB8Qt7pG9MqFqfFz+ljNw+m885nTGVgu51A==
X-Received: by 2002:adf:e692:: with SMTP id r18mr2297247wrm.339.1569495006090; 
 Thu, 26 Sep 2019 03:50:06 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id w18sm2161880wmc.9.2019.09.26.03.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 03:50:05 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:50:03 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190926105003.7ylqn3d3jdmheip6@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190925110250.vshhg52xlrmafpka@Air-de-Roger>
 <20190925153634.wjlxjnz6egibqypg@debian>
 <20190926104104.6sbcirvdkayktsud@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926104104.6sbcirvdkayktsud@Air-de-Roger>
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NDE6MDRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAwNDozNjozNFBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDE6MDI6NTBQTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6
MDk6MjNBTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBIaSBhbGwKPiA+ID4gPiAKPiA+
ID4gPiBJbiBjYXNlIHlvdSdyZSB3b25kZXJpbmcsIEkgY2FuIGFscmVhZHkgcnVuIGEgZnVsbHkg
ZmxlZGdlZCBYZW4gc3lzdGVtIG9uCj4gPiA+ID4gSHlwZXItViB3aXRoIGVtdWxhdGVkIGRpc2sg
YW5kIG5ldHdvcmsuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBpcyB0aGUgdmVyeSBmaXJzdCBzdGFn
ZSBmb3IgcG9ydGluZyBYZW4gdG8gcnVuIG9uIEh5cGVyLVYgd2l0aCBhbGwgdGhlCj4gPiA+ID4g
Z29vZGllcyBIeXBlci1WIGhhcyB0byBvZmZlci4gIFdpdGggdGhpcyBzZXJpZXMsIFhlbiBjYW4g
c3VjY2Vzc2Z1bGx5IGRldGVjdAo+ID4gPiA+IEh5cGVyLVYgYW5kIHByaW50cyBvdXQgYSBtZXNz
YWdlLiAgSSB3b3VsZCBsaWtlIHRvIGZpcnN0IGdldCB0aGUgZGlyZWN0b3J5Cj4gPiA+ID4gc3Ry
dWN0dXJlIGFuZCBrY29uZmlnIG9wdGlvbnMgYWdyZWVkIHVwb24uCj4gPiA+ID4gCj4gPiA+ID4g
VGhlcmUgYXJlIHR3byBtYWpvciBhcmVhcyB0byBiZSB3b3JrZWQgb246Cj4gPiA+ID4gICAqIE1h
a2UgRG9tMCBhYmxlIHRvIHVzZSBIeXBlci1WJ3Mgc3ludGhldGljIGRldmljZXMuCj4gPiA+ID4g
ICAqIE1ha2UgWGVuIHVzZSBvZiB0aGUgc3ludGhldGljIHRpbWVyLCByZWZlcmVuY2UgVFNDIGFu
ZCBlbmxpZ2h0ZW5tZW50IFZNQ1MKPiA+ID4gPiAgICAgYW5kIG90aGVyIGludGVyZmFjZXMuCj4g
PiA+ID4gCj4gPiA+ID4gVGhleSBhcmVuJ3QgdHJpdmlhbCwgYW5kIHRpbWUgY2FuIGJlIHNjYXJj
ZSBvbiBteSBzaWRlLCBzbyBJIGludGVuZCB0byBwb3N0Cj4gPiA+ID4gcGF0Y2hlcyBwaWVjZSBt
ZWFsIHdoZW4gdGhleSBhcmUgcmVhZHkuCj4gPiA+ID4gCj4gPiA+ID4gUXVlc3Rpb25zIGFuZCBj
b21tZW50cyBhcmUgd2VsY29tZS4KPiA+ID4gCj4gPiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyEK
PiA+ID4gCj4gPiA+IEluIHRoZSBwYXN0IEkndmUgcGxheWVkIHdpdGggdHJ5aW5nIHRvIGdldCBY
ZW4gdG8gYm9vdCBhcyBhIGd1ZXN0IG9uCj4gPiA+IEh5cGVyViBnZW4yIGluc3RhbmNlcywgYW5k
IEkgZGlkIG1hbmFnZSB0byBnZXQgaXQgYm9vdGluZywgTGludXgKPiA+ID4gaG93ZXZlciB3b3Vs
ZCBnZXQgZXh0cmVtZWx5IGNvbmZ1c2VkIGJlY2F1c2UgZ2VuMiBsYWNrcyBlbXVsYXRlZAo+ID4g
PiBkZXZpY2VzIGFuZCBpbnN0ZWFkIHRoZSBndWVzdCBpcyBmb3JjZWQgdG8gdXNlIHRoZSBIeXBl
clYgUFYgZGV2aWNlcwo+ID4gPiBBRkFJSy4KPiA+IAo+ID4gSG93IGRpZCB5b3UgZm9yY2UgTGlu
dXggdG8gdXNlIEh5cGVyLVYgUFYgZGV2aWNlcz8gCj4gCj4gSSBkaWRuJ3QsIHRoYXQncyB3aGVy
ZSBJIHN0b3BwZWQuIEkganVzdCBtYW5hZ2VkIHRvIGdldCBYZW4KPiBib290aW5nIG9uIGdlbjIs
IGJ1dCBMaW51eCBkb20wIHdvbid0IGJvb3QgZHVlIHRvIHdoYXQgeW91IHBvaW50ZWQgb3V0Cj4g
YmVsb3cuCgpPSy4gVGhhbmtzIGZvciBjbGFyaWZpY2F0aW9uLgoKSSB0aGluayB3aGVuIHRoZSBw
b3J0IGlzIGNvbXBsZXRlIGEgWGVuIHN5c3RlbSBzaG91bGQgYmUgYWJsZSB0byBib290IG9uCmJv
dGggR2VuMSBhbmQgR2VuMi4KCldlaS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
