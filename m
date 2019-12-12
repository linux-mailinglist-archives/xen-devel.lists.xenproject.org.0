Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA411D26A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 17:35:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifRNj-0005bi-9e; Thu, 12 Dec 2019 16:32:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t7jg=2C=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ifRNh-0005bd-Es
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 16:32:01 +0000
X-Inumbo-ID: ebb6eb44-1cfc-11ea-b6f1-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb6eb44-1cfc-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 16:32:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l18so2192188lfc.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 08:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMtrFaOx5zO3RN/AAutoljB+onBiD3BJRHs5f2zZfww=;
 b=RX0b/2HpsKZ7maRpMri6BR1fLBSsr8jB3blJdj2v9ZtRJDZm/64TPjzD6jAcDoqxCD
 axOyXYFX28C6WELe7LwQkjK1jRxAP4eUWzcIEXMaurpHhAXRyLxKr80Yx0M8gYEik0Rp
 OWV+5nba5PaFRT9LXejGtKdUeavvOE7T+bnLLxG9X4yvLNcfOUannt6ffP38z5NUfeFW
 KU2pvyxU1dNdhfFvsSpDPyeJvakGaSk0K1XirMHIyAnhOLdqeYDPR5b0KmJyvWI9CFFE
 BzYmx598f/124HZuezJ61isYRjRLsgxv/K+n+VIC4K6gMRDu8QkhCsqONjnMkM9JWMnY
 S2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMtrFaOx5zO3RN/AAutoljB+onBiD3BJRHs5f2zZfww=;
 b=NFJ0bw7JydmO+9Y/FO4kFXPs1YmhDnsbVFztawdgLZ2bNvqwbiZtSLbgk5HXhkPZSL
 TElkoao+NVS7q5GTDNBWH3PxygLAxY1rHBzAJglL1D6osmU/o0SulsqrVuQCJUX+Ek16
 ehuXvvDlx6lJw2eh/9Si8u/CJlsdpsNT1/FH933A/0OqwZtApiwnsQEPSiKVa9MUh9zb
 oZuraLUF1Eg/lQxgSAbzRmoqBuHz+TBgCwUDn0GFHykl31qECRDjmX9iQ9wudPwpUi8A
 DkqAL7uF6V5l3OugBgjV4s2vCHjWx0qwNbCBzRGKk2Cv2H2NdyZZ2ugqyW1voikSTqSV
 Fbsg==
X-Gm-Message-State: APjAAAXVF0WQ+FBbjcHBFJxw/4t0ll4lMM9UrXFuzYGgHP348shV8lXR
 SNZlluJaSjc+KHCUhfk1QyBeev+uQuoQCUn1ANk=
X-Google-Smtp-Source: APXvYqzbEtYK5Q5oEXt2n7X+G+gbVpXS1yFhxc9zA94lLDEQFKWdm/8jhDBvCKej+JQx8nnccF+Nd/csIpO6l6eqoOU=
X-Received: by 2002:ac2:555c:: with SMTP id l28mr6129545lfk.52.1576168319470; 
 Thu, 12 Dec 2019 08:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20191212135406.26229-1-pdurrant@amazon.com>
