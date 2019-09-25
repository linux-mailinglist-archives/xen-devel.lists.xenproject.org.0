Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2CBE100
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8zM-0004Kk-Mg; Wed, 25 Sep 2019 15:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD8zK-0004Ke-HX
 for Xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:13:54 +0000
X-Inumbo-ID: 158e2114-dfa7-11e9-9636-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by localhost (Halon) with ESMTPS
 id 158e2114-dfa7-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:13:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y19so7395950wrd.3
 for <Xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 08:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dO70tgP/a++nIXKut/OTUmebXkeG/w+RhCBieXa0Oac=;
 b=WTWfhM1RSmO9UYgvewbLBsoA8mT8y2cvMfWVZwb70TcJkJKRJuHnsxUrU5HTOkynkG
 QAdzvChCJ1dhlar0aqvJZsztYLVDCUBD8OpUhhKsvxmqTjjuQaXs9vHvvJKb95ADpUcN
 5QNEl60iKLH18genLfcWcFLvqc1KcI9dZp9pXIMu8YkhxmQCsr4saLDlEp4u4ZzYW+il
 CCrHKZNScLka2BcmM0w/WQxaUlLsfLqeP+puIDmvopGVwifV/KGp9WOtjKWmdIIfMMk2
 aiWst0O6k61Qh3LlDMblS4JB6IVOGuYnhuQvaabhIzHnkpwLM7FHMrgGLWplNEyYd+6A
 +1LQ==
X-Gm-Message-State: APjAAAWHeiZ2vz+tllB8Nya5fPeOgELAskmlaMH9+fsiNdLZBk17f+rO
 V+bdeqkobWOkUqtDbpm29hE=
X-Google-Smtp-Source: APXvYqykMqmw3ZsFs1uBMkNzFRQiJE7ci/jovQoPU9Vp8pfDnudg2bGKtzTi9sTOOVxC+dURh+amIw==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr10108502wrv.248.1569424432128; 
 Wed, 25 Sep 2019 08:13:52 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id 13sm3887086wmj.29.2019.09.25.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:13:51 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:13:49 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190925151349.43fqwaf6roh5627s@debian>
