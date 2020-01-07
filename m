Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36384132B0B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:23:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorbh-0005k9-7u; Tue, 07 Jan 2020 16:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iorbf-0005k4-Qr
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:21:23 +0000
X-Inumbo-ID: beac1fda-3169-11ea-ac52-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id beac1fda-3169-11ea-ac52-12813bfff9fa;
 Tue, 07 Jan 2020 16:21:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u2so115397wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 08:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=McpsGSYEAwj6EwnxeYRt4c8hCGI/lf18OA/OSWDcT2Q=;
 b=qMxUgdvHo4ARPVl2NbUhyK/iI1/XcfJcEdBgAg8J8vCw4ES8CHWPJM0Ehu4QpyEEwf
 xN5a11NRyvjZ5gsqa6wB3H47lI45uFPd8cliB1sDs78nBHrbyo2ZbsmRFEfHMWvgaoDg
 GjmwffD5Du1B/V3/yNGBfNnFf6PZ5C6AdS2P+apFr4/2/Az55H1A8BJTKbWT6pbEhMeK
 gPFEs+ZWimHmzM4otsF4b3Ni6yYI4nz19SepbiGB/1CMHTKr2Jp3fDWon695n8ZvfdBT
 9dbgTTkMCC/iecyAg6Qb1KJEqdWP3j2c03J6mPdESKUg5HVqtMmn6Aa8uTLzcKuDA/Q+
 YrhQ==
X-Gm-Message-State: APjAAAX1PvJCSniUd0dSke27zqTp9wE0dI+hVihaO1n9U6D4wBODycSy
 lsk88yOwvQimb+Qa0r+fHt6BQBRxqZQ=
X-Google-Smtp-Source: APXvYqwHRDIJ2daZCnBTK1bVMsJvrKTPQTJuwowT/QdxbP2SUQkHkJ2Y4leDOkk1s8+JPwfU3lEdQw==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr42160931wmk.68.1578414082580; 
 Tue, 07 Jan 2020 08:21:22 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id x11sm385985wre.68.2020.01.07.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:21:22 -0800 (PST)
Date: Tue, 7 Jan 2020 16:21:08 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107162108.ucmszmuin4ky2vog@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <f6f79ad5-4d71-d4fd-7ee6-4f2e7c4aba71@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6f79ad5-4d71-d4fd-7ee6-4f2e7c4aba71@suse.com>
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTA6Mzg6MjNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6ClsuLi5dCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19yZXBfaHlw
ZXJjYWxsKHVpbnQxNl90IGNvZGUsIHVpbnQxNl90IHJlcF9jb3VudCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgdmFyaGVhZF9zaXplLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGlu
cHV0LCBwYWRkcl90IG91dHB1dCkKPiA+ICt7Cj4gPiArICAgIHVpbnQ2NF90IGNvbnRyb2wgPSBj
b2RlOwo+ID4gKyAgICB1aW50NjRfdCBzdGF0dXM7Cj4gPiArICAgIHVpbnQxNl90IHJlcF9jb21w
Owo+ID4gKwo+ID4gKyAgICBjb250cm9sIHw9ICh1aW50NjRfdCl2YXJoZWFkX3NpemUgPDwgSFZf
SFlQRVJDQUxMX1ZBUkhFQURfT0ZGU0VUOwo+ID4gKyAgICBjb250cm9sIHw9ICh1aW50NjRfdCly
ZXBfY291bnQgPDwgSFZfSFlQRVJDQUxMX1JFUF9DT01QX09GRlNFVDsKPiA+ICsKPiA+ICsgICAg
ZG8gewo+ID4gKyAgICAgICAgc3RhdHVzID0gaHZfZG9faHlwZXJjYWxsKGNvbnRyb2wsIGlucHV0
LCBvdXRwdXQpOwo+ID4gKyAgICAgICAgaWYgKCAoc3RhdHVzICYgSFZfSFlQRVJDQUxMX1JFU1VM
VF9NQVNLKSAhPSBIVl9TVEFUVVNfU1VDQ0VTUyApCj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4g
PiArCj4gPiArICAgICAgICByZXBfY29tcCA9IChzdGF0dXMgJiBIVl9IWVBFUkNBTExfUkVQX0NP
TVBfTUFTSykgPj4KPiA+ICsgICAgICAgICAgICBIVl9IWVBFUkNBTExfUkVQX0NPTVBfT0ZGU0VU
Owo+IAo+IE1BU0tfRVhUUigpPyAoSSB0aGVuIGFsc28gd29uZGVyIHdoZXRoZXIgTUFTS19JTlNS
KCkgd291bGQgYmV0dGVyIGJlCj4gdXNlZCB3aXRoIHNvbWUgb2YgdGhlIG90aGVyIGNvbnN0cnVj
dHMgaGVyZS4pCgpTdXJlLCBJIGNhbiBzZWUgaWYgdGhhdCBjYW4gYmUgdXNlZC4KCj4gCj4gV2hh
dCdzIHdvcnNlIHRob3VnaCAtIGxvb2tpbmcgYXQgdGhlIGRlZmluaXRpb24gb2YKPiBIVl9IWVBF
UkNBTExfUkVQX0NPTVBfTUFTSyBJIG5vdGljZSB0aGF0IGl0IGFuZCBhIGZldyBvdGhlcnMgdXNl
Cj4gR0VOTUFTS19VTEwoKSwgd2hlbiBpdCB3YXMgY2xlYXJseSBzYWlkIGR1cmluZyByZXZpZXcg
KHBlcmhhcHMgb2YKPiBhbm90aGVyIGJ1dCByZWxhdGVkIHBhdGNoKSB0aGF0IHRoaXMgbWFjcm8g
c2hvdWxkIG5vdCBiZSB1c2VkCj4gb3V0c2lkZSBvZiBBcm0tc3BlY2lmaWMgY29kZSB1bnRpbCBp
dCBnZXRzIHB1dCBpbnRvIGJldHRlciBzaGFwZToKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTIvbXNnMDA3MDUuaHRtbAoKVGhhdCdz
IGEgc3RyYWlnaHQgaW1wb3J0IGZyb20gTGludXguIEkgb25seSBtYWRlIHRoZSBoZWFkZXIgYnVp
bGQKd2l0aG91dCBmdXJ0aGVyIGluc3BlY3Rpb24uCgpUaGF0IGNhbiBiZSBmaXhlZCwgb2YgY291
cnNlLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
