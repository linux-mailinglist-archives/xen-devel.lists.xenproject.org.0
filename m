Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18198116B4A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:42:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGRc-0001OY-L0; Mon, 09 Dec 2019 10:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZA+F=Z7=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ieGRb-0001OT-8D
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:39:11 +0000
X-Inumbo-ID: 2233e030-1a70-11ea-b6f1-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2233e030-1a70-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 10:39:10 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m8so12195767edi.13
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=38xnikVo53SmoMYxRpQfC6QuTSiJ2pTazQeMd8AIzXg=;
 b=CqiIsfIN1nK451Ja3LN1wyBmB+p2gyS2axIVz92necdFGghtlYG1SBW3r00/56mfnI
 ttyFdC9KxgQiSuejXRzEia/Sqmjwn03UoE2PRo9eX5Dp4Dyam3XNfpwsTj8QiGIAuInl
 f0lko84OzZCy3XtNXjX+BaIxV/RDfo6oSe/bGjmrzIlmzgRXmmpH0obkHGnbGYe7y+9U
 cVCQ8bwMofxJe+fCRInd6/SQmyQqXz7abThkysguW4f/c4E3BUejXny0jjOKPcGpTsRb
 RIhXGXV0HpnoFa0DoLPnZT2HIjBjb+6XnqYn0+7J2wFsCutx7WNTJKt7qZl4LxP11qq5
 jSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=38xnikVo53SmoMYxRpQfC6QuTSiJ2pTazQeMd8AIzXg=;
 b=os1vBr3gNQm7/YAKHTsVxwnaP00sSs9niIiI53A01vy0s/D9cqDV9nQq7vdm3VYQCa
 sGRBQWdj323bZeCgppDLMI0jyBCiTnLAi9XGn33qH17jtPsCiusfPbMhcCZCIe7Ab7fK
 jKPsKWhA/p1VkYfkow/4kjhVNmq09LwJ4wQ3Ep55eQL/+eXSeyTQsFBzOAcRlBL0/VU/
 IAkPZhXkt1c8WtSkJGlERe4XfWmBvfqlMHy5Zea8y3IyAtR2nNGPGXF9pGxqI+uvd+CX
 68A66MsLTfWbgJEmwBIghzvJucqE82jkVVyP17iXi+pwfHbN9BPZUXqe9pun6O9UAQUF
 qnbA==
X-Gm-Message-State: APjAAAXhvlLOkWcXkkqMZ4TyPLM7u3OPfhRhxALyJx1m8mln3JBVeoAD
 PDxri4dXFESGmYZn029uVMDKGIqBqH9cTH63VvY=
X-Google-Smtp-Source: APXvYqzu9RFtngnaMjSSFLTH1Tx8X+PT7cwrG6fD86DQEFA1RKMlesaDegkwCOMJ5eE6eCQKmvFeVKNYTStgAx8kC08=
X-Received: by 2002:aa7:c714:: with SMTP id i20mr31440434edq.110.1575887949729; 
 Mon, 09 Dec 2019 02:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-2-andrew.cooper3@citrix.com>
In-Reply-To: <20191207211634.9958-2-andrew.cooper3@citrix.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 9 Dec 2019 10:38:58 +0000
Message-ID: <CAFLBxZZZcrsaZ3EnT8s-_nvN2SwWV3XYq8jCBKsmWKkRpzOw8A@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py
 script
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBEZWMgNywgMjAxOSBhdCA5OjE3IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIHNjcmlwdCBpcyBQeXRob24gMiBzcGVjaWZp
YywgYW5kIGZhaWxzIHdpdGggc3RyaW5nL2JpbmFyeSBpc3N1ZXMgd2l0aAo+IFB5dGhvbiAzOgo+
Cj4gICBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICAgIEZpbGUgImdlbi1w
b2xpY3kucHkiLCBsaW5lIDE0LCBpbiA8bW9kdWxlPgo+ICAgICAgIGZvciBjaGFyIGluIHN5cy5z
dGRpbi5yZWFkKCk6Cj4gICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuNS9jb2RlY3MucHkiLCBs
aW5lIDMyMSwgaW4gZGVjb2RlCj4gICAgICAgKHJlc3VsdCwgY29uc3VtZWQpID0gc2VsZi5fYnVm
ZmVyX2RlY29kZShkYXRhLCBzZWxmLmVycm9ycywgZmluYWwpCj4gICBVbmljb2RlRGVjb2RlRXJy
b3I6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg4YyBpbiBwb3NpdGlvbiAwOiBp
bnZhbGlkIHN0YXJ0IGJ5dGUKPgo+IEZpeGluZyB0aGUgc2NyaXB0IHRvIGJlIGNvbXBhdGlibGUg
aXNuJ3QgaGFyZCwgYnV0IHVzaW5nIHB5dGhvbiBoZXJlIGlzCj4gd2FzdGVmdWwuICBEcm9wIHRo
ZSBzY3JpcHQgZW50aXJlbHksIGFuZCB3cml0ZSBhIHNob3J0IGZsYXNrLXBvbGljeS5TIGluc3Rl
YWQuCgpJdCBtaWdodCBiZSBoZWxwZnVsIGZvciBjYXN1YWwgcmV2aWV3ZXJzIHRvIGhhdmUgYSBz
bGlnaHRseSBiZXR0ZXIKZXhwbGFuYXRpb24gb2Ygd2hhdCB0aGUgY2hhbmdlIGlzOyBuYW1lbHk6
CgotIFRoZSBlbmQgZ29hbCBpcyB0byBoYXZlIGEgLm8gZmlsZSBleHBvcnRpbmcgb25lIHZhcmlh
YmxlIGNvbnRhaW5pbmcKdGhlIGNvbnRlbnRzIG9mIHBvbGljeS5iaW4sIGFuZCBhbm90aGVyIGNv
bnRhaW5pbmcgaXRzIHNpemUuCgotIGdlbi1wb2xpY3kucHkgZ2VuZXJhdGVzIGEgQyBmaWxlIHdo
aWNoIGNvbnRhaW5zIHRoZSBieXRlcyBvZgpwb2xpY3kuYmluIChhbmQgaXRzIHNpemUpLiAgVGhp
cyBtZWFucyBydW5uaW5nIHB5dGhvbiwgYW5kIHRoZW4gYSBjCmNvbXBpbGVyLgoKLSBUaGUgcmVw
bGFjZW1lbnQgdXNlIGEgLlMgZmlsZSB0byAiaW5jbHVkZSIgdGhlIGJpbmFyeSBkaXJlY3RseS4K
VGhpcyBpbnZvbHZlcyBvbmx5IHJ1bm5pbmcgYW4gYXNzZW1ibGVyLCBidXQgaGFzIHRoZSBzYW1l
IGVuZCBlZmZlY3QuCgpUaGlzIGxvb2tzIGxpa2UgYSBnb29kIGNoYW5nZTsgYnV0IEkgZG9uJ3Qg
a25vdyBhc3NlbWJsZXIgd2VsbCBlbm91Z2gKdG8gZ2l2ZSBpdCBhbiBSLWIuCgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
