Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B096D1793B9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:39:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W52-0003co-I9; Wed, 04 Mar 2020 15:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9W51-0003cd-H4
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:37:03 +0000
X-Inumbo-ID: fe44165c-5e2d-11ea-a426-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe44165c-5e2d-11ea-a426-12813bfff9fa;
 Wed, 04 Mar 2020 15:37:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e26so2324788wme.5
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 07:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f5YIgLDZlAt3nHUgB9BmU6BFPyDWsM1dHowXuMvzwVI=;
 b=Bi7vr92Bv2V1vKh/GVss36m8lhZJk0S0qUisSmLiLaA03lRAhWYZF1p1qz8kVRC6kU
 PyIepr6uHf90/nDbX9pWjMkFw2p7nHV3jATLm33NtezZ3ZbWTUM4VWHfdAnLXftD73Qu
 EwJV1NWbDWEDL0EPjqxZZgZh+HYl2z1fhpWWwhNPxXTCj7BlLS3GhH1GGW0vSonksMth
 GJ5/uM/z/bQqjggOjeqQ8PcmsRr5fbxTK0iGGFw1G2etmYummw3H90cdeHmvgY5/mM/V
 jJVecfU12QdSnJIb6C+A8fZlGo0ol85fIqhUYVksj4BK/9v0dZ+ZT8xSikPkOQFeKFOJ
 CraA==
X-Gm-Message-State: ANhLgQ2ZGv/Eo25PsH36anzDNAjv+Aez0GgbV8hJoR3eZa1pVhRnKjVy
 UnvonomShoHdEIVksohohEy3bh7JIBU5fA==
X-Google-Smtp-Source: ADFU+vse4DpeR7vysT3UvNlSos/1cuoeLqLDMwTIppsL/J0B4Bu/eR3UApzQob98OaQO8m9/KhSkAg==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr4296173wmf.142.1583336221701; 
 Wed, 04 Mar 2020 07:37:01 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id s2sm2455895wmj.15.2020.03.04.07.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 07:37:00 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200213105325.3022-1-pdurrant@amazon.com>
 <20200213105325.3022-2-pdurrant@amazon.com>
 <d5051ee2-23b3-5df8-f734-8269c40824b6@xen.org>
 <70f368cbff184707a701828860e6c5ac@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86b2f77c-583a-54e2-2a18-c379ac0983fb@xen.org>
