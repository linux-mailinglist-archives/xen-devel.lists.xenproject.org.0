Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2B10582D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:13:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpzV-0006yR-FG; Thu, 21 Nov 2019 17:11:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPri=ZN=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iXpzU-0006yL-4T
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:11:36 +0000
X-Inumbo-ID: f86f83fe-0c81-11ea-9631-bc764e2007e4
Received: from mail-io1-xd36.google.com (unknown [2607:f8b0:4864:20::d36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f86f83fe-0c81-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 17:11:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id k13so4279903ioa.9
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 09:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFZszdGssXIwAZwerYDMPC4lCF7vsotspsM8zjrMUiQ=;
 b=AEp6XqhsxI/+Dyh2rom9RvCxfD4R9xTP8dcIZc6vTXFnXW+GQSp2Cs8zUzCGaYoyzI
 LMYi5P1ZGceGTZBcz6qco9Ya1La5/BMWHVY8lLjeyoG/0axjAWfsc81biTwhu/JmqO/m
 +vWw3IHOdtiZooOXWq/PfDnHQZ2DRm2DeF140G4OA9DR8QGZobwhN/NYS3PsqxBA1Cyu
 GT6RWoZh0xhuKCfl3x+lrOGv8zKXhbKkd7hKoeo1aHGIB91BZx4UQDE5J1G+Nubf3Wd0
 /v6wh8v//VQDiByuwKCZ7lIykSv5kbSCBhUPEGwrkqcgy5mhPray3z4AFol+Rjd4D2zk
 3CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFZszdGssXIwAZwerYDMPC4lCF7vsotspsM8zjrMUiQ=;
 b=N6+bP6es7s3pgrmc2p0aPpDyV0jHOlOalfIAis24RDFy7Ydo66hO3vtdh9EDcpLoMf
 McaxlVN/hpwYV0sUtD9RMAKfvPaeC3qGSzAMu2V0uAwiP9ps97QHRuk8OFQZCjpTl6EO
 CDUz8RPWwictcn9W6KGoXp3vCCzittueivONbvTCVBqLPMAWw0duAYdk+YmN3cz9pN8S
 Y+w4mt/eOgjasXwT0J0OQQ+OhO+CtL84o01PwASwV12NoMz59UlGK7eUthvzmBU4kOPv
 PeFkEeXOwuYDQRtXK1XOaRLmC+X+8NLBI8OCeQsETdkhhRn3RmZcIwk5ZfCBHnmgN1fg
 K2KQ==
X-Gm-Message-State: APjAAAWDHVpGVpQolJPlwyAIM/SuMfDBeIPBLAk8tb4QtIhOEhLr+nic
 swFxY1hZzNMFj5fEqmhYaaPHSBqBH6LzftLaovk=
X-Google-Smtp-Source: APXvYqy1Xc7Af4dcjAYK8m099iGB2Bx3W0XfrLNwEwV02mYx1iDeQI+RsRvadO6yeZHIhP5lMv5H1BFyCeaN8JNjLWY=
X-Received: by 2002:a02:3208:: with SMTP id j8mr8697862jaa.86.1574356294192;
 Thu, 21 Nov 2019 09:11:34 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAK9nU=rP3nUCqS3o-3hMLrLPE1s8+W40W=4HWSkd06Fi+cqzeg@mail.gmail.com>
 <24022.39981.259598.394664@mariner.uk.xensource.com>
In-Reply-To: <24022.39981.259598.394664@mariner.uk.xensource.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Thu, 21 Nov 2019 19:11:22 +0200
Message-ID: <CACvf2oWT2jfY771B3-jWnSqU_gRuXC0qEN_boPWyVJ8CkLNhOw@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNDoxNiBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBXZWkgTGl1IHdyaXRlcyAoIlJlOiBTdGF0dXMgb2YgNC4x
MyIpOgo+ID4gRldJVyBJJ3ZlIHB1c2hlZCBhbGwgdGhlIHRvb2xzdGFjayBwYXRjaGVzIHRoYXQg
SSdtIGF3YXJlIG9mLgo+Cj4gVGhlIG9ubHkgdGhpbmcgb3V0c3RhbmRpbmcgdGhhdCBJIGFtIGF3
YXJlIG9mIGlzCj4gIFtQQVRDSCBmb3ItNC4xMyB2MSAxLzJdIGxpYnhsOiBpbnRyb2R1Y2UgbmV3
IGJhY2tlbmQgdHlwZSBWSU5QVVQKPiBvZiB3aGljaCBJIGFtIGF3YWl0aW5nIGEgcmVzcGluIGZy
b20gT2xla3NhbmRyIEdyeXRzb3YgKGluIHRoZSBUbykuCj4KPiBUaGVyZSBpcyBhIG5ldyBkZWZl
Y3QgaW4gdGhlIDQuMTMgQVBJLCB3aGVyZSBhIHBhcnRpY3VsYXIgZW51bSBoYXMgdGhlCj4gdmFs
dWUgYGxpbnV4JyBmb3IgYSBub24tTGludXgtc3BlY2lmaWMgcHJvdG9jb2wuICBJJ20gd2FudGlu
ZyB0bwo+IGNoYW5nZSBpdCBhbmQgSSB0aGluayB3ZSBoYXZlIGFncmVlZCBhIG5hbWUgY2hhbmdl
IHRvIGBwdicuICBPbGVrc2FuZHIKPiB3YXMgZ29pbmcgdG8gdGFrZSBjYXJlIG9mIHRoYXQgaW4g
aGlzIHJlc3BpbiBvZiB0aGF0IHNtYWxsIDItcGF0Y2gKPiBzZXJpZXMuCj4KPiBPbGVrc2FuZHIs
IHdoZW4gZG8geW91IHRoaW5rIHlvdSB3aWxsIGJlIGFibGUgdG8gZG8geW91ciByZXNwaW4gPwo+
IEkgYW0gbm90IHN1cmUgSSBrbm93IGV4YWN0bHkgd2hhdCB5b3Ugd2VyZSBwbGFubmluZyB0byBk
byBidXQgaWYgeW91Cj4gYXJlIG5vdCBhdmFpbGFibGUgSSBjb3VsZCBoYXZlIGEgZ28gYXQgaXQu
ICBQbGVhc2UgbGV0IG1lIGtub3cgQVNBUC4KPgo+IElhbi4KClRoZSBwYXRjaGVzIGlzIHJlYWR5
LCBJJ2xsIHN1Ym1pdCB0aGVtIHRvZGF5IHNvb24uCgoKLS0gCkJlc3QgUmVnYXJkcywKT2xla3Nh
bmRyIEdyeXRzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
