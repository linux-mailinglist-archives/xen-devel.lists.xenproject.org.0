Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF9140F97
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 18:03:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUz2-0001yS-N8; Fri, 17 Jan 2020 17:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1eFk=3G=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1isUz1-0001yN-5K
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 17:00:31 +0000
X-Inumbo-ID: d8a49eba-394a-11ea-b833-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8a49eba-394a-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 17:00:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579280422; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=aqpQwbjiYXYaqqxa/o6yfjgh2+V+Yi1BZ5ok1LpL/e4=;
 b=C4v/UYY/3KsRZgNNTab1K9+TrIVNmb1YZv+ws34ZZCWolC0mF24gsXYWkvBx6nGUUOSvoJ9K
 N4Pt4buihuKpJQYKFYjImBBRNPyK5nX4HFRPfib+BaSfuEC/ovfTDfUw9bx+oHpFXB7D9+La
 q14KzXtsfF/fWaII4NfTk5kIpuQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5e21e81e.7fdab33fe670-smtp-out-n02;
 Fri, 17 Jan 2020 17:00:14 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p17so8378012wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 09:00:13 -0800 (PST)
X-Gm-Message-State: APjAAAVquFplrXa1R14Xn03O+pFjIQ6OPuUHL9yrzFGFLLXrOpT6969U
 AlYFQXfyu+SMoay+7FbCTeol7cuqfV0TnYGuhZI=
X-Google-Smtp-Source: APXvYqy8eHxbGkrsFRuhJ0NNp3E2HeVnzqE/atT5VKsNtWTd5DlGClnnd6hkJSgxfzQWCAtyVdvRB+X44b4dvJYTjPI=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr5695959wmm.77.1579280412244; 
 Fri, 17 Jan 2020 09:00:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <631aece1177fcd2326855f0ff4b53dadfcfc3680.1578503483.git.tamas.lengyel@intel.com>
 <1ea9f58b-5f86-7450-d0e3-d17252b94b20@suse.com>
 <CABfawhnxpuYsmidRtXY+o0B5Woj8OsbbsahHtWnsrqQk_1vOdw@mail.gmail.com>
 <e8d6f0cc-a5e8-c027-e644-51dfbba07ced@suse.com>