In-Reply-To: <20191212135406.26229-1-pdurrant@amazon.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 12 Dec 2019 11:31:48 -0500
Message-ID: <CAKf6xptNRAuvjqzqFwbPmetYsTdPOMgTT0AWEouwjsHq1iCV6w@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 open list <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgODo1NiBBTSBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+IHdyb3RlOgo+Cj4gSW4gdGhlIHBhc3QgaXQgdXNlZCB0byBiZSB0aGUgY2FzZSB0
aGF0IHRoZSBYZW4gdG9vbHN0YWNrIHJlbGllZCB1cG9uCj4gdWRldiB0byBleGVjdXRlIGJhY2tl
bmQgaG90cGx1ZyBzY3JpcHRzLiBIb3dldmVyIHRoaXMgaGFzIG5vdCBiZWVuIHRoZQo+IGNhc2Ug
Zm9yIG1hbnkgcmVsZWFzZXMgbm93IGFuZCByZW1vdmFsIG9mIHRoZSBhc3NvY2lhdGVkIGNvZGUg
aW4KPiB4ZW4tbmV0YmFjayBzaG9ydGVucyB0aGUgc291cmNlIGJ5IG1vcmUgdGhhbiAxMDAgbGlu
ZXMsIGFuZCByZW1vdmVzIG11Y2gKPiBjb21wbGV4aXR5IGluIHRoZSBpbnRlcmFjdGlvbiB3aXRo
IHRoZSB4ZW5zdG9yZSBiYWNrZW5kIHN0YXRlLgo+Cj4gTk9URTogeGVuLW5ldGJhY2sgaXMgdGhl
IG9ubHkgeGVuYnVzIGRyaXZlciB0byBoYXZlIGEgZnVuY3Rpb25hbCB1ZXZlbnQoKQo+ICAgICAg
IG1ldGhvZC4gVGhlIG9ubHkgb3RoZXIgZHJpdmVyIHRvIGhhdmUgYSBtZXRob2QgYXQgYWxsIGlz
Cj4gICAgICAgcHZjYWxscy1iYWNrLCBhbmQgY3VycmVudGx5IHB2Y2FsbHNfYmFja191ZXZlbnQo
KSBzaW1wbHkgcmV0dXJucyAwLgo+ICAgICAgIEhlbmNlIHRoaXMgcGF0Y2ggYWxzbyBmYWNpbGl0
YXRlcyBmdXJ0aGVyIGNsZWFudXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4gLS0tCj4gQ2M6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9y
Zz4KPiBDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gLS0tCj4g
IGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oIHwgIDExIC0tLQo+ICBkcml2ZXJzL25l
dC94ZW4tbmV0YmFjay94ZW5idXMuYyB8IDEyNSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oIGIvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgKPiBpbmRleCAwNTg0N2ViOTFhMWIuLmU0OGRh
MDA0YzFhMyAxMDA2NDQKCjxzbmlwPgoKPiAtc3RhdGljIGlubGluZSB2b2lkIGJhY2tlbmRfc3dp
dGNoX3N0YXRlKHN0cnVjdCBiYWNrZW5kX2luZm8gKmJlLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZSkKPiAtewo+IC0gICAg
ICAgc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiA9IGJlLT5kZXY7Cj4gLQo+IC0gICAgICAgcHJf
ZGVidWcoIiVzIC0+ICVzXG4iLCBkZXYtPm5vZGVuYW1lLCB4ZW5idXNfc3Ryc3RhdGUoc3RhdGUp
KTsKPiAtICAgICAgIGJlLT5zdGF0ZSA9IHN0YXRlOwo+IC0KPiAtICAgICAgIC8qIElmIHdlIGFy
ZSB3YWl0aW5nIGZvciBhIGhvdHBsdWcgc2NyaXB0IHRoZW4gZGVmZXIgdGhlCj4gLSAgICAgICAg
KiBhY3R1YWwgeGVuYnVzIHN0YXRlIGNoYW5nZS4KPiAtICAgICAgICAqLwo+IC0gICAgICAgaWYg
KCFiZS0+aGF2ZV9ob3RwbHVnX3N0YXR1c193YXRjaCkKPiAtICAgICAgICAgICAgICAgeGVuYnVz
X3N3aXRjaF9zdGF0ZShkZXYsIHN0YXRlKTsKCmhhdmVfaG90cGx1Z19zdGF0dXNfd2F0Y2ggcHJl
dmVudHMgeGVuLW5ldGJhY2sgZnJvbSBzd2l0Y2hpbmcgdG8KY29ubmVjdGVkIHN0YXRlIHVubGVz
cyB0aGUgdGhlIGJhY2tlbmQgc2NyaXB0cyBoYXZlIHdyaXR0ZW4KImhvdHBsdWctc3RhdHVzIiAi
c3VjY2VzcyIuICBJIGhhZCBhbHdheXMgdGhvdWdodCB0aGF0IHdhcyBpbnRlbnRpb25hbApzbyB0
aGUgZnJvbnRlbmQgZG9lc24ndCBjb25uZWN0IHdoZW4gdGhlIGJhY2tlbmQgaXMgdW5jb25uZWN0
ZWQuICBpLmUuCmlmIHRoZSBiYWNrZW5kIHNjcmlwdHMgZmFpbHMsIGl0IHdyaXRlcyAiaG90cGx1
Zy1zdGF0dXMiICJlcnJvciIgYW5kCnRoZSBmcm9udGVuZCBkb2Vzbid0IGNvbm5lY3QuCgpUaGF0
IGJlaGF2aW9yIGlzIGluZGVwZW5kZW50IG9mIHVzaW5nIHVkZXYgdG8gcnVuIHRoZSBzY3JpcHRz
LiAgSSdtCm5vdCBvcHBvc2VkIHRvIHJlbW92aW5nIGl0LCBidXQgSSB0aGluayBpdCBhdCBsZWFz
dCB3YXJyYW50cwptZW50aW9uaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZS4KClJlZ2FyZHMsCkph
c29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