References: <20190925143410.26661-1-hongyax@u9d785c4ba99158.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925143410.26661-1-hongyax@u9d785c4ba99158.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 00/84] Remove direct map from Xen
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
Cc: Xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, wl@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbgoKVGhhbmtzIGZvciBwaWNraW5nIHVwIHRoaXMgd29yay4KClBsZWFzZSBDQyBy
ZWxldmFudCBtYWludGFpbmVycyBhbmQgcmV2aWV3ZXJzIGluIHRoZSBmdXR1cmUuIEkgaGF2ZSBk
b25lCnRoaXMgZm9yIHRoaXMgY292ZXIgbGV0dGVyLgoKVGhlIEZyb206IGZpZWxkIG9mIHlvdXIg
ZW1haWxzIGlzIG5vdCBjb3JyZWN0LiBUaGlzIG1ha2VzIHBlb3BsZSBub3QKYWJsZSB0byByZXBs
eSB0byB5b3UgZGlyZWN0bHkuIFlvdSBtYXkgd2FudCB0byBjaGVjayB5b3VyIGVtYWlsCnNldHRp
bmdzLgoKT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDM6MzI6NDZQTSArMDEwMCwgaG9uZ3lheCB3
cm90ZToKPiBQcmV2aW91c2x5LCBXZWkgTGl1IGhhcyBjcmVhdGVkIHRoZSBwYXRjaCBzZXJpZXMg
dG8gc3dpdGNoIHRvCj4gYWxsb2MvbWFwL3VubWFwL2ZyZWUgQVBJcyBmb3IgWGVuIHBhZ2UgdGFi
bGVzIHNvIHRoYXQgWGVuIHBhZ2UgdGFibGVzCj4gYXJlIG1hcHBlZCB3aXRoIG1hcF9kb21haW5f
cGFnZSgpLiBUaGlzIGlzIHRoZSBmaXJzdCBzdGVwIHRvd2FyZHMKPiByZW1vdmluZyB0aGUgZGly
ZWN0IG1hcC4gSSBpbXBsZW1lbnRlZCBwYXRjaGVzIG9uIHRvcCBvZiBXZWkncyB0byByZW1vdmUK
PiB0aGUgZGlyZWN0IG1hcCBjb21wbGV0ZWx5Lgo+IAo+IEluIGFkZGl0aW9uIHRvIFdlaSdzLCBt
eSBwYXRjaGVzOgo+IC0gaW1wbGVtZW50IGEgcHJvcGVyIFBNQVAgaW5mcmFzdHJ1Y3R1cmUgZm9y
IGJvb3RzdHJhcHBpbmcKPiAtIHJlbW92ZSBkaXJlY3QgbWFwIGNvZGUgaW4gbWFwX2RvbWFpbl9w
YWdlKCkgYW5kIHVzZSBtYXBjYWNoZSwgdXNlIFBNQVAKPiAgIHdoZW4gbWFwY2FjaGUgbm90IHJl
YWR5Cj4gLSBtYXAvdW5tYXAgeGVuaGVhcCBhbGxvY2F0aW9ucyB0byB0aGUgZGlyZWN0IG1hcCBy
ZWdpb24gc28gdGhhdCB2YTwtPnBhCj4gICBtYWNyb3Mgc3RpbGwgd29yawo+IC0gaW5zdGFsbCBk
dW1teSBtYXBwaW5ncyAobm8gcGVybWlzc2lvbnMsIElOVkFMSURfTUZOKSBpbnN0ZWFkIG9mIGFj
dHVhbAo+ICAgMToxIG1hcHBpbmdzIGR1cmluZyBib290LCBzbyB0aGUgZGlyZWN0IG1hcCBubyBs
b25nZXIgZXhpc3RzCj4gLSBmaXggbWFueSBwbGFjZXMgd2hlcmUgY29kZSBpbmNvcnJlY3RseSBh
c3N1bWVzIGEgZGlyZWN0IG1hcAo+IAoKSSB0aGluayB0aGUgc2VyaWVzIHdpbGwgbmVlZCBzb21l
IHJlb3JkZXJpbmcganVzdCBieSBsb29raW5nIGF0IHRoZQp0aGluZ3MgbGlzdGVkIGhlcmUgYW5k
IHRoZSBjb21taXQgc3ViamVjdHMuICBJIHdpbGwgdHJ5IHRvIGhhdmUgYSBjbG9zZXIKbG9vayBh
dCBzb21lIHBvaW50LiAgUGxlYXNlIGFsc28gYWxsb3cgc29tZSB0aW1lIGZvciBvdGhlciBwZW9w
bGUgdG8KaGF2ZSB0aGVpciBzYXkuIFhlbiBpcyBhYm91dCB0byBmcmVlemUgKG9yIGZyb3plbiBh
bHJlYWR5Pykgc28gcGVvcGxlCm1heSBub3QgZ2V0IGFyb3VuZCB0byB0aGlzIGxhcmdlIHNlcmll
cyBhbnkgdGltZSBzb29uLgoKQW5kIGluIGNhc2UgeW91IGRvbid0IGtub3csIHRoZXJlIGlzIGEg
d2lraSBwYWdlIFswXSBmb3Igc3VibWl0dGluZyBYZW4KcGF0Y2hlcy4gSW4gaXQgdGhlcmUgaXMg
YSBzZWN0aW9uIGFib3V0IGFkZF9tYWludGFpbmVycy5wbC4gWW91IGNhbiB1c2UKdGhhdCBzY3Jp
cHQgdG8gYWRkIHJlbGV2YW50IG1haW50YWluZXJzLgoKVGhhbmtzLApXZWkuCgpbMF06IGh0dHBz
Oi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hl
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