In-Reply-To: <e8d6f0cc-a5e8-c027-e644-51dfbba07ced@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 Jan 2020 09:59:35 -0700
X-Gmail-Original-Message-ID: <CABfawhnkme_RP_RGJbuukrObJm-kFtzZ2tRXOBJ-bRkDO_YUYQ@mail.gmail.com>
Message-ID: <CABfawhnkme_RP_RGJbuukrObJm-kFtzZ2tRXOBJ-bRkDO_YUYQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 11/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMjoyMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTYuMDEuMjAyMCAxNzoxMiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgOTowNyBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jIHwgNDIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
PiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkK
PiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+Pj4gaW5kZXggOTNlNzYwNTkwMC4uM2Yz
NmNkNmJiYyAxMDA2NDQKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMK
PiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+Pj4gQEAgLTExMTcs
MTEgKzExMTcsMTkgQEAgaW50IGFkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNp
Z25lZCBsb25nIHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiA+Pj4gICAgICAgICAgZ290byBlcnJf
dW5sb2NrOwo+ID4+PiAgICAgIH0KPiA+Pj4KPiA+Pj4gKyAgICAvKgo+ID4+PiArICAgICAqIE11
c3Qgc3VjY2VlZCwgd2UganVzdCByZWFkIHRoZSBlbnRyeSBhbmQgaG9sZCB0aGUgcDJtIGxvY2sK
PiA+Pj4gKyAgICAgKiB2aWEgZ2V0X3R3b19nZm5zLgo+ID4+PiArICAgICAqLwo+ID4+PiAgICAg
IHJldCA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKGNnZm4pLCBzbWZuLCBQQUdFX09SREVSXzRL
LAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3JhbV9zaGFyZWQsIGEpOwo+ID4+
PiArICAgIEFTU0VSVCghcmV0KTsKPiA+Pgo+ID4+IEFuZCB0aGVyZSdzIG5vIHJpc2sgb2YgLUVO
T01FTSBiZWNhdXNlIG9mIG5lZWRpbmcgdG8gc3BsaXQgYQo+ID4+IGxhcmdlciBvcmRlciBwYWdl
PyBBdCB0aGUgdmVyeSBsZWFzdCB0aGUgcmVhc29uaW5nIGluIHRoZQo+ID4+IGNvbW1lbnQgd291
bGQgbmVlZCBmdXJ0aGVyIGV4dGVuZGluZy4KPiA+Cj4gPiBObyBiZWNhdXNlIHdlIGFyZSBwbHVn
Z2luZyBhIGhvbGUgaW4gdGhlIGRvbWFpbi4gVGhlcmUgaXMgbm8gbGFyZ2VyCj4gPiBwYWdlIG1h
cHBlZCBpbiBoZXJlIHRoYXQgd291bGQgbmVlZCB0byBiZSBicm9rZW4gdXAuCj4KPiBwMm1faXNf
aG9sZSgpIGFsc28gY292ZXJzIHAybV9tbWlvX2RtIGFuZCBwMm1faW52YWxpZC4gVGhlIGZvcm1l
cgo+IChzaG91bGQgcmVhbGx5IGJlIHRoZSBsYXR0ZXIpIGlzIHdoYXQgeW91J2xsIGdldCBiYWNr
IGZvciBlLmcuIGEKPiBHRk4gYmV5b25kIG1heF9tYXBwZWRfcGZuLiBBaXVpIHN1Y2ggYSAic2V0
IiBtYXkgdGhlbiByZXF1aXJlCj4gdGFibGUgcG9wdWxhdGlvbiwgd2hpY2ggbWF5IHN0aWxsIHlp
ZWxkIC1FTk9NRU0gKGF0IGxlYXN0IEVQVAo+IGxvb2tzIHRvIHJldHVybiAtRU5PRU5UIGluIHRo
aXMgY2FzZSBpbnN0ZWFkOyBJIGd1ZXNzIEknbGwgbWFrZQo+IGEgcGF0Y2gpLgoKWWVzLCBhY3R1
YWxseSB0aGF0IGlzIHdoYXQncyBleHBlY3RlZCBpbiB0aGUgZm9yayBjYXNlIHRvIGhhcHBlbiBz
aW5jZQp0aGUgZm9yayBoYXMgbm8gZW50cmllcyBpbiBpdHMgRVBUIHdoZW4gaXQgc3RhcnRzIGF0
IGFsbC4gU28gdGhlcmUKd2lsbCBiZSBhbGxvY2F0aW9ucyBoYXBwZW5pbmcgdGhlcmUgZm9yIHRo
ZSBwYWdldGFibGUgZW50cmllcy4gQnV0IGZvcgpmb3JrcyB0aGF0J3Mgbm90IG9mIGNvbmNlcm4g
c2luY2Ugd2UnbGwgc2V0dXAgdGhlIHNhbWUgSEFQIGFsbG9jYXRpb24KdGhlIHBhcmVudCBWTSBo
YXMgZHVyaW5nIHRoZSBmb3JrIGh5cGVyY2FsbC4gU28gaXQgaXMgZ3VhcmFudGVlZCB0aGF0CnRo
ZSBmb3JrIHdpbGwgaGF2ZSB0aGUgc2FtZSBhbW91bnQgb2YgbWVtb3J5IGZvciBpdHMgcGFnZXRh
YmxlcyBpdHMKcGFyZW50IGhhcy4KCk5vdyBhcyBmb3IgdXNpbmcgYWRkX3RvX3BoeXNtYXAgb24g
YSBub24tZm9ya2VkIFZNIHdoZW4gcGx1Z2dpbmcgYQpob2xlIGxpa2UgdGhhdCwgeWVzLCBJIGd1
ZXNzIHRoZXJlIGlzIHRoZSBwb3NzaWJpbGl0eSB0aGF0IHRoZSBWTSBpcwpnb2luZyB0byBydW4g
b3V0IG9mIHNwYWNlIGZvciBpdHMgcGFnZXRhYmxlLiBTbyBJIGd1ZXNzIHdlIHNob3VsZCBza2lw
CnRoaXMgcGF0Y2guCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