Date: Wed, 4 Mar 2020 15:36:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <70f368cbff184707a701828860e6c5ac@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5 1/2] docs/designs: Add a design document
 for non-cooperative live migration
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDA0LzAzLzIwMjAgMTU6MjMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJv
dW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKdWxpZW4gR3JhbGwKPj4g
U2VudDogMDQgTWFyY2ggMjAyMCAxNToxMQo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRA
YW1hem9uLmNvLnVrPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsg
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgQW5kcmV3IENvb3Bl
cgo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY1IDEvMl0gZG9jcy9kZXNpZ25zOiBBZGQgYSBk
ZXNpZ24gZG9jdW1lbnQgZm9yIG5vbi1jb29wZXJhdGl2ZSBsaXZlCj4+IG1pZ3JhdGlvbgo+Pgo+
PiBIaSBQYXVsLAo+Pgo+PiBUaGUgcHJvcG9zYWwgbG9va3Mgc2Vuc2libGUgdG8gbWUuIFNvbWUg
TklUcGlja2luZyBiZWxvdy4KPj4KPj4gT24gMTMvMDIvMjAyMCAxMDo1MywgUGF1bCBEdXJyYW50
IHdyb3RlOgo+Pj4gSXQgaGFzIGJlY29tZSBhcHBhcmVudCB0byBzb21lIGxhcmdlIGNsb3VkIHBy
b3ZpZGVycyB0aGF0IHRoZSBjdXJyZW50Cj4+PiBtb2RlbCBvZiBjb29wZXJhdGl2ZSBtaWdyYXRp
b24gb2YgZ3Vlc3RzIHVuZGVyIFhlbiBpcyBub3QgdXNhYmxlIGFzIGl0Cj4+PiByZWxpZXMgb24g
c29mdHdhcmUgcnVubmluZyBpbnNpZGUgdGhlIGd1ZXN0LCB3aGljaCBpcyBsaWtlbHkgYmV5b25k
IHRoZQo+Pj4gcHJvdmlkZXIncyBjb250cm9sLgo+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEg
cHJvcG9zYWwgZm9yIG5vbi1jb29wZXJhdGl2ZSBsaXZlIG1pZ3JhdGlvbiwKPj4+IGRlc2lnbmVk
IG5vdCB0byByZWx5IG9uIGFueSBndWVzdC1zaWRlIHNvZnR3YXJlLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4+IC0tLQo+Pj4gQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiBDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4gQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPj4+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+Pj4gQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+PiBDYzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KPj4+Cj4+PiB2NToKPj4+ICAgIC0gTm90ZSB0aGF0IFBWIGRvbWFpbiBh
cmUgbm90IGp1c3QgZXhwZWN0ZWQgdG8gY28tb3BlcmF0ZSwgdGhleSBhcmUKPj4+ICAgICAgcmVx
dWlyZWQgdG8KPj4+Cj4+PiB2NDoKPj4+ICAgIC0gRml4IGlzc3VlcyByYWlzZWQgYnkgV2VpCj4+
Pgo+Pj4gdjI6Cj4+PiAgICAtIFVzZSB0aGUgdGVybSAnbm9uLWNvb3BlcmF0aXZlJyBpbnN0ZWFk
IG9mICd0cmFuc3BhcmVudCcKPj4+ICAgIC0gUmVwbGFjZSAndHJ1c3QgaW4nIHdpdGggJ3JlbGlh
bmNlIG9uJyB3aGVuIHJlZmVycmluZyB0byBndWVzdC1zaWRlCj4+PiAgICAgIHNvZnR3YXJlCj4+
PiAtLS0KPj4+ICAgIGRvY3MvZGVzaWducy9ub24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kIHwg
MjcyICsrKysrKysrKysrKysrKysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNzIgaW5z
ZXJ0aW9ucygrKQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvZGVzaWducy9ub24tY29v
cGVyYXRpdmUtbWlncmF0aW9uLm1kCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvZGVzaWducy9u
b24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kIGIvZG9jcy9kZXNpZ25zL25vbi1jb29wZXJhdGl2
ZS1taWdyYXRpb24ubWQKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAw
MDAwLi4wOWY3NGM4YzBkCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9kb2NzL2Rlc2lnbnMv
bm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZAo+Pj4gQEAgLTAsMCArMSwyNzIgQEAKPj4+ICsj
IE5vbi1Db29wZXJhdGl2ZSBNaWdyYXRpb24gb2YgR3Vlc3RzIG9uIFhlbgo+Pj4gKwo+Pj4gKyMj
IEJhY2tncm91bmQKPj4+ICsKPj4+ICtUaGUgbm9ybWFsIG1vZGVsIG9mIG1pZ3JhdGlvbiBpbiBY
ZW4gaXMgZHJpdmVuIGJ5IHRoZSBndWVzdCBiZWNhdXNlIGl0IHdhcwo+Pj4gK29yaWdpbmFsbHkg
aW1wbGVtZW50ZWQgZm9yIFBWIGd1ZXN0cywgd2hlcmUgdGhlIGd1ZXN0IG11c3QgYmUgYXdhcmUg
aXQgaXMKPj4+ICtydW5uaW5nIHVuZGVyIFhlbiBhbmQgaXMgaGVuY2UgZXhwZWN0ZWQgdG8gY28t
b3BlcmF0ZS4gVGhpcyBtb2RlbCBkYXRlcyBmcm9tCj4+PiArYW4gZXJhIHdoZW4gaXQgd2FzIGFz
c3VtZWQgdGhhdCB0aGUgaG9zdCBhZG1pbmlzdHJhdG9yIGhhZCBjb250cm9sIG9mIGF0IGxlYXN0
Cj4+PiArdGhlIHByaXZpbGVnZWQgc29mdHdhcmUgcnVubmluZyBpbiB0aGUgZ3Vlc3QgKGkuZS4g
dGhlIGd1ZXN0IGtlcm5lbCkgd2hpY2ggbWF5Cj4+PiArc3RpbGwgYmUgdHJ1ZSBpbiBhbiBlbnRl
cnByaXNlIGRlcGxveW1lbnQgYnV0IGlzIG5vdCBnZW5lcmFsbHkgdHJ1ZSBpbiBhIGNsb3VkCj4+
PiArZW52aXJvbm1lbnQuIFRoZSBhaW0gb2YgdGhpcyBkZXNpZ24gaXMgdG8gcHJvdmlkZSBhIG1v
ZGVsIHdoaWNoIGlzIHB1cmVseSBob3N0Cj4+PiArZHJpdmVuLCByZXF1aXJpbmcgbm8gY28tb3Bl
cmF0aW9uIGZyb20gdGhlIHNvZnR3YXJlIHJ1bm5pbmcgaW4gdGhlCj4+PiArZ3Vlc3QsIGFuZCBp
cyB0aHVzIHN1aXRhYmxlIGZvciBjbG91ZCBzY2VuYXJpb3MuCj4+PiArCj4+PiArUFYgZ3Vlc3Rz
IGFyZSBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMgcHJvamVjdCBiZWNhdXNlLCBhcyBpcyBvdXRsaW5l
ZCBhYm92ZSwgdGhleQo+Pj4gK2hhdmUgYSBzeW1iaW90aWMgcmVsYXRpb25zaGlwIHdpdGggdGhl
IGh5cGVydmlzb3IgYW5kIHRoZXJlZm9yZSBhIGNlcnRhaW4gbGV2ZWwKPj4+ICtvZiBjby1vcGVy
YXRpb24gaXMgcmVxdWlyZWQuCj4+PiArCj4+PiArSFZNIGd1ZXN0cyBjYW4gYWxyZWFkeSBiZSBt
aWdyYXRlZCBvbiBYZW4gd2l0aG91dCBndWVzdCBjby1vcGVyYXRpb24gYnV0IG9ubHkKPj4+ICtp
ZiB0aGV5IGRvbuKAmXQgaGF2ZSBQViBkcml2ZXJzIGluc3RhbGxlZFsxXSBvciBhcmUgaW4gcG93
ZXIgc3RhdGUgUzMuIFRoZQo+Pgo+PiBTMyBpcyB2ZXJ5IEFDUEkgY2VudHJpYywgc28gSSB3b3Vs
ZCBwcmVmZXIgaWYgd2UgYXZvaWQgdGhlIHRlcm0uIEkgdGhpbmsKPj4gdGhlIG5vbi1BQ1BJIGRl
c2NyaXB0aW9uIGlzICJzdXNwZW5kIHRvIFJBTSIuIEkgd291bGQgYmUgT0sgaXMgeW91Cj4+IG1l
bnRpb24gUzMgaW4gcGFyZW50aGVzaXMuCj4gCj4gSSdtIGFjdHVhbGx5IHB1bGxpbmcgdGhpcyBm
cm9tIHRoZSB3YXkgdGhlIGNvZGUgaXMgY3VycmVudGx5IHdyaXR0ZW4sIHdoaWNoIGlzIGNsZWFy
bHkgcXVpdGUgeDg2IHNwZWNpZmljOgo+IAo+IHhjX2h2bV9wYXJhbV9nZXQoQ1RYLT54Y2gsIGRv
bWlkLCBIVk1fUEFSQU1fQUNQSV9TX1NUQVRFLCAmaHZtX3Nfc3RhdGUpCj4gLgo+IC4KPiAuCj4g
aWYgKGRzcHMtPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNICYmICghaHZtX3B2ZHJ2IHx8
IGh2bV9zX3N0YXRlKSkgewo+ICAgICAgTE9HRChERUJVRywgZG9taWQsICJDYWxsaW5nIHhjX2Rv
bWFpbl9zaHV0ZG93biBvbiBIVk0gZG9tYWluIik7Cj4gICAgICByZXQgPSB4Y19kb21haW5fc2h1
dGRvd24oQ1RYLT54Y2gsIGRvbWlkLCBTSFVURE9XTl9zdXNwZW5kKTsKPiAgICAgIC4KPiAgICAg
IC4KPiB9Cj4gCj4gU28gYWN0dWFsbHkgSSBzaG91bGQgc2F5ICdub3QgaW4gcG93ZXIgc3RhdGUg
UzAnLgoKSSB1bmRlcnN0YW5kIHRoYXQgdGhlIGN1cnJlbnQgY29kZSBpcyB4ODYgc3BlY2lmaWMu
IEFybSB3b3VsZCBsaWtlbHkgCmhhdmUgYSBzaW1pbGFyIHJlcXVpcmVtZW50IGFsdGhvdWdoIG5v
dCBiYXNlZCBvbiBBQ1BJLgoKSG93ZXZlciwgbXkgcG9pbnQgaGVyZSBpcyBub3RoaW5nIGluIHRo
ZSBkb2N1bWVudCBzYXlzIGl0IGlzIGZvY3VzaW5nIG9uIAp4ODYgb25seS4gVGhlIGNvbmNlcHQg
aXRzZWxmIGlzIG5vdCBhcmNoIHNwZWNpZmljLCB0aGUgZG9jdW1lbnQgaXMgCm1vc3RseSB4ODYg
ZnJlZSBleGNlcHQgaW4gYSBjb3VwbGUgb2YgYml0cy4gU28gSSB3b3VsZCBsaWtlIHRoZW0gdG8g
YmUgCnJld3JpdHRlbiBpbiBhbiBhcmNoLWFnbm9zdGljIHdheS4KCk5vdGUgdGhhdCBJIGFtIG9r
IHdpdGggYXJjaC1zcGVjaWZpYyBleGFtcGxlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
